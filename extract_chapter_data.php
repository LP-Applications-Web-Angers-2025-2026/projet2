<?php
/**
 * extract_chapter_data.php
 *
 * Script de génération des fichiers JSON de données de performance
 * pour chaque étude de cas (chapitres 11 à 16).
 *
 * Chaque chapitre dispose de sa propre fonction qui retourne un tableau
 * de données structuré, conformément au format attendu par graph.js.
 *
 * Structure JSON cible :
 * {
 *   "chapter":  <int>,
 *   "title":    <string>,
 *   "description": <string>,
 *   "CPUs":    [<string>, ...],
 *   "Years":   [<int>, ...],
 *   "Methods": [
 *       { "name": <string>, "values": [<float|null>, ...] },
 *       ...
 *   ]
 * }
 *
 * Usage :
 *   php extract_chapter_data.php [--chapter=<num>] [--dry-run]
 *
 *   --chapter=N  : ne générer que les données du chapitre N (11-16)
 *   --dry-run    : afficher les données sans écrire les fichiers
 */

// ──────────────────────────────────────────────────────────────────
// Constantes
// ──────────────────────────────────────────────────────────────────
define('DATA_DIR', __DIR__ . '/site_web/data');

// ──────────────────────────────────────────────────────────────────
// Fonctions utilitaires
// ──────────────────────────────────────────────────────────────────

/**
 * Crée le répertoire si nécessaire et sauvegarde un fichier JSON.
 *
 * @param string $path    Chemin complet du fichier destination
 * @param array  $data    Données à sérialiser
 * @param bool   $dryRun  Si vrai, affiche sans écrire
 */
function saveJson(string $path, array $data, bool $dryRun = false): void
{
    $json = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

    if ($dryRun) {
        echo "=== DRY-RUN : $path ===\n$json\n\n";
        return;
    }

    $dir = dirname($path);
    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
    }
    file_put_contents($path, $json);
    echo "[OK] $path\n";
}

// ──────────────────────────────────────────────────────────────────
// Chapitre 11 : Produit de matrices (32 bits, dim 2048×2048)
// ──────────────────────────────────────────────────────────────────

/**
 * Retourne les données de performance pour le chapitre 11 (produit de matrices).
 * Source : TABLE11.4 (ancien), TABLE11.5 (moderne), TABLE11.6 (récent).
 *
 * @return array  Tableau associatif ['ancien' => [...], 'moderne' => [...], 'recent' => [...]]
 */
