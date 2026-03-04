# Chapitre 5 : Traitements de base

## 5.1 Introduction

Dans ce chapitre nous allons découvrir et nous familiariser avec les instructions
de base de l'assembleur x86. Avant de nous diriger dans les chapitres suivants
vers la découverte des instructions du coprocesseur arithmétique et celles des
unités vectorielles, nous définissons de manière plus détaillée les registres des
processeurs d'architecture x86 puisque les instructions agissent sur ces registres.

Nous présentons les instructions les plus souvent utilisées car la connaissance de
l'ensemble des instructions assembleur représente 10 volumes de documentation Intel,
soit plus de 4800 pages. Nous verrons également comment traduire les structures de
contrôle du langage C comme les conditionnelles (`if`, `switch`) et les boucles (`for`, `while`).

## 5.2 Les registres

### 5.2.1 Architecture 16 bits (Intel 8086)

L'Intel 8086 disposait de 8 registres 16 bits dont certains sont manipulables
en deux fois 8 bits dits partie haute et partie basse.

| Registre 16 bits | Partie Haute (bits 15-8) | Partie Basse (bits 7-0) | Utilisation |
|---|---|---|---|
| `ax` | `ah` | `al` | accumulateur, multiplication, division |
| `bx` | `bh` | `bl` | accès mémoire |
| `cx` | `ch` | `cl` | compteur, répétition (`rep`), décalage |
| `dx` | `dh` | `dl` | `in`/`out`, multiplication, division |
| `si` | — | — | source index, `lods`, `movs` |
| `di` | — | — | destination index, `stos`, `movs` |
| `bp` | — | — | base pointer, pile |
| `sp` | — | — | stack pointer, sommet de pile |

*TABLE 5.1 – Registres 16 bits du Intel 8086*

Par exemple le registre `ax` est appelé **accumulateur** et permet de réaliser certaines
opérations comme la multiplication, la division mais reçoit également le résultat
des instructions comme `lodsb`, `lodsw`, `lodsd`. On est en mesure de manipuler la
partie haute nommée `ah` ou la partie basse `al`.

Les autres registres importants sont :

- `ip` : *Instruction Pointer*, l'adresse de la prochaine instruction en mémoire
- `flags` : mis à jour après exécution de la plupart des instructions. Ses bits clés sont :
  - **bit 0 : CF** (*Carry Flag*) — le bit de retenue
  - **bit 2 : PF** (*Parity Flag*) — indique un nombre pair de bits à 1
  - **bit 4 : AF** (*Adjust Flag*)
  - **bit 6 : ZF** (*Zero Flag*) — indique une valeur nulle
  - **bit 7 : SF** (*Sign Flag*) — indique une valeur négative
  - **bit 10 : DF** (*Direction Flag*) — utilisé avec `lods`, `stos`, etc.
  - **bit 11 : OF** (*Overflow Flag*) — débordement pour les calculs signés

Par exemple, le *Carry Flag* est utilisé lors de l'addition pour signaler qu'une retenue a
été produite. Le bit de débordement (*Overflow*) indique qu'une opération arithmétique a
produit un résultat signé invalide.

Par exemple si `al` et `bl` contiennent la valeur 128, l'addition de ces deux registres :

- met à **1** le *Carry Flag* puisque le résultat devrait être 256, mais cette valeur
  ne peut pas être représentée sur 8 bits
- met à **1** l'*Overflow Flag* car si on considère que les données sont signées,
  l'addition de deux valeurs négatives (−128 + −128) donne une valeur positive (0)

Si au contraire on utilise les registres `ax` et `bx` alors CF et OF restent à **0** puisque
dans les deux cas (signé ou non signé) les valeurs sont positives, on effectue la
somme 128 + 128.

Il existe d'autres cas de positionnement de l'*Overflow Flag* lors de la soustraction :

- Soustraction entre une valeur négative et un nombre positif qui donne un
  résultat positif alors que le résultat devrait être négatif : *−128 − 1*
- Soustraction entre une valeur positive et un nombre négatif qui donne un
  résultat négatif alors que le résultat devrait être positif : *127 − (−1)*

Nous avons en outre évoqué les registres de segments qui contiennent une adresse
mémoire : `cs` (code), `ds` (données), `ss` (pile) et `es` (*Extra Segment*).

### 5.2.2 Architecture 32 bits

En architecture 32 bits, les registres généraux ont une taille de 32 bits.
Les registres du 8086 sont toujours utilisables mais ont été étendus et se nomment
`eax`, `ebx`, ... `esp`, `eip`, `eflags`. On peut toujours utiliser les registres
16 et 8 bits comme `ax`, `ah` ou `al`.

| Registre 32 bits | Partie Basse 16 bits | Partie Haute 8 bits | Partie Basse 8 bits |
|---|---|---|---|
| `eax` | `ax` | `ah` | `al` |
| `ebx` | `bx` | `bh` | `bl` |
| `ecx` | `cx` | `ch` | `cl` |
| `edx` | `dx` | `dh` | `dl` |
| `esi` | `si` | — | — |
| `edi` | `di` | — | — |
| `ebp` | `bp` | — | — |
| `esp` | `sp` | — | — |

*TABLE 5.2 – Registres manipulables en architecture 32 bits*

Les registres `eip` et `eflags` sont les extensions de `ip` et `flags`. On a également
ajouté deux autres registres de segment appelés `fs` et `gs`.

### 5.2.3 Architecture 64 bits

L'architecture 64 bits apporte plusieurs changements importants. Les registres
ont une taille de 64 bits et sont appelés `rax`, `rbx`, ... `rsp`, `rip`, `rflags`.

