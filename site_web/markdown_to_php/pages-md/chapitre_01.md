# Chapitre 1 : Informatique,informaticienet

## 1.1 Le langage FORTRAN (FORmula TRANslator) mis au point par John Backus et

son équipe chez IBM en 1956 représente une avancée majeure pour l’informatique
car ce langage de haut niveau permet alors de s’affranchir des contraintes et spéci-
ficités propres à chaque microprocesseur. Dans ce type de langage la déclaration
d’une variable permet de faire abstraction de sa localisation en mémoire, c’est le
compilateur qui se chargera de placer la variable à une adresse fixe et l’identifiant
de la variable permet de manipuler à la fois sa valeur et son adresse de manière
transparente, alors qu’en assembleur, une variable est identifiée par son adresse.
L’ajout de structures de contrôle (if then else,for,while, etc) apporte en outre
un confort notable pour l’écriture de traitements complexes et l’utilisation de
l’indentationpermet visuellement de comprendre la structure du programme. A
contrario, le langage assembleur est un langage limité, sans structures de contrôle.
Alors pourquoi revenir en arrière? Cela ne constitue t-il pas une régression que
de coder en assembleur?
Tout dépend du point de vue. Si vous devez conduire une voiture pour aller
d’un point A à un point B vous vous fichez sans doute de savoir quelles sont les
différentes pièces qui constituent un moteur. Mais, si vous devez réparer une voiture
ou si vous ne voulez pas rester en rade au beau milieu de nulle part à attendre une
dépanneuse, alors, cela devient essentiel. Connaître l’assembleur c’est, en partie,
être en mesure de comprendre comment fonctionne un ordinateur et comment
trouver et corriger les bogues d’un programme.
La raison principale qui conduit généralement à programmer en assembleur
tient au fait que l’assembleur est le langage le plus proche du microprocesseur et,
en étant proche de celui-ci, on tente d’en extraire lasubstantifique moëlle
, ou en
d’autres termes, on tente d’extraire le maximum de son efficacité. Un exemple très
concret est l’utilisation d’une fonction qui compte le nombre de bits positionnés à
un dans un entier 16, 32 ou 64 bits. Nous verrons que cette fonction est très utile
par la suite dans les études de cas de cet ouvrage. Sur les processeurs récents cette
fonction est disponible sous forme d’une instruction assembleur appeléepopcnt
pourPopulation Countet est très efficace (voir Chapitre) comparativement à
une fonction C que l’on devrait écrire pour obtenir le même résultat.
Dans le même esprit, on peut également penser aux instructions assembleur
bsretbsfpourBit ScanReverse / Forwardqui déterminent la position du bit le plus
ou le moins significatif d’un entier. Ces deux instructions ne sont généralement pas
disponibles dans la plupart des langages informatiques et il faut les implanter avec
les instructions du langage.
1// fonction qui implante bsr (bit scan reverse)
2u32 (u32 )

```text
for(int =31;i>=0; i)
if((a&1<<i)) 0)return(u32)i;
}
return ;
7}
9// retourne la somme des bsr(t[i]) pour i dans [0..n-1]
10u32 (u32*t,u32 )
u32 =0;
for(u32 =0;i<n;i)
sum+=function_bsr(t[i]);
}
return ;
16}
```

> *Listing 1.1.1 – Fonction bsr, version 1*

Pour rentrer abruptement dans le vif du sujet, regardons quel gain on peut
obtenir en implantant la fonctionfunction_bsren C ou en utilisant directement
l’instruction assembleur. Le but de ce test est d’évaluer l’efficacité de chaque mé-
thode. L’instructionbsrdétermine la position du bit de poids fort d’un entier. Ainsi,
pour la valeur décimale123qui, en binaire, s’écrit1111011, c’est le bit 6 qui est le
. Expression rendue célèbre par Rabelais dans Gargantua (1534) et qui désigne ce qu’il y a de
plus précieux.
1.1. POURQUOI APPRENDRE L’ASSEMBLEUR 29
bit de poids fort (ou bit le plus à gauche). Le bit de poids faible, c’est à dire le bit le
plus à droite, a pour indice 0. Il est positionné à 1 dans123.
Le Listing, fonction method_1, applique la fonctionfunction_bsrsur un
tableautdenentiers 32 bits. On en profite pour réaliser la somme des valeurs
obtenues afin de produire une somme de contrôle (checksum, variablesum) ce qui
permet de vérifier que l’on obtient bien le même résultat pour chaque fonction
testée.
Le typeu32représente un entier non signé sur 32 bits et correspond au type
size_tdu langage C. La fonctionfunction_bsrcherche le bit le plus significatif
en utilisant la variableiqui sera décrémentée progressivement. Initialementiest
égale à 31 ce qui correspond au bit le plus à gauche dans un entier 32 bits (cf.
Chapitre suivant).
La même fonction peut être implantée (cf. Listing) en utilisant la possibilité
offerte par le compilateurC
++d’introduire l’appel à l’instruction assembleurbsr.
Le codage est difficile à comprendre et il faut se référer à la documentation du
compilateur pour avoir une idée de la syntaxe utilisée, mais laissons cela de côté
pour le moment.
1u32 (u32*t,u32 )
2 u32 =0;

```text
for(u32 =0;i<n;i)
u32 =t[i];
u32 ;
asm("bsr %0, %1":"=r"(output)"r"(input)
sum+=output;
}
return ;
10}
```

> *Listing 1.1.2 – Fonction bsr, version 3*

