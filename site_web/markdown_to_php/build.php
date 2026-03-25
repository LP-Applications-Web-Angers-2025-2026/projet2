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

/**
 * Protège les expressions mathématiques ($...$ et $$...$$) du parser Markdown.
 * Parsedown interprète sinon les '_' comme de l'emphase et corrompt les formules.
 */
function protectMathExpressions($markdown, &$mathPlaceholders) {
    $idx = 0;
    $mathPlaceholders = [];

    $markdown = preg_replace_callback('/\$\$(.+?)\$\$/s', function($m) use (&$mathPlaceholders, &$idx) {
        $token = "@@MATH_BLOCK_{$idx}@@";
        $mathPlaceholders[$token] = $m[0];
        $idx++;
        return $token;
    }, $markdown);

    $markdown = preg_replace_callback('/(?<!\$)\$(?!\$)(.+?)(?<!\$)\$(?!\$)/s', function($m) use (&$mathPlaceholders, &$idx) {
        $token = "@@MATH_INLINE_{$idx}@@";
        $mathPlaceholders[$token] = $m[0];
        $idx++;
        return $token;
    }, $markdown);

    return $markdown;
}

// ──────────────────────────────────────────────────────────────────────────
// Benchmark System Helpers
// ──────────────────────────────────────────────────────────────────────────

/**
 * Récupère les données d'un benchmark depuis SQLite
 */
function getBenchmarkDataFromSqlite($benchName, $arch) {
    $dbPath = dirname(__DIR__) . '/data/benchmarks.db';
    if (!file_exists($dbPath)) return null;

    try {
        $db = new PDO("sqlite:$dbPath");
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $yearCondition = "1=1";
        if ($arch === 'ancien') {
            $yearCondition = "(annee < 2015)";
        } elseif ($arch === 'moderne') {
            $yearCondition = "(annee >= 2015 AND annee < 2020)";
        } elseif ($arch === 'recent') {
            $yearCondition = "(annee >= 2020)";
        }

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

        if (empty($results)) return null;

        $cpus = [];
        $years = [];
        foreach ($results as $row) {
            if (!in_array($row['nom_cpu'], $cpus)) {
                $cpus[] = $row['nom_cpu'];
                $years[] = (int)$row['annee'];
            }
        }

        $methodsMap = [];
        foreach ($results as $row) {
            $methodName = $row['nom_test'];
            $cpuIndex = array_search($row['nom_cpu'], $cpus);
            if (!isset($methodsMap[$methodName])) {
                $methodsMap[$methodName] = array_fill(0, count($cpus), null);
            }
            $value = $row['valeur_resultat'];
            $methodsMap[$methodName][$cpuIndex] = ($value === null) ? null : round((float)$value, 3);
        }

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
            'bsr_builtin_clz'       => 'C builtin __builtin_clz',
            'bsr_inline'            => 'C bsr inline',
            'asm_bsr'               => 'ASM bsr',
            'asm_lzcnt'             => 'ASM lzcnt',
            'asm_avx512_vplzcntd'   => 'ASM AVX512 vplzcntd',
        ];

        $methodsArray = [];
        foreach ($methodsMap as $name => $values) {
            if ($name !== null && $name !== "") {
                $displayName = $testNameMap[$name] ?? $name;
                $methodsArray[] = ["name" => $displayName, "values" => $values];
            }
        }

        $displayCPUs = array_map(function($cpu) {
            $cpu = str_replace(['-Processor', '-with-Radeon-Graphics', '-with-Radeon-Vega-Graphics'], '', $cpu);
            $cpu = str_replace('-', ' ', $cpu);
            $cpu = str_replace('_', '.', $cpu);
            return $cpu;
        }, $cpus);

        return [
            "CPUs" => $displayCPUs,
            "Years" => $years,
            "Methods" => $methodsArray
        ];
    } catch (Exception $e) {
        return null;
    }
}

/**
 * Génère le composant complet (Tableau + Graphique) pour un benchmark
 */