function getChapter11Data(): array
{
    $methods = [
        "mp_reference",
        "mp_asm_fpu",
        "mp_asm_fpu_ur4",
        "mp_inv_jk_O2",
        "mp_inv_jk",
        "mp_inv_jk_sse",
        "mp_inv_jk_avx",
        "mp_tile_4x4",
        "mp_tile_bxb_v1",
        "mp_tile_bxb_v2",
        "mp_tile_bxb_v3",
        "mp_tile_bxb_v4",
    ];

    $base = [
        "chapter"     => 11,
        "title"       => "Produit de matrices",
        "description" => "Temps d'exécution en secondes du produit de matrices 2048×2048 en 32 bits.",
    ];

    // TABLE11.4 – Architectures anciennes (avant 2015)
    $ancien = array_merge($base, [
        "CPUs"    => ["Pentium D 925", "Core 2 Q9300", "Core i7 860", "AMD X6 1090T", "Core i5 3570k", "Core i7 4790"],
        "Years"   => [2006, 2008, 2009, 2010, 2012, 2014],
        "Methods" => [
            ["name" => "mp_reference",    "values" => [363.91, 257.74,  90.53, 172.35,  78.62,  64.46]],
            ["name" => "mp_asm_fpu",      "values" => [380.06, 190.83,  74.86, 180.55,  78.33,  63.05]],
            ["name" => "mp_asm_fpu_ur4",  "values" => [379.90, 197.35,  74.40, 179.28,  79.18,  63.02]],
            ["name" => "mp_inv_jk_O2",    "values" => [ 23.07,  14.94,   8.25,  10.35,   6.27,   5.00]],
            ["name" => "mp_inv_jk",       "values" => [  null,   null,   null,   null,   8.51,   8.09]],
            ["name" => "mp_inv_jk_sse",   "values" => [ 85.23,  32.28,   4.36,  17.06,   4.32,   4.96]],
            ["name" => "mp_inv_jk_avx",   "values" => [  null,   null,   null,   null,   2.33,   1.93]],
            ["name" => "mp_tile_4x4",     "values" => [ 35.77,  28.71,  10.19,  21.24,   7.98,   6.76]],
            ["name" => "mp_tile_bxb_v1",  "values" => [ 28.19, 178.39,  23.82,  60.46,  19.25,  16.82]],
            ["name" => "mp_tile_bxb_v2",  "values" => [ 25.74,  33.68,  23.15,  49.14,  15.20,  11.67]],
            ["name" => "mp_tile_bxb_v3",  "values" => [ 12.62,   7.99,   3.98,   7.62,   2.97,   1.86]],
            ["name" => "mp_tile_bxb_v4",  "values" => [ 14.11,   7.70,   3.74,   6.36,   2.82,   1.55]],
        ],
    ]);

    // TABLE11.5 – Architectures modernes (2015-2019)
    $moderne = array_merge($base, [
        "CPUs"    => ["Core i3 6100", "Ryzen 7 1700X", "Core i5 7400", "Core i7 8700", "Ryzen 5 3600", "Xeon Silver 4208"],
        "Years"   => [2015, 2017, 2017, 2017, 2019, 2019],
        "Methods" => [
            ["name" => "mp_reference",    "values" => [ 60.08,  57.66,  49.10,  50.13,  43.62,  53.63]],
            ["name" => "mp_asm_fpu",      "values" => [ 59.77,  52.46,  49.28,  46.85,  34.42,  53.23]],
            ["name" => "mp_asm_fpu_ur4",  "values" => [ 60.63,  55.26,  48.36,  42.57,  45.58,  52.22]],
            ["name" => "mp_inv_jk_O2",    "values" => [ 10.22,   6.84,  10.32,   8.01,   6.16,  11.28]],
            ["name" => "mp_inv_jk",       "values" => [  2.11,   null,   1.53,   1.56,   0.92,   2.22]],
            ["name" => "mp_inv_jk_sse",   "values" => [  5.84,   5.53,   5.81,   4.53,   4.39,   4.33]],
            ["name" => "mp_inv_jk_avx",   "values" => [  2.18,   1.76,   1.63,   1.40,   1.03,   2.51]],
            ["name" => "mp_tile_4x4",     "values" => [  6.89,   6.35,   5.27,   4.71,   4.62,   7.74]],
            ["name" => "mp_tile_bxb_v1",  "values" => [ 17.31, 122.13,  18.05,  14.03,  37.54,  21.31]],
            ["name" => "mp_tile_bxb_v2",  "values" => [ 12.49,  27.39,  12.70,  10.57,  27.60,  13.40]],
            ["name" => "mp_tile_bxb_v3",  "values" => [  1.84,   1.78,   1.85,   null,   2.48,   0.97]],
            ["name" => "mp_tile_bxb_v4",  "values" => [  1.48,   null,   null,   null,   1.72,   2.48]],
        ],
    ]);

    // TABLE11.6 – Architectures récentes (2020+)
    $recent = array_merge($base, [
        "CPUs"    => ["Core i7 10850H", "Ryzen 5 5600g", "Ryzen 5 9600X"],
        "Years"   => [2020, 2021, 2024],
        "Methods" => [
            ["name" => "mp_reference",    "values" => [39.18,  46.48,  36.25]],
            ["name" => "mp_asm_fpu",      "values" => [39.70,  39.27,  35.07]],
            ["name" => "mp_asm_fpu_ur4",  "values" => [37.56,  46.59,  38.73]],
            ["name" => "mp_inv_jk_O2",    "values" => [ 7.71,   4.19,   3.22]],
            ["name" => "mp_inv_jk",       "values" => [ 1.26,   0.80,   0.29]],
            ["name" => "mp_inv_jk_sse",   "values" => [ 2.76,   2.68,   0.75]],
            ["name" => "mp_inv_jk_avx",   "values" => [ 1.33,   0.90,   0.34]],
            ["name" => "mp_tile_4x4",     "values" => [ 4.59,   4.91,   2.47]],
            ["name" => "mp_tile_bxb_v1",  "values" => [13.18,  28.61,  14.54]],
            ["name" => "mp_tile_bxb_v2",  "values" => [ 9.76,  21.36,  13.57]],
            ["name" => "mp_tile_bxb_v3",  "values" => [ 1.47,   0.97,   0.70]],
            ["name" => "mp_tile_bxb_v4",  "values" => [ 1.23,   null,   null]],
        ],
    ]);

    return ['ancien' => $ancien, 'moderne' => $moderne, 'recent' => $recent];
}

// ──────────────────────────────────────────────────────────────────
// Chapitre 12 : POPCNT – Compter les bits à 1
// ──────────────────────────────────────────────────────────────────

/**
 * Retourne les données de performance pour le chapitre 12 (POPCNT).
 * Source : TABLE12.2 (ancien), TABLE12.3 (moderne ≡ "récent" du chap),
 *          TABLE12.4 (actuelles).
 *
 * Note : les labels "ancien/moderne/recent" correspondent aux tables 12.2/12.3/12.4.
 */