On dispose également de 8 nouveaux registres nommés `r8` à `r15` ce qui laisse une
plus grande marge de manœuvre pour la programmation.

| Registre 64 bits | Partie 32 bits | Partie 16 bits | Partie haute 8 bits | Partie basse 8 bits |
|---|---|---|---|---|
| `rax` | `eax` | `ax` | `ah` | `al` |
| `rbx` | `ebx` | `bx` | `bh` | `bl` |
| `rcx` | `ecx` | `cx` | `ch` | `cl` |
| `rdx` | `edx` | `dx` | `dh` | `dl` |
| `rsi` | `esi` | `si` | — | `sil` |
| `rdi` | `edi` | `di` | — | `dil` |
| `rbp` | `ebp` | `bp` | — | `bpl` |
| `rsp` | `esp` | `sp` | — | `spl` |
| `r8` | `r8d` | `r8w` | — | `r8b` |
| ... | ... | ... | ... | ... |
| `r15` | `r15d` | `r15w` | — | `r15b` |

*TABLE 5.3 – Registres manipulables en architecture 64 bits*

On notera que l'on peut manipuler les premiers 8 bits de certains registres comme
`rsi` (via `sil`) alors que cela n'est pas possible en 32 bits.

### 5.2.4 Evolution de la taille des registres

Le passage des microprocesseurs 8 bits à 16, 32 puis 64 bits a permis de gérer
une quantité de mémoire plus importante et des nombres plus grands en une seule
opération. Avec 32 bits on gère *4 × 10⁹* valeurs alors qu'avec 64 bits on atteint
un ordre de grandeur de *18 × 10¹⁸*, soit *18 Eo* (Exa octets).

## 5.3 Les instructions

### 5.3.1 Format général

La grande majorité des instructions x86 sont de la forme :

```nasm
operation destination, source
```

- `operation` est un mnémonique, par exemple `add` pour l'addition
- `source` est une donnée en lecture (constante, registre ou adresse mémoire)
- `destination` est une donnée en écriture (registre ou adresse mémoire)

En fait la syntaxe traduit le traitement :

> *destination = destination operation source*

Ainsi `add eax, ebx` signifie `eax = eax + ebx`.

Il existe une contrainte imposée par le format de codage des instructions x86 : on
ne peut avoir **qu'une seule référence mémoire**. On ne peut donc pas écrire :

```nasm
; INCORRECT :
operation [adresse1], [adresse2]
```

Il faudra passer par un registre :

```nasm
mov registre, [adresse2]
operation [adresse1], registre
```

Lorsque l'on fait référence à une donnée en mémoire, on place l'adresse entre
crochets `[]`. Ainsi :

- `mov eax, [addr]` : placer la valeur 32 bits située à l'adresse `addr` dans `eax`
- `mov eax, val` : placer la valeur constante `val` dans `eax`

### 5.3.2 Instructions arithmétiques

#### 5.3.2.1 mov : chargement et stockage

L'instruction `mov` réalise le chargement (*Load*) et le stockage (*Store*) des données.
C'est l'instruction la plus souvent utilisée. Elle n'influe **pas** sur le registre `flags`.

Quelques exemples :

- `mov eax, 0` : affecter la valeur 0 au registre `eax`
- `mov eax, ebx` : affecter le contenu de `ebx` au registre `eax`
- `mov al, bh` : affecter le contenu de `bh` au registre `al`
- `mov eax, [ebx+ecx*4]` : affecter au registre `eax` la valeur à l'adresse `ebx+ecx*4`
- `mov [edi+esi], edx` : stocker à l'adresse `edi+esi` la valeur contenue dans `edx`

Il existe deux variantes de `mov` :

- `movsx` (*Mov with Sign eXtension*) : transforme une valeur 8 (resp. 16 bits) en 16 (resp. 32 bits) en préservant le signe
- `movzx` (*Mov with Zero eXtend*) : transforme une valeur 8 ou 16 bits en 16, 32 ou 64 bits en la complétant avec des 0

`movzx` est parfois plus rapide. Il est préférable d'écrire :

```nasm
movzx eax, byte [edi]
```

plutôt que :

```nasm
mov al, [edi]
```

La différence est que `movzx` va modifier `eax` en mettant dans `al` l'octet pointé
par `edi` et en mettant à 0 les 24 autres bits.

#### 5.3.2.2 add, sub, inc et dec

Les instructions `add` et `sub` réalisent respectivement l'addition et la soustraction.
Les instructions `inc` et `dec` réalisent l'incrémentation et la décrémentation.
Ces deux dernières instructions sont donc équivalentes :

```nasm
add eax, 1
inc eax
```

Il existe également `adc` (*ADd with Carry*) qui réalise une addition en prenant en
compte la retenue. Par exemple pour calculer *a + b* où *a = 0x2FFFF* et *b = 0x40001*
avec des registres 16 bits :

```nasm
mov ax, 0xFFFF
mov dx, 0x2    ; dx:ax = 0x2FFFF
mov bx, 0x0001
mov cx, 0x4    ; cx:bx = 0x40001
```

Si on réalise le calcul en écrivant :

```nasm
add ax, bx
add dx, cx  ; ne prend pas en compte la retenue !
```

On obtient un résultat faux. On doit donc écrire :

```nasm
add ax, bx
adc dx, cx  ; prend en compte la retenue
```

> **Note** : Il est conseillé de ne pas utiliser `inc` et `dec` car elles peuvent produire
> dans certaines situations des *false dependencies* et des *partial flag register stalls*.
> On préférera `add reg, 1`.

