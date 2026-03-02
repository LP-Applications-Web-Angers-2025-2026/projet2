# Chapitre 7 : Coprocesseurarithmétique Quelle prétention de dire que l’informatique est récente,

Coprocesseurarithmétique
Quelle prétention de dire que l’informatique est récente,
Adam et Eve avaient déjà un Apple!
Anonyme.
## 7.1 Dans ce chapitre nous allons voir comment utiliser le coprocesseur arithmétique

afin de réaliser des calculs avec des nombres à virgule flottante. L’ensemble des
instructions du coprocesseur commencent par la lettre’f’pourFloating point value.
Le coprocesseur était absent sur les premiers microprocesseurs de la famille x86
mais on pouvait ajouter un circuit externe sur la carte mère chargé de faire les
calculs des nombres en virgule flottante. Ce circuit a donc été nommécoprocesseur
dans la même veine que coéquipier, c’est à dire celui qui vient aider pour réaliser
une tâche. Le premier coprocesseur pour l’Intel 8086 fut l’Intel 8087. D’autres
coprocesseurs furent produits pour les microprocesseurs suivants dans la gamme
x86 : 80287, 80387, 80487, jusqu’à l’intégration du coprocesseur au sein du
microprocesseur à partir des Intel 80486DX. On ne parle donc plus à présent de
coprocesseur mais plutôt de FPU pourFloating Point Unit, comme nous l’avons vu
dans le Chapitre.
## 7.2 La FPU est composée des éléments suivants (cf. Figure) :

•une pile de 8 registres (Registers Stack)
•le registreopcodequi contient le code de la dernière instruction exécutée
•
le registre destatutqui contient le sommet de pile, les exceptions et les flags
•
le registre decontrôlequi contrôle la précision et l’arrondi des méthodes de
calcul
•
le registre d’étiquette(Tag Register) indique le contenu (valid, 0, NaN, infini)
de chaque registre du coprocesseur
•
le registre dit pointeur de dernière instruction (Last Instruction Pointer) qui
pointe sur la dernière instruction exécutée
•
le registre dit pointeur de dernière donnée (Last Data Pointer) qui pointe vers
l’opérande de la dernière instruction exécutée
FIGURE7.1 – Registres du coprocesseur
## 7.3 Le coprocesseur comporte 8 registres notés R0 à R7 mais qui ne sont pas

manipulables directement. On y accède au travers d’une pile dotée de 8 registres
appelésst0àst7que ce soit en architecture 32 ou 64 bits.
Dès que l’on charge une nouvelle donnée dansst0, les données déjà stockées
dansst0àst6sontdéplacéesversst1àst7. En réalité, la pile du coprocesseur
peut être vue comme une liste, on recule donc le pointeur de sommet de pile et
cela revient à ajouter la nouvelle valeur en début de liste.
Les registresst0àst7occupent chacun 80 bits ce qui permet de disposer d’une
grande précision de représentation afin de réaliser des calculsjustescomparative-
ment aux nombres en simple ou double précision. L’exposant occupe alors 15 bits
et la mantisse 64 bits.
7.3. MANIPULATION DES DONNÉES ET DE LA FPU 217
Comme nous le verrons ci-après, si on charge plus de huit valeurs dans la pile
du coprocesseur, on génère une exception. Il faut donc prendre l’habitude de ne
laisser qu’une valeur dansst0qui correspond au réstulat du dernier calcul, puis la
supprimer lorsqu’on n’en a plus besoin.
### 7.3.1 Le chargement des données se fait grâce à l’instructionfld, pourFloating point

