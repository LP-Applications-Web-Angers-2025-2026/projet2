# Chapitre 17 : Etudedecas

## 17.1 Un nombre auto-descriptif se définit comme un entier naturel ayant pour pro-

priété que chacun de ses chiffres repéré par son rang indique combien de fois ce
rang apparaît en tant que chiffre dans l’écriture de ce nombre. On parle aussi de
nombre autobiographique ou de nombre qui se décrit lui-même. Le premier nombre
auto-descriptif est1210. En effet :
•il contient1chiffre zéro
•il contient2chiffres un
•il contient1chiffre deux
•il contient0chiffre trois
Il en va de même pour2020,21200. Ces nombres sont très rares, on en compte
7 dont la liste figure Table
n a (n)
1 1_210
2 2_020
3 21_200
4 3_211_000
5 42_101_000
6 521_001_000
7 6_210_001_000
TABLE17.1 – Nombres auto-descriptifs
Formalisons tout cela. On considèrexun nombre entier positif dekchiffres de
la forme :
x=d0×10
k−1
+. . .+dk−1×10
=
k−1
X
i=0
di×10
k−1−i
On définit pour ce nombre une suite de valeursc0àck−1où chaquecireprésente
le nombre d’occurrences du chiffreidansx:
ci=Card({djtel quedj=i,∀j∈[0,k−1]})
On doit alors vérifier la contrainte suivante qui définit un nombre auto-descriptif :
∀i∈[0,k−1], ci=di
où[0,k−1] représente l’intervalle de valeurs entre0etk−1. De ces définitions
découlent les propriétés suivantes :
•propriété 1: un nombre auto-descriptif ne peut pas commencer par 0
•propriété 2: un nombre auto-descriptif contient au moins un 0
•
propriété 3: la somme desciest égale àk, et donc, la somme desdiest égale
àk
•
propriété 4: un nombre auto-descriptif contient au moins un 0 en position
k−1
•
propriété 5: un nombre auto-descriptif dekchiffres ne peut par avoir un
chiffre supérieur àk
Théorème 17.1.1.Un nombre auto-descriptif ne peut pas commencer par 0.
Démonstration.
En effet, sid0= 0alors le nombre commence par 0 et par définition
n’est pas valide.
Théorème 17.1.2.Un nombre auto-descriptif contient au moins un 0.
Démonstration.
En effet, sic0= 0alorsd0= 0et le nombre commence par 0 et par
définition n’est pas valide d’après le théorème précédent.
Théorème 17.1.3.
k−1
X
i=0
ci=
k−1
X
i=0
di=k
Démonstration.
Si par définition lescireprésentent le nombre d’occurrences de
chaque chiffre, leur somme doit donc être égale àk. Etant donné que par définition
ci=di, on en déduit également que la somme desdiest égale àk.
Théorème 17.1.4.Un nombre auto-descriptif se termine par un 0.
Démonstration.
AppelonsS(k) =
P
k−1
i=0
di et raisonnons pas l’absurde pour montrer
qu’il n’est pas possible quedk−1soit différent de0. Par définitionS(k) =k et
doncS(k) =S(k−1) +dk−1 . Supposons alors quexne setermine pas par0, alors
dk−1>0 , et on en déduit queS(k−1)< k ou encore queS(k−1)<=k−1 . Le fait
qu’un nombre auto-descriptif ne commence pas par un0mais contient au moins
un0, implique qued0̸= 0et donc qu’il existe au moins un0parmi lesd1àdk−1.
En conséquenceS(k)>=k−1 . Sachant queS(k) =S(k−1) +dk−1 , on a donc
S(k)−S(k−1) =dk−1 . Mais commeS(k)>=k−1 et queS(k−1)<=k−1 , on
en déduit queS(k)−S(k−1) = 0et donc quedk−1= 0.
Théorème 17.1.5.Un nombre auto-descriptif dekchiffres ne peut par avoir un
chiffre supérieur àk, i.e.di< k,∀i∈[0,k−1]
Démonstration.
Sixpossèdekchiffres alorsd0àdk−1sont définis. Sidi≥k cela
implique queci≥kce qui est en contradiction avec la définition du nombre.

## 17.2 La fonction de référence à implanter est donnée Listing. Elle comporte un

paramètre qui est le nombre entier non signéxpour lequel on veut déterminer s’il
est auto-descriptif ou non. Nous n’allons pas utiliser certaines propriétés énoncées
préalablement afin de garder un temps de calcul qui nous permettra de comparer
les différentes améliorations proposées. En effet, si on utilise le fait qu’un nombre
auto-descriptif se termine par0, il suffit de calculer le premier reste de la division
par10pour trouver le premier chiffre et la recherche des nombres auto-descriptifs,
en utilisant cette propriété, s’exécute en moins de2secondes.
Nous allons donc nous focaliser sur les trois points suivants :
•
conversion du paramètrexen base 10, en d’autres termes : détermination
desdi
•
détermination du nombre d’occurrences de chaque chiffre, soit la détermina-
tion desci
•
comparaison du nombre d’occurrences avec leiième chiffre, en fait, compa-
raison desdiavec lesci
Dans cette première version, on utilise les fonctionnalités du C++ pour trans-
former le nombrexen caractères et déterminer lesdi.
La variablecountsreprésente le nombre d’occurrences de chaque chiffre, soit les
ci. On comptabilise donc le nombre d’occurrences de chaque chiffre en parcourant
la chaîne obtenue après conversion dexde la base 2 vers la base 10. Finalement,
on compare le nombre d’occurrences de chaque chiffre aux chiffres du nombre
représenté sous forme de chaîne.
1typedef ;
2typedef ;
3typedef ;
5bool (u32 )

```text
// nombre d'occurrences de chaque chiffre
u32 [10] 0,0,0,0,0,0,0,0,0,0};
// convertir le nombre en chaîne de caractères
string =std::to_string(x);
// compter les occurrences de chaque chiffre
for(u32 =0;i<s.length(); i)
++counts[u32)s[i]'0')
}
// comparer les occurrences aux chiffres
for(u32 =0;i<s.length(); i)
if(static_cast<u32>(s[i]48) counts[i])return ;
}
return ;
23}
```

> *Listing 17.2.1 – Nombre auto-descriptif, fonction de référence*

Fonction de référenceLe temps d’exécution sur AMD Ryzen 5 5600g est de 7,34 secondes.Attention
Attention cependant! Je me suis aperçu que le compilateur gcc dans sa
version 10 générait une fonction dont le temps d’exécution est d’environ 18
secondes alors que le même compilateur, dans sa version 12, génère du code
qui ne s’exécute plus qu’en 7,6 secondes, soit près de deux fois plus rapide.
La différence d’exécution tient à la conversion dexen chaîne. Nous utilisons
donc par la suite la version 12 de gcc quand cela est possible.

## 17.3 Plutôt que d’utiliser un tableau d’entiers pour compter les occurrences des

chiffres, on utilise un tableau d’octets. En effet, diminuer la taille des données
utilisées peut parfois apporter une amélioration.
Fonction de référence avec 8 bits
Le temps d’exécution sur AMD Ryzen 5 5600g est de 7,20 secondes en
utilisant des octets pour représenter le nombre d’occurrences de chaque
chiffre.
On en déduit donc qu’il vaut mieux travailler sur un tableau d’octets que sur un
tableau d’entiers en général (cf. Section) même si l’amélioration est faible.

## 17.4 Plutôt que de convertirxen chaîne de caractères, nous allons la convertir

directement en chiffres que l’on va stocker dans un tableau (d’entiers ou d’octets)
appelédigitsen faisant des divisions par10afin d’obtenir chaque chiffre (lignes 7
à 12 du Listing). A chaque nouveau reste trouvé on incrémente le tableau
countsen conséquence et on stocke le reste dans le tableaudigits.
1bool (u32 )
3 u8 [10] 0,0,0,0,0,0,0,0,0,0};
4 u8 [10];

```text
// convertir x et compter les occurrences
i32 =0;
while(x)
u32 =x%10;
digits[i++ u;
++counts[u];
x=x/10;
}
// comparer le nombre d'occurrences avec les chiffres
i32 ;
for(j=0,i;i>=0;i,j)
if(digits[i] counts[j])return ;
}
return ;
23}
```

> *Listing 17.4.1 – Nombre auto-descriptif, fonction de conversion en chiffres*

Au final on obtient le remplissage des tableaux suivants :
Indice012345678910. . .15
counts2 0 0 0 0 0 0 0 0
digits0 0 0 0 0 0 0 0 0
Fonction avec conversion 8 bits
C’est en fait cette version qui est la plus efficace lorsque traduite par le
compilateur car elle ne prend que 4,22 secondes pour s’exécuter et c’est elle
qu’il va falloir tenter de battre. La version utilisant des entiers prend quant à
elle 5,83 secondes.
La raison de l’efficacité est assez simple : la conversion est rapide car elle est
optimisée et la division par 10 est remplacée par une multiplication par un invariant,
puis le calcul du reste de la division est effectué par multiplication du dividende et
soustraction. En outre, la boucle de conversion est dépliée.

## 17.5 Etant données les différentes version précédentes, on peut se demander si la

traduction assembleur ne serait pas plus performante.

### 17.5.1 Dans cette première version, on se contente de traduire la version C de l’Algo-

rithme
de la Table
fonctions.
Cste/Param/VarTypeParamètreRegistreDescription
x u32 [ebp+8] eax nombrex
counts u8 [] Pile esp occurences
digits u8 [] Pile esp conversion
i u32 ecx indice
TABLE17.2– Association entre variables et registres pour les fonctions assembleur recher-
chant les nombres auto-descriptifs
Les registresebx,esietedidevront être sauvegardés car ils ne doivent pas être
modifiés pour le sous-programme appelant d’après les conventions d’appel du C
en 32 bits et nous allons les utiliser. Le registreedxsera mis à 0 et ne contiendra
aucune donnée au début du sous-programme. Après chaque division,edxcontient
le reste de la division par 10, c’est à dire la variableudu Listing.
1ad_asm_v1:

```nasm
push
mov ,esp
mov ,ebp+8]
sub ,44 ; on réserve l'espace pour stocker
and ,31 ; counts, digits et les registres
mov [esp+32],ebx; ebx, esi, edi
mov [esp+36],edi
mov [esp+40],esi
vpxor ,ymm0 ; on met counts et digits à 0
vmovdqa[esp],ymm0
```

> *Listing 17.5.1 – Fonction assembleur - version 1 - début*

