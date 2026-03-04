# Chapitre 8 : Unitésvectorielles

## 8.1 Les unités vectorielles permettent devectoriserle code, en d’autres termes, de

le paralléliser au sein du microprocesseur. On exécutera la même instruction sur
plusieurs données différentes stockées dans un registre de type MMX (64 bits), SSE
(128 bits) ou AVX (256 bits).
Par exemple avec la technologie SSE, au lieu d’écrire :
1float [4],v2[4],v3[4];
3void (float*x,float*y,float*z,int )

```text
for(int =0;i<4; i)
z[i] x[i] y[i]
}
7}
9vector_sum(v1,v2,v3,4);
```

On réalise une seule opération en parallèle sur un registre capable de contenir

```text
floats, ce que l’on note :
1z[0:3] x[0:3] y[0:3]
```

La notationx[0:3]symbolisex[0]àx[3], elle n’est pas utilisable en langage C,
elle nous permet seulement d’exprimer de manière concise le traitement réalisé.
On parle alors de traitement SIMD pourSingle Instruction Multiple Data, cela
signifie que la même instruction est appliquée sur des données différentes et pour
que cela ait un intérêt en terme de performance, on réalise les calculs en parallèle
et non pas de manière séquentielle.
Par la suite nous allons nous intéresser aux technologies SSE et AVX et nous ne
traiterons pas du MMX désuet à présent.
La technologie MMX pourMultiMedia eXtensionsest apparue sur les processeurs
Intel Pentium MMX en 1997. Il s’agit d’un jeu d’instructions composé de 57 ins-
tructions qui traitent uniquement des entiers d’un maximum de 64 bits. Le MMX
souffre d’un défaut majeur qui fait qu’il rend indisponible la FPU puisqu’il en utilise
une partie des registres. On ne peut donc travailler simultanément avec la FPU et
le MMX. Ce défaut a été corrigé avec l’introduction du SSE.
Notons également que nous allons suivre la convention de représentation Intel
pour les instructions SSE qui consiste à écrire les valeurs d’un vecteur en mémoire
ou d’un registre en plaçant la partie haute à gauche et la partie basse à droite. Cette
convention reprend en fait le principe dulittle endianvu Section.

## 8.2 Sous le sigle SSE (Streaming SIMD Extensions) nous réunissons tous les jeux

d’instructions successifs SSE, SSE2, SSE3, SSSE3, SSE4A, SSE4.1 et SSE4.2. Nous
n’allons faire qu’effleurer l’ensemble des instructions SSE qui sont bien trop nom-
breuses et diverses pour être toutes passées en revue et nécessiteraient à elles seules
un ouvrage. Le lecteur intéressé pourra consulter à ce sujet l’excellent livre de [19].
Nous nous intéresserons et décrirons dans la suite de ce chapitre les instructions
qui entrent en jeu dans les études de cas que nous ménerons par la suite.
La première version du SSE est un jeu de 70 instructions apparu en 1999 sur le
Pentium III en réponse à la technologie 3DNow! d’AMD, née un an plus tôt. Ces
instructions traitent des entiers ou des réels. Les versions suivantes ont apporté
de nouvelles instructions de manipulation des données ou de calcul comme par
exempledpps(Dot Product of Packed Single Precision Floating-Point Values) du jeu
d’instructions SSE4.1 qui réalise le produit scalaire de deux vecteurs.
Sur les Pentium III notamment, l’efficacité du SSE était nettement moindre que
sur son successeur, le Pentium 4, car bien que le Pentium III disposât de registres de
stockage de 128 bits, il ne possédait que de registres 64 bits pour réaliser les calculs.
De ce fait, une instruction SSE était traitée en deux fois 64 bits, on commençait par
traiter la partie basse, puis la partie haute, ce qui est moins efficace que de traiter
128 bits en une seule fois.
En architecture 32 bits, il existe 8 registres SSE de 128 bits nommésxmm0à
xmm7
1 . Ce nombre de registres est doublé en architecture 64 bits avec l’ajout des
registresxmm8àxmm15.
Les registres SSE possèdent des instructions qui traitent les valeurs qu’ils
contiennent (cf. Figure) :
•soit sous forme d’entiers au format :
1. A ne pas confondre avec les registres MMX qui sont appelésmm0àmm7.
FIGURE8.1 – Types de données contenues dans un registre SSE
▷16 octets
▷8 mots
▷4 double mots (4 entiers 32 bits signés ou non)
▷2 quadruples mots (2 entiers 64 bits signés ou non)
▷double quadruple mot (double quad word) soit un total de 128 bits
•soit sous forme de nombres à virgule flottante (32 et 64 bits)
▷4 flottants simple précision (float)
▷2 flottants double précision (double)
On disposera donc de plusieurs instructions similaires mais avec des mnémoni-
ques différents en fonction que l’on traite des entiers ou des flottants. La grande
majorité de ces instructions seront suffixées par une à deux lettres (cf. Table)
qui correspondent au type de donnée manipulée.
Ainsi, l’instructionpaddbréalise une addition entière en parallèle entre les 16
octets de ses deux opérandes, alors quepaddb, paddw, padddréalise une addition
entière en parallèle sur 4 entiers 32 bits. De la même manièreaddps, addpdréalise
une addition en parallèle sur 4 flottants en simple précision etaddpdtraite 2
flottants en double précision.
On note également pour les flottants les suffixesssetsdqui ne traitent que la
partie basse du registre SSE (respectivement 32 et 64 bits). Ces instructions liées à
des flottants simple ou double précision permettent de remplacer la FPU car en 64
bits les paramètres de type float ou double sont passés dans les registres SSE et les
calculs sont réalisés avec ces mêmes registres.
Type Taille Nom Quantité Suffixe
en octets dans 128 bits
entier 1 byte 16 b
entier 2 word 8 w
entier 4 double word 4 d
entier 8 quad word 2 q
flottant 4 float 4 ps
flottant 8 double 2 pd
flottant 4 float 1 ss
flottant 8 double 1 sd
TABLE8.1 – Suffixes des instrutions SSE
Facteur d’amélioration
Il n’est pas possible de manipuler un registre vectoriel en faisant directe-
ment référence à sonième élément (sauf pour des instructions utilisant un
masque de sélection) mais afin de simplifier la compréhension de certaines
instructions et traitements nous introduisons la notation suivante qui nous
permettra de décrire le comportement des instructions SSE et AVX sous forme
de petits programmes C :
xmm0.T[i]
oùTreprésente le type (b,w,d,q,ps,pd, présenté Table) et ileième
élément. Ainsixmm0.b[15]représente le dernier octet du registrexmm0, donc
l’octet de poids fort, l’octet de poids faible étantxmm0.b[0].
Notons que dans la documentation Intel on fait référence aux bits du re-
gistre. Ainsi, pour représenterxmm0.b[15]on indiqueraxmm0[127:120]qui
est l’intervalle de bits qui correpond au seizième octet du registre.

