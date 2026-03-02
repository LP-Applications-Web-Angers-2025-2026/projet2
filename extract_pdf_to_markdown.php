<?php
/**
 * Script d'extraction PDF -> Markdown par chapitre
 * PDF: Programmation Assembleur x86 32 et 64 bits sous Linux Ubuntu
 *
 * Usage: php extract_pdf_to_markdown.php
 * Output: dossier ./chapitres_markdown/ avec un fichier .md par chapitre
 */

require __DIR__ . '/vendor/autoload.php';

use Smalot\PdfParser\Parser;

// ============================================================
// CONFIGURATION
// ============================================================
$PDF_FILE   = __DIR__ . '/Programmation_Assembleur_x86_32_et_64_bits_sous_Linux_Ubuntu.pdf';
$OUTPUT_DIR = __DIR__ . '/chapitres_markdown';

if (!is_dir($OUTPUT_DIR)) mkdir($OUTPUT_DIR, 0777, true);

// ============================================================
// PARSING DU PDF
// ============================================================
echo "Parsing du PDF...\n";
$parser = new Parser();
$pdf    = $parser->parseFile($PDF_FILE);
$pages  = $pdf->getPages();
$total  = count($pages);
echo "Nombre de pages: $total\n\n";

// ============================================================
// EXTRACTION DU TEXTE PAGE PAR PAGE
// ============================================================
$allPagesText = [];
for ($i = 0; $i < $total; $i++) {
    $text = $pages[$i]->getText();
    $allPagesText[$i] = $text;
    if (($i + 1) % 50 === 0) echo "  Lu " . ($i + 1) . "/$total pages...\n";
}
echo "Texte extrait.\n\n";

// ============================================================
// DETECTION DES CHAPITRES
// ============================================================
/**
 * On cherche les pages qui commencent un nouveau chapitre.
 * Patterns typiques dans ce type de document :
 *   - "Chapitre N" ou "CHAPITRE N" en début de page
 *   - Ligne contenant uniquement "N" suivi d'un titre connu (table of contents)
 * On scanne toutes les pages et on détecte les débuts de chapitres.
 */

$chapters = []; // ['num' => X, 'title' => '...', 'start_page' => N]

for ($i = 0; $i < $total; $i++) {
    $text  = $allPagesText[$i];
    $lines = array_values(array_filter(array_map('trim', explode("\n", $text)), 'strlen'));

    if (empty($lines)) continue;

    // Pattern: "ChapitreN" ou "Chapitre N" sur la première ligne de la page
    // Structure réelle du PDF: "Chapitre1" (sans espace), puis le titre sur les lignes suivantes
    foreach (array_slice($lines, 0, 6) as $lineIdx => $line) {
        // Matches: "Chapitre1", "Chapitre 1", "CHAPITRE 1", "Chapitre 12", etc.
        if (preg_match('/^(?:Chapitre|CHAPITRE)\s*(\d+)\s*$/i', $line, $m)) {
            $chapNum = (int)$m[1];
            // Le titre est construit à partir des lignes suivantes
            // (peut être sur 1 ou 2 lignes)
            $titleParts = [];
            for ($ti = $lineIdx + 1; $ti <= $lineIdx + 3 && $ti < count($lines); $ti++) {
                $tline = trim($lines[$ti]);
                if ($tline === '') break;
                // Arrêter si c'est une section numérotée ou une citation
                if (preg_match('/^\d+\.\d/', $tline)) break;
                // Arrêter si la ligne ressemble à une épigraphe/citation (phrase avec majuscule)
                if (count($titleParts) >= 2) break;
                $titleParts[] = $tline;
            }
            $titleLine = implode(' ', $titleParts);

            // Eviter les doublons : ne garder que la première occurrence du chapitre
            $exists = false;
            foreach ($chapters as $ch) {
                if ($ch['num'] === $chapNum) { $exists = true; break; }
            }
            if (!$exists) {
                $chapters[] = ['num' => $chapNum, 'title' => $titleLine, 'start_page' => $i];
            }
            break;
        }
    }
}

// Trier par numéro de chapitre puis par page de début
usort($chapters, function($a, $b) {
    return $a['start_page'] - $b['start_page'];
});

// Déduplication: si même numéro, garder la première occurrence
$dedupChapters = [];
$seenNums      = [];
foreach ($chapters as $ch) {
    if (!isset($seenNums[$ch['num']])) {
        $seenNums[$ch['num']] = true;
        $dedupChapters[]      = $ch;
    }
}
$chapters = $dedupChapters;

