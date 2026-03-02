# Chapitre 6 : Appeldesous-programme Aux cieux, les dieux,

Appeldesous-programme
Aux cieux, les dieux,
Baptisent des dissidents belliqueux.
## 6.1 Dans ce chapitre nous allons voir comment réaliser l’appel de sous-programme

en 32 et 64 bits. Malheureusement les conventions d’appel dans ces deux archi-
tectures sont très différentes sous Linux et elles différent également entre Linux
et Windows. Il faut donc soit penser méticuleusement au choix des registres si on
désire écrire du code en 32 bits pour ensuite passer au 64 bits ou revoir entièrement
son code.
## 6.2 Regardons dans un premier temps comment est réalisé l’appel de sous-programme

en 32 bits.
### 6.2.1 Lorsque l’on appelle un sous-programme en 32 bits on passe les paramètres dans

la pile. La pile est une partie de la mémoire centrale qui sert d’espace de stockage
et, en réalité, il existe plusieurs piles. Chaque programme se voit attribuer une
pile. Lorsque l’on bascule d’un programme à un autre on réalise un changement de
contexte et on doit mettre à jour les différents registres pour qu’ils soient conformes
à l’état dans lequel ils étaient avant de basculer vers un autre programme. La pile
permet de garder trace des appels de sous-programmes, de passer les paramètres
des sous-programmes et de créer des variables locales à un sous-programme.
En architecture 32 bits, le segmentsscontient l’adresse du début de la pile et
Le sommet de pile se trouve dans le registreesp. On utilise le registreebpafin de
récupérer les paramètres placés dans la pile.
Sous Linux, la pile d’un programme possède une taille de8Mo qui peut être
éventuellement redéfinie. On peut obtenir la valeur de cette taille initiale de la pile
grâce à la commandeulimit -adans le terminal.
Les deux instructions principales utilisées pour manipuler la pile sontpushet
popmais les instructionscalletretagissent également sur celle-ci.
#### 6.2.1.1 L’instructionpushconsiste à mettre la valeur d’un registre, un emplacement mé-

moire ou une constante dans la pile. Cependant la pile possède un fonctionnement
différent et spécifique par rapport à une pile que l’on pourrait implanter soi-même.
La pile est un tableau d’octets que l’on remplit par le haut et non par le bas comme
on le ferait classiquement.
Par exemplepush , consiste àabaisserle sommet de pile puis y écrire la
valeur contenue danseaxce qui se résume en fait aux deux instructions suivantes :
1 sub ,4
2 mov [esp],eax
On soustrait ici4octets àespcareaxest un registre 32 bits.
#### 6.2.1.2 L’instructionpopfonctionne de manière inverse. Par exemplepop , lit la

valeur en sommet de pile et la stocke danseaxpuisremontele sommet de pile :
1 mov ,esp]
2 add ,4
#### 6.2.1.3 Il existe d’autres instructions pour empiler et dépiler des informations dans la

pile, dont notamment :
•pusha
place dans la pile l’ensemble des registres généraux 16 bits (ax,cx,dx,
bx,sp,bp,si,di)
•pushad
place dans la pile l’ensemble des registres généraux 32 bits (eax,ecx,
edx,ebx,esp,ebp,esi,edi)
•pushfplace dans la pile le registre 16 bits flags
6.2. APPEL DE SOUS-PROGRAMME EN 32 BITS 193
•pushfdplace dans la pile le registre 32 bits eflags
Bien entendu, on dispose des instructionspopa,popad,popfetpopfdqui réa-
lisent les opérations inverses.
### 6.2.2 L’appel de sous-programme en 32 bits est l’un des concepts des plus difficiles à

appréhender lorsque l’on apprend l’assembleur car il fait appel à diverses notions
et conventions. Lors de l’appel d’un sous-programme, on distingue :
•
le sous-programmeappelant(un autre sous-programme) qualifié decalleren
anglais
•du sous-programmeappelé(par l’appelant) qualifié decallee
Pour réaliser l’appel de sous-programme, on procède de la manière indiquée
Table, qui consiste à suivre la convention d’appel du langage C sous Linux.
Sous-programme appelant Sous-programme appelé
(Caller) (Callee)
1placer les paramètres dans la pile dans
l’ordre inverse de la définition du
sous-programme
2 appel du sous-programme grâce à
l’instruction (call)
3 entrée dans le sous-programme :
sauvegarde deebp, mise à jour deebp
4 récupération des paramètres grâce à
ebp
5 Exécution du sous-programme
6 sortie du sous-programme : mise à
jour deesp, restauration deebp
7suppression des paramètres mis dans
la pile à l’étape 1
TABLE6.1 – Appel de sous-programme en 32 bits convention du langage C
### 6.2.3 La convention d’appel en 32 bits en langage C impose que le sous-programme