#### 5.3.2.3 mul

L'instruction `mul` n'accepte qu'une seule opérande source et réalise la multiplication
**non signée** entre un registre 8, 16 ou 32 bits et respectivement `al`, `ax`, `eax`.

| Opération | Source | Résultat |
|---|---|---|
| `mul reg8` | reg8 × `al` | → `ax` |
| `mul reg16` | reg16 × `ax` | → `dx:ax` |
| `mul reg32` | reg32 × `eax` | → `edx:eax` |

*TABLE 5.4 – Modes d'utilisation de mul*

Pour calculer 7 × 5 :

```nasm
push edx        ; on sauvegarde edx
mov eax, 5
mov ecx, 7
mul ecx         ; edx:eax = 0:35
pop edx         ; on restaure edx
```

#### 5.3.2.4 imul

`imul` réalise la multiplication de valeurs **signées** et possède trois formats :

```nasm
imul ecx              ; edx:eax = eax * ecx (comme mul)
imul ebx, ecx         ; ebx = ebx * ecx (edx pas modifié)
imul ebx, ecx, 3      ; ebx = ecx * 3 (edx pas modifié)
```

#### 5.3.2.5 div et le modulo

L'instruction `div` réalise la division entière **non signée**. Le reste de la division
est également calculé (modulo).

| Dividende | Diviseur | Quotient | Reste |
|---|---|---|---|
| `edx:eax` | reg32 | `eax` | `edx` |
| `dx:ax` | reg16 | `ax` | `dx` |
| `ax` | reg8 | `al` | `ah` |

*TABLE 5.5 – Comportement de l'instruction div*

Pour diviser 1024 par 3 :

```nasm
mov eax, 1024
xor edx, edx  ; mise à zéro de edx pour rester en 32 bits
mov ecx, 3
div ecx
; eax = 341 (quotient), edx = 1 (reste)
```

> **Attention** : si `edx` n'est pas mis à zéro avant la division, le résultat sera
> incorrect car c'est `edx:eax` qui est divisé. Si le résultat dépasse `0xFFFFFFFF`,
> le microprocesseur lève une exception.

Pour une division **signée** on utilise `idiv` avec `cdq` pour convertir `eax` en `edx:eax` :

```nasm
mov eax, -6
cdq           ; edx = FF_FF_FF_FF
mov ecx, 3
idiv ecx      ; eax = -2 (quotient), edx = 0 (reste)
```

#### 5.3.2.6 idiv

`idiv` réalise la division de valeurs **signées** avec le même format que `div`.
Pour diviser 23 par −7 :

```nasm
xor edx, edx
mov eax, 23
mov ecx, -7
idiv ecx
; eax = -3, edx = 2
```

#### 5.3.2.7 neg

L'instruction `neg` réalise le **complément à deux** (*Two's Complement Negation*).
Si `eax` contient la valeur −1 alors `neg eax` produira la valeur 1.

> **Attention** : `neg` met le *Carry Flag* à 0 si la valeur initiale est 0, sinon CF = 1.

#### 5.3.2.8 lea

L'instruction `lea` (*Load Effective Address*) réalise une multiplication et une
addition **sans accès à la mémoire**. Ainsi :

```nasm
lea eax, [ebx+ecx*4+9]
```

signifie que l'on calcule `ebx + ecx * 4 + 9` et qu'on affecte le résultat à `eax`.
**Il n'y a pas d'accès à la mémoire !**

Pour multiplier `eax` par 5 sans multiplication coûteuse :

```nasm
lea eax, [eax+eax*4]
```

Le facteur d'échelle ne peut être que 1, 2, 4 ou 8.

### 5.3.3 Instructions logiques

Les instructions logiques (ou binaires) permettent de réaliser des opérations sur les
bits de leurs opérandes.

| x | y | `and(x,y)` | `or(x,y)` | `xor(x,y)` |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 1 |
| 1 | 0 | 0 | 1 | 1 |
| 1 | 1 | 1 | 1 | 0 |

*TABLE 5.6 – Table de vérité pour les fonctions and, or, xor*

#### 5.3.3.1 and et or

`and` permet de sélectionner des bits spécifiques d'un registre.
`or` permet de positionner certains bits à 1.

```nasm
and eax, 0x07       ; sélectionne les 3 bits de poids faible
or  eax, 0x80000000 ; fixe le bit de poids fort à 1
```

#### 5.3.3.2 xor

`xor` réalise le **ou exclusif**. Utilisé sous la forme `xor reg, reg` c'est un moyen
de mettre la valeur 0 dans le registre :

```nasm
xor al, al   ; mise à zéro de al
xor ecx, ecx ; mise à zéro de ecx
```

#### 5.3.3.3 not

`not` réalise le **complément**, c'est à dire qu'on change les bits à 1 en 0 et inversement.
Avec `nasm`, il existe l'opérateur `~` qui réalise le `not` :

```nasm
mov eax, ~7
```

au lieu de :

```nasm
mov eax, 7
not eax
```

### 5.3.4 Instructions de décalage

#### 5.3.4.1 shl, shr

`shl` (*SHift Left*) et `shr` (*SHift Right*) réalisent des décalages. La source est une
constante ou le registre `cl`.

Décaler un registre de *n* rangs vers la gauche = multiplication par *2ⁿ*.
Décaler à droite = division par *2ⁿ*.

```nasm
mov eax, 17
shl eax, 5  ; eax = 17 * 2^5 = 544
shr eax, 7  ; eax = 544 / 2^7 = 4
```