echo "Chapitres détectés par pattern 'Chapitre N':\n";
foreach ($chapters as $ch) {
    echo "  - Chapitre {$ch['num']}: \"{$ch['title']}\" (page PDF " . ($ch['start_page'] + 1) . ")\n";
}
echo "\n";

// Si aucun chapitre détecté par pattern, on essaie une approche alternative
if (empty($chapters)) {
    echo "Aucun chapitre trouvé avec le pattern 'ChapitreN'. Tentative de détection alternative...\n\n";
    // Scan du texte complet pour trouver "Chapitre" n'importe où sur la page
    for ($i = 0; $i < $total; $i++) {
        $text  = $allPagesText[$i];
        if (preg_match('/(?:^|\n)\s*(?:Chapitre|CHAPITRE)\s*(\d+)\s*\n\s*([^\n]{3,80})/i', $text, $m)) {
            $chapNum = (int)$m[1];
            $title   = trim($m[2]);
            $exists  = false;
            foreach ($chapters as $ch) {
                if ($ch['num'] === $chapNum) { $exists = true; break; }
            }
            if (!$exists) {
                $chapters[] = ['num' => $chapNum, 'title' => $title, 'start_page' => $i];
            }
        }
    }
    usort($chapters, fn($a, $b) => $a['start_page'] - $b['start_page']);
    echo "Chapitres détectés (alternative):\n";
    foreach ($chapters as $ch) {
        echo "  - Chapitre {$ch['num']}: \"{$ch['title']}\" (page " . ($ch['start_page'] + 1) . ")\n";
    }
    echo "\n";
}

// ============================================================
// ASSIGNATION DES PLAGES DE PAGES PAR CHAPITRE
// ============================================================
$chapCount = count($chapters);
for ($c = 0; $c < $chapCount; $c++) {
    $chapters[$c]['end_page'] = ($c + 1 < $chapCount)
        ? $chapters[$c + 1]['start_page'] - 1
        : $total - 1;
}

// Ajouter une section "avant le chapitre 1" (intro, remerciements, TDM)
if (!empty($chapters) && $chapters[0]['start_page'] > 0) {
    array_unshift($chapters, [
        'num'        => 0,
        'title'      => 'Préface et Table des Matières',
        'start_page' => 0,
        'end_page'   => $chapters[0]['start_page'] - 1,
    ]);
}

// ============================================================
// CONVERSION TEXT -> MARKDOWN : FONCTIONS UTILITAIRES
// ============================================================

function detectCodeBlock(string $text): bool {
    // Heuristique : présence d'instructions assembleur ou de séquences de code
    $patterns = [
        '/^\s*(mov|push|pop|add|sub|mul|div|xor|and|or|not|cmp|jmp|je|jne|jl|jg|jle|jge|call|ret|nop|lea|int|syscall|section|global|extern|bits|db|dw|dd|dq|resb|resw|resd|resq|equ|SECTION|GLOBAL|EXTERN)\b/im',
        '/^\s*[a-z_][a-z0-9_]*:\s*;/im',    // labels avec commentaire
        '/^\s*;.*$/m',                          // lignes de commentaires asm
        '/^\s*(\.text|\.data|\.bss|\.rodata)\s*$/m',
        '/0x[0-9a-fA-F]+/',                     // constantes hexadécimales
        '/\%[a-z]+[a-z0-9]*/i',                // registres style AT&T %eax
        '/\b(eax|ebx|ecx|edx|esi|edi|esp|ebp|rax|rbx|rcx|rdx|rsi|rdi|rsp|rbp|r8|r9|r10|r11|r12|r13|r14|r15)\b/i',
    ];
    $matchCount = 0;
    foreach ($patterns as $p) {
        if (preg_match($p, $text)) $matchCount++;
        if ($matchCount >= 2) return true;
    }
    return false;
}

function detectLanguage(string $text): string {
    if (preg_match('/\b(#include|int main|printf|scanf|void|char\s*\*|struct|typedef)\b/i', $text)) return 'c';
    if (preg_match('/\bdef\s+\w+\s*\(|import\s+\w+|print\s*\(/i', $text)) return 'python';
    if (preg_match('/\b(mov|push|pop|add|sub|xor|cmp|jmp|je|jne|syscall|section|global)\b/i', $text)) return 'nasm';
    if (preg_match('/\b(gcc|make|ld|as|nasm|yasm)\b|^\$\s/m', $text)) return 'bash';
    return 'text';
}

function isTableRow(string $line): bool {
    // Ligne contenant plusieurs colonnes séparées par des espaces multiples ou tabulations
    return preg_match('/\s{3,}/', trim($line)) && strlen(trim($line)) > 10;
}