### 8.2.1 Le chargement des données vers les registres SSE ou le stockage des valeurs

contenues dans les registres vers la mémoire se font à l’aide des instructions de
déplacement de typemov.
Pour les entiers, on utiliseramovdqu(MOV Double Quad word Unaligned) ou
movdqa, movdqu(MOV Double Quad word Aligned). Dans le cas du SSE les données
sont alignées si l’adresse depuis laquelle on lit ou on écrit est un multiple de
d’alignement des données en mémoire.
Le format des instructions de chargement de données est de la forme :

```text
movdqa ,ebx]
; mémoire (Load)
movdqa[edi+ecx*4],xmm7; idem (Store)
movdqa ,xmm1 ; deux opérandes SSE
```

Pour les flottants, on utilisera les instructionsmovupsoumovapsqui fonctionnent
sur le même modèle.
Cependant, on notera que l’on peut utilisermovdqa(oumovdqu) avec des flottants
etmovaps, movups(oumovups)avec des entiers puisqu’il n’y a a priori aucune
conversion ou modification des données, on se contente de lire les données et
les stocker dans un registre ou en mémoire. J’avais tenté, il y a quelques années,
de contacter Intel afin de savoir pourquoi ils existaient deux types d’instructions
différentes mais je n’ai jamais eu de retour.
Enfin il existe des instructions qui ne traitent que la partie basse du registre SSE
commemovdpour les entiers etmovss, movsd,movsdpour les flottants simple et
double précision :
1mov ,0x01010101
2movd ,eax ; xmm1.d[0] = 0x01010101, xmm1.d[1:3] = ?
3movss ,edi]
4movsd ,edi]
On charge ici la valeur hexadécimale sur 32 bits0x01010101dans la partie basse
du registrexmm1, les 3 autres valeurs 32 bits ne sont pas modifiées.
Attention
Le fonctionnement est identique pourmovssavec la particularité qu’on ne
peut charger une valeur depuis un registre mais seulement depuis la mémoire
comme pour la FPU.

### 8.2.2 Pour les entiers, on utilisera les instructionspaddpour l’addition,psubpour

la soustraction etpmullpour la multiplication, suffixées par la quantité traitée.
Notons qu’il n’existe pasd’instructionpdivqui réaliserait une division entière.
Pour les flottants, on trouve les instructionsaddps,subps,mulps,divpsainsi
queaddpdet consorts.
Il existe également des instructions commeaddsubps ,xmm2 dont le com-
portement est le suivant :
1xmm1.ps[0] xmm2.ps[0]
2xmm1.ps[1] xmm2.ps[1]
3xmm1.ps[2] xmm2.ps[2]
4xmm1.ps[3] xmm2.ps[3]
ethaddps ,xmm2qui réalise une addition ditehorizontale.
FIGURE8.2 – Instruction haddps
1;haddps ,xmm2
2;on
3xmmt.ps[0] xmm1.ps[0] xmm1.ps[1]
4xmmt.ps[1] xmm1.ps[2] xmm1.ps[3]
5xmmt.ps[2] xmm2.ps[0] xmm2.ps[1]
6xmmt.ps[3] xmm2.ps[2] xmm2.ps[3]
7xmm1=xmmt
L’intérêt de l’instructionhaddps(cf. Figure) est qu’elle permet de faire la
somme des quatre valeurs flottantes simple précision contenues dans un registre
SSE
en procédant ainsi :
1haddps ,xmm1
2haddps ,xmm1
On réalise deux fois l’addition horizontale d’un registre avec lui même. Au final
on obtient :
1xmm1.ps[0:3] xmm1.ps[0] xmm1.ps[1] xmm1.ps[2] xmm1.ps[3]
On trouve égalementphaddwetphadddpour les entiers 16 et 32 bits respective-
ment qui réalisent l’addition horizontale de mots et double mots.

### 8.2.3 Il n’existe pas d’instructions qui réalisent les calculs des fonctions trigonomé-

triques, logarithmiques ou exponentielles. Il faut utiliser des librairies spécialisées
comme l’Intel MKL
(Math Kernel Library) ou l’AMD libM
(Math Library). Vous
trouverez également d’autres librairies non propriétaires sur internet.

### 8.2.4 Les instructions que nous qualifions de binaires agissent sur la totalité des

128 bits d’un registre SSE (ou les 256 bits d’un registre AVX). Il s’agit depand,
por, pxor
,por,pxor. Ces instructions réalisent respectivement unet binaire, leou
binaire, leou exclusif binaire. Il existe également l’instructionpandn(Parallel AND
Not) qui réalise un et binaire entre le complémentaire de l’opérande de destination
et l’opérande source.
1pand ,xmm2 ; xmm1 = xmm1 and xmm2
2por ,esi]
3pandn ,xmm4 ; xmm1 = not(xmm1) and xmm4
On pourra voir comment utiliser ces instruction dans un cas concret en consul-
tant le Chapitre.

### 8.2.5 Il existe de nombreuses instructions de conversion dont le mnémonique com-

mence parcvtss2sd, cvtps2pd, cvtss2si, cvtsi2sdpourconvert. Elles per-
mettent de convertir des flottants en simple ou double précision ou de convertir
des flottants en entiers :
•cvtss2sdconvertit un flottant simple précision en double précision
•cvtsd2ssconvertit un flottant double précision en simple précision
•cvtps2pdconvertit des flottants simple précision en double précision
•cvtpd2psconvertit des flottants double précision en simple précision
•cvtss2si
convertit un flottant simple précision en entier dans un registre 32
ou 64 bits
•cvtsi2ss
convertit un entier situé dans un emplacement mémoire ou un
registre 32 ou 64 bits en un flottant simple précision
•cvtsd2si
convertit un flottant double précision en un entier dans un registre
32 ou 64 bits
•cvtsi2sd
convertit un entier situé dans un emplacement mémoire ou un
registre 32 ou 64 bits en un flottant double précision
Par exemple, le code suivant charge les 4 valeurs flottantes devdansxmm0puis
convertit la partie basse du registre vectoriel en une valeur entière danseax. Au
finaleaxcontient la valeur 12.
1section
2 v: ,14.0,16.0,20.0
4section
6movups ,v]
7cvtss2si ,xmm0

### 8.2.6 Les instructionspshufdpour les entiers etshufpspour les flottants permettent

