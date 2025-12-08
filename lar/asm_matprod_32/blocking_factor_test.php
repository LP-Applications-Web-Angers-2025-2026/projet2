#!/usr/bin/php
<?php
require_once("ezlib.php");

$compute_average = true;

$now=date("Y-m-d-H:i");
$contents = "Blocking factor test on $now\n"; 

echo $line_double;
echo " This program generates execution times for the\n";
echo " matrix product mp_tiling3 function for different\n";
echo " blocking factors for matrices of differnt sizes.\n";
echo $line_double;

$cpu=trim(shell_exec("./cpu_name.sh"));
echo "Current CPU is $cpu\n";
echo $line_single;

$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";
$validation_parameters = grep_and_cut( $project_output, "/VALIDATION_PARAMETERS/", 2);
$compiler = trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));

//$blocking_factors = explode("\n", trim( shell_exec("seq 8 4 512") ) );
$blocking_factors = explode("\n", trim( shell_exec("seq 8 4 1024") ) );
//$blocking_factors = explode("\n", trim( shell_exec("seq 164 4 260") ) );
//$sizes=array(1024, 1088, 1344, 2048, 3072, 3456, 4096);
$sizes=array(4096);
$output_dir = "results/$cpu";

$minimum_factor = array();
$minimum_values = array();

$files = array();
foreach($sizes as $size) {
	$output_file = $output_dir ."/blocking_factor_" .$size. ".gpd";
	$files[$size] = $output_file;
	error_reporting(0);
	unlink($output_file);
	error_reporting(E_ALL);
	echo "results for blocking factor for mp_tile_bxb_v4 function are send to $output_file\n";

	$times = array();
	$contents = "";
	foreach($blocking_factors as $bf) {
		$command = "$program -n mp_tile_bxb_v4 -s $size -b $bf";
		$result = average_time($command, $compute_average);
		error_reporting(E_ALL);
		
		if (preg_match("/^error/", $result) === 0) {
			list($prt, $prc) = explode(' ', $result);
			
			$contents .= "$size $bf $prt $prc\n";
			$size_fmt=sprintf("%8d", $size);
			$prt_fmt=sprintf("%9.3f", $prt);
			$prc_fmt=sprintf("%20d", $prc);
			$bf_fmt=sprintf("%3d", $bf);
			echo "$size_fmt  $bf_fmt $prt_fmt  $prc_fmt\n";
			$times[$bf] = $prt; 
		}
	}
	
	// find minimum
	asort($times);
	foreach($times as $factor => $time) {
		$minimum_factor[ $size ] = $factor;
		$minimum_values[ $size ] = $time;
		break;
	}
	file_put_contents($output_file, $contents);
}



foreach (array_keys($minimum_factor) as $size) {
	echo "$size ". $minimum_values[$size] . " " . $minimum_factor[$size] ."\n";
}


?>
