# Chapitre 7 : Coprocesseur arithmétique

## 7.1 Introduction

Dans ce chapitre nous allons voir comment utiliser le coprocesseur arithmétique
afin de réaliser des calculs avec des nombres à virgule flottante. L'ensemble des
instructions du coprocesseur commencent par la lettre `f` pour *Floating point value*.

Le coprocesseur était absent sur les premiers microprocesseurs de la famille x86
mais on pouvait ajouter un circuit externe chargé de faire les calculs des nombres
en virgule flottante. Ce circuit a donc été nommé **coprocesseur**. Le premier
coprocesseur pour l'Intel 8086 fut l'Intel 8087. D'autres furent produits pour les
microprocesseurs suivants : 80287, 80387, 80487, jusqu'à l'intégration du coprocesseur
au sein du microprocesseur à partir des Intel 80486DX. On ne parle donc plus à
présent de coprocesseur mais plutôt de **FPU** (*Floating Point Unit*).

## 7.2 Architecture de la FPU

La FPU est composée des éléments suivants :

- Une pile de 8 registres (*Registers Stack*)
- Le registre `opcode` qui contient le code de la dernière instruction exécutée
- Le registre de **statut** qui contient le sommet de pile, les exceptions et les flags
- Le registre de **contrôle** qui contrôle la précision et l'arrondi des méthodes de calcul
- Le registre d'**étiquette** (*Tag Register*) indique le contenu (valid, 0, NaN, infini) de chaque registre
- Le **Last Instruction Pointer** qui pointe sur la dernière instruction exécutée
- Le **Last Data Pointer** qui pointe vers l'opérande de la dernière instruction

*FIGURE 7.1 – Registres du coprocesseur*

## 7.3 La pile du coprocesseur

Le coprocesseur comporte 8 registres notés R0 à R7 mais qui ne sont pas manipulables
directement. On y accède au travers d'une pile dotée de 8 registres appelés `st0`
à `st7` que ce soit en architecture 32 ou 64 bits.

Dès que l'on charge une nouvelle donnée dans `st0`, les données déjà stockées dans
`st0` à `st6` sont **déplacées** vers `st1` à `st7`.

Les registres `st0` à `st7` occupent chacun **80 bits** ce qui permet de disposer d'une
grande précision. L'exposant occupe alors 15 bits et la mantisse 64 bits.

> **Attention** : si on charge plus de huit valeurs dans la pile du coprocesseur, on
> génère une exception. Il faut prendre l'habitude de ne laisser qu'une valeur dans
> `st0` et de la supprimer lorsqu'on n'en a plus besoin.

### 7.3.1 Chargement (fld, fild)

Le chargement des données se fait grâce à l'instruction `fld` (*Floating point LoaD*) :

- `dword` pour un flottant en simple précision
- `qword` pour un flottant en double précision

Il existe également `fild` (*Floating point Integer LoaD*) qui permet de charger une
valeur entière qui sera convertie en nombre flottant.

> **Attention** : on ne peut pas charger une donnée depuis un registre général,
> uniquement depuis la mémoire ou à partir d'un autre registre du coprocesseur.

```nasm
section .data
    a: dd 1.25          ; float a = 1.25
    b: dq 3.752567871   ; double b = 3.752567871
    c: dd 31            ; int c = 31
    d: dq 123           ; long int d = 123

section .text
    fld  dword [a]
    fld  qword [b]
    fld  st0            ; empile le sommet (copie)
    fld  st1
    fild dword [c]
    fild qword [d]
    ret
```

L'état de la pile du coprocesseur après chaque instruction :

| Instruction | st0 | st1 | st2 | st3 | st4 | st5 | st6 | st7 |
|---|---|---|---|---|---|---|---|---|
| `fld dword [a]` | 1.25 | ? | ? | ? | ? | ? | ? | ? |
| `fld qword [b]` | 3.75 | 1.25 | ? | ? | ? | ? | ? | ? |
| `fld st0` | 1.25 | 3.75 | 1.25 | ? | ? | ? | ? | ? |
| `fld st1` | 1.25 | 1.25 | 3.75 | 1.25 | ? | ? | ? | ? |
| `fild dword [c]` | 31 | 1.25 | 1.25 | 3.75 | 1.25 | ? | ? | ? |
| `fild qword [d]` | 123 | 31 | 1.25 | 1.25 | 3.75 | 1.25 | ? | ? |

*TABLE 7.1 – Effets du chargement de valeurs dans le coprocesseur*

Un certain nombre de constantes sont prédéfinies :

