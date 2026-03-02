# Chapitre 5 : Traitementsdebase If you just spend nearly 30 hours

Traitementsdebase
If you just spend nearly 30 hours
debugging some assembly
soon you will be glad to
Write in C
Write in C
sur la musique de Let it be (The Beatles)
## 5.1 Dans ce chapitre nous allons découvrir et nous familiariser avec les instructions

de base de l’assembleur x86. Avant de nous diriger dans les chapitres suivants
vers la découverte des instructions du coprocesseur arithmétique et celles des
unités vectorielles. Nous définissons de manière plus détaillée les registres des
processeurs d’architecture x86 puisque les instructions agissent sur ces registres.
Nous présentons les instructions les plus souvent utilisées car la connaissance de
l’ensemble des instructions assembleurs et tout ce qui s’y rattache représente 10
volumes de documentation Intel [7,8,9,10,11,12,13,14,15,16], soit plus de
4800 pages. Nous verrons également comment traduire les structures de contrôle
du langage C comme les conditionnelles (if, switch) et les boucles (for, while).
## 5.2 Nous avons déjà évoqué les registres dans le Chapitre. Nous allons revoir, en

fonction de l’architecture (16, 32 ou 64 bits), quels registres sont disponibles.
### 5.2.1 L’Intel 8086 disposait de 8 registres 16 bits dont certains sont manipulables

en deux fois 8 bits dits partie haute et partie basse. Ces registres d’usage géné-
ral (General Purpose), comme évoqué antérieurement, sont au nombre de 8 (cf.
Section).
Registre Partie Partie Utilisation
16 bits Haute Basse
bits 15 à 8 bits 7 à 0
ax accumulateur, multiplication, division
bx accés mémoire
cx compteur, repétition (rep), décalage
dx ,out, multiplication, division
si - - source index, lods,movs
di - - destination index, stos,movs
bp - - base pointer, pile
sp - - stack pointer, sommet de pile
TABLE5.1 – Registres 16 bits du Intel 8086
Ils sont décrits Table. Par exemple le registre axest appeléaccumulateur
et permet de réaliser certaines opérations comme la multiplication, la division
mais reçoit également le résultat des instructions commelodsb,lodsw,lodsd(cf.
Section). On est en mesure de manipuler la partie haute nommée ahou la
partie basseal.
Les autres registres (qui ne sont pas d’usage général) qui sont également à
prendre en considération sont : le registreipqui est le pointeur d’instruction
(Instruction Pointer), c’est à dire l’adresse de la prochaine instruction en mémoire,
et le registreflags. Ce dernier est mis à jour après exécution de la plupart des
instructions et donne des informations sur le résultat obtenu. Il n’est pas accessible
directement (sauf si on utilise l’instructionlahf) mais au travers d’instructions de
calcul ou de branchement conditionnel. Chacun de ses bits contient une information
comme par exemple :
•le bit 0, CF (Carry Flag) le bit de retenue
•le bit 2, PF (Parity Flag) indique un nombre pair de bits à 1
•le bit 4, AF (Adjust Flag)
•le bit 6, ZF (Zero Flag) le bit de zéro, indique une valeur nulle
•le bit 7, SF (Sign Flag) le bit de signe indique une valeur négative
•
le bit 10, DF (Direction Flag) utilisé avec les instructions agissant sur les
chaînes commelods,stos, etc
•le bit 11, OF (Overflow Flag) le bit de débordement pour les calculs signés
Par exemple, leCarry Flagest utilisé lors de l’addition, notamment pour signaler
qu’une retenue a été produite lors du calcul. Le bit de débordement (Overflow)
indique qu’une opération arithmétique a produit un résultat signé invalide.
Par exemple sialetblcontiennent la valeur128, l’addition de ces deux re-
gistres :
•
met à1leCarry Flagpuisque le résultat devrait être256, mais que cette valeur
ne peut pas être représentée sur 8 bits
•
met à1le l’Overflow Flagcar si on considère que les données sont signées,
l’addition de deux valeurs négatives (−128+−128 ) donne une valeur positive
(0), or on devrait obtenir une valeur négative
Si au contraire on utilise les registresaxetbxalors CF et OF restent à0puisque
dans les deux cas (signé ou non signé) les valeurs sont positives, on effectue la
somme128 + 128.
Il existe d’autres cas de positionnement de l’Overflow Flag: lors de l’addition de
deux valeurs positives (qui donne un résultat négatif) et lors de la soustraction :
•
soutraction entre une valeur négative et un nombre positif qui donne un
résultat positif alors que le résultat devrait être négatif :−128−1
•
soutraction entre une valeur positive et un nombre négatif qui donne un
résultat négatif alors que le résultat devrait être positif :127−(−1)
Nous avons en outre évoqué, Chapitre, les registres de segments qui contiennent
une adresse mémoire qui indique le début du code (cs), des données (ds), de la
pile (ss) et un registre de segment auxiliaire (espourExtra Segment).
### 5.2.2 En architecture 32 bits, les registres généraux ont une taille de 32 bits et les

registres existants du 8086 sont toujours utilisables mais ont été étendus et se
nommenteax,ebx, ...esp,eip,eflags(voir Table). On peut alors stocker 2
valeurs différentes dans un registre 32 bits ce qui correspond à autant d’adresses
mémoires et à un total de 4 Go. On peut toujours utiliser les registres 16 et 8 bits
commeax,ahoual.
Les registreseipeteflagssont les extensions deipetflagset les registres de
segment sont les mêmes. On a cependant ajouté deux autres registres de segment
appelésfsetgs.
### 5.2.3 L’architecture 64 bits apportent plusieurs changements importants. Les registres

ont bien entendu une taille de 64 bits et sont appelésrax,rbx, ...rsp,rip,rflags.
Registre Partie Basse Partie Haute Partie Basse
32 bits 16 bits 8 bits 8 bits
eax
ebx
ecx
edx
esi - -
edi - -
ebp - -
esp - -
TABLE5.2 – Registres manipulables en architecture 32 bits
On dispose également de 8 nouveaux registres nommésr8àr15ce qui laisse une
plus grande marge de manoeuvre pour la programmation en permettant de stocker
des valeurs temporaires dans ces registres plutôt que de les stocker en mémoire.
Registre Partie Basse Partie Basse Partie Haute Partie Basse
64 bits 32 bits 16 bits 8 bits 8 bits
rax
rbx
rcx
rdx
rsi - sil
rdi - dil
rbp - bpl
rsp - spl
r8 - r8b
. . . . . . . . . . . .
r15 - r15b
TABLE5.3 – Registres manipulables en architecture 64 bits
La Table
64 bits. On notera que l’on peut manipuler les premiers 8 bits de certains registres
commersialors que cela n’est pas possible en 32 bits, en effet, en architecture 32
bits on ne pourra manipuler queesiousi.
5.3. INSTRUCTIONS ÉLÉMENTAIRES 153
### 5.2.4 Le passage des microprocesseurs 8 bits à des microprocesseurs 16 bits a permis

de gérer une quantité de mémoire plus importante mais également de gérer des
nombres plus grands en une seule opération. Le bus de données qui représente les
quantités sur lesquelles on réalise des calculs, et le bus mémoire qui représente la
taille de l’espace mémoire, sont corrélés puisqu’on stocke dans un registre, soit une
adresse mémoire, soit un entier.
Il en fut de même lors du passage de 16 bits au 32 bits, puis du 32 bits au 64
bits. Ainsi, avec 32 bits on gère4×10
9 valeurs alors qu’avec 64 bits on atteint un
ordre de grandeur de18×10
, soit18Eo(Exa octets).
La question que l’on peut se poser est la suivante, pourquoi ne passe t’on
pas à des microprocesseurs 128 bits ce qui permetrait de gérer34010
36 valeurs.
Simplement parce que seules quelques rares applications ont besoin de gérer des
quantitiés si importantes et que globalement nous n’en avons pas l’utilité. Par
exemple1810
18 représente environ 570 milliards d’années. D’un autre côté, si on
rapporte ce temps à des nano secondes cela représente 570 ans.
## 5.3 La grande majorité des instructions x86 sont de la forme :

