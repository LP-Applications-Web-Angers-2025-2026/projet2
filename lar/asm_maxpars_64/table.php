#!/usr/bin/php
<?php
require_once("ezlib.php");

error_reporting(E_ALL);

// ==================================================================
// GLOBAL VARIABLES DECLARATION
// ==================================================================

// get project name
$project_output = trim( shell_exec("cat cfg/project.cfg") );
$project_name = grep_and_cut( $project_output, "/PROJECT_NAME/", 2);
$program = "build/bin/". $project_name .".exe";

$options = array(
	"b,best",
	"c:,compiler",
	"d:,device",
	"e:,extra-data",
	"f:,format",
	"h,highlight-minimum",
	"m:,method=",
	"s:,size",
	"v,verbose"

);
	
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

$types = array(
	"csv",
	"html",
	"html-full",
	"latex"
);

$extra_data = array(
	"sum",
	"mean",
	"stdev"
);


define("BEST", "b");
define("COMPILER", "c");
define("DEVICE", "d");
define("FORMAT", "f");
define("HIGHLIGHT_MIN", "h");
define("METHOD", "m");
define("SIZE", "s");
define("VERBOSE", "v");

$short_opt = array(COMPILER, DEVICE, FORMAT, METHOD, SIZE);

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

function find_all_methods() {
	global $program;
	
	$methods = array();
	
	$input = trim( shell_exec("$program --list") ); 
	$methods_count = intval( grep_and_cut($input, "/^methods.count=/", 2) );

	// get names of method
	for ($method = 1; $method <= $methods_count; ++$method) {
		$methods[ $method ] = grep_and_cut($input, "/^method.id=$method,/", 3);
	}
	
	return $methods;
}

/**
 *
 */
function find_all_sizes($cpu, $compiler, $method) {
	$input_file = "results/$cpu/method_". $method. "_" .$compiler. ".gpd";
	$input = trim( shell_exec("cat $input_file | awk '{ print $1;}'") );
	return explode("\n", $input);
	 
}

/**
 * return array that contains processor information
 */
function load_processor_info() {
	$processors = array();
	
	$contents = file_get_contents("processors.txt");
	$lines = explode("\n", $contents);
	$line_nbr = 1;
	foreach($lines as $line) {
		$line = trim($line);
		if (strlen($line) == 0) continue;
		if ($line[0] == "#") continue;
		
		$infos = explode("|", $line);
		if (count($infos) != 6) {
			echo "line=$line\n";
			die("error in 'processors.txt' at line $line_nbr, need five fields");
		}
		$processors[ $infos[0] ] = $infos;
		++$line_nbr;
	}
	return $processors;
}

/**
 * Fill 'table' for given 'size', 'compiler' and the selected
 * 'methods' and 'cpus'
 * and find minimum value in row
 */
function populate_table(&$table, $size, &$arguments) {
	$compiler = $arguments[COMPILER];
	$methods = $arguments[METHOD];
	$cpus = $arguments[DEVICE];
	$himin = isset($arguments[HIGHLIGHT_MIN]);
	
	// populate table
	foreach ($methods as $method) {
		$line = array();
		$line[] = $method;
		// gather results for each processor
		foreach ($cpus as $cpu) {
			$input = "results/$cpu/method_". $method. "_" .$compiler. ".gpd";
			if (file_exists($input)) {
				$value = trim( shell_exec("cat $input | grep \"^$size\"") );
				if (strlen($value) == 0) {
					// if data not found then size probably does not exist
					$value = "N/A";
				} else {
					$x = explode(" ", $value);
					$value = floatval($x[1]);
				}
			} else {
				$value = "N/A";
			}
			$line[] = $value;
		}
		$table[] = $line;
	}

	$nrows = count($table);
	$ncols = count($table[0]);
	
	$htable = array();
	for ($i = 0; $i < $nrows; ++$i) {
		$ctable = array();
		for ($j = 0; $j < $ncols; ++$j) $ctable[] = 0;
		$htable[] = $ctable;
	}
	
	if (!$himin) return $htable;
	
	/*
	for ($j = 1; $j < $ncols; ++$j) {
		$column = array_column($table, $j);
		print_r($column);
		sort($column);
		while (count($column) > 0) {
			if ($column[0] == "N/A") 
				array_shift($column);
			else 
				break;	
		}
		if (count($column) > 0) {
			// if array column is empty then size probably does not exist
			$minimum = $column[0];
			for ($i = 0; $i < $nrows; ++$i) {
				if ($table[$i][$j] == $minimum) $htable[$i][$j] = 1;
			}
		}
	}*/
	
	for ($i = 0; $i < $nrows; ++$i) {
		$r_table = array();
		for ($j = 1; $j < $ncols; ++$j) {
			if (is_numeric($table[$i][$j])) $r_table[] = $table[$i][$j];
		}
		sort($r_table);

		// if array size is 0, then we only have N/A values 
		if (count($r_table) > 0) {
			$mini = $r_table[0];
			for ($j = 1; $j < $ncols; ++$j) {
				if (!is_numeric($table[$i][$j])) continue;
				if (abs($table[$i][$j] - $mini) < 2e-3) $htable[$i][$j] = 1;
			}
		}
	}
	
	return $htable;
}

