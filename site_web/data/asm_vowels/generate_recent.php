<?php

/**
 * Génère le fichier JSON utilisé par les graphiques "récents"
 * à partir des fichiers de résultats de asm_vowels_64 (test_methods.txt).
 *
 * À exécuter en PHP CLI depuis la racine du projet ou depuis site_web :
 *   php site_web/data/asm_vowels/generate_recent.php
 */

// Détection grossière de la racine du projet.
$this_dir = __DIR__;
$root = realpath($this_dir . '/../../../'); // .../projet2
if ($root === false) {
    fwrite(STDERR, "Impossible de localiser la racine du projet.\n");
    exit(1);
}

$asm_vowels_dir = $root . '/lar/asm_vowels_64';
$results_dir    = $asm_vowels_dir . '/results';

if (!is_dir($results_dir)) {
    fwrite(STDERR, "Répertoire des résultats introuvable : $results_dir\n");
    exit(1);
}

// --------------------------------------------------------------------
// Configuration : correspondance des dossiers CPU -> noms / années
// --------------------------------------------------------------------

$cpus_config = [
    // dossier dans lar/asm_vowels_64/results       nom affiché            année
    'AMD-Ryzen-5-5600G-with-Radeon-Graphics' => ['AMD Ryzen 5 5600g', 2021],
    // Le fichier test_methods.txt du i5‑12400F ne contient que les méthodes 4 et 5,
    // donc on le retire de la génération automatique pour éviter des valeurs manquantes.
    // '12th-Gen-Intel-Core-i5-12400F'          => ['Intel Core i5 12400f', 2022],
    'AMD-Ryzen-5-9600X-6-Core-Processor'     => ['AMD Ryzen 5 9600X', 2024],
    // Si tu ajoutes un dossier pour l'i7‑10850H, dé-commente et adapte :
    // 'Intel-Core-i7-10850H-2_70GHz'           => ['Intel Core i7 10850H', 2020],
];

// --------------------------------------------------------------------
// Configuration : mapping numéro de méthode -> libellé JSON
// (doit être cohérent avec les fichiers data.json déjà existants)
// --------------------------------------------------------------------

$method_map = [
    1  => 'C if',
    2  => 'C switch',
    3  => 'C tableau',
    4  => 'tableau asm',
    5  => 'tableau asm ur4 v1',
    6  => 'tableau asm ur4 v2',
    7  => 'tableau asm ur8 v1',
    8  => 'tableau asm ur8 v2',
    9  => 'tableau asm ur8 v3',
    10 => 'SSE2',              // cv_sse2_v1
    13 => 'AVX',               // cv_avx
    14 => 'AVX2 v1',           // cv_avx2_v1
    16 => 'AVX2 v3',           // cv_avx2_v3
    20 => 'AVX2 v2 ur8',       // cv_avx2_v2_u8
    21 => 'AVX2 intrinsics',   // cv_avx2_intrinsics
];

/**
 * Lit un test_methods.txt et renvoie un tableau index -> average
 *
 * Format attendu :
 *  1; 36.087; ... ;cv_if;...
 */
function read_test_methods($path)
{
    if (!is_file($path)) {
        throw new RuntimeException("Fichier introuvable : $path");
    }

    $fh = fopen($path, 'r');
    if (!$fh) {
        throw new RuntimeException("Impossible d’ouvrir : $path");
    }

    $data = [];

    while (($line = fgets($fh)) !== false) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#' || $line[0] === '-') {
            continue;
        }
        $parts = explode(';', $line);
        if (count($parts) < 3) {
            continue;
        }
        $idx = (int)trim($parts[0]);
        $avg = (float)str_replace(',', '.', trim($parts[1]));
        $data[$idx] = $avg;
    }

    fclose($fh);
    return $data;
}

// --------------------------------------------------------------------
// Construction de la structure JSON
// --------------------------------------------------------------------

$cpu_names = [];
$years     = [];

// initialiser un tableau vide pour chaque méthode définie
$methods_values = [];
foreach ($method_map as $label) {
    $methods_values[$label] = [];
}

foreach ($cpus_config as $cpu_dir => $info) {
    [$display_name, $year] = $info;
    $test_file = $results_dir . '/' . $cpu_dir . '/test_methods.txt';

    if (!is_file($test_file)) {
        throw new RuntimeException("test_methods.txt manquant pour $cpu_dir ($test_file)");
    }

    $cpu_names[] = $display_name;
    $years[]     = (int)$year;

    $measures = read_test_methods($test_file);

    foreach ($method_map as $index => $label) {
        if (!array_key_exists($index, $measures)) {
            // Si la méthode n'existe pas pour ce CPU, on met null
            // (Highcharts gère les valeurs null comme des trous dans la courbe).
            $methods_values[$label][] = null;
        } else {
            $value = round($measures[$index], 3);
            $methods_values[$label][] = $value;
        }
    }
}

$methods_list = [];
foreach ($method_map as $label) {
    $methods_list[] = [
        'name'   => $label,
        'values' => $methods_values[$label],
    ];
}

$data = [
    'CPUs'    => $cpu_names,
    'Years'   => $years,
    'Methods' => $methods_list,
    // Les Ratios ne sont pas utilisés par graph.js, on laisse vide pour l’instant.
    'Ratios'  => new stdClass(),
];

$out_path = $this_dir . '/recent/data.json';
if (!is_dir(dirname($out_path))) {
    if (!mkdir(dirname($out_path), 0777, true) && !is_dir(dirname($out_path))) {
        throw new RuntimeException('Impossible de créer le répertoire : ' . dirname($out_path));
    }
}

$json = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
if ($json === false) {
    throw new RuntimeException('Erreur lors de l’encodage JSON : ' . json_last_error_msg());
}

if (file_put_contents($out_path, $json) === false) {
    throw new RuntimeException("Échec d’écriture de $out_path");
}

echo "Fichier JSON généré : $out_path\n";

