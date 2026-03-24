<?php
/**
 * Script d'extraction PDF -> Markdown par chapitre - v3
 * PDF: Programmation Assembleur x86 32 et 64 bits sous Linux Ubuntu
 * 
 * Usage: php extract_pdf_to_markdown.php [--config] [--dry-run]
 * 
 * Configuration via .env :
 *   PDF_PATH=chemin/vers/le.pdf
 *   OUTPUT_DIR=chemin/vers/sortie
 */

require_once __DIR__ . '/config.php';
require __DIR__ . '/../vendor/autoload.php';
use Smalot\PdfParser\Parser;

// ============================================================
// TRAITEMENT DES ARGUMENTS
// ============================================================
$dryRun = in_array('--dry-run', $argv);
if (in_array('--config', $argv)) {
    showConfig();
    exit(0);
}

// ============================================================
// CONFIG
// ============================================================
$PDF_FILE   = PDF_PATH;
$OUTPUT_DIR = OUTPUT_DIR;
if (!is_dir($OUTPUT_DIR)) mkdir($OUTPUT_DIR, 0777, true);

// ============================================================
// PARSING
// ============================================================
echo "Parsing du PDF...\n";
$parser = new Parser();
$pdf    = $parser->parseFile($PDF_FILE);
$pages  = $pdf->getPages();
$total  = count($pages);
echo "Pages: $total\n\n";

// ============================================================
// EXTRACTION DU TEXTE PAR PAGE
// ============================================================
$allPagesText = [];
for ($i = 0; $i < $total; $i++) {
    $allPagesText[$i] = $pages[$i]->getText();
    if (($i + 1) % 50 === 0) echo "  Lu " . ($i + 1) . "/$total pages...\n";
}
echo "Texte extrait.\n\n";