function getChapter12Data(): array
{
    $methods = [
        "u8_reference", "u8_reference_opt", "u32_reference", "u32_reference_opt",
        "u8_shift_v1",  "u8_shift_v2",      "u32_shift_v1",  "u32_shift_v2",
        "u8_asm",       "u32_asm",           "u32_asm_ur4",
        "u32_sse_v1",   "u32_sse_v2",        "u32_avx2_v1",   "u8_intrinsics",
    ];

    $base = [
        "chapter"     => 12,
        "title"       => "POPCNT – Compter les bits à 1",
        "description" => "Temps d'exécution en secondes pour 30 000 exécutions de la fonction popcnt sur des tableaux de 262 207 octets.",
    ];

    // TABLE12.2 – Architectures anciennes
    $ancien = array_merge($base, [
        "CPUs"  => ["Pentium D 925", "Core 2 Q9300", "Core i7 860", "AMD X6 1090T", "Core i5 3570K", "Core i7 4790"],
        "Years" => [2006, 2008, 2009, 2010, 2012, 2014],
        "Methods" => [
            ["name" => "u8_reference",      "values" => [150.22, 170.20, 110.19,  80.21,  72.58,  54.99]],
            ["name" => "u8_reference_opt",  "values" => [111.73, 161.63, 102.39,  64.68,  65.12,  47.38]],
            ["name" => "u32_reference",     "values" => [126.41, 105.45,  60.91,  43.46,  53.34,  39.42]],
            ["name" => "u32_reference_opt", "values" => [ 73.51,  88.36,  60.81,  43.31,  48.68,  33.40]],
            ["name" => "u8_shift_v1",       "values" => [ 16.50,   7.77,   4.52,   4.31,   3.23,   1.98]],
            ["name" => "u8_shift_v2",       "values" => [ 16.45,   7.66,   4.76,   4.62,   3.20,   2.02]],
            ["name" => "u32_shift_v1",      "values" => [  8.01,   4.25,   2.05,   2.50,   1.29,   0.56]],
            ["name" => "u32_shift_v2",      "values" => [  7.76,   3.13,   1.82,   1.86,   1.06,   0.49]],
            ["name" => "u8_asm",            "values" => [  null,   null,   6.88,  10.94,   4.65,   2.96]],
            ["name" => "u32_asm",           "values" => [  null,   null,   1.27,   1.65,   1.16,   0.71]],
            ["name" => "u32_asm_ur4",       "values" => [  null,   null,   null,   0.89,   0.88,   0.49]],
            ["name" => "u32_sse_v1",        "values" => [  null,   null,   0.96,   1.52,   0.92,   0.74]],
            ["name" => "u32_sse_v2",        "values" => [  null,   null,   null,   null,   1.06,   0.81]],
            ["name" => "u32_avx2_v1",       "values" => [  null,   null,   null,   null,   null,   0.71]],
            ["name" => "u8_intrinsics",     "values" => [  4.55,   null,   0.92,   1.35,   0.76,   0.61]],
        ],
    ]);

    // TABLE12.3 – Architectures modernes (labellisées "récentes" dans le livre)
    $moderne = array_merge($base, [
        "CPUs"  => ["Core i3 6100", "Ryzen 7 1700X", "Core i5 7400", "Core i7 8700", "Ryzen 5 3600", "Xeon Silver 4208"],
        "Years" => [2015, 2017, 2017, 2017, 2019, 2019],
        "Methods" => [
            ["name" => "u8_reference",      "values" => [ 57.99,  59.13,  64.81,  47.28,  54.96,  71.73]],
            ["name" => "u8_reference_opt",  "values" => [ 53.14,  54.11,  58.58,  43.03,  48.78,  74.70]],
            ["name" => "u32_reference",     "values" => [ 36.39,  44.72,  39.89,  29.53,  35.36,  54.49]],
            ["name" => "u32_reference_opt", "values" => [ 32.65,  28.77,  35.83,  26.47,  23.67,  46.18]],
            ["name" => "u8_shift_v1",       "values" => [  2.17,   2.51,   2.32,   1.75,   2.83,   2.49]],
            ["name" => "u8_shift_v2",       "values" => [  2.11,   2.51,   2.23,   1.70,   2.84,   2.50]],
            ["name" => "u32_shift_v1",      "values" => [  0.61,   1.00,   0.64,   0.49,   0.44,   0.72]],
            ["name" => "u32_shift_v2",      "values" => [  0.50,   null,   null,   0.80,   0.54,   null]],
            ["name" => "u8_asm",            "values" => [  6.39,   3.24,   6.83,   5.20,   3.06,   7.53]],
            ["name" => "u32_asm",           "values" => [  1.07,   0.68,   1.14,   0.86,   0.62,   0.91]],
            ["name" => "u32_asm_ur4",       "values" => [  0.54,   0.51,   0.59,   0.45,   0.47,   0.74]],
            ["name" => "u32_sse_v1",        "values" => [  0.90,   0.90,   0.96,   0.72,   0.83,   1.05]],
            ["name" => "u32_sse_v2",        "values" => [  0.87,   0.74,   0.92,   0.70,   0.64,   1.05]],
            ["name" => "u32_avx2_v1",       "values" => [  0.87,   0.83,   0.95,   0.70,   0.69,   1.02]],
            ["name" => "u8_intrinsics",     "values" => [  0.64,   0.64,   0.68,   0.52,   0.56,   0.76]],
        ],
    ]);

    // TABLE12.4 – Architectures actuelles (récentes)
    $recent = array_merge($base, [
        "CPUs"  => ["Core i7 10850H", "Ryzen 5 5600g", "Core i5 12400F", "Ryzen 5 9600X"],
        "Years" => [2020, 2021, 2022, 2024],
        "Methods" => [
            ["name" => "u8_reference",      "values" => [43.82, 46.19, 51.75, 21.68]],
            ["name" => "u8_reference_opt",  "values" => [40.06, 42.72, 49.10, 20.69]],
            ["name" => "u32_reference",     "values" => [27.42, 25.91, 35.64, 18.39]],
            ["name" => "u32_reference_opt", "values" => [24.50, 21.25, 28.58, 17.80]],
            ["name" => "u8_shift_v1",       "values" => [ 1.65,  2.28,  0.73,  0.20]],
            ["name" => "u8_shift_v2",       "values" => [ 1.61,  2.29,  0.73,  0.19]],
            ["name" => "u32_shift_v1",      "values" => [ 0.48,  0.37,  0.31,  0.15]],
            ["name" => "u32_shift_v2",      "values" => [ 0.39,  null,  null,  null]],
            ["name" => "u8_asm",            "values" => [ 2.45,  3.60,  1.79,  1.46]],
            ["name" => "u32_asm",           "values" => [ 0.80,  0.45,  0.50,  0.36]],
            ["name" => "u32_asm_ur4",       "values" => [ 0.41,  0.44,  0.44,  0.36]],
            ["name" => "u32_sse_v1",        "values" => [ 0.67,  0.79,  0.65,  0.36]],
            ["name" => "u32_sse_v2",        "values" => [ 0.66,  0.53,  0.63,  0.47]],
            ["name" => "u32_avx2_v1",       "values" => [ 0.65,  0.73,  0.69,  0.36]],
            ["name" => "u8_intrinsics",     "values" => [ 0.49,  0.47,  0.44,  0.32]],
        ],
    ]);

    return ['ancien' => $ancien, 'moderne' => $moderne, 'recent' => $recent];
}

