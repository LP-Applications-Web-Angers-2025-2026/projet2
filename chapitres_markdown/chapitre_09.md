# Chapitre 9 : AlgèbredeBoole 2B or not(2B)

AlgèbredeBoole
2B or not(2B)
là est la question!
## 9.1 Nous rappelons que ce chapitre est quelque peu digressif par rapport à l’appren-

tissage de la programmation en assembleur mais il se base sur l’algèbre de Boole
qui utilise leet, leouet lenon, opérations disponibles en assembleur en tant que
mnémoniquesand,or,not.
L’algèbre de Boole, du nom du mathématicien, logicien et philosophe britan-
niqueGeorge Boole(1815-1864), est une partie des mathématiques qui s’intéresse
à une approche algébrique de la logique, alors que la logique se fonde sur des
systèmes de réécriture qui consistent à manipuler des symboles. La logique possède
bien évidemment un volet sémantique et l’algèbre de Boole vient renforcer la
sémantique logique en remplaçant le vrai et le faux par le 1 et le 0, leetet leou
par les opérateurs+et·(addition et multiplication).
Cette vision arithmétique de la logique a permis de mettre au point un système
de calcul qui possède des applications dans la mise au point de circuits électroniques
et autorise à aborder les problèmes de la logique sous un angle différent, ce qui
peut, dans certains cas, donner la possibilité de résoudre un problème beaucoup
plus simplement ou rapidement. Nous en verrons un exemple en fin de chapitre
avec le problème des pigeons.
Concernant les circuits électroniques ce sont eux qui exécutent les mnémoniques
de l’assembleur commeadd,mul,div, ... Nous verrons, Section, comment on
implante un demi-additionneur et un additionneur.
On suppose que le lecteur possède des notions de logique propositionnelle. Si
ce n’est pas le cas, nous recommandons la lecture des premiers chapitres de [23].
## 9.2 Soit un ensembleA={0,1} pour lequel on a0≤1 . On définit alors les

opérations suivantes surA:
•l’addition :a+bdont la sémantique estmax(a,b)
•la multiplication :a·b=min(a,b)
•la complémentation :
0 = 1et1 = 0
Une variable complémentéexest également ditesignéeou négative.
Le résultat des opérations+et·apparaît Table
nous avons donnée.
aba+ba·b
0 0 0 0
0 1 1 0
1 0 1 0
1 1 1 1
TABLE9.1 – Interprétation semantique des opérations+et.
Le quadruplet(A,+,·,
x)
est appeléalgèbre de Booles’il respecte les axiomes
suivants :
1. commutativesetassociatives:
a+b=b+a
a·b=b·a
(a+b) +c=a+ (b+c)
(a·b)·c=a·(b·c)
## 2.0 estélément neutrepour l’addition et1estélément neutrepour la multi-

plication :
0 +a=a
1·a=a
3. distributivesl’une par rapport à l’autre :
(a+b)·c=a·c+b·c
(a·b) +c= (a+c)·(b+c)
9.3. FONCTION BOOLÉENNE, TABLE DE VÉRITÉ 263
4. a=aet vérifie les propriétés suivantes :
a+a= 1
a·a= 0
Si l’on rapporte ces opérations à la logique, alors :
•1indique le caractèrevraid’une propriété ou d’un énoncé
•0indique le caractèrefaux
•l’addition (+) correspond auou
•la multiplication (.) correspond auet
•
la complémentation
a
correspond ànon(noté¬en logique), i.e. lecontraire
dea
Ainsi, l’expressiona+
a= 1
peut s’interpréter : dire qu’une chose est vraie ou
n’est pas vraie est toujours vrai. Je peux par exemple remplacerapar l’énoncéil
pleut, et donc, dans ce cas, il est vrai que : il pleut ou il ne pleut pas.
De la même manièrea·
a= 0
signifie qu’on ne peut pas dire une chose et son
contraire. Je ne peux pas à la fois être grand et ne pas être grand.
C’est grâce à cette modélisation de la logique sous forme d’opérations arith-
métiques que l’on peut simplifier certains traitements modélisés sous forme de
fonctions booléennes.
## 9.3 On appelle fonctionbooléenne, une application deA

n
dansA:
(x1,x2,· · ·,xn)−→f(x1,x2,· · ·,xn)
La manière la plus simple de définir une fonction booléennefest de donner sa
table de vérité, c’est à dire, l’ensemble des n-uplets :
(x1,x2,· · ·,xn,f(x1,x2,· · ·,xn))
Les variablesxiprenant leurs valeurs dansA={0,1} , une fonction den
variables possèdent donccard(A)
n
= 2
n lignes, avecCard() qui donne la cardinalité
d’un ensemble.
Prenons par exemple une fonctionf1(x,y,z) , définie par sa table de vérité,
comme suit :
Lignexyzf1(x,y,z)
0 0 0 0 1
1 0 0 1 0
2 0 1 0 0
3 0 1 1 1
4 1 0 0 0
5 1 0 1 0
6 1 1 0 1
7 1 1 1 1
A partir de la table de vérité d’une fonction, on est en mesure de donner une
expression de celle-ci sous forme algébrique en tant quesomme de monômes:
•
il suffit d’exprimer les monômes pour les lignes pour lesquelles la fonction
f1(x,y,z) = 1
•si une variable est à0sur cette ligne, on utilise son complément
Avec l’exemple précédent, on obtient :
f1(x,y,z) =
x.y.z
|{z}
Ligne0
+x.y.z
|{z}
Ligne3
+x.y.z
|{z}
Ligne6
+x.y.z
|{z}
Ligne7
On remarque dans la table de vérité que les variablesx,yetzsuivent la
notation binaire et que pour la ligne 6, on a bienx= 1,y= 1,z= 0 qui correspond
à1102= 6.
Notation
Il existe un moyen plus simple et plus rapide de décrire la table de vérité
d’une fonction booléenne en indiquant les lignes de la table de vérité qui
comportent des1et qui définissent la fonction. Ainsi, une fonctionfpeut être
est décrite par :f(x,y,z,t) = (3,4,5,6,7,9,13,14,15) ou encore parf(x,y,z,t) =
(3−7,9,13−15), où l’expression3−7signifie de3à7.
### 9.3.1 Dans le cas particulier des fonctions à 2 variablesf(x,y) , on peut définir 16

