<?php
/**
 * build.php — Convertit les fichiers Markdown en HTML
 * Utilise Parsedown pour le parsing Markdown, puis applique le layout.
 * Version améliorée: génère du HTML propre sans numérotation automatique
 * ni commentaires parasites. Injecte des graphiques Highcharts sous les
 * tableaux de résultats de performance détectés (TABLE N.X).
 */

require __DIR__ . '/libraries/Parsedown.php';
require dirname(__DIR__) . '/php-geshi/geshi.php';
require dirname(__DIR__) . '/ez_web.php';

$Parsedown = new Parsedown();
$Parsedown->setSafeMode(false);

// ──────────────────────────────────────────────────────────────────────────
// Correspondance TABLE[chap].[num] → catégorie d'architecture
// ──────────────────────────────────────────────────────────────────────────
// Chaque entrée : numéro du sous-tableau → nom du sous-dossier dans data/
define('TABLE_CATEGORY_MAP', [
    // Chapitre 11 – Produit de matrices
    11 => [ 4 => 'ancien', 5 => 'moderne', 6 => 'recent' ],
    // Chapitre 12 – POPCNT
    12 => [ 2 => 'ancien', 3 => 'moderne', 4 => 'recent' ],
    // Chapitre 13 – SAXPY
    13 => [ 3 => 'ancien', 4 => 'moderne', 5 => 'recent' ],
    // Chapitre 14 – Fitch
    14 => [ 3 => 'ancien', 4 => 'moderne', 5 => 'recent' ],
    // Chapitre 15 – Voyelles
    15 => [ 4 => 'ancien', 5 => 'moderne', 7 => 'recent' ],
    // Chapitre 16 – Fibonacci
    16 => [ 5 => 'moderne', 6 => 'recent' ],
]);

/**
 * Injecte un graphique Highcharts après chaque tableau de performance.
 *
 * Détecte dans $htmlContent les paragraphes de légende du type
 * «TABLE15.4 – …» et insère juste après le tableau HTML précédent
 * un bloc <div id="chart-chap15-ancien"> + <script type="module"> qui
 * charge data/chapitre_15/ancien/data.json et appelle createPerformanceChart.
 *
 * @param string $htmlContent  HTML généré par Parsedown
 * @param int    $chapNum      Numéro de chapitre (11, 12, …)
 * @return string HTML enrichi avec les blocs graphiques
 */
function injectChartAfterTable(string $htmlContent, int $chapNum): string
{
    $map = constant('TABLE_CATEGORY_MAP')[$chapNum] ?? [];
    if (empty($map)) {
        return $htmlContent; // Pas de graphiques pour ce chapitre
    }

    // Chemin relatif depuis public/ vers data/
    // Les pages HTML sont dans public/, les données dans ../../data/
    $dataBasePath = "../../data/chapitre_{$chapNum}";
    $graphJsPath  = '../../data/graph.js';

    // Compteur global pour créer des IDs uniques par page
    static $chartCounter = 0;

    // Chercher TABLE[chapNum].[tableNum] n'importe où dans le HTML
    // La légende peut être dans un <p> long ou à la fin d'un <p>/<li>/<ol>
    // On cherche le pattern et on injecte le chart après la balise fermante suivante
    foreach ($map as $tableNum => $category) {

        // Matche TABLE N.M (avec ou sans espace avant le tiret/dash)
        // suivi de TOUT jusqu'à la prochaine balise fermante </p> </ol> </li>
        // Le flag 's' (DOTALL) permet de matcher les sauts de ligne
        $pattern = sprintf(
            '/(TABLE%d\.%d\s*[–—\-][^<]*?)(<\/(?:p|ol|li|ul)>)/us',
            $chapNum,
            $tableNum
        );

        $htmlContent = preg_replace_callback(
            $pattern,
            function ($m) use ($chapNum, $category, $tableNum, $dataBasePath, $graphJsPath, &$chartCounter) {
                $chartCounter++;
                $chartId  = "chart-ch{$chapNum}-{$category}-{$chartCounter}";
                $dataPath = "{$dataBasePath}/{$category}/data.json";
                
                // On lit le fichier JSON côté serveur et on l'inclut directement 
                // pour éviter le fetch asynchrone et les problèmes de CORS CORS en local.
                $absDataPath = dirname(__DIR__) . "/data/chapitre_{$chapNum}/{$category}/data.json";
                $jsonData = '{}';
                if (file_exists($absDataPath)) {
                    $jsonData = file_get_contents($absDataPath);
                }

                $legendText = $m[1];   // texte de la légende
                $closingTag = $m[2];   // </p> ou </ol> etc.

                $chartHtml = <<<HTML
{$legendText}{$closingTag}
<div class="chart-container" id="{$chartId}" style="width:100%;height:420px;margin:1.5rem 0 2.5rem;"></div>
<script>
  (function(){
    var id = '{$chartId}';
    var data = {$jsonData};
    function drawChart(){
      if (typeof window.createPerformanceChart === 'function') {
        window.createPerformanceChart(id, data);
      } else {
        console.error("createPerformanceChart est introuvable");
      }
    }
    if(document.readyState === 'loading'){ document.addEventListener('DOMContentLoaded', drawChart); }
    else { drawChart(); }
  })();
</script>
HTML;
                return $chartHtml;
            },
            $htmlContent
        );
    }

    return $htmlContent;
}