// ──────────────────────────────────────────────────────────────────
// Chapitre 13 : SAXPY modifiée
// ──────────────────────────────────────────────────────────────────

/**
 * Retourne les données de performance pour le chapitre 13 (SAXPY modifiée).
 * Source : TABLE13.3 (ancien), TABLE13.4 (moderne), TABLE13.5 (récent).
 * 50 000 répétitions sur des vecteurs de 524 287 éléments.
 */
function getChapter13Data(): array
{
    $base = [
        "chapter"     => 13,
        "title"       => "Variante de SAXPY",
        "description" => "Temps d'exécution en secondes pour 50 000 répétitions sur des vecteurs de 524 287 éléments (a×X+Y avec retour de la somme).",
    ];

    // TABLE13.3 – Architectures anciennes
    $ancien = array_merge($base, [
        "CPUs"  => ["Pentium D 925", "Core 2 Q9300", "Core i7 860", "AMD X6 1090T", "Core i5 3570k", "Core i7 4790"],
        "Years" => [2006, 2008, 2009, 2010, 2012, 2014],
        "Methods" => [
            ["name" => "C",                  "values" => [ 97.29,  75.68,  23.35,  32.31,  23.58,  19.70]],
            ["name" => "asm fpu",            "values" => [101.91,  62.52,  24.69,  30.75,  23.74,  19.70]],
            ["name" => "asm fpu ur4",        "values" => [ 91.77,  58.92,  25.36,  30.47,  23.64,  19.68]],
            ["name" => "asm sse",            "values" => [ 86.84,  52.38,  11.16,  24.74,   8.70,   6.00]],
            ["name" => "C sse intrin.",      "values" => [  null,  84.11,   null,   null,   8.33,   5.64]],
            ["name" => "asm avx",            "values" => [  null,   null,   null,   null,   8.21,   5.42]],
            ["name" => "asm avx2 ur2",       "values" => [  null,   null,   null,   null,   8.42,   5.42]],
            ["name" => "asm avx2 ur4",       "values" => [  null,   null,   null,   null,   8.11,   5.48]],
            ["name" => "C avx2 intrin.",     "values" => [  null,   null,   null,   null,   null,   5.43]],
            ["name" => "C avx2 ez_ii",       "values" => [  null,   null,   null,   null,   null,   5.41]],
            ["name" => "asm fma",            "values" => [  null,   null,   null,   null,   null,   5.43]],
            ["name" => "C fma ez_ii",        "values" => [  null,   null,   null,   null,   null,   5.44]],
            ["name" => "C avx512 intrin.",   "values" => [  null,   null,   null,   null,   null,   null]],
            ["name" => "C avx512 fma intr.", "values" => [  null,   null,   null,   null,   null,   null]],
        ],
    ]);

    // TABLE13.4 – Architectures modernes
    $moderne = array_merge($base, [
        "CPUs"  => ["Core i3 6100", "Ryzen 7 1700X", "Core i5 7400", "Core i7 8700", "Ryzen 5 3600", "Xeon Silver 4208"],
        "Years" => [2015, 2017, 2017, 2017, 2019, 2019],
        "Methods" => [
            ["name" => "C",                  "values" => [22.35, 33.89, 22.95, 17.30, 31.36, 25.98]],
            ["name" => "asm fpu",            "values" => [23.01, 33.76, 23.02, 17.33, 31.30, 25.62]],
            ["name" => "asm fpu ur4",        "values" => [22.96, 33.84, 22.97, 17.28, 31.33, 25.93]],
            ["name" => "asm sse",            "values" => [ 9.41,  5.16,  7.93,  5.79,  4.90,  9.90]],
            ["name" => "C sse intrin.",      "values" => [ 9.02,  5.38,  7.79,  5.74,  5.04,  9.40]],
            ["name" => "asm avx",            "values" => [ 7.56,  3.53,  5.26,  3.75,  2.62,  9.83]],
            ["name" => "asm avx2 ur2",       "values" => [ 7.49,  3.49,  5.13,  3.72,  2.58, 10.08]],
            ["name" => "asm avx2 ur4",       "values" => [ 7.46,  3.43,  5.09,  3.72,  2.56,  9.82]],
            ["name" => "C avx2 intrin.",     "values" => [ 7.17,  3.29,  4.93,  3.67,  2.61,  9.88]],
            ["name" => "C avx2 ez_ii",       "values" => [ 7.18,  3.33,  4.95,  3.68,  2.62,  9.13]],
            ["name" => "asm fma",            "values" => [ 7.27,  3.37,  5.03,  3.68,  2.67,  9.75]],
            ["name" => "C fma ez_ii",        "values" => [ 7.22,  3.28,  null,  null,  2.65,  9.98]],
            ["name" => "C avx512 intrin.",   "values" => [ null,  null,  null,  null,  null, 11.59]],
            ["name" => "C avx512 fma intr.", "values" => [ null,  null,  null,  null,  null, 11.47]],
        ],
    ]);

    // TABLE13.5 – Architectures récentes
    $recent = array_merge($base, [
        "CPUs"  => ["Core i7 10850H", "Ryzen 5 5600g", "Core i5 12400F", "Ryzen 5 9600X"],
        "Years" => [2020, 2021, 2022, 2024],
        "Methods" => [
            ["name" => "C",                  "values" => [16.05, 38.86, 18.50, 29.19]],
            ["name" => "asm fpu",            "values" => [16.22, 39.81, 18.35, 29.09]],
            ["name" => "asm fpu ur4",        "values" => [16.14, 39.95, 18.62, 29.09]],
            ["name" => "asm sse",            "values" => [ 5.49,  5.36,  4.51,  3.77]],
            ["name" => "C sse intrin.",      "values" => [ 5.35,  5.31,  4.60,  2.54]],
            ["name" => "asm avx",            "values" => [ 3.79,  3.75,  4.41,  1.60]],
            ["name" => "asm avx2 ur2",       "values" => [ 3.75,  3.47,  4.42,  1.58]],
            ["name" => "asm avx2 ur4",       "values" => [ 3.72,  3.44,  4.49,  1.55]],
            ["name" => "C avx2 intrin.",     "values" => [ 3.62,  3.26,  4.79,  1.54]],
            ["name" => "C avx2 ez_ii",       "values" => [ 3.62,  3.39,  4.75,  1.56]],
            ["name" => "asm fma",            "values" => [ 3.66,  3.30,  4.40,  1.58]],
            ["name" => "C fma ez_ii",        "values" => [ 3.61,  3.38,  4.81,  1.56]],
            ["name" => "C avx512 intrin.",   "values" => [ null,  null,  null,  1.49]],
            ["name" => "C avx512 fma intr.", "values" => [ null,  null,  null,  1.53]],
        ],
    ]);

    return ['ancien' => $ancien, 'moderne' => $moderne, 'recent' => $recent];
}

