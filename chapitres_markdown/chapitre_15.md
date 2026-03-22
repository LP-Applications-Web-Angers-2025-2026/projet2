# Chapitre 15 : Etudedecas

## 15.1 Nous allons dans ce chapitre nous intéresser à un problème simple qui sert

d’exemple de démonstration et qui consiste à compter les voyelles dans une chaine
de caractères. Ce problème bien qu’évident à implanter demande de posséder les
connaissances que nous avons mises en avant dans les Chapitres. L’utilisation
des instructions vectorielles apporte également une amélioration substantielle sous
certaines architectures.
On considère pour ce problème des chaînes de caratères ne possédant que des
caractères en minuscule sans accents ni signes de ponctuation afin de simplifier
l’écriture du code. On ne prend en compte que les voyelles (a, e, i, o, u et y) et
on ne considère que des chaînes de longueur multiple de 64 pour pouvoir utiliser
l’AVX-512 et simplifier le code.
Nous allons coder en 64 bits afin de disposer de nombreux registres qui vont
grandement nous simplifier la tâche.

## 15.2 Nous pouvons concevoir trois fonctions de référence pour répondre au pro-

blème :
•
la première fonction est écrite en utilisant desif, ce qui est normalement très
pénalisant lorsqu’ils sont dans une boucle
•
la seconde fonction utilise unswitchqui est sensé pallier au problème de
performance duif
•
enfin la troisième fonction utilise un tableau afin d’éviter les branchements
conditionnels induits par leifou leswitch
La fonction réalisée avec unifest présentée Listing. Les fonctions auront
toutes la même signature à savoir un pointeur sur une chaine de caractères en C,
la longueur de la chaine et un pointeur sur un tableau de six entiers qui sont les
compteurs du nombre d’occurrences de chaque voyelle. Iciv[0]compte le nombre
de’a’,v[1]le nombre de’e’, etc. Cette fonction est pénalisante car on ne peut
pas prédire quelthensera exécuté et, de plus, si on trouve un’y’ou une consonne
on devra réaliser six comparaisons.
1void (u8*s,u32 ,u32 [6])

```text
for(u32 =0;i<size;i)
if(s[i] 'a')
++v[0];
}else (s[i] 'e')
++v[1];
}else (s[i] 'i')
++v[2];
}else (s[i] 'o')
++v[3];
}else (s[i] 'u')
++v[4];
}else (s[i] 'y')
++v[5];
}
}
17}
```

> *Listing 15.2.1 – Compter les voyelles avec un if*

La fonction implantée avec unswitchtente de remédier au problème duif,
elle est présentée Listing. Son codage en assembleur par un compilateur
C/C
++génère un tableau de 25 adresses qui correspondent aux lettres’a’à’y’.
Ces adresses sont utilisées pour se brancher sur une partie du sous-programme qui
incrémentev[i]pour la voyelle correspondante ou qui incrémente la variable de
boucle s’il s’agit d’une consonne.
La fonction implantée avec un tableau (cf. Listing) consiste à compter
tous les caractères. Etant donné qu’il y a 26 lettres dans l’alphabet on crée un
tableau temporaire (letters) de 26 entiers que l’on initialise à 0. L’écriture de
la boucle est donc simplifiée puisqu’on n’a plus qu’une seule instruction et que
le dépliage de la boucle sera facilement réalisé par le compilateur. Le tableau
temporaire composé de 26 entiers de 32 bits tient aisément dans la mémoire cache
et permettra d’accélérer le traitement. En fin de sous-programme, on recopiera
dansvle nombre d’occurrences de chaque voyelles.
1void (u8*s,u32 ,u32 [6])

```text
for(u32 =0;i<size;i)
switch(s[i])
case'a':v[0];break;
case'e':v[1];break;
case'i':v[2];break;
case'o':v[3];break;
case'u':v[4];break;
case'y':v[5];break;
}
}
12}
```

> *Listing 15.2.2 – Compter les voyelles avec un switch*

1void (u8*s,u32 ,u32 [6])
2 u32 [26];

```text
for(u32 =0;i<26;i)letters[i] 0;
for(u32 =0;i<size;i)
++letters[s[i]-'a'];
}
v[0]letters['a'-'a'];
v[1]letters['e'-'a'];
v[2]letters['i'-'a'];
v[3]letters['o'-'a'];
v[4]letters['u'-'a'];
v[5]letters['y'-'a'];
15}
```

> *Listing 15.2.3 – Compter les voyelles avec un tableau*

