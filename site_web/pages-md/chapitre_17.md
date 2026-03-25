# Chapitre 17 : Étude de cas (Nombres auto-descriptifs)

## 17.1 Introduction

Un nombre auto-descriptif se définit comme un entier naturel ayant pour propriété
que chacun de ses chiffres, repéré par son rang, indique combien de fois ce rang
apparaît en tant que chiffre dans l'écriture de ce nombre. On parle aussi de nombre
autobiographique ou de nombre qui se décrit lui-même. Le premier nombre
auto-descriptif est 1210. En effet :
- il contient 1 chiffre zéro
- il contient 2 chiffres un
- il contient 1 chiffre deux
- il contient 0 chiffre trois

Il en va de même pour 2020, 21200. Ces nombres sont très rares, on en compte 7 dont la liste figure *Table 17.1*.

| $n$ | $a(n)$ |
|---|---|
| 1 | 1_210 |
| 2 | 2_020 |
| 3 | 21_200 |
| 4 | 3_211_000 |
| 5 | 42_101_000 |
| 6 | 521_001_000 |
| 7 | 6_210_001_000 |

*TABLE 17.1 – Nombres auto-descriptifs*

Formalisons tout cela. On considère $x$ un nombre entier positif de $k$ chiffres de la forme :
$$x = d_0 \times 10^{k-1} + \dots + d_{k-1} \times 10^0 = \sum_{i=0}^{k-1} d_i \times 10^{k-1-i}$$

On définit pour ce nombre une suite de valeurs $c_0$ à $c_{k-1}$ où chaque $c_i$ représente le nombre d'occurrences du chiffre $i$ dans $x$ :
$$c_i = \text{Card}(\{d_j \text{ tel que } d_j = i, \forall j \in [0, k-1]\})$$

On doit alors vérifier la contrainte suivante qui définit un nombre auto-descriptif :
$$\forall i \in [0, k-1], c_i = d_i$$
où $[0, k-1]$ représente l'intervalle de valeurs entre 0 et $k-1$. De ces définitions découlent les propriétés suivantes :
- **propriété 1** : un nombre auto-descriptif ne peut pas commencer par 0
- **propriété 2** : un nombre auto-descriptif contient au moins un 0
- **propriété 3** : la somme des $c_i$ est égale à $k$, et donc, la somme des $d_i$ est égale à $k$
- **propriété 4** : un nombre auto-descriptif contient au moins un 0 en position $k-1$
- **propriété 5** : un nombre auto-descriptif de $k$ chiffres ne peut pas avoir un chiffre supérieur à $k$

> **Théorème 17.1.1.** Un nombre auto-descriptif ne peut pas commencer par 0.
> *Démonstration.* En effet, si $d_0 = 0$ alors le nombre commence par 0 et par définition n'est pas valide.

> **Théorème 17.1.2.** Un nombre auto-descriptif contient au moins un 0.
> *Démonstration.* En effet, si $c_0 = 0$ alors $d_0 = 0$ et le nombre commence par 0 et par définition n'est pas valide d'après le théorème précédent.

> **Théorème 17.1.3.** $\sum_{i=0}^{k-1} c_i = \sum_{i=0}^{k-1} d_i = k$
> *Démonstration.* Si par définition les $c_i$ représentent le nombre d'occurrences de chaque chiffre, leur somme doit donc être égale à $k$. Étant donné que par définition $c_i = d_i$, on en déduit également que la somme des $d_i$ est égale à $k$.

