# Chapitre 14 : Étude de cas (Fonction de Fitch)

## 14.1 Introduction

Ce chapitre traite de l'implantation de la fonction de *Fitch* dans le cadre de la
résolution du problème de la recherche du Maximum de Parcimonie en Bioinfor-
matique. Il permet d'introduire plusieurs instructions assembleur liées au calcul
vectoriel avec unités SSE sur les entiers.

Le problème de recherche du Maximum de Parcimonie consiste étant donné un
ensemble de $n$ séquences d'ADN de même longueur $k$ à trouver un arbre binaire
dont le coût est minimum étant donné un critère d'optimisation.
Pour calculer ce coût qui correspond au nombre de mutations entre séquences,
chaque feuille de l'arbre contient une des séquences initiale du problème et les
noeuds internes contiennent des séquences dites *hypothétiques* qui sont calculées en
utilisant la fonction de Fitch. Celle-ci sera notre fonction de référence à améliorer
et pour laquelle toute mutation engendre un coût d'une unité.

Le coût total d'un arbre est égal à la somme des coûts de chaque séquence
hypothétique. Pour le calculer, on part de la racine et on descend jusqu'aux feuilles,
puis on remonte vers la racine en calculant les séquences hypothétiques tout en
sommant leurs coûts.

Prenons un exemple avec les quatre séquences d'ADN suivantes :
- $S1$ = AAAAA
- $S2$ = AAAAC
- $S3$ = CCCTT
- $S4$ = CCCAT

On rappelle que les acides nucléiques qui composent les séquences d'ADN sont
l'adénine (A), la cytosine (C), la guanine (G) et la thymine (T). La séquence $S1$ est
donc composée de 5 adénines, $S2$ de quatre adénines suivies d'une cytosine, etc.

Le premier arbre, qui dans la notation Newick est $T1 = ((S1,S3),(S2,S4))$,
possède un coût total de $4 + 5 + 0 = 9$. En effet, lorsque l'on calcule la séquence
hypothétique qui résulte de $(S1,S3)$, on a cinq mutations : trois modifications où A
est muté en C et deux où A subit une mutation en T. Sur la branche de droite qui
correspond à séquence hypothétique qui résulte de $(S2,S4)$, on a quatre mutations :
trois modifications où A est muté en C, puis A en regard de A, donc aucune mutation,
et enfin, une mutation de C en T. Au niveau de la racine, on n'aura aucune mutation
car on a à chaque fois des sous-ensembles de caractères communs. On trouve trois
fois le sous-ensemble `{A,C}` en regard de lui-même, puis `{A,T}` en regard de `{A}`
dont l'intersection est `{A}` et enfin `{A,T}` en regard de `{C,T}` dont l'intersection
est `{T}`.

Le second arbre $T2 = ((S1,S2),(S3,S4))$ possède un coût inférieur à $T1$, égal à
$4 + 1 + 1 = 6$. C'est donc $T2$ qui est le plus *parcimonieux*, c'est à dire qui possède le
moins de mutations et qui doit être gardé comme solution au problème.

Le problème de recherche de l'arbre de parcimonie maximum est un problème
d'optimisation combinatoire et est **NP-Complet** ce qui signifie, en simplifiant à
outrance, qu'il n'existe pas d'algorithme qui nous permette de trouver la solution
autre qu'une recherche exhaustive. Malheureusement, le nombre d'arbres binaires à examiner est exponentiel, par
exemple pour 50 séquences, il y a $2,8 \times 10^{74}$ arbres possibles. On ne peut donc
envisager une recherche exhaustive et il faut faire appel à des métaheuristiques qui
sont des techniques de recherche liées à la résolution de ce genre de problème.

## 14.2 Fonction à implanter (Référence en C)

La fonction à implanter est donnée *Listing 14.2.1*. Elle comporte quatre para-
mètres qui sont les séquences en entrée `x` et `y`, la séquence hypothétique `z` qui est
calculée par la fonction ainsi que la longueur des séquences (`size`). En retour on
donne le nombre de mutations trouvées.

```c
u32 fitch_ref(u8* x, u8* y, u8* z, u32 size) {
    u32 mutations = 0;
    for (u32 i = 0; i < size; i++) {
        z[i] = x[i] & y[i];
        if (z[i] == 0) {
            z[i] = x[i] | y[i];
            ++mutations;
        }
    }
    return mutations;
}
```
> *Listing 14.2.1 – Maximum de Parcimonie fonction de référence en C*

Les séquences sont modélisées sous forme de tableaux d'octets et pour coder
efficacement la possibilité d'avoir des combinaisons d'acides nucléiques comme 'A
ou C', 'A ou C ou T', on utilise des puissances de 2 :
- A = $2^0 = 1$
- C = $2^1 = 2$
- G = $2^2 = 4$
- T = $2^3 = 8$

Ainsi 'A ou C' qui en notation ensembliste se note $\{A\} \cup \{C\}$ (ou encore $\{A,C\}$)
est codé par $2^0 + 2^1 = 1 + 2 = 3$. La fonction de Fitch vérifie que pour chacun des
sous-ensembles de caractères en regard des deux séquences en entrée, il existe
un caractère ou un sous-ensemble commun en réalisant une **intersection** des sous-
ensembles de caractères de `x[i]` avec `y[i]`. Si cet ensemble est vide (égal à `0`) c'est qu'il
n'existe aucun caractère en commun : on a une mutation et il faut alors prendre
l'**union** des ensembles de caractères (`x[i] | y[i]`).

## 14.3 Implantation Assembleur de base x86 (32 bits)

La difficulté de l'implantation réside dans le fait que l'on ne dispose en 32 bits
que de 6 registres généraux et que la fonction fait apparaître 6 variables :
- les séquences $x,y,z$,
- la taille $size$ des séquences,
- la variable de boucle $i$,
- le nombre de $mutations$.

Cependant il faudra réaliser des calculs comme `x[i] & y[i]`, il est donc néces-
saire de disposer d'au minimum un registre pour les calculs.
L'association variables / registres est celle de la Table 14.1. 

| Cste/Param/Var | Type | Paramètre | Registre | Description |
|---|---|---|---|---|
| `x` | | `[ebp+8]` | `esi` | séquence `x` |
| `y` | | `[ebp+12]` | `edi` | séquence `y` |
| `z` | | `[ebp+16]` | `ebx` | séquence `z` |
| `size` | | `[ebp+20]` | pile | taille des séquences |
| `i` | | | `ecx`| variable de boucle |
| `mutations` | `u32`| | `eax` | nombre de mutations |
| *calculs* | | | `edx` | tampon temporaire |

*TABLE 14.1 – Association entre variables et registres pour la fonction de référence de Fitch*

```nasm
fitch_asm:
    push ebp                        ; entrée dans la fonction
    mov ebp, esp
    mov eax, [ebp+20]
    test eax, eax                   ; si size == 0
    jz .end
    
    push ebx                        ; sauvegarde des registres
    push esi
    push edi
    
    ; chargement des paramètres
    mov esi, [ebp+8]
    mov edi, [ebp+12]
    mov ebx, [ebp+16]
    xor eax, eax                    ; mutations = 0
    xor ecx, ecx                    ; i = 0

.for:
    cmp ecx, [ebp+20]
    jge .endfor
    
    mov dl, [esi+ecx]               ; dl = x[i]
    and dl, [edi+ecx]               ; dl = x[i] & y[i]
    jnz .endif                      ; si dl != 0 alors pas de mutation
    
    mov dl, [esi+ecx]
    or dl, [edi+ecx]                ; dl = x[i] | y[i]
    inc eax                         ; ++mutations
.endif:
    mov [ebx+ecx], dl               ; z[i] = dl
    inc ecx                         ; ++i
    jmp .for

.endfor:
    pop edi                         ; restauration des registres
    pop esi
    pop ebx
.end:
    mov esp, ebp                    ; sortie de fonction
    pop ebp
    ret
```
> *Listing 14.3.1 – Maximum de Parcimonie fonction de référence en assembleur*

> **Temps de référence**
> Pour l'implantation assembleur ci-dessus `(50 000 tics sur une matrice de 524 287)`, l'exécution dure environ 84,37 secondes sur un processeur Intel Core i7.

## 14.4 Suppression du branchement (Élimination du IF)

L'implantation précédente se révèle inefficace pour une simple raison que
nous avons déjà évoquée. La présence d'une conditionnelle (`if`) non prédictible
à l'intérieur d'une boucle (`for`). Si on a choisi le mauvais chemin d'exécution il
faudra vider le *pipeline* ce qui nous ralentit.

Afin d'améliorer l'efficacité du traitement il est nécessaire de supprimer le branchement conditionnel.
On peut, dans ce cas précis, choisir d'utiliser des instructions comme `setCC` ou
`cmovCC` qui s'exécutent en fonction de la condition, modélisée ici par les deux lettres
`CC`.

On modifie l'association variables afin de libérer `eax`, `ebx` et `edx`.
On charge `x[i]` en partie basse de `eax` et `ebx` puis `y[i]` en partie basse de `edx`.

On calcule ensuite :
- `x[i] | y[i]` dans `ebx`
- `x[i] & y[i]` dans `eax`

L'instruction `and eax, edx` met à jour le registre de *flags*, dès lors on peut utiliser
deux instructions conditionnelles :
- `setz dl` (donc `edx`) : fixe `dl` à $1$ si `x[i] & y[i] == 0`, sinon $0$.
- `cmovz eax, ebx` : remonte `x[i] | y[i]` vers `eax` si le flag `Z` est actif.

Ces deux instructions réalisent la conditionnelle `if` de la fonction de référence sans introduire la moindre notion de prédiction de pile.

```nasm
.for:
    mov esi, [ebp+8]
    cmp ecx, [ebp+20]
    jge .endfor
    
    movzx edx, byte [edi+ecx]       ; dl = y[i]
    movzx eax, byte [esi+ecx]       ; al = x[i]
    mov ebx, eax                    ; bl = x[i]
    
    or ebx, edx                     ; bl = x[i] | y[i]
    and eax, edx                    ; al = x[i] & y[i]
    
    setz dl                         ; dl = (al == 0) ? 1 : 0
    cmovz eax, ebx                  ; eax = (al == 0) ? ebx : eax
    
    add [ebp-4], edx                ; mutations += edx
    mov [esi+ecx], al               ; z[i] = al
    add ecx, 1                      ; ++i
    jmp .for
```
> *Listing 14.4.1 – Maximum de Parcimonie fonction de référence sans if*

> **Amélioration sans if**
> En éliminant le `if` on ne met plus que **34,68 secondes**, on va donc environ **2,43 fois plus vite** qu'avec les sauts non-prédictibles.

**Optimisation supplémentaire** (`Listing 14.5.1`) : En accédant aux pointeurs directement sur `esp` (sans `ebp`), on libère 7 registres. Remplacer les accès mémoire pour `mutations` par des registres pur diminue le temps jusqu'à **5,24 secondes**, soit **16 fois plus vite** que la référence.

## 14.6 Amélioration Vectorielle (SSE2 et SSE4.1)

L'implantation de la fonction de référence en utilisant des instructions SSE est
relativement simple. On traitera
16 octets en parallèle ce qui apporte un gain substantiel. Pour réaliser le OU-binaire, on utilisera l'instruction `por` (*Parallel OR*) et
pour le ET-binaire, on dispose de l'instruction `pand` (*Parallel AND*).