// ──────────────────────────────────────────────────────────────────
// Chapitre 14 : Maximum de parcimonie (Fitch)
// ──────────────────────────────────────────────────────────────────

/**
 * Retourne les données de performance pour le chapitre 14 (Fitch / parcimonie).
 * Source : TABLE14.3 (ancien), TABLE14.4 (moderne), TABLE14.5 (récent).
 * 50 000 répétitions sur des chaînes de 524 287 bases.
 */
function getChapter14Data(): array
{
    $base = [
        "chapter"     => 14,
        "title"       => "Maximum de Parcimonie (Fitch)",
        "description" => "Temps d'exécution en secondes pour 50 000 répétitions sur des chaînes de 524 287 bases (bioinformatique).",
    ];

    // TABLE14.3 – Architectures anciennes
    $ancien = array_merge($base, [
        "CPUs"  => ["Pentium D 925", "Core 2 Q9300", "Core i7 860", "AMD X6 1090T", "Core i5 3570K", "Core i7 4790"],
        "Years" => [2006, 2008, 2009, 2010, 2012, 2014],
        "Methods" => [
            ["name" => "ref_v1_O2",          "values" => [224.64, 170.22, 131.86, 110.89, 140.27, 103.54]],
            ["name" => "ref_v1_O3",          "values" => [  null,   null,  29.86,  11.80,   null,   5.47]],
            ["name" => "asm",                "values" => [235.32, 185.40, 126.40, 118.98, 114.89,  96.59]],
            ["name" => "no_if_asm",          "values" => [133.48,  98.36,  67.72,  52.67,  48.67,  41.62]],
            ["name" => "no_if_opt_asm",      "values" => [ 94.97,  85.60,  65.33,  45.64,  33.35,  25.95]],
            ["name" => "no_if_opt_ur4_asm",  "values" => [ 70.15,  87.67,  51.68,  38.16,  28.95,  22.52]],
            ["name" => "no_if_opt_ur8_asm",  "values" => [ 70.29,  86.91,  50.25,  36.73,  28.32,  21.89]],
            ["name" => "sse2_v1",            "values" => [ 27.64,   9.37,   5.84,  11.75,   4.49,   3.66]],
            ["name" => "sse41",              "values" => [  null,   9.25,   5.72,   null,   4.42,   3.73]],
            ["name" => "avx2",               "values" => [  null,   null,   null,   null,   null,   1.86]],
            ["name" => "avx2_intrinsics",    "values" => [  null,   null,   null,   null,   null,   1.89]],
        ],
    ]);

    // TABLE14.4 – Architectures modernes
    $moderne = array_merge($base, [
        "CPUs"  => ["Core i3 6100", "Ryzen 7 1700X", "Core i5 7400", "Core i7 8700", "Ryzen 5 3600", "Xeon Silver 4208"],
        "Years" => [2015, 2017, 2017, 2017, 2019, 2019],
        "Methods" => [
            ["name" => "ref_v1_O2",          "values" => [139.36, 111.55, 148.59,  96.72, 103.41, 118.36]],
            ["name" => "ref_v1_O3",          "values" => [  2.20,   2.50,   2.45,   1.85,   2.02,   3.61]],
            ["name" => "asm",                "values" => [104.56, 106.52, 110.79,  84.37, 101.56, 123.00]],
            ["name" => "no_if_asm",          "values" => [ 42.58,  53.86,  45.42,  34.68,  47.03,  42.45]],
            ["name" => "no_if_opt_asm",      "values" => [ 21.43,  19.58,  22.82,  17.40,  17.24,  49.80]],
            ["name" => "no_if_opt_ur4_asm",  "values" => [ 19.67,  18.85,  20.95,  15.92,  16.75,  23.04]],
            ["name" => "no_if_opt_ur8_asm",  "values" => [ 18.75,  17.17,  19.99,  15.21,  14.68,  22.56]],
            ["name" => "sse2_v1",            "values" => [  3.58,   3.59,   3.52,   2.70,   3.16,   4.30]],
            ["name" => "sse41",              "values" => [  3.58,   3.61,   3.46,   2.60,   3.19,   4.28]],
            ["name" => "avx2",               "values" => [  null,   null,   null,   1.54,   null,   null]],
            ["name" => "avx2_intrinsics",    "values" => [  1.81,   1.39,   1.82,   1.39,   1.09,   3.03]],
        ],
    ]);

    // TABLE14.5 – Architectures récentes
    $recent = array_merge($base, [
        "CPUs"  => ["Core i7 10850H", "Core i5 12400f", "Ryzen 5 5600g", "Ryzen 5 9600X"],
        "Years" => [2020, 2022, 2021, 2024],
        "Methods" => [
            ["name" => "ref_v1_O2",          "values" => [83.50, 104.50,  91.38, 76.97]],
            ["name" => "ref_v1_O3",          "values" => [ 1.85,   1.69,   1.98,  0.64]],
            ["name" => "asm",                "values" => [79.75, 100.53,  82.38, 70.65]],
            ["name" => "no_if_asm",          "values" => [27.44,  44.54,  29.31, 13.06]],
            ["name" => "no_if_opt_asm",      "values" => [16.17,  11.98,  17.23,  9.80]],
            ["name" => "no_if_opt_ur4_asm",  "values" => [14.81,  11.06,  14.96,  8.30]],
            ["name" => "no_if_opt_ur8_asm",  "values" => [14.20,  10.49,  13.99,  7.89]],
            ["name" => "sse2_v1",            "values" => [ 2.56,   1.82,   1.74,  1.07]],
            ["name" => "sse41",              "values" => [ 2.53,   1.81,   1.75,  1.08]],
            ["name" => "avx2",               "values" => [ 1.36,   null,   null,  null]],
            ["name" => "avx2_intrinsics",    "values" => [ 1.36,   null,   null,  null]],
        ],
    ]);

    return ['ancien' => $ancien, 'moderne' => $moderne, 'recent' => $recent];
}