fonctions différentes dont certaines sont identifiée par un nom. On retrouve notam-
ment :
•or(x,y), c’est à dire leou:x+y
•and(x,y), leet:x·y
9.3. FONCTION BOOLÉENNE, TABLE DE VÉRITÉ 265
•nor(x,y) =or(x,y), lenon ou:x+y
•nand(x,y) =and(x,y), lenon et:x·y
•xor(x,y)
, leou exclusifqui est vrai uniquement si l’une de ses opérandes est
vraie :
x·y+x·y=x⊕y
xyor(x,y)and(x,y)xor(x,y)nor(x,y)nand(x,y)
00 0 0 0 1 1
01 1 0 1 0 1
10 1 0 1 0 1
11 1 1 0 0 0
#### 9.3.1.1 and(x,y)(ET logique)

Le ET logique (voir Table) vaut 1 uniquement si ses deux opérandes xety
valent 1.
xyand(x,y)
00 0
01 0
10 0
11 1
TABLE9.2 – La fonctionand(x,y)
En d’autres termes, dans un programme, pour que la condition(x and y)soit
vraie, il faut que les deux sous-conditionsxetysoient vraies.
1if((0<a)and(a<11))
2 // a est compris entre 1 et 10
3}else{
4 // a est en dehors de l'intervalle [1..10]
5}
#### 9.3.1.2 or(x,y)(OU Logique)

Le OU logique (voir Table) vaut 0 uniquement si ses deux opérandes xety
valent 0.
En d’autres termes, pour que la condition(x or y)soit vraie, il faut que l’une
des deux sous-conditionsxouy(ou les deux) soient vraies.
xyor(x,y)
00 0
01 1
10 1
11 1
TABLE9.3 – La fonctionor(x,y)
1if((a>10)or(a<1))
2 // a est en dehors de l'intervalle [1..10]
3}else{
4 // a est compris entre 1 et 10
5}
#### 9.3.1.3 xor(x,y)(OU Exclusif Logique)

Le OU Exclusif logique (voir Table) vaut 0 uniquement si ses deux opérandes
xetyont la même valeur.
xyxor(x,y)
00 0
01 1
10 1
11 0
TABLE9.4 – La fonctionxor(x,y)
En d’autres termes, pour que la condition(x xor y)soit vraie, il faut que l’une
des deux sous-conditionsxetysoit vraie, mais pas les deux en même temps.
1if((est_un_poisson(a)xor (a)))
2 // élimine les poissons volants
3 // Traite les poissons ou les animaux qui volent
4 // mais pas les deux en même temps
5}
#### 9.3.1.4 Les lois deDe Morgan(mathématicien et logicien britannique, 1806-1871)

permettent d’exprimer la transformation de la négation d’un ET ou d’un OU logique.
9.4. SIMPLIFICATION DES FONCTIONS BOOLÉENNES 267
•
NON(xETy) est équivalent à NON(x) OU NON(y), que l’on peut énoncer
sous la forme : le complémentaire du produit est la somme des complémen-
taires :
x.y=x+y
•
NON(xOUy) est équivalent à NON(x) ET NON(y), que l’on peut énoncer
sous la forme : le complémentaire de la somme est le produit des complémen-
taires :
x+y=x.y
Par exemple, soit la condition(0<a)and(a<11)vue précédemment dans
l’exemple sur le ET. Il existe différentes manières d’en prendre la négation :
•not(
•not(0 < a)a < 11) , transformation parDe Morgan
•(0 >= a) , application dunotsur chaque sous-condition
•(a <= 0)
•(a < 1)
## 9.4 L’intérêt de l’algèbre de Boole est qu’elle permet de simplifier les fonctions

booléennes comme on le ferait d’une expression algébrique sur les entiers ou les
réels.
### 9.4.1 Deux fonctions booléennes sont dites identiques si elles possèdent la même