de sélectionner ou réorganiser les données au sein d’un registre SSE mais ont un
comportement différent. La plupart de ces instructions utilisent une troisième opé-
rande qualifiée de masque et notéeimm8ce qui signifie qu’il s’agit d’une constante
sur 8 bits et elle est utilisée pour indiquer quels champs sélectionner.
Par exemplepshufd ,xmm2,imm8 , qui est présentée Figure, réalise
une sélection et réorganisation des valeurs dexmm2versxmm1:
1;pshufd ,xmm2,imm8
2xmm1.ps[0] xmm2.ps[imm8&0x03];
3xmm1.ps[1] xmm2.ps[imm8>>2) 0x03];
4xmm1.ps[2] xmm2.ps[imm8>>4) 0x03];
5xmm1.ps[3] xmm2.ps[imm8>>6) 0x03];
L’utilisation de cette instruction sur la même opérande avec un masque de
0(pshufd ,xmm1,0 ) a pour effet de recopier la valeurxmm1.d[0]dans
xmm1.d[1:3]. Au final on obtient donc quatre fois la même valeur dansxmm1.
On peut bien entendu l’utiliser pour des flottants simple précision car l’instruc-
tionshufps, qui possède la même syntaxe, prend en considérationxmm1etxmm2
pour la sélection des valeurs mais possède un comportement quelque peu différent :
FIGURE8.3 – Instruction PSHUFD
1;shufps ,xmm2,imm8
2xmmt[0] xmm1.ps[imm8&0x03];
3xmmt[1] xmm1.ps[imm8>>2) 0x03];
4xmmt[2] xmm2.ps[imm8>>4) 0x03];
5xmmt[3] xmm2.ps[imm8>>6) 0x03];
6xmm1=xmmt
Une autre instruction intéressante estblendps, mais elle n’utilise que les 4
premiers bits de la constanteimm8. Elle permet de remplacer les valeurs du registre
de destination par des valeurs du registre source :
1// blendps xmm1, xmm2, imm8
2for(int =0;index<=3; index)
3 xmm1.ps[index] imm8&1<<index)) 0
4 ?xmm1.ps[index] xmm2.ps[index];
5}
Ainsi, le code suivant remplaceraxmm1.ps[1]parxmm2.ps[1]:
1blendps ,xmm2,00000010b
Une instruction très utile estpblendvb(Variable Blend Packed Bytes). Elle tra-
vaille sur les octets d’un registre SSE et utilise par défaut un masque de sélection
basé sur le registrexmm0:
1// pblendvb xmm1, xmm2
2int ,byte;
3for(byte=0,i=7;i<=127;i+=8, byte)
4 xmm1.b[byte] xmm0.bits(i) 1) xmm2.b[byte]
5 xmm1.b[byte];
6}
Elle permet de sélectionner les octets dexmm1ou dexmm2en fonction des octets
de poids fort dexmm0positionnés à0ou1.
Dans la même veine, mais pour les valeurs flottantes, on trouveblenvps(Va-
riable Blend Packed Single Precision) :
1blendvps ,xmm2 <xmm0>
Il existe une série d’instructionsvpbroadcast(b,w,d,q)qui permettent de reco-
pier une valeur dans plusieurs emplacements d’un registre SSE ou AVX. Par exemple
vpbroadcastb ,xmm1 recopie le premier octet du registrexmm1dans les 15
autres emplacements du registre :
1// vpbroadcastb xmm1, xmm1
2for(int =1;index<=15; index)
3 xmm1.b[index] xmm1.b[0];
4}
Enfin, l’instructioninsertps ,xmm2,imm8réalise plusieurs opérations
1.
en premier lieu, elle sélectionne l’une des 4 valeurs de la sourcexmm2grâce
aux bits 6 et 7 de la constante imm8
2.
elle recopie ensuite cette valeur dansxmm1à la position indiquée par les bits
4 et 5 de imm8
3.
elle met enfin, en fonction des bits 0 à 3 positionné à 1 de imm8, les valeurs
correspondantes dansxmm1à 0
Le code qui suit donne comme résultat un registrexmm1contenant les valeurs
[7.0, 3.0, 0.0, 0.0].
1section
2 a ,2.0,3.0,4.0
3 b ,6.0,7.0,8.0
5section

```text
movups ,a]
movups ,b]
insertps ,xmm2,10_11_0011b
```

On commence par charger dansxmm1le vecteur [4.0, 3.0, 2.0, 1.0], puis dans
xmm2le vecteur [8.0, 7.0, 6.0, 5.0]. On choisit alors la valeur d’indice10bdexmm2,
c’est à dire7.0et on la recopie en position11bdexmm1. La partie basse de la
constanteimm8, soit0011b indique que les valeurs d’indices0et1dexmm1doivent
être mises à zéro.
8.3

### 8.3.1 Sous le sigle AVX nous plaçons les jeux d’instructions AVX (Advanced Vector

eXtensions) et AVX2 256 bits. Nous ne nous intéresserons qu’en fin de chapitre à
l’AVX 512 bits. Tout comme en architecture 32 bits, il existe8registres AVX de 256
bits nommésymm0àymm7. Ce nombre de registres est doublé en architecture 64 bits
avec l’ajout deymm8àymm15. Les principaux changements par rapport au SSE sont
les suivants :
•
les instructions AVX commencent par la lettrevpour les distinguer des
instructions SSE
•
les instructions AVX peuvent agir sur les registresymmouxmmet vont utiliser
la même syntaxe
•
cependant, une instruction AVX peut prendre une opérande supplémentaire
qui sera le registre de destination
Par exemple, en SSE, si on écritpaddd ,xmm2 , les quatre entiers dexmm2
sont ajoutés àxmm1, en d’autres termes on axmm1.d[0:3] xmm2.d[0:3] . Les
valeurs présentes dansxmm1sont donc perdues. On aura le même comportement si
on utilisevpaddd ,xmm2.
1; avec deux opérandes
2 paddd ,xmm2; xmm1.d[0:3] = xmm1.d[0:3] + xmm2.d[0:3]
3vpaddd ,xmm2; xmm1.d[0:3] = xmm1.d[0:3] + xmm2.d[0:3]
Par contre, si on écritvpaddd ,xmm1,xmm2 , le registrexmm3recevra le
résultat de la somme dexmm1etxmm2. Les registresxmm1etxmm2ne seront donc pas
modifiés.
1; avec trois opérandes
2vpaddd ,xmm1,xmm2; xmm3.d[0:3] = xmm1.d[0:3] + xmm2.d[0:3]

### 8.3.2 Certaines instructions, commeinsertps, dont nous avons parlé précédemment,