// ============================================================
// DETECTION DES CHAPITRES
// ============================================================
$chapters = [];
for ($i = 0; $i < $total; $i++) {
    $text  = $allPagesText[$i];
    $lines = array_values(array_filter(array_map('trim', explode("\n", $text)), 'strlen'));
    if (empty($lines)) continue;

    foreach (array_slice($lines, 0, 6) as $lineIdx => $line) {
        if (preg_match('/^(?:Chapitre|CHAPITRE)\s*(\d+)\s*$/i', $line, $m)) {
            $chapNum    = (int)$m[1];
            $titleParts = [];
            for ($ti = $lineIdx + 1; $ti <= $lineIdx + 2 && $ti < count($lines); $ti++) {
                $tl = trim($lines[$ti]);
                if ($tl === '' || preg_match('/^\d+\.\d/', $tl)) break;
                if (count($titleParts) >= 1) break;
                $titleParts[] = $tl;
            }
            $titleLine = implode(' ', $titleParts);
            $exists    = false;
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

usort($chapters, fn($a, $b) => $a['start_page'] - $b['start_page']);

echo "Chapitres détectés:\n";
foreach ($chapters as $ch) {
    echo "  Chap {$ch['num']}: \"{$ch['title']}\" (p." . ($ch['start_page'] + 1) . ")\n";
}
echo "\n";

// Plages de pages
$chapCount = count($chapters);
for ($c = 0; $c < $chapCount; $c++) {
    $chapters[$c]['end_page'] = ($c + 1 < $chapCount)
        ? $chapters[$c + 1]['start_page'] - 1
        : $total - 1;
}

// Section préface
if (!empty($chapters) && $chapters[0]['start_page'] > 0) {
    array_unshift($chapters, [
        'num'        => 0,
        'title'      => 'Préface et Table des Matières',
        'start_page' => 0,
        'end_page'   => $chapters[0]['start_page'] - 1,
    ]);
}

// ============================================================
// FONCTIONS UTILITAIRES
// ============================================================

function cleanLine(string $line): string {
    $line = preg_replace('/\x00+/', '', $line);
    $line = preg_replace('/[\x01-\x08\x0B\x0C\x0E-\x1F\x7F]/', '', $line);
    $line = preg_replace('/[ \t]+/', ' ', $line);
    return trim($line);
}

/**
 * Retourne true si la ligne est un en-tête ou pied-de-page de section
 * ex: "28 CHAPITRE 1. INFORMATIQUE..." ou "1.1. POURQUOI APPRENDRE L'ASSEMBLEUR 29"
 */
function isHeaderFooter(string $line): bool {
    // "N CHAPITRE X. TITRE..." (en-têtes de page de type livre)
    if (preg_match('/^\d+\s+(?:CHAPITRE|ANNEXE)\s+\d+\./i', $line)) return true;
    // "X.X. TITRE EN MAJUSCULES  N" (pied de page de section)
    if (preg_match('/^\d+\.\d+\.\s+[A-ZÀÉÈÊËÎÏÔÙÛÜ\s\'\-\/0-9,]+\s+\d{1,3}$/', $line)) return true;
    // "CHAPITRE X. TITRE EN MAJUSCULES  N"
    if (preg_match('/^(?:CHAPITRE|ANNEXE)\s+\d+\.\s+[A-ZÀÉÈÊËÎÏÔÙÛÜ\s]+\s+\d{1,3}$/i', $line)) return true;
    // Ligne avec uniquement "TITRE EN MAJ  34" (en-tête section comme "L'ASSEMBLEUR NASM 143")
    if (preg_match('/^[A-ZÀÉÈÊËÎÏÔÙÛÜ\s\'\-\/0-9]{10,}\s{2,}\d{1,3}$/', $line)) return true;
    return false;
}

/**
 * Retourne true si la ligne ressemble à une note de bas de page
 * ex: "1. Note de bas de page" ou "2. http://..."
 */
function isFootnote(string $line): bool {
    // Ligne commençant par "N. " ou "N.http" avec N petit
    if (preg_match('/^\d{1,2}\.\s*(http|[A-Z][a-z]|Fon|Acr|Res)/', $line)) return true;
    if (preg_match('/^\d{1,2}\.http/', $line)) return true;
    return false;
}

/**
 * Retourne true si c'est un numéro de page seul
 */
function isPageNumber(string $line): bool {
    return (bool)preg_match('/^\d{1,4}$/', $line);
}

/**
 * Détecte si le contenu ressemble à du code
 */
function detectCodeBlock(string $text): bool {
    $patterns = [
        '/^\s*(mov|push|pop|add|sub|mul|div|xor|and|or|not|cmp|jmp|je|jne|jl|jg|jle|jge|call|ret|nop|lea|int|syscall|section|global|extern|bits|db|dw|dd|dq|resb|resw|resd|resq|equ|SECTION|GLOBAL|EXTERN|imul|idiv|sar|shr|shl|ror|rol|neg|inc|dec|test|movzx|movsx)\b/im',
        '/^[\s\d]+\s*(;|\/\/|#)/',   // ligne numérotée avec commentaire
        '/^\s*;\s*[=\-*]{3,}/',      // commentaire asm séparateur
        '/^(#include|#define|typedef|struct|int\s+main|void\s+\w+|extern\s+"C")/m',
        '/\b(eax|ebx|ecx|edx|esi|edi|esp|ebp|rax|rbx|rcx|rdx|rsi|rdi|rsp|rbp|r8|r9|r10|r11|r12|r13|r14|r15|xmm\d|ymm\d)\b/i',
        '/^(global|section|extern|bits)\s+\w/im',
    ];
    $hits = 0;
    foreach ($patterns as $p) {
        if (preg_match($p, $text)) $hits++;
        if ($hits >= 2) return true;
    }
    return false;
}

function detectLanguage(string $text): string {
    if (preg_match('/^\s*#include\s*</m', $text)) return 'c';
    if (preg_match('/\bint\s+main\s*\(/i', $text)) return 'c';
    if (preg_match('/\bdef\s+\w+\s*\(|import\s+\w+|print\s*\(/i', $text)) return 'python';
    if (preg_match('/\b(section\s+\.|global\s+\w|extern\s+\w|mov|push|pop|xor|cmp|jmp)\b/i', $text)) return 'nasm';
    if (preg_match('/^\$\s|\bgcc\b|\bmake\b|\bld\b|\bnasm\b/m', $text)) return 'bash';
    if (preg_match('/\bg\+\+\b|\bgcc\b|\bnasm\b|\bobjdump\b/', $text)) return 'bash';
    return 'text';
}

// ============================================================
// CONVERSION PAGES -> MARKDOWN
// ============================================================

function pagesToMarkdown(array $allPagesText, int $startPage, int $endPage, int $chapNum, string $chapTitle): string {
    // --- En-tête chapitre ---
    $md = ($chapNum === 0)
        ? "# {$chapTitle}\n\n"
        : "# Chapitre {$chapNum} : {$chapTitle}\n\n";

    $inCode        = false;
    $codeLang      = 'text';
    $codeLines     = [];
    $inList        = false;
    $listBuffer    = '';   // pour les items de liste sur plusieurs lignes
    $prevBlank     = false;
    $skipEpigraph  = ($chapNum > 0); // skip les lignes d'épigraphe en début de chapitre
    $epigraphDone  = false;

    // Collecte toutes les lignes de toutes les pages du chapitre
    $allLines = [];
    for ($p = $startPage; $p <= $endPage; $p++) {
        $rawLines = explode("\n", $allPagesText[$p]);
        foreach ($rawLines as $raw) {
            $allLines[] = cleanLine($raw);
        }
    }

    $count = count($allLines);
    $i     = 0;

    while ($i < $count) {
        $line = $allLines[$i];

        // ---- LIGNES VIDES ----
        if ($line === '') {
            if ($inCode) {
                $codeLines[] = '';
            } else {
                if ($inList && $listBuffer !== '') {
                    $md .= "- " . trim($listBuffer) . "\n";
                    $listBuffer = '';
                    $inList     = false;
                }
                if (!$prevBlank) {
                    $md .= "\n";
                    $prevBlank = true;
                }
            }
            $i++;
            continue;
        }
        $prevBlank = false;

        // ---- FILTRES GLOBAUX ----

        // Numéro de page seul
        if (isPageNumber($line)) { $i++; continue; }

        // En-tête / pied de page de section
        if (isHeaderFooter($line)) { $i++; continue; }

        // Titre chapitre (déjà traité)
        if (preg_match('/^(?:Chapitre|CHAPITRE)\s*\d+\s*$/i', $line)) { $i++; continue; }

        // Note de bas de page
        if (isFootnote($line)) { $i++; continue; }

        // ---- EPIGRAPHE en début de chapitre ----
        // On skip les premières lignes qui ressemblent à une citation (avant la section 1.1)
        if ($skipEpigraph && !$epigraphDone && $chapNum > 0) {
            // L'épigraphe se termine quand on trouve la première section numérotée
            if (preg_match('/^\d+\.\d/', $line) || preg_match('/^#{2,}/', $line)) {
                $epigraphDone = true;
                $skipEpigraph = false;
            } else {
                // Ignorer les lignes d'épigraphe (titre répété, citation, etc.)
                $i++;
                continue;
            }
        }

        // ---- EN BLOC DE CODE ----
        if ($inCode) {
            // Fin du bloc de code: ligne non indentée qui n'a pas l'air de code
            $isIndented  = preg_match('/^ {2,}/', $line) || preg_match('/^\t/', $line);
            $isLineNum   = preg_match('/^\d{1,2}[^\d]/', $line); // ligne numérotée
            $isCodeLike  = detectCodeBlock($line) || $isIndented || $isLineNum;

            // Ligne "Listing X.X.X — Description" = fin du bloc de code
            if (preg_match('/^Listing\s+[\d.]+\s*[–—-]\s*/i', $line)) {
                // Vider le buffer code
                $code = implode("\n", $codeLines);
                // Nettoyer les lignes vides au début et fin
                $code = trim($code);
                if ($code !== '') {
                    $md .= "\n```{$codeLang}\n{$code}\n```\n";
                }
                $md .= "\n> *" . trim($line) . "*\n\n";
                $codeLines = [];
                $inCode    = false;
                $i++;
                continue;
            }

            if ($isCodeLike) {
                // Enlever les numéros de ligne en début: "14main:" => "main:"
                $cleaned = preg_replace('/^\d{1,3}\s+/', '', $line);
                $codeLines[] = $cleaned;
            } else {
                // Fermer le bloc de code
                $code = implode("\n", $codeLines);
                $code = trim($code);
                if ($code !== '') {
                    $md .= "\n```{$codeLang}\n{$code}\n```\n\n";
                }
                $codeLines = [];
                $inCode    = false;
                // NE PAS incrémenter $i, retraiter cette ligne
                continue;
            }
            $i++;
            continue;
        }

        // ---- SI ON A UN ITEM DE LISTE EN COURS ----
        if ($inList) {
            // Continuer l'item si la ligne n'est pas un nouveau marqueur ou section
            $isNewItem    = preg_match('/^[•\-–]\s/', $line) || preg_match('/^[•–]$/', $line);
            $isNewSection = preg_match('/^\d+\.\d/', $line);
            if (!$isNewItem && !$isNewSection && !isPageNumber($line)) {
                $listBuffer .= ' ' . $line;
                $i++;
                continue;
            } else {
                // Terminer l'item précédent
                $md .= "- " . trim($listBuffer) . "\n";
                $listBuffer = '';
                $inList     = false;
                // Retraiter la ligne courante
                continue;
            }
        }

        // ---- TITRES DE SECTIONS ----

        // Pattern "X.Y.Z.W Titre" (sous-sous-sous-section)
        if (preg_match('/^(\d+\.\d+\.\d+\.\d+)\s+(.{1,80})$/', $line, $m)) {
            $title = trim($m[2]);
            // Le titre ne doit pas ressembler au début d'un paragraphe
            if (!preg_match('/[.!?]$/', $title) || strlen($title) < 60) {
                $md .= "\n##### {$m[1]} {$title}\n\n";
                $i++;
                continue;
            }
        }

        // Pattern "X.Y.Z Titre" (sous-section)
        if (preg_match('/^(\d+\.\d+\.\d+)\s+(.{1,80})$/', $line, $m)) {
            $title = trim($m[2]);
            if (!preg_match('/[.!?]$/', $title) || strlen($title) < 60) {
                $md .= "\n### {$m[1]} {$title}\n\n";
                $i++;
                continue;
            }
        }

        // Pattern "X.Y Titre" (section principale) — titre sur même ligne
        if (preg_match('/^(\d+\.\d+)\s+(.{1,80})$/', $line, $m)) {
            $title = trim($m[2]);
            // Heuristique: si le titre se termine par un tiret, c'est coupé (paragraphe)
            // on skip le formatage H2 et traite comme texte normal
            if (substr($title, -1) !== '-' && !preg_match('/[.!?,;]$/', $title)) {
                $md .= "\n## {$m[1]} {$title}\n\n";
                $i++;
                continue;
            }
            // Titre coupé: le titre continue sur la ligne suivante
            // On cherche à reconstruire le titre sur au max 2 lignes
            $nextLine = isset($allLines[$i + 1]) ? trim($allLines[$i + 1]) : '';
            $fullTitle = extract_pdf_to_markdown . phprtrim($title, '-') . $nextLine;
            if (strlen($fullTitle) <= 120 && !preg_match('/^\d+\./', $nextLine)) {
                $md .= "\n## {$m[1]} {$fullTitle}\n\n";
                $i += 2;
                continue;
            }
        }

        // Pattern "X.Y" seul sur la ligne -> titre sur la ligne suivante
        if (preg_match('/^(\d+\.\d+(?:\.\d+)*)\s*$/', $line, $m)) {
            $nextLine = isset($allLines[$i + 1]) ? cleanLine($allLines[$i + 1]) : '';
            if ($nextLine !== '' && strlen($nextLine) < 100
                && !preg_match('/^\d+\./', $nextLine)
                && !preg_match('/[.!?]$/', $nextLine)) {
                $dots   = substr_count($m[1], '.');
                $hashes = str_repeat('#', min($dots + 1, 4));
                $md .= "\n{$hashes} {$m[1]} {$nextLine}\n\n";
                $i += 2;
                continue;
            }
        }

        // ---- BLOCS SPECIAUX (Définition, Note, etc.) ----
        if (preg_match('/^(D[ée]finition|Note|Remarque|Attention|Exemple|Info|Important|Warning|Convention)\s*[:：\.]/i', $line, $m)) {
            $keyword = ucfirst(mb_strtolower($m[1]));
            $rest    = trim(substr($line, strlen($m[0])));
            $md .= "\n> **{$keyword}**";
            if ($rest !== '') $md .= " : {$rest}";
            $md .= "\n>\n";
            $i++;
            continue;
        }

        // ---- LISTES A PUCES ----

        // Marqueur "•" seul sur sa ligne : le contenu suit sur la prochaine ligne
        if (preg_match('/^[•–]$/', $line)) {
            $i++;
            if ($i < $count) {
                $listBuffer = $allLines[$i];
                $inList     = true;
            }
            $i++;
            continue;
        }

        // Marqueur "• contenu" ou "- contenu" ou "– contenu"
        if (preg_match('/^[•\-–]\s+(.+)$/', $line, $m)) {
            $listBuffer = $m[1];
            $inList     = true;
            $i++;
            continue;
        }

        // ---- DETECTION DEBUT DE CODE ----
        // Ligne numérotée ressemblant à du code: "1int main()" "14main:"
        $isNumberedCode = preg_match('/^(\d{1,3})\s+(#include|#define|int|void|bool|char|float|double|long|unsigned|extern|struct|typedef|global|section|extern|mov|push|pop|for|if|while|return|printf|scanf|[a-z_]\w+:|\s*;|\s*\/\/|\s*\/\*)/i', $line, $nm);
        // Ligne qui commence par une instruction asm reconnue
        $isAsmLine = preg_match('/^\s*(mov|push|pop|add|sub|cmp|jmp|je|jne|jl|jg|call|ret|xor|and|or|lea|int|syscall|section|global|extern|db|dw|dd|imul|idiv|sar|shr)\s/i', $line);

        if ($isNumberedCode || $isAsmLine) {
            // Vérifier s'il y a d'autres lignes de code après
            $lookahead = implode("\n", array_slice($allLines, $i, min(5, $count - $i)));
            if (detectCodeBlock($lookahead) || $isNumberedCode) {
                $inCode   = true;
                $codeLang = detectLanguage($lookahead);
                // Enlever le numéro de ligne
                $cleaned  = $isNumberedCode ? preg_replace('/^\d{1,3}\s+/', '', $line) : $line;
                $codeLines[] = $cleaned;
                $i++;
                continue;
            }
        }

        // ---- TEXTE NORMAL ----
        // Nettoyer les en-têtes de page qui auraient passé entre les mailles
        // Pattern: "4.2. LES ÉDITEURS 141" (section en majuscules + numéro de page)
        if (preg_match('/^\d+\.\d+\.\s+[A-ZÀÉÈÊËÎÏÔÙÛÜ\'\s\/\-]+\s+\d+$/', $line)) { $i++; continue; }
        // Pattern: "4.3. L'ASSEMBLEUR NASM 143"
        if (preg_match('/^\d+\.\d+\.\s+L[\'E][A-ZÀÉÈÊËÎÏÔÙÛÜ\'\s\/\-]+\s+\d+$/u', $line)) { $i++; continue; }
        // "EDITION DE LIEN AVEC GCC/G++ 145"
        if (preg_match('/^[A-ZÀÉÈÊËÎÏÔÙÛÜ]{4,}[A-ZÀÉÈÊËÎÏÔÙÛÜ\s\/\'\+\-,]{3,}\s+\d{2,3}$/', $line)) { $i++; continue; }

        $md .= $line . "\n";
        $i++;
    }

    // Fermer les blocs ouverts
    if ($inList && $listBuffer !== '') {
        $md .= "- " . trim($listBuffer) . "\n";
    }
    if ($inCode && !empty($codeLines)) {
        $code = trim(implode("\n", $codeLines));
        if ($code !== '') $md .= "\n```{$codeLang}\n{$code}\n```\n";
    }

    // Post-traitement: nettoyer les blancs excessifs
    $md = preg_replace('/\n{3,}/', "\n\n", $md);

    return $md;
}

// ============================================================
// GENERATION DES FICHIERS MARKDOWN
// ============================================================

echo "Génération des fichiers Markdown...\n\n";

$index  = "# Programmation Assembleur x86 32 et 64 bits sous Linux Ubuntu\n\n## Table des matières\n\n";

foreach ($chapters as $ch) {
    $num       = $ch['num'];
    $title     = $ch['title'] ?: "Chapitre {$num}";
    $startPage = $ch['start_page'];
    $endPage   = $ch['end_page'];

    echo "  Chap {$num} \"{$title}\" (p." . ($startPage + 1) . "-" . ($endPage + 1) . ")...\n";

    $md       = pagesToMarkdown($allPagesText, $startPage, $endPage, $num, $title);
    $filename = $num === 0 ? '00_preface.md' : sprintf('chapitre_%02d.md', $num);

    file_put_contents("{$OUTPUT_DIR}/{$filename}", $md);
    echo "    -> {$filename}\n";

    $index .= $num === 0
        ? "- [{$title}]({$filename})\n"
        : "- [Chapitre {$num} : {$title}]({$filename})\n";
}

file_put_contents("{$OUTPUT_DIR}/index.md", $index);
echo "\n✓ Terminé ! Fichiers dans: {$OUTPUT_DIR}\n";