appelé ne modifie pas certains registres. Ces registres sontebp,ebx,esietedi. Il
est donc nécessaire, une fois entré dans le sous-programme appelé, desauvegarder
ces registres dans la pilesi on a l’intention de les modifier. Il faudra par la suite
les dépiler afin de restaurer leur contenu avant de sortir du sous-programme. Les
registres qui peuvent être modifiés sont donceax,ecxetedx.
La conséquence de cela est que si on écrit du code assembleur qui appelle une
fonction de la librairie C, on doit garder à l’esprit queeax,ecxetedxpourront être
modifiés. Il ne faudra pas stocker de données qui doivent être réutilisées après
l’appel du sous-programme ou alors il faudra les sauvegarder dans la pile, puis les
restaurer.
Afin de se rappeler des registres qui sont modifiables ou non modifiables,
les deux vers qui figurent en préambule de ce chapitre, représentent un moyen
mnémotechnique intéressant :
AuX CieuX, les DieuX,
BaPtisent des DIsSIdents BelliqueuX.
Il fait apparaître :
•
sur la première ligne les registres modifiables :ax,cx,dx(et par extension
eax,ecx,edx)
•
et sur la seconde ceux qu’il faut préserver :bp,di,si,bx(et par extension
ebp,edi,esi,ebx)
### 6.2.4 Lorsqu’un sous-programme retourne une valeur il doit le faire en suivant la

convention du langage C :
•
s’il s’agit d’une valeur entière (entier, pointeur), on la place dans le registre
eax
•
s’il s’agit d’un nombre à virgule flottante, on le place dansst0le sommet de
pile du coprocesseur (cf. Chapitre)
### 6.2.5 Prenons un exemple simple avec le programme suivant :

6.2. APPEL DE SOUS-PROGRAMME EN 32 BITS 195
1int (int ,int )
2 int ;
3 r=a+b;
4 return ;
5}
7int ()
8 sum(4,5);
9}
Lecaller(main) appelle lecallee(sum) qui retourne une valeur entière mais que
la fonctionmainn’utilisera pas, ceci afin de simplifier le code que nous allons écrire.
Nous allons réaliser une traduction très terre à terre de cet exemple afin de montrer
tout ce qui doit être réalisé. Pour cela, nous utiliserons, dans la fonctionsum, le
registreeaxpour représenteraetebxpour représenterb.
#### 6.2.5.1 Traduisons dans un premier temps le sous-programmemain(cf. Listing). Il

consiste à passer les paramètres dans la pile. On peut le faire ici de deux manières
différentes puisqu’il s’agit de constantes entières : soit on met la constante dans
un registre et on empile le registre (lignes 2 et 3 du code qui suit), soit on empile
directement la constante (ligne 4). Dans ce dernier cas il faut préciser sur combien
d’octets on code la valeur4. Etant donné qu’il s’agit d’un entier sur 32 bits, on
utilise le préfixedwordpourdouble word.
On réalise ensuite l’appel du sous-programmesumgrâce à l’instructioncall.
Cela a pour effet de stocker dans la pile l’adresse de retour du sous-programme,
c’est à dire l’adresse de l’instruction située juste aprèscall, c’est à dire la ligne 6.
Nous verrons pourquoi, ci-après, nous appelons l’instructionadd ,8 en
ligne 6 après être sorti du sous-programme.
1main:
2 mov ,5 ; place dans la pile le second parametre
3 push
4 push ; place le premier parametre
5 call ; appel du sous-programme
6 add ,8 ; supprime les parametres
7 ret
Listing 6.2.1 – Appelant en 32 bits
Convention : ordre des paramètres
Par convention en C (en architecture 32 bits), on place le dernier paramètre
du sous-programme appelé en premier dans la pile et le premier paramètre
du sous-programme en dernier dans la pile.
Pour notre exemple, on commence donc par le paramètre le plus à droite (5) et
on termine par le plus à gauche (4).
6.2.5.2
Traduisons dans un second temps le sous-programmesumqui figure Listing.
1sum:
2 push ; entrée dans le sous-programme
3 mov ,esp ;
4 sub ,4 ; création de la variable'r'
5 push ; sauvegarde de ebx
7 mov ,ebp+8] 'a'
8 mov ,ebp+12] 'b'
9 add ,ebx ; calcul du résultat
10 mov[ebp-4],eax ; stockage du résultat dans'r'
12 mov ,ebp-4]
14 pop ; restauration de ebx
15 mov ,ebp ; sortie du sous-programme
16 pop
17 ret
Listing 6.2.2 – Appelé en 32 bits
L’entrée dans la fonctionsumconsiste à réaliser les trois étapes suivantes :
1.
la première étape est l’entrée dans le sous programme (lignes2et3), elle
consiste à sauvegarderebppuisque celui-ci va être utilisé pour accéder aux
paramètresaetbainsi que la variable localer, puis on affecte àebpla valeur
deesp
2.
on crée ensuite les variables locales si cela est nécessaire en réservant de
l’espace dans la pile, ici il s’agit de la variablerqui est un entier 32 bits, soit
4octets, on abaisse donc le sommet de pile de4octets (ligne4)
3.
on sauvegarde les registres dont la valeur doit être préservée pour la procé-
dure appelante, ici c’est le cas pourebxen ligne5qui sera utilisé pour stocker
le paramètreb
6.2. APPEL DE SOUS-PROGRAMME EN 32 BITS 197
Le rôle du registreebpest primordial car c’est lui qui permet d’accèder aux
paramètres et aux variables locales dès lors que l’on écritmov ,esp en ligne3.
On peut voir Figure ebpet les paramètres.
FIGURE6.1 – Etat de la pile après entrée dans le sous-programme appelé
A l’intérieur de la fonctionsum:
•le premier paramètre (a) est en[ebp + 8]
•le second paramètre (b) est en[ebp + 12]
•
par extension lenième paramètre, s’il est défini, est situé à l’adresse[ebp +
4×(n+ 1)]
•
les variables locales sont stockées en[ebp - x]oùxdépend du nombre de
variables et de leurs types
Taille des paramètres
Que le paramètre soit un octet ou un mot, on le stockera sur 32 bits. S’il s’agit
d’une chaîne de caractères ou d’un tableau on passera son adresse sur 32 bits.
S’il s’agit d’une valeur 64 bits elle occupera 2 fois 32 bits.
On éxécute ensuite le corps de la fonction : on place le paramètreadanseax,
puisbdansebx(lignes7et8). On additionne ensuiteebxàeaxet on stocke le
résultat dansr(lignes9et10).
La sortie de la fonction consiste à faire dans l’ordre inverse ce que l’on a fait lors
de l’entrée (voir Figure) :
FIGURE6.2 – Sortie du sous-programme appelé
1.
on récupère le résultat, comme il s’agit d’une fonction entière on le place dans
eax(ligne12)
2. ebxqui a été sauvegardé (ligne14)
3.
on rétablitespà sa valeur quand on est entré dans la fonction (ligne15) puis
on restaureebp(ligne16)
4.
enfin on exécute l’instructionretqui récupère l’adresse de retour du sous-
programme et exécutera l’instruction à cette adresse dans le sous-programme
main