On notera cependant qu’en langage C, ces instructions (bsr,bsf, ...) ont été
ajoutées sous forme de fonctionsbuilt-in, c’est à dire des extensions qui permettent
au programmeur d’utiliser la syntaxe d’un appel de fonction pour faire appel à
une instruction du processeur. L’implantation dépend alors du jeux d’instructions
dont dispose le microprocesseur. Si l’instruction assembleur est présente elle sera
utilisée, sinon elle sera remplacée par une fonction écrite en C.
La Table
précédemment, appliquées sur un tableau d’un million d’entiers. On réalise le calcul
100 fois afin d’obtenir des temps significatifs. Trois méthodes ont été évaluées :
•laméthode 1correspond à l’appel d’une fonction écrite en C (Listing)
•
laméthode 2, écrite en C, utilise la fonction__builtin_clzqui retourne le
nombre de bit à 0 avant de trouver un bit à 1 en partant du bit le plus
significatif (bit 31), on retourne donc31 - __builtin_clz(t[i])
•laméthode 3utilise directement l’instruction assembleurbsr(Listing)
Méthode Temps (s)Amélioration
méthode 1 / fonction C 8,68 -
méthode 2 /__builtin_clz 1,19 ×7,3
méthode 3 / asm +bsr 0,96 ×9,0
TABLE1.1– Temps d’exécution en secondes pour le calcul répété 100 fois du bit le plus
significatif sur un tableau d’un million d’entiers non signés sur AMD Ryzen 5 3600
Un rapide examen du code assembleur généré pour laméthode 2montre que le
compilateur remplace la fonction__builtin_clzpar l’instructionbsr. On obtient
donc des temps très proches pour les méthodes 2 et 3. On constate que l’utilisation
de l’instruction assembleur permet d’obtenir une méthode dont le temps d’exécution
est environ 9 fois plus rapide que la fonction C que l’on devrait implanter pour
réaliser le calcul. On trouvera en annexe (cf. Annexe) de plus amples résultats.
Voilà donc un exemple très explicite de ce que permet l’assembleur en terme
d’efficacité.
Cependant, un public peu averti pourrait considérer que dans la grande majorité
des cas, savoir programmer en assembleur n’est d’aucune utilité au moins pour
deux raisons :
•
d’une part, les langages destinés au web (PHP, Javascript, Python
, Ruby) sont
des langages interprétés où l’assembleur n’est pas utilisé ou pas directement
utilisable et, de plus, le développeur qui consacrera son temps à créer des
interfaces graphiques, optimiser des requêtes SQL ou concevoir des sites web
n’aura jamais d’interaction avec l’assembleur,
•
d’autre part, pour les langages compilés tels que C,C
++, Fortran le compi-
lateur est généralement capable de produire un code assembleur bien plus
optimisé que celui écrit à la main en faisant appel à différentes techniques
(vectorisation, parallélisation, dépliage de boucle, optimisation guidée par
profilage) qui sont accessibles via les options en ligne de commande des
compilateurs.
En outre, la principale difficulté de la programmation en assembleur réside en
partie dans l’absence de structures de contrôle que l’ontrouve dans les langages
de haut niveau (if,for,while, etc). On est donc contraint d’écrire dans un langage
bas niveau, ce qui rend la relecture et la compréhension du code difficile, il est
absolumentnécessaire de bien commenter son code!
Comme nous le verrons plus tard et comme nous l’avons déjà évoqué dans
l’Avant Propos, le fait de ne disposer finalement que de 6 registres généraux en
. Concernant Python, il s’agit d’un cas particulier puisque l’on peut optimiser le code Python en
le compilant et que les librairies Python sont écrites en C/C
++.
1.1. POURQUOI APPRENDRE L’ASSEMBLEUR 31
architecture 32 bits (eax,ebx,ecx,edx,esi,edi) pour réaliser les traitements
(espetebpétant utilisés pour gérer la pile), est très contraignant et nous oblige
à constamment jongler avec les registres : tel registre va contenir telle donnée au
début d’un sous-programme, puis telle autre donnée au milieu et finalement un
autre résultat à la sortie du sous-programme.
Donc finalement, savoir programmer en assembleur c’est difficile et cela ne
sera pas très utile? Pourquoi alors écrire cet ouvrage? La réponse est bien évi-
demment non, car apprendre à programmer en assembleur nous apporte plusieurs
compétences qui, de mon point de vue, sont essentielles de possèder pour tout
informaticien qui se respecte. L’apprentissage du langage assembleur nous apporte :
•la connaissance de notre outil de travail : programmer en assembleur nous
amène à savoir comment fonctionne le microprocesseur, ce qu’il est capable de
réaliser, comment il traite les données, comment il interagit avec la mémoire.
On pensera également au fait que le microprocesseur est un système complexe
qui combine plusieurs technologies et c’est de la synergie de ces technologies
que provient l’efficacité de l’exécution du code (voir le Chapitre),
•
la programmation en assembleur expose les concepts fondamentaux de la
programmation, tels que les structures de contrôle, les fonctions et la gestion
de la mémoire, de manière plus directe ce qui renforce la compréhension
des principes sous-jacents qui sont souvent abstraits dans des langages de
programmation de plus haut niveau ce qui facilite l’apprentissage d’autres
langages et renforce la capacité à résoudre des problèmes complexes.
•
la possibilité d’optimiser du code : vous apprendrez des notions liées à l’opti-
misation du code (dépliage de boucle, vectorisation) car tout informaticien se
doit de produire du code valide (c’est à dire qui réalise le traitement demandé)
et efficace (qui le fait de la manière la plus rapide possible), cela peut avoir
une influence non négligeable sur votre carrière,
•
la possibilité de supplanter le compilateur : certains traitements sont dif-
ficilement traduisibles de manière optimale par le compilateur, cela arrive
rarement, mais dans certains cas, coder ces traitements en assembleur se
révèle un atout primordial et permet de faire la différence,
•
la rigueur : programmer en assembleur demande d’être rigoureux car il
est nécessaire avant toute chose de spécifier ce que stockeront les registres,
comment on va manipuler les données, comment on va les traiter. On retrouve
la même necessité de rigueur lorsque l’on programme avec des langages de
haut niveau dès lors que l’on manipule plusieurs concepts simultanément.
Notons enfin que l’utilisation de l’assembleur est parfois obligatoire lorsque liée
au matériel : la programmation desdriversde périphériques passe généralement
par une partie assembleur qui réalise l’interface entre le périphérique et le système
d’exploitation.

### 1.1.1 Un autre point essentiel lié à la programmation en assembleur est le fait qu’un

système informatique se compose de deux parties :
•
une partie matérielle (hardware) qui représente l’ensemble des composants
de la machine,
•
une parite logicielle (software) constituée des logiciels s’exécutant en utilisant
ou tirant partie du matériel.
Un informaticien se doit de comprendre le fonctionnement du système dans
sa globalité car les caractéristiques du matériel influent sur les performances des
programmes. Par exemple, il y a de cela quelques années j’ai réalisé un test sur
l’implantation d’une version de la fonctionpopcnt, que nous avons évoqué en
début de chapitre. Ce test s’exécutait en 8 secondes sur un microprocesseur Intel
Pentium-M. Afin d’optimiser le code avec le compilateurgccde l’époque, j’ai utilisé
l’option-mtune=pentium-msensée prendre en considération les caractéristiques
d’un Pentium-M afin de produire du code assembleur plus performant.
Le résultat ne fut pas celui escompté mais un temps d’exécution pour le même
test de 23 secondes, soit près de trois fois plus lent!
Les deux codes ne différaient que par quelques instructions. Pour être en mesure
de comprendre pourquoi le code est plus lent dans la version sensée être plus rapide
il est nécessaire de comprendre le code assembleur ainsi que les caractéristiques du
microprocesseur qui exécute le code car ici le problème vient de l’utilisation d’une
instruction qui n’a pas été codée de manière optimale. On pourrait même affirmer
que c’est un défaut du microprocesseur.
Une bonne connaissance du fonctionnement interne de l’ordinateur permet
de comprendre pourquoi certains algorithmes se révèlent efficaces et pourquoi
d’autres sont mal adaptés par rapport à une architecture donnée ou par rapport au
problème à traiter et nous permet alors d’en améliorer l’efficacté.
Il en va de même lorsque l’on tente de paralléliser un algorithme : certains
algorithmes se prêtent mieux à la parallélisation que d’autres. La cause est en
général liée à l’accès mémoire notamment si on utilise plusieurs coeurs d’un même
processeur.
Par exemple, les microprocesseurs AMD ont des unités de traitement des
nombres flottants lente par rapport aux microprocesseurs Intel. Si on veut ga-
gner en efficacité sur le traitement des flottants, il faut alors coder les traitements
en utilisant la partie basse des registres vectoriels SSE (cf. Chapitres,) car
ceux-ci semblent être plus performants que sur les architectures Intel.
Les traitements informatiques possèdent, au regard de ceux qui en sont les utili-
sateurs et donc les tributaires, une exigence de qualité (robustesse et performance)
et l’informatique s’attache à résoudre des problèmes complexes par leur structure
ou par le volume de données à gérer. L’informaticien doit donc être capable de
1.2. LE MÉTIER D’INFORMATICIEN 33
trouver le traitement (algorithme) le plus adapté aux données à analyser et savoir
coder correctement des algorithmes dans un langage donné. Par exemple, déter-
miner si un entier est pair peut être réalisé en effectuant une division par 2 et en
vérifiant que le reste de la division est égal à 0. Malheureusement, la division, de
part sa nature complexe, est pénalisante et demande plus de temps de traitement
pour s’exécuter que les autres opérations comme l’addition, la soustraction ou la
multiplication. Etant donné que l’on travaille avec des nombres codés en binaire,
une autre méthode consiste à vérifier que le premier bit du nombre n’est pas à 1 ce
qui prend beaucoup moins de temps.
1.2

