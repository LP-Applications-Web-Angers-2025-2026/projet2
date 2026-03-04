# Programmation Assembleur x86 : 32 et 64 bits sous Linux Ubuntu

**Auteur :** Jean-Michel RICHER  
**Édition :** 5ème Édition (version 2025.09)  
**Destinée au cours à partir de la rentrée de Septembre 2025**  
**© Copyright 2020-2025 par Jean-Michel RICHER**  
**ISBN-13 :** 978-2-9573160-0-7  
**Contact :** jean-michel.richer@univ-angers.fr  

**Adresse :**  
Faculté des Sciences  
Université d’Angers  
2 Boulevard Lavoisier  
49045 ANGERS Cedex 01  
France  

## Avertissements

Cet ouvrage peut être reproduit et utilisé uniquement à des fins non commerciales, notamment dans le cadre de l’enseignement de l’assembleur. Il ne peut, en aucune manière, être modifié ou commercialisé sans l’accord de son auteur.

Toute demande de modification, de rectification ou de correction peut être adressée par courrier électronique à l’auteur.

L'ensemble du code des études de cas et des différents chapitres est disponible sur le site web de l’auteur à l'adresse suivante :  
[https://leria-info.univ-angers.fr/~jeanmichel.richer/assembleur.php](https://leria-info.univ-angers.fr/~jeanmichel.richer/assembleur.php)

## Dédicace

*Ce livre est dédié à ceux qui ont contribué à sa réalisation*  
*en premier lieu à mes parents*  
*pour m’avoir donné la vie*  
*pour m’avoir éduqué*  
*et avoir financé mes études*  
*ensuite, aux enseignants qui m’ont donné l’envie*  
*d’apprendre et de transmettre mon savoir*  

**Juillet 2020, Avrillé**

> **Citation** : *Eduquer c'est chercher à concilier deux mouvements contraires : celui qui porte à aider chaque enfant à trouver sa propre voie et celui qui pousse à lui inculquer ce que soi-même on croit juste, beau et vrai.*  
> — Nicolas Sarkozy, Lettre aux Educateurs (4 septembre 2007)

> **Citation** : *Bien écrire, c'est déjà presque bien penser et il n'y a pas loin de la jusqu'à bien agir.*  
> — Thomas Mann

## Remerciements

J’adresse mes remerciements à l’équipe technique du Département Informatique de l’Université d’Angers dont notamment Eric Girardeau, Jean-Mathieu Chantrein, Benjamin Jeanneau et Frantz de Germain pour m’avoir facilité l’accès à certains matériels afin de réaliser de nombreux tests de performance.

## Avant-propos

Cet ouvrage s’adresse aux étudiants en informatique, automatique et électronique qui désirent s’initier à la programmation en assembleur x86 que ce soit en architecture 32 ou 64 bits ou qui désirent parfaire leurs connaissances dans ce domaine. Si j’ai voulu écrire ce livre c’est afin de partager l’expérience que j’ai pu acquérir au cours des vingt années passées à enseigner ce sujet à l’université.

J’ai pu constater que les étudiants en informatique sont généralement rebutés par l’architecture des ordinateurs qui est pourtant un sujet fondamental dans leur cursus. La programmation assembleur qui en découle apparaît comme un sujet peu attrayant, difficile à maîtriser, et ce, généralement en raison de lacunes concernant des notions de base en informatique. On pensera bien évidemment aux notions relatives au codage de l’information, aux opérations de manipulation des bits (`and`, `or`, `not`), mais également aux pointeurs qui font partie des notions élémentaires fondamentales et utilisées de manière intensive en assembleur. Revenir aux sources de la programmation, c’est-à-dire à l’assembleur, permet de comprendre ce qui se passe réellement lorsque l’on code dans des langages structurés tels C, Pascal, Fortran ou des langages objet comme C++. Les notions liées à l’assembleur permettent également de comprendre comment rendre son code plus performant en ayant à l’esprit quelques règles élémentaires.

Ma génération, celle de la fin des années 60 et du début des années 70, fut la première à découvrir et utiliser les micro-ordinateurs. La révolution micro-informatique a consisté à mettre dans les mains de chacun un ordinateur de petite taille à un prix abordable alors que la plupart des ordinateurs de l’époque étaient des systèmes volumineux qui occupaient une pièce entière et dont le coût était prohibitif : de l’ordre de la centaine de milliers ou du million de Francs. Pour donner un ordre d’idée, au début des années 80, un IBM PC coûtait en fonction de sa configuration entre 30 000 et 50 000 Francs ce qui représentait une somme énorme pour la plupart des ménages, alors qu’un Commodore 64 ne coûtait que 6 000 Francs.

Bien que les premiers micro-informaticiens furent considérés comme des non scientifiques, des bidouilleurs, des personnes qui cherchaient mais sans véritable but si ce n'est celui de se faire plaisir en triturant des machines électroniques, c'est qu'à l'époque beaucoup de choses restaient à créer, imaginer, développer et il était nécessaire de tester, d'essayer, d'expérimenter afin de comprendre ce que ce nouvel appareil qui débarquait dans notre quotidien avait dans ses entrailles. C’est cet esprit épris de curiosité qui a forgé notre engouement pour le matériel (*hardware*) et bien évidemment le logiciel qui permet de faire fonctionner le matériel.

J’ai très tôt été confronté à l’assembleur. D’une part, mon premier ordinateur fut un Commodore 64, ordinateur à succès, vendu à plus de 17 millions d’exemplaires à travers le monde. Ce monstre de puissance était affublé d’un microprocesseur MOS Technology 6510 tournant à la vitesse de 1 MHz et était doté de 64 ko de RAM, dont 48 ko utilisables pour stocker les programmes. À l’époque, cela était suffisant. Le langage BASIC (*Beginner’s All-purpose Symbolic Instruction Code*) du C64 était sobre. Notamment, il ne disposait pas d’instruction de type `clrscr` ou `clearscreen` chargée d’effacer l’écran. Il fallait utiliser l’instruction `PRINT` avec un symbole particulier en forme de cœur afin de vider l’écran. Il était également nécessaire pour réaliser bon nombre d'opérations graphiques, d’exécuter des instructions `PEEK` ou `POKE` qui consistent respectivement en une lecture et une écriture de donnée en mémoire. C’est typiquement une action de bas niveau liée au matériel et donc proche de l’assembleur.

Je suis également redevable de mon engouement pour l’assembleur à Benoît Michel dont le "Livre du 64" fut le livre de chevet de mon adolescence. On découvrait dans cet ouvrage, qui traite des arcanes du C64, que le BASIC n’était qu’une surcouche qui était orchestrée et exécutée par l’assembleur ou plutôt le langage machine du microprocesseur. Grâce au désassembleur dont le code était donné dans le livre, j’ai désassemblé la ROM et j’ai pu comprendre comment fonctionnait l’interpréteur BASIC et comment on pouvait le modifier de manière à intégrer de nouvelles instructions.

J’ai toujours trouvé plaisant de pouvoir programmer au plus bas niveau car on est au plus près de la machine et les problèmes à solutionner demandent une certaine ingéniosité. Il est également nécessaire de faire preuve de rigueur car on ne dispose pas de structures de contrôle. On utilise adresses et pointeurs à outrance et, dans le cas de l’architecture 32 bits de machines de type x86, la limitation imposée par le nombre de registres disponibles pour stocker données et adresses est handicapante. Il faut donc faire preuve d’inventivité.

L’ensemble de cet ouvrage se base sur la programmation dans un environnement Linux de type Ubuntu/Debian et utilise de nombreux logiciels inhérents à ce système d’exploitation comme `make` pour la compilation automatique, `g++` pour le compilateur C++ et `nasm` en ce qui concerne la partie assembleur. Linux, de par ses caractéristiques, offre au développeur un large panel d’outils puissants qui permettent de traiter tous les aspects du processus de développement logiciel en passant par le profilage et les tests. On pourra bien entendu transposer ce qui a été vu à d’autres environnements comme MacOS ou Windows.

J’ai conçu cet ouvrage comme un cours académique, c’est-à-dire que les premiers chapitres introduisent les notions fondamentales et les suivants se révèlent plus pratiques.

- Le **chapitre 1** traite de notions générales et fondamentales en informatique et aborde succinctement des notions liées au Génie Logiciel et au travail de l’informaticien.
- Le **chapitre 2** concerne le codage de l’information notamment des nombres entiers, des réels que l’on qualifie de nombres à virgule flottante et des chaînes de caractères.
- Le **chapitre 3** aborde les notions liées à la mémoire (comme l’alignement, l’adressage mémoire et le *dual channel*) et les notions relatives au fonctionnement du microprocesseur (chargement des instructions, décodage et exécution, pipeline, etc).
- Le **chapitre 4** traite des logiciels utilisés dans le cadre de cet ouvrage c’est-à-dire les éditeurs, l’assembleur, le compilateur et le débogueur.
- Le **chapitre 5** reprend les notions vues sur les registres dans le chapitre 3 et introduit les instructions assembleur de base qui travaillent sur les entiers. On montre par la suite comment traduire les structures de contrôle du langage C comme le `if`, le `while`, le `for` et le `switch` en assembleur x86.
- Le **chapitre 6** apprend comment passer des paramètres à un sous-programme et comment récupérer ces paramètres dans le sous-programme appelé, que ce soit en architecture 32 bits ou en architecture 64 bits.
- Le **chapitre 7** aborde le traitement des nombres à virgule flottante par le coprocesseur (FPU). On montre comment traduire simplement une expression arithmétique en utilisant les mnémoniques de la FPU.
- Le **chapitre 8** traite des unités vectorielles et des instructions liées à ces unités que sont le SSE, l’AVX et l’AVX512. On introduit également les *intrinsics* qui sont des fonctions du C qui seront remplacées lors de leur traduction par des instructions vectorielles. Ces fameuses fonctions intrinsèques permettent d’écrire du code vectoriel qui sera optimisé par le compilateur C tout en restant au niveau du langage C.
- Le **chapitre 9** (dernier chapitre académique) traite de l’algèbre de Boole. Même s’il n’est pas vraiment lié à l’assembleur, il permet de comprendre le rôle central que joue l’algèbre de Boole en informatique, allant du codage des circuits jusqu’à la logique. Ce chapitre quelque peu digressif peut néanmoins faire partie de ce livre et permet une ouverture à la logique.

Plusieurs études de cas (chapitres 10 à 17) permettent de mettre en œuvre les connaissances vues lors des premiers chapitres et j’explique comment traduire en assembleur des fonctions écrites en langage C afin d’obtenir le code le plus performant possible. Ce code est ensuite testé sur différents matériels et l’analyse des résultats permet de démontrer au lecteur que le matériel (processeur, carte mère et mémoire) peut avoir une influence sur un choix particulier de traduction en assembleur.

- Le **chapitre 11** aborde l’optimisation du produit de deux matrices carrées d’entiers. On montre en particulier l’importance de l’accès mémoire et de la mémoire cache.
- Le **chapitre 12** se focalise sur l’implantation de l’instruction `popcnt` qui compte le nombre de bits positionnés à 1 dans un registre. On montre au travers de différentes implantations comment cette instruction peut être améliorée si on doit la coder en C lorsqu’elle n’est pas disponible nativement sur un microprocesseur.
- Le **chapitre 13** traite de l’implantation de la fonction SAXPY et permet d’introduire plusieurs instructions assembleur liées au coprocesseur arithmétique et au calcul vectoriel avec unités SSE sur les flottants.
- Le **chapitre 14** aborde des notions liées à la bioinformatique (Fonction de Fitch). On montre comment améliorer très fortement l’implantation d’une fonction en utilisant les instructions vectorielles sur les entiers et notamment en traitant les données par groupe de 16 ou 32 octets en utilisant respectivement les registres SSE et AVX.
- Le **chapitre 15** (Comptage des voyelles) se focalise sur la programmation en architecture 64 bits et montre comment le fait de pouvoir disposer du double de registres par rapport à l’architecture 32 bits permet de simplifier et implanter efficacement une fonction qui compte des voyelles dans une chaîne de caractères.
- Le **chapitre 16** s'intéresse à l’implantation d’une fonction qui calcule le n-ème terme de la suite de Fibonacci. Plusieurs versions sont proposées allant du dépliage de boucle à la vectorisation en passant par la formule de calcul directe basée sur le nombre d’or.
- Le **chapitre 17** (le dernier chapitre des études de cas) indique si un nombre entier est un nombre auto-descriptif ou non. On montre ici l’intérêt de remplacer la division par un invariant par une multiplication.

Se sont ajoutées au cours du temps quelques annexes, en fin d’ouvrage :
- Un rappel des conventions d’appel Linux en 32 et 64 bits (Annexe A).
- Une démonstration de l’utilisation du débogueur GDB (Annexe B).
- Une mini étude de cas concernant l’utilisation de l’instruction assembleur `bsr` face à `lzcnt` (Annexe C).
- Une mini étude de cas liée à l’implantation de la fonction signe qui donne le signe de son opérande (Annexe D).
- Une table ASCII descriptive pour les codes de 0 à 127 (Annexe E).
- Un glossaire des instructions assembleur.

J’espère, au travers de cet ouvrage, donner au lecteur une meilleure compréhension du fonctionnement du microprocesseur et réconcilier les développeurs avec l’assembleur en montrant comment les traitements de haut niveau peuvent être traduits de manière efficace dans un langage très limité. Il est certain que les compilateurs ont fait de gros progrès et sont capables de traduire efficacement bon nombre d’algorithmes, mais certains traitements, en raison de leur complexité, peuvent encore être améliorés en les codant à la main. Passer à l’assembleur permet par exemple de paralléliser le code en utilisant les instructions vectorielles et gagner ainsi un facteur important en terme de performance.

**Que la force de l’assembleur soit avec vous!**
