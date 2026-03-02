# Chapitre 16 : Etudedecas SuitedeFibonacci

Etudedecas
SuitedeFibonacci
## 16.1 Ce chapitre traite de l’implantation de fonctions qui permettent de calculer

les termes de la suite deFibonacci.Léonardo Fibonacciétait un mathématicien
italien (1175 - 1250) qui a contribué notamment à démocratiser la numérotation
indo-arabe. Il semblerait que la suite ait été découverte par des mathématiciens
indiens (Gopala1133,Hemachandra1150,Fibonacci1202) et qu’elle fut ensuite
attribuée à Fibonacci dans le monde occidental. La suite qui prend donc son nom
est une suite d’entiers naturels construite en calculant la somme des deux termes
précédents et est définie de manière récursive comme suit :
F0= 0
F1= 1
Fn=Fn−1+Fn−2
Les premiers termes de la suite sont donc : 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89,
144, 233, 377, 610, 987, 1597, 2584, 4181.
La suite de Fibonacci possède de nombreuses propriétés mathématiques singu-
lières ainsi que des ramifications dans le domaine du vivant (choux romanesco,
pomme de pin), ou de la dynamique des populations. La suite de Fibonacci est éga-
lement liée au nombre d’orϕqui s’exprime par(1 +
√
5)/2≃1,618033
. Le nombre
d’or est qualifié dedivine proportioncar nombre de choses dans la nature sont liées
à cette valeur. A mesure que l’on calcule les termes de la suite de Fibonacci, le ratio
Fn+1/Fntend versϕ.
### 16.1.1 On considére des couples de lapins qui sont à maturité sexuelle, que l’on notera

S, et qui peuvent se reproduire pour générer un nouveau couple de lapins qui, lui,
n’est pas à maturité sexuelle et que l’on noteraN. Les couples qui ne sont pas à
maturité sexuelle doivent attendre avant de parvenir à maturité et pourrons alors
se reproduire. L’évolution d’une population est donc la suivante :
•au tempst= 0, il n’y a aucun couple
•au tempst= 1, on a un couple qui n’est pas à maturité sexuelle
•au tempst= 2, on a un couple parvenu à maturité sexuelle
•
au tempst= 3, on a deux couples : un couple à maturité sexuelle, un couple
issu de la reproduction du couple à maturité et qui n’est donc pas à maturité
sexuelle
•
au tempst= 4, on a trois couples : deux couples à maturité sexuelle et un
couple non mature
•etc
On a reproduit l’évolution de la population Table.
TempsCouples Nbr. Couples
t= 0∅ 0
t= 1N 1
t= 2S 1
t= 3SN 2
t= 4SNS 3
t= 5SNSSN 5
t= 6SNSSNSNS 8
TABLE16.1 – Evolution d’une population de lapins selon Fibonacci
Du point de vue de l’informatique, on peut voir cette évolution comme un
système de réécriture :
N−→S
S−→SN
Du point de vue de la biologie, la suite de Fibonacci est en rapport avec la
phyllotaxie des plantes, c’est à dire, l’organisation en spirale des organes autour
d’une tige. On remarque que pour un nombre important de plantes, estimé à90%,
le nombre d’organes dans une spirale suit très souvent une progression proche
des rapports de la séquence de Fibonacci. Il en résulte que ces organes émergent
souvent à des angles de137,5degrés ce qui permet à chaque organe de recevoir
16.2. RÉCURSIVITÉ 395
une quantité optimale de lumière du soleil en évitant les chevauchements ce qui
conduit à favoriser la photosynthèse.
Nous n’entrerons pas dans de plus amples considérations puisque ce qui nous
intéresse est l’implantation de cette fonction sous une forme particulière. Pour
terminer, nous dirons que la suite de Fibonacci fait partie de l’encyclopédie en ligne
des suites de nombres entiers OEIS (On-Line Encyclopedia of Integer Sequences).
Elle est présente sous l’identifiant A000045. En informatique, la suite de Fibonacci
possède des applications liées à la génération des nombres aléatoires, aux arbres
AVL
(qui sont des arbres de recherche dits automatiquement équilibrés) ou aux
structures de données du même nom (Fibonacci Heap).
16.2
Le code de la fonction de Fibonacci récursive est donné Listing.
1u32 (u32 )
2 if(n<=1)
3 return ;
4 }else{
5 return (n-1) fib_rec(n-2);
6 }
7}
Listing 16.2.1 – Fibonacci - fonction récursive
Si on réalise quelques tests de performance, on s’aperçoit rapidement que le
nombre d’appels récursifs devient prohibitif (voir Table, ci-après) et la fonction
devient de moins en moins efficace. Par exemple sur un AMD Ryzen 5 5600g dont
la fréquence de fonctionnement en modeboostest de 4440 MHz,F44,F45etF46
s’exécutent respectivement en1.685,2.559et4.365secondes.
Comme on peut s’en rendre compte Table, colonne fib_rec, le nombre
d’appels récursifs est proportionnel àϕ, le nombre d’or. Il tend vers1,447214×ϕ
n à
mesure quentend vers∞. Notons que1,447214≃1 + 1/
√
5.
Il existe cependant une autre implantation récursive mais qui se base sur les
propriétés suivantes. Elle permet decasserla complexité initiale du problème. Le
code correspondant est donné Listing
Fn=
⊂
sinest pair, k=n/2, F n= (2×Fk−1+Fk)×Fk
sinest impair, k= (n+ 1)/2, Fn= (F
k−1
+F
k
)
A chaque étape on calculek=n/2 , puis il faut évaluerFketFk−1. On termine
la récursion dès quenvaut0ou1.
1. Adelson-Velsky and Landis
Fi fib_recfib_rec_improved
F10 177 15
F20 21891 31
F25 242785 41
F30 2692537 45
F35 29860703 55
F40331160281 63
F453672623805 75
TABLE16.2 – Nombre d’appels des fonctions récursives de Fibonacci
1u32 (u32 )
2 if(n<=1)return ;
3 if(n%2==1)
4 int =n+1) 1;
5 int =fib_rec_improved(k-1);
6 int =fib_rec_improved(k);
7 return(f1*f1+f2*f2);
9 }else{
10 int =n>>1;
11 int =fib_rec_improved(k-1);
12 int =fib_rec_improved(k);
13 return(2*f1+f2) f2;
15 }
16}
Listing 16.2.2 – Fibonacci - fonction récursive améliorée
Pour la version récursive améliorée, le nombre d’appels récursifs est nettement
plus petit et d’une complexité enO(n)comme on peut le constater Table,
colonnefib_rec_improved.
Nous donnons, Figure, un exemple du calcul de F13, en utilisant la formule
de réccurrence améliorée.
## 16.3 On peut calculerFnen utilisant l’arrondi de l’expression suivante :