### 1.2.1 Définition : Ordinateur

Un ordinateur est une machine électronique conçue pour effectuer des calculs
et traiter des informations de manière automatique.
Le terme ordinateur fut inventé par Jacques Perret, professeur de philologie
latine à la Sorbonne, à la demande d’IBM France en 1955. IBM cherchait en effet à
cette époque un nom pour commercialiser son nouveau calculateur qui fut alors
baptiséordinateur IBM 650.
Un ordinateur est composé de plusieurs parties appelées :
•
composants (carte mère, microprocesseur, barrette de mémoire, carte gra-
phique)
•et périphériques (disque dur, lecteur de DVD, clavier, souris, moniteur, ...).
La distinction entre composant et périphérique est parfois ténue et repose
généralement sur le fait qu’un périphérique se trouve éloigné de la carte mère
alors qu’un composant est en contact direct avec celle-ci. Cependant le terme
composant peut être utilisé pour englober les périphériques. Pour certains, le terme
périphériques fait uniquement référence à tout ce qui est externe au boîtier : clavier,
souris, moniteur, imprimante, en d’autres termes, ce qui se trouve à la périphérie
du boîtier.

### 1.2.2 Définition : Informatique

Science du traitement de l’information effectué par un ordinateur. Elle com-
prend l’ensemble des activités consistant à collecter, organiser et traiter de
manière automatique les données par un ordinateur.
Le terme informatique a été créé en mars 1962 par Philippe Dreyfus (Directeur
du centre national de calcul électronique de la société Bull dans les années 1950,
un des pionniers de l’informatique en France) à partir des mots information et
automatique.
En anglais on trouve parfois le termeInformatics, mais plus généralement on
emploie le termeComputer Science, voireComputer Engineeringpour désigner
l’informatique. On notera la différence établie entre le mot anglaiscomputer(calcu-
lateur), c’est à dire la tâche première pour laquelle les ordinateurs furent conçus et
utilisés, et le mot informatique, c’est à dire, leur utilisation au quotidien : le traite-
ment automatique de l’information. On peut alors soulever une question d’ordre
philosophique et se demander si calculer c’est traiter l’information, et inversement
traiter l’information n’est-ce que réaliser un calcul?
Il faut insister ici sur le mot science, car à ses débuts l’informatique n’était pas
considérée par les autres disciplines exactes (mathématiques, physique et chimie)
comme une science. Ces dernières ont plus de deux mille ans d’histoire. L’informa-
tique a atteint le rang de science en quelques décennies depuis les années cinquante
même si on peut faire remonter les premiers travaux sur les calculateurs mécaniques
au XVII
e
siècle, voire même avant si on pense à la machine d’Anticythère.
Historiquement, l’informatique a commencé à entrer en tant qu’outil pédago-
gique dans l’enseignement secondaire français à partir de la fin des années 1970.
En 1980 [17] lors d’une table ronde sur le sujet del’enseignement français face à
l’informatique, Jacques Tebeka
, pose la question suivante :Faudrait-il enseigner
l’informatique comme une discipline indépendante, au même titre que les mathé-
matiques? Ou la considérer seulement comme une aide à l’enseignement dans les
différentes disciplines?
En fait ces propos soulignent le dilemme auquel fait face l’informatique depuis
plusieurs décennies : faut-il l’enseigner comme une science au même titre que
les mathématiques ou comme outil technique? Car finalement, savoir utiliser un
traitement de texte, un tableur ou rechercher de l’information sur internet relèvent
de compétences techniques. Savoir programmer un ordinateur (cf. ci-après) relève
de la science informatique.
Le même intervenant, Jacques Tebeka, fit également part lors de cette conférence
. Responsable du centre informatique de la société ESSO en France et aux États-Unis, conseiller
informatique du groupe BSN Gervais Danone, directeur général du groupe Datsun.
1.2. LE MÉTIER D’INFORMATICIEN 35
de son désir que l’informatique soit enseignée comme discipline :Je viens de faire un
petit calcul. À la vitesse actuelle, on pourra généraliser l’enseignement de l’informatique
dans 430 ans... En tant qu’industriel je demande qu’on ne s’étende pas sur le problème
philosophique de savoir s’il faut enseigner l’informatique ou l’informatique à travers
les disciplines. Je demande qu’on aille vite, beaucoup plus vite...
L’informatique, depuis des années, n’est enseignée au collège et lycée dans le
système éducatif français que comme outil et non comme discipline. C’est seulement
au niveau de l’enseignement supérieur (Universités, IUT, Ecoles d’Ingénieurs) que
l’informatique devient une discipline à part entière.
En ce qui concerne ma formation, j’ai eu quelques cours d’informatique en 3ème
(1984-1985) réalisés par l’enseignant de mathématiques. Il nous a appris à faire de
la programmation en Logo, puis en Pascal sur Apple 2. Plus tard, lorsque je suis
entré à l’université de Bourgogne à Dijon en 1988 comme étudiant, l’informatique
en première année traitait de l’apprentissage de la programmation avec le langage
BASIC et n’était pas enseignée uniquement par des informaticiens mais également
par des physiciens. Lorsque j’ai été recruté à l’Université d’Angers comme maître
de conférence, en Octobre 2000, le langage C n’était pas enseigné en licence (L3).
J’ai donc incorporé au cours d’Architecture des Ordinateurs que j’enseignais un
volet langage C, car ce dernier est central en informatique. On l’utilise pour la
programmation système sous Linux, et, de ce langage découlent d’autres langages
comme le C
++, le Java, le Javascript, le PHP.
Il aura fallu batailler très dur pour enraciner l’informatique comme discipline et
science car c’est seulement dès la rentrée 2019 que l’enseignement de l’informatique
fut proposé au lycée à tous les élèves de seconde générale et technologique (soit
1h30 par semaine), et en tant que discipline de spécialité de 1ère puis Terminale
(4h puis 6h par semaine).

### 1.2.3 Définition : Informaticien

Un informaticien est un scientifique qui met en place des procédures de
traitement automatique de l’information grâce à un ordinateur tout en conce-
vant des algorithmes efficaces et en exploitant au mieux les capacités de la
machine.
J’insiste ici sur le fait qu’en tant que scientifique l’informaticien se doit de
réfléchir du point de vue de la complexité de ses algorithmes mais également du
point de vue de leur implantation dans un langage informatique.
L’ordinateur est l’outil qu’utilise l’informaticien pour réaliser son travail et nous
nous devons de connaître et maitriser notre outil de travail afin de solutionner les
problèmes qui nous sont posés.
On peut dresser un parallèle avec l’automobile et le mécanicien. Imaginez que
votre voiture vous pose des problèmes récurrents et qu’elle ait du mal à démarrer
tous les matins. Pour régler le problème vous vous rendez chez un garagiste et
confiez votre véhicule à un mécanicien qui, pour vous, représente un expert qui
saura trouver une solution adéquate à votre problème. Il établira un diagnostique
et vous indiquera la cause du problème (batterie, bougies, carburateur, etc) puis
vous proposera une solution (remplacement de la pièce défectueuse) qui est sensée
être la moins onéreuse pour vous.
Que penser si le mécanicien n’y entend rien en mécanique? Vous avez des
problèmes au démarrage, vous perdez de la puissance quand vous montez une
côte, votre feux arrière ne fonctionne plus. Il saura vous proposez néanmoins une
solution et elle sera toujours la même : changez de voiture! Effectivement changer
de voiture solutionnera le problème, mais à quel prix! L’incompétence du prétendu
spécialiste vous sera alors préjudiciable.
Il en va de même en informatique. Si vous n’avez pas su coder efficacement
un algorithme ou si vous n’avez pas su choisir le bon algorithme, vous pouvez
toujours proposer à celui qui utilise votre programme et qui trouve que celui-ci
prend trop de temps à s’exécuter, d’acheter une machine plus puissante, mais cela
ne solutionnera le problème qu’en partie. Si un autre informaticien est capable de
proposer un algorithme plus efficace ou de détecter dans votre algorithme ou votre
codage un verrou, vous risquez de passer pour une personne peu compétente qu’il
est préférable de remplacer.