Temps de référence
Le test de référence consiste à exécuter50_000fois le dénombrement du
nombre de voyelles pour une chaîne de256_000 caractères, initialisée aléa-
toirement, avec environ20% de voyelles.
Sur un AMD Ryzen 5 3600, on obtient :
•pour la versionifle test dure57,09secondes
•pour la versionswitchle test s’effectue en54,71secondes
•
et pour la version avec tableau, le temps d’exécution est de4,64se-
condes
La méthode qui consiste à compter toutes les lettres est donc la plus efficace car
elle ne contient pas de conditionnelle et elle peut être dépliée simplement.

## 15.3 Traduction de la méthode du tableau en assem-

bleur
On peut traduire la méthode du tableau directement en assembleur mais nous
allons utiliser quelques améliorations liées à la vectorisation pour initialiser le
tableau de lettres.
On stockera le tableaulettersdans la pile à une adresse multiple de 32 afin
de l’initialiser par la suite avec un registre AVX. Les conventions choisies sont celles
de la Table.
VariableTypeRegistreDescription
s
size
v
i
u64 adresse du tableauletters
u64 calculs temporaires
u32 stockage temporaire derdi
u32 compteur pour ’e’
u256 stockage de [0,0,...,0]
TABLE15.1– Associations variables C et registres pour compter les voyelles pour l’implan-
tation avec tableau

### 15.3.1 On commence par sauvegarder le registrerbxdans lared zonecar il ne doit pas

être modifié et sera donc préservé dans la pile car il va stocker l’adresse du tableau
letters. Puis, on crée le tableau qui va occuper26×4 = 104 octets, toujours
dans lared zoneen faisant en sorte que son adresse de début soit multiple de 32
afin d’améliorer l’accès mémoire. L’adresse stockée dansrbxdoit être diminuée de
8 + 104octets puisqu’on sauvegarde le contenu derbxen premier dans la pile. On
meteaxà 0 car on aura besoin d’utiliser la valeur 0 pour initialiser le tableau.

```nasm
mov [rsp-8],rbx
lea ,rsp-8+4*26)
and ,(32-1)
; en bas de la red zone
xor ,eax
```

Par exemple sirsp= 0xfdcf8, alorsrsp- (8+4*26) = 0xfdc88 , puis si on
arrondi au multiple de 32 inférieur (ligne 3). On obtient alors dansrbxla valeur
0xfdc80.
Il faut ensuite initialiser le tableau et on peut le faire de trois manières diffé-
rentes, en utilisant :
•
un registre 64 bits commerax, affecté à 0, et en initialisant le tableau dans
l’ordre des adresses croissantes, soit 13 affectations
•rep stosq
•un registre AVX de 32 octets affecté à 0

#### 15.3.1.1 On utilise les macro-instructions denasmpour initialiser l’ensemble du tableau

soit26×4octets divisés par la taille d’un registre 64 bits, soit26×4/8 = 13:
1 xor ,rax
2 %assign i 0
3 %rep 13

```nasm
mov [rbx+i],rax
%assign i i + 8
%endrep
15.3.1.2
```

C’est le même principe que précédemment mais on utilisestosq, il faut donc
fixerraxà 0, sauvegarderrditemporairement (on utilise icir8) et mettre dansrcx
ouecxle nombre de répétitions :
1 xor ,rax ; rax = 0

```nasm
mov ,rdi ; sauvegarde rdi dans r8
mov ,rbx ; rdi = &letters[0]
mov ,13 ; faire 13 fois
rep ;
movd ,r8 ; restaure rdi depuis r8
15.3.1.3
```

On utiliseymm0qui permet de stocker 8 entiers 32 bits. On doit donc stocker
ce registre vectoriel trois fois, puis les deux derniers entiers sont mis à0grâce au
registrerax:
1 vpxor ,ymm0
2 vmovdqa[rbx],ymm0 ; letters[ 0: 7] = 0
3 vmovdqa[rbx+32],ymm0 ; letters[ 8:15] = 0
4 vmovdqa[rbx+64],ymm0 ; letters[16:23] = 0
5 vzeroupper

```nasm
mov [rbx+96],rax ; letters[24:25] = 0
15.3.2
```

On commence par vérifier sisizeest égale à 0, sinon on exécute la boucle. On
charge la lettres[i]danseaxen la transformant en une valeur 32 bits grâce à
movzx. On retranche alors la valeur de’a’pour obtenir l’indice de la lettre stockée
dans le tableauletters. Il peut-être nécessaire de transformer cet indice en 64 bits
en utilisant l’instructioncdqemais normalement ce n’est pas nécessaire puisque
nous avons miseaxà 0 précédemment.
1 test ,rsi ; si size == 0 alors
2 jz ; aller en .end_while
4 xor ,rcx ; i = 0
5.while:

```text
movzx ,byte[rdi+rcx]
inc ; ++i
sub ,'a' ; eax = s[i] - 'a'
cdqe ; convertir en 64 bits
inc [rbx+rax*4]
cmp ,rsi ; si i < size alors
jne ; aller en .while
13.end_while:
```

On incrémente finalementletters[i](ligne 10) puis on continue la boucle si
iest inférieur àsize.

### 15.3.3 La sortie de la fonction consiste à recopier le nombre d’occurrences de chaque

voyelle dans le tableauv.

```nasm
mov ,'a'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx],eax
mov ,'e'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+4],eax
mov ,'i'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+8],eax
mov ,'o'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+12],eax
mov ,'u'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+16],eax
mov ,'y'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+20],eax
mov ,rsp-8]
ret
```

On utilise ici le registrer9pour représenter l’indice de chaque voyelle dans le
tableau et on récupère le nombre d’occurrences dans le registreeax. Le registre
rdxcontient l’adresse du tableauv. A la fin de la fonction on restaure le registre
rbxqui avait été sauvegardé.
On notera qu’il est possible d’améliorer la fonction en remplaçantrbxparr10
qui n’a pas besoin d’être sauvegardé.

### 15.3.4 La boucle principale peut être dépliée par 4 ou 8. Deux possibilités s’offrent à

nous :
•soit on recopie le code de la boucle précédente quatre ou huit fois
•
soit on charges[i:i+3]danseaxpuis on traite chacun des octets du registre
indépendamment comme suit :
1.while_ur4:

```nasm
mov ,dword[rdi+rcx]
add ,4 ; i += 4
movzx ,al ; r8 = s[i]
shr ,8
movzx ,al ; r9 = s[i+1]
shr ,8
movzx ,al ; r10 = s[i+2]
shr ,8 ; eax = s[i+3]
sub ,'a' ; calcul des indices
sub ,'a'
sub ,'a'
sub ,'a'
inc [rbx+rax*4]
inc [rbx+r8*4]
inc [rbx+r9*4]
inc [rbx+r10*4]
cmp ,esi
jl
24.end_while_ur4:
```

Il faut bien évidemment déplier la boucle principale par quatre puis gérer les
dernières itérations.
Amélioration traduction en assembleur
Pour la version basée sur un tableau des occurrences de lettres traduite en
assembleur le test s’exécute en5,6secondes en moyenne (4,85 s pour le
temps minimum, voir encadré ci-après). Le meilleur temps de calcul sur AMD
Ryzen 5 3600 est donné par la version dépliée par 4.Attention
Sur les microprocesseurs Intel le temps de calcul sur10itérations est sensi-
blement le même. Par contre sur un AMD Ryzen 5 3600, on observe environ
7à9exécutions de l’ordre de4,8à5secondes et 1 à 3 exécutions entre7,
8, voire14secondes! Ce bug est également présent sur un Ryzen 7 1700X,
mais semble réglé sur Ryzen 5 5600G. Le problème vient de l’utilisation d’une
instructionincqu’il est préférable de remplacer par unadd.

## 15.4 Il est possible d’envisager une version utilisant les registres SSE car le corps du

Listing
L’association variables / registres est présentée Table. Nous utilisons 11
registres généraux (12 si on considère égalementraxpour des calculs temporaires)
et 12 registres SSE.
Les registresxmm8àxmm13contiendronts[i:i+15]et seront modifiés par les
calculs. Les registresxmm2àxmm7contiennent des vecteurs composés de voyelles et
ne seront pas modifiés. On comparera en parallèlexmm8avecxmm2, puisxmm9avec
xmm3, etc.
La première partie du code consiste à sauvegarder les registresrbx,r13,r14
qui vont être modifiés et qui par convention doivent être préservés pour le sous-
programme appelant. On sauvegarde ces registres dans lared zone.

```nasm
mov [rsp-16],rbx ; sauvegarde des registres
mov [rsp-24],r12
```

VariableTypeRegistreDescription
s
size
v
i
u64 résultatpopcnt
u32/u64 compteur pour ’a’
u32/u64 compteur pour ’e’
u32/u64 compteur pour ’i’
u32/u64 compteur pour ’o’
u32/u64 compteur pour ’u’
u32/u64 compteur pour ’y’
u128 às[i:i+15]
u128 [’a’,...,’a’]
u128 [’e’,...,’e’]
u128 [’i’,...,’i’]
u128 [’o’,...,’o’]
u128 [’u’,...,’u’]
u128 [’y’,...,’y’]
TABLE15.2– Associations variables C et registres pour compter les voyelles pour la version
SSE

