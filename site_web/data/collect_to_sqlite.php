<?php

/**
 * Collecte toutes les données CPU (specs détaillées) et résultats de benchmarks
 * depuis lar/** et les stocke dans une base SQLite conforme au MCD :
 *
 *   Marque, Modele, CPU, Chapitre, TypeTest, Test, Resultat
 *
 * Utilisation :
 *   php site_web/data/collect_to_sqlite.php
 *
 * Résultat :
 *   - Crée/remplace site_web/data/benchmarks.db
 */

$root = realpath(__DIR__ . '/../../');
if ($root === false) {
    fwrite(STDERR, "Impossible de localiser la racine du projet.\n");
    exit(1);
}

$larDir  = $root . '/lar';
$dbPath  = __DIR__ . '/benchmarks.db';

if (!is_dir($larDir)) {
    fwrite(STDERR, "Répertoire 'lar' introuvable : $larDir\n");
    exit(1);
}

if (file_exists($dbPath)) {
    unlink($dbPath);
}

// =====================================================================
//  Connexion SQLite + schéma MCD
// =====================================================================

$db = new PDO("sqlite:$dbPath");
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db->exec('PRAGMA journal_mode = WAL');
$db->exec('PRAGMA foreign_keys = ON');

$db->exec(<<<'SQL'

-- ========================
-- Tables principales (MCD)
-- ========================

CREATE TABLE Marque (
    id_marque   INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_marque  TEXT    UNIQUE NOT NULL
);

CREATE TABLE Modele (
    id_modele   INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_modele  TEXT    UNIQUE NOT NULL
);

CREATE TABLE CPU (
    id_cpu          INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_cpu         TEXT    UNIQUE NOT NULL,
    id_marque       INTEGER REFERENCES Marque(id_marque),
    id_modele       INTEGER REFERENCES Modele(id_modele),
    sous_modele     TEXT,
    annee           INTEGER,
    nom_court       TEXT,
    nombre_core     INTEGER,
    nombre_thread   INTEGER,
    frequence_min   REAL,
    frequence_max   REAL,
    architecture    TEXT,
    lithographie    TEXT,
    taille_cache_L1 TEXT,
    taille_cache_L2 TEXT,
    taille_cache_L3 TEXT,
    taille_cache_L4 TEXT
);

CREATE TABLE Chapitre (
    id_chapitre   INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_chapitre  TEXT    UNIQUE NOT NULL
);

CREATE TABLE TypeTest (
    id_type_test   INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_type_test  TEXT    UNIQUE NOT NULL,
    description    TEXT
);

CREATE TABLE Test (
    id_test       INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_test      TEXT    NOT NULL,
    id_type_test  INTEGER REFERENCES TypeTest(id_type_test),
    id_chapitre   INTEGER REFERENCES Chapitre(id_chapitre),
    UNIQUE(nom_test, id_chapitre)
);

CREATE TABLE Resultat (
    id_resultat     INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cpu          INTEGER NOT NULL REFERENCES CPU(id_cpu),
    id_test         INTEGER NOT NULL REFERENCES Test(id_test),
    valeur_resultat REAL,
    validation      TEXT,
    remarque        TEXT
);

-- ========================
-- Index
-- ========================

CREATE INDEX idx_cpu_marque        ON CPU(id_marque);
CREATE INDEX idx_cpu_modele        ON CPU(id_modele);
CREATE INDEX idx_test_chapitre     ON Test(id_chapitre);
CREATE INDEX idx_test_type         ON Test(id_type_test);
CREATE INDEX idx_resultat_cpu      ON Resultat(id_cpu);
CREATE INDEX idx_resultat_test     ON Resultat(id_test);

-- ========================
-- Vues utiles
-- ========================

CREATE VIEW v_cpu_complet AS
SELECT
    c.id_cpu,
    c.nom_cpu,
    m.nom_marque   AS marque,
    mo.nom_modele  AS modele,
    c.sous_modele,
    c.annee,
    c.nom_court,
    c.nombre_core,
    c.nombre_thread,
    c.frequence_min,
    c.frequence_max,
    c.architecture,
    c.lithographie,
    c.taille_cache_L1,
    c.taille_cache_L2,
    c.taille_cache_L3,
    c.taille_cache_L4
FROM CPU c
LEFT JOIN Marque m  ON m.id_marque = c.id_marque
LEFT JOIN Modele mo ON mo.id_modele = c.id_modele
ORDER BY c.annee, c.nom_cpu;

CREATE VIEW v_resultats AS
SELECT
    r.id_resultat,
    c.nom_cpu,
    ma.nom_marque  AS marque,
    c.annee,
    ch.nom_chapitre AS chapitre,
    tt.nom_type_test AS type_test,
    t.nom_test,
    r.valeur_resultat,
    r.validation,
    r.remarque
FROM Resultat r
JOIN CPU       c  ON c.id_cpu       = r.id_cpu
JOIN Test      t  ON t.id_test      = r.id_test
LEFT JOIN Marque    ma ON ma.id_marque   = c.id_marque
LEFT JOIN Chapitre  ch ON ch.id_chapitre = t.id_chapitre
LEFT JOIN TypeTest  tt ON tt.id_type_test = t.id_type_test;

CREATE VIEW v_meilleur_par_cpu AS
SELECT
    c.nom_cpu,
    c.annee,
    ch.nom_chapitre AS chapitre,
    t.nom_test      AS methode,
    r.valeur_resultat AS meilleur_temps
FROM Resultat r
JOIN CPU      c  ON c.id_cpu       = r.id_cpu
JOIN Test     t  ON t.id_test      = r.id_test
JOIN Chapitre ch ON ch.id_chapitre = t.id_chapitre
JOIN TypeTest tt ON tt.id_type_test = t.id_type_test
WHERE tt.nom_type_test = 'temps moyen'
  AND r.valeur_resultat = (
      SELECT MIN(r2.valeur_resultat)
      FROM Resultat r2
      JOIN Test t2     ON t2.id_test      = r2.id_test
      JOIN TypeTest tt2 ON tt2.id_type_test = t2.id_type_test
      WHERE r2.id_cpu      = r.id_cpu
        AND t2.id_chapitre = t.id_chapitre
        AND tt2.nom_type_test = 'temps moyen'
        AND r2.valeur_resultat > 0
  )
ORDER BY ch.nom_chapitre, c.annee;

CREATE VIEW v_resume_cpu AS
SELECT
    c.id_cpu,
    c.nom_cpu,
    ma.nom_marque AS marque,
    c.annee,
    c.nombre_core,
    c.nombre_thread,
    c.frequence_max,
    COUNT(DISTINCT t.id_chapitre) AS nb_chapitres,
    COUNT(DISTINCT r.id_resultat) AS nb_resultats
FROM CPU c
LEFT JOIN Marque   ma ON ma.id_marque = c.id_marque
LEFT JOIN Resultat r  ON r.id_cpu = c.id_cpu
LEFT JOIN Test     t  ON t.id_test = r.id_test
GROUP BY c.id_cpu
ORDER BY c.annee, c.nom_cpu;

SQL
);