operationdestination,source
•
operationest un mnémonique, c’est à dire un symbole court de quelques
lettres facilement compréhensible et mémorisable qui représente l’opération
à exécuter, par exempleaddpour l’addition
•
sourceest une donnée en lecture qui ne sera donc pas modifiée, ce peut être
une constante, un registre ou une adresse mémoire
•
destinationest une donnée en écriture qui peut être un registre ou une adresse
mémoire
•les deux opérandessourceetdestinationsont séparées par une virgule
En fait la syntaxe de l’assembleur permet d’écrire plus simplement le traitement
qui est effectivement réalisé, à savoir :
destination=destination operation source
Ainsi,add ,ebxsignifie que l’on doit réaliser le calculeax=eax+ebx.
Nous verrons qu’il existe d’autres variantes de format d’instruction comme pour
les instructionsneg,not,cmp,test,div,mul, etc.
Il existe toutefois une contrainte imposée par le format de codage des instruc-
tions x86 qui nous force à n’avoir qu’une seule référence mémoire (cf. Section),
cela implique que l’on ne peut pas écrire :
1 operation [adresse1], adresse2]
Il faudra alors passer par un registre et écrire :
1 mov ,adresse2]
2 operation [adresse1],registre
L’instructionmovdont nous allons reparler ci-après déplace la donnée située à
l’adresseadresse2dans un registre.
Référence mémoire
On remarque également que lorsque l’on fait référence à une donnée en
mémoire identifiée par son adresse, on place l’adresse entre crochets[].
Ainsi :
•mov ,addr]
signifie placer la valeur 32 bits située à l’adresseaddr
dans le registreeax
•mov ,val
signifie placer la valeur constante codée sur 32 bitsval
dans le registreeax
5.3.1mov: chargement et stockage
L’instructionmovréalise le chargement (Load) et le stockage (Store) des don-
nées. C’est l’instruction qui est la plus souvent utilisée. Le fait de déplacer une
donnée n’influe par sur le registreflags. Il faudra donc utiliser une instruction de
comparaison pour vérifier si la donnée chargée dans un registre est nulle, postive
ou négative.
Voici quelques exemples liés à l’instructionmovqui permettent de comprendre
comment l’utiliser :
•mov ,0: affecter la valeur0au registreeax
•mov ,ebx: affecter le contenu deebxau registreeax
•mov ,bh: affecter le contenu debhau registreal
•mov ,ebx+ecx*4]
: affecter au registreeaxla valeur située à l’adresse
mémoire indiquée, il s’agit d’une référence mémoire (comme vu Section)
commeeaxest un registre 32 bits on lit le double mot situé à l’adresse indi-
quée
•mov[edi+esi],edx
: stocker à l’adresseedi+esila valeur contenue
dans le registreedx
On trouve deux variantes de l’instructionmov:
5.3. INSTRUCTIONS ÉLÉMENTAIRES 155
•movsx
(Mov with Sign eXtension) qui transforme une valeur sur 8 (respective-
ment 16 bits) en une valeur 16 (respectivement 32 bits) en préservant le fait
que la valeur soit négative ou positive
•movzx
(Mov with Zero eXtend) qui transforme une valeur sur 8 ou 16 bits en
une valeur 16, 32 ou 64 bits en la complétant avec des0
L’instructionmovzxest parfois plus rapide que mov
. Il est donc préférable
d’écrire, afin de lire l’octect à l’adresseedien mémoire et le stocker dans le registre
al:
1 movzx ,byte[edi]
plutôt que :
1 mov ,edi]
La différence est quemovzxva modifiereaxen mettant dansall’octet pointé
parediet en mettant à 0 les 24 autres bits. On remarque que dans ce cas il faut
préciser la quantité chargée :bytepour un octet,wordpour un mot et dans d’autres
instructionsdwordpour un double mot.
5.3.2
#### 5.3.2.1 add,sub,incetdec

Les instructionsaddetsubréalisent respectivement l’addition et la soustraction
de deux valeurs entières signées ou non signées et prennent deux opérandes.
Les instructionsincetdecréalisent respectivement l’incrémentation et la décré-
mentation de leur unique opérande. On peut les utiliser pour réaliser les opérations
du C comme++iqui correspond à l’incrémentation d’une variable de bouclefor.
Les deux instructions suivantes sont donc équivalentes :
1 add ,1
2 inc
Il existe également une instructionadc(ADd with Carry) qui réalise une addition
avec une retenue en entrée. Par exemple, imaginons que l’on travaille avec les
registres 16 bits de l’Intel 8086 et que l’on désire réaliser le calcula+b pour
a= 196607etb= 262145, soit en hexadécimala=2FFFF_h etb=40001_h. Ces
deux valeurs sont supérieures à2
−1 = 65535 , pour les stocker on va donc devoir
utiliser deux registres de 16 bits :
1. voirIntel 64 and IA-32 Architectures Optimization Reference Manual, section 3.5.1.8.
•
pouraon utilisera par exempledx:ax, c’est à dire la partie haute dansdxet
la partie basse dansax
•pourbon utiliseracx:bx
1 mov ,0xFFFF
2 mov ,0x2 ; dx:ax = 0x2FFFF
3 mov ,0x0001
4 mov ,0x4 ; cx:bx = 0x40001
Si on réalise le calcul suivant (a=a+b) en écrivant :
1 add ,bx
2 add ,cx ; ne prend pas en compte la retenue !
On obtient un résultat faux car alorsdx:ax=60000_h= 39321610 . Cela est dû
au fait que la première addition génère une retenue de 1 qu’il faut utiliser lors de
la deuxième addition. On doit donc écrire :
1 add ,bx
2 adc ,cx ; prend en compte la retenue
Afin d’obtenir le résultat correct qui estdx:ax=70000_h= 45875210 . On trouve
également l’instructionsbb(SuBstract with Borrow) pour faire des soustractions si
on utilise deux registres 16 ou 32 bits.
Concernant les instructionsincetdec, elles modifient les flags OF, SF, ZF, AF
et PF, mais pas le Carry Flag. Il est de plus conseillé de ne pas les utiliser car elle
peuvent produire dans certaines situations desfalse dependencieset despartial flag
register stall.
Un exemple concret est celui du Chapitre
en mode 64 bits. Le code suivant :
1.while:
2 movzx ,byte[rdi+rcx]
3 sub ,'a' ; s[i] - 'a'
4 inc [rbx+rax*4]
5 inc ; ++i
7 cmp ,esi ; if (i < size)
9 jne ; goto .while
est susceptible dans certains cas et sous certaines architectures de produire de
graves ralentissements passant d’un code qui s’exécutait en 6 secondes à un temps
d’exécution de 29 secondes, mais environ 6 à 7 fois sur 10 exécutions, ce qui semble
totalement aberrant! On devrait en effet obtenir toujours le même effet, mais ce
n’est pas le cas. Si on remplace l’instructionincpar unaddle problème disparaît.
5.3. INSTRUCTIONS ÉLÉMENTAIRES 157
#### 5.3.2.2 mul

L’instructionmuln’accepte qu’une seule opérande source et réalise la multipli-
cation non signée entre un registre 8, 16 ou 32 bits et respectivemental,ax,eax
comme indiqué Table. Les notations reg8,reg16,reg32signifient respective-
ment un registre général 8, 16 ou 32 bits.
OpérationSourceRésultat
mul
mul
mul
TABLE5.4 – Modes d’utilisation demul
Par exemple, si on écritmul , c’est le registrealqui est multiplié parbhet le
résultat est placé dansax.
En architecture 32 bits, on notera qu’avec une opérande source de 16 (resp. 32
bits), le registredx(resp.edx) est modifié. Il ne faudra donc pas stocker de donnée
dansedx, ou alors, sauvergarder cette donnée avant la multiplication en la plaçant
dans la pile, puis après la multiplication, la récupérer depuis la pile.
Pour calculer7×5ou5×7, on écrira donc :
1 push ; on sauvegarde edx
2 mov ,5
3 mov ,7
4 mul ; edx:eax= 0:35
5 pop ; on restaure edx
Il existe également une autre instruction appeléeimul(voir ci-après) qui réalise
une multiplication signée et peut prendre trois formes en fonction du fait qu’elle
utilise une, deux ou trois opérandes [8].
#### 5.3.2.3 divet le modulo