travaillent uniquement avec la partie basse des registres AVX. Cela est dû à la
constanteimm8qui interagit avec l’un des quatre flottants simple précision d’un
registre SSE. L’extension AVX de cette instructionvinsertpsne permet pas d’iden-
tifier les flottants dans la partie haute d’un registre AVX.
Il est donc nécessaire pour transposer l’utilisation du SSE vers l’AVX de tra-
vailler sur la partie basse du registre AVX puis de déplacer la partie basse vers la
partie haute. On dispose par exemple des instructionsvinsertf128,vextractfou
vpbroadcastqui réalisent ces manipulations.
En particulier, l’instructionvinsertf128 ,ymm2,xmm1,0/1 copieymm2
dansymm3puis remplace la partie haute (1) ou la partie basse (0) deymm3par les
valeurs dexmm1.
vextractf128 ,ymm2,0/1
, copie la partie basse (0) ou la partie haute (1)
deymm2dansxmm1.
La série d’instructionsvpbroadcast(b/w/d/q) x/ymm, regrecopie les 8/16/32
ou 64 bits d’un registre général respectivement vers tous les octets, mot, double
mots ou quadruples mots d’un registre SSE ou AVX.
Ainsi pour recopier 32 fois l’octet 0x85 dans le registreymm1, on écrira :
1mov ,0x85 ; ou mov al, 0x85
2vpbroadcastb ,eax
8.3.3
Certaines instructions n’ont pas le même comportement en AVX et en SSE.
C’est le cas dehaddpsdont nous avons parlé Section. Nous avons vu que
l’utilisation de deux fois cette instruction sur le même registre permet de calculer la
somme des quatre valeurs qu’il contient. Malheureusement cela ne fonctionne pas
avec les 8 valeurs 32 bits que contient un registreymmlorsque l’on utilisevhaddps.
En effet, le code suivant :
1section
2 v ,2.0,3.0,4.0,5.0,6.0,7.0,8.0
4section
6 vmovups ,v]
7 vhaddps ,ymm0
8 vhaddps ,ymm0
9 vhaddps ,ymm0
produira successivement les résultats :
Instruction ymm0
vmovups 8 7 6 5 4 3 2 1
vhaddps 15 11 15 11 7 3 7 3
vhaddps 26 26 26 26 10 10 10 10
vhaddps 52 52 52 52 20 20 20 20
8.4. AFFICHAGE D’UN REGISTRE 245

```text
Or on aimerait obtenir la somme des valeurs c’est à dire 36. Il faut alors procéder
```

comme suit :
1 vhaddps ,ymm0 ; ymm0 = [15, 11, 15, 11, 7, 3, 7, 3]
2 vhaddps ,ymm0 ; ymm0 = [26, ... , 26, 10, ..., 10]
3 vextractf128 ,ymm0,1; xmm1 = [26, 26, 26, 26]
4 addps ,xmm1 ; xmm0 = [36, 36, 36, 36]
On réalise la somme horizontale deux fois comme en SSE, puis on transfert la
partie haute deymm0versxmm1. Il suffit alors d’additionner les deux registresxmm0
etxmm1pour avoir dansxmm0le résultat escompté.
8.4

### 8.4.1 Nous présentons, ci-après, deux macro-instructions qui permettent d’afficher

un registre SSE et qui peuvent être adaptées pour les registres AVX. Il serait
intéressant d’en faire une librairie que l’on peut inclure lors du débogage de
certains programmes. Nous laissons cette tâche au lecteur à titre d’exercice.
1extern
3section
5str_sse_int: `[%d %d %d %d] `,0
6str_sse_flt: `[%f %f %f %f] `,0
8%macro print_sse_int 1
9 sub ,16

```nasm
; affichage Intel
pshufd%1,1,00011011b
movdqu[esp], 1
push
call
add ,20
; rétablir les valeurs initiales
pshufd%1,1,00011011b
18%endmacro
20%macro print_sse_flt 1
sub ,48 ; 16 + 4*8
movups[esp], 1 ; stocke le registre
fld [esp+32]
fstp [esp+24]
fld [esp+36]
fstp [esp+16]
fld [esp+40]
fstp [esp+8]
fld [esp+44]
fstp [esp]
push
call
add ,48+4
34%endmacro
```

La première macro appeléeprint_sse_intaffiche un registre SSE passé en
paramètre sous la forme de 4 entiers signés. Les entiers sont affichés dans l’ordre
décroissant des adresses mémoires, l’entier à l’adresse mémoire la plus haute est
donc affiché en premier.
La seconde macroprint_sse_fltaffiche le contenu d’un registre SSE en consi-
dérant qu’il contient quatre flottants en simple précision, mais comme on affiche
des flottants, il faut les convertir en double précision avant l’affichage.

### 8.4.2 En mode 64 bits, le code est plus long et un peu plus complexe. Dans le cas

de l’affichage du registre en considérant qu’il contient quatre entiers, ces derniers
doivent être passés en paramètres. On doit donc préserver les registresrdi,rsi,
rdx,rcxetr8carrdicontiendra la chaîne du format d’affichage et les autres
registres les quatre entiers à afficher.
1extern
2defaultrel
4section
6str_sse_int: `[%d %d %d %d] `,0
7str_sse_flt: `[%f %f %f %f] `,0
9section
11%macro print_sse_int 1
12 sub ,128+16+8*6

```nasm
mov [rsp],rdi
mov [rsp+8],rsi
mov [rsp+16],rdx
mov [rsp+24],rcx
mov [rsp+32],r8
mov [rsp+40],rax
lea ,str_sse_int]
movdqu[rsp+56], 1
mov ,rsp+56]
mov ,rsp+60]
mov ,rsp+64]
mov ,rsp+68]
xor ,rax
call WRT..plt
mov ,rsp+40]
mov ,rsp+32]
mov ,rsp+24]
mov ,rsp+16]
mov ,rsp+8]
mov ,rsp]
add ,128+16+8*6
34%endmacro
36%macro print_sse_flt 1
sub ,128+5*16
movdqu[rsp+16],xmm0 ; sauvegarde des registres
movdqu[rsp+32],xmm1 ; utilisé pour le passage
movdqu[rsp+48],xmm2 ; des flottants
movdqu[rsp+64],xmm3
movdqu[rsp], 1
cvtss2sd ,rsp]
cvtss2sd ,rsp+4]
cvtss2sd ,rsp+8]
cvtss2sd ,rsp+12]
lea ,str_sse_flt]
mov ,4
call WRT..plt
movdqu ,rsp+64]
movdqu ,rsp+48]
movdqu ,rsp+32]
movdqu ,rsp+16]
add ,128+5*16
55%endmacro
```