// =====================================================================
//  Fonctions de parsing
// =====================================================================

/** Parse un processors.txt -> [ name => [...] ] */
function parse_processors(string $path): array
{
    $cpus = [];
    $fh = fopen($path, 'r');
    if (!$fh) return $cpus;

    while (($line = fgets($fh)) !== false) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#') continue;

        $parts = explode('|', $line);
        if (count($parts) < 5) continue;

        $name      = trim($parts[0]);
        $brand     = trim($parts[1]);
        $model     = trim($parts[2]);
        $submodel  = trim($parts[3]);
        $year      = (int)trim($parts[4]);
        $shortName = isset($parts[5]) ? trim($parts[5]) : null;

        if (!isset($cpus[$name])) {
            $cpus[$name] = compact('name', 'brand', 'model', 'submodel', 'year', 'shortName');
        }
    }
    fclose($fh);
    return $cpus;
}

/**
 * Parse un fichier lar/processors/<cpu>.txt pour extraire les specs détaillées.
 * Gère les formats lscpu FR et EN + section CACHE + section DMI.
 */
function parse_cpu_specs(string $path): array
{
    $content = file_get_contents($path);
    if ($content === false) return [];

    $specs = [
        'architecture'  => null,
        'nombre_core'   => null,
        'nombre_thread' => null,
        'frequence_min' => null,
        'frequence_max' => null,
        'cache_L1'      => null,
        'cache_L2'      => null,
        'cache_L3'      => null,
        'cache_L4'      => null,
    ];

    $lines = explode("\n", $content);

    $cores_per_socket = null;
    $threads_per_core = null;
    $sockets = 1;

    foreach ($lines as $line) {
        $line = str_replace("\xc2\xa0", ' ', $line); // non-breaking space -> espace normal
        $line = trim($line);

        // -- Architecture --
        if (preg_match('/^Architecture\s*:\s*(.+)/i', $line, $m)) {
            $specs['architecture'] = trim($m[1]);
        }

        // -- Cœurs par socket (FR / EN) --
        if (preg_match('/^C.{1,5}ur\(s\) par socket\s*:\s*(\d+)/u', $line, $m)) {
            $cores_per_socket = (int)$m[1];
        }
        if (preg_match('/^Core\(s\) per socket\s*:\s*(\d+)/i', $line, $m)) {
            $cores_per_socket = (int)$m[1];
        }

        // -- Threads par cœur (FR / EN) --
        if (preg_match('/^Thread\(s\) par c.{1,3}ur\s*:\s*(\d+)/u', $line, $m)) {
            $threads_per_core = (int)$m[1];
        }
        if (preg_match('/^Thread\(s\) per core\s*:\s*(\d+)/i', $line, $m)) {
            $threads_per_core = (int)$m[1];
        }

        // -- Sockets --
        if (preg_match('/^Socket\(s\)\s*:\s*(\d+)/i', $line, $m)) {
            $sockets = (int)$m[1];
        }

        // -- Fréquence max (FR) : "Vitesse maximale du processeur en MHz : 4463,6709" --
        if (preg_match('/Vitesse maximale.*MHz\s*:\s*([\d,\.]+)/u', $line, $m)) {
            $specs['frequence_max'] = (float)str_replace(',', '.', $m[1]);
        }
        // -- Fréquence max (EN) : "CPU max MHz: 4000,0000" --
        if (preg_match('/CPU max MHz\s*:\s*([\d,\.]+)/i', $line, $m)) {
            $specs['frequence_max'] = (float)str_replace(',', '.', $m[1]);
        }

        // -- Fréquence min (FR) --
        if (preg_match('/Vitesse minimale.*MHz\s*:\s*([\d,\.]+)/u', $line, $m)) {
            $specs['frequence_min'] = (float)str_replace(',', '.', $m[1]);
        }
        // -- Fréquence min (EN) --
        if (preg_match('/CPU min MHz\s*:\s*([\d,\.]+)/i', $line, $m)) {
            $specs['frequence_min'] = (float)str_replace(',', '.', $m[1]);
        }

        // -- Cache lscpu FR : "Cache L1d : 192 KiB" / "cache L1d :  32K" --
        if (preg_match('/^cache\s+L1[di]\s*:\s*(.+)/i', $line, $m)) {
            $specs['cache_L1'] = trim($m[1]);
        }
        if (preg_match('/^cache\s+L2\s*:\s*(.+)/i', $line, $m)) {
            $specs['cache_L2'] = trim($m[1]);
        }
        if (preg_match('/^cache\s+L3\s*:\s*(.+)/i', $line, $m)) {
            $specs['cache_L3'] = trim($m[1]);
        }

        // -- Cache lscpu EN : "L1d cache: 32K" --
        if (preg_match('/^L1[di]\s+cache\s*:\s*(.+)/i', $line, $m)) {
            $specs['cache_L1'] = trim($m[1]);
        }
        if (preg_match('/^L2\s+cache\s*:\s*(.+)/i', $line, $m)) {
            $specs['cache_L2'] = trim($m[1]);
        }
        if (preg_match('/^L3\s+cache\s*:\s*(.+)/i', $line, $m)) {
            $specs['cache_L3'] = trim($m[1]);
        }

        // -- Section CACHE détaillée : "L2      Unified   256K ..." --
        if (preg_match('/^L(\d)\s+(Data|Instruction|Unified)\s+(\d+\s*[KMG]i?[Bb]?)\b/i', $line, $m)) {
            $level = (int)$m[1];
            $size  = trim($m[3]);
            $key   = "cache_L$level";
            if ($level >= 1 && $level <= 4 && isset($specs[$key])) {
                if ($specs[$key] === null) {
                    $specs[$key] = $size;
                }
            }
        }

        // -- DMI : Core Count / Thread Count / Max Speed (fallbacks) --
        if (preg_match('/^\s*Core Count\s*:\s*(\d+)/i', $line, $m)) {
            if ($cores_per_socket === null) $cores_per_socket = (int)$m[1];
        }
        if (preg_match('/^\s*Thread Count\s*:\s*(\d+)/i', $line, $m)) {
            $specs['nombre_thread'] = (int)$m[1];
        }
        if (preg_match('/^\s*Max Speed\s*:\s*(\d+)\s*MHz/i', $line, $m)) {
            if ($specs['frequence_max'] === null) {
                $specs['frequence_max'] = (float)$m[1];
            }
        }
        if (preg_match('/^\s*Current Speed\s*:\s*(\d+)\s*MHz/i', $line, $m)) {
            if ($specs['frequence_min'] === null) {
                $specs['frequence_min'] = (float)$m[1];
            }
        }

        // -- /proc/cpuinfo fallbacks --
        if (preg_match('/^cpu cores\s*:\s*(\d+)/', $line, $m)) {
            if ($cores_per_socket === null) $cores_per_socket = (int)$m[1];
        }
        if (preg_match('/^siblings\s*:\s*(\d+)/', $line, $m)) {
            if ($specs['nombre_thread'] === null) $specs['nombre_thread'] = (int)$m[1];
        }
    }

    // Calculer le nombre de coeurs et threads
    if ($cores_per_socket !== null) {
        $specs['nombre_core'] = $cores_per_socket * $sockets;
    }
    if ($threads_per_core !== null && $cores_per_socket !== null) {
        $specs['nombre_thread'] = $cores_per_socket * $threads_per_core * $sockets;
    }

    // Fallback : extraire fréquence max depuis le nom de fichier (ex: 3_40GHz)
    $basename = basename($path, '.txt');
    if ($specs['frequence_max'] === null) {
        if (preg_match('/(\d+)[_\.](\d+)GHz/i', $basename, $m)) {
            $specs['frequence_max'] = ((float)($m[1] . '.' . $m[2])) * 1000;
        }
    }

    return $specs;
}