| Instruction | Constante |
|---|---|
| `fldz` | 0.0 |
| `fld1` | 1.0 |
| `fldpi` | π |
| `fldl2e` | log₂(e) = 1.442695 |
| `fldl2t` | log₂(10) = 3.312928 |
| `fldlg2` | log₁₀(2) = 0.310299 |
| `fldln2` | logₑ(2) = 0.693147 |

*TABLE 7.2 – Constantes prédéfinies du coprocesseur (valeurs approchées)*

### 7.3.2 Stockage (fst, fstp)

Le stockage fonctionne comme le chargement, on indique l'emplacement mémoire
au format `dword` ou `qword` vers lequel on désire stocker la valeur en sommet.

> **Note** : la plupart des instructions disposent d'un suffixe `p` (ex. `fstp`).
> Ajouter le suffixe `p` signifie qu'on **dépile** (*pop*) le résultat après le stockage.

Exemple :

```nasm
section .data
    a: dd 0.0   ; float
    b: dq 0.0   ; double

section .text
    fld1            ; st0 = 1.0
    fst  dword [a]  ; stocke 1.0 dans a (float), st0 reste = 1.0
    fstp qword [b]  ; stocke 1.0 dans b (double), puis dépile st0
```

## 7.4 Instructions de la FPU

Nous donnons à présent une liste non exhaustive des opérations que l'on peut
utiliser avec la FPU.

### 7.4.1 Opérations arithmétiques

- `fadd`, `faddp` — addition : `st0 = st0 + src`
- `fsub` — soustraction : `st0 = st0 - src`
- `fsubr` — soustraction inverse : `st0 = src - st0`
- `fmul`, `fmulp` — multiplication
- `fdiv`, `fdivp` — division : `st0 = st0 / src`
- `fdivr` — division inverse : `st0 = src / st0`
- `fprem` — reste de la division

Les différentes formes de `fadd` :

| Instruction | Interprétation |
|---|---|
| `fadd [mem]` | `st0 += mem` |
| `fadd sti, st0` | `sti += st0` |
| `fadd st0, sti` | `st0 += sti` |
| `faddp sti, st0` | `sti += st0`, puis `st0` dépilé |
| `fiadd [mem]` | `st0 += mem` (entier) |

*TABLE 7.3 – Description de l'instruction fadd*

> **Attention** : `fadd` et `faddp` ont un comportement différent :
> - `fadd` : `st0 += sti`
> - `faddp` : `sti += st0`, puis `st0` est dépilé

On dispose également d'opérations complémentaires :

- `fabs` — valeur absolue
- `fchs` — changement de signe
- `fsqrt` — racine carrée
- `fscale` — `st0 = st0 × 2^st1`
- `f2xm1` — `st0 = 2^st0 - 1`
- `fyl2x` — `st0 = st1 × log₂(st0)`
- `fyl2xp1` — `st0 = st1 × log₂(st0 + 1)`
- `fxtract` — extrait l'exposant du nombre stocké dans `st0`

### 7.4.2 Opérations trigonométriques

Elles s'appliquent uniquement sur `st0` qui représente un angle exprimé en **radians** :

- `fsin` — sinus : `st0 = sin(st0)`
- `fcos` — cosinus : `st0 = cos(st0)`
- `fsincos` — `st0 = cos(st0)`, `st1 = sin(st0)` (ancienne valeur de `st0`)
- `fptan` — tangente partielle
- `fpatan` — arctangente partielle

Exemple : convertir 60° en radians puis calculer sinus et cosinus :

```nasm
section .data
    angle: dd 60     ; degrés
    cqv:   dd 180    ; dénominateur

section .text
    ; calcul de pi * 60 / 180 pour avoir la mesure en radians
    fild  dword [angle]         ; st0 = 60
    fild  dword [cqv]           ; st0 = 180, st1 = 60
    fdivp st1, st0  ; st0 = 60.0 / 180.0 = 0.3333..., puis pop
    fldpi                       ; st0 = pi, st1 = 0.3333...
    fmulp st1, st0  ; st0 = pi * 0.3333...
    fsincos          ; st0 = cos(pi/3) = 0.5, st1 = sin(pi/3) = 0.86
```

### 7.4.3 Contrôle de la FPU

La FPU n'a pas directement accès au flux d'instructions du microprocesseur.
Pendant que la FPU exécute ses instructions, le microprocesseur peut continuer
à exécuter d'autres instructions sur des entiers.

Instructions de contrôle et de synchronisation :