LoaD, en précisant la quantité chargée. Par exemple :
•dwordpour un flottant en simple précision
•qwordpour un flottant en double précision
Il existe également une instructionfildpourFloating point Integer LoaDqui
permet de charger une valeur entière qui sera convertie en nombre en simple ou
double précision.
Attention
On ne peut pas charger une donnée depuis un registre général, uniquement
depuis la mémoire ou à partir d’un autre registre du coprocesseur :
1section
3 a: ; float a = 1.25
4 b: ; double b = 3.752567871
5 c: ; int c = 31
6 d: ; long int d = 123
8section
10 fld [a]
11 fld [b]
12 fld
13 fld
14 fild [c]
15 fild [d]
16 ret
Nous pouvons voir Table
gramme assembleur précédent. A mesure que l’on charge de nouvelles données les
précédentes sontdéplacéesdans la pile du coprocesseur.
Afin de faciliter l’écriture des calculs, un certain nombre de constantes sont pré-
définies et peuvent être chargées en utilisant le mnémonique adéquat (cf. Table).
On pourra donc charger les constantes0et1,0. Mais si on désire utiliser2,0, il
faudra stocker cette donnée en mémoire puis la charger dansst0.
Instruction st0st1st2st3st4st5st6st7
fld [a]1.25 ? ? ? ? ? ? ?
fld [b]3.75 1.25 ? ? ? ? ? ?
fld 1.25 3.75 1.25 ? ? ? ? ?
fld 1.25 1.25 3.75 1.25 ? ? ? ?
fild [c]31 1.25 1.25 3.75 1.25 ? ? ?
fild [d]123 31 1.25 1.25 3.75 1.25 ? ?
TABLE7.1 – Effets du chargement de valeurs dans le coprocesseur
Instruction Constante
fldz 0.0
fld1 1.0
fldpi π
fldl2e log(e) = 1.442695
fldl2t log2(10) = 3.312928
fldlg2 log10(2) = 0.3102999
fldln2 loge(2) = 0.693147
TABLE7.2 – Constantes prédéfinies du coprocesseur (valeurs approchées)
### 7.3.2 Le stockage fonctionne comme le chargement, on indique l’emplacement mé-

moire au formatdwordouqwordvers lequel on désire stocker la valeur en sommet
du coprocesseur.
Attention
La plupart des instructions que nous allons voir par la suite disposent d’un
suffixe formé de la lettrep. C’est le cas pourfst, fstp. Ajouter le suffixep
signifie qu’on dépile (pop) le résultat.
Voyons cela sur un exemple :
1section
2 a:
3 b:
5section
6 fld1
7 fst [a]
8 fstp [b]
7.4. OPÉRATIONS 219
Pour le code précédent, on commence par charger la valeur 1.0 dansst0(ligne
6), puis à la ligne 7, on stocke cette valeur dans la variableasous forme d’un
flottant simple précision. A la ligne 8 ,on stocke la valeur contenue dansst0qui est
toujours 1.0 enbsous forme d’une valeur flottante 64 bits, puis on la supprime de
st0. On se retrouve finalement avec une pile vide.
## 7.4 Nous donnons à présent une liste non exhaustive des opérations que l’on peut

utiliser avec la FPU.
### 7.4.1 En ce qui concerne les opérations arithmétiques de base que l’on peut utiliser,

on dispose de :
•fadd, faddppour l’additionst0 = st0 + src
•fsubpour la soustractionst0 = st0 - src
•fsubrpour la soustraction inversest0 = src - st0
•fmul, fmulppour la multiplication
•fdiv, fdivp, fdivr, fprempour la divisionst0 = st0 / src
•fdivrpour la division inversest0 = src / st0
•fpremreste de la division
Ces opérations peuvent être suffixées par la lettreppour dépiler la valeur
au sommet de la pile du coprocesseur. Elles fonctionnent toutes sur le même
modèle, par exemple pourfaddnous donnons Table
de l’instruction sachant que le registrest0représente le sommet de pile etsti
représente l’un des 7 autres registres soitst1àst7.
Instruction Interprétation
fadd[mem]
fadd st0 += sti
fadd ,st0sti += st0
faddp sti += st0, puisst0est dépilé
faddp ,st0identique à l’instruction précédente
fiadd[mem] , où[mem]est un entier
TABLE7.3 – Description de l’instructionfadd
Attention
On note quefadd etfaddp ont un comportement différent alors
qu’elle ne devrait normalement différer que d’unpop:
•fadd :st0 += sti
•faddp :sti += st0, puisst0est dépilé
On dispose également d’opérations comme :
•fabspour le calcul de la valeur absolue
•fchschangement de signe
•fsqrtcalcul de la racine carrée
•fscalecalcul dest0 =st0
st1
•f2xm1:st0 = 2
st0
−1
•fyl2x:st0 =st1×log2(st0)
•fyl2xp1:st0 =st1×log2(st0 + 1)
•fxtractextrait l’exposant du nombre stocké dansst0
### 7.4.2 Pour appliquer les opérations trigonométriques, on utilise les fonctions suivantes