Les tableauxcountsetdigitssont stockés dans la pile en réservant (au moins)
44 octets et en alignant l’adresse du sommet de pile (esp) sur un segment de 32
octets (lignes 5 et 6 du Listing). Ces 44 octets se décomposent ainsi :
•12 octets pour sauvegarderebx,edietesi
•16 octets pour lesdipour aligner le tableaudigitssur une adresse multiple
de 16
•
16 octets pour lescipour aligner le tableaudigitssur une adresse multiple
de 16
On sauvegarde ensuite les registres à préserver et on on accèderacountset
digitspar l’intermédiaire deesp. En effet, on peut stockercountsdeespàesp+15
etdigitsdeesp+16àesp+26. Le tableaucountsdoit être initialisé à 0, on utilise
ici le registreymm0pour faire cela qui va permettre d’initialiser en une seule fois les
32 octets qui stockentcountsetdigits.
Pour réaliser la conversion dexen base10(voir Listing), on réalise des
divisions successives par10. En utilisant l’instructiondiv, on obtient le quotient
danseaxet le reste dansedx, ce qui est très pratique.
A la différence du codeC
++, on va stocker les chiffres (restes de la division)
dans l’ordre décroissant du tableaudigitsen commençant à l’indice9qui sera
stocké dansecx, puisque un entier non signé contient au maximum10chiffres.
Un foisxconverti et les tableauxcountsetdigitsremplis, il suffit de comparer
counts[j]àdigits[i]en partant deecx(voir Listing). En effet, pour
x= 21200, on obtient le remplissage suivant :
On utilise alorsedipour connaître le nombre de chiffres en calculant dans ce
registre la différence entre9etecx. Le registreedicontient alors le fameuxk,
défini dans l’introduction, qui correspond au nombre de chiffres de la traduction en
base10. Puis, on stocke dansesil’adresse de début du tableaudigitsà laquelle
1; ad_asm_v1 conversion

```nasm
mov ,10 ; constante 10 pour division par 10
mov ,9 ; i = 9, indice pour tableau digits
cmp ,10 ; si x < 10 alors aller en .x_lt_10
jl
6.while_x_ge_10: ; tantque x >= 10 faire
xor ,edx
div ; u, x = x % 10, x / 10
inc [esp+edx]
dec ; digits[ --i ] = u
mov [esp+ecx+16],dl
cmp ,10
jge ; fin tantque
; si x < 10, il n'est pas nécessaire de diviser
15.x_lt_10:
cmp ,0 ; si x == 0 alors aller en .next
jz
inc [esp+eax]
dec ; digits[ --i ] = x
mov [esp+ecx+16],al
```

> *Listing 17.5.2 – Fonction assembleur - version 1 - conversion*

Indice012345678910. . .15
counts2 0 0 0 0 0 0 0 0
digits0 0 0 0 0 2 0 0 0
on ajoute l’indiceecx. On n’a plus alors qu’à effectuer une simple boucleforet
comparercounts[i]soitesp+ecxàdigits[j], soitesi+ecx.
Si les deux tableaux sont égaux, on sortira de la fonction avec la valeur1(true)
danseax, ligne 15 du Listing.
Assembleur version 1 avec conversion 8 bitsCette version assembleur s’exécute en 5,59 secondes.

### 17.5.2 Une première amélioration consiste à remplacer la division par une multipli-

cation. On le sait, la division est très pénalisante par rapport à la multiplication.
Cela est possible ici car on divise par une constante (10), on peut donc remplacer
la division par une multiplication par invariant (cf. Sous-section).
On va donc modifier l’utilisation des registres en conséquence. On va multiplier
eax, en faitx, parebxqui contiendra la constanteCC_CC_CC_CDqui correspond à
0,1. On obtient alors le résultat dansedx:eax. Cependant, c’est la partie haute du
1; ad_asm_v1 comparaison et sortie de la fonction
2.next:
3 xor ,eax ; valeur de retour = faux
4 lea ,esp+ecx+16]

```nasm
mov ,9 ; longueur = nombre de chiffres
sub ,ecx
xor ,ecx ; i = 0
8.while_eq: ; faire
movzx ,byte[esp+ecx]
cmp ,esi+ecx]
jne
inc ; ++i
sub ,1
jnz ; tantque i < longueur
inc ; valeur de retour = vrai
16.end:
mov ,esp+32]
mov ,esp+36]
mov ,esp+40]
mov ,ebp
pop
ret
```

> *Listing 17.5.3 – Fonction assembleur - version 1 - comparaison et sortie*

résultat que l’on doit garder, doncedxque l’on décale alors de 3 rangs vers la droite
(cf. Section).
Le problème que l’on rencontre est qu’on ne dispose pas du reste de la division.
Il va donc falloir le calculer en prenant le résultat de la division par10, puis en le
multipliant par10et en le soustrayant dex. Plutôt que de faire une multiplication
par10, on va utiliser l’instructionleapour calculer5×x, puis on multipliera par2
on faisant un décalage de bits grâce à l’instructionshl.
Malgré tout, il va nous manquer un registre pour calculer le reste de la di-
vision. On va en effet utiliserebxpour calculer le reste de la division et éviter
les dépendances liées à l’utilisation deedx. On va donc utiliseredipour stocker
temporairement la valeur dex. Cela est possible car au final on n’a besoin que d’un
seul registre pour accéder àcountsetdigitspuisquecountsdébute enesiet que
digitsdébute enesi+ 16.
Le code correspondant est donné Listing.
Assembleur version 2 : multiplication au lieu d’une division
Cette version assembleur demande plus d’opérations s’exécute en 5,69 se-
condes soit une très légère dégradation par rapport à la version 1
1ad_asm_v2:

```nasm
push
mov ,esp
; ... identique à ad_asm_v1 ...
mov ,0xCCCCCCCD ; 0.1 dans edi
mov ,9
cmp ,10
jl
9.while_x_ge_10:
mov ,eax ; sauvegarde de x dans ebx
mul ; edx:eax <- x * 0.1
shr ,3 ; edx <- edx / 8 (éq. x/10)
lea ,edx+edx*4]
shl ,1 ; esi = 2*5*(x/10)
sub ,esi ; calcul du reste u de la division
dec ; --i
inc [esp+ebx]
mov [esp+ecx+16],bl ; digits[ i ] = u
mov ,edx ; eax <- x/10
cmp ,10
jge
22.x_lt_10:
; ... identique à ad_asm_v1 ...
mov ,ebp
pop
ret
```

> *Listing 17.5.4 – Fonction assembleur - version 2 - remplacement de la division par une*

multiplication

### 17.5.3 On peut garder le remplacement de la division par une multiplication de la

fonction précédente et ajouter le dépliage de la boucle de conversion en base 10.
Assembleur version 3 : multiplication et dépliage
Cette version assembleur s’exécute en 4,32 secondes, le dépliage est donc ici
efficace et intéressant.

### 17.5.4 Plutôt que de comparer les tableauxdigitsetcountsélément par élément

grâce à une bouclefor, on peut le faire de manière vectorielle en chargeantdigits
dans un premier vecteur etcountsdans un autre vecteur. Pour que cela fonctionne
il faut que l’espace donné àdigitssoit plus grand que 16 octets, on va donc
doubler la taille dedigitset occuper 32 octets qui seront mis à 0.
Pour comparer les tableaux (voir ci-dessous), on chargecountsdansxmm1et
digitsdansxmm2. On utilise l’instructionpcmpeqb, ici dans sa version AVX, qui
compare chacun des octets des deux registres et remplace les octets dexmm1par
0xFFsi les deux octets sont égaux ou par0x00s’ils sont différents. Si les deux
registres contiennent les mêmes valeurs chaque octet du registrexmm1aura la
valeur0xFF. On utilise ensuite l’instructionpmovmskbtous les bits de poids fort de
chaque octet dexmm1, le résultat étant placé dansedx. Au final, on obtient dans
edxla valeur0xFFFFsi les deux registres vectoriels sont égaux. L’utilisation de
l’instructionsetepermet de fixereaxà0si les registres vectoriels sont différents
ou à1s’ils sont égaux.
1 xor ,eax ; valeur de retour : false
2 vmovdqa ,esp]
3 vmovdqu ,esp+ecx+16]
4 vpcmpeqb ,xmm2 ; comparer octet par octet
5 vpmovmskb ,xmm1 ; récupérer le masque issu

```nasm
; de la comparaison
cmp ,0xFFFF ; s'il est égal à 0xFFFF alors
; tous les octets sont identiques
sete ; dans ce cas mettre eax à true
```

La version précédente est écrite en AVX. On peut également l’écrire en SSE.
Cependant, il n’est pas recommandé de mixer SSE et AVX notamment sur certains
processeurs Intel. Travailler en AVX, surymm0par exemple, puis passer au SSE, et
travailler surxmm0, pose un problème relatif à la sauvegarde de la partie haute de
ymm0. En fait cela ne devrait poser aucun problème puisque seule la partie basse
doit être utilisée pour les calculs. Chez Intel, il est nécessaire de sauvegarder la
partie haute du registre ce qui peut prendre jusqu’à 70 cycles. La seule explication
plausible est probablement que le choix a été fait, chez Intel, de travailler sur le
registre en totalité même lorsque l’on n’agit que sur le SSE. Dès lors, si on veut
garder une certaine cohérence des valeurs contenues dans les registres, on se doit
de sauvegarder la partie haute, réaliser le calcul, puis restaurer la partie haute.
Assembleur version 4 : comparaison finale vectorielle
Cette version assembleur s’exécute en 4,31 secondes, la comparaison vec-
torielle apporte un gain faible en général mais plus important sur d’autres
architectures.

### 17.5.5 Plutôt que de réaliser des divisions par10, il peut être intéressant de réaliser

des divisions par100, on aura alors deux fois moins de divisions. De plus, nous
allons remplacer la division par des multiplications par0,01.
Le code correspondant figure Listing. On calcule q=x/100 par multipli-
cation et décalage (lignes 7 et 8). Il faut ensuite calculer le reste de la division en
calculantx−100×q , sachant queqest le résultat d’une division entière. On réalise

```nasm
mov ,0x51EB851F ; edi = 0.01
mov ,9 ; indice dans digits
cmp ,10 ; si x < 10 alors traduire
jl ; directement
5.while_x_ge_10:
mov ,eax ; on sauvegarde x
mul ; on multiplie par 0.01
shr ,5 ; on décale edx de 5 rangs à droite
; on calcule ensuite le reste de la division
lea ,edx+edx*4]; esi = 5 * (x/100)
lea ,esi+esi*4]; eax = 5 * (5 * (x/100))
shl ,2 ; eax = 4 * 25 * (x/100)
sub ,eax ; obtenir le reste
mov ,edx ; eax = x/100
movzx ,word[values_100+ebx*2]
sub ,2
mov [esp+ecx+16],dx
movzx ,dh
xor ,dh
inc [esp+ebx]
inc [esp+edx]
cmp ,10
jge
24.x_lt_10:
cmp ,0
jz
inc [esp+eax]
dec
mov [esp+ecx+16],al
```

> *Listing 17.5.5 – Fonction assembleur - versions 5 - remplacement de la division par une*

multiplication
le calcul grâce à deux instructionsleaet un décalage qui permettent d’obtenir
4×5×5×q (lignes 10 à 12) et on retranche cette quantité àx(ligne 13) pour
obtenir le resteu.
Une foisuobtenu, on utilise une table de conversion (values_100) qui permet
de récupérer deux octets sous forme d’un mot correspondant aux deux chiffres
décimaux du reste. Siuvaut17, on récupère dabsedx(ligne 15) la valeur0x0107.
On sépare ensuite chacun des chiffres en en plaçant un dansedxet l’autre dans
ebx(lignes 18 et 19 du Listing). On n’a plus qu’à stocker les chiffres dans
le tableaudigits(lignes 16, 17) et incrémenter les éléments correspondants de
counts(lignes 20 et 21).
La dernière partie du code (lignes 25 à 29) consiste à stocker le dernier reste
éventuel qui sera inférieur à10.
Assembleur version 4 : comparaison finale vectorielle
On a écrit trois versions différentes :
•
version 100 (ou méthode 13 dans la section des résultats) : division par
100 (par multiplication par0.01) : 3,62 secondes
•
version 101, amélioration de la version 100 avec dépliage de la conver-
sion : 3,56 secondes
•
version 102, amélioration de la version 101 avec comparaison vecto-
rielle AVX : 5,01 secondes

