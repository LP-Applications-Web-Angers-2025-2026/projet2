#!/usr/bin/php
<?php
/**
 * Script d'import des données de benchmark dans la base SQLite
 * 
 * Usage: 
 *   php import_benchmark.php                    # Import des données codées en dur
 *   php import_benchmark.php --extract <pdf>    # Extraction du texte d'un PDF
 *   php import_benchmark.php --analyze <pdf>    # Analyse des tableaux de benchmark
 *   php import_benchmark.php --help             # Affiche l'aide
 * 
 * Prérequis: pdftotext (paquet poppler-utils)
 *   sudo apt install poppler-utils
 */

// ============================================================================
// CONFIGURATION
// ============================================================================

$dbPath = __DIR__ . '/site_web/data/benchmarks.db';
$defaultPdf = __DIR__ . '/Programmation_Assembleur_x86_32_et_64_bits_sous_Linux_Ubuntu.pdf';

// ============================================================================
// FONCTIONS UTILITAIRES
// ============================================================================

/**
 * Affiche l'aide
 */
function showHelp() {
    echo <<<HELP
=== Script d'import de benchmarks ===

Usage:
  php import_benchmark.php                    Import les données codées en dur
  php import_benchmark.php --extract <pdf>    Extrait le texte d'un PDF
  php import_benchmark.php --analyze <pdf>    Analyse les tableaux de benchmark
  php import_benchmark.php --chapters <pdf>   Liste les chapitres du PDF
  php import_benchmark.php --help             Affiche cette aide

Options:
  --extract <pdf>   Extrait tout le texte du PDF vers stdout
  --analyze <pdf>   Cherche et affiche les tableaux de performances
  --chapters <pdf>  Liste les chapitres détectés
  --page <n>        Avec --extract, extrait uniquement la page n
  --range <d-f>     Avec --extract, extrait les pages d à f
  --output <file>   Sauvegarde la sortie dans un fichier

Exemples:
  php import_benchmark.php --extract livre.pdf --page 150
  php import_benchmark.php --analyze livre.pdf --output analysis.txt
  php import_benchmark.php --chapters livre.pdf

HELP;
}

/**
 * Extrait le texte d'un PDF
 */
function extractPdfText($pdfPath, $page = null, $range = null) {
    if (!file_exists($pdfPath)) {
        die("Erreur: PDF non trouvé: $pdfPath\n");
    }
    
    // Vérifier que pdftotext est installé
    exec('which pdftotext', $output, $returnCode);
    if ($returnCode !== 0) {
        die("Erreur: pdftotext non installé. Installez-le avec: sudo apt install poppler-utils\n");
    }
    
    $cmd = "pdftotext -layout";
    
    if ($page !== null) {
        $cmd .= " -f $page -l $page";
    } elseif ($range !== null) {
        list($first, $last) = explode('-', $range);
        $cmd .= " -f $first -l $last";
    }
    
    $cmd .= " " . escapeshellarg($pdfPath) . " -";
    
    return shell_exec($cmd);
}

/**
 * Compte le nombre de pages d'un PDF
 */
function getPdfPageCount($pdfPath) {
    $cmd = "pdfinfo " . escapeshellarg($pdfPath) . " 2>/dev/null | grep 'Pages:' | awk '{print $2}'";
    return (int)trim(shell_exec($cmd));
}

/**
 * Analyse le texte pour trouver les tableaux de benchmark
 */
