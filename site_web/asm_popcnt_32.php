<?php
require_once('ez_web.php');
require_once('php-geshi/geshi.php');

document_begin();

$fichier = "./javascript/pdf_parser/output/programmation_assembleur.txt";

$contenu = file($fichier, FILE_IGNORE_NEW_LINES); // tableau de lignes


$chapitre = "12.1 Introduction";

$chapitre2 = "16 bool tab_process[ MAX_RECORDS ];";
$chapitre3 = "324 CHAPITRE 12. ETUDE DE CAS POPCNT";
$chapitre4 = "17 return total;";
$chapitre5 = "2 u8 tab_process_bits[ MAX_RECORDS_IN_BYTES ];";
$chapitre6 ="18 return total;";


$Lignes5 =5;
$Lignes15 =15;
$Lignes20 =20;
$nombreLignes1 =7;
$nombreLignes2 =5;
$nombreLignes3 =8;
$nombreLignes4 =12;
$nombreLignes5 =2;
$nombreLignes6 =3;

$resultat = [];
$trouve = false;

$resultat2 = [];
$trouve2 = false;

$resultat3 = [];
$trouve3 = false;

$resultat4 = [];
$trouve4 = false;

$resultat5 = [];
$trouve5 = false;
$resultat6 = [];
$trouve6 = false;

foreach ($contenu as $index => $ligne) {
    // Recherche du titre
    if (trim($ligne) === $chapitre) {
        $trouve = true;
        // On récupère les lignes suivantes
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
        // On récupère les lignes suivantes
        for ($i = 1; $i <= $nombreLignes2; $i++) {
            if (isset($contenu[$index + $i])) {
                $resultat2[] = $contenu[$index + $i];
            }
        }
        break;
    }
}

foreach ($contenu as $index => $ligne) {
    // Recherche du titre
    if (trim($ligne) === $chapitre3) {
        $trouve3 = true;
        // On récupère les lignes suivantes
        for ($i = 2; $i <= $nombreLignes3; $i++) {
            if (isset($contenu[$index + $i])) {
                $resultat3[] = $contenu[$index + $i];
            }
        }
        break; // on peut sortir de la boucle
    }
}

foreach ($contenu as $index => $ligne) {
    // Recherche du titre
    if (trim($ligne) === $chapitre4) {
        $trouve4 = true;
        // On récupère les lignes suivantes
        for ($i = 2; $i <= $nombreLignes4; $i++) {
            if (isset($contenu[$index + $i])) {
                $resultat4[] = $contenu[$index + $i];
            }
        }
        break; // on peut sortir de la boucle
    }
}

foreach ($contenu as $index => $ligne) {
    // Recherche du titre
    if (trim($ligne) === $chapitre5) {
        $trouve5 = true;
        // On récupère les lignes suivantes
        for ($i = 1; $i <= $nombreLignes5; $i++) {
            if (isset($contenu[$index + $i])) {
                $resultat5[] = $contenu[$index + $i];
            }
        }
        break;
    }
}

foreach ($contenu as $index => $ligne) {
    // Recherche du titre
    if (trim($ligne) === $chapitre6) {
        $trouve6 = true;
        // On récupère les lignes suivantes
        for ($i = 2; $i <= $nombreLignes6 +1 ; $i++) {
            if (isset($contenu[$index + $i])) {
                $resultat6[] = $contenu[$index + $i];
            }
        }
        break;
    }
}
?>

    <div class="row">
    <section class="cours">
<?php chapter("Etude de cas POPCNT", 0); ?>
    <h1>Introduction</h1>
        <?php section("Section"); ?>

        <?php if ($trouve) { // retravailler
            echo "<pre>"; foreach ( $resultat as $ligne => $lignes){
                echo $lignes;
                echo "<br>";
            } echo "</pre>";
        } else { echo "Titre non trouvé."; }
        ?>

        <?php
        /*

        <p>Compter le nombre de bits à 1 dans un registre est une opération que l’on
        rencontre dans de nombreux traitements. Par exemple imaginons que l’on dispose
        d’un tableau de booléens qui indique si un élément d’un tableau d’enregistrements
        doit être traité ou non. La question se posera probablement de savoir combien
        d’enregistrements doivent être traités afin d’allouer l’espace juste nécessaire avant
        de manipuler les données. Si on utilise un tableau de booléens, on aura la définition
        de données suivante :
        </p>
        */
        ?>

