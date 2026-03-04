# Chapitre 6 : Appel de sous-programme

## 6.1 Introduction

Dans ce chapitre nous allons voir comment réaliser l'appel de sous-programme
en 32 et 64 bits. Malheureusement les conventions d'appel dans ces deux
architectures sont très différentes sous Linux et elles diffèrent également entre
Linux et Windows. Il faut donc soit penser méticuleusement au choix des registres,
soit revoir entièrement son code lors du passage du 32 bits au 64 bits.

## 6.2 Convention d'appel en 32 bits

### 6.2.1 La pile

Lorsque l'on appelle un sous-programme en 32 bits on passe les paramètres dans
la pile. La pile est une partie de la mémoire centrale qui sert d'espace de stockage.
Elle permet de :

- Garder trace des appels de sous-programmes
- Passer les paramètres des sous-programmes
- Créer des variables locales à un sous-programme

En architecture 32 bits, le segment `ss` contient l'adresse du début de la pile et
le sommet de pile se trouve dans le registre `esp`. On utilise le registre `ebp` afin de
récupérer les paramètres placés dans la pile.

Sous Linux, la pile d'un programme possède une taille de **8 Mo**. On peut obtenir
la valeur de cette taille grâce à la commande `ulimit -a` dans le terminal.

Les deux instructions principales utilisées pour manipuler la pile sont `push` et
`pop` mais les instructions `call` et `ret` agissent également sur celle-ci.

#### 6.2.1.1 push

L'instruction `push` consiste à mettre la valeur d'un registre, un emplacement
mémoire ou une constante dans la pile. La pile est un tableau d'octets rempli **par le
haut** (adresses décroissantes).

Par exemple `push eax` consiste à **abaisser** le sommet de pile puis y écrire la
valeur contenue dans `eax`, ce qui se résume aux deux instructions suivantes :

```nasm
sub esp, 4
mov [esp], eax
```

On soustrait ici 4 octets à `esp` car `eax` est un registre 32 bits.

#### 6.2.1.2 pop

L'instruction `pop` fonctionne de manière inverse. Par exemple `pop eax` lit la
valeur en sommet de pile et la stocke dans `eax` puis **remonte** le sommet de pile :

```nasm
mov eax, [esp]
add esp, 4
```

Il existe d'autres instructions pour empiler/dépiler :

- `pusha` : place dans la pile l'ensemble des registres généraux 16 bits (`ax`, `cx`, `dx`, `bx`, `sp`, `bp`, `si`, `di`)
- `pushad` : place dans la pile l'ensemble des registres généraux 32 bits (`eax`, `ecx`, `edx`, `ebx`, `esp`, `ebp`, `esi`, `edi`)
- `pushf` : place dans la pile le registre 16 bits `flags`
- `pushfd` : place dans la pile le registre 32 bits `eflags`

Et leurs équivalents inverses : `popa`, `popad`, `popf`, `popfd`.

### 6.2.2 Procédure d'appel en 32 bits

L'appel de sous-programme en 32 bits suit la convention d'appel du langage C
sous Linux. On distingue le sous-programme **appelant** (*caller*) et le sous-programme
**appelé** (*callee*).

| Étape | Sous-programme appelant (Caller) | Sous-programme appelé (Callee) |
|---|---|---|
| 1 | Placer les paramètres dans la pile dans l'ordre inverse | |
| 2 | Appel du sous-programme (`call`) | |
| 3 | | Entrée : sauvegarde de `ebp`, mise à jour de `ebp` |
| 4 | | Récupération des paramètres grâce à `ebp` |
| 5 | | Exécution du sous-programme |
| 6 | | Sortie : mise à jour de `esp`, restauration de `ebp` |
| 7 | Suppression des paramètres mis dans la pile | |

*TABLE 6.1 – Appel de sous-programme en 32 bits, convention du langage C*

### 6.2.3 Registres à préserver