Pour ce qui est de l’affichage du registre sous forme de quatre flottants, on doit
préserverxmm0àxmm3car on va les utiliser pour passer les flottants que l’on doit
convertir en quatre valeurs double précision grâce à l’instructioncvtss2sd. On
indique que quatre valeurs sont à afficher en plaçant la valeur 4 dans le registre
eax(ligne 48).
Chacune des macros commence par abaisser le sommet de pile de 128 octets
(afin de préserver lared zonedu sous-programme dans lequel on se trouve) plus
le nombre d’octets nécessaires pour préserver les valeurs des registres qui seront
modifiés temporairement pour réaliser l’affichage.

## 8.5 Lesintrinsicssont un apport important pour toute personne qui ne désire

pas forcément écrire des programmes en assembleur. Les intrinsics sont en fait
une interface entre le langage C et les instructions assembleur vectorielles. Elles
autorisent l’écriture de sous-programmes C en utilisant les instructions vectorielles
au travers de l’appel de fonctions, un peu à la manière des fonctionsbuilt-in
évoquées Section.
Définition : Fonction intrinsèque
Une fonctionintrinsèqueest, dans la théorie des compilateurs, une fonction
disponible dans un langage de programmation donné et dont l’implémenta-
tion est assurée par le compilateur.
L’avantage des fonctions intrinsèques est double :
•
on écrit directement en C, le code est donc portable et on dispose des
structures de contrôle de haut niveau comme la bouclefor
•le compilateur se charge de l’optimisation du code
Néanmoins, on rencontre quelques difficultés lorsque l’on apprend à utiliser les
intrinsics pour trois raisons :
•
il existe une réelle difficulté à connaître le nom des fonctions par rapport aux
instructions assembleurs
•les paramètres sont parfois mal décrits ou mal ordonnés (cf._mm_set_ps)
•
il est nécessaire de typer les données soumises aux instructions (__m128,
__m128i)
Heureusement, il existe un site web très bien fait, l’Intel Intrinsics Guide
qui
nous permet de retrouver les intrinsics en fonction de leur nom ou de l’instruction
assembleur qu’elles remplacent.
Selon le jeu d’instructions utilisé, il faudra inclure le fichier d’entête de la
librairie C adéquat (cf. Table) :
Fichier Jeu
<mmintrin.h>MMX
<xmmintrin.h>SSE
<emmintrin.h>SSE2
<pmmintrin.h>SSE3
<tmmintrin.h>SSSE3
<smmintrin.h>SSE4.1
<nmmintrin.h>SSE4.2
<ammintrin.h>SSE4A
<wmmintrin.h>AES
<immintrin.h>AVX
TABLE8.2 – Inclusion des fichiers entête selon le jeu d’instructions SSE ou AVX utilisé

### 8.5.1 Comme les intrinsics sont des fonctions, il est nécessaire de redéfinir des types

afin d’indiquer au compilateur C la taille des variables qu’il manipule. Nous avons
fait figurer Table, les trois types qui sont utilisés dans le cadre du SSE.
TypeDescriptionExemple d’instruction
__m1281 ou 4 floats _mm_add_ps, _mm_add_ss
__m128d2 doubles _mm_add_pd, _mm_add_sd
__m128ientiers _mm_add_epi32
TABLE8.3 – Types intrinsics
Les instructions se basent généralement sur le format_mm_<oper>_<suffix>où
operest le type d’opération (add, sub, mul, ...) etsuffixest donné Table. Par
exemple,epi32représente 4 valeurs 32-bits et signifieExtended Packed Integers. Le
termeepuest utilisé pour les valeurs non signées (Unsigned).
nom type
ss, sd 1 float, 1 double
ps, pd 4 float, 2 double
i128 registre 128 bits
i64, u64 2 x 64 bits entiers
i32, u32, epi32, epu32 4 x 32 bits entiers
i16, u16, epi16, epu16 8 x 16 bits entiers
i8, u8, epi8, epu8 16 x 8 bits entiers
TABLE8.4 – suffixes des intrinsics
A titre d’exemple, voici quelques instructions et leur format :
•__m128 _mm_add_ss(__m128 a, __m128 b)
additionne les 2 flottants simple
précision en partie basse des registres vectorielsaetb
•__m128 _mm_add_ps(__m128 a, __m128 b)
additionne 4 flottants simple
précision en parallèle
•__m128d _mm_add_pd(__m128d a, __m128d b)
additionne 2 flottants double
précision en parallèle
•__m128i _mm_add_epi32(__m128i a, __m128i b)
additionne 4 entiers en
parallèle
•__m128i _mm_and_si128(__m128i a, __m128i b)
réalise un et binaire entre
deux registres SSE
On note que certaines instructions sont équivalentes, et bien que les formats de
données sur lesquelles elles agissent soient différents, elles ont le même effet.
Pour en revenir à la fonction initiale de ce chapitre, qui consiste à additionner
deux vecteurs de quatrefloat, celle-ci serait traduite en intrinsics sous la forme :
1void (float*x,float*y,float*z)
2 __m128 ,vy,vz;
4 vx=_mm_load_ps(&x[0]);
5 vy=_mm_load_ps(&y[0]);
6 vz=_mm_add_ps(vx,vy);
7 _mm_store_ps(&z[0],vz);
8}
Sachant que les vecteursx,y,zont une taille de 4 éléments. En utilisant le
compilateurg++avec l’optimisation-O1en 32 bits, le code précédent est traduit
en :

```nasm
mov , esp+4]
movaps ,eax]
mov , esp+8]
addps ,eax]
mov , esp+12]
movaps[eax],xmm0 ; z[0:3] = xmm0
```

On se rend alors compte que les vecteurs que l’on avait défini dans la partie
intrinsicsvx,vy,vzsont finalement soit ignorés (cas devy), soit remplacés par des
registres SSE (cas devxetvz).
On aurait pu éviter de déclarer les variablesvx,vy,vzen écrivant simplement :
1_mm_store_ps(&z[0],_mm_add_ps(_mm_load_ps(&x[0]),_mm_load_ps(&y[0])));
8.5.2

#### 8.5.2.1 Nous présentons, Table, les différentes possibilités offertes pour le char-

