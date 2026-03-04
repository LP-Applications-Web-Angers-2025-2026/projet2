# Chapitre 4 : Outils pour la Programmation

## 4.1 Introduction

Dans ce chapitre nous allons installer et découvrir les logiciels qui nous permettront
de développer en assembleur. Nous prenons comme plateforme de développement
une machine sous Linux Ubuntu 18.10 et suivantes.

Nous aurons besoin de plusieurs types d'outils :

- Un **éditeur** qui nous permettra de saisir du code assembleur avec par exemple
  une coloration syntaxique et une indentation automatique afin de faciliter
  l'écriture et la relecture du code
- Un **assembleur** qui compile le code assembleur et le transforme en fichier objet
- Un **compilateur C/C++** qui permet de faire l'édition de lien avec la bibliothèque C/C++
- Un **débogueur** qui permet d'examiner le code généré et de l'exécuter pas à
  pas afin de détecter des erreurs d'accès à la mémoire par exemple ou vérifier
  le résultat produit par les instructions

L'édition de lien sera réalisée grâce à `g++` le *GNU C++ Compiler* ou `gcc` la version
C du compilateur GNU. Il est bien évidemment possible d'utiliser d'autres compilateurs
comme `clang++` de LLVM (*Low Level Virtual Machine*), `icpc` le compilateur
Intel ou `pgi++` de PGI (*Portland Group, Inc*). L'intérêt d'utiliser un compilateur
C pour réaliser l'édition de lien est que l'on a accès aux fonctions de la librairie
C, il suffira de déclarer les fonctions C comme externes au niveau des fichiers
assembleur.

## 4.2 Editeurs de texte

Il existe de nombreux éditeurs sous Linux mais ils ne sont pas tous forcément
adaptés à la structure des programmes assembleurs. En effet, un programme
assembleur se compose de trois parties : les **étiquettes** (ou *labels*), les **instructions
assembleur** et les **commentaires**. Il est pratique de pouvoir écrire les étiquettes à
gauche, les instructions au centre et les commentaires à droite. Malheureusement
les éditeurs sont généralistes et ne permettent pas ce genre d'organisation, il faut
donc utiliser les tabulations.

```nasm
; label --- instruction ------- commentaire
label:  mov eax, 1 ; i = 1
```

Choisir un éditeur est toujours une question de goût personnel. Certains préfèrent
les environnements de développement cossus avec une interface graphique fournie
du type IDE comme **Eclipse** alors que d'autres chérissent les éditeurs épurés comme
`nano`, `vim`, `emacs`. Personnellement j'utilise **jEdit** qui est intéressant car on peut
le configurer simplement et est installable sous Ubuntu sous forme d'un paquet du
même nom.

### 4.2.1 jEdit

**jEdit** est un éditeur de texte qui a pour particularité d'être codé en Java. Il
faudra donc installer une machine virtuelle Java afin de pouvoir l'utiliser. jEdit
gère différents langages (Ada, Python, Java, C, ...) ainsi que l'assembleur x86. Son
principal intérêt est qu'il peut être configuré simplement et permet d'ajouter de
nouveaux modes d'édition pour d'autres langages.