La difficulté repose sur l'extraction de l'information liée au résultat du ET-binaire (le *if == 0*).
On dispose heureusement pour cela de deux instructions vectorielles :
- `pcmpeqb xmm1, xmm2` (*Parallel CoMPare EQual Bytes*) qui compare les éléments octet par octet. Si `xmm1.b[i] == xmm2.b[i]` alors
  `xmm1.b[i] = 0xFF`, sinon `0x00`.
- `pmovmskb eax, xmm1` (*Parallel MOVe MaSK of Bytes*) est utilisée pour récupérer
  le résultat de la comparaison précédente, on extrait le bit de poids fort de
  chaque octet de `xmm1` et on le place dans un registre non-vectoriel 32 bits (`eax`).

```nasm
.for_u16:
    movdqa xmm0, [esi+ecx]           ; Chargement x
    movdqa xmm2, [edi+ecx]           ; Chargement y
    
    movdqa xmm1, xmm0                ; xmm1 = x
    pand xmm0, xmm2                  ; xmm0 = x & y
    por xmm1, xmm2                   ; xmm1 = x | y
    movdqa xmm4, xmm0                ; xmm4 = x & y (tampon pour comparer à 0)
    
    pcmpeqb xmm4, xmm6               ; xmm6 = [0]*16. Fait xmm4 = 0xFF si vide.
    pmovmskb ebp, xmm4               ; Le masque vers ebp
    popcnt ebp, ebp                  ; Compter le nombre de bit à 1 (= mutations !)
    add eax, ebp                     ; Ajout aux mutations totales
    
    pand xmm1, xmm4                  ; Conserver le OU là où c'était vide
    pandn xmm4, xmm0                 ; Conserver le ET de l'autre côté
    por xmm0, xmm1                   ; xmm0 contient maintenant le Z définitif

    movdqa [ebx+ecx], xmm0           ; z[i:i+15] = xmm0
    add ecx, 16
    dec edx                          ; boucle sur size / 16
    jnz .for_u16
```
> *Listing 14.6.1 – Maximum de Parcimonie version SSE2*

> **Amélioration SSE2**
> On abaisse le temps d'exécution à **2,70 secondes**, soit un **facteur d'amélioration de ~31**.

Sur les plateformes plus récentes, le **SSE4.1** a introduit l'instruction `pblendvb` (*Variable Blend Packed Bytes*). Elle permet de sélectionner des octets de chacune de ses deux opérandes suivant
le masque de sélection contenu dans le registre `xmm0` de base.

```nasm
    ; ... (pand et por calculés dans xmm1 et xmm2)
    pcmpeqb xmm1, xmm0               ; xmm0 est 0. Si le ET est vide, octet à 0xFF
    pmovmskb ebp, xmm1
    popcnt ebp, ebp
    add eax, ebp                     ; Gestion des mutations inchangée
    pblendvb xmm1, xmm2, xmm0        ; z[i:i+15] est calculé en 1 tic matériel !
    ; ...
```
> *Listing 14.7.1 – Extrait de Parcimonie version SSE4.1* (2.60 secondes).

## 14.8/14.11 Amélioration Vectorielle AVX2 et AVX512

La version AVX utilise les registres `ymm` qui ont une taille de 32 octets (soit 256
bits). Le code est similaire à celui de la version SSE 4.1 mais traite 32 acides nucléiques à la fois.

On trouvera sur AVX512 la capacité de traiter 64 octets avec les registres `zmm` (512 bits) : 
```nasm
    ; (Exemple partiel AVX512 avec registres k1/k2)
    vpcmpeqb k1, zmm0, zmm1          ; Comparaison stockée dans le registre de masque k
    vmovdqu8 zmm1 {k1}, zmm2         ; Remplacement conditionnel ultra-rapide
    ; Extraction du masque k1 vers des registres généraux pour faire les popcnt
```

