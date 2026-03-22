# Chapitre 10 : Etudesdecas

## 10.1 Avant d’aborder les différentes études de cas dont le but est de traiter les

points cruciaux que nous avons évoqués, nous allons détailler dans ce chapitre les
caractéristiques communes à chacune de ces études de cas que nous qualifions
également de projets car il s’agit en fait de projets de programmation.
J’ai tenté d’établir une sorte de squelette de projet en utilisant la même organi-
sation des répertoires ainsi que les mêmes scripts shell et PHP. Les diverses actions
(compilation, exécution des tests de performance, ...) sont automatisées au moyen
de l’utilitairemakeainsi que dumakefileassocié.
Chaque projet est conçu autour d’un ensemble d’implantations, appelées mé-
thodes, d’un traitement informatique. L’une de ces méthodes est un sous-programme
dit de référence qui nous permet de vérifier que les autres méthodes sont correctes
et produisent le même résultat. Chaque nouvelle méthode tente d’apporter une
amélioration par rapport à la méthode de référence en
•
utilisant une réécriture du code C (dépliage, élimination desif, vectorisation
parintrinsics)
•
ou en codant la fonction C en assembleur (dépliage, élimination desif,
vectorisation)

## 10.2 Les sous-répertoires de chaque projet sont les suivants :

•
le sous-répertoirecfgcontient des fichiers de configuration utiles à la compi-
lation
•
le sous-répertoiresrccontient le code source, c’est à dire les fichiers C/C
++et
les fichiers assembleur
•le sous-répertoirebuildcontient les fichiers générés lors de la compilation
•build/objcontient les fichiers objets (.o)
•build/bincontient les exécutables (.exe)
•
le sous-répertoireresultscontient les fichiers de données et graphiques
générés lors de l’exécution des tests de validité et de performance, on trouve
un répertoire par processeur
•
le sous-répertoireoutputcontient les fichiers générés par le scripttable.php
qui permet de générer des tableaux de donnée à partir des résultats obtenus
L’arborescence est donc la suivante :
.
build
bin
obj
cfg
output
results
Intel-Celeron-CPU-N3050-1_60GHz
src
Dans le répertoire principal on trouvera un fichierREADMEainsi qu’un fichier
INSTALL. Le but du fichierREADMEest de renseigner l’utilisateur sur l’objectif du
projet ainsi que de lui donner un accès rapide aux fonctionnalités de base du projet.
Le fichierINSTALL, quant à lui, décrit comment installer le projet, en d’autres
termes, comment le compiler et quels programmes annexes doivent être installés.
Le choix a été fait de rédiger l’ensemble des sources en anglais ainsi que les
fichiersREADMEetINSTALLde manière à ce qu’ils puissent être utilisés, voire modifiés
par un large public. L’ensemble des fichiers est sous Licence GNU.

### 10.2.1 On considère que le lecteur possède des connaissances de base liées à la création

d’un makefile. Les différentes cibles (targets) de make sont les suivantes :
•configureappelle le scriptcpu_technos.sh(cf. ci-après)
•build
permet de générer les exécutables au formatreleasec’est à dire avec
les options de compilations sensées générer du code performant; on obtient
le même résultat en lançantmakesans arguments
•debug
génére les exécutables en incluant les informations nécessaires au
débogage
•cleansupprime les fichiers objets et les exécutables
•validity
exécute les tests de validité afin de vérifier que les fonctions donnent
le même résultat pour un test de base
•performance
exécute les tests de performance ce qui permet de déterminer
quelle fonction est la meilleure
•archivegénére une archive de l’ensemble des fichiers du projet

### 10.2.2 On dispose dans le répertoire du projet d’un ensemble de scripts :

•cpu_name.sh
récupère le nom du microprocesseur en éliminant certains ca-
ractères inutiles, en remplaçant les espaces par le signe moins (’-’), cet
identifiant est ensuite utilisé pour créer un sous-répertoire dans le répertoire
resultsafin de stocker les résultats spécifiques au microprocesseur
•cpu_technos.sh
détermine quelles technologies (SSE2, SSE4.1, SSE4.2, AVX2,
POPCNT, BMI, FMA) sont implantées au niveau du microprocesseur afin
de savoir si on peut utiliser leurs jeux d’instructions. Ce script génère en
conséquence les fichierssrc/asm_config.inc,src/cpp_config.incainsi que
cpu_technos.mak
•validity_test.php
réalise un test de validité en vérifiant pour différents
paramètres que les méthodes donnent le même résultat que la fonction de
référence
•performance_test.php
réalise un test de performance afin de déterminer
pour différents paramètres quelle est la méthode la plus efficace puis appelle
le scriptperformance_graph.phpafin de générer un graphique des données
obtenues en utilisantgnuplot
•table.php
, comme indiqué précédemment, ce script permet de générer dans
le sous-répertoireoutputdes tableaux de données au format CSV (Comma
Separated Values), HTML ou LaTeX
Cette liste est non exhaustive, on trouvera également en fonction de l’angle
d’attaque de l’étude de cas des scripts spécifiques. Par exemple, dans le cas du
produit de matrices nous avons ajouté un script nommésamples_test.phpqui
génère les temps d’exécution du produit de la méthode de référence pour différentes
dimensions de la matrice afin de démontrer que la méthode de référence est sensible
à la dimension.

