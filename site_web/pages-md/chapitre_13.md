# Chapitre 13 : Étude de cas (Variante de SAXPY)

## 13.1 Introduction

Ce chapitre traite de l'implantation de la fonction `saxpy` et permet de mettre en
pratique ce qui a été vu au Chapitre 7.

Pour rappel, la fonction SAXPY (*Single-Precision A×X Plus Y*) consiste, étant
donnés deux vecteurs de $n$ réels appelés $X$ et $Y$, à calculer :

$Y = a \times X + Y$
$y_i = a \times x_i + y_i, \forall i \in [1..n]$
où $a$ est une constante réelle. 

Afin de complexifier la traduction pour le compilateur, nous avons décidé de modifier quelque peu la fonction en lui faisant retourner
la somme des $y_i$ :

$sum = \sum_{i=1}^{n} y_i$

Nous allons nous intéresser à des vecteurs de taille quelconque et programmer
en architecture 32 bits. Les types C que nous allons utiliser sont :
- pour les entiers non signés `typedef uint32_t u32;`
- pour les nombres flottants en simple précision `typedef float f32;`

## 13.2 Fonction de référence en C

La fonction à implanter est donnée au *Listing 13.2.1*. Elle comporte quatre para-
mètres qui sont les vecteurs `x` et `y`, la constante `a` ainsi que la taille des vecteurs
(`size`).

```cpp
f32 saxpy_ref(f32* x, f32* y, f32 a, u32 size) {
    f32 sum = 0.0f;
    for (u32 i = 0; i < size; i++) {
        y[i] = a * x[i] + y[i];
        sum += y[i];
    }
    return sum;
}
```
> *Listing 13.2.1 – SAXPY modifiée - fonction de référence*

## 13.3 Implantation Assembleur (FPU 32 bits)

La première implantation en assembleur que nous allons réaliser (*Listing 13.3.1*) est la traduction de la fonction de référence en utilisant le coprocesseur
arithmétique x87. 

Étant donné qu'il s'agit d'une fonction qui retourne un `float` en
architecture 32 bits, c'est le premier registre du coprocesseur qui contient le résultat
de la fonction, c'est-à-dire `st0`. Nous avons choisi de réaliser l'association variables / registres de la Table 13.1.

| Cste/Param/Var | Type | Paramètre | Registre | Description |
|---|---|---|---|---|
| `x` | `f32 []` | `[ebp+8]` | `esi` | adresse du vecteur `x` |
| `y` | `f32 []` | `[ebp+12]` | `edi` | adresse du vecteur `y` |
| `a` | `f32` | `[ebp+16]` | pile | constante `a` |
| `size` | `u32` | `[ebp+20]` | `edx` | taille des vecteurs |
| `i` | `u32` | | `ecx` | variable de boucle |
| `sum` | `f32` | | `st0` | somme retournée |

*TABLE 13.1 – Association entre variables et registres pour la fonction de référence de la variante de SAXPY*

Les registres `esi` et `edi` devront être sauvegardés car ils ne doivent pas être
modifiés pour le sous-programme appelant d'après les conventions d'appel du C en 32 bits.

La traduction est présentée ci-dessous. En ligne 3, on
initialise `sum` à `0` grâce à l'instruction `fldz`. Comme indiqué précédemment, `sum`
sera en `st0`, puis décalé en `st1` lors du calcul $a \times x_i + y_i$.

```nasm
saxpy_fpu:
    push ebp
    mov ebp, esp
    fldz                            ; sum = 0
    cmp dword [ebp+20], 0           ; si size == 0 alors retourne 0
    jz end
    
    push esi                        ; sauve les registres
    push edi
    
    mov esi, [ebp+8]                ; esi = x
    mov edi, [ebp+12]               ; edi = y
    mov edx, [ebp+20]               ; edx = size
    xor ecx, ecx                    ; i = 0

.for:
    cmp ecx, edx                    ; fin de boucle si i >= size
    jge endfor
    
    fld dword [esi+ecx*4]           ; charge x[i]
    fmul dword [ebp+16]             ; a * x[i]
    fadd dword [edi+ecx*4]          ; a * x[i] + y[i]
    fst dword [edi+ecx*4]           ; stocke dans y[i]
    faddp st1, st0                  ; sum += y[i] et on dépile
    
    inc ecx                         ; ++i
    jmp .for

.endfor:
    pop edi                         ; restaure les registres
    pop esi
.end:
    mov esp, ebp
    pop ebp
    ret
```
> *Listing 13.3.1 – SAXPY modifiée - implantation FPU*