Fn≃ϕ
n
×
√
Le temps de calcul du test que nous réaliserons et qui est décrit ci-après est
16.4. VERSION DE RÉFÉRENCE EN C 397
FIGURE16.1 – Calcul deF13avec la version récursive améliorée.
de l’ordre de22,58secondes. Nous ne nous intéresserons donc pas aux temps de
calculs obtenus grâce à cette formule même s’il sont parfois inférieurs à d’autres
implantations notamment la traduction directe (sans optimisation) en assembleur
de la fonction de référence qui s’exécute en plus de50secondes.
## 16.4 La version de référence à laquelle nous allons nous intéresser (voir Listing),

est une variante de la version récursive. Elle est à la fois récursive puisqu’elle s’ap-
pelle, mais également linéaire puisque seulementnappels seront réalisés.
Elle prend en paramètres la valeur du nombre à calculernainsi queF0etF1
représentés respectivement parf0etf1. L’appel est réalisé en prenantf0= 0et
f1= 1.
1u32 (u32 ,u32 ,u32 )
2 if(n==0)
3 return ;
4 }else{
5 return (f1,f0+f1,n-1);
6 }
7}
9u32 =fib_ref(0,1,n);
Listing 16.4.1 – Fibonacci - fonction de référence
Cette fonction de référence est traduite par le compilateurg++en utilisant les
options de compilation suivantes :
•-O3(Optimisation niveau 3)
•–funroll-loops(dépliage de boucle)
Le compilateur parvient à éliminer la récursivité et produit une version très
performante. Il transforme la récursivité en une bouclewhileavec un dépliage
par 8. De plus, il utiliseespplutôt queebppour récupérer les paramètres de la
fonction.
Temps de référence
Le test de référence consiste à réaliser500_000_000 fois le calcul deF43. Les
tests sont réalisés sur un AMD Ryzen 5 5600g. Pour l’implantation par le
compilateurg++, l’exécution dure environ2,853secondes, ce qui représente
un temps d’exécution très performant qui va se révéler difficile à battre, mais
à cœur vaillant, rien d’impossible.
## 16.5 Versions assembleur de la fonction de référence