> **Théorème 17.1.4.** Un nombre auto-descriptif se termine par un 0.
> *Démonstration.* Appelons $S(k) = \sum_{i=0}^{k-1} d_i$ et raisonnons par l'absurde pour montrer qu'il n'est pas possible que $d_{k-1}$ soit différent de 0. Par définition $S(k) = k$ et donc $S(k) = S(k-1) + d_{k-1}$. Supposons alors que $x$ ne se termine pas par 0, alors $d_{k-1} > 0$, et on en déduit que $S(k-1) < k$ ou encore que $S(k-1) \leq k-1$. Le fait qu'un nombre auto-descriptif ne commence pas par un 0 mais contient au moins un 0, implique que $d_0 \neq 0$ et donc qu'il existe au moins un 0 parmi les $d_1$ à $d_{k-1}$. En conséquence $S(k) \geq k-1$. Sachant que $S(k) = S(k-1) + d_{k-1}$, on a donc $S(k) - S(k-1) = d_{k-1}$. Mais comme $S(k) \geq k-1$ et que $S(k-1) \leq k-1$, on en déduit que $S(k) - S(k-1) = 0$ et donc que $d_{k-1} = 0$.

> **Théorème 17.1.5.** Un nombre auto-descriptif de $k$ chiffres ne peut par avoir un chiffre supérieur à $k$, i.e. $d_i < k, \forall i \in [0, k-1]$
> *Démonstration.* Si $x$ possède $k$ chiffres alors $d_0$ à $d_{k-1}$ sont définis. Si $d_i \geq k$ cela implique que $c_i \geq k$ ce qui est en contradiction avec la définition du nombre.

## 17.2 Fonction de référence (`std::string`)

La fonction de référence à implanter est donnée *Listing 17.2.1*. Elle comporte un
paramètre qui est le nombre entier non signé $x$ pour lequel on veut déterminer s'il
est auto-descriptif ou non. Nous n'allons pas utiliser certaines propriétés énoncées
préalablement afin de garder un temps de calcul qui nous permettra de comparer
les différentes améliorations proposées. En effet, si on utilise le fait qu'un nombre
auto-descriptif se termine par 0, il suffit de calculer le premier reste de la division
par 10 pour trouver le premier chiffre et la recherche des nombres auto-descriptifs,
en utilisant cette propriété, s'exécute en moins de 2 secondes.

Nous allons donc nous focaliser sur les trois points suivants :
- conversion du paramètre $x$ en base 10 (détermination des $d_i$)
- détermination du nombre d'occurrences de chaque chiffre (les $c_i$)
- comparaison du nombre d'occurrences avec le $i$-ème chiffre (comparaison des $d_i$ avec les $c_i$)

Dans cette première version, on utilise les fonctionnalités du C++ pour transformer le nombre $x$ en caractères et déterminer les $d_i$.

```cpp
typedef unsigned int u32;
typedef unsigned char u8;
typedef int i32;

bool ad_ref(u32 x) {
    // nombre d'occurrences de chaque chiffre
    u32 counts[10] = {0,0,0,0,0,0,0,0,0,0};
    
    // convertir le nombre en chaîne de caractères
    string s = std::to_string(x);
    
    // compter les occurrences de chaque chiffre
    for(u32 i=0; i < s.length(); ++i) {
        ++counts[ (u32)(s[i] - '0') ];
    }
    
    // comparer les occurrences aux chiffres
    for(u32 i=0; i < s.length(); ++i) {
        if(static_cast<u32>(s[i] - 48) != counts[i]) return false;
    }
    return true;
}
```

> *Listing 17.2.1 – Nombre auto-descriptif, fonction de référence*

> **Fonction de référence**
> Le temps d'exécution sur AMD Ryzen 5 5600g est de **7,34 secondes**.
> *Attention* : le compilateur `gcc` dans sa version 10 générait une fonction dont le temps d'exécution est d'environ 18 secondes alors que le même compilateur, dans sa version 12, génère du code qui ne s'exécute plus qu'en 7,6 secondes, soit près de deux fois plus rapide. La différence d'exécution tient à la conversion de $x$ en chaîne. Nous utilisons donc par la suite la version 12 de `gcc` quand cela est possible.

## 17.3 Amélioration de la taille mémoire (8 bits)

