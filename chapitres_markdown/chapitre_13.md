# Chapitre 13 : EtudedecasVariantedeSAXPY

EtudedecasVariantedeSAXPY
## 13.1 Ce chapitre traite de l’implantation de la fonctionsaxpyet permet de mettre en

pratique ce qui a été vu au Chapitre
au Chapitre
Pour rappel, la fonction saxpy (Single-PrecisionA×X PlusY) consiste, étant
donné deux vecteurs denréels appelésXetY, à calculer :
Y=a×X+Y
yi=a×xi+yi,∀i∈[1..n]
oùaest une constante réelle. Afin de complexifier la traduction pour le compila-
teur, nous avons décidé de modifier quelque peu la fonction en lui faisant retourner
la somme desyi:
sum=
n
X
i=1
yi
Nous allons nous intéresser à des vecteurs de taille quelconque et programmer
en architecture 32 bits. Les types C que nous allons utiliser sont :
•pour les entiers non signéstypedef uint32_t u32;
•pour les nombres flottants en simple précisiontypedef float f32;
## 13.2 La fonction à implanter est donnée Listing. Elle comporte quatre para-

mètres qui sont les vecteursxety, la constanteaainsi que la taille des vecteurs
(size).
1f32 (f32*x,f32*y,f32 ,u32 )
2 f32 =0.0;
3 for(u32 =0;i<size;i)
4 y[i] a*x[i]y[i];
5 sum+=y[i];
6 }
7 return ;
8}
Listing 13.2.1 – SAXPY modifiée - fonction de référence
## 13.3 La première implantation en assembleur que nous allons réaliser (voir Lis-

ting) est la traduction de la fonction de référence en utilisant le coprocesseur
arithmétique. Etant donné qu’il s’agit d’une fonction qui retourne unfloaten
architecture 32 bits, c’est le premier registre du coprocesseur qui contient le résultat
de la fonction, c’est à direst0. Nous avons choisi de réaliser l’association variables
/ registres de la Table.
Cste/Param/VarTypeParamètreRegistreDescription
x f32 [] [ebp+8] esi adresse du vecteurx
y f32 [] [ebp+12] edi adresse du vecteury
a f32 [ebp+16] pile constantea
size u32 [ebp+20] edx taille des vecteurs
i u32 ecx variable de boucle
sum f32 st0 somme
TABLE13.1– Association entre variables et registres pour la fonction de référence de la
variante de SAXPY
Les registresesietedidevront être sauvegardés car ils ne doivent pas être
modifiés pour le sous-programme appelant d’après les conventions d’appel du C en
32 bits.
La traduction est assez simple, elle est présentée Listing. En ligne 4, on
initialisesumà0grâce à l’instructionfldz. Comme indiqué précédemment,sum
sera enst0, puis décalé enst1lors du calcula×xi+yi . En ligne 5, on vérifie que
la taille des vecteurs n’est pas nulle, auquel cas il faut sortir du sous-programme.
On sauvegarde ensuite les registresesietedi(lignes 7 et 8), puis on charge les
paramètres du sous-programme dans les registres appropriés (lignes 9 à 11).
On débute la boucleforen ligne 13, puis lignes 17 à 22, on exécute le calcul du
corps de la bouclefor. On peut voir Table
du coprocesseur lors du calcul.
1saxpy_fpu:
2 push
3 mov ,esp
4 fldz ; sum = 0
5 cmp [ebp+20],0 ; si size == 0 alors retourne 0
6 jz
7 push ; sauve les registres
8 push ;
9 mov ,ebp+8]
10 mov ,ebp+12]
11 mov ,ebp+20]
13 xor ,ecx ; i = 0
14.for:
15 cmp ,edx ; fin de boucle si i >= size
16 jge
17 fld [esi+ecx*4]
18 fmul [ebp+16]
19 fadd [edi+ecx*4]
20 fst [edi+ecx*4]
21 faddp ,st0 ; sum += y[i]
22 inc ; ++i
23 jmp
24.endfor:
25 pop ; restaure les registres
26 pop ;
27.end:
28 mov ,ebp
29 pop
30 ret
Listing 13.3.1 – SAXPY modifiée - implantation FPU
On commence par placerxiau sommet de la pile du coprocesseur (ligne 17). La
variablesuminitialement dansst0est alors déplacé enst1. On multiplie ensuitexi
par la constantea(ligne 18), puis on ajouteyi(ligne 19). Finalement on stocke le
résultat dabsy[i]et on ajoute ce résultat àst1qui contientsumet on dépilest0.
Afin de donner un ordre d’idée du temps d’exécution pour les différentes implan-
tations que nous allons réaliser, nous reportons par la suite, les résultats obtenus
sur un ordinateur doté d’un Core i5 7400. Le test effectué consiste à calculer50_000
fois la fonction de référence appliquée sur des vecteurs initialisés aléatoirement de
524_287éléments.
Temps de référence
Pour l’implantation que nous venons de donner, l’exécution dure environ
22,95secondes.
ligne instruction st0
16jge sum ?
17fld [esi+ecx*4] xi sum
18fmul [ebp+16] a×xi sum
19fadd [edi+ecx*4] a×xi+yi sum
20fst [edi+ecx*4] a×xi+yi sum
21faddp ,st0 sum+ (a×xi+yi)?
TABLE13.2 – Calculs du coprocesseur
## 13.4 Une fois que l’on dispose de la version FPU, on peut la modifier afin d’introduire