La traduction de la fonction de référence en assembleur est facile à réaliser. Un
rapide examen permet de déterminer qu’il est intéressant de chargerf0danseax
puisque c’est la valeur qui sera retournée dans le cas où la variablenest égale à 0.
On utilise égalementedxpour stockerf1etecxpourn(voir Listing). Ainsi,
nous n’utilisons que des registres modifiables d’après les conventions d’appel en 32
bits.
On peut mettre en commentaire la ligne19qui remonte le sommet de pile en
libérant les paramètres passés lors de l’appel récursif car la ligne23rétablitespà
sa valeur d’origine.
Version assembleur de la fonction de référence
La version de référence implantée en assembleur (il s’agit d’une traduction
directe) s’exécute en50,630secondes ce qui est énorme par rapport à la
version optimisée par le compilateur.
On peut donc se demander si c’est l’accès mémoire qui est la cause de ce
ralentissement (cf. partie résultats pour l’explication) .
## 16.6 Pour calculer les nombres de la suite de Fibonacci, on peut utiliser un tableau

den+ 1entiers et on commence par remplir les deux premiers éléments par les
valeurs0et1qui correspondent àF0etF1. Chaque élément d’indiceidu tableau
16.6. VERSIONS AXÉES SUR LES TABLEAUX 399
1fib_v1:
2 push
3 mov ,esp
5 mov ,ebp+8]
6 mov ,ebp+12]
7 mov ,ebp+16]
8 test ,ecx
9 jz
11 dec
12 push ; n-1
14 add ,edx ; eax <- f0+f1
15 push
17 push ; f1
18 call
19 ; add esp 12
21.endif:
23 mov ,ebp
24 pop
25 ret
Listing 16.5.1 – Fibonacci - fonction de référence en assembleur
correspond à la valeur deFi. On applique ensuite la formule de récurrence sur les
éléments du tableau. Le Listing
1u32 (u32 ,u32 ,u32 )
3 if(n<=1)return ;
4 data[0]f0;
5 data[1]f1;
7 u32 =2;
8 while(i<=n)
9 data[i] data[i-1]data[i-2];
10 ++i;
11 }
13 return [i-1];
15}
Listing 16.6.1 – Fibonacci - fonction itérative avec tableau
Version tableau
La version basée sur un tableau dynamique alloué à chaque appel de la
fonction prend13,790secondes pour s’exécuter. Alors que si on utilise un
tableau statique le temps d’exécution passe à6,380secondes.
La version avec tableau dynamique est moins performante car on fait de nom-
breux appels aux fonctions systèmemallocetfree. Le temps est doublé par rapport
à la fonction avec tableau statique.
## 16.7 Nous allons à présent nous concentrer sur des versions itératives et remplacer

l’appel récursif par une bouclewhilemais nous allons nous passer de l’utilisation
d’un tableau pour stocker les calculs intermédiaires. Ces calculs seront réalisés
dans les registreseaxetedxprincipalement. Le code C correspondant à cette
modification figure Listing.
1u32 (u32 ,u32 ,u32 )
2 while(n!=0)
3 int =f1;
4 f1+=f0;
5 f0=f1;
6 --n;
7 }
8 return ;
9}
Listing 16.7.1 – Fibonacci - fonction itérative avec boucle while
Sinest égal à0, on retournef0, donc0. Sinon on calculeF1, puisF2, jusqu’à
Fn. La variablef0devientf1etf1devientf1+f0, c’est à direF2. Pour faire ce
transfert de valeurs il est nécessaire d’utiliser une variable temporairetmp.
On peut traduire ce code directement en assembleur (voir Listing) en
utilisant le registreebxpour stocker temporairement la valeur def1. On se doit
alors de sauvegarderebxdans la pile, puis de le restaurer par la suite.
Chaque itération de la bouclewhileest alors composée de trois instructions
assembleur (lignes14à16) du Listing.
16.7. VERSIONS ITÉRATIVES 401
1fib_v3:
2 push
3 mov ,esp
4 push
6 mov ,ebp+8]
7 mov ,ebp+12]
8 mov ,ebp+16]
10 test ,ecx
11 jz
13.while:
14 mov ,edx ; tmp = f1
15 add ,eax ; f1 = f1 + f0 => f2, f3, ...
16 mov ,ebx ; f0 = tmp => f1, f2, ...
18 dec ; --n
19 jnz
20.endwhile:
22.end:
23 pop
24 mov ,ebp
25 pop
26 ret
Listing 16.7.2 – Fibonacci - fonction itérative avec while en assembleur
Version itérative avec while
La version itérative avecwhilene prend alors plus que6,30secondes pour
s’exécuter. Il s’agit d’une bonne amélioration mais qui reste encore loin de la
version traduite par le compilateur. On peut alors déplier la boucle par 2, 4
ou 8. On obtient les temps d’exécution suivants :
•dépliage par2:5,26s
•dépliage par4:3,54s
•dépliage par8:3,47s
Les dépliages par un facteur4ou8semblent donc les plus performants.
### 16.7.1 On peut s’apercevoir que le corps de la bouclewhilepeut être optimisé. Au lieu