On peut voir l'évolution de la pile du coprocesseur lors du calcul *Table 13.2*.

| ligne | instruction | `st0` | `st1` |
|---|---|---|---|
| ... | `jge` | `sum` | ? |
| 17 | `fld dword [esi+ecx*4]` | $x_i$ | `sum` |
| 18 | `fmul dword [ebp+16]` | $a \times x_i$ | `sum` |
| 19 | `fadd dword [edi+ecx*4]` | $a \times x_i + y_i$ | `sum` |
| 20 | `fst dword [edi+ecx*4]` | $a \times x_i + y_i$ | `sum` |
| 21 | `faddp st1, st0` | $sum + (a \times x_i + y_i)$ | ? |

*TABLE 13.2 – Pile du calcul du coprocesseur FPU x87*

Afin de donner un ordre d'idée du temps d'exécution, le test effectué consistera à calculer `50_000` fois les fonctions appliquées sur des vecteurs initialisés aléatoirement de `524_287` éléments.
> **Temps de référence**
> Pour l'implantation de référence pure C, l'exécution dure environ 22,95 secondes. En FPU via Assembleur on n'observe aucune amélioration probante (23.01s).

## 13.4 Amélioration avec dépliage FPU

Une fois que l'on dispose de la version FPU, on peut la modifier afin d'introduire
une amélioration liée à la boucle de calcul. On va réaliser
un **dépliage par 4** du corps de la boucle.

Pour le faire en NASM on peut s'appuyer sur le pré-processeur :

```nasm
%macro fpu_body 1
    fld dword [esi+ecx*4 + %1*4]
    fmul dword [ebp+16]
    fadd dword [edi+ecx*4 + %1*4]
    fst dword [edi+ecx*4 + %1*4]
    faddp st1, st0
%endmacro
```

Puis dans le corps de la boucle, un `%rep` avec `%assign` :

```nasm
    ; [...]
.for_u4:
    cmp ecx, edx
    jge .endfor_u4
    
    %assign k 0
    %rep 4
        fpu_body k
        %assign k k+1
    %endrep
    
    add ecx, 4
    jmp .for_u4
.endfor_u4:
    ; [...]
```

> **Amélioration dépliage par 4**
> En dépliant la boucle FPU par 4, on n'obtient aucune amélioration
> puisque l'exécution reste à 22,96 secondes.

## 13.5 Amélioration Vectorielle (SSE)

Après avoir déplié le corps de la boucle `for` par 4, il est relativement aisé d'écrire
la version utilisant les instructions SSE pour obtenir un code vectorisé. On doit
réaliser les calculs en parallèle dans les registres SSE dans la partie dépliée par 4
de la boucle.

On choisit les conventions suivantes :
- `xmm0` contient les 4 sommes partielles cumulées
- `xmm1` contient $x_i, x_{i+1}, x_{i+2}, x_{i+3}$
- `xmm2` contient $y_i, y_{i+1}, y_{i+2}, y_{i+3}$
- `xmm3` contient quatre fois la valeur de la constante `a` 

Le calcul est simple : multiplier `xmm1` par `xmm3` puis additionner à `xmm2`. On ajoute ensuite `xmm2` dans l'accumulateur `xmm0` avant d'enregistrer `xmm2` de retour dans la mémoire centrale. 

```nasm
saxpy_sse:
    ; ...
    xorps xmm0, xmm0                 ; sum = {0.0, 0.0, 0.0, 0.0}
    movss xmm3, [ebp+16]
    shufps xmm3, xmm3, 0             ; xmm3 = {a, a, a, a}
    
    xor ecx, ecx                     ; i = 0
    mov edx, [ebp+20]                ; edx = size
    and edx, ~3                      ; le plus grand multiple de 4 <= size

.for_u4:
    cmp ecx, edx
    jge .endfor_u4
    
    movaps xmm1, [esi+ecx*4]         ; xmm1 = X
    movaps xmm2, [edi+ecx*4]         ; xmm2 = Y
    mulps xmm1, xmm3                 ; xmm1 = a * X
    addps xmm2, xmm1                 ; xmm2 = a * X + Y
    addps xmm0, xmm2                 ; xmm0 = sum += xmm2
    movaps [edi+ecx*4], xmm2         ; Y = xmm2
    
    add ecx, 4
    jmp .for_u4
.endfor_u4:

    ; Réduction de xmm0 par la FPU dans st0 afin de retourner la somme 
    haddps xmm0, xmm0
    haddps xmm0, xmm0
    sub esp, 4
    movss [esp], xmm0 
    fadd dword [esp]
    add esp, 4
    ; + Gestion de la fin de tableau reliquat non-multiple de 4 ...
    ret
```
> *Listing 13.5.1 – SAXPY modifiée - implantation SSE*

