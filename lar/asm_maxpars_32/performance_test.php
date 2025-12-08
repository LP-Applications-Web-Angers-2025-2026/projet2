#!/usr/bin/php
<?php
require_once("ezlib.php");
error_reporting(E_ALL);

$compute_average = true; // or 0 if no average

$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";
$validation_parameters = grep_and_cut( $project_output, "/VALIDATION_PARAMETERS/", 2);
$sizes = explode(",", grep_and_cut( $project_output, "/PERFORMANCE_TEST_SIZES/", 2) );


// ==================================================================
// GLOBAL VARIABLES DECLARATION
// ==================================================================

$cpu=trim(shell_exec("./cpu_name.sh"));
echo bold("Current CPU is $cpu\n");

if (!is_executable($program)) {
	echo $line_excmark;
	echo "Program $program does not exist\n";
	echo "Please run make\n";
	echo $line_excmark;
	exit(99);
}

// =======================================
// EXECUTE VALIDITY TEST AND CHECK OUTPUT
// =======================================

echo bold("perform validity test, please wait ...\n");

$output = trim(shell_exec("php validity_test.php"));
$nbr_errors = intval( grep_and_cut($output, "/number_of_errors=/", 2) );
if ($nbr_errors != 0) {
	echo $line_excmark;
	echo "Performance test will not be executed due to errors\n";
	echo "when executing the validity test.\n";
	echo "Please check your source code.\n";
	echo $line_excmark;
	// exit(99);
} else {
	echo "validity test " .bold(green("OK")) ."\n";
}


$compiler = trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));
$output_dir = "results/$cpu";
if (!file_exists($output_dir)) {
	if (!mkdir("$output_dir", 0777, true)) {
		die("could not create directory: $output_dir");
	}
}

// update methods_count
$methods_valid = array();
$methods_names = array();

$output = find_valid_methods($program, $validation_parameters, $methods_valid, $methods_names); 
$contents = $output;
$methods_count = count($methods_valid);

echo bold("there are ". count($methods_valid). " methods\n");
echo bold("and ". array_sum($methods_valid). " methods to test\n");
echo $line_single;

$contents = "";
foreach(array_keys($methods_valid) as $method) {

	if ($methods_valid[ $method ] === false) continue;
	
	$method_name = $methods_names[ $method ];
	$output_file = "$output_dir/method_".$method_name."_".$compiler.".gpd";
	error_reporting(0);
	unlink($output_file);
	error_reporting(E_ALL);
	$contents = "";
	
	echo "results for method $method are send to $output_file\n";
	echo "------------------------------------------\n";
	echo "    size | time (s) |               cycles\n";
	echo "------------------------------------------\n";
	foreach($sizes as $size) {
		$command="$program -m $method -s $size";
		$result = average_time($command, $compute_average);
		error_reporting(E_ALL);
		
		if (preg_match("/^error/", $result) === 0) {
			list($prt, $prc) = explode(' ', $result);
			
			$contents .= "$size $prt $prc\n";
			$size_fmt=sprintf("%8d", $size);
			$prt_fmt=sprintf("%9.2f", $prt);
			$prc_fmt=sprintf("%20d", $prc);
			echo "$size_fmt  $prt_fmt  $prc_fmt\n";
		}
	}
	file_put_contents($output_file, $contents);
}


?>
