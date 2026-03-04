# Chapitre 8 : Unités vectorielles

## 8.1 Introduction

Les unités vectorielles permettent de **vectoriser** le code, en d'autres termes, de
le paralléliser au sein du microprocesseur. On exécutera la même instruction sur
plusieurs données différentes stockées dans un registre de type MMX (64 bits), SSE
(128 bits) ou AVX (256 bits).

Par exemple avec la technologie SSE, au lieu d'écrire :

```c
float v1[4], v2[4], v3[4];

void vector_sum(float* x, float* y, float* z, int n) {
    for (int i = 0; i < 4; i++) {
        z[i] = x[i] + y[i];
    }
}

vector_sum(v1, v2, v3, 4);
```

On réalise une seule opération en parallèle sur un registre capable de contenir 4 `float`, ce que l'on note mentalement (cette notation n'est pas du C valide) :

```c
z[0:3] = x[0:3] + y[0:3];
```

La notation `x[0:3]` symbolise `x[0]` à `x[3]`, elle nous permet seulement d'exprimer de manière concise le traitement réalisé. On parle alors de traitement **SIMD** pour *Single Instruction Multiple Data*, cela signifie que la même instruction est appliquée sur des données différentes et pour que cela ait un intérêt en terme de performance, on réalise les calculs en parallèle et non pas de manière séquentielle.

Par la suite nous allons nous intéresser aux technologies SSE et AVX et nous ne traiterons pas du MMX, désuet à présent.

La technologie MMX pour *MultiMedia eXtensions* est apparue sur les processeurs Intel Pentium MMX en 1997. Il s'agit d'un jeu d'instructions de 57 instructions qui traitent uniquement des entiers d'un maximum de 64 bits. Le MMX souffre d'un défaut majeur : on ne peut travailler simultanément avec la FPU et le MMX car ils partagent les mêmes registres. Ce défaut a été corrigé avec l'introduction du SSE.

Notons également que nous allons suivre la convention de représentation Intel pour les instructions SSE qui consiste à écrire les valeurs d'un vecteur en mémoire ou d'un registre en plaçant la partie haute à gauche et la partie basse à droite. Cette convention reprend le principe du *little endian*.

## 8.2 SSE (Streaming SIMD Extensions)

Sous le sigle SSE nous réunissons tous les jeux d'instructions successifs SSE, SSE2, SSE3, SSSE3, SSE4A, SSE4.1 et SSE4.2. La première version du SSE est un jeu de 70 instructions apparu en 1999 sur le Pentium III en réponse à la technologie 3DNow! d'AMD. Ces instructions traitent des entiers ou des réels. Les versions suivantes ont apporté de nouvelles instructions, par exemple `dpps` (*Dot Product of Packed Single Precision*) de SSE4.1 qui réalise le produit scalaire.

En architecture 32 bits, il existe 8 registres SSE de 128 bits nommés `xmm0` à `xmm7` (à ne pas confondre avec les registres MMX `mm0` à `mm7`). Ce nombre est doublé en architecture 64 bits avec l'ajout de `xmm8` à `xmm15`.

Les registres SSE possèdent des instructions qui traitent les valeurs qu'ils contiennent (voir Figure 8.1) :

- Soit sous forme d'entiers :
  - 16 octets
  - 8 mots
  - 4 doubles mots (entiers 32 bits signés ou non)
  - 2 quadruples mots (entiers 64 bits signés ou non)
  - 1 double quadruple mot (128 bits total)
- Soit sous forme de flottants :
  - 4 flottants simple précision (`float`)
  - 2 flottants double précision (`double`)

On disposera de plusieurs instructions similaires avec des mnémoniques différents selon le type. Ces instructions sont suffixées par une ou deux lettres (cf. Table 8.1).

Par exemple, `paddb` réalise l'addition entre 16 octets, alors que `paddd` traite 4 entiers de 32 bits. De même, `addps` additionne 4 flottants simple précision, et `addpd` traite 2 flottants double précision. On note aussi les suffixes `ss` et `sd` qui ne traitent que la partie basse du registre (32 ou 64 bits).

