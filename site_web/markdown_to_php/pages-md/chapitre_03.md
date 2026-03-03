# Chapitre 3 : Le Fonctionnement du Microprocesseur

## 3.1 Introduction

Ce chapitre introduit les bases de l'organisation interne d'un microprocesseur
et du sous-système mémoire associé. Il ne s'agit pas d'un cours d'architecture à
proprement parler qui nécessiterait à lui seul un ouvrage entier mais d'une revue
des notions et principes qui nous serviront plus tard pour coder efficacement. Le
lecteur averti voudra bien nous pardonner de prendre parfois certains raccourcis
afin de simplifier la machinerie complexe du microprocesseur, notre but étant de
focaliser l'attention du novice sur les points cruciaux qui seront exploités par la suite
dans la traduction en assembleur des traitements de haut niveau.

L'invention du microprocesseur, également qualifié de **CPU** en anglais pour
*Central Processing Unit* ou Unité Centrale de Traitement en français, remonte à
**1971** avec la commercialisation de l'**Intel 4004** en novembre de la même année.
Le microprocesseur représente à l'époque une invention majeure car il réunit les
fonctions d'un processeur sur un seul circuit intégré. L'utilisation de transistors pour
son implantation, la miniaturisation de ces derniers ainsi que le développement de
nombreuses techniques issues de la gestion des chaînes de production
ont conduit à nos processeurs actuels.

Le microprocesseur est défini comme la partie d'un ordinateur qui exécute les
instructions et traite les données des programmes. On le qualifie parfois de cerveau
de l'ordinateur mais ce terme est galvaudé car il laisse à penser que l'ordinateur est
intelligent. Or, un ordinateur n'est qu'un simple automate, il reproduit une série
d'actions prédéterminées et n'a d'intelligence que celle des personnes qui ont mis
au point les programmes qu'il exécute.

Les différents travaux qui ont mené à son élaboration datent des inventions de
**Charles Babbage** (1791 - 1871) avec sa machine différentielle (1822) dont le but
était de calculer des polynômes en utilisant une méthode de calcul dite méthode
des différences, puis sa machine analytique (imaginée en 1834) qu'il n'achèvera
jamais. La machine analytique comprenait beaucoup de concepts repris par la suite
durant la seconde guerre mondiale pour la conception des ordinateurs que l'on
peut qualifier de préhistoriques.

Mais on peut considérer que ce furent principalement les travaux et échanges
d'idées entre les américains **John Von Neumann**, **John Eckert**, **John William Mauchly**
et le britannique **Alan Turing** dans les années 40 et 50 qui permirent
d'aboutir à nos ordinateurs modernes.

Intrinsèquement, le microprocesseur ne sait faire que trois choses : lire des
données en provenance de la mémoire, les combiner au travers d'opérations (arithmétiques, logiques) et stocker le résultat de ces opérations en mémoire. Afin de
réaliser ces trois opérations de manière efficace il est nécessaire de développer des
techniques élaborées, souvent difficiles à concevoir, puis à mettre en oeuvre. C'est
ce que nous allons voir au travers de ce chapitre. Nous avons fait le choix de rester
synthetique afin de permettre au lecteur de comprendre les principes sous-jacents
au traitement des instructions par le microprocesseur. Le lecteur intéressé par plus
de détails pourra consulter les ouvrages suivants [5].

## 3.2 Sous-système mémoire

Avant de parler du microprocesseur, il est nécessaire d'évoquer le sous-système
mémoire puisque c'est la mémoire qui fournit au processeur sa matière première :
les données et les instructions. Il faut savoir qu'il existe deux approches différentes
dans la gestion des flux d'instructions et de données : celle de **Von Neumann** que
nous utilisons ici, pour laquelle données et instructions sont contenues dans une
seule mémoire, et celle dite de **Harvard** où données et instructions sont stockées
dans des mémoires séparées.

Du point de vue de l'utilisateur la mémoire centrale apparaît comme un long
tableau unidimensionnel d'octets qui permet de stocker les programmes à exécuter.
De nos jours il n'est pas rare de trouver sur nos ordinateurs personnels de l'ordre
de 8 à 16 Go de mémoire ce qui représente une quantité énorme de stockage
généralement sous utilisée pour la plupart des tâches courantes.

La mémoire centrale est de type **DDRx-SDRAM** où *x* peut prendre des valeurs
entre 1 et 5 à l'heure où nous écrivons cet ouvrage. Le sigle **RAM** (*Random Access
Memory*) signifie que l'on peut accéder à n'importe quel octet de la mémoire en
lecture ou en écriture.

- Le terme **DRAM** (*Dynamic RAM*) tient à la composition de la mémoire centrale
  pour représenter un bit d'information. Celle-ci est formée à l'aide de
  condensateurs. Si le condensateur est chargé c'est qu'il représente un bit à 1,
  sinon il représente un 0. Le problème d'un condensateur est qu'il a tendance
  à se décharger. Pour maintenir l'information valide, il est nécessaire de lire
  et réécrire les données en mémoire afin de recharger les condensateurs. On
  appelle cette étape un **rafraîchissement mémoire**. Durant cette période de
  temps très courte la mémoire est indisponible et il est nécessaire de rafraîchir
  la mémoire plusieurs fois par seconde.
- Le terme **SDRAM** (*Synchronous DRAM*) implique que les lectures et écritures
  se font à intervalles réguliers de manière synchrone.
- Le terme **DDR** (*Dual Data Rate*) implique que nous doublons le taux de
  transfert des données en envoyant celles-ci sur le front montant et sur le front
  descendant du signal d'horloge.
- Enfin le nombre `x` situé après `DDR` est un facteur qui définit le nombre d'octets
  que l'on peut lire ou écrire lors du transfert des données.

> **Débit mémoire**
> Le débit ou bande passante (*bandwidth* en anglais) de la mémoire est donné
> par la formule suivante en Mo/s :
>
> *bandwidth = [frequency × 2 × 2^(x−1)] × 8*  &emsp; (3.1)
>
> - `frequency` est la fréquence de fonctionnement de la mémoire exprimée en MHz
> - Le facteur 2 correspond à la DDR qui double le taux de transfert
> - `x` correspond au type de `DDRx`
> - 8 est la largeur du bus de données en octets (soit 64 bits)

Par exemple une **DDR4-SDRAM** fonctionnant à 100 MHz possède un débit
théorique de *100 × 2 × 2^(4−1) × 8 = 12 800 Mo/s*. On désigne également ce type de
mémoire par les sigles :

- `PC4-12800` qui indique le débit en Mo/s
- ou `DDR4-1600` qui indique le débit des données en MT/s (Méga Transferts par
  secondes) et correspond au produit des trois premiers termes de la formule

Les dernières mémoires les plus utilisées en début d'année 2025 sont
des `DDR5-6000` (*PC5-48000*) ou `DDR5-6400` (*PC5-51200*) mais il existe également
de la `DDR5-8000` (*PC5-64000*), voire de la `DDR5-8400` (*PC5-67200*).

Plus le débit est important, plus la mémoire pourra alimenter le processeur en
données à traiter. Mais il faut également prendre en compte d'autres facteurs appelés
***timings*** associés à la fréquence mémoire et liés intrinèquement à la structure
matrielle des mémoires vives. Ces timings sont indiqués par les constructeurs ou
lisibles par le BIOS de la carte mère grâce à un circuit électronique situé sur les
barrettes mémoires appelé **SPD** pour *Serial Presence Detect*.

La mémoire centrale n'est pas organisée sous forme d'un long tableau unidimensionnel
d'octets mais sous forme d'une matrice carrée, c'est à dire qui possède
le même nombre de lignes et de colonnes, ceci afin de diminuer l'espace occupé
par les circuits d'accès. Comme on a le même nombre de lignes et de colonnes on
utilisera un seul canal pour transmettre le numéro de la ligne puis de la colonne
qui nous intéresse.

Pour simplifier considérons que nous disposons d'une mémoire de 4 Go organisée
sous forme d'une matrice de `65_536` lignes et `65_536` colonnes car *65 536 = 2¹⁶*
et *4 Go = 2³²*. Il faut dans un premier temps envoyer un signal **RAS** (*Row Access Strobe*)
au circuit mémoire afin de lui indiquer que nous allons lui envoyer le numéro de
ligne. On envoie ensuite le numéro de ligne, suivi du signal **CAS** (*Column Access
Strobe*) pour indiquer qu'on va à présent envoyer le numéro de colonne. Puis on
envoie le numéro de colonne. Après quelques cycles d'attente (parfois plusieurs
dizaines), on obtient les données sur le bus de données.

*Figure 3.1 – RAS, CAS, Image issue du site de Samsung*

Les timings ont pour objectif de définir les délais entre l'envoi d'un signal
et le début du signal suivant ou entre l'envoi d'un signal et la réception d'un
autre. Le réglage des timings peut donc influer sur l'efficacité de la mémoire mais
pour un utilisateur standard il est préférable d'utiliser les valeurs préconisées
par le constructeur. Pour plus d'information concernant les timings mémoire je
recommande la lecture de l'article du site [hardwaresecrets.com](https://www.hardwaresecrets.com)
qui traite du sujet.

Les technologies liées à la conception des mémoires centrales sont en constante
évolution (cf. Table 3.1) et sont régies par un organisme de normalisation des
semi-conducteurs appelé **JEDEC** (*Joint Electron Device Engineering Council*).

| Type de mémoire | Année | Transferts (MT/s) | Débit (Go/s) |
|---|---|---|---|
| DDR SDRAM | 2000 | 266–400 | 2,1–3,2 |
| DDR2 SDRAM | 2003 | 533–800 | 4,2–6,4 |
| DDR3 SDRAM | 2007 | 1066–3100 | 8,5–24,8 |
| DDR4 SDRAM | 2014 | 1600–4800 | 12,8–38,4 |
| DDR5 SDRAM | 2020 | 3200–8400 | 25,6–67,2 |

*TABLE 3.1 – Types de mémoire et caractéristiques*

### 3.2.1 Bancs mémoire et alignement

D'un point de vue conceptuel la mémoire SDRAM est organisée sous forme de
bancs mémoire indépendants qui correspondent au nombre d'octets que le circuit
mémoire est capable de délivrer en une lecture.

Cette répartition était un facteur important il y a quelques années car le fait
d'accéder à des données non alignées ralentissait l'exécution des programmes. Aujourd'hui
avec la DDR4-SDRAM et les contrôleurs mémoire dédiés ce ralentissement
n'est plus perceptible et ne constitue plus dans la plupart des cas un facteur de
ralentissement.

> **Alignement mémoire**
> **Aligner les données** signifie les placer à une adresse multiple d'une puissance
> de 2 qui dépend du type de mémoire ou des données accédées. En général
> on prendra un multiple de 16 ou de 32 pour les tableaux. Si on manipule
> des données qui seront placées dans des registres vectoriels on utilisera un
> multiple de 16 pour le SSE, de 32 pour l'AVX et de 64 pour l'AVX-512.

*Figure 3.2 – Bancs mémoire*

Lorsque l'on requête un entier de type `int` qui
occupe 4 octets à l'adresse `04` la lecture des données peut se faire en une seule fois
car les données sont sur la même ligne. Par contre si les données sont situées sur
des lignes différentes (adresses `10` et `19`) cela implique l'envoi de deux requêtes au
contrôleur mémoire, une pour chaque ligne.

L'alignement concerne généralement les variables globales mais peut également
être appliqué aux variables locales dans la pile. Le code peut également être aligné
de manière à faire commencer le début d'une boucle à une adresse mémoire
multiple de 4, 8 ou 16. Par exemple, le compilateur `gcc` comporte des options en
ligne de commande comme :

