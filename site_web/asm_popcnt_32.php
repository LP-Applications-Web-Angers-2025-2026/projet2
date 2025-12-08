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
    <?php do_geshi("code/asm_popcnt_32/intro3.cpp", "cpp" ); ?>
    <p>
        Les méthodes que nous avons définies précédemment doivent être réécrites afin
        de prendre en compte les spécificités du nouveau tableau tab_process_bits :
    </p>
    <?php do_geshi("code/asm_popcnt_32/intro4.cpp", "cpp" ); ?>
    <p>
        Par exemple pour la méthode set, l’élément n se trouve à l’indice n / 8 du
        tableau tab_process_bits et occupe le bit à la position n % 8.La traduction de ce
        sous-programme en assembleur x86 32 bits est la suivante:
    </p>
    <?php do_geshi("code/asm_popcnt_32/intro5.cpp", "cpp" ); ?>
    <p>
        La fonction count doit être réécrite en utilisant la fonction pop_count_8 qui
        compte le nombre de bits à 1 dans un octet. Une version simple de cette fonction
        qui nous servira de fonction de référence, est par exemple:
    </p>
    <?php do_geshi("code/asm_popcnt_32/intro6.cpp", "cpp" ); ?>