// ──────────────────────────────────────────────────────────────────
// Chapitre 15 : Compter les voyelles (asm_vowels)
// ──────────────────────────────────────────────────────────────────

/**
 * Retourne les données de performance pour le chapitre 15 (voyelles).
 * Source : TABLE15.4 (ancien), TABLE15.5 (moderne), TABLE15.7 (récent).
 * 100 000 itérations sur des chaînes de 256 000 caractères.
 */
function getChapter15Data(): array
{
    $base = [
        "chapter"     => 15,
        "title"       => "Compter les voyelles",
        "description" => "Temps d'exécution en secondes pour 100 000 itérations sur des chaînes de 256 000 caractères (environ 20% de voyelles).",
    ];

    // TABLE15.4 – Architectures anciennes
    $ancien = array_merge($base, [
        "CPUs"  => ["Pentium D 925", "Core 2 Q9300", "Core i7 860", "AMD X6 1090T", "Core i5 3570K", "Core i7 4790"],
        "Years" => [2006, 2008, 2009, 2010, 2012, 2014],
        "Methods" => [
            ["name" => "C if",               "values" => [79.19, 62.44, 43.63, 39.43, 38.04, 27.49]],
            ["name" => "C switch",           "values" => [126.15,102.51, 57.28, 47.88, 54.41, 39.72]],
            ["name" => "C tableau",          "values" => [12.57, 14.80, 29.91, 21.91,  8.37,  6.36]],
            ["name" => "tableau asm",        "values" => [32.95, 16.02, 26.16, 18.35,  8.37,  6.59]],
            ["name" => "tableau asm ur4 v1", "values" => [37.17, 17.54, 29.89, 21.92,  8.53,  6.69]],
            ["name" => "tableau asm ur4 v2", "values" => [19.26, 19.78, 13.16,  8.51, 11.55,  8.93]],
            ["name" => "tableau asm ur8 v1", "values" => [32.48, 16.61, 27.50, 18.38,  7.37,  5.64]],
            ["name" => "tableau asm ur8 v2", "values" => [19.25, 21.60, 13.04,  8.37, 11.48,  8.89]],
            ["name" => "tableau asm ur8 v3", "values" => [32.49, 16.64, 27.40, 18.44,  7.34,  5.65]],
            ["name" => "SSE2",               "values" => [17.58,  8.95,  3.59,  4.27,  4.25,  3.61]],
            ["name" => "AVX",                "values" => [ null,  null,  null,  null,  null,  1.82]],
            ["name" => "AVX2 v1",            "values" => [ null,  null,  null,  null,  null,  1.82]],
            ["name" => "AVX2 v3",            "values" => [ null,  null,  null,  null,  null,  1.82]],
            ["name" => "AVX2 v2 ur8",        "values" => [ null,  null,  null,  null,  null,  1.82]],
            ["name" => "AVX2 intrinsics",    "values" => [ null,  null,  null,  null,  null,  1.14]],
        ],
    ]);

    // TABLE15.5 – Architectures modernes
    $moderne = array_merge($base, [
        "CPUs"  => ["Core i3 6100", "Ryzen 7 1700X", "Core i5 7400", "Core i7 8700", "Ryzen 5 3600", "Xeon Silver 4208"],
        "Years" => [2015, 2017, 2017, 2017, 2019, 2019],
        "Methods" => [
            ["name" => "C if",               "values" => [35.89, 31.33, 38.19, 29.33, 29.95, 45.47]],
            ["name" => "C switch",           "values" => [47.23, 56.33, 50.35, 39.72, 55.31, 55.75]],
            ["name" => "C tableau",          "values" => [ 6.12,  4.26,  6.51,  5.46,  4.94,  7.83]],
            ["name" => "tableau asm",        "values" => [ 7.06, 11.26,  7.52,  5.78,  5.93,  8.84]],
            ["name" => "tableau asm ur4 v1", "values" => [ 6.11, 16.91,  6.51,  5.05,  5.03,  7.55]],
            ["name" => "tableau asm ur4 v2", "values" => [10.28,  6.76, 10.98,  8.34,  5.05, 12.44]],
            ["name" => "tableau asm ur8 v1", "values" => [ 5.96,  4.18,  6.32,  4.72,  4.84,  7.26]],
            ["name" => "tableau asm ur8 v2", "values" => [10.20,  4.44, 10.87,  8.28,  4.58, 12.44]],
            ["name" => "tableau asm ur8 v3", "values" => [ 5.87,  4.21,  6.23,  4.76,  4.92,  7.19]],
            ["name" => "SSE2",               "values" => [ 3.89,  2.12,  4.16,  3.16,  2.08,  4.86]],
            ["name" => "AVX",                "values" => [ 1.95,  1.20,  2.08,  1.58,  1.07,  2.41]],
            ["name" => "AVX2 v1",            "values" => [ 1.95,  1.19,  2.09,  1.58,  1.08,  2.43]],
            ["name" => "AVX2 v3",            "values" => [ 1.95,  1.17,  2.08,  1.58,  0.91,  2.42]],
            ["name" => "AVX2 v2 ur8",        "values" => [ 1.96,  0.94,  2.08,  1.58,  1.00,  2.44]],
            ["name" => "AVX2 intrinsics",    "values" => [ 1.13,  0.98,  1.20,  1.08,  null,  1.36]],
        ],
    ]);

    // TABLE15.7 – Architectures récentes
    $recent = array_merge($base, [
        "CPUs"  => ["Core i7 10850H", "Ryzen 5 5600g", "Core i5 12400f", "Ryzen 5 9600X"],
        "Years" => [2020, 2021, 2022, 2024],
        "Methods" => [
            ["name" => "C if",               "values" => [24.37, 23.87, 27.97, 36.08]],
            ["name" => "C switch",           "values" => [35.14, 43.75, 35.87, 34.93]],
            ["name" => "C tableau",          "values" => [ 4.71,  3.90,  3.66,  2.73]],
            ["name" => "tableau asm",        "values" => [ 5.42,  4.02,  4.93,  2.94]],
            ["name" => "tableau asm ur4 v1", "values" => [ 4.72,  3.97,  4.19,  2.83]],
            ["name" => "tableau asm ur4 v2", "values" => [ 7.78,  4.07,  7.17,  2.82]],
            ["name" => "tableau asm ur8 v1", "values" => [ 4.52,  3.55,  3.52,  2.61]],
            ["name" => "tableau asm ur8 v2", "values" => [ 7.74,  4.23,  7.61,  2.79]],
            ["name" => "tableau asm ur8 v3", "values" => [ 4.45,  3.50,  3.48,  2.63]],
            ["name" => "SSE2",               "values" => [ 2.97,  1.81,  1.64,  0.81]],
            ["name" => "AVX",                "values" => [ 1.52,  0.90,  1.64,  0.45]],
            ["name" => "AVX2 v1",            "values" => [ 1.50,  0.91,  1.61,  0.39]],
            ["name" => "AVX2 v3",            "values" => [ 1.53,  0.90,  0.85,  0.40]],
            ["name" => "AVX2 v2 ur8",        "values" => [ 1.55,  0.89,  0.85,  0.33]],
            ["name" => "AVX2 intrinsics",    "values" => [ 0.92,  null,  null,  null]],
        ],
    ]);

    return ['ancien' => $ancien, 'moderne' => $moderne, 'recent' => $recent];
}

