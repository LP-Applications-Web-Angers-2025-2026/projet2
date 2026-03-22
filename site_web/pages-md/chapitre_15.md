# Chapitre 15 : Étude de cas (Compter les voyelles)

## 15.1 Introduction

Nous allons dans ce chapitre nous intéresser à un problème simple qui sert
d'exemple de démonstration et qui consiste à compter les voyelles dans une chaîne
de caractères. Ce problème, bien qu'évident à implanter, demande de posséder les
connaissances que nous avons mises en avant dans les Chapitres précédents. L'utilisation
des instructions vectorielles apporte également une amélioration substantielle sous
certaines architectures.

On considère pour ce problème des chaînes de caratères ne possédant que des
caractères en minuscule sans accents ni signes de ponctuation afin de simplifier
l'écriture du code. On ne prend en compte que les voyelles (a, e, i, o, u et y) et
on ne considère que des chaînes de longueur multiple de 64 pour pouvoir utiliser
l'AVX-512 et simplifier le code.

Nous allons coder en 64 bits afin de disposer de nombreux registres qui vont
grandement nous simplifier la tâche.

## 15.2 Fonctions de référence (C)

Nous pouvons concevoir trois fonctions de référence pour répondre au pro-
blème :
- la première fonction est écrite en utilisant des `if`, ce qui est normalement très
  pénalisant lorsqu'ils sont dans une boucle
- la seconde fonction utilise un `switch` qui est censé pallier au problème de
  performance du `if`
- enfin la troisième fonction utilise un tableau afin d'éviter les branchements
  conditionnels induits par le `if` ou le `switch`

La fonction réalisée avec un `if` est présentée *Listing 15.2.1*. Les fonctions auront
toutes la même signature à savoir un pointeur sur une chaîne de caractères en C,
la longueur de la chaîne et un pointeur sur un tableau de six entiers qui sont les
compteurs du nombre d'occurrences de chaque voyelle. Ici `v[0]` compte le nombre
de `'a'`, `v[1]` le nombre de `'e'`, etc. Cette fonction est pénalisante car on ne peut
pas prédire quel *then* sera exécuté et, de plus, si on trouve un `'y'` ou une consonne
on devra réaliser six comparaisons.

```c
void count_vowels_if(u8* s, u32 size, u32 v[6]) {
    for (u32 i = 0; i < size; i++) {
        if (s[i] == 'a') {
            ++v[0];
        } else if (s[i] == 'e') {
            ++v[1];
        } else if (s[i] == 'i') {
            ++v[2];
        } else if (s[i] == 'o') {
            ++v[3];
        } else if (s[i] == 'u') {
            ++v[4];
        } else if (s[i] == 'y') {
            ++v[5];
        }
    }
}
```
> *Listing 15.2.1 – Compter les voyelles avec un if*

La fonction implantée avec un `switch` tente de remédier au problème du `if`,
elle est présentée *Listing 15.2.2*. Son codage en assembleur par un compilateur
C/C++ génère un tableau de 25 adresses qui correspondent aux lettres `'a'` à `'y'`.
Ces adresses sont utilisées pour se brancher sur une partie du sous-programme qui
incrémente `v[i]` pour la voyelle correspondante ou qui incrémente la variable de
boucle s'il s'agit d'une consonne.

```c
void count_vowels_switch(u8* s, u32 size, u32 v[6]) {
    for (u32 i = 0; i < size; i++) {
        switch(s[i]) {
            case 'a': ++v[0]; break;
            case 'e': ++v[1]; break;
            case 'i': ++v[2]; break;
            case 'o': ++v[3]; break;
            case 'u': ++v[4]; break;
            case 'y': ++v[5]; break;
        }
    }
}
```
> *Listing 15.2.2 – Compter les voyelles avec un switch*

La fonction implantée avec un tableau (*Listing 15.2.3*) consiste à compter
toutes les lettres. Étant donné qu'il y a 26 lettres dans l'alphabet on crée un
tableau temporaire (`letters`) de 26 entiers que l'on initialise à 0. L'écriture de
la boucle est donc simplifiée puisqu'on n'a plus qu'une seule instruction et que
le dépliage de la boucle sera facilement réalisé par le compilateur. Le tableau
temporaire composé de 26 entiers de 32 bits tient aisément dans la mémoire cache
et permettra d'accélérer le traitement. En fin de sous-programme, on recopiera
dans `v` le nombre d'occurrences de chaque voyelle.