L’instructiondivréalise la division entièrenon signéeentre une valeur 64,
32 ou 16 bits par un diviseur sur 32, 16 ou 8 bits respectivement, le reste de la
division est également calculé. L’instructiondivpermet donc également de réaliser
le modulo (voir Table).
Par exemple en architecture 32 bits, c’est en fait une valeur sur 64 bits contenue
dans deux registres 32 bitsedx:eaxque l’on divise par une opérande 32 bits
contenue dans un autre registre. Si on désire travailler avec des valeurs 32 bits, il
faut mettreedxà0avant de faire la division. Pour diviser 1024 par 3, on écrira
donc :
DividendeDiviseurQuotientReste
edx:eax
eax
ax
TABLE5.5 – Comportement de l’instructiondiv
1 mov ,1024
2 xor ,edx ; mise à zéro de edx pour rester
3 ; en 32 bits
4 mov ,3
5 div
Le registreeaxcontiendra alors la valeur341etedxsera égal à1car1024 =
3×341 + 1.
Attention, si le résultat de la division deedx:eaxpar un autre registre 32
bits donne un résultat plus grand que la valeur hexadécimale0xFF_FF_FF_FF, le
microprocesseur lève une exception. C’est pour cela qu’il est conseillé de mettre
edxà 0 avant de faire le calcul. Par exemple sieaxest égal à 6 et que l’on divise
parebxqui vaut 2, mais queedxcontient 8, c’est la valeur8_00_00_00_06qui est
divisée par 2, ce qui donne4_00_00_00_03qui est supérieure àFF_FF_FF_FF.
En outre, puisqu’il s’agit d’une division non signée, si on réalise le calcul suivant :
1 mov ,6 ; eax = FF_FF_FF_FA_h
2 xor ,edx ; mise à zéro de edx pour rester
3 ; en 32 bits
4 mov ,3 ;
5 div ; eax = 55_55_55_53_h = 1_431_655_763
6 ; edx = 0
On n’obtiendra pas−2(FF_FF_FF_FE) danseaxmais55_55_55_53. Pour réaliser
une division signée, il faut utiliser l’instructionidiv(Integer Division) mais pour cela
il faut mettreedxà−1, sinon le résultat du calcul sera le même que précédemment.
En effet, c’estedx:eaxque l’on divise parebx, il faut donc coder−2sur 64 bits :
1 mov ,6 ; eax = FF_FF_FF_FA_h
2 xor ,edx ; mise à -1 de edx pour réaliser
3 dec ; -6 (FF_FF_FF_FF_FF_FF_FF_FA) / 3
4 mov ,3 ;
5 div ; eax = FF_FF_FF_F2_h = -2 (quotient)
6 ; edx = 0 (reste)
ou alors, on utilisera l’instructioncdqqui réalise cette conversion :
5.3. INSTRUCTIONS ÉLÉMENTAIRES 159
1 mov ,6 ; eax = FF_FF_FF_FA_h
2 cdq ; edx = FF_FF_FF_FF, eax = FF_FF_FF_FA
3 mov ,3 ;
4 div ; eax = FF_FF_FF_F2_h = -2 (quotient)
5 ; edx = 0 (reste)
#### 5.3.2.4 imul

Elle réalise la multiplication de valeurs signées et possède trois formats. Voici
par exemple avec des opérandes 32 bits les formalismes possibles :
1 imul ; edx:eax = eax *ecx (comme mul)
2 imul ,ecx ; ebx = ebx*ecx (edx pas modifié)
3 imul ,3 ; ebx = ebx*3 (edx pas modifié)
#### 5.3.2.5 idiv

Elle réalise la division de valeurs signées et possède le même format quediv.
Par exemple, pour diviser 23 par -7 :
1 xor ,edx
2 mov ,23
3 mov ,7
4 idiv
On obtient alors−3danseaxet2dansedx.
#### 5.3.2.6 neg

L’instructionnegréalisele complément à deux(Two’s Complement Negation). Si
eaxcontient la valeur−1alorsneg produira la valeur 1 danseaxet inversement.
LeSign Flagdu registreflagssera positionné en conséquence.
Attention cette instruction met le drapeau CF (carry flag) à 0 si la valeur initiale
est 0, sinon le drapeau CF sera positionné à 1, on calcule ensuite le complément
à deux et on ajuste les autres flags en conséquence. On pourra par exemple
utiliser l’information sur le drapeau CF pour implanter en 4 instructions la fonction
zero_un_moins_un(cf. Exercice).
#### 5.3.2.7 lea

L’instructionlea(Load Effective Address) est intéressante car elle réalise une
multiplication et une addition. Il ne faut pas se laisser leurrer par son formalisme
qui utilise la représentation sous forme de référence mémoire. Ainsi :
1 lea ,ebx+ecx*4+9]
signifie que l’on calcule l’expressionebx + ecx * 4 + 9et qu’on affecte le
résultat au registreeax.Il n’y a pas d’accès à la mémoire!
En particulier, si on désire multiplier le registreeaxpar 5, plutôt que d’utiliser
une multiplication coûteuse en nombre de cycles on utilisera :
1 lea ,eax+eax*4]
Comme pour les références à la mémoire le facteur d’échelle qui multiplie le
registreeaxdans l’instruction précédente ne peut être égal qu’à 1, 2, 4 ou 8 (cf.
Section).
### 5.3.3 Les instructions logiques (ou binaires, puisqu’elles s’appliquent sur l’ensemble

des bits de leurs opérandes) permettent de réaliser bon nombre d’opérations basées
sur l’utilisation de masques.
xyand(x,y)or(x,y)xor(x,y)
0 0 0 0 0
0 1 0 1 1
1 0 0 1 1
1 1 1 1 0
TABLE5.6 – Table de vérité pour les fonctionsand,or,xor
Nous rappelons Table, les tables de vérité des opérateurs and,oretxor.
#### 5.3.3.1 andetor

L’instructionandpermet de sélectionner des bits spécifiques d’un registre alors
que l’instructionorpermet de positionner certains bits à 1. Ainsi, le code suivant
permet de ne garder la valeur que des 3 bits de poids faible du registreeaxet de
positionner le bit de poids fort à 1.
1 and ,0x07 ; sélectionne les 3 bits de poids faible
2 or ,0x80000000 ; fixe le bit de poids fort à 1
5.3. INSTRUCTIONS ÉLÉMENTAIRES 161
#### 5.3.3.2 xor

L’instructionxorréalise leou exclusif. Cette instruction est également utilisée
sous la formexor ,reg ouregest l’un des registres généraux. C’est un autre
moyen de mettre la valeur0dans le registreregcar d’après la table de vérité du
xor, unou exclusifentre deux valeurs identiques donne 0.
1 xor ,al ; mise à zéro de al
2 xor ,ecx; mise à zéro de ecx
L’instructionxorpermet également de modifier un bit en le positionnant à 1 s’il
était préalablement à 0 et inversement.
#### 5.3.3.3 not

Elle réalise le complément, c’est à dire qu’on change les bits à 1 en les position-
nant à 0 et inversement. Avecnasm, il existe l’opérateur˜qui réalise lenot, on peut
donc écrire :
1 mov ,7
au lieu de :
1 mov ,7
2 not
5.3.4
#### 5.3.4.1 shl,shr

Les instructionsshl(SHift Left) etshr(SHift Right) réalisent des décalages
respectivement à gauche et à droite de l’opérande destination, la source étant une
constante ou le registreclqui indique de combien de rangs on réalise le décalage.
Décaler un registre denrangs vers la gauche consiste à faire une multiplication
entière par2
n. De la même manière, si on décale à droite, on réalise une division
entière par2
n
:
1 mov ,17
2 shl ,5 ; eax = 17*2^5 = 544
3 shr ,7 ; eax = 544 / 2^7 = 4
#### 5.3.4.2 sar

L’instructionsar(Shift Arithmetic Right) permet de réaliser une division par
une puissance de 2 tout en préservant le signe de la valeur divisée. Comme on peut
le voir sur l’exemple qui suit,shrconsidère -128 comme une valeur non signée et
ne préservera pas son signe, par contre,sarle fera :
1 mov ,128; eax = 0xFFFFFF80
2 shr ,2 ; eax = 0x3FFFFFE0 = 1073741792
3 mov ,128; eax = 0xFFFFFF80
4 sar ,2 ; eax = 0xFFFFFFE0 = -32
Il existe également d’autres opérations de décalage commercl(Rotate Carry
Left) etrcr(Rotate Carry Right),rol(ROtate Left),ror(ROtate Right). Pour de plus
amples explications sur ces instructions nous conseillons la lecture de [19].
5.3.5
#### 5.3.5.1 cmp

L’instructioncmp(CoMPare) réalise la comparaison non signée de deux opé-
randes en calculant leur différence. Les opérandes ne seront pas modifiées seule
la différence sera utilisée pour mettre à jour le registre desflags. Voici quelques
utilisations de cette instruction :
•cmp ,10: compareeaxà la constante 10
•cmp ,edx: compareeaxàedx
•cmp ,ebp-12]
: compareecxà l’entier 32 bits situé en mémoire à
l’adresse[ss:ebp-12]
La Table flags
lors de la comparaison en fonction des opérandes de la commandecmp.
cmp eax, ebxCFSFZF
eax==ebx 0 0 1
eax<ebx 1 1 0
eax>ebx 0 0 0
TABLE5.7 – Influence sur les bits du registre flags de la comparaison de valeurs
5.3. INSTRUCTIONS ÉLÉMENTAIRES 163
#### 5.3.5.2 test

L’instructiontestpermet également de comparer deux valeurs mais en réalisant
unandentre les deux opérandes qui ne seront pas modifiées et dont le résultat
sera propagé au niveau du registreflags. En général cette instruction est utilisée
pour vérifier qu’une valeur est nulle ou non ou qu’un bit est positionné à 1. En
réalisant par exemple untest ,eax , on vérifie sieaxest nul plutôt que d’écrire
cmp ,0qui prend plus de place en mémoire puisqu’on code l’opérande 0.
1 test ,eax ; si eax == 0 alors aller en .end
2 jz ;
4 test ,1 ; si le bit de poids faible n'est pas
5 jz ; à 1, alors il s'agit d'un nombre pair
### 5.3.6 Ce que nous appelons instructions de branchement correspond aux instructions