// ──────────────────────────────────────────────────────────────────
// Chapitre 16 : Fibonacci
// ──────────────────────────────────────────────────────────────────

/**
 * Retourne les données de performance pour le chapitre 16 (Fibonacci).
 * Source : TABLE16.5 (modernes), TABLE16.6 (récentes).
 * 500 000 000 fois le calcul de F43.
 * Note : pas de données pour les architectures anciennes dans le chapitre 16.
 */
function getChapter16Data(): array
{
    $base = [
        "chapter"     => 16,
        "title"       => "Suite de Fibonacci",
        "description" => "Temps d'exécution en secondes pour 500 000 000 fois le calcul de F43.",
    ];

    // TABLE16.5 – Architectures modernes
    $moderne = array_merge($base, [
        "CPUs"  => ["Core i3 6100", "Ryzen 7 1700X", "Core i5 7400", "Core i7 8700", "Core i5 8365U"],
        "Years" => [2015, 2017, 2017, 2017, 2019],
        "Methods" => [
            ["name" => "gcc",           "values" => [ 4.11,  4.39,  4.24,  3.23,  3.61]],
            ["name" => "icc",           "values" => [ 7.97, 11.31,  8.56,  6.49,  7.39]],
            ["name" => "stat. array",   "values" => [ 8.99,  8.84,  9.12,  7.37,  8.30]],
            ["name" => "dyna. array",   "values" => [18.57, 21.16, 21.67, 15.79, 18.09]],
            ["name" => "n recursive",   "values" => [63.39, 82.48, 67.71, 51.53,112.24]],
            ["name" => "while v1",      "values" => [ 7.52, 11.47,  8.99,  5.78,  7.44]],
            ["name" => "while v1 ur2",  "values" => [18.45,  5.48, 22.26, 15.01, 18.88]],
            ["name" => "while v1 ur4",  "values" => [12.56,  5.25, 16.07, 10.21, 12.79]],
            ["name" => "while v1 ur8",  "values" => [ 9.65,  5.14, 11.85,  7.86,  9.95]],
            ["name" => "while v3 ur8",  "values" => [ 5.37,  4.39,  5.74,  4.45,  4.96]],
            ["name" => "while v6 ur8",  "values" => [ 4.35,  4.51,  4.66,  3.60,  3.95]],
            ["name" => "SSE intrin",    "values" => [ 4.11,  4.27,  4.36,  3.17,  3.66]],
            ["name" => "SSE v4 ur8",   "values" => [  null,  null,  null,  null,  null]],
            ["name" => "AVX intrin v2", "values" => [ 4.20,  5.73,  4.38,  3.21,  3.93]],
            ["name" => "AVX asm ur8",  "values" => [  null,  5.60,  null,  null,  null]],
        ],
    ]);

    // TABLE16.6 – Architectures récentes
    $recent = array_merge($base, [
        "CPUs"  => ["Core i7 10850H", "Core i7 1165G7", "Core i5 10400", "Ryzen 5 5600g", "Core i5 12400F"],
        "Years" => [2020, 2020, 2020, 2021, 2022],
        "Methods" => [
            ["name" => "gcc",           "values" => [ 3.007,  3.07,  3.516,  2.853,  2.035]],
            ["name" => "icc",           "values" => [ 5.365,  5.81,  5.610,  3.990,  4.489]],
            ["name" => "stat. array",   "values" => [ 6.446,  5.96,  7.478,  6.380,  4.871]],
            ["name" => "dyna. array",   "values" => [14.470, 14.84, 16.660, 13.790,  9.441]],
            ["name" => "n recursive",   "values" => [93.390, 59.53,108.570, 50.630, 55.870]],
            ["name" => "while v1",      "values" => [ 6.038, 11.94,  7.322,  6.304,  5.570]],
            ["name" => "while v1 ur2",  "values" => [13.860, 16.09, 18.210,  3.608, 14.930]],
            ["name" => "while v1 ur4",  "values" => [ 9.510, 11.07, 13.140,  3.500, 11.250]],
            ["name" => "while v1 ur8",  "values" => [ 7.254,  8.69,  9.583,  3.497,  8.197]],
            ["name" => "while v3 ur8",  "values" => [ 4.121,  5.02,  4.823,  2.229,  4.795]],
            ["name" => "while v6 ur8",  "values" => [ 3.286,  3.41,  3.832,  2.271,  2.807]],
            ["name" => "SSE intrin",    "values" => [ 3.076,  3.47,  3.584,  2.393,  2.480]],
            ["name" => "SSE v4 ur8",    "values" => [ 2.442,  2.70,  2.153,   null,   null]],
            ["name" => "AVX intrin v2", "values" => [ 3.235,  3.71,  3.837,  2.471,  2.566]],
            ["name" => "AVX asm ur8",   "values" => [  null,  null,   null,   null,   null]],
        ],
    ]);

    return ['moderne' => $moderne, 'recent' => $recent];
}