On utilise `haddps` deux fois pour écraser vectoriellement `{A,B,C,D}` en `{A+B, C+D, A+B, C+D}` puis `{A+B+C+D, ...}`.

> **Amélioration SSE**
> En vectorisant le code avec SSE on abaisse le temps d'exécution à **7,93 secondes**, on
> est donc **2,89 fois plus rapide** par rapport à la fonction de référence.

## 13.6 Amélioration Vectorielle (AVX)

La version AVX impose de traiter par paquets de 8 avec des registres de 256 bits (`ymmX`). 

L'utilisation de l'AVX apporte une légère amélioration par rapport au SSE, voire
dans certains cas, une forte amélioration. Le problème résiduel vient de l'extraction de l'accumulateur final vers `st0`. L'instruction `haddps` n'ajoute horizontalement pas les blocs de 128 bits les uns avec les autres dans les registres rhomboïdes AVX de manière croisée, cela nécessite des `vextractf128`.

> **Amélioration AVX**
> En vectorisant le code avec l'AVX on abaisse le temps d'exécution à **5,26
> secondes**, on est donc **4,36 fois plus rapide** par rapport à la fonction de
> référence. Le gain du C Intrinsics en AVX22 va même jusqu'à 4,93s.

## 13.7 Optimisation FMA (Fused Multiply–Add)

Le sigle **FMA** signifie *Fused Multiply–Add* et permet étant donné trois flottants $a, b, c$ de calculer $d = round(a + b \times c)$, c'est-à-dire qu'on n'utilise qu'un seul calcul
d'arrondi matériel. Cela fusionne `fmul` et `fadd`. L'instruction est `vfmadd231ps` (ou les autres formes numériques).

```nasm
saxpy_fma:
    ; ...
    vxorps ymm0, ymm0, ymm0          ; somme nulle
    movss xmm3, [ebp+16]
    shufps xmm3, xmm3, 0
    vinsertf128 ymm3, ymm3, xmm3, 1  ; ymm3 = {a,a,a,a,a,a,a,a}
    ; ...

.for_u8:
    cmp ecx, edx
    jge .endfor_u8

    vmovaps ymm1, [esi+ecx*4]
    vmovaps ymm2, [edi+ecx*4]

    ; ymm2 = (ymm1 * ymm3) + ymm2
    vfmadd231ps ymm2, ymm1, ymm3

    vaddps ymm0, ymm0, ymm2
    vmovaps [edi+ecx*4], ymm2
    add ecx, 8
    jmp .for_u8

.endfor_u8:
    ; Extraction vers FPU
```
> *Listing 13.7.1 – SAXPY version FMA*

## 13.8 Benchmark Récapitulatif

Afin de simplifier et observer, voici les temps réalisés sur 50 000 passages. L'intêrét se porte sur les différentes implémentations Intrinsics du C par rapport au NASM pur.

### 13.8.2 Architectures Anciennes (Avant 2015)

| N° | Méthode | Pentium D 925 | Core 2 Q9300 | Core i7 860 | AMD Phenom X6 | Core i5 3570K | Core i7 4790 |
|---|---|---|---|---|---|---|---|
| 1 | `C Reference` | 97.29 | 75.68 | 23.35 | 32.31 | 23.58 | 19.70 |
| 2 | `asm fpu` | 101.91 | 62.52 | 24.69 | 30.75 | 23.74 | 19.70 |
| 3 | `asm fpu ur4` | 91.77 | 58.92 | 25.36 | 30.47 | 23.64 | 19.68 |
| 4 | `asm sse` | 86.84 | 52.38 | 11.16 | 24.74 | 8.70 | 6.00 |
| 5 | `C sse intrin.` | 84.11 | - | 8.33 | - | 5.64 | 5.42 |
| 6 | `asm avx` | - | - | - | - | 8.21 | 5.42 |
| 11| `asm fma` | - | - | - | - | - | 5.43 |
| - | **Ratio 1 / 5** | **1.15**| - | **2.80** | - | **4.18** | **3.63** |

*TABLE 13.3 – Architectures anciennes (50 000 itérations de SAXPY sur 524 287)*

Sur ces mêmes processeurs (Intel i5 3570k
et i7 4790) passer à l'AVX ou au FMA n'apporte que très peu de choses sur des matrices aussi denses par rapport au SSE intrinsics. Le gain SSE est flagrant.

### 13.8.3 Architectures Modernes (2015 à 2019)