#### 5.3.4.2 sar

`sar` (*Shift Arithmetic Right*) permet de réaliser une division par une puissance de 2
**en préservant le signe** :

```nasm
mov eax, -128  ; eax = 0xFFFFFF80
shr eax, 2     ; eax = 0x3FFFFFE0 = 1073741792 (signe non préservé)
mov eax, -128  ; eax = 0xFFFFFF80
sar eax, 2     ; eax = 0xFFFFFFE0 = -32 (signe préservé)
```

Il existe également `rcl` (*Rotate Carry Left*), `rcr`, `rol` (*ROtate Left*), `ror`.

### 5.3.5 Instructions de comparaison

#### 5.3.5.1 cmp

`cmp` (*CoMPare*) réalise la comparaison de deux opérandes en calculant leur
différence. Les opérandes ne sont **pas** modifiées, seul le registre `flags` est mis à jour.

| `cmp eax, ebx` | CF | SF | ZF |
|---|---|---|---|
| `eax == ebx` | 0 | 0 | 1 |
| `eax < ebx` | 1 | 1 | 0 |
| `eax > ebx` | 0 | 0 | 0 |

*TABLE 5.7 – Influence sur les bits du registre flags de la comparaison*

#### 5.3.5.2 test

`test` compare deux valeurs en réalisant un `and` entre les deux opérandes
(qui ne seront pas modifiées) et dont le résultat est propagé au niveau du registre `flags`.

```nasm
test eax, eax  ; si eax == 0 alors aller en .end
jz   .end
test eax, 1    ; si le bit de poids faible n'est pas à 1
jz   .pair     ; c'est un nombre pair
```

### 5.3.6 Instructions de branchement

#### 5.3.6.1 Branchements conditionnels (jCC)

Ces instructions sont utilisées après une comparaison (`cmp`, `test`) ou un calcul
afin de modifier le pointeur d'instruction. Elles sont de la forme `jCC adresse`.

| Instruction | Signification | Condition |
|---|---|---|
| `jl` | jump on less | SF ≠ OF |
| `jle` | jump on less or equal | ZF = 1 ou SF ≠ OF |
| `jg` | jump on greater | ZF = 0 et SF = OF |
| `jge` | jump on greater or equal | SF = OF |
| `je` | jump on equal | ZF = 1 |
| `jne` | jump on not equal | ZF = 0 |
| `jz` | jump on zero | ZF = 1 |
| `jnz` | jump on not zero | ZF = 0 |
| `jb` | jump on below | CF = 1 |
| `jbe` | jump on below or equal | CF = 1 ou ZF = 1 |
| `ja` | jump on above | CF = 0 et ZF = 0 |
| `jae` | jump on above or equal | CF = 0 |
| `jcxz` | jump on `cx` equals zero | CX = 0 |
| `jecxz` | jump on `ecx` equals 0 | ECX = 0 |
| `jrcxz` | jump on `rcx` equals 0 | RCX = 0 |
| `jo` | jump on overflow | OF = 1 |
| `jno` | jump on not overflow | OF = 0 |
| `jp` | jump on parity | PF = 1 |
| `jnp` | jump on not parity | PF = 0 |
| `js` | jump on sign | SF = 1 |
| `jns` | jump on not sign | SF = 0 |

*TABLE 5.8 – Instructions de branchement conditionnel et FLAGS affectés*

> **Note** : les termes *less* et *greater* sont utilisés pour des entiers **signés**,
> *below* et *above* pour des entiers **non signés**.

Il existe également l'instruction `loop` qui décrémente `ecx` et se branche si
`ecx ≠ 0`. Elle est équivalente à :

```nasm
.begin:
    ...
    dec ecx
    jnz .begin  ; remplace : loop .begin
```

#### 5.3.6.2 Branchements non conditionnels

- `jmp address` : modifie (*JuMP*) le pointeur d'instruction pour qu'il soit égal à `address`
- `call address` : réalise un appel de sous-programme
- `ret` : réalise le retour de sous-programme

`call` empile l'adresse de l'instruction successeur puis modifie `eip` pour qu'il soit
égal à `address`. `ret` dépile l'adresse en sommet de pile et l'affecte à `eip`.

### 5.3.7 Instructions sur les chaînes (avec préfixe rep)

Ces instructions permettent de réaliser des traitements complexes sur des tableaux.
Elles sont généralement combinées à un **préfixe** comme `rep` (*REPeat*) qui utilise le
registre `ecx` pour indiquer le nombre de répétitions. Il existe également :

- `repe` / `repz` : *REpeat while Equal/Zero*
- `repne` / `repnz` : *REpeat while Not Equal/Zero*

#### 5.3.7.1 lods(b/w/d)

*LOaD String of Byte/Word/Double word* — permet de parcourir un tableau en le
lisant depuis `ds:esi` et en stockant les valeurs respectivement dans `al`, `ax`, `eax`.

#### 5.3.7.2 stos(b/w/d)

*STOre String of Byte/Word/Double word* — permet d'écrire la même valeur dans un
tableau vers `ds:edi` depuis `al`, `ax`, `eax`.

#### 5.3.7.3 movs(b/w/d)

*MOV String of Byte/Word/Double word* — permet de déplacer un tableau depuis
`ds:esi` vers `es:edi`. Il ne faut pas que les tableaux se chevauchent.

Ainsi `rep movsd` correspond à :

```nasm
.label:
    mov eax, [esi]
    mov [edi], eax
    add esi, 4
    add edi, 4
    dec ecx
    jnz .label
```

