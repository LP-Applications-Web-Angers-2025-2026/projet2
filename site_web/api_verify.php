<?php
$db = new PDO('sqlite:data/benchmarks.db');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$out = [];
foreach (['ancien', 'moderne', 'recent'] as $arch) {
    $_GET['chapter'] = 15;
    $_GET['arch'] = $arch;
    
    ob_start();
    include 'data/api_benchmark.php';
    $json = ob_get_clean();
    $out[$arch] = json_decode($json, true);
}

file_put_contents('api_check.json', json_encode($out, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
echo "API Check saved to api_check.json\n";
