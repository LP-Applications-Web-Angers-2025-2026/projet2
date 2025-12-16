<?php
require __DIR__ . '/libraries/Parsedown.php';
require dirname(__DIR__) . '/php-geshi/geshi.php';
require dirname(__DIR__) . '/ez_web.php';

$Parsedown = new Parsedown();

$sourceDir = __DIR__ . '/pages-md';
$outputDir = __DIR__ . '/public';
$template  = __DIR__ . '/templates/layout.php';

if (!is_dir($outputDir)) mkdir($outputDir);

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

    // Rendu avec le layout
    ob_start();
    $content = $htmlContent;
    include $template;
    $finalHtml = ob_get_clean();

    file_put_contents($outputFile, $finalHtml);

    echo "Généré : $outputFile\n";
}
?>

