# Chapitre 12 : EtudedecasPOPCNT

EtudedecasPOPCNT
## 12.1 Compter le nombre de bits à 1 dans un registre est une opération que l’on

rencontre dans de nombreux traitements. Par exemple imaginons que l’on dispose
d’un tableau de booléens qui indique si un élément d’un tableau d’enregistrements
doit être traité ou non. La question se posera probablement de savoir combien
d’enregistrements doivent être traités afin d’allouer l’espace juste nécessaire avant
de manipuler les données. Si on utilise un tableau de booléens, on aura la définition
de données suivante :
1#include
2typedef ;
3typedef ;
4// nombre d'enregistrements
5const =100000;
7// Enregistrement
8typedef {
9....
10}Record;
12// tableau d'enregistrements
13Record [MAX_RECORDS];
15// tableau qui indique les enregistrements à traiter
16bool [MAX_RECORDS];
La variabletab_recordsest un tableau d’enregistrements ettab_processun
tableau de booléens. Si la variabletab_process[i]est àtruecela signifie que
l’enregistrement correspondant devra être pris en compte dans un traitement
ultérieur.
On pourra donc définir plusieurs méthodes liées au traitement du tableau
tab_process:
•void set(u32 n)
qui met à jour le tableautab_processafin d’indiquer que
l’enregistrementndoit être traité
•void unset(u32 n)
qui met à jour le tableautab_processafin d’indiquer que
l’enregistrementnne doit pas être traité
•bool use(u32 n)qui retournetruesi on doit traiter l’enregistrementn
•u32 count()
qui retourne le nombre d’enregistrements qui doivent être traités
Le code de ces sous-programmes est très simple et ressemble à ce qui suit :
1void (u32 )
2 tab_process[n] true;
3}
5void (u32 )
6 tab_process[n] false;
7}
9bool (u32 )
10 return [n];
11}
13u32 ()
14 u32 =0;
15 for(u32 =0;i<MAX_RECORDS; i)
16 total+= u32)tab_process[i];
17 return ;
18}
La variabletab_processétant un tableau de booléens elle occupe en mé-
moire100_000 octets car un booléen possède une taille d’un octet. On utilise
donc100_000/1024≃98 ko. Cependant sur ces100_000 octets, seuls100_000 bits
sont vraiment utiles car la constantetrueest en fait égale à 1 etfalsevaut 0. En
d’autres termes, 7 bits sur 8, soit87,5% sont inutiles car non utilisés, seul le bit de
poids faible code pourtrueoufalse.
Il est donc plus intéressant de ne pas perdre de mémoire et de coder chaque
valeur booléenne non pas par un octet mais par un bit. On parle alors decom-
pactage des données. Dans ce cas le tabeautab_processque nous renommons
alorstab_process_bitsaura une taille de(100_000 + 7)/8≃12500≃12,2 ko.
L’expression100_000 + 7permet d’arrondir la taille à l’octet supérieur.
1u32 =MAX_RECORDS+7) 8;
2u8 [MAX_RECORDS_IN_BYTES ];
Les méthodes que nous avons définies précédemment doivent être réécrites afin
de prendre en compte les spécificités du nouveau tableautab_process_bits:
1void (u32 )
2 tab_process_bits[n/8] 1<< n%8);
3}
5void (u32 )
6 tab_process_bits[n/8]( 1<< n%8));
7}
9bool (u32 )
10 return(tab_process_bits[n/8] 1<< n%8))) 0;
11}
13u32 ()
14 u32 =0;
15 for(u32 =0;i<MAX_RECORDS_IN_BYTES ; i)
16 total+=pop_count_8(tab_process_bits[i]
17 }
18 return ;
19}
Par exemple pour la méthodeset, l’élémentnse trouve à l’indicen / 8du
tableautab_process_bitset occupe le bit à la positionn % 8. La traduction de ce
sous-programme en assembleur x86 32 bits est la suivante :
1set:
2 push
3 mov ,esp
4 mov ,ebp+8]
5 mov ,ecx ; edx = n
6 shr ,3 ; edx = n / 8
7 and ,7 ; ecx = n % 8
8 mov ,1 ; eax = 1
9 shl ,cl ; eax = 1 << (n % 8)
10 or [tab_process_bits +edx],al
11 mov ,ebp
12 pop
13 ret
La fonctioncountdoit être réécrite en utilisant la fonctionpop_count_8qui
compte le nombre de bits à 1 dans un octet. Une version simple de cette fonction
qui nous servira de fonction de référence, est par exemple :
1u32 (u8 )
2 u32 =0;
4 while(n)
5 if((n&1) 0) count_bits;
6 n=n>>1;
7 }
8 return ;
9}
On réalise une boucle et tant que la variablenn’est pas égale à0, on regarde
si le bit de poids faible est égal à1et dans ce cas on incrémente le compteur
count_bits, puis on décale de1bit vers la droite la valeur denet on recommence.
Vous pouvez essayer, à titre d’exercice, d’écrire cette fonction en assembleur 32
bits.
Temps de référence
Le test de référence consiste à réaliser30_000fois le calcul de la somme du
nombre de bits d’un tableau de262_207 octets. Initialement chaque octet du
tableau se voit assigner une valeur aléatoire.
Les tests sont réalisés sur un AMD Ryzen 5 3600. Pour l’implantation par le
compilateurgccde la fonction de référence, l’exécution dure environ54,96
secondes.
L’efficacité de la fonction est biaisée par leifqui n’est pas prédictible. On peut
cependant éliminer leifen écrivant la fonction comme suit :
1u32 (u8 )
2 u32 =0;
4 while(n)
5 count_bits+= n&1);
6 n=n>>1;
7 }
8 return ;
9}
Version de référence, élimination du if
La version de référence améliorée en supprimant leifs’exécute en48,78
secondes ce qui constitue une faible mais notable amélioration.
## 12.2 Malheureusement la fonction de référence n’est pas très efficace et on peut