<?php do_geshi("code/asm_popcnt_32/intro1.cpp", "cpp" ); ?>

        <?php
        if ($trouve2) { // retravailler
            echo "<pre>"; foreach ( $resultat2 as $ligne => $lignes){
                echo $lignes;
                echo "<br>";
            } echo "</pre>";
        } else { echo "Code non trouvé."; }
        ?>

        <?php
        /*
        ?>
    <p>
        La variable tab_records est un tableau d’enregistrements et tab_process un
        tableau de booléens. Si la variable tab_process[i] est à true cela signifie que
        l’enregistrement correspondant devra être pris en compte dans un traitement
        ultérieur.
        On pourra donc définir plusieurs méthodes liées au traitement du tableau tab_process :
    </p>
    <ul>
        <li>void set(u32 n) qui met à jour le tableau tab_process afin d’indiquer que
            l’enregistrement n doit être traité</li>
        <li>void unset(u32 n) qui met à jour le tableau tab_process afin d’indiquer que
            l’enregistrement n ne doit pas être traité</li>
        <li>bool use(u32 n) qui retourne true si on doit traiter l’enregistrement n</li>
        <li>u32 count() qui retourne le nombre d’enregistrements qui doivent être traités</li>
    </ul>
    <p>
        Le code de ces sous-programmes est très simple et ressemble à ce qui suit :
    </p>
    */
?>

        <?php

        if ($trouve3) { // retravailler
            echo "<pre>"; foreach ( $resultat3 as $ligne => $lignes){
                echo $lignes;
                echo "<br>";
            } echo "</pre>";
        } else { echo "Chapitre non trouvé."; }

        ?>
<?php do_geshi("code/asm_popcnt_32/intro2.cpp", "cpp" ); ?>


        <?php
        if ($trouve4) { // retravailler
            echo "<pre>"; foreach ( $resultat4 as $ligne => $lignes){
                echo $lignes;
                echo "<br>";
            } echo "</pre>";
        } else { echo "Chapitre non trouvé."; }

        ?>
        <?php
        /*
    <p>La variable tab_process étant un tableau de booléens elle occupe en mé
        moire 100_000 octets car un booléen possède une taille d’un octet. On utilise
        donc 100_000/1024 ≃ 98 ko. Cependant sur ces 100_000 octets, seuls 100_000 bits
        sont vraiment utiles car la constante true est en fait égale à 1 et false vaut 0. En
        d’autres termes, 7 bits sur 8, soit 87,5 % sont inutiles car non utilisés, seul le bit de
        poids faible code pour true ou false.

        Il est donc plus intéressant de ne pas perdre de mémoire et de coder chaque
        valeur booléenne non pas par un octet mais par un bit. On parle alors de com
        pactage des données. Dans ce cas le tabeau tab_process que nous renommons
        alors tab_process_bits aura une taille de (100_000 + 7)/8 ≃ 12500 ≃ 12,2 ko.
        L’expression 100_000 + 7 permet d’arrondir la taille à l’octet supérieur.
    </p>
    */
    ?>
<?php do_geshi("code/asm_popcnt_32/intro3.cpp", "cpp" ); ?>

        <?php

        if ($trouve5) { // retravailler
            echo "<pre>"; foreach ( $resultat5 as $ligne => $lignes){
                echo $lignes;
                echo "<br>";
            } echo "</pre>";
        } else { echo "code non trouvé."; }

        ?>

<?php
/*
    <p>
        Les méthodes que nous avons définies précédemment doivent être réécrites afin
        de prendre en compte les spécificités du nouveau tableau tab_process_bits :
    </p>
    */

?>

<?php do_geshi("code/asm_popcnt_32/intro4.cpp", "cpp" ); ?>

        <?php

        if ($trouve6) { // retravailler
            echo "<pre>"; foreach ( $resultat6 as $ligne => $lignes){
                echo $lignes;
                echo "<br>";
            } echo "</pre>";
        } else { echo "code 12 non trouvé."; }
        ?>
        <?php
        /*
    <p>
        Par exemple pour la méthode set, l’élément n se trouve à l’indice n / 8 du
        tableau tab_process_bits et occupe le bit à la position n % 8.La traduction de ce
        sous-programme en assembleur x86 32 bits est la suivante:
    </p>
    */
    ?>
<?php do_geshi("code/asm_popcnt_32/intro5.asm", "asm" ); ?>

    <p>
        La fonction count doit être réécrite en utilisant la fonction pop_count_8 qui
        compte le nombre de bits à 1 dans un octet. Une version simple de cette fonction
        qui nous servira de fonction de référence, est par exemple:
    </p>
<?php do_geshi("code/asm_popcnt_32/intro6.cpp", "cpp" ); ?>

        <div class="Version de référence, élimination du if">
            <p> La version de référence améliorée en supprimant le if s’exécute en 48,78
                secondes ce qui constitue une faible mais notable amélioration.</p>
        </div>


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
            import data_ancien from "./data/asm_popcnt_32/ancien/data.json" with { type: "json" };
            import data_moderne from "./data/asm_popcnt_32/moderne/data.json" with { type: "json" };
            import data_recent from "./data/asm_popcnt_32/recent/data.json" with { type: "json" };

            createPerformanceChart('#graph_ancien', data_ancien);
            createPerformanceChart('#graph_moderne', data_moderne)
            createPerformanceChart('#graph_recent', data_recent)
        </script>

        <?php document_end();?>