function analyzeBenchmarkTables($text) {
    $results = [];
    
    // Patterns pour détecter les tableaux de performance
    $patterns = [
        '/Table\s+(\d+\.\d+)[^\n]*performance/i',
        '/Tableau\s+(\d+\.\d+)[^\n]*benchmark/i',
        '/Tab\.\s*(\d+\.\d+)[^\n]*(temps|performance|résultat)/i',
    ];
    
    // Chercher les lignes avec des valeurs numériques typiques de benchmarks
    $lines = explode("\n", $text);
    $inTable = false;
    $currentTable = [];
    $tableStart = 0;
    
    foreach ($lines as $lineNum => $line) {
        // Détecter le début d'un tableau
        if (preg_match('/^(Table|Tableau|Tab\.)\s*\d+\.\d+/i', $line)) {
            if ($inTable && count($currentTable) > 2) {
                $results[] = [
                    'start' => $tableStart,
                    'lines' => $currentTable
                ];
            }
            $inTable = true;
            $currentTable = [$line];
            $tableStart = $lineNum;
            continue;
        }
        
        // Si on est dans un tableau, collecter les lignes avec des données
        if ($inTable) {
            // Ligne avec des nombres (potentiellement des données de benchmark)
            if (preg_match('/\d+[\.,]\d+/', $line) && strlen(trim($line)) > 5) {
                $currentTable[] = $line;
            }
            // Ligne vide = fin potentielle du tableau
            elseif (trim($line) === '' && count($currentTable) > 3) {
                $results[] = [
                    'start' => $tableStart,
                    'lines' => $currentTable
                ];
                $inTable = false;
                $currentTable = [];
            }
        }
    }
    
    // Ne pas oublier le dernier tableau
    if ($inTable && count($currentTable) > 2) {
        $results[] = [
            'start' => $tableStart,
            'lines' => $currentTable
        ];
    }
    
    return $results;
}

/**
 * Extrait les chapitres du PDF
 */
function extractChapters($text) {
    $chapters = [];
    $lines = explode("\n", $text);
    
    foreach ($lines as $lineNum => $line) {
        // Pattern pour les titres de chapitres
        if (preg_match('/^(Chapitre\s+(\d+))[.\s:]+(.+)$/i', trim($line), $matches)) {
            $chapters[] = [
                'number' => (int)$matches[2],
                'title' => trim($matches[3]),
                'line' => $lineNum
            ];
        }
        // Pattern alternatif
        elseif (preg_match('/^(\d+)\s+[-–]\s+(.+)$/', trim($line), $matches)) {
            if ((int)$matches[1] <= 20) { // Probablement un chapitre
                $chapters[] = [
                    'number' => (int)$matches[1],
                    'title' => trim($matches[2]),
                    'line' => $lineNum
                ];
            }
        }
    }
    
    return $chapters;
}

// ============================================================================
// TRAITEMENT DES ARGUMENTS
// ============================================================================

$args = $argv;
array_shift($args); // Enlever le nom du script

$mode = 'import'; // Mode par défaut
$pdfPath = $defaultPdf;
$page = null;
$range = null;
$outputFile = null;

while (count($args) > 0) {
    $arg = array_shift($args);
    
    switch ($arg) {
        case '--help':
        case '-h':
            showHelp();
            exit(0);
            
        case '--extract':
            $mode = 'extract';
            if (count($args) > 0 && $args[0][0] !== '-') {
                $pdfPath = array_shift($args);
            }
            break;
            
        case '--analyze':
            $mode = 'analyze';
            if (count($args) > 0 && $args[0][0] !== '-') {
                $pdfPath = array_shift($args);
            }
            break;
            
        case '--chapters':
            $mode = 'chapters';
            if (count($args) > 0 && $args[0][0] !== '-') {
                $pdfPath = array_shift($args);
            }
            break;
            
        case '--page':
            $page = array_shift($args);
            break;
            
        case '--range':
            $range = array_shift($args);
            break;
            
        case '--output':
            $outputFile = array_shift($args);
            break;
    }
}

// ============================================================================
// EXÉCUTION SELON LE MODE
// ============================================================================