function isNumberedSection(string $line): bool {
    // Ex: "2.3.1 Titre de section"
    return (bool)preg_match('/^\d+(\.\d+)+\s+\S/', trim($line));
}

function isSectionTitle(string $line): bool {
    // Ex: "2.3 Titre" ou "2. Titre"
    return (bool)preg_match('/^\d+\.(\d+\.)?\s+\S/', trim($line));
}

function cleanLine(string $line): string {
    // Supprime les artefacts du parser PDF (caractères parasites)
    $line = preg_replace('/\x00+/', '', $line);
    $line = preg_replace('/[\x01-\x08\x0B\x0C\x0E-\x1F]/', '', $line);
    // Normalise les espaces multiples
    $line = preg_replace('/[ \t]+/', ' ', $line);
    return trim($line);
}

function isPageNumber(string $line): bool {
    return preg_match('/^\d+$/', trim($line)) && strlen(trim($line)) <= 4;
}

function isHeaderFooter(string $line): bool {
    $line = trim($line);
    // En-têtes/pieds courants dans les documents académiques
    $patterns = [
        '/^Programmation\s+Assembleur/i',
        '/^Chapitre\s+\d+/i',
        '/^Exercice\s+\d+/i',
        '/^Figure\s+\d+/i',     // garder si informatif
        '/^Page\s+\d+/i',
        '/^\d+\s*\/\s*\d+$/',   // "12 / 479"
    ];
    // On ne filtre pas tout, juste les répétitions pures
    return false; // On garde tout pour l'instant
}

// ============================================================
// CONVERSION DES PAGES EN MARKDOWN
// ============================================================