- `fwait` — synchronisation des exceptions avant la prochaine instruction
- `finit` — initialise ou réinitialise le coprocesseur
- `fclex` / `fnclex` — supprime les exceptions levées
- `fsave` / `fnsave` — sauve l'état et les registres du coprocesseur (108 octets)
- `frstor` — restaure l'état et les registres du coprocesseur
- `ffree` — libère un registre

## 7.5 Gestion des erreurs

Deux types d'erreurs peuvent se produire lors de calculs avec les nombres flottants :

- Les erreurs de calcul : racine carrée négative, débordement, division par zéro
- Les erreurs liées à la gestion de la pile de la FPU : pile pleine, pile vide

La FPU utilise un **registre de statut** pour gérer les erreurs :

| Bit | Identifiant | Description | Exception |
|---|---|---|---|
| 0 | `FPU_IE` | Opération Invalide | oui |
| 1 | `FPU_DE` | Opérande dénormalisée | oui |
| 2 | `FPU_ZE` | Division par Zéro | oui |
| 3 | `FPU_OE` | Débordement (*Overflow*) | oui |
| 4 | `FPU_UE` | Débordement (*Underflow*) | oui |
| 5 | `FPU_PE` | Précision | oui |
| 6 | `FPU_SF` | Erreur Pile (*Stack Fault*) | — |
| 7 | `FPU_ES` | Résumé Erreur | — |
| 8 | `FPU_C0` | C0 (Retenue) | — |
| 9 | `FPU_C1` | C1 (Débordement) | — |
| 10 | `FPU_C2` | C2 (Parité) | — |
| 11–13 | — | Sommet de pile (3 bits) | — |
| 14 | `FPU_C3` | C3 (Zéro) | — |
| 15 | `FPU_B` | FPU Busy | — |

*TABLE 7.4 – Description du registre de statut de la FPU*

Les bits 0 à 5 correspondent à des exceptions interceptables avec `SIGFPE`
(*Signal Floating Point Exception*) sous Linux.

Les bits 11 à 13 codent sur 3 bits le sommet de pile (initialement à 7). Si on
place plus de 8 valeurs dans la pile, on génère un `FPU_SF` et les prochaines valeurs
chargées seront remplacées par `−NaN` (*Not a Number*).

Les bits `C0`–`C3` sont des bits de condition calqués sur les bits du registre `flags`.
Pour les copier dans le registre `flags` :

```nasm
fstsw ax
sahf
```

## 7.6 Comparaisons de valeurs flottantes

Il existe différentes instructions pour la comparaison : `ftst`, `fcom`, `fcomp`, `fcompp`,
`fucom`, `fucomp`, `fucompp`.

Les instructions les plus intéressantes sont `fcomi`, `fcomip`, `fucomi`, `fucomip` car
elles réalisent la comparaison de deux valeurs et mettent directement à jour le
registre `flags` à partir des bits de condition de la FPU.

### 7.6.1 Exemple de comparaison en 32 bits

Pour comparer deux valeurs flottantes :

```c
int compare(float x, float y) {
    if (x > y)
        return 1;
    else
        return 3;
}
```

En 32 bits, on charge `y` puis `x`. On compare `x` à `y` via `fcomip` qui dépile `x`.
On utilise `jbe` (*Jump Below or Equal*) pour le `.else` lorsque `x ≤ y`.

```nasm
compare_32bits:
    push  ebp
    mov   ebp, esp
    fld   dword [ebp+12]  ; charge y dans st0
    fld   dword [ebp+8]   ; charge x dans st0, y → st1
    fcomip st0, st1       ; compare x (st0) à y (st1), dépile x
    fstp  st0             ; supprime y
    jbe   .else
    mov   eax, 1
    jmp   .endif
.else:
    mov   eax, 3
.endif:
    mov   esp, ebp
    pop   ebp
    ret
```

> **Instructions de saut pour les flottants** : pour des raisons historiques, les
> instructions de comparaison sur les flottants ne mettent pas à jour les mêmes bits
> que `cmp`. On utilise donc `jb` (au lieu de `jl`), `ja` (au lieu de `jg`), `jbe` et `jae`.

### 7.6.2 Comparaison en 64 bits avec les registres SSE

En 64 bits, ce sont les registres SSE qui sont utilisés pour les calculs flottants.
Voici comment le compilateur C traduit :

```c
void equal_64bits(float x, float y) {
    if (fabs(x - y) < 1e-6) {
        // code du then
    } else {
        // code du else
    }
}
```

`x` et `y` sont respectivement placées dans `xmm0` et `xmm1` :