/** Parse un test_methods.txt */
function parse_test_methods(string $path): array
{
    $rows = [];
    $fh = fopen($path, 'r');
    if (!$fh) return $rows;

    while (($line = fgets($fh)) !== false) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#' || $line[0] === '-') continue;

        $parts = explode(';', $line);
        if (count($parts) < 6) continue;

        $idx = trim($parts[0]);
        if (!is_numeric($idx)) continue;

        $rows[] = [
            'index'   => (int)$idx,
            'average' => (float)str_replace(',', '.', trim($parts[1])),
            'min'     => (float)str_replace(',', '.', trim($parts[2])),
            'max'     => (float)str_replace(',', '.', trim($parts[3])),
            'stddev'  => (float)str_replace(',', '.', trim($parts[4])),
            'method'  => trim($parts[5]),
            'result'  => isset($parts[6]) ? trim($parts[6]) : null,
        ];
    }
    fclose($fh);
    return $rows;
}

/** Parse un fichier method_*_gnu.gpd */
function parse_gpd(string $path): array
{
    $rows = [];
    $fh = fopen($path, 'r');
    if (!$fh) return $rows;

    while (($line = fgets($fh)) !== false) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#') continue;

        $parts = preg_split('/\s+/', $line);
        if (count($parts) < 3 || !is_numeric($parts[0])) continue;

        $rows[] = [
            'size'   => (int)$parts[0],
            'stddev' => (float)$parts[1],
            'avg'    => (float)$parts[2],
        ];
    }
    fclose($fh);
    return $rows;
}