de coder :
1 mov ,edx
2 add ,eax
3 mov ,ebx
on peut utiliser les deux instructions suivantes :
1 add ,edx ; eax = f0 + f1, edx = f1
2 xchg ,edx ; échange des registres
InitialementeaxcontientF0etedxF1 . La première addition revient à mettre
F2danseax, puis on échange les valeurs contenues dans les registres. Au finaleax
contientF1etedxcontientF2.
On gagne alors une instruction et on n’est pas forcé d’utiliser un registre comme
ebxqui nécessitait d’être préservé.
Version itérative avec while et astuce
Malheureusement, cette amélioration ne s’avère pas forcément très bénéfique
pour notre traitement par rapport à la solution précédente puisqu’elle donne
à peu près les mêmes temps d’exécution, sauf pour le dépliage par2.
•sans dépliage :6,304s
•dépliage par2:3,608
•dépliage par4:3,500
•dépliage par8:3,497
### 16.7.2 Lors du dépliage, on répète plusieurs fois le code du corps de la bouclewhile,

ce qui va représenter4instructions avec le code de base ou2instructions avec
l’astuce évoquée précédemment.
En fait, on peut trouver une amélioration qui consiste à écrire :
1 add ,edx
2 add ,eax
En effet, si on considère queeaxcontientFietedxFi+1 alors le résultat de la
première instruction d’addition estFi+2danseax, puisFi+3dansedx
Instruction / Registreeaxedx
initialement FiFi+1
add ,edx Fi+2Fi+1
add ,edx Fi+2Fi+3
TABLE16.3 – Astuce dépliage par 2
16.7. VERSIONS ITÉRATIVES 403
Version itérative avec while et amélioration du dépliage
En utilisant cette amélioration, on diminue le temps d’exécution :
•dépliage par2:3,755
•dépliage par4:3,544
•dépliage par8:2,453
Le code correspondant est donné Listing 8.
On commence par définir deux macro-instructions afin de ne pas réécrire le
code entièrement. La première nomméeswap_1calculeFi+1alors que la seconde
swap_2calculeFi+2.
On charge les paramètres dans les registres (lignes17à19), puis on teste sin
est égal à0. Dans ce cas on sort de la fonction aveceaxqui contientF0.
On calcule ensuite le nombre d’itérations du dépliage par8(ligne24). Si celui-ci
est égal à0, c’est que la valeur denest comprise entre1et7. On se déplace donc
(ligne25) vers une bouclewhilequi traite ces dernières itérations.
Après la boucle de dépliage par8(Lignes27à32), on recharge dansecxla
valeur denet on recalcule le nombre d’itérations restantes (lignes35et36). Si
ce nombre est égal à0, on sort de la fonction careaxcontientFn. Sinon on traite
comme indiqué précédemment les dernières itérations.
### 16.7.3 Le dépliage par8semble être le plus efficace, mais lors des dernières itérations