En me basant sur le mode d'édition `assembly-x86`, j'ai créé un fichier nommé
`assembly_x86_2020.lang` qui intègre a priori toutes les instructions x86 décrites
sur le site [nasm.us](http://nasm.us) en 2019 ainsi que les instructions conditionnelles
(`cmovCC`, `setCC`) et les instructions de saut conditionnel. Cela représente au total
1685 instructions.

### 4.2.2 gedit

**gedit** est un éditeur de texte libre fourni par défaut avec l'environnement graphique
GNOME[^gnome]. Il supporte l'encodage UTF-8 et gère la coloration syntaxique de
nombreux langages de programmation mais malheureusement pas de l'assembleur.
On peut néanmoins ajouter un fichier `.lang` dans le répertoire adéquat afin de
donner les règles de coloration syntaxique de l'assembleur x86.

[^gnome]: Acronyme de *GNU Network Object Model Environment*, il s'agit d'un environnement de bureau libre convivial utilisé sous Linux/UNIX.

Téléchargez le fichier suivant et copiez-le dans le répertoire de `gedit` :

```bash
wget http://www.info.univ-angers.fr/~richer/assembly/gedit/assembly_x86_2020.lang
sudo cp assembly_x86_2020.lang /usr/share/gtksourceview-*.0/language-specs/
```

### 4.2.3 Kate

**Kate** est un éditeur de texte spécialement adapté à la programmation issu de
l'environnement de bureau KDE. Pour disposer de la coloration syntaxique il faut
utiliser le menu `Tools > Highlighting > Assembler > Intel x86 (NASM)`.

### 4.2.4 emacs

**emacs** (*Editor MACroS*) est à la base un éditeur de texte extensible basé sur le
langage LISP. Il a été popularisé avec la version GNU écrite par Richard Stallman.
Il faudra par exemple installer les paquets `nasm-mode` et `x86-lookup` afin de pouvoir
disposer respectivement de la coloration syntaxique et de l'aide en ligne.

### 4.2.5 vim

Le concurrent d'emacs, le fameux `vi` ou sa version améliorée `vim` peut également
être utilisé pour écrire des programmes en assembleur. Il faudra le configurer pour
pouvoir utiliser un mode assembleur.

Eclipse dispose d'un plugin appelé **ASM Plugin** disponible sur `sourceforge.net`
et qui permet d'utiliser différents assembleurs comme `nasm`, `tasm`, `masm`. Cependant
il n'est plus maintenu depuis 2006.

On pourra utiliser **Sublime Text** qui possède un mode nasm. De ce point de vue,
**Atom** se montre plus convivial et fonctionnel, il suffit d'installer le paquet
`language-nasmx86`.

## 4.3 L'assembleur nasm

Le choix de `nasm` (*The Netwide Assembler*) semble assez naturel car il est très
simple à utiliser. Nous verrons que la structure des programmes `nasm` liée à l'utilisation
du compilateur `gcc` permet une interaction rapide et peu complexe à mettre en
oeuvre entre code en C/C++ et code assembleur. `nasm` dispose en outre d'une large
documentation sous forme de site web ou de fichier PDF téléchargeable depuis le
site [nasm.us](http://nasm.us) et d'une communauté active.

La structure d'un programme `nasm` est également très simple, voici par exemple
le fameux programme *hello world!* (Listing 4.3.1). Il s'agit de la version en
architecture 32 bits. On notera que les commentaires sont introduits par le symbole
**point virgule** (`;`) et tout ce qui suit ce symbole jusqu'à la fin de la ligne fait partie
du commentaire.

```nasm
global main
extern printf

; ==== DATA ====
section .data
    ; declaration d'une chaine
    msg: db "hello world!", 10, 0

; ==== CODE ====
section .text

; fonction main
main:
    push    ebp
    mov     ebp, esp
    push    dword msg
    call    printf
    add     esp, 4
    xor     eax, eax
    mov     esp, ebp
    pop     ebp
    ret
```

> *Listing 4.3.1 – Hello world en nasm*

Dans la forme la plus épurée d'un programme, il suffit d'utiliser deux sections :

- La **section de données** (`.data`) qui est une section de données *initialisées*
- La **section de code** (`.text`) qui contient les instructions

Il existe bien entendu d'autres sections que l'on retrouve en C comme la section
`.rodata` pour les données en lecture seule et la section `.bss` pour *Block Started by
Symbol* qui contient des données non initialisées.

| Section | Mot-clé | Type | Bits | Type C |
|---|---|---|---|---|
| `.bss` | `resb` | byte | 8 bits | `char` |
| `.bss` | `resw` | word | 16 bits | `short` |
| `.bss` | `resd` | double word | 32 bits | `int`, `float` |
| `.bss` | `resq` | double précision | 64 bits | `double` |
| `.data` | `db` | byte | 8 bits | `char` |
| `.data` | `dw` | word | 16 bits | `short` |
| `.data` | `dd` | double word | 32 bits | `int`, `float` |
| `.data` | `dq` | double précision | 64 bits | `double` |

*TABLE 4.1 – Définition de variable dans la section `.bss` ou `.data`*

On utilise le mot clé `global` (ligne 1) suivi d'un identifiant pour indiquer que
cet identifiant sera visible par les autres fichiers objets. En général cet identifiant
est le nom d'un sous-programme, en particulier ici il s'agit de la méthode `main` que
l'on retrouve dans un programme C.

Le mot clé `extern` (ligne 2) indique, quant à lui les noms de symboles définis
dans d'autres fichiers assembleur ou C. On déclarera en externe toute fonction de
la bibliothèque C que l'on utilisera.

On remarque que la déclaration d'une chaîne de caractères est réalisée en
utilisant le mot clé `db` pour *do byte*. Par exemple pour créer un tableau de 8 octets,
il faudra l'initialiser dans la partie `.data` alors que dans la section `.bss`, il suffit
d'indiquer le nombre d'octets que l'on utilisera :

```nasm
section .data
    ; tableau initialisé de 8 octets
    tab1: db 0, 1, 2, 3, 4, 5, 6, 7

section .bss
    ; réserve 8 octets
    tab2: resb 8
```

On note que le caractère qui correspond au passage à la ligne en C, le fameux
`'\n'` n'existe pas en `nasm` si on définit la chaîne par des guillemets simples ou
doubles, il est donc nécessaire de le déclarer en utilisant son code ASCII qui vaut
10. Si on désire utiliser `'\n'` il faut définir la chaîne entre deux symboles **backquote**
qui correspond à l'accent grave en français : `` `hello world\n` ``.

Le reste du code implante le sous-programme `main` comme une fonction qui appelle
la fonction `printf` de la librairie C pour afficher une chaîne de caractères.

### 4.3.1 Compilation avec nasm

La compilation d'un programme en assembleur est réalisée en utilisant sous
Linux la commande `nasm` :

```bash
nasm [arguments] [-o fichier_objet.o] source.asm
```

La partie `-o fichier_objet.o` est optionnelle et permet de modifier le fichier de
sortie qui par défaut sera un fichier d'extension `.o` comportant comme identifiant
le nom du fichier en entrée. On peut ajouter à cette commande des arguments
qui définissent le format de sortie du fichier objet.

| Argument | Description |
|---|---|
| `-f elf` | compilation en 32 bits au format elf |
| `-f elf64` | compilation en 64 bits au format elf64 |
| `-g -F dwarf` | flags de débogage sous Linux |

*TABLE 4.2 – Arguments du programme nasm*

Pour obtenir un fichier assembleur pour une architecture 64 bits sous Linux
avec des options de débogage on utilisera donc :

```bash
nasm -f elf64 -g -F dwarf source.asm
```

> **Convention** : Lorsque l'on créera un fichier assembleur sous le format `nasm`
> on lui attribuera l'extension `_nasm.asm`.

## 4.4 Edition de lien avec gcc/g++

Le compilateur C/C++ peut être utilisé pour réaliser l'édition de liens avec la
bibliothèque standard du C ce qui permet de ne pas réinventer la roue et disposer
de toutes les fonctionnalités du C comme l'affichage (`printf`), la saisie (`scanf`), la
conversion (`atoi`, `atof`), l'allocation mémoire (`malloc`), etc.

On pourra bien évidemment utiliser d'autres compilateurs que le compilateur GNU
comme par exemple :

- `icpc` d'Intel qui est généralement très performant
- `clang++` de LLVM
- `pgc++` de PGI

### 4.4.1 Lier un seul fichier objet

L'édition de liens qui consiste à regrouper plusieurs fichiers objets compilés
séparément afin d'obtenir un exécutable est réalisée avec le compilateur C grâce à
la commande :

```bash
g++ -o executable.exe mon_fichier_assembleur.o
```

Dans le cas présent comme nous n'avons qu'un seul fichier objet, celui-ci doit
donc contenir une méthode `main`.

### 4.4.2 Mélanger assembleur et C/C++

Dans les études de cas qui nous intéresseront plus tard nous considérerons une
fonction de référence écrite en C et en donnerons plusieurs implantations en
assembleur en utilisant les instructions vectorielles par exemple. Toute la machinerie
de test sera écrite en C++ dont notamment la récupération et la vérification des
paramètres ainsi que l'allocation et l'initialisation des données et leur libération.
Les fonctions optimisées seront écrites en assembleur et il faudra regrouper des
fichiers objets compilés avec le compilateur C ou l'assembleur.

Pour définir et pouvoir appeler dans un fichier C ou C++ une fonction écrite
dans un fichier assembleur il suffit de la déclarer `extern` au fichier C. Cependant la
déclaration varie suivant que l'on est dans un fichier C ou un fichier C++ :

```c
// dans un fichier .c
extern int ma_fonction(int *t, int n);
```

```cpp
// dans un fichier .cpp
extern "C" {
    int ma_fonction(int *t, int n);
}
```

On compilera donc les fichiers d'extension `.c` ou `.cpp` séparément et on réalisera
l'édition de liens avec l'ensemble des fichiers objets comme suit :

```bash
g++ -o mon_binaire.exe *.o [options de compilation C/C++]
```

### 4.4.3 Obtenir le code assembleur d'un programme C/C++

Il existe deux méthodes pour obtenir le code assembleur d'un fichier C/C++ :

- Soit on dispose des sources en C/C++, et dans ce cas on utilise le compilateur
  C pour traduire le code en assembleur
- Soit on dispose de l'exécutable et on peut utiliser l'utilitaire `objdump` pour
  désassembler le fichier et en obtenir le code

Prenons comme exemple de travail le Listing 4.4.1 qui calcule la
somme des valeurs d'un tableau que l'on aura initialisé avec des valeurs aléatoires
comprises entre 0 et 9.

```c
#include <stdio.h>
#include <stdlib.h>

#define MAXIMUM 100
int tab[MAXIMUM];
int sum;

int main()
{
    int i;
    srand(1970);
    for (i = 0; i < MAXIMUM; i++)
        tab[i] = rand() % 10;
    sum = 0;
    for (i = 0; i < MAXIMUM; i++)
        sum += tab[i];
    printf("sum = %d\n", sum);
    return 0;
}
```

> *Listing 4.4.1 – Exemple de traduction*

#### 4.4.3.1 gcc -S (code assembleur)

On utilise `gcc` avec l'option `-S` pour obtenir le code assembleur. Il faut également
utiliser l'option `-masm=intel` afin de générer une sortie avec une syntaxe Intel
que je trouve plus lisible que la syntaxe ATT :

```bash
gcc -S -masm=intel fichier.cpp
```

En sortie on obtient un fichier d'extension `.s` qui contient le code assembleur.

#### 4.4.3.2 objdump

`objdump` est un utilitaire qui affiche les informations contenues dans les fichiers
objet ou les exécutables :

```bash
objdump -d -r -l -S -M intel example.exe
```

Il existe de nombreuses options à passer à l'utilitaire `objdump`. Dans l'exemple
précédent on a utilisé :

- `-d` : pour désassembler l'exécutable, c'est à dire en fournir la traduction assembleur
- `-r` : est utilisée pour la relocation des adresses
- `-l` : affiche les numéros de lignes
- `-S` : affiche le code source si disponible
- `-M intel` : utilisation de la syntaxe Intel

On pourra également consulter le site web [godbolt.org](https://godbolt.org) qui permet de soumettre
du code C/C++ et d'obtenir la traduction avec différents compilateurs (GNU, Intel,
LLVM, etc.) ainsi que différentes versions de ces compilateurs.

## 4.5 Débogueur : ddd / gdb

`ddd` (*Data Display Debugger*) est une interface graphique qui se base sur le
débogueur `gdb` (*GNU debugger*). Elle est plus sympathique que `xxgdb` mais reste
néanmoins très basique et pas très ergonomique. On regrettera notamment le fait
que la fenêtre de commandes disparaît par moment, que l'affichage du contenu des
registres est peu convivial et parfois difficile à lire pour les registres vectoriels SSE
et AVX.

On peut bien entendu utiliser `gdb` mais cela implique de connaître les commandes
de ce dernier et travailler en mode texte. Il existe également un certain nombre
d'assistants qui peuvent être chargés lors de l'initialisation de `gdb` mais ils sont
généralement en mode texte et pas très conviviaux :

- **PEDA** (*Python Exploit Development Assistance*) : <https://github.com/longld/peda>
- **PWNDBG** : <https://github.com/pwndbg/pwndbg>
- **Voltron** : <https://github.com/snare/voltron>

On pourra consulter le site **BlackArch** pour découvrir de nombreux autres
outils du même type. On pourra également consulter la section désassembleur
(*disassembler*) qui est intéressante.

## 4.6 Traitement des résultats et graphiques

Comme évoqué précédemment, lors des études de cas nous comparerons diverses
implantations d'une fonction de référence et nous génèrerons des données
relatives au temps d'exécution de ces variantes de la fonction initiale ainsi que des
graphiques.

Pour traiter les résultats, j'utilise le langage PHP (parfois Python) ainsi que des
commandes shell telles que `cut`, `sort`, `grep`. En ce qui concerne les graphiques
nous utiliserons `gnuplot` qui est un générateur de graphiques en deux ou trois
dimensions à partir de données brutes ou de fonctions. `gnuplot` est gratuit et
est disponible pour un grand nombre de plateformes dont les principales que
sont Linux, Windows et macOS. L'intérêt de `gnuplot` est qu'il peut être utilisé de
manière interactive, mais en ce qui nous concerne c'est la possibilité de générer des
graphiques à partir de scripts qui sera notre point d'intérêt.