/**
 * Output table in html format
 */
function format_html($table, $size, &$arguments, $highlight_table, $full = true) {
	global $project_name;
	
	$proc_info = load_processor_info();
	
	$himin = isset($arguments[HIGHLIGHT_MIN]);
	$output_file = "output/table_$size.html";
	
	$contents = "";
	
	if ($full) {
		$contents .= "<html>\n";
		$contents .= "<head>\n";
		$contents .= "<style>\n";
		$contents .= "html { font-family: Ubuntu, Helvetica, sans-serif; }";
		$contents .= "table { border-collapse: collapse; }\n";
		$contents .= "th, td { border: 1px solid black; padding: 4px; }\n";
		$contents .= "td.right { text-align: right; }\n";
		$contents .= "td.center { text-align: center; }\n";
		$contents .= ".minimum_execution_time { color: red; font-weight: bold; }\n";
		$contents .= "</style>\n";
		$contents .= "</head>\n";
		$contents .= "<body>\n";
	}	
	
	$contents .= "<table>\n";
	
	//
	// headers
	//
	
	$contents .= "\t<tr>\n";
	$contents .= "\t\t<th>number</th>\n";
	$contents .= "\t\t<th>method</th>\n";
	foreach ($arguments[DEVICE] as $cpu) {
		
		$contents .= "\t\t<th>". $proc_info[ $cpu ][ 1 ] ."<br />";
		$contents .= $proc_info[ $cpu ][ 2 ] ."<br />";
		$contents .= $proc_info[ $cpu ][ 3 ] ."</th>\n";
	}
	$contents .= "\t</tr>\n";
	// data
	$y = 0;
	foreach ($table as $row) {
		$contents .= "\t<tr>\n";
		$contents .= "\t\t<td class=\"center\">". ($y+1) ."</td>\n";
		$contents .= "\t\t<td>". array_shift($row) ."</td>\n";
		$x = 1;
		foreach($row as $column) {
			if ($column === "N/A") {
				$contents .= "\t\t<td class=\"right\">N/A</td>\n";
			} else {
				$css_style = "right";
				if ($himin) {
					if ($highlight_table[$y][$x] == 1) {
						$css_style .= " minimum_execution_time";
					}
				}
				$column_fmt = sprintf("%.3f", $column);
				$contents .= "\t\t<td class=\"$css_style\">$column_fmt</td>\n";
			}	
			++$x;
		}
		$contents .= "\t</tr>\n";
		++$y;
	}
	$contents .= "<caption>$project_name size=$size</caption>\n";
	$contents .= "</table>\n";
	
	if ($full) {
		$contents .= "</body>\n";
		$contents .= "</html>\n";
	}
	
	if (isset($arguments[VERBOSE])) echo $contents;
	echo "generate file $output_file\n";
	file_put_contents($output_file, $contents);
}


