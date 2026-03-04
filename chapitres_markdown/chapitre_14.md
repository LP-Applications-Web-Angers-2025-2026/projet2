# Chapitre 14 : Etudedecas

## 14.1 Ce chapitre traite de l’implantation de la fonction deFitchdans le cadre de la

résolution du problème de la recherche du Maximum de Parcimonie en Bioinfor-
matique. Il permet d’introduire plusieurs instructions assembleur liées au calcul
vectoriel avec unités SSE sur les entiers.
Le problème de recherche du Maximum de Parcimonie consiste étant donné un
ensemble denséquences d’ADN de même longueurkà trouver un arbre binaire
dont le coût est minimum étant donné un critère d’optimisation.
Pour calculer ce coût qui correspond au nombre de mutations entre séquences,
chaque feuille de l’arbre contient une des séquences initiale du problème et les
noeuds internes contiennent des séquences diteshypothétiquesqui sont calculées en
utilisant la fonction deFitch. Celle-ci sera notre fonction de référence à améliorer
et pour laquelle toute mutation engendre un coût d’une unité.
Le coût total d’un arbre est égal à la somme des coûts de chaque séquence
hypothétique. Pour le calculer, on part de la racine et on descend jusqu’aux feuilles,
puis on remonte vers la racine en calculant les séquences hypothétiques tout en
sommant leurs coûts.
Prenons un exemple avec les quatre séquences d’ADN suivantes :
•S1 = AAAAA
•S2 = AAAAC
•S3 = CCCTT
•S4 = CCCAT
On rappelle que les acides nucléiques qui composent les séquence d’ADN
sont
l’adénine (A), la cytosine (C), la guanine (G) et la thymine (T). La séquenceS1est
donc composée de 5 adénines,S2de quatre adénines suivies d’une cytosine, etc.
On peut voir, Figure, deux arbres binaires ainsi que le coût de parcimonie
selonFitch.
FIGURE14.1 – Arbres et coûts de parcimonie selon Fitch
Le premier arbre, qui dans la notationNewick
estT1= ((S1,S3),(S2,S4)) ,
possède un coût total de4 + 5 + 0 = 9. En effet, lorsque l’on calcule la séquence
hypothétique qui résulte de(S1,S3) , on a cinq mutations : trois modifications oùA
est muté enCet deux oùAsubit une mutation enT. Sur la branche de droite qui
correspond à séquence hypothétique qui résulte de(S2,S4) , on a quatre mutations :
trois modifications oùAest muté enC, puisAen regard deA, donc aucune mutation,
et enfin, une mutation deCenT. Au niveau de la racine, on n’aura aucune mutation
car on a à chaque fois des sous-ensembles de caractères communs. On trouve trois
fois le sous-ensemble{A,C} en regard de lui-même, puis{A,T} en regard de{A}
dont l’intersection est{A}et enfin{A,T} en regard de{C,T} dont l’intersection
est{T}.(
Le second arbreT2= ((S1,S2),(S3,S4)) possède un coût inférieur àT1, égal à
4 + 1 + 1 = 6. C’est doncT2qui est le plusparcimonieux, c’est à dire qui possède le
moins de mutations et qui doit être gardé comme solution au problème.
Le problème de recherche de l’arbre de parcimonie maximum est un problème
d’optimisation combinatoire et est NP-Complet ce qui signifie, en simplifiant à
outrance, qu’il n’existe pas d’algorithme qui nous permette de trouver la solution
autre qu’une recherche exhaustive.
Malheureusement, le nombre d’arbres binaires à examiner est exponentiel, par
exemple pour 50 séquences, il y a2,8 10
74 arbres possibles. On ne peut donc
envisager une recherche exhaustive et il faut faire appel à des métaheuristiques qui
sont des techniques de recherche liées à la résolution de ce genre de problème.
Nous n’irons pas plus avant dans l’explication des techniques de résolution
qui font partie de l’Optimisation Combinatoirecar nous allons nous focaliser sur
l’amélioration de la fonction de Fitch.

## 14.2 La fonction à implanter est donnée Listing. Elle comporte quatre para-

mètres qui sont les séquences en entréexety, la séquence hypothétyquezqui est
calculée par la fonction ainsi que la longueur des séquences (size). En retour on
donne le nombre de mutations trouvées.
1u32 (u8*x,u8*y,u8*z,u32 )
2 u32 =0;

```text
for(u32 =0;i<size;i)
z[i]x[i]y[i];
if(z[i] 0)
z[i]x[i] y[i];
++mutations;
}
}
return ;
12}
```

> *Listing 14.2.1 – Maximum de Parcimonie fonction de référence en C*

Les séquences sont modélisées sous forme de tableaux d’octetset pour coder
efficacement la possibilité d’avoir des combinaisons d’acides nucléiques comme ’A
ou C’, ’A ou C ou T’, ’A ou C ou G ou T’, etc, on utilise des puissances de 2 :
•A =2
•C =2
•G =2
•T =2
Ainsi ’A ou C’ qui en notation ensembliste se note{A} ∪ {C} ou encore{A,C}
est codé par2
+ 2
= 2 + 4 = 6 . La fonction de Fitch vérifie que pour chacun des
sous-ensembles de caractères en regard des deux séquences en entrée, il existe
un caractère ou un sous-ensemble commun en réalisant une intersection des sous-
ensembles de caractères dex[i]avecy[i]. Si cet ensemble est vide c’est qu’il
n’existe aucun caractère en commun : on a une mutation et il faut alors prendre
l’union des ensembles de caractères.
Union et intersection sont très simple à réaliser si on code les caractères sous
forme de puissances de 2. L’union est alors le OU-binaire (|) et l’intersection est le
ET-binaire (&).
Au delà de la signification qui peut sembler complexe, on peut simplement
considérer la fonction à implanter comme manipulant des tableaux d’octets.

## 14.3 La difficulté de l’implantation réside dans le fait que l’on ne dispose en 32 bits

que de 6 registres et que la fonction fait apparaître 6 variables :
•les séquencesx,y,z,
•la taillesizedes séquences,
•la variable de bouclei,
•le nombre demutations
Cependant il faudra réaliser des calculs commex[i] & y[i], il est donc néces-
saire de disposer d’au minimum un registre pour les calculs.
L’association variables / registres est celle de la Table. Nous avons fait le
choix de ne pas stocker la variablesizedans un registre et de la laisser dans la pile
ce qui nous permet de garder le registreedxafin de réaliser les calculsx[i] & y[i]
etx[i] | y[i].
Cste/Param/VarTypeParamètreRegistreDescription
x [ebp+8] esi séquencex
y [ebp+12] edi séquencey
z [ebp+16] ebx séquencez
size [ebp+20] pile taille des séquences
i variable de boucle
mutations nombre demutations
u32 calculs
TABLE14.1– Association entre variables et registres pour la fonction de référence de Fitch
Le code ressemble donc à ce qui suit et est la traduction directe de la fonction
de référence :
Afin de donner un ordre d’idée du temps d’exécution pour les différentes implan-
tations que nous allons réaliser, nous reportons par la suite, les résultats obtenus

```nasm
push ; entrée dans la fonction
mov ,esp
mov ,ebp+20]
test ,eax
jz
push ; sauvegarde des registres
push ; qui seront modifiés mais
push ; doivent être préservés
; chargement des paramètres
mov ,ebp+8]
mov ,ebp+12]
mov ,ebp+16]
xor ,eax ; mutations = 0
xor ,ecx ; i = 0
19.for:
cmp ,ebp+20]
jge
mov ,esi+ecx]
and ,edi+ecx]
jnz ; si dl != 0 alors aller en .endif
mov ,esi+ecx]
or ,edi+ecx]
inc ; ++mutations
28.endif:
mov [ebx+ecx],dl ; z[i] = dl
inc ; ++i
jmp
32.endfor:
pop ; restauration des registres
pop
pop
37.end:
mov ,ebp ; sortie de fonction
pop
ret
```

> *Listing 14.3.1 – Maximum de Parcimonie fonction de référence en assembleur*

sur un Core i7 8700. Le test effectué consiste à calculer50_000fois la fonction
de référence appliquée sur des séquences initialisées aléatoirement de524_287
éléments.
Temps de référence
Pour l’implantation que nous venons de donner, l’exécution dure environ
84,37secondes.

## 14.4 L’implantation précédente se révèle inefficace pour une simple raison que

nous avons déjà évoquée. La présence d’une conditionnelle (if) non prédictible
à l’intérieur d’une boucle (for). Si on a choisi le mauvais chemin d’exécution il
faudra vider le pipeline ce qui nous ralenti.
Afin d’améliorer l’efficacité du traitement il est nécessaire de supprimer le (if).
On peut, dans ce cas précis, choisir d’utiliser des instructions commesetCCou
cmovCCqui s’exécutent en fonction de la condition, modélisée ici par les deux lettres
CC.
On va donc modifier l’association variables / registres afin de libérer les registres
eax,ebxetedx. Ainsiesisera utilisé pour contenir soitx, soitzet la variable
mutationssera placée dans la pile. Le code est alors celui du Listing.
On chargex[i]en partie basse deeaxetebxpuisy[i]en partie basse deedx.
On calcule ensuite :
•x[i] | y[i]dansebx
•x[i] & y[i]danseax
L’instructionand ,edx met à jour le registreeflags, dès lors on peut utiliser
deux instructions conditionnelles :
•setz
fixedl(doncedx) à1, six[i] & y[i]est égal à0, sinondlsera égal
à0
•cmovz ,ebxremplacex[i] & y[i]parx[i] | y[i]danseax
Ces deux instructions réalisent la conditionnelleifde la fonction de référence
et on met ensuite à jour le nombre de mutations stockées dans la pile en[ebp-4]
ainsi que la séquencez.
Amélioration sans if
En éliminant leifon ne met plus que34,68secondes, on va donc environ
2,43fois plus vite.
On note l’utilisation de l’instructionmovzx(lignes 20 et 21) afin de charger
respectivementx[i]ety[i]dansedxeteax. Cette instruction permet de charger
un octet en partie basse d’un registre tout en positionnant à0les bits de la partie
haute. Elle est généralement plus performante qu’unmovqui mettraity[i]dansdl.

## 14.5 La version sansifpeut encore être améliorée, pour cela il faut procéder à

plusieurs changements :

```nasm
push ; entrée dans la fonction
mov ,esp
sub ,4 ; mutations = 0
mov [ebp-4],0 ;
mov ,ebp+20]
test ,eax
jz
push ; sauvegarde des registres
push ; qui seront modifiés mais
push ; doivent être préservés
mov ,ebp+12]
xor ,ecx ; i = 0
16.for:
mov ,ebp+8]
cmp ,ebp+20]
jge
movzx ,byte[edi+ecx]
movzx ,byte[esi+ecx]
mov ,eax ; bl = x[i]
mov ,ebp+16]
or ,edx ; bl = x[i] | y[i]
and ,edx ; al = x[i] & y[i]
setz ; dl = (al == 0) ? 1 : 0
cmovz ,ebx ; al = (al == 0) ? bl : al
add [ebp-4],edx ; mutations += edx
mov [esi+ecx],al ; z[i] = al
add ,1 ; ++i
jmp
34.endfor:
mov ,ebp-4]
pop ; restauration des registres
pop
pop
40.end:
mov ,ebp ; sortie de fonction
pop
ret
```

> *Listing 14.4.1 – Maximum de Parcimonie fonction de référence sans if*

•
la variablemutationssera remplacée par le registreeax, cela évite des accès
à la mémoire
•
l’accès au paramètres se fera au travers deespet non deebpqui va être utilisé
pour stockerz, ce qui fait qu’on aura à notre disposition 7 registres
•les calculs seront réalisés en utilisantebx,edxetedi
•
le registreedisera également utilisé pour stockery, après avoir réalisé les
calculs il faudra donc le recharger avecy
Le code est donné Listing.

```nasm
mov ,esp+16]
test ,eax
jz
xor ,eax ; mutations = 0
push ; sauvegarde des registres
push
push
push
; chargement des paramètres
mov ,esp+20]
mov ,esp+24]
mov ,esp+28]
xor ,ecx ; i = 0
17.for:
movzx ,byte[esi+ecx]
movzx ,byte[edi+ecx]
mov ,ebx ; edi = x[i]
or ,edx ; edi = x[i] | y[i]
and ,edx ; ebx = x[i] & y[i]
sete ; dl = (ebx == 0) ? 1 : 0
cmovz ,edi ; ebx = (ebx == 0) ? edi : ebx
add ,edx ; mutations += edx
mov [ebp+ecx],bl ; z[i] = bl
mov ,esp+24]
add ,1 ; ++i
cmp ,esp+32]
jl
pop ; restauration des registres
pop
pop
pop
38.end: ; sortie de fonction
ret
```

> *Listing 14.5.1 – Maximum de Parcimonie fonction de référence sans if optimisée*

Amélioration sans if et optimisation
Avec cette version optimisée, on ne met plus que5,24secondes, on va donc
3,88fois plus vite que la fonction de référence.

## 14.6 L’implantation de la fonction de référence en utilisant des instructions SSE est

relativement simple dès lors que l’on connait les instructions adéquates. On traitera
16 octets en parallèle ce qui apporte un gain substantiel dans l’amélioration de la
fonction. Pour réaliser le OU-binaire, on utilisera l’instructionpor(Parallel OR) et
pour le ET-binaire, on dispose de l’instructionpand(Parallel AND)
La difficulté repose sur l’extraction de l’information liée au résultat du ET-binaire.
On dispose heureusement pour celà de deux instructions :
•pcmpeqb ,xmm2
(Parallel CoMPare EQual Bytes) qui compare les octets
du registrexmm1à ceux du du registrexmm2, sixmm1.b[i] == xmm2.b[i]alors
xmm1.b[i] = 0xFF, sinonxmm1.b[i] = 0
•pmovmskb ,xmm1
(Parallel MOVe MaSK of Bytes) est utilisée pour récupérer
le résultat de la comparaison précédente, on extrait le bit de poids fort de
chaque octet du registrexmm1et on le place danseax
On est donc en mesure de comparer deux vecteurs d’octets et si deux valeurs
au même indice sont égales on positionnera dans le registre destination l’octet
correspondant à0xFF, c’est à diretrue, alors que si elles sont différentes, l’octet
sera positionné à0x00, c’est à direfalse.

### 14.6.1 Comme les calculs se feront dans les registres SSE on va pouvoir disposer des

6 registres généraux (cf. Table) afin de gérer les adresses des vecteurs, leur
taille, la variable de boucle et le nombre de mutations.
Le registrexmm0sera utilisé pour stockerx[i:i+15], puis le résultat du ET-
binaire avecxmm2qui lui, contiendray[i:i+15].
Le registrexmm1sera utilisé pour stocker une copie dexmm0, puis le résultat du
OU-binaire avecxmm2
Le registrexmm6est mis à0car il nous servira à comparer en parallèle le résultat
du ET-binaire et permettra de déterminer quels éléments sont à0et pour lesquels il
faudra prendre le résultat du OU-binaire.
Le registreedxcontient le nombre d’itérations de 16 octets. Par exemple si la
taille des séquences est de 263 acides nucléiques alorsedx = 16et il restera 7
itérations à traiter.
Le code de la version SSE étant assez conséquent, nous nous focalisons sur la
boucle principale qui ressemble à ceci :
On commence par charger les registres avec les données puis à calculer le
ET-binaire et le OU-binaire (lignes 2 à 6). On compare ensuite (lignes 8 et 9) le
Cste/Param/VarTypeParamètreRegistreDescription
x [ebp+8] esi séquencex
y [ebp+12] edi séquencey
z [ebp+16] ebx séquencez
size [ebp+20] pile taille des séquences
i variable de boucle
u32 nombre de répétitions
mutations nombre de mutations
u32 calculs temporaires
u8[16] [0,...,0]
u8[16] x[i:i+15]
and(x[i:i+15],y[i:i+15])
u8[16] y[i:i+15]
u8[16] y[i:i+15]
or(x[i:i+15],x[i:i+15])
TABLE14.2 – Associations entre variables et registres pour l’implantation SSE
résultat du ET-binaire, déplacé dansxmm4au registrexmm6afin de déterminer quels
octets sont à 0, le registrexmm4va servir par la suite de masque de sélection.
Lignes 9, 15, 16, 18, on extrait l’information sur le nombre de mutations que
l’on additionne àeaxqui contient le nombre total de mutations.
Enfin, lignes 20 à 24, on calcul la séquence hypothétiquez[i:i+15]en sélec-
tionnant soit le résultat du OU-binaire si le ET-binaire a produit un résultat égal à
0, soit le résultat du ET-binaire s’il n’est pas nul.
Notons qu’il ne s’agit pas d’une véritable boucleformais plutôt unwhilecar
le registreedx, comme indiqué précédemment, contient le nombre de répétitions
de 16 octets à effectuer. Il est donc décrémenté en ligne 27 et s’il est égal à0, on
sortira de la boucle.
Amélioration SSE2
Grâce à la vectorisation avec jeu d’instruction SSE2, on abaisse le temps
d’exécution à2,70secondes soit un facteur d’amélioration de84,37/2,70≃31 .
14.7. VERSION SSE 4.1 363
1.for_u16:

```text
movdqa ,esi+ecx]
movdqa ,edi+ecx]
movdqa ,xmm0 ; xmm1 = xmm0
pand ,xmm2 ; xmm0 = x[i:i+15] & y[i:i+15]
por ,xmm2 ; xmm1 = x[i:i+15] | y[i:i+15]
movdqa ,xmm0 ; xmm4 = x[i:i+15] & y[i:i+15]
pcmpeqb ,xmm6 ; xmm4 est le masque
; si (x[i] & y[i] == 0) alors
; xmm4[i] = 0xFF
; sinon
; xmm4[i] = 0x00
pmovmskb ,xmm4 ; obtenir les bits
popcnt ,ebp ; compte le nombre de mutations
add ,ebp ; ajouter à eax
; calcul de la séquence
pand ,xmm4 ; not(xmm4) & (x[i] | y[i])
pandn ,xmm0
por ,xmm1
movdqa[ebx+ecx],xmm0 ; résultat dans z[i:i+15]
add ,16 ; i+= 16
dec
jnz
```

> *Listing 14.6.1 – Maximum de Parcimonie version SSE2*

## 14.7 Un variante de la version SSE2 va consister à utiliser l’instruction appelée

pblendvb(Variable Blend Packed Bytes) apparue avec le SSE4.1.
Elle permet de sélectionner des octets de chacune de ses deux opérandes suivant
le masque de sélection contenu (par convention) dans le registrexmm0. Le code
s’écrit alors :
Le registrexmm0ne contiendra donc plusx[i:i+15]mais permettra de vérifier
quels octets de l’intersectionx[i:i+15] & y[i:i+15]sont à0.
Lorsque l’on exécute l’instructionpblendvb ,xmm2,xmm0 on sélectionne
les octets dexmm2.b[i]pour lesquelsxmm0.b[i]vautFF16. Dans le cas contraire
on gardexmm1.b[i]. Etant donné que :
•xmm2contientx[i:i+15] | y[i:i+15]
•xmm1contientx[i:i+15] & y[i:i+15]
•chaque octet dexmm0vautFF16six[i] & y[i] == 0
1.for_ur16:
2 cmp ,edx
3 jge
4 pxor ,xmm0 ; xmm0 = [0, 0, ..., 0]

```text
movdqu ,esi+ecx]
movdqu ,edi+ecx]
movdqa ,xmm1 ; xmm2 = x[i:i+15]
movdqa ,xmm3 ; xmm4 = y[i:i+15]
pand ,xmm3 ; xmm1 = x[i:i+15] & y[i:i+15]
por ,xmm4 ; xmm1 = x[i:i+15] | y[i:i+15]
pcmpeqb ,xmm1 ; si xmm1.b[i] == 0
; xmm0.b[i] = 0xFF
; alors
; xmm0.b[i] = 0x00
pmovmskb ,xmm0 ; obtenir le nombre de mutations locales
popcnt ,ebp ; compter
add ,ebp ; ajouter aux mutations totales
pblendvb ,xmm2,xmm0; calculer la séquence hypothétique
movdqa[ebx+ecx],xmm1 ; stocker le résultat en z[i:i+15]
add ,16 ; i+= 16
jmp
22.endfor_ur16
```

> *Listing 14.7.1 – Maximum de Parcimonie version SSE4.1*

On obtient bien le résultat escompté.
Amélioration SSE4.1
On passe alors à un temps d’exécution à2,60secondes soit une légère amélio-
ration facteur d’amélioration de≃32.

## 14.8 La version AVX utilise les registresymmqui ont une taille de 32 octets (soit 256

bits). Le code est similaire à celui de la version SSE 4.1. On utilise le préfixevafin
de signaler qu’il s’agit d’instructions AVX.
On notera que :
•
l’instructionvpcmpeqb ,ymm1 compare les 32 octets deymm0à ceux de
ymm1.
•
l’instructionvpmovmskb ,ymm0 extrait 32 bits de chaque octet de poids
fort deymm0
On aurait pu également remplacer les lignes 8 et 9 du Listing
1vpand ,ymm1,ymm3 ; ymm1 = ymm1 & ymm3
2vpor ,ymm2,ymm4 ; ymm2 = ymm2 | ymm3
1.for_ur32:
2 vpxor ,ymm0 ; ymm0 = [0, 0, ..., 0]
3 vmovdqa ,esi+ecx]
4 vmovdqa ,edi+ecx]
5 vmovdqa ,ymm1 ; ymm2 = ymm1
6 vmovdqa ,ymm3 ; ymm4 = ymm3
8 vpand ,ymm3 ; ymm1 = ymm1 & ymm3
9 vpor ,ymm4 ; ymm2 = ymm2 | ymm3
11 vpcmpeqb ,ymm1 ; si ymm1.b[i] == 0