> **Attention** : après exécution de `rep movsd`, `ecx` est à 0 et `edi`/`esi` sont modifiés.

#### 5.3.7.4 scas(b/w/d)

*Scan String* — permet de comparer le registre `AL` (pour `scasb`) avec l'octet à
l'adresse `es:edi`. Pour trouver la longueur d'une chaîne en C :

```nasm
mov edi, msg  ; adresse de la chaîne
mov esi, edi  ; sauvegarde de l'adresse
mov ecx, 10000 ; longueur maximale
mov al, 0     ; fin de chaîne
repnz scasb   ; tant que ...
sub edi, esi  ; longueur dans edi
```

#### 5.3.7.5 rep ret

On trouve parfois dans la génération du code assembleur pour les processeurs AMD
la série d'instructions `rep ret`. Il s'agit d'un stratagème pour remédier à un problème
de prédiction de branchement lorsque `ret` se trouve juste après un branchement conditionnel.

## 5.4 Structures de contrôle

### 5.4.1 Programmation sans structures de contrôle

L'assembleur est un langage sans structures de contrôle (`if`, `while`). Il se fonde
sur le déplacement du pointeur d'instruction en mémoire, comme l'instruction `goto`
que l'on trouve par exemple en langage BASIC.

### 5.4.2 Association variables / registres

Pour optimiser le code il faut utiliser le plus souvent possible des registres.
On peut procéder en créant une table de correspondance. Ainsi pour le code :

```c
void init(int *tab, int N) {
    for (int i = 0; i < N; i++)
        tab[i] = 1;
}
```

| Variable/Cste | Type | Registre | Description |
|---|---|---|---|
| `tab` | `int []` | `ebx` | tableau de valeurs entières |
| `N` | `int` | `edx` | taille du tableau |
| `i` | `int` | `ecx` | variable de boucle |
| `1` | `int` | `eax` | constante 1 |

*TABLE 5.9 – Association entre variables C et registres du microprocesseur en architecture 32 bits*

### 5.4.3 Labels

Un **label** (étiquette) permet de définir l'adresse d'une instruction ou d'une donnée
en utilisant un identifiant alphanumérique. On distingue :

- Un **label global** qui commence par une lettre suivi par des lettres, chiffres ou
  le symbole `_` et permet de définir le nom d'un sous-programme ou d'une variable
- Un **label local** qui commence par un point `.` et indique une adresse de
  branchement à l'intérieur d'un sous-programme

Les labels locaux peuvent être réutilisés à l'intérieur d'un label global différent.

```nasm
fonction_1:         ; définition de fonction_1
    push ebp
    mov  ebp, esp
.if:                ; utilisation du label local .if
    mov  esp, ebp
    pop  ebp
    ret

fonction_2:         ; définition d'une autre fonction
    push ebp
    mov  ebp, esp
    call fonction_1
.if:                ; réutilisation du label local .if
    ret
```

### 5.4.4 Si alors (if then)

La conditionnelle *si alors* est réalisée en utilisant `cmp` suivi d'une instruction
de branchement conditionnel `jCC`. On prend la **négation** de la condition pour
effectuer un branchement conditionnel en `.endif`.

Pour la condition `x < y` où `x` est dans `eax` et `y` dans `ebx` :

```nasm
.if:
    mov eax, [x]
    mov ebx, [y]
    cmp eax, ebx    ; si non(x < y) équivalent à x >= y
    jge .endif
.then:
    mov [x], ebx    ; bloc alors
.endif:
```

### 5.4.5 Si alors avec conjonction (et)

Pour une condition complexe avec des `&&`, il faut que toutes les conditions soient
vraies. On se branche en `.endif` dès qu'une condition est fausse.

```c
// Listing 5.4.1
if ((x < 3) && (y >= 6) && (x == z))
    x = y;
```

```nasm
; Listing 5.4.2 – Si Alors avec conjonction de conditions
; eax = x, ebx = y, ecx = z
.if:
    cmp eax, 3    ; C1
    jge .endif    ; si non(x < 3) alors aller en finsi
    cmp ebx, 6    ; C2
    jl  .endif    ; si non(y >= 6) alors aller en finsi
    cmp eax, ecx  ; C3
    jne .endif    ; si non (x == z) alors aller en finsi
.then:
    mov eax, ebx
.endif:
```

> *Listing 5.4.2 – Si Alors avec conjonction de conditions*

> **Optimisation** : placer la condition qui a le plus de chance d'échouer en premier.

### 5.4.6 Si alors avec disjonction (ou)

Pour une condition avec des `||`, il suffit qu'une seule condition soit vraie pour
exécuter le bloc alors. On se branche en `.then` dès qu'une condition est vraie.

### 5.4.7 Si alors sinon (if then else)

```nasm
.if:
    mov eax, [x]
    mov ebx, [y]
    cmp eax, ebx
    jge .else
.then:
    mov [x], 1    ; bloc alors
    jmp .endif    ; pour ne pas exécuter le code du .else
.else:
    mov [x], 2    ; bloc sinon
.endif:
```

### 5.4.8 Tant que (while)

La structure *tant que* comprend :

- Une initialisation (ex. `i = 1`)
- Une condition de poursuite (ex. `i <= 10`)
- Le corps de la boucle
- Un branchement `jmp` qui ramène au début

Pour calculer la somme des entiers entre 1 et 10 :