- `-falign-functions` : aligne le début d'une fonction
- `-falign-jumps` et `-falign-labels` : aligne le code des branches du code
- `-falign-loops` : aligne le début des boucles

### 3.2.2 Double canal (dual channel)

La technologie de **double canal** (*dual channel* en anglais, cf. Figure 3.3)
permet en théorie de doubler le taux de transfert des données en proposant d'utiliser
deux canaux au travers desquels on peut échanger des données avec deux barrettes
mémoires qui doivent être identiques (même fréquence, même capacité, mêmes
caractéristiques)[^ddr_note]. Initialement les deux canaux étaient dépendants c'est à dire que
le premier canal lisait 8 octets et le second lisait les 8 suivants, on avait finalement
un bus de 128 bits au lieu d'un bus 64 bits d'une mémoire DDR-SDRAM. Ces deux
canaux sont ensuite devenus indépendants. Les gains obtenus par le dual channel
sont généralement faibles, de l'ordre de quelques pourcents car pour avoir un
impact significatif et pouvoir en tirer parti il est nécessaire de travailler sur des
tableaux de grande taille ce qui est rarement le cas pour la plupart des applications.

[^ddr_note]: A ne pas confondre avec le Dual Data Rate (DDR) vu précédemment.

*Figure 3.3 – Double ou simple canal*
Lors de tests que j'ai pu effectuer il y a quelques années avec un Intel Core i5-
4570 et de la mémoire de type DDR3 sur le problème de Maximum de Parcimonie
en Bioinformatique, je me suis aperçu que l'on pouvait atteindre une diminution
du temps d'exécution de l'ordre de 15 à 40% à partir du moment où les séquences
ont une longueur de plus de `32_768` octets.

Sur les processeurs haut de gamme on utilise aujourd'hui du ***quad channel***, c'est
à dire quatre canaux d'accès à la mémoire voire du ***hexa channel*** sur les derniers
Intel Xeon W-3275M.

#### 3.2.2.1 Détail d'une barrette mémoire

On considère une mémoire de 16 Go soit *2⁴ × 2³⁰ = 2³⁴ octets*. Une barrette
de mémoire est composée de 8 chips répartis en *2 × 4 chips* qui délivrent 32 bits
*(4 × 8)*. En effet un chip délivre 8 bits. Au final, une barrette mémoire délivre **64
bits** soit *2 × 32 bits* suivant deux canaux (channels) A et B (voir Figure 3.4).
Chaque chip stocke donc *16/8 = 2 Go* ou autrement dit, *2 × 8 Gbits = 2³⁴ bits*.

Les 2 Go sont répartis en **32 bancs mémoire** sous la forme de **8 groupes de 4 bancs**.
Un banc stocke donc *2³⁴/32 = 2²⁹ octets*, soit *2³² bits*.

Un banc mémoire est organisé sous la forme d'une matrice de **65 536 lignes** par
**8 192 colonnes** soit *2¹⁶ × 2¹³ bits*. On peut voir cette organisation sous la forme de
65 536 lignes de 1024 octets soit 64 Mo (voir Figure 3.5).

Pour accéder à un octet il faut donc au moins **34 bits** :

- 3 bits pour le chip
- 3 bits pour le groupe de bancs
- 2 bits pour le banc à l'intérieur du groupe
- 16 bits pour la ligne à l'intérieur du banc
- 10 bits pour la colonne à l'intérieur du banc

*Figure 3.4 – Barrette mémoire* | *Figure 3.5 – Banc mémoire*

Lors de l'accès à un octet dans un banc mémoire, il faut activer la ligne associée
à l'adresse de cet octet. Il est plus rapide d'accéder à un octet sur la même ligne,
qu'un octet sur une autre ligne. Le fait d'accéder à une autre ligne nécessite la
fermeture de la ligne actuelle et l'ouverture de la nouvelle ligne en quelque sorte.
Il s'agit d'activer et désactiver des circuits électriques/électroniques ce qui prend
du temps et ralentit l'accès mémoire.

### 3.2.3 Mémoire cache

La mémoire centrale est relativement lente par rapport au microprocesseur. Il
en a toujours été ainsi et cet écart n'a fait que s'accroître au cours du temps. Le
microprocesseur est donc pénalisé car il est en attente de données en provenance
de la mémoire. Pour palier ce problème différents mécanismes ont été mis en place
comme par exemple l'élargissement du bus de données qui consiste à récupérer
plusieurs octets consécutifs. Mais le mécanisme le plus intéressant est celui qualifié
de **mémoire cache**. Il consiste à utiliser une mémoire de petite taille mais très rapide
d'accès qui contient les données les plus souvent ou les plus récemment utilisées[^cache_note].

[^cache_note]: En informatique les algorithmes associés à ces techniques s'appellent **LRU** pour *Least Recently Used* et **LFU** pour *Least Frequently Used* et sont utilisés pour remplacer les données les plus anciennes ou les moins utilisées.

On dit généralement que la mémoire cache repose sur les principes de ***localité***
et de ***temporalité***. Si on accède une donnée à l'instant *t* à l'adresse *a*, il y a une
forte probabilité d'accéder à l'instant *t+1*, une donnée à l'adresse *a+ϵ*. C'est le
cas lorsque l'on écrit `x = x + y;` ou que l'on parcourt les éléments d'un tableau.
A tout moment un programme ne travaille que sur une partie de la mémoire, il
semble donc intéressant de copier la partie de la mémoire sur laquelle on travaille
dans une mémoire locale rapide.

Pour faire une analogie, on pourrait prendre l'exemple du réfrigérateur et du
supermarché. Lorsque l'on a besoin de s'approvisionner, on fait des courses au
supermarché ce qui prend beaucoup de temps. On stocke les denrées achetées
dans un réfrigérateur et elles sont dès lors très rapidement accessibles. Le réfrigérateur
représente donc la mémoire cache et le supermarché représente la mémoire
centrale.

La rapidité des mémoires cache tient à deux facteurs. Premièrement, un bit de
mémoire cache est de type **SRAM** (*Static RAM*) et est représenté par une bascule
(*latch* en anglais) composée de plusieurs transistors et non pas d'un condensateur
comme pour les DRAM. Le rafraîchissement qui a tendance à ralentir l'accès à la
mémoire DRAM n'existe plus dans le cas des SRAM. Deuxièmement, les mémoires
caches stockent les données mais également les adresses où se situent ces données.
Il est donc très facile de savoir si une adresse est dans le cache ou non.

Au fil des années les mémoires caches se sont développées et sont devenues de
plus en plus volumineuses en raison notamment de l'apparition des microprocesseurs
multi-coeurs. Initialement absentes, elles ont commencé à être disponibles
sur la carte mère, puis ont été progressivement intégrées au microprocesseur.

### 3.2.4 Niveaux de cache

On distingue aujourd'hui au moins trois niveaux de cache sur les processeurs
multi-coeurs. Sur la Figure 3.6, on a fait figurer une architecture de cache pour un
microprocesseur quad core, c'est à dire possédant quatre coeurs de calcul.

- Le cache le plus proche de la mémoire centrale est le cache de niveau 3, noté
  **L3** pour *Level 3*. Il contient données et instructions et permet de garder la
  cohérence des données entre les quatre coeurs.
- Le cache de niveau 2 (**L2**) contient également données et instructions mais
  est plus petit que le cache L3 et est associé à un seul coeur de calcul.
- Enfin au premier niveau de cache, on scinde le cache en un cache d'instructions
  **L1i** et un cache de données **L1d** car instructions et données ne suivent pas le
  même cheminement dans le traitement des instructions.

*Figure 3.6 – Niveaux de mémoire cache*

Sur la Figure 3.6, nous avons fait le choix de montrer une organisation de
quatre coeurs disposant chacun de leur propre cache L2. Il est possible, dans des
architectures plus anciennes (Intel Core) que deux coeurs partagent (*share*) le
même cache L2.

On remarquera que plus on s'éloigne du coeur de calcul plus le cache est de
grande taille et plus il sera lent. Pour donner un ordre d'idée on peut consulter la
Table 3.2.

Par exemple, pour le AMD Ryzen 7 1700X, on dispose de 32 ou 64 ko pour
les caches L1, 512 ko pour le cache L2 et 16 Mo pour le cache L3.

### 3.2.5 Caches inclusifs et exclusifs

Il existe deux organisations principales des mémoires cache lorsqu'elles doivent
coopérer :

| Processeur / Cache | L1i (ko) | L1d (ko) | L2 (ko) | L3 (Mo) |
|---|---|---|---|---|
| AMD Ryzen 7 1700X | 64 | 32 | 512 | 16 |
| associativité | 4-way | 8-way | 8-way | 16-way |
| latence (cycles) | 4 | 4 à 5 | 17 | 37 à 43 |
| Intel i7-7820X | 32 | 32 | 1024 | 11 |
| associativité | 8-way | 8-way | 16-way | 11-way |
| latence (cycles) | 4 | 4 à 5 | 14 | 68 |
| Intel i7-1065 | 32 | 48 | 512 | 2 |
| associativité | 8-way | 12-way | 8-way | 16-way |
| latence (cycles) | 5 | 5 | 13 | 30 à 36 |

*TABLE 3.2 – Caractéristiques des caches (taille, latence, associativité) – [www.7-cpu.com](http://www.7-cpu.com)*

- Les caches ***inclusifs*** qui sont conçus de manière à ce que toute donnée présente
  dans le cache L1 soit aussi présente dans le cache L2. La taille totale du cache
  L1+L2 est donc celle du cache L2 puisque les données de L1 sont incluses
  dans L2.
- Les caches ***exclusifs***, pour lesquels une donnée est soit dans le cache L1, soit
  dans le cache L2. Lorsqu'une donnée sort du cache L1 pour être placée dans
  le cache L2 on parle d'**éviction**. La taille totale du cache L1+L2 est donc la
  somme des tailles des caches L1 et L2.

Intel a fait le choix des caches inclusifs alors qu'AMD utilise des caches de type
exclusifs.

Un autre problème concerne le remplacement des lignes de cache. Lorsque l'on
remplace (voir ci-après) une ligne de cache qui est soit la plus ancienne (**LRU**) ou
la moins utilisée (**LFU**) se pose alors le problème du traitement de la ligne de cache
évincée afin de garder la cohérence des données.

Deux stratégies peuvent être envisagées :

- L'**écriture immédiate** (*Write Through*) consiste à mettre immédiatement à
  jour la donnée en mémoire centrale dès lors que sa valeur dans le cache est
  modifiée.
- L'**écriture différée** (*Write Back*) consiste à mettre à jour la mémoire centrale
  lors de la modification de l'entrée du cache correspondante.

Un compromis entre coût de production, complexité de réalisation et performances
doit être trouvé lors de la conception d'une mémoire cache, puis un
équilibre doit être trouvé entre les différents niveaux de cache.

Par exemple la stratégie d'écriture immédiate augmente le trafic vers la mémoire
centrale. Si la stratégie d'écriture différée pallie ce problème elle en crée un
nouveau : en effet, certains circuits d'entrées sorties de type **DMA** (*Direct Memory
Access*) sont capables de lire ou écrire des données en mémoire sans passer par le
processeur et risquent par exemple de lire des données qui ne sont pas à jour. On
peut contourner ce problème mais cela augmente la complexité du système.

### 3.2.6 Organisation associative du cache

Les mémoires caches sont organisées sous forme ***associative par groupe***, on
dit en anglais *n-way set associative*. On peut considérer la mémoire cache comme
une table composée de blocs de *k* lignes et *m* colonnes qui stockent des données
ainsi qu'une partie de l'adresse où se trouvent les données en mémoire.