```text
; ymm0.b[i] = 0xFF
; alors
; ymm0.b[i] = 0x00
vpmovmskb ,ymm0 ; obtenir le nombre de mutations locales
popcnt ,ebp ; compter
add ,ebp ; ajouter aux mutations totales
vpblendvb ,ymm2,ymm0 ; calculer la séquence hypothétique
vmovdqa[ebx+ecx],ymm1; stocker le résultat en z[i:i+15]
add ,32 ; i += 32
dec
jnz
```

> *Listing 14.8.1 – Maximum de Parcimonie version AVX2*

ou bien stocker dans d’autres registres les résultats des unions et intersections
afin d’éviter les dépendances :
1vpand ,ymm1,ymm3 ; ymm1 = ymm1 & ymm3
2vpor ,ymm2,ymm4 ; ymm2 = ymm2 | ymm3
3vpcmpeqb ,ymm4
4...
Amélioration AVX2
Le temps d’exécution est alors de1,35secondes soit un facteur d’amélioration
d’environ62, soit presque deux fois plus rapide que le SSE.

## 14.9 Notons que la fonction de référence optimisée par le compilateur en utilisant par

exemple avecgccles options d’optimisation-O3 -mavx2et le dépliage de boucle
donne un temps d’exécution de l’ordre de1,85secondes soit proche de la version
AVX2 assembleur.
Le code vectorisé avec AVX2 et généré par le compilateur (versionintrinsics) est
nettement plus complexe que ce que nous avons écrit mais le temps d’exécution est
très proche de la version AVX2 assembleur :1,39s. On peut alors se demander si le
compilateur produit un code plus complexe car il sait que le code sera bien plus
optimisé, ou si il fait cela car il ne parvient pas à traduire le code.