l’améliorer en utilisant trois techniques pour compter le nombre de bits à 1 dans
un octet :
•en utilisant une table de conversion,
•en comptant les bits par paires, quartets, octets,
•en utilisant l’instruction assembleurpopcnt.
12.2. AMÉLIORATIONS SIMPLES 327
### 12.2.1 On peut utiliser une table de 256 octets, chaque octet contenant le nombre de

bits de la valeur correspondant à l’indice du tableau. Ainsi, la valeur pour l’indice
du tableau égal à 189 est 6 car18910= 1011_11012, soit 6 bits à 1 :
1u8 [256] 0,1,1,2,1,2,2,3, 8};
3u32 (u8 )
4 return [n]
5}
Cette version est relativement courte mais pour qu’elle soit efficace il faut que
la tablebits_tabletienne en mémoire cache L1.
Amélioration table de conversion
En utilisant une table de conversion (résultats non présentés par la suite), on
ne met plus que2,76secondes, on va donc environ20fois plus vite.
### 12.2.2 On désire redéfinir une fonctionpop_count_8qui compte le nombre de bits à 1

dans un octet. La première étape consiste à compter le nombre de bits à 1 dans une
paire de bits. On a alors quatre cas possibles :
•11:2bits
•10:1bit
•01:1bit
•00:0bit
Cela est relativement simple à réaliser. Considérons une valeurasur8bits. Il
nous suffit de calculer les expressions suivantes :
1b0=a&0x55);
2b1=a>>1) 0x55;
3c=b0+b1;
En fait la valeur5516représente un masque de sélection qui ne prend en compte
que le bit de poids faible de chaque paire :5516= 010101012 . On sélectionne les
bits de poids faible dansb0et les bits de poids fort que l’on a décalé vers la droite
dansb1. On additionne ensuite les deux valeursb0etb1.
Voyons ce que cela donne sur un exemple (voir Figure) pour la valeur
a= 8716= 1000_01112:
•b0 = 0000_01012
•b1 = 0100_00012
•c= 0100_01102
On obtient bien le résultat escompté.
FIGURE12.1 – Masques appliqués à la valeura= 8716
On notera cependant que l’expression n’est pas factorisable :
(a and5516) + ((a >>1)and5516)̸= ((a+ (a >>1))and5516
On réitère ensuite le processus pour s’intéresser aux quartets, octets puis aux
mots. Le masque évolue comme présenté Table
# bitsDécalage Masque BinaireMasque Hexa
paire 1 0101_0101_0101_01012 555516
quartet 2 0011_0011_0011_00112 333316
octet 4 0000_1111_0000_11112 0F0F16
mot 8 0000_0000_1111_11112 00FF16
TABLE12.1 – Masques en fonction du nombre de bits
Le code de la fonctionpop_count_8est alors :
1const =0x55555555;
2const =0x33333333;
3const =0x0f0f0f0f;
5u32 (u8 )
6 u8 ;
12.2. AMÉLIORATIONS SIMPLES 329
7 x=x&m1) x>>1) m1);
8 x=x&m2) x>>2) m2);
9 x=x&m4) x>>4) m4);
11 return ;
12}
Si nous reprenons notre exemple avec la valeur8716, on obtient successivement :
•pour la première étapex en base 2
•pour la deuxième étapex
•
pour la troisième étapex , soit la valeur 4 en décimal ce qui
signifie que initialement8716= 13510possède 4 bits à 1
Amélioration en comptant les bits par paires, quartets, etc
En utilisant des décalages et additions, le temps d’exécution est de2,83
secondes, on va donc environ19fois plus vite.
Aussi étrange que cela puisse paraître, le calcul du premier terme :
1// version 1
2x=x&m1) x>>1) m1);
peut être remplacé par le code suivant :
1// version 2
2x=x- x>>1) m1);
En fait, cela est tout à fait naturel puisque d’après le tableau suivant on a :
paire de bits 00011011
décalage à droite00000101
résultat soustraction00010110
En conséquence, le code de la deuxième expression se traduit par 5 instructions
assembleur alors que le premier en utilise 6 puisque l’on ne réalise leet binaire
avecm1qu’une seule fois (et non deux fois dans la première version).
1; x = x - ((x >> 1) & m1 );
2 mov ,x]
3 mov ,eax
4 shr
5 and ,1431655765; 0x55555555
6 sub ,edx
Le code de la version 2 sera donc normalement plus efficace.
#### 12.2.3 popcnt

