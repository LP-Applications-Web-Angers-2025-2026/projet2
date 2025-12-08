#!/usr/bin/php
<?php
require_once("ezlib.php");

// ==================================================================
// Use signal handler to save data in case a Ctrl-C or Ctrl-Z is
// pressed
// ==================================================================

// PHP internal, make signal handling work
declare(ticks=1); 
if (!function_exists('pcntl_signal')) {
    echo "<=== Error ===>\n";
    echo "you need to enable the pcntl extension in your php binary\n";
    echo "see http://www.php.net/manual/en/pcntl.installation.php\n";
    echo "for more information\n";
    exit(1);
}

function signalHandler($signo) {
    global $contents;
    global $output_file;
    
    echo "<=== Interrupt caught ===>\n";
    file_put_contents($output_file, $contents);
    echo "contents send to $output_file\n";
    exit(1);
}


$compute_average = true;

$now=date("Y-m-d-H:i");
$contents = "Samples test on $now\n"; 

echo $line_double;
echo " This program generates execution times for the        \n";
echo " matrix product reference function for different       \n";
echo " dimensions                                            \n";
echo $line_double;

$cpu=trim(shell_exec("./cpu_name.sh"));
echo "Current CPU is $cpu\n";
echo $line_single;

$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";
$validation_parameters = grep_and_cut( $project_output, "/VALIDATION_PARAMETERS/", 2);
$compiler = trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));

$sizes = explode("\n", trim( shell_exec("seq 128 2060") ) );

$output_dir = "results/$cpu";
mkdir($output_dir);
$output_file = "$output_dir/sampling_" .$compiler. ".gpd";
error_reporting(0);
unlink($output_file);
error_reporting(E_ALL);

echo "sampling results for reference method are send to $output_file\n";

pcntl_signal(SIGINT, 'signalHandler');
pcntl_signal(SIGTERM, 'signalHandler');
pcntl_signal(SIGHUP, 'signalHandler');

$values = array();
$contents = "";

foreach($sizes as $size) {
	$command = "$program -m 1 -s $size";
	$command_output = trim( shell_exec("/usr/bin/time -f \"program.time=%U\" $command  2>&1") ); 
	$prt = grep_and_cut( $command_output, "/^program.time=/", 2 );
	$values[ $size ] = $prt;
	echo "$size $prt\n";
	$contents .= "$size $prt\n";
}

file_put_contents($output_file, $contents);



?>