```c
void count_vowels_table(u8* s, u32 size, u32 v[6]) {
    u32 letters[26];
    
    for (u32 i = 0; i < 26; i++) letters[i] = 0;
    
    for (u32 i = 0; i < size; i++) {
        ++letters[s[i] - 'a'];
    }
    
    v[0] = letters['a' - 'a'];
    v[1] = letters['e' - 'a'];
    v[2] = letters['i' - 'a'];
    v[3] = letters['o' - 'a'];
    v[4] = letters['u' - 'a'];
    v[5] = letters['y' - 'a'];
}
```
> *Listing 15.2.3 – Compter les voyelles avec un tableau*

> **Temps de référence**
> Le test de référence consiste à exécuter `50_000` fois le dénombrement du
> nombre de voyelles pour une chaîne de `256_000` caractères, initialisée aléa-
> toirement, avec environ 20% de voyelles.
> 
> Sur un AMD Ryzen 5 3600, on obtient :
> - pour la version `if` le test dure 57,09 secondes
> - pour la version `switch` le test s'effectue en 54,71 secondes
> - pour la version `tableau`, le temps d'exécution est de **4,64 secondes**
>
> La méthode qui consiste à compter toutes les lettres est donc la plus efficace car
> elle ne contient pas de conditionnelle et elle peut être dépliée simplement.

## 15.3 Traduction de la méthode du tableau en assembleur

On peut traduire la méthode du tableau directement en assembleur mais nous
allons utiliser quelques améliorations liées à la vectorisation pour initialiser le
tableau de lettres.
On stockera le tableau `letters` dans la pile à une adresse multiple de 32 afin
de l'initialiser par la suite avec un registre AVX. Les conventions choisies sont celles
de la Table 15.1.

| Variable | Type | Registre | Description |
|---|---|---|---|
| `s` | | `rdi` | adresse de la chaîne |
| `size` | | `rsi` | taille |
| `v` | | `rdx` | adresse du tableau des retours |
| `i` | | `rcx` | itérateur |
| *adresse* | `u64` | `rbx` | adresse du tableau `letters` dans la redzone |
| *calculs* | `u64` | `rax` | calculs temporaires |

*TABLE 15.1 – Associations variables C et registres pour l'implantation avec tableau*

### 15.3.1 Création et initialisation du tableau

On commence par sauvegarder le registre `rbx` dans la *red zone* car il ne doit pas
être modifié et sera donc préservé dans la pile car il va stocker l'adresse du tableau
`letters`. Ensuite, on crée le tableau qui va occuper $26 \times 4 = 104$ octets, toujours
dans la *red zone* en faisant en sorte que son adresse de début soit multiple de 32
afin d'améliorer l'accès mémoire. L'adresse stockée dans `rbx` doit être diminuée de
`8 + 104` octets puisqu'on sauvegarde le contenu de `rbx` en premier dans la pile.

```nasm
    mov [rsp-8], rbx
    lea rbx, [rsp - (8 + 4*26)]      ; allocation 104 octets + rbx
    and rbx, ~(32-1)                 ; arrondissement au multiple de 32 inférieur
    ; en bas de la red zone
    xor eax, eax
```

Il faut ensuite initialiser le tableau et on peut le faire de trois manières diffé-
rentes, en utilisant :
- Un registre 64 bits comme `rax` affecté à `0`, avec une macro boucle :
```nasm
    xor rax, rax
    %assign i 0
    %rep 13
        mov [rbx+i], rax
        %assign i i + 8
    %endrep
```
- L'instruction `rep stosq` (plus lent généralement) :
```nasm
    xor rax, rax                     ; rax = 0
    mov r8, rdi                      ; sauvegarde rdi dans r8
    mov rdi, rbx                     ; rdi = &letters[0]
    mov rcx, 13                      ; faire 13 fois
    rep stosq           
    mov rdi, r8                      ; restaure rdi depuis r8
```
- Un vecteur AVX de 32 octets (`ymm0`) affecté à `0` :
```nasm
    vpxor ymm0, ymm0, ymm0
    vmovdqa [rbx], ymm0              ; letters[ 0: 7] = 0
    vmovdqa [rbx+32], ymm0           ; letters[ 8:15] = 0
    vmovdqa [rbx+64], ymm0           ; letters[16:23] = 0
    vzeroupper
    mov [rbx+96], rax                ; letters[24:25] = 0 (avec rax = 0)
```