qui modifient le pointeur d’instructions. On distingue les instructions de branche-
ment conditionnel (qui sont liées à une comparaison préalable) des instructions
non conditionnelles.
#### 5.3.6.1 Ces instructions sont utilisées après une comparaison (cmp,test) ou un calcul

(add,sub,mul, etc) afin de pouvoir modifier le pointeur d’instruction et exécuter
une instruction qui n’est pas directement la suivante. Elles sont de la formejCC
adresseoùCCest remplacé par la condition de branchement (cf. Table).
La documentation Intel indique que les termeslessetgreatersont utilisés pour
des comparaisons entre des entiers signés alors que les termesbelowetabovesont
utilisés pour des entiers non signés.

> **Note** : il existe également des équivalents à certains instructions commejnae
>
(Jump on Not Above or Equal) qui est équivalent àjb.
En prévision de ce que nous verrons plus tard au sujet du coprocesseur, nous
indiquons que les instructions de saut de typebelowetabovesont utilisées lors de
la comparaison de valeurs flottantes.
#### 5.3.6.2 Il existe également une instruction spécifiqueloop qui décrémente le

registreecxet, si celui-ci n’est pas égal à0, se branche à l’adresse indiquée. Elle est
donc équivalente aux deux instructions suivantes :
InstructionSignification Condition
jl jump on less SF ̸=OF
jle jump on less or equal ZF = 1 ou SF̸=OF
jg jump on greater ZF = 0 et SF = OF
jge jump on greater or equal SF = OF
je jump on equal ZF = 1
jne jump on not equal ZF = 0
jz jump on zero ZF = 1
jnz jump on not zero ZF = 0
jb jump on below CF = 1
jbe jump on below or equal CF = 1 ou ZF = 1
ja jump on above CF = 0 et ZF = 0
jae jump on above or equal CF = 0
jcxz jump oncxequals zeroCX= 0
jecxz jump onecxequals 0 ECX= 0
jrcxz jump onrcxequals 0 RCX= 0
jo jump on overflow OF = 1
jno jump on notoverflow OF = 0
jp jump on parity PF = 1
jnp jump on not parity PF = 0
js jump on sign SF = 1
jns jump on not sign SF = 0
TABLE5.8 – Instructions de branchement conditionnel et FLAGS affectés
1.begin:
2 ...
3 dec ; à remplacer par
4 jnz ; loop .begin
#### 5.3.6.3 Il s’agit des instructions de branchement comme :

•jmp
: modifie (JuMP) le pointer d’instruction pour qu’il soit égal à
l’opérandeaddress
•call : réalise un appel de sous-programme (cf. Chapitre)
•ret: réalise le retour de sous-programme
L’instructioncallempile l’adresse de l’instruction qui lui succède puis modifie
5.3. INSTRUCTIONS ÉLÉMENTAIRES 165
le registreeippour qu’il soit égal àaddress. L’instructionret, utilisée lors du
retour de sous-programme, dépile l’adresse en sommet de pile (placée parcall) et
l’affecte àeip.
### 5.3.7 Ces instructions permettent de réaliser des traitements complexes et remplacent

la combinaison de plusieurs instructions que nous venons d’évoquer. Elles sont
généralement combinées à unpréfixecommereppourREPeatqui utilise le registre
ecxpourindiquer le nombre de répétitions à exécuter. Il existe également les
préfixesrepe(REpeat while Equal)repne(REpeat while Not Equal),repz(REpeat
while Zero),repnz(REpeat while Not Zero) qui peuvent être utilisés avec les instruc-
tionscmpsqui permet de comparer deux tableaux etscasqui permet de rechercher
une valeur dans un tableau.
#### 5.3.7.1 lods(b/w/d)

(LOaD String of Byte/Word/Double word) permet de parcourir un
tableau en le lisant sous forme d’octets, de mots ou de double mots, les valeurs
étant lues depuisds:esiet stockées respectivement dansal,ax,eax.
#### 5.3.7.2 stos(b/w/d)

(STOre String of Byte/Word/Double word) permet d’écrire la même
valeur dans un tableau en écrivant sous forme d’octets, de mots ou de double mots,
les valeurs étant écrites versds:ediet lues depuis respectivemental,ax,eax.
#### 5.3.7.3 movs(b/w/d)

(MOV String of Byte/Word/Double word) permet de déplacer un
tableau dont l’adresse est stockée dansds:esivers un tableau dont l’adresse est
stockée danses:edi. Il ne faut pas que les tableaux se chevauchent.
Ainsirep correspond à la série d’instructions suivantes :
1.label:
2 mov ,esi]
3 mov [edi],eax
4 add ,4
5 add ,4
6 dec
7 jnz
Les deux dernières instructions (lignes 6 et 7) peuvent être remplacées par l’ins-
tructionsloop .labelcomme indiqué précédemment. Attention, après exécution
derep ,ecxest à0etedietesisont également modifiés.
#### 5.3.7.4 scas(b/w/d)

(Scan String of Byte/Word/Double word) permet de comparer le
registreAL(pourscasb) avec l’octet à l’adressees:edi.
Ainsi pour trouver la longueur d’une chaîne de caractères en langage C, on peut
écrire :
1 mov ,msg ; adresse de la chaine
2 mov ,edi ; sauvegarde de l'adresse de la chaine
3 mov ,10000; longueur maximale
4 mov ,0 ; fin de chaine
5 repnz ; tant que ...
6 sub ,esi ; longueur dans edi
L’instructionrepnz peut être interprétée comme : tant qu’on a pas par-
couru10000caractères et qu’on a pas trouvé le caractère de valeur0, incrémenter
edi.
#### 5.3.7.5 L’utilisation du préfixerepdevant une autre instruction n’est pas défini. Cepen-

dant, on trouve parfois dans la génération du code assembleur pour les processeurs
AMD, la série d’instructionsrep ret. Il s’agit d’un stratégème qui a été trouvé afin
de remédier à un problème de prédiction de branchement lorsque l’instruction
retse trouve juste après une instruction de branchement conditionnel. On pourra
consulter le sitehttp://repzret.org/p/repzret/pour de plus amples informa-
tions.
5.4
### 5.4.1 Nous avons déjà évoqué le fait que l’assembleur est un langage sans structures de

contrôle que sont leif, lewhile. Le langage assembleur est rudimentaire et se fonde
sur le déplacement du pointeur d’instruction en mémoire pour éviter d’exécuter le
code d’unifou revenir au début d’unwhile. Il s’agit d’un fonctionnement basé sur
l’instructiongotoque l’on trouve par exemple en langage BASIC.
En BASIC, chaque ligne d’un programme commence par un numéro qui permet
de l’identifier. On commence généralement par10, puis on incrémente de10à
chaque nouvelle ligne, cela permet, au cas où on aurait oublié certaines instructions,
d’en ajouter de nouvelles entre les lignes11à19,21à29, etc. L’instructiongoto
suivie d’un numéro de ligne permet de revenir à la ligne voulue.
On recommande fortement aux programmeurs de ne pas utiliser cette fameuse
instructiongotodans des langages plus évolués comme le langage C (même si
cette instruction est présente) car elle va à l’encontre d’un mode de programmation
structuré. Néanmoins, cette instruction est implicitement utilisée, bien que cachée,
par les mécanismes d’exception comme enC
++, pour lesquels on appelle une
fonction nomméelongjmp.
L’exemple qui suit est un programme BASIC qui calcule la somme des entiers
de1à10puis affiche le résultat.
110:
660,
Les programmes en assembleur vont donc suivre ce modèle de programmation.
On peut d’ailleurs voir le langage BASIC comme une version plus évoluée de
l’assembleur pour laquelle les variables et les entrées / sorties sont gérées de
manière à simplifier la tâche du programmeur.
### 5.4.2 Dans la suite de ce chapitre et de l’ouvrage, nous allons traduire du code écrit

en C vers l’assembleur. Pour optimiser le code il est nécessaire d’utiliser le plus
souvent possible des registrescar ils sont les plus rapides pour le traitement des
données. La première étape préalable à la traduction est donc la réalisation de
cette association. On pourra procéder en créant une table de correspondance (voir
Table). Ainsi, pour le code suivant :
1void (int*tab,int )
2 for(int =0;i<N; i)
3 tab[i] 1;
4 }
5}
On peut par exemple décider d’utiliserebxpour stocker l’adresse du tableau
tabetecxpour réprésenter la variable de bouclei. La taille du tableauNpourra
également être stockée dans un registre commeedxainsi que la valeur1qui sera
affectée àtab[i]et qui sera placée danseax.
Si on est en architecture 32 bits, les paramètres du sous-programme sont dans
la pile (cf. Chapitre). Il faudra donc les placer dans des registres. C’est le cas pour
les adresses de tableau, mais la longueurNpeut être référencée depuis la pile.
Variable/CsteTypeParamètreRegistreDescription
tab int [] ebx tableau de valeurs entières
N int edx taille du tableau
i int ecx variable de boucle
1 int eax constante 1
TABLE5.9– Association entre variables C et registres du microprocesseur en architecture
32 bits
### 5.4.3 Un label, également appelé étiquette, permet dans le code assembleur de

