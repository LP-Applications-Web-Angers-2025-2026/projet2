<?php
require 'site_web/markdown_to_php/libraries/Parsedown.php';
require 'site_web/php-geshi/geshi.php';
require 'site_web/ez_web.php';

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

    preg_match( '/<h1>(.*?)<\/h1>/', $htmlContent, $matches  );
    chapter($matches[1],0);

    preg_match( '/<h2>(.*?)<\/h2>/', $htmlContent, $matches  );
    section( $matches[2],1);

    preg_match( '/<h3>(.*?)<\/h3>/', $htmlContent, $matches  );
    subsection($matches[3]);

    preg_match( '/<h4>(.*?)<\/h4>/', $htmlContent, $matches  );
    subsubsection($matches[4]);


    // Rendu avec le layout
    ob_start();
    $content = $htmlContent;
    include $template;
    $finalHtml = ob_get_clean();

    file_put_contents($outputFile, $finalHtml);

    echo "✔ Généré : $outputFile\n";
}
?>