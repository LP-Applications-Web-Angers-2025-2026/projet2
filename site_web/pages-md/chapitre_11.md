# Chapitre 11 : Étude de cas (Produit de matrices)

## 11.1 Introduction

Nous abordons dans ce chapitre le problème du produit de matrices qui est un
problème classique en informatique. L'intérêt de ce problème est que la formule
mathématique qui donne la manière de calculer le produit est totalement inefficace
si elle est implantée directement car elle génère beaucoup de défauts de cache pour
certaines dimensions de la matrice. En conséquence, sur des architectures anciennes
ne possèdant qu'un cache L1 et L2, le temps d'exécution est anormalement plus
long.

> **Important** : Les architectures multicoeurs disposant d'un cache L3 se révèlent en
> général moins sensibles à ces variations.

On rappelle qu'une matrice est un tableau à deux dimensions de `n` lignes et
`p` colonnes de réels. On notera `A(n,p)` la matrice `A` composée de `n` lignes et `p`
colonnes. Le produit d'une matrice `A` avec une matrice `B` n'est possible que si le
nombre de lignes de `B` est égal au nombre de colonnes de `A`. Le résultat est une
matrice `C` dont le nombre de lignes est celles de `A`, et le nombre
de colonnes celles de `B`. En d'autres termes, on a :

`C(n,q) = A(n,p) × B(p,q)`

On note $c_i^j$ le coefficient de la matrice `C` en ligne `i` colonne `j`, dont la formule
de calcul est donnée par la somme des produits de la ligne `i` de `A` par la colonne `j`
de `B` :

$c_i^j = \sum_{k=1}^p a_i^k \times b_k^j$

Afin de simplifier la compréhension des calculs nous allons nous cantonner
à des matrices carrées pour lesquelles le nombre de lignes est égal au nombre
de colonnes, soit `n = p = q` et nous appelerons donc dimension (ou taille) de la
matrice carrée cette quantité qui sera également identifiée par la variable `dim` dans
les sources C.

## 11.2 Stockage d'une matrice

On dispose de deux stratégies de stockage des matrices :

- par lignes (*Row Major Order*), c'est le cas du langage C et c'est la façon la plus
  naturelle de le faire
- par colonnes (*Column Major Order*), c'est le cas du langage Fortran

Nous allons bien évidemment nous focaliser sur le langage C. Voyons sur un
exemple comment définir une matrice. Soient les variables entières non signées
`rows = 10`, qui correspond au nombre de lignes d'une matrice, et `cols = 99` qui
est son nombre de colonnes. Dès lors, nous avons en langage C quatre alternatives
pour créer une matrice :

- la première, dite **statique**, consiste à déclarer un tableau à deux dimensions :
  ```cpp
  typedef float f32;
  f32 M1[rows][cols];
  ```

- la seconde, **statique également**, utilise un tableau à une dimension dont la
  taille est le produit `rows * cols` :
  ```cpp
  f32 M2[rows * cols];
  ```

- la troisième, **dynamique**, permet de créer un tableau à deux dimensions en
  utilisant un premier tableau de pointeurs sur les lignes qui sont ensuite créées
  en allouant le nombre de colonnes nécessaires :
  ```cpp
  f32** M3;
  M3 = new f32*[rows];
  for (u32 i = 0; i < rows; i++) {
      M3[i] = new f32[cols];
  }
  ```

- enfin la quatrième, **dynamique également**, permet de créer un tableau à une
  dimension :
  ```cpp
  f32* M4;
  M4 = new f32[rows * cols];
  ```

L'accès aux tableaux à deux dimensions pour la ligne `i` et la colonne `j` s'écrit
naturellement `M1[i][j]` alors que pour les tableaux à une dimension il faut utiliser
`M2[i * cols + j]`.

Généralement, lorsqu'on travaille avec des matrices dont on ne connaît pas les
dimensions *a priori*, on utilise une création dynamique. De plus, afin d'améliorer
l'efficacité des traitements, on utilise une représentation avec une seule dimension
car dans ce cas les données sont contigües, c'est à dire que les coefficients sont à des
adresses consécutives en mémoire. On utilisera donc l'alternative
qui correspond à la création de la matrice `M4`.

Afin de créer les matrices de manière dynamique, plutôt que d'utiliser `malloc()`
en C, ou `new` en C++, on utilisera `_mm_malloc()` disponible en incluant le fichier
`<xmmintrin.h>` et qui permet d'aligner les données. On libère
l'espace alloué en utilisant la fonction `_mm_free()` :

```cpp
size_t size = rows * cols * sizeof(f32);
f32* A = (f32*)_mm_malloc(size, CPU_MEMORY_ALIGNMENT);
// ...
_mm_free(A);
```

La fonction `_mm_malloc()` possède deux paramètres : le premier est le nombre
d'octets à allouer et le second, figuré ici par la variable `CPU_MEMORY_ALIGNMENT`,
définit l'alignement. Il doit être égal à 16 pour le SSE ou 32 pour l'AVX/AVX2 et
64 pour l'AVX-512. Si les données sont alignées, leur chargement est normalement
plus rapide, on peut alors utiliser les instructions comme `movdqa` plutôt que `movdqu`
lors de la vectorisation.

## 11.3 Fonction de référence

La fonction à implanter est donnée au *Listing 11.3.1*. Elle comporte quatre paramètres
qui sont les adresses des matrices `A`, `B` et `C` ainsi que la dimension des
matrices `dim`. Il s'agit de l'implantation directe de la formule mathématique.

```cpp
#define a(y,x) A[(y)*dim+(x)]
#define b(y,x) B[(y)*dim+(x)]
#define c(y,x) C[(y)*dim+(x)]

void mp_reference(f32* A, f32* B, f32* C, u32 dim) {
    for (u32 i = 0; i < dim; i++) {
        for (u32 j = 0; j < dim; j++) {
            f32 sum = 0.0f;
            for (u32 k = 0; k < dim; k++) {
                sum += a(i,k) * b(k,j);
            }
            c(i,j) = sum;
        }
    }
}
```
> *Listing 11.3.1 – Produit de matrice, fonction de référence*

Afin de simplifier l'écriture, on a créé trois macro instructions `a()`, `b()` et `c()` qui
font référence aux coefficients $a_i^j$, $b_i^j$ et $c_i^j$. Plutôt que d'écrire `A[i*dim+j]`, 
on préfère utiliser `a(i,j)` plus lisible.

## 11.4 Défauts de cache et inefficacité (Complexité O(n³))

Cette implantation de référence possède une compléxité en $O(n^3)$ étant donné
que l'on a trois boucles `for` imbriquées de taille `dim`.
On observe pour des processeurs, et en particulier sur un modèle Intel Celeron N3050, que pour certaines tailles de
matrices, le temps de calcul est bien plus important que la normale.

| Architecture | AMD Ryzen 7 1700X | AMD Ryzen 5 3600 | Intel Core i5 7400 | Intel Core i7 8700 | Intel Pentium E5300 |
|---|---|---|---|---|---|
| **Cache L2 (ko)** | 512 | 512 | 256 | 256 | 32 |
| **Cache L3 (ko)** | 8192 | 16384 | 6144 | 12288 | 2048 |
| **1023** | 1.49 | 1.34 | 1.33 | 0.95 | 7.26 |
| **1024** | 6.35 | 5.98 | 2.28 | 1.53 | 25.39 |
| **1025** | 1.52 | 1.37 | 1.26 | 0.95 | 7.24 |
| **1279** | 2.95 | 2.48 | 3.00 | 2.49 | 14.56 |
| **1280** | 2.98 | 2.52 | 3.28 | 2.43 | 28.46 |
| **1281** | 2.98 | 2.47 | 3.05 | 2.26 | 14.80 |
| **2047** | 20.14 | 15.34 | 37.48 | 28.48 | 62.71 |
| **2048** | 53.88 | 42.21 | 51.84 | 44.24 | 227.36 |
| **2049** | 20.26 | 15.17 | 37.79 | 28.59 | 63.07 |

