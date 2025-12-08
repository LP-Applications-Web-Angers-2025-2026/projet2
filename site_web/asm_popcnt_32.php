<?php
require_once('ez_web.php');
require_once('php-geshi/geshi.php');

document_begin();
?>

<div class="row">
<section class="cours">

<?php chapter("Etude de cas POPCNT", 0); ?>

    <h1>Introduction</h1>
    <p>Compter le nombre de bits à 1 dans un registre est une opération que l’on
        rencontre dans de nombreux traitements. Par exemple imaginons que l’on dispose
        d’un tableau de booléens qui indique si un élément d’un tableau d’enregistrements
        doit être traité ou non. La question se posera probablement de savoir combien
        d’enregistrements doivent être traités afin d’allouer l’espace juste nécessaire avant
        de manipuler les données. Si on utilise un tableau de booléens, on aura la définition
        de données suivante :
    </p>
    <?php do_geshi("code/asm_popcnt_32/intro1.cpp", "cpp" ); ?>
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
    <?php do_geshi("code/asm_popcnt_32/intro2.cpp", "cpp" ); ?>