Plutôt que d'utiliser un tableau d'entiers 32-bits pour compter les occurrences des 
chiffres, on utilise un tableau d'octets. En effet, diminuer la taille des données 
utilisées peut parfois apporter une amélioration.

> **Fonction de référence avec 8 bits**
> Le temps d'exécution sur AMD Ryzen 5 5600g est de **7,20 secondes** en
> utilisant des octets pour représenter le nombre d'occurrences de chaque chiffre.

On en déduit donc qu'il vaut mieux travailler sur un tableau d'octets que sur un tableau d'entiers en général même si l'amélioration est faible.

## 17.4 Conversion directe (`x % 10`)

Plutôt que de convertir $x$ en chaîne de caractères, nous allons le convertir directement en chiffres que l'on va stocker dans un tableau (d'entiers ou d'octets) appelé `digits` en faisant des divisions par 10 afin d'obtenir chaque chiffre. A chaque nouveau reste trouvé on incrémente le tableau `counts` en conséquence et on stocke le reste dans le tableau `digits`.

```cpp
bool ad_div(u32 x) {
    u8 counts[10] = {0,0,0,0,0,0,0,0,0,0};
    u8 digits[10];
    
    // convertir x et compter les occurrences
    i32 i = 0;
    while(x != 0) {
        u32 u = x % 10;
        digits[i++] = u;
        ++counts[u];
        x = x / 10;
    }
    
    // comparer le nombre d'occurrences avec les chiffres
    --i;
    for(i32 j=0; i >= 0; --i, ++j) {
        if(digits[i] != counts[j]) return false;
    }
    return true;
}
```
> *Listing 17.4.1 – Nombre auto-descriptif, fonction de conversion en chiffres modulo 10*

Au final on obtient le remplissage des tableaux suivants (pour $x=21200$) :

| Indice | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | ... | 15 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `counts` | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | | | |
| `digits` | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | | | |

> **Fonction avec conversion 8 bits**
> C'est en fait cette version qui est la plus efficace lorsque traduite par le compilateur car elle ne prend que **4,22 secondes** pour s'exécuter et c'est elle qu'il va falloir tenter de battre. La version utilisant des entiers prend quant à elle 5,83 secondes.

La raison de l'efficacité est assez simple : la conversion est rapide car elle est optimisée et la division par 10 est remplacée par une multiplication par un invariant, puis le calcul du reste de la division est effectué par multiplication du dividende et soustraction. En outre, la boucle de conversion est dépliée.

## 17.5 Approche Assembleur

Étant données les différentes versions précédentes, on peut se demander si la traduction assembleur ne serait pas plus performante.

### 17.5.1 L'assembleur simple (division par 10)

Dans cette première version, on se contente de traduire la version C de l'algorithme.

| Param / Var | Type | Registre / Emplacement | Description |
|---|---|---|---|
| `x` | `u32` | `[ebp+8]` (`eax`) | Nombre $x$ |
| `counts` | `u8[]` | Pile `esp` | Occurrences |
| `digits` | `u8[]` | Pile `esp` | Conversion |
| `i` | `u32` | `ecx` | Indice |

*TABLE 17.2 – Association entre variables et registres pour les fonctions assembleur listant les nombres auto-descriptifs*

```nasm
ad_asm_v1:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    sub esp, 44                      ; on réserve l'espace pour stocker
    and esp, -32                     ; counts, digits et les registres
    mov [esp+32], ebx                ; ebx, esi, edi
    mov [esp+36], edi
    mov [esp+40], esi
    
    vpxor ymm0, ymm0, ymm0           ; on met counts et digits à 0
    vmovdqa [esp], ymm0
```
> *Listing 17.5.1 – Fonction assembleur - version 1 - initialisation*

Pour réaliser la conversion de $x$ en base 10, on réalise des 
divisions successives par 10. En utilisant l'instruction `div`, on obtient le quotient 
dans `eax` et le reste dans `edx`. On va stocker les chiffres (restes de la division) 
dans l'ordre décroissant du tableau `digits` en commençant à l'indice 9 qui sera 
stocké dans `ecx`, puisque un entier non signé contient au maximum 10 chiffres.