### 15.3.2 Boucle principale

On commence par vérifier si `size` est égale à 0, sinon on exécute la boucle. On
charge la lettre `s[i]` dans `eax` en la transformant en une valeur 32 bits grâce à
`movzx`. On retranche alors la valeur de `'a'` pour obtenir l'indice de la lettre stockée
dans le tableau `letters`. On incrémente cet index.

```nasm
    test rsi, rsi                    ; si size == 0 alors
    jz .end_while                    ; aller en .end_while
    
    xor rcx, rcx                     ; i = 0

.while:
    movzx eax, byte [rdi+rcx]
    inc rcx                          ; ++i
    sub eax, 'a'                     ; eax = s[i] - 'a'
    cdqe                             ; convertir en 64 bits vers rax (Optionnel la plupart du temps)
    inc dword [rbx+rax*4]
    
    cmp rcx, rsi                     ; si i < size alors
    jne .while                       ; aller en .while

.end_while:
```

### 15.3.3 Retour et boucle dépliée

La sortie de la fonction consiste à recopier le nombre d'occurrences de chaque
voyelle dans le tableau `v`.

```nasm
    mov r9d, 'a'-'a'                 ; stocke le nombre d'occurrences
    mov eax, [rbx+r9*4]
    mov [rdx], eax
    mov r9d, 'e'-'a'                 
    mov eax, [rbx+r9*4]
    mov [rdx+4], eax
    ; ... idem pour i,o,u,y
    
    mov rbx, [rsp-8]
    ret
```

On peut grandement accélérer l'assembleur natif en effectuant un `unroll 4` de cette boucle (`while_ur4`), où `s[i]...s[i+3]` sont chargés en un seul appel `mov eax, dword [rdi+rcx]` puis répartis dans `r8`, `r9`, `r10` via des `shr eax, 8`.
> **Bug connu `inc` vs AMD Ryzen** : l'emploi frénétique d'instructions `inc` mémoire en natif provoque un lourd goulot sur la version Ryzen qui exécute tantôt le job en 5 secondes, tantôt en 14 secondes. Remplacez par un `add dword [x], 1`.

## 15.4 Vectorisation SSE

Il est possible d'envisager une version utilisant les registres vectoriels. 
L'association variables / registres utilisera 12 registres SSE.
Les registres `xmm8` à `xmm13` contiendront la fenêtre `s[i:i+15]` et seront modifiés par les
calculs. Les registres `xmm2` à `xmm7` contiennent des vecteurs composés d'une voyelle fixe et ne seront pas modifiés. On comparera en parallèle `xmm8` avec `xmm2`, puis `xmm9` avec `xmm3`, etc.

| Variable | Type | Registre SSE | Contexte |
|---|---|---|---|
| `nb_a` | | `r8` | Cumulatif |
| `nb_y` | | `r13`| Cumulatif |
| `vec_x` | `u128` | `xmm8...xmm13`| Copie de la fenêtre traitée |
| `vec_a` | `u128` | `xmm2` | `['a',...,'a']` |
| `vec_y` | `u128` | `xmm7` | `['y',...,'y']` |

*TABLE 15.2 – Associations variables et registres pour compter les voyelles (version SSE)*

On remplit ensuite chacun des registres `xmm2` à `xmm7` avec respectivement des `'a'`, des `'e'`, etc. avec `pshufd`.

```nasm
    mov eax, 0x61616161              ; # ASCII(a) = 0x61
    movd xmm2, eax
    pshufd xmm2, xmm2, 0
    mov eax, 0x65656565              ; # ASCII(e) = 0x65
    movd xmm3, eax
    pshufd xmm3, xmm3, 0
    ; ...
```

