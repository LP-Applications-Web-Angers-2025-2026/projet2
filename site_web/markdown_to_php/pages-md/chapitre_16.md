# Chapitre 16 : Étude de cas (Suite de Fibonacci)

## 16.1 Introduction

Ce chapitre traite de l'implantation de fonctions qui permettent de calculer
les termes de la suite de Fibonacci. Léonardo Fibonacci était un mathématicien
italien (1175 - 1250) qui a contribué notamment à démocratiser la numérotation
indo-arabe. Il semblerait que la suite ait été découverte par des mathématiciens
indiens (Gopala 1133, Hemachandra 1150, Fibonacci 1202) et qu'elle fut ensuite
attribuée à Fibonacci dans le monde occidental. La suite qui prend donc son nom
est une suite d'entiers naturels construite en calculant la somme des deux termes
précédents et est définie de manière récursive comme suit :
- $F_0 = 0$
- $F_1 = 1$
- $F_n = F_{n-1} + F_{n-2}$

Les premiers termes de la suite sont donc : 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89,
144, 233, 377, 610, 987, 1597, 2584, 4181.

La suite de Fibonacci possède de nombreuses propriétés mathématiques singu-
lières ainsi que des ramifications dans le domaine du vivant (choux romanesco,
pomme de pin), ou de la dynamique des populations. La suite de Fibonacci est éga-
lement liée au nombre d'or $\phi$ qui s'exprime par $(1 + \sqrt{5})/2 \simeq 1,618033$. Le nombre
d'or est qualifié de *divine proportion* car nombre de choses dans la nature sont liées
à cette valeur. A mesure que l'on calcule les termes de la suite de Fibonacci, le ratio
$F_{n+1}/F_n$ tend vers $\phi$.

### 16.1.1 Modèle Diachronique

On considère des couples de lapins qui sont à maturité sexuelle, que l'on notera
`S`, et qui peuvent se reproduire pour générer un nouveau couple de lapins qui, lui,
n'est pas à maturité sexuelle et que l'on notera `N`. Les couples qui ne sont pas à
maturité sexuelle doivent attendre avant de parvenir à maturité et pourront alors
se reproduire. L'évolution d'une population est donc la suivante :
- au temps $t = 0$, il n'y a aucun couple
- au temps $t = 1$, on a un couple qui n'est pas à maturité sexuelle
- au temps $t = 2$, on a un couple parvenu à maturité sexuelle
- au temps $t = 3$, on a deux couples : un couple à maturité sexuelle, un couple
  issu de la reproduction du couple à maturité et qui n'est donc pas à maturité sexuelle
- au temps $t = 4$, on a trois couples : deux couples à maturité sexuelle et un
  couple non mature
- etc.

On a reproduit l'évolution de la population *Table 16.1*.

| Temps | Couples | Nbr. Couples |
|---|---|---|
| $t = 0$ | $\emptyset$ | 0 |
| $t = 1$ | `N` | 1 |
| $t = 2$ | `S` | 1 |
| $t = 3$ | `SN` | 2 |
| $t = 4$ | `SNS` | 3 |
| $t = 5$ | `SNSSN` | 5 |
| $t = 6$ | `SNSSNSNS` | 8 |

*TABLE 16.1 – Evolution d'une population de lapins selon Fibonacci*

Du point de vue de l'informatique, on peut voir cette évolution comme un
système de réécriture :
- `N` $\rightarrow$ `S`
- `S` $\rightarrow$ `SN`

Du point de vue de la biologie, la suite de Fibonacci est en rapport avec la
phyllotaxie des plantes, c'est à dire, l'organisation en spirale des organes autour
d'une tige. On remarque que pour un nombre important de plantes, estimé à 90%,
le nombre d'organes dans une spirale suit très souvent une progression proche
des rapports de la séquence de Fibonacci. Il en résulte que ces organes émergent
souvent à des angles de 137,5 degrés ce qui permet à chaque organe de recevoir
une quantité optimale de lumière du soleil en évitant les chevauchements ce qui
conduit à favoriser la photosynthèse.