| Type | Taille en octets | Nom | Quantité dans 128 bits | Suffixe |
|---|---|---|---|---|
| entier | 1 | byte | 16 | `b` |
| entier | 2 | word | 8 | `w` |
| entier | 4 | double word | 4 | `d` |
| entier | 8 | quad word | 2 | `q` |
| flottant | 4 | float | 4 | `ps` |
| flottant | 8 | double | 2 | `pd` |
| flottant | 4 | float | 1 | `ss` |
| flottant | 8 | double | 1 | `sd` |

*TABLE 8.1 – Suffixes des instructions SSE*

> **Notation pseudo-code** : pour décrire les comportements, on utilise la notation `xmm0.T[i]` où `T` est le type (`b`, `w`, `d`, `q`, `ps`, `pd`) et `i` l'index. Ainsi `xmm0.b[15]` est le dernier octet de `xmm0` (poids fort), et `xmm0.b[0]` celui de poids faible.
> Dans la doc Intel, on parle plutôt en bits : `xmm0[127:120]`.

### 8.2.1 Chargement des données

Pour les entiers, on utilise `movdqu` (*Unaligned*) ou `movdqa` (*Aligned*).

```nasm
movdqa xmm0, [ebx]          ; mémoire (Load)
movdqa [edi+ecx*4], xmm7    ; mémoire (Store)
movdqa xmm0, xmm1           ; deux opérandes SSE
```

Pour les flottants, on utilise `movups` ou `movaps`. Bien que les instructions existent séparément pour les entiers et les flottants, elles sont interchangeables au niveau du transfert brut de 128 bits.

Il existe des instructions pour la partie basse uniquement : `movd` (entiers), `movss`, `movsd` (flottants).

```nasm
mov  eax, 0x01010101
movd xmm1, eax         ; xmm1.d[0] = 0x01010101, autres inchangés
movss xmm1, [edi]
```
> **Attention** : avec `movss`, on ne peut charger une valeur que depuis la mémoire (ou un autre registre xmm), pas depuis un registre général.

### 8.2.2 Opérations arithmétiques

Pour les entiers : `padd` (addition), `psub` (soustraction), `pmull` (multiplication), suffixées par la quantité (`b`, `w`, `d`, `q`). Il n'y a pas d'instruction (`pdiv`) pour la division entière vectorielle.
Pour les flottants : `addps`, `subps`, `mulps`, `divps` et leurs équivalents `pd`.

Instructions asymétriques/horizontales :
- `addsubps xmm1, xmm2` : soustrait les éléments d'indice pair (0, 2) et additionne ceux d'indice impair (1, 3).
- `haddps xmm1, xmm2` : addition horizontale.

*Schéma conceptuel de haddps xmm1, xmm2* :
1. `xmm_tmp.ps[0] = xmm1.ps[0] + xmm1.ps[1]`
2. `xmm_tmp.ps[1] = xmm1.ps[2] + xmm1.ps[3]`
3. `xmm_tmp.ps[2] = xmm2.ps[0] + xmm2.ps[1]`
4. `xmm_tmp.ps[3] = xmm2.ps[2] + xmm2.ps[3]`
5. `xmm1 = xmm_tmp`

Pour faire la somme des 4 floats de `xmm1` :

```nasm
haddps xmm1, xmm1   ; étape 1
haddps xmm1, xmm1   ; étape 2
; xmm1.ps[0:3] contiennent alors tous la somme totale des 4 éléments originaux
```

### 8.2.3 Fonctions trigonométriques

Il n'existe pas d'instructions natives SSE pour trigonometrie/log/exp. Il faut utiliser des bibliothèques externes comme *Intel MKL* ou *AMD libM*.

### 8.2.4 Opérations logiques (binaires)

