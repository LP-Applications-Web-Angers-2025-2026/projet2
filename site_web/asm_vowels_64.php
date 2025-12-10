<?php
require_once('ez_web.php');
require_once('php-geshi/geshi.php');
document_begin();
?>

<?php
$fichier = "./javascript/pdf_parser/output/programmation_assembleur.txt";

$contenu = file($fichier, FILE_IGNORE_NEW_LINES); // tableau de lignes

$chapitre = "15.1 Introduction";
$chapitre2 = "15.2 Fonctions de référence";
$chapitre3 = "Listing 15.2.1 – Compter les voyelles avec un if";

$Lignes15 =15;
$Lignes20 =20;
$nombreLignes1 =12;
$nombreLignes2 =19;
$nombreLignes3 =14;

$resultat = [];
$trouve = false;
$resultat2 = [];
$trouve2 = false;
$resultat3 = [];
$trouve3 = false;

foreach ($contenu as $index => $ligne) {
    // Recherche du titre
    if (trim($ligne) === $chapitre) {
        $trouve = true;
        // On récupère les 6 lignes suivantes
        for ($i = 1; $i <= $nombreLignes1; $i++) {
            if (isset($contenu[$index + $i])) {
                $resultat[] = $contenu[$index + $i];
            }
        }
        break; // on peut sortir de la boucle
    }
}

foreach ($contenu as $index => $ligne) {
    // Recherche du titre
    if (trim($ligne) === $chapitre2) {
        $trouve2 = true;
        // On récupère les 6 lignes suivantes
        for ($i = 1; $i <= $nombreLignes2; $i++) {
            if (isset($contenu[$index + $i])) {
                $resultat2[] = $contenu[$index + $i];
            }
        }
        break; // on peut sortir de la boucle
    }
}

foreach ($contenu as $index => $ligne) {
    // Recherche du titre
    if (trim($ligne) === $chapitre3) {
        $trouve3 = true;
        // On récupère les lignes suivantes
        for ($i = 1; $i <= $nombreLignes3; $i++) {
            if (isset($contenu[$index + $i])) {
                $resultat3[] = $contenu[$index + $i];
            }
        }
        break; // on peut sortir de la boucle
    }
}
?>

<div class="row">
<section class="cours">

    <?php chapter("Compter les voyelles", 0); ?>

    <h1>Introduction</h1>
<?php if ($trouve) { // retravailler
    echo "<pre>"; foreach ( $resultat as $ligne => $lignes){
       echo $lignes;
       echo "<br>";
    } echo "</pre>";
    } else { echo "Titre non trouvé."; }
   ?>
<?php section("Section"); ?>

    <h2>Fonctions de référence</h2>
    <?php  if ($trouve2) { // retravailler
        echo "<pre>";  foreach ( $resultat2 as $ligne => $lignes){
            echo $lignes;
            echo "<br>";
        } echo "</pre>";
    } else { echo "Titre non trouvé."; }
    ?>

    <ul>
        <li> La première fonction est écrite en utilisant des if, ce qui est normalement très pénalisant lorsqu’ils sont dans une boucle       </li>
        <li> La seconde fonction utilise un switch qui est sensé palier au problème de performance du if.      </li>
        <li> Enfin la troisième fonction utilise un tableau afin d’éviter les branchements conditionnels induits par le if ou le switch. La fonction réalisée avec un if est présentée Listing 15.2.1.    </li>
        <li> Les fonctions auront toutes la même signature à savoir un pointeur sur une chaine de caractères en C, la longueur de la chaine et un pointeur sur un tableau de six entiers qui sont les compteurs du nombre d’occurrences de chaque voyelle.  </li>
    </ul>

<?php subsection("Subsection"); ?>

<p>Code C++ depuis un fichier</p>

<?php do_geshi("code/asm_vowels_64/159-183.cpp", "cpp" ); ?>

<?php subsection("Subsection"); ?>

<p>Code assembleur depuis un fichier</p>

<?php do_geshi("code/code1.asm", "asm" ); ?>

    <?php  if ($trouve3) { // retravailler
        echo "<pre>";  foreach ( $resultat3 as $ligne => $lignes){
            echo $lignes;
            echo "<br>";
        } echo "</pre>";
    } else { echo "Titre non trouvé."; }
    ?>
    <p>La fonction implantée avec un switch tente de remédier au problème du if, elle est présentée Listing 15.2.2. <br>
        Son codage en assembleur par un compilateur C/C ++ génère un tableau de 25 adresses qui correspondent aux lettres ’a’ à ’y’. <br>
        Ces adresses sont utilisées pour se brancher sur une partie du sous-programme qui incrémente v[i] pour
        la voyelle correspondante ou qui incrémente la variable de boucle s’il s’agit d’une consonne. <br>
        La fonction implantée avec un tableau (cf. Listing 15.2.3) consiste à compter tous les caractères. <br>
        Étant donné qu’il y a 26 lettres dans l’alphabet, on crée un tableau temporaire (letters) de
        26 entiers que l’on initialise à 0.  <br>
        L’écriture de la boucle est donc simplifiée puisqu’on n’a plus qu’une seule instruction et que
        le dépliage de la boucle sera facilement réalisé par le compilateur. <br>
        Le tableau temporaire composé de 26 entiers de 32 bits tient aisément dans la mémoire cache
        et permettra d’accélérer le traitement. <br>
        En fin de sous-programme, on recopiera dans le nombre d’occurrences de chaque voyelle. </p>


<?php do_geshi("code/asm_vowels_64/375.cpp", "cpp" ); ?>

<?php subsubsection("Subsubsection"); ?>
    <?php section("Temps de références"); ?>


    <div class="cadre_info">
        <p> Le test de référence consiste à exécuter 50_000 fois le dénombrement du
            nombre de voyelles pour une chaîne de 256_000 caractères, initialisée aléatoirement, avec environ 20 % de voyelles.
            <br> Sur un AMD Ryzen 5 3600, on obtient : </p>
        <ul>
            <li> La version if,  le test dure 57,09 secondes  </li>
            <li> La version switch, le test dure 54,71 secondes </li>
            <li> La version avec tableau, le temps d’exécution est de 4,64 secondes</li>
        </ul>
        <p> La méthode qui consiste à compter toutes les lettres est donc la plus efficace car elle ne contient pas de conditionnelle et elle peut être dépliée simplement. </p>
    </div>

<?php  // a retirer ?>
<h4>Code assembleur inline</h4>
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

<script src="javascript/Highcharts-3.0.10/js/highcharts.js"></script>
<div id="graph_container" style="width: 75%; height: 600px;">
    <div id="graph_ancien" style="border: 1px solid #ccc; margin-bottom: 5%;"></div>
    <div id="graph_moderne" style="border: 1px solid #ccc; margin-bottom: 5%;"></div>
    <div id="graph_recent" style="border: 1px solid #ccc;"></div>
</div>

<script type="module">
    import { createPerformanceChart } from "./data/graph.js";
    import data_ancien from "./data/asm_vowels/ancien/data.json" with { type: "json" };
    import data_moderne from "./data/asm_vowels/moderne/data.json" with { type: "json" };
    import data_recent from "./data/asm_vowels/recent/data.json" with { type: "json" };

    createPerformanceChart('#graph_ancien', data_ancien);
    createPerformanceChart('#graph_moderne', data_moderne)
    createPerformanceChart('#graph_recent', data_recent)
</script>

<?php
document_end();
?>