```nasm
    mov ebx, 10                      ; constante 10 pour division par 10
    mov ecx, 9                       ; i = 9, indice pour tableau digits
    cmp eax, 10                      ; si x < 10 alors aller en .x_lt_10
    jl .x_lt_10
    
.while_x_ge_10:                      ; tantque x >= 10 faire
    xor edx, edx
    div ebx                          ; u, x = x % 10, x / 10
    inc byte [esp+edx]               ; ++counts[u]
    dec ecx                          ; digits[ --i ] = u
    mov [esp+ecx+16], dl
    cmp eax, 10
    jge .while_x_ge_10               ; fin tantque
    
.x_lt_10:                            ; si x < 10, pas de division
    cmp eax, 0                       ; si x == 0 alors aller en .next
    jz .next
    inc byte [esp+eax]
    dec ecx                          ; digits[ --i ] = x
    mov [esp+ecx+16], al
```

> *Listing 17.5.2 – Fonction assembleur - version 1 - conversion par boucle `div`*

Pour la fin, s'il faut vérifier, on compare le bloc `counts` et le bloc `digits`.

```nasm
.next:
    xor eax, eax                     ; valeur de retour = faux
    lea esi, [esp+ecx+16]
    mov edi, 9                       ; longueur = nombre de chiffres
    sub edi, ecx
    xor ecx, ecx                     ; i = 0
    
.while_eq:                           ; faire
    movzx edx, byte [esp+ecx]
    cmp dl, [esi+ecx]
    jne .end
    inc ecx                          ; ++i
    sub edi, 1
    jnz .while_eq                    ; tantque i < longueur
    inc eax                          ; valeur de retour = vrai
    
.end:
    mov ebx, [esp+32]
    mov edi, [esp+36]
    mov esi, [esp+40]
    mov esp, ebp
    pop ebp
    ret
```
> *Listing 17.5.3 – Fonction assembleur - version 1 - comparaison et sortie*

> **Assembleur version 1 avec conversion 8 bits**
> Cette version assembleur s'exécute en **5,59 secondes**.

### 17.5.2 Remplacer la division par une multiplication (L'astuce de l'invariant)

Une première amélioration consiste à remplacer la division par une multiplication. 
On le sait, la division est très pénalisante par rapport à la multiplication. 
Cela est possible ici car on divise par une constante (10), on peut donc remplacer 
la division par une multiplication par invariant.

La constante `0xCCCCCCCD` correspond à `(2^35) / 10`. En l'utilisant et en faisant un décalage, `ebx` stocke l'invariant.
L'astuce permet d'aller plus vite que `div 10`. On utilise ensuite `lea eax, [edx+edx*4]` (donc $x \times 5$) et `shl eax, 1` pour retrouver la base 10 du modulo par soustraction ! 

```nasm
ad_asm_v2:
    ; ... (identique à ad_asm_v1)
    mov ebx, 0xCCCCCCCD              ; Inv. 0.1 dans ebx
    mov ecx, 9
    cmp eax, 10
    jl .x_lt_10
    
.while_x_ge_10:
    mov edi, eax                     ; sauvegarde de x dans edi
    mul ebx                          ; edx:eax <- x * Inv
    shr edx, 3                       ; edx <- edx / 8 (éq. x/10)
    lea esi, [edx+edx*4]
    shl esi, 1                       ; esi = 2*5*(x/10) = 10 * (x/10)
    sub edi, esi                     ; calcul du reste u de la division
    dec ecx                          ; --i
    inc byte [esp+edi]               ; ++counts[u]
    mov [esp+ecx+16], dil            ; digits[ i ] = u
    mov eax, edx                     ; eax <- x/10
    cmp eax, 10
    jge .while_x_ge_10
```