une amélioration liée à la boucle de calcul. On a vu précédemment (cf. Section
5.4.11.1) qu’il peut être intéressant de déplier les boucles. On va donc réaliser
un dépliage par4du corps de la boucle. Le code devra ressembler à celui du
Listing. Nous avons fait usage d’une macro instruction du langage C afin
rendre le code plus lisible.
1#define SAXPY_BODY(i) \
2 y[i] = a * x[i] + y[i]; \
3 sum += y[i];
5f32 (f32*x,f32*y,f32 ,u32 )
6 f32 =0.0;
7 u32 ;
8 // dépliage par 4
9 for(i=0;i<size;i+=4)
10 SAXPY_BODY(i);
11 SAXPY_BODY(i+1);
12 SAXPY_BODY(i+2);
13 SAXPY_BODY(i+3);
14 }
15 // dernières itérations
16 while(i<size)
17 SAXPY_BODY(i);
18 ++i;
19 }
20 return ;
21}
Listing 13.4.1 – SAXPY modifiée - fonction de référence dépliée par 4
Nous avons, par souci de clareté et pour ne pas produire de listing assembleur
trop volumineux, supprimé les parties qui sont identiques à la version précédente.
Tout comme en C, afin de simplifier l’écriture de la fonction dépliée, on utilise
1%macro fpu_body 1
2 fld [esi+ecx*4+1]
3 fmul [ebp+16]
4 fadd [edi+ecx*4+1]
5 fst [edi+ecx*4+1]
6 faddp ,st0 ; sum += y[i]
7%endmacro
Listing 13.4.2 – Macro instruction nasm
une macro instructionnasmafin de ne pas réécrire entièrement les 5 lignes de code
qui constituent le corps de la bouclefor(cf. Listing).
Cette macro instruction comprend un paramètre figuré par le chiffre1en fin de
ligne 1 du listing. Il va correspondre à un décalage de l’adresse qui correspond à
x[i + k], oùkvarie entre0et3, ce qui, en assembleur, nous contraint à utiliser4
* kcar on manipule desfloatqui occupent 4 octets en mémoire.
On réutilise cette macro instruction au niveau du listing. On fait appel à
une fonctionnalité denasmlignes 8 à 12 qui consiste à écrire une boucle qui génère
au final les quatre lignes suivantes :
1fpu_body
2fpu_body
3fpu_body
4fpu_body
En ligne 8 du Listing, ci-après, on définit une variable kque l’on initialise
à 0. En ligne 9, on répète 4 fois l’ensemble des lignes 10 et 11. On génère la macro
instructionfpu_bodyaveckcomme paramètre, puis on augmentekde4pour
passer au réel simple précision suivant.
Amélioration dépliage par 4
En dépliant la fonction de référence par 4, on n’obtient aucune amélioration
puisque l’exécution dure22,97secondes.
## 13.5 Après avoir déplié le corps de la boucleforpar 4, il est relativement aisé d’écrire