### 17.5.6 LeBinary Coded Decimalou Décimal Codé (en) Binaire est un ancien système

de codage qui remonte aux années 1960. Il consiste à coder un nombre en plaçant
deux chiffres décimaux par octet. Chaque quartet (ounibbleen anglais) représente
donc 1 ou 2 chiffres. On dispose en assembleur d’une vieille instructionfbstp
qui date du 8086 d’Intel. Elle permet de stocker au format BCD de 10 octets, un
nombre, stocké au niveau de la FPU.
Par exemple, la valeur -1234567890 sera stockée au format BCD sous la forme :
Octet9 8 7 6 5 4 3 2 1 0
0x80 0x00 0x00 0x00 0x00 0x12 0x34 0x56 0x78 0x90
Le bit de poids fort indique ici le signe du nombre, s’il est à un, il s’agit d’un
nombre négatif. On peut, par exemple, charger et stocker la valeur suivante :
−123456789012345678. qui comprend 18 chiffres. Au delà, il se produit une erreur
liée à la précision.
On va donc chargerxcomme un entier au niveau de la FPU et stocker le résultat
au format BCD dans la pile. On aura donc besoin de10octets supplémentaires qui
correspondent au format de stockage BCD que l’on va étdendre à16octets afin de
garder l’alignement des données. Comme on ne traite que des entiers non signés
qui comportent au maximum 10 chiffres et qui sont positifs ou nul, seuls 5 octets
sont utilisés pour représenter le nombre.
1 fild [ebp+8]
2 fbstp [esp+32]
Il faut ensuite relire le nombre au format BCD pour compter le nombre d’occur-
rences de chaque chiffres. J’ai mis au point deux méthodes :
•
une première méthode qui décompose le nombre en utilisant les instructions
assembleur classiques et qui fait appel également à des tables de conversion
pour déterminer la longueur du nombre en terme de chiffres
•
une seconde méthode qui se base sur des instructions spécifiques commepdep
etmovbeafin d’extraire les chiffres BCD et stocker chacun dans un octet.

#### 17.5.6.1 Dans un premier temps, on détermine la longueur du nombre au format BCD :

on part du dernier chiffre et on revient vers le premier (voir Listing). Dès
qu’on a trouvé un chiffre différent de0, on peut déterminer la longueur.
1; table des longueurs d'un nombre au format BCD
2; en fonction du bit de poids fort
3bcd_tlengths:
4 db ,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,
5 db ,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8
7 ...
8 fild [ebp+8]
9 fbstp[esp+32]

```nasm
mov ,0
13; détermination de la longueur
14; on part du 10ième quartet en on descend pour trouver
15; le premier quartet non égal à 0
16.find_length:
xor ,ebx ; ebx <- 0 valeur qui sera
; soutrait à ecx
mov ,10 ; taille initiale de 10
movzx ,byte[esp+36]
test ,eax ; si il est à 0 alors considérer
; les 4 premiers octects
jz
test ,0xF0 ; si le 10ième chiffre est à 0
setz ; alors mettre 1 dans bl
sub ,ebx ; soustraire à ecx
jmp [bcd_cv_jumps+ecx*4]
30.length_1_to_8:
mov ,esp+32]
; au format BCD dans eax
bsr ,eax ; trouver le bit de poids fort
movzx ,byte[bcd_tlengths+ebx]
jmp [bcd_cv_jumps+ecx*4]; convertir
```

> *Listing 17.5.6 – BCD - version 1 - Détermination de la longueur du nombre*

La méthode est assez complexe puisqu’elle s’intéresse en premier au 5ième octet
qui représente les nombres de 9 ou 10 chiffres. Si cet octet est à0alors le nombre
comporte 1 à 8 chiffres, le cas du0étant traité en amont, au tout début de la
fonction en renvoyant la valeurfalse. Pour traiter les huit chiffres potentiels qui sont
donc stockés sur4octets, on charge ce double mot danseax, puis on calcule dans
ebxle bit de poids fort de ce double mot en utilisant l’instructionbsr. Le résultat
sera compris entre 0 et 31. On charge finalement à partir d’une table de 32 octets,
la taille correspondante. Par exemple si le bit de poids fort est à l’indice 8, 9, 10 ou
11, il s’agit d’un nombre de3chiffres.
En fois la longueur déterminée, on passe à la conversion du nombre (cf. Lis-
ting).
1bcd_cv_jumps:
2 dd ,..@cv1,..@cv2,..@cv3,..@cv4
3 dd ,..@cv6,..@cv7,..@cv8,..@cv9,..@cv10
5 ...
6..@cv10: ; convertir 10 chiffres
7 cvt2
8..@cv8: ; convertir 8 chiffres
9 cvt2
10..@cv6: ; convertir 6 chiffres
11 cvt2
12..@cv4: ; convertir 4 chiffres
13 cvt2
14..@cv2: ; convertir 2 chiffres
15 cvt2
16 jmp
18..@cv9: ; convertir 9 chiffres
19 cvt1
20 jmp
21..@cv7: ; convertir 7 chiffres
22 cvt1
23 jmp
24..@cv5: ; convertir 5 chiffres
25 cvt1
26 jmp
27..@cv3: ; convertir 3 chiffres
28 cvt1
29 jmp
30..@cv1: ; convertir 1 chiffres
31 cvt1
Listing 17.5.7 – BCD - version 1 - Conversion du nombre
Pour cela, en fonction de la longueur, on va se diriger vers un chemin de
traduction spécifique. On définit à cet effet, une table d’adresses dont l’indice donne
l’adresse du code qui correspond à la traduction. Il faut notamment distinguer
les nombres dont le nombre de chiffres est pair de ceux qui ont un nombre de
chiffres impair. Dans ce dernier cas, il ne faut traiter que les premiers 4 bits de
l’octet que l’on aura chargé dans le registreeax. Les deux macro-instructions pour
la conversion sont données Listing.
1; convertir un octet qui ne contient qu'un chiffre
2; au format BCD en partie basse
3%macro cvt1 1

```nasm
movzx ,byte[esp+1]
mov [esp+16+edi],al ; digits[ i ] = u
inc [esp+eax]
add ,1 ; ++i
8%endmacro
10; convertir un octet qui contient deux chiffres
11%macro cvt2 1
movzx ,byte[esp+1]
movzx ,word[bcd_table+eax*2]
; chiffres sur 2 octets
movzx ,dh ; dans edx
xor ,dh ; et ebx
inc [esp+edx]
inc [esp+ebx]
mov [esp+16+edi],bl ; stockage de chiffre2
mov [esp+17+edi],dl ; stockage de chiffre1
add ,2
22%endmacro
```

> *Listing 17.5.8 – BCD - version 1 - Macros instructions pour la conversion*

La macro instructioncvt1ne convertit qu’un chiffre en partie basse du registre
al. La macro instructioncvt2convertit deux chiffres. Pour ce faire, on utilise une
table nomméebcd_tablede200octets organisée de manière à ce que deux octets
consécutifs correspondent à deux chiffres codés chacun sur un octet. On charge
donc ces deux octets dansdx(ligne 13) grâce à l’instructionmovzxqui complète
la partie haute deedxavec des0. Puis on place le chiffre qui se trouve endhdans
le registreebxet on met ensuitedlà0. Les registresebxetedxcontiennent alors
les indices dans le tableaucountsqui doivent être incrémentés. En dernier lieu, on
place les chiffres dans le tableaudigits.
Enfin, la dernière étape, figurant Listing, consiste à comparer le nombre
d’occurrences de chaque chiffre et le nombre traduit au format un chiffre décimal
par octet, et ressemble à ce que l’on a pu déjà faire.
1.compare:
2 xor ,ecx
3 xor ,eax
4align
5.do_while:

```nasm
movzx ,byte[esp+ecx]
cmp ,esp+16+ecx]
jne
inc
cmp ,edi
jl
12.end_while:
mov ,1
```

> *Listing 17.5.9 – BCD - version 1 - Comparaison du nombre d’occurrences des chiffres*

avec le nombre

#### 17.5.6.2 On utilise pour la conversion du nombre au format BCD deux instructions

spécifiques. La première appeléepdep(Parallel Bits Deposit) fait partie du jeu
d’instructions BMI2 (Bit Manipulation Instructions). Elle comporte trois opérandes
sous la forme de trois registres 32 ou 64 bits et permet de sélectionner et copier les
bits de la seconde opérande dans la première en utilisant un masque de sélection
placé dans le troisième registre. Par exemple, le code suivant :

```nasm
mov ,0xFEDC
mov ,0x0F0F
pdep ,ebx,ecx
```

donnera le résultat0xD0Cdanseaxcomme le montre la Figure. Il permet
de sélectionner les deux premiers quartets deebxet les transformer en octets dans
eax.
FIGURE17.1 – Instruction PDEP
L’autre instruction utilisée estmovbe, elle fait partie normalement du jeu d’ins-
tructions NNI (pourNehalem New Instructions) et remonte à 2008, bien que je n’ai
pas trouvé d’informations exactes à ce sujet. L’instruction est également appelée
Move Data After Swapping Bytes. Elle inverse les octets d’un registre 16, 32 ou 64
bits. Elle possède une particularité qui tient à ses opérandes : l’une des opérandes
est un registre et l’autre est une adresse mémoire. On ne peut malheureusement
pas avoir deux opérandes de type registre comme c’est le cas de la plupart des
instructions. Ainsi, le code suivant :

```nasm
mov ,0x01020304
movbe [x],eax
mov ,x]
```

permet de récupérer la valeur0x04030201danseax.
La traduction du nombre au format BCD vers une représentation par octet est
donnée Listing.

```nasm
; ex. eax = 1234567890
mov ,esp+36]
; chiffres : 0x12
mov ,0xF0F0F0F
pdep ,eax,ecx; décalage ebx = 0x0102
movbe[esp+16],ebx; stockage
mov ,esp+32]
; eax = 34567890
pdep ,eax,ecx; ebx = 0x07080900
movbe[esp+24],ebx; stockage 0x09080706
shr ,16 ; chiffres 5 à 8
pdep ,eax,ecx; edx = 0x03040506
movbe[esp+20],edx; stockage 0X06070809
```

> *Listing 17.5.10 – BCD - version 2 - Conversion*

Pour trouver la longueur du nombre, il suffit de parcourir le tableau jusqu’à
trouver un chiffre non nul.
1 lea ,esp+16]
2.find_length:

```nasm
movzx ,byte[edi]
test ,al
jnz
add ,1
jmp
8.end_find_length:
```

> *Listing 17.5.11 – BCD - version 2 - Trouver la longueur du nombre*

Assembleur avec codage BCD
Ces deux versions assembleur sont totalement inefficaces et prennent plus de
23 secondes pour s’exécuter sur AMD Ryzen 5 5600g.

### 17.5.7 Enfin, une dernière version consiste à diviser les nombres par10_000bien

évidemment quand ceux-ci sont supérieurs ou égaux à cette valeur. Cela nécessite
de créer une table de10_000entiers non signés sur 32 bits qui contiennent le reste
de la division par10_000comme on l’a fait pour la division par100.