> **Attention** : variable locale non supprimée
>
Il faut remarquer que l’on n’a pas supprimé la variable localerqui avait
été créée par unsub ,4 . Cela n’est pas nécessaire car l’étape 3 (de la
fonctionsum) qui consiste à rétabliresple fait automatiquement.
On notera que la ligne12n’est pas utile puisque le résultat est déjà danseaxet,
de plus, la variable localerest également inutile puisque les calculs sont réalisés
avec les registreseaxetebx. On notera que pour améliorer le temps d’exécution de
la fonction, on pourrait également remplacerebxparecxcarecxest un registre
modifiable et il n’est alors pas nécessaire de le sauvegarder puis le restaurer comme
on l’a fait avecebx.
6.2. APPEL DE SOUS-PROGRAMME EN 32 BITS 199
#### 6.2.5.3 Les paramètres mis dans la pile dans le sous-programmemaindoivent être

supprimés car si ce n’était pas le cas on risquerait de saturer la pile. La manière la
plus simple pour réaliser cela consiste à remonter le sommet de pile du nombre
d’octets qui correspondent à l’espace occupé par les paramètres. En l’occurrence, on
a placé deux entiers 32 bits dans la pile, donc2×4octets, on doit donc remonter
le sommet de pile de8octets.
La convention du langage C impose que ce soit le sous-programme appelant
qui supprime les paramètres. C’est pourquoi dans le code du sous-programmemain
nous avons placé une instructionadd ,8, juste après lecall.
Dans un langage comme le Pascal c’est l’inverse, c’est le sous-programme appelé
qui supprime les paramètres. Dans le cas présent nous devrions écrire en Pascal
une instructionret , pour quitter le sous-programmesum. La valeur qui suitret
est forcément une constante. Nous faisons la même chose en langage C mais en
reportant la suppression des paramètres dans la fonction appelante.
Pourquoi le langage C utilise t-il la convention qui impose au sous-programme
appelant de supprimer les paramètres? La réponse est simple, en C on a la possibilité
de créer des fonctions qui peuvent prendre un nombre quelconque de paramètres
comme par exempleprintf. Etant donné que le sous-programme appelé ne connait
pas le nombre de paramètres on ne peut pas utiliser l’instructionretavec une
valeur constante prédéfinie puisqu’elle varie en fonction du nombre de paramètres.
Par contre le sous-programme appelant sait combien de paramètres il a mis dans la
pile et il est donc en mesure de les supprimer.
Tout ceci peut paraître complexe mais il s’agit d’une mécanique très simple et il
suffit de suivre à la lettre les règles que nous venons de voir.
### 6.2.6 L’entrée dans un sous-programme et la sortie peuvent être réalisées également

grâce à deux instructions assembleur nomméesenteretleave:
1 push ; enter 4, 0
2 mov ,esp ;
3 sub ,4 ;
5 mov ,ebp ; leave
6 pop ;
7 ret
L’instructionenterremplace les lignes1et3du code précédent etleaveles
lignes5et6. On pourra se référer à [19] pour de plus amples informations quant à
ces instructions.
#### 6.2.7 fast call)