// ──────────────────────────────────────────────────────────────────
// Moteur principal
// ──────────────────────────────────────────────────────────────────

/**
 * Génère les fichiers JSON pour un chapitre donné.
 *
 * @param int    $chapter  Numéro de chapitre (11-16)
 * @param bool   $dryRun   Mode simulation
 */
function generateChapter(int $chapter, bool $dryRun = false): void
{
    $fnMap = [
        11 => 'getChapter11Data',
        12 => 'getChapter12Data',
        13 => 'getChapter13Data',
        14 => 'getChapter14Data',
        15 => 'getChapter15Data',
        16 => 'getChapter16Data',
    ];

    if (!isset($fnMap[$chapter])) {
        echo "[ERREUR] Chapitre $chapter non supporté.\n";
        return;
    }

    $data   = $fnMap[$chapter]();
    $dirKey = "chapitre_{$chapter}";

    foreach ($data as $cat => $catData) {
        $path = DATA_DIR . "/{$dirKey}/{$cat}/data.json";
        saveJson($path, $catData, $dryRun);
    }
}

// ──────────────────────────────────────────────────────────────────
// Point d'entrée
// ──────────────────────────────────────────────────────────────────

$opts    = getopt('', ['chapter::', 'dry-run']);
$dryRun  = isset($opts['dry-run']);
$chapter = isset($opts['chapter']) ? (int) $opts['chapter'] : null;

if ($chapter !== null) {
    // Générer uniquement le chapitre demandé
    generateChapter($chapter, $dryRun);
} else {
    // Générer tous les chapitres supportés (11-16)
    foreach (range(11, 16) as $ch) {
        generateChapter($ch, $dryRun);
    }
}

echo "\nTerminé.\n";