qui peuvent varier entre 1 et 7, il est préférable d’utiliser unswitchafin d’améliorer
l’efficacité de la fonction plutôt que faire une bouclewhile. La partie de code qui
diffère est présentée ci-après.
1align
2switch_jumps_table: ,..@case_1,..@case_2
3 dd ,..@case_4,..@case_5
4 dd ,..@case_7
5; code précédent
6; ....
7.while_ur8:
8 swap_2
9 swap_2
10 swap_2
11 swap_2
12 loop
14.last_7:
15 mov ,ebp+16]
16 and ,7
17 jmp [switch_jumps_table +ecx*4]
1%macro swap_1 0
2 ; eax=f0 edx=f1
3 add ,edx; eax=f2=f0+f1
4 xchg ,edx; eax=f1 edx=f2
5%endmacro
7%macro swap_2 0
8 ; eax=f0 edx=f1
9 add ,edx; eax=f0+f1=f2
10 add ,eax; edx=f2+f1=f3
11%endmacro
13fib_v13:
14 push
15 mov ,esp
17 mov ,ebp+8]
18 mov ,ebp+12]
19 mov ,ebp+16]
21 test ,ecx
22 jz
24 shr ,3 ; / 8
25 jz
27.while_ur8: ; eax=f0 edx=f1
28 swap_2 ; eax=f2 edx=f3
29 swap_2 ; eax=f4 edx=f5
30 swap_2 ; eax=f6 edx=f7
31 swap_2 ; eax=f8 edx=f9
32 loop
34.last_7:
35 mov ,ebp+16]
36 and ,7
37 jz
39.while:
40 swap_1
41 loop
43.end:
44 mov ,ebp
45 pop
46 ret
Listing 16.7.3 – Fibonacci - fonction itérative avec while et amélioration du dépliage
19align ; switch
20..@case_7:
21..@case_6:
16.7. VERSIONS ITÉRATIVES 405
22..@case_5:
23..@case_4:
24..@case_3:
25..@case_2:
26..@case_1:
27..@case_0:
29.end:
Il est nécessaire de définir une table d’adresses qui correspond aux différents
case(cf. Section).
Version itérative avec while, amélioration du dépliage et switch
En ajoutant unswitch, on obtient un temps d’exécution de2,58secondes
donc un peu moins performant que la version précédente.
#### 16.7.4 esp

Plutôt que d’utiliserebppour récupérer les arguments de la fonction, on utilise
directementesp. Le premier paramètref0est donc en[esp+4] car[esp] contient
l’adresse de retour du sous-programme.
1fib:
3 mov ,esp+4]
4 mov ,esp+8]
5 mov ,esp+12]
7 test ,ecx
8 jz
10 shr ,3 ; / 8
11 jz
13 ; suite de la fonction
14 ; ...
Version itérative avec while, amélioration du dépliage, switch, esp
En éliminant tout ce qui touche àebp, notamment l’entrée et la sortie de la
fonction, on exécute la fonction en2,298secondes.
### 16.7.5 Lors du dépliage par8, lorsque l’on exécute4fois les instructions

1 add ,edx
2 add ,eax
on génère de nombreuses dépendances. On peut alors tenter de supprimer des
dépendances en utilisant l’instructionleacomme sur le code suivant :
1.while_ur8:
2 ; eax edx ebx
3 ; x
4 ; y ?
5 add ,edx ; x+y y
6 add ,eax ; x+y x+2y
8 lea ,eax+edx]
9 lea ,ebx+edx]
11 lea ,eax+ebx]
12 lea ,eax+edx]
14 lea ,ebx+edx]
16 lea ,eax+ebx]
18 loop
Version itérative avec while, amélioration du calcul interne, switch, esp
Le test d’efficacité ne met alors plus que2,229secondes pour s’exécuter. Même
si on a encore des dépendances entre les registres, il se peut que l’instruction
leasoit plus performante queadd.
16.8
### 16.8.1 On peut reprendre le même principe que la bouclewhileen utilisant les registres

vectoriels. On commence par charger dans le registre SSExmm0les premières valeurs
de la suite de Fibonacci et on fait de même avecxmm1avec un décalage d’un élement.
Il s’agit des tableaux de donnéessse_vect0etsse_vect1du Listing. On
n’aura donc plus besoin des paramètresf0etf1.
Il est généralement préférable d’aligner ces données sur une adresse multiple de
16 octets, c’est à dire la taille d’un registre SSE. On peut alors utilisermovdqapour
charger les données dansxmm0etxmm1. On peut stocker ces données au niveau de
la section des données (.data) ou de la section de code (.text).
Puis pour effectuer un dépliage par4, on réalise la série d’opérations des lignes
15à18du Listing.
Instruction xmm0 xmm1
initialement F3,F2,F1,F0F4,F3,F2,F1
paddd ,xmm1F5,F4,F3,F2F4,F3,F2,F1
paddd ,xmm0F5,F4,F3,F2F6,F5,F4,F3
paddd ,xmm1F7,F6,F5,F4F6,F5,F4,F3
paddd ,xmm0F7,F6,F5,F4F8,F7,F6,F5
TABLE16.4 – Evolution du contenu des registres vectoriels
Il est nécessaire de réserver de l’espace dans la pile (ligne11) afin de stocker
le résultat final contenu dansxmm0. Les trois dernières itérations potentielles sont
traitées à partir de la ligne23. Ici, il n’est nul besoin de réaliser unwhilepuisque
le registrexmm0contientFi,Fi+1,Fi+2,Fi+3. On stocke donc au niveau de la pile le
contenu du registre et on récupère l’élément voulu en utilisanteaxqui contient,
depuis la ligne10, le nombre d’itérations restantes après dépliage.
### 16.8.2 La version AVX consiste à faire un dépliage par8de la bouclewhilecar un