function generateBenchmarkComponent($benchName) {
    $architectures = ['ancien', 'moderne', 'recent'];
    if ($benchName === 'asm_bsr_lzcnt') {
        $architectures = ['all'];
    }
    $html = "";
    
    // Compteur global pour les graphiques
    static $compCounter = 0;

    foreach ($architectures as $arch) {
        $data = getBenchmarkDataFromSqlite($benchName, $arch);
        if (!$data) continue;

        $compCounter++;
        $chartId = "chart-auto-{$benchName}-{$arch}-{$compCounter}";
        $archLabel = ($arch === 'all') ? 'Global' : ucfirst($arch);
        $legend = "TABLE " . $archLabel . " – Benchmark " . str_replace('_', ' ', $benchName);

        // 1. Génération du Tableau
        $html .= "<div class=\"center\">\n<table class=\"data-table\">\n";
        $html .= "  <thead>\n    <tr>\n      <th>Méthode</th>\n";
        foreach ($data['CPUs'] as $idx => $cpu) {
            $year = isset($data['Years'][$idx]) ? "<br><small>{$data['Years'][$idx]}</small>" : "";
            $html .= "      <th>{$cpu}{$year}</th>\n";
        }
        $html .= "    </tr>\n  </thead>\n  <tbody>\n";

        foreach ($data['Methods'] as $m) {
            $html .= "    <tr>\n      <td><strong>{$m['name']}</strong></td>\n";
            foreach ($m['values'] as $val) {
                $display = ($val === null) ? "-" : number_format((float)$val, 3, '.', '');
                $html .= "      <td>{$display}</td>\n";
            }
            $html .= "    </tr>\n";
        }
        $html .= "  </tbody>\n";
        $html .= "  <caption>{$legend}</caption>\n";
        $html .= "</table>\n</div>\n";

        // 2. Génération du Graphique Highcharts
        $jsonData = json_encode($data);
        $html .= <<<HTML
<div class="chart-container" id="{$chartId}" style="width:100%;height:420px;margin:1.5rem 0 2.5rem;"></div>
<script>
  (function(){
    var id = '{$chartId}';
    var data = {$jsonData};
    function draw() {
        if (typeof window.createPerformanceChart !== 'function') {
            console.error("createPerformanceChart est introuvable");
            return;
        }
        window.createPerformanceChart(id, data);
    }
    if(document.readyState === 'loading'){ document.addEventListener('DOMContentLoaded', draw); }
    else { draw(); }
  })();
</script>
HTML;
    }

    return $html;
}


$sourceDir  = dirname(__DIR__) . '/pages-md';
$outputDir  = dirname(__DIR__);
$template   = __DIR__ . '/templates/layout.php';

if (!is_dir($outputDir)) mkdir($outputDir, 0777, true);

$pages = [];

