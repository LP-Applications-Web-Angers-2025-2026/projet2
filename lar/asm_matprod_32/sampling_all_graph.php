#!/usr/bin/php
<?php
require_once("ezlib.php");

echo $line_double;
echo " This program generates a graphic from the results     \n";
echo " obtained by the samples_test.php script               \n";
echo " Please put CPU Name as argument to generate graph     \n";
echo " for the given CPU.\n";
echo $line_double;

if (count($argv) > 1) {
	$cpu=$argv[1];
} else {
	$cpu=trim(shell_exec("./cpu_name.sh"));
}
echo "Current CPU is $cpu\n";
echo $line_single;

$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";
//$compiler = trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));


function generate_graph(&$arguments) {
	$compiler = $arguments[COMPILER];
	$cpus = $arguments[DEVICE];

	$gnuplot_file = "sampling_script.gps";	
	if (count($cpus) > 1) {
		$gnuplot_script = "results/$gnuplot_file";
		$pdf_file= "" .$cpu. "_samples_" .$compiler. ".pdf";
	} else {
		$gnuplot_script = "results/$cpu/$gnuplot_file";
		$pdf_file= "" .$cpu. "_sampling_" .$compiler. ".pdf";
	}
	
	
	
	$contents=<<<HEREDOC
set term pdfcairo font "sans,12" size 1024,768 
set output "$pdf_file"
set title "Execution times for reference method"
set xlabel "blocking factor" 
set xtics font ", 10"
set ylabel "times in seconds"
set key top left
load 'palette.pal'
set grid y
HEREDOC;

	$file_name = "samples_" .$compiler. ".gpd";
	$i = 0;
	foreach($arguments[DEVICE] as $cpu) {
		echo $cpu;
		++$i;
	}
	$contents .= "\nplot \"$file_name\" with lines ls 1 title \"reference\"";
	
	echo $contents."\n";
	//file_put_contents($gnuplot_script, $contents);
	//shell_exec("cd results/$cpu && gnuplot $gnuplot_file && timeout 10s evince $pdf_file  2>/dev/null &");
}

/**
 * find all CPUs
 */
function find_all_cpus() {
	$cpus_list = trim( shell_exec("ls -d results/[AI]*") );
	$cpus_list = explode("\n", $cpus_list );
	foreach($cpus_list as &$cpu) {
		$cpu = substr($cpu, strlen("results/"));
	}
	return $cpus_list;	
}

define("COMPILER", "c");
define("DEVICE", "d");
define("VERBOSE", "v");

$default = array(
	"c" => "gnu",
	"d" => "all",
	"f" => "csv",
	"m" => "all",
	"s" => "all",
);

$compilers = array(
	"gnu",
	"intel",
	"llvm",
	"pgi"
);

$options = array(
	"c:,compiler",
	"d:,device",
	"v,verbose"
);

$short_opt = array(COMPILER, DEVICE);

/**
 *
 */
function usage() {

	$usage=<<<HEREDOC
usage:

	-c, --compiler = gnu, intel, llvm, pgi
		define compiler to process results obtained from binary compiled
		with given compiler
		
	-d, --device = comma separated list of CPUs or 'all' or 'list'
		define list of CPUs to take into account, keyword 'all' will consider
		all CPUs found in the 'results' directory and keyword 'list' will give
		a list of CPUs found
		
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

//
// set default values if not defined
//
foreach($short_opt as $v) {
	if (!isset($arguments[$v])) {
		$arguments[$v] = $default[$v];
	}
}

//
// check compiler 
//
$key = array_search($arguments[COMPILER], $compilers);
if ($key === false) usage();

//
// check devices
//
if ($arguments[DEVICE] == "list") {
	$cpus = find_all_cpus();
	foreach($cpus as $cpu) {
		echo $cpu."\n";
	}
	exit(0);
} else if ($arguments[DEVICE] == "all") {
	$arguments[DEVICE] = find_all_cpus();
} else {
	$arguments[DEVICE] = explode(",", $arguments[DEVICE]);
}

print_r($arguments);

generate_graph($arguments);
?>
