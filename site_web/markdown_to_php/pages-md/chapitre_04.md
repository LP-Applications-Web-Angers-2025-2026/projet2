# Chapitre 4 : OutilspourlaProgrammation

## 4.1 Dans ce chapitre nous allons installer et découvrir les logiciels qui nous permet-

tront de développer en assembleur. Nous prenons comme plateforme de développe-
ment une machine sous Linux Ubuntu 18.10 et suivantes.
Nous aurons besoin de plusieurs types d’outils :
•
unéditeurqui nous permettra de saisir du code assembleur avec par exemple
une coloration syntaxique et une indentation automatique afin de faciliter
l’écriture et la relecture du code
•
unassembleurqui compile le code assembleur et le transforme en fichier
objet
•
uncompilateurC/C
++qui permet de faire l’édition de lien avec la biblio-
thèque C/C
++
•
undébogueurqui permet d’examiner le code généré et de l’exécuter pas à
pas afin de détecter des erreurs d’accès à la mémoire par exemple ou vérifier
le résultat produit par les instructions
L’édition de lien sera réalisée grâce àg++leGNU C
++Compilerougccla version
C du compilateur GNU. Il est bien évidemment possible d’utiliser d’autres compila-
teurs commeclang++de LLVM (Low Level Virtual Machine),icpcle compilateur
Intel oupgi++de PGI (Portlang Group, Inc). L’intérêt d’utiliser un compilateur
C pour réaliser l’édition de lien est que l’on a accès aux fonctions de la librairie
C, il suffira de déclarer les fonctions C comme externes au niveau des fichiers
assembleur.

## 4.2 Il existe de nombreux éditeurs sous Linux mais ils ne sont pas tous forcément

adaptés à la structure des programmes assembleurs. En effet, un programme
assembleur se compose de trois parties : les étiquettes (ou labels), les instructions
assembleur et les commentaires. Il est pratique de pouvoir écrire les étiquettes à
gauche, les instructions au centre et les commentaires à droite. Malheureusement
les éditeurs sont généralistes et ne permettent pas ce genre d’organisation, il faut
donc utiliser les tabulations.
1; label --- instruction ------- commentaire
3label: ,1 ; i = 1
Choisir un éditeur est toujours une question de goût personnel. Certains pré-
fèrent les environnements de développement cossus avec une interface graphique
fournie du type IDE commeEclipsealors que d’autres chérissent les éditeurs épu-
rés commenano,vim,emacs. Personnellement j’utilisejeditqui est intéressant car
on peut le configurer simplement et est installable sous Ubuntu sous forme d’un
paquet du même nom.

### 4.2.1 jEdit est un éditeur de texte qui a pour particularité d’être codé en Java. Il

faudra donc installer une machine virtuelle Java afin de pouvoir l’utiliser. jEdit
gère différents langages (Ada, Python, Java, C, ...) ainsi que l’assembleur x86. Son
principal intérêt et qu’il peut être configuré simplement et permet d’ajouter de
nouveaux modes d’édition pour d’autres langages.
En me basant sur le mode d’édition assembly-x86, j’ai créé un fichier nommé :
assembly_x86_2020.lang
qui intégre a priori toutes les instructions x86 décrites sur le sitehttp://
nasm.us
en 2019 ainsi que les instructions conditionnelles (cmovCC, setCC, cf.
Section) et les instructions de saut conditionnel. Cela représente au total
1685 instructions. Pour configurer jEdit, il suffit de consulter la page internet dédiée
à l’assembleur sur le site de l’auteur
.

### 4.2.2 gedit

est un éditeur de texte libre fourni par défaut avec l’environnement gra-
phique GNOME
. Il supporte l’encodage UTF-8 et gère la coloration syntaxique de
nombreux langages de programmation mais malheureusement pas de l’assembleur.
On peut néanmoins ajouter un fichier.langdans le répertoire adéquat afin de
donner les régles de coloration syntaxique de l’assembleur x86.
Téléchargez le fichier suivant et copiez le dans le répertoire degedit:
wget http://www.info.univ-angers.fr/~richer/assembly/gedit/assembly_x86_2020.lang
2sudo cp assembler.lang /usr/share/gtksourceview-*.0/language-specs/