```nasm
mov [rsp-32],r13
xor ,r8 ; nb_occ('a') = 0
xor ,r9 ; nb_occ('e') = 0
xor ,r10 ; nb_occ('i') = 0
xor ,r11 ; nb_occ('o') = 0
xor ,r12 ; nb_occ('u') = 0
xor ,r13 ; nb_occ('y') = 0
```

On remplit ensuite chacun des registresxmm2àxmm7avec respectivement des
’a’, des’e’, etc.

```nasm
mov ,0x61616161 ; # ASCII(a) = 0x61
movd ,eax
pshufd ,xmm2,0
mov ,0x65656565 ; # ASCII(e) = 0x65
movd ,eax
pshufd ,xmm3,0
...
mov ,0x79797979 ; # ASCII(y) = 0x79
movd ,eax
pshufd ,xmm7,0
```

On passe ensuite à la bouclefor. On lit les 16 octets à partir de&s[i]et on les
place dansxmm8. On recopie ensuitexmm8dansxmm9àxmm13(lignes 5 à 10), puis
on passe aux comparaisons.
1.for:
2 cmp ,esi ; fin de boucle si i >= size
3 jge

```text
movdqu ,rdi+rcx]
movdqu ,xmm8 ; xmm9 = xmm8
movdqu ,xmm8 ; ...
movdqu ,xmm8
movdqu ,xmm8
movdqu ,xmm8 ; xmm13 = xmm8
; 'a' ; trouver 'a'
pcmpeqb ,xmm2 ; comparer s[i:i+15] à ['a',...,'a']
pmovmskb ,xmm8 ; xmm8.b[i] = 0xFF si s[i] == 'a'
popcnt ,ebx ; compter le nombre de 'a'
add ,rbx ; ajouter au compteur de 'a'
; 'e'
pcmpeqb ,xmm3
pmovmskb ,xmm9
popcnt ,ebx
add ,rbx
...
add ,16 ; 16 prochains caractères
jmp
28.end_for:
```

On comparexmm8qui contients[i:i+15]àxmm2qui contient 16 fois le carac-
tère’a’. Sixmm8b[i]==xmm2b[i] alorsxmm8b[i]prendra la valeur0xFF, sinon il
prendra la valeur0x00. On utilise ensuite l’instructionpmovmskbpour remplir le
registreebxavec soit 0, soit 1 en fonction dexmm8b[i]. Il suffit ensuite de compter
le nombre de bits à 1 dansebxqui correspond au nombre de’a’danss[i:i+15].
On réitère l’opération pour les autres voyelles.
Enfin on met à jour le tableauvavec les valeurs des registresr8àr13puis on
restaure les registres sauvegardés dans la red zone et on quitte le sous-programme.

```nasm
mov [rdx],r8d ; v[0] = r8d
mov [rdx+4],r9d ; v[1] = r9d
mov [rdx+8],r10d ; ...
mov [rdx+12],r11d
mov [rdx+16],r12d
mov [rdx+20],r13d ; r[5] = r13d
mov ,rsp-32]
mov ,rsp-24]
mov ,rsp-16]
ret
```

Amélioration SSEPour la version SSE le test s’exécute en1,59secondes.

## 15.5 On suit le même principe que pour le SSE mais on va traiter la chaîne par

paquets de 32 caractères.
Pour remplir les registres AVXymm2àymm7avec les voyelles, on peut utiliser
dans ce cas l’instructionvpbroadcastd, comme suit :

```nasm
; remplir le vecteur ymm2 avec [a,a,a,a,...]
mov ,0x61616161 ; 4 fois le code ASCII de 'a'
movd ,eax ; charger dans xmm2.d[0]
vpbroadcastd ,xmm2 ; recopier dans ymm2.d[1] à ymm2.d[7]
```

Le code de la boucleforest pratiquement identique :
1.for:
2 cmp ,esi ; fin de boucle si i >= size
3 jge
5 vmovdqu ,rdi+rcx]
6 vmovdqa ,ymm8
7 vmovdqa ,ymm8
8 vmovdqa ,ymm8
9 vmovdqa ,ymm8
10 vmovdqa ,ymm8

