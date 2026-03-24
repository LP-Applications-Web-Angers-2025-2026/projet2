<?php
/**
 * config.php - Configuration centralisée pour les scripts d'extraction PDF
 * 
 * Ce fichier charge la configuration depuis .env et fournit des fonctions
 * utilitaires communes à tous les scripts.
 */

// ============================================================================
// CHARGEMENT DU FICHIER .ENV
// ============================================================================

/**
 * Charge les variables d'environnement depuis un fichier .env
 * 
 * @param string $envFile Chemin vers le fichier .env
 * @return array Variables chargées
 */
function loadEnv(string $envFile): array {
    $vars = [];
    
    if (!file_exists($envFile)) {
        return $vars;
    }
    
    $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    
    foreach ($lines as $line) {
        // Ignorer les commentaires
        if (strpos(trim($line), '#') === 0) {
            continue;
        }
        
        // Parser KEY=value
        if (strpos($line, '=') !== false) {
            list($key, $value) = explode('=', $line, 2);
            $key = trim($key);
            $value = trim($value);
            
            // Supprimer les guillemets si présents
            $value = trim($value, '"\'');
            
            $vars[$key] = $value;
            
            // Définir aussi comme variable d'environnement
            putenv("$key=$value");
        }
    }
    
    return $vars;
}

// Charger .env depuis le répertoire du script
$envFile = __DIR__ . '/.env';
$envVars = loadEnv($envFile);

// ============================================================================
// CONFIGURATION PAR DÉFAUT
// ============================================================================

// Résoudre les chemins relatifs par rapport au répertoire pdf_extract
$baseDir = __DIR__;

// PDF source
$defaultPdf = realpath($baseDir . '/../Programmation_Assembleur_x86_32_et_64_bits_sous_Linux_Ubuntu.pdf');
define('PDF_PATH', isset($envVars['PDF_PATH']) 
    ? realpath($baseDir . '/' . $envVars['PDF_PATH']) ?: $envVars['PDF_PATH']
    : $defaultPdf);

// Base de données
$defaultDb = realpath($baseDir . '/../site_web/data/benchmarks.db');
define('DB_PATH', isset($envVars['DB_PATH'])
    ? realpath($baseDir . '/' . $envVars['DB_PATH']) ?: $envVars['DB_PATH']
    : $defaultDb);

// Répertoire de sortie markdown
$defaultOutput = realpath($baseDir . '/../site_web/pages-md');
define('OUTPUT_DIR', isset($envVars['OUTPUT_DIR'])
    ? realpath($baseDir . '/' . $envVars['OUTPUT_DIR']) ?: $baseDir . '/' . $envVars['OUTPUT_DIR']
    : $defaultOutput);

// Répertoire des données JSON
$defaultData = realpath($baseDir . '/../site_web/data');
define('DATA_DIR', isset($envVars['DATA_DIR'])
    ? realpath($baseDir . '/' . $envVars['DATA_DIR']) ?: $baseDir . '/' . $envVars['DATA_DIR']
    : $defaultData);

// ============================================================================
// FONCTIONS UTILITAIRES COMMUNES
// ============================================================================

/**
 * Affiche la configuration actuelle
 */
function showConfig(): void {
    echo "=== Configuration actuelle ===\n";
    echo "PDF_PATH:   " . PDF_PATH . "\n";
    echo "DB_PATH:    " . DB_PATH . "\n";
    echo "OUTPUT_DIR: " . OUTPUT_DIR . "\n";
    echo "DATA_DIR:   " . DATA_DIR . "\n";
    echo "\n";
}

/**
 * Vérifie que le PDF existe
 * 
 * @param string|null $path Chemin optionnel (utilise PDF_PATH si null)
 * @return bool
 */
function checkPdfExists(?string $path = null): bool {
    $pdfPath = $path ?? PDF_PATH;
    
    if (!$pdfPath || !file_exists($pdfPath)) {
        echo "Erreur: PDF non trouvé: $pdfPath\n";
        echo "Vérifiez le chemin dans .env (PDF_PATH)\n";
        return false;
    }
    
    return true;
}