> **Amélioration AVX2 et AVX512**
> Le temps d'exécution est ramené à 1,35 secondes en AVX2 et 0,42 secondes en AVX512 natif (soit une divisibilité de performance de ×200 par rapport au code C).

## 14.10 Variante *C Intrinsics* : Directives Compilateur

La version *intrinsics* en AVX2 nécessite, pour être efficacement traduite par le
compilateur, de fournir quelques informations à ce dernier. Notamment le mot clé `__restrict__`, qui indique que pour la durée de vie du pointeur, il n'y aura pas d'aliasing (personne d'autre ne modifiera cette plage en même temps).

```c
#include <immintrin.h>

u32 fitch_intrin(u8* __restrict__ x, u8* __restrict__ y, u8* __restrict__ z, u32 size) {
    u32 i, mutations = 0;
    x = (u8*)__builtin_assume_aligned(x, 32);
    y = (u8*)__builtin_assume_aligned(y, 32);
    z = (u8*)__builtin_assume_aligned(z, 32);

    __m256i v_x, v_y, v_z, v_x_and_y, v_x_or_y, v_zero, v_cmp;
    v_zero = _mm256_setzero_si256();

    for(i = 0; i < (size & ~31); i += 32) {
        v_x = _mm256_load_si256((__m256i*)&x[i]);
        v_y = _mm256_load_si256((__m256i*)&y[i]);

        v_x_and_y = _mm256_and_si256(v_x, v_y);
        v_x_or_y  = _mm256_or_si256(v_x, v_y);
        
        v_cmp = _mm256_cmpeq_epi8(v_zero, v_x_and_y);
        
        u32 r = _mm256_movemask_epi8(v_cmp);
        mutations += _mm_popcnt_u32(r); 
        
        // Ou en AVX2 natif : v_z = _mm256_blendv_epi8(v_x_and_y, v_x_or_y, v_cmp)
        v_x = _mm256_andnot_si256(v_cmp, v_x_and_y);
        v_y = _mm256_and_si256(v_cmp, v_x_or_y);
        v_z = _mm256_or_si256(v_x, v_y);
        
        _mm256_store_si256((__m256i*)&z[i], v_z);
    }
    // ... fin de traitement
    return mutations;
}
```

## 14.12 Benchmark Récapitulatif

Afin de tester les différentes versions que nous avons écrites, nous allons exami-
ner les résultats obtenus (50_000 répétitions, chaînes de 524_287 bases) en fonction du processeur.
(Méthode : `ref_v1_O3` (pur C avec -O3 GCC), `no_if_asm` (Assembleur optimisé sans saut), `sse41` et `avx2` natifs).

[BENCHMARK:asm_maxpars_64]

## 14.13 Bilan

Dans cette étude de cas, la fonction de référence peut être optimisée de manière
spectaculaire par le compilateur en utilisant les options de compilation liées à
la vectorisation (`-O3 -mavx2`) et le dépliage de boucle. 

Cependant nous voyons que les versions
en langage assembleur avec jeu d'instruction AVX2 écrites à la main (ou la version intrinsics sous C)
sont les plus ultra-efficaces. Nous sommes bien entendu tributaires de la disponibilité
d'instructions liées à ce traitement comme `pcmpeqb` et `pmovmskb` pour déjouer les branchements `if`.

Enfin, on remarquera que l'utilisation de **l'AVX512** permet de grandement simplifier le codage du
traitement en raison de l'utilisation des registres de masque `k1` et `k2` sans avoir à récupérer de masques vers des registres externes de 32 bits, faisant chuter le temps d'exécution des processeurs des dernières tranches.

## 14.14 Exercices

**Exercice 49** - Réalisez un dépliage de la version SSE 4.1 par 4, puis par 8. Intégrez
votre code au projet et comparez les résultats obtenus aux méthodes existantes.

**Exercice 50** - Réalisez un dépliage de la version AVX par 4, puis par 8. Intégrez
votre code au projet et comparez les résultats obtenus aux méthodes existantes.