table de vérité. Cette propriété nous permet d’établir un certain nombre d’identités
et de règles de simplification :
Loi Forme+ Forme·
élément neutre(R1) x+ 0 =x (R2) x·1 =x
d’idempotence (R3) x+x=x (R4) x·x=x
d’inversion (R5) x+x= 1 (R6) x·x= 0
d’absorption (R7) x+x·y=x (R8) x·(x+y) =x
de De Morgan (R9) x+y=x·y (R10) x·y=x+y
de commutativité(R11) x+y=y+x (R12) x·y=y·x
d’associativité(R13)x+ (y+z) = (x+y) +z(R14) x·(y·z) = (x·y)·z
de distributivité(R15)x·(y+z) =x·y+x·z(R16)x+y·z= (x+y)·(x+z)
Essayons d’appliquer ces règles pour simplifier la fonctionf2(x,y,z):
f2(x,y,z) =x·y·z+x·y·z+x·z
Cette fonction peut être réécrite sous une forme simplifiée en :
f2(x,y,z) =x·y·z+x·y·z+x·z
=x·y·(z+z) +x·z (factorisation)
=x·y·1 +x·z (R5)
=x·y+x·z
La fonction ainsi réduite possède deux termes et est plus facile à concevoir sous
forme de schéma électronique car elle utilise moins de symboles donc moins de
portes logiques. Ces portes logiques sont implantées sous forme de transistors. Si
on utilise moins de transistors on peut réduire la taille des circuits électroniques.
On utilise également d’autres formules de simplification parmi lesquelles :
(R17) x+
x·y=x+y
(R18)x·y+x·z+y·z=x·y+x·z
### 9.4.2 La méthode des tableaux de Karnaugh a été développée parMaurice Karnaugh,

ingénieur américain en télécommunications aux Bell Labs en 1953. Il s’agit d’un
procédé de simplification visuel, pratique, qui ne s’applique qu’à des fonctions
booléennes composées au maximum de 6 variables, car au delà, cela devient
extrêmement complexe de visualiser les simplifications. Elle consiste à représenter
sous une forme particulière la table de vérité de la fonction afin de procéder à des
regroupements qui correspondent à l’élimination d’une variable qui apparaît sous
une forme positive dans un terme et négative dans un autre terme :
x·y·z+x·
y·z=x·z·(y+y)
|{z}
(R5)=1
=x·z
La simplification est réalisée en deux étapes :
1.
2.
puis on simplifie l’expression par réunion de2
ncases adjacentes (c’est à dire
par groupe de2,4,8,16,32) en évitant les regroupements redondants
9.4. SIMPLIFICATION DES FONCTIONS BOOLÉENNES 269
### 9.4.3 Nous présentons Figures,, deux agencements d’un tableau de Karnaugh

pour une fonction de trois variables. La Figure
représentation pour une fonction de quatre variables.
On remarque que les lignes ou les colonnes ont une organisation particulière :
quand on passe d’une ligne (ou d’une colone) à la suivante (ou la précédente) on
ne change le signe que d’une seule variable.
FIGURE9.1 – Tableau de Karnaugh pour une fonction de 3 variables (version 1)FIGURE9.2 – Tableau de Karnaugh pour une fonction de 3 variables (version 2)
Dans chaque case des tableaux nous trouvons le numéro de la ligne de la table
de vérité qui lui est associé. Ainsi pour la Figure, l’expression x·¯y·¯z·v correspond
en binaire à10012 soit9en décimal. La valeur9se trouve donc à l’intersection de
la lignex·¯yet de la colonne¯z·v.
Pour remplir le tableau de Karnaugh on ne garde que les numéros des cases qui
correspondent à des valeurs pour lesquelles la fonction booléenne vaut1.
FIGURE9.3 – Tableau de Karnaugh pour une fonction de 4 variables
### 9.4.4 Comme indiqué précédemment, on regroupe les2

ncases adjacentes. Dans
certains cas il n’est pas possible de regrouper des cases du tableau car elles ne sont
pas adjacentes, on n’aura donc aucune simplification pour la case en question.
Tableau de Karnaugh : adjacence de deux cases
On peut définir l’adjacence de deux cases du tableau par le fait que leurs
expressions algébriques ne diffèrent que par le signe d’une seule variable. Par

> **Exemple** : 
>
•x·y·z
etx·
y·z
sont adjacentes car elles ne diffèrent que par le
changement de signe deyen
y
•
alors quex·y·z etx·
y·z
diffèrent par le changement du signe de
deux variablesyetzet ne sont donc pas adjacentes
FIGURE9.4 – Exemples d’adjacence dans un tableau de Karnaugh
9.4. SIMPLIFICATION DES FONCTIONS BOOLÉENNES 271
La Figure
quatre variables, on peut regrouper les variables adajacentes par deux, quatre, huit
ou seize. On a donc adjacence si, partant d’une case, on atteint une autre case :
•en passant d’une ligne à la suivante ou la précédente
•en passant d’une colonne à la suivante ou la précédente
Il nous suffit alors de regrouper des cases adjacentes afin de simplifier des
expressions.
Tableau de Karnaugh : adjacence de plusieurs cases
Plusieurs cases sont adjacentes si elles sont au nombre de2
net qu’elles
forment un carré ou un rectangle.

> **Attention** : il est possible d’utiliser plusieurs fois la même case pour faire des
>
regroupements différents. Cependant, si on regroupe des cases contenues dans un
regroupement déjà effectué alors on produit un terme inutile ou redondant.
#### 9.4.4.1 Voyons cela sur un exemple concret. Considérons la fonction booléenne donnée