function format_csv($table, $size, &$arguments, $highlight_table) {
	// no possible highlight in CSV
	// CSV
	$output_file = "output/table_$size.csv"; 
	echo "\n$output_file\n";
	
	$proc_info = load_processor_info();
	
	$contents = "";
	
	//
	// headers
	//
	
	// header 1
	$contents .= "\"number\", \"method\"";
	foreach ($arguments[DEVICE] as $cpu) {
		echo "-- $cpu\n";
		$contents .= " , " . $proc_info[ $cpu ][ 1 ];
	}
	$contents .= "\n";
	
	// header 2
	$contents .= ", ";
	foreach ($arguments[DEVICE] as $cpu) {
		$contents .= " , " . $proc_info[ $cpu ][ 2 ];
	}
	$contents .= "\n";
	
	// header 1
	$contents .= "\"number\", \"method\"";
	foreach ($arguments[DEVICE] as $cpu) {
		$contents .= " , " . $proc_info[ $cpu ][ 3 ];
	}
	$contents .= "\n";
	
	$y = 0;
	foreach ($table as $row) {
		$contents .= ($y+1) .", " . "\"". array_shift($row) . "\"";
		foreach($row as $column) {
			if (is_float($column)) {
				$contents .= ", $column";
			} else {
				$contents .= ",\"". $column ."\""; 
			}
		}
		$contents .= "\n";
		++$y;
	}
	
	if (isset($arguments[VERBOSE])) echo $contents;
	echo "generate file $output_file\n";
	file_put_contents($output_file, $contents);
}

function format_latex($table, $size, &$arguments, $highlight_table) {
	global $project_name;
	
	$proc_info = load_processor_info();
	
	$himin = isset($arguments[HIGHLIGHT_MIN]);
	$bs ="\\";
	$output_file = "output/table_$size.tex";
	
	$contents = $bs . "begin{table}[htb]\n";
	$contents .= $bs . "begin{center}\n";
	$contents .= $bs . "begin{tabular}{l";
	$ncols1d = count($table[0]) - 1;
	for ($i = 0; $i < $ncols1d; ++$i) $contents .= "r";
	$contents .= "}\n";	
	 
	echo "\n$output_file\n";
	
	//
	// headers
	//
	
	// header 1
	$contents .= "  & method ";
	foreach ($arguments[DEVICE] as $cpu) {
		$contents .= " & " . $proc_info[ $cpu ][ 1 ];
	}
	$contents .= "  " . $bs . $bs . "\n";
	
	// header 2
	$contents .= "  &       ";
	foreach ($arguments[DEVICE] as $cpu) {
		$contents .= " & " . $proc_info[ $cpu ][ 2 ];
	}
	$contents .= "  " . $bs . $bs . "\n";
	
	// header 3
	$contents .= "  &       ";
	foreach ($arguments[DEVICE] as $cpu) {
		$contents .= " & " . $proc_info[ $cpu ][ 3 ];
	}
	$contents .= "  " . $bs . $bs . "\n";
	
	
	// data
	$y = 0;
	foreach ($table as $row) {
		$contents .= ($y+1) . " & " . array_shift($row) ;
		$x = 1;
		
		foreach($row as $column) {
			if ($himin) {
				if ($highlight_table[$y][$x] == 1) {
					$contents .= " & ". $bs ."textbf" .'{' . $column .'}';
				} else {
					$contents .= " & $column";
				}
			} else {
				$contents .= " & $column";
			}
			++$x; 
		}
		$contents .= "  " . $bs . $bs . "\n";
		++$y;
	}
	
	$contents .= $bs . "end{tabular}\n";
	$contents .= $bs . "end{center}\n";
	$contents .= $bs . "caption{" .$project_name. "  " .$size. "}\n";
	$contents .= $bs . "label{tab_}\n";
	$contents .= $bs . "end{table}\n";
	
	if (isset($arguments[VERBOSE])) echo $contents;
	echo "generate file $output_file\n";
	file_put_contents($output_file, $contents);
}

/**
 *
 */