/** Extrait le nom de méthode depuis method_xxx_gnu.gpd */
function gpd_method_name(string $filename): ?string
{
    if (!preg_match('/^method_(.+)_gnu\.gpd$/', $filename, $m)) return null;
    return $m[1];
}

/** Parse un compare_gnu.gpd (multi-colonnes) */
function parse_compare_gpd(string $path): array
{
    $rows = [];
    $fh = fopen($path, 'r');
    if (!$fh) return $rows;

    $methodNames = [];
    while (($line = fgets($fh)) !== false) {
        $line = trim($line);

        if (preg_match('/^#\s+size\s+\|(.+)/', $line, $m)) {
            $methodNames = preg_split('/\s+/', trim($m[1]));
            $methodNames = array_values(array_filter($methodNames, fn($v) => $v !== ''));
            continue;
        }

        if ($line === '' || $line[0] === '#') continue;

        $cleaned = str_replace('|', ' ', $line);
        $parts = preg_split('/\s+/', trim($cleaned));
        if (count($parts) < 2 || !is_numeric($parts[0])) continue;

        $size = (int)$parts[0];
        for ($i = 1; $i < count($parts) && ($i - 1) < count($methodNames); $i++) {
            $rows[] = [
                'method' => $methodNames[$i - 1],
                'size'   => $size,
                'avg'    => (float)$parts[$i],
            ];
        }
    }
    fclose($fh);
    return $rows;
}