gement des données depuis la mémoire ou l’initialisation d’un registre avec des
flottants simple précision.
A titre d’exemple, la fonction_mm_set_psutilisée ainsi :
1#include
2#include
4float (float ,float ,float ,float )
5 __m128 ;
6 x=_mm_set_ps(a,b,c,d);
7 x=_mm_hadd_ps(x,x);
nom type [3][2][1][0]
__m128 _mm_load_ss(float *p)charge un réel 0 0 0 p[0]
en partie basse
__m128 _mm_load1_ps(float *p)charge un réel p[0] p[0] p[0] p[0]
et copie 4 fois
__m128 _mm_loadu_ps(float *p)charge 4 réels p[3] p[2] p[1] p[0]
non alignés
__m128 _mm_load_ps(float *p)charge 4 réels p[3] p[2] p[1] p[0]
alignés
__m128 _mm_set_ss(float w) affecte un réel 0 0 0 w
en partie basse
__m128 _mm_set1_ps(float w)affecte 4 fois w w w w
le même réel
__m128 _mm_setzero_ps (void)met à 0 les 4 valeurs 0 0 0 0
__m128 _mm_set_ps(float z, affecte les 4 floats z y x w
float y, float x, float w)
TABLE8.5 – Chargement des flottants depuis la mémoire
8 x=_mm_hadd_ps(x,x);

```bash
float ;
_mm_store_ss(&y,x);
return ;
12}
```

sera traduite par gcc/g++ en architecture 32 bits avec option-O3par :
1function:
2 sub ,28

```text
movss ,esp+36]
movss ,esp+44]
insertps ,esp+32],0x10; xmm1 = [ -, -, a, b]
insertps ,esp+40],0x10; xmm0 = [ -, -, c, d]
movlhps ,xmm1 ; xmm0 = [ a, b, c, d]
haddps ,xmm0
haddps ,xmm0
movss [esp+12],xmm0
fld [esp+12]
add ,28
ret
```

alors que les premières instructions (lignes 3 à 7) peuvent être remplacées par :

```text
movups ,esp+4]
pshufd ,xmm0,00011011b
```

Il est alors, dans certains, préférable d’écrire du code assembleur qui sera plus
rapide.

#### 8.5.2.2 On retrouve les opérations similaires à celles de chargement comme celles de la

Table.
nom type [3][2][1][0]
__m128 _mm_store_ss(float *p)stocke le réel p[0]
en partie basse
__m128 _mm_store1_ps(float *p)stocke un réel p[0] p[0] p[0] p[0]
et copie 4 fois
__m128 _mm_storeu_ps(float *p)stocke 4 réels p[3] p[2] p[1] p[0]
non alignés
__m128 _mm_store_ps(float *p)stocke 4 réels p[3] p[2] p[1] p[0]
alignés
__m128 _mm_set_ss(float w) affecte un réel 0 0 0 w
en partie basse
__m128 _mm_set1_ps(float w) affecte 4 fois w w w w
le même réel
__m128 _mm_setzero_ps (void)met à 0 les 4 valeurs 0 0 0 0
__m128 _mm_set_ps(float z, affecte les 4 floats z y x w
float y, float x, float w)
TABLE8.6 – Stockage des flottants en mémoire

### 8.5.3 On trouve le même genre d’instructions que pour les réels avec bien entendu

quelques différences ainsi que les instructions évoquées dans les sections pré-
cédentes. Concernant le chargement des données, on dispose, entre autre, des
intrinsics suivantes :
•__m128i _mm_load_si128(__m128i const* mem_addr)
permet de charger 16
octets situés à l’adressemem_addrmultiple de 16 dans un registre SSE, il s’agit
de l’instructionmovdqa
•__m128i _mm_loadu_si128(__m128i const* mem_addr)
permet de charger 16
octets situés à l’adressemem_addrdans un registre SSE, il s’agit de l’instruction
movdqu
•__m128i _mm_loadu_si32(void const* mem_addr)
charge en partie basse
d’un registre SSE la valeur 32 bits située à l’adressemem_addr, il s’agit de
l’instructionmovd
•__m128i _mm_loadu_si64(void const* mem_addr)
charge en partie basse
d’un registre SSE la valeur 64 bits située à l’adressemem_addr, il s’agit de
l’instructionmovq
•__m128i _mm_set_epi32(int e3, int e2, int e1, int e0)
remplit un
registre SSE avec quatre valeurs entière,e0étant positionné en partie basse
du registre ete3en partie haute
•__m128i _mm_set1_epi32(int a)
stocke quatre fois la valeur entièreadans
un registre SSE
•void _mm_store_epi32 (void* mem_addr, __m128i a)
stocke le registre SSE
à l’adresse indiquée qui doit être multiple de 16
•void _mm_store_si128 (__m128i* mem_addr, __m128i a)
, équivalente à la
précédente

### 8.5.4 On considère deux vecteurs d’entiersuetvdesizeéléments et on réalise

l’additionu[i] v[i].
La première version qui n’utilise pas les intrinsics est évidente :
1void (int*u,int*v,int )

```text
for(int =0;i<size; i)
u[i] v[i];
}
5}
```

La seconde qui utilise les intrinsics, et, dans notre cas, les registres SSE de 128
bits, nécessite de déplier la boucleforpar 4.
1void (int*u,int*v,int )

```text
int =0;
for(;i<size&3) i+=4)
// charger quatre entiers de chaque tableau
__m128i =_mm_loadu_si128((__m128i*)u[i]);
__m128i =_mm_loadu_si128((__m128i*)v[i]);
// additionner en parallèle x1[i:i+3] += x2[i:i+3]
x1=_mm_add_epi32(x1,x2);
// stocker le résultat
_mm_storeu_si128((__m128i*)u[i],x1);
}
// dernières itérations
while(i<size)
u[i] v[i];
++i;
}
20}
```

A chaque itération de la boucleforon charge dans le vecteurx1les éléments
u[i:i+3]et on fait de même avecx2qui stockev[i:i+3]. On réalise ensuite
l’addition dex1avecx2et on met le résultat dansx1. Puis, en fin de boucle, on
stocke le résultat contenu dex1dansu[i:i+3]en mémoire.
La version AVX demande d’utiliser des intrinsics qui débutent par_mm256et de
déplier la boucle par 8 :
1void (int*u,int*v,int )

```text
int =0;
for(;i<size&7) i+=8)
// charger huit entiers de chaque tableau
__m256i =_mm256_loadu_si256((__m256i*)u[i]);
__m256i =_mm256_loadu_si256((__m256i*)v[i]);
// additionner en parallèle x1[i:i+7] += x2[i:i+7]
x1=_mm256_add_epi32(x1,x2);
// stocker le résultat
_mm256_storeu_si256((__m256i*)u[i],x1);
}
// dernières itérations
while(i<size)
u[i] v[i];
++i;
}
20}
```