registre AVX stocke8entiers. Comme le montre le Listing, on utilise des
instructions AVX qui commencent par la lettrev. On aligne également les données
sur une adresse mémoire multiple de32octets.
Version vectorielle SSE
En utilisant les registres vectoriels on obtient les temps d’exécution suivants :
•version SSE intrinsics (méthode26) :2,393s
•version SSE assembleur (méthode27) :2,008s
•
version SSE assembleur améliorée avec dépliage par 8 (méthode30) :
1,961s
•version AVX intrinsics (méthode32) :2,471s
•version AVX assembleur dépliage par 8 (méthode33) :1,982s
•version AVX assembleur dépliage par 16 (méthode34) :1,973s
1align
2sse_vect0: ,1,1,2; F0, F1, F2, F3
3sse_vect1: ,1,2,3; F1, F2, F3, F4
5fib_sse:
6 mov ,esp+12]
7 movdqa ,sse_vect0]
8 movdqa ,sse_vect1]
9 mov ,ecx
10 and ,3
11 sub ,16 ; espace pour stockage du résultat
12 shr ,2 ; / 4
13 jz
14.while_ur4: ; dépliage par 4
15 paddd ,xmm1
16 paddd ,xmm0
17 paddd ,xmm1
18 paddd ,xmm0
20 dec
21 jnz
23.last_3:
24 vmovdqu[esp],xmm0 ; stockage du résultat
25 mov ,esp+eax*4]
26 add ,16
27 ret
Listing 16.8.1 – Fibonacci - fonction itérative vectorielle
## 16.9 Le code qui correspond à l’ensemble des résultats produits dans cette section

comporte34implantations différentes. Voici résumé les caractéristiques des implan-
tations qui ont été gardées pour présentation et analyse :
•gcc(1) : fonction de référence optimisée pargcc, le compilateur GNU
•icc(2) : fonction de référence optimisée paricc, le compilateur Intel
•stat. array(4) : tableau statique
•dyna. array(5) : tableau dynamique
•n recursive
(6) : implantation directe en assembleur de la fonction de
référence
•while v1(8) : version itérative avec unwhile
•while v1 ur2(9) : version itérative dépliée par 2
•while v1 ur4(10) : version itérative dépliée par 4
•while v1 ur8(11) : version itérative dépliée par 8
•while v3 ur8
(21) : version itérative dépliée par 8 avec calcul utilisantlea
et utilisation deesp
16.9. RÉSULTATS 409
1#define ALIGN(x) __attribute__((aligned(x)))
3const [4]ALIGN(16) 0,1,1,2};
4const [4]ALIGN(16) 1,1,2,3};
6u32 (u32 ,u32 ,u32 )
7 u32 [4]ALIGN(16);
8 __m128i ,vf1;
10 vf0=_mm_load_si128((__m128i*) sse_v0);
11 vf1=_mm_load_si128((__m128i*) sse_v1);
13 u32 =n/4;
14 while(r)
15 vf0=_mm_add_epi32(vf0,vf1);
16 vf1=_mm_add_epi32(vf0,vf1);
17 vf0=_mm_add_epi32(vf0,vf1);
18 vf1=_mm_add_epi32(vf0,vf1);
19 --r;
20 }
22 _mm_store_si128(__m128i*) v2[0],vf0);
23 return [n&3];
24}
Listing 16.8.2 – Fibonacci - fonction vectorielle SSE
•while v6 ur8
(24) : version itérative dépliée par 8 avec utilisation de l’astuce
de dépliage par 2 et utilisation deesp
•SSE intrin(26) : version vectorielle SSE intrinsics
•SSE v4 ur8
(30) : version vectorielle SSE en assembleur dépliée par 8 et
utilisation deesp
•AVX intrin(32) : version vectorielle AVX intrinsics
•AVX ur8
(33) : version vectorielle AVX en assembleur dépliée par 8 et utilisa-
tion deesp
Chaque méthode est exécutée10fois si son temps d’exécution est inférieur
à10secondes. On prend alors ma moyenne des10exécutions. Par contre, si
le temps d’exécution est supérieur à10secondes on reporte simplement ce
temps.
### 16.9.1 L’analyse des résultats montre à peu de choses près les mêmes tendances pour