$sourceDir  = __DIR__ . '/pages-md';
$outputDir  = __DIR__ . '/public';
$template   = __DIR__ . '/templates/layout.php';

if (!is_dir($outputDir)) mkdir($outputDir, 0777, true);

$pages = [];

foreach (glob("$sourceDir/*.md") as $mdFile) {

    $markdown = file_get_contents($mdFile);

    // ---- Nettoyage du Markdown avant parsing ----

    // 1. Supprimer les lignes "# Chapitre N : Titre" répétées dans le corps
    //    (le H1 reste en haut mais on supprime les occurrences supplémentaires)

    // 2. Convertir les blocs > **Keyword** : ... en div stylisés
    $markdown = preg_replace_callback(
        '/^>\s*\*\*(Définition|Note|Remarque|Attention|Exemple|Info|Important|Warning|Convention)\*\*\s*(?::?\s*(.*))?$/m',
        function($m) {
            $kw   = $m[1];
            $rest = isset($m[2]) ? trim($m[2]) : '';
            $class = match(strtolower($kw)) {
                'définition', 'definition' => 'definition',
                'note', 'info'             => 'note',
                'attention', 'warning'     => 'warning',
                'remarque'                 => 'remark',
                'exemple'                  => 'example',
                'important'                => 'important',
                'convention'               => 'convention',
                default                    => 'note',
            };
            $content = $rest !== '' ? "<strong>{$kw}</strong> : {$rest}" : "<strong>{$kw}</strong>";
            return "<div class=\"cadre_{$class}\">{$content}";
        },
        $markdown
    );
    // Fermer les blocs > qui continuent
    $markdown = preg_replace('/^>\s*$/m', '</div>', $markdown);
    $markdown = preg_replace('/^> (.+)$/m', '$1', $markdown);

    // 3. Convertir les citations en italique des Listings
    $markdown = preg_replace(
        '/^> \*(Listing [\d.]+ [–—-] .+)\*$/m',
        "\n*$1*\n",
        $markdown
    );

    // ---- Parsing Markdown -> HTML ----
    $htmlContent = $Parsedown->text($markdown);

    // ---- Post-traitement du HTML ----

    // Titre automatique depuis le premier H1
    preg_match('/<h1>(.*?)<\/h1>/s', $htmlContent, $matches);
    $title = strip_tags($matches[1] ?? ucfirst(basename($mdFile, '.md')));

    // 1. H1 -> balise chapter propre (sans numérotation auto)
    $htmlContent = preg_replace_callback('/<h1>(.*?)<\/h1>/s', function($m) {
        $t = $m[1];
        return "<h1 class=\"chapter\">{$t}</h1>\n";
    }, $htmlContent);

    // 2. H2 -> section (sans numérotation automatique de ez_web)
    $htmlContent = preg_replace_callback('/<h2>(.*?)<\/h2>/s', function($m) {
        $t = $m[1];
        return "<h2 class=\"section\">{$t}</h2>\n";
    }, $htmlContent);

    // 3. H3 -> subsection
    $htmlContent = preg_replace_callback('/<h3>(.*?)<\/h3>/s', function($m) {
        $t = $m[1];
        return "<h3 class=\"subsection\">{$t}</h3>\n";
    }, $htmlContent);

    // 4. H4 -> subsubsection
    $htmlContent = preg_replace_callback('/<h4>(.*?)<\/h4>/s', function($m) {
        $t = $m[1];
        return "<h4 class=\"subsubsection\">{$t}</h4>\n";
    }, $htmlContent);

    // 5. H5 -> sous-sous-sous-section
    $htmlContent = preg_replace_callback('/<h5>(.*?)<\/h5>/s', function($m) {
        $t = $m[1];
        return "<h5>{$t}</h5>\n";
    }, $htmlContent);

    // 6. Blocs de code -> coloration syntaxique GeSHi inline
    $htmlContent = preg_replace_callback(
        '/<pre><code class="language-(.*?)">(.*?)<\/code><\/pre>/s',
        function($m) {
            $lang     = trim($m[1]);
            $code     = html_entity_decode($m[2], ENT_QUOTES | ENT_HTML5, 'UTF-8');
            // Mapper les noms de languge Markdown -> GeSHi
            $langMap  = [
                'nasm'   => 'asm',
                'bash'   => 'bash',
                'c'      => 'c',
                'cpp'    => 'cpp',
                'python' => 'python',
                'text'   => 'text',
            ];
            $geshiLang = $langMap[$lang] ?? 'text';

            if ($geshiLang === 'text') {
                // Pas de coloration pour text, juste une <pre> propre
                $escaped = htmlspecialchars($code, ENT_QUOTES, 'UTF-8');
                return "<pre class=\"code-block\"><code>{$escaped}</code></pre>\n";
            }

            try {
                $geshi = new GeSHi($code, $geshiLang);
                $geshi->enable_line_numbers(GESHI_NORMAL_LINE_NUMBERS);
                $geshi->set_header_type(GESHI_HEADER_DIV);
                $geshi->set_tab_width(4);
                return "\n<div class=\"code-container\">\n" . $geshi->parse_code() . "\n</div>\n";
            } catch (Exception $e) {
                $escaped = htmlspecialchars($code, ENT_QUOTES, 'UTF-8');
                return "<pre class=\"code-block\"><code>{$escaped}</code></pre>\n";
            }
        },
        $htmlContent
    );

    // Blocs de code sans classe (``` sans langage)
    $htmlContent = preg_replace_callback(
        '/<pre><code>(.*?)<\/code><\/pre>/s',
        function($m) {
            $code    = html_entity_decode($m[1], ENT_QUOTES | ENT_HTML5, 'UTF-8');
            $escaped = htmlspecialchars($code, ENT_QUOTES, 'UTF-8');
            return "<pre class=\"code-block\"><code>{$escaped}</code></pre>\n";
        },
        $htmlContent
    );

    // 7. Tableaux: ajouter classe
    $htmlContent = str_replace('<table>', '<table class="data-table">', $htmlContent);

    // 8. Nettoyer les lignes parasites qui contiennent encore des en-têtes de page
    //    (ex: "4.3. L'ASSEMBLEUR NASM 143" qui a passé le filtre du script d'extraction)
    $htmlContent = preg_replace(
        '/<p>\d+\.\d+\.\s+[A-ZÀÉÈÊËÎÏÔÙÛÜ][A-ZÀÉÈÊËÎÏÔÙÛÜ\s\'\-\/0-9,]+\s+\d{2,3}<\/p>\n?/u',
        '',
        $htmlContent
    );
    // Supprimer les <p> contenant uniquement un numéro de page
    $htmlContent = preg_replace('/<p>\s*\d{1,4}\s*<\/p>\n?/', '', $htmlContent);

    // 9. Détecter le numéro de chapitre depuis le nom du fichier Markdown
    //    et injecter les graphiques Highcharts après les tableaux de performance
    if (preg_match('/chapitre_(\d+)/i', basename($mdFile, '.md'), $chapMatch)) {
        $chapNum     = (int) $chapMatch[1];
        $htmlContent = injectChartAfterTable($htmlContent, $chapNum);
        // Injecter Highcharts + graph.js une seule fois si des graphiques ont été injectés
        if (preg_match('/chart-ch\d+/', $htmlContent)) {
            $scripts = '<script src="../../javascript/Highcharts-3.0.10/js/highcharts.js"></script>' . "\n"
                     . '<script src="../../data/graph.js"></script>' . "\n";
            // Placer les scripts avant le premier div.chart-container
            $htmlContent = preg_replace(
                '/(<div class="chart-container")/',
                $scripts . '$1',
                $htmlContent,
                1
            );
        }
    }

    // ---- Rendu avec le layout ----
    ob_start();
    $content = $htmlContent;
    include $template;
    $finalHtml = ob_get_clean();

    $filename   = basename($mdFile, '.md');
    $outputFile = "$outputDir/$filename.html";
    file_put_contents($outputFile, $finalHtml);

    echo "Généré : $outputFile\n";

    $pages[] = [
        'title' => $title,
        'file'  => $filename . '.html'
    ];
}

// ---- Génération de l'index ----
ob_start();
echo "<h1 class=\"chapter\">Programmation Assembleur x86 — Index</h1>\n";
echo "<ul class=\"chapter-list\">\n";
foreach ($pages as $page) {
    if (basename($page['file']) === 'index.html') continue;
    echo "  <li><a href=\"{$page['file']}\">{$page['title']}</a></li>\n";
}
echo "</ul>\n";
$indexContent = ob_get_clean();

ob_start();
$content = $indexContent;
include $template;
$finalIndexHtml = ob_get_clean();

file_put_contents("$outputDir/index.html", $finalIndexHtml);
echo "✔ Index généré : $outputDir/index.html\n";
?>
