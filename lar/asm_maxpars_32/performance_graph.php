#!/usr/bin/php
<?php
require_once("ezlib.php");
error_reporting(0);

$options = array(
	"d:,device="
);
	
$short_opt = array('d');


define("DEVICE", "d");

/**
 *
 */
function usage() {

	$usage=<<<HEREDOC
usage:
		
	-d, --device = STRING
		define name of a CPU, or use keyword 'list' for STRING to report
		all CPUs found in the 'results' directory
		
HEREDOC;
	echo $usage."\n";
	die();
}


// ==================================================================
// MAIN PROGRAM
// ==================================================================


//
// parse command line arguments
//
$arguments = clap($options, $argv);
if (is_string($arguments)) {
	echo $line_double;
	echo "error: $arguments\n";
	echo $line_double;
	usage();
}

if (isset($arguments[DEVICE])) {
	if ($arguments[DEVICE] == 'list') {
	} else {
		$cpu = $arguments[DEVICE];
	}
} else {
	$cpu = trim( shell_exec("./cpu_name.sh") );
}

echo bold("Current CPU is $cpu\n");

$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";
$validation_parameters = grep_and_cut( $project_output, "/VALIDATION_PARAMETERS/", 2);
$sizes = explode(",", grep_and_cut( $project_output, "/PERFORMANCE_TEST_SIZES/", 2) );


if (!is_executable($program)) {
	echo $line_excmark;
	echo "Program $program does not exist\n";
	echo "Please run make\n";
	echo $line_excmark;
	exit(99);
}

$compiler=trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));

$methods_valid = array();
$methods_names = array();
find_valid_methods($program, $validation_parameters, $methods_valid, $methods_names); 
$methods_count = count($methods_valid);

copy("palette.pal", "results/$cpu/palette.pal");

// -------------------------------------------------------------------
// PLOT ALL METHODS
// -------------------------------------------------------------------

function plot_all() {
	global $cpu;
	global $compiler;
	global $methods_valid;
	global $methods_names;
	global $methods_count;
	global $line_double;
	
	$gnuplot_file = "performance_script.gps";
	$gnuplot_script = "results/$cpu/$gnuplot_file";

	error_reporting(0);
	unlink("$gnuplot_script");
	error_reporting(E_ALL);

	$pdf_file="".$cpu."_performance_".$compiler.".pdf";
	$contents=<<<HEREDOC
set term pdfcairo font "sans,12" 
set output "$pdf_file"
set title "Performance of all methods"
set xlabel "sizes" 
set xtics rotate by -45 
set xtics font ", 10"
set ylabel "times in seconds"
load 'palette.pal'
set grid y
HEREDOC;

	// generate plot command
	$first = true;
	$plot = "plot ";
	for ($method = 1; $method <= $methods_count; ++$method) {
		if ($methods_valid[ $method ] === false) continue;
		$method_name = $methods_names[ $method ];
		$method_name_fmt = str_replace("_", "-", $method_name);
		if ($first === false) {
			$plot .= ", ";
		} else {
			$first = false;
		}
		$plot .= "\"method_" .$method_name. "_" .$compiler. ".gpd\" with lines ls $method title \"" .$method_name_fmt. "\"";	
	}
	$contents .= "\n$plot";
	file_put_contents($gnuplot_script, $contents);
	
	shell_exec("cd results/$cpu && gnuplot $gnuplot_file && timeout 10s evince $pdf_file  2>/dev/null &");
	
	echo $line_double;
	echo bold("all methods: $pdf_file\n");
	echo "script file is $gnuplot_file\n";

}

# -------------------------------------------------------------------
# FIND BEST METHODS
# -------------------------------------------------------------------

function plot_best() {
	global $cpu;
	global $sizes;
	global $compiler;
	global $methods_valid;
	global $methods_names;
	global $methods_count;
	global $line_double;
	
	//
	// find largest size
	//
	$largest_size = $sizes[ count($sizes) - 1 ];
	
	//
	// find average of execution times for largest size
	//
	// result: $avg 
	// 
	$extimes = array();
	for ($method = 1; $method <= $methods_count; ++$method) {
		// don't take into account invalid methods
		if  ($methods_valid[ $method ] === false) continue;
		
		$method_name = $methods_names[ $method ];
		$input_file = "results/$cpu/method_". $method_name. "_". $compiler. ".gpd";
		$input = file_get_contents($input_file);
		$val = floatval( grep_and_cut($input, "/^$largest_size/", 2, " ") );
		$extimes[$method] = $val;
	}
	$avg = array_sum($extimes) / count($extimes);
	$avg_fmt = sprintf("%.2f", $avg);
	
	//
	// selection of methods with execution time below or equal to average
	//
	// result: update variable $methods_valid by deleting undesired methods
	// 
	echo bold("selction of methods with average under $avg_fmt\n");
	for ($method = 1; $method <= $methods_count; ++$method) {
		$method_name_fmt = sprintf("%25s", $methods_names[ $method ]); 
		if (!isset($extimes[ $method ])) continue;
		
		$extime_fmt = sprintf("%8.2f", $extimes[ $method ]);
		if  ($extimes[ $method ] > $avg) {
			echo " - reject ". $method_name_fmt . " (" . red($extime_fmt) . ")\n";
			unset($methods_valid[$method]);
		} else {
			echo " + accept ". $method_name_fmt . " (" . green($extime_fmt) . ")\n";
		}
	}
	
	//
	// generate graph for those methods
	//
	$gnuplot_file="performance_best_script.gps";
	$gnuplot_script="results/$cpu/$gnuplot_file";
	
	error_reporting(0);
	unlink("$gnuplot_script");
	error_reporting(E_ALL);

	$pdf_file = "" .$cpu. "_performance_best_" .$compiler. ".pdf";
	$contents=<<<HEREDOC
set term pdfcairo font "sans,12" 
set output "$pdf_file"
set title "Best methods below average $avg_fmt"
set xlabel "sizes"
set xtics rotate by -45
set xtics font ", 10"
set ylabel "times in seconds"
set key outside top right
set grid y
load 'palette.pal'
set style data linespoints
HEREDOC;

	//
	// generate plot command
	//
	// result: $plot
	// 
	$first = true;
	$plot = "plot ";
	for ($method = 1; $method <= $methods_count; ++$method) {
		// skip invalid methods
		if (!isset($methods_valid[ $method ])) continue;
		if ($methods_valid[ $method ] === false) continue;
	
		// modify name of method so that gnuplot can print it correctly	
		$method_name = $methods_names[ $method ];
		$method_name_fmt = str_replace("_", "-", $method_name);
		
		if ($first === false) {
			$plot .= ", ";
		} else {
			$first = false;
		}
		$plot .= "\"method_" .$method_name. "_" .$compiler. ".gpd\" using 1:2 ls $method pt $method title \"" .$method_name_fmt. "\"";	
	}

	//
	// write file of gnuplot commands and execute script
	//
	$contents .= "\n$plot";
	file_put_contents($gnuplot_script, $contents);
	
	shell_exec("cd results/$cpu && gnuplot $gnuplot_file && timeout 10s evince $pdf_file 2>/dev/null &");
	
	echo $line_double;
	echo bold("best methods: $pdf_file\n");
	echo "script file is $gnuplot_file\n";

}

plot_all();
plot_best();

?>