La convention d'appel en 32 bits en langage C impose que le sous-programme
appelé ne modifie pas certains registres. Ces registres sont `ebp`, `ebx`, `esi` et `edi`.
Il est donc nécessaire, une fois entré dans le sous-programme appelé, de **sauvegarder
ces registres dans la pile** si on a l'intention de les modifier.

Les registres qui peuvent être modifiés librement sont : `eax`, `ecx` et `edx`.

> *Moyen mnémotechnique* :
> **AuX CieuX, les DieuX,**
> **BaPtisent des DIsSIdents BelliqueuX.**
>
> - 1ère ligne → registres modifiables : `ax`, `cx`, `dx` (soit `eax`, `ecx`, `edx`)
> - 2ème ligne → registres à préserver : `bp`, `di`, `si`, `bx` (soit `ebp`, `edi`, `esi`, `ebx`)

### 6.2.4 Valeur de retour

Lorsqu'un sous-programme retourne une valeur il doit le faire en suivant la
convention du langage C :

- S'il s'agit d'une valeur entière (entier, pointeur), on la place dans le registre `eax`
- S'il s'agit d'un nombre à virgule flottante, on le place dans `st0` le sommet de pile du coprocesseur

### 6.2.5 Exemple complet en 32 bits

Prenons un exemple simple :

```c
int sum(int a, int b) {
    int r;
    r = a + b;
    return r;
}

int main() {
    sum(4, 5);
}
```

Le *caller* (`main`) appelle le *callee* (`sum`) qui retourne une valeur entière.

#### 6.2.5.1 Le sous-programme main (caller)

```nasm
; Listing 6.2.1 – Appelant en 32 bits
main:
    mov  eax, 5       ; place dans un registre le second paramètre
    push eax          ; place dans la pile le second paramètre
    push dword 4      ; place le premier paramètre
    call sum          ; appel du sous-programme
    add  esp, 8       ; supprime les paramètres
    ret
```

> *Listing 6.2.1 – Appelant en 32 bits*

> **Convention — ordre des paramètres** : par convention en C (architecture 32 bits),
> on place le **dernier** paramètre en premier dans la pile et le **premier** paramètre en
> dernier. Pour notre exemple : on commence par 5 et on termine par 4.

#### 6.2.5.2 Le sous-programme sum (callee)

```nasm
; Listing 6.2.2 – Appelé en 32 bits
sum:
    push ebp              ; entrée : sauvegarde de ebp
    mov  ebp, esp         ; ebp pointe sur le sommet de pile actuel
    sub  esp, 4           ; création de la variable locale 'r'
    push ebx              ; sauvegarde de ebx (registre à préserver)
    mov  eax, [ebp+8]     ; chargement de 'a'
    mov  ebx, [ebp+12]    ; chargement de 'b'
    add  eax, ebx         ; calcul du résultat
    mov  [ebp-4], eax     ; stockage du résultat dans 'r'
    mov  eax, [ebp-4]     ; valeur de retour dans eax
    pop  ebx              ; restauration de ebx
    mov  esp, ebp         ; sortie : restauration de esp
    pop  ebp              ; restauration de ebp
    ret
```

> *Listing 6.2.2 – Appelé en 32 bits*

**Entrée dans la fonction** (3 étapes) :

1. Sauvegarder `ebp` puis affecter à `ebp` la valeur de `esp` — cela permet d'accéder
   aux paramètres et aux variables locales via `ebp`
2. Créer les variables locales en abaissant `esp` (ici 4 octets pour la variable `r`)
3. Sauvegarder les registres à préserver (ici `ebx`)

**Accès aux paramètres** via `ebp` :

- 1er paramètre `a` : `[ebp + 8]`
- 2ème paramètre `b` : `[ebp + 12]`
- nème paramètre : `[ebp + 4×(n+1)]`
- Variables locales : `[ebp - x]`