définir l’adresse d’une instruction ou d’une donnée en utilisant un identifiant
alphanumérique. On distingue :
•
un labelglobalqui commence par une lettre et suivi par des lettres, chiffres
et le symbole souligné et permet de définir le nom d’un sous-programme ou
le nom d’une variable
•
un labellocalqui commence par un point (.) et qui indique une adresse de
branchement à l’intérieur d’un sous-programme
L’intérêt des labels locaux est que leurs identifiants peuvent être réutilisés alors
que les labels globaux sont uniques. Pour pouvoir réutiliser un label local il faut
le faire précéder d’un label global. Nous verrons également plus avant dans ce
chapitre un autre type de label utilisé parnasm.
La définition d’un label, qu’il soit local ou global, est réalisée en le suffixant par
un caractère deux points (:) alors que lorsqu’on y fait référence ce symbole n’est
pas utilisé :
1fonction_1: ; définition de fonction_1
2 push
3 mov ,esp
4.if: ; utilisation du label local if
5 mov ,ebp
6 pop
7 ret
9fonction_2: ; définition d'une autre fonction
10 push
11 mov ,ebp
12 call
13.if: ; réutilisation du label local if
14 ret
Dans l’exemple précédent le label local.if(défini en ligne 4) peut être réutilisé
en ligne 13 car il est précédé en ligne 9 d’un label global (fonction_2).
### 5.4.4 La conditionnellesi alorsest réalisée en utilisant une comparaisoncmpsuivie

d’une instruction de branchement conditionnel que nous notonsjCC
2, comme
présenté sur la Figure, où nous pouvons voir trois représentations du if:
FIGURE5.1 – si alors
•
la première (en haut à droite) est la version en langage C que nous voulons
traduire
•
la seconde (en haut à gauche) est une vision graphique sous forme d’organigramme
•la troisième (en bas à gauche) est un code en BASIC
L’organigramme montre deux chemins d’exécution, celui de droite qui est
emprunté lorsque la condition duifestvraieet qui consiste à exécuter le code
du blocalors. Le chemin de gauche est emprunté quand la condition estfausseet
consiste à se placer après le code dualorsenfin_si.
Pour la partie en langage C on considère la conditionx < y, oùxetysont deux
variables entières que l’on a choisi de modéliser par les registreseaxetebx. On
débute donc la traduction en chargeant la variablexdanseaxet la variableydans
ebx.
La traduction duifest obtenue en réalisant la comparaison entrexetyau
moyen de l’instructioncmpqui prend comme opérandeseaxetebx, suivie par un
. Comme nous ne connaissons pas la condition celle-ci est représentée de manière générique
par un double C.
branchement en fin de conditionnelle si la condition estfausse. On prend donc,
dans ce cas, la négation de l’expressionx < y, soitx >= y. Ce qui se traduit par
l’instruction de branchement conditionneljge(Jump on Greater or Equal) :
1.if:
2 mov ,x]
3 mov ,y]
4 cmp ,ebx ; si non(x < y) équivalent à x >= y
5 jge ; aller en .endif
6.then:
7 mov [x],ebx ; bloc alors
8.endif:
On remarquera que pour clarifier le code on a défini trois labels qui corres-
pondent ausi(.if),alors(.then) etfin_si(.endif) mais seul le label.endifest
utile ici.
### 5.4.5 Dans le cas d’une condition complexe qui peut se résumer à des conjonctions

(et), il faut que toutes les conditions soient vraies pour exécuter le code du bloc
alors. On doit donc produire le pseudo code suivant :
•siC1estfaussealors aller en.endif
•siC2estfaussealors aller en.endif
•siCnestfaussealors aller en.endif
On pourra représenter ce code sous forme d’organigramme pour s’en convaincre.
1if((x<3) y>=6) x==z))
2 x=y;
3}
Listing 5.4.1 – Si Alors avec conjonction de conditions
Afin de gagner en efficacité lorsque l’on rencontre ce genre de condition com-
plexe il fautplacer la condition qui a le plus de chance d’être
car elle échouera en premier et on n’aura pas à évaluerC2àCn.
Prenons l’exemple du Listing
par le Listing. On considère que xest représentée pareax,yparebxetzpar
ecx. Il serait alors probablement préférable de placer la conditionC3en premier si
elle a le plus de chance d’échouer, tout dépend bien évidemment des données que
l’on traite.
1; eax = x, ebx = y, ecx = z
2.if:
3 cmp ,3 ; C1
4 jge ; si non(x < 3) alors aller en finsi
5 cmp ,6 ; C2
6 jl ; si non(y >= 6) alors aller en finsi
7 cmp ,ecx; C3
8 jne ; si non (x == z) alors aller en finsi
9.then:
10 mov ,ebx
11.endif:
Listing 5.4.2 – Si Alors avec conjonction de conditions
### 5.4.6 Dans le cas d’une condition composée de disjonctions (ou), il suffit qu’une seule

condition soit vraie pour exécuter le code du blocalors. On doit donc produire le
pseudo code suivant :
•siC1estvraiealors aller en.then
•siC2estvraiealors aller en.then
•siCnestfaussealors aller en.endif
Afin d’être efficace lorsque l’on rencontre ce genre de condition complexe il faut
placer la condition qui a le plus de chance d’être .
### 5.4.7 Dans le cas de la conditionnellesi alors sinonde la Figure, il y a égale-

ment, comme dans le cadre dusi alors, deux chemins à emprunter en fonction de
l’évaluation de la condition dusi.
On procède comme avec lesi alorsen comparant les valeurs puis en prenant
la négation de la condition pour effectuer un branchement conditionnel en.else.
Après l’exécution des instructions du.thenil ne faut pas oublier de se brancher en
.endifsinon on exécuterait également le code dusinon.
Notons quexetysont deux variables entières et que l’on pourrait n’utiliser
qu’un seul registre afin de comparer ces valeurs en chargeant par exemplexdans
eaxpuis en le comparant àygrâce à l’instructioncmp ,y] . Il n’est pas toujours
nécessaire de charger toutes les variables dans les registres.
Le code correspondant est le suivant :
1.if:
2 mov ,x]
3 mov ,y]
FIGURE5.2 – si alors sinon
4 cmp ,ebx
5 jge
6.then:
7 mov [x],1 ; bloc alors
8 jmp ; pour ne pas exécuter le code du .else
9.else:
10 mov [x],2 ; bloc sinon
11.endif:
### 5.4.8 La structure de contrôletant queest modélisée sur la Figure. Elle est

organisée de la manière suivante et comprend :
•une initialisationi=1
•
une condition de poursuite de la bouclei<=10 , souvent appelée condition
d’arrêt
•
le corps de la boucle, c’est à dire les instructions à exécuter à chaque itération
de la boucle, soit icisum+=i;, suivi de l’incrémentation dei
Letant queest traité comme unsi alorssuivi du code du corps de la boucle.body,
puis le code de l’incrémentation et enfin par une instruction de sautjmp(JuMP)
qui ramène au début de la condition de poursuite (.while). Si cette condition est
fausseon se branchera en.endwhile.
FIGURE5.3 – Tant que
Pour traduire la somme des entiers entre 1 et 10 (cf. Listing), on choisit
de remplacer la variablesumpar le registreeaxet la variableiparecx:
1 xor ,eax ; sum = 0
2 mov ,1 ; i = 1
3.while:
4 cmp ,10 ; si i > 10 alors sortir du while
5 jg
6 add ,ecx ; sum += i
7 inc ; ++i
8 jmp
9.endwhile:
10 mov [sum],eax
Listing 5.4.3 – Tant que
On remarquera que pour passer à l’itération suivante on a utilisé, ligne 7,
l’instructioninc et, que sous certaines architectures, unadd ,1 qui prend
plus de place puisqu’il faut coder la valeur1au niveau de l’instruction est plus
efficace.
### 5.4.9 L’instructionpour, soitforen langage C, est en fait unwhiledéguisé, il s’agit

