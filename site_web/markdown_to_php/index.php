<?php

require './libraries/Parsedown.php';

$markdown = file_get_contents('asm_popcnt_32.md');
$Parsedown = new Parsedown();
$html = $Parsedown->text($markdown);


echo $html;






?>