qui s’appliquent uniquement surst0qui représente une mesure d’angle exprimée
en radians :
•fcos, fsin, fsincos, fptan, fpatanpour le cosinus
•fsinpour le sinus
•fptancalcul de la tangente (partielle)
•fpatancalcul de l’arctangente (partielle)
•fsincoscalcul du sinus et cosinus,st0= cos(st0),st1= sin(st0)
Par exemple, le code qui suit commence par convertir un angle de 60
◦
en
radians, puis applique la fonctionfsincos:
1section
2 angle: ; degrés
3 cqv: ; degrés
5section
6 ; calcul de pi *60 / 180 pour avoir la mesure en radians
7 fild [angle]
8 fild [cqv]
9 fdivp ,st0 ; st1 = 60.0 / 180.0, puis pop st0 = 0.3333...
10 fldpi ; st0 = pi, st1 = 0.3333...
11 fmulp ,st0 ; st0 = pi*0.3333...
12 fsincos
7.5. ERREURS LIÉES À LA FPU 221
On obtient donc dansst0la valeur0.5et dansst1la valeur0.86qui corres-
pondent respectivement au cosinus et sinus d’un angle de 60 degrés.
7.4.3
La FPU n’a pas directement accès au flux d’instructions du microprocesseur.
Celui-ci lui transmet les intructions qui la concernent. Pendant que la FPU exécute
les instructions qui lui sont envoyées, le microprocesseur peut continuer à exécuter
d’autres instructions qui n’agissent pas sur les flottants car certaines instructions
de la FPU peuvent être relativement lentes en comparaison des instructions qui
agissent sur les entiers.
Le microprocesseur garde néanmoins la main et est en mesure de lire ou d’écrire
les registres de statut et de contrôle de la FPU. Dans certains cas il est préférable
d’accèder à ces registres sans attendre, par contre d’en d’autres situations il est
nécessaire d’attendre que la FPU ait terminé le calcul de l’instruction en cours
d’exécution.
Les instructions suivantes permettent de manipuler la pile du coprocesseur soit
de manière locale en modifiant un registre (ffree) soit de manière globale (fsave,
frstor). Certaines de ces instructions commencent par les lettresfn, la lettren
signifiantno-wait.
•fwait
synchronisation des exceptions avant de passer à la prochaine instruc-
tion
•finitinitialise ou réinitialise le coprocesseur
•fclex,fnclexsupprime les exceptions qui auraient été levées
•fsave,fnsavesauve l’état et les registre du coprocesseur, soit 108 octets
•frstorrestaure l’état et les registres du coprocesseur
•ffreelibère un registre
## 7.5 Deux types d’erreurs peuvent se produire lors de calculs avec les nombres