d’unsucre syntaxique
.
1for(initialisation;condition;incrementation)
2 corps;
3}
5initialisation;
6while(condition)
7 corps;
8 incrementation;
9}
Listing 5.4.4 – Equivalence des bouclespourettant que
Comme pour la boucletant queon retrouve l’initialisation, la condition de
poursuite ainsi que l’incrémentation. Nous avons fait figurer sur le Listing
correspondance entre la syntaxe duforen C et lewhile.
Il est possible de traduire une boucleforde deux manières différentes. Consi-
dérons le code suivant qui est équivalent auwhileque nous venons de traduire :
1const =10;
2int =0;
3for(int =1;i<=N; i)
4 sum+=i;
5}
On peut traduire cette boucle comme on l’a fait précédemment pour lewhile,
le code est donc identique.
L’autre manière de traduire leforconsiste au préalable à vérifier la condition
de poursuite et à ne pas exécuter le corps de la boucle si la condition estfausse. Si la
condition estvraiepar contre, la boucle s’exécutera au moins une fois. On traduira
donc par le corps de la boucle, l’incrémentation puis la condition de poursuite, qui,
si elle estvraie, forcera à retourner grâce à un branchement conditionnel au début
de la boucle comme présenté Listing.
Dans le premier cas (Listing) on aura à chaque itération de la boucle à
exécuter quatre instructions (lignes 4, 5, 7, 8) pour traiter la boucle (sans son
corps).
Dans le second cas (Listing), on n’exécutera que trois instructions (lignes
8 à 10) à chaque itération pour traiter la boucle (sans son corps). On peut donc
. Expression inventée par Peter J. Landin pour exprimer le fait de donner au programmeur des
possibilités d’écriture plus succinctes ou plus proches d’une notation usuelle.
1 xor ,eax ; sum = 0
2 mov ,1 ; initialisation : i = 1
3 mov ,N
4.pre_for:
5 cmp ,edx ; test condition
6 jg ; ne pas executer la boucle si i >= n
8.for:
9 add ,ecx ; corps : sum += i
10 inc ; incrémentation : ++i
12 cmp ,edx ; test de la condition
13 jle ; retour au début de la boucle si vraie
14.endfor:
Listing 5.4.5 – Traduction améliorée du for
parfois gagner en efficacité en ayant une instruction en moins à exécuter, mais le
gain est généralement très faible.
### 5.4.10 La structureselon cas, c’est à dire leswitchen langage C, est dans le cas général

difficile à traduire et dépend des données. Dans certains cas les données sont
consécutives et il est facile de remplacer leswitchpar une expression comme c’est
le cas du Listing.
1int (char )
2 int =0;
3 switch(c)
4 case'a':case'A':code=1;break;
5 case'b':case'B':code=2;break;
6 ...
7 case'z':case'Z':code=26;break;
8 }
9 return ;
10}
12int (char )
13 if(isalpha(c))return (c)64;
14 return ;
15}
Listing 5.4.6 – Exemple de switch simplifiable par une expression
En effet la première fonctionconvert1ne fait que remplacer chaque lettre par
un identifiant entier en suivant l’ordre alphabétique. Elle contraint à écrire 26 lignes
1switch(c)
2 case :liste_instructions_cas_1;break;
3 case :liste_instructions_cas_3;break;
4 case :liste_instructions_cas_22;break;
5 default:liste_instructions_defaut;
6}
Listing 5.4.7 – Exemple de switch avec table de conversion
qui peuvent être remplacées par une seule (ligne 13) de la fonctionconvert2.
Le cas le plus problématique correspond à des valeurs ducasequi ne suivent
pas une suite logique ou calculable. Dans ce cas on passe généralement par un
tableau de valeurs (cf. Listings).
On crée ainsi deux tables, l’une pour les valeurs ducase, l’autre qui contient
les adresses des labels qui correspondent au code à exécuter pour chaquecase.
On remarquera que l’on utilise des labels spéciaux dotés d’un préfixe..@qui sont
définis pour ce genre de situation. Les labels qui débutent par ce préfixe n’obéissent
pas aux règles des labels locaux et peuvent être référencés à tout moment dans le
code.
On doit donc parcourir la table des valeurs jusqu’à trouver un valeur de cette
table, ou alors, si on ne la trouve pas, on éxécutera ledefault.
### 5.4.11 Nous allons présenter deux techniques d’amélioration liées aux boucles de type

foret par extension aux boucleswhile. La première qualifiée dedépliagepermet
de diminuer le nombre d’itérations de la boucle en dupliquant les instructions du
corps de la boucle. La seconde appeléetuilageaugmente l’efficacité des traitements
en réduisant les données placées en mémoire cache lors de l’utilisation de grands
tableaux.
#### 5.4.11.1 Le dépliage de boucle ouloop unrolling(voir Figure) en anglais consiste

à augmenter le corps de la boucle en le répétant plusieurs fois. On dépliera une
boucle par une puissance de 2 : soit 2, 4, 8 voire 16. Le but de cette technique est
double, elle permet :
•de diminuer le nombre de branchements
•
d’augmenter l’efficacité en exécutant un plus grand nombre d’instructions
avant de passer à la prochaine itération
1section
2 switch_values_table: ,3,22
3 switch_jumps_table: ,..@case_3,..@case_22
5section
6main:
7 ...
8 xor ,ecx
9 mov ,3
10.for:
11 cmp ,edx
12 jge
13 cmp [switch_values_table+ecx*4],eax
14 jne
15 jmp [switch_jumps_table+ecx*4]
16.endif:
17 inc
18 jmp
20..@case_1:
21 ...
22 jmp
23..@case_3:
24 ...
25 jmp
26..@case_22:
27 ...
28 jmp
29.default:
30 ...
31.endswitch:
Listing 5.4.8 – Exemple de switch avec table de conversion en assembleur 32 bits
En effet, comme on l’a vu précédemment, le traitement d’une boucleforclas-
sique demande d’exécuter au moins4instructions : une comparaison et une ins-
truction de branchement conditionnel en début de boucle, puis une incrémentation
et un branchement pour revenir au début de la boucle.
SiN=1003, comme sur l’exemple de la Figure, cela fait 1003×4 = 4012
instructions à exécuter rien que pour traiter la boucle sans son corps.
Par contre si la boucleforest dépliée par 8, on traitera dans un premier temps
125itérations (1003/8 = 125 ) et donc seulement125×4 = 500 instructions liées à
la boucle.
Reste à traiter les trois dernières itérations potentielles de la boucle, ce qui peut
être fait de deux manières différentes :
FIGURE5.4 – Dépliage de boucle
•
soit par une bouclewhilemais on risque de perdre quelque peu en efficacité
si le corps de la boucle se traduit par quelques instructions,
•
soit par unswitchdont l’intérêt est d’éviter les branchements répétifs comme
on le ferait pour lewhile
On obtient avec leswitchun code séquentiel puisqu’on ne trouvera pas de
break. L’utilisation d’unswitchse révèle donc en général intéressante lorsque la
boucle est dépliée par 8 ou 16.
La traduction assembleur du code de la Figure. On
commence par définir la constanteNgrâce à l’instructionEQUqui signifieEQUal,
puis le tableautabgrâce à l’instructionstimes Nqui signifie répéterNfois ce qui
suit, c’est à diredd 0qui définit un entier sur 32 bits initialisé à 0. On crée donc
1003 entiers initialisés à 0.
On traduit ensuite le code en utilisant les associations suivantes :
•le tableautabest placé dansebx
•la variable de boucleiest remplacée parecx
•
le registreeaxcontient la valeur à affecter à chaque élément du tableau soit1
•
le registreedxcontient le plus proche multiple de 8 de la constanteNqui
représente la taille du tableau
Afin de stocker dansedxle multiple de8le plus proche deN, il existe deux
possibilités :
1section
2 N ; constante
3 tab: ; tableau de N entiers dont chaque
4 ; élément est initialisé à 0
6section
7 mov ,tab ; ebx = tab
8 mov ,1 ; eax = 1 (constante)
9 xor ,ecx ; i = 0
10 mov ,N ; edx = N
11 and ,(8-1)
12.for_ur8:
13 cmp ,edx ; fin de boucle si i >= N
14 jge
15 mov [ebx+ecx*4+0],eax
16 mov [ebx+ecx*4+4],eax
17 mov [ebx+ecx*4+8],eax
18 mov [ebx+ecx*4+12],eax
19 mov [ebx+ecx*4+16],eax
20 mov [ebx+ecx*4+20],eax
21 mov [ebx+ecx*4+24],eax
22 mov [ebx+ecx*4+28],eax
23 add ,8 ; i += 8
24 jmp
25.endfor_ur8:
26.while:
27 cmp ,N; dernieres iterations
28 ...
Listing 5.4.9 – Dépliage de boucle
•
la plus naturelle consiste à rendreNmultiple de8en le divisant par8puis en le
multipliant par8, ce qui peut être fait rapidement en utilisant les instructions
de décalage puisque8est une puissance de 2. On peut donc traduire par :
1 mov ,N ; edx = 1003
2 shr ,3 ; /8=2^3 edx = 125
3 shl ,3 ;*8 edx = 1000
•
l’autre solution consiste à utiliser un masque afin d’éliminer les trois premiers
bits deedxqui permettent de coder des valeurs entre 0 et 7 :
1 mov ,N ; edx = 1003 = 000..0011_1110_1011_b
2 and ,7 ; ~7 & 111..1111_1111_1000_b
3 ; edx = 1000 = 11_1110_1000_b
ici le symbole~(tilde) correspond à la complémentation.
On peut en outre utiliser une macro instruction afin de remplacer le corps de
la boucle de manière à obtenir un code plus lisible cela est particulièrement vrai
si le corps de la boucle contient plusieurs instructions. On définit donc la macro
instructionBODYqui prend un paramètre représentant le décalage de l’adresse
observé listing.
1%macro BODY 1
2 mov [ebx+ecx*4+1],eax
3%endmacro
5section
6 mov ,tab
7 mov ,1
8 xor ,ecx
9 mov ,N
10 and ,(8-1)
11.for_ur8:
12 cmp ,edx
13 jge
14 BODY
15 BODY
16 BODY
17 BODY
18 BODY
19 BODY
20 BODY
21 BODY
22 add ,8
23 jmp
24.endfor_ur8:
26; dernières itérations de la boucle
27.while:
28 cmp ,N
29 ...
Listing 5.4.10 – Dépliage de boucle avec macro instruction
Enfin, on pourra utiliser des macro instructions denasmafin de remplacer les
huit macro instructionsBODY(lignes 14 à 21) par une boucle :
1 %assign i 0
2 %rep 8
3 BODY ; appel de la macro BODY avec la valeur de i
4 %assign i i +4
5 %endrep
Attention
Attention cependant, en C l’utilisation des parenthèses est primordial car si on
ne les utilise pas, l’expression sera interprétée de manière à ce que la boucle
forne soit pas exécutée et c’est lewhilequi traitera toutes les itérations de
la boucle.
En effet, si on écrit :
1for(i=0;i<N&3; i)
L’expression de continuité de la boucle sera interprétée commei < N, c’est à
dire vrai, ce qui correspond à la valeur 1. On réalise ensuite unet binaireentre la
valeur 1 et~3, c’est à dire une valeur dont les deux premiers bits sont à 0. Au final
on obtient la valeur 0, la boucleforn’est donc pas exécutée.
Il faut donc bien écrire :
1for(i=0;i<N&3); i)
#### 5.4.11.2 La technique du tuilage (tilingen anglais) aussi appelée blocage de boucle

