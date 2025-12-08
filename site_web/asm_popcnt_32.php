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
    <?php do_geshi("code/asm_popcnt_32/", "cpp" ); ?>