| N° | Méthode | Core i3 6100 | Ryzen 7 1700X | Core i5 7400 | Core i7 8700 | Ryzen 5 3600 | Xeon 4208 |
|---|---|---|---|---|---|---|---|
| 1 | `C Reference` | 22.35 | 33.89 | 22.95 | 17.30 | 31.36 | 25.98 |
| 3 | `asm fpu ur4` | 22.96 | 33.84 | 22.97 | 17.28 | 31.33 | 25.93 |
| 4 | `asm sse` | 9.41 | 5.16 | 7.93 | 5.79 | 4.90 | 9.90 |
| 5 | `C sse intrin.` | 9.02 | 5.38 | 7.79 | 5.74 | 5.04 | 9.40 |
| 6 | `asm avx` | 7.56 | 3.53 | 5.26 | 3.75 | 2.62 | 9.83 |
| 9 | `C avx2 intrin.`| 7.17 | 3.29 | 4.93 | 3.67 | 2.61 | 9.88 |
| 11| `asm fma` | 7.27 | 3.37 | 5.03 | 3.68 | 2.67 | 9.75 |
| - | **Ratio 1 / 5** | **2.47** | **6.29** | **2.94** | **3.01** | **6.22** | **2.76** |
| - | **Ratio 1 / 11**| **3.07** | **10.05**| **4.56** | **4.70** | **11.74**| **2.66** |

*TABLE 13.4 – Architectures modernes : temps d'exécution (50 000 itérations de SAXPY)*

Pour les architectures modernes, l'utilisation de l'AVX par
rapport au SSE apporte un gain très substantiel. L'utilisation des instructions FMA
n'apporte toujours que peu de choses mais l'AVX se prouve extrêmement efficace.
On note que les processeurs AMD ont une FPU non vectorielle archaïque peu performante, mais leurs unités AVX rattrapent la danse.

### 13.8.4 Architectures Récentes (2020+)

| Méthode | Core i7 10850H | Ryzen 5 5600G | Core i5 12400F | Ryzen 5 9600X |
|---|---|---|---|---|
| 1 `C Reference` | 16.05 | 38.86 | 18.50 | 29.19 |
| 3 `asm fpu ur4` | 16.14 | 39.95 | 18.62 | 29.09 |
| 5 `C sse intrin.` | 5.35 | 5.31 | 4.60 | 2.54 |
| 6 `asm avx` | 3.79 | 3.75 | 4.41 | 1.60 |
| 9 `C avx2 intrin.` | 3.62 | 3.26 | 4.79 | 1.54 |
| 11 `asm fma` | 3.66 | 3.30 | 4.40 | 1.58 |
| **Gain vs AVX Intrin.**| **~ 4.4x** | **~ 12.0x** | **~ 3.9x** | **~ 19.0x** |

*TABLE 13.5 – Architectures récentes : temps d'exécution (SAXPY sur Ryzen série 9 / Intel Gen 12+)*

Pour les architectures récentes (Table 13.5), la version FMA3 est la plus
efficace sans contestation mais elle gagne très peu contre de l'AVX2 intrinsics bien instancié. L'AMD Ryzen 5 9600X exécute les 50 000 appels ultra-massifs en moins d'1.54 secondes en AVX2, un temps astronomique.

> *Note sur l'AMD Ryzen 5 9600X* : Sans le flag de compilation `-ffast-math`, il tombe à 97 secondes à cause du respect strict de la norme flottante IEEE754 lors des arrrondissement GCC.  Le compilateur va casser le FMA pour obéir à `-std=c++11`.

## 13.9 Bilan

Nous avons vu dans ce chapitre comment utiliser les instructions de la FPU ou purement C pour
un calcul matriciel géant d'addition et factorisation `y_i += a * x_i`.

On note que c'est le passage à la vectorisation qui apporte une
amélioration fondamentale du temps de calcul (divisé par 5 sur Intel, divisé par plus de 10 sur AMD Ryzen qui accusent d'un moteur FPU obsolète). L'utilisation de FMA apporte un léger bonus additionel grâce à l'incorporation de l'addition/multiplication au niveau d'un seul tic matériel.

## 13.10 Exercices

**Exercice 47** - À titre d'exercice, vous pouvez réaliser un dépliage de la version AVX en assembleur par 2 puis par 4 et intégrer les sous-programmes au code afin de comparer l'utilité du unlooping avec des vecteurs ultra larges.

**Exercice 48** - Utiliser l'instruction `vpbroadcastd` afin de charger huit fois le registre scalaire `a` dans `ymm3` en une seule fois dans la fonction FMA `saxpy_fma`.