```nasm
; Listing 5.4.3 – Tant que
xor eax, eax   ; sum = 0
mov ecx, 1     ; i = 1
.while:
    cmp ecx, 10    ; si i > 10 alors sortir du while
    jg  .endwhile
    add eax, ecx   ; sum += i
    inc ecx        ; ++i
    jmp .while
.endwhile:
    mov [sum], eax
```

> *Listing 5.4.3 – Tant que*

### 5.4.9 Pour (for)

L'instruction `for`, soit *pour* en langage C, est en fait un `while` déguisé (sucre syntaxique).

```c
// Listing 5.4.4 – Equivalence des boucles for et while
for (initialisation; condition; incrementation)
    corps;
// équivalent à :
initialisation;
while (condition) {
    corps;
    incrementation;
}
```

Pour la boucle suivante :

```c
const N = 10;
int sum = 0;
for (int i = 1; i <= N; i++)
    sum += i;
```

On peut traduire ce `for` de deux manières. La version améliorée (Listing 5.4.5)
n'exécute que 3 instructions par itération au lieu de 4 :

```nasm
; Listing 5.4.5 – Traduction améliorée du for
xor eax, eax   ; sum = 0
mov ecx, 1     ; initialisation : i = 1
mov edx, N
.pre_for:
    cmp ecx, edx   ; test condition
    jg  .endfor    ; ne pas exécuter la boucle si i > N
.for:
    add eax, ecx   ; corps : sum += i
    inc ecx        ; incrémentation : ++i
    cmp ecx, edx   ; test de la condition
    jle .for       ; retour au début de la boucle si vraie
.endfor:
```

> *Listing 5.4.5 – Traduction améliorée du for*

### 5.4.10 Selon cas (switch)

La structure `switch` est dans le cas général difficile à traduire.
Dans certains cas les données sont consécutives et il est facile de remplacer le
`switch` par une expression.

```c
// Listing 5.4.6 – Exemple de switch simplifiable par une expression
int convert1(char c) {
    switch (c) {
        case 'a': case 'A': return 1;
        case 'b': case 'B': return 2;
        ...
        case 'z': case 'Z': return 26;
    }
}
// équivalent à :
int convert2(char c) {
    if (isalpha(c)) return (c & ~64);
    return 0;
}
```

> *Listing 5.4.6 – Exemple de switch simplifiable par une expression*

Pour un `switch` avec des valeurs non consécutives, on passe par une table de
conversion :

```nasm
; Listing 5.4.8 – Exemple de switch avec table de conversion en assembleur 32 bits
section .data
    switch_values_table: dd 1, 3, 22
    switch_jumps_table:  dd ..@case_1, ..@case_3, ..@case_22
section .text
main:
    ; eax = valeur à comparer
    xor ecx, ecx
    mov edx, 3
.for:
    cmp ecx, edx
    jge .default
    cmp [switch_values_table+ecx*4], eax
    jne .endif
    jmp [switch_jumps_table+ecx*4]
.endif:
    inc ecx
    jmp .for
..@case_1:
    ...
    jmp .endswitch
..@case_3:
    ...
    jmp .endswitch
..@case_22:
    ...
    jmp .endswitch
.default:
    ...
.endswitch:
```

> *Listing 5.4.8 – Exemple de switch avec table de conversion en assembleur 32 bits*

### 5.4.11 Optimisation des boucles

#### 5.4.11.1 Dépliage de boucle (loop unrolling)

Le **dépliage de boucle** consiste à augmenter le corps de la boucle en le répétant
plusieurs fois (par une puissance de 2 : 2, 4, 8 ou 16). Le but est :

- De **diminuer le nombre de branchements**
- D'**augmenter l'efficacité** en exécutant plus d'instructions par itération

Par exemple pour `N = 1003` et un dépliage par 8 :
- Sans dépliage : 1003 × 4 = 4012 instructions pour la boucle
- Avec dépliage : 125 × 4 = 500 instructions + traitement des 3 dernières itérations

```nasm
; Listing 5.4.9 – Dépliage de boucle
section .data
    N   EQU 1003
    tab: times N dd 0
section .text
    mov ebx, tab
    mov eax, 1
    xor ecx, ecx
    mov edx, N
    and edx, ~(8-1)      ; multiple de 8 le plus proche de N
.for_ur8:
    cmp ecx, edx
    jge .endfor_ur8
    mov [ebx+ecx*4+0],  eax
    mov [ebx+ecx*4+4],  eax
    mov [ebx+ecx*4+8],  eax
    mov [ebx+ecx*4+12], eax
    mov [ebx+ecx*4+16], eax
    mov [ebx+ecx*4+20], eax
    mov [ebx+ecx*4+24], eax
    mov [ebx+ecx*4+28], eax
    add ecx, 8
    jmp .for_ur8
.endfor_ur8:
.while:
    cmp ecx, N  ; dernières itérations
    ...
```

> *Listing 5.4.9 – Dépliage de boucle*

Pour masquer les bits de poids faible et obtenir le multiple de 8 le plus proche :

```nasm
mov edx, N        ; edx = 1003
and edx, ~7       ; ~7 & 11...1111_1111_1000 → edx = 1000
```

On peut utiliser des **macro-instructions** pour simplifier le code :

```nasm
; Listing 5.4.10 – Dépliage de boucle avec macro instruction
%macro BODY 1
    mov [ebx+ecx*4+%1], eax
%endmacro

section .text
    mov ebx, tab
    mov eax, 1
    xor ecx, ecx
    mov edx, N
    and edx, ~(8-1)
.for_ur8:
    cmp ecx, edx
    jge .endfor_ur8
    BODY 0
    BODY 4
    BODY 8
    BODY 12
    BODY 16
    BODY 20
    BODY 24
    BODY 28
    add ecx, 8
    jmp .for_ur8
.endfor_ur8:
; dernières itérations
.while:
    cmp ecx, N
    ...
```