/**
 * Table de lithographie connue par architecture/génération.
 * Source : données publiques Intel/AMD.
 */
function get_lithography(string $cpuName): ?string
{
    $litho_map = [
        'Pentium-D'     => '65 nm',
        'Core2'         => '45 nm',
        'Core2-Duo'     => '45 nm',
        'Core2-Quad'    => '45 nm',
        'E5300'         => '45 nm',
        'i7-860'        => '45 nm',
        'Phenom-II'     => '45 nm',
        'i5-3570K'      => '22 nm',
        'i7-3630QM'     => '22 nm',
        'i3-2375M'      => '32 nm',
        'i7-4790'       => '22 nm',
        'i7-4900MQ'     => '22 nm',
        'Celeron-N3050' => '14 nm',
        'Celeron-N3060' => '14 nm',
        'i3-6100'       => '14 nm',
        'Ryzen-7-1700X' => '14 nm',
        'i5-7400'       => '14 nm',
        'i5-7500'       => '14 nm',
        'i7-8700'       => '14 nm',
        'Athlon-200GE'  => '14 nm',
        'Ryzen-5-3600'  => '7 nm',
        'Xeon-Silver-4208' => '14 nm',
        'i5-12400F'     => '10 nm',
        '5600G'         => '7 nm',
        '9600X'         => '4 nm',
        'i7-10850H'     => '14 nm',
    ];

    foreach ($litho_map as $pattern => $litho) {
        if (stripos($cpuName, $pattern) !== false) {
            return $litho;
        }
    }
    return null;
}

// =====================================================================
//  Collecte
// =====================================================================

echo "=== Collecte MCD : CPU, Tests, Resultats ===\n\n";

// -- Prepared statements --
$stmtMarque = $db->prepare('INSERT OR IGNORE INTO Marque (nom_marque) VALUES (:nom)');
$stmtModele = $db->prepare('INSERT OR IGNORE INTO Modele (nom_modele) VALUES (:nom)');
$stmtChap   = $db->prepare('INSERT OR IGNORE INTO Chapitre (nom_chapitre) VALUES (:nom)');
$stmtType   = $db->prepare('INSERT OR IGNORE INTO TypeTest (nom_type_test, description) VALUES (:nom, :desc)');
$stmtCpu    = $db->prepare(
    'INSERT OR IGNORE INTO CPU (nom_cpu, id_marque, id_modele, sous_modele, annee, nom_court,
     nombre_core, nombre_thread, frequence_min, frequence_max, architecture, lithographie,
     taille_cache_L1, taille_cache_L2, taille_cache_L3, taille_cache_L4)
     VALUES (:nom, :marque, :modele, :sub, :annee, :court,
     :cores, :threads, :fmin, :fmax, :archi, :litho,
     :l1, :l2, :l3, :l4)'
);
$stmtTest   = $db->prepare(
    'INSERT OR IGNORE INTO Test (nom_test, id_type_test, id_chapitre) VALUES (:nom, :type, :chap)'
);
$stmtRes    = $db->prepare(
    'INSERT INTO Resultat (id_cpu, id_test, valeur_resultat, validation, remarque)
     VALUES (:cpu, :test, :val, :valid, :rem)'
);