```text
; 'a'
vpcmpeqb ,ymm2 ; comparaison
vpmovmskb ,ymm8 ; extraction
popcnt ,ebx ; compter les bits = compter les 'a'
add ,eax ; ajouter au compteur de 'a'
...
add ,32 ; i += 32
jmp
21.end_for:
```

Amélioration AVX2
Que l’on utilise l’AVX, l’AVX2 ou que l’on ajoute un dépliage par deux, le
temps d’exécution est de0,79secondes.

## 15.6 Il est nécessaire d’aider le compilateur afin d’optimiser le code en lui fournissant

des informations quant à l’utilisation des pointeurs (restrict) et l’alignement des
données. En fonction du compilateur, nous devons utiliser des fonctions ou des
mots-clés différents :
1#include
2#include
3#include
5#ifdef __INTEL_COMPILER
6void (u8*restrict ,u32 ,u32 [6])
7#else
8void (u8*__restrict__ ,u32 ,u32 [6])
9#endif
11 u32 =0;
12#ifdef __INTEL_COMPILER
13 __assume_aligned(s,CPU_MEMORY_ALIGNMENT );
14 __assume(i%CPU_MEMORY_ALIGNMENT==0);
15#endif
16#if __GNUC__ > 3
17 s=u8*)__builtin_assume_aligned (s,CPU_MEMORY_ALIGNMENT );
18#endif
On déclare ensuite les registres AVX nécessaires au calculs :
•les registresy2ày7contiennent les voyelles
•les registresy8ày13sont la copie des[i:i+15]
1 __m256i ,y3,y4,y5,y6,y7;
3 y2=_mm256_set1_epi32(0x61616161);
4 y3=_mm256_set1_epi32(0x65656565);
5 y4=_mm256_set1_epi32(0x69696969);
6 y5=_mm256_set1_epi32(0x6F6F6F6F);
7 y6=_mm256_set1_epi32(0x75757575);
8 y7=_mm256_set1_epi32(0x79797979);

```text
for( i<size&~31));i+=32)
__m256i ,y9,y10,y11,y12,y13;
y8=_mm256_loadu_si256(__m256i*)s[i]);
y9=y8;
y10=y8;
y11=y8;
y12=y8;
y13=y8;
y8=_mm256_cmpeq_epi8(y8,y2);
v[0] _mm_popcnt_u32(_mm256_movemask_epi8(y8)
y9=_mm256_cmpeq_epi8(y9,y3);
v[1] _mm_popcnt_u32(_mm256_movemask_epi8(y9)
y10=_mm256_cmpeq_epi8(y10,y4);
v[2] _mm_popcnt_u32(_mm256_movemask_epi8(y10)
y11=_mm256_cmpeq_epi8(y11,y5);
v[3] _mm_popcnt_u32(_mm256_movemask_epi8(y11)
y12=_mm256_cmpeq_epi8(y12,y6);
v[4] _mm_popcnt_u32(_mm256_movemask_epi8(y12)
y13=_mm256_cmpeq_epi8(y13,y7);
v[5] _mm_popcnt_u32(_mm256_movemask_epi8(y13)
}
```

Enfin, il reste à traiter les éventuels derniers 31 octets qui peuvent résulter du
dépliage par 32 caractères de la boucle :
1 u32 [26];
2 memset(letters,0,26*sizeof(u32));

```text
// last iterations
for( i<size; i)
++letters[s[i] 'a'];
}
v[0] letters['a'-'a'];
v[1] letters['e'-'a'];
v[2] letters['i'-'a'];
v[3] letters['o'-'a'];
v[4] letters['u'-'a'];
v[5] letters['y'-'a'];
```

Cette fonction intrinsics est celle qui est en moyenne la plus performante à
l’exécution.

## 15.7 Avec l’AVX512 on est en mesure de traiter 64 octets en une seule fois en stockant

les données dans les registreszmm. Le code est assez conséquent. On commence par
déplier la boucle par 64 et on traite les données grâce aux masques après avoir
réalisé la comparaison entre registres grâce àvpcmpeqb:

```nasm
; fill xmm2 vector with 'a,a,a,a,...'
mov ,0x61616161
movd ,eax
vpbroadcastd ,xmm1 ; AVX512
...
; unroll by 64
mov ,esi
shr ,6
test ,r14d
jz
14.for_u64:
vmovdqa32 ,rdi+rcx]
add ,64
vpcmpeqb ,zmm1,zmm8
vpcmpeqb ,zmm2,zmm8
vpcmpeqb ,zmm3,zmm8
vpcmpeqb ,zmm4,zmm8
vpcmpeqb ,zmm5,zmm8
vpcmpeqb ,zmm6,zmm8
; 'a'
kmovq ,k1
popcnt ,rbx
add ,ebx
...
dec
jnz
...
```