la version utilisant les instructions SSE pour obtenir un code vectorisé. On doit
réaliser les calculs en parallèle dans les registres SSE dans la partie dépliée par 4
de la boucle.
On a choisi les conventions suivantes :
•xmm0contient les sommes partielles
1saxpy_fpu_u4:
2 ...
3 xor ,ecx
4 and ,3 ; edx multiple de 4
5.for_u4:
6 cmp ,edx
7 jge
8 %assign k 0
9 %rep 4
10 fpu_body ; fpu_body 4
11 %assign k k+4
12 %endrep
13 add ,4
14 jmp
15.endfor_u4:
16 ; dernières itérations
17 ; ecx = (size / 4) * 4
18 ; recharger edx avec size
19 mov ,ebp+20]
20.for:
21 cmp ,edx
22 jge
23 fpu_body
24 inc
25 jmp
26.endfor:
27 ...
28 ret
Listing 13.4.3 – SAXPY modifiée - implantation partielle avec FPU et dépliage par 4
•xmm1contientxi,xi+1,xi+2,xi+3
•xmm2contientyi,yi+1,yi+2,yi+3
•xmm3contient quatre fois la valeur de la constantea.
Le calcul est alors simple à réaliser, il suffit de multiplierxmm1parxmm3puis
d’additionner ce résultat àxmm2. Une fois ce calcul terminé on peut ajouterxmm2à
xmm0.
En sortie de la boucle dépliée, le registrexmm0contient :
•xmm0.ps[0]= (a×x0+y0) + (a×x4+y4) +. . .
•xmm0.ps[1]= (a×x1+y1) + (a×x5+y5) +. . .
•xmm0.ps[2]= (a×x2+y2) + (a×x6+y6) +. . .
•xmm0.ps[3]= (a×x3+y3) + (a×x7+y7) +. . .
Le code de la version SSE est donné Listing. On commence par mettre
xmm0à 0 (ligne 3), puis on charge quatre fois la constanteadansxmm3(lignes 4
et 5). Ligne 6, on initialisei(ecx) à 0, puis on calcule dansedxle plus proche
multiple de 4 inférieur ou égal à sizesize. On aura bien évidemment chargésize
1saxpy_sse:
2 ...
3 xorps ,xmm0
4 movss ,ebp+16]
5 shufps ,xmm3,0 ;
6 xor ,ecx ; i = 0
7 and ,3 ; dépliage par 4
8.for_u4:
9 cmp ,edx
10 jge
11 movaps ,esi+ecx*4]
12 movaps ,edi+ecx*4]
13 mulps ,xmm3
14 addps ,xmm1
15 addps ,xmm2
16 movaps[edi+ecx*4],xmm2; stocke résultat
17 add ,4
18 jmp
19.endfor_u4:
20 haddps ,xmm0 ; somme des valeurs
21 haddps ,xmm0 ; du registre xmm0
22 sub ,4 ; et addition au
23 movss[esp],xmm0 ; registre st0
24 fadd [esp]
25 add ,4
26 ; dernières itérations
27 ...
28 ret
Listing 13.5.1 – SAXPY version SSE
au préalable dans le registreedx. Le corps de la boucle (lignes 9 à 18) ne comporte
aucune difficulté.
En sortie de boucle, celle-ci effectuant les calculs en parallèle dans les registres
SSE, on doit terminer les dernières itérations de la boucle dans le coprocesseur. On
pourrait bien évidemment continuer les calculs avec les registres SSE grâce aux
instructions de typeaddss,mulssmais en 32 bits on utilise par convention la FPU.
Il faut alors calculer la somme des quatre valeurs flottantes contenues dans le
registrexmm0puis la stocker dansst0. L’instructionhaddpspermet de faire cela (cf.
Section) et nous avons vu qu’il fallait l’exécuter deux fois (lignes 20 et 21).
Sachant que les données sont chargées dans le coprocesseur à partir d’un em-
placement mémoire, on décide de réserver dans la pile un emplacement temporaire
de 32 bits (ligne 22) et on y place la somme des valeurs du registresxmm0(ligne
23). Cette somme est alors ajoutée àst0, car comme pour la version non dépliée,
on commence par réaliserfldzen début de sous-programme.
Amélioration SSE
En vectorisant le code on abaisse le temps d’exécution à7,93secondes, on
est donc2,89fois plus rapide par rapport à la fonction de référence.
## 13.6 La version AVX impose de déplier la boucle par 8, puisqu’un registre AVX

peut contenir 8float. En conséquence, il faut déplier la boucle principale par 8.
L’utilisation de l’AVX apporte une légère amélioration par rapport au SSE, voire
dans certains cas, une forte amélioration, c’est le cas du AMD Ryzen 5 3600 pour
lequel on divise par1,8le temps d’exécution. On consultera la section des résultats
ci-après pour vérifier cette affirmation.
La seule difficulté résiduelle concerne le calcul de la somme des 8floatde
ymm0. Comme indiqué, il n’est pas possible de procéder comme avec le SSE.
On peut voir comment on a procédé dans la version FMA (Listing) qui est
très proche de la version AVX.
Amélioration AVX
En vectorisant le code avec l’AVX on abaisse le temps d’exécution à5,26
secondes, on est donc4,36fois plus rapide par rapport à la fonction de
référence. Le gain en dépliant la boucle par 2 ou 4 est infime, on obtient
respectivement des temps d’exécution de5,13et5,09secondes. L’utilisation
desintrinsicspermet d’obtenir un temps d’exécution de4,93secondes.
## 13.7 Le sigle FMA signifieFused Multiply–Addet permet étant donné trois flottantsa,