### 1.2.4 Le travail de l’informaticien consiste, partant d’énoncés en langage naturel

(français, anglais, etc) à traduire ces énoncés en une série d’opérations clairement
définies que l’on appelle algorithme. Ces algorithmes sont ensuite traduits en
instructions directement compréhensibles par le microprocesseur de la machine.
Définition : Algorithme
Un algorithme est une succession finie d’actions clairement identifiées exécu-
tées dans un ordre précis.
Le mot algorithme est dérivé du nom du mathématicien persan Al Khwarizmi
(vers l’an 820), qui introduisit en Occident la numération décimale (rapportée
d’Inde) et enseigna les règles élémentaires des calculs qui en découlaient.
On peut résumer le travail de l’informaticien en disant qu’il doitêtre capable de
créer un logiciel. La simplicité de cette expression ne laisse pas présager de l’étendue
des compétences qu’elle englobe. On peut, afin de mieux comprendre ce que cela
implique, prendre l’analogie avec la construction d’une maison.
Imaginons que vous vouliez faire construire une maison et que vous disposiez,
pour cela, d’un terrain. La première étape consiste à rencontrer un architecte qui,
1.2. LE MÉTIER D’INFORMATICIEN 37
en fonction de vos besoins (nombre d’étages, de chambres, disposition des pièces,
...) et des contraintes du terrain (forme, présence d’un dénivelé ou non), dessinera
les plans de votre maison. Une fois les plans finalisés, il faut faire appel à une
entreprise de BTP (Bâtiments et Travaux Publics) qui contractera différents corps
de métiers (terrassier, grutier, maçon, électricien, plombier, carreleur, charpentier,
couvreur, peintre, etc) afin de construire votre nouvelle demeure.
La difficulté de la tâche de l’informaticien c’est que, construire un programme
informatique, s’apparente à construire une maison, avec une contrainte de taille :
l’informaticien doit être à la fois architecte, maçon, électricien, plombier, etc. Il doit
être à la fois :
•
concepteurc’est à dire réfléchir d’un point de vue théorique à l’organisation
de la structure de son programme, des classes qu’il va créer et de l’interaction
entre ces classes,
•
constructeur, c’est à dire savoir implanter son code en gardant à l’esprit qu’il
doit produire du code efficace, maintenable, lisible et compréhensible par un
relecteur, alors que lisibilité et efficacité sont antinomiques
.
En ce qui concerne l’évolution du métier d’informaticien, on pourrait caricaturer
en disant que dans les années 70, 80, on a eu tendance à séparer conception et
codage. La partie conception était considérée commenobleet ne demandant pas
nécessairement de savoir coder. Elle était réservée à des personnes ayant fait des
études au niveau bac + 4 (master) voire à bac + 8 (doctorat). Cette tâche, que
certains considèrent comme ingrate ou de bas niveau, qu’est le codage était plutôt
réservée aux analystes programmeurs que l’on formait au niveau bac + 2 ou bac +
3 (licence).
Cette vision des choses a évolué à partir des années 90, lorsque l’informatique est
devenue de plus en plus complexe avec des programmes contenant des centaines de
milliers de lignes de code et donc des centaines de classes ainsi que des paradigmes
et des concepts de programmation non triviaux (fonctionnel, logique, généricité,
multi-tâches).
Un autre point important est lepassage à l’échelle, c’est à dire le fait de traiter
des volumes de données de plus en plus importants. Lorsque l’on développe un
algorithme, on travaille généralement avec un jeu de données en entrée de petite
taille de manière à détecter rapidement les erreurs et bogues inhérents à tout
programme informatique. Puis une fois le programme finalisé autour de l’algorithme
à implanter, on passe à des jeux de données plus importants. Parfois la taille des
données va conduire à revoir les structures de données car celles-ci prennent une
place trop importante en mémoire, ou alors, on s’aperçoit que notre programme qui
mettait quelques secondes à s’exécuter sur un petit jeu de données met finalement
plusieurs heures, voire plusieurs jours pour s’exécuter sur un jeu de données
plus conséquent car l’accès aux données n’est pas efficace (voir par exemple le
Chapitre). Il se peut également que la complexité du problème rende impossible
le traitement de grandes instances.
5. c’est à dire contradictoires
Tous ces facteurs concourent à comprendre que l’informaticien, pour accomplir
sa tâche de nos jours, doit détenir au moins un niveau master pour disposer des
connaissances et de la maturité nécessaires à l’accomplissement de son travail et il
faut souvent ajouter à celà plusieurs années d’expérience.
Enfin, un dernier facteur entrant en jeu, et souvent négligé, est le fait que
les informaticiens ne conçoivent pas, la plupart du temps, des programmes pour
eux-mêmes mais pour les autres. C’est à dire pour des compagnies téléphoniques,
des constructeurs automobiles, des avionneurs, des organismes de recherche en
médecine, en agronomie, des institutions publiques. Cela représente autant de
domaines pour lesquels le domaine d’expertise n’est pas connu de l’informaticien et
ajoute une contrainte et une difficulté supplémentaire.

## 1.3 Afin d’exemplifier mon propos quant au fait de savoir programmer, je vais

prendre trois exemples simples au travers desquels je tenterai de démontrer que
l’informaticien se doit de réfléchir, de savoir coder mais également disposer d’un
certain recul et d’une expérience qui demande plusieurs années de pratique. S’il
en est ainsi sur des exemples aussi simples, que penser s’il s’agit de programmes
beaucoup plus complexes? Le premier exemple touche à la recherche des nombres
premiers, le second tient au tri d’un tableau d’entiers et enfin le troisième concerne
la recherche et l’élimination de doublons.

### 1.3.1 L’un des problèmes les plus simples que j’aime à demander à mes étudiants

de coder est la recherche de nombres premiers. La raison en est que ce problème
demande un peu de réflexion. Le problème à résoudre est la recherche des cinquante
premiers nombres premiers par exemple. La plupart des étudiants connaît la
définition d’un nombre premier mais est incapable de donner le code d’une fonction
efficace capable de déterminer si un nombre est premier ou de penser à une
méthode plus ingénieuse (cf. ci-après le crible).
Rappelons la définition d’un nombre premier que l’on apprend au collège et
lycée :
Definition 1.3.1(Nombre premier).Un nombren∈N est dit premier si il admet
uniquement deux diviseurs : un et lui-même. On oublie généralement de préciser
que ces deux diviseurs doivent être différents, en conséquence1n’est pas premier,
le premier nombre premier est donc2.
Cette définition d’un nombre premier suppose de connaître la notion de divisibi-
lité. Un nombre entiernest divisible parpsignifie quen=p×q . Mais la notion la
plus intéressante et celle du reste lié à la division entière. Sinn’est pas divisible
parpalors il existe un restertel que0< r < ppour lequeln=p×q+r . Pour
un informaticien calculer le reste de la division est une opération qui s’appelle
l’opérationmodulo. En C elle est représentée par l’opérateur%et dans d’autres
langages par le mot clémodoumodulo.
1bool (int )

