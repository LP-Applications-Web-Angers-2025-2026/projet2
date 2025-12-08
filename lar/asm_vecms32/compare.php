#!/usr/bin/php
<?php
require_once("ezlib.php");
error_reporting(E_ALL);

$compute_average = true; // or 0 if no average
$program = "build/bin/main_case.exe";
$project_output = trim( shell_exec("cat cfg/project.cfg") );
$sizes = explode(",", grep_and_cut( $project_output, "/PERFORMANCE_TEST_SIZES/", 2) );


// ==================================================================
// GLOBAL VARIABLES DECLARATION
// ==================================================================

$cpu=trim(shell_exec("./cpu_name.sh"));
echo bold("Current CPU is $cpu\n");


$compiler = trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));
$output_dir = "results/$cpu";
if (!file_exists($output_dir)) {
	if (!mkdir("$output_dir", 0777, true)) {
		die("could not create directory: $output_dir");
	}
}

$contents = "";

echo "#-----------+-----------------------------------\n";
echo "#           |             time (s)\n";
echo "#   size    |   sort    .data    .text    .case \n";
echo "#-----------+-----------------------------------\n";

$contents .= "#----------+-----------------------------------\n";
$contents .= "#          |             time (s)              \n";
$contents .= "#  size    |   sort    .data    .text    .case \n";
$contents .= "#----------+-----------------------------------\n";

for ($i = 15; $i <= 27; ++$i) {
	$nelem = 1 << $i; 
	$r1 = average_time("taskset -c 0 ./build/bin/main_data.exe -m 1 -s $nelem", $compute_average);
	# .data
	$r2 = average_time("taskset -c 0 ./build/bin/main_data.exe -m 2 -s $nelem", $compute_average);
	# .text
	$r3 = average_time("taskset -c 0 ./build/bin/main_text.exe -m 2 -s $nelem", $compute_average);
	# .case
	$r4 = average_time("taskset -c 0 ./build/bin/main_case.exe -m 2 -s $nelem", $compute_average);
	
	list($t1, $c1) = explode(' ', $r1);
	list($t2, $c2) = explode(' ', $r2);
	list($t3, $c3) = explode(' ', $r3);
	list($t4, $c4) = explode(' ', $r4);
	
	$nelem_fmt = sprintf("%10d", $nelem);
	$t1_fmt = sprintf("%6.2f", $t1);
	$t2_fmt = sprintf("%6.2f", $t2);
	$t3_fmt = sprintf("%6.2f", $t3);
	$t4_fmt = sprintf("%6.2f", $t4);
	echo "$nelem_fmt | $t1_fmt | $t2_fmt | $t3_fmt | $t4_fmt\n";
	$contents .= "$nelem_fmt | $t1_fmt | $t2_fmt | $t3_fmt | $t4_fmt\n";
}

$output_file = "$output_dir/compare_".$compiler.".gpd";
file_put_contents($output_file, $contents);
?>
