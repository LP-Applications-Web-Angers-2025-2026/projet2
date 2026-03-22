<?php
$_GET['chapter'] = 15;
$_GET['arch'] = 'recent';
include 'data/api_benchmark.php';
echo "\n--- Ancien ---\n";
$_GET['arch'] = 'ancien';
include 'data/api_benchmark.php';
echo "\n--- Moderne ---\n";
$_GET['arch'] = 'moderne';
include 'data/api_benchmark.php';