```nasm
mov ,0xD1B71759; 0.0001
mov ,eax ; sauvegarde eax
mul ; multiplie par 0.0001
shr ,13
imul ,edx,10000; eax = 10000*(x/10000)
sub ,eax ; reste dans ebx
mov ,edx ; sauvegarde de x/10000
; chargement du reste sous forme de 4 octets
mov ,values_10000_inv+ebx*4]
sub ,4
mov [esp+ecx+16],edx
; incrémentations de counts
movzx ,dh
movzx ,dl
inc [esp+ebx]
inc [esp+eax]
shr ,16
movzx ,dh
movzx ,dl
inc [esp+ebx]
inc [esp+eax]
mov ,esi
```

> *Listing 17.5.12 – Division par 10000 - Conversion*

Le code correspondant pour la conversion par10_000est présenté Listing.
On commence par multipliereaxpar0,0001puis on calcule le reste. Ici, on uti-
lise l’instructionimulavec trois opérandes au lieu d’un code n’utilisant que des
additions et des décalages comme par exemple :
1 lea ,edx+edx*4] *(x/10000)
2 lea ,esi+esi*4] *(x/10000)
3 lea ,eax+eax*4] *(x/10000)
4 lea ,esi+esi*4] *(x/10000)
5 shl ,4 ; 10000*(x/10000)
6 sub ,eax
qui prend plus de temps à l’exécution.

## 17.6 Afin de tester les différentes versions que nous avons écrites sur différentes