> **Taille des paramètres** : que le paramètre soit un octet ou un mot, on le stocke
> sur 32 bits. S'il s'agit d'une chaîne ou d'un tableau, on passe son adresse (32 bits).

**Sortie de la fonction** (ordre inverse) :

1. Placer la valeur de retour dans `eax`
2. Restaurer `ebx`
3. Rétablir `esp` à sa valeur d'entrée, puis restaurer `ebp`
4. Exécuter `ret`

> **Note** : il n'est pas nécessaire de supprimer explicitement la variable locale `r`
> car l'instruction `mov esp, ebp` (étape 3 de la sortie) le fait automatiquement.

#### 6.2.5.3 Suppression des paramètres

Les paramètres mis dans la pile dans `main` doivent être supprimés après l'appel.
On a placé deux entiers 32 bits donc 2 × 4 = 8 octets. D'où l'instruction `add esp, 8`
dans `main` après le `call`.

La convention du langage C impose que ce soit le **sous-programme appelant** qui
supprime les paramètres (contrairement au Pascal où c'est le sous-programme appelé).
Ceci permet à C de supporter des fonctions à nombre variable de paramètres comme `printf`.

### 6.2.6 Instructions enter et leave

L'entrée et la sortie d'un sous-programme peuvent également être réalisées avec les
instructions `enter` et `leave` :

```nasm
; équivalent avec enter/leave :
push ebp          ; → enter 4, 0 (remplace push ebp + mov ebp, esp + sub esp, 4)
mov  ebp, esp
sub  esp, 4
...
mov  esp, ebp     ; → leave (remplace mov esp, ebp + pop ebp)
pop  ebp
ret
```

### 6.2.7 Appel rapide (fastcall)

La convention classique `cdecl` consiste à passer les paramètres dans la pile.
Il existe en 32 bits la possibilité d'un appel dit **rapide** (*fastcall*) : on passe les
paramètres dans les registres `ecx` et `edx`. Si un sous-programme dispose de plus
de 2 paramètres, les registres sont utilisés pour les premiers et la pile pour le reste.

Pour déclarer une fonction `fastcall` depuis un fichier C ou C++ :

```c
// en C
extern int ma_fonction(int a, int b) __attribute__((fastcall));
```

```cpp
// en C++
extern "C" {
    int ma_fonction(int a, int b) __attribute__((fastcall));
}
```

## 6.3 Convention d'appel en 64 bits (System V AMD64 ABI)

Afin d'écrire des fonctions en assembleur et de pouvoir les interfacer avec un
programme C il est nécessaire de définir une convention d'appel. Sous Linux on
utilise la convention **System V AMD64 ABI**.

| Paramètre | 64 bits | 32 bits | 16 bits | 8 bits |
|---|---|---|---|---|
| 1 | `rdi` | `edi` | `di` | `dil` |
| 2 | `rsi` | `esi` | `si` | `sil` |
| 3 | `rdx` | `edx` | `dx` | `dl` |
| 4 | `rcx` | `ecx` | `cx` | `cl` |
| 5 | `r8` | `r8d` | `r8w` | `r8b` |
| 6 | `r9` | `r9d` | `r9w` | `r9b` |

*TABLE 6.2 – Ordre des registres entiers pour la convention d'appel C sous Linux 64 bits*

Caractéristiques de la convention 64 bits :

- Les paramètres sont passés **dans des registres** (fastcall), s'il n'y en a pas assez on utilise la pile
- Pour les entiers/pointeurs : `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`
- Pour les flottants : partie basse des registres `xmm0` à `xmm7`
- Valeur de retour entière : `rax`
- Valeur de retour flottante : partie basse de `xmm0`
- Registres à préserver : `rbp`, `rbx`, `r12` à `r15`

Un maximum de **14 paramètres** (6 entiers + 8 réels) peuvent être passés dans des registres.

### 6.3.1 Entrée et sortie d'un sous-programme en 64 bits

Pour entrer dans une fonction on peut procéder comme en 32 bits :

```nasm
push rbp
mov  rbp, rsp
...
mov  rsp, rbp
pop  rbp
ret
```

Néanmoins si tous les paramètres sont dans des registres cela n'est pas nécessaire
et on peut faire l'économie de ces 4 instructions.

### 6.3.2 La red zone

En 64 bits sous Linux, la zone mémoire de **128 octets** située de `[rsp-128]` à `[rsp]`
juste après l'appel d'un sous-programme (la ***red zone***) **ne sera pas modifiée** par
les interruptions. On peut donc l'utiliser pour stocker temporairement des valeurs,
à condition de ne pas faire de `push` ou de `call`.

> **Note** : sous Windows cette zone n'est **pas** disponible.

### 6.3.3 Adressage en 64 bits

Les adresses doivent être précisées en utilisant les registres 64 bits uniquement.
La manipulation de la pile par `push` et `pop` impose également d'utiliser des registres
de 64 bits.

### 6.3.4 Exemple en 64 bits

On considère la fonction C suivante qui calcule la somme des éléments `t[i]/a` d'un
tableau `t` avec `a` une constante :

```c
float sum(float *t, int n, float a) {
    float s = 0;
    for (int i = 0; i < n; i++)
        s = s + t[i] / a;
    return s;
}
```

D'après la convention 64 bits, lors de l'entrée dans le sous-programme :
- `t` (pointeur float) est dans `rdi`
- `n` (taille, `int`) est dans `esi` (32 bits suffisent)
- `a` (float) est dans `xmm0`

Traduction avec `g++ -O2` (Listing 6.3.1) :

```nasm
; Listing 6.3.1 – Traduction en 64 bits de la fonction sum
sum:
    test  esi, esi          ; si n == 0 alors sortir
    jle   .L4               ; du sous-programme
    lea   eax, [rsi+1]
    pxor  xmm2, xmm2        ; s = xmm2 = 0
    lea   rax, [rdi+rax*4+4]
.L3:
    movss xmm1, [rdi]
    add   rdi, 4            ; ++tab
    divss xmm1, xmm0        ; xmm1 /= a
    addss xmm2, xmm1        ; s += xmm1
    cmp   rdi, rax          ; si &t[i] < &tab[N] boucler
    jne   .L3
    movaps xmm0, xmm2       ; résultat placé dans xmm0
    ret
.L4:
    pxor  xmm2, xmm2        ; résultat mis à 0
    movaps xmm0, xmm2
    ret
```

> *Listing 6.3.1 – Traduction en 64 bits de la fonction sum*

Version plus concise (Listing 6.3.2) :

```nasm
; Listing 6.3.2 – Traduction en 64 bits de la fonction sum - version améliorée
sum:
    xorps xmm2, xmm2        ; s = 0
    test  esi, esi           ; si n <= 0 alors sortir
    jle   .end
    lea   rax, [rdi+rsi*4]  ; rax = adresse de fin du tableau
.while:
    movss xmm1, [rdi]
    add   rdi, 4             ; ++tab
    divss xmm1, xmm0         ; xmm1 /= a
    addss xmm2, xmm1         ; s += tab[i] / a
    cmp   rdi, rax            ; si &t[i] < &tab[N] boucler
    jne   .while
.end:
    movaps xmm0, xmm2         ; résultat placé dans xmm0
    ret
```

> *Listing 6.3.2 – Traduction en 64 bits de la fonction sum — version améliorée*

> **Note** : puisque `a` est une constante, la division peut être sortie de la boucle :
> `∑ t[i]/a = (1/a) × ∑ t[i]`

### 6.3.5 Points importants en 64 bits

#### 6.3.5.1 Appel de fonctions externes (PLT)

L'appel de fonctions externes, comme `printf`, doit être réalisé en utilisant le
mécanisme de **PLT** (*Procedure Linkage Table*). Ce mécanisme permet l'appel de
fonctions dont l'adresse n'est pas connue lors de l'édition de liens.

Il faut alors suffixer les fonctions par `WRT ..plt` où *WRT* signifie *With Respect to* :

```nasm
call printf WRT..plt
```

#### 6.3.5.2 PIC et PIE

En 64 bits, on utilise généralement le **PIC** (*Position Independent Code*) qui se
base sur l'adressage relatif par rapport au registre `rip`.

Le **PIE** (*Position Independent Executable*) est une fonction de sécurité qui permet
aux exécutables d'être chargés à des adresses mémoire aléatoires (protection contre
les attaques ROP et débordements de tampon).

