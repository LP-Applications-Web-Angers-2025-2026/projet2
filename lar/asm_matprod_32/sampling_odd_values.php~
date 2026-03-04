#!/usr/bin/php
<?php
require_once("ezlib.php");

$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";
$validation_parameters = grep_and_cut( $project_output, "/VALIDATION_PARAMETERS/", 2);
$compiler = trim(shell_exec("$program --list | grep \"^compiler=\" | cut -d'=' -f2"));

$cpu=trim(shell_exec("./cpu_name.sh"));
echo "Current CPU is $cpu\n";
echo $line_single;

// read input file
$input_dir = "results/$cpu";
$output_dir = "results/$cpu";

$input_file = "$input_dir/sampling_" .$compiler. ".gpd";

$contents = file_get_contents($input_file);
$lines = explode("\n", $contents);

foreach($lines as $line) {
	$line = trim($line);
	if (strlen($line) == 0) continue;
	$arr = explode(" ", $line);
	$values[intval($arr[0])] = floatval($arr[1]);
}

// find strange values

$keys = array_keys($values);
$i = 1;
$n = count($keys);

$xm1 = $values[ $keys[0] ];

echo $line_single;
echo "look for odd values\n";
echo " size |  time | time[-1] | time[+1]\n";

$contents = " size |  time | time[-1] | time[+1]\n";
while ($i < $n-1) {
	$x = $values[ $keys[$i] ]; 
	$xp1 = $values[ $keys[$i + 1] ]; 
	
	$avg = ($xm1 + $xp1 + 0.01) * 0.5 * 1.4;
	if ($x > $avg) {
		$size_fmt = sprintf("%4d", $keys[ $i ]); 
		$x_fmt = sprintf("%6.2f", $x);
		$xm1_fmt = sprintf("%6.2f", $xm1);
		$xp1_fmt = sprintf("%6.2f", $xp1);
		echo " " .$size_fmt ." | " .$x_fmt. " | " .$xm1_fmt . " | " .$xp1_fmt ."\n";
		$contents .= "" . $size_fmt ." " .$x_fmt. " " .$xm1_fmt . " " .$xp1_fmt ."\n";
	}
	
	$xm1 = $x; 
	++$i;
}

$output_file = "$output_dir/sampling_odd_values_" .$compiler. ".gpd";
echo "result of odd values is in $output_file\n";
file_put_contents($output_file, $contents);
?>