La Table
version non vectorisée (no_sse) et les versions vectorisées en SSE et AVX. Les lettres
aetuindiquent si les données sont alignées ou non alignées.
On note donc que la vectorisation permet de diminuer le temps de calcul, mais
également que le fait d’aligner ou non les données peut n’avoir aucune influence
(Ryzen 7, 1700X), ou diminuer le temps de calcul (Ryzen 5).
Méthode AMD AMD IntelIntel
Ryzen 7Ryzen 5Core i5Core i5
1700X 5600G1040012400F
add_no_sse 5.53 3.37 4.97 3.45
add_sse_u 1.71 1.51 2.23 1.25
add_sse_a 1.70 1.51 2.18 1.35
add_avx_u 1.62 1.16 2.00 1.34
add_avx_a 1.62 0.95 1.93 1.22
TABLE8.7– Temps d’exécution en secondes pour le calcul de la somme de vecteurs de
131_079 entiers répété 100_000 fois en 32 bits
8.6

### 8.6.1 L’AVX 512 a été proposé par Intel en 2013, puis a ensuite été implantée dans les

Xeon Phi et différents processeurs haut de gamme de type Skylake X comme le Core
i9 7980XE. Plusieurs catégories du jeu d’instruction existent, on en dénombre près
d’une vingtaine comme l’AVX512-F (Foundations), l’AVX512-BW (Byte and Word
Instructions) ou encore l’AVX512-VNNI (Vector Neural Network Instructions) dédié à
l’apprentissage artificiel par réseau de neurones.
Par exemple, sur un Intel Xeon Silver 4208 on trouve les jeux suivants : AVX512-
F, AVX512-DQ, AVX512-CD, AVX512-BW, AVXx512-VL et AVX512-VNNI.
On dispose avec l’AVX 512 de 32 registres de 512 bits nommészmm0àzmm31.
On note également l’apparition de 8 registres de masque nommésk0àk7(k0ayant
un rôle particulier) qui permettent de sélectionner les octets, mots, double ou
quadruple mots que l’on utilise dans une opération. Ces registres ont chacun une
taille de 64 bits si on dispose du jeu d’instructions AVX512-BW. L’ensemble des
instructions qui manipulent les registres de masque commence par la lettrek.
Certains testeurs ont remarqué que l’AVX512 peut causer des problèmes de
ralentissement dans certains cas. Ces ralentissements seraient dûs au fait que les
unités de traitement AVX512 fonctionnent à une fréquence inférieure à celle des
unités de traitement de l’AVX2 pour certaines instructions qui demandent un calcul
intensif ou pour des portions de code qui n’utilisent que des instructions AVX512.
L’abaissement de la fréquence consiste probablement à diminuer (ou tout au moins
à ne pas augmenter) la dissipation thermique.
Une autre explication, trouvée sur le site d’Intel, donne pour cause probable
le fait que les processeurs modernes disposent de trois unités de traitement AVX2
(ports p0, p1, p5) alors qu’il se limite à deux unités de traitement AVX512 car
le port p1 serait rendu non utilisable quand des instructions AVX512 sont dans
l’ordonnanceur.
Il est également recommandé d’utiliser l’instructionvzeroupperaprès utilisation
des instructions AVX512 car le processeur vérifie si les bits les plus significatifs des
registres vectoriels sontpropres(initialisés à zéro) ousales(contenant potentielle-
ment des données). Lorsque les registres sont propres, le processeur peut traiter les
registres de 128 bits comme de véritables registres de 128 bits. Néanmoins, si le
registre est sale, le processeur doit en fait traiter le registre comme un registre de
512 bits. On conseille également d’utiliservzeroupperavant de passer d’un code
AVX à un code SSE. La documentation Intel indique que cela permet d’éviter les
penalités (soit à peu près 70 cycles) liées à la performance engendrée par les fausses
dépendances (it will eliminate performance penalties caused by false dependencies),
ce qui n’est pas très explicite, on aimerait savoir à quoi correspondent ces fausses
dépendances.
De plus amples explications sont données sur divers blogs.
AMD a introduit la prise en charge des instructions AVX-512 avec son architec-
ture Zen 4, lancée en 2022 :
•
la série Ryzen 7000 (architecture Zen 4) gère les instructions AVX-512 avec
exécution en deux cycles (2×256).
•
la série Ryzen 9000 (architecture Zen 5) gère ces instructions en un seul cycle

### 8.6.2 On utilise l’instructionkmov, suffixée par une quantité (B,W,D,Q), pour manipu-

ler les registres de masque entre eux ou pour échanger une valeur de masque avec
un registre général.
Les autres opérations de manipulation des registres de masque sont :
•l’opération d’addition (kadd),
•les opérations logiques (kand,kandn,kor,kxor,kxnor),
•des opérations de test (ktest,kortest),
•de décalage (kshiftl,kshiftr),
•et enfin des opérations de décompactage (kunpck)

### 8.6.3 En ce qui concerne les données vectorielles, on utilise les mêmes opérations

qu’en AVX ou AVX2 avec la possibilité de combiner ces instructions avec un masque,
ce qui peut rendre certains traitements plus simples à coder. On pourra se référer
aux Chapitres
A titre d’exemple, voici dans le cadre de la parcimonie, comment utiliser les
instructions AVX512. On considère que le registrezmm0a été mis à0et quezmm3
contient le résultat d’unet binaireen parallèle entre les valeurs contenues dans
les registreszmm1etzmm2. De la même manière,zmm4contient le résultat d’unou
binaireen parallèle entrezmm1etzmm2. Pour obtenir le résultat final qui consiste
à compter le nombre d’octets à0danszmm3et à les additionner àeax, puis à
remplacer les octets dezmm3qui sont à0par ceux dezmm4, on utilise :
1 vpcmpeqb ,zmm0,zmm3 ; compare zmm3 a zmm0 = [0,...,0]

```text
; et affecte k1 en consequence
vmovdqu8 {k1},zmm4 ; selectionne les octets de zmm4 en
; utilisant k1 et remplace dans zmm3
vmovdqu8 [rdx+r9],zmm3 ; affecte le résultat final
kmovq ,k1 ; met le masque k1 dans r8
popcnt ,r8 ; compte le nombre de bits à 1
add ,r8d ; additionne à eax
```

On fait usage en premier lieu de l’instruction de comparaison octet par octet
vpcmpeqben indiquant le masquek1. Les registreszmm0etzmm3ne seront donc pas
modifiés et chaque bitidek1sera positionné à 1 si leième octet dezmm3est égal à
0. L’instruction suivante remplace chaque octetidezmm3par l’octetidezmm4si le
ième bit dek1est à 1. On stocke ensuite le résultat en mémoire. Enfin, on placek1
dans le registre 64 bitsr8afin de compter le nombre de bits à 1 dek1en utilisant
l’instructionpopcnt. Ce résultat est ensuite ajouté àeaxqui comptabilise le nombre
de mutations, c’est à dire dans le cas présent, le nombre d’octets à0après calcul du
et binaireentrezmm1etzmm2.
Voici un autre exemple de code qui utilise le mnémoniquevcompresspsavec un
masque de sélection. On désire réaliser le traitement suivant en C :
1int (float*x,float*y)