## 14.10 La version intrinsics en AVX2 nécessite pour être efficacement traduite par le

compilateur de fournir quelques informations à ce dernier.
Notamment le mot clé__restrict__
3 , indique que pour la durée de vie du
pointeur, seul le pointeur sera utilisé pour accéder à l’objet vers lequel il pointe. L’ob-
jectif est de limiter les effets de l’aliasing de pointeur
ce qui permet au compilateur
d’optimiser le code.
En outre, il est préférable d’indiquer au compilateur que les adresses des ta-
bleauxx,yetzsont alignées sur un multiple de 16 ou 32 octets grâce à la fonction
(ou directive)__builtin_assume_aligned. En conséquence le compilateur utilisera
les instructions de typemovdqaplutôt quemovdquet pourra procéder à quelques
optimisations.
1u32 (u8*__restrict__ ,u8*__restrict__ ,
2 u8*__restrict__ ,u32 )
3 u32 ,mutations=0;
5 x=u8*)__builtin_assume_aligned (x,CPU_MEMORY_ALIGNMENT);
6 y=u8*)__builtin_assume_aligned (y,CPU_MEMORY_ALIGNMENT);
7 z=u8*)__builtin_assume_aligned (z,CPU_MEMORY_ALIGNMENT);
9 __m256i ,v_y,v_z,v_x_and_y,v_x_or_y,
10 v_zero,v_cmp ((aligned(32)));
12 v_zero=_mm256_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
13 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