function pagesToMarkdown(array $allPagesText, int $startPage, int $endPage, int $chapNum, string $chapTitle): string {
    $md     = '';
    $inCode = false;
    $codeBuffer = '';
    $prevLineEmpty = false;

    // En-tête du chapitre
    if ($chapNum === 0) {
        $md .= "# {$chapTitle}\n\n";
    } else {
        $md .= "# Chapitre {$chapNum} : {$chapTitle}\n\n";
    }

    for ($p = $startPage; $p <= $endPage; $p++) {
        $text  = $allPagesText[$p];
        $lines = explode("\n", $text);

        $pageLines = [];
        foreach ($lines as $line) {
            $cleaned = cleanLine($line);
            $pageLines[] = $cleaned;
        }

        $lineCount = count($pageLines);
        for ($li = 0; $li < $lineCount; $li++) {
            $line = $pageLines[$li];

            // Ignorer les lignes vides successives (max 1)
            if ($line === '') {
                if (!$prevLineEmpty && !$inCode) {
                    $md .= "\n";
                    $prevLineEmpty = true;
                }
                continue;
            }
            $prevLineEmpty = false;

            // Ignorer numéros de page seuls
            if (isPageNumber($line)) continue;

            // --- DETECTION TITRE CHAPITRE (déjà traité, skip) ---
            // Matches: "Chapitre1", "Chapitre 1", etc.
            if (preg_match('/^(?:Chapitre|CHAPITRE)\s*\d+\s*$/i', $line)) continue;

            // --- FILTRER EN-TÊTES DE PAGES ("28 CHAPITRE 1. TITRE...") ---
            // Ces lignes sont des répétitions de l'en-tête de page
            if (preg_match('/^\d+\s+(?:CHAPITRE|ANNEXE)\s+\d+\./i', $line)) continue;
            // Aussi: "CHAPITRE 1. TITRE  45" ou "1.2. SOUS-TITRE  29"
            if (preg_match('/^(?:CHAPITRE|ANNEXE)\s+\d+\.\s+[A-Z\s]+\s+\d+$/i', $line)) continue;
            if (preg_match('/^\d+\.\d+\.\s+[A-Z\s,\']+\s+\d+$/', $line)) continue;
            // Pattern: "NOM SECTION   N\u00b0PAGE" comme "1.1. POURQUOI APPRENDRE L'ASSEMBLEUR 31"
            if (preg_match('/^(?:\d+\.)+\s+[A-Z][A-Z\s\']+\s+\d{1,3}$/', $line)) continue;

            // --- DETECTION TITRES DE SECTIONS ---
            // Sous-section numérotée type "3.2.1 Titre" (avec texte sur la même ligne)
            if (preg_match('/^(\d+\.\d+\.\d+(?:\.\d+)?)\s+(.+)$/', $line, $m)) {
                if ($inCode) { $md .= "```\n\n"; $inCode = false; }
                $level = substr_count($m[1], '.') + 2; // 3 -> ####, 2 -> ###
                $level = min($level, 4);
                $hashes = str_repeat('#', $level);
                $md .= "{$hashes} {$m[1]} {$m[2]}\n\n";
                continue;
            }
            // Section type "3.2 Titre" (avec texte sur la même ligne)
            if (preg_match('/^(\d+\.\d+)\s+(.+)$/', $line, $m) && strlen($m[2]) < 120) {
                if ($inCode) { $md .= "```\n\n"; $inCode = false; }
                $md .= "## {$m[1]} {$m[2]}\n\n";
                continue;
            }
            // Numéro de section seul sur sa ligne (ex: "1.2" ou "1.2.3" sans titre)
            // -> Le titre est sur la ligne suivante
            if (preg_match('/^(\d+\.\d+(?:\.\d+)*)\s*$/', $line, $m)) {
                $nextLine = trim($pageLines[$li + 1] ?? '');
                // Si la ligne suivante ressemble à un titre (courte, pas un paragraphe)
                if ($nextLine !== '' && strlen($nextLine) < 100
                    && !preg_match('/^\d+\./', $nextLine)
                    && !preg_match('/[.!?]$/', $nextLine)) {
                    $dots   = substr_count($m[1], '.');
                    $level  = $dots === 1 ? 2 : ($dots === 2 ? 3 : 4);
                    $hashes = str_repeat('#', $level);
                    if ($inCode) { $md .= "```\n\n"; $inCode = false; }
                    $md .= "{$hashes} {$m[1]} {$nextLine}\n\n";
                    $li++; // Skipper la ligne du titre
                    continue;
                }
            }

            // --- DETECTION BLOCS SPECIAUX ---
            // Définition / Note / Remarque / Exemple / Attention
            if (preg_match('/^(Définition|Note|Remarque|Attention|Exemple|Info|Important)\s*[:：]/i', $line, $m)) {
                if ($inCode) { $md .= "```\n\n"; $inCode = false; }
                $keyword = ucfirst(strtolower($m[1]));
                $rest    = trim(substr($line, strlen($m[0])));
                $md .= "\n> **{$keyword}** : {$rest}\n>\n";
                continue;
            }

            // --- DETECTION LISTES ---
            // Listes à puces (−, •, *, -)
            if (preg_match('/^[•\-–]\s+(.+)$/', $line, $m)) {
                if ($inCode) { $md .= "```\n\n"; $inCode = false; }
                $md .= "- {$m[1]}\n";
                continue;
            }
            // Listes numérotées
            if (preg_match('/^(\d+)[.)]\s+(.+)$/', $line, $m) && !isNumberedSection($line)) {
                if ($inCode) { $md .= "```\n\n"; $inCode = false; }
                $md .= "{$m[1]}. {$m[2]}\n";
                continue;
            }

            // --- DETECTION CODE ---
            // Heuristique : indentation + contenu ressemblant à du code
            $isIndented = preg_match('/^\s{4,}/', $line); // 4+ espaces = code possible

            if (!$inCode && $isIndented) {
                // Accumuler pour vérifier si c'est vraiment du code
                $codeBuffer .= $line . "\n";
                // Regarder la ligne suivante pour décider
                $nextLine = $pageLines[$li + 1] ?? '';
                if (preg_match('/^\s{4,}/', $nextLine) || detectCodeBlock($codeBuffer)) {
                    $lang = detectLanguage($codeBuffer);
                    $md  .= "\n```{$lang}\n" . ltrim($codeBuffer);
                    $codeBuffer = '';
                    $inCode = true;
                    continue;
                } else {
                    // Pas du code, traiter comme texte normal
                    $md .= trim($codeBuffer) . "\n";
                    $codeBuffer = '';
                    continue;
                }
            }

            if ($inCode) {
                // Continuer le bloc de code si indentation ou ligne typique de code
                if ($isIndented || $line === '' || detectCodeBlock($line)) {
                    $md .= $line . "\n";
                    continue;
                } else {
                    // Fin du bloc de code
                    $md .= "```\n\n";
                    $inCode = false;
                    // NE PAS continuer, traiter la ligne courante
                }
            }

            // --- DETECTION TABLEAUX ---
            // Lignes avec colonnes espacées -> tentative de tableau Markdown
            if (preg_match('/^(\S[^\t\n]{10,})\s{4,}(\S.*)$/', $line, $m)) {
                // Simple: deux colonnes séparées par plusieurs espaces
                // Vérification: regarder les lignes suivantes pour voir si c'est un tableau
                $nextLine = trim($pageLines[$li + 1] ?? '');
                if (preg_match('/\s{4,}/', $nextLine)) {
                    // Ressemble à un tableau, on essaie de le structurer
                    // Collecte toutes les lignes du tableau potentiel
                    $tableLines = [$line];
                    $j = $li + 1;
                    while ($j < $lineCount && preg_match('/\s{3,}/', $pageLines[$j]) && trim($pageLines[$j]) !== '') {
                        $tableLines[] = $pageLines[$j];
                        $j++;
                    }
                    if (count($tableLines) >= 2) {
                        // Analyse des colonnes par positions
                        $md .= buildMarkdownTable($tableLines) . "\n";
                        $li = $j - 1; // Avancer l'index
                        continue;
                    }
                }
            }

            // --- TEXTE NORMAL ---
            $md .= $line . "\n";
        }

        // Séparateur de page (invisible mais aide à la lisibilité)
        // $md .= "\n";
    }

    // Fermer un bloc de code non fermé
    if ($inCode) $md .= "```\n";

    return $md;
}