// Helper pour récupérer un ID après INSERT OR IGNORE
function get_id(PDO $db, string $table, string $col, string $value): int
{
    $stmt = $db->prepare("SELECT rowid FROM $table WHERE $col = :v");
    $stmt->execute([':v' => $value]);
    return (int)$stmt->fetchColumn();
}

$db->beginTransaction();

// -- Phase 0 : Créer les TypeTest --
$typeTests = [
    'temps moyen'  => 'Temps moyen d\'exécution (secondes) depuis test_methods.txt',
    'temps min'    => 'Temps minimum d\'exécution (secondes)',
    'temps max'    => 'Temps maximum d\'exécution (secondes)',
    'ecart-type'   => 'Écart-type sur les mesures',
    'performance'  => 'Temps moyen par taille d\'entrée (données .gpd)',
];

$typeIds = [];
foreach ($typeTests as $nom => $desc) {
    $stmtType->execute([':nom' => $nom, ':desc' => $desc]);
    $typeIds[$nom] = get_id($db, 'TypeTest', 'nom_type_test', $nom);
}

// -- Phase 1 : Collecter tous les CPU depuis processors.txt --
$allCpuInfo = [];
$benchDirs = glob($larDir . '/*', GLOB_ONLYDIR);
sort($benchDirs);

foreach ($benchDirs as $benchDir) {
    $procFile = $benchDir . '/processors.txt';
    if (!is_file($procFile)) continue;
    $cpus = parse_processors($procFile);
    foreach ($cpus as $name => $info) {
        if (!isset($allCpuInfo[$name])) {
            $allCpuInfo[$name] = $info;
        }
    }
    // Aussi chercher dans resources/processors.txt
    $resProcFile = $benchDir . '/resources/processors.txt';
    if (is_file($resProcFile)) {
        $cpus = parse_processors($resProcFile);
        foreach ($cpus as $name => $info) {
            if (!isset($allCpuInfo[$name])) {
                $allCpuInfo[$name] = $info;
            }
        }
    }
}

// -- Phase 2 : Insérer les CPU avec specs détaillées --
$cpuIds    = [];
$marqueIds = [];
$modeleIds = [];
$processorsDir = $larDir . '/processors';

foreach ($allCpuInfo as $cpuName => $info) {
    // Marque
    $brand = $info['brand'];
    if (!isset($marqueIds[$brand])) {
        $stmtMarque->execute([':nom' => $brand]);
        $marqueIds[$brand] = get_id($db, 'Marque', 'nom_marque', $brand);
    }

    // Modèle
    $model = $info['model'];
    if (!isset($modeleIds[$model])) {
        $stmtModele->execute([':nom' => $model]);
        $modeleIds[$model] = get_id($db, 'Modele', 'nom_modele', $model);
    }

    // Specs depuis lar/processors/<cpu>.txt
    $specsFile = $processorsDir . '/' . $cpuName . '.txt';
    $specs = is_file($specsFile) ? parse_cpu_specs($specsFile) : [];

    $litho = get_lithography($cpuName);

    $stmtCpu->execute([
        ':nom'     => $cpuName,
        ':marque'  => $marqueIds[$brand],
        ':modele'  => $modeleIds[$model],
        ':sub'     => $info['submodel'],
        ':annee'   => $info['year'],
        ':court'   => $info['shortName'],
        ':cores'   => $specs['nombre_core']   ?? null,
        ':threads' => $specs['nombre_thread']  ?? null,
        ':fmin'    => $specs['frequence_min']  ?? null,
        ':fmax'    => $specs['frequence_max']  ?? null,
        ':archi'   => $specs['architecture']   ?? null,
        ':litho'   => $litho,
        ':l1'      => $specs['cache_L1']       ?? null,
        ':l2'      => $specs['cache_L2']       ?? null,
        ':l3'      => $specs['cache_L3']       ?? null,
        ':l4'      => $specs['cache_L4']       ?? null,
    ]);
    $cpuIds[$cpuName] = get_id($db, 'CPU', 'nom_cpu', $cpuName);
}

echo "  CPUs inseres depuis processors.txt : " . count($cpuIds) . "\n";