Ces instructions agissent sur la totalité des 128 bits : `pand`, `por`, `pxor`, `pandn` (Et binaire avec le NOT du registre de destination).

```nasm
pand xmm1, xmm2     ; xmm1 = xmm1 AND xmm2
por xmm1, [esi]     ; xmm1 = xmm1 OR [esi]
pandn xmm1, xmm4    ; xmm1 = NOT(xmm1) AND xmm4
```

### 8.2.5 Conversions

Mnémoniques commençant par `cvt` :
- `cvtss2sd` : simple → double précision
- `cvtsd2ss` : double → simple précision
- `cvtps2pd` : 4 float → 2 double
- `cvtpd2ps` : 2 double → 4 float (les 2 floats du haut sont mis à 0)
- `cvtss2si` : float en partie basse → entier (dans registre 32/64 bits)
- `cvtsi2ss` : entier → float en partie basse

Exemple :

```nasm
section .data
    v: dd 12.0, 14.0, 16.0, 20.0

section .text
    movups xmm0, [v]
    cvtss2si eax, xmm0     ; eax contiendra l'entier 12
```

### 8.2.6 Masquage et réorganisation (Shuffle / Blend / Broadcast)

Les instructions `pshufd` (entiers) et `shufps` (flottants) utilisent un masque `imm8` (constante 8 bits) pour sélectionner et réorganiser les valeurs.

Pour `pshufd xmm1, xmm2, imm8` (ne prend en compte que la source) :
- `xmm1.ps[0] = xmm2.ps[ imm8 & 0x03 ]`
- `xmm1.ps[1] = xmm2.ps[ (imm8 >> 2) & 0x03 ]`
- `xmm1.ps[2] = xmm2.ps[ (imm8 >> 4) & 0x03 ]`
- `xmm1.ps[3] = xmm2.ps[ (imm8 >> 6) & 0x03 ]`

Pour `shufps xmm1, xmm2, imm8` (mélange destination et source) :
- `xmm_tmp[0] = xmm1.ps[ imm8 & 0x03 ]`
- `xmm_tmp[1] = xmm1.ps[ (imm8 >> 2) & 0x03 ]`
- `xmm_tmp[2] = xmm2.ps[ (imm8 >> 4) & 0x03 ]`
- `xmm_tmp[3] = xmm2.ps[ (imm8 >> 6) & 0x03 ]`
- `xmm1 = xmm_tmp`

`blendps xmm1, xmm2, imm8` remplace les valeurs de `xmm1` par celles de `xmm2` selon les 4 bits de poids faible de `imm8`.
`pblendvb xmm1, xmm2` (et `blendvps`) utilisent un registre fantôme `xmm0` comme masque de sélection byte par byte (le MSB de chaque byte dicte la copie).

Broadcast : `vpbroadcastb xmm1, xmm1` copie l'octet de poids faible dans tout le registre (16 copies).

Insert : `insertps xmm1, xmm2, imm8`
1. Sélection de 1 float de xmm2 via les bits 6-7.
2. Insertion dans xmm1 à la position dictée par les bits 4-5.
3. Mise à zéro des emplacements dans xmm1 selon les bits 0-3.

```nasm
section .data
    a dd 1.0, 2.0, 3.0, 4.0
    b dd 5.0, 6.0, 7.0, 8.0
    
section .text
    movups xmm1, [a]            ; [4.0, 3.0, 2.0, 1.0]
    movups xmm2, [b]            ; [8.0, 7.0, 6.0, 5.0]
    insertps xmm1, xmm2, 10_11_0011b 
    ; Sélection (10b = index 2 de xmm2 = 7.0)
    ; Insertion (11b = index 3 de xmm1)
    ; Mise à 0 (0011b = index 0 et 1 de xmm1 mis à 0)
    ; Résultat xmm1 = [7.0, 3.0, 0.0, 0.0]
```

## 8.3 AVX (Advanced Vector eXtensions)

### 8.3.1 Concept