```text
if(n<0)return ;
int =0;
for(int =1;i<=n;i)
if((n%i) 0) nbr_diviseurs;
}
return(nbr_diviseurs==2);
8}
```

> *Listing 1.3.1 – Fonction nombre premier, version inefficace*

Une première version de la fonctionest_premierqui détermine si un nombren
est premier ou non, est celle du Listing. Je l’ai souvent obtenue en réponse
à ce problème de la part des étudiants lorsque je leur proposais de le résoudre.
Elle traduit simplement la définition que nous avons donnée d’un nombre premier,
elle compte le nombre de diviseurs et indique que le nombre passé en paramètren
n’est pas premier si le nombre de diviseurs est différent de2. Cette version est bien
entendu totalement inefficace pour plusieurs raisons :
•
sinest divisible par2(excepté2) alors il n’est pas premier et il est inutile de
continuer à rechercher d’autres diviseurs
•
sinn’est pas divisible par2, on vérifie quand même qu’il est divisible par des
multiple de2ce qui n’a aucun intérêt
•
si on a obtenu un nombre de diviseurs supérieur à2, il faudrait simplement
s’arrêter plutôt que d’en rechercher d’autres
On peut donc améliorer cette fonction de la sorte (cf. Listing) :
•
on teste le cas ounest égal à2ou3et dans l’affirmative on indique que le
nombre est premier
•
on élimine ensuite le cas des nombres pairs en vérifiant si le nombre est
divisible par2
•
on ne teste pas les diviseurs au delà de
√
n
, car sinest divisible parp, il s’écrit
n=p×q avecp≤q, le cas extrême étant celui oùp=q. Pour s’en convaincre
il suffit de regarder comment se décompose37(cf. Table). A partir de
√
37≃6
on ne trouvera pas de diviseur puisqu’on aura déja testé les valeurs
depde 1 à 6 et queqpossède des valeurs entre 1 et 5.
•on ne teste que les diviseurs impairs
p q r p q r
1 37 0 11 3 4
2 18 1 12 3 1
3 12 1 13 2 11
4 9 1 14 2 9
5 7 2 15 2 7
6 6 1 16 2 5
7 5 2 17 2 3
8 4 5 18 2 1
9 4 1 19 1 18
10 3 7 20 1 17
TABLE1.2 – Décomposition de 37
1bool (int )

```text
if(n<=1)return ;
if(n<=3)return ;
// est-ce un nombre pair ?
if((n%2) 0)return ;
// chercher les diviseurs impairs jusqu'à
// racine carrée de n
int =static_cast<int>(floor(sqrt(n)));
for(int =3;k<=limit;k+=2)
if((n%k) 0)return ;
}
return ;
15}
```

> *Listing 1.3.2 – Fonction nombre premier, version améliorée*

On peut améliorer cette version et en donner une version optimisée (Lis-
ting) en se basant sur l’élimination des multiples de 2 et 3, puis sur la
recherche de diviseurs impairs. Dès lors, on testera beaucoup moins de diviseurs.
Plutôt que de passer par une fonction qui calcule si un nombre est premier, on
peut utiliser la méthode du crible d’Ératosthène (voir Listing) qui consiste à
remplir un tableau qui indique si un nombre est premier ou non et à éliminer ses
multiples. Cette méthode est plus efficace que les précédentes si on doit déterminer
dans un intervalle donné quels sont les nombres premiers.
Nous présentons Table, les temps d’exécution en secondes obtenus pour
différentes plateformes pour les trois méthodes que nous venons d’évoquer . La
première méthode qui consiste à compter le nombre de diviseurs est totalement
inefficace. La version améliorée de la fonctionest_premierest tout à fait acceptable.
1bool (int )

```text
if(n<=3)return >1;
if(0==n%2) 0== n%3))return ;
for(int =5;i*i) n;i+=6)
if(n%i) 0) n%i+2)) 0)
return ;
}
return ;
11}
```

> *Listing 1.3.3 – Fonction nombre premier, version optimisée*

1// on teste les nombres de 1 a un million
2const =1000000;
3// tableau qui indique si un nombre est premier ou non
4bool*tab=new [N+1];
6// 0 et 1 ne sont pas premiers
7tab[0]false;
8tab[1]false;
9// tous les autres nombres sont initialement premiers
10for(int =2;i<=N;i)tab[i]true;
12// on élimine les multiples de chaque nombre
13int =2;
14while(n<=N)

```text
if(tab[n])
for(int =2*n;j<N;j+=n)tab[j]false;
}
++n;
19}
```

> *Listing 1.3.4 – Nombre premier avec crible*

Le crible représente la méthode la plus efficace. Les temps d’exécution pour cette
méthode sont égaux à 0 car de l’ordre de la milliseconde. Elle peut encore être
améliorée en ne se focalisant que sur les nombres impairs par exemple.
Au final, on s’aperçoit qu’il ne faut pas simplement répondre en cherchant à
collerà l’énoncé mais qu’il est nécessaire de réfléchir afin d’améliorer l’efficacité
de la fonctionest_premier. Il faut également parfois chercher une méthode plus
adaptée, en l’occurrence le crible. Cette méthode troque en fait la divisibilité par le
remplissage d’un tableau ce qui la rend terriblement efficace.
Notons également qu’il existe d’autres améliorations de la fonctionest_premier:
on peut par exemple tester la divisibilité par 3 ou s’appuyer sur le fait que tous les
Méthode AMD AMD IntelIntel
Ryzen 7Ryzen 5Core i5Core i7
1700X 3600 7400 8700
est_premier(version 1) 1859,59 1726,93 1154,00 895,17
est_premier(version 2) 0,20 0,18 0,12 0,07
Crible d’Eratosthène 0,00 0,00 0,00 0,00
TABLE1.3– Temps d’exécution en secondes pour la recherche des nombres premiers entre
1 et 1_000_000
nombres premiers supérieurs à trois sont de la forme6k±1.

### 1.3.2 Le tri d’un tableau d’entiers représente probablement le sujet le plus étudié