betcde calculerd=round(a+b×c) , c’est à dire qu’on n’utilise qu’un seul calcul
d’arrondi. Cette technique est supposée être plus rapide qu’une multiplication suivie
d’une addition mais peut parfois conduire à des erreurs de précision.
Les microprocesseurs AMD et Intel implantent les instructions du jeu d’instruc-
tions FMA3 depuis 2012 et 2013 respectivement.
Nous utilisons ici l’instructionvfmadd321ps ,xmm2,xmm3
1 qui multiplie
xmm2parxmm3et ajoute le résultat àxmm1.
Le code de la version FMA est donné Listing. On utilise les registres
AVX commeymm0pour contenir les sommes partielles. Lignes 23 à 27, on réalise le
calcul du corps de la boucle. On chargex[i:i+7]dansymm1, puisy[i:i+7]dans
1. qui est une variante de vfmadd231ps et donne le même résultat.
ymm2
. On réalise ensuite le produit suivi de la somme en utilisantvfmadd321ps. On
ajoute le résultat àymm0et on le stocke en mémoire.
1saxpy_fma:
2 ...
3 vxorps ,ymm0 ; ymm0 = [0.0 x 8 fois]
4 movss ,ebp+16]
5 shufps ,xmm3,0
6 vinsertf128 ,xmm3,1
8 xor ,ecx ; i = 0
9 and ,7 ; edx multiple de 8 de size
10.for_u8:
11 cmp ,edx ; sortie de boucle si ecx >= edx
12 jge
13 vmovaps ,esi+ecx*4]
14 vmovaps ,edi+ecx*4]
15 vfmadd321ps ,ymm1,ymm3
16 vaddps ,ymm2
17 vmovaps[edi+ecx*4],ymm2; y[i:i+7] = ymm2
18 add ,8 ; i += 8
19 jmp
20.endfor_u8:
21 vhaddps ,ymm0 ; somme des valeurs
22 vhaddps ,ymm0 ; de ymm0
23 vextractf128 ,ymm0,1
24 vaddps ,xmm1
25 sub ,4 ; stockage du résultat dans st0
26 vmovss[esp],xmm0
27 fadd [esp]
28 add ,4
30 mov ,ebp+16]
31.for:
32 cmp ,edx
33 jge
34 fld [esi+ecx*4]
35 fmul [edi+ecx*4]
36 faddp ,st0
37 inc
38 jmp
39.endfor:
40 ...
Listing 13.7.1 – SAXPY version FMA
Amélioration FMA
L’amélioration FMA donne le meilleur temps d’exécution à4,90secondes si
on utilise lesintrinsics.
## 13.8 Plusieurs solutions ont été implantées parmi lesquelles :

•C: fonction de référence
•asm fpu: fonction de référence codée en assembleur en utilisant la FPU
•asm fpu ur2: version précédente avec dépliage par 4 de la boucle
•asm sse: version assembleur utilisant la vectorisation avec registres SSE
•asm sse: fonction avec décalage pour le calcul par octet
•C sse intrin.: version C utilisant les intrinsics sur des registres SSE
•asm avx: version assembleur utilisant la vectorisation avec registres AVX
•asm avx2 ur2: version AVX avec dépliage de la boucle par 2
•asm avx2 ur4: version AVX avec dépliage de la boucle par 4
•C avx2 intrin.: version C utilisant les intrinsics sur des registres AVX
•C avx2 ez_ii
: version C utilisant les intrinsics sur des registres AVX avec
l’interface ez_ii
•asm fma: version assembleur avec instructions FMA
•C fma ez_ii: version C avecez intrinsics interface(voir ci-après)
•C avx512 intrin.: version intrisics avec instructions AVX512
•C avx512 fma intrin: version intrisics avec instructions AVX512 et FMA
### 13.8.1 L’interface ez_ii fait partie d’un projet plus vaste que j’ai initié il y a quelques