La manière dont on appelle classiquement un sous-programme est de typecdecl,
c’est à diredéclaration du langage C. Il existe en 32 bits la possibilité d’appeler
un sous-programme en utilisant un appel dit rapide, en anglaisfast call. Un appel
rapide signifie que l’on passe les paramètres dans les registres plutôt que de les
passer dans la pile.
La raison derrière tout cela est qu’utiliserebppour accéder aux paramètres est
pénalisant pour deux raisons :
•
la première est que le sous-programme appelant place une première fois les
paramètres dans la pile
•
la seconde est que le sous-programme appelé relit les paramètres depuis
la pile et utilise plusieurs instructions (push ;mov ,ebp , etc.) qui
servent uniquement à la relecture
Tout cela est finalement pénalisant et source de ralentissement. Lors d’unfastcall
les données sont passées en 32 bits dans les registresecxetedxrespectivement. Si
un sous-programme dispose de plus de deux paramètres, les premiers paramètres
sont placés dans les registres évoqués et le reste des paramètres est placé dans la
pile.
Si on désire écrire une fonction avec appel rapide en assembleur et l’appeler
depuis un code source en langage C ou C
++, il faut préciser dans le fichier C que la
fonction est externe (c’est à dire définie dans un autre fichier) et qu’elle est de type
fastcallgrâce à la directive__attribute__:
1// en C
2extern (int ,int )__attribute__((fastcall));
4// en C++
5extern {
6 int (int ,int )__attribute__((fastcall));
7}
Il existe également une autre possibilité afin d’améliorer l’efficacité des sous-
programmes qui consiste à ne pas utiliserebpmais à utiliser directementesp. C’est
généralement ce que font les compilateurs lorsqu’ils génèrent du code optimisé.
Malheureusement cela se révèle très compliqué à gérer lorsque l’on écrit soi-même
de l’assembleur car dès qu’on place des données dans la pile, l’accès aux paramètres
est décalé et il faut garder trace constamment de l’adresse des paramètres.
6.3. APPEL DE SOUS-PROGRAMME EN 64 BITS 201
## 6.3 Afin d’écrire des fonctions en assembleur et de pouvoir les interfacer avec un

programme C il est nécessaire de définir une convention d’appel, tout comme en 32
bits. Cette convention indique comment passer les paramètres aux sous-programmes
appelés, quels registres devront être préservés dans les sous-programmes appelés
et comment retourner les résultats. Il existe différentes conventions d’appel en 64
bits comme celle de Microsoft. En ce qui concerne Linux, on utilise la convention
System V AMD64 ABIet c’est bien entendu celle que nous allons décrire ici.
Paramètre 64 bits 32 bits 16 bits 8 bits
1 rdi
2 rsi
3 rdx
4 rcx
5 r8
6 r9
TABLE6.2 – Ordre des registres entiers utilisés pour la convention d’appel C sous Linux
•
la première différence avec la convention d’appel 32 bits est que les para-
mètres sont placés dans des registres et non dans la pile, il s’agit donc d’appels
de typefastcall, cependant, s’il n’y a pas assez de registres on utilise la pile
comme en 32 bits
•
pour les paramètres entiers on dispose de 6 registresrdi,rsi,rdx,rcx,r8,
r9(cf. Table) que l’on utilise dans l’ordre indiqué
•
les paramètres pour les nombres à virgule flottante sont passés dans la partie
basse des registresxmm0àxmm7(cf. Chapitre)
•pour retourner une valeur entière, on la place dansrax
•pour retourner un flottant, on le place dans la partie basse dexmm0
•
les registres qui ne doivent pas être modifiés par le sous-programme appelé
sontrbp,rbx,r12àr15
On remarque donc qu’il y a un maximum de 14 paramètres (6 entiers, 8 réels)
qui peuvent être passés dans des registres avec la convention d’appel 64 bits sous
Linux.
### 6.3.1 Pour entrer dans une fonction on peut procéder comme en 32 bits en sauve-

gardantrbppuis en positionnantrbpsurrspet lors de la sortie on effectuera les
opérations inverses :
1 push
2 mov ,rsp
3 ...
4 mov ,rbp
5 pop
6 ret
Néanmoins si tous les paramètres d’un sous-programme sont placés dans des
registres cela n’a aucune utilité et on peut donc faire l’économie de quatre instruc-
tions.
### 6.3.2 En 64 bits, sous Linux, il est convenu que la zone mémoire de 128 octets située

dans la pile de[rsp-128]à[rsp], juste après l’appel d’un sous-programme, et que
l’on qualifie dered zone, ne sera pas modifiée par les interruptions. On peut donc
l’utiliser pour stocker temporairement des valeurs à condition de ne pas faire de
pushou decallcar ces instructions vont modifier cette zone. Notons que sous
Windows cette zone n’est pas disponible.
6.3.3
Les adresses doivent être précisées en utilisant les registres 64 bits uniquement.
La manipulation de la pile par l’intermédaire depushetpopimpose également
d’utiliser des registres de 64 bits.
### 6.3.4 On considère la fonction C suivante qui calcule la somme des élémentsti/ad’un