Sous le sigle AVX nous plaçons les jeux d'instructions AVX et AVX2 256 bits. Les registres s'appellent `ymm0` à `ymm15` (en 64 bits).

Changements majeurs :
- Toutes les instructions commencent par le préfixe `v` (ex: `vpaddd` au lieu de `paddd`).
- Elles acceptent trois opérandes : destination, source 1, source 2 (ce qui évite d'écraser la source 1).

```nasm
; SSE : à 2 opérandes
paddd xmm1, xmm2    ; xmm1 = xmm1 + xmm2
; AVX : à 3 opérandes
vpaddd xmm3, xmm1, xmm2 ; xmm3 = xmm1 + xmm2 (xmm1 préservé)
```

### 8.3.2 Manipulations hautes/basses

Certaines instructions SSE comme `insertps` ne peuvent pas être directement déclinées en version haute sur 256 bits (la constante de masque est trop courte). L'AVX a donc des instructions pour extraire ou insérer des blocs de 128 bits.
- `vinsertf128 ymm3, ymm2, xmm1, 0/1` : copie `ymm2` dans `ymm3` puis remplace la partie basse (0) ou haute (1) par `xmm1`.
- `vextractf128 xmm1, ymm2, 0/1` : extrait la partie basse ou haute.

### 8.3.3 La difficulté de l'AVX avec les opérations horizonales

L'instruction `vhaddps ymm0, ymm0` ne fera PAS la somme des 8 valeurs. Elle opère fonctionnellement comme deux `haddps xmm, xmm` en parallèle sur les 128 bits du bas et les 128 bits du haut de façon indépendante.

Il faut plutôt utiliser :
```nasm
vhaddps ymm0, ymm0, ymm0        ; 1ère addition horizontale (intra lanes)
vhaddps ymm0, ymm0, ymm0        ; 2ème addition horizontale (intra lanes)
vextractf128 xmm1, ymm0, 1      ; extrait les 128 bits du haut dans xmm1
vaddps xmm0, xmm1, xmm0         ; additionne le haut et le bas
```

## 8.4 Affichage et débogage d'un registre vectoriel

### 8.4.1 Macros pour architecture 32 bits

Il est utile d'avoir des macros `nasm` pour afficher un registre afin de déboguer.

```nasm
extern printf

section .data
    str_sse_int: db "[%d %d %d %d] ", 10, 0
    str_sse_flt: db "[%f %f %f %f] ", 10, 0

%macro print_sse_int 1
    sub esp, 16
    ; affichage Intel
    pshufd %1, %1, 00011011b
    movdqu [esp], %1
    push str_sse_int
    call printf
    add esp, 20
    ; rétablir les valeurs initiales
    pshufd %1, %1, 00011011b
%endmacro

%macro print_sse_flt 1
    sub esp, 48               ; 16 + 4*8
    movups [esp], %1          ; stocke le registre
    fld dword [esp+12]
    fstp qword [esp+40]
    fld dword [esp+8]
    fstp qword [esp+32]
    fld dword [esp+4]
    fstp qword [esp+24]
    fld dword [esp]
    fstp qword [esp+16]
    push str_sse_flt
    call printf
    add esp, 52               ; 48 + 4
%endmacro
```

### 8.4.2 Macros pour architecture 64 bits

En 64 bits, c'est plus complexe car les arguments de `printf` doivent être passés via les registres (`rsi`, `rdx`, `rcx`, `r8` pour les entiers ; `xmm0`–`xmm3` pour les flottants). Il faut aussi sauver ces registres + la pile (red zone).

```nasm
extern printf
default rel

section .data
    str_sse_int: db "[%d %d %d %d] ", 10, 0
    str_sse_flt: db "[%f %f %f %f] ", 10, 0

%macro print_sse_int 1
    sub rsp, 128+16+8*6
    mov [rsp], rdi
    mov [rsp+8], rsi
    mov [rsp+16], rdx
    mov [rsp+24], rcx
    mov [rsp+32], r8
    mov [rsp+40], rax
    
    lea rdi, [str_sse_int]
    pshufd %1, %1, 00011011b
    movdqu [rsp+56], %1
    mov esi, [rsp+56]
    mov edx, [rsp+60]
    mov ecx, [rsp+64]
    mov r8d, [rsp+68]
    xor rax, rax
    call printf WRT ..plt
    pshufd %1, %1, 00011011b

    mov rax, [rsp+40]
    mov r8, [rsp+32]
    mov rcx, [rsp+24]
    mov rdx, [rsp+16]
    mov rsi, [rsp+8]
    mov rdi, [rsp]
    add rsp, 128+16+8*6
%endmacro

%macro print_sse_flt 1
    sub rsp, 128+5*16
    movdqu [rsp+16], xmm0 
    movdqu [rsp+32], xmm1 
    movdqu [rsp+48], xmm2 
    movdqu [rsp+64], xmm3
    movdqu [rsp], %1
    
    cvtss2sd xmm0, dword [rsp]
    cvtss2sd xmm1, dword [rsp+4]
    cvtss2sd xmm2, dword [rsp+8]
    cvtss2sd xmm3, dword [rsp+12]
    lea rdi, [str_sse_flt]
    mov eax, 4
    call printf WRT ..plt
    
    movdqu xmm3, [rsp+64]
    movdqu xmm2, [rsp+48]
    movdqu xmm1, [rsp+32]
    movdqu xmm0, [rsp+16]
    add rsp, 128+5*16
%endmacro
```

## 8.5 Les "Intrinsics" en C++

Les *intrinsics* sont une interface entre le langage C et les instructions assembleur vectorielles. Elles permettent de scripter le code SIMD sans faire de l'assemblage pur, en laissant le compilateur s'occuper de l'allocation des registres.

L'inclusion d'un fichier en-tête permet l'utilisation de ces types et fonctions :

| Fichier             | Jeu d'instructions |
|---------------------|--------------------|
| `<mmintrin.h>`      | MMX                |
| `<xmmintrin.h>`     | SSE                |
| `<emmintrin.h>`     | SSE2               |
| `<pmmintrin.h>`     | SSE3               |
| `<tmmintrin.h>`     | SSSE3              |
| `<smmintrin.h>`     | SSE4.1             |
| `<nmmintrin.h>`     | SSE4.2             |
| `<ammintrin.h>`     | SSE4A              |
| `<immintrin.h>`     | AVX / AVX2 / AVX512|

*TABLE 8.2 – Fichiers d'entête SIMD*

> Il est grandement recommandé d'utiliser l'**Intel Intrinsics Guide** (outil web) pour trouver la documentation précise pour chaque fonction.

### 8.5.1 Les Types Intrinsics et Suffixes

Il faut indiquer au compilateur C les types que l'on manipule :

| Type | Description | Exemple d'instruction |
|---|---|---|
| `__m128` | 4 floats | `_mm_add_ps` |
| `__m128d` | 2 doubles | `_mm_add_pd` |
| `__m128i` | entiers divers (8/16/32/64 bits) | `_mm_add_epi32` |
| `__m256` | 8 floats (AVX) | `_mm256_add_ps` |
| `__m256d` | 4 doubles | `_mm256_add_pd` |
| `__m256i` | entiers (AVX2) | `_mm256_add_epi32` |

*TABLE 8.3 – Types intrinsiques (SSE/AVX)*

Les noms de fonctions se basent sur `_mm_<oper>_<suffix>` (ou `_mm256_...` en AVX). Par exemple, `epi32` signifie *Extended Packed Integers 32-bits*.

Exemple de boucle vectorisée avec intrinsics (somme de 2 vecteurs, boucle déroulée) :

```c
#include <immintrin.h>

void sum_intrinsics_sse(int* u, int* v, int size) {
    int i = 0;
    for (; i < (size & ~3); i += 4) {   // Equivalent à i < size - (size%4)
        // charger quatre entiers de chaque tableau (unaligned)
        __m128i x1 = _mm_loadu_si128((__m128i*) &u[i]);
        __m128i x2 = _mm_loadu_si128((__m128i*) &v[i]);
        
        // additionner en parallèle
        x1 = _mm_add_epi32(x1, x2);
        
        // stocker le résultat
        _mm_storeu_si128((__m128i*) &u[i], x1);
    }
    
    // traiter le reliquat (si non multiple de 4)
    while (i < size) {
        u[i] = u[i] + v[i];
        i++;
    }
}
```

En utilisant l'AVX (256 bits), la boucle se déplie par groupe de 8 au lieu de 4 avec `_mm256_loadu_si256` et `_mm256_add_epi32`.

### 8.5.2 Exemples de chargement et stockage

| Nom de fonction intrinsèque | Tableaux / Registre final (ex: Float SSE) |
|---|---|
| `_mm_load_ss` | Charge un réel `p[0]`, reste = 0 |
| `_mm_load1_ps` | Charge un réel `p[0]`, copié 4 fois |
| `_mm_loadu_ps` | Charge 4 réels (non alignés) |
| `_mm_load_ps` | Charge 4 réels (alignés, adresse multiple de 16) |
| `_mm_set_ss` | Affecte un réel 0 0 0 w |
| `_mm_set1_ps` | Affecte 4 fois le même réel |
| `_mm_setzero_ps` | Registre mis à zéro |

*TABLE 8.4 – Chargement des flottants / Intrinsics*

Les fonctions de sauvegarde sont de type `_mm_storeu_ps`, `_mm_store_ps`, `_mm_store_ss`, etc.

| Architecture | Add (non vectorisé C standard) | SSE Unaligned | SSE Aligned | AVX Unaligned | AVX Aligned |
|---|---|---|---|---|---|
| **AMD Ryzen 7 1700X** | 5.53 s | 1.71 s | 1.70 s | 1.62 s | 1.62 s |
| **AMD Ryzen 5 5600G** | 3.37 s | 1.51 s | 1.51 s | 1.16 s | 0.95 s |
| **Intel Core i5 10400** | 4.97 s | 2.23 s | 2.18 s | 2.00 s | 1.93 s |
| **Intel Core i5 12400F**| 3.45 s | 1.25 s | 1.35 s | 1.34 s | 1.22 s |

*TABLE 8.5 – Temps d’exécution en secondes (Somme de vecteurs de 131_079 entiers, répétée 100_000 fois)*

On constate l'énorme avantage de la vectorisation, et que la différence entre l'aligné et non-aligné s'estompent sur certaines microarchitectures récentes, mais reste décisive sur d'autres. L'AVX surclasse généralement le SSE.

## 8.6 AVX-512

### 8.6.1 Généralités

L'AVX-512 est un jeu étendu introduit en 2013 (processeurs Xeon Phi, Skylake-X, etc). L'AVX-512 double encore la taille à **512 bits** (registres `zmm0` à `zmm31`). Seize (16) registres supplémentaires ont été ajoutés par rapport à AVX.

Il existe près d'une vingtaine de "sous-jeux" d'instructions AVX-512, tels que :
- **AVX512-F** (Foundations)
- **AVX512-BW** (Byte and Word)
- **AVX512-VNNI** (Neural Networks)

**Registres masques (`k0` à `k7`)** : Un ajout majeur. Ces 8 registres (jusqu'à 64 bits de taille avec BW) permettent de *masquer* opérationnellement des "voies" (*lanes*) d'un vecteur, appliquant une instruction de manière conditionnelle sans avoir à utiliser l'astuce de fusion `blendps`.
Toutes ces opérations commencent par la lettre `k` (`kadd`, `kand`, `kmov`, `ktest`).

> **Pénalités AVX-512** : Le processeur abaisse parfois sa fréquence (downclock) lors de très lourds calculs AVX-512 pour éviter la surchauffe. Sur d'anciennes architectures, il est en effet recommandé d'émettre un `vzeroupper` (mise à zéro de l'état étendu du registre) avant de revenir aux exécutions SSE standards, pour éviter des délais (pénalités causées par des états CPU incompatibles). AMD a commencé le support de AVX-512 à partir de Zen 4.

### 8.6.2 Exemples avec Masques et Opérations AVX-512 (zmm)

Exemple d'opération de type `if(x[i] > 0.0) y[k++] = x[i]` pour *compresser* un tableau en sélectionnant uniquement les valeurs voulues.
AVX-512 introduit l'instruction révolutionnaire `vcompressps`.

```nasm
    vxorps ymm0, ymm0, ymm0        ; Registre nul (0.0) [Dans ymm0 - 256 bits]
    vmovups ymm1, [rdi]            ; Charge 8 floats depuis x
    vcmpps k1, ymm1, ymm0, 5       ; Compare 8 floats : Si ymm1[i] > 0.0, k1.bit[i] = 1 (pseudo-op 5 = Not_Less_Than_Or_Equal)
    vcompressps ymm2 {k1}, ymm1    ; Magie : Tasse les floats validés par le masque k1 de ymm1 et les plaque consécutivement en ymm2
    vmovups [rsi], ymm2            ; Envoie dans le vecteur final
    kmovq rax, k1
    popcnt rax, rax                ; Compte les bits : rax = count ++
    vzeroupper
    ret
```

## 8.7 Vers l'AVX10

L'AVX10 (*Advanced Instruction Extensions 10*), introduit par Intel fin 2023, uniformise l'accès au jeu d'instruction AVX-512 (les types de masquages, instructions poussées) tout en s'exécutant sur des registres coupés en 256 bits (`ymm`). 
Cette technologie est apparue pour régler la dualité entre P-Core (gérant le 512 bit) et E-Core (Alder Lake limités à 256 bits). Ceci permet au développeur de recompiler son code AVX-512-idéal tout en le rendant physiquement exécutable sur des cores hybrides limités au registre 256-bit.

## 8.8 Bilan

### 8.8.1 Résumé

- Les unités vectorielles qualifiées de **SIMD** (*Single Instruction Multiple Data*) permettent de paralléliser les calculs en effectuant la même opération sur des données différentes.
- **SSE** gère les 128 bits (`xmm`), **AVX** 256 bits (`ymm`), **AVX-512** 512 bits (`zmm`).
- **L'AVX** apporte un gain net. Il est recommandé de compiler pour tirer profit des vecteurs pour des gros calculs répétitifs.
- Les **intrinsics** exposent aux développeurs C++ la puissance des vecteurs sans le fardeau d'écrire l'assembleur pur, permettant au compilateur de faire son travail d'allocation.
- **L'AVX-512** révolutionne le système de manipulation interne avec la présence des "registres de masques" (`k0` à `k7`).

## 8.9 Exercices

**Exercice 35** – Implanter, en utilisant les registres SSE (et intrinsics ensuite), la fonction `iota` définie par :

```c
void iota(float *t, int n) {
    for(int i=0; i<n; i++)
        t[i] = (float)i;
}
```

On commencera par déplier par 4.
Indice : Initialiser un registre SSE incrémenteur avec `[4.0, 3.0, 2.0, 1.0]` (à additionner au bloc initial `[3.0, 2.0, 1.0, 0.0]`).

**Exercice 36** – Donner une version **Intrinsics (C/C++)** de la fonction `iota`.

**Exercice 37** – Créer une fonction vectorielle en assembleur qui convertit une chaîne de caractères majuscules (`void toUpper(char *s, size_t size);`).

**Exercice 38** – Créer une fonction vectorielle qui convertit en minuscules ET retourne le total de modifications (`size_t toLower(char *s, size_t size);`).