toutes les architectures.
La méthode1qui est la traduction optimisée pargccdu code de référence se
montre très efficace par rapport aux autres méthodes. La méthode2qui est le code
optimisé pariccest par contre bien moins performant alors que généralementicc
1align
2avx_vect0: ,1,1,2,3,5,8,13; F0, ..., F7
3avx_vect1: ,1,2,3,5,8,13,21; F1, ..., F8
5align
6fib_avx:
7 mov ,esp+12]
8 vmovdqa ,avx_vect0]
9 vmovdqa ,avx_vect1]
11 sub ,32
12 mov ,ecx
13 and ,7
15 shr ,3 ; / 8
16 jz
18.while_ur8:
19 vpaddd ,ymm1
20 vpaddd ,ymm0
21 vpaddd ,ymm1
22 vpaddd ,ymm0
23 vpaddd ,ymm1
24 vpaddd ,ymm0
25 vpaddd ,ymm1
26 vpaddd ,ymm0
28 dec
29 jnz
31.last_7:
32 vmovdqu[esp],ymm0
33 mov ,esp+eax*4]
34 add ,32
35 ret
Listing 16.8.3 – Fibonacci - fonction vectorielle AVX
produit un code plutôt bien optimisé.
Les méthodes basées sur les tableaux ne sont pas très performantes surtout la
méthode5basée sur une allocation du tableau à chaque itération. Les nombreux
appels systèmes engendrent un doublement du temps d’exécution.
La méthode la plus problématique est la méthode6qui correspond à la tra-
duction directe de la méthode de référence. Son temps d’exécution est bien trop
important. Est-ce dû aux accès répétés dans la pile des paramètres ou aux appels de
sous-programmes? En fait, le problème vient du nombre d’instructions exécutées.
La méthode est appelée500millions de fois. On calculeF43lors du test, la méthode
s’appelle donc43fois et comporte16instructions, cela fait un total de344milliards
d’instructions. En prenant en compte les instructions de la boucle qui réalise les500
16.9. RÉSULTATS 411
millions d’appels, cela représente, d’aprèsperf, environ352milliards d’instructions.
La méthode1par contre n’utilise que45milliards d’instructions. L’exécution du
test avec la méthode33nécessite seulement34milliards d’instructions .
La méthode8qui consiste à remplacer les appels récursifs par unwhilese
montre plus intéressante mais le dépliage par2ou par4sur les architectures Intel
apparaît contre-productif. Le dépliage par8est plus intéressant mais ne permet pas
de diminuer le temps d’exécution par rapport à la méthode non dépliée.
N° Marque Intel AMD IntelIntelIntel
Gamme Core i3Ryzen 7Core i5Core i7Core i5
Modèle 61001700X 7400 87008365U
2015 2017 2017 2017 2019
1 gcc 4,11 4,39 4,24 3,23 3,61
2 icc 7,97 11,31 8,56 6,49 7,39
4 stat. array8,99 8,84 9,12 7,37 8,30
5 dyna. array18,57 21,16 21,67 15,79 18,09
6 n recursive63,39 82,48 67,71 51,53 112,24
8 while v1 7,52 11,47 8,99 5,78 7,44
9while v1 ur218,45 5,48 22,26 15,01 18,88
10while v1 ur412,56 5,25 16,07 10,21 12,79
11while v1 ur8 9,65 5,14 11,85 7,86 9,95
21while v3 ur8 5,37 4,39 5,74 4,45 4,96
24while v6 ur8 4,35 4,51 4,66 3,60 3,95
26 SSE intrin 4,11 4,27 4,36 3,17 3,66
30 SSE v4 ur8
32AVX intrin v2 4,20 5,73 4,38 3,21 3,93
33AVX asm ur8 5,60 3,34
ratio (1 / 30) 1,18 1,36 1,26 1,25 1,22
ratio (1 / 33) 1,28 0,78 1,26 1,25 1,17
TABLE16.5 – Résultats comparatifs de fib_iter : architectures modernes
On observe par contre sur AMD Ryzen 1700X que le dépliage est intéressant
puisqu’il diminue significativement le temps d’exécution par rapport à la méthode
sans dépliage.
Le fait d’utiliser l’astuce mentionnée en section
temps d’exécution (cf. méthode21) sur les processeurs AMD et Intel, de même pour
la méthode24.
Mais c’est l’implantation vectorielle SSE ou AVX (méthodes30et33) qui permet
de supplanter la version optimisée par le compilateur.
### 16.9.2 Pour les architectures récentes (voir Table), on observe globalement les