### 10.2.3 Dans le répertoire des fichiers sources, on trouve un fichiercommon.hqui contient

les définitions de types, constantes et fonctions communes à l’ensemble des sources.
On trouvera également les fichierscpp_config.hetasm_config.inc, générés par le
scriptcpu_technos.sh, qui définissent des macro instructions liées aux différentes
technologies implantées au sein du microprocesseur. Ainsi, si le microprocesseur
possède la technologie SSE 4.2 on définit la macroCPU_SSE42_COMPLIANT. Ces
macro instructions peuvent être utilisées par la suite pour inclure le code d’une
méthode utilisant le jeu d’instructions SSE 4.2.
J’utilise égalementcpu_timer.hetcpu_timer.cppqui définissent la classe
CPUTimerqui est un chronomètre basé sur l’instructionrdtsc(ReaD TimeStamp
Counter) afin de lire le nombre de cycles d’horloge du processeur et calculer par
différence le nombre de cycles utilisés lors de l’exécution de chaque méthode.
La classeSignalHandlera été implantée et elle est chargée d’intercepter la
plupart des exceptions levées par la commandesignalcomme par exemple SIGFPE
(cf. fichierssignal_handler.hetsignal_handler.cpp). Pour utiliser cette classe et
intercepter différents signaux il suffit de déclarer une instance de la classe au tout
début de la méthodemaindans le fichiersrc/main.cpp:
1int (int ,char*argv[])
2 SignalHandler ;
3 ...
4}
Le fichiersrc/main.cppqui contient le programme principal se base surgetopt
afin de gérer les options en ligne de commande du programme. Parmi les options
communes à tous les projets on trouve :
•-hou–helppour obtenir l’aide du programme exécutable
•-lou–listdonne la liste des méthodes
•-t
ou–testréalise un test de l’ensemble des méthodes et indique si une
méthode produit un résultat différent de celui de la méthode de référence
•-m
ou–methodpermet de choisir la méthode à tester en donnant son identifiant
entier, la méthode de référence ayant pour valeur 1
•-nou–namepermet de sélectionner une méthode en précisant son nom
•-v
ou–verboseintroduit le mode verbeux, c’est à dire que l’on affichera des
informations supplémentaires lors de l’exécution
Le reste des fichiers contient le code source des différentes implantations de la
fonction de référence.

## 10.3 Afin de simplifier l’écriture du code et sa compréhension, j’ai pris pour habitude

de redéfinir les types utilisés (fichiersrc/common.h). Ainsi plutôt que d’utiliser
unsigned int,size_touuint32_tpour définir un type entier non signé, j’utilise
u32pourUnsigned32 bits. De la même manière, le typefloatdu langage C est
renommé enf32:
1typedef ;
2typedef ;
3typedef ;
4typedef ;
5typedef ;
10.4

### 10.4.1 L’ensemble des méthodes que nous allons implanter seront testées sur différents