L’instructionpopcntque nous avons déjà évoquée plusieurs fois au cours des
chapitres précédents a pour but de compter le nombre de bits à 1 dans un re-
gistre. Son introduction date de2008avec les processeurs IntelNehalemet le jeu
d’instruction SSE4.2.
Elle prend la forme :
popcnt r(16/32/64), r/m(16,32,64)
En d’autres termes, elle accepte en opérande destination un registre et en
opérande source un registre ou une adresse mémoire. Dans notre code il suffit de
remplacer la fonctionpop_count_8par cette instruction.
Amélioration utilisation de l’instruction assembleur popcnt
En utilisant l’instruction popcnt combiné au dépliage de boucle, le temps
d’exécution est de3,09secondes, on va donc environ18fois plus vite. Cela
est moins efficace que la méthode précédente.
## 12.3 Plutôt que de traiter le tableautab_process_bitsoctet par octet, on peut le

traiter en considérant qu’il s’agit d’un tableau d’entiers non signés de 32 bits. Cela
revient à faire une sorte de dépliage par 4.
Il suffit alors de modifier les fonctions en conséquence, par exemple, pour les
fonctions liées à la table de conversion, on obtient :
1u32 (u8*x,u32 )
2 u32 =0,i;
3 // convertir x en un tableau d'entiers 32 bits
4 u32*y=u32*)x;
6 // compter par groupe de 4 octets (dépliage par 4)
7 for(i=0;i<size&3);i+=4)
8 count+=popcnt_table_u32(*y++);
9 }
11 // compter les derniers octets restants
12 while(i<size)
13 count+=popcnt_table[x[i]
14 ++i;
15 }
17 return ;
18}
12.3. TRAITEMENTS PAR 32 BITS 331
Cependant, la fonctionpopcnt_table_32peut être écrite au moins de deux
manières différentes dont l’une est plus efficace que l’autre.
Voici la version qui est la moins efficace car elle utilise une boucle :
1u32 (u32 )
2 u32 =0;
4 do{
5 total+= u32)popcnt_table[x&0xFF];
6 }while((x>>=8)!=0);
8 return ;
9}
Et la version la plus efficace, car dépliée :
1u32 (u32 )
2 u32 =popcnt_table[x&0xFF];
3 x>>=8;
4 total+=popcnt_table[x&0xFF];
5 x>>=8;
6 total+=popcnt_table[x&0xFF];
7 x>>=8;
8 total+=popcnt_table[x&0xFF];
10 return ;
11}
Il en résulte des temps d’exécution bien plus intéressants comme indiqué ci-
après :
Amélioration traitement par 32 bits
•fonction de référence :36,07s
•fonction de référence optimisée sans if :23,34s
•fonction avec table de conversion :4,69s
•fonction avec table de conversion dépliée :2,25s
•fonction avec utilisation depopcnt:0.62s
•fonction avec utilisation depopcnt, dépliée par 2 :0.53s
•fonction avec utilisation depopcnt, dépliée par 4 :0.47s
On note que la version qui utilise l’instruction assembleurpopcntest plus
efficace qu’en 8 bits : on passe de3,09s avec un traitement par 8 bits à0,62s en
traitant 32 bits.
12.4
La vectorisation avec SSE permet de traiter les données par groupe de 16 octets.
Malheureusement, il n’existe pas d’instruction vectorielle qui s’applique sur un
registre SSE et qui réalise le décompte des bits. La seule solution qui s’offre à nous,
a priori, est de charger les données par groupe de 16 octets puis d’extraire chaque
double mot, et enfin d’en compter le nombre de bits avecpopcnt. Voici un aperçu
de la boucle principale de ce traitement :
1.for_u16:
2 movdqa ,esi+ecx]
3 pshufd ,xmm0,0x01 ; extrait le 2nd mot dans xmm1
4 pshufd ,xmm0,0x02 ; extrait le 3ieme mot dans xmm2
5 pshufd ,xmm0,0x03 ; extrait le 4ieme mot dans xmm3
7 movd ,xmm0 ; compte les bits
8 popcnt ,edi ; de la partie basse de xmm0
9 add ,edi
11 movd ,xmm1 ; compte les bits
12 popcnt ,ebx ; de la partie basse de xmm1
13 add ,ebx
15 movd ,xmm2 ; compte les bits
16 popcnt ,edi ; de la partie basse de xmm2
17 add ,edi
19 movd ,xmm3 ; compte les bits
20 popcnt ,ebx ; de la partie basse de xmm3
21 add ,ebx
23 add ,16
24 cmp ,edx
25 jne
Une seconde version consiste à utiliser le même principe que lorsque nous avons
compté les bits dans un registre général (voir Section). Voici le code AVX
mais qui s’applique sur les registres SSE. On commence par charger les masques
dans les registresxmm4àxmm7
1 mov ,0x55555555
2 movd ,eax
3 vpshufd ,xmm4,0
5 mov ,0x33333333
6 movd ,eax
7 vpshufd ,xmm5,0
9 mov ,0x0f0f0f0f
10 movd ,eax
11 vpshufd ,xmm6,0
13 mov ,0x00ff00ff
14 movd ,eax
15 vpshufd ,xmm7,0
Puis dans la boucle principale, on réalise les décalages de bits et on additionne
le résultat àxmm3qui fait office de somme. Le registrexmm3contiendra au final deux
valeurs 64 bits mais on ne prendra en compte que les 32 bits de chaquequad word
pour faire la somme du nombre de bits à 1 (lignes 34 à 37) :
1for_ur16:
2 movdqa ,esi+ecx]
4 ; x = x - (x >> 1) & 0x5555... 5 (version 2)
5 vpsrlw ,xmm0,1
6 vpand ,xmm4
7 vpsubw ,xmm1
9 ; x = (x & m2) + ((x >> 2) & m2);
10 vpand ,xmm0,xmm5
11 vpsrlw ,xmm0,2
12 vpand ,xmm5
13 vpaddw ,xmm1,xmm2
15 ; x = (x & m4) + ((x >> 4)) & m4);
16 vpand ,xmm0,xmm6
17 vpsrlw ,xmm0,4
18 vpand ,xmm6
19 vpaddw ,xmm1,xmm2
21 ; x = (x & m5) + ((x >> 8)) & m5);
22 vpand ,xmm0,xmm7
23 vpsrlw ,xmm0,8
24 vpand ,xmm7
25 vpaddw ,xmm1,xmm2
27 vpxor ,xmm2
28 ; sum of absolute differences
29 ; [v[0]-w[0],...v[15]-w[15]], puis
30 ; [v[0]+..+v[7], 0, .. , 0, v[8]+..+v[15], 0, ..., 0]
31 vpsadbw ,xmm0,xmm2
33 vmovd ,xmm1
34 ; interleave high-order quadword
35 vpunpckhqdq ,xmm1,xmm1
36 vmovd ,xmm2
38 add ,ebx
40 add ,16
41 dec
42 jnz
44 vmovd ,xmm3
45 vpunpckhqdq ,xmm3,xmm3
46 vmovd ,xmm1
47 add ,ebx
L’instructionvpsrlw(Shift Packed Data Right Logical) réalise un décalage à
droite dans chacun des mots dexmm1par la quantité donnée en troisième opérande.
Les instructionsvpsubw(Subtract Packed Integers) etvpaddw(Add Packed Integers)
réalisent respectivement la soustraction et l’addition des 8 mots de chaque registre
SSE qui leur sont passé en paramètres.
Enfin l’instruction en ligne 26,vpsadbw(Compute Sum of Absolute Differences),
calcule la somme des valeurs absolues des différences entre opérande destination
et opérande source pour chaque mot du registre SSE. Le mot en partie basse reçoit
cette somme, les autres mots sont mis à 0.
On notera, ligne 15, que l’on calcule :
1x=x+x>>4)) m4;
alors que nous avons indiqué Section
1x=x&m4) x>>4) m4);
Cependant, dans le cas de la vectorisation on travaille sur des mots (16 bits) et
les bits les plus à droite qui sont décalés sont éliminés de chaque mot, ils ne sont
pas répercutés sur le mot suivant, ce qui permet de réaliser la simplification.
## 12.5 Pour cette étude de cas nous avons vu les principales technniques pour compter