// -- Phase 3 : Parcourir chaque benchmark (Chapitre) et ses résultats --
$chapIds = [];
$testIds = []; // clé : "chapitre|method|type"
$totalRes = 0;

foreach ($benchDirs as $benchDir) {
    $benchName  = basename($benchDir);
    $resultsDir = $benchDir . '/results';
    if (!is_dir($resultsDir)) continue;

    // Chapitre
    if (!isset($chapIds[$benchName])) {
        $stmtChap->execute([':nom' => $benchName]);
        $chapIds[$benchName] = get_id($db, 'Chapitre', 'nom_chapitre', $benchName);
    }
    $chapId = $chapIds[$benchName];

    $cpuDirs = glob($resultsDir . '/*', GLOB_ONLYDIR);
    $benchResCount = 0;

    foreach ($cpuDirs as $cpuDir) {
        $cpuName = basename($cpuDir);

        // CPU inconnu ? L'insérer avec infos minimales
        if (!isset($cpuIds[$cpuName])) {
            $stmtMarque->execute([':nom' => 'Inconnu']);
            $unknownMarque = get_id($db, 'Marque', 'nom_marque', 'Inconnu');
            $stmtModele->execute([':nom' => 'Inconnu']);
            $unknownModele = get_id($db, 'Modele', 'nom_modele', 'Inconnu');

            $specsFile = $processorsDir . '/' . $cpuName . '.txt';
            $specs = is_file($specsFile) ? parse_cpu_specs($specsFile) : [];
            $litho = get_lithography($cpuName);

            $stmtCpu->execute([
                ':nom'     => $cpuName,
                ':marque'  => $unknownMarque,
                ':modele'  => $unknownModele,
                ':sub'     => null,
                ':annee'   => null,
                ':court'   => null,
                ':cores'   => $specs['nombre_core']   ?? null,
                ':threads' => $specs['nombre_thread']  ?? null,
                ':fmin'    => $specs['frequence_min']  ?? null,
                ':fmax'    => $specs['frequence_max']  ?? null,
                ':archi'   => $specs['architecture']   ?? null,
                ':litho'   => $litho,
                ':l1'      => $specs['cache_L1']       ?? null,
                ':l2'      => $specs['cache_L2']       ?? null,
                ':l3'      => $specs['cache_L3']       ?? null,
                ':l4'      => $specs['cache_L4']       ?? null,
            ]);
            $cpuIds[$cpuName] = get_id($db, 'CPU', 'nom_cpu', $cpuName);
        }
        $cpuId = $cpuIds[$cpuName];

        // Helper pour obtenir/créer un Test
        $getTestId = function(string $methodName, string $typeName) use (
            &$testIds, $stmtTest, $db, $chapId, $typeIds
        ): int {
            $key = "$chapId|$methodName|$typeName";
            if (!isset($testIds[$key])) {
                $stmtTest->execute([
                    ':nom'  => $methodName,
                    ':type' => $typeIds[$typeName],
                    ':chap' => $chapId,
                ]);
                $stmt = $db->prepare(
                    'SELECT id_test FROM Test WHERE nom_test = :n AND id_chapitre = :c'
                );
                $stmt->execute([':n' => $methodName, ':c' => $chapId]);
                $testIds[$key] = (int)$stmt->fetchColumn();
            }
            return $testIds[$key];
        };

        // --- test_methods.txt ---
        $tmFile = $cpuDir . '/test_methods.txt';
        if (is_file($tmFile)) {
            $methods = parse_test_methods($tmFile);
            foreach ($methods as $m) {
                $methodName = $m['method'];

                // Temps moyen
                $testId = $getTestId($methodName, 'temps moyen');
                $stmtRes->execute([
                    ':cpu'   => $cpuId,
                    ':test'  => $testId,
                    ':val'   => $m['average'],
                    ':valid' => $m['result'],
                    ':rem'   => "min={$m['min']} max={$m['max']} stddev={$m['stddev']}",
                ]);
                $totalRes++;

                // Temps min
                $testId = $getTestId($methodName, 'temps min');
                $stmtRes->execute([
                    ':cpu'   => $cpuId,
                    ':test'  => $testId,
                    ':val'   => $m['min'],
                    ':valid' => $m['result'],
                    ':rem'   => null,
                ]);
                $totalRes++;

                // Temps max
                $testId = $getTestId($methodName, 'temps max');
                $stmtRes->execute([
                    ':cpu'   => $cpuId,
                    ':test'  => $testId,
                    ':val'   => $m['max'],
                    ':valid' => $m['result'],
                    ':rem'   => null,
                ]);
                $totalRes++;

                // Écart-type
                $testId = $getTestId($methodName, 'ecart-type');
                $stmtRes->execute([
                    ':cpu'   => $cpuId,
                    ':test'  => $testId,
                    ':val'   => $m['stddev'],
                    ':valid' => $m['result'],
                    ':rem'   => null,
                ]);
                $totalRes++;
                $benchResCount += 4;
            }
        }

        // --- fichiers method_*_gnu.gpd ---
        $gpdFiles = glob($cpuDir . '/method_*_gnu.gpd');
        foreach ($gpdFiles as $gpdFile) {
            $methodName = gpd_method_name(basename($gpdFile));
            if ($methodName === null) continue;

            $gpdRows = parse_gpd($gpdFile);
            foreach ($gpdRows as $row) {
                $testId = $getTestId($methodName, 'performance');
                $stmtRes->execute([
                    ':cpu'   => $cpuId,
                    ':test'  => $testId,
                    ':val'   => $row['avg'],
                    ':valid' => null,
                    ':rem'   => "taille={$row['size']} stddev={$row['stddev']}",
                ]);
                $totalRes++;
                $benchResCount++;
            }
        }

        // --- compare_gnu.gpd ---
        $compareFile = $cpuDir . '/compare_gnu.gpd';
        if (is_file($compareFile)) {
            $compareRows = parse_compare_gpd($compareFile);
            foreach ($compareRows as $row) {
                $testId = $getTestId($row['method'], 'performance');
                $stmtRes->execute([
                    ':cpu'   => $cpuId,
                    ':test'  => $testId,
                    ':val'   => $row['avg'],
                    ':valid' => null,
                    ':rem'   => "taille={$row['size']}",
                ]);
                $totalRes++;
                $benchResCount++;
            }
        }
    }

    if ($benchResCount > 0) {
        echo "  [OK] $benchName : $benchResCount resultats\n";
    }
}