### 4.2.3 Kate est un éditeur de texte spécialement adapté à la programmation issu de

l’environnement de bureau KDE. Pour disposer de la coloration syntaxique il faut
utiliser le menuTools>Higlighting>Assembler>Intel x86 (NASM).

### 4.2.4 emacs

(Editor MACroS) est à la base un éditeur de texte extensible basé sur le
langage LISP. Il a été popularisé avec la version GNU écrite par Richard Stallman
.
Il faudra par exemple installer les paquetsnasm-modeetx86-lookupafin de pouvoir
disposer respectivement de la coloration syntaxique et de l’aide en ligne.

### 4.2.5 Le concurrent d’emacs, la fameuxviou sa version amélioréevimpeut également

être utilisé pour écrire des programmes en assembleur. Il faudra le configurer pour
pouvoir utiliser un mode assembleur.
Eclipse dispose d’un plugin appeléASM Plugindisponible sursourceforge.net
et qui permet d’utiliser différents assembleurs commenasm,tasm,masm. Cependant
il n’est plus maintenu depuis 2006.
On pourra utiliser Sublime Text qui possède un mode nasm mais j’ai rencontré
beaucoup de problèmes pour installer Package Control qui est censé gérer les
packages et celui-ci ne fonctionnait pas pour installer de nouveaux packages.
De ce point de vue, Atom
se montre plus convivial et fonctionnel, il suffit
. Acronyme deGNU Network Object Model Environment, il s’agit d’un environnement de bureau
libre convivial utilisé sous Linux/UNIX.
d’installer le paquetlanguage-nasmx86.

## 4.3 Le choix denasm(The Netwide Assembler) semble assez naturel car il est très

simple à utiliser. Nous verrons que la structure des programmesnasmliée à l’utilisa-
tion du compilateurgccpermet une interaction rapide et peu complexe à mettre en
oeuvre entre code en C/C
++et code assembleur.nasmdispose en outre d’une large
documentation sous forme de site web ou de fichier PDF téléchargeable depuis le
sitehttp://nasm.uset d’une communauté active.
La structure d’un programmenasmest également très simple, voici par exemple
le fameux programmehello world!présenté Listing. Il s’agit de la version en
architecture 32 bits. On notera que les commentaires sont introduits par le symbole
point virgule(;) et tout ce qui suit ce symbole jusqu’à la fin de la ligne fait partie
du commentaire.
1globalmain
2externprintf
4; ==== DATA ====
5section.data

```text
; declaration d'une chaine
msg: db"hello world!",,
10; ==== CODE ====
11section.text
13; fonction main
14main:
push
mov,
pushdwordmsg
call
add,
xor,
mov,
pop
ret
```

> *Listing 4.3.1 – Hello world en nasm*

Dans la forme la plus épurée d’un programme, il suffit d’utiliser deux sections :
4.3. L’ASSEMBLEUR NASM 143
•la section de données (.data) qui est une section de donnéesinitialisées
•la section de code (.text) qui contient les instructions
Il existe bien entendu d’autres sections que l’on retrouve en C comme la section
.rodatapour les données en lecture seule et la section.bsspourBlock Started by
Symbolqui contient des données non initialisées.
.bss.data Type BitsType C
resb byte 8 bits char
resw word 16 bits short
resd double word 32 bits int, float
resq double précision 64 bits double
TABLE4.1 – Définition de variable dans la section.bssou.data
On utilise le mot cléglobal(ligne 1) suivi d’un identifiant pour indiquer que
cet identifiant sera visible par les autres fichiers objets. En général cet identifiant
est le nom d’un sous-programme, en particulier ici il s’agit de la méthodemainque
l’on retrouve dans un programme C.
Le mot cléextern(ligne 2) indique, quant à lui les noms de symboles définis
dans d’autres fichiers assembleur ou C. On déclarera en externe toute fonction de
la bibliothèque C que l’on utilisera.
On remarque que la déclaration d’une chaîne de caractères est réalisée en
utilisant le mot clédbpourdo byte. Nous avons fait figurer Table
qui permettent de définir les données en fonction du segment de données (.data
ou.bss). Par exemple pour créer un tableau de 8 octets, il faudra l’initialiser dans
la partie.dataalors que dans la section.bss, il suffit d’indiquer le nombre d’octets
que l’on utilisera :
1section