```nasm
equal_64bits:
    subss   xmm0, xmm1              ; x - y
    andps   xmm0, [.LC0]            ; fabs : masque 0x7FFFFFFF (élimine le bit de signe)
    cvtss2sd xmm0, xmm0             ; conversion simple → double précision
    movsd   xmm1, [.LC1]            ; charge 1e-6 en double précision
    comisd  xmm1, xmm0              ; compare 1e-6 et |x-y|
    jb      .then                   ; si 1e-6 > |x-y|
.then:
    ...
    jmp .endif
.else:
    ...
.endif:
    ret

.LC0: dd 0x7FFFFFFF, 0, 0, 0       ; masque pour fabs (32 bits)
.LC1: dq 0x3EB0C6F7A0B5ED8D        ; 1e-6 en IEEE 754 double
```

Il existe également l'instruction `cmpss xmm1, xmm2, imm8` pour comparer deux
valeurs flottantes 32 bits. La constante `imm8` indique le type de comparaison :

| `imm8` | Type de comparaison |
|---|---|
| 0 | `xmm1.ps[0] == xmm2.ps[0]` |
| 1 | `xmm1.ps[0] < xmm2.ps[0]` |
| 2 | `xmm1.ps[0] <= xmm2.ps[0]` |
| 3 | *unordered* (au moins un NaN) |
| 4 | `xmm1.ps[0] != xmm2.ps[0]` |
| 5 | `xmm1.ps[0] >= xmm2.ps[0]` |
| 6 | `xmm1.ps[0] > xmm2.ps[0]` |
| 7 | *ordered* (aucun NaN) |

*TABLE 7.5 – Comparaison avec cmpss/cmpsd*

Le résultat est stocké dans `xmm1.ps[0]` : `0xFFFFFFFF` si vrai, `0x00000000` si faux.

> **Note** : `cmpsd` peut signifier *Compare Scalar Double-Precision Floating-Point*
> (registres vectoriels) ou *Compare String Operands* (pas d'opérande). Ne pas les confondre.

## 7.7 Traduction d'expressions en assembleur FPU

Pour traduire une expression en utilisant les instructions du coprocesseur :

1. Modéliser l'expression sous forme d'un **arbre binaire**
2. Réaliser un **parcours postfixe** de l'arbre pour obtenir la notation polonaise inverse (RPN)
3. Traduire la version RPN en instructions FPU

> **Notation Polonaise Inverse (RPN)** : notation post-fixée qui permet d'écrire
> de façon non ambiguë les formules arithmétiques sans utiliser de parenthèses.

**Règles de traduction RPN → assembleur FPU** :

- Si constante ou variable → `fld [variable]`
- Si opérateur unaire → appliquer sur `st0` (ex. `fsqrt`)
- Si opérateur binaire → `f<Oper>p st1, st0` (avec `Oper` = `add`, `sub`, `mul`, `div`)

**Exemple** : traduire l'expression `(x + 1) × (x − 1) / (3 − √x)`

L'expression en RPN (parcours postfixe de l'arbre) :

```
x  1.0  +  x  1.0  -  *  3.0  x  sqrt  -  /
```

*FIGURE 7.2 – Représentation arborescente de (x+1)×(x−1) / (3−√x)*

Traduction en assembleur :

```nasm
section .data
    trois: dd 3.0   ; constante non prédéfinie → stockée en mémoire

section .text
    ; x + 1
    fld  dword [x]
    fld1
    faddp st1, st0      ; st0 = x + 1.0

    ; x - 1
    fld  dword [x]
    fld1
    fsubp st1, st0      ; st0 = x - 1.0, st1 = x + 1.0

    ; (x+1)*(x-1)
    fmulp st1, st0      ; st0 = (x+1)*(x-1)

    ; 3 - sqrt(x)
    fld  dword [trois]
    fld  dword [x]
    fsqrt               ; st0 = sqrt(x), st1 = 3.0, st2 = (x+1)*(x-1)
    fsubp st1, st0      ; st0 = 3.0 - sqrt(x)

    ; (x+1)*(x-1) / (3 - sqrt(x))
    fdivp st1, st0      ; st0 = résultat final
```

> **Note** : dans le cas des constantes, si la constante n'est pas prédéfinie dans le
> coprocesseur, il est nécessaire de la stocker en mémoire avant de la charger.

## 7.8 Affichage de valeurs flottantes avec printf

### 7.8.1 Affichage en 32 bits

En 32 bits, on utilise `printf` en suivant la convention d'appel du langage C.
**Une valeur `float` (simple précision) doit être convertie en `double` avant l'affichage.**