```text
for(i=0;i<size&~31));i+=32)
v_x=_mm256_load_si256((__m256i*)x[i]);
v_y=_mm256_load_si256((__m256i*)y[i]);
v_x_and_y=_mm256_and_si256(v_x,v_y);
v_x_or_y=_mm256_or_si256(v_x,v_y);
v_cmp=_mm256_cmpeq_epi8(v_zero,v_x_and_y);
u32 =_mm256_movemask_epi8 (v_cmp);
mutations+=_mm_popcnt_u32(r);
v_x=_mm256_andnot_si256(v_cmp,v_x_and_y);
v_y=_mm256_and_si256(v_cmp,v_x_or_y);
v_z=_mm256_or_si256(v_x,v_y);
_mm256_store_si256(__m256i*)z[i],v_z);
}
// dernières itérations
for( i<size; i)
z[i] x[i] y[i];
if(z[i] 0)
z[i] x[i] y[i];
++mutations;
}
}
return ;
39}
```

On notera que l’appel à_mm256_set_epi8peut être remplacé par unvpxor(dont
l’intrinsics est_mm256_setzero_si256), puisqu’elle a pour but de mettre le vecteur
v_zeroà 0).

## 14.11 Pour l’AVX512, on utilise les registreszmmd’une capacité de 64 octets. Le nombre