> *Listing 17.5.4 – Fonction assembleur - version 2 - remplacement de la division*

> **Assembleur version 2 : multiplication au lieu d'une division**
> Cette version assembleur demande plus d'opérations et s'exécute en **5,69 secondes**, soit une très légère dégradation théorique par rapport au `div` mais profitable sur les vieux CPU. En ajoutant un *Unroll* (dépliage) manuel par la suite, le temps tombe à **4,32 secondes**.

### 17.5.4 Comparaison finale Vectorielle SIMD (AVX/SSE)

Plutôt que de comparer les tableaux `digits` et `counts` élément par élément, on peut utiliser des registres 128/256 bits et une égalité AVX comme `vpcmpeqb`.

```nasm
    xor eax, eax                     ; valeur de retour : false
    vmovdqa xmm1, [esp]              ; counts
    vmovdqu xmm2, [esp+ecx+16]       ; digits (shifté)
    vpcmpeqb xmm1, xmm1, xmm2        ; comparer octet par octet
    vpmovmskb edx, xmm1              ; récupérer le masque issu de la comparaison
    cmp edx, 0xFFFF                  ; s'il est égal à 0xFFFF alors OK
    sete al                          ; dans ce cas mettre eax à true
```
> *Listing 17.5.4.b - L'égalité finale vectorisée.*

> **Assembleur version 4 : (Vectorielle SIMD)**
> Avec l'Unroll mathématique et la fin SIMD, on descend à **4,31 secondes**.

### 17.5.5 L'invariant de Base 100 (`% 100`)

Au lieu de faire `% 10`, on peut faire `% 100` (soit 2 fois moins de divisions) grâce au magique `0x51EB851F` (`0.01` inverse). On utilise alors une table de correspondance pour décomposer `85` en `8` et `5`.
Ceci permet de tomber à **3,56 secondes** ! (Le grand gagnant Assembleur).

### 17.5.6 Tentative au Décimal Codé en Binaire (BCD)

Le Binary Coded Decimal est un ancien système qui consiste à coder un nombre en plaçant deux chiffres décimaux par octet. Chaque quartet (nibble) représente un chiffre. En ASM x86, on possède `fbstp` :
```nasm
    fild dword [ebp+8]
    fbstp [esp+32]
```

Par exemple, `1234567890` devient `0x00...1234567890`. Malheureusement, le circuit FPU mathématique met un temps monstrueux au XXIe siècle (plus de **23 secondes** à s'exécuter, jusqu'à 108 sec sur de vieux Intel !), rendant l'astuce archaïque inopérante.

## 17.6 Benchmark Final Multi-Architecture

Voici le résumé des performances des différentes architectures :
- **1** : version C++ standard (`cpp_std_to_string`)
- **4** : version C++ avec conversion manuelle et divisions / tableau 8-bit (`cpp_divs_8bits`)
- **8** : Assembleur sans division (`mul inv`) avec *Unroll* (`asm_unroll`)
- **12** : Assembleur sans division + *Unroll* + fin vectorielle SIMD AVX (`asm_simd_avx`)
- **14** : Assembleur division par 100 (`mul inv`) (`asm_div_100`)
- **16** : ASM archaïque BCD `fbstp` (`asm_bcd_fbstp`)
- **23** : Assembleur division par 10_000 (`asm_div_10000`)

[BENCHMARK:asm_selfdesc]

La méthode `cpp divs` (version 4) bat la méthode naïve C++ de loin, et les astuces assembleurs à macro-base de modulo avec invariance (`div_10000` / `div_100`) finissent par emporter la médaille d'or toutes configurations confondues.

# ANNEXES

## Annexe A : Conventions d'appel Linux (x86 / x64)