le nombre de bits à 1 d’un tableau d’octets. On peut compter octet par octet ou
alors tenter de prendre en considération des quantités plus grandes et compter
par groupe de 4 octets (double word). On peut également en architecture 64 bits
compter par groupe de 8 octets (quad word).
Dans les sources de l’étude de cas, j’ai réalisé 18 implantations différentes afin
de trouver les variantes éventuelles qui seraient les plus performantes possibles.
## 12.6 Plusieurs solutions ont été implantées parmi lesquelles :

12.6. RÉSULTATS 335
•u8_reference: fonction de référence qui travaille par octet
•u8_reference_opt
:fonction de référence qui travaille par octet optimisée en
supprimant leif
•u32_reference: fonction de référence qui travaille par double mot
•u32_reference_opt
:fonction de référence qui travaille par double mot opti-
misée en supprimant leif
•u8_shift_v1: fonction avec décalage pour le calcul par octet
•u8_shift_v2: amélioration de la fonction précédente
•u32_shift_v1: fonction avec décalage pour le calcul par double mot
•u32_shift_v2: amélioration de la fonction précédente
•u8_asm
: fonction assembleur qui fait appel à l’instructionpopcntet qui
travaille par octet
•u32_asm
: fonction assembleur qui fait appel à l’instructionpopcntet qui
travaille par double mot
•u32_asm_ur4: dépliage par 4 de la fonction précédente
•u32_sse_v1
: version SSE avec utilisation depopcntsur chaque double mot
contenu dans le registre
•u32_sse_v2: version SSE avec décalages
•u32_avx2_v1
: version AVX avec décalages mais qui travaille sur les registres
SSE
•u32_intrinsics
: version intrinsics qui est la traduction de la méthode
u32_sse_v2
Le test de performance consiste à réaliser30_000appels aux fonctions sur des
vecteurs de262_207octets.
12.6.1
Les résultats pour les architectures anciennes sont présentés Table.
On notera que la fonction de référence prend énormément de temps par rapport
à sa version SSE (méthode 12) ou la version avec utilisation de l’instructionpopcnt
(méthodes 9, 10 et 11). Le fait de traiter les données par double mot (32 bits) et
d’optimiser leifapporte un gain non négligeable (méthodes 2, 3 et 4).
Sur les processeurs ne disposant pas de l’instructionpopcnt, l’amélioration est
faible (facteur33pour le Pentium D et75pour le Q9300) comparativement aux
autres processeurs pour lesquels le facteur d’amélioration est supérieur à95.
La version par décalage (shift, méthode 8) en 32 bits donne des temps d’exécu-
tion très intéressants en fonction de l’augmentation de l’année de production des
processeurs.
Mais c’est au final la version intrinsics qui est la plus optimisée et qui donne les
meilleurs résultats sauf pour l’Intel i7 860, l’Intel i7 4790 ou l’AMD 1090 T.
n° Méthode IntelIntelIntelAMD IntelIntel
Pentium DCore 2 i7 X6 i5 i7
925Q9300 8601090T3570K 4790
2006 2008 200920102012 2014
1 u8_reference 150.22 170.20 110.19 80.21 72.58 54.99
2 u8_reference_opt 111.73 161.63 102.39 64.68 65.12 47.38
3 u32_reference 126.41 105.45 60.91 43.46 53.34 39.42
4u32_reference_opt 73.51 88.36 60.81 43.31 48.68 33.40
5 u8_shift_v1 16.50 7.77 4.52 4.31 3.23 1.98
6 u8_shift_v2 16.45 7.66 4.76 4.62 3.20 2.02
7 u32_shift_v1 8.01 4.25 2.05 2.50 1.29 0.56
8 u32_shift_v2 7.76 3.13 1.82 1.86 1.06 0.49
9 u8_asm - - 6.88 10.94 4.65 2.96
10 u32_asm - - 1.27 1.65 1.16 0.71
11 u32_asm_ur4 - - 0.89 0.880.49
12 u32_sse_v1 - - 0.96 1.52 0.92 0.74
13 u32_sse_v2 - - - - 1.06 0.81
14 u32_avx2_v1 - - - - - 0.71
15 u8_intrinsics 4.55 0.92 1.35 0.76 0.61
ratio 1 / (11 ou15) 33.01 75.30 123.80 95.48 95.50 112.22
TABLE12.2– Architectures anciennes : temps d’exécution en secondes sur 30_000 exécu-
tions de la fonction popcnt sur des tableaux de 262_207 octets
12.6.2
Pour les architectures modernes (Table), on observe les mêmes tendances.
Cependant, les méthodes8et11donnent les meilleurs résultats et sont un peu plus
performantes que la version intrinsics. Traiter les données sous format32bits est
donc bénéfique dans ce cas.
La méthode8avec décalage de bits est souvent la plus performante, talonnée
par la méthode11qui réalise un dépliage par4de la boucle.
On peut alors se demander si le passage au64bits améliorera encore les
performances? La réponse est oui à en croire les tests effectués en traitant les
données par groupe de32ou de64bits sous une architecture64bits avec un AMD
Ryzen 5 3600 :
•architecture 32 bits, traitement par 32 bits :0,43s
•
architecture 32 bits, traitement par 32 bits et dépliage par 4 de la boucle :
0,31s
12.6. RÉSULTATS 337
N° Marque Intel AMD IntelIntel AMD Intel
Gamme Core i3Ryzen 7Core i5Core i7Ryzen 5Xeon
Modèle 61001700X 7400 8700 36004208
2015 2017 2017 2017 20192019
1 u8_reference57.99 59.13 64.81 47.28 54.96 71.73
2 u8_reference_opt53.14 54.11 58.58 43.03 48.78 74.70
3 u32_reference36.39 44.72 39.89 29.53 35.36 54.49
4u32_reference_opt32.65 28.77 35.83 26.47 23.67 46.18
5 u8_shift_v1 2.17 2.51 2.32 1.75 2.83 2.49
6 u8_shift_v2 2.11 2.51 2.23 1.70 2.84 2.50
7 u32_shift_v1 0.61 1.00 0.64 0.49 0.44 0.72
8 u32_shift_v2 0.50 0.80 0.54
9 u8_asm 6.39 3.24 6.83 5.20 3.06 7.53
10 u32_asm 1.07 0.68 1.14 0.86 0.62 0.91
11 u32_asm_ur4 0.54 0.51 0.59 0.45 0.47 0.74
12 u32_sse_v1 0.90 0.90 0.96 0.72 0.83 1.05
13 u32_sse_v2 0.87 0.74 0.92 0.70 0.64 1.05
14 u32_avx2_v1 0.87 0.83 0.95 0.70 0.69 1.02
15 u8_intrinsics 0.64 0.64 0.68 0.52 0.56 0.76
ratio 1 / 11 107.38 115.94 109.84 N/A 116.93 96.93
TABLE12.3– Architectures récentes : temps d’exécution en secondes sur 30_000 exécutions
de la fonction popcnt sur des tableaux de 262_207 octets
•architecture 64 bits,traitement par 64 bits :0,21s
•
architecture 64 bits,traitement par 64 bits et dépliage par 4 de la boucle :0,15
s
On divise donc le temps d’exécution par deux en passant au64bits et en traitant
les données par des registres64bits.
### 12.6.3 Pour les architectures récentes (Table), on observe encore les mêmes