par l’expression algébrique :
f4(x,y,z) =
x·y·z+x·y·z
+x·y·z+x·y·z
+x·y·z
Le tableau de Karnaugh de cette fonction est représenté Figure.
La case 0 n’étant adjacente à aucune autre, elle restera seule et ne subira
aucune simplification. Les cases(3,7),(6,7)et(5,7)sont adjacentes on va donc les
regrouper :
•pour 3 et 7, on a
x·y·z+x·y·z= (x+x)·y·z=y·z
•pour 5 et 7, on ax·y·z+x·y·z= (y+y)·x·z=x·z
•pour 6 et 7, on ax·y·z+x·y·z= (z+z)·x·y=x·y
Comme indiqué précédemment, bien que les cases3,5,6,7 soient adjacentes,
on ne peut pas les regrouper car elles ne forment pas un carré ou un rectangle.
Notamment3n’est pas adjacente à5ou6. Au final, on obtient la simplification :
f4(x,y,z) = ¯x·¯y·¯z
|
{z}
+y·z
|{z}
3+7
+x·z
|{z}
5+7
+x·y
|{z}
6+7
FIGURE9.5 – Tableau de Karnaugh def4(x,y,z)
#### 9.4.4.2 On considère la fonction de 3 variablesf5(x,y,z) = (1,3,6,7)

Le tableau de Karnaugh de cette fonction est représenté Figure.
Si l’on y prête pas attention, on peut envisager de réaliser les regroupements
suivants :
•α= (1,3)
•β= (3,7)
•δ= (6,7)
On obtiendra alors la simplification :
f5(x,y,z) =
x·z
|{z}
α
+y·z
|{z}
β
+x·y
|{z}
δ
Cependant, comme le montre les regroupements sur la Figure, le terme
associé àβest redondant, puisque le recouvrement avecαetδsuffit à regrouper
tous les termes. On peut effectivement montrer que le termeβest redondant et
donc inutile par simplification algébrique :
xz+yz+xy=xz+yz·(x+x) +xy1 = (x+ ¯x)
= xz+xyz+xyz+xy(developpement)
=xz·(1 +y) +xy·(1 +z) (factorisation)
= xz+xy
9.5. REPRÉSENTATION DES PORTES LOGIQUES 273
FIGURE9.6 – Tableau de Karnaugh def5(x,y,z)
Il s’agit en fait d’une simplification qui s’apparente à la formule(R18)vue
précédemment.
## 9.5 Les expressions booléennes sont représentables de manière graphique en utili-

sant des portes logiques. Les portes logiques sont généralement représentées par
des symboles composés d’une ou plusieurs entrées et d’une sortie. Pour relier deux
portes il suffit de relier la sortie de l’une à l’une des entrées de la seconde.
FIGURE9.7 – Représentation des portes logiques
Par exemple, la fonctionf6(x,y,z) =
x·y·z+x·y·z+x·z
est représentée
Figure.
FIGURE9.8 – Conception de la fonctionF
### 9.5.1 Les expressions booléennes se résument à des combinaisons entre trois types

de portes couramment utilisées : NOT, AND, et OR. On remarquera que ces trois
portes sont modélisables en fonction d’un seul type de porte : la porte NAND.
FIGURE9.9 – Portes NOT, AND et OR en fonction de portes NAND
x=x·x
x·y=x·y·x·y
x+y=x·x·y·y
On peut également écrire les portes NOT, AND et OR en fonction de portes NOR
(cf. figure).
x=x+x
x·y=x+x+y+y
x+y=x+y+x+y
9.6. ALGÈBRE DE BOOLE ET CIRCUITS 275
FIGURE9.10 – Portes NOT, AND et OR en fonction de portes NOR
## 9.6 L’algèbre de Boole permet de modéliser le fonctionnement des circuits logiques

et d’en simplifier l’implantation. Nous prendrons ici l’exemple de l’additionneur et
du demi-additionneur qui sont deux circuits logiques très simples.
### 9.6.1 Le demi-additionneur est un circuit logique qui comporte deux entrées (xet

y) et deux sorties et qui a pour but de calculer la sommex+y. Les deux entrées
correspondent aux deux bits à additionner et les sorties à la sommeSainsi que
la retenue en sortieRsqui peut être générée.SetRssont donc des fonctions
booléennes dont la table de vérité est donnée Table.
xySRs
0 0 0 0
0 1 1 0
1 0 1 0
1 1 0 1
TABLE9.5 – Table de vérité du demi-additionneur
Les fonctionsSetRss’expriment donc sous forme algébrique par :
S(x,y) =x·y+x·y=x⊕y
Rs(x,y) = x·y
### 9.6.2 Un additionneur est un circuit qui comporte trois entrées et deux sorties. Il

calcule la somme de ses trois entrées. Les trois entrées sontx,yet la retenue
en entréeRequi correspond à un calcul précédent. Les deux sorties sont comme
précédemmentSetRs. La table de vérité de l’additionneur est donc la suivante :
xyReSRs
0 0 0 0 0
0 0 1 1 0
0 1 0 1 0
0 1 1 0 1
1 0 0 1 0
1 0 1 0 1
1 1 0 0 1
1 1 1 1 1
TABLE9.6 – Table de vérité de l’additionneur
Le calcul en décimal est équivalent àx+y+Re=Rs×2 +S.
FIGURE9.11– Demi addi-
tionneur
FIGURE9.12 – Additionneur complet
Les fonctions booléennesSetRspour l’additionneur (complet) s’expriment
sous forme algébrique par :
S(x,y,Re) =x⊕y⊕Re
Rs(x,y,Re) =x·y+ (x⊕y)·Re
9.7. ALGÈBRE DE BOOLE ET ARITHMÉTIQUE 277
### 9.6.3 Conformément aux règles énoncées Section, on obtient la table de vérité