$db->commit();

// =====================================================================
//  Résumé
// =====================================================================

echo "\n=== Resume ===\n";

foreach (['Marque', 'Modele', 'CPU', 'Chapitre', 'TypeTest', 'Test', 'Resultat'] as $table) {
    $c = $db->query("SELECT COUNT(*) FROM $table")->fetchColumn();
    printf("  %-12s : %s lignes\n", $table, number_format($c, 0, ',', ' '));
}

echo "\n=== CPUs avec specs detaillees ===\n";
$stmt = $db->query(<<<'SQL'
SELECT nom_cpu, marque, modele, annee, nombre_core, nombre_thread,
       frequence_max, lithographie, taille_cache_L1, taille_cache_L2, taille_cache_L3
FROM v_cpu_complet
WHERE nombre_core IS NOT NULL
ORDER BY annee
SQL
);
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    printf("  %-50s %s | %dc/%dt | %.0f MHz | %s | L1=%s L2=%s L3=%s\n",
        $row['nom_cpu'],
        $row['annee'] ?? '????',
        $row['nombre_core'],
        $row['nombre_thread'],
        $row['frequence_max'],
        $row['lithographie'] ?? '?',
        $row['taille_cache_L1'] ?? '?',
        $row['taille_cache_L2'] ?? '?',
        $row['taille_cache_L3'] ?? '?');
}

echo "\n=== Top 10 CPU par nombre de resultats ===\n";
$stmt = $db->query('SELECT nom_cpu, marque, annee, nb_chapitres, nb_resultats FROM v_resume_cpu ORDER BY nb_resultats DESC LIMIT 10');
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    printf("  %-50s (%s) : %2d chap, %5d resultats\n",
        $row['nom_cpu'], $row['annee'] ?? '????', $row['nb_chapitres'], $row['nb_resultats']);
}

echo "\n  Base : $dbPath\n";
echo "  Total resultats : $totalRes\n";
echo "\nTermine !\n";
