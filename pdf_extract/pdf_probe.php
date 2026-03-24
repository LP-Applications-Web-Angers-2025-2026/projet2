<?php
/**
 * Script d'analyse de structure PDF
 * Utile pour comprendre le format d'un PDF avant extraction
 * 
 * Usage: php pdf_probe.php [--config] [--output fichier.txt]
 * 
 * Configuration via .env :
 *   PDF_PATH=chemin/vers/le.pdf
 */

require_once __DIR__ . '/config.php';
require __DIR__ . '/../vendor/autoload.php';

use Smalot\PdfParser\Parser;

// Traitement des arguments
$outputFile = null;
for ($i = 1; $i < count($argv); $i++) {
    if ($argv[$i] === '--config') {
        showConfig();
        exit(0);
    }
    if ($argv[$i] === '--output' && isset($argv[$i + 1])) {
        $outputFile = $argv[$i + 1];
        $i++;
    }
}

// Vérifier que le PDF existe
if (!checkPdfExists()) {
    exit(1);
}

$parser = new Parser();
$pdf    = $parser->parseFile(PDF_PATH);
$pages  = $pdf->getPages();
$total  = count($pages);

$out = "";

// Analyser les 50 premières pages pour comprendre la structure
for ($i = 0; $i < min(50, $total); $i++) {
    $text  = $pages[$i]->getText();
    $lines = explode("\n", $text);
    $cleanLines = [];
    foreach ($lines as $l) {
        $c = trim(preg_replace('/[\x00-\x08\x0B\x0C\x0E-\x1F]/', '', $l));
        if ($c !== '') $cleanLines[] = $c;
    }

    $out .= "=== PAGE " . ($i + 1) . " (premières 15 lignes non-vides) ===\n";
    foreach (array_slice($cleanLines, 0, 15) as $l) {
        $out .= "  [" . $l . "]\n";
    }
    $out .= "\n";
}

// Sortie
if ($outputFile) {
    file_put_contents($outputFile, $out);
    echo "Analyse écrite dans $outputFile\n";
} else {
    file_put_contents('pdf_analysis.txt', $out);
    echo "Analyse écrite dans pdf_analysis.txt\n";
}

// Recherche spécifique du mot "chapitre" ou "Chapitre" sur toutes les pages
$out2 = "=== PAGES CONTENANT 'CHAPITRE' ===\n\n";
for ($i = 0; $i < $total; $i++) {
    $text = $pages[$i]->getText();
    if (stripos($text, 'chapitre') !== false) {
        $lines = array_values(array_filter(array_map('trim', explode("\n", $text)), 'strlen'));
        $filtered = array_filter($lines, fn($l) => stripos($l, 'chapitre') !== false);
        if (!empty($filtered)) {
            $out2 .= "Page " . ($i + 1) . ":\n";
            foreach (array_slice(array_values($filtered), 0, 5) as $l) {
                $out2 .= "  [" . $l . "]\n";
            }
            $out2 .= "\n";
        }
    }
}

$chaptersFile = $outputFile ? str_replace('.txt', '_chapters.txt', $outputFile) : 'pdf_chapters_scan.txt';
file_put_contents($chaptersFile, $out2);
echo "Scan chapitres écrit dans $chaptersFile\n";