*Figure 3.7 – Cache associatif à 2 groupes*

L'associativité permet d'organiser les adresses sous formes de classes d'équivalence
comme le montre la Figure 3.7. Imaginons que le cache contienne deux blocs
qui permettent de stocker chacun *32 × 4 octets*. On dit dans ce cas que la taille de
la ligne de cache est de 4 octets et que le cache a une taille de *2 × 32 × 4 = 256
octets*, soit deux blocs de 32 lignes de 4 octets. On ne compte pas la partie stockant
l'adresse.

#### 3.2.6.1 Exemple d'adressage dans le cache

Considérons pour simplifier les choses que notre microprocesseur possède un
bus d'adresses de **16 bits** c'est à dire que les adresses ont une taille de 16 bits. Pour
stocker dans le cache l'octet situé à l'adresse `48_854`, on écrit l'adresse en binaire et
on la décompose ainsi :

- `48_854 = 1011_1110_1101_0110`₂
- Les deux premiers bits sont mis à 0 pour obtenir l'adresse `48_852` car on charge
  les données par groupe de **4 octets**, c'est à dire la taille d'une ligne de cache,
  on chargera donc les octets situés aux adresses multiples de 4
- La ligne de cache où on devra placer les quatre octets est obtenue par les
  **5 bits** suivants, car il y a 32 lignes de cache et *32 = 2⁵*, soit dans notre cas
  `10101`₂ = 21
- Les **9 bits** restants représentent ce que l'on appelle l'**étiquette** (*tag*) et seront stockés
  dans le cache car ils permettent de reconstruire l'adresse exacte

On remarque donc pour cet exemple que toute adresse dont les bits d'indices 2
à 6 ont la même valeur sera stockée dans la même ligne du cache associatif. Afin
d'améliorer l'efficacité du cache on crée donc *n* blocs de ce type et on essaye de
répartir au mieux les adresses entre les blocs en utilisant un algorithme de type
LRU ou LFU comme évoqué précédemment.

#### 3.2.6.2 Cache hit et cache miss

Pour déterminer si l'octet à l'adresse `41687 = 1010_0010_1101_0100`₂ est dans
le cache, on calcule la ligne du cache où devrait se trouver l'adresse. Dans le cas
présent il s'agit de `1_0101`₂ = 21 (qui correspond aux bits 2 à 6), puis on compare
en parallèle dans chaque bloc si l'étiquette `1_0100_0101` est présente. Si c'est le cas,
l'adresse et la donnée qui lui correspond sont présentes dans le cache.

Lorsque la donnée recherchée se trouve présente dans le cache, on parle de
***cache hit***. Dans le cas où elle est absente il s'agit d'un ***cache miss*** ou **défaut de cache**
en français. Pour donner un ordre de grandeur, déterminer si une donnée est dans
le cache L1 prend de l'ordre de 4 à 5 ns, dans le cache L2 environ une dizaine voire
une vingtaine de ns, puis dans le cache L3 entre 30 et 70 ns et finalement l'obtenir
depuis la mémoire une centaine de ns.

> **Facteur d'amélioration**
> Un programme s'exécutera donc plus vite si les données sont déjà présentes
> dans le cache et d'autant plus vite que les données sont présentes dans un
> cache de niveau faible (L1), c'est à dire, le plus proche du coeur de calcul.
> C'est le ***premier facteur d'amélioration*** de la vitesse d'exécution des
> programmes : faire en sorte, quand cela est possible, que les données soient
> présentes dans le cache au moment où on les traite car elles seront accessibles rapidement.
>
> La mémoire cache possède une influence très importante pour certains traitements
> liés à la lecture et l'écriture en mémoire. Un exemple typique de cette
> influence est celui du produit de matrices où des techniques d'inversion de
> boucles, ou de **blocage de boucles** (*loop blocking*) associée au **tuilage** (*tiling*)
> permettent de diminuer le temps de calcul de manière drastique par rapport
> à une implantation directe de la formule de calcul.

Le produit de matrices est la première étude de cas de ce livre (cf. Cha-
pitre).

## 3.3 Les microprocesseurs x86

Nous nous intéressons dans ce chapitre aux microprocesseurs de la famille **x86**
c'est à dire compatibles avec le jeu d'instructions de l'**Intel 8086**. Intel a fait le choix
de garder une compatibilité dite descendante (ou ascendante suivant la vision des
choses) de son jeu d'instructions assembleur. Ainsi, un microprocesseur en 2018 est
capable d'exécuter un programme compilé pour l'Intel 8086 conçu en 1978, c'est à
dire il y a 40 ans. Sachez que lorsque vous allumez votre ordinateur il se place en
mode 8086, puis ensuite en mode 32 ou 64 bits.

On utilise la dénomination **IA-32** (pour *Intel Architecture 32 bits*) pour les
processeurs, à partir du Pentium chez Intel, qui utilisent des registres 32 bits.

Les deux grands constructeurs de processeurs x86 sont **Intel** et **AMD**, deux
sociétés américaines[^cyrix].

[^cyrix]: On pensera également à Cyrix (1988-1997) qui a créé des clones du 80486 et du Pentium d'Intel.

**Intel** (*Integrated Electronics*) fut fondée en 1968 par Gordon Moore, Robert
Noyce et Andrew Grove, trois docteurs en chimie et physique issus du monde
de l'électronique numérique qui décidèrent de quitter l'entreprise *Fairchild Semiconductor*.
Intel est devenu le leader mondial de la famille x86 et ses nombreux
produits sont connus du grand public dont notamment le Pentium, Pentium Pro,
les processeurs Core, Core 2 et plus récemment les microprocesseurs estampillés i3,
i5, i7 et les derniers i9.

**AMD** (*Advanced Micro Devices*) fut fondée en 1969, soit un an après Intel, par un
groupe d'ingénieurs et de dirigeants de *Fairchild Semiconductor* dont notamment
Jerry Sanders. AMD est entré sur le marché des microprocesseurs x86 en 1975
en produisant par rétro-ingénierie une version de l'Intel 8080. C'est au début des
années 80 qu'AMD devint un producteur de microprocesseurs sous licence Intel car
la société IBM désirait ne pas dépendre du seul fournisseur Intel pour la production
de ses PCs. AMD a également conçu ses propres microprocesseurs faits maison
comme les fameux K5, K6, Athlon et dernièrement les microprocesseurs Ryzen et
Threadripper.

### 3.3.1 Fréquence de fonctionnement

Tout comme la mémoire le microprocesseur fonctionne à une fréquence donnée
qui donne la cadence d'exécution des différentes unités de traitement. La fréquence
de fonctionnement fut durant de nombreuses années le nerf de la guerre. Produire
un processeur avec une fréquence de fonctionnement supérieure permettait de
surpasser son concurrent. Cependant plus la fréquence est élevée, plus le processeur
consomme de l'énergie et dégage de la chaleur. Ces dernières années la fréquence
a été régulée afin que l'on puisse gérer de manière plus fine l'énergie. En effet un
microprocesseur n'a pas besoin de tourner en permanence à une fréquence élevée,
uniquement lorsqu'il est sollicité par un ou plusieurs programmes. Le choix a donc
été fait d'utiliser, dans un premier temps, trois fréquences de fonctionnement :

- Une fréquence au repos (*idle*), par exemple 1,0 GHz
- Une fréquence de fonctionnement rapide (*boost*), lorsqu'un seul coeur est
  actif (3,5 GHz)
- Une fréquence de fonctionnement moyenne lorsque plusieurs coeurs sont
  actifs (3,0 GHz)

A partir de 2018, Intel et AMD ont introduit une gestion encore plus fine de
l'énergie avec une diminution progressive de la fréquence en fonction du nombre
de coeurs qui travaillent, comme indiqué Table 3.3.

| Nombre de coeurs actifs | 1–2 | 3–4 | 5–12 | 13–16 | 17–18 |
|---|---|---|---|---|---|
| Intel Core i9-7980XE | 4,4 | 4,0 | 3,9 | 3,5 | 3,4 |
| Intel Core i9-9980XE | 4,5 | 4,2 | 4,1 | 3,9 | 3,8 |

*TABLE 3.3 – Modification de la fréquence en GHz en fonction du nombre de coeurs actifs*

L'objectif est de repousser les limites de la fréquence de fonctionnement tout
en restant dans l'enveloppe thermique du microprocesseur appelée **TDP** pour
*Thermal Design Power*. Le TDP caractérise l'énergie (chaleur) dégagée par un circuit
intégré. Si la chaleur est trop forte le circuit risque d'être endomagé. Il risque de
fondre ou d'être soumis à des phénomènes d'électro-migration qui consistent en
un déplacement d'atomes des parties conductrices du courant électrique vers les
parties isolantes.

Il semble que la valeur du TDP soit calculée différemment suivant les fabricants
et les gammes de processeurs. Elle sert d'indicateur afin de prévoir un circuit de
refroidissement proportionné à la chaleur dégagée[^tdp_note].