tableautavecaqui est une constante :
1float (float*t,int ,float )
2 float =0;
3 for(int =0;i<n; i)
4 s=s+t[i] a;
5 }
6 return ;
7}
Nous donnons ci-après la traduction selong++du code précédent en Listing
avec option d’optimisation-O2.
D’après ce que nous avons vu précédemment, lors de l’entrée dans le sous-
programme le premier paramètretest placé dansrdi, la taille du tableaunest
dansrsiet la constanteaest dansxmm0. On note que l’on jongle entre les registres
6.3. APPEL DE SOUS-PROGRAMME EN 64 BITS 203
1sum:
2 test ,esi ; si n == 0 alors sortir
3 jle ; du sous-programme
4 lea ,rsi+1]
5 pxor ,xmm2 ; s = xmm2 = [0, 0, ... 0]
6 lea ,rdi+rax*4+4]
7.L3: ; en fait rax = tab + n*4
8 movss ,rdi]
9 add ,4 ; ++tab
10 divss ,xmm0 ; xmm1.ps[0] /= a
11 addss ,xmm1 ; s += xmm1.ps[O]
12 cmp ,rax ; si &t[i] < &tab[N] alors boucler
13 jne
14 movaps ,xmm2 ; résultat placé dans xmm0
15 ret
16.L4:
17 pxor ,xmm2 ; résultat mis à 0
18 movaps ,xmm2 ; et placé dans xmm0
19 ret
Listing 6.3.1 – Traduction en 64 bits de la fonction sum
32 bits et 64 bits. Par exemple la taille du tableau est un entier de typeintdonc 32
bits, il n’est donc pas nécessaire de considérer cette valeur comme une valeur 64
bits et par conséquent on se cantonne à utiliseresi.
Décrivons à présent le comportement de ce sous-programme. Les lignes 2 et 3
vérifient que la taille est bien supérieure à 0, si ce n’est pas le cas on saute en.L4
pour mettrexmm0à 0 et sortir du sous-programme. Etrangement la mise à 0 utilise
deux instructions (lignes 17 et 18) alors qu’une seule instructionxorps ,xmm0
aurait suffit. En ligne 4, on calcule danseaxle résultat dersi - 1, c’est à diren-1.
De même que précédemment, on aurait pu écrirelea ,esi-1].
En ligne 5, on metxmm2, qui représentesà 0. On remarque qu’on a utilisé
pxorqui est normalement destinée aux entiers et qu’il aurait fallu utiliserxorps
destinée aux valeurs flottantes, mais les deux instructions produisent au final le
même résultat à savoir mettre l’ensemble des bits du registre SSE à 0.
En ligne 6, on calcule l’adresse de fin du tableau c’est à direrdi+rsi*4 ,
cependant on réalise le calcul en deux étapes (lignes 4 et 6) et on calcule :
rdi+rax
|{z}
rsi−1
∗4 + 4
que l’on stocke dansrax, ce qui est inutile puisqu’au final :
rdi+rax∗4−4 =rdi+ (rsi−1)∗4 + 4 =rdi+rsi∗4−4 + 4 =rdi+rsi∗4
On notera que l’adresse du dernier élément du tableau est&t[n-1]et l’adresse
de fin du tableau est&t[n], c’est à dire l’adresse du dernier élément du tableau
plus4octets.
Les lignes 7 à 13 réalisent la boucleforen utilisantxmm1pour chargert[i].
On augmenterdide 4 octets à chaque itération de boucle pour passer au flottant
suivant jusqu’à avoir atteintraxqui est l’adresse de fin du tableau.
Enfin, lignes 14 à 15, on met le résultatsstocké dansxmm2dansxmm0qui est le
registre qui contient la valeur de retour de la fonction (puisqu’il s’agit d’une valeur
en virgule flottante), puis on sort du sous-programme.
Nous avons noté beaucoup de bizzareries dans cette traduction automatique et
on peut la réécrire de manière plus concise comme présenté Listing.
1sum:
2 xorps ,xmm2 ; s = 0
3 test ,esi ; si n <= 0 alors sortir
4 jle ; du sous-programme
5 lea ,rdi+rsi*4]
6.while:
7 movss ,rdi]
8 add ,4 ; ++tab
9 divss ,xmm0 ; xmm1.ps[0] /= a
10 addss ,xmm1 ; s += tab[i] / a
11 cmp ,rax ; si &t[i] < &tab[N] alors boucler
12 jne
13.end:
14 movaps ,xmm2 ; résultat placé dans xmm0
15 ret
Listing 6.3.2 – Traduction en 64 bits de la fonction sum - version améliorée
Le lecteur aura compris que le calcul peut être simplifié puisqueaest une
constante :
X
t[i]
a
=
a
X
t[i]
On pourra donc sortir l’instruction de division de la boucle.while.
6.3.5
#### 6.3.5.1 L’appel de fonctions externes, comme la fonctionprintf, doit être réalisé en

utilisant le mécanisme de PLT (Procedure Linkage Table). Ce mécanisme permet
l’appel de fonctions dont l’adresse n’est pas connue lors de l’édition de liens et qui
sera résolu par l’éditeur de lien dynamique lors de l’exécution.
Il faut alors suffixer les fonctions parWRT ..pltoù WRT signifieWith Respect
to:
6.3. APPEL DE SOUS-PROGRAMME EN 64 BITS 205
1call WRT..plt
Cela n’est pas nécessaire pour les fonctions écrites en assembleur par l’utilisateur
à moins de faire appel à ces fonctions depuis un autre fichier assembleur.
#### 6.3.5.2 En outre, en 64 bits, on utilise généralement le PIC (Position Independent Code)