/**
 * Vérifie que la base de données existe
 * 
 * @param string|null $path Chemin optionnel (utilise DB_PATH si null)
 * @return bool
 */
function checkDbExists(?string $path = null): bool {
    $dbPath = $path ?? DB_PATH;
    
    if (!$dbPath || !file_exists($dbPath)) {
        echo "Erreur: Base de données non trouvée: $dbPath\n";
        echo "Vérifiez le chemin dans .env (DB_PATH)\n";
        return false;
    }
    
    return true;
}

/**
 * Vérifie que pdftotext est installé
 * 
 * @return bool
 */
function checkPdfToText(): bool {
    exec('which pdftotext', $output, $returnCode);
    
    if ($returnCode !== 0) {
        echo "Erreur: pdftotext non installé.\n";
        echo "Installez-le avec: sudo apt install poppler-utils\n";
        return false;
    }
    
    return true;
}

/**
 * Extrait le texte d'un PDF avec pdftotext (fonction utilitaire)
 * 
 * @param string|null $pdfPath Chemin du PDF (utilise PDF_PATH si null)
 * @param int|null $page Page spécifique à extraire
 * @param string|null $range Plage de pages (ex: "10-20")
 * @return string|null Texte extrait ou null en cas d'erreur
 */
function pdfExtractText(?string $pdfPath = null, ?int $page = null, ?string $range = null): ?string {
    $pdfPath = $pdfPath ?? PDF_PATH;
    
    if (!checkPdfExists($pdfPath) || !checkPdfToText()) {
        return null;
    }
    
    $cmd = "pdftotext -layout";
    
    if ($page !== null) {
        $cmd .= " -f $page -l $page";
    } elseif ($range !== null) {
        $parts = explode('-', $range);
        if (count($parts) === 2) {
            $cmd .= " -f {$parts[0]} -l {$parts[1]}";
        }
    }
    
    $cmd .= " " . escapeshellarg($pdfPath) . " -";
    
    return shell_exec($cmd);
}

/**
 * Compte le nombre de pages d'un PDF
 * 
 * @param string|null $pdfPath Chemin du PDF
 * @return int Nombre de pages
 */
function getPdfPageCount(?string $pdfPath = null): int {
    $pdfPath = $pdfPath ?? PDF_PATH;
    
    if (!checkPdfExists($pdfPath)) {
        return 0;
    }
    
    $cmd = "pdfinfo " . escapeshellarg($pdfPath) . " 2>/dev/null | grep 'Pages:' | awk '{print $2}'";
    return (int)trim(shell_exec($cmd));
}

/**
 * Ouvre une connexion PDO vers la base de données
 * 
 * @param string|null $dbPath Chemin de la BDD
 * @return PDO|null Connexion PDO ou null en cas d'erreur
 */
function getDatabase(?string $dbPath = null): ?PDO {
    $dbPath = $dbPath ?? DB_PATH;
    
    if (!checkDbExists($dbPath)) {
        return null;
    }
    
    try {
        $db = new PDO("sqlite:$dbPath");
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $db;
    } catch (PDOException $e) {
        echo "Erreur PDO: " . $e->getMessage() . "\n";
        return null;
    }
}

// ============================================================================
// AFFICHAGE DE LA CONFIG SI APPELÉ DIRECTEMENT
// ============================================================================

if (basename(__FILE__) === basename($_SERVER['SCRIPT_FILENAME'] ?? '')) {
    showConfig();
    
    echo "=== Vérifications ===\n";
    echo "PDF existe: " . (checkPdfExists() ? "✓" : "✗") . "\n";
    echo "BDD existe: " . (checkDbExists() ? "✓" : "✗") . "\n";
    echo "pdftotext:  " . (checkPdfToText() ? "✓" : "✗") . "\n";
    
    if (checkPdfExists()) {
        echo "\nNombre de pages: " . getPdfPageCount() . "\n";
    }
}