[^tdp_note]: On pourra consulter le site [anandtech.com](https://www.anandtech.com) et notamment l'article *Intel Core i7 10700 vs Intel Core i7 10700k, is 65W Comet Lake an option?* afin d'en savoir plus sur le TDP.

Pour ne pas simplifier les choses, depuis l'architecture Alder Lake de 2021, Intel
définit deux valeurs de fréquence :

- Le **PBP** pour *Processor Base Power*, ce qui correspond au TDP ou au PL1
- Le **MTP** pour *Maximum Turbo Power*, ce qui correspond au PL2

Le **MTP** représente la puissance ou la fréquence maximale que l'on peut atteindre
pendant une période de temps fixée, appelée ***tau***, avant de revenir au PBP. L'exemple
donné dans l'article de Hardware Mag[^hwmag] est
celui d'un Core i5-13400 avec un PBP de 65 Watts, un MTP de 154 Watts et une
période *tau* de 56 secondes.

[^hwmag]: Voir Hardware Mag 123, Août-Septembre 2023, Best of Cooling CPU, page 90.

Cependant, les microprocesseurs estampillés K comme le Core i9-13900K ont
un *tau* infini, et dans ce cas ont par exemple un PBP de 125 W et un MTP de 253
W ! Il est alors nécessaire de disposer d'un système de refroidissement approprié si
on ne veut pas endommager son CPU.

### 3.3.2 Les trois types d'opérations

Le microprocesseur n'est en fait capable de réaliser que **3 types d'opérations** :

- `LOAD r, [mem]` : charger dans un registre `r` une donnée située en
  mémoire à une adresse fournie en paramètre
- `STORE [mem], r` : stocker une donnée contenue dans un registre
  `r` dans la mémoire à une adresse fournie en paramètre
- `OP r3, r2, r1` : où `OP` est une opération arithmétique ou logique et qui signifie
  mettre dans le registre `r3` le résultat de `r1 OP r2`

En prévision de ce que nous verrons dans le prochain chapitre, nous indiquons
que pour les microprocesseurs de type x86, on utilise seulement deux opérandes
dans la plupart des instructions. On note donc `OP r1, r2` ce qui correspond à `r1 =
r1 OP r2`. Dans ce cas l'opérande `r1` est appelée **destination** et l'opérande `r2` est
qualifiée de **source**.

On distingue historiquement deux classes d'architectures (cf. Table 3.4) pour
les microprocesseurs :

| Architecture | Sigle | Description |
|---|---|---|
| RISC | MIPS | *Microprocessor without Interlocked Pipeline Stage* |
| RISC | ARM | *Acorn Risc Machine* (1987) ou *Advanced Risc Machine* |
| RISC | POWER | *Performance Optimization With Enhanced RISC 1–8* |
| CISC | x86 | Intel, AMD |
| CISC | 680x0 | Motorola |

*TABLE 3.4 – Exemples d'architectures CISC et RISC*

- **RISC** (*Reduced Instruction Set Computer*) : dans ce type d'architecture, on utilise
  le format d'instruction précédent et l'adressage mémoire reste simple (i.e. il
  n'existe que peu de manières différentes d'accéder à la mémoire)
- **CISC** (*Complex Instruction Set Computer*) : pour ce type d'architecture on a tendance
  à combiner une instruction de chargement ou de stockage avec un calcul et
  l'adressage mémoire peut être complexe

Prenons un exemple CISC issu du jeu d'instruction x86 :

```nasm
add [ebx+ecx*4+8], eax
```

Cette instruction réalise plusieurs opérations, à savoir :

- Le calcul de l'adresse mémoire *A = ebx + ecx * 4 + 8*
- Le chargement de la donnée *D* stockée sur 4 octets à l'adresse `Mem[A]` dans un
  registre temporaire *R*, soit *R = Mem[A]*
- L'addition de la donnée *D* stockée dans *R* avec le registre `eax` : *R = R + eax*
- L'écriture du résultat à l'adresse *A*, *Mem[A] = R*


Ce qui rend cette instruction complexe est le fait qu'elle combine plusieurs choses
à réaliser dont un calcul d'adresse, un chargement de donnée depuis la mémoire,
un calcul et un stockage du résultat en mémoire.

Les microprocesseurs RISC vont, quant à eux, éviter ce genre d'instruction complexe
en ne permettant par exemple que de lire une donnée depuis la mémoire pour
la stocker dans un registre. On n'autorise alors que l'addition entre deux registres.
L'instruction CISC précédente sera traduite en RISC par quatre instructions.

Actuellement beaucoup de processeurs RISC sont utilisés dans les systèmes dits
embarqués (téléphones, tablettes, robots) en raison de leur efficacité énergétique,
les processeurs RISC consomment en général moins d'énergie que les CISC[^risc_note].

[^risc_note]: Notons que le terme *Reduced* c'est à dire *réduit* en français est mal choisi, on devrait plutôt dire *simplifié*.

La conception d'un microprocesseur pose de nombreux problèmes. Plus sa
structure est complexe, plus les procédures de test sont longues et plus il est
difficile de déterminer d'éventuels défauts de conception. Un processeur RISC, de
structure moins complexe qu'un processeur CISC, est donc plus simple à concevoir
et tester.

Plusieurs facteurs ont encouragé par le passé la conception de machines à jeu
d'instruction complexe (CISC) :

- Premièrement, la lenteur de la mémoire par rapport au processeur laissait
  à penser qu'il était plus intéressant de soumettre au CPU des instructions
  complexes. Pour réaliser un traitement donné, il était préférable de définir
  une instruction complexe plutôt que plusieurs instructions élémentaires. De
  plus une instruction complexe prend alors moins de temps de chargement
  depuis la mémoire qu'une série d'instructions simples. Dans les années 70
  les ordinateurs utilisaient de la mémoire magnétique (conçue à partir de
  tores) pour stocker les programmes. Ce type de mémoire était cher et lent.
  Un premier changement s'opéra avec l'arrivée des DRAM plus rapides mais
  restait l'épineux problème du prix des DRAM. Par exemple en 1977, 1 Mo de
  DRAM coûtait environ $5000 alors qu'il ne valait plus que $6 en 1994.
- Deuxièmement, le développement des langages de haut niveau (Fortran, Pascal, Ada)
  a posé quelques difficultés quant à la conception de compilateurs
  capables de traduire efficacement des programmes d'un langage évolué vers
  l'assembleur. On a donc eu tendance à incorporer au niveau processeur des
  instructions plus proches de la structure de ces langages. Le processus de
  compilation des langages de haut niveau comme Pascal et C était lent et le code
  assembleur obtenu n'était pas toujours optimisé : mieux valait coder à la main.
  Certains ont proposé de combler le fossé sémantique entre langage de haut
  niveau et assembleur afin de faciliter la tâche des programmeurs.

A partir de la fin des années 70, deux facteurs sont venus ébranler les idées
ancrées dans les esprits par les décennies précédentes et qui tendaient à favoriser
l'approche CISC. D'une part, les mémoires sont devenues plus rapides, moins chères
et de plus grande capacité qu'elles ne l'étaient auparavant et, d'autre part, des
études conduites sur des langages de haut niveau montrèrent que les
programmes sont constitués à 85% d'affectations, d'instructions `if` et d'appels de
procédures et que 80% des affectations sont de la forme `variable = valeur`.

Les résultats précédents ont été résumés par la phrase suivante : *80% des
traitements des langages de haut niveau font appel à 20% des instructions du CPU.*
D'où l'idée d'améliorer la vitesse de traitement des instructions les plus souvent
utilisées ce qui a conduit à l'architecture RISC.

Aujourd'hui les processeurs modernes de type CISC (comme les processeurs de
la famille x86) possèdent des instructions CISC qui, comme nous le verrons plus
tard, sont ensuite traduites en une série d'instructions de type RISC (que l'on qualifie
de **micro-opérations**). On peut donc considérer que le coeur de fonctionnement
d'un microprocesseur de type CISC est de type RISC.

### 3.3.3 Architecture et loi de Moore

Si la fréquence de fonctionnement est un facteur important qui permet de
caractériser la puissance d'un microprocesseur un autre facteur primordial est son
**architecture**. Le terme architecture est à différencier de ce que nous venons de
voir pour les architectures CISC et RISC. Quand nous parlerons d'architecture d'un
processeur nous évoquerons les caractéristiques et l'organisation des éléments qui
le constituent. L'architecture détermine la taille des caches, leur organisation mais
également toute la partie liée au traitement des instructions. L'accès à la mémoire
et le type de mémoire qui pourra être utilisé est généralement déterminé par le
**chipset**[^chipset] de la carte mère qui définit entre autres choses comment les données sont
échangées entre le microprocesseur, la mémoire et les périphériques.

[^chipset]: Un chipset est un ensemble de composants électroniques qui permet la communication entre microprocesseur, mémoire et périphériques.

La **finesse de gravure** détermine grosso-modo la taille des transistors. Plus la
finesse de gravure est petite, plus les transistors sont petits. Si un transistor est
gravé plus finement il est plus rapide, consomme moins d'énergie et possède une
plus grande densité d'intégration, c'est à dire qu'on peut en mettre plus sur la même
surface, ce qui économiquement est plus intéressant.

Une architecture est aujourd'hui identifiée par un nom (cf. Table 3.5) qui
détermine sa finesse de gravure ainsi que l'étape de production et la génération du
processeur.

La société Intel s'est engagée en 2007 sur la voie d'un mode de production de
ses microprocesseurs en deux temps appelés **tick-tock** :

- Un ***tick*** correspond à une diminution de la finesse de gravure
- Un ***tock*** correspond à la création d'une nouvelle architecture

Puis, entre 2014 et 2016, ce modèle a été amendé en raison du retard pris
par Intel sur la gravure en 10 nm pour inclure une troisième étape qui consiste à
améliorer une architecture existante et le modèle a été rebaptisé **PAO** pour *Process–Architecture–Optimization*.

| Année | Etape | Architecture | Génération | Finesse |
|---|---|---|---|---|
| 2008 | Tock | Nehalem | 1 | 45 nm |
| 2010 | Tick | Westmere | 1 | 32 nm |
| 2011 | Tock | Sandy Bridge | 2 | 32 nm |
| 2012 | Tick | Ivy Bridge | 3 | 22 nm |
| 2013 | Tock | Haswell | 4 | 22 nm |
| 2014 | Optimization | Haswell Refresh | 4 | 22 nm |
| 2014 | Tick | Broadwell | 5 | 14 nm |
| 2015 | Tock | Skylake | 6 | 14 nm |
| 2017 | Optimization | Kaby Lake | 7 | 14 nm |
| 2017 | Optimization | Kaby Lake Refresh | 8 | 14 nm |
| 2017 | Optimization | Coffee Lake | 8, 9 | 14 nm |
| 2018 | Optimization | Whiskey Lake | 8 | 14 nm |
| 2019 | Process | Canon Lake | – | 10 nm |

*TABLE 3.5 – Nom des architectures Intel en fonction des années*

#### 3.3.3.1 Loi de Moore

En 1965, **Gordon Moore** (l'un des fondateurs d'Intel) alors ingénieur chez
Fairchild Semiconductor, postule le doublement de la complexité des semi-conducteurs
tous les ans à coût constant en se basant sur des données depuis 1959, date de leur
invention.

Une dizaine d'années plus tard, Moore révisera sa prédiction pour un doublement
tous les deux ans du nombre de transistors dans un microprocesseur. C'est
cette seconde prédiction que l'on qualifie de **loi de Moore** mais qui n'est pas une loi
au sens strict du terme, c'est à dire toujours vraie, mais définit une tendance que
les fabricants de circuits intégrés et de microprocesseurs en particulier, tendent à
suivre, plus ou moins bien.

Enfin une troisième version postule le doublement de quoi que ce soit tous les
dix-huit mois. Elle est attribuée à David House, travaillant chez Intel qui aurait
combiné la multiplication du nombre de transistors et l'augmentation de leur vitesse
ou de la fréquence de fonctionnement des microprocesseurs.

### 3.3.4 Registres

Le microprocesseur possède plusieurs variables, appelées **registres**, qui permettent
de stocker de manière temporaire des valeurs qui serviront pour des calculs
ultérieurs. En architecture 32 bits, les registres utilisés pour faire des calculs sont
au nombre de 8 et stockent des valeurs entières de 32 bits (entier signé, non signé,
adresse mémoire).

Ils sont qualifiés de **registres généraux** (*General Purpose Registers*) identifiés par les noms
`eax`, `ebx`, `ecx`, `edx` ainsi que les registres d'index `edi` (*Destination Index*) et `esi` (*Source Index*).
Il existe également des registres qui servent à gérer la pile et à accéder aux paramètres des
fonctions et aux variables locales. Ce sont `esp` (*Stack Pointer*) et `ebp` (*Base Pointer*)[^esp_note].

[^esp_note]: `ESP` et `EBP` sont généralement décrits comme faisant partie des registres d'index mais je préfère les distinguer des autres registres car ils ont un usage spécifique lié à la pile.

On dénombre également plusieurs autres registres comme les registres de
segment (`cs`, `ds`, `ss`, `es`), le registre `eflags` qui stocke les effets des opérations
(retenue, résultat à 0, débordement, ...) ainsi que le registre `eip` (*Instruction
Pointer*) qui stocke l'adresse mémoire de la prochaine instruction à exécuter.

### 3.3.5 Modes d'adressage mémoire

Une adresse mémoire est définie soit par une valeur constante, soit par la valeur
d'un registre, soit par une combinaison de registres qui permet une correspondance
avec les expressions liées aux tableaux ou aux structures de données.

Une adresse a donc la forme suivante :

> *adresse = [base + index × scale + offset]*

- `base` et `index` sont des registres avec une restriction concernant `index` qui ne
  peut être le registre `esp`
- `scale` est un facteur d'échelle et peut prendre les valeurs 1, 2, 4 ou 8 qui
  vont correspondre à la taille d'un octet, d'un mot, d'un double mot ou d'un
  quadruple mot
- `offset` est une constante entière positive, négative ou nulle qualifiée de décalage
  ou de déplacement

Chacun de ces termes est optionnel. Par exemple si on désire accéder au *i*ème
élément d'un tableau d'entiers `t` on pourra choisir de stocker l'adresse de `t` dans le
registre `ebx`, stocker `i` dans le registre `ecx`, utiliser `eax` pour lire la valeur `t[i]` et
ainsi écrire `mov eax, [ebx+ecx*4]`. Le facteur d'échelle utilisé ici est 4 car un
entier occupe 4 octets en mémoire.