mêmes phénomènes.
N° Marque Intel Intel Intel AMD Intel
Gamme Core i7Core i7Core i5Ryzen 5Core i5
Modèle10850H1165G7 10400 5600g12400F
2020 2020 2020 2021 2022
1 gcc 3,007 3,07 3,516 2,853 2,035
2 icc5,365 5,81 5,610 3,990 4,489
4 stat. array6,446 5,96 7,478 6,380 4,871
5 dyna. array14,470 14,84 16,660 13,790 9,441
6 n recursive93,390 59,53 108,57050,630 55,870
8 while v1 6,038 11,94 7,322 6,304 5,570
9while v1 ur213,860 16,09 18,210 3,60814,930
10while v1 ur49,510 11,07 13,140 3,50011,250
11while v1 ur87,254 8,69 9,583 3,497 8,197
21while v3 ur84,121 5,02 4,823 2,229 4,795
24while v6 ur83,286 3,41 3,832 2,271 2,807
26 SSE intrin3,076 3,47 3,584 2,393 2,480
30 SSE v4 ur8 2,442 2,70 2,153
32AVX intrin v23,235 3,71 3,837 2,471 2,566
33AVX asm ur8
ratio (1/33) 1,247 1,137 1,270 1,439 0,981
TABLE16.6 – Résultats comparatifs pour fib_iter : architectures récentes
Cependant, pour l’Intel 10850H le temps d’exécution de la méthode6est30fois
plus lent que la méthode1, ce qui est très étrange. Cela est-il dû à la mémoire qui
serait extrêmement lente bien qu’étant de la DDR4-SDRAM fonctionnant à 3200
MHz?
Au final, la méthode qui semble la plus efficace est la méthode basée sur une
implantation assembleur avec AVX, une boucle dépliée par 8, utilisantesppour
accéder àn(voir Listing).
### 16.9.3 J’ai créé un petit programme qui s’intitulefrequency.cppdont le but est d’en-

registrer la fréquence de fonctionnement du core0sur lequel est exécuté le pro-
1align
2avx_vect0: ,1,1,2,3,5,8,13
3avx_vect1: ,1,2,3,5,8,13,21
5align
6fib:
7 mov ,esp+12]
8 vmovdqa ,avx_vect0]
9 vmovdqa ,avx_vect1]
11 sub ,32
12 mov ,ecx
13 and ,7
15 shr ,3 ; / 8
16 jz
18.while_ur8:
19 vpaddd ,ymm1
20 vpaddd ,ymm0
21 vpaddd ,ymm1
22 vpaddd ,ymm0
23 vpaddd ,ymm1
24 vpaddd ,ymm0
25 vpaddd ,ymm1
26 vpaddd ,ymm0
28 dec
29 jnz
31.last_7:
32 vmovdqu[esp],ymm0
33 mov ,esp+eax*4]
34 add ,32
35 ret
Listing 16.9.1 – Fibonacci - fonction la plus performante
gramme principal de testfib.exe. Ce programme permet de vérifier si la fréquence
de fonctionnement reste stable ou varie.
On note que pour les processeurs AMD la fréquence reste stable alors que pour
les processeurs Intel elle peut varier fortement. Cela se traduit par un écart type
important.
## 16.10 Merci à Mohamed Sylla et Matéo Grimaud, étudiants à l’Université d’Angers,

pour les tests effectués respectivement sur Intel Core i7 1165G7 et Core i5 8365U.
Marque Intel Intel AMD AMD
Gamme Core i7Core i5Ryzen 5Ryzen 7
Modèle10850H 7400 5600g 1700X
2020 2017 2021 2017
Fréquence moyenne 4973,97 3475,01 4441,90 3492,71
Ecart type 24,20 13,84 0,00 0,12
Fréquence minimum 4945,02 3450,57 4441,90 3492,07
Fréquence maximum 5012,62 3499,39 4441,91 3493,04
TABLE16.7 – Variation de la fréquence du microprocesseur lors des tests