Nous n'entrerons pas dans de plus amples considérations puisque ce qui nous
intéresse est l'implantation de cette fonction sous une forme particulière. Pour
terminer, nous dirons que la suite de Fibonacci fait partie de l'encyclopédie en ligne
des suites de nombres entiers OEIS (*On-Line Encyclopedia of Integer Sequences*).
Elle est présente sous l'identifiant *A000045*. En informatique, la suite de Fibonacci
possède des applications liées à la génération des nombres aléatoires, aux arbres
AVL (qui sont des arbres de recherche dits automatiquement équilibrés) ou aux
structures de données du même nom (*Fibonacci Heap*).

## 16.2 Variantes C/C++

Le code de la fonction de Fibonacci récursive est donné *Listing 16.2.1*.

```c
u32 fib_rec(u32 n) {
    if (n <= 1) {
        return n;
    } else {
        return fib_rec(n-1) + fib_rec(n-2);
    }
}
```
> *Listing 16.2.1 – Fibonacci - fonction récursive*

Si on réalise quelques tests de performance, on s'aperçoit rapidement que le
nombre d'appels récursifs devient prohibitif (voir *Table 16.2*, ci-après) et la fonction
devient de moins en moins efficace. Par exemple sur un AMD Ryzen 5 5600g dont
la fréquence de fonctionnement en mode boost est de 4440 MHz, $F_{44}$, $F_{45}$ et $F_{46}$
s'exécutent respectivement en 1.685, 2.559 et 4.365 secondes.
Comme on peut s'en rendre compte, le nombre d'appels récursifs est proportionnel à $\phi$, le nombre d'or. Il tend vers $1,447214 \times \phi^n$ à
mesure que n tend vers $\infty$. Notons que $1,447214 \simeq 1 + 1 / \sqrt{5}$.

Il existe cependant une autre implantation récursive mais qui se base sur les
propriétés suivantes. Elle permet de casser la complexité initiale du problème. Le
code correspondant est donné *Listing 16.2.2* :
- Si $n$ est pair, $k = n/2$, $F_n = (2 \times F_{k-1} + F_k) \times F_k$
- Si $n$ est impair, $k = (n+1)/2$, $F_n = F_{k-1}^2 + F_k^2$

```c
u32 fib_rec_improved(u32 n) {
    if (n <= 1) return n;
    if (n % 2 == 1) {
        u32 k = (n + 1) >> 1;
        u32 f1 = fib_rec_improved(k - 1);
        u32 f2 = fib_rec_improved(k);
        return (f1 * f1 + f2 * f2);
    } else {
        u32 k = n >> 1;
        u32 f1 = fib_rec_improved(k - 1);
        u32 f2 = fib_rec_improved(k);
        return (2 * f1 + f2) * f2;
    }
}
```
> *Listing 16.2.2 – Fibonacci - fonction récursive améliorée*

| $F_i$ | `fib_rec` | `fib_rec_improved` |
|---|---|---|
| $F_{10}$ | 177 | 15 |
| $F_{20}$ | 21 891 | 31 |
| $F_{25}$ | 242 785 | 41 |
| $F_{30}$ | 2 692 537 | 45 |
| $F_{35}$ | 29 860 703 | 55 |
| $F_{40}$ | 331 160 281 | 63 |
| $F_{45}$ | 3 672 623 805| 75 |

*TABLE 16.2 – Nombre d'appels des fonctions récursives de Fibonacci*

Pour la version récursive améliorée, le nombre d'appels récursifs est nettement
plus petit et d'une complexité en $\mathcal{O}(n)$ comme on peut le constater.

## 16.3 Approximation Mathématique

On peut calculer $F_n$ en utilisant l'arrondi de l'expression suivante :
$$F_n \simeq \frac{\phi^n}{\sqrt{5}}$$