par des générations d’étudiants. On apprend qu’il existe différents algorithmes
de tri et qu’on peut les classer en fonction de leur complexité. Cependant la
complexité est la notion la plus maléable qui soit. Comme on ne sait pas la calculer
de manière exacte, on évalue une complexité dans le meilleur des cas, dans le pire
des cas ainsi qu’une complexité moyenne qui généralement est la moyenne de la
complexité dans le meilleur et dans le pire des cas. Celle-ci varie en effet parfois en
fonction des données qu’on manipule. Elle n’est au final qu’un indicateur, mais le
programmeur a besoin de plus de précision afin de choisir le meilleur algorithme
possible pour traiter ses données. Par exemple deux algorithmes qui possèdent la
même complexité n’auront pas forcément le même temps d’exécution et parfois le
codage de l’algorithme peut jouer sur son efficacité!
Pour en revenir au tri, on apprend que le tri à bulles (bubble sort), le tri par
insertion (insertion sort) et le tri par sélection (selection sort) sont des algorithmes
de tri dont la complexité dans le pire des cas est enO(n
) , c’est à dire que si on doit
trier un tableau denentiers, le nombre d’opérations élémentaires à réaliser pour
effectuer le tri nécessiteraα×n
2 opérations avecαqui est une constante réelle qui
peut varier en fonction des opérations de l’algorithme.
Des tris plus efficaces sont les tris enO(n×log(n)) et on classe dans cette
catégorie le tri par tas (heap sort), le tri fusion (merge sort) et le tri rapide (quick
sort).
Le problème est que l’on ne sait pas ce que représente la complexité dans le
cas du tri (voir plus loin pour la partie résultats). Nous présentons Listing,
le code du tri à bulles pour un tableautde taillen. On peut voir qu’il existe deux
opérations qui influent sur la complexité du tri :
•lacomparaisondes valeurst[j] > t[j+1]
1void (int [],int )

```text
for(int =n-1;i>0; i)
for(int =0;j<i;j)
if(t[j]t[j+1])
swap(t[j],t[j+1]);
}
}
}
9}
```

> *Listing 1.3.5 – Tri à bulles en ordre croissant*

•lapermutationdes valeursswap(t[j], t[j+1])
Toute comparaison n’entraine pas forcément une permutation, il est donc diffi-
cile de quantifier dans le cas où les données sont aléatoires ce qui peut se passer.
De plus, le temps d’exécution d’une comparaison est différent du temps d’exécution
de la permutation.
Au final, le seul moyen dont on dispose pour comparer des méthodes de tri
ayant la même complexité consiste à obtenir un ordre de grandeur de la complexité
réelle (et non théorique) en réalisant de nombreux tests sur des jeux de données
en comptabilisant le nombre de comparaisons et le nombre de permutations.
En particulier le tri rapide
est le plus efficace dans le cas général sur les tests
que j’ai menés.
Il se base (cf. Figure) sur une partition des éléments du tableau initial par
rapport à une valeur pivot notéexqui sera placée à un indiceqdans le tableau.
Toute valeur inférieure àxaura un indice inférieur àqet toute valeur supérieure à
xaura un indice supérieur àq. On réitère le partitionnement de manière récursive
sur les sous-tableaux d’indices[1..q−1] et[q+ 1..n] . Notons que pour simplifier la
compréhension le premier indice du tableau est 1 et non 0 comme en C.
Le choix de la valeur pivot est ici essentiel. Elle peut être choisie à un indice
compris entre1etn. Cependant si on choisit l’indice 1 ou l’indicencela peut se
révéler un très mauvais choix.
Nous présentons Table
de méthodes de tri appliquées à des tableaux d’entiers pour des données qui sont
initialement en ordre croissant (c’est à dire déjà triées), puis en ordre décroissant
(triées en ordre inverse) et enfin placées aléatoirement.
On remarque que les méthodes de complexité enO(n
) comme le tri par in-
sertion ou le tri à bulles peuvent se révéler très rapides si les données sont déjà
triées. Par contre, si les données sont placées aléatoirement ou en ordre inverse,
leur temps d’exécution est prohibitif.
. On pourra consulter le sitehttp://www.rosettacode.orgpour découvrir le principes qui
sous-tendent les différents tris et découvrir les implantations dans de nombreux langages.
FIGURE1.1 – Principe du tri rapide
En ce qui concerne le tri rapide, la version 1 qui consiste à choisir la valeur
de pivot à l’indice le plus grand du tableau donne de mauvais résultats (comme
évoqué précédemment) pour des données triées ou triées en ordre inverse. Par
contre, si on choisit le pivot au milieu du tableau (version 2), on obtient des temps
de calcul minimes.
Le tri fusion est assez proche du tri rapide mais un peu moins performant. Cela
est dû au fait que la fusion qui consiste à créer un seul tableau à partir de deux
sous-tableaux triés nécessite de créer un tableau temporaire avec l’implantation
que nous avons choisie.
Pour en revenir à la complexité, nous donnons Table
vées en nombre de comparaisons et permutations pour trier un tableau de cinq
Méthode CroissantDécroissantAléatoire
tri par insertion 0.000 169.000 85.300
tri à bulles 0.000 167.040 348.220
tri rapide - version 1 87.420 91.360 0.040
tri rapide - version 2 0.000 0.010 0.040
tri fusion 0.020 0.020 0.060
TABLE1.4– Temps d’exécution en secondes pour trier 500_000 entiers sur Intel Core i5
7400 @ 3.00GHz
Méthode Croissant Décroissant Aléatoire
tri par insertion n n
0.5×n
tri à bulles 0.5×n
n
0.75×n
tri rapide 4.8×n×log(n) 4.8×n×log(n) 6.2×n×log(n)
tri fusion 5.1×n×log(n) 6.9×n×log(n) 8.1×n×log(n)
TABLE1.5– Complexité - Nombre de comparaisons + nombre de permutations ou de
recopies pour 500_000 entiers
cent mille entiers. Dans le cas du tri fusion il s’agit du nombre de recopies lors de
la fusion. On comprend alors mieux pourquoi le tri rapide est le plus efficace, c’est
qu’il génère le moins d’opérations de comparaisons et de permutations.
Pour conclure sur cette partie, la connaissance des algorithmes est primordiale
mais elle ne donne pas forcément leur efficacité réelle. Les données peuvent influer
sur le temps d’exécution, les variantes d’implantation se révèlent plus ou moins
efficaces. Il est donc nécessaire de ne pas se fier à la théorie et il faut expérimenter
par soi-même, implanter les algorithmes et les tester. Nous recommandons au
lecteur intéressé la lecture du chapitre 4 de [4] et des chapitres 6 et 7 de [3].

### 1.3.3 Je fus contacté en 2018 par une étudiante qui rencontrait un problème avec