matériels afin d’étudier l’influence de telle réécriture, de telle technologie par rap-
port à une autre, ou l’influence de la taille des caches. La liste des microprocesseurs
utilisés figure Tables,,. Nous avons séparé les matériels en trois
catégories :
•les processeurs produits avant 2015, qualifiés d’architectures anciennes,
•ceux produits entre 2015 et 2019, qualifiés d’architectures modernes
•et ceux produits en 2020 et après, qualifiés d’architectures récentes
Il s’agit ici d’ordinateurs personnels ainsi que d’ordinateurs disponibles à l’Uni-
versité d’Angers dotés de microprocesseurs comme l’Intel i7 8700 ou l’Intel Xeon
Silver 4208 qui dispose du jeu d’instructions AVX512.
Marque Intel Intel Intel AMD Intel Intel
Modèle Pentium DCore 2Core i7Phenom IICore i5Core i7
Sous-modèle 925 Q9300 860 1090 T i5 3570k4790
Année 2006 2008 2009 2010 2012 2014
Architecture Presler Yorkfield Lynnfield Thuban Ivy Bridge Haswell
Lithographie (nm) 65 45 45 45 22 22
Fréquence de base (GHz) 3000 2500 2800 3200 3400 3600
Fréquence de boost (GHz) 3000 2500 3460 3600 3800 4000
Cores 2 4 4 6 4 4
Threads 2 4 8 6 4 8
Cache L1i (ko) 12 32 32 64 32 32
Cache L1d (ko) 16 32 32 64 32 32
Cache L2 (ko) 1024 3072 256 512 256 256
Cache L3 (Mo) − − 8 6 6 8
TABLE10.1 – Caractéristiques des matériels : architectures anciennes (avant 2015)
Nous donnons pour chaque microprocesseur les informations suivantes :
•la marque du microprocesseur (Intel ou AMD)
•le modèle, par exemple Core 2
•le sous-modèle, par exemple Q9300
•l’année de production
•le nom de l’architecture du microprocesseur
•la finesse de gravure (Lithographie) en nanomètres
•la fréquence de base en GHz ainsi que la fréquence maximale (boost)
•le nombre de coeurs et de threads
•les tailles des différents caches
Marque IntelAMD Intel Intel AMD Intel
Modèle Core i3Ryzen 7Core i5 Core i7Ryzen 5 Xeon
Sous-modèle 6100 1700X 7400 8700 3600 4208
Année 2015 2017 2017 2017 2019 2019
Architecture Skylake Zen Kaby Lake Coffee Lake Zen 2 Cascade Lake
Lithographie (nm) 14 14 14 14 7 14
Fréquence de base (GHz) 3700 3400 3000 3200 3600 2100
Fréquence de boost (GHz) 3700 3800 3500 4600 4200 3200
Cores 2 8 4 6 6 8
Threads 4 16 4 12 12 16
Cache L1i (ko) 32 64 32 32 32 32
Cache L1d (ko) 32 32 32 32 32 32
Cache L2 (ko) 256 512 256 256 512 1024
Cache L3 (Mo) 3 8+8 6 12 16+16 11
TABLE10.2 – Caractéristiques des matériels : architectures modernes (2015 à 2019)
L’AMD Ryzen 5 9600X dispose des technologies AVX512 et FMA3 et utilise
également 32 Go de DDR5 Kingston (KF560C30-16) FURY Beast 6000 Mhz 30 CL.

### 10.4.2 Nous avons défini deux types de tests principaux :

•
le test devaliditéqui comme indiqué précédemment vérifie que l’ensemble
des méthodes implantées produisent le même résultat et assure ainsi qu’une
méthode très rapide ne l’est pas parce qu’elle est boguée
•
le test deperformancequi en faisant varier certains paramètres (dimension
des matrices, taille des vecteurs) évalue le temps d’exécution de chacune des
méthodes afin de générer par la suite un graphique qui permet de déterminer
visuellement quelles méthodes sont les plus performantes
Pour évaluer le temps d’exécution d’une méthode deux facteurs sont à prendre
en compte :
Marque Intel AMD Intel AMD
Modèle Core i7Ryzen 5Core i5 Ryzen 5
Sous-modèle 10850H 5600g 12400F 9600X
Année 2020 2021 2022 2024
Architecture Comet Lake Zen3 Alder Lake Granite Ridge
Lithographie (nm) 14 7 Intel 7 TSMC N4
Fréquence de base (GHz) 2700 3900 2500 3900
Fréquence de boost (GHz) 5100 4400 4400 5400
Cores 6 6 6 6
Threads 12 12 12 12
Cache L1i (ko) 32 32 32 32
Cache L1d (ko) 32 32 48 48
Cache L2 (ko) 256 512 1280 1024
Cache L3 (Mo) 12 16 18 32
TABLE10.3 – Caractéristiques des matériels : architectures récentes (2020 et suivantes)
•le premier concerne ce que l’on mesure
•le second tient à la manière dont on mesure

#### 10.4.2.1 Nous reportons deux mesures lors des tests : le temps d’exécution du programme

ainsi que le nombre de cycles de l’exécution d’une méthode. Mais c’est le temps
d’exécution du programme qui est utilisé pour générer les graphiques des tests de
performance et comparer l’efficacité de chaque fonction.
Pour obtenir le temps d’exécution du programme nous utilisons la commande
/usr/bin/timequi est différente de la commandetimede la plupart des shells.
Notamment elle permet de spécifier un format d’affichage grâce à l’option-f. Nous
reportons leuser time. Le nombre de cycles lié à l’exécution d’une méthode est
obtenu grâce à la classeCPUTimeret ne prend donc pas en compte l’allocation des
données et leur initialisation.

#### 10.4.2.2 Pour les méthodes qui s’exécutent en quelques millisecondes se pose un réel