Reste ensuite à traiter les 63 derniers octets potentiels. S’il y a plus de 32 octets
à traiter, on traitera les 32 premiers octets en utilisant les registres AVX, puis s’il
reste plus de 16 octets à traiter on utiliser les registres SSE. Enfin, pour les 15
derniers caractères on utilise la méthode du tableau (voir Section).

## 15.8 Nous donnons Table

avons évoquées pour un Intel i7 4900MQ ainsi que l’amélioration par rapport à la
méthode de référence qui correspond à l’implantation avec leif.
Méthode Temps (s)Amélioration
if 13,22 1
switch 17,22 × ≃0.8
tableau 2,79 × ≃4.7
vectorisation SSE 1,59 × ≃8.3
vectorisation AVX2 0,79 × ≃16.7
TABLE15.3 – Résultats comparatifs des méthodes pour compter les voyelles

### 15.8.1 Pour certaines de ces architectures, l’AVX n’est pas disponible on se contente

donc du SSE pour la vectorisation. Nous avons rapporter les temps d’exécution des
méthodes suivantes :
1. if
2. switch
3.
4.
5.
implantation assembleur de la méthode avec tableau avec dépliage de la
boucle par 4, version 1, on charge chaque octet danseax
6.
implantation assembleur de la méthode avec tableau avec dépliage de la
boucle par 4, version 2, on charge quatre octets danseaxen une seule fois
puis on les répartit dansr8,r9,r10
7.
8.
9. eax
10.
11.
12.
vectorisation en assembleur avec jeu d’instructions AVX2 (version 1) avec
dépliage par 2 de la boucle principale
13.
vectorisation en assembleur avec jeu d’instructions AVX2 (version 3) avec
élimintaion des dépendances
14.
n° Méthode IntelIntelIntelAMD IntelIntel
Pentium DCore 2 i7 X6 i5 i7
925Q9300 8601090T3570K4790
2006 20082009201020122014
1 C if 79.19 62.44 43.63 39.43 38.04 27.49
2 C switch 126.15 102.51 57.28 47.88 54.41 39.72
3 C tableau 12.5714.80 29.91 21.91 8.37 6.36
4 tableau asm 32.95 16.02 26.16 18.35 8.37 6.59
5 tableau asm ur4 v1 37.17 17.54 29.89 21.92 8.53 6.69
6 tableau asm ur4 v2 19.26 19.78 13.16 8.51 11.55 8.93
7 tableau asm ur8 v1 32.48 16.61 27.50 18.38 7.37 5.64
8 tableau asm ur8 v2 19.25 21.60 13.04 8.37 11.48 8.89
9 tableau asm ur8 v3 32.49 16.64 27.40 18.44 7.34 5.65
10 SSE2 17.58 8.95 3.61
11 AVX - - - - - 1.82
12 AVX2 v1 - - - - - 1.82
13 AVX2 v3 - - - - - 1.82
14 AVX2 v2 ur8 - - - - - 1.82
15 AVX2 intrinsics - - - - - 1.14
ratio (1 / 10) 4.50 6.97 12.15 9.23 8.95 7.61
ratio (1 / 15) - - - - - 24.11
TABLE15.4– Architectures anciennes : temps d’exécution en secondes pour100_000
itérations sur des chaînes de256_000caractères.
Concernant les architectures anciennes (voir Table), on note que l’utili-
sation duswitch(méthode 2) est pénalisante car elle dégrade les performances
par rapport à la méthode de référence. L’utilisation d’un tableau pour compter les
lettres (méthode 3) permet de fortement diminuer le temps d’exécution.
La traduction en assembleur de la méthode utilisant un tableau suscite quelques
commentaires. On en donne deux versions : la première estampilléev1traite chaque
octet danseaxet la secondev2commence par charger quatre octets consécutifs
danseaxpuis les répartit dansr8,r9,r10par décalage deeax, puis on effectue la
conversion et l’incrémentation du nombre d’occurrences de la lettre correspondante
en utilisant ces registres.
Pour les architectures anciennes c’est la méthodev2qui est la plus performante
(Pentium D, Q9300, i7 860, X6 1090T), puis à partir des Intel i5 3570k et i7 4790,
c’est la méthodev1qui prend le dessus. On note également que le dépliage par 4 ou
par 8 de la boucle n’a que peu d’influence de manière générale sur la performance.
Cependant, c’est l’utilisation du SSE (méthode 10) qui apporte une amélioration
conséquente ainsi que l’utilisation de l’AVX pour l’Intel i7 4790 (méthodes 11 à 15).
Le compilateur C est d’ailleurs en mesure de produire un code bien plus optimisé
que celui écrit en assembleur (méthode 9).