qui est simple à mettre en œuvre car on se base sur l’adressage relatif par rapport
au registrerip, le pointeur d’instruction.
De la même manière, le PIE pourPosition Independent Executableest une fonction
de sécurité qui permet aux exécutables d’être chargés à des adresses mémoire
aléatoires à chaque fois qu’ils sont exécutés, ce qui peut aider à prévenir certains
types d’attaques, telles que la programmation orientée retour (ROP) et certaines
formes d’attaques par débordement de mémoire tampon.
Par défaut, certaines distributions modernes degccgénèrent des exécutables
indépendants de la position. Cela est utile pour les bibliothèques partagées, qui
peuvent être chargées à différentes adresses dans différents programmes. Cepen-
dant, cela peut poser un problème pour certains programmes de bas niveau, comme
certains programmes d’assemblage, qui peuvent dépendre d’un chargement à une
adresse spécifique.
Dans le cadre de la programmation assembleur que nous voyons dans cet
ouvrage, il est plus simple de ne pas utiliser cette fonctionnalité car elle est difficile
à mettre en oeuvre manuellement. Un compilateur sera plus à même d’automatiser
cette tâche.
C’est pourquoi il est nécessaire, pour l’écriture de notre code, d’utiliser lors de
l’édition de lien avecgcc, l’option-no-pieafin d’éviter que le compilateur ne se
plaigne du fait que le code n’est pas de type PIC. Il en résulte que le code sera
toujours chargé à la même adresse en mémoire.
Par défaut, avecnasml’adressage est absolu, c’est le mode qui nous convient. Si
on désire passer à l’adressage relatif il faut, en début du fichier assembleur, ajouter
la directive
1defaultrel
#### 6.3.5.3 Un autre point important qui est à prendre en considération est lié à l’appel des