flottants :
•
les erreurs de calcul : calcul d’une racine carrée négative, débordement,
division par zéro
•les erreurs liées à la gestion de la pile de la FPU : pile pleine, pile vide
Pour gérer l’ensemble des erreurs, la FPU utilise deux registres appelésregistre
de statutdont la description est donnée Table, ainsi qu’un registre de contrôle
que nous ne détaillerons pas car le registre de statut est suffisant pour traiter les
erreurs qui nous intéressent.
BitIdentifiantDescription Exception
0 FPU_IE Opération Invalide oui
1 FPU_DE Opérande dénormalisée oui
2 FPU_ZE Division par Zéro oui
3 FPU_OE Débordement (Overflow) oui
4 FPU_UE Débordement (Underflow) oui
5 FPU_PE Précision oui
6 FPU_SF Erreur Pile (Stack Fault)
7 FPU_ES Résumé Erreur
8 FPU_C0 C0(Retenue)
9 FPU_C1 C1(Débordement)
10FPU_C2 C2(Parité)
11-13 - Sommet de pile
14FPU_C3 C3(Zéro)
15FPU_B
TABLE7.4 – Description du registre de statut de la FPU
Pour le registre de statut les bits 0 à 5 correspondent à des exceptions qui
peuvent être interceptées au niveau d’un programme C en utilisant un gestionnaire
de signal (Signal Handler). Le signal levé estSIGFPEsoitSignal Floating Point
Exception.
Les bits 11 à 13 codent sur 3 bits le sommet de pile, celui-ci est initialement à
7 puis descend jusqu’à 0. Si on place plus de 8 valeurs dans la pile de la FPU on
génère une erreurFPU_SFet les prochaines valeurs chargées dans la FPU seront
remplacées par−NaN(moinsNot a Number).
On trouvera sous Linux dans le fichier/usr/include/fenv.hles signaux liés
à la FPU et on pourra consulter le fichiersignal_handler.cppdans les sources
des études de cas car il gère les différents signaux qui peuvent être levés grâce
à la classeSignalHandler. On consultera également la méthodemainqui appelle
la classeSignalHandlerdont le constructeur a pour but d’intercepter les signaux
principaux.
Enfin, les bits qui correspondent aux identifiantsC0àC3sont des bits dits de
condition (Condition Flags) qui sont calqués sur les bits du registre desflags. Ces
bits qui sont utilisés lors des comparaisons peuvent être copiés dans le registre
desflagsmais il faut utiliser la série d’instructions suivantes pour réaliser cette
opération ce copie nécessaire pour certaines instructions de comparaison :
1 fstsw
2 sahf
## 7.6 Il existe différentes instructions pour la comparaison de valeurs flottantes. On

pourra consulter la documentation deftst,fcom,fcomp,fcompp,fucom,fucomp,
fucomppdans la documentation Intel.
Les instructions un peu plus intéressantes pour le développeur sontfcomi,
fcomip, fcomu, fcomup
,fcomip,fcucomietfcuomipcar elles réalisent la compa-
raison de deux valeurs et mettent directement à jour le registreflagsà partir des
bits de condition de la FPU.
### 7.6.1 Par exemple pour comparer deux valeurs flottantes :