switch ($mode) {
    case 'extract':
        echo "Extraction du PDF: $pdfPath\n";
        if ($page) echo "Page: $page\n";
        if ($range) echo "Pages: $range\n";
        echo str_repeat('=', 60) . "\n\n";
        
        $text = extractPdfText($pdfPath, $page, $range);
        
        if ($outputFile) {
            file_put_contents($outputFile, $text);
            echo "Texte sauvegardé dans: $outputFile\n";
        } else {
            echo $text;
        }
        exit(0);
        
    case 'analyze':
        echo "Analyse des tableaux de benchmark: $pdfPath\n";
        echo str_repeat('=', 60) . "\n\n";
        
        $text = extractPdfText($pdfPath, $page, $range);
        $tables = analyzeBenchmarkTables($text);
        
        $output = "Tableaux de benchmark trouvés: " . count($tables) . "\n\n";
        
        foreach ($tables as $i => $table) {
            $output .= "--- Tableau " . ($i + 1) . " (ligne " . $table['start'] . ") ---\n";
            foreach ($table['lines'] as $line) {
                $output .= $line . "\n";
            }
            $output .= "\n";
        }
        
        if ($outputFile) {
            file_put_contents($outputFile, $output);
            echo "Analyse sauvegardée dans: $outputFile\n";
        } else {
            echo $output;
        }
        exit(0);
        
    case 'chapters':
        echo "Liste des chapitres: $pdfPath\n";
        echo str_repeat('=', 60) . "\n\n";
        
        $text = extractPdfText($pdfPath);
        $chapters = extractChapters($text);
        
        $output = "";
        foreach ($chapters as $ch) {
            $output .= sprintf("Chapitre %2d: %s\n", $ch['number'], $ch['title']);
        }
        
        if ($outputFile) {
            file_put_contents($outputFile, $output);
            echo "Liste sauvegardée dans: $outputFile\n";
        } else {
            echo $output;
        }
        exit(0);
        
    case 'import':
        // Continue avec l'import standard ci-dessous
        break;
}

// ============================================================================
// MODE IMPORT STANDARD
// ============================================================================

if (!file_exists($dbPath)) {
    die("Erreur: Base de données non trouvée: $dbPath\n");
}