Le temps de calcul du test que nous réaliserons et qui est décrit ci-après est
de l'ordre de 22,58 secondes via `math.h`. Nous ne nous intéresserons donc pas aux temps de
calculs obtenus grâce à cette formule même s'ils sont parfois inférieurs à d'autres
implantations (notamment la traduction directe non-optimisée de la référence récursive pure qui s'exécute en plus de 50 secondes !).

## 16.4 Fonction de Référence (Récursivité Linéaire)

La version de référence à laquelle nous allons nous intéresser (*Listing 16.4.1*),
est une variante de la version récursive. Elle est à la fois récursive puisqu'elle s'ap-
pelle, mais également linéaire puisque seulement $n$ appels seront réalisés.
Elle prend en paramètres la valeur du nombre à calculer $n$ ainsi que $F_0$ et $F_1$
représentés respectivement par `f0` et `f1`. L'appel est réalisé en prenant `f0 = 0` et
`f1 = 1`.

```c
u32 fib_ref(u32 f0, u32 f1, u32 n) {
    if (n == 0) {
        return f0;
    } else {
        return fib_ref(f1, f0 + f1, n - 1);
    }
}
// Appel initial :
// u32 fn = fib_ref(0, 1, n);
```
> *Listing 16.4.1 – Fibonacci - fonction de référence linéaire*

Cette fonction de référence est traduite par le compilateur `g++` en utilisant les
options de compilation suivantes : `-O3` (Optimisation niveau 3) et `-funroll-loops` (dépliage de boucle).
Le compilateur parvient à éliminer la récursivité et produit une version très performante. Il transforme la récursivité en une boucle `while` avec un dépliage
par 8. De plus, il utilise `esp` plutôt que `ebp` pour récupérer les paramètres de la
fonction.

> **Temps de référence**
> Le test de référence consiste à réaliser `500_000_000` fois le calcul de $F_{43}$. Les
> tests sont réalisés sur un AMD Ryzen 5 5600g. Pour l'implantation par le
> compilateur `g++`, l'exécution dure environ **2,853 secondes**, ce qui représente
> un temps d'exécution très performant qui va se révéler difficile à battre, mais
> à cœur vaillant, rien d'impossible.

## 16.5 Fonction Récursive (Assembleur natif)

La traduction de la fonction de référence en assembleur est facile à réaliser. Un
rapide examen permet de déterminer qu'il est intéressant de charger `f0` dans `eax`
puisque c'est la valeur qui sera retournée dans le cas où la variable $n$ est égale à 0.
On utilise également `edx` pour stocker `f1` et `ecx` pour $n$.

```nasm
fib_v1:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]                 ; eax = f0
    mov edx, [ebp+12]                ; edx = f1
    mov ecx, [ebp+16]                ; ecx = n
    test ecx, ecx                    ; n == 0 ?
    jz .endif
    
    dec ecx                          ; n - 1
    push ecx                         ; arg 3: n - 1
    add eax, edx                     ; eax <- f0 + f1
    push eax                         ; arg 2: f0 + f1
    push edx                         ; arg 1: f1
    call fib_v1
    add esp, 12                      ; libération des paramètres
    
.endif:
    mov esp, ebp
    pop ebp
    ret
```
> *Listing 16.5.1 – Fibonacci - fonction de référence en assembleur*

> **Echec en assembleur natif (Call Hell)**
> La version de référence implantée en assembleur (traduction
> directe) s'exécute en **50,630 secondes**, ce qui est énorme par rapport à la
> version optimisée par le compilateur (2,853s). Les accès mémoires de la pile `call/ret` sont la cause du ralentissement.

## 16.6 Approche algorithmique (Tableau dynamique vs statique)

Pour calculer les nombres de la suite de Fibonacci, on peut utiliser un tableau
de $n+1$ entiers et on commence par remplir les deux premiers éléments par les
valeurs 0 et 1 qui correspondent à $F_0$ et $F_1$. Chaque élément d'indice $i$ du tableau
correspond à la valeur de $F_i$. On applique ensuite la formule de récurrence sur les
éléments du tableau.

```c
u32 fib_arr(u32 f0, u32 f1, u32 n) {
    if (n <= 1) return n;
    u32 data[48];                    // Ou un malloc global
    data[0] = f0;
    data[1] = f1;
    u32 i = 2;
    while (i <= n) {
        data[i] = data[i-1] + data[i-2];
        ++i;
    }
    return data[i-1];
}
```
> *Listing 16.6.1 – Fibonacci - fonction itérative avec tableau*

> **Version Tableau Dynamique vs Statique**
> La version basée sur un tableau dynamique (`malloc`) alloué à chaque appel de la
> fonction prend **13,790 secondes** pour s'exécuter. Alors que si on utilise un
> tableau statique (`u32 data[48]`) le temps d'exécution passe à **6,380 secondes**.

## 16.7 Approche Itérative (`while` direct)

Nous allons à présent nous concentrer sur des versions itératives et remplacer
l'appel récursif par une boucle `while` mais nous allons nous passer de l'utilisation
d'un tableau pour stocker les calculs intermédiaires. Ces calculs seront réalisés
dans les registres `eax` et `edx` principalement.

```c
u32 fib_iter(u32 f0, u32 f1, u32 n) {
    while (n != 0) {
        u32 tmp = f1;
        f1 += f0;
        f0 = tmp;
        --n;
    }
    return f0;
}
```
> *Listing 16.7.1 – Fibonacci - fonction itérative avec boucle while*

Si $n$ est égal à 0, on retourne `f0` (donc 0). Sinon on calcule $F_1$, puis $F_2$, jusqu'à
$F_n$. La variable `f0` devient `f1` et `f1` devient `f1+f0` ($F_2$). Pour faire ce
transfert de valeurs il est nécessaire d'utiliser une variable temporaire `tmp`.

On peut traduire ce code directement en assembleur en
utilisant le registre `ebx` pour stocker temporairement la valeur de `f1`. On se doit
alors de sauvegarder `ebx` dans la pile, puis de le restaurer par la suite.

```nasm
fib_v3:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp+8]                 ; eax = f0
    mov edx, [ebp+12]                ; edx = f1
    mov ecx, [ebp+16]                ; ecx = n
    test ecx, ecx
    jz .end
    
.while:
    mov ebx, edx                     ; tmp = f1
    add edx, eax                     ; f1 = f0 + f1 => f2
    mov eax, ebx                     ; f0 = tmp => f1
    dec ecx                          ; --n
    jnz .while
    
.end:
    pop ebx
    mov esp, ebp
    pop ebp
    ret
```
> *Listing 16.7.2 – Fibonacci - fonction itérative avec while en assembleur*

> **Version itérative avec while**
> La version itérative ne prend alors plus que **6,30 secondes** pour s'exécuter.
> Avec `unroll 2` : 5,26s.
> Avec `unroll 4` : 3,54s.
> Avec `unroll 8` : **3,47s**.

### 16.7.1 Amélioration d'assignement (XCHG)

On peut s'apercevoir que le corps de la boucle `while` peut être optimisé. Au lieu
de coder une transition via registre tampon :
```nasm
    add eax, edx                     ; eax = f0 + f1 (F2), edx = f1 (F1)
    xchg eax, edx                    ; échange : eax=F1, edx=F2
```

L'astuce permet de se passer du tampon `ebx`. Mais, mal implémentée, la dépendance d'`XCHG` sur les états mémoires de `eax` ne rapporte pas d'avantage que cela (3,60s).

### 16.7.2 Amélioration Parallèle au dépliage

Une amélioration consistante en *Unroll* consiste à faire les sauts 2 par 2 sans `XCHG` de retour :
```nasm
    add eax, edx                     ; eax = F0 + F1 = F2
    add edx, eax                     ; edx = F1 + F2 = F3 (directement le coup suivant !)
```

| Instruction | Registre `eax` | Registre `edx` |
|---|---|---|
| *Initialement* | $F_i$ | $F_{i+1}$ |
| `add eax, edx` | $F_{i+2}$ | $F_{i+1}$ |
| `add edx, eax` | $F_{i+2}$ | $F_{i+3}$ |

*TABLE 16.3 – Astuce dépliage par 2*

Avec cette technique pour sauter deux éléments sans rien échanger :
- Dépliage par 2 : 3,755s
- Dépliage par 4 : 3,544s
- **Dépliage par 8 : 2,453s**

### 16.7.5 Amélioration via calcul d'adresse (`lea`)

Lors du dépliage par 8, les enchainements d'instructions `add` génèrent des pénalités de dépendance (*Read-After-Write Pipeline Hazard*). On peut supprimer des
dépendances en utilisant l'instruction de calcul d'adresse matérielle `lea`.

```nasm
.while_ur8:
    lea eax, [eax+edx]
    lea ebx, [ebx+edx]
    ; ...
    loop .while_ur8
```

Le code exécute 500 millions d'appels en **2,229 secondes** grâce au processeur traitant `lea` sur une ALU complètement asynchrone par rapport au résolveur arithmétique.

## 16.8 Amélioration Vectorielle via SIMD (SSE / AVX2 / AVX512)

### 16.8.1 Vectorisation SSE

On peut reprendre le même principe que la boucle `while` en utilisant les registres
vectoriels. On commence par charger dans le registre SSE `xmm0` les 4 premières valeurs
de la suite de Fibonacci et on fait de même avec `xmm1` avec un décalage d'un élèment.

Il s'agit des tableaux `sse_vect0` et `sse_vect1`. On alignera ces tableaux sur de la lecture mémoire par 16 octets (`align 16`).

| Instruction | `xmm0` | `xmm1` |
|---|---|---|
| *Initialement* | $F_3,F_2,F_1,F_0$ | $F_4,F_3,F_2,F_1$ |
| `paddd xmm0, xmm1` | $F_7,F_5,F_3,F_1$ | $F_4,F_3,F_2,F_1$ | *(Déphasage incertain)* |
| `paddd xmm1, xmm0` | - | - |

*TABLE 16.4 – Evolution vectorielle pure : (Les vecteurs s'additionnent localement en déphasé).*

*(Note : le mécanisme vectoriel s'appuie sur un système spécifique. En SSE, l'addition entre XMM entraîne un saut de multiples suites d'un trait, ce qui se résout par `[0,1,1,2] + [1,1,2,3] = [1,2,3,5]` (le terme $n+4$). On va pouvoir faire des sauts par 4 sans déplier en dur).*

```nasm
align 16
sse_vect0: dd 0, 1, 1, 2             ; F0, F1, F2, F3
sse_vect1: dd 1, 1, 2, 3             ; F1, F2, F3, F4

fib_sse:
    ; ... Chargements xmm0 et xmm1
    shr eax, 2                       ; n / 4 car de saut de 4 par boucle matérielle !
.while_ur4:                          ; On avance de 4 pas vectoriellement
    paddd xmm0, xmm1
    paddd xmm1, xmm0
    paddd xmm0, xmm1
    paddd xmm1, xmm0
    dec eax
    jnz .while_ur4
    
    ; Extraire l'élément du reste
    vmovdqu [esp], xmm0
    mov eax, [esp+ecx*4]
```

### 16.8.2 Vectorisation AVX

La version AVX consiste à faire un saut de 8 à la fois sur la boucle puisque les `ymm` traitent 8 éléments de 32-bits par cycle !

```nasm
align 32
avx_vect0: dd 0, 1, 1, 2, 3, 5, 8, 13
avx_vect1: dd 1, 2, 3, 5, 8, 13, 21, 34

fib_avx:
    ; ...
    shr ecx, 3                       ; n / 8 !
.while_ur8:
    vpaddd ymm1, ymm1, ymm0          ; ymm1 = ymm1 + ymm0
    vpaddd ymm0, ymm0, ymm1          ; ymm0 = ymm0 + ymm1
    ; ... (x8)
    dec ecx
    jnz .while_ur8
```

> **Amélioration Vectorielle SSE / AVX**
> Les temps d'exécution tombent à :
> - Version SSE Assembleur (unroll 8) : **1,961 sec**.
> - Version AVX Assembleur (unroll 16) : **1,973 sec**.
> Les versions intrinsics (`C`) tournent autour de 2.47 sec. C'est l'assembleur pur qui surpasse grandement la version compilo (2.85s).

## 16.9 Benchmark Final Multi-Architecture

Le code qui correspond à l'ensemble des résultats produits dans cette section
comporte 34 implantations différentes.

| N° | Méthode | Intel Core i3 6100 | AMD Ryzen 7 1700X | Intel Core i7 8700 | Intel Core i5 8365U |
|---|---|---|---|---|---|
| 1 | `gcc` (Référence -O3) | 4,11 | 4,39 | 3,23 | 3,61 |
| 5 | `dyna. array` (malloc) | 18,57 | 21,16 | 15,79 | 18,09 |
| 6 | `n recursive` (ASM natif)| 63,39 | 82,48 | 51,53 | 112,24 |
| 8 | `while_v1` (ASM basique)| 7,52 | 11,47 | 5,78 | 7,44 | 
| 11 | `while_v1_ur8` | 9,65 | 5,14 | 7,86 | 9,95 |
| 21 | `while_v3_ur8` (`lea`) | 5,37 | 4,39 | 4,45 | 4,96 |
| 30 | `SSE_v4_ur8` | - | 4,20 | 3,17 | 3,66 |
| 33 | `AVX_asm_ur8` | - | **3,34** | **2,46** | **2,90** |

*TABLE 16.5 – Résultats comparatifs (Architectures < 2019) (500 M itérations).*

L'AMD Ryzen 1700X s'étouffe sur l'ASM basique (11.47 sec) mais reprend la couronne avec un unroll (5.14 sec). La puissance totale s'obtient avec l'ASM AVX.

| N° | Méthode | Intel Core i7 10850H | AMD Ryzen 5 5600g | Intel Core i5 12400F |
|---|---|---|---|---|
| 1 | `gcc` (Référence -O3) | 3,007 | 2,853 | 2,035 |
| 8 | `while_v1` (ASM basique)| 6,038 | 6,304 | 5,570 |
| 21 | `while_v3_ur8` (`lea`) | 4,121 | 2,229 | 4,795 |
| 30 | `SSE_v4_ur8` | **2,442** | 2,153 | **1,980** |
| 33 | `AVX_asm_ur8` | - | **1,982** | - |

*TABLE 16.6 – Résultats comparatifs (Architectures > 2020) (500 M itérations).*

La méthode `gcc` (1) exécute 45 milliards d'instructions. L'ASM d'origine (6) exécute 352 milliards d'instructions (`call/ret` infernal). C'est pourquoi la méthode 6 coule. La méthode `AVX` natif (33) ne met que **34 milliards d'instructions** !

### 16.9.3 Stabilité Matérielle (Bruit Quantique)

Lors de tests poussés sur les performances à la miliseconde près, et lors de micro-batching récurrent (500 millions de `while AVX`) pour tester les limites du CPU, des variances de Turbo Boost s'observent sur Intel.

| | Intel Core i7 10850H | Intel Core i5 7400 | AMD Ryzen 5 5600g | AMD Ryzen 7 1700X |
|---|---|---|---|---|
| **Fréquence moyenne** | 4973,97 MHz | 3475,01 MHz | 4441,90 MHz | 3492,71 MHz |
| **Ecart type** | 24,20 | 13,84 | **0,00** | 0,12 |
| **Minimum** | 4945,02 MHz | 3450,57 MHz | 4441,90 MHz | 3492,07 MHz |
| **Maximum** | 5012,62 MHz | 3499,39 MHz | 4441,91 MHz | 3493,04 MHz |

*TABLE 16.7 – Variation de la fréquence du microprocesseur lors des tests*

On note que pour les processeurs AMD, la fréquence de traitement vectoriel en AVX reste parfaitement verrouillée à sa clock de boost (zéro bruit mathématique), alors que les processeurs Intel modulent le voltage générant une tolérance d'erreur du tick de ±24MHz.

## 16.10 Remerciements
Merci à Mohamed Sylla et Matéo Grimaud, étudiants à l'Université d'Angers,
pour les tests effectués respectivement sur Intel Core i7 1165G7 et Core i5 8365U.