années qui a pour but desimplifierl’utilisation de la STL, la bibliothèque standard
du C
++. Quelques autres projets en découlent comme ez_cuda qui se base sur
des classes spécifiques afin de ne gérer qu’une seule instance d’un tableau dont
l’allocation mémoire est réalisée à la fois sur le CPU et le GPU. On simplifie
également la définition des paramètres des kernels.
Le termeezvient de l’anglais et se liteasyqui signifie facile en français.
L’ensemble de ces bibliothèques et interfaces est intégré dans un projet plus
vaste en cours de développement qui a pour but de mettre au point un langage
dont la syntaxe est proche du langage Pascal et qui a pour objectif de simplifier
l’écriture des programmes C
++. Le code duez languageest traduit en C
++et il doit
permettre à terme d’inclure de l’assembleur, de pouvoir intégrer des requêtes SQL
ou des programmes en logique.
L’interface ez_ii, où le termeiisignifieIntrinsics Interfacetente de simplifier
l’utilisation des Intrinsics tout en procurant des fonctions d’affichage des registres
SSE et AVX, utiles au débogage.
13.8. RÉSULTATS 349
13.8.2
Les résultats pour les architectures de processeurs pré 2015 figurent Table.
N° Marque IntelIntelIntel AMD IntelIntel
Gamme Pentium DCore 2Core i7Phenom IICore i5Core i7
Modèle 925Q9300 860 1090T3570k 4790
2006 2008 2009 2010 2012 2014
1 C 97.29 75.68 23.35 32.31 23.58 19.70
2 asm fpu 101.91 62.52 24.69 30.75 23.74 19.70
3 asm fpu ur4 91.77 58.92 25.36 30.47 23.64 19.68
4 asm sse 86.84 52.38 11.16 24.74 8.70 6.00
5 C sse intrin. 84.11 8.33 5.64
6 asm avx - - - - 8.21 5.42
7 asm avx2 ur2 - - - - 8.42 5.42
8 asm avx2 ur4 - - - - 8.11 5.48
9C avx2 intrin. - - - - - 5.43
10 C avx2 ez_ii - - - - - 5.41
11 asm fma - - - - - 5.43
12 C fma ez_ii - - - - - 5.44
ratio 1 / 5 1.15 1.45 2.30 1.33 2.83 3.49
TABLE13.3– Résultats comparatifs des méthodes SAXPY : architectures anciennes,50_000
répétitions sur des vecteurs de taille524_287
Le gain apporté par une traduction directe de la fonction de référence en
assembleur est faible par rapport à sa traduction par le compilateur. On note parfois
une dégradation qui peut être corrigée si on déplie la boucle par4(sauf pour
l’Intel i7 860). L’utilisation du SSE apporte un faible gain sur les architecture avant
2012. Sur l’Intel i5 3570k et l’Intel i7 4790, la technologie SSE permet de diviser
respectivement par un facteur2.83et3.49le temps d’exécution par rapport à la
méthode de référence. A noter également que l’Intel i7 860 possède un facteur
d’amélioration de2.3en utilisant le SSE. Sur ces mêmes processeurs (Intel i5 3570k
et i7 4790) passer à l’AVX ou au FMA (seulement pour l’i7 4790) n’apporte rien.
### 13.8.3 Pour les architectures modernes (voir Table), l’utilisation de l’AVX par

