# Chapitre 12 : Étude de cas (POPCNT)

## 12.1 Introduction

Compter le nombre de bits à 1 dans un registre est une opération que l'on
rencontre dans de nombreux traitements. Par exemple, imaginons que l'on dispose
d'un tableau de booléens qui indique si un élément d'un tableau d'enregistrements
doit être traité ou non. La question se posera probablement de savoir combien
d'enregistrements doivent être traités afin d'allouer l'espace juste nécessaire avant
de manipuler les données. Si on utilise un tableau de booléens, on aura la définition
de données suivante :

```c
#include <stdbool.h>
typedef unsigned int u32;
typedef unsigned char u8;

// nombre d'enregistrements
const u32 MAX_RECORDS = 100000;

// Enregistrement
typedef struct {
    // ...
} Record;

// tableau d'enregistrements
Record tab_records[MAX_RECORDS];

// tableau qui indique les enregistrements à traiter
bool tab_process[MAX_RECORDS];
```

La variable `tab_records` est un tableau d'enregistrements et `tab_process` un
tableau de booléens. Si la variable `tab_process[i]` est à `true` cela signifie que
l'enregistrement correspondant devra être pris en compte dans un traitement
ultérieur.

On pourra donc définir plusieurs méthodes liées au traitement du tableau
`tab_process` :
- `void set(u32 n)` : qui met à jour le tableau `tab_process` afin d'indiquer que
  l'enregistrement `n` doit être traité
- `void unset(u32 n)` : qui met à jour le tableau `tab_process` afin d'indiquer que
  l'enregistrement `n` ne doit pas être traité
- `bool use(u32 n)` : qui retourne `true` si on doit traiter l'enregistrement `n`
- `u32 count()` : qui retourne le nombre d'enregistrements qui doivent être traités

```c
void set(u32 n) {
    tab_process[n] = true;
}

void unset(u32 n) {
    tab_process[n] = false;
}

bool use(u32 n) {
    return tab_process[n];
}

u32 count() {
    u32 total = 0;
    for (u32 i = 0; i < MAX_RECORDS; i++) {
        total += (u32)tab_process[i];
    }
    return total;
}
```