> *Listing 5.4.10 – Dépliage de boucle avec macro instruction*

On peut également utiliser les répétitions `nasm` :

```nasm
%assign i 0
%rep 8
    BODY i    ; appel de la macro BODY avec la valeur de i
    %assign i i+4
%endrep
```

> **Attention** : en C l'utilisation des parenthèses est primordiale :
> `for (i = 0; i < (N & ~3); i++)` et non `for (i = 0; i < N & ~3; i++)`
> car dans ce cas la condition sera toujours fausse.

#### 5.4.11.2 Tuilage (loop tiling / loop blocking)

La technique du **tuilage** décompose un traitement sur un grand tableau en plusieurs
traitements sur des sous-parties du tableau maintenues en cache. Elle est particulièrement
efficace pour le produit de matrices.

```c
const N = 1027;
int A[N];
// sans tuilage :
for (int i = 0; i < N; i++)
    A[i] = 0;

// avec tuilage (BLOCK_SIZE = 32) :
const BLOCK_SIZE = 32;
for (int i = 0; i < N; i += BLOCK_SIZE)
    for (int ii = 0; ii < std::min(i+BLOCK_SIZE, N); ii++)
        A[ii] = 0;
```

Cette technique n'a d'intérêt que si on lit et/ou écrit les données **plusieurs fois**.

#### 5.4.11.3 if à l'intérieur d'une boucle

Un `if` à l'intérieur d'une boucle `for` peut ralentir l'exécution car si la condition
n'est pas prédictible, la prédiction de branchement ne sera pas efficace.

Il faut faire en sorte, quand cela est possible, de **remplacer le `if` par un calcul**
plutôt que par un branchement. La vectorisation du code permet également d'éviter
ces ralentissements.

### 5.4.12 Suppression des branchements : setCC et cmovCC

On dispose de deux instructions qui permettent de supprimer les branchements :

- `setCC` (*Set Byte on Condition*) : met à 0 ou 1 un registre 8 bits en fonction
  des bits CF, SF, OF, ZF et PF du registre `eflags`
- `cmovCC` (*Conditional MOVe*) : déplace les données de la source vers la destination
  en fonction des bits du registre `eflags`

Par exemple, le code suivant :

```c
if (x % 3 == 0)
    return 101;
else
    return 7001;
```

peut être traduit classiquement par :

```nasm
mov  eax, [x]
mov  ecx, 3
cdq           ; convertir dans edx:eax
idiv ecx      ; division par 3
.if:
    cmp eax, 0   ; quotient == 0 ?
    jnz .else
.then:
    mov eax, 101
    jmp .endif
.else:
    mov eax, 7001
.endif:
    ; sortie de la fonction
```

ou de manière optimisée avec `cmov` :

```nasm
mov  eax, [x]
mov  ecx, 3
cdq
idiv ecx
cmp  edx, 0
mov  eax, 7001
mov  ecx, 101
cmovnz eax, ecx   ; si edx != 0, eax = 7001, sinon eax = 101
```

Pour les booléens :

```nasm
; évaluation de l'expression, résultat dans edx
xor eax, eax  ; valeur de sortie à 0
cmp edx, 0    ; ou test edx, edx
setnz al      ; al = 1 si ZF=0, al = 0 si ZF=1
```

> **Note** : il est nécessaire de mettre 0 dans `eax` avant `setnz` pour que le résultat
> soit 0 ou 1. Ou alors utiliser `movzx eax, al` après `setnz`.

### 5.4.13 Latence et débit

Lorsqu'on évoque le temps de traitement des instructions on distingue :

- **Latence** (*latency*) : le nombre de cycles processeur pour qu'une instruction
  ait ses données disponibles pour une autre instruction
- **Débit** (*throughput*) : le nombre de cycles processeur pour qu'une instruction
  puisse s'exécuter

> **Chaîne de dépendance** : quand une instruction a besoin du résultat d'une
> instruction qui la précède, on parle de dépendance. Réduire le nombre de
> dépendances améliore les performances.

Par exemple pour `a = a + b + c + d` avec `eax = a`, `ebx = b`, `ecx = c`, `edx = d` :

Version avec dépendances :

```nasm
add eax, ebx   ; a += b
add eax, ecx   ; dépendance avec la ligne 1
add eax, edx   ; dépendance avec la ligne 2
```

Version sans dépendances (2 chaînes parallèles) :

```nasm
add eax, ebx   ; a += b
add ecx, edx   ; c += d  (indépendant)
add eax, ecx   ; a += c  (dépend de 1 et 2)
```

Pour la somme d'un tableau de flottants dépliée par 8, en utilisant 4 registres SSE
pour briser la chaîne de dépendances :

```nasm
; Listing – Somme avec 4 accumulateurs (4 dépendances distantes)
mov ebx, array
xorps xmm0, xmm0  ; sum1 = 0.0
xorps xmm1, xmm1  ; sum2 = 0.0
xorps xmm2, xmm2  ; sum3 = 0.0
xorps xmm3, xmm3  ; sum4 = 0.0
xor ecx, ecx      ; i = 0
.for_i:
    cmp ecx, 320000
    jge .endfor_i
    addss xmm0, [ebx+ecx*4+0]
    addss xmm1, [ebx+ecx*4+4]
    addss xmm2, [ebx+ecx*4+8]
    addss xmm3, [ebx+ecx*4+12]
    addss xmm0, [ebx+ecx*4+16]
    addss xmm1, [ebx+ecx*4+20]
    addss xmm2, [ebx+ecx*4+24]
    addss xmm3, [ebx+ecx*4+28]
    add ecx, 8
    jmp .for_i
.endfor_i:
    addss xmm0, xmm1  ; sum1 += sum2
    addss xmm2, xmm3  ; sum3 += sum4
    addss xmm0, xmm2  ; sum1 += sum3
```