1int (float ,float )
2 if(x>y)
3 return ;
4 }else{
5 return ;
6 }
7}
En 32 bits, on commence par chargery, puisx. On compare ensuitexàygrâce à
l’instructionfcomipqui réalise la comparaison et dépilexdest0. On dépile ensuite
y(ligne 8). On utilise l’instruction de branchement conditionneljbe(Jump Below
or Equal) pour exécuter le.elsedans le cas oùx≤y.
1compare_32bits:
2 push
3 mov ,esp
4 fld [ebp+12]
5 fld [ebp+8]
6 fcomip ,st1 ; x est en st0, y en st1, on compare
7 ; x à y et on dépile x
8 fstp ; supprime y
9 jbe
10 mov ,1
11 jmp
12.else:
13 mov ,3
14.endif:
15 mov ,ebp
16 pop
17 ret
Instructions de saut pour les flottants
Pour des raisons historiques les instructions de comparaison sur les flottants
ne mettent pas à jour les mêmes bits du registreEFLAGSque l’instructioncmp.
On a donc défini d’autres instructions de branchement commejb(au lieu de
jl) etja(au lieu dejg). Il existe égalementjbeetjae.
Pour résumer, pour comparer deux valeurs (xày), on commence par chargery
dans le coprocesseur, puisxet on exécutefcomipoufcomip st0, st1. On prend
alors le même raisonnement que pour unifentre valeurs entières. On prend la
négation de la condition pour se brancher sur leelse. Il ne faut pas oublier de
supprimer les valeurs chargées au niveau du coprocesseur.
7.6.2
Lorsque l’on travaille en 64 bits, ce sont les registres SSE qui sont utilisés (cf.
Chapitre) pour réaliser les calculs avec les nombres flottants. En prévision de ce
que nous verrons dans le prochain chapitre nous montrons comment le compilateur
C traduit le code suivant :
1void (float ,float )
2 if(fabs(x-y) 1e-6)
3 // code du then
4 }else{
5 // code du else
6 }
7}
On a vu Chapitre xetysont respectivement placées dans les
registresxmm0etxmm1:
1equal_64bits:
2 subss ,xmm1
3 andps ,XMMWORD [rip]
4 cvtss2sd ,xmm0
5 movsd ,QWORD [rip]
6 comisd ,xmm0
7 jb
8.then:
9 ....
10 jmp
11.else:
12 ....
13.endif:
14 ret
17.LC0:
18 .long ; 0x7FFFFFFF
19 .long
20 .long
21 .long
22.LC1:
23 .long ; 0xA0B5ED8D
24 .long ; 0x3EB0C6F7
On commence donc par calculer la différencex-y(ligne 2), puis on calcule la
valeur absolue (ligne 3) en appliquant un masque qui ne garde que les 31 premiers
bits du registrexmm0qui lui, occupe 128 bits (variable.LC0). En ligne 4, on convertit
le résultat simple précision en double précision et on le compare à10
−6codé en 64
bits au format IEEE 754 en.LC1. Le reste du code exécute le.thendans le cas ou
la condition duifest vérifiée, sinon il exécute le.else.
Il faut noter que la constante1e
−6placée en.LC1est donnée au format
IEEE 754 double précision dans le code et représente la valeur hexadécimale
0x3EB0C6F7A0B5ED8Dqui correspond en fait à la valeur :
9.99999999999999954748111825886E−7
Il existe également une instruction\gls{cmpss}xmm1,xmm2,imm8 qui permet
de comparer deux valeurs 32 bits en partie basse des registres qui sont passés en
paramètre. La constanteimm8indique quel type de comparaison doit être réalisée
(cf. Table).
imm8Type de comparaison
0 xmm1.ps[0] == xmm2.ps[0]
1 xmm1.ps[0] < xmm2.ps[0]
2 xmm1.ps[0] <= xmm2.ps[0]
3 unordered
4 xmm1.ps[0] != xmm2.ps[0]
5 xmm1.ps[0] >= xmm2.ps[0]
6 xmm1.ps[0] > xmm2.ps[0]
7 ordered
TABLE7.5 – Comparaison avec cmpss
L’implantation decmpssest donc la suivante :
1bool (float ,float ,u8 )
2 switch(imm8)
3 case :return ==y;
4 case :return <y;
5 case :return <=y;
6 case :return(x==Nan) y==NaN);
7 case :return !=y;
8 case :return >=y;
9 case :return >y;
10 case :return(x!=Nan) y!=NaN);
11 }
12}
14bool =cmp(xmm1.ps[0],xmm1.ps[1],imm8)
15if(res==true)
16 xmm1.ps[0] 0xFFFFFFFF;
17}else{
18 xmm1.ps[0] 0x00000000;
19}
Notamment la relationunorderedest vraie si au moins un des opérandes est
égale àNaN, alors que la relationorderedest vraie si aucune des opérandes n’est
égale àNaN
Il existe l’instructioncmpsd(Compare Scalar Double-Precision Floating-Point
Value) pour comparer deuxdouble, instruction qui possède le même mnémonique
quecmpsd(Compare String Operands). Il ne faut donc pas les confondre. La première
utilise des registres vectoriels comme opérandes alors que la seconde ne possède
pas d’opérande.
## 7.7 Pour traduire une expression en utilisant les instructions assembleur du copro-