tendances que précédemment. La méthode8est la plus efficace.
N° Marque Intel AMD Intel AMD
Gamme Core i5Ryzen 5Core i5Ryzen 5
Modèle10850H 5600g12400F 9600X
2020 2021 2022 2024
1 u8_reference 43.82 46.19 51.75 21.68
2 u8_reference_opt 40.06 42.72 49.10 20.69
3 u32_reference 27.42 25.91 35.64 18.39
4u32_reference_opt 24.50 21.25 28.58 17.80
5 u8_shift_v1 1.65 2.28 0.73 0.20
6 u8_shift_v2 1.61 2.29 0.73 0.19
7 u32_shift_v1 0.48 0.37 0.31 0.15
8 u32_shift_v2 0.39
9 u8_asm 2.45 3.60 1.79 1.46
10 u32_asm 0.80 0.45 0.50 0.36
11 u32_asm_ur4 0.41 0.44 0.44 0.36
12 u32_sse_v1 0.67 0.79 0.65 0.36
13 u32_sse_v2 0.66 0.53 0.63 0.47
14 u32_avx2_v1 0.65 0.73 0.69 0.36
15 u8_intrinsics 0.49 0.47 0.44 0.32
ratio 1 / 11 106.87 104.97 117.61
TABLE12.4– Architectures actuelles : temps d’exécution en secondes sur 30_000 exécutions
de la fonction popcnt sur des tableaux de 262_207 octets
## 12.7 Ce problème révèle deux choses importantes. La première est quele traitement

des données par groupe de 32 bits(voire de 64 bits) au lieu de 8 bitspermet de
gagner en efficacité, cela semble normal puisqu’on traite les données en une seule
fois plutôt qu’en 4 fois (ou 8 fois). Le seconde leçon que l’on peut tirer montre
quela vectorisation va se révéler complexecar on ne dispose pas d’instruction
vectorielle qui réaliserait ce que fait l’instructionpopcntsur les registres généraux.
L’introduction d’une telle instruction permetrait probablement de gagner encore en
efficacité.