suivante :
RexySRs
0 0 0 0 0
0 0 1 1 1
0 1 0 1 0
0 1 1 0 0
1 0 0 1 1
1 0 1 0 1
1 1 0 0 0
1 1 1 1 1
TABLE9.7 – Table de vérité du soustracteur
Le calcul en décimal est équivalent àRs×2 +x−y=Re+S.
Les fonctions booléennesSetRspour le soustracteur s’expriment sous forme
algébrique par :
S(x,y,Re) =x⊕y⊕Re
Rs(x,y,Re) =
x·y+x⊕y·Re
On obtient donc pourSla même formule que pour l’additionneur.
## 9.7 Il est possible d’exprimer les portes logiques sous forme de formules arithmé-

tiques. Considérons deux variables entièresxetyqui prennent leur valeurs dans
l’intervalle[0,1]. Alors, les portes logiques de base peuvent s’exprimer ainsi :
•not(x) = 1−x
•or(x,y) =x+y−(x×y)
•and(x,y) =x×y
•xor(x,y) =x+y−(2×x×y)
Pour évaluer des expressions booléennes en C, on peut utiliser les opérateurs
classiques comme&&(and),||(or), associés aux booléens ou les opérateurs binaires
&,|. Il est également possible de passer par les expressions arithmétiques :
1int (int ) return -x;
3int (int ,int ) return +y-x*y;
5int (int ,int ) return *y;
7int (int ,int ) return +y-2*x*y;
9int (int ,int ,int ) return (x,or2(y,z))
11int (int ,int ,int ) return *y*z;
Ainsi pour obtenir la table de vérité de la fonction booléennef(x,y,z) =
x.y.z+
x.y.z+x.y.z+x.y.z, on pourra écrire le code suivant :
1for(int =0;i<8; i)
2 int =i&4) 2;
3 int =i&2) 1;
4 int =i&1;
6 int =or2(and3(not1(x),y,not1(z)),and3(x,not1(y),not1(z)));
7 int =or2(and3(x,y,not1(z)),and3(not1(x),not1(y),not1(z)));
8 int =or2(v1,v2);
9 cout<<x<<" "<<y<<" "<<z<<" : "<<f<<endl;
10}
## 9.8 Dans cette section nous tentons de montrer le lien qui existe entre logique

propositionnelle et algèbre de Boole en nous basant sur le problème des pigeons.
### 9.8.1 On s’intéresse au problème des pigeons, également appelétiroirs et chaussettes,

qui est finalement un problème d’affectation ou de mise en correspondance ou
d’injection, c’est à dire que tout élément de l’espace d’arrivée possède au plus un
antécédent.
Problème des pigeons
Etant donnénpigeons etqpigeonniers, chaque pigeon devant trouver un
pigeonnier et un pigeonnier ne pouvant accueillir qu’au maximum un seul
pigeon, restera t-il des pigeons sans pigeonnier?
9.8. ALGÈBRE DE BOOLE ET LOGIQUE 279
Ce problème est très simple à résoudre du point de vue des mathématiques
puisqu’il suffit quen≤q pour qu’il ait une solution et que toute permutation d’une
solution est également une solution.
### 9.8.2 Pour modéliser le problème en logique propositionnelle, il faut utiliser un

ensemble de variables propositionnelles et exprimer des clauses entre les variables.
On rappelle qu’une clause est une disjonction de variables propositionnelles, ces
dernières sont donc séparées par le symbole∨qui correspond auou. Un problème
est alors un ensemble de clauses liées par le symbole∧qui correspond auet. Si le
problème possède une solution, on dit également qu’il estsatisfiable, alors toutes
les clauses sont interprétées à vrai.
On utilisera une matrice den×q variables propositionnelles pour représenter
le problème des pigeons :
X(n,q) =





x
1x
1. . . x
q
x
1x
2. . . x
q
.
.
.
.
.
.
x
nx
n. . . x
q
n





Si la variablex
j
iest àvraicela signifie que le pigeoniest dans le pigeonnierj.
Cela implique donc que les variablesx
i,...,x
j−1
i
,x
j+1
i
,...,x
q
i sont àfaux. En d’autres
termes, le pigeon étant dans le pigeonnierj, il ne peut pas être dans les autres
pigeonniers.
On doit donc exprimer deux types de contraintes :
•
contrainte de typeCtrL (sur les lignes) : un pigeon est dansun et unseul
pigeonnier
•
contrainte de typeCtrC (sur les colonnes) : un pigeonnier contientau plus
un pigeon, il peut donc ne pas en contenir sin < q
Dans le cas oun= 3etq= 3, le problème est modélisé comme suit, on renomme
les variables afin de faciliter l’écriture des clauses :
X(3,3) =


a b c
d e f
g h i

=


x
1x
1x
x
2x
2x
x
3x
3x


•le pigeon 1 est dans un seul pigeonnier (4 clauses) :
a∨b∨c
¬a∨ ¬b
¬a∨ ¬c
¬b∨ ¬c
•le pigeon 2 est dans un seul pigeonnier (4 clauses) :
d∨e∨f
¬d∨ ¬e
¬d∨ ¬f
¬e∨ ¬f
•le pigeon 3 est dans un seul pigeonnier (4 clauses) :
g∨h∨i
¬g∨ ¬h
¬g∨ ¬i
¬h∨ ¬i
•le pigeonnier 1 contient au plus un pigeon (3 clauses) :
¬a∨ ¬d
¬a∨ ¬g
¬d∨ ¬g
•le pigeonnier 2 contient au plus un pigeon (3 clauses) :
¬b∨ ¬e
¬b∨ ¬h
¬e∨ ¬h
•le pigeonnier 3 contient au plus un pigeon (3 clauses) :
¬c∨ ¬f
¬c∨ ¬i
¬f∨ ¬i
soit un total de 21 clauses pourn= 3etq= 3.
Le nombre de clauses générées est défini par la formule :
n×