total de mutations est stocké danseaxalors que le registreebppermet de compter
(en deux fois 32 bits) les mutations pour le vecteur courantzmm1.

```nasm
push ; sauvegarde d'ebp
3.for_u64:
vmovdqa64 ,esi+ecx]
vpandd ,zmm3,edi+ecx]
vpord ,zmm3,edi+ecx]
vpcmpeqb ,zmm0,zmm1 ; comparaison
vmovdqu8 {k1},zmm2 ; remplacement des éléments de zmm1
; par les éléments de zmm2
; suivant k1
vmovdqa64 [ebx+ecx],zmm1
kmovd ,k1 ; partie basse de k1 dans ebp
kshiftrq ,k1,32
popcnt ,ebp
add ,ebp
kmovd ,k2 ; partie haute de k2 dans ebp
popcnt ,ebp
add ,ebp
add ,64
dec
jnz
pop
vzeroupper
29.last_63:
```

L’AVX512 apporte un léger gain par rapport à l’AVX2 (cf. Résultats ci-après).

## 14.12 Afin de tester les différentes versions que nous avons écrites, nous allons exami-

ner les résultats obtenus pour les méthodes suivantes :
1. -O2
2.
méthode de référence optimisée par le compilateur GCC avec option-O3et
options de vectorisation en fonction de l’architecture
3.
4. if
5.
6.
7.
8.
9.
10.
11.