Par défaut, certaines distributions modernes de `gcc` génèrent du PIE. Dans le cadre
de la programmation assembleur de cet ouvrage, on utilisera l'option **`-no-pie`** lors
de l'édition de liens pour simplifier notre code :

```bash
gcc -no-pie -o mon_prog mon_prog.o
```

Avec `nasm` l'adressage est absolu par défaut. Pour passer à l'adressage relatif :

```nasm
default rel
```

#### 6.3.5.3 Alignement de la pile sur 16 octets

Les conventions d'appel en 64 bits imposent qu'avant l'appel d'un sous-programme,
`rsp` soit **multiple de 16 octets**. Or `call` place 8 octets dans la pile (adresse de
retour), donc une fois dans le sous-programme appelé, `rsp` est multiple de 8.

Si on appelle une fonction de la bibliothèque C (ex. `scanf`), certaines versions de
la `glibc` utilisent des instructions comme `movaps` qui requièrent une adresse
multiple de 16. Si `rsp` n'est pas aligné, on obtient une **erreur de segmentation**.

Pour résoudre le problème, avant l'appel on aligne `rsp` sur un multiple de 16 :

```nasm
push rbx          ; ou tout autre registre 64 bits (ajoute 8 octets)
; ou :
sub  rsp, 8       ; abaisse le sommet de pile de 8 octets
; ou :
and  rsp, ~0xF    ; alignement sur le multiple de 16 inférieur
```