function format($table, $size, &$arguments, $highlight_table) {
	$format = $arguments[FORMAT];
	
	if (($format == "html") || ($format == "html-full")) {
		// HTML
		format_html($table, $size, $arguments, $highlight_table, ($format == "html-full") );

	} else if ($format == "latex") {
		// LATEX
		format_latex($table, $size, $arguments, $highlight_table);
		
	} else if ($format == "csv") {
		// CSV
		format_csv($table, $size, $arguments, $highlight_table);		
	}

}

function find_best(&$best, $size, &$highlight_table) {
	$nrows = count($highlight_table);
	$ncols = count($highlight_table[0]);
	
	$methods = array();
	for ($y = 0; $y < $nrows; ++$y) {
		for ($x = 1; $x < $ncols; ++$x) {
			if ($highlight_table[$y][$x] == 1) {
				$methods[] = $y + 1;
			}
		}
	} 
	$best[$size] = $methods;
}


/**
 *
 */
function usage() {

	$usage=<<<HEREDOC
usage:

	-b, --best
		report best methods for the sizes provided
		
	-c, --compiler = gnu, intel, llvm, pgi
		define compiler to process results obtained from binary compiled
		with given compiler
		
	-f, --format = html, html-full, csv, latex
		define output format
		
	-d, --device = comma separated list of CPUs or 'all' or 'list'
		define list of CPUs to take into account, keyword 'all' will consider
		all CPUs found in the 'results' directory and keyword 'list' will give
		a list of CPUs found
		
	-h, --highlight-min
		if present indicates that best value will be highlighted following
		the output format (see -f)	
		
	-m, --method = comma separated list of methods or 'all', or 'list'
		define list of methods to take into account, keyword 'all' will
		consider all possible methods and keyword 'list will give a list
		of all methods
	
	-s, --size = comma separated list of sizes or 'all' or 'list'
		define list of sizes to report, keyword 'all' will take into account
		all sizes found and keyword 'list' will report a list of all sizes
		found
		
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
// check output format
//
$key = array_search($arguments[FORMAT], $types);
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



//
// check methods
//
if ($arguments[METHOD] == "list") {
	$methods = find_all_methods();
	foreach($methods as $method) {
		echo $method."\n";
	}
	exit(0);
} else if ($arguments[METHOD] == "all") {
	$arguments[METHOD] = find_all_methods();
} else {
	$arguments[METHOD] = explode(",", $arguments[METHOD]);
}

//
// check sizes
//
if ($arguments[SIZE] == "list") {
	$cpus = find_all_cpus();
	$methods = find_all_methods();
	print_r($cpus);
	print_r($methods);
	// first cpu is at index 0, and first method at index 1
	print_r($arguments);
	
	//find_all_sizes($arguments[DEVICE][0], $arguments[COMPILER], $arguments[METHOD][1]);
	$sizes = find_all_sizes($arguments[DEVICE][0], $arguments[COMPILER], $arguments[METHOD][1]);
	foreach($sizes as $size) {
		echo $size."\n";
	}
} else if ($arguments[SIZE] == "all") {
	$arguments[SIZE] = find_all_sizes($arguments[DEVICE][0], $arguments[COMPILER], $arguments[METHOD][1]);
} else {
	$arguments[SIZE] = explode(",", $arguments[SIZE]);
}


$tables = array();
$best = array();

foreach ($arguments[SIZE] as $size) {
	$table = array();
	$tables[$size] = $table;
	$highlight_table = populate_table($table, $size, $arguments); 
	if (isset($arguments[BEST])) find_best($best, $size, $highlight_table); 
	format($table, $size, $arguments, $highlight_table);
} 

if (isset($arguments[BEST])) {
	echo "\n\n";
	echo $line_double;
	echo "Best methods\n";
	echo $line_double;
	echo "   size  | methods\n";
	echo $line_single;
	foreach($best as $size => $methods) {
		$size_fmt = sprintf("%8d", $size);
		echo "$size_fmt | " . implode(", ", $methods). " (";
		foreach($methods as $method) {
			echo $arguments[METHOD][$method]." ";
		}
		echo ")\n";
	}	
}


?>