### 14.12.1 Les résultats pour les architectures anciennes sont présentés Table. On note

que le compilateurg++est capable, grâce à l’option-O3, d’optimiser la fonction de
référence de manière très importante. On avoisine, ou parfois on est en dessus de
la méthode SSE (méthode8).
Les méthodes4à7qui suppriment leifdiminuent le temps de calcul par un
facteur2même si elles restent loin de ce que peut apporter la vectorisation avec
SSE.
On note enfin, sur l’Intel 4790, que le passage à l’AVX permet de diminuer par
deux le temps de calcul par rapport au SSE.
n° Méthode IntelIntelIntelAMD IntelIntel
Pentium DCore 2 i7 X6 i5 i7
925Q9300 8601090T3570K 4790
2006 2008 2009 2010 2012 2014
1 ref_v1_O2 224.64 170.22 131.86 110.89 140.27 103.54
2 ref_v1_O3 29.86 11.80 5.47 2.56
3 asm 235.32 185.40 126.40 118.98 114.89 96.59
4 no_if_asm 133.48 98.36 67.72 52.67 48.67 41.62
5 no_if_opt_asm 94.97 85.60 65.33 45.64 33.35 25.95
6no_if_opt_ur4_asm 70.15 87.67 51.68 38.16 28.95 22.52
7no_if_opt_ur8_asm 70.29 86.91 50.25 36.73 28.32 21.89
8 sse2_v1 27.64 9.37 5.84 11.75 4.49 3.66
9 sse41 -9.25 5.72 - 4.42 3.73
10 avx2 - - - - - 1.86
11 avx2_intrinsics - - - - - 1.89
ratio (1 / 8 ou 10) 8.12 18.16 22.57 9.43 31.24 55.66
TABLE14.3– Architectures anciennes : temps d’exécution en secondes de la fonction de
Fitch avec 50_000 répétitions sur des chaînes de 524_287 bases
14.12.2
Pour les architectures modernes (Table), on observe les mêmes tendances.
On notera que la version AVX2 (méthode10) est souvent plus performante que la
version intrinsics traduite par le compilateur (méthode11).
Dans le cas de l’AMD Ryzen 5 3600, la traduction en assembleur avec jeu
d’instruction AVX2 permet d’atteindre0,79secondes soit un facteur d’amélioration
de presque131.
L’Intel Xeon Silver 4208 dispose du jeu d’instructions AVX512. Les résultats
obtenus sont les suivants :
•version de base AVX512 :2.95s
•amélioration avec dépliage par 8 et élimination des dépendances :2.43s
•version intrinsics :2.34s
Dans ce cas c’est la versionintrinsicsqui est la plus efficace.
L’AMD Ryzen 5 9600X dispose également du jeu d’instructions AVX512. Les
résultats obtenus sont les suivants :
•version de base AVX512 :0.50s
•amélioration avec dépliage par 8 et élimination des dépendances :0.42s
•version intrinsics :0.49s
N°Marque Intel AMD IntelIntel AMD Intel
Gamme Core i3Ryzen 7Core i5Core i7Ryzen 5Xeon
Modèle 61001700X 7400 8700 3600 4208
2015 2017 2017 2017 2019 2019
1ref_v1_O2 139.36 111.55 148.59 96.72 103.41 118.36
2ref_v1_O3 2.20 2.50 2.45 1.85 2.02 3.61
3asm 104.56 106.52 110.79 84.37 101.56 123.00
4no_if_asm 42.58 53.86 45.42 34.68 47.03 42.45
5no_if_opt_asm 21.43 19.58 22.82 17.40 17.24 49.80
6no_if_opt_ur4_asm19.67 18.85 20.95 15.92 16.75 23.04
7no_if_opt_ur8_asm18.75 17.17 19.99 15.21 14.68 22.56
8sse2_v1 3.58 3.59 3.52 2.70 3.16 4.30
9sse41 3.58 3.61 3.46 2.60 3.19 4.28
10avx2 1.54
11avx2_intrinsics 1.81 1.39 1.82 1.39 1.09 3.03
ratio (1 / 10) 90.49 97.85 84.42 71.64 130.89 41.24
TABLE14.4– Architectures modernes : temps d’exécution en secondes de la fonction de
Fitch avec 50_000 répétitions sur des chaînes de 524_287 bases.
Dans ce cas, c’est la méthode implantée en assembleur qui est la plus perfor-
mante.

