<?php
require_once('ez_web.php');
require_once('php-geshi/geshi.php');

document_begin();
?>

<div class="row">
<section class="cours">

<?php chapter("Compter les voyelles", 0); ?>

    <h1>Introduction</h1>
    <p> Nous allons dans ce chapitre nous intéresser à un problème simple qui sert
        d’exemple de démonstration et qui consiste à compter les voyelles dans une chaine
        de caractères. Ce problème bien qu’évident à implanter demande de posséder les
        connaissances que nous avons mises en avant dans les Chapitres 1 et 3. L’utilisation
        des instructions vectorielles apporte également une amélioration substantielle sous
        certaines architectures.
        On considère pour ce problème des chaînes de caratères ne possédant que des
        caractères en minuscule sans accents ni signes de ponctuation afin de simplifier
        l’écriture du code. On ne prend en compte que les voyelles (a, e, i, o, u et y) et
        on ne considère que des chaînes de longueur multiple de 64 pour pouvoir utiliser
        l’AVX-512 et simplifier le code.
        Nous allons coder en 64 bits afin de disposer de nombreux registres qui vont
        grandement nous simplifier la tâche.
    </p>

<?php section("Section"); ?>

    <h2>Fonctions de référence</h2>
    <p>Nous pouvons concevoir trois fonctions de référence pour répondre au problème :
    • la première fonction est écrite en utilisant des if, ce qui est normalement très
    pénalisant lorsqu’ils sont dans une boucle
    • la seconde fonction utilise un switch qui est sensé palier au problème de
    performance du if

    CHAPITRE 15. ETUDE DE CAS
    COMPTER LES VOYELLES
    • enfin la troisième fonction utilise un tableau afin d’éviter les branchements
    conditionnels induits par le if ou le switch
    La fonction réalisée avec un if est présentée Listing 15.2.1. Les fonctions auront
    toutes la même signature à savoir un pointeur sur une chaine de caractères en C,
    la longueur de la chaine et un pointeur sur un tableau de six entiers qui sont les
    compteurs du nombre d’occurrences de chaque voyelle. Ici v[0] compte le nombre
    de ’a’, v[1] le nombre de ’e’, etc. Cette fonction est pénalisante car on ne peut
    pas prédire quel then sera exécuté et, de plus, si on trouve un ’y’ ou une consonne
    on devra réaliser six comparaisons.
    </p>

<div class="cadre_info">
    <p>Cadre pour une information importante</p>
</div>

<?php subsection("Subsection"); ?>

<p>Code C++ depuis un fichier</p>

<?php do_geshi("code/asm_vowels_64/159-183.cpp", "cpp" ); ?>

<?php subsection("Subsection"); ?>

<p>Code assembleur depuis un fichier</p>

<?php do_geshi("code/code1.asm", "asm" ); ?>

    <p>La fonction implantée avec un switch tente de remédier au problème du if,
        elle est présentée Listing 15.2.2. Son codage en assembleur par un compilateur
        C/C ++ génère un tableau de 25 adresses qui correspondent aux lettres ’a’ à ’y’.
        Ces adresses sont utilisées pour se brancher sur une partie du sous-programme qui
        incrémente v[i] pour la voyelle correspondante ou qui incrémente la variable de
        boucle s’il s’agit d’une consonne.
        La fonction implantée avec un tableau (cf. Listing 15.2.3) consiste à compter
        tous les caractères. Étant donné qu’il y a 26 lettres dans l’alphabet, on crée un
        tableau temporaire (letters) de 26 entiers que l’on initialise à 0. L’écriture de
        la boucle est donc simplifiée puisqu’on n’a plus qu’une seule instruction et que
        le dépliage de la boucle sera facilement réalisé par le compilateur. Le tableau
        temporaire composé de 26 entiers de 32 bits tient aisément dans la mémoire cache
        et permettra d’accélérer le traitement. En fin de sous-programme, on recopiera
        dans le nombre d’occurrences de chaque voyelle. </p>

<?php do_geshi("code/asm_vowels_64/375.cpp", "cpp" ); ?>

<?php subsubsection("Subsubsection"); ?>
    <?php section("Temps de références"); ?>



    <p> Le test de référence consiste à exécuter 50_000 fois le dénombrement du
        nombre de voyelles pour une chaîne de 256_000 caractères, initialisée aléatoirement, avec environ 20 % de voyelles.
        Sur un AMD Ryzen 5 3600, on obtient :
        • pour la version if le test dure 57,09 secondes
        • pour la version switch le test s’effectue en 54,71 secondes
        • et pour la version avec tableau, le temps d’exécution est de 4,64 secondes
        La méthode qui consiste à compter toutes les lettres est donc la plus efficace car
        elle ne contient pas de conditionnelle et elle peut être dépliée simplement.</p>

<p>Code assembleur inline</p>
<?php
$code=<<<CODE
push	eax
push	ebx
call	fib
add	esp, 8
CODE;
do_geshi_inline($code,"asm");
?>
  

</section>
</div>

<?php subsubsubsection("Benchmark");
?>

<script src="javascript/Highcharts-3.0.10/js/highcharts.js"></script>

<div id="graph_ancien" style="width:80%; height:600px;"></div>

<script type="module">
    import { createPerformanceChart } from "./data/asm_vowels/graph.js";
    import data from "./data/asm_vowels/ancien/data.json" with { type: "json" };

    createPerformanceChart('#graph_ancien', data);
</script>


<?php
document_end();
?>