```text
; tableau initialisé de 8 octets
tab1: ,1,2,3,4,6,7
5section
; réserve 8 octets
tab2:
```

On note que le caractère qui correspond au passage à la ligne en C, le fameux
’\n’n’existe pas ennasmsi on définit la chaîne par des guillemets simples ou
doubles, il est donc nécessaire de le déclarer en utilisant son code ASCII qui vaut
chaîne en langage C. Si on désire utiliser’\n’il faut définir la chaîne entre deux
symbolesbackquotequi correspond à l’accent grave en français :‘hello world\n‘ .
Le reste du code implante le sous-programmemaincomme une fonction (voir le
Chapitre) qui appelle la fonction printfde la librairie C pour afficher une chaîne
de caractères.

### 4.3.1 La compilation d’un programme en assembleur est réalisée en utilisant sous

Linux la commandenasm:
nasm [arguments] [-o ficher_objet.o] source.asm
La partie-o fichier_objet.oest optionnelle et permet de modifier le fichier de
sortie qui par défaut sera un fichier d’extension.ocomportant comme identifiant
le nom du fichier en entrée. En l’occurrence ce serait icisource.o. On peut ajouter
à cette commande des arguments qui définissent le format de sortie du fichier objet
(cf. Table).
ArgumentsDescription
-f elf compilation en 32 bits au format elf
-f elf64compilation en 64 bits au format elf64
-g -F dwarfflags de débogage sous Linux
TABLE4.2 – Arguments du programme nasm
Pour obtenir un fichier assembleur pour une architecture 64 bits sous Linux
avec des options de débogage on utilisera donc :
nasm -f elf64 -g -F dwarf source.asm
Convention
Lorsque l’on créera un fichier assembleur sous le formatnasmon lui attribuera
l’extension :_nasm.asm.

## 4.4 Le compilateur C/C

++peut être utilisé pour réaliser l’édition de liens avec la
bibliothèque standard du C ce qui permet de ne pas réinventer la roue et disposer
de toutes les fonctionnalités du C comme l’affichage (printf), la saisie (scanf), la
conversion (atoi,atof), l’allocation mémoire (malloc), etc.
On pourra bien évidemment utiliser d’autres compilateurs que le compilateur
GNU comme par exemple :
4.4. EDITION DE LIEN AVEC GCC/G++ 145
•icpcd’Intel qui est généralement très performant
•clang++de LLVM
•pgc++de PGI

### 4.4.1 L’édition de liens qui consiste à regrouper plusieurs fichiers objets compilés

séparément afin d’obtenir un exécutable est réalisée avec le compilateur C grâce à
la commande :
g++ -o executable.exe mon_fichier_assembleur.o
Dans le cas présent comme nous n’avons qu’un seul fichier objet, celui-ci doit
donc contenir une méthodemain.

### 4.4.2 Dans les études de cas qui nous intéresserons plus tard nous considérerons une

