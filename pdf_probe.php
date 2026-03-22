<?php
require __DIR__ . '/vendor/autoload.php';

use Smalot\PdfParser\Parser;

$parser = new Parser();
$pdf    = $parser->parseFile(__DIR__ . '/Programmation_Assembleur_x86_32_et_64_bits_sous_Linux_Ubuntu.pdf');
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

file_put_contents('pdf_analysis.txt', $out);
echo "Analyse écrite dans pdf_analysis.txt\n";

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
file_put_contents('pdf_chapters_scan.txt', $out2);
echo "Scan chapitres écrit dans pdf_chapters_scan.txt\n";