cesseur il suffit de procéder en trois étapes :
1.
2.
la traduire en notation polonaise inverse (RPN
) en réalisant un parcours
postfixe de l’arbre
3.
traduire la version en notation polonaise inverse par des instructions du
coprocesseur en suivant les règles de traduction décrites ci-après
Prenons l’exemple suivant :
(x+ 1)×(x−1)
3−
√
x
La représentation sous forme d’arbre binaire de cette expression est donnée
Figure. On notera que l’arbre n’est pas un arbre binaire au sens strict puisque
pour la racine carrée (
√
x
), on a qu’une seule branche. Dans le cas des opérateurs
unaires on ne disposera que d’une seule branche au niveau de l’arbre et on peut
. ouReverse Polish Notationest une notation post-fixée qui permet d’écrire de façon non ambiguë
les formules arithmétiques sans utiliser de parenthèses.
7.7. TRADUCTION DES EXPRESSIONS RÉELLES 227
convenir qu’il s’agit de la branche gauche; la branche droite étant nulle (pointer
non représenté).
FIGURE7.2 – Représentation arborescente de
(x+1)×(x−1)
3−
√
x
Le parcourspostfixede l’arbre consiste à visiter récursivement le fils gauche,
puis le fils droit s’il existe et enfin le noeud. Si l’un des fils est également un noeud,
on réitère le processus jusqu’à parvenir à une feuille de l’arbre, représentée ici par
un rectangle au bords carrés vert sur la figure. Les noeuds internes sont représentés
par des rectangles aux bords arrondis de couleur bleu. Au final l’expression postfixe
est :
x 1.0 + x 1.0 - * 3.0 x sqrt - /
Les régles de traduction en assembleur à partir de l’expression RPN sont très
simples :
•
s’il s’agit d’une constante ou d’une variable, on la charge au niveau du copro-
cesseur grâce à l’instructionfld
•s’il s’agit d’un opérateur unaire, on l’applique surst0
•
s’il s’agit d’un opérateur binaire, on applique la formulef<Oper>p st1,st0,
oùOper= add, sub, mul, div
A partir de l’expression précédente, on obtient donc :
1section
2 trois: ; constante
4section
5 ; x + 1
6 fld [x]
7 fld1
8 faddp ,st0
9 ; x - 1
10 fld [x]
11 fld1
12 fsubp ,st0
13 ; (x+1)*(x-1)
14 fmulp ,st0
15 ; 3 - sqrt(x)
16 fld [trois]
17 fld [x]
18 fsqrt
19 fsubp ,st0
20 ; (x+1)*(x-1) / (3 - sqrt(x))
21 fdivp ,st0
On notera que dans le cas des constantes, si la constante n’est pas une des
constantes prédéfinies du coprocesseur il est nécessaire de la stocker en mémoire.
7.8
### 7.8.1 En 32 bits l’affichage est assez simple, il suffit de déclarer en externe la fonction

printfet de suivre la convention d’appel du langage C avec cependant une spé-
cificité.Une valeur de type simple précision doit être convertie en une valeur double
précision avant l’affichage, comme sur le code suivant :
1float =3.14;
2printf("%f" ,x);
est donc traduit en :
1extern
3section
4 x:
5 msg: `%f`,0
7section
8 fld [x]
9 sub ,8 ; réservation de 64 bits pour
10 ; double précision
11 fstp [esp]
12 push
13 call
14 add ,12
Afin de convertir la valeur en une valeur double précision, on réserve 8 octets
dans la pile et on utilisera ces 8 octets comme paramètre de la fonctionprintf.
### 7.8.2 Pour une architecture 64 bits, d’après ce qui a été vu en Section, on doit