rapport au SSE apporte un gain substantiel. L’utilisation des instructions FMA
n’apporte pas d’amélioration majeure dans le cas du traitement SAXPY modifié.
On note que les processeurs AMD ont une FPU peu performante, plus de 30
N° Marque Intel AMD IntelIntel AMD Intel
Gamme Core i3Ryzen 7Core i5Core i7Ryzen 5Xeon
Modèle 61001700X 7400 8700 36004208
2015 2017 2017 2017 20192019
1 C22.35 33.89 22.95 17.30 31.36 25.98
2 asm fpu23.01 33.76 23.02 17.33 31.30 25.62
3 asm fpu ur422.96 33.84 22.97 17.28 31.33 25.93
4 asm sse 9.41 5.16 7.93 5.79 4.90 9.90
5 C sse intrin. 9.02 5.38 7.79 5.74 5.04 9.40
6 asm avx 7.56 3.53 5.26 3.75 2.62 9.83
7 asm avx2 ur2 7.49 3.49 5.13 3.72 2.58 10.08
8 asm avx2 ur4 7.46 3.43 5.09 3.72 2.569.82
9 C avx2 intrin. 7.17 3.29 4.93 3.67 2.61 9.88
10 C avx2 ez_ii 7.18 3.33 4.95 3.68 2.62 9.13
11 asm fma 7.27 3.37 5.03 3.68 2.67 9.75
12 C fma ez_ii 7.22 3.28 2.65 9.98
13 C avx512 intrin. - - - - - 11.59
14C avx512 fma intr. - - - - - 11.47
ratio 1 / 5 2.47 6.29 2.94 3.01 6.22 2.76
ratio 1 / 12 3.09 10.33 4.68 4.72 11.83 2.60
TABLE13.4– Résultats comparatifs des méthodes SAXPY : architectures modernes,50_000
répétitions sur des vecteurs de taille524_287
secondes pour les calculs des méthodes 1 à 3 alors que les autres processeurs
sont très en dessous de cette valeur. En revanche les unités AVX de ces mêmes
processeurs sont plutôt performantes.
Le passage à l’AVX512 sur le Xeon Silver 4208 semble détériorer les perfor-
mances. On note d’ailleurs pour ce processeur que le passage du SSE à l’AVX
n’apporte qu’un gain très faible.
### 13.8.4 Pour les architectures récentes (voir Table), la version FMA3 est la plus

efficace ainsi que les versions intrinsics utilisant l’AVX2 sur Intel 10850H. Pour
l’AMD 5600g, c’est également la version AVX2 intrinsics qui est la plus efficace.
On remarque encore que la FPU est fortement pénalisante (méthodes 1, 2 et 3)
sur AMD.
Concernant l’AMD Ryzen 5 9600X, on remarque que le temps de calcul est
N° Marque Intel AMD Intel AMD
Gamme Core i7Ryzen 5Core i5 Ryzen 5
Modèle10850H 5600g12400F 9600X
2020 2021 2022 2024
1 C 16.05 38.86 18.50 97.19|29.19
2 asm fpu 16.22 39.81 18.35 29.09
3 asm fpu ur4 16.14 39.95 18.62 29.09
4 asm sse 5.49 5.36 4.51 3.77
5 C sse intrin. 5.35 5.31 4.60 2.54
6 asm avx 3.79 3.75 4.41 1.60
7 asm avx2 ur2 3.75 3.47 4.42 1.58
8 asm avx2 ur4 3.72 3.44 4.49 1.55
9 C avx2 intrin. 3.62 3.26 4.79 1.54
10 C avx2 ez_ii 3.62 3.39 4.75 1.56
11 asm fma 3.66 3.30 4.40 1.58
12 C fma ez_ii 3.61 3.38 4.81 1.56
13 C avx512 intrin. - - - 1.49
14C avx512 fma intr. - - - 1.53
ratio 1 / 5 3.00 7.31 4.02 38
ratio 1 / 12 4.44 11.49 3.84 62
TABLE13.5– Résultats comparatifs des méthodes SAXPY : architectures récentes,50_000
répétitions sur des vecteurs de taille524_287
d’environ97secondes ce qui est complètement aberrant par rapport aux autres
processeurs. En fait le temps de calcul est de29secondes. Comme indiqué dans
le chapitre, cela provient de l’option de compilation -std=c++11. En effet avec
cette option on obtient97secondes de temps d’exécution alors qu’en la supprimant,
on ne met plus que29secondes!
Le code généré est effectivement bien différent suivant les deux versions (11
instructions dans la version lente contre 7 instructions dans la version rapide) alors
que cette option n’est pas une option d’optimisation. Ce phénomène apparaît avec
gcc/g++ mais pas avecclang. Il faut ajouter l’option-ffast-mathpour retrouver
des temps de calculs dans la norme.
## 13.9 Nous avons vu dans ce chapitre comment utiliser les instructions de la FPU pour

un calcul simple. On note que c’est le passage à la vectorisation qui apporte une
amélioration significative du temps de calcul. L’utilisation du FMA qui est censé
apporter une diminution du temps de calcul est généralement minime pour ce
traitement. On retiendra que la FPU des microprocesseurs AMD n’est pas du tout
performante. Heureusement les calculs effectués avec des registres vectoriels sont,
quant à eux, bien plus efficaces.
## 13.10 Exercice 47 -A titre d’exercice vous pouvez réaliser un dépliage de la version AVX

par 2 puis par 4 et intégrer les nouveaux sous-programmes au code existant afin de
tester leur efficacité.
Exercice 48 -Utiliservpbroadcastdafin de charger huit foisadansymm3pour la
version FMA.