fonction de référence écrite en C et en donnerons plusieurs implantations en as-
sembleur en utilisant les instructions vectorielles par exemple. Toute la machinerie
de test sera écrite enC
++dont notamment la récupération et la vérification des
paramètres ainsi que l’allocation et l’initialisation des données et leur libération.
Les fonctions optimisées seront écrites en assembleur et il faudra regrouper des
fichiers objets compilés avec le compilateur C ou l’assembleur.
Pour définir et pouvoir appeler dans un fichier C ouC
++une fonction écrite
dans un fichier assembleur il suffit de la déclarerexterneau fichier C. Cependant la
déclaration varie suivant que l’on est dans un fichier C ou un fichier C
++:
1// dans un fichier .c
2extern (int*t,int );
4// dans un fichier .cpp
5extern {

```text
int (int*t,int );
7}
```

On compilera donc les fichiers d’extension.cou.cppséparément et on réalisera
l’édition de liens avec l’ensemble des fichiers objets comme suit :
g++ -o mon_binaire.exe *.o [options de compilation C/C++]

### 4.4.3 Il existe deux méthodes pour obtenir le code assembleur d’un fichier C/C

++:
•
soit on dispose des sources en C/C
++, et dans ce cas on utilise le compilateur
C pour traduire le code en assembleur
•
soit on dispose de l’exécutable et on peut utiliser l’utilitaireobjdumppour
désassembler le fichier et en obtenir le code
Prenons comme exemple de travail le Listing
somme des valeurs d’un tableau que l’on aura initialisé avec des valeurs aléatoires
comprises entre 0 et 9.
1#include
2#include
4#define MAXIMUM 100
5inttab[MAXIMUM];
6intsum;
8intmain()

```text
inti;
srand(1970);
for(i;i);
sum;
for(i;i)
printf("sum = %d ˙",
return0;
19}
```

> *Listing 4.4.1 – Exemple de traduction*

#### 4.4.3.1 On utilisegccavec l’option-Spour obtenir le code assembleur. Il faut également

utiliser l’option-masm=intelafin de générer une sortie avec une syntaxe Intel que
je trouve plus lisible que la syntaxe ATT :
gcc -S -masm=intel fichier.cpp
En sortie on obtient un fichier d’extension.squi contient le code assembleur.

#### 4.4.3.2 objdump

est un utilitaire qui affiche les informations contenues dans les fichiers
objet ou les exécutables :
objdump -d -r -l -S -M intel example.exe
Il existe de nombreuses options à passer à l’utilitaireobjdumpau format court
ou long. Dans l’exemple précédent on a utilisé :
-d
pour désassembler l’exécutable, c’est à dire en fournir la traduction assembleur
-rest utilisée pour la relocation des adresses
-laffiche les numéros de lignes
-Saffiche le code source si disponible
-M intelutilisation de la syntaxe Intel
On pourra également consulter le site webgodbolt.orgqui permet de soumettre
du code C/C
++et d’obtenir la tradution avec différents compilateurs (GNU, Intel,
LLVM, etc.) ainsi que différentes versions de ces compilateurs.

## 4.5 ddd

(Data Display Debugger) est une interface graphique qui se base sur le
débogueurgdb(GNU debugger). Elle est plus sympatique quexxgdbmais reste
néanmoins très basique et pas très ergonomique. On regrettera notamment le fait
que la fenêtre de commandes disparaît par moment, que l’affichage du contenu des
registres est peu convivial et parfois difficile à lire pour les registres vectoriels SSE
et AVX.
On peut bien entendu utilisergdbmais cela implique de connaître les com-
mandes de ce dernier et travailler en mode texte. Il existe également un certains
nombre d’assistants qui peuvent être chargés lors de l’initialisation degdbmais ils
sont généralement en mode texte et pas très conviviaux :
•
PEDA (Python Exploit Development Assistance) :https://github.com/longld/
peda
•PWNDBG :https://github.com/pwndbg/pwndb
•Voltron :https://github.com/snare/voltron
On pourra consulter le site BlackArch
pour découvrir de nombreux autres
outils du même type. On pourra également consulter la section désassembleur
(disassembler) qui est intéressante.

## 4.6 Comme évoqué précédemment, lors des études de cas nous comparerons di-

verses implantations d’une fonction de référence et nous génèrerons des données
relatives au temps d’exécution de ces variantes de la fonction initiale ainsi que des
graphiques.
Pour traiter les résultats, j’utilise le langage PHP (parfois Python) ainsi que des
commandes shell telles quecut,sort,grep. En ce qui concerne les graphiques
nous utiliseronsgnuplotqui est un générateur de graphiques en deux ou trois
dimensions à partir de données brutes ou de fonctions.gnuplotest gratuit et
est disponible pour un grand nombre de plateformes dont les principales que
sont Linux, Windows et MacOS. L’intérêt degnuplotet qu’il peut être utilisé de
manière interactive, mais en ce qui nous concerne c’est la possibilité de générer des
graphiques à partir de scripts qui sera notre point d’intérêt.
