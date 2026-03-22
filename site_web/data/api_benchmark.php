<?php
header('Content-Type: application/json');

// ============================================================
// API Benchmark : sert les données EXCLUSIVEMENT depuis benchmarks.db
// ============================================================

$dbPath = __DIR__ . '/benchmarks.db';
if (!file_exists($dbPath)) {
    echo json_encode(["error" => "Database not found."]);
    exit;
}

try {
    $db = new PDO("sqlite:$dbPath");
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Mapping chapter number -> benchmark name in DB
    $chapMap = [
        11 => 'asm_matprod_32',
        12 => 'asm_popcnt_64',
        13 => 'asm_saxpy_32',
        14 => 'asm_maxpars_64',
        15 => 'asm_vowels_64',
        16 => 'asm_fibonacci'
    ];

    $benchToChap = [
        'asm_matprod_32'  => 11,
        'asm_popcnt_64'   => 12,
        'asm_saxpy_32'    => 13,
        'asm_maxpars_64'  => 14,
        'asm_vowels_64'   => 15,
        'asm_fibonacci'   => 16
    ];

    // Determine benchmark name
    $benchName = null;
    if (isset($_GET['chapter'])) {
        $chapNum = (int)$_GET['chapter'];
        $benchName = $chapMap[$chapNum] ?? 'asm_vowels_64';
    } elseif (isset($_GET['bench'])) {
        $benchName = $_GET['bench'];
    } else {
        $benchName = 'asm_vowels_64';
    }

    $arch = $_GET['arch'] ?? 'recent';

    // Year-based filtering
    $yearCondition = "1=1";
    if ($arch === 'ancien') {
        $yearCondition = "(annee < 2015)";
    } elseif ($arch === 'moderne') {
        $yearCondition = "(annee >= 2015 AND annee < 2020)";
    } elseif ($arch === 'recent') {
        $yearCondition = "(annee >= 2020)";
    }

    // Query with AVG to handle duplicate entries
    $sql = "
        SELECT nom_cpu, annee, nom_test, AVG(valeur_resultat) as valeur_resultat
        FROM v_resultats 
        WHERE chapitre = :chapitre 
          AND (type_test = 'temps moyen' OR type_test = 'performance')
          AND $yearCondition
        GROUP BY nom_cpu, nom_test
        ORDER BY annee, nom_cpu, nom_test
    ";

    $stmt = $db->prepare($sql);
    $stmt->execute([':chapitre' => $benchName]);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($results)) {
        echo json_encode([
            "message" => "Aucune donnée trouvée pour $benchName / $arch",
            "source" => "sqlite",
            "CPUs" => [],
            "Years" => [],
            "Methods" => []
        ]);
        exit;
    }

    // Build CPUs list
    $cpus = [];
    $years = [];
    foreach ($results as $row) {
        if (!in_array($row['nom_cpu'], $cpus)) {
            $cpus[] = $row['nom_cpu'];
            $years[] = (int)$row['annee'];
        }
    }

    // Build Methods map
    $methodsMap = [];
    foreach ($results as $row) {
        $methodName = $row['nom_test'];
        $cpuIndex = array_search($row['nom_cpu'], $cpus);
        if (!isset($methodsMap[$methodName])) {
            $methodsMap[$methodName] = array_fill(0, count($cpus), null);
        }
        $methodsMap[$methodName][$cpuIndex] = round((float)$row['valeur_resultat'], 3);
    }

    // Mapping test names to display names for Chapter 15
    $testNameMap = [
        'cv_if'                 => 'C if',
        'cv_switch'             => 'C switch',
        'cv_letters'            => 'C tableau',
        'cv_letters_asm'        => 'tableau asm',
        'cv_letters_asm_ur4_v1' => 'tableau asm ur4 v1',
        'cv_letters_asm_ur4_v2' => 'tableau asm ur4 v2',
        'cv_letters_asm_ur8_v1' => 'tableau asm ur8 v1',
        'cv_letters_asm_ur8_v2' => 'tableau asm ur8 v2',
        'cv_letters_asm_ur8_v3' => 'tableau asm ur8 v3',
        'cv_sse2_v1'            => 'SSE2 v1',
        'cv_sse2_v2'            => 'SSE2 v2',
        'cv_sse2_intrinsics'    => 'SSE2 intrinsics',
        'cv_avx'                => 'AVX',
        'cv_avx2_v1'            => 'AVX2 v1',
        'cv_avx2_v2'            => 'AVX2 v2',
        'cv_avx2_v3'            => 'AVX2 v3',
        'cv_avx2_intrinsics'    => 'AVX2 intrinsics',
    ];

    // Convert to array
    $methodsArray = [];
    foreach ($methodsMap as $name => $values) {
        if ($name !== null && $name !== "") {
            $displayName = $testNameMap[$name] ?? $name;
            $methodsArray[] = ["name" => $displayName, "values" => $values];
        }
    }

    // Clean CPU display names
    $displayCPUs = array_map(function($cpu) {
        $cpu = str_replace(['-Processor', '-with-Radeon-Graphics', '-with-Radeon-Vega-Graphics'], '', $cpu);
        $cpu = str_replace('-', ' ', $cpu);
        $cpu = str_replace('_', '.', $cpu);
        return $cpu;
    }, $cpus);

    echo json_encode([
        "source" => "sqlite",
        "bench" => $benchName,
        "title" => "Benchmark " . $benchName . " - " . ucfirst($arch),
        "description" => "Données issues de la base SQLite",
        "CPUs" => $displayCPUs,
        "Years" => $years,
        "Methods" => $methodsArray
    ], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