(loop blocking) est associée au traitement des tableaux notamment ceux à deux
dimensions. Elle permet de décomposer un traitement défini pour un grand tableau
en plusieurs traitements plus simples qui interagissent sur des sous parties du
tableau que l’on gardera en mémoire cache afin de les réutiliser. Cette technique
est particulièrement efficace dans le cas du produit de matrices car elle permet de
ne pas saturer la mémoire cache et a pour objectif de cantonner les données aux
registres et aux caches L1 et L2.
1const =1027;
2int [N];
4for(int =0;i<N; i)
5 A[i] 0;
6}
1const =32;
3for(int =0;i<N;i+=BLOCK_SIZE)
4 for(int =0;ii<std::min(i+BLOCK_SIZE,N); ii)
5 A[ii] 0;
6 }
7}
Cette technique n’a d’intérêt que si on lit et/ou écrit les données plusieurs fois.
#### 5.4.11.3 Le cas d’unifà l’intérieur d’une bouclefor(ou d’unwhile) est problématique

car c’est le genre de traitement qui peut ralentir l’exécution de la boucle. En
effet, si la condition duifn’est pas prédictible, la prédiction de branchement (cf.
Section) ne sera pas capable de choisir avec certitude la branche de code à
exécuter.
Il faut faire en sorte, quand cela est possible, de remplacer leifpar un calcul
plutôt que par un branchement pour gagner en efficacité. La vectorisation du code
permet également d’éviter les ralentissements dûs à l’impossibilité de prédire quel
chemin emprunter (cf. Chapitre).
### 5.4.12 On dispose de deux instructions qui permettent de supprimer les branchements :

•setCC(Set Byte on Condition) introduite à partir de l’Intel 80386 qui met à 0
ou 1 un registre 8 bits ou un emplacement mémoire 8 bits en fonction des
valeurs des bits CF, SF, OF, ZF et PF du registreeflags: on remplacera CC
par les lettres qui correcpondent aux sauts conditionnels, par exemplenz
pourNot Zero
•cmovCC
(Conditional MOVe) qui déplacera entre registres ou entre un registre
et une adresse mémoire les données de la source vers la destination en
fonction des valeurs des bits du registreeflags
Par exemple, le code suivant :
1 if(x%3==0)
2 return ;
3 }else{
4 return ;
5 }
peut être traduit de manière classique par :
1 mov ,x]
2 movs ,3
3 cdq ; convertir dans edx:eax
4 div ; division par 3
5if:
6 cmp ,0 ; quotient == 0 ?
7 jnz
8.then:
9 mov ,101
10 jmp
11.else:
12 mov ,7001
13.endif:
14 ; sortie de la fonction
Cette traduction utilise deux sauts : un saut conditionneljnzpour ne pas
exécuter le.thenet un sautjmppour ne pas exécuter la partie.else. On peut
réécrire le code en utilisantcmovafin d’éviter ces sauts qui viennent perturber
l’exécution du code :
1 mov ,x]
2 mov ,3
3 cdq
4 div
5 cmp ,0
6 mov ,7001
7 mov ,101
8 cmovnz ,ecx
Dans le même esprit, lorsqu’on doit par exemple travailler avec des booléens, le
code suivant :
1 if(expression==0)
2 return ;
3 }else{
4 return ;
5 }
peut être réécrit en :
1 ; évaluation de l'expression résultat dans edx
2 xor ,eax ; valeur de sortie à 0
3 cmp ,0 ; ou test edx, edx
4 setnz
5 ; sortie de la fonction
Ici, le comportement de l’instructionsetnzest :
1 if(NZ)
2 al=1;
3 }else{
4 al=0;
5 }
Il est nécessaire de mettre la valeur 0 danseaxde manière à ce que le résultat
soit0ou1. Ou alors, il faut utiliser l’instructionmovzx eax,alaprèssetnz.
### 5.4.13 On distingue deux grandeurs lorsqu’on évoque le temps de traitement des

