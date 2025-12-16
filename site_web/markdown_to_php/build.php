<?php
require __DIR__ . '/libraries/Parsedown.php';
require dirname(__DIR__) . '/php-geshi/geshi.php';
require dirname(__DIR__) . '/ez_web.php';

$Parsedown = new Parsedown();

$sourceDir = __DIR__ . '/pages-md';
$outputDir = __DIR__ . '/public';
$template  = __DIR__ . '/templates/layout.php';

if (!is_dir($outputDir)) mkdir($outputDir);

$pages = []; // Initialize pages array

foreach (glob("$sourceDir/*.md") as $mdFile) {

    $markdown = file_get_contents($mdFile);
    $htmlContent = $Parsedown->text($markdown);

    $filename = basename($mdFile, '.md');
    $outputFile = "$outputDir/$filename.html";

    // Titre automatique depuis le premier H1
    preg_match('/<h1>(.*?)<\/h1>/', $htmlContent, $matches);
    $title = $matches[1] ?? ucfirst($filename);

    // H1 -> chapter
    $htmlContent = preg_replace_callback('/<h1>(.*?)<\/h1>/', function($matches) {
        ob_start();
        chapter($matches[1], 0);
        return ob_get_clean();
    }, $htmlContent);

    // H2 -> section
    $htmlContent = preg_replace_callback('/<h2>(.*?)<\/h2>/', function($matches) {
        ob_start();
        section($matches[1], 1);
        return ob_get_clean();
    }, $htmlContent);

    // H3 -> subsection
    $htmlContent = preg_replace_callback('/<h3>(.*?)<\/h3>/', function($matches) {
        ob_start();
        subsection($matches[1]);
        return ob_get_clean();
    }, $htmlContent);

    // H4 -> subsubsection
    $htmlContent = preg_replace_callback('/<h4>(.*?)<\/h4>/', function($matches) {
        ob_start();
        subsubsection($matches[1]);
        return ob_get_clean();
    }, $htmlContent);

    // Code -> code_geshi
    $htmlContent = preg_replace_callback('/<pre><code class="language-(.*?)">(.*?)<\/code><\/pre>/', function($matches) {
        $filename = trim($matches[2]);
        
        // Try to find the file
        if (!file_exists($filename)) {
            // Check relative to site_web (parent of this script's directory)
            $siteWebPath = dirname(__DIR__) . '/' . $filename;
            if (file_exists($siteWebPath)) {
                $filename = $siteWebPath;
            }
        }

        ob_start();
        do_geshi($filename, $matches[1]);
        return ob_get_clean();
    }, $htmlContent);

    // Rendu avec le layout
    ob_start();
    $content = $htmlContent;
    include $template;
    $finalHtml = ob_get_clean();

    file_put_contents($outputFile, $finalHtml);

    echo "Généré : $outputFile\n";
    
    // Store page info for index
    $pages[] = [
        'title' => $title,
        'file' => $filename . '.html'
    ];
}

// Génération de l'index
ob_start();
echo "<h1>Index des pages</h1>";
echo "<ul>";
foreach ($pages as $page) {
    echo "<li><a href=\"{$page['file']}\">{$page['title']}</a></li>";
}
echo "</ul>";
$indexContent = ob_get_clean();

// Rendu de l'index avec le layout
ob_start();
$content = $indexContent;
include $template;
$finalIndexHtml = ob_get_clean();

file_put_contents("$outputDir/index.html", $finalIndexHtml);
echo "✔ Index généré : $outputDir/index.html\n";
?>