### 15.8.2 Pour les architecture modernes (Table), la tendance observée pour les

achitectures anciennes se confirme. L’utilisation de l’AVX et notamment sous sa
forme intrinsics (méthode 15) produit généralement les meilleurs résultats.
On note que l’Intel i3 6100, l’i5 7400 et le Xeon Silver 4208 sont bien moins
performants que leurs concurrents pour la méthode 1. Autre fait notable, les
processeurs AMD sont bien moins performants que les processeurs Intel quand on
passe à l’utilisation duswitch(méthode 2). Sur l’AMD Ryzen 7 1700X, on passe
de 31 s à 56 s soit une augmentation de 80 % proche des 84 % d’augmentation
du AMD Ryzen 5 3600. Elle est inférieure à 30 % pour les processeurs Intel. On
peut donc supposer que la prédiction de branchement est moins bonne sur les
processeurs AMD que sur les processeurs Intel.
Pour les méthodes 5 à 9, on observe le fait que la version 1 est plus performante
que la version 2 et que le dépliage n’apporte qu’une très légère amélioration. On
observe cependant pour l’AMD Ryzen 7 1700X un comportement assez étrange.
La vectorisation avec SSE ou AVX est plus performante que sur les architectures
anciennes. Pour l’AVX on obtient un facteur moyen d’amélioration d’environ 31 sur
toutes les architectures. Par contre, l’utilisation du SSE est plus intéressante sur les
processeurs AMD de type Ryzen que sur les processeurs Intel.
Le cas du Xeon Silver est particulier car il fait partie d’un cluster pour lequel on
ne dispose que degcc8.4. On peut donc légitimement se demander si le codage
assembleur réalisé par le compilateurgccest aussi efficace que dans la version 10.
L’utilisation de l’AVX2 permet d’obtenir une amélioration d’un facteur de près de
33 par rapport à la méthode de référence.
Amélioration AVX512
L’utilisation de l’AVX512 (cf. Table) sous forme intrinsics (voir le code
du projet) permet alors d’atteindre un temps d’exécution de 0,76 secondes,
soit un facteur d’amélioration d’environ 60.
Différentes implantations AVX512 ont été réalisées et la plus efficace est la
version écrite en assembleur avec un dépliage de la boucle par 8. Elle permet
d’atteindre 0,62 secondes, soit un facteur d’amélioration de 73.
N°Marque Intel AMD IntelIntel AMD Intel
Gamme Core i3Ryzen 7Core i5Core i7Ryzen 5Xeon
Modèle 61001700X 7400 8700 36004208
2015 2017 2017 2017 20192019
1 C if 35.89 31.33 38.19 29.33 29.95 45.47
2 C switch 47.23 56.33 50.35 39.72 55.31 55.75
3 C tableau 6.12 4.26 6.51 5.46 4.94 7.83
4 tableau asm 7.06 11.26 7.52 5.78 5.93 8.84
5 tableau asm ur4 v1 6.11 16.91 6.51 5.05 5.03 7.55
6 tableau asm ur4 v2 10.28 6.76 10.98 8.34 5.05 12.44
7 tableau asm ur8 v1 5.96 4.18 6.32 4.72 4.84 7.26
8 tableau asm ur8 v2 10.20 4.44 10.87 8.28 4.58 12.44
9 tableau asm ur8 v3 5.87 4.21 6.23 4.76 4.92 7.19
10 SSE2 3.89 2.12 4.16 3.16 2.08 4.86
11 AVX 1.95 1.20 2.08 1.58 1.07 2.41
12 AVX2 v1 1.95 1.19 2.09 1.58 1.08 2.43
13 AVX2 v3 1.95 1.17 2.08 1.58 0.912.42
14 AVX2 v2 ur8 1.96 0.94 2.08 1.58 1.00 2.44
15 AVX2 intrinsics 1.13 0.98 1.20 1.081.36
ratio (1 / 10) 9.22 14.77 9.18 9.28 14.39 9.35
ratio (1 / 15) 31.76 31.96 31.82 32.23 29.95 33.43
TABLE15.5– Architectures modernes : temps d’exécution en secondes pour100_000
itérations sur des chaînes de256_000caractères.
Méthode Temps (s)
AVX512 asm v1 2.56
AVX512 asm v2 1.45
AVX512 asm v2 (dépliage par 8) 1.22
AVX512 C intrinsics 1.56
TABLE15.6– Intel Xeon Silver 4208 et AVX512 : temps d’exécution en secondes pour
100_000itérations sur des chaînes de256_000caractères.