Exemple complet pour lire un entier en 64 bits :

```nasm
extern scanf

section .data
    s:  db "%d", 0
    a:  dd 0

section .text
; scanf("%d", &a)
my_call_to_scanf:
    sub  rsp, 8         ; rsp multiple de 16
    lea  rdi, [s]
    lea  rsi, [a]
    mov  eax, 0         ; pas de flottant traité
    call scanf WRT..plt
    add  rsp, 8         ; on supprime les octets utilisés pour l'alignement
    ret
```

Le désassemblage montre l'adressage absolu vs relatif (PIC) :

```text
; adressage absolu (-no-pie) :
0:  48 83 ec 08   sub  rsp, 0x8
4:  48 8d 3c 25   lea  rdi, ds:0x0   ; R_X86_64_32S
c:  48 8d 34 25   lea  rsi, ds:0x0   ; R_X86_64_32S
14: b8 00 00 00   mov  eax, 0x0
19: e8 00 00 00   call scanf          ; R_X86_64_PLT32
1e: 48 83 c4 08   add  rsp, 0x8

; adressage relatif (PIC) :
0:  48 83 ec 08   sub  rsp, 0x8
4:  48 8d 3d 00   lea  rdi, [rip+0x0] ; R_X86_64_PC32
b:  48 8d 35 00   lea  rsi, [rip+0x0] ; R_X86_64_PC32
12: b8 00 00 00   mov  eax, 0x0
17: e8 00 00 00   call scanf           ; R_X86_64_PLT32
1c: 48 83 c4 08   add  rsp, 0x8
```

#### 6.3.5.4 Macro-instructions defsp / endsp

Pour l'entrée dans un sous-programme en 64 bits, il est recommandé de procéder
comme en 32 bits en passant par `rbp` :

1. Sauvegarder `rbp`
2. Copier `rsp` dans `rbp`
3. Sauvegarder les registres à préserver si modifiés
4. Aligner `rsp` sur un multiple de 16