```text
int =0;
for(int =0;i<8; i)
if(x[i] 0.0)
y[count++] x[i];
}
}
return ;
9}
```

Etant donnés deux vecteurs de 8float, on désire sélectionner les éléments dex
qui sont supérieurs à0et les recopier dansyavec une contrainte qui impose qu’ils
doivent être positionnés les uns à la suite des autres. On désire également retourner
le nombre d’éléments recopiés. La traduction en assembleur avec des instructions
AVX512 utilise l’instruction de comparaisoncmppsqui stocke dans le masquek1les
éléments qui correspondent au critère de comparaison, en l’occurrence les éléments
qui vont être supérieurs à 0.
1 vxorps ,ymm0 ; ymm0 = [0.0, ..., 0.0]
2 vmovdqu ,rdi]
3 vcmpps ,ymm0,ymm1,5; compare ymm1[i] à ymm0[i]
4 knotq ,k1 ; choix des éléments à garder
5 vcompressps {k1},ymm1 ; recopie des éléments de ymm1

```text
; vers ymm0
vmovdqu [rsi],ymm0 ; stockage dans y
kmovq ,k1 ; compte le nombre d'éléments
popcnt ,rax ; sélectionnés
vzeroupper
ret
```

Comme indiqué dans la documentation Intel
, on doit inverser le masque de
k1puis recopier les bits qui seront sélectionnés parvpcompressps. Pour compter le
nombre d’éléments recopiés, il suffit de comptabiliser grâce à l’instructionpopcnt
le nombre de bits dansk1après l’avoir inversé (ligne 4). Pour cela, on transfèrek1
dansrax(ligne 8) et on appliquepopcntsurrax.
Sur un Intel Xeon Silver 4208, un test de performance donne les résultats
suivants (le code C est compilé avecgcc8.3.0) :
•fonction C compilée avecgcc -O3 -march=native(avec AVX512) : 4,31 s
•fonction assembleur AVX512 écrite à la main : 1,77 s

## 8.7 Au mois de Juillet 2023, Intel a introduit l’AVX10 (Advanced Instruction Exten-

sions 10) qui apparaît comme un sur-ensemble de l’AVX-512 que pourrait également
supporter des processeurs avec des registres de 256 bits. En fait, avec l’introduction
d’une architecture hybride avec des P-Core et E-Core avec l’arrivée d’Alder Lake la
12ème génération de processeurs Core d’Intel en 2021, l’utilisation de l’AVX devient
problématique car les P-Cores sont capables de gérer de l’AVX-512 alors que les
E-Cores ne gèrent que l’AVX2. On a donc deux codes incompatibles actuellement.
Afin de simplifier l’écriture du code et pouvoir le transposer sur les E-Cores il
semble intéressant de pouvoir reprendre les principes de l’AVX-512 et le transposer
à l’AVX2, notamment l’utilisation de masques qui rend le code plus compréhensible.
La première version nommée AVX10.1 doit permettre la transition vers le 256
bits et ne supportera donc que le 512 bits sur les processeurs Xeon Granite Rapids.
La version AVX10.2 devrait parachever le support pour tous les processeurs qui
supporteront l’AVX2.
. The greater-than relations that the processor does not implement require more than one
instruction to emulate in software and therefore should not be implemented as pseudo-ops. (For
these, the programmer should reverse the operands of the corresponding less than relations and
use move instructions to ensure that the mask is moved to the correct destination register and that
the source operand is left intact.)

## 8.8 Vectoriser son code est une opération peu coûteuse et qui permet d’obtenir

une amélioration importante en terme de diminution du temps de calcul. On
pourra consulter les chapitres qui concernent les différentes études de cas que
nous présentons pour constater que la vectorisation est un outil incontournable de
l’efficacité.

### 8.8.1 ▷

les unités vectorielles sont qualifées de SIMD (Single Instruction Multiple Data)
et permettent de paralléliser les calculs en effectuant la même opération sur
des données différentes
▷
les unités SSE permettent de traiter 128 bits alors que les unités AVX sont
capables de traiter 256 bits de différents formats allant de l’octet au nombre
à virgule flottante double précision
▷
la technologie AVX apporte généralement, dans la plupart des traitements,
un gain négligeable mais peut, dans certains cas, se révéler deux fois plus
efficace que le SSE
▷
lesintrinsicssont un moyen détourné pour permettre au programmeur d’utili-
ser les instructions assembleurs liées à la vectorisation tout en programmant
en C. Elles assurent la portabilité du code tout en autorisant l’amélioration de
l’efficacité des traitements de manière importante.
▷les registres de l’AVX 512 sont au nombre de 32 et se nommentzmm0àzmm1.
▷
avec l’AVX 512 on utilise des bits de masque (k0àk7) qui définissent les
emplacements dans un registre de 512 bits qui devront être sélectionnés pour
une opération ultérieure

### 8.8.2 Au cours du temps et au fil des différents projets de programmation que vous

pourrez rencontrer il faudra tenter de vectoriser les traitements les plus lents. Pour
cela il faut connaître les instructions vectorielles.

## 8.9 Exercice 35 -Implantez, en utilisant les registres SSE, la fonctioniotadéfinie par :

1void (float*t,int )

```text
for(int =0;i<n; i)
t[i] float)i;
}
5}
```

On commencera par écrire une version dépliée par 4 de la fonction dans le cas
général (c’est à dire quandnn’est pas multiple de 4), puis on traduira la partie
vectorielle en utilisantaddpset pour les itérations restantes on utiliseraaddss.
On peut faire en sorte que qu’initialement le registrexmm1 = [4, 3, 2, 1]et
que le registrexmm0 = [3, 2, 1, 0].
A chaque itération on stockexmm0à l’adresse det[i]puis on augmenteide 4
et on ajoutexmm1àxmm0.
Exercice 36 -Donnez une version intrinsics de la fonctioniota.
Exercice 37 -Donnez une version vectorielle de la fonction suivante qui convertit
une chaîne de caractères en majuscules :
1void (char*s,size_t )

```text
for(size_t =0;i<size; i)
if(isalpha(s[i]))s[i] toupper(s[i]);
}
5}
```

Exercice 38 -Donnez une version vectorielle de la fonction suivante qui convertit
une chaîne de caractères en minuscules et retourne le nombre de changements
effectués :
1size_t (char*s,size_t )
2 size_t =0;

```text
for(size_t =0;i<size; i)
if(isalpha(s[i]))
if(islower(s[i]))
s[i] tolower(s[i]);
++changes;
}
}
}
return ;
12}
```