instructions : la latence (latency) et le débit (throughput). Malheureusement il
est très difficile de distinguer et comprendre la différence entre ces deux valeurs.
D’après la documentation Intel :
•
Latency is the number of processor clocks it takes for an instruction to have its
data available for use by another instruction
•
Throughput is the number of processor clocks it takes for an instruction to
execute or perform its calculations
Débit et latence
En fait, lorsque l’on parle de latence on fait référence à lachaîne de dé-
pendance des latences(dependency chain latency). Quand une instruction a
besoin du résultat d’une instruction qui la précède on parle de dépendance et
dans ce cas on mesure son coût de traitement par sa latence.
Ledébit(throughput) est le nombre maximum d’instructions de même type
qui peuvent être exécutées par cycle d’horloge quand il n’y a pas de dépen-
dances.Par exemple, imaginons que nous ayons à traduire le code suivant où les
variables sont des entiers :
1a=a+b+c+d;
Convenons queaest danseax,bdansebx, etc. Une première traduction en
assembleur est :
1 add ,ebx;
2 add ,ecx; dépendance avec la ligne 1
3 add ,edx; dépendance avec la ligne 2
Ce code introduit deux dépendances : de la ligne2vers la ligne1et de la ligne
3vers la ligne2. Etant donné qu’on utilise le même registre (eax) pour stocker le
résultat du calcul, l’instruction de la ligne2doit attendre que l’instruction de la
ligne1soit terminée pour pouvoir ajouter le résultat deecxàeax.
On peut réécrire ce code de manière à pouvoir effectuer deux sommes en
parallèle :
1 add ,ebx; indépendant de la ligne 2: a += b
2 add ,edx; indépendant de la ligne 1 c += d
3 add ,edx; dépendance avec les lignes 1 et 2: a += c
Le second code peut éventuellement être réalisé de manière plus rapide puisque
l’on pourra effectuer les deux premières sommes en parallèle nonobstant le fait que
l’on perde la valeur deecx.
Imaginons à présent un exemple plus conséquent qui concerne un tableau de
flottants dont on doit faire la somme. On écrit une boucle que l’on déplie par 8 :
1// ici N, la taille du tableau, est multiple de 8
2const =320000;
3float [N];
5float =0.0f;
6for(int =0;i<N;i+=8)
7 sum+=array[i+0];
8 sum+=array[i+1];
9 sum+=array[i+2];
10 sum+=array[i+3];
11 sum+=array[i+4];
12 sum+=array[i+5];
13 sum+=array[i+6];
14 sum+=array[i+7];
15}
Si on traduit ce code en utilisant les registres SSE mais sans vectorisation en ne
prenant en compte que la partie basse du registre (cf. Chapitre), on obtient :
1 mov ,array
2 xorps ,xmm0 ; xmm0 = sum = 0.0
3 xor ,ecx ; i = 0
4for_i:
5 cmp ,320000 ; fin, si i >= 320000
6 jge
7 addss ,ebx+ecx*4+0]
8 addss ,ebx+ecx*4+4]
9 addss ,ebx+ecx*4+8]
10 addss ,ebx+ecx*4+12]
11 addss ,ebx+ecx*4+16]
12 addss ,ebx+ecx*4+20]
13 addss ,ebx+ecx*4+24]
14 addss ,ebx+ecx*4+28]
15 add ,8 ; i += 8
16 jmp
17endfor_i:
La partie basse du registrexmm0est utilisée pour contenir la somme mais chaque
instruction (de la ligne 7 à la ligne 13) dépend de l’instruction précédente. Il existe
une chaîne de dépendance de 7 instructions. Si l’instructionaddss, addsdpossède
un débit d’une instruction par cycle et une latence de 4 cycles alors le coût du
traitement de la ligne 6 à la ligne 13 est d’au moins7×4 = 28cycles. Cependant
comme l’exécution se fait dans le désordre, il est possible que le microprocesseur
puisse briser en partie ces dépendances.
Maintenant, si on organise le traitement autrement en créant des sommes
partielles, on peut briser la chaîne des dépendances :
1 mov ,array
2 xorps ,xmm0 ; xmm0 = sum1 = 0.0
3 xorps ,xmm1 ; xmm1 = sum2 = 0.0
4 xorps ,xmm2 ; xmm2 = sum3 = 0.0
5 xorps ,xmm3 ; xmm3 = sum4 = 0.0
6 xor ,ecx ; i = 0
7for_i:
8 cmp ,320000 ; fin de boucle si i >= 320000
9 jge
10 addss ,ebx+ecx*4+0]
11 addss ,ebx+ecx*4+4]
12 addss ,ebx+ecx*4+8]
13 addss ,ebx+ecx*4+12]
14 addss ,ebx+ecx*4+16]
15 addss ,ebx+ecx*4+20]
16 addss ,ebx+ecx*4+24]
17 addss ,ebx+ecx*4+28]
18 add ,8 ; i += 8
19 jmp
20endfor_i:
21 addss ,xmm1 ; sum1 += sum2
22 addss ,xmm3 ; sum3 += sum4
23 addss ,xmm2 ; sum1 += sum3
La ligne 13 dépend de la ligne 9, la ligne 14 dépend de la ligne 10, etc. Au final
nous avons 4 dépendances, donc trois de moins que dans la première version de la
somme. Le code assembleur précédent correspond en fait au code C suivant :
1float ,sum1,sum2,sum3,sum4;
2sum1=sum2=sum3=sum4=0.0f;
3for(int =0;i<N;i+=8)
4 sum1+=array[i+0];
5 sum2+=array[i+1];
6 sum3+=array[i+2];
7 sum4+=array[i+3];
8 sum1+=array[i+4];
9 sum2+=array[i+5];
10 sum3+=array[i+6];
11 sum4+=array[i+7];
12}
13sum=sum1+sum2) sum3+sum4);
Nous avons reporté, Tables, certains résultats de l’implantation
des solutions précédentes suivant le nombre de cycles nécessaires au traitement
de la boucle. Nous avons exécuté100fois la somme des éléments d’un tableau de
320_000flottants :
•la version v1 correspond au code avec 7 dépendances
•
la version v2 est un code avec4dépendances dues à l’utilisation de4registres
SSE (xmm0àxmm3)
•
la version v3 ne possède pas de dépendances car on utilise 8 registres SSE
(xmm0àxmm7).
La ligne intitulée gain est le rapport entre la version 1 et la version 3.
Dépendances IntelIntelIntelIntel IntelIntel
Core i7Core i5Core i7Xeon S.Core i7Core i5
3667U 7400 8700 420810850H 10400
v1 (7 dépendances) 78 112 93 105 122 100
v2 (4 dépendances) 28 28 23 29 28 27
v3 (aucune) 26 19 16 25 19 21
gain ×3,00×4,47×5,81×4,20 ×6,42×4,76
TABLE5.10– Nombre de millions de cycles pour la somme des éléments d’un tableau avec
et sans chaîne de dépendance, architectures Intel
59504150,94 13215373,86 11755971,24
Dépendances AMD AMD AMD AMD
Ryzen 7Ryzen 5Ryzen 5Ryzen 5
1700 3600 5600g 9600X
v1 (7 dépendances) 103 85 59
v2 (4 dépendances) 35 23 13
v3 (aucune) 23 15 11
gain ×4,47 ×5,66 ×5,36
TABLE5.11– Nombre de millions de cycles pour la somme des éléments d’un tableau avec
et sans chaîne de dépendance, architectures AMD
Il est alors flagrant que diminuer le nombre de dépendances conduit à obtenir
un code qui s’exécute plus rapidement. Sur AMD Ryzen 5 3600, on va4,47fois plus
vite sans chaîne de dépendance en utilisant la version 3.
Attention
Un dernier point important concerne la version 2 avec4dépendances. Celles-
ci sont distantes. Si on les place côte à côte, on obtient sur AMD Ryzen 5
5600g, un temps moyen d’exécution de32millions de cycles et non plus23.
## 5.5 Nous avons vu dans ce chapitre comment traduire les structures de contrôle du

langage C et comment on pouvait améliorer l’efficacité des boucles en les dépliant
ou en brisant la chaîne de dépendances d’un calcul. Ces améliorations doivent être
conjuguées avec l’accélération de l’accès mémoire en tentant de mettre le plus de
données dans les caches et en les réutilisant quand cela est possible.
### 5.5.1 ▷

en architecture 32 bits, on dispose de huit registres généraux, cependant seuls
6 sont utilisés pour faire des calculs ou stocker des données (eax,ebx,ecx,
edx,edi,esi); le registreespcontient le sommet de pile et ne doit pas être
modifié directement alors queebpest utilisé afin de récupérer les arguments
d’un sous-programme
▷
en architecture 32 bits, si l’on doit réaliser des multiplications ou des divisions
les registreseaxetedxseront impactés, ce qui ne laisse plus que 4 registres
pour faire les calculs
▷
en architecture 64 bits, on dispose de 8 registres généraux supplémentaires
(r8à15), ce qui permet de lever le verrou des limitations du 32 bits
▷
l’assembleur ne dispose pas de structures de contrôle comme la conditionnelle
if, les bouclesfor,while. Ecrire en assembleur est donc une tâche difficile.
▷
les techniques de dépliage de boucle ou de tuilage permettent d’améliorer
l’efficacité du traitement des boucles
▷
positionner unifà l’intérieur d’une boucle (forouwhile) conduit à ralentir
l’exécution du traitement, il faut alors être en mesure de pouvoir éliminer le
ifsoit en le remplaçant par des instructions spécifiques (cf Chapitre), soit
en le vectorisant (cf. Chapitre)
### 5.5.2 On doit être capable de traduire :

□une multiplication, une division, un modulo
□une conditionnelle avec plusieurs conditions séparées par des et/ou
□une boucle for
□une boucle while
## 5.6 Exercice 21 -Traduire le code suivant en assembleur x86 32 bits oùx,yetzsont

trois variables entières :
1if((((x%2) 0) y<257)) z==9))
2 x=x+y-z;
3}
Exercice 22 -Traduire le code suivant en assembleur x86 32 bits :
1const =1000;
2int [SIZE];
3for(int =0;i<SIZE; i)
4 tab[i] i+1) 7;
5}
Exercice 23 -Ecrire les fonctions qui réalisent les traitements suivants en C puis
les traduire en assembleur :
1.
2.
trouver le bit le plus significatif d’un entier non signé, c’est à dire la position
du bit de poids fort
3.
Exercice 24 -Soit le code suivant :
1const =1005;
2int [N];
4for(int =0;i<N; i)
5 tab[i] i;
6}
1.
2.
Attention, la difficulté lors de la traduction en assembleur provient de l’instruction
tab[i] = i;pour laquelle il faut augmenterià chaque itération du dépliage.
Exercice 25 -Que se passe t-il si on réalise le traitement suivant (cf. Section)?
1 mov ,6 ; eax = FF_FF_FF_FA_h
2 xor ,edx ; mise à -1 de edx
3 dec
4 mov ,3
5 div
Exercice 26 -Traduire la fonction suivante en assembleur x86 32 bits de la manière
la plus efficace possible:
1int (int )
2 if(x<0)
3 return ;
4 }else (x>1)
5 return ;
6 }else{
7 return ;
8 }
9}