Pour la sortie :

1. Restaurer les registres sauvegardés
2. Copier `rbp` dans `rsp`
3. Restaurer `rbp`
4. `ret`

Afin de simplifier l'écriture, on peut définir deux macro-instructions `nasm` :

- `defsp` (*define sub program*) — gère l'entrée
- `endsp` (*end sub program*) — gère la sortie

```nasm
%macro defsp 1-*
%1:
    %rotate 1
    push rbp
    mov  rbp, rsp
    %rep %0 - 1
        %ifnum %1
            sub rsp, %1
        %else
            push %1
        %endif
        %rotate 1
    %endrep
    and  rsp, ~0xF
%endmacro
```

Appel de la macro :

```nasm
defsp main, rdi, rsi, 100, rbx
```

Ce qui génère :

```nasm
main:
    push rbp
    mov  rbp, rsp
    push rdi
    push rsi
    sub  rsp, 100
    push rbx
    and  rsp, ~0xF
```

La macro `endsp` permet de récupérer les valeurs mises dans la pile :

```nasm
%macro endsp 1-*
end_%1:
    %rotate 1
    %assign i 8
    %rep %0 - 1
        %ifnum %1
            %assign i i + %1
        %else
            mov %1, [rbp-i]
            %assign i i + 8
        %endif
        %rotate 1
    %endrep
    mov rsp, rbp
    pop rbp
    ret
%endmacro
```

Appel :

```nasm
endsp main, rdi, rsi, 100, rbx
```

Ce qui génère :

```nasm
end_main:
    mov rdi, [rsp-8]
    mov rsi, [rsp-16]
    mov rbx, [rsp-124]
    mov rsp, rbp
    pop rbp
    ret
```

## 6.4 Comparaison 32 bits vs 64 bits

Un code C compilé en 64 bits s'exécute normalement plus rapidement que du code
32 bits parce que :

- Le passage des paramètres se fait dans les registres (pas de lecture/écriture en mémoire pile)
- On dispose de plus de registres de calcul (pour stocker des résultats temporaires)

Il semble donc préférable d'écrire le code assembleur uniquement en 64 bits.
Cependant dans certains cas particuliers, un programme 32 bits peut être plus rapide.

## 6.5 Bilan

### 6.5.1 Résumé

- En architecture 32 bits, les paramètres sont passés dans la **pile**. Les valeurs
  de retour entières sont dans `eax`, les flottantes dans `st0` (sommet FPU)
- En architecture 64 bits, les paramètres entiers/pointeurs sont passés dans
  `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9` et les flottants dans `xmm0`–`xmm7`.
  Les valeurs de retour entières sont dans `rax`, les flottantes dans `xmm0`
- Les conventions d'appel en 32 et 64 bits étant très différentes, il est souvent
  nécessaire de modifier le code assembleur pour passer d'une architecture à l'autre

### 6.5.2 Objectifs

Il faut être en mesure de :

- Réaliser un appel de sous-programme en 32 bits
- Récupérer les arguments d'un sous-programme écrit en 32 bits
- Réaliser un appel de sous-programme en 64 bits
- Savoir dans quels registres se trouvent les arguments d'un sous-programme écrit en 64 bits

## 6.6 Exercices

**Exercice 27** – Réaliser le codage du sous-programme suivant en 32 bits, puis en 64 bits :

```c
float exercise27(int *tab, int n) {
    float sum = 0;
    for (int i = 0; i < n; i++) {
        tab[i] = tab[i] * 2;
        sum += tab[i] * 1.25f;
    }
    return sum;
}
```

**Exercice 28** – Réaliser le codage du sous-programme suivant en 32 bits, puis en 64 bits :

```c
double exercise28(double *tab, int n, double k) {
    double sum = 0;
    for (int i = 0; i < n; i++)
        sum += tab[i] + k;
    return sum;
}
```