La variable `tab_process` étant un tableau de booléens, elle occupe en mé-
moire 100 000 octets (car un booléen possède une taille d'un octet en C standard). On utilise
donc 100 000 / 1024 ≃ 98 ko. Cependant sur ces 100 000 octets, seuls 100 000 bits
sont vraiment utiles car la constante `true` est en fait égale à 1 et `false` vaut 0. En
d'autres termes, 7 bits sur 8, soit 87,5% sont inutiles car non utilisés, seul le bit de
poids faible code pour `true` ou `false`.

Il est donc plus intéressant de ne pas perdre de mémoire et de coder chaque
valeur booléenne non pas par un octet mais par un bit. On parle alors de **com-
pactage des données**. Dans ce cas le tableau `tab_process` que nous renommons
alors `tab_process_bits` aura une taille de `(100 000 + 7)/8 ≃ 12 500 ≃ 12,2 ko`.
L'expression `100 000 + 7` permet d'arrondir la taille à l'octet supérieur.

```c
u32 MAX_RECORDS_IN_BYTES = (MAX_RECORDS + 7) / 8;
u8 tab_process_bits[MAX_RECORDS_IN_BYTES];
```

Les méthodes que nous avons définies précédemment doivent être réécrites afin
de prendre en compte les spécificités du nouveau tableau `tab_process_bits` :

```c
void set(u32 n) {
    tab_process_bits[n/8] |= (1 << (n%8));
}

void unset(u32 n) {
    tab_process_bits[n/8] &= ~(1 << (n%8));
}

bool use(u32 n) {
    return (tab_process_bits[n/8] & (1 << (n%8))) != 0;
}

u32 count() {
    u32 total = 0;
    for (u32 i = 0; i < MAX_RECORDS_IN_BYTES; i++) {
        total += pop_count_8(tab_process_bits[i]);
    }
    return total;
}
```

Par exemple pour la méthode `set`, l'élément `n` se trouve à l'indice `n / 8` du
tableau `tab_process_bits` et occupe le bit à la position `n % 8`. La traduction de ce
sous-programme en assembleur x86 32 bits est la suivante :

```nasm
set:
    push ebp
    mov ebp, esp
    mov edx, [ebp+8]         ; edx = n
    mov ecx, edx             ; ecx = n
    shr edx, 3               ; edx = n / 8
    and ecx, 7               ; ecx = n % 8
    mov eax, 1               ; eax = 1
    shl eax, cl              ; eax = 1 << (n % 8)
    or [tab_process_bits + edx], al
    mov esp, ebp
    pop ebp
    ret
```

La fonction `count` doit être réécrite en utilisant la fonction `pop_count_8` qui
compte le nombre de bits à 1 dans un octet. Une version simple de cette fonction
qui nous servira de fonction de référence, est par exemple :

```c
u32 pop_count_8(u8 n) {
    u32 count_bits = 0;
    while (n) {
        if ((n & 1) != 0) count_bits++;
        n = n >> 1;
    }
    return count_bits;
}
```

L'efficacité de la fonction est biaisée par le `if` qui n'est pas prédictible. On peut
cependant l'éliminer en écrivant la fonction comme suit :

```c
u32 pop_count_8_noif(u8 n) {
    u32 count_bits = 0;
    while (n) {
        count_bits += (n & 1);
        n = n >> 1;
    }
    return count_bits;
}
```

> **Version de référence, élimination du if**
> La version de référence améliorée en supprimant le `if` s'exécute en 48,78
> secondes contre 54,96 s ce qui constitue une faible mais notable amélioration.

## 12.2 Améliorations de pop_count

Malheureusement la fonction de référence n'est pas très efficace et on peut
l'améliorer en utilisant trois techniques :
- en utilisant une table de conversion,
- en comptant les bits par paires, quartets, octets,
- en utilisant l'instruction assembleur `popcnt`.

### 12.2.1 Table de conversion

On peut utiliser une table de 256 octets, chaque octet contenant le nombre de
bits de la valeur correspondant à l'indice du tableau. Ainsi, la valeur pour l'indice
du tableau égal à 189 est 6 car `189 = 1011_1101` (binaire), soit 6 bits à 1 :

```c
u8 bits_table[256] = {0, 1, 1, 2, 1, 2, 2, 3, /* ... jusqu'à 255 */};

u32 pop_count_8(u8 n) {
    return bits_table[n];
}
```

> **Amélioration table de conversion**
> En utilisant une table de conversion, on
> ne met plus que 2,76 secondes, on va donc environ 20 fois plus vite. (à condition qu'elle tienne en L1).

### 12.2.2 Comptage arithmétique (Population Count sans l'instruction)

On désire redéfinir une fonction `pop_count_8` mathématiquement. La première étape consiste à compter le nombre de bits à 1 dans une paire de bits. On a quatre cas possibles :
- `11` : 2 bits
- `10` : 1 bit
- `01` : 1 bit
- `00` : 0 bit

Pour cela on utilise des masques :

```c
b0 = (a & 0x55);
b1 = (a >> 1) & 0x55;
c  = b0 + b1;
```

En fait la valeur `55` hexa représente un masque de sélection : `01010101` binaire.
On réitère ensuite le processus pour s'intéresser aux quartets, octets puis aux
mots. Le masque évolue comme présenté Table 12.1.

| Unité | Décalage | Masque Binaire | Masque Hexa |
|---|---|---|---|
| paire | 1 | `0101_0101_0101_0101` | `0x5555` |
| quartet | 2 | `0011_0011_0011_0011` | `0x3333` |
| octet | 4 | `0000_1111_0000_1111` | `0x0F0F` |
| mot | 8 | `0000_0000_1111_1111` | `0x00FF` |

*TABLE 12.1 – Masques en fonction du nombre de bits*

Le code complet est alors :

```c
const u32 m1 = 0x55555555;
const u32 m2 = 0x33333333;
const u32 m4 = 0x0f0f0f0f;

u32 popcnt_shift(u8 x) {
    x = (x & m1) + ((x >> 1) & m1);
    x = (x & m2) + ((x >> 2) & m2);
    x = (x & m4) + ((x >> 4) & m4);
    return x;
}
```

> **Amélioration en comptant les bits par paires, quartets, etc**
> En utilisant des décalages et additions, le temps d'exécution est de 2,83
> secondes, on va donc environ 19 fois plus vite.

Il existe une ruse (*version 2*) qui permet de gagner une instruction en remplaçant la première ligne par : `x = x - ((x >> 1) & m1);`.

```nasm
; x = x - ((x >> 1) & m1);
mov eax, [x]
mov edx, eax
shr edx, 1
and edx, 1431655765    ; 0x55555555
sub eax, edx
```

### 12.2.3 L'instruction `popcnt`

L'instruction `popcnt` a été introduite en 2008 avec les processeurs Intel Nehalem et le jeu
d'instruction SSE4.2.
Elle prend la forme : `popcnt r(16/32/64), r/m(16,32,64)`

En l'insérant (souvent via un *intrinsic* C ou dans le bloc assembleur), le processeur gère tout en matériel.
En utilisant l'instruction `popcnt` combinée au dépliage de boucle, le temps
d'exécution est de 3,09 secondes sur un 8 bits. Cela n'est pas le plus efficace avant de passer au traitement étendu.

## 12.3 Traitement par 32 bits (Dépliage par 4 natif)

Plutôt que de traiter le tableau octet par octet, on peut le
traiter en considérant qu'il s'agit d'un tableau d'entiers non signés de 32 bits.

```c
u32 popcnt_table_opt(u8* x, u32 size) {
    u32 count = 0, i;
    u32* y = (u32*)x;

    for (i = 0; i < (size & ~3); i += 4) {
        count += popcnt_table_u32(*y++);
    }
    // ... reliquat
}
```

```c
// Version inefficace de popcnt sur 32 bits par table
u32 popcnt_table_32_loop(u32 x) {
    u32 total = 0;
    do {
        total += popcnt_table[x & 0xFF];
    } while ((x >>= 8) != 0);
    return total;
}

// Version efficace (Dépliée) de popcnt sur 32 bits par table
u32 popcnt_table_32_unroll(u32 x) {
    u32 total = popcnt_table[x & 0xFF];
    x >>= 8;
    total += popcnt_table[x & 0xFF];
    x >>= 8;
    total += popcnt_table[x & 0xFF];
    x >>= 8;
    total += popcnt_table[x & 0xFF];
    return total;
}
```

**Amélioration traitement global par 32 bits** (avec tableau de 262_207 octets) :
- référence : `36.07 s`
- référence sans `if` : `23.34 s`
- table (boucle) : `4.69 s`
- table (dépliée 32 bit) : `2.25 s`
- native `popcnt` 32 bits : `0.62 s`
- `popcnt` matérielle dépliée x 4 : **0.47 s**

On note que la version qui utilise l'instruction assembleur `popcnt` prend le dessus quand on la nourrit en blocs de 32 bits : on passe de 3,09s avec un traitement par 8 bits à **0,62s en traitant 32 bits**.

## 12.4 Vectorisation SIMD

La vectorisation avec SSE permet de traiter les données par groupe de 16 octets.
Malheureusement, il n'existe pas d'instruction vectorielle qui s'applique sur un
registre SSE et qui réalise le décompte des bits de manière native. La seule solution qui s'offre à nous, a priori, est de charger les données par groupe de 16 octets puis d'extraire chaque
double mot, et enfin d'en compter le nombre de bits avec un classique scalaire `popcnt`.

```nasm
for_u16:
    movdqa xmm0, [esi+ecx]
    pshufd xmm1, xmm0, 0x01      ; extrait le 2nd mot dans xmm1
    pshufd xmm2, xmm0, 0x02      ; extrait le 3ième mot dans xmm2
    pshufd xmm3, xmm0, 0x03      ; extrait le 4ième mot dans xmm3

    movd edi, xmm0               ; compte les bits dans eax/edi/ebx...
    popcnt edi, edi 
    add eax, edi
    ; etc...
```

La seconde version consiste à utiliser la mathématique évoquée Section 12.2.2 en appliquant massivement les bit-shifts (`vpsrlw`) sur les registres XMM et en masquant (`vpand`) avec `0x5555`, `0x3333`, `0x0F0F` chargés respectivement dans `xmm4` à `xmm7`. 

On accumulera avec `vpsadbw` (*Compute Sum of Absolute Differences*) qui ramènera les sommes consolidées de tout le registre vectoriel.

## 12.5 Benchmark

Nous avons testé 30_000 appels sur le même vecteur de 262_207 octets.
L'étude est poussée sur 15 implémentations (référence C, optimisation manuelle, Shift arithmétique, POPCNT ASM natif, vectorisation SSE, et Intrinsics compilateur).

[BENCHMARK:asm_popcnt_64]

## 12.6 Benchmark Compactage 32 bits

Le compactage de données booléennes (stocker `true`/`false` dans des bits plutôt que des octets) permet de réduire l'empreinte mémoire de 87,5%. Les tests suivants comparent les performances des différentes implémentations de compactage sur architecture 32 bits.

[BENCHMARK:asm_cmpack32]

## 12.7 Bilan

Ce problème révèle deux choses importantes. La première est que le traitement
des données par groupe de 32 bits (voire de 64 bits) au lieu de 8 bits permet de
gagner en efficacité : cela semble normal puisqu'on traite les données en une seule
fois plutôt qu'en 4 fois (ou 8 fois).

La seconde leçon que l'on peut tirer montre que la vectorisation pure (AVX native) va se révéler complexe car on ne dispose historiquement pas d'instruction vectorielle qui réaliserait ce que fait l'instruction `popcnt` scalaire sur les registres généraux. 
Cependant, faire le décompte avec des masques (décalages magiques `0x5555`) mis à l'échelle SSE ou utiliser les *intrinsics* optimisés par GCC (`pop_count_8_intrinsics` traduit en unroll `vpopcnt` sur les architecture très récentes comme Zen 4 / Granite Ridge) donne la victoire finale sur un algorithme simple de prime abord.