1 +
q−1
X
i=1
i
!
+q×

n−1
X
i=1
i
!
Sin=q= 10, on génère910clauses.
9.8. ALGÈBRE DE BOOLE ET LOGIQUE 281
### 9.8.3 Pour résoudre ce problème en logique il faut utiliser un solveur ou un dé-

monstrateur automatique de théorème commeOtter(Organized Techniques for
Theorem-proving and Effective Research, [20]).
La méthode qui permet de résoudre le problème sous forme de clauses consiste
à appliquer la règle dite duPrincipe de Résolutiondéfinie parJohn Alan Robinson
[24].
A partir d’une clause qui possède une variable propositionnellepet une autre
clause qui possède la variable sous forme négative (¬p), on génère une nouvelle
clause :
p∨L ¬p∨M
L∨M
LetMétant des variables propositionnelles séparées par le symbole∨.
On applique cette règle entre toutes les clauses quand cela est possible. On va
donc générer un ensemble de plus en plus important de clauses à mesure que le
nombre de pigeons et de pigeonniers augmentent. Les nouvelles clauses ajoutées à
l’ensemble initial seront utilisées pour générer encore plus de clauses. Il se peut
que l’on génère plusieurs fois la même clause, dans ce cas, si elle existe déjà, on
ne l’ajoutera pas. On n’ajoutera pas également les tautologies qui sont de la forme
¬p∨p∨L, car dans ce cas¬p∨p= 1, il en résulte alors que1∨L= 1.
On terminera dans les deux cas suivants :
•
soit le problème possède des solutions, on dit qu’il estsatisfiable, et arrivera
un moment ou on ne générera pas de nouvelle clause
•
soit le problème n’a pas de solution, il estinsatisfiable, et on génèrera la
clause vide :
p¬p
⊥
Si le problème est insatisfiable c’est qu’on a pu générer à partir d’un sous-
ensemble de clauses la clause qui se résume à un seul littéralp, et qu’à partir d’un
autre sous-ensemble on a généré son contraire. Le problème est donc insatisfiable
car on ne peut affirmer une chose et son contraire.
Par exemple dans le cas oup= 3etq= 2, le problème n’a pas de solution et la
résolution se fait en 18 étapes. Voici la preuve trouvée par Otter :
---------------- PROOF ----------------
4 [] -p1_1| -p2_1.
5 [] -p1_1| -p3_1.
6 [] -p2_1| -p3_1.
7 [] -p1_2| -p2_2.
8 [] -p1_2| -p3_2.
9 [] -p2_2| -p3_2.
10 [] p1_1|p1_2.
11 [] p2_1|p2_2.
12 [] p3_1|p3_2.
13 [hyper,11,7,10] p1_1|p2_1.
14 [hyper,12,9,11] p2_1|p3_1.
15 [hyper,12,8,10] p1_1|p3_1.
16 [hyper,15,6,13] p1_1.
17 [hyper,16,5,14] p2_1.
18 [hyper,17,4,16] $F.
Les variablesx
j
isont renommées enpi_jcar Otter considère que le symbolexest
une variable du calcul des prédicats et non une variable du calcul propositionnel.
Otter utilise ici une règle appeléehyper-résolution(HR) qui est dérivée du
Principe de Résolution et on génère la clause vide, matérialisée par$F. Par exemple,
la clause 13 est obtenue par :
clause 10
p
1∨p
clause 7
−p
1∨ −p
clause 11
p
2∨p
(HR)
p
1∨p
1 −p
|{z}
∅
∨ −p
2 p
|{z}
∅
∨p
p
1∨p
A mesure quepetqaugmentent, le nombre de clauses augmente et la résolution
prend plus de temps. Si on prendp= 5etq= 4, Otter prouvera qu’il n’y a pas de
solution en 142 étapes.
### 9.8.4 Pour résoudre plus simplement ce problème, on peut le modéliser sous un autre

formalisme qui utilise des contraintes de cardinalité [6]
. Nous utilisons ici une
spécialisation de l’opérateur pour la logique :
#(α,β,{L})
oùαetβsont des entiers positifs ou nuls tels que0≤α≤β etLest une liste de
variables booléennes. La contrainte signifie qu’au minimumαet au plusβvariables
deLsont vraies.
. Opérateur introduit dans le cadre de la Programmation Logique avec Contraintes par Pascal
Van Hentenryck et Yves Deville en 1991.
9.8. ALGÈBRE DE BOOLE ET LOGIQUE 283
On modélise alors le problème par une matrice de variables booléennesX(n,q) ,
telles quex
j
i
= 1signifie que le pigeoniest dans le pigeonnierj. Le problème des
pigeons s’exprime alors par deux types de contraintes :
•un pigeon est dans un et un seul pigeonnier (contrainte de typeCtrL) :
#(1,1,{x
1,...,x
q
1})
...
#(1,1,{x
n,...,x
q
n})
•un pigeonnier accueille au plus un pigeon (contrainte de typeCtrC) :
#(0,1,{x
1,...,x
n})
...
#(0,1,{x
q
1,...,x
q
n})
#### 9.8.5 #(1,1)et#(0,1)