Résultats de performances (en millions de cycles pour 100 exécutions, tableau de 320 000 flottants) :

| Dépendances | Intel Core i7-3667U | Intel Core i5-7400 | Intel Core i7-8700 | Intel Xeon S.-4208 | Intel Core i7-10850H | Intel Core i5-10400 |
|---|---|---|---|---|---|---|
| v1 (7 dép.) | 78 | 112 | 93 | 105 | 122 | 100 |
| v2 (4 dép.) | 28 | 28 | 23 | 29 | 28 | 27 |
| v3 (aucune) | 26 | 19 | 16 | 25 | 19 | 21 |
| **gain** | ×3,00 | ×4,47 | ×5,81 | ×4,20 | ×6,42 | ×4,76 |

*TABLE 5.10 – Nombre de millions de cycles pour la somme des éléments d'un tableau, architectures Intel*

| Dépendances | AMD Ryzen 7-1700 | AMD Ryzen 5-3600 | AMD Ryzen 5-5600g | AMD Ryzen 5-9600X |
|---|---|---|---|---|
| v1 (7 dép.) | 103 | 85 | 59 | — |
| v2 (4 dép.) | 35 | 23 | 13 | — |
| v3 (aucune) | 23 | 15 | 11 | — |
| **gain** | ×4,47 | ×5,66 | ×5,36 | — |

*TABLE 5.11 – Nombre de millions de cycles pour la somme des éléments d'un tableau, architectures AMD*

> **Attention** : dans la version v2 avec 4 dépendances, si on les place côte à côte,
> on obtient sur AMD Ryzen 5 5600g un temps moyen de 32 millions de cycles et non 23.

## 5.5 Bilan

Nous avons vu dans ce chapitre comment traduire les structures de contrôle du
langage C et comment on pouvait améliorer l'efficacité des boucles en les dépliant
ou en brisant la chaîne de dépendances d'un calcul.

### 5.5.1 Résumé

- En architecture 32 bits, on dispose de 8 registres généraux, cependant seuls
  6 sont utilisés pour faire des calculs (`eax`, `ebx`, `ecx`, `edx`, `edi`, `esi`) ;
  `esp` contient le sommet de pile et `ebp` est utilisé afin de récupérer les arguments
- En architecture 32 bits, si l'on doit réaliser des multiplications ou des divisions
  les registres `eax` et `edx` seront impactés, ce qui ne laisse plus que 4 registres
- En architecture 64 bits, on dispose de 8 registres généraux supplémentaires
  (`r8` à `r15`), ce qui lève le verrou des limitations du 32 bits
- L'assembleur ne dispose pas de structures de contrôle. Ecrire en assembleur est donc une tâche difficile
- Les techniques de **dépliage de boucle** ou de **tuilage** permettent d'améliorer
  l'efficacité du traitement des boucles
- Positionner un `if` à l'intérieur d'une boucle conduit à ralentir l'exécution ;
  il faut être en mesure de le supprimer soit par `setCC`/`cmovCC`, soit par vectorisation

### 5.5.2 Objectifs

On doit être capable de traduire :

- Une multiplication, une division, un modulo
- Une conditionnelle avec plusieurs conditions séparées par des `&&` / `||`
- Une boucle `for`
- Une boucle `while`

## 5.6 Exercices

**Exercice 21** – Traduire le code suivant en assembleur x86 32 bits où `x`, `y` et `z` sont trois variables entières :

```c
if ((((x % 2) == 0) && (y < 257)) || (z == 9))
    x = x + y - z;
```

**Exercice 22** – Traduire le code suivant en assembleur x86 32 bits :

```c
const int SIZE = 1000;
int tab[SIZE];
for (int i = 0; i < SIZE; i++)
    tab[i] = (i + 1) % 7;
```

**Exercice 23** – Ecrire les fonctions qui réalisent les traitements suivants en C puis les traduire en assembleur :

1. Valeur absolue d'un entier
2. Trouver le bit le plus significatif d'un entier non signé (position du bit de poids fort)
3. Fonction `zero_un_moins_un` en 4 instructions en utilisant le *Carry Flag*

**Exercice 24** – Soit le code suivant :

```c
const int N = 1005;
int tab[N];
for (int i = 0; i < N; i++)
    tab[i] = i;
```

1. Traduire en assembleur x86 32 bits (version classique)
2. Traduire avec un dépliage de boucle par 8

> **Attention** : lors de la traduction avec dépliage, il faut augmenter `i` à chaque itération du dépliage.

**Exercice 25** – Que se passe t-il si on réalise le traitement suivant ?

```nasm
mov eax, -6   ; eax = FF_FF_FF_FA_h
xor edx, edx  ; mise à -1 de edx
dec edx
mov ecx, 3
div ecx
```

**Exercice 26** – Traduire la fonction suivante en assembleur x86 32 bits de la manière la plus efficace possible :

```c
int clamp(int x) {
    if (x < 0)
        return 0;
    else if (x > 1)
        return 1;
    else
        return x;
}
```
