<?php
header('Content-Type: application/json');

// ============================================================
// API Benchmark : sert les données JSON pour Highcharts.
//
// Paramètres GET :
//   chapter  = numéro de chapitre (11..16)
//   arch     = ancien | moderne | recent
//   bench    = nom du dossier benchmark (alternatif à chapter)
// ============================================================

// Mapping chapter -> dossier benchmark
$chapMap = [
    11 => 'chapitre_11',
    12 => 'chapitre_12',
    13 => 'chapitre_13',
    14 => 'chapitre_14',
    15 => 'chapitre_15',
    16 => 'chapitre_16'
];

$arch = isset($_GET['arch']) ? $_GET['arch'] : 'ancien';

// Déterminer le dossier source
if (isset($_GET['chapter'])) {
    $chapNum = (int)$_GET['chapter'];
    $folder = isset($chapMap[$chapNum]) ? $chapMap[$chapNum] : null;
} elseif (isset($_GET['bench'])) {
    // Support de l'ancien paramètre bench (ex: asm_vowels_64)
    // On cherche d'abord dans les dossiers chapitre_*, sinon on essaie le nom direct
    $bench = $_GET['bench'];
    $folder = null;
    // Mapping bench -> chapitre
    $benchToChap = [
        'asm_matprod_32'  => 'chapitre_11',
        'asm_popcnt_64'   => 'chapitre_12',
        'asm_saxpy_32'    => 'chapitre_13',
        'asm_maxpars_64'  => 'chapitre_14',
        'asm_vowels_64'   => 'chapitre_15',
        'asm_fibonacci'   => 'chapitre_16'
    ];
    if (isset($benchToChap[$bench])) {
        $folder = $benchToChap[$bench];
    } else {
        // Essayer le nom direct comme dossier (ex: asm_vowels)
        $folder = $bench;
    }
} else {
    $folder = 'chapitre_15';
}

if (!$folder) {
    echo json_encode(["error" => "Chapitre inconnu."]);
    exit;
}

// Chercher le fichier JSON statique
$jsonPath = __DIR__ . '/' . $folder . '/' . $arch . '/data.json';

if (!file_exists($jsonPath)) {
    echo json_encode([
        "error" => "Fichier non trouvé: $folder/$arch/data.json",
        "bench" => $folder,
        "title" => "",
        "description" => "",
        "CPUs" => [],
        "Years" => [],
        "Methods" => []
    ]);
    exit;
}

// Lire et retourner le JSON tel quel
$data = file_get_contents($jsonPath);
echo $data;