*TABLE 11.1 – Temps d'exécution en secondes de la méthode de référence du produit de matrice pour différentes architectures*

Ce phénomène pour les puissances de 2 (1024, 2048...) peut être expliqué par de **nombreux défauts de cache (Cache misses)**. Les
matrices étant de grande taille elles ne tiennent pas dans le cache L1 ou L2. Un autre facteur important de ralentissement est l'accès aux coefficients de
la matrice `B`. En effet, on accède la matrice `A` par ligne, ce qui est efficace, car
quand on charge $a_i^k$, les données suivantes comme $a_i^{k+1}$ à $a_i^{k+7}$ sont déjà dans le
cache. Par contre l'accès aux coefficients de la matrice `B` est pénalisant car lorsque
l'on charge $b_k^j$, le coefficient suivant $b_{k+1}^j$ se trouve `dim * 4` octets plus loin en
mémoire et ne sera donc probablement pas dans le cache.

## 11.5 Profiling avec `perf` sous Linux

Il existe sous Linux l'outil `perf` qui lit et collecte les données des *Performance Monitoring Units (PMUs)* des processeurs.

```bash
sudo apt install linux-tools-common linux-tools-generic
sudo perf stat -e task-clock,cycles,instructions,cache-references,cache-misses build/bin/asm_matprod_32.exe -s 1024 -m 1
```

Exemple de retour `perf stat` (intel Celeron N3050, dim = 1024) :
```text
  69975,730658 task-clock (msec)         #    0,982 CPUs utilized
 150 326 657 774 cycles                  #    2,148 GHz                    (49,97%)
 5 858 594 620 instructions              #    0,04  insn per cycle         (74,96%)
 2 535 065 211 cache-references          #   36,228 M/sec                  (75,01%)
 2 319 680 000 cache-misses              #   91,504 % of all cache refs    (75,02%)
```
Le nombre de défauts de cache (*cache-misses*) est de l'ordre de 91,5%
pour un temps d'exécution de 71,24 s alors que pour `dim = 1023` et `dim = 1025`,
on obtient de l'ordre de 3% de défauts de cache pour un temps d'exécution
de 17 à 18 s.

En utilisant `perf record` et `perf report`, on peut voir que la quasi-totalité (`97%`) du problème vient de la boucle la plus interne de `mp_reference`.
 `perf annotate` permet même de savoir que la ligne C incriminée est `sum += a(i,k) * b(k,j);`.

## 11.6 Amélioration : Inversion des boucles j et k

Une première amélioration très efficace consiste à **inverser les boucles j et k**.
Dans ce cas la formule de calcul doit être modifiée, on doit utiliser `c(i,j)` lors
de chaque calcul. La matrice `C` devra dans ce cas être initialisée avec des `0` avant de
réaliser le produit.

```cpp
void mp_inv_jk(f32* A, f32* B, f32* C, u32 dim) {
    for (u32 i = 0; i < dim; i++) {
        for (u32 k = 0; k < dim; k++) {
            for (u32 j = 0; j < dim; j++) {
                c(i,j) += a(i,k) * b(k,j);
            }
        }
    }
}
```
> *Listing 11.6.1 – Produit de matrice, Inversion de boucles j et k*

On observe au *Listing 11.6.1* que `j` étant maintenant la boucle la plus interne :
`a(i,k)` reste constant (pour le scope de `k`).
Les coefficients `b(k,j)` et `c(i,j)` sont accédés consécutivement (pas d'allers-retours brutaux en mémoire). On va donc environ 29 fois plus vite sur de grosses configurations.

## 11.7 Amélioration avec SSE (sur l'inversion j, k)

Nous allons créer une version vectorisée en SSE de la variante de l'inversion de
boucle `j,k` en considérant, pour simplifier les choses, que `dim` est multiple de 4. La
boucle la plus interne sera donc dépliée en 4 :

```cpp
for (u32 j = 0; j < dim; j += 4) {
    c(i, j+0) += a(i,k) * b(k, j+0);
    c(i, j+1) += a(i,k) * b(k, j+1);
    c(i, j+2) += a(i,k) * b(k, j+2);
    c(i, j+3) += a(i,k) * b(k, j+3);
}
```

Le coefficient `a(i,k)`, comme indiqué précédemment, reste constant, on le
chargera dans `xmm0`. On utilisera `xmm1` pour stocker `b(k, j:j+3)` et `xmm2` pour
stocker `c(i, j:j+3)`.

*Extrait du code NASM pour la boucle j* :
```nasm
for_j:
    cmp ecx, edx                 ; fin de boucle si j >= dim
    jge endfor_j
    movdqu xmm1, [esi+ecx*4]     ; charge 4 floats b(k, j:j+3)
    movdqu xmm2, [edi+ecx*4]     ; charge 4 floats c(i, j:j+3)
    mulps xmm1, xmm0             ; multiplie b par a(i,k) qui est diffusé dans xmm0
    addps xmm2, xmm1             ; on accumule dans xmm2
    movdqu [edi+ecx*4], xmm2     ; stocke en retour dans C
    add ecx, 4                   ; j += 4
    jmp for_j
endfor_j:
```

En inversant les boucles `j` et `k` et en combinant avec la technologie vectorielle
SSE en assembleur, on va environ 19 fois plus vite que l'implémentation de base C.

## 11.8 Amélioration : Le tuilage (Tiling / Blocage)

Une autre technique d'amélioration, évoquée Chapitre 5, consiste à réaliser le
tuilage (ou *tiling*) en ne travaillant que sur une petite partie des données. Dans
ce cas les matrices sont découpées en carrés qui correspondent à de petites zones
mémoires ce qui permet de les charger dans le cache L1 et les réutiliser.

### 11.8.1 Tuilage 4×4 avec SSE Intrinsics

On peut concevoir un sous-programme de calcul du produit de deux sous-matrices
`A(4,4)` par `B(4,4)` en chargeant les données dans les registres SSE intégralement.

```cpp
void mp_tile_4x4(float* A, float* B, float* C, u32 dim) {
    __m128 row1 = _mm_load_ps(&B[0]);
    __m128 row2 = _mm_load_ps(&B[dim]);
    __m128 row3 = _mm_load_ps(&B[2*dim]);
    __m128 row4 = _mm_load_ps(&B[3*dim]);

    for (int i=0; i<4; i++) {
        __m128 dup1 = _mm_set1_ps(A[dim*i + 0]);
        __m128 dup2 = _mm_set1_ps(A[dim*i + 1]);
        __m128 dup3 = _mm_set1_ps(A[dim*i + 2]);
        __m128 dup4 = _mm_set1_ps(A[dim*i + 3]);

        __m128 sum1 = _mm_add_ps(_mm_mul_ps(dup1, row1), _mm_mul_ps(dup2, row2));
        __m128 sum2 = _mm_add_ps(_mm_mul_ps(dup3, row3), _mm_mul_ps(dup4, row4));
        __m128 row  = _mm_add_ps(sum1, sum2);

        __m128 old_row = _mm_load_ps(&C[dim*i]);
        row = _mm_add_ps(row, old_row);
        _mm_store_ps(&C[dim*i], row);
    }
}
```
> *Listing 11.8.1 – Produit de matrice - Tuilage 4x4*

En utilisant le tuilage `4x4` on met environ 8 fois moins de temps. Ce n'est en fait pas très efficace par rapport à `j,k`.

### 11.8.2 Tuilage `b × b` de manière générale (Facteur de Blocage)

On peut réaliser le tuilage de plusieurs manières différentes, qui reviennent à découper le matrix multiply massif en 6 sous-boucles dont `b` est le BLOCK_DIM :

```cpp
void mp_tile_bxb_v4(f32* A, f32* B, f32* C, u32 size) {
    for (u32 i = 0; i < size; i += BLOCK_DIM) {
        for (u32 j = 0; j < size; j += BLOCK_DIM) {
            for (u32 k = 0; k < size; k += BLOCK_DIM) {
                // À l'intérieur du bloc : Inversion j,k optimisée
                for (u32 ib = i; ib < min(i + BLOCK_DIM, size); ib++) {
                    for (u32 kb = k; kb < min(k + BLOCK_DIM, size); kb++) {
                        f32* aib = a(ib, 0); // Pour optimisation adresse
                        f32* cib = c(ib, 0);
                        for (u32 jb = j; jb < min(j + BLOCK_DIM, size); jb++) {
                            cib[jb] += aib[kb] * b(kb, jb);
                        }
                    }
                }
            }
        }
    }
}
```
> *Listing 11.8.2 – Produit de matrice - Tuilage (version 4)*

Cette valeur de `BLOCK_DIM` (facteur de tuilage) doit être choisie (typ. 16, 32, 64) en fonction du processeur. Plus on augmente le facteur `b`, plus on augmente la présence du cache jusqu'à atteindre un sweetspot qui le redimininue (lorsque la tuile excède la taille du cache du CPU).

| Facteur | Temps | Facteur | Temps | Facteur | Temps |
|---|---|---|---|---|---|
| 8 | 5.64 | 88 | 0.74 | 948 | 0.62 |
| 16 | 2.39 | 96 | 0.75 | 960 | 0.55 |
| 32 | 1.25 | 112 | 0.72 | 976 | 0.53 |
| 64 | 0.83 | 128 | 0.72 | 1000 | 0.52 |
| 80 | 0.74 | 160 | 0.70 | 1024 | 0.54 |

*TABLE 11.3 – Temps d'exécution en secondes sur AMD Ryzen 5 3600 (Matrice 2048×2048) en fonction de `b`.*

Sur cet AMD Ryzen 5, avec un facteur de `1000/1008`, le temps minimum atteint est de 0,52 secondes. (Soit un **gain de vitesse de × 84** contre la référence `O(n^3)` de base en C !).

## 11.9 Benchmark Récapitulatif

Nous allons examiner les résultats obtenus (*Matrice 2048x2048 en 32 bits*) pour ces méthodes :
1. `mp_reference` (base en C)
2. `mp_asm_fpu` (Base FPU)
3. `mp_inv_jk_O2` (inversion avec GCC -O2)
4. `mp_inv_jk` (inversion avec GCC -O3 unroll)
5. `mp_inv_jk_sse` (inversion SSE manuel)
6. `mp_inv_jk_avx` (inversion AVX manuel)
7. `mp_tile_4x4`
8. `mp_tile_bxb_v1 → v4` avec `b=64`.

[BENCHMARK:asm_matprod_32]

*(Note: la compilation `-std=c++11` modifie fortement les optimisations en virgule flottante. L'emploi du flag `-ffast-math` libère GCC de ces restrictions FPU).*

## 11.10 Bilan

Comme le montre cette étude de cas, l'ordre dans lequel on accède les
données possède une grande influence sur le temps de calcul et en particulier
pour le produit de matrices.

- La référence pure (bien que mathématiquement triviale) génère trop de cache misses.
- S'aligner sur la spatialité de la mémoire en inversant simplement les boucles `j` et `k` apporte la majorité des performances (`10x à 30x`).
- Découper la mémoire en carrés optimisés par le blocage (`Tile BxB`) maximise la probabilité d'utiliser le cache ultra-rapide L1 sans le remplacer avant que l'opération ne finisse, menant à une victoire totale `(gain 84x face à la référence sur de grosses matrices)`.

## 11.11 Exercices

**Exercice 45** – À titre d'exercice, vous pouvez réaliser un dépliage de la boucle inversée en SSE vectorisée par 2 puis par 4, et l'ajouter aux scripts de tests de ce chapitre.

**Exercice 46** – Déterminez en scripting le facteur de blocage (`BLOCK_DIM` "b") qui trouve le meilleur sweetspot proportionnel au cache L1 / L2 de votre machine en fonction des matrices. 
Par ex: Intel i5 7400, le *b* parfait pour une matrice 4096 est `b = 512`. Quel est-il sur votre CPU en moyenne multi-passes ?