foreach (glob("$sourceDir/*.md") as $mdFile) {

    $filename = basename($mdFile, '.md');
    // Extraction du numéro de chapitre
    $chapNum = 0;
    if (preg_match('/chapitre_(\d+)/i', $filename, $chapMatch)) {
        $chapNum = (int) $chapMatch[1];
    }
    
    // Initialisation du dossier de sortie pour les codes (ex: site_web/code/chapitre_15)
    $codeCounter = 0;
    $chapterCodeDir = dirname(__DIR__) . '/code' . ($chapNum > 0 ? "/chapitre_{$chapNum}" : "/commun");
    if (!is_dir($chapterCodeDir)) mkdir($chapterCodeDir, 0777, true);

    $markdown = file_get_contents($mdFile);

    // ---- Parsing du balisage [BENCHMARK:name] ----
    $markdown = preg_replace_callback('/\[BENCHMARK:(.*?)\]/i', function($m) {
        return "\n\n" . generateBenchmarkComponent(trim($m[1])) . "\n\n";
    }, $markdown);

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

    // Protéger les formules mathématiques avant le parsing Markdown
    $mathPlaceholders = [];
    $markdown = protectMathExpressions($markdown, $mathPlaceholders);

    // ---- Parsing Markdown -> HTML ----
    $htmlContent = $Parsedown->text($markdown);

    // Restaurer les expressions mathématiques dans le HTML généré
    if (!empty($mathPlaceholders)) {
        $htmlContent = strtr($htmlContent, $mathPlaceholders);
    }

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

    // Fonction Helpers pour détecter le langage du code au vu de son contenu
    $detectCodeLanguage = function($code, $defaultLang = 'text') {
        if ($defaultLang !== 'text' && $defaultLang !== '') return $defaultLang;
        
        $c_keywords   = ['#include', 'void ', 'int ', 'for(', 'while(', 'if(', 'struct ', '__m128', '__m256', '__m512', 'u32', 'u8', 'u64'];
        $asm_keywords = ['mov ', 'xor ', 'cmp ', 'jmp', 'lea ', 'add ', 'sub ', 'inc ', 'dec ', 'popcnt', 'vmov', 'rep '];
        $bash_keywords = ['echo ', 'sudo ', 'apt-get', '#!/bin/bash'];

        $count_c = 0; $count_asm = 0; $count_bash = 0;
        foreach ($c_keywords as $kw)   if (stripos($code, $kw) !== false) $count_c++;
        foreach ($asm_keywords as $kw) if (stripos($code, $kw) !== false) $count_asm++;
        foreach ($bash_keywords as $kw) if (stripos($code, $kw) !== false) $count_bash++;

        if ($count_c > 0 && $count_c >= $count_asm && $count_c >= $count_bash) return 'c';
        if ($count_asm > 0 && $count_asm > $count_c && $count_asm >= $count_bash) return 'asm';
        if ($count_bash > 0 && $count_bash > $count_c && $count_bash > $count_asm) return 'bash';

        return 'text';
    };

    // Fonction unifiée de rendu et d'export du code
    $renderAndExportCodeBlock = function($code, $lang_hint) use ($chapNum, $chapterCodeDir, &$codeCounter, $detectCodeLanguage) {
        $codeCounter++;
        $code = trim($code);
        
        // Détecter le vrai langage si non précisé ou générique
        $detectedLang = $detectCodeLanguage($code, $lang_hint);
        
        // Mapper vers GeSHi et Extension
        $langMap = [
            'nasm'   => ['geshi' => 'asm', 'ext' => 'asm'],
            'asm'    => ['geshi' => 'asm', 'ext' => 'asm'],
            'bash'   => ['geshi' => 'bash', 'ext' => 'sh'],
            'c'      => ['geshi' => 'c', 'ext' => 'c'],
            'cpp'    => ['geshi' => 'cpp', 'ext' => 'cpp'],
            'python' => ['geshi' => 'python', 'ext' => 'py'],
            'text'   => ['geshi' => 'text', 'ext' => 'txt'],
        ];
        
        $geshiLang = $langMap[$detectedLang]['geshi'] ?? 'text';
        $ext       = $langMap[$detectedLang]['ext'] ?? 'txt';
        
        // Exporter le code
        $codeFileName = sprintf("code_%03d.%s", $codeCounter, $ext);
        $codeFilePath = $chapterCodeDir . '/' . $codeFileName;
        file_put_contents($codeFilePath, $code);
        
        // Chemins
        $relDir = $chapNum > 0 ? "chapitre_{$chapNum}" : "commun";
        $htmlRelPath = "code/{$relDir}/{$codeFileName}";
        $displayPath = "code/{$relDir}/{$codeFileName}";

        $rendered = '';
        if ($geshiLang === 'text') {
            $escaped = htmlspecialchars($code, ENT_QUOTES, 'UTF-8');
            $rendered = "<pre class=\"code-block\"><code>{$escaped}</code></pre>";
        } else {
            try {
                $geshi = new GeSHi($code, $geshiLang);
                $geshi->enable_line_numbers(GESHI_NORMAL_LINE_NUMBERS);
                $geshi->set_header_type(GESHI_HEADER_DIV);
                $geshi->set_tab_width(4);
                $rendered = "\n<div class=\"code-container\">\n" . $geshi->parse_code() . "\n</div>\n";
            } catch (Exception $e) {
                $escaped = htmlspecialchars($code, ENT_QUOTES, 'UTF-8');
                $rendered = "<pre class=\"code-block\"><code>{$escaped}</code></pre>";
            }
        }

        return <<<HTML

<details>
<summary>Afficher le code &nbsp;&nbsp; <a href="{$htmlRelPath}" target="_blank">{$displayPath}</a></summary>
{$rendered}
</details>

HTML;
    };

    // 6. Blocs de code (avec attribut language) -> sauvagarde physique & HTML type do_geshi()
    $htmlContent = preg_replace_callback(
        '/<pre><code class="language-(.*?)">(.*?)<\/code><\/pre>/s',
        function($m) use ($renderAndExportCodeBlock) {
            $lang = trim($m[1]);
            $code = html_entity_decode($m[2], ENT_QUOTES | ENT_HTML5, 'UTF-8');
            return $renderAndExportCodeBlock($code, $lang);
        },
        $htmlContent
    );

    // Blocs de code sans classe (``` sans langage)
    $htmlContent = preg_replace_callback(
        '/<pre><code>(.*?)<\/code><\/pre>/s',
        function($m) use ($renderAndExportCodeBlock) {
            $code = html_entity_decode($m[1], ENT_QUOTES | ENT_HTML5, 'UTF-8');
            return $renderAndExportCodeBlock($code, 'text');
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
    if (preg_match('/chapitre_(\d+)/i', basename($mdFile, '.md'), $chapMatch)) {
        $chapNum     = (int) $chapMatch[1];
        // Injecter Highcharts + graph.js une seule fois si des graphiques ont été injectés
        if (preg_match('/chart-(ch|auto)-/', $htmlContent)) {
            $scripts = '<script src="javascript/Highcharts-3.0.10/js/highcharts.js"></script>' . "\n"
                     . '<script src="data/graph.js"></script>' . "\n";
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


?>