Puis la boucle principale vectorisée se résume à :
```nasm
.for_sse:
    cmp rcx, rsi                     ; fin de boucle si i >= size
    jge .end_for
    
    movdqu xmm8, [rdi+rcx]
    movdqa xmm9, xmm8                ; Copie xmm8 partout 
    movdqa xmm10, xmm8
    movdqa xmm11, xmm8
    movdqa xmm12, xmm8
    movdqa xmm13, xmm8               
    
    ; Compter les 'a'
    pcmpeqb xmm8, xmm2               ; xmm8.b[i] = 0xFF si s[i] == 'a'
    pmovmskb ebx, xmm8               ; Masque envoyé sur le registre EBX
    popcnt ebx, ebx                  ; Compter le nombre de 1 = occurrences
    add r8, rbx                      ; nb_a += rbx
    
    ; Compter les 'e'
    pcmpeqb xmm9, xmm3
    pmovmskb ebx, xmm9
    popcnt ebx, ebx
    add r9, rbx
    ; ... 
    
    add rcx, 16                      ; 16 prochains caractères
    jmp .for_sse
.end_for:
```

> **Amélioration SSE** :
> Pour la version SSE, le test (sur 256.000 car. à 20% de voyelles en 50_000 itérations) s'exécute en **1,59 secondes** contre les 4.64s de la méthode en C `tableau`.

## 15.5 Vectorisation AVX2 et AVX512

On suit le même principe que pour le SSE mais on va traiter la chaîne par paquets de 32 caractères dans les `ymm`, voire par paquets de 64 caractères avec la puissance des `zmm` d'AVX-512.

Pour le broadcast, on utilise l'instruction matérielle fusionnée :
```nasm
    mov eax, 0x61616161              ; 4 fois le code ASCII de 'a'
    movd xmm2, eax                   ; charger dans xmm2.d[0]
    vpbroadcastd ymm2, xmm2          ; recopier dans l'intégralité d'ymm2 (8 espaces)
```

La boucle s'exprime comme en AVX, avec un `vpcmpeqb` suivi de `vpmovmskb`. Rendu en **AVX-12** (512 bits / cycle !), le code se passe même de `vpmovmskb` grâce aux registres de masque `k` :

```nasm
    ; unroll by 64 (saut des 64 blocs via zmm8)
    ; ... 
    vmovdqa32 zmm8, [rdi+rcx]
    
    vpcmpeqb k1, zmm2, zmm8          ; Si ZMM8 == ZMM2('a'), mettre K1 à vrai.
    vpcmpeqb k2, zmm3, zmm8          ; 'e'
    ; ...

    ; 'a'
    kmovq rbx, k1                    ; L'AVX-512 transmet le masque direct dans un GPR !
    popcnt rbx, rbx                  ; Le CPU compte sur 64 bits les occurrences
    add r8, rbx                      ; Et les ajoute à la variable compteur native.
```

> **Amélioration AVX2 et AVX512** :
> L'AVX2 exécute en **0.79 secondes**. L'AVX512 tombe à environ **0.62 secondes** (un facteur d'amélioration de $80 \times$ sur la base pure C).

## 15.6 Benchmark Récapitulatif

[BENCHMARK:asm_vowels_64]

### 15.8.4 Influence de la densité sur la prédiction de branchement :

| % Voyelles | M1 (If) | M2 (Switch) | M3 (Tableau) |
|---|---|---|---|
| 10 % | 43.83 | 83.65 | 9.41 |
| 50 % | 95.87 | 154.01 | 9.45 |
| 100 %| 134.95 | 165.68 | 10.43 |

*TABLE 15.8 – Temps d'exécution en fonction de la saturation de l'évènement ciblé (AMD Ryzen 3600)*

Pour l'ensemble des méthodes, le temps d'exécution augmente à mesure que le
nombre de voyelles augmente. Cela parait normal car au début avec 10% de voyelles, le code tombe tout le temps sur Consonne (Condition Faux prédictible massivement). A mesure que le taux avoisine les 50%, la prédiction de branchement s'effondre pour les méthodes M1 et M2, le processeur s'étouffe.

La **Méthode 3 (Tableau)** ne contient **aucune condition d'embranchement**, son coût d'exécution est totalement stable (`9.5 sec` fixe).

## 15.9 Bilan

Comme le montre cette étude de cas, un traitement banal peut être, s'il est
mal implanté, source de grands ralentissements pour le reste d'un programme. La
vectorisation (`SSE, AVX, AVX-512`) apporte un facteur d'amélioration important en raison, d'une part, du
traitement de plusieurs octets simultanément, et d'autre part, de **l'élimination du `if`**.

Cet exemple est très emblématique car le compilateur est souvent incapable de vectoriser
le code lui-même sur les `switch`. Passer du scalaire M1 à l'AVX512 permet de fondre la latence d'exécution de 1 heure de calcul à 43 secondes réelles.
