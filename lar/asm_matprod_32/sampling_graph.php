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
$compiler = trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));


function generate_graph() {
	global $cpu;
	global $compiler;
	
	$gnuplot_file = "sampling_script.gps";
	$gnuplot_script = "results/$cpu/$gnuplot_file";
	
	$pdf_file= "" .$cpu. "_samples_" .$compiler. ".pdf";
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

	$file_name = "sampling_" .$compiler. ".gpd";
	$contents .= "\nplot \"$file_name\" with lines ls 1 title \"reference\"";
	
	file_put_contents($gnuplot_script, $contents);

	shell_exec("cd results/$cpu && gnuplot $gnuplot_file && timeout 10s evince $pdf_file  2>/dev/null &");
}

generate_graph();
?>