### 15.8.3 N°Marque Intel AMD Intel AMD

Gamme Core i7Ryzen 5 Core i5Ryzen 5
Modèle 10850H 5600g12400f
2020 2021 2022
1 C if 24.37 23.87 27.97 36.08
2 C switch 35.14 43.75 35.87 34.93
3 C tableau 4.71 3.90 3.66 2.73
4 tableau asm 5.42 4.02 4.93 2.94
5 tableau asm ur4 v1 4.72 3.97 4.19 2.83
6 tableau asm ur4 v2 7.78 4.07 7.17 2.82
7 tableau asm ur8 v1 4.52 3.55 3.52 2.61
8 tableau asm ur8 v2 7.74 4.23 7.61 2.79
9 tableau asm ur8 v3 4.45 3.50 3.48 2.63
10 SSE2 2.97 1.81 1.64 0.81
11 AVX 1.52 0.90 1.64 0.45
12 AVX2 v1 1.50 0.91 1.61 0.39
13 AVX2 v3 1.53 0.90 0.85 0.40
14 AVX2 v2 ur8 1.55 0.89 0.85 0.33
15 AVX2 intrinsics 0.92
ratio (1 / 10) 8.20 13.18 17.05 44.54
ratio (1 / 15) 26.48 28.41 33.29 106.11
TABLE15.7– Architectures récentes : temps d’exécution en secondes pour100_000 itéra-
tions sur des chaînes de256_000caractères.
Pour les architectures récentes dont les résultats figurent Table, la méthode
15(version AVX2 intrinsics) est la plus efficace. On observe que les méthodes6et8
donnent de mauvais résultats sur les microprocesseurs Intel. C’est aussi le cas sur
les microprocesseurs AMD mais de manière moins significative.
Si le traitement initial durait une heure (méthode1), le fait de passer à une
version vectorisée (méthode15) sur un AMD Ryzen 5 5600g, permettrait d’abaisser
le temps d’exécution à3600/28,41 = 126,71 , soit un peu plus de deux minutes. Cela
représenterait une amélioration drastique.
15.8.4
On notera également que le nombre de voyelles influe sur le temps d’exécution.
Nous avons réalisé une étude simple qui consiste à faire varier le pourcentage de
voyelles que contient la chaine pour laquelle on compte les voyelles. On fait alors
varier ce pourcentage de 10 à 100 par pas de 10. Les résultats obtenus sur un AMD
Ryzen 5 3600 sont présentés Table. On travaille toujours sur une chaîne de
256_000 caractères et on réalise ici 100_000 fois le calcul.
PourcentageMéthode 1Méthode 2Méthode 3
10 43.83 83.65 9.41
20 57.17 110.53 9.46
30 70.17 127.40 9.51
40 83.74 140.92 9.52
50 95.87 154.01 9.45
60 108.27 162.11 9.39
70 121.03 167.08 9.44
80 133.43 169.29 9.68
90 137.77 169.07 10.01
100 134.95 165.68 10.43
TABLE15.8– Influence du pourcentage du nombre de voyelles sur le temps d’exécution :
AMD Ryzen 5 3600
Pour l’ensemble des méthodes, le temps d’exécution augmente à mesure que le
nombre de voyelles augmente. Cela paraît normal car au début, avec par exemple
10 % de voyelles, le code le plus souvent exécuté est celui lié aux consonnes. A
mesure que l’on augmente le nombre de voyelles on exécute moins souvent ce code
et plus souvent le code lié aux différentes voyelles. On est face à un problème lié à
la prédiction de branchement. Cependant, pour la méthode 3 qui utilise un tableau,
on ne devrait pas voir le temps augmenter

## 15.9 Comme le montre cette étude de cas, un traitement banal, peut être, s’il est

mal implanté, source de grands ralentissments pour le reste d’un programme. La
vectorisation apporte un facteur d’amélioration important en raison, d’une part, du
traitement de plusieurs octets simultanément, et d’autre part, de l’élimination du
if.
Cet exemple est très emblématique car le compilateur est incapable de vectoriser
le code. Or, c’est la vectorisation qui donne un gain substantiel, la version intrinsics
n’étant que la retraduction en C de la version assembleur. Passer du SSE à l’AVX,
puis à l’AVX512 permet à chaque fois de diminuer le temps d’exécution.