A quoi correspondent les contraintes#(0,1,{L}) et#(1,1,{L}) et peut-on les
traduire en calcul propositionnel?
Par exemple pour la contrainte#(1,1,{x,y,z}) , on peut utiliser une table de
vérité et modéliser la contrainte de cardinalité sous forme d’une fonction booléenne
cc(x,y,z):
Lignexyzcc(x,y,z)
0 0 0 0 0
1 0 0 1 1
2 0 1 0 1
3 0 1 1 0
4 1 0 0 1
5 1 0 1 0
6 1 1 0 0
7 1 1 1 0
On a donccc(x,y,z) = 1 pour les lignes1,2et4de la table de vérité car cela
correspond aux cas où seule l’une des variables est à1parmix,yetz. On obtient
alors l’expression de la fonction :
cc(x,y,z) =x.y.z+x.y.z+x.y.z
Il s’agit la d’une somme de produits, en logique propositionnelle on parle
de disjonctions (+) de conjonctions (.). Or les clauses sont des conjonctions de
disjonctions et donc, si on veut obtenir des clauses, on doit prendre la négation
du complémentaire decc(x,y,z) soit
cc(x,y,z)
. On va donc dans un premier temps
simplifier
cc(x,y,z)puis en prendre le complémentaire.
On peut réaliser la simplification de manière algébrique mais elle prend plus de
temps que la méthode du tableau de Karnaugh. Il s’agit du tableau de la Figure
vue précédemment.
cc(x,y,z) =x·y·z+y·z+x·z+x·y
= (x+y+z)·(y+z)·(x+z)·(x+y)
Un contrainte de cardinalité#(1,1,{L}) ouCard(L) =k , remplace donc1 +
P
k−1
i=1
i
clauses, ce qui est très avantageux, et cette même contrainte de trois
variables est équivalente en logique à :
(x∨y∨z)∧(¬y∨ ¬z)∧(¬x∨ ¬z)∧(¬x∨ ¬y)
### 9.8.6 On peut vérifier la consistance (ou l’inconsistance) du problème en utilisant un

système de déduction comme celui de [23] (cf. pages 80 et 81). On utilise la règle
d’extension(Ext)définie ainsi :
#(α1,β1,{L1}) #(α2,β2,{L2})
#(α1+α2,β1+β2,{L1∪L2})
On remplace deux contraintes de cardinalité par une seule en faisant en quelque
sorte la somme des deux contraintes initiales. Pour cela, il est généralement préfé-
rable de faire en sorte queL1∩L2=∅.
Si on applique la règle(Ext) sur l’ensemble des contraintes liées àCtrL, puis
sur l’ensemble des contraintes liées àCtrC, on obtient respectivement :
•un pigeon est dans un et un seul pigeonnierCtrL:
#(n,n,{X(n,q)})
•un pigeonnier accueille au plus un pigeonCtrC:
#(0,q,{X(n,q)})
Le problème se résume donc à ces deux contraintes. La règle d’inconsistance
(Inc1) permet de déduire rapidement si le problème possède ou pas une solution.
Cette règle stipule que si on dispose de deux contraintes de cardinalité sur le
même ensemble de variables alors on a une inconsistance (donc pas de solution) si
l’intersection des intervalles[α1,β1]et[α2,β2]est vide :
9.8. ALGÈBRE DE BOOLE ET LOGIQUE 285
[α1,β1]∩[α2,β2] =∅
#(α1,β1,{L}) #(α2,β2,{L})
⊥
Et c’est bien le cas pour ce problème :
•
sin > qle problème n’a pas de solution et l’intersection des intervalles est
vide, la règle d’inconsistance peut être appliquée et son résultat (⊥) indique
que le problème n’a pas de solution
•
par contre sin≤q, l’intersection des intervalles est non vide, la régle ne sera
pas appliquée et le problème possède des solutions
### 9.8.7 Il est tout à fait envisageable de créer un solveur en logique qui se base sur les

contraintes de cardinalité. Toute clause de la formex1∨. . .∨xn peut être traduite
par une contrainte de la forme :
#(1,n,{x1, . . . ,xn})
L’intérêt des contraintes de cardinalité est qu’elles nous permettent de déduire la
valeur de certaines variables booléennes. Par exemple dans le cas des pigeons, dès
qu’une variable d’une contrainte#(1,1,{L}) ou#(0,1,{L}) est vraie (donc égale à
un), on peut en déduire que toutes les autres variables deLdoivent être affectées
à la valeur 0.
A titre de comparaison, voici, Table, quelques résultats sur un AMD Ryzen 5
3600 concernant la recherche de toutes les solutions du problème des pigeons avec
deux solveurs très simples : le premier gère des clauses et le second des contraintes
de cardinalité. Dans le cas des contraintes de cardinalité, on utilise la déduction
des valeurs des variables comme évoqué au paragraphe précédent.
Nombre deNombre deNombre de Solveur Solveur Facteur
PigeonsPigeonniersSolutionsClausesContraintesd’Amélioration
n q Temps (s)Temps (s)
10 10 3628800 428 7 ×61
10 9 0 44 0,7 ×62
11 11 39916800 6728 87 ×77
11 10 0 644 7 ×92
TABLE9.8– Temps de résolution en secondes de deux solveurs pour le problème des
pigeons
La première, deuxième et troisième colonnes de la Table
vement le nombre de pigeons, de pigeonniers et le nombre de solutions trouvées.
Dans le cas de problèmes insatisfiables, on n’a aucune solution. Les colonnes quatre
et cinq donnent le temps de résolution en secondes avec un solveur simple basé sur
des clauses et un solveur avec contraintes de cardinalité. Enfin, la dernière colonne
indique le facteur d’amélioration qui est défini comme le rapport entre le temps
de résolution avec le solveur à base de clauses et le temps de résolution avec le
serveur à base de contraintes.
Il est indéniable que l’utilisation des contraintes de cardinalité apporte un gain
substantiel lors de la résolution du problème. Dans le cas où le problème ne possède
pas de solution, le temps de résolution avec le solveur à base de contraintes de
cardinalité pour10pigeons et9pigeonniers est de0,7seconde, soit un facteur
d’amélioration de44/0,7 = 62 . On prend donc62fois moins de temps pour résoudre
le problème. A mesure que le nombre de pigeons et pigeonniers augmentent, le
facteur d’amélioration augmente également.
## 9.9 Au travers de ces deux exemples que sont les circuits électroniques comme