Les registres de segment ont été introduits sur l'**Intel 8086**, un microprocesseur
16 bits, afin de pouvoir gérer 1 Mo de mémoire, alors que 16 bits ne permettent de
gérer que 64 ko[^16bit]. Chacun de ces segments est lié à la structure d'un programme :
`cs` correspond au segment de code (*Code Segment*), `ds` au segment de données
(*Data Segment*), `ss` à la pile (*Stack Segment*) et `es` (*Extra Segment*) peut être utilisé
pour pointer sur une adresse quelconque de la mémoire.

[^16bit]: *2¹⁶ = 65 536 = 64 × 1 024 = 64 ko*.

*Figure 3.8 – Adressage mémoire*

Grâce à ce mécanisme une adresse mémoire est définie par une combinaison
registre de segment et registre général ou registre d'index. Par exemple, `eip` est
associé à `cs`. Le registre `edi` est associé à `es` et `esi` est associé à `ds`. Les registres `esp`
et `ebp` sont liés au segment de pile `ss`. Lorsque l'on accède à la prochaine instruction
au travers de `ip` (ou `eip` en 32 bits), on fait implicitement référence au segment `cs`,
l'adresse que l'on accède est donc calculée par :

> *address = segment × 16 + offset = cs × 16 + ip*

Le fait de multiplier par 16 le registre `cs` consiste à réaliser un décalage à gauche
de 4 bits du registre `cs` car *16 = 2⁴*, ce qui donne une adresse sur *16 + 4 = 20 bits*.

Notons que les programmes que nous allons écrire par la suite feront référence à
ces registres implicitement et nous n'aurons pas à les spécifier car nous fonctionnerons
dans une architecture 32 ou 64 bits. Cela permettra de simplifier l'écriture des
programmes et les segments seront gérés par l'assembleur `nasm` et le compilateur `C++`.

## 3.4 Temps d'exécution et améliorations

Le temps d'exécution d'un programme est donné par les deux formules suivantes :

> *Te = Σ(CPIi × Tc) = N × CPIm × Tc* &emsp; (3.2)

La première exprime que le temps d'exécution en secondes (*Te*) d'un programme
de *N* instructions est donné par la somme du nombre de cycles que nécessite chaque
instruction (*CPIi = Cycles Per Instruction*) pour s'exécuter multiplié par le temps de
cycle (*Tc*) qui est l'inverse de la fréquence de fonctionnement du microprocesseur.

La seconde est une version synthétique pour laquelle on calcule un nombre
moyen de cycles par instruction (*CPIm*) pour *N* instructions :

> *CPIm = (1/N) × Σ CPIi* &emsp; (3.3)

Par exemple, si un sous-programme est composé de :

- 3 instructions qui s'exécutent en 2 cycles
- 1 instruction de 4 cycles
- 1 instruction de 10 cycles

On a alors au total *3×2 + 1×4 + 1×10 = 20 cycles*, soit un CPI moyen de *20/5
instructions* et donc une moyenne de **4 cycles par instruction**.

Les différentes évolutions des microprocesseurs ont pour but de diminuer le
temps d'exécution des programmes. D'après la formule, étant donné que le
temps d'exécution est un produit de facteurs, il suffit de diminuer l'un des facteurs
pour diminuer le temps total d'exécution du programme.

La première amélioration consiste à diminuer le temps de cycle. Pour cela il suffit
d'augmenter la fréquence des processeurs. Un processeur doté d'une fréquence de
3 Ghz fonctionne 3 fois plus vite qu'un processeur à 1 Ghz. Cependant augmenter
la fréquence pose de nombreux problèmes à résoudre notamment l'élévation de la
température dégagée par le circuit électronique.

On peut ensuite diminuer le nombre d'instructions *N* ou le nombre moyen de
cycles par instructions (*CPIm*). Or dans ce cas, il semble que le produit *N × CPIm*
reste constant, en effet :

- Si on diminue le nombre d'instructions on crée des instructions plus complexes
  (de type CISC) qui nécessitent plus de cycles pour être exécutées, on augmente
  donc *CPIm*
- Par contre, si on diminue le nombre moyen de cycles par instructions on crée
  des instructions simples (de type RISC) et il faut utiliser plusieurs instructions
  pour réaliser le même traitement qu'une instruction CISC, on augmente donc *N*

Il a donc fallu élaborer des solutions capables de diminuer le temps nécessaire
au traitement des instructions qu'elles soient CISC ou RISC.

Les architectures des processeurs modernes jouent sur plusieurs plans, en tentant
de maximiser :

- L'**ILP** (*Instruction Level Parallelism*) d'un flux d'instructions, c'est à dire, tenter
  d'exécuter le plus possible d'instructions en parallèle
- Le **DLP** (*Data Level Parallelism*) qui consiste à exécuter la même instruction
  sur plusieurs données différentes en parallèle
- Le **TLP** (*Thread Level Parallelism*) qui consiste à disposer de plusieurs coeurs
  d'exécution, c'est ce que l'on appelle les processeurs multi-coeurs

| Amélioration | Technique |
|---|---|
| ILP | pipeline, super-scalaire, exécution dans le désordre, coprocesseur |
| DLP | registres et calcul vectoriel (unités MMX, SSE, AVX) |
| TLP | multi-coeurs, SMT, HyperThreading |

*TABLE 3.6 – Techniques d'amélioration des microprocesseurs*

Nous allons donc passer en revue ces techniques dans la suite de ce chapitre.

## 3.5 Étapes de traitement d'une instruction

Afin de simplifier la compréhension du traitement des instructions par le microprocesseur,
on peut dire que traiter une instruction consiste à passer par cinq
étapes principales (cf. Figure 3.9) :

1. Le **chargement** (*Fetch Instruction*) de l'instruction depuis la mémoire (cache L1i)
2. Le **décodage** (*Decode Instruction*) de l'instruction afin de connaître les opérations à réaliser lors de
   son exécution
3. Le **chargement des opérandes** (*Read Operands*) : lecture des données nécessaires à l'exécution
4. L'**exécution** (*Execute*) proprement dite de l'instruction
5. L'**écriture du résultat** (*Write Back*) en mémoire ou dans un registre

Le programme à exécuter réside en mémoire centrale et il se décompose en
plusieurs parties :

- Le **code**, c'est à dire les instructions à exécuter
- Les **données** qui peuvent être initialisées, non initialisées ou en lecture seule
- La **pile** des appels de sous-programmes
- Le **tas** (*heap* en anglais) qui représente le reste de la mémoire et c'est notamment
  dans cette zone que l'on allouera les données grâce à `malloc` en C ou
  `new` en C++

L'ensemble des données en mémoire (attention, ici le terme donnée signifie tout
octet de la mémoire centrale), s'il est accédé par le processeur au travers d'une
adresse, va transiter par les différents niveaux de cache.

*Figure 3.9 – Etapes de traitement d'une instruction*

Les deux premières étapes de traitement (chargement et décodage) représentent
ce que l'on appelle le ***frontal*** (ou ***front-end*** en anglais), c'est à dire la partie émergée,
donc visible de l'iceberg. Les trois dernières sont qualifiées de ***back-end*** en anglais,
que l'on trouve parfois traduit par ***dorsal***, c'est la partie immergée et la plus
complexe.

Imaginons, de manière grossière que chacune de ces étapes prend une nanoseconde
(*10⁻⁹ s*). Le traitement de chaque instruction demande 5 étapes d'une
nanoseconde donc **5 ns**. En d'autres termes, on traite une instruction toutes les 5 ns.

C'est ce que nous avons représenté sur la partie haute de la Figure 3.9. La
première instruction *i₁* passe successivement par les 5 étapes de traitement avant
que l'instruction suivante *i₂* puisse être traitée.

## 3.6 Pipeline d'instructions

Afin d'améliorer la vitesse de traitement des instructions un mécanisme de
**pipeline** a été mis en place. Il consiste à ne pas attendre que l'ensemble des étapes
de traitement aient été réalisées avant de passer à l'instruction suivante. Pour
cela on rend chaque étape de traitement indépendante. Une première instruction
passe dans l'étape de chargement au temps *t = 0*, puis au temps *t + 1*, elle passe
dans l'étape de décodage, pendant que l'instruction suivante passe dans l'étape de
chargement et ainsi de suite. C'est le même principe qui est utilisé sur les chaînes
de montage dans les usines. On qualifie généralement le pipeline de mécanisme
d'**amélioration en longueur**.

*Figure 3.10 – Pipeline d'instructions*

Ce mécanisme général est utilisé à plusieurs niveaux du traitement des instructions,
notamment lorsqu'une instruction est exécutée par une Unité de Traitement
(cf. ci-après).

La question que l'on peut légitimement se poser est : quel gain apporte le
pipeline ? Pour répondre à cette question il suffit de comparer les temps d'exécution
avec et sans pipeline pour traiter *n* instructions :

- **Sans pipeline** : une instruction est exécutée toutes les 5 ns, si on a *n* instructions
  à exécuter il faut donc *5 × n ns*.
- **Avec pipeline** : il faut 5 ns pour que la première instruction soit exécutée, puis
  *n − 1 ns* pour exécuter les *n − 1* instructions restantes

Le gain obtenu est donné par le rapport du temps d'exécution sans pipeline par
le temps d'exécution avec pipeline :

> *gain = lim(n→∞) [5n / (5 + n − 1)] ≈ 5n/n ≈ 5* &emsp; (3.4)

| Micro architecture | Pipeline | Micro architecture | Pipeline |
|---|---|---|---|
| P5 (Pentium) | 5 | NetBurst (Cedar Mill) | 31 |
| P6 (Pentium 3) | 10 | Core | 14 |
| P6 (Pentium Pro) | 14 | Sandy Bridge | 14 |
| NetBurst (Willamette) | 20 | Haswell | 14 |
| NetBurst (Northwood) | 20 | Skylake | 14 |
| NetBurst (Prescott) | 31 | Kabylake | 14 |

*TABLE 3.7 – Nombre d'étages de pipeline pour différentes architectures Intel*