fonctions de la bibliothèque C. Les conventions d’appel en 64 bits imposent qu’avant
l’appel d’un sous-programme, la pile (doncrsp) contienne une adresse multiple de
16octets. Lorsque l’on entre dans un sous-programme, on a préalablement réalisé
uncall, qui en 64 bits place8octets dans la pile. Ces8octets correspondent à
l’adresse de retour de sous-programme qui sera utilisée par l’instructionretafin
de passer à l’instruction suivant lecalldans le sous-programme appelant. Cela
implique qu’une fois dans le sous-programme appelé, l’adresse derspest multiple
de8.
Si on écrit un sous-programme qui fait appel à une fonction de la bibliothèque
C, il est nécessaire de rendrerspmultiple de16avant l’appel à cette fonction.
Pourquoi, me direz vous? Normalement cela ne devrait pas poser de problème. Un
appel àprintfdevrait être indifférent au fait querspsoit multiple de8ou de16.
Mais pour certaines fonctions ou dans certaines version de laglibcse produit une
erreur de segmentation! Ce qui semble bien étrange mais dont l’explication réside
dans l’implantation de la fonction.
Regardons ce qui se passe au niveau du code de la fonctionscanfpar exemple,
en installant les sources de la bibliothèque C, version 2.31, comme suit :
sudo apt-get install libc-dbg
2sudo apt-get install glibc-source
3sudo tar xvf /usr/src/glibc/glibc-2.31.tar.xz -C ~
Avec la dernière commande (tar), on installe les sources dans le répertoire
homede l’utilisateur.
On peut alors lancer le débogueurgdbsur un petit programme, ici appelé
prog.exe, qui fait un simple appel àscanf. On obtient bien une erreur de segmen-
tation (ligne 6). Avant de lancer le programme, on indique grâce à la commande
directory(ligne 2) dans quel répertoire se trouvent les sources de la bibliothèque
C :
> gdb prog.exe
2(gdb) directory /home/richer/glibc-2.31/
3(gdb) run
4Starting program: /home/richer/prog.exe
6Program received signal SIGSEGV, Segmentation fault.
70x00007ffff7e0da86 in __vfscanf_internal (s=0x7ffff7f96980 <_IO_2_1_stdin_>,
8 format=0x555555558023 <msg_scanf> "%d", argptr=argptr@entry=0x7fffffffd748,
9 mode_flags=mode_flags@entry=0) at vfscanf-internal.c:339
10339 vfscanf-internal.c: Aucun fichier ou dossier de ce type.
11(gdb) bt
12#0 0x00007ffff7e0da86 in __vfscanf_internal (s=0x7ffff7f96980 <_IO_2_1_stdin_>,
13 format=0x555555558023 <msg_scanf> "%d", argptr=argptr@entry=0x7fffffffd748,
14 mode_flags=mode_flags@entry=0) at vfscanf-internal.c:339
15#1 0x00007ffff7e0c20f in __scanf (format=<optimized out>) at scanf.c:38
16#2 0x0000555555555173 in main () at prog.asm:87
6.3. APPEL DE SOUS-PROGRAMME EN 64 BITS 207
Grâce à la commandex/i, on affiche la dernière instruction exécutée et donc
celle qui a provoqué l’erreur de segmentation :
(gdb) x/i $pc
2=> 0x7ffff7e0da86 <__vfscanf_internal+134>: movaps %xmm1,-0x600(%rbp)
L’instruction est affichée au format AT&T, elle correspond en fait, sous format
Intel, à l’instruction :
1movaps[rbp-0x600],xmm1
qui sauvegarde le contenu du registre vectorielxmm1dans la pile. L’instruction
movapsimpose que l’adresse de destination soit multiple de 16 (voir le Chapitre).
Si on affiche le contenu derbp, on obtient :
(gdb) info reg rbp
2rbp 0x7fffffffd738 0x7fffffffd738
Soit, si on s’intéresse au trois derniers chiffres hexadécimaux à73816−60016=
13816
, donc une adresse multiple de8, d’où l’erreur de segmentation. Attention, ici
il s’agit derbpet nonrsp, maisrbpa été mis à jour en fonction derspcomme on
peut le faire en32bits.
Pour résoudre le problème, il suffit, dans le sous-programme qui réalise l’appel
àscanf, de remettrerspà une valeur multiple de16.
Soit en plaçant un registre dans la pile :
1push ; ou tout autre registre 64 bits
Soit en abaissant le sommet de pile de8octets :
1sub ,8
Soit en alignant le sommet de pile sur un multiple de 16 inférieur à la valeur
actuelle dersp:
1and ,0xF
Il faudra bien évidemment supprimer ces octets de la pile avant de sortir du
sous-programme. On obtient, par exemple, le code suivant pour lire un entier en
64 bits :
1extern
3section
5 s: ,0
6 a:
8section
10; scanf("%d", &a)
11my_call_to_scanf:
12 sub ,8 ; rsp multiple de 16
14 lea ,s]
15 lea ,a]
16 mov ,0 ; pas de flottant traité
17 call WRT..plt
19 add ,8 ; on supprime les octets utilisés
20 ; pour l'alignement
21 ret
Le désassemblage du code du sous-programme précédent compilé avec un
adressage absolu sous forme de fichier objet (.o), donne :
> objdump -d -j .text a.o --show-raw-insn
2...
3my_call_to_scanf():
4 0: 48 83 ec 08 sub rsp,0x8
5 4: 48 8d 3c 25 00 00 00 lea rdi,ds:0x0
6 b: 00
7 8: R_X86_64_32S .data
8 c: 48 8d 34 25 00 00 00 lea rsi,ds:0x0
9 13: 00
10 10: R_X86_64_32S .data+0x3
11 14: b8 00 00 00 00 mov eax,0x0
12 19: e8 00 00 00 00 call 1e <my_call_to_scanf+0x1e>
13 1a: R_X86_64_PLT32 scanf-0x4
14 1e: 48 83 c4 08 add rsp,0x8
15 22: 31 c0 xor eax,eax
16 24: c3 ret
Le même code généré avec l’approche PIC ou adressage realtif donne :
1> objdump -d -j .text a.o --show-raw-insn
2...
30000000000000000 <my_call_to_scanf>:
4my_call_to_scanf():
5 0: 48 83 ec 08 sub rsp,0x8
6.3. APPEL DE SOUS-PROGRAMME EN 64 BITS 209
6 4: 48 8d 3d 00 00 00 00 lea rdi,[rip+0x0] # b <my_call_to_scanf+0xb>
7 7: R_X86_64_PC32 .data-0x4
8 b: 48 8d 35 00 00 00 00 lea rsi,[rip+0x0] # 12 <my_call_to_scanf+0x12>
9 e: R_X86_64_PC32 .data-0x1
10 12: b8 00 00 00 00 mov eax,0x0
11 17: e8 00 00 00 00 call 1c <my_call_to_scanf+0x1c>
12 18: R_X86_64_PLT32 scanf-0x4
13 1c: 48 83 c4 08 add rsp,0x8
14 20: 31 c0 xor eax,eax
15 22: c3 ret
On voit apparaître l’adressage relatif par rapport àripqui a été ajouté parnasm.
On note également que certains instructions qui n’utilisent pas le PIC sont plus
longue d’un octet.
#### 6.3.5.4 Pour l’entrée dans un sous-programme en 64 bits, je recommande d’utiliser un

