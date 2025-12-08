#!/usr/bin/php
<?php
require_once("ezlib.php");

$now=date("Y-m-d-H:i");
$contents = "Validity test on $now\n"; 

echo $line_double;
echo " This program tests the different implementations of   \n";
echo " the popcnt function and check if they return          \n";
echo " the same result                                       \n";
echo $line_double;

$cpu=trim(shell_exec("./cpu_name.sh"));
echo "Current CPU is $cpu\n";
echo $line_single;

$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";
$validation_parameters = grep_and_cut( $project_output, "/VALIDATION_PARAMETERS/", 2);


if (!is_executable($program)) {
	echo $line_excmark;
	echo "Program $program does not exist\n";
	echo "Please run make\n";
	echo $line_excmark;
	exit(99);
}

$compiler = trim( shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));

$output_dir = "results/$cpu";
if (!file_exists($output_dir)) {
	if (!mkdir("$output_dir", 0777, true)) {
		die("could not create directory: $output_dir");
	}
}

// Examine all method in order to determine the valid ones
$methods_valid = array();
$methods_names = array();

$output = find_valid_methods($program, $validation_parameters, $methods_valid, $methods_names); 
$contents .= $output;
$methods_count = count($methods_valid);

// look for methods that are not valid
$to_avoid=array();
for ($method = 1; $method <= $methods_count; ++$method) {
	if ($methods_valid[ $method ] === false) $to_avoid[] = $method;
}
$to_avoid=implode(",", $to_avoid);


echo bold("there are ". count($methods_valid). " methods\n");
echo bold("and ". array_sum($methods_valid). " methods to test\n");
echo $line_single;

$output_file = $output_dir . "/validity_" .$compiler. ".txt";
 
$nbr_errors = 0;
for ($size = 0; $size < 509; ++$size) {
	$command = "$program --test --size $size ";
	if (strlen($to_avoid) != 0) $command .= " -a=$to_avoid";
	$command .=" 2>&1";
	$output = trim(shell_exec($command));
	
	$validity_failure = grep_and_cut($output, "/FAIL/", 1);
	$architecture_failure = grep_and_cut($output, "/error SIG/", 1);
	
	$error = "";
	if (strlen($validity_failure) != 0) {
		$error = $validity_failure;
		++$nbr_errors;
	}
	if (strlen($architecture_failure) != 0) {
		$error = $architecture_failure;
		++$nbr_errors;
	}
	
	$size_fmt = sprintf("%4d", $size);
	if (strlen($error) == 0) {
		echo "$size_fmt  OK" . $line_cr;
		$contents .= "$size_fmt  OK";
	} else {
		echo "$size_fmt FAIL: $error\n";
		$contents .= "$size_fmt  FAIL: $error\n";
	}
}

$contents .= "number_of_errors=$nbr_errors\n";
$output_file ="$output_dir/validity_".$compiler.".gpd";	
file_put_contents($output_file, $contents);
echo bold("output send to $output_file\n");	
echo bold("number_of_errors=$nbr_errors\n");
?>