un programme CUDA
qui prenait trop de temps à s’exécuter et provoquait un
timeout, c’est à dire que le programme est arrêté parce que son exécution dure trop
longtemps.
Ce timeout est dû au fait que, sur la plupart des machines de bureau ou portables,
la carte graphique est utilisée pour l’affichage. On peut également l’utiliser pour
faire des calculs parallèle mais dans ce cas l’affichage n’est plus disponible. Si le
calcul ne dure que quelques milli secondes cela n’est pas perceptible, mais si le
calcul dure plus de quelques secondes, il me semble que le choix a été fait de
terminer le programme afin que l’utilisateur récupère la main après 5 secondes.
Le problème à résoudre consiste à supprimer les doublons d’un ensemble d’en-
registrements stockés sous forme d’un tableau deNenregistrements dePchamps
de type entier. Le premier champ contient un identifiant d’enregistrement qui varie
de1àN. On veut donc connaître les enregistrements dont les champs2àP
sont similaires. Notons qu’ici nous faisons le choix de stocker ce tableau à deux
dimensions sous forme d’un tableau à une dimension deN×Pentiers.
La méthode la plus simple (cf. Listing) et utilisée par l’étudiante qui
. CUDA pourCompute Unified Device Architectureest une technologie mise au point par NVidia
pour faire du calcul parallèle sur carte graphique.
// nombre d'enregistrements
const =7000000;
// nombre de champs
const =10;
int*enr=new [N*P];
void (int*enr,bool*elimine)
for(int =0;i<N-1;i)
for(int =i+1;j<N; j)
if(identique(&enr[i*P],enr[j*P])
elimine[j]true;
}
}
}
}
Listing 1.3.6 – Recherche de doublons, version simpliste
m’a contacté, consiste à parcourir le tableau et à vérifier que les enregistrements
suivants sont identiques ou non à l’enregistrementi. Cependant cette méthode
possède une complexité enO(N
/2) et le nombre d’enregistrementsNsur lequel
on travaille est de l’ordre de 7 millions. Le calcul de la complexité est assez simple :
•pour l’indicei= 0, on auraN−1comparaisons
•pouri= 1on en auraN−2
•ainsi de suite jusqu’ài=N−1, pour lequel on aura une comparaison
Au final on a :
N−1
X
i=1
i=N×
N−1
ce qui est proportionnel àN
.
L’étudiante n’a fait que transposer le code du Listing
thread doit donc comparer le premier enregistrement auxN−1 autres enregistre-
ments ce qui est totalement inefficace que ce soit sur une carte graphique ou sur
un microprocesseur et c’est ce qui provoque le timeout sur la carte graphique.
Se pose alors l’épineux problème de diminuer la complexité de l’algorithme de
recherche de doublons. On diminuera la complexité si on ne doit pas comparer
l’enregistrementiauxN−i suivants mais à un plus petit nombre d’enregistrements.
Il faut donc trouver un moyen de classer les enregistrements qui sont similaires ou
identiques afin de les comparer par la suite. Dans ce but, on peut envisager :
•d’ajouter un champ qui contient une valeur de hachage de l’enregistrement
•de trier les enregistrements suivant la valeur de hachage
•
et de finalement comparer uniquement les enregistrements qui ont la même
valeur de hachage
Pour rappel, une valeur dehachage(hash valueen anglais) est une valeur entière
qui résulte d’un calcul qui prend en compte tout ou partie des champs d’une struc-
ture de données et qui a pour but d’identifier de manière unique l’enregistrement.
On peut la voir comme unesignaturedes données qu’elle représente. Malheu-
reusement il est difficile de trouver une fonction de hachage qui donne une valeur
unique pour chaque enregistrement dès lors que le nombre d’enregistrements est

> **Important** : Cependant, si cette valeur de hachage permet de distinguer un grand
>
nombre d’enregistrements alors elle peut se révéler utile. Lorsque deux structures
de données différentes possèdent la même valeur de hachage on parle decollision.
Dans certains cas, la collision est problématique si on désire distinguer de manière
unique chaque donnée.
Il semble que les fonctions de hachage de type FNV
soient très intéressantes
car elles permettent une bonne séparation ou distinction des données.
En utilisant la méthode que nous venons de décrire la complexité diminue et se
résume à celle du tri des enregistrements qui sera de l’ordre deN×log(N) , si on
choisit un algorithme de tri efficace (cf. section précédente).
Temps de calcul doublons
Au final, sur un microprocesseur récent, pour 7 millions d’enregistrements, la
première méthode prendra une quinzaine d’heures pour terminer alors que
la deuxième prendra quelques secondes. Soit une amélioration drastique!
Là encore, réfléchir au problème avant de le résoudre et donc choisir le bon
algorithme apporte un gain conséquent en terme de temps de calcul. C’est ce genre
d’expérience qu’il faut acquérir au cours des ans et parfaire sa connaissance des
algorithmes ainsi que des matériels afin de répondre au mieux aux problèmes qui
nous sont posés, à nous, informaticiens.
Imaginons que vous soyez unmauvaisinformaticien, votre méthode de résolu-
tion prendra donc une quinzaine d’heures pour résoudre le problème précédent. Si
votre patron vous indique maintenant qu’il a un client qui aura 1000 problèmes
du même type à résoudre dans quelques mois et que ce client désire obtenir les
résultats au bout d’une semaine après vous avoir fourni les données, une rapide
analyse vous amènera à la conclusion qui suit.
Mille problèmes impliquent 15000 heures de calcul, soit environ 625 jours de
calcul sur une seule machine. La solution, pour répondre en une semaine, consiste
donc à disposer de plusieurs ordinateurs. Vous proposerez donc à votre patron
d’acheter un cluster (ce qui risque de coûter assez cher) et ce cluster devra disposer
d’au moins 90 coeurs
de calcul. Si dans deux ans, le client dispose non plus de
1000 mais de 10000 problèmes à traiter et qu’il désire toujours obtenir le résultat
dans le même délai, cela implique de disposer de 10 fois plus de processeurs,
soit plus de 890. Disposer d’un cluster dix fois plus gros engendre un coût non
négligeable mais peut également conduire à un surcoût lié à l’achat d’un nouveau
local adapté et dimensionné pour accueillir le cluster et le refroidir.
Maintenant, si une nouvelle recrue se voit confier la tâche d’améliorer le temps
de résolution et qu’en réfléchissant un peu elle parvient à imaginer que l’utilisation
d’une fonction de hachage risque de diminuer le temps de calcul, vous risquez
de vous attirer les foudres de votre patron et de passer pour un incapable aux
yeux d’un bon nombre de personnes. En effet, si le problème est résoluble en 5
secondes avec fonction de hachage au lieu de 15 heures, alors résoudre 10000
problèmes prend 50000 secondes, soit un peu plus de 14 heures de calcul sur une
seule machine. Votre manque de professionnalisme aura donc coûté très cher à
votre entreprise.
A titre d’exercice, nous invitons le lecteur à tenter d’implanter la recherche de
doublons comme nous l’avons expliquée.

## 1.4 De manière générale l’intérêt ou l’engouement pour les sciences, au delà de la