try {
    $db = new PDO("sqlite:$dbPath");
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "=== Import des données de benchmark ===\n\n";
    
    // ================================================================
    // CHAPITRE 17 : Nombres auto-descriptifs
    // ================================================================
    
    // Vérifier si le chapitre existe déjà
    $stmt = $db->query("SELECT id_chapitre FROM Chapitre WHERE nom_chapitre = 'asm_selfdesc'");
    $chapitre = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$chapitre) {
        echo "Ajout du chapitre 'asm_selfdesc' (nombres auto-descriptifs)...\n";
        $db->exec("INSERT INTO Chapitre (nom_chapitre) VALUES ('asm_selfdesc')");
        $chapitreId = $db->lastInsertId();
        echo "  -> Chapitre créé avec ID: $chapitreId\n";
    } else {
        $chapitreId = $chapitre['id_chapitre'];
        echo "Chapitre 'asm_selfdesc' existe déjà (ID: $chapitreId)\n";
    }
    
    // Récupérer l'ID du type "temps moyen"
    $stmt = $db->query("SELECT id_type_test FROM TypeTest WHERE nom_type_test = 'temps moyen'");
    $typeTest = $stmt->fetch(PDO::FETCH_ASSOC);
    $typeTestId = $typeTest['id_type_test'];
    
    // Définir les méthodes de test pour le chapitre 17
    $methods = [
        'cpp_std_to_string',      // 1 - version C++ standard
        'cpp_divs_8bits',         // 4 - version C++ avec conversion manuelle
        'asm_unroll',             // 8 - Assembleur sans division avec Unroll
        'asm_simd_avx',           // 12 - Assembleur SIMD AVX
        'asm_div_100',            // 14 - Assembleur division par 100
        'asm_bcd_fbstp',          // 16 - ASM archaïque BCD
        'asm_div_10000'           // 23 - Assembleur division par 10000
    ];
    
    // Ajouter les méthodes de test
    echo "\nAjout des méthodes de test...\n";
    foreach ($methods as $method) {
        $stmt = $db->prepare("SELECT id_test FROM Test WHERE nom_test = ? AND id_chapitre = ?");
        $stmt->execute([$method, $chapitreId]);
        $test = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$test) {
            $stmt = $db->prepare("INSERT INTO Test (nom_test, id_type_test, id_chapitre) VALUES (?, ?, ?)");
            $stmt->execute([$method, $typeTestId, $chapitreId]);
            echo "  -> Méthode ajoutée: $method\n";
        } else {
            echo "  -> Méthode existe déjà: $method\n";
        }
    }
    
    // Données de benchmark (extraites du PDF - Table 17.3-17.5)
    // Format: [cpu_name, method, value]
    $benchmarkData = [
        // Intel Core i5 7400
        ['Core i5 7400', 'cpp_std_to_string', 15.91],
        ['Core i5 7400', 'cpp_divs_8bits', 7.08],
        ['Core i5 7400', 'asm_unroll', 6.87],
        ['Core i5 7400', 'asm_simd_avx', 8.41],
        ['Core i5 7400', 'asm_div_100', 6.02],
        ['Core i5 7400', 'asm_bcd_fbstp', 100.0],
        
        // Intel Core i7 4790
        ['Core i7 4790', 'cpp_std_to_string', 16.83],
        ['Core i7 4790', 'cpp_divs_8bits', 7.53],
        ['Core i7 4790', 'asm_unroll', 7.28],
        ['Core i7 4790', 'asm_simd_avx', 9.22],
        ['Core i7 4790', 'asm_div_100', 6.38],
        ['Core i7 4790', 'asm_bcd_fbstp', 108.34],
        ['Core i7 4790', 'asm_div_10000', 20.56],
        
        // Intel Core i7 8700
        ['Core i7 8700', 'cpp_std_to_string', 13.35],
        ['Core i7 8700', 'cpp_divs_8bits', 5.78],
        ['Core i7 8700', 'asm_unroll', 5.73],
        ['Core i7 8700', 'asm_simd_avx', 6.87],
        ['Core i7 8700', 'asm_div_100', 4.86],
        ['Core i7 8700', 'asm_bcd_fbstp', 36.89],
        ['Core i7 8700', 'asm_div_10000', 4.00],
        
        // Intel Core i5 12400F
        ['Core i5 12400F', 'cpp_std_to_string', 6.25],
        ['Core i5 12400F', 'cpp_divs_8bits', 3.88],
        ['Core i5 12400F', 'asm_unroll', 3.51],
        ['Core i5 12400F', 'asm_simd_avx', 5.17],
        ['Core i5 12400F', 'asm_div_100', 2.87],
        
        // AMD Ryzen 5 5600G
        ['Ryzen 5 5600G', 'cpp_std_to_string', 12.34],
        ['Ryzen 5 5600G', 'cpp_divs_8bits', 5.09],
        ['Ryzen 5 5600G', 'asm_unroll', 4.44],
        ['Ryzen 5 5600G', 'asm_simd_avx', 5.48],
        ['Ryzen 5 5600G', 'asm_div_100', 3.66],
        ['Ryzen 5 5600G', 'asm_bcd_fbstp', 35.83],
        ['Ryzen 5 5600G', 'asm_div_10000', 8.77],
    ];
    
    // Mapping des noms de CPU vers les IDs existants
    $cpuMapping = [];
    $stmt = $db->query("SELECT id_cpu, nom_cpu, nom_court FROM CPU");
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $cpuMapping[$row['nom_cpu']] = $row['id_cpu'];
        if ($row['nom_court']) {
            $cpuMapping[$row['nom_court']] = $row['id_cpu'];
        }
    }
    
    // Vérifier et ajouter les CPUs manquants
    $cpusToAdd = [
        'Core i5 7400' => ['Intel', 'Core i5', '7400', 2017],
        'Core i7 4790' => ['Intel', 'Core i7', '4790', 2014],
        'Core i7 8700' => ['Intel', 'Core i7', '8700', 2017],
        'Core i5 12400F' => ['Intel', 'Core i5', '12400F', 2022],
        'Ryzen 5 5600G' => ['AMD', 'Ryzen 5', '5600G', 2021],
    ];
    
    echo "\nVérification des CPUs...\n";
    foreach ($cpusToAdd as $cpuName => $cpuInfo) {
        if (!isset($cpuMapping[$cpuName])) {
            // Chercher par nom similaire
            $found = false;
            foreach ($cpuMapping as $existingName => $id) {
                if (stripos($existingName, $cpuInfo[2]) !== false) {
                    $cpuMapping[$cpuName] = $id;
                    $found = true;
                    echo "  -> CPU '$cpuName' mappé à ID existant: $id ($existingName)\n";
                    break;
                }
            }
            
            if (!$found) {
                // Récupérer ou créer la marque
                $stmt = $db->prepare("SELECT id_marque FROM Marque WHERE nom_marque = ?");
                $stmt->execute([$cpuInfo[0]]);
                $marque = $stmt->fetch(PDO::FETCH_ASSOC);
                
                if (!$marque) {
                    $db->exec("INSERT INTO Marque (nom_marque) VALUES ('{$cpuInfo[0]}')");
                    $marqueId = $db->lastInsertId();
                } else {
                    $marqueId = $marque['id_marque'];
                }
                
                // Récupérer ou créer le modèle
                $stmt = $db->prepare("SELECT id_modele FROM Modele WHERE nom_modele = ?");
                $stmt->execute([$cpuInfo[1]]);
                $modele = $stmt->fetch(PDO::FETCH_ASSOC);
                
                if (!$modele) {
                    $db->exec("INSERT INTO Modele (nom_modele) VALUES ('{$cpuInfo[1]}')");
                    $modeleId = $db->lastInsertId();
                } else {
                    $modeleId = $modele['id_modele'];
                }
                
                // Créer le CPU
                $stmt = $db->prepare("INSERT INTO CPU (nom_cpu, id_marque, id_modele, sous_modele, annee, nom_court) VALUES (?, ?, ?, ?, ?, ?)");
                $stmt->execute([$cpuName, $marqueId, $modeleId, $cpuInfo[2], $cpuInfo[3], $cpuName]);
                $cpuMapping[$cpuName] = $db->lastInsertId();
                echo "  -> CPU ajouté: $cpuName (ID: {$cpuMapping[$cpuName]})\n";
            }
        } else {
            echo "  -> CPU existe: $cpuName (ID: {$cpuMapping[$cpuName]})\n";
        }
    }
    
    // Insérer les résultats de benchmark
    echo "\nInsertion des résultats de benchmark...\n";
    $insertCount = 0;
    $skipCount = 0;
    
    foreach ($benchmarkData as $data) {
        list($cpuName, $methodName, $value) = $data;
        
        // Récupérer l'ID du CPU
        if (!isset($cpuMapping[$cpuName])) {
            echo "  ATTENTION: CPU non trouvé: $cpuName\n";
            continue;
        }
        $cpuId = $cpuMapping[$cpuName];
        
        // Récupérer l'ID du test
        $stmt = $db->prepare("SELECT id_test FROM Test WHERE nom_test = ? AND id_chapitre = ?");
        $stmt->execute([$methodName, $chapitreId]);
        $test = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$test) {
            echo "  ATTENTION: Méthode non trouvée: $methodName\n";
            continue;
        }
        $testId = $test['id_test'];
        
        // Vérifier si le résultat existe déjà
        $stmt = $db->prepare("SELECT id_resultat FROM Resultat WHERE id_cpu = ? AND id_test = ?");
        $stmt->execute([$cpuId, $testId]);
        $existing = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$existing) {
            $stmt = $db->prepare("INSERT INTO Resultat (id_cpu, id_test, valeur_resultat) VALUES (?, ?, ?)");
            $stmt->execute([$cpuId, $testId, $value]);
            $insertCount++;
        } else {
            $skipCount++;
        }
    }
    
    echo "  -> $insertCount résultats insérés, $skipCount déjà existants\n";
    
    // ================================================================
    // Résumé
    // ================================================================
    
    echo "\n=== Import terminé ===\n";
    
    // Afficher les statistiques
    $stmt = $db->query("SELECT COUNT(*) as cnt FROM Chapitre");
    $cnt = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "Nombre de chapitres: {$cnt['cnt']}\n";
    
    $stmt = $db->query("SELECT COUNT(*) as cnt FROM Test");
    $cnt = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "Nombre de tests: {$cnt['cnt']}\n";
    
    $stmt = $db->query("SELECT COUNT(*) as cnt FROM Resultat");
    $cnt = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "Nombre de résultats: {$cnt['cnt']}\n";
    
} catch (PDOException $e) {
    die("Erreur PDO: " . $e->getMessage() . "\n");
}

?>