Un pipeline de *k* étapes (on parle également d'étages ou *stages* en anglais),
permet théoriquement de diviser le temps de traitement par *k*. Cependant, le
nombre d'étages de traitement est limité par le nombre d'étapes élémentaires à
réaliser et est influencé par les accès à la mémoire et le nombre d'unités de
traitement (cf. sections suivantes). Plus le pipeline est long, plus il est coûteux de
le vider et le réalimenter, c'est ce qui arrive lors de l'exécution des instructions
conditionnelles ou lors du traitement des boucles. Il se limite à une quinzaine
d'étages sur la plupart des microprocesseurs actuels (cf. Table 3.7).

Voyons à présent comment les différentes étapes de traitement des instructions
s'enchaînent.


## 3.7 Frontal : chargement et décodage

Sur le schéma de la Figure 3.11, les étapes 1 et 2 correspondent au frontal.
A partir de `cs:eip` on obtient l'adresse de la prochaine instruction à exécuter.
Cependant, certaines instructions assembleur modifient `eip` et il est nécessaire
d'utiliser un mécanisme de **prédiction de branchement**, représenté sur la figure
par **BPU** pour *Branch Prediction Unit*, afin de savoir si l'on devra lire l'instruction
suivante ou si on devra se déplacer à une autre adresse du code.

Une fois que l'on dispose de la bonne adresse, on récupère l'instruction à
exécuter dans le cache L1 d'instructions (`L1i`). Il se peut que l'instruction ne soit pas
présente dans le cache L1i, il faudra alors chercher si elle est dans le cache L2, puis
dans le cache L3 et finalement, si elle n'est présente dans aucun cache, il faudra
lancer une requête d'accès en mémoire pour récupérer les octets situés à l'adresse à
lire et les charger dans les différents caches ou dans le cache L1i uniquement.

*Figure 3.11 – Chargement et décodage*

### 3.7.1 Prédiction de branchement

Comme nous venons de le dire, le chargement d'une instruction fait appel à
plusieurs mécanismes dits de ***prédiction de branchement*** qui permettent de prédire
à quelle adresse le pointeur d'instruction (`eip`) doit se placer. Généralement il s'agit
de l'instruction suivante. Mais dans le cas de branchements, d'une boucle `for` par
exemple, il faut revenir au début de la boucle après avoir exécuté son corps ou
sortir de la boucle lorsque la condition d'arrêt est atteinte. On dit alors qu'il existe
plusieurs **chemins d'exécution**.

Considérons le code C de la Figure 3.12 qui calcule la somme des
entiers de 1 à 10. On voit sur l'organigramme de gauche qu'il existe deux chemins :
le premier est pris lorsque `i ≤ 10` et le second lorsque `i > 10`.

Le registre `eax` contient la somme des valeurs et le registre `ecx`
représente la variable de boucle (`i`).
Après l'utilisation de l'instruction `cmp ecx, 10` qui compare le registre `ecx` à la
constante 10, on place une instruction de branchement conditionnel `jg .end_for`,
qui signifie *jump on greater*.

Ces instructions de branchement conditionnel sont source de ralentissement au
sein du pipeline puisqu'il est nécessaire de le vider si le chemin d'exécution
suivi n'est pas le bon. Si `ecx` est supérieur à 10 il faut sortir de la boucle et
modifier `eip` pour qu'il pointe sur l'instruction après le label `.end_for`, c'est à
dire l'instruction *i8*. Cependant les instructions suivant la comparaison (*i5*, *i6*, *i7*)

*Figure 3.12 – Exemple de boucle for*

ont déjà été chargées dans le pipeline pendant le traitement de *i3* et *i4*. On doit
donc invalider leur traitement en vidant le pipeline et recommencer à partir de
l'instruction *i8*.

Afin d'éviter le plus possible de vider le pipeline, la prédiction de branchement,
comme son nom l'indique, permet de prédire dès lors qu'une instruction de type
branchement est présente, si le branchement sera emprunté ou non.

Notons également que les conditionnelles de type `if then` ou `if then else` à
l'intérieur d'une boucle (`for` ou `while`) sont les plus pénalisantes.

### 3.7.2 Micro-opérations (µ-ops)

Les instructions assembleur peuvent être qualifiées de **macro-instructions** car
elles définissent des traitements parfois très complexes. Au sein du microprocesseur,
ces macro-instructions sont décomposées en une série d'instructions plus simples
appelées **micro-opérations** et notées ***µ-ops***.

L'instruction `add [ebx+ecx*4+8], eax` sera décomposée en plusieurs micro-opérations :

1. *µ-op1* : calcul de l'adresse *A = ebx + ecx * 4 + 8*
2. *µ-op2* : chargement de la donnée à l'adresse mémoire *A* dans le registre *R*
3. *µ-op3* : exécution de l'addition *R + eax* et stockage dans *R*
4. *µ-op4* : stockage de *R* à l'adresse mémoire *A*

Une fois chargée dans une file d'instructions x86, la prochaine instruction à
exécuter doit être décodée en micro-instructions. Généralement, il existe un
mécanisme de cache de traduction représenté sur la figure par le ***µ-Ops Cache***.
Ce cache a pour objectif de stocker la série de micro-instructions générées par le
décodage d'une instruction x86 précédemment décodée. Si l'instruction x86 est
présente dans ce cache, on approvisionnera la file de µ-ops avec les données du
cache, sinon on utilisera le décodeur qui est le circuit dédié à la traduction d'une
instruction x86 en µ-ops.

De nos jours la partie décodage est capable de décoder plusieurs instructions à
la fois, généralement de l'ordre de 3 à 5 sur les microprocesseurs récents.



## 3.8 Dorsal : exécution des instructions

*Figure 3.13 – Traitement instruction*

### 3.8.1 Exécution dans le désordre (Out Of Order)

Au niveau du dorsal (voir Figure 3.13), c'est un ensemble de µ-ops associées à
des instructions x86 que l'on doit traiter. Afin de diminuer les temps d'attentes et ne
pas ralentir l'exécution du traitement on utilise un mécanisme d'**exécution dans le
désordre** (*Out Of Order*) qui consiste à traiter les µ-ops dès lors qu'elles disposent
de toutes les ressources nécessaires pour être traitées.

Cependant, cette exécution dans le désordre pose un problème crucial à
résoudre : faire en sorte qu'au final les instructions x86 soient traitées dans l'ordre
dans lequel elles sont entrées dans le pipeline de traitement.

Pour ce faire, on utilise deux tampons (*buffers*) appelés **Reservation Station** et
**ReOrder Buffer** notés respectivement **RS** et **ROB** :

- **ROB**, comme son nom l'indique est chargé de garder la cohérence et maintenir
  l'ordre d'exécution, il est également chargé de l'allocation de registres
- **RS** est chargé de stocker les instructions et de les garder jusqu'à ce qu'elles
  soient exécutées

L'***allocation avec renommage de registres*** est une technique essentielle pour traiter
les instructions dans le désordre. En interne le microprocesseur dispose de plusieurs
registres et lorsqu'il traite une instruction x86 il établit une correspondance entre
les registres visibles par le programmeur (`eax`, `ebx`, etc.) et ses registres internes
de manière à pouvoir traiter chaque instruction de manière indépendante.

### 3.8.2 Unités de traitement

Dès qu'une instruction est prête à être traitée au niveau de la RS elle est envoyée
à une unité de traitement dédiée. Les différentes unités sont de type entier, flottant,
vectoriel et chargement / stockage de donnée. On les qualifie respectivement d'**ALU**,
**FPU**, **VPU** et **LSU** :

- **ALU** (*Arithmetic and Logic Unit*) ou unité de traitement arithmétique et logique
  traite les opérations sur les valeurs entières et travaille avec les registres
  généraux
- **FPU** (*Floating Point Unit*) ou unité de traitement des nombres à virgule
  flottante traite les opérations sur les réels, cette unité s'appelait auparavant
  coprocesseur
- **VPU** (*Vector Processing Unit*) ou unité de traitement vectorielle s'intéresse aux
  vecteurs, ce sont les instructions de type MMX, SSE ou AVX
- **LSU** (*Load and Store Unit*) ou unité d'accès à la mémoire traite le chargement
  et le stockage des données ainsi que le calcul des adresses mémoire

Là encore, afin d'améliorer l'efficacité du traitement des instructions on a
introduit une technologie qualifiée de ***super-scalaire*** (*Superscalar*) qui consiste à
disposer de plusieurs unités de traitement de même type afin de mieux répartir
la charge de travail. On qualifie cette technique d'**amélioration en largeur** du
microprocesseur. Les instructions sont réparties (*dispatch*) sur les différentes unités
de traitement dès qu'elles sont prêtes à être exécutées.

### 3.8.3 Retrait des instructions

Après son exécution une instruction est finalement traitée par le ROB de manière
à propager son résultat dans l'ordre de traitement du flux d'instructions soumis
au microprocesseur. Il peut s'agir d'une écriture en mémoire, de la modification
de la valeur d'un registre suivie éventuellement par la mise à jour du registre
`eflags`.

### 3.8.4 Pipeline vs super-scalaire

Nous avons vu que l'utilisation d'un pipeline était qualifiée d'amélioration en
longueur et que l'amélioration en largeur consistait à avoir plusieurs unités de
traitement. On peut combiner ces deux techniques. Un pipeline trop long
ou trop court aura un effet de ralentissement. Disposer de nombreuses unités de
traitement mais les sous-utiliser affecte la rentabilité.

Une analogie pour comprendre l'interaction de ces deux techniques est celle du
***fast food***. Lorsque l'on entre dans un fast food on dispose de plusieurs files d'attentes
pour lesquelles une personne traite votre commande, va chercher les produits et prend
en compte votre règlement. Il s'agit d'un système avec de nombreuses unités de
traitement mais un pipeline court.

L'autre alternative est le ***drive*** où se trouve une longue
file de clients en voiture qui seront servis par trois personnes différentes : l'une va
prendre votre commande, la seconde s'occupe de votre règlement et la troisième
vous livre votre commande. Il s'agit d'un système avec peu d'unités de traitement
mais un long pipeline.

### 3.8.5 SMT (Simultaneous MultiThreading)

Le **Simultaneous MultiThreading** (**SMT**) est une technique qui permet le partage
d'un coeur de processeur superscalaire entre plusieurs threads dans le but d'optimiser
l'utilisation des ressources. Généralement il s'agit d'un seul autre thread, un
processeur qui possède le SMT apparaît alors comme ayant le double de coeurs de
calculs.

Cette technologie a été réintroduite sur le Pentium 4 d'Intel en 2003[^ht_note]
et a été qualifiée de technologie ***Hyper-Threading*** (**HT**). Intel évoque un gain
de 30 % par rapport à un même processeur sans HT.

[^ht_note]: Le Pentium 4 d'architecture Willamette date de Novembre 2000. C'est seulement à partir de l'architecture Northwood et pour une fréquence de 3,06 GHz que le Pentium 4 possède l'Hyper-Threading.

Pour certains traitements parallèles, utiliser 4 coeurs dotés du SMT, c'est à dire
8 threads, peut se révéler un atout. Dans d'autres cas, il sera préférable de se
cantonner à utiliser les 4 coeurs sans le SMT.

Après ce bref aperçu des technologies mises en oeuvre afin de diminuer le temps
d'exécution des instructions, nous allons nous intéresser au matériel et en découvrir
les caractéristiques.


## 3.9 Apprendre à connaître son ordinateur sous Linux

### 3.9.1 Outils graphiques et ligne de commande

Si vous utilisez **Windows** comme système d'exploitation vous trouverez de
nombreux outils professionnels pour obtenir des informations sur votre machine.
L'un des plus connus est **CPU-Z**, doté d'une interface graphique donnant de nombreux
détails sur le matériel. Il existe également **GPU-Z** pour les cartes graphiques.

Sous Linux l'offre est plus restreinte. On trouve notamment l'utilitaire graphique
**CPU-X** qui est l'équivalent de CPU-Z.

Il existe différentes manières de récupérer l'information sous Linux par l'intermédiaire
d'utilitaires en ligne de commande :

- `lshw` (*list hardware*)
- `dmidecode` : décode une table DMI (*Desktop Management Interface*)
- `lscpu` (*list cpu*)
- `cat /proc/cpuinfo` : informations sur le microprocesseur
- `lstopo` du package `hwloc`

Par exemple pour obtenir des informations sur le microprocesseur, on peut
utiliser la commande `lscpu` ou, de manière équivalente, la commande `lshw` avec
les arguments suivants :
```bash
sudo lshw -C processor
```

```text
*-cpu
   description: CPU
   produit: AMD Ryzen 5 3600 6-Core Processor
   fabricant: Advanced Micro Devices [AMD]
   identifiant matériel: 15
   information bus: cpu@0
   version: AMD Ryzen 5 3600 6-Core Processor
   numéro de série: Unknown
   emplacement: AM4
   taille: 2166MHz
   capacité: 4200MHz
   bits: 64 bits
   horloge: 100MHz
   fonctionnalités: lm fpu fpu_exception wp vme de pse tsc msr pae
   mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse
   sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp x86-64
   constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid
   aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2
   movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm
   extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs
   skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc
   mwaitx cpb cat_l3 cdp_l3 hw_pstate sme ssbd mba sev ibpb stibp
   vmmcall fsgsbase bmi1 avx2 smep bmi2 cqm rdt_a rdseed adx smap
   clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_llc
   cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr
   wbnoinvd arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean
   flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload
   vgif umip rdpid overflow_recov succor smca cpufreq
   configuration : cores=6 enabledcores=6 threads=12
```

On obtient le nom du microprocesseur, sa fréquence maximale de fonctionnement
de 4200 Mhz (`capacité`) ainsi que les différentes technologies implantées
(`fonctionnalités`) comme `avx2`, `bmi2` et `popcnt` pour celles qui nous intéresseront
par la suite. On trouve également le nombre de coeurs (`cores=6`) et le nombre de
threads (`threads=12`).

La ligne `taille` ne correspond en fait pas à une fréquence fixe et varie si on
relance la commande plusieurs fois. Il s'agit probablement de la fréquence de l'un
des coeurs.

#### 3.9.1.1 La commande inxi

Un petit utilitaire intéressant sous Linux est `inxi`. Il permet d'afficher dans
le terminal les informations principales de la configuration d'une machine. Pour
obtenir toutes les informations relatives à une machine, on peut par exemple saisir
dans le terminal :

```bash
inxi -F -c 18
```

L'option `-F` signifie *full* et l'option `-c` permet de choisir un mode de coloration.
On obtient alors le compte rendu suivant (extrait) :

```text
Host: zentopia Kernel: 5.4.0-40-generic x86_64 bits: 64
Desktop: Gnome 3.36.2 Distro: Ubuntu 20.04 LTS (Focal Fossa)
Machine:
Type: Desktop Mobo: Micro-Star model: MPG X570 GAMING EDGE WIFI (MS-7C37)
v: 1.0 serial: <superuser/root required> UEFI: American Megatrends v: 1.50
date: 10/29/2019
CPU:
Topology: 6-Core model: AMD Ryzen 5 3600 bits: 64 type: MT MCP
L2 cache: 3072 KiB
Speed: 2200 MHz min/max: 2200/3600 MHz Core speeds (MHz): 1: 2209 2: 2200
3: 2200 4: 2199 5: 2200 6: 2199 7: 2200 8: 2198 9: 2199 10: 2200 11: 2199
12: 2200
Graphics:
Device-1: NVIDIA GP104 [GeForce GTX 1070] driver: nvidia v: 440.100
...
```

Pour utiliser `lstopo` il faut installer le paquet `hwloc` sous Ubuntu :

```bash
sudo apt install hwloc
```

On utilise ensuite la commande `lstopo` ou `lstopo-no-graphics` comme suit :

```bash
lstopo
lstopo --no-io file.png
lstopo-no-graphics -.ascii --no-io
```

La première commande (ligne 1) ouvre une fenêtre qui donne la topologie du
processeur (Figure 3.14) avec les informations des coeurs, l'organisation des caches.
Cette dernière partie peut être supprimée en utilisant l'option `--no-io` (ligne 2).
Enfin, la ligne 3 affiche les informations au format ASCII dans un terminal.

Sur la Figure 3.14 avec le AMD Ryzen 7 1700X, on voit clairement comment sont
répartis et numérotés les coeurs ainsi que la taille et la répartition des mémoires
caches. Ce processeur d'architecture *Summit Ridge* est décrit comme possédant 8
coeurs, 16 threads et est doté de 4 Mo de cache L2 ainsi que 16 Mo de cache L3.
Cependant, sur la figure, on voit que le cache L3 est scindé en deux fois 8 Mo
chacun associé à 4 coeurs SMT, ce qui fait 8 Mo pour 8 threads. Chaque groupe
de 2 threads dispose de 512 ko de cache L2, 64 ko de cache L1i et 32 ko de cache L1d.

*Figure 3.14 – Résultat de la commande lstopo sur AMD Ryzen 7 1700X*

Ce schéma indique également la numérotation des threads (`P#0` à `P#15` sur fond gris) :

- Les coeurs ont un numéro d'identification pair (`P#0`, `P#2` à `P#14`)
- Les coeurs SMT ont des numéros impairs (`P#1`, `P#3` à `P#15`)

Quant à la mémoire cache, on peut obtenir beaucoup d'informations en listant
le contenu du répertoire :

```bash
ls /sys/devices/system/cpu/cpu0/cache/index*
```

Chaque `index` correspond à un cache, l'index 0 est le cache L1 de données, l'index 1
est le cache L1 d'instructions, l'index 2 est le cache L2 et l'index 3 correspond
au cache L3. Voici un petit script bash qui permet d'afficher ces informations :

```bash
#!/bin/sh
input_dir="/sys/devices/system/cpu/cpu0/cache"
levels=`ls -d ${input_dir}/index[0-9]`
levels=`echo $levels | tr ' ' '\n' | wc -l`
level=0
while [ $level -lt $levels ] ; do
  size=`cat ${input_dir}/index${level}/size | awk '{ printf("%6s",$1);}'`
  type=`cat ${input_dir}/index${level}/type | awk '{ printf("%12s",$1);}'`
  levl=`cat ${input_dir}/index${level}/level`
  assc=`cat ${input_dir}/index${level}/ways_of_associativity`
  lnsz=`cat ${input_dir}/index${level}/coherency_line_size`
  echo "L$levl $type $size ${assc}-way-set-associative ${lnsz} bytes"
  level=`expr $level + 1`
done
```

On peut également utiliser la commande `sudo lshw -short -C memory`.


### 3.9.2 Informations sur la carte mère (dmidecode)

Le framework logiciel **DMI** pour *Desktop Management Interface* fournit un standard
afin de gérer et de suivre les modifications de composants sur un ordinateur.
L'utilitaire `dmidecode` permet de lire les informations DMI de l'ordinateur et de les
afficher dans un format texte compréhensible par un humain.

Pour obtenir des informations sur la carte mère, on peut utiliser la commande
suivante :

```bash
sudo dmidecode -t baseboard
```

```text
# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 2.8 present.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
   Manufacturer: Micro-Star International Co., Ltd.
   Product Name: MPG X570 GAMING EDGE WIFI (MS-7C37)
   Version: 1.0
   Serial Number: J816453611
   Asset Tag: To be filled by O.E.M.
   Features:
      Board is a hosting board
      Board is replaceable
   Location In Chassis: To be filled by O.E.M.
   Chassis Handle: 0x0003
   Type: Motherboard
   Contained Object Handles: 0

Handle 0x0039, DMI type 41, 11 bytes
Onboard Device
   Reference Designation: RTL8111EPV
   Type: Ethernet
   Status: Disabled
   Type Instance: 1
   Bus Address: 0000:03:00.0
```

Ici, il s'agit d'une carte MSI X570 GAMING EDGE WIFI.

### 3.9.3 Informations sur la mémoire (dmidecode)

De la même manière, pour obtenir des informations concernant le sous-système
mémoire, il suffit d'utiliser `dmidecode` :

```bash
sudo dmidecode -t memory
```

```text
# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 2.8 present.

Handle 0x000F, DMI type 16, 23 bytes
Physical Memory Array
   Location: System Board Or Motherboard
   Use: System Memory
   Error Correction Type: None
   Maximum Capacity: 128 GB
   Error Information Handle: 0x000E
   Number Of Devices: 4

Handle 0x0017, DMI type 17, 40 bytes
Memory Device
   Array Handle: 0x000F
   Error Information Handle: 0x0016
   Total Width: 64 bits
   Data Width: 64 bits
   Size: 8192 MB
   Form Factor: DIMM
   Set: None
   Locator: DIMM 0
   Bank Locator: P0 CHANNEL A
   Type: DDR4
   Type Detail: Synchronous Unbuffered (Unregistered)
   Speed: 3200 MT/s
   Manufacturer: Unknown
   Serial Number: 00000000
   Asset Tag: Not Specified
   Part Number: F4-3200C16-8GVKB
   Rank: 1
   Configured Memory Speed: 3200 MT/s
   Minimum Voltage: 1.2 V
   Maximum Voltage: 1.2 V
   Configured Voltage: 1.2 V
   ...
```

On voit que la carte mère possède quatre slots de connexion (*Number Of Devices*),
on peut donc positionner quatre barrettes de mémoires mais il ne faut pas dépasser
128 Go (*Maximum Capacity*), soit par exemple quatre barrettes de 32 Go. Le premier
slot mémoire DIMM0 est occupé par une barrette de 8 Go de PC-3200 (`F4-3200C16-8GVKB`).

On peut également utiliser la commande `lshw` pour obtenir un sommaire des
différentes mémoires :

```bash
sudo lshw -short -C memory
```

```text
Chemin ...          Classe   Description
=====================================================================
/0/0               memory   64KiB BIOS
/0/f               memory   32GiB Mémoire Système
/0/f/0             memory   8GiB DIMM DDR4 Synchrone Unbuffered (Unregistered)
/0/f/1             memory   8GiB DIMM DDR4 Synchrone Unbuffered (Unregistered)
/0/f/2             memory   8GiB DIMM DDR4 Synchrone Unbuffered (Unregistered)
/0/f/3             memory   8GiB DIMM DDR4 Synchrone Unbuffered (Unregistered)
/0/12              memory   384KiB L1 cache
/0/13              memory   3MiB L2 cache
/0/14              memory   32MiB L3 cache
```

On voit ici que la mémoire centrale possède une taille de 32 Go organisée en 4
fois 8 Go. Les mémoires cache de niveau L1 font 32 ko, le cache L2 possède
une taille de 512 ko et le cache L3 fait 32 Mo (2×16 Mo).

Nous avons évoqué la présence d'informations liées aux timings mémoires (Section 3.2).
On peut obtenir ces informations en installant `i2c-tools` :

```bash
sudo apt install i2c-tools
sudo modprobe eeprom
decode-dimms
```

On obtient entre autres informations :

```text
EEPROM CRC of bytes 128-253 OK (0xA01C)

---=== Memory Characteristics ===---
Maximum module speed 2132 MHz (PC4-17000)
Size 8192 MB
Banks x Rows x Columns x Bits 16 x 16 x 10 x 64
SDRAM Device Width 8 bits
Ranks 1
AA-RCD-RP-RAS (cycles) 15-15-15-36
Supported CAS Latencies 16T, 15T, 14T, 13T, 12T, 11T, 10T

---=== Timings at Standard Speeds ===---
AA-RCD-RP-RAS (cycles) as DDR4-1866 13-13-13-31
AA-RCD-RP-RAS (cycles) as DDR4-1600 11-11-11-27

---=== Timing Parameters ===---
Minimum Cycle Time (tCKmin) 0.938 ns
Maximum Cycle Time (tCKmax) 1.600 ns
Minimum CAS Latency Time (tAA) 13.750 ns
Minimum RAS to CAS Delay (tRCD) 13.750 ns
Minimum Row Precharge Delay (tRP) 13.750 ns
Minimum Active to Precharge Delay (tRAS) 33.000 ns
Minimum Active to Auto-Refresh Delay (tRC) 46.750 ns
Minimum Recovery Delay (tRFC1) 350.000 ns
Minimum Recovery Delay (tRFC2) 260.000 ns
Minimum Recovery Delay (tRFC4) 160.000 ns
Minimum Four Activate Window Delay (tFAW) 21.000 ns
Minimum Row Active to Row Active Delay (tRRD_S) 3.700 ns
Minimum Row Active to Row Active Delay (tRRD_L) 5.300 ns
Minimum CAS to CAS Delay (tCCD_L) 5.625 ns
Minimum Write Recovery Time (tWR) 15.000 ns
Minimum Write to Read Time (tWTR_S) 2.500 ns
Minimum Write to Read Time (tWTR_L) 7.500 ns

---=== Other Information ===---
Package Type Monolithic
Maximum Activate Count Unlimited
Post Package Repair One row per bank group
Soft PPR Supported
Module Nominal Voltage 1.2 V
Thermal Sensor No

---=== Physical Characteristics ===---
Module Height 32 mm
Module Thickness 2 mm front, 2 mm back
Module Reference Card A revision 1

---=== Manufacturer Data ===---
Module Manufacturer Undefined
Part Number Undefined
...
```

Malheureusement, on n'obtient pas toutes les informations, comme par exemple
le fabricant (*Module Manufacturer*).

Il s'agit ici de barrettes de DDR4-SDRAM au format UDIMM, PC4-17000 de 8
Go qui possède plusieurs fréquences de fonctionnement.

### 3.9.4 CPU-X

On dispose à présent d'un outil appelé **CPU-X** qui est l'équivalent de **CPU-Z**.
Sur le site du logiciel on trouvera des packages pour Linux pour Debian, OpenSUSE
et Ubuntu (voir Figure 3.15).

Pour installer CPU-X, il suffit de télécharger l'archive correspondant à Ubuntu
sur le site du logiciel, puis de lancer les commandes suivantes :

```bash
mkdir install
cd install
mv ~/Téléchargements/CPU-X_v4.0.1_Ubuntu.tar.gz .
tar -xzf CPU-X_v4.0.1_Ubuntu.tar.gz
cd xUbuntu_20.04
sudo dpkg -i libcpuid15_0.5.0_amd64.deb cpuidtool_0.5.0_amd64.deb cpu-x_4.0.1_amd64.deb
cpu-x
```

On peut également obtenir l'information dans le terminal en utilisant l'option
en ligne de commande `--ncurses` :

```bash
cpu-x --ncurses
```

*Figure 3.15 – Interface de CPU-X*

## 3.10 Benchmarks

### 3.10.1 Phoronix Test Suite

**Phoronix** est un logiciel qui permet d'installer et exécuter une série de ***benchmarks***
assez fournie.

```bash
sudo apt-get install phoronix-test-suite
phoronix-test-suite list-available-tests
```

La première commande installe le logiciel Phoronix et la seconde donne la liste
des tests disponibles. Il en existe plus de 300. On peut ensuite
installer les tests qui nous intéressent comme celui des *n-reines* :

```bash
phoronix-test-suite install n-queens
phoronix-test-suite run n-queens
```

Le programme demande un identifiant pour le test à réaliser qui pourra être
utilisé par la suite pour afficher les résultats :

```bash
phoronix-test-suite info n-queens-results
phoronix-test-suite result-file-to-csv n-queens-results
```

```text
...
"N-Queens - Elapsed Time",16.13
```

### 3.10.2 sysbench

```bash
sudo apt-get install sysbench
```

Pour tester le CPU, on exécute le test adéquat qui calcule des décimales de π :

```bash
sysbench cpu --cpu-max-prime=20000 run
```

```text
sysbench 1.0.11 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
...
CPU speed:
   events per second: 182.73

General statistics:
   total time: 10.0016s
   total number of events: 1828

Latency (ms):
   min: 5.37   avg: 5.47   max: 10.31   95th: 5.99   sum: 9997.81

Threads fairness:
   events (avg/stddev): 1828.0000/0.00
   execution time (avg/stddev): 9.9978/0.00
```

Pour tester la mémoire :

```bash
sysbench memory --memory-block-size=256K run
```

```text
...
Running memory speed test with the following options:
  block size: 256KiB
  total size: 102400MiB
  operation: write
  scope: global

Initializing worker threads...
Threads started!

Total operations: 199824 (19977.75 per second)
2149956.00 MiB transferred (4994.44 MiB/sec)

General statistics:
   total time:  10.0002s
   total number of events: 199824

Latency (ms):
   min: 0.05   avg: 0.05   max: 5.53   95th: 0.05   sum: 9875.07

Threads fairness:
   events (avg/stddev): 199824.0000/0.00
   execution time (avg/stddev): 9.8751/0.00
```

### 3.10.3 Geekbench

**Geekbench** est une suite de test disponible pour Windows, Linux et macOS qui
permet d'évaluer la puissance de calcul du microprocesseur en mono-core et
multi-core. La version 4 se réfère à un Intel Core i7-6600U à 2,6 GHz et
la version 5 à un Intel Core i3-8100.

| Microprocesseur | SC 32 bits | MP 32 bits | SC 64 bits | MC 64 bits |
|---|---|---|---|---|
| Intel i5-7400 | 4106 | 11252 | | |
| Intel i7 8700 | 5153 | 22744 | | |
| AMD Ryzen 7 1700X | 4029 | 25046 | 4507 | 27207 |
| AMD Ryzen 5 5600g | 5627 | 30348 | 6677 | 34098 |
| Intel i7 10850H | 5705 | 26103 | 6443 | 28378 |

*TABLE 3.8 – Résultats GeekBench 4.x.x en 32 et 64 bits SC (mono core) et MC (multi core)*

| Microprocesseur | SC 64 bits | MC 64 bits |
|---|---|---|
| Intel i5-7400 | 990 | 3200 |
| Intel i3-6100 | 1014 | 2269 |
| Intel i7 8700 | 1230 | 6448 |
| AMD Ryzen 7 1700X | 967 | 6261 |
| AMD Ryzen 5 3600 | 1333 | 7705 |
| AMD Ryzen 5 5600g | 1493 | 8313 |
| Intel i7 10850H | 1367 | 6923 |

*TABLE 3.9 – Résultats GeekBench 5 en 64 bits SC (mono core) et MC (multi core)*

Les tests sont liés au calcul sur les entiers, calculs sur les réels, la cryptographie
et l'accès mémoire. Pour exécuter les tests il suffit de récupérer une archive sur le
site Geekbench, de la décompresser et lancer les deux programmes de tests :

```bash
tar -xvzf ~/Downloads/Geekbench-4.3.4-Linux.tar.gz
cd Geekbench-4.3.4-Linux
./geekbench4_x86_32
./geekbench4_x86_64
```

Après exécution des tests un lien vers le web est fourni qui permet d'obtenir le
détail des résultats.

## 3.11 Comparaison Core i5-7400 et Core i3-6100

A titre d'exercice, nous allons comparer deux microprocesseurs de la famille
Intel. Le premier est un **Core i3-6100** et le second un **Core i5-7400**.

Sur le papier, le Core i5 est plus performant que le Core i3 pour plusieurs raisons :

- C'est un Core i5 qui dispose de plus de mémoire cache et plus de coeurs qu'un Core i3
- Le Core i5 est de génération plus récente (7XXX) que le Core i3 (6XXX)
- Les trois derniers chiffres de 7400 sont un indicateur de fréquence, donc
  normalement le Core i5 devrait avoir une fréquence de fonctionnement supérieure

En pratique, il faut aller sur le site [ark.intel.com](https://ark.intel.com) pour
obtenir les informations de ces deux microprocesseurs.

| Processeur | Core i5-7400 | Core i3-6100 |
|---|---|---|
| Génération | 7 / Kaby Lake | 6 / Skylake |
| Date de lancement | Q1'2017 | Q3'2015 |
| Finesse de gravure (nm) | 14 | 14 |
| Prix (dollars) | 182 | 117 |
| Coeurs/Threads | 4/4 | 2/4 |
| Cache L3 (Mo) | 6 | 3 |
| Fréquence de base (GHz) | 3,00 | 3,70 |
| Fréquence turbo (GHz) | 3,50 | 3,70 |
| Technologie vectorielle | AVX2 | AVX2 |

*TABLE 3.10 – Caractéristiques des Core i5-7400 et Core i3-6100*

Nous voyons donc que le Core i5 comprend quatre coeurs et 6 Mo de cache L3
alors que le Core i3 comprend deux coeurs dotés de l'HyperThreading et moitié
moins de cache L3.

Cependant, un détail change beaucoup de choses : la fréquence de
fonctionnement plafonne à 3,5 GHz pour le Core i5 alors que le Core i3 fonctionne
avec 200 MHz de plus.

Il en résulte que pour les programmes monothreads c'est le Core i3 qui sera
généralement le plus performant, alors que le Core i5 prendra l'avantage sur les
programmes multithreads ou pour lesquels l'accès à la mémoire cache est important.

*Figure 3.16 – Comparaison des architectures Intel Core i3 6100 et i5 7400*

Par exemple, pour les tests 3 à 7, la fréquence du CPU est un facteur déterminant,
le Core i3 sera donc plus performant que le Core i5. Cependant, pour le test 4 le
Core i5 sort grand gagnant car le traitement des instructions AVX a probablement
été amélioré sur le Core i5.

| Test N° | Description | Core i5-7400 | Core i3-6100 |
|---|---|---|---|
| 1 | Produit de matrices 2048×2048 | 50,35 | 61,84 |
| 2 | Produit de matrices 2060×2060 | 36,83 | 34,40 |
| 3 | SAXPY 524417 FPU | 45,20 | 43,52 |
| 4 | SAXPY 524417 AVX | 10,00 | 14,43 |
| 5 | Popcnt 512333 réf. | 8,05 | 7,54 |
| 6 | Compte Voyelles 524288 (if) | 15,50 | 14,47 |
| 7 | Compte Voyelles 524288 AVX | 0,85 | 0,79 |

*TABLE 3.11 – Temps d'exécution en secondes de certaines études de cas pour Core i5-7400 et Core i3-6100*

## 3.12 Bilan

Pour résumer ce que nous avons appris dans ce chapitre :

- La mémoire possède une influence non négligeable lors de certains traitements
  et notamment le fait que les données à traiter soient présentes ou absentes
  dans la mémoire cache
- L'**alignement mémoire**, c'est à dire le fait que les données soient positionnées
  en mémoire à des adresses multiples de 8, 16 ou 32 peut influer sur la durée
  de leur traitement
- Les améliorations liées aux microprocesseurs tentent de maximiser le nombre
  de traitements que l'on peut réaliser en parallèle que ce soit au niveau du
  décodage ou du traitement des instructions (**pipeline**, **super-scalaire**) ou au
  niveau des données (**vectoriel**) ou des threads (**SMT**)
- Les instructions si elles sont traitées dans l'ordre où elles arrivent depuis
  l'extérieur du microprocesseur sont en fait exécutées dans un mode dit dans
  le désordre (Out Of Order) au sein du microprocesseur, ceci afin d'augmenter
  l'efficacité de leur traitement

### 3.12.2 Objectifs

A l'issue de ce chapitre, vous devez :

- Être en mesure d'obtenir les informations concernant un microprocesseur
  (architecture, taille des mémoires cache, technologies disponibles)
- Être en mesure de comparer plusieurs microprocesseurs

## 3.13 Résumé

Ce chapitre a passé en revue le fonctionnement du microprocesseur moderne, depuis
la mémoire jusqu'au pipeline d'instructions et aux techniques d'exécution parallèle.

## 3.14 Exercices

**Exercice 18** – Quelle est la bande passante :

1. …
2. …
3. …

**Exercice 19** – Quelle est la fréquence de fonctionnement :

1. …
2. …
3. …
4. …

**Exercice 20** – Comparer l'Intel i9-10900K avec l'Intel i9-10850K. En novembre
2020, le 10850K peut être trouvé au prix de 506€, alors que le 10900K coûte
environ 600€. En général le 10850K coûte entre 50 et 150€ de moins que le
10900K.