problème d’évaluation car les temps d’exécution peuvent parfois varier de ma-
nière importante entre deux exécutions successives. Cela tient à différents facteurs
comme la variation des fréquences qui dépend du nombre de processus qui tournent
en parallèle par exemple. Nous avons vu, Section
tionnement est maximale si le microprocesseur est sollicité par un seul processus
mais qu’elle diminue si plusieurs processus sont actifs. Il est donc préférable lorsque
l’on réalise les tests de performance de ne pas utiliser souris et clavier et éviter tout
traitement en tâche de fond qui viendrait perturber les résultats.
Afin d’obtenir une valeur proche de la réalité il est nécessaire de réaliser
plusieurs exécutions (une dizaine est généralement suffisante) et de calculer la
moyenne des temps d’exécution. Nous avons conçu une petite librairie PHP appelée
ezlib.php(lire easy lib) qui comprend notamment une méthodeaverage_time()
qui calcule la moyenne des temps d’exécution pour dix exécutions d’une même
commande.
Nous attirons l’attention du lecteur sur le fait notable suivant : sur les dernières
versions d’Ubuntu, nous avons pu observé que la fréquence de fonctionnement
du processeur est très en dessous de sa valeur maximale. Ce qui donne, lors de
l’exécution des tests sur une machine qui vient d’être mise en route, des temps de
calculs bien supérieurs à ce qu’ils devraient être. Il peut donc être nécessaire de
forcer le système d’exploitation à passer en modeperformancegrâce à l’utilisation
des commandes suivantes :
sudo apt-get install cpufrequtils
2echo'GOVERNOR="performance"'| sudo tee /etc/default/cpufrequtils
3sudo systemctl disable ondemand

### 10.4.3 Le chapitre 2 contient deux tests, le premier concerne l’utilisation de l’instruction

assembleurbsrou son remplacement sous forme de fonction (cf. Section). Le
second concerne le calcul des nombres premiers (cf. Section). Les résultats de
ces tests figurents Tables,,.
Marque Intel Intel Intel AMD Intel Intel
Modèle Pentium DCore 2Core i7Phenom IICore i5Core i7
Sous-modèle 925 Q9300 860 1090 Ti5 3570k4790
bsr (fonction C) 29,23 25,70 15,47 17,90 15,79 13,48
bsr (__builtin_clz) 3,39 1,80 1,52 1,81 1,20 0,55
bsr (asm +bsr) 1,78 1,33 0,67 1,70 0,60 0,42
Premier (v1) 7154,93 3003,00 3513,00 6214,00 1327,00 1163,00
Premier (v2) 0,64 0,18 0,28 0,44 0,13 0,08
Crible (v3) 0,02 0,01 0,01 0,02 0,01 0,00
TABLE10.4 – Tests des matériels anciens
Bien évidemment, on note une diminution du temps de calcul à mesure que
l’année de production du microprocesseur devient plus récente.
Marque Intel AMD IntelIntelAMD Intel
Modèle Core i3Ryzen 7Core i5Core i7Ryzen 5Xeon
Sous-modèle 6100 1700X 7400 8700 3600 4208
bsr (fonction C) 13.56 10.52 14.42 10.40 9.44 16.43
bsr (__builtin_clz) 0.63 0.49 0.61 0.46 0.45 0.21
bsr (asm +bsr) 0.47 1.04 0.44 0.33 0.96 0.51
Premier (v1) 1082.25 1859.59 1154.00 895.17 1726.93 1263.00
Premier (v2) 0.11 0.20 0.12 0.07 0.18 0.15
Crible (v3) 0.00 0.00 0.00 0.00 0.00 0.00
TABLE10.5 – Test des matériels modernes en architecture 32 bits
On remarquera que pour le test de l’implantation debsr, sur un Xeon Silver
4208, le temps de calcul pour la fonction qui fait appel àbuiltin_clzest très faible,
de l’ordre de0,09secondes. Cela est dû au fait que le compilateur a optimisé le code
notamment en faisant appel à l’instructionvplzcntd, une instruction vectorielle
qu’il l’applique sur un vecteur AVX. Cette instruction fait partie du jeu d’instruction
AVX512-VL et AVX512-CD.
Par contre, pour les processeurs AMD l’instructionbsrne semble pas être très
efficace comparativement aux microprocesseurs Intel.
Marque Intel AMD Intel AMD
Modèle Core i7Ryzen 5Core i5Ryzen 5
Sous-modèle 11850H 5600g12400F9600X
bsr (fonction C) 10.01 7.65 11.33 8.37
bsr (__builtin_clz) 0.44 0.46 0.33 0.40
bsr (asm +bsr) 0.31 0.92 0.25 0.22
Premier (v1) 815.96 676.94 691.730 554.30
Premier (v2) 0.08 0.07 0.080 0.040
Crible (v3) 0.00 0.00 0.020 0.003
TABLE10.6 – Test des matériels récents 2020 et après en architecture 32 bits