```c
float x = 3.14;
printf("%f", x);
```

Traduit en assembleur 32 bits :

```nasm
extern printf

section .data
    x:   dd 3.14
    msg: db "%f", 0

section .text
    fld  dword [x]      ; charge x
    sub  esp, 8         ; réservation de 64 bits pour la double précision
    fstp qword [esp]    ; stocke en double précision dans la pile
    push msg            ; adresse du format
    call printf
    add  esp, 12        ; supprime les paramètres (8 + 4 octets)
```

### 7.8.2 Affichage en 64 bits

Pour une architecture 64 bits, d'après la convention System V AMD64 ABI :

```nasm
extern printf
default rel

section .data
    x:   dd 3.14
    msg: db "%f", 0

section .text
affiche:
    push rbp
    mov  rbp, rsp
    movss  xmm0, [x]           ; charge x (float 32 bits)
    cvtss2sd xmm0, xmm0        ; conversion au format double précision
    lea  rdi, [msg]             ; adresse du format
    mov  eax, 1                 ; indique qu'il y a une valeur flottante
    call printf WRT..plt
    mov  rsp, rbp
    pop  rbp
    ret
```

Le registre `rdi` contient l'adresse de la chaîne de format. La valeur flottante est
placée dans `xmm0` convertie en double précision. Le registre `eax` doit contenir le
nombre de valeurs flottantes à traiter avant l'appel à `printf`.

## 7.9 Bilan

### 7.9.1 Résumé

- Le coprocesseur arithmétique permet de réaliser les calculs des nombres à virgule flottante
- Initialement absent, puis positionné sur la carte mère, il est aujourd'hui intégré
  au microprocesseur et qualifié de **FPU** (*Floating Point Unit*)
- La FPU fonctionne comme une pile dotée de huit registres `st0` à `st7`
- Les instructions assembleur liées à la FPU commencent par la lettre `f`
- Toute donnée empilée dans la FPU doit être dépilée

### 7.9.2 Objectifs

Après lecture et travail sur ce chapitre, on doit être capable de :

- Traduire un calcul avec des nombres à virgule flottante sous forme d'une série
  d'instructions assembleur (modéliser l'expression en arbre binaire puis appliquer
  les règles RPN → assembleur)
- Comparer deux nombres flottants

## 7.10 Exercices

**Exercice 29** – Montrer comment, en utilisant les registres généraux et les instructions
associées, on peut réaliser les opérations de la FPU comme `fabs` (valeur absolue) ou
`fchs` (changement de signe) d'une valeur flottante sur 32 bits.
On chargera la valeur flottante dans `eax` par exemple avant de réaliser l'opération.

**Exercice 30** – Implanter la fonction `iota` en architecture 32 bits en utilisant la FPU :

```c
void iota(float *t, int n) {
    for (int i = 0; i < n; i++)
        t[i] = (float)i;
}
```

**Exercice 31** – Implanter l'expression suivante en architecture 32 bits en utilisant la FPU :

```
(x − 5) × (x + 6)
─────────────────────────
cos(x − 5) × sin(x + 6)
```

1. Modéliser sous forme d'arbre binaire
2. Identifier les sous-expressions répétées comme `x − 5` et `x + 6`
3. Traduire en assembleur FPU
4. Donner une version optimisée en ne recalculant pas les sous-expressions répétées

**Exercice 32** – Implanter la fonction `puissance` en architecture 32 bits en utilisant la FPU :

```c
float puissance(float x, int n) {
    float result = 1;
    for (int i = 0; i < n; i++)
        result *= x;
    return result;
}
```

Faire de même en 64 bits.

**Exercice 33** – Écrire un programme assembleur qui calcule l'expression suivante sous
forme d'un développement limité :

```
1/(1−x) = 1 + x + x² + x³ + ... + xⁿ
```

Cette formule fonctionne lorsque `x` est proche de 0. Essayer avec `x = 0.2` et
déterminer à partir de quelle valeur de `n` le calcul ne gagne plus en précision.

**Exercice 34** – Écrire un programme assembleur qui permet de trouver les solutions
réelles d'une équation du second degré `ax² + bx + c = 0`.
On utilisera la FPU pour réaliser les calculs. Rappel :

- Calculer le discriminant Δ = b² − 4ac
- Si Δ ≥ 0, les solutions réelles sont :
  - `x₁ = (−b + √Δ) / (2a)`
  - `x₂ = (−b − √Δ) / (2a)`

On utilisera l'instruction `fcomip st0, st1` pour comparer Δ à 0.