architectures, nous allons examiner les résultats obtenus pour les méthodes sui-
vantes :
•
1: version C++ avec conversion dexgrâce àstd::to_stringet tableaux
d’entiers
•
2: version C++ avec conversion dexgrâce àstd::to_stringet tableaux
d’octets
•
3: version C++ avec conversion par divisions successives et tableaux d’entiers
•4: version C++ avec conversion par divisions successives et tableaux d’octets
•6: version assembleur traduction de la méthode 4
•
7: amélioration de la méthode 6 avec remplacement de la division par une
multiplication
•8: amélioration de la méthode 7 avec dépliage
•9: amélioration de la méthode 8 avec comparaison vectorielle
•10: méthode 9 avec mélange d’instructions SSE et AVX
•11: méthode 9 avec uniquement des instructions SSE
•12: méthode 9 avec uniquement des instructions AVX
•13: division par 100 mais pratiquée avec multiplication et table de valeurs
•14: amélioration de la méthode 13 avec dépliage de la conversion
•15: amélioration de la méthode 14 avec comparaison vectorielle
•16: utilisation du format BCD, instructions assembleur classiques
•17: utilisation du format BCD, instructionspdepetmovbe
•23: division par 10000, version 4
Etant donné que nous travaillons avec des entiers non signés, nous ne pouvons
trouver que les six premiers nombres auto-descriptifs, le septième nécessitant une
représentation sur 64 bits.
Nous avons testé les fonctions sur différents matériels, cependant avec gcc 10
sur certaines machines et gcc 12 sur d’autres ce qui implique des temps de calculs
supérieurs avec gcc 10 pour les méthodes 1 à 4. C’est le cas pour le Ryzen 7 1700X
pour lequel on utilise gcc 10. On a donc fait figurer la version de gcc utilisée dans
les tables
processeurs Intel et AMD respectivement.
L’analyse des résultats montre que la méthode 4, traduite par le compilateur
est généralement performante. Cependant les méthodes 13 et 14 qui utilisent des
divisions par 100 plutôt que par 10 se révèlent bien plus performantes. Visiblement
la méthode 13 est la plus performante chez Intel alors que la méthode 14 l’est chez
AMD.
N° Marque IntelIntelIntelIntelIntelIntel
Gamme PentiumCore i7Core i5Core i3Core i5Core i7
Modèle D 8603570k 6100 7400 4790
1 cpp 32 bits 42.74 20.40 19.03 15.91 16.83 10.38
2 cpp 8 bits 40.36 19.39 15.04 11.58 13.52 11.06
3 tabs 32 bits 29.86 14.68 12.69 10.92 11.54 7.77
4 tabs 8 bits 26.44 14.22 10.60 7.08 7.53 7.95
6 asm v1 95.46
7 asm v2 95.20
8 asm v3 24.02 12.02 9.63 6.87 7.28 7.47
9 asm v4 − − − 6.71 7.10 7.33
10asm v5 SSE/AVX − − − 8.64 9.37 31.74
11 asm v6 SSE 37.36 12.09 10.23 8.64 9.40 8.35
12 asm v7 AVX − − − 8.41 9.22 8.14
13 asm v100 21.79 9.94 7.86 6.01 6.50 6.36
14 asm v101 21.55 10.19 7.85 6.02 6.38 6.35
15 asm v102 − − 9.01 7.32 7.96 7.23
16 asm bcd v1108.34
17 asm bcd v2 − − − 44.53
23 asm v10004 20.56
ratio (1 / 23) 2.07 2.56 2.79 3.28 3.23 1.84
ratio (4 / 23) 1.28 1.79 1.13 1.45 1.44 1.41
TABLE17.3– Résultats comparatifs des méthodes pour la recherche des nombres auto-
descriptifs pour les architectures anciennes Intel
Mais c’est la méthode des divisions par 10000 qui est au final la plus intéressante.
On notera que pour l’Intel i5 12400F, utiliser à la fois le SSE et l’AVX cause
problème avec un temps d’exécution de plus de 50 secondes. Alors que pour les
autres architectures ce problème n’existe pas.
N° Marque IntelIntel IntelIntel
Gamme Core i7Core i5Core i7Core i5
Modèle 870010400f10850h12400
1 cpp 32 bits13.35 14.98 8.88 6.25
2 cpp 8 bits 9.50 11.15 8.44 5.91
3 tabs 32 bits 9.90 10.22 5.47 3.82
4 tabs 8 bits 5.78 6.87 5.20 3.88
6 asm v115.83
7 asm v215.39
8 asm v3 5.73 6.56 5.29 3.51
9 asm v4 5.58 6.35 5.04 3.39
10asm v5 SSE/AVX 7.06 8.22 6.49 58.40
11 asm v6 SSE 7.05 8.34 6.50 5.17
12 asm v7 AVX 6.87 8.07 6.29 5.17
13 asm v100 4.97 5.87 4.57 2.82
14 asm v101 4.86 5.76 4.60 2.87
15 asm v102 6.18 7.01 5.51 4.64
16 asm bcd v136.89
17 asm bcd v238.07
23 asm v10004 4.00
ratio (1 / 23) 3.33 3.28 2.24 2.57
ratio (4 / 23) 1.44 1.50 1.31 1.59
TABLE17.4– Résultats comparatifs des méthodes pour la recherche des nombres auto-
descriptifs pour les architectures récentes Intel
N° Marque AMD AMD AMD AMD
Gamme Phenom AthlonRyzen 7Ryzen 5
Modèle 1090T200 GE 1700X 5600g
2009 2018 2017 2020
gcc 10 10 10 12
1 cpp 32 bits 22.33 17.20 15.30 12.34
2 cpp 8 bits 21.45 15.90 13.15 8.01
3 tabs 32 bits 15.54 11.24 10.05 9.19
4 tabs 8 bits 12.52 8.75 7.87 5.09
6 asm v1 39.17 5.81
7 asm v2 39.29 5.80
8 asm v3 12.01 9.24 8.36 4.44
9 asm v4 − 9.29 8.36 4.40
10asm v5 SSE/AVX − 11.89 10.71 5.52
11 asm v6 SSE 12.53 11.84 10.73 6.10
12 asm v7 AVX − 11.90 10.71 5.48
13 asm v100 9.78 7.96 7.25 3.67
14 asm v101 9.75 7.55 6.29 3.66
15 asm v102 − 9.64 8.71 5.08
16 asm bcd v1 35.83
17 asm bcd v2 − 67.41
23 asm v10004 8.77
ratio (1 / 23) 2.54 3.05 2.74 3.95
ratio (4 / 23) 1.42 1.55 1.41 1.63
TABLE17.5– Résultats comparatifs des méthodes pour la recherche des nombres auto-
descriptifs pour les architectures AMD
AnnexeA
Conventionsd’appelLinux
Nous récapitulons Table
Pour une vision exhaustive des conventions d’appel on pourra se référer à [1].
Catégorie Linux 32 bits Linux 64 bits
Registres EAX,ECX,EDX, RAX,RCX,RDX,RSI,RDI
modifiables ST0-ST7, R8-R11,ST0-ST7
par l’appelé XMM0-XMM7 XMM0-XMM15
Registres EBX,EBP, RBX,RBP
à préserver dansESI,EDI R12-R15
l’appelé si modifiés
Paramètres Pile[ebp+8],[ebp+12], ...RDI,RSI,RDX,RCX,
R8,R9, (entiers)
XMM0–7(flottants)
Valeur de retour
- entier EAX,EDX:EAX RAX,RDX:RAX
- flottant ST0 XMM0 Appel rapide ECX,EDX mode par défaut (fast call) TABLEA.1 – Conventions d’appel Linux 32 et 64 bits Note : en architecture 64 bits si le sous-programme appelé possède plus de six paramètres entiers ou plus de huits paramètres flottants alors les paramètres restants seront placés dans la pile. 440 ANNEXE A. CONVENTIONS D’APPEL LINUX AnnexeB LeGNUDébogueur GDB le GNU débogueur est un logiciel qui permet de déboguer, c’est à dire de trouver des bogues (oubugsen anglais) dans un programme. La plupart des pro- blèmes que l’on rencontre lors de la phase de débogage d’un programme concerne les pointeurs ou le débordement de pile losrque l’on appelle de manière récursive une fonction. Pour analyser son programme il suffit de compiler les sources avec les options de débogage : •pournasmil s’agit de-g -F dwarfsous Linux •pour les compilateursC/C++, on utilise l’option-gou-ggdb Une fois l’exécutable obtenu, on lancegdbou l’un des programmes basés surgdb et qui dispose d’une interface graphique commexxgdbouddd, leData Display De- bugger. Cependant, certaines commandes degdbsont intéressantes à connaître pour être utilisées dans ces interfaces graphiques qui sont parfois un peu rudimentaires ou capricieuses lors de l’affichage. B.1 Le programme sur lequel nous allons travailler est celui du Listing. On notera deux bogues dans ce programme : • en lignes 25 et 29, alors qu’on a déclaré un tableau de 10 entiers, on utilise une onzième valeur • en ligne 34, l’appel récursif de la fonction va provoquer une saturation de la pile 442 ANNEXE B. LE GNU DÉBOGUEUR 1#include 2#include 3using ; 5int*table; 7typedef { 8 string ,prenom,adresse; 9 int ; 10}Person; 12int (int ,Person ) 13 if(n==0) 14 return .t; 15 }else{ 16 return +function(n-1,p); 17 } 18} 20int () 22 table=new [10]; 24 for(int =0;i<11;i) 25 table[i]i; 26 } 28 for(int =0;i<11;i) 29 cout<<table[i] " "; 30 } 32 Person ; 33 person.t=1; 34 cout<<function(1000000,person); 36 return ; 37} Listing B.1.1 – Programme comportant quelques bogues B.2 On commence par compiler le programme avec l’option-ggdbet sans options d’optimisation car celles-ci pourraient par exemple dérécursiver la fonction qui posera problème par la suite. g++ -o test_gdb.exe test_gdb.cpp -Wall -std=c++11 -ggdb B.2. COMPILATION ET EXÉCUTION 443 Puis, on lancegdbsur l’exécutable : 1gdb ./test_gdb.exe 3GNU gdb (Ubuntu 9.2-0ubuntu1~20.04.1) 9.2 4Copyright (C) 2020 Free Software Foundation, Inc. 5License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html> 6This is free software: you are free to change and redistribute it. 7There is NO WARRANTY, to the extent permitted by law. 8Type "show copying" and "show warranty" for details. 9This GDB was configured as "x86_64-linux-gnu". 10Type "show configuration" for configuration details. 11For bug reporting instructions, please see: 12<http://www.gnu.org/software/gdb/bugs/>. 13Find the GDB manual and other documentation resources online at: 14 <http://www.gnu.org/software/gdb/documentation/>. 16For help, type "help". 17Type "apropos word" to search for commands related to "word"... 18Reading symbols from ./test_gdb.exe... 19(gdb) A partir du prompt degdb, on tape la commanderunafin de lancer l’exécution du programme : (gdb) run 2Starting program: test_gdb.exe 3test_gdb.exe: malloc.c:2379: sysmalloc: Assertion`(old_top == 4initial_top (av) && old_size == 0) || ((unsigned long) (old_size) >= MINSIZE 5&& prev_inuse (old_top) && ((unsigned long) old_end & (pagesize - 1)) == 0)' 6failed. 8Program received signal SIGABRT, Aborted. 9__GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50 1050 ../sysdeps/unix/sysv/linux/raise.c: Aucun fichier ou dossier de ce type. On lance ensuite la commandebacktrace(bten abrégé) afin de visualiser les appels de fonctions. Celle-ci affiche desframes, c’est à dire les différents appels de sous-programmes qui sont réalisés. (gdb) bt 2#0 __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50 3#1 0x00007ffff7bcc859 in __GI_abort () at abort.c:79 4#2 0x00007ffff7c3f30a in __malloc_assert (...) at malloc.c:298 5#3 0x00007ffff7c4196f in sysmalloc (nb=nb@entry=1040, av=av@entry=0x7ffff7d96b80 6<main_arena>) at malloc.c:2379 444 ANNEXE B. LE GNU DÉBOGUEUR 7#4 0x00007ffff7c427c3 in _int_malloc (av=av@entry=0x7ffff7d96b80 <main_arena>, 8bytes=bytes@entry=1024) at malloc.c:4141 9#5 0x00007ffff7c44184 in __GI___libc_malloc (bytes=1024) at malloc.c:3058 10#6 0x00007ffff7c2bd34 in __GI__IO_file_doallocate (...) at filedoalloc.c:101 11#7 0x00007ffff7c3bf00 in __GI__IO_doallocbuf (...) at libioP.h:948 12#8 0x00007ffff7c3af60 in _IO_new_file_overflow (...) at fileops.c:745 13#9 0x00007ffff7c396e5 in _IO_new_file_xsputn (...) at libioP.h:948 14#10 _IO_new_file_xsputn (...) at fileops.c:1197 15#11 0x00007ffff7c2d3f1 in __GI__IO_fwrite (...) at libioP.h:948 16#12 0x00007ffff7edc4a8 in ... from /lib/x86_64-linux-gnu/libstdc++.so.6 17#13 0x00007ffff7eead5f in std::ostream& std::ostream::_M_insert<long>(long) () 18from /lib/x86_64-linux-gnu/libstdc++.so.6 19#14 0x000055555555535c in main () at test_gdb.cpp:29 20(gdb) Dans le cas présent c’est la dernière frame (la frame 14) qui nous indique qu’à partir de la ligne29de notre programme, dans la fonctionmain, une série d’appels à provoquer l’erreur. On se redirige donc vers le code source de l’erreur en tapant : (gdb) frame 14 2#14 0x000055555555535c in main () at test_gdb.cpp:29 329 cout << table[ i ] << " "; 4(gdb) C’est donc l’instruction d’affichage qui a mené à l’erreur. B.3 On peut donc se demander ce que contient le tableau d’entierstable. Pour l’afficher on utilise la commandex/suivie du nombre d’éléments à afficher, ainsi que le format d’affichage et le type de données à afficher. On peut se référer à la Table On affiche par exemple les20double mots à partir du tableautable: (gdb) x/20d table 20x55555556aeb0: 0 1 2 3 30x55555556aec0: 4 5 6 7 40x55555556aed0: 8 9 10 0 50x55555556aee0: 0 0 0 0 60x55555556aef0: 0 0 0 0 On peut également afficher la variableide deux manières différentes : B.4. ELECTRIC FENCE 445 Format Type d (décimal) b (octet - 8 bits) u (décimal non signé) h (mot - 16 bits) t (binaire) w (double mot - 32 bits) o (octal) g (giant - 64 bits) x (hexadécimal) f (float) a (address) i (instruction) c (char) s (string) TABLEB.1 – Format et type d’affichage de gdb 1(gdb) x/1d &i 20x7fffffffdb0c: 0 3(gdb) print i 4\$1 = 0 Néanmoins, on comprend mal pourquoi le programme aurait provoqué une erreur lors de l’affichage de la première valeur. En fait, la génération de cette erreur provient de la boucle précédente et de l’affectation de la onzième valeur à la ligne 25du programme. B.4 Pour détecter cette erreur il existe un utilitaire appeléElectric Fencedont le but est de se concentrer sur deux types d’erreurs : •l’accès en dehors d’un espace mémoire alloué dynamiquement •l’accès à une zone mémoire désallouée parfree() Pour installerElectric Fence, il suffit d’installer le paquet du même nom : sudo apt install electric-fence 2dpkg -L electric-fence 3/. 4/usr 5/usr/lib 6/usr/lib/libefence.a 7/usr/lib/libefence.so.0.0 446 ANNEXE B. LE GNU DÉBOGUEUR 8... 9/usr/lib/libefence.so 10/usr/lib/libefence.so.0 On voit que les librairies sont installées dans/usr/lib. On lance alorsgdb, puis dans la console degdb, on saisit la ligne suivante avant de lancer l’exécution du programme ce qui permet de charger la librairie : (gdb) set environment LD_PRELOAD=/usr/lib/libefence.so 2(gdb) run 3Starting program: test_gdb.exe 5 Electric Fence 2.2 Copyright (C) 1987-1999 Bruce Perens <bruce@perens.com> 6[Thread debugging using libthread_db enabled] 7Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1". 9 Electric Fence 2.2 Copyright (C) 1987-1999 Bruce Perens <bruce@perens.com> 11Program received signal SIGSEGV, Segmentation fault. 120x0000555555555317 in main () at test_gdb.cpp:25 1325 table[ i ] = i; 14(gdb) print i 15\$1 = 10 Electric Fenceindique que l’erreur se situe sur la ligne25, on affiche alorsiqui vaut10. Or le tableau est de 10 entiers et on ne peut donc manipuler que les indices 0à9du tableau. On corrige alors les erreurs dans les deux bouclesforen lignes24 et28en remplaçant11par10. B.5 Après correction des erreurs, on recompile le programme et on relancegdb: (gdb) run 2Starting program: test_gdb.exe 4Program received signal SIGSEGV, Segmentation fault. 50x000055555555547d in Person::Person (this=<error reading variable: 6Cannot access memory at address 0x7fffff7feff8>) at test_gdb.cpp:7 77 typedef struct Person { L’erreur n’est pas facile à comprendre car elle masque la saturation de la pile. Dans ce cas il faut utiliser la commandebacktraceavec un argument de−1afin de connaître le nombre total de frames : B.5. ERREUR LIÉE AU DÉBORDEMENT DE PILE 447 1(gdb) bt -1 2#52396 0x0000555555555398 in main () at test_gdb.cpp:34 Il existe donc52396appels de sous-programmes dans la pile. Il suffit alors de relancer la commandebacktracesans argument : #0 0x000055555555547d in Person::Person (this=<error reading variable: 2Cannot access memory at address 0x7fffff7feff8>) at test_gdb.cpp:7 3#1 0x000055555555523d in function (n=947606, p=...) at test_gdb.cpp:16 4#2 0x0000555555555254 in function (n=947607, p=...) at test_gdb.cpp:16 5#3 0x0000555555555254 in function (n=947608, p=...) at test_gdb.cpp:16 6... 7#52394 0x0000555555555254 in function (n=999999, p=...) at test_gdb.cpp:16 8#52395 0x0000555555555254 in function (n=1000000, p=...) at test_gdb.cpp:16 9#52396 0x0000555555555398 in main () at test_gdb.cpp:34 On voit qu’il existe52395appels récursifs au sous-programme appeléfonction. On peut obtenir la valeur du sommet de pile grâce à la commandeinfo registers rsp en se plaçant dans la frame0et la frame52396: (gdb) frame 0 2#0 0x000055555555547d in Person::Person (this=<error reading 3variable: Cannot access memory at address 0x7fffff7feff8>) 4at test_gdb.cpp:7 57 typedef struct Person { 6(gdb) info registers rsp 7rsp 0x7fffff7feff0 0x7fffff7feff0 8(gdb) frame 52396 9#52396 0x0000555555555398 in main () at test_gdb.cpp:34 1034 cout << function( 1000000, person ); 11(gdb) info registers rsp 12rsp 0x7fffffffdb00 0x7fffffffdb00 On a donc une différence entre la frame0et la frame52396deffdb0016− 7feff016=7feb1016 , soit8_383_248 octets. Sachant que la pile possède une taille de 8Mo= 8_388_608octets, on a saturé la pile car lors du lancement du programme on a utilisé une partie de la pile. Deux possibilités s’offrent à nous : • soit modifier la taille de la pile en utilisant la commandulimitdans un terminal, mais cela n’est généralement pas recommandé •soit revoir notre programme en dérécursivant le sous-programme 448 ANNEXE B. LE GNU DÉBOGUEUR B.6 B.6.1 Il s’agit de la commandelistéventuellement suivie de la ligne du programme : (gdb) list 37 typedef struct Person { 48 string nom, prenom, adresse; 59 int t; 610 } Person; 812 int function( int n, Person p ) { 913 if (n == 0) { 1014 return p.t; 1115 } else { 12(gdb) list 24 1420 int main() { 1622 table = new int [ 10 ]; 1824 for (int i = 0; i < 10; ++i) { 1925 table[ i ] = i; 2026 } 2228 for (int i = 0; i < 10; ++i) { B.7 On utilise la commandeinfo registersqui peut être suivie du nom du registre ou alors de la commandeprint: (gdb) info registers 2rax 0x555555558040 93824992247872 3rbx 0x555555555590 93824992236944 4rcx 0x20 32 5rdx 0x7ffff7f903d0 140737353679824 6rsi 0x555555556005 93824992239621 7rdi 0x7ffff7d987e0 140737351616480 8rbp 0x7fffffffdc70 0x7fffffffdc70 9rsp 0x7fffffffdb70 0x7fffffffdb70 10r8 0x1 1 B.8. AFFICHER LE CONTENU DES VARIABLES 449 11r9 0x0 0 12r10 0x7ffff7de7cbc 140737351941308 13r11 0x7ffff7eea690 140737353000592 14r12 0x5555555550e0 93824992235744 15r13 0x7fffffffdd60 140737488346464 16r14 0x0 0 17r15 0x0 0 18rip 0x555555555319 0x555555555319 <main()+122> 19eflags 0x293 [ CF AF SF IF ] 20cs 0x33 51 21ss 0x2b 43 22ds 0x0 0 23es 0x0 0 24fs 0x0 0 25gs 0x0 0 26(gdb) info registers xmm0 27xmm0 {v4_float = {0x0, 0x0, 0x0, 0x0}, v2_double = {0x0, 0x0}, 28 v16_int8 = {0x0 <repeats 16 times>}, v8_int16 = {0x0, 0x0, 0x0, 0x0, 29 0x0, 0x0, 0x0, 0x0}, v4_int32 = {0x0, 0x0, 0x0, 0x0}, v2_int64 = {0x0, 0x0}, 30 uint128 = 0x0} 31(gdb) print $xmm0.v8_int16 32$4 = {0, 0, 0, 0, 0, 0, 0, 0} 33(gdb) print $eax 34$5 = 1431666752 B.8 Pour afficher le contenu d’une variable on utiliseprint: 1(gdb) print i 2$1 = 2 3(gdb) print table[i] 4$2 = 2 5(gdb) print table[0] 6$3 = 0 B.9 Modifier le contenu des registres ou des variables Quand on désire modifier le contenu d’une variable ou d’un registre on utiliser set: 450 ANNEXE B. LE GNU DÉBOGUEUR 1(gdb) set variable i=4 2(gdb) set $eax=1 3(gdb) print $eax 4$4 = 1 B.10 Les points d’arrêt (oubreakpointsen anglais) permettent d’arrêter l’exécution du programme sur une instruction particulière. Il faut pour cela spécifier le nom du fichier et/ou la ligne : (gdb) break 24 2Breakpoint 1 at 0x12cb: file test_gdb.cpp, line 24. 3(gdb) break test_gdb.cpp:25 4Breakpoint 3 at 0x5555555552fa: file test_gdb.cpp, line 25. Il est également possible de déclencher un point d’arrêt si une condition est réalisée. Par exemple, on veut arrêter l’exécution du programme dans une boucle, si la variable de boucle a pour valeur5: (gdb) break test_gdb.exe:29 if (i==5) 2Breakpoint 1 at 0x1319: file test_gdb.cpp, line 29. 3(gdb) run 4Starting program: test_gdb.exe 6Breakpoint 1, main () at test_gdb.cpp:29 729 cout << table[ i ] << " "; 8(gdb) print i 9$1 = 5 B.11 Une autre fonctionnalité intéressante est lewatchpointqui permet de stopper l’exécution du programme dès lors qu’une valeur change. On peut définir des points de surveillance lors de la lecture ou de l’écriture d’une variable (watch,rwatch, awatch) : (gdb) rwatch table 2Hardware read watchpoint 1: table 3(gdb) run 4Starting program: test_gdb.exe B.11. SURVEILLER UN CHANGEMENT DE VALEUR 451 6Hardware read watchpoint 1: table 8Value = (int *) 0x55555556aeb0 90x0000555555555301 in main () at test_gdb.cpp:25 1025 table[ i ] = i; Il existe beaucoup d’autres commandes à utiliser avecgdbcomme les com- mandes de base : •continue (abrégé enc) pour continuer l’exécution du programme jusqu’à ce qu’il se termine ou qu’un point d’arrêt ou de surveillance soit déclenché •next (abrégé enn) qui exécute la prochaine instruction et passe à la suivante •step(abrégé ens) qui exécute la prochaine instruction mais s’il s’agit d’un appel de fonction on s’arrêtera à l’intérieur de la fonction On pourra également se référer au Wiki degdb:https://sourceware.org/gdb/ wiki/. 452 ANNEXE B. LE GNU DÉBOGUEUR AnnexeC Travailsurbsr C.1 Dans cette annexe nous investiguons de manière plus détaillée les résultats liés à l’utilisation de l’instruction assembleurbsret de son implantation en comparaison également avec l’instructionlzcnt. Nous rappelons que l’instructionbsr(Bit Scan Reverse) recherche le bit le plus significatif (le plus à gauche) d’une opérande 16, 32 ou 64 bits et stocke le résultat dans un registre de même taille. Cependant si l’opérande source contient la valeur 0, le résultat de l’opération n’est pas défini et dans ce cas le bitZFdu registre eflagsest positionné à 1, sinon il sera positionné à 0. lzcnt L’instructionlzcnt, quant à elle, compte le nombre de 0 significatifs. Elle est donc proche debsrmais elle nécessite de soustraire à la taille de son opérande, le résultat qu’elle produit afin d’obtenir la même valeur quebsr. Contrairement àbsr,lzcntproduit toujours un résultat. Si l’opérande source est égale à 0, alors elle retournera la valeur 32! On notera que : • l’instructionlzcntfait normalement partie du jeu d’instructionABMpour AMD etBMI1pour Intel. • pour les microprocesseurs qui ne supportent pas l’instructionlzcnt, cette dernière est remplacée par l’instructionbsrce qui risque de fausser les résultats. Par exemple l’Intel Q6600 ne supporte pas l’instructionlzcnt. Pour résumer : 454 ANNEXE C. TRAVAIL SUR BSR 1mov ,129 2bsr ,ebx et le code suivant 1mov ,129 2mov ,31 3lzcnt ,ebx 4sub ,ebx donneront le même réslultat, soit 7 dans le registreeax. C.2 Un premier test préalable consiste à comparer deux implantations basiques afin de comparer l’efficacité des instructions assembleurbsretlzcnt. Les résultats figurent Table AMD AMD IntelIntelIntelIntel Ryzen 7Ryzen 5Core i3Core i5Core i7Xeon 1700X 3600 6100 7400 87004208 bsr 10,51 10.35 15.01 13.50 10.62 10.35 lzcnt 2.63 2.59 15.00 18.93 10.58 10.16 ratio 3.99 3.99 1.00 0.71 1.00 1.00 TABLEC.1– Nombre moyen de milliards de cycles sur 10 exécutions pour une boucle de 3 milliards d’appels à bsr ou 31-lzcnt. La première correspond au nombre de milliards de cycles processeur pour l’éxé- cution d’une boucle qui réalise 3 milliards d’appels de l’instructionbsrappliquée sur un registre 32 bits. La seconde fait la même chose mais en calculant 31 moins le résultat delzcnt. Enfin, la troisième valeur (ratio) est le rapport des deux valeurs précédentes. On s’aperçoit quelzcntest plus rapide quebsrsur certaines architectures, cela correspond au cas ou la valeurratioest plus grande que 1. C.3 Le code à traduire est le suivant : C.3. CODE À TRADUIRE 455 1u32 (u32*t,u32 ) 2 u32 =0; 3 for(u32 =0;i<size; i) 4 sum+=function_bsr(t[i]); 5 } 6 return ; 7} Il consiste à réaliser la somme des résultats de la fonctionfunction_bsrap- pliquée sur chacun des éléments d’un tableau de valeurs entières. La fonction function_bsrpeut alors être implantée de différentes manières : • soit sous la forme d’une fonction C qui reproduit le comportement de l’ins- truction assembleurbsrdans le cas où on ne pourrait avoir accès àbsrgrâce au compilateur •soit par un appel direct àbsr, si le compilateur le permet, c’est le cas degcc • soit par un appel à la fonction_builtin_clzdu compilateurgcc, qui va généralement remplacerbsrparlzcnt On codera également en assembleur le sous-programmemethoden utilisantbsr oulzcntet en applicant un dépliage de boucle ou en essayant de supprimer les dépendances lors des calculs. Enfin, il existe une instruction vectorielle du jeu AVX512 appeléevplzcntdqui permet donc de vectoriser le code et elle se révèle très efficace comme le montre les résultats ci-après. Voici un aperçu du code vectorisé en utilisant des registres de 128 bits : 1 mov ,31 2 movd ,eax 3 pshufd ,xmm7,0 ; xmm7 = [31,31,31,31] 4 pxor ,xmm0 ; xmm0 = [0,0,0,0] 6 ; boucle dépliée par 4 7.for: 8 movdqa ,xmm7 ; xmm1 = [31,31,31,31] 9 vplzcntd ,ebx+ecx*4] 10 psubd ,xmm2 ; 11 paddd ,xmm1 12 add ,4 13 cmp ,edx 14 jne 16 phaddd ,xmm0 ; calcul du résultat final 17 phaddd ,xmm0 18 movd ,xmm0 Le registrexmm0représente la variablesum. Le registrexmm7stocke quatre fois la valeur 31 et sera placé à chaque itération de la boucle dansxmm1. On soustraira à xmm1le résultat devplzcntdqui sera placé dansxmm2. 456 ANNEXE C. TRAVAIL SUR BSR C.4 Nous présentons Table machines. Les différentes implantation sont les suivantes : 1. bsrécrite en C 2. __builtin_clz 3. bsr 4. bsr 5. bsr 6. Code assembleur avec boucle dépliée par 4 utilisantbsret élimination des dépendances entre registres 7. lzcnt 8. Code assembleur avec boucle dépliée par 4 utilisant 31 -lzcntet élimination des dépendances entre registres 9. N°Méthode AMD AMD IntelIntelIntelIntel Ryzen 7Ryzen 5Core i3Core i5Core i7Xeon 1700X 3600 6100 7400 87004208 1 C function bsr 10.12 8.79 13.80 14.59 10.79 12.80 2 C builtin clz 1.38 1.19 1.05 1.15 0.86 0.10 3 C bsr 1.13 0.95 0.29 0.31 0.23 0.53 4 asm bsr 1.08 0.95 0.56 0.60 0.45 0.73 5 asm bsr ur4 1.08 0.96 0.30 0.31 0.23 0.39 6 asm bsr ur4 nodep 1.06 0.96 0.28 0.31 0.23 0.36 7 asm lzcnt 0.50 0.44 0.59 0.62 0.47 0.73 8 asm lzcnt ur4 nodep 0.49 0.44 0.59 0.63 0.47 0.79 9 asm avx512 vplzcnt N/A N/A N.A N/A N/A 0.00 TABLEC.2 – Résultats comparatifs d’implantation de la fonction bsr Concernant l’AVX512, le temps d’exécution est très faible et donc n’affiche que 0 secondes, en fait il s’agit d’environ 45µsecondes. AnnexeD Implantationdelafonctionsigne D.1 On désire implanter de la manière la plus efficace possible, la fonctionsigne (signen anglais) d’un entier signé, qui donne le signe de ce dernier : 1i32 (i32 ) 2 if(x<0) 3 return ; 4 else (x>1) 5 return ; 6 else 7 return ; 8} Une traduction intelligente de cette fonction en assembleur x86 32 bits est la suivante : 1sign: 2 push 3 mov ,esp 4 mov ,ebp+8] 5 cmp ,0 ; on sort avec 0 si x = 0 6 jz 7 mov ,1 8 jg 9 mov ,1 10.end: 11 mov ,ebp 12 pop 13 ret Elle consiste à charger la valeur de la variablexdanseaxpuis à la comparer à la constante0. Si le résultat de la comparaison indique0on se rend à la fin de la fonction et on sort avec la valeur 0. Sinon on met la valeur1danseaxet si la 458 ANNEXE D. IMPLANTATION DE LA FONCTION SIGNE comparaison précédente avec0nous indique queeaxétait supérieur à 0, on sort de la fonction. Finalement, sixn’est pas égal à0ou supérieur à0, c’est qu’il est inférieur à0et on met la valeur−1danseax, qui sera la valeur de retour de la fonction. Dans cette implantation, on utilise donc deux sauts conditionnels ce qui n’est pas forcément une bonne chose. Il est donc nécessaire de trouver une implantation plus performante de la fonction. D.2 ebp La première amélioration à réaliser consiste à ne pas passer parebppour récupérerxmais à passer paresp: 1sign: 2 mov ,esp+4] 3 cmp ,0 ; on sort avec 0 si x = 0 4 jz 5 mov ,1 6 jg 7 mov ,1 8.end: 9 ret On pourrait également réaliser un appel de typefastcallce qui implique quex serait placée dansecx, mais nous allons nous cantonner à une récupération de la valeur dexpar l’intermédiaire deesp. D.3 Il est possible de commencer par supprimer un saut en utilisant l’instruction setCC. Plutôt que de mettrexdanseax, on le place dansedx. On traite le cas pour lequelxest positif en fixant les flags grâce à l’instructiontest, puis les deux autres cas (négatif ou nul) grâce àsetnzqui mettra la valeur1danseaxsixest non nulle et0sixest nulle. Il ne reste plus qu’à prendre le complémentaire deeaxpour obtenir une valeur négative. 1jmr3: 2 mov ,esp+4] 3 mov ,1 ; valeur de retour 1 4 test ,edx ; si x > 0 sortir avec true 5 jg 6 setnz ; si x != 0 al=1 sinon al=0 7 neg 8align D.4. AMÉLIORATIONS SANS SAUT 459 9.L1: 10 ret D.4 Une amélioration qui devrait être plus performante consiste à supprimer les deux sauts en combinant plusieurs séquences d’instructions de manière bien particulière. Voici dans ce qui suit, trois exemples de suppression des sauts conditionnels. D.4.1 La première version sans saut combine trois instructions dans l’ordre suivant : cdq,neg,adc. 1jmr4: 2 mov ,esp+4] 3 cdq ; edx:eax = x 4 ; si eax < 0, edx = -1 (0xFF_FF_FF_FF) 5 ; si eax >= 0, edx = 0 6 neg ; si eax = 0 CF=0 7 ; sinon CF = 1 8 adc ,edx ; si eax = 0, edx = 0 9 ; sinon eax = 1 10 mov ,edx 11 ret L’instructioncdqconvertit la valeur contenue danseaxdansedx:eaxen étendant le signe. Sieaxcontient une valeur positive ou nulle,edxsera égal à 0. Sinon, si eaxcontient une valeur négative (bit de poids fort à 1),edxcontiendra−1, soit au format hexadécimal :FF_FF_FF_FF. On calcule ensuite le complémentaire (du point de vue de la notation binaire en complément à deux) deeax. Ici la valeur résultante ne sera pas utilisée mais ce qui est intéressant c’est que l’instructionnegfixe leCarryflag à1sieaxest différent de 0, et à0sieaxvaut0. Dès lors, il suffit d’appliqueradc, l’addition avec prise en compte de la rete- nue suredxpour obtenir la valeur à retourner et la placer danseax. On a donc l’évoluation du calcul suivant : Instruction / caseax <0 eax= 0eax >0 cdq(edx:eax) -1 :x 0 :0 0 :x neg CF=1 CF=0 CF=1 adc ,edx −1 +−1 + 1 0 + 0 + 0 0 + 0 + 1 Résultat −1 0 +1 460 ANNEXE D. IMPLANTATION DE LA FONCTION SIGNE D.4.2 Une autre possibilité consiste à utiliser le bit de signe en le recopiant grâce à l’instructionsar. 1jmr6: 2 mov ,esp+4] 3 mov ,eax ; edx = x 4 sar ,31 ; propagation du bit de signe 5 lea ,eax*2+1] 6 add ,edx 7 cmovz ,edx 8 ret On obtient dans danseaxla valeur−1si la valeur dexest négative ou alors la valeur0dans le cas contraire. L’utilisation deleapermet d’otenir danseaxla valeur −1sixest négative ou la valeur1dans les autres cas. Il faut ensuite distinguer le cas oùxest égale à 0, ce qui réalisé par les deux instructions qui suivent. Instruction / cas eax <0eax= 0eax >0 sar ,31 -1 0 0 lea , [eax* 2 + 1] -1 1 1 add ,edx −2x 0 2 x cmovz ,edx −1 0 1 D.4.3 Enfin, la dernière possibilité que nous allons étudier est l’utilisation de deux cmov. On place1dansedxet -1 dansecx. Puis on compareeaxà0. Si c’est la cas, on ne procédera à aucun changement et on sortira de la fonction avec la valeur0. Par contre, sixest positive l’instructioncmovgva déplacer la valeur deedxdans eax, donc1, ou alors sixest négative l’instructioncmovlva déplacer la valeur de ecxdanseax, donc−1: 1jmr9: 2 mov ,1 3 mov ,esp+4] 4 mov ,1 5 cmp ,0 6 cmovg ,ecx 7 cmovl ,edx 8 ret D.5. TESTS DE PERFORMANCE 461 D.5 Il existe d’autres variantes de ces fonctions mais nous allons nous cantonner à celles exposées ci-avant. Afin de tester les différentes versions que nous avons écrites sur différentes architectures, nous allons examiner les résultats obtenus pour les méthodes sui- vantes : •1: version de base •2: version de base améliorée avec utilisation deesp •3: version avec suppression d’un saut •4: version sans saut avec cdq neg et adc •5: version sans saut cdq xchg neg adc variante de la version 4 •6: version sans sans avec lea sar •7: version avec deux cmov N°Marque IntelIntelIntelIntel IntelIntel Gamme Core i7Core i3Core i5Core i7Core i7Core i5 Modèle 860 6100 7400 479010850H12400F 2009 2015 2017 2014 2020 2021 1 jmr1 .450 .040 15.994 2 jmr2 .450 .040 16.736 3 jmr3 .450 .040 18.456 4 jmr4 .450 .040 13.944 5 jmr5 .450 .040 13.742 6 jmr6 .450 .040 10.052 7 jmr7 .450 .040 10.052 TABLED.1– Résultats comparatifs des méthodes pour la recherche des nombres auto- descriptifs pour les architectures Intel 462 ANNEXE D. IMPLANTATION DE LA FONCTION SIGNE N°Marque AMD AMD AMD Gamme PhenomRyzen 7Ryzen 5 Modèle 1090T 1700X 5600g 2009 2017 2020 1 jmr1 .450 .040 11.668 2 jmr2 .450 .040 11.650 3 jmr3 .450 .040 11.636 4 jmr4 .450 .040 10.048 5 jmr5 .450 .040 10.046 6 jmr6 .450 .040 10.052 7 jmr7 .450 .040 10.052 TABLED.2– Résultats comparatifs des méthodes pour la recherche des nombres auto- descriptifs pour les architectures AMD AnnexeE CodeASCIIde0à127 Bin. Hex. Dec. ASCII Symbol Description 0000000 0 0 NUL NULL character 0000001 1 1 SOH Start of Heading 0000010 2 2 STX Start of TeXt 0000011 3 3 ETX End of TeXt 0000100 4 4 EOT End Of Transmission 0000101 5 5 ENQ Enquiry 0000110 6 6 ACK Acknowledge 0000111 7 7 BEL Bell 0001000 8 8 BS Backspace 0001001 9 9 TAB Horizontal Tab 0001010 A 10 LF Line Feed 0001011 B 11 VT Vertical Tab 0001100 C 12 FF Form Feed 0001101 D 13 CR Carriage Return 0001110 E 14 SO Shift Out 0001111 F 15 SI Shift In 0010000 10 16 DLE Data Link Escape 0010001 11 17 DC1 Device Control 0010010 12 18 DC2 Device Control 0010011 13 19 DC3 Device Control 0010100 14 20 DC4 Device Control 0010101 15 21 NAK Negative Acknowledge 0010110 16 22 SYN Synchronous Idle 0010111 17 23 ETB End of Transmission Block 0011000 18 24 CAN Cancel 0011001 19 25 EM End of Medium 0011010 1A 26 SUB Substitute 464 ANNEXE E. CODE ASCII DE 0 À 127 0011011 1B 27 ESC Escape 0011100 1C 28 FS File Separator 0011101 1D 29 GS Group Separator 0011110 1E 30 RS Record Separator 0011111 1F 31 US Unit Separator 0100000 20 32 SP Space 0100001 21 33 ! Exclamation mark 0100010 22 34 Only quotes above 0100011 23 35 # Pound sign 0100100 24 36 $ Dollar sign 0100101 25 37 % Percentage sign 0100110 26 38 & Commericial and 0100111 27 39 " Apostrophe 0101000 28 40 ( Left bracket 0101001 29 41 ) Right bracket 0101010 2A 42 * Asterisk 0101011 2B 43 + Plus symbol 0101100 2C 44 , Comma 0101101 2D 45 - Dash 0101110 2E 46 . Full stop 0101111 2F 47 / Forward slash 0110000 30 48 0 0110001 31 49 1 0110010 32 50 2 0110011 33 51 3 0110100 34 52 4 0110101 35 53 5 0110110 36 54 6 0110111 37 55 7 0111000 38 56 8 0111001 39 57 9 0111010 3A 58 : Colon 0111011 3B 59 ; Semicolon 0111100 3C 60 < Smaller than 0111101 3D 61 = Equals sign 0111110 3E 62 > Bigger than 0111111 3F 63 ? Question mark 1000000 40 64 @ At symbol 1000001 41 65 A 1000010 42 66 B 1000011 43 67 C 1000100 44 68 D 1000101 45 69 E 1000110 46 70 F 1000111 47 71 G 1001000 48 72 H 1001001 49 73 I 1001010 4A 74 J 1001011 4B 75 K 1001100 4C 76 L 1001101 4D 77 M 1001110 4E 78 N 1001111 4F 79 O 1010000 50 80 P 1010001 51 81 Q 1010010 52 82 R 1010011 53 83 S 1010100 54 84 T 1010101 55 85 U 1010110 56 86 V 1010111 57 87 W 1011000 58 88 X 1011001 59 89 Y 1011010 5A 90 Z 1011011 5B 91 [ Left square bracket 1011100 5C 92 Inverse/backward slash 1011101 5D 93 ] Right square bracket 1011110 5E 94 ˆ Circumflex 1011111 5F 95 _ Underscore 1100000 60 96 ‘ Gravis (backtick) 1100001 61 97 a 1100010 62 98 b 1100011 63 99 c 1100100 64 100 d 1100101 65 101 e 1100110 66 102 f 1100111 67 103 g 1101000 68 104 h 1101001 69 105 i 1101010 6A 106 j 1101011 6B 107 k 1101100 6C 108 l 466 ANNEXE E. CODE ASCII DE 0 À 127 1101101 6D 109 m 1101110 6E 110 n 1101111 6F 111 o 1110000 70 112 p 1110001 71 113 q 1110010 72 114 r 1110011 73 115 s 1110100 74 116 t 1110101 75 117 u 1110110 76 118 v 1110111 77 119 w 1111000 78 120 x 1111001 79 121 y 1111010 7A 122 z 1111011 7B 123 { Left curly bracket 1111100 7C 124 | Vertical line 1111101 7D 125 } Right curly brackets 1111110 7E 126 Tilde 1111111 7F 127 DEL Deletes a character GlossairedesInstructions adc Addition de registres généraux en prenant en compte la retenue éventuelle du Carry Flag. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . addAddition de registres généraux . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . addps, addpd Additions entre deux registres vectoriels considérés comme 4 floats ou 2 double. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . addss, addsd Additions entre deux registres vectoriels considérés comme conte- nant un float ou un double en partie basse des registres . . . . . . . . . . . . . . . . . . . . and Et binaire entre registres généraux ou un registre général et un emplacement mémoire. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . blendps Permet de remplacer les valeurs du registre vectroriel SSE de destination par des valeurs du registre vectoriel source en utilisant un masque sous forme d’une constante d’un octet . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . callAppel de sous programme . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . cdq Conversion deeaxenedx:eax, sieaxcontient une valeur négative alorsedx contiendra -1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . cmovCC Conditional MOVe, déplacement conditionnel de la valeur source vers la valeur cible, en général deux registres généraux si la conditionCCest vérifiée cmp Comparaison entre registres généraux ou un registre général et un emplace- ment mémoire, les flags du registreeflagssont positionnés en conséquence cvtss2sd, cvtps2pd, cvtss2si, cvtsi2sd Conversions de données contenu dans des registres vectoriels SSE : de float en double ou de float en entier, d’entier en float . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . dec Décrémentation d’un registre général, correspond à une soustraction de 1 divDivision de registres généraux, ne prend qu’une opérande : le diviseur . ., fadd, faddp Floating point ADD, addition de nombres en virgule flottante, lepen suffixe indique que la valeur est dépilée de la pile de registres de la FPU 468 Glossaire des Instructions fcomi, fcomip, fcomu, fcomup Comparaison de nombres en virgule flottante, le pen suffixe indique que la valeur est dépilée de la pile de registres de la FPU fcos, fsin, fsincos, fptan, fpatan Calcul du cosinus, sinus, sinus et cosinus, tan- gente partielle, arctangente partielle de nombres en virgule flottante . . . . . . . fdiv, fdivp, fdivr, fprem Division, division inverse, reste de la division de nombres en virgule flottante, lepen suffixe indique que la valeur est dépilée de la pile de registres de la FPU . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . fild Floating point Integer LoaD, chargement d’un nombre entier qui sera converti en virgule flottante dansst0. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . fld Floating point LoaD, chargement d’un nombre en virgule flottante dansst0217 fmul, fmulpFloating point MULtiplication, multiplication de nombres en virgule flottante, lepen suffixe indique que la valeur est dépilée de la pile de registres de la FPU . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . fst, fstp Floating point STore, stockage d’un nombre en virgule flottante vers la mémoire, lepen suffixe indique que la valeur est dépilée de la pile de registres de la FPU . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . fsub Soustraction de nombres en virgule flottante, lepen suffixe indique que la valeur est dépilée de la pile de registres de la FPU . . . . . . . . . . . . . . . . . . . . . haddps Addition horizontale de 4 float dans un registre vectoriel SSE : cette instruction permet en étant exécutée deux fois sur le même registre de calculer la somme des 4 float contenu dans le registre vectoriel . . ., idiv Division d’un registre général considéré comme un entier signé : même format quediv. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ., imul Multiplication d’un registre général considéré comme un entier signé : elle possède 3 formats différents . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ., incIncrémentation d’un registre général, correspond à une addition de 1 . . . jeJump on Equal. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . jgJump on Greater. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . jgeJump on Greater or Equal. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . jlJump on Less. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . jleJump on Less or Equal. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . jneJump on Not Equal. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . jnzJump on Not Zero. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . jzJump on Zero. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . lea Load Effective Address, calcule le résultat de son opérande définie sous forme d’adresse . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . loop Décrémente le registreecxet se branche à l’adresse indiquée par l’opérande si celui-ci n’est pas égal à0. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . Glossaire des Instructions 469 movChargement et stockage de registres généraux. . . . . . . . . . . . . . . . . . . . . . . . . movaps, movups Chargement et stockage d’un registre vectoriel SSE avec des nombres en virgule flottante . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . movbeInverse les octets d’un registre général 32 bits. . . . . . . . . . . . . . . . . . . . . . . movdqa, movdqu Chargement et stockage d’un registre vectoriel SSE avec des données entières. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . movss, movsd Chargement et stockage de la partie basse d’un registre vectoriel SSE avec un nombre à virgule flottante. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . movsx Chargement et stockage de registres généraux avec extension du signe d’une valeur 8 ou 16 bits vers une valeur 16, 32 ou 64 bits . . . . . . . . . . . . movzx Chargement et stockage de registres généraux avec extension et remplissage avec 0 d’une valeur 8 ou 16 bits vers une valeur 16, 32 ou 64 bits. . . . . . mul Multiplication de registres généraux, ne prend qu’une opérande : le multipli- cateur. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . negComplément à deux : converti 1 en -1 et inversement . . . . . . . . . . . . . . . . . . notComplémente chaque bit d’une opérande. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . or Ou binaire entre registres généraux ou un registre général et un emplacement mémoire. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . paddb, paddw, paddd Additions entre deux registres vectoriels considérés comme contenant 16 octets, 8 mots ou 4 double mots . . . . . . . . . . . . . . . . . . . . . . . . . pand, por, pxor Réalise un et-binaire, un ou-binaire ou bien un ou-exclusif binaire entre deux registres vectoriels SSE . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . pdep Parallel bits Deposit, agit sur des registres généraux et permet de sélectionner des bits d’un registre . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . pshufdRéorganise les 4 entiers contenus dans un registre vectoriel SSE . . . . retRetour de sous-programme, voir call. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . sar SHift Arithmetic Right, permet de réaliser une division par une puissance de 2 tout en préservant le signe de la valeur divisée . . . . . . . . . . . . . . . . . . . . . . . . setCC Set Byte on Condition, met à 0 ou 1 un registre 8 bits ou un emplacement mémoire 8 bits en fonction des valeurs des bits CF, SF, OF, ZF et PF du registre eflags : on remplaceraCCpar les lettres qui correcpondent aux sauts conditionnels, par exemple nz pourNot Zero. . . . . . . . . . . . . . . . . . . . . . . . . . shl SHift Left, décalage à gauche d’un registre denbits, correspond également à une multiplication par2 n . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . shr SHift Right, décalage à droite d’un registre denbits, correspond également à une division par2 n . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . shufpsRéorganise les 4 float contenus dans un registre vectoriel SSE . . . . . . . subSoustraction de registres généraux . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 470 Glossaire des Instructions testComparaison de valeurs en réalisant unandentre les deux opérandes . . xor Ou eXclusif binaire entre registres généraux ou un registre général et un emplacement mémoire . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . Bibliographie [1] AGNER, Fog :Calling conventions for different C++ compilers and operating systems, 2018 [2] AGNER, Fog :The microarchitecture of Intel, AMD and VIA CPUs : An optimiza- tion guide for assembly programmers and compiler makers, 2018 [3] CORMEN, Thomas H.;LEISERSON, Charles E.;RIVEST, Ronald L.;STEIN, Clifford :Introduction to Algorithms. 3rd. MIT Press, 2009. – ISBN 978–0– 262–03384–8 [4] HEINEMAN, George T.;POLLICE, Gary;SELKOW, Stanley :Algorithms in a nutshell, A Desktop Quick Reference. O’Reilly, 2008. – ISBN 978059651624–6 [5]HENNESSY, John L.;PATTERSON, David A. :Computer Architecture : A Quanti- tative Approach. 5. Amsterdam : Morgan Kaufmann, 2012. – ISBN 978–0–12– 383872–8 [6] HENTENRYCK, Pascal V.;DEVILLE, Yves : The Cardinality Operator : A New Logical Connective for Constraint Logic Programming. In :BENHAMOU, Frédéric (Hrsg.);COLMERAUER, Alain (Hrsg.) :Constraint Logic Programming, Selected Research. WCLP 1991, Marseilles, France, MIT Press, 1991, S. 283–403 [7]INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 1 : Basic architecture, January 2019. – Order Number : 253665-069US [8] INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 2A : Instruction set reference, A-L, January 2019. – Order Number : 253666-069US [9]INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 2B : Instruction set reference, M-U, January 2019. – Order Number : 253667-069US [10]INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 2C : Instruction set reference, V-Z, January 2019. – Order Number : 326018-069US [11]INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 2D : Instruction set reference, January 2019. – Order Number : 334569-069US [12]INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 3A : System programming guide, part 1, January 2019. – Order Number : 253668-069US [13] INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 3B : System programming guide, part 2, January 2019. – Order Number : 253669-069US 472 BIBLIOGRAPHIE [14] INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 3C : System programming guide, part 3, January 2019. – Order Number : 326019-069US [15] INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 3D : System programming guide, part 3, January 2019. – Order Number : 332831-069US [16] INTEL:Intel 64 and IA-32 architectures software developer’s manual volume 4 : Model-specific registers, January 2019. – Order Number : 335592-069US [17] JACQUES, Baudé : Le mariage du sciècle : éducation et informatique. In : 1024 - Bulletin de la société informatique de France13 (2019), avril, S. 71–78 [18]KNUTH, Donald E. : An empirical study of FORTRAN programs. In :Software : Practice and Experience1 (1971), Nr. 2, 105-133.http://dx.doi.org/10. 1002/spe.4380010203. – DOI 10.1002/spe.4380010203 [19] LEITERMAN, James :32/64bitt 80x86 Assembly Language Architecture. Plano, TX, USA : Wordware Publishing Inc., 2005. – ISBN 1598220020 [20] MCCUNE, W W. : OTTER (Organized Techniques for Theorem-proving and Effective Research) 2. 0 users guide. (1990), 3 [21] MICHEL, Benoît :Le livre du 64. 3. Banneux, Belgique : BCM, 1986. – ISBN 2–87111001–80 [22] R., Patterson D. A.and P. : Assessing RISC’s in a High-Level Language Support. In :IEEE Micro2 (1982), Nov. [23] RICHER, Jean-Michel :Une approche de résolution de problèmes en logique des prédicats fondée sur des techniques de satisfaction de contraintes, Université de Bourgogne, Dijon, Diss., 1999.http://www.info.univ-angers.fr/~richer/ pub/these.pdf [24] ROBINSON, J. A. : A Machine-Oriented Logic Based on the Resolution Principle. In :J. ACM12 (1965), Januar, Nr. 1, 23–41.http://dx.doi.org/10.1145/
321250.321253. – DOI 10.1145/321250.321253. – ISSN 0004–5411
[25]
SPÉRANZA, René :Guide Silicium des micro-ordinateurs anciens. COREP, 2006.
– ISBN 9782951747241
[26]
STALLINGS, W. :Organisation et architecture de l’ordinateur. Pearson Edu-
cation, 2003https://books.google.fr/books?id=mF3IPAAACAAJ. – ISBN
9782744070075
[27]
STOKES, Jon :Inside the Machine : An Illustrated Introduction to Microprocessors
and Computer Architecture. San Francisco, CA, USA : No Starch Press, 2006. –
ISBN 1593271042
9 782957 316007