function buildMarkdownTable(array $lines): string {
    // Analyse des positions de colonnes
    // Méthode: trouver les ranges d'espaces communs à toutes les lignes
    $cols = detectColumns($lines);

    if (count($cols) < 2) {
        // Pas un vrai tableau, retourner le texte brut
        return implode("\n", array_map('trim', $lines));
    }

    $table   = '';
    $headers = splitByColumns($lines[0], $cols);

    // En-tête
    $table .= '| ' . implode(' | ', array_map('trim', $headers)) . " |\n";
    // Séparateur
    $table .= '| ' . implode(' | ', array_fill(0, count($headers), '---')) . " |\n";
    // Données
    foreach (array_slice($lines, 1) as $line) {
        $cells  = splitByColumns($line, $cols);
        $table .= '| ' . implode(' | ', array_map('trim', $cells)) . " |\n";
    }

    return $table;
}

function detectColumns(array $lines): array {
    // Trouve les positions de début de colonnes (où commence un groupe non-espace
    // précédé par plusieurs espaces dans la majorité des lignes)
    $colStarts = [];
    foreach ($lines as $line) {
        preg_match_all('/(?<=\s{3})\S/', str_pad($line, 200), $m, PREG_OFFSET_CAPTURE);
        foreach ($m[0] as $match) {
            $pos = $match[1];
            $colStarts[$pos] = ($colStarts[$pos] ?? 0) + 1;
        }
    }
    // Garder les positions présentes dans au moins 50% des lignes
    $threshold = count($lines) * 0.4;
    $valid = array_keys(array_filter($colStarts, fn($c) => $c >= $threshold));
    sort($valid);

    return $valid;
}

function splitByColumns(string $line, array $colStarts): array {
    if (empty($colStarts)) return [trim($line)];

    $cells = [];
    $prev  = 0;
    foreach ($colStarts as $i => $start) {
        if ($i === 0) {
            $cells[] = trim(substr($line, 0, $start));
            $prev    = $start;
        } else {
            $cells[] = trim(substr($line, $prev, $start - $prev));
            $prev    = $start;
        }
    }
    $cells[] = trim(substr($line, $prev));

    return $cells;
}

// ============================================================
// GENERATION DES FICHIERS MARKDOWN
// ============================================================

echo "Génération des fichiers Markdown...\n\n";

$index = "# Programmation Assembleur x86 32 et 64 bits sous Linux Ubuntu\n\n";
$index .= "## Table des matières\n\n";

foreach ($chapters as $ch) {
    $num       = $ch['num'];
    $title     = $ch['title'] ?: "Chapitre {$num}";
    $startPage = $ch['start_page'];
    $endPage   = $ch['end_page'];
    $pageCount = $endPage - $startPage + 1;

    echo "  Traitement: Chapitre {$num} \"{$title}\" (pages PDF " . ($startPage + 1) . "-" . ($endPage + 1) . ", {$pageCount} pages)...\n";

    $md       = pagesToMarkdown($allPagesText, $startPage, $endPage, $num, $title);

    $filename = $num === 0
        ? '00_preface.md'
        : sprintf('chapitre_%02d.md', $num);

    file_put_contents("{$OUTPUT_DIR}/{$filename}", $md);
    echo "    -> {$filename} écrit.\n";

    // Entrée dans l'index
    if ($num === 0) {
        $index .= "- [{$title}]({$filename})\n";
    } else {
        $index .= "- [Chapitre {$num} : {$title}]({$filename})\n";
    }
}

// Écriture de l'index
file_put_contents("{$OUTPUT_DIR}/index.md", $index);
echo "\n✓ Index écrit: {$OUTPUT_DIR}/index.md\n";
echo "\n✓ Extraction terminée ! Fichiers dans: {$OUTPUT_DIR}\n";