fonctionnement du type 32 bits en passant parrbp.
1. rbp
2. rspdansrbp
3.
on sauvegarde les registres que l’on désire ou que l’on doit préserver s’ils sont
modifiés
4. rspsur un multiple de16
Dès lors, on peut au travers derbp, accéder aux valeurs des registres sauvegardés
dans la pile.
Pour la sortie de sous-programme, on procède de la manière suivante :
1. rbp
2. rbpdansrsp
3. rbp
4. ret
Afin de simplifier l’écriture du code, on peut définir deux macro-instructions en
nasm:
•defsppourdefine sub program
•endsppourend sub program
La première macro-instruction comporte 1 à plusieurs arguments (1-*) dont le
premier est le nom du sous-programme. Il est suivi par éventuellement d’autres
arguments qui sont, soit des noms de registres généraux 64 bits, considérés comme
des identifiants, soit des entiers positifs. S’il s’agit d’un registre général, il sera
empilé, sinon on décrémentera le sommet de pile de la quantité indiquée. Cet
espace pourra servir à stocker des variables temporaires.
1%macro defsp 1-*
2%1:
3 %rotate 1
4 push
5 mov ,rsp
6 %rep %0 - 1
7 %ifnum %1
8 sub ,1
9 %else
10 push%1
11 %endif
12 %rotate 1
13 %endrep
14 and ,0xF
15%endmacro
L’instruction%rep, de la ligne 6, permet de répéter%0 - 1fois, c’est à dire
n−1 fois les instructions qui apparaissent jusqu’à%endrep. Ici,nest égal à%0qui
représente le nombre d’arguments de la macro-instruction. On utilise l’instruction
%rotate 1
qui permet de passer à l’argument suivant en considérant que les
arguments sont dans une liste sans fin. Par exemple,%rotate %0nous ramène sur
le premier argument.
On termine ensuite la macro en rendant le sommet de pile multiple de 16 (ligne
14).
L’appel de cette macro peut être réalisé de la sorte :
1defsp ,rdi,rsi,100,rbx
On note que les paramètres sont séparés par des virgules. Dans ce cas précis, la
macro-instruction permettra de générer le code suivant :
1main:
2 push
3 mov ,rsp
4 push
5 push
6 sub ,100
7 push
8 and ,0xF
La seconde macro-instruction qui gére la sortie du sous-programme fonctionne
sur le même modèle :
6.4. CODE EN 32 OU 64 BITS 211
1%macro endsp 1-*
2end_%1:
3 %rotate 1
4 %assign i 8
5 %rep %0 - 1
6 %ifnum %1
7 %assign i i + %1
8 %else
9 mov %1,rbp-i]
10 %assign i i + 8
11 %endif
12 %rotate 1
13 %endrep
14 mov ,rbp
15 pop
16 ret
17%endmacro
Elle permet de récupérer les valeurs mises dans la pile. On y fait appel de la
même manière que pourdefsp:
1endsp ,rdi,rsi,100,rbx
On obtient alors le code suivant :
1end_main:
2 mov ,rsp-8]
3 mov ,rsp-16]
4 mov ,rsp-124]
5 mov ,rbp
6 pop
7 ret
6.4
On peut se demander s’il est préférable de compiler son code en 32 ou 64 bits.
A l’heure où nous écrivons cet ouvrage les fournisseurs de systèmes d’exploitation
commencent à abandonner le support 32 bits. Il est toujours possible de compiler
du code 32 bits sur un système 64 bits mais cela requiert d’installer des librairies
spécifiques : avecgccnotamment, le packagemultilib.
Un code C compilé en 64 bits s’exécute normalement plus rapidement que du
code 32 bits parce que le passage des paramètres des sous-programmes se fait
dans les registres et que l’on dispose de plus de registres de calcul pour stocker des
résultats temporaires
. On dispose de plus de registres en 64 bits ce qui permet
. Cependant, dans certains cas, un programme 32 bits peut être plus rapide qu’un programme
compilé en 64 bits.
de stocker plus de données temporaires dans les registres et faire moins d’appels
à la mémoire pour certains traitements, on est donc sensé gagner en efficacité.
L’écriture du code est également simplifiée mais plus contraignante qu’en 32 bits.
Il semble donc préférable d’écrire le code assembleur uniquement en 64 bits et
compiler ses programmes en 64 bits dorénavant.
6.5
### 6.5.1 ▷

en architecture 32 bits les paramètres des sous-programmes sont passés dans
la pile. Les valeurs de retour des fonctions sont passées dans le registre eax
s’il s’agit d’un entier ou d’un pointeur ou dans le sommet de pile de la FPU s’il
s’agit d’un nombre à virgule flottante
▷
en architecture 64 bits les paramètres des sous-programmes sont passés dans
les registres généraux (rdi,rsi,rdx,rcx) s’il s’agit d’entiers ou de pointeurs
et dans les registres SSE s’il s’agit de nombres à virgule flottante. Les valeurs
de retour des fonctions sont passées dans le registre rax s’il s’agit d’un entier
ou d’un pointeur ou dans xmm0 s’il s’agit d’un nombre à virgule flottante
▷
les conventions d’appel en architecture 32 et 64 bits étant différentes il est
très souvent nécessaire de modifier le code assembleur pour passer d’une
architecture à l’autre.
### 6.5.2 Il faut être en mesure de :

□réaliser un appel de sous-programme en 32 bits
□récupérer les arguments d’un sous-programme écrit en 32 bits
□réaliser un appel de sous-programme en 64 bits
□
savoir dans quels registres se trouvent les arguments d’un sous-programme
écrit en 64 bits
## 6.6 Exercice 27 -Réaliser le codage du sous-programme suivant en 32 bits, puis en 64

bits :
1float (int*tab,int )
2 float =0;
3 for(int =0;i<n; i)
4 tab[i] tab[i] 2;
5 sum+=tab[i]*1.25;
6 }
7 return (sum);
8}
Exercice 28 -Réaliser le codage du sous-programme suivant en 32 bits, puis en 64
bits :
1double (double*tab,int ,double )
2 double =0;
3 for(int =0;i<n; i)
4 sum+=tab[i] k;
5 }
6 return (sum);
7}