découverte, réside dans le fait qu’on est confronté quotidiennement à des problèmes
et on se doit d’y apporter une solution, voire la meilleure solution. Parvenir à
trouver une solution originale, performante apporte alors une grande satisfaction
intellectuelle.
Le travail de l’informaticien consiste à faire exécuter par un ordinateur des
traitements qui doivent être pensés pour être les plus efficaces par rapport au
matériel dont il dispose. Les méthodes de développement logiciel issues de la
mouvanceAgile
préconisent au contraire de commencer par faire ce qui est
simple plutôt que de faire ce qui est compliqué, et par conséquent, efficace. C’est le
fameux principe KISS (Keep It Stupidly Simple). Bien entendu ce genre d’approche
est discutable et possède des avantages comme des inconvénients.
Commencer par faire ce qui est simple (par exemple un tri à bulles) permet
d’avancer plus vite dans le codage des diverses fonctionnalités d’un logiciel. Ce-
pendant, il faudra revenir par la suite sur le code et le modifier pour introduire de
l’efficacité. Inversement utiliser des algorithmes efficaces va nous amener à ralentir
la cadence de développement. Plus un algorithme est complexe, plus il faudra de
temps pour le coder, le tester, et plus on a tendance à introduire de bogues.
Néanmoins, du point de vue utilisateur, c’est souvent l’efficacité qui prime dans
9. 15000 / (7 jour×24 heures) = 89,28
1.4. LE GÉNIE (DU) LOGICIEL 49
le choix d’un logiciel. L’informaticien se trouve donc souvent dans cette position peu
confortable, tiraillé entre deux choix contradictoires : utiliser un algorithme simple
pour augmenter sa productivité mais ralentir les traitements, ou alors, produire du
code efficace (donc complexe) pour diminuer le temps d’exécution des traitements
mais ralentir sa productivité.
Définition : Génie Logiciel
En Informatique, leGénie Logicielest une discipline qui a pour but d’ap-
prendre les méthodes qui permettent de mener à terme la réalisation d’un
logiciel, en partant de l’expression du besoin d’un client et en passant par la
conception, l’implantation, les tests, pour arriver jusqu’au déploiement de
l’application et sa maintenance.
Les premières méthodes élaborées dans les années 1970 à 1980 avaient tendance
à se fonder sur une approche considérée trop rigide. Pour caricaturer, encore une
fois, ces méthodes fonctionnaient sur le modèle suivant : on allait voir le client
et on comprenait (plus ou moins bien) son besoin, puis on concevait le logiciel
pendant quelques mois et on présentait le résultat final au client. Le problème est
que le résultat pouvait ne pas convenir au client :
•
soit parce que pendant la phase de développement la vision du client ou son
besoin évoluait,
•soit parce que le logiciel final n’était pas ergonomique,
•
soit parce que les besoins du client avaient été mal compris par l’équipe de
développement dès le début.
En effet, les développeurs ont leur propre vision du logiciel et les utilisateurs en
ont une autre. Par exemple, les utilisateurs vont préférer appuyer sur une touche
pour ouvrir une fenêtre qui contiendra l’information d’un client, plutôt que de
fermer la fenêtre courante qui affiche sa commande et accèder par un menu à la
fonctionnalité qui donne l’information du client. Parfois, pour le programmeur, il
est plus pratique ou plus simple de faire un choix plutôt qu’un autre en raison de
l’implantation qu’il a choisi alors que l’utilisateur se focalise sur l’ergonomie.
Toute modification du logiciel contraint les développeurs à repenser et modifier
l’application ce qui peut engendrer plusieurs semaines ou mois de développement
supplémentaires. Certaines entreprises, pour éviter ce genre de déconvenue, vont
facturer très cher toute modification dans le but de faire comprendre au client que
les changements sont pénalisants pour celui qui développe le logiciel et ont, par
conséquent, des répercussions sur les délais et le budget alloué au logiciel.
Les méthodesAgile, évoquées précédemment, mises au point dans les années
1990 et 2000, tentent de répondre à cette problématique en intégrant le client à
l’équipe de développement et en construisant le logiciel par groupes de fonction-
nalités, c’est ce que l’on appelle ledéveloppement itératif. Après avoir développé
quelques fonctionnalités pendant trois à quatre semaines, on présente le résultat
au client et on prend en compte les modifications qu’il demande dans le prochain
cycle de développement qui intègre également de nouvelles fonctionnalités.
Ces nouvelles méthodesAgileprônent également la simplication des procédures
et l’adaptation (ou adaptabilité) au changement.
Simplifier les procédures signifie obtenir rapidement ce que l’on veut afin
d’avancer rapidement et ne se concentrer que sur la tâche principale c’est à dire
développer le logiciel. Un développeur sera plus serein et efficace s’il peut remplacer
son écran tombé en panne dans l’heure, plutôt que d’avoir à remplir un formulaire
en trois exemplaires, le faire signer par son supérieur hierarchique et attendre
quelques jours avant d’obtenir un nouvel écran.
L’adapation au changement, quant à elle, concerne aussi bien les besoins du
client que l’arrivée ou le départ d’un nouveau collègue au sein de l’équipe de
développement.
Même si les méthodesAgileconnaissent un engouement certain, elles ne sont
pas la panacée. Elles ont pour but, comme nous venons de le voir, l’adaptabilité
aux besoins du client ou de l’équipe et ont tendance à considérer quel’agilité, qui
signifie dans ce cadre, l’acceptation et l’adaptation au changement, lèvera beaucoup
de verrous et permettra de surmonter de nombreux problèmes qui tendent à faire
capoter certains projets qui, finalement, n’arrivent pas à terme ou qui ne respectent
pas les délais ou le budget.
Malheureusement, ces méthodes ne fonctionnent pas toujours car elles oublient
l’analogie avec la construction d’une maison que nous avons évoqué précédemment.
En effet, s’adapter aux demandes de changement du client reviendrait, si nous
reprenons notre analogie avec la construction d’une maison, à revoir le plan de la
maison, à détruire certaines pièces pour en créer de nouvelles, à supprimer des
câbles pour en faire passer de nouveaux à un autre endroit. Si une maison devait
être construite ainsi, en modifiant les plans en cours de construction, il est presque
certain qu’elle n’arriverait pas à terme ou que le résultat serait décevant pour le
client. On comprend bien qu’une telle approche risquerait de grèver le budget de
construction. Sans compter la démotivation de l’équipe de construction qui serait
contrainte de défaire et refaire son travail plusieurs fois et aurait le sentiment de
stagner.
Les changements au niveau du logiciel peuvent donc intervenir mais à la marge,
pas en profondeur, ce qui impose de bien réfléchir au préalable à l’architecture du
logiciel à concevoir.
Un autre facteur qui semble totalement négligé par la totalité des méthodes
de génie logiciel est le fait que la vision du logiciel que possède l’équipe de dé-
veloppement évolue au fur à mesure de sa construction. Si vous demandez à un
développeur, une fois le logiciel opérationnel, ce qu’il pourrait améliorer, il vous
dira sans doute qu’avec le recul et la vision globale qu’il en a, s’il devait refaire le
logiciel, il procéderait autrement pour implanter telle partie, qu’il aurait conçu les
classes de manière différente, etc. Même si le logiciel fonctionne, le fait qu’il puisse
apparaître mal conçu est un facteur psychologique qui peut impacter de manière
significative la motivation du développeur et influencer sa volonté à continuer de
le modifier ou de l’améliorer.

## 1.5 Pour résumer, il est primordial pour l’informaticien de disposer d’une connais-

sance approfondie de son outil de travail. Avant de se lancer dans l’écriture du
code source d’une application, il est nécessaire de réfléchir de manière posée et
de s’interroger afin de trouver la meilleure architecture possible pour le logiciel
que l’on doit concevoir ainsi que la meilleure organisation sous forme de classes,
de méthodes et de coopérations entre les classes. Une séance debrainstormingà
plusieurs est souvent salutaire car on ne pense pas toujours à tout et les autres
peuvent nous aider dans notre réflexion globale.
Lors de l’écriture du code, il est du devoir du développeur debien commenter
son code, c’est à dire d’expliquer pourquoi une classe ou une méthode existe, quel
est son rôle, comment elle réalise le traitement qui lui est demandé, quels sont les
paramètres à fournir et quel est le résultat attendu.
Cette nécessité de réflexion et de documentation est d’autant plus vitale que
l’on travaille à bas niveau, comme en assembleur, car la relecture du code peut être
fastidieuse, d’autant plus qu’il n’y a pas de structures de contrôle. Elle est vitale
pour une personne qui serait amenée à relire votre code, mais également pour
soi-même. Lorsqu’on laisse de côté un projet qu’on avait commencé et que l’on
continue son développement quelques semaines ou mois plus tard, on se demande
souvent comment on a réalisé telle fonction. Si on dipose de commentaires de
qualité, il sera alors plus simple de progresser.

## 1.6 Exercice 1 -En utilisant les entiers 32 bits du langage C (int) écrire un programme

qui fait la somme des entiers de 1 ànet trouver à partir de quelle valeur den, la
somme, qui est également de typeint, n’est plus correcte.
On n’oubliera pas d’inclure l’option de compilation-fwrapvdeg++pour obtenir
une comparaison exacte.
Exercice 2 -Reprendre l’exercice précédent mais avec les entiers 32 bits non signés.
