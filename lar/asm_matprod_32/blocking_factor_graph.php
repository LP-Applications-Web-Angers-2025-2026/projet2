#!/usr/bin/php
<?php
require_once("ezlib.php");


echo $line_double;
echo " This program generates graph for the blocking factor\n";
echo " files\n";
echo $line_double;

$cpu=trim(shell_exec("./cpu_name.sh"));
echo "Current CPU is $cpu\n";
echo $line_single;

$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";
$compiler = trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));


$sizes_small=array(1024, 1088, 1344);
$sizes_large=array(2048, 3072, 3456, 4096);

$output_dir = "results/$cpu";

function generate_graph($type, $sizes) {
	global $cpu;
	global $compiler;
	global $output_dir;
	
	$gnuplot_file = "blocking_factor_" .$type. "_script.gps";
	$gnuplot_script = "results/$cpu/$gnuplot_file";
	
	$pdf_file= "" .$cpu. "_blocking_factor_" .$type. "_" .$compiler. ".pdf";
	$contents=<<<HEREDOC
set term pdfcairo font "sans,12" 
set output "$pdf_file"
set title "Blocking factor $type"
set xlabel "blocking factor" 
set xtics font ", 10"
set ylabel "times in seconds"
set key top right
load 'palette.pal'
set grid y
HEREDOC;

	// generate plot command
	$first = true;
	$plot = "plot ";
	$i = 1;
	foreach ($sizes as $size) {
		$file_name = "blocking_factor_" .$size. ".gpd";
		if ($first === false) {
			$plot .= ", ";
		} else {
			$first = false;
		}
		$plot .= "\"" .$file_name ."\" using 2:3 with lines ls $i title \"" .$size. "\"";
		++$i;
	}
	$contents .= "\n$plot";
	file_put_contents($gnuplot_script, $contents);

	shell_exec("cd results/$cpu && gnuplot $gnuplot_file && timeout 10s evince $pdf_file  2>/dev/null &");
}

generate_graph("small", $sizes_small);
generate_graph("large", $sizes_large);
	

?>