l’additionneur et la résolution du problème des pigeons en logique, nous avons vu
comment l’algèbre de Boole pouvait nous aider à simplifier certaines expressions
algébriques. Pour les circuits électroniques, nous pouvons diminuer le nombre
de portes logiques nécessaires à leur implantation sur le silicium. Concernant
la logique, on peut créer un solveur assez simple basé sur les contraintes de
cardinalités ou sur des clauses mais les contraintes de cardinalités, dans le cas de
problèmes structurés comme les pigeons ou le problème de Ramsey
vont permettre
de simplifier la recherche en déduisant les valeurs à affecter à de nombreuses
variables.
## 9.10 Exercice 39 -Démontrez algébriquement les égalités suivantes :

(a)
Y Z+YZ+Y Z+Y·Z= 1
(b)AB+AB+A·B=A+B
(c)A+AB+AC+A·B·C=A+B+C
(d)AB+A·C·D+A·BD+A·B·C·D=A·C·D+B
(e)XY+XZ+Y Z=XY+XZ
(f)X+XY=X+Y
Exercice 40 -Simplifiez les expressions suivantes :
. Le problème de Ramsey, d’après Frank Ramsey mathématicien, économiste et logicien anglais
(1903 - 1930) consiste à colorier les arcs d’un graphe complet à l’aide de trois couleurs sans qu’il
n’existe de triangle monochromatique.
(a)ABC+ABC+AB
(b)(A+B)(A+B)
(c)(A+B+AB)(AB+AC+BC)
(d)X+Y(Z+X+Z)
(e)WX(Z+Y Z) +X(W+WY Z)
Exercice 41 -Simplifiez les fonctions suivantes à l’aide d’un tableau de Karnaugh
(a)F(X,Y,Z) = (1,3,6,7)
(b)G(X,Y,Z) = (0,3,4,5,7)
(c)H(A,B,C,D) = (1,5,9,12,13,15)
Nous décrivons dans le reste de cette section quelques exercices qui demandent
une certaine maîtrise de la programmation en C/C
++. Ils sont réservés au program-
meur expérimenté.
Exercice 42 -Ecrire un programme appelépigeon_hole_generator.exequi prend
en paramètres le nombre de pigeons, le nombre de pigeonnier ainsi que la méthode
de génération. On génèrera le problème sous forme de clauses ou de contraintes de
cardinalité. Lors de la génération du problème on donnera le nombre de variables
propositionnelle ainsi que le nombre de clauses ou le nombre de contraintes. Ainsi
pour trois pigeons et trois pigeonniers, on obtient pour les clauses :
clauses
9 21
3 1 2 3
2 -1 -2
2 -1 -3
2 -2 -3
3 4 5 6
2 -4 -5
2 -4 -6
2 -5 -6
3 7 8 9
2 -7 -8
2 -7 -9
2 -8 -9
2 -1 -4
2 -1 -7
2 -4 -7
2 -2 -5
2 -2 -8
2 -5 -8
2 -3 -6
2 -3 -9
2 -6 -9
Ici, on a 9 variables propositionnelles numérotées de 1 à 9 et 21 clauses. Chaque
clause est décrite par le nombre de variables qui la composent, puis le numéro des
variables, précédées du signe-si elle apparaît dans clause sous forme négative (¬).
Sous forme de contraintes de cardinalité, on aura :
constraints
9 6
1 1 3 1 2 3
1 1 3 4 5 6
1 1 3 7 8 9
0 1 3 1 4 7
0 1 3 2 5 8
0 1 3 3 6 9
On obtient 9 variables, 6 contraintes. Chaque contrainte est décrite par le
nombre minimum et maximum de variables à vrai, puis le nombre de variables et
la liste des variables.
Exercice 43 -Ecrire un programme appeléclauses_solver.exequi prend en
paramètre un fichier qui contient un ensemble de clauses et résoud le problème de
manière récursive en tentant d’instancier la prochaine variable à vrai, puis à faux.
Initialement les variables sont non instanciées.
Exercice 44 -Ecrire un programme appeléconstraints_solver.exequi prend
en paramètre un fichier qui contient un ensemble de contraines de cardinalité
et résoud le problème de manière récursive en tentant d’instancier la prochaine
variable à vrai, puis à faux. On pourra mettre en place la déduction en vérifiant que
si le nombre de variables à vrai est égal au nombre maximum (β) alors toutes les
autres variables non instanciées sont positionnées à faux.