### 14.12.3 Les résultats concernant les architectures récentes figurent Table). Là

également, on note que l’AVX2 est très bénéfique qu’il soit codé à la main ou écrit
sous une version intrinsics et permet de diviser par un facteur 2 le temps obtenu
avec le SSE.
Le cas de l’Intel 12400F est également remarquable. Avec une compilation en
-O2, il se montre bien moins performant que lIntel i7 10850H et l’AMD Ryzen 5
5600G. Néanmoins, par la suite les résultats obtenus sont très compétitifs pour les
méthodes 5,6 et 7 ainsi que les méthodes vectorielles (8 à 11).

## 14.13 Dans cette étude de cas, la fonction de référence peut être optimisée de manière

spectaculaire par le compilateur en utilisant les options de compilation liées à
la vectorisation et le dépliage de boucle. Cependant nous voyons que la version
N°Marque IntelIntel AMD AMD
Gamme i7 i7Ryzen 5Ryzen 5
Modèle 10850H12400f 5600g 9600X
2020 2022 2021 2024
1ref_v1_O2 83.50 104.50 91.38 76.97
2ref_v1_O3 1.85 1.69 1.98 0.64
3asm 79.75 100.53 82.38 70.65
4no_if_asm 27.44 44.54 29.31 13.06
5no_if_opt_asm 16.17 11.98 17.23 9.80
6no_if_opt_ur4_asm 14.81 11.06 14.96 8.30
7no_if_opt_ur8_asm 14.20 10.49 13.99 7.89
8sse2_v1 2.56 1.82 1.74 1.07
9sse41 2.53 1.81 1.75 1.08
10avx2 1.36
11avx2_intrinsics 1.36
ratio (1 / 10) 61.39 108.85 97.85
TABLE14.5– Architectures récentes : temps d’exécution en secondes de la fonction de
Fitch avec 50_000 répétitions sur des chaînes de 524_287 bases.
assembleur avec jeu d’instruction AVX2 écrite à la main (ou la version intrinsics)
sont les plus efficaces. Nous sommes bien entendu tributaires de la disponibilité
d’instructions liées à ce traitement commepcmpeqbetpmovmskb. Enfin, on remar-
quera que l’utilisation de l’AVX512 permet de grandement simplifier le codage du
traitement en raison de l’utilisation des registres de masquek1etk2. Le traitement
est également encore plus simple et plus efficace à traduire en architecture 64 bits,
puisqu’on n’est pas contraint de réaliser le calcul du nombre de mutations en deux
fois 32 bits mais en une fois 64 bits. Gageons que l’implantation de l’AVX512 devien-
dra plus efficace dans les années à venir et deviendra deux fois plus performante
que l’AVX2.

## 14.14 Exercice 49 -Réalisez un dépliage de la version SSE 4.1 par 4, puis par 8. Intégrez

votre code au projet et comparez les résultats obtenus aux méthodes existantes.
Exercice 50 -Réalisez un dépliage de la version AVX par 4, puis par 8. Intégrez
votre code au projet et comparez les résultats obtenus aux méthodes existantes.