procéder ainsi :
1extern
2defaultrel
4section
5 x:
6 msg: `%f`,0
8section
10affiche:
11 push ; | ces deux instructions sont
12 mov ,rsp ; | normalement inutiles
13 movss ,x]
14 cvtss2sd ,xmm0 ; conversion au format double précision
15 lea ,msg]
16 mov ,1 ; indique qu'il y a une valeur flottante
17 call WRT..plt
18 mov ,rbp ; | ces deux instructions sont
19 pop ; | normalement inutiles
20 ret
Le registrerdicontient l’adresse de la chaine du format d’affichage. La valeur
flottante est placée dans le registrexmm0et est convertie en double précision comme
en 32 bits. Enfin, le registreraxdoit contenir le nombre de valeurs flottantes à
traiter avant l’appel àprintf.
7.9
### 7.9.1 ▷

le coprocesseur arithmétique permet de réaliser les calculs des nombres à
virgule flottante
▷
initialement absent, puis par la suite positionné sur la carte mère, il est aujour-
d’hui intégré au microprocesseur et est qualifié de FPU (Floating Point Unit).
On trouve généralement plusieurs unités FPU au sein du microprocesseur
▷la FPU fonctionne comme une pile dotée de huit registresst0àst7
▷les instructions assembleur liées à la FPU commencent par la lettref
▷toute donnée empilée dans la FPU doit être dépilée
### 7.9.2 Après lecture et travail sur ce chapitre, on doit être capable de :

□
traduire un calcul avec des nombres à virgule flottante sous forme d’une
série d’instructions assembleur, pour cela on modélise l’expression sous forme
d’un arbre binaire que l’on traduit en utilisant les règles données dans la
Section.
□comparer deux nombres flottants
## 7.10 Exercice 29 -Montrer comment, en utilisant les registres généraux et les instruc-

tions associées, on peut réaliser les opérations de la FPU commefabsqui calcule la
valeur absolue oufchsqui change le signe d’une valeur flottante sur 32 bits. On
chargera la valeur flottante danseaxpar exemple avant de réaliser l’opération.
Exercice 30 -Implantez la fonctioniotaen architecture 32 bits en utilisant la FPU :
1void (float*t,int )
2 for(int =0;i<n; i)
3 t[i] float)i;
4 }
5}
Exercice 31 -Implantez l’expression suivante en architecture 32 bits en utilisant la
FPU :
(x−5)×(x+ 6)
cos(x−5)
×sin(x+ 6)
1.
2.
puis on identifiera les sous-expressions qui sont répétées commex−5etx+ 6
3.
4.
puis on donnera une version en optimisant les calculs en ne recalculant pas à
chaque fois les sous-expressions répétées
Exercice 32 -Implantez la fonctionpuissanceen architecture 32 bits en utilisant
la FPU :
1float (float ,int )
2 float =1;
3 for(int =0;i<n; i)
4 result*=x;
5 }
6 return ;
7}
Faire de même en 64 bits.
Exercice 33 -Ecrire un programme assembleur qui calcule l’expression suivante
sous forme d’un développement limité :
(1−x)
= 1 +x+x
+x
+. . .+x
n
Cette formule fonctionne lorsquexest proche de 0, on pourra essayer avec
x= 0.2 par exemple et déterminer à partir de quelle valeur denon peut s’arrêter
carnne modifie plus la précision du calcul.
Exercice 34 -Ecrire un programme assembleur qui permet de trouver les solutions
à valeurs dansRd’une équation du second degréax
+bx+c= 0 . On utilisera
la FPU pour réaliser les calculs. On rappelle qu’il faut calculer le discriminant
∆ =b
−4ac, puis si∆≥0, on trouvera des solutions réelles :
x1=
−b+
√
∆
2a
x2=
−b−
√
∆
2a
On utilisera l’instructionfcomip st0, st1afin de réaliser une comparaison
entre∆et 0.