| | Linux 32 bits | Linux 64 bits |
|---|---|---|
| **Registres modifiables par l'appelé** | EAX, ECX, EDX, ST0-ST7, XMM0-XMM7 | RAX, RCX, RDX, RSI, RDI, R8-R11, ST0-ST7, XMM0-XMM15 |
| **Registres à préserver (sauvegarder)** | EBX, EBP, ESI, EDI | RBX, RBP, R12-R15 |
| **Paramètres entiers** | `[ebp+8]`, `[ebp+12]`, ... *(pile)* | RDI, RSI, RDX, RCX, R8, R9 |
| **Valeur de retour (entier)** | EAX, EDX:EAX | RAX, RDX:RAX |
| **Valeur de retour (flottant)** | ST0 | XMM0 |

*TABLE A.1 – Conventions d'appel Linux.*

## Annexe B : Le Débogueur GDB

### B.1 Commandes principales du GDB
- `gdb ./program` : lancer l'analyseur
- `run` : démarrer le logiciel process
- `bt` (*backtrace*): retracer la pile des appels lors d'un crash (ex. Segfault)
- `frame X` : inspecter le registre au moment de la ligne *X*
- `x/20d array` : afficher les 20 entiers de la zone mémoire pointée.
- `print variable` : valeur interne

L'outil **Electric Fence** (`libefence.so`) peut être *pre-loaded* afin de traquer l'indice précis d'un *Out of Bounds* de pointeurs de tableaux.
*Erreur courante traitée* : une boucle récursive qui s'étouffe génère une `bt -1` dépassant 52.000 `frames` d'appels accumulés en RAM menant à l'écrasement de la stack.

## Annexe C : Analyse de `bsr` vs `lzcnt`

L'instruction `bsr` (Bit Scan Reverse) recherche le bit le plus significatif, tandis que `lzcnt` compte le nombre de 0 significatifs. Le processeur résout `31 - lzcnt(X) = bsr(X)`.

[BENCHMARK:asm_bsr_lzcnt]

## Annexe D : Implantation optimisée de la fonction Signe

Pour la fonction signe ($x < 0 \rightarrow -1$, $x > 0 \rightarrow 1$, $x = 0 \rightarrow 0$) :

**Solution SANS saut (cdq, neg, adc) :**
```nasm
    mov eax, [esp+4]
    cdq                              ; si x < 0, edx=-1. si x>=0, edx=0
    neg eax                          ; si eax!=0 alors CarryFlag=1
    adc eax, edx                     ; eax = CF + edx 
```

**Solution avec 2 cmov :**
```nasm
    mov edx, 1
    mov ecx, -1
    mov eax, [esp+4]
    cmp eax, 0
    cmovg eax, edx                   ; x > 0 ==> 1
    cmovl eax, ecx                   ; x < 0 ==> -1
```

## Annexe E : Code ASCII 0 à 127
- **0 - 31** : Signaux de contrôle (CR, LF, TAB, ESC).
- **32 (`0x20`)** : Espace.
- **48 (`0x30`) à 57 (`0x39`)** : Chiffres de '0' à '9'.
- **65 (`0x41`) à 90 (`0x5A`)** : Lettres majuscules de 'A' à 'Z'.
- **97 (`0x61`) à 122 (`0x7A`)** : Lettres minuscules de 'a' à 'z'.

**Glossaire des Instructions ASM :**
`add` (Addition), `cmov` (Conditional Move), `cdq` (Sign Extension), `div` (Division), `je/jnz/jg` (Sauts), `lea` (Load Effective Address mathématique sans appel mémoire), `sar` (Shift Right Arithmétique).

## Bibliographie (Extraits de l'original)
1. AGNER, Fog : Calling conventions for compilers (2018).
2. AGNER, Fog : The microarchitecture of Intel, AMD and VIA CPUs (2018).
3. CORMEN et al. : Introduction to Algorithms (MIT Press, 2009).
4. INTEL : Software developer's manual vol. 1-4 (January 2019).
5. STALLINGS, W. : Organisation et architecture de l'ordinateur (2003).
