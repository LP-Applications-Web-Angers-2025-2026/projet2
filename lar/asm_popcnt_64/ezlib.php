<?php

$line_cr = "\033[0K\r"; // carriage return
$line_double = str_repeat("=", 40) . "\n";
$line_single = str_repeat("-", 40) . "\n";
$line_excmark = str_repeat("!", 40) . "\n";


function bold($s) {
	return "\e[1m" . $s ."\e[0m";
}

function red($s) {
	return "\e[91m" . $s ."\e[0m";
}

function green($s) {
	return "\e[92m" . $s ."\e[0m";
}

function blue($s) {
	return "\e[34m" . $s ."\e[0m";
}



/**
 * Given a string with new line characters or an array of strings
 * as input, perform a grep search on the 'pattern' regular expression
 * and on the first occurrence found perform a cut on the 'separator'
 * and get the 'cut'th element
 * @param input a string with new line character or an array of strings
 * @param pattern regular expression to look for
 * @param cut selection of the nth element (see separator parameter)
 * @param separator explode line that matches the regular expression
 *
 * @return a string that correspond to the grep + cut treatment or
 *         empty string if not found 
 */
function grep_and_cut($input, $pattern, $cut, $separator="=") {
	if ( is_string($input) )
		$arr = explode("\n", $input);
	else
		$arr = $input;
	assert( is_array($arr) );
	assert( $cut >= 1 );
	
	// for each string of the array
	foreach($arr as $line) {
		// perform regular expression seach
		$grep = preg_match($pattern, $line);
		// if match found return result
		if ($grep == 1) {
			$x = explode($separator, $line);
			return $x[ $cut - 1 ];
		}
	}
	
	// if pattern not found return an empty string
	return "";
}

/**
 * Find execution time of shell command and return the result in 
 * seconds.
 * If 'compute_average' is set to true we execute a command 'cmd' 
 * 'nbr_times' and compute the average of execution times, otherwise
 * or if the execution time is greater than 4.0 seconds do it only once.
 * @param command shell command to execute
 * @param compute_average if set to true, execute commdn 'nbr_times'
 * @param nbr_times number of times command will be executed
 *
 * @result average time in seconds
 */
function average_time($command, $compute_average=true, $nbr_times=10) {
	error_reporting(0);
	$output_file="results_local.txt";
	unlink($output_file);
	error_reporting(E_ALL);
	
	// execute program once
	$output=shell_exec("/usr/bin/time -f \"program.time=%U\" $command 2>&1");
	
	// check if something went wrong and report error for exemple
	// an illegal instruction executed
	if (preg_match("/error SIG[ \S]+\n/", $output, $matches) == 1) {
		return $matches[0];
	}
	
	//
	// otherwise take data into account
	//
	$prog_extime = floatval( grep_and_cut($output, "/^program.time=/", 2) );
	$prog_cycles = intval( grep_and_cut($output, "/^cycles=/", 2) );

	// if don't compute average return execution time of first execution
	if ($compute_average == false) {
		return "$prog_extime $prog_cycles";
	}
	
	//
	if ($prog_extime > 4.0) {
		return "$prog_extime $prog_cycles";
	}
	
	//echo "1 $prog_extime $prog_cycles\n";
	
	$extimes = array( $prog_extime );
	$cycles  = array( $prog_cycles );
	
	for ($i=2; $i <= $nbr_times; ++$i) {
		$output=shell_exec("/usr/bin/time -f \"program.time=%U\" $command 2>&1");
		$prog_extime = floatval( grep_and_cut($output, "/^program.time=/", 2) );
		$prog_cycles = intval( grep_and_cut($output, "/^cycles=/", 2) );
		$extimes[] = $prog_extime ;
		$cycles[]  = $prog_cycles ;
		//echo "$i $prog_extime $prog_cycles\n";
	}
	
	$prog_extime = array_sum($extimes) / count($extimes);
	$prog_cycles = array_sum($cycles)  / count($cycles);	

	return "$prog_extime $prog_cycles";
}


/**
 * Find methods that are valid for test.
 * Methods that produce an Illegal Instruction signal do not support
 * some assembly instruction (for example AVX2) and will not be used
 * in the final test
 *
 * @param cmd command to execute
 *
 * @param vparam validation parameters to add to 'cmd' (see
 * variable VALIDATION_PARAMETERS in file cfg/project.cfg) 
 *      
 * @param m_valid reference to array that will have as index 
 * the integer identifer of the method and as value: true if method
 * did execute well or false otherwise
 *
 * @param m_names reference to array that will have as index the
 * integer identifer of the method and as value the name of the
 * method
 *
 * @return array of methods ids
 */
function find_valid_methods($program, $vparam, &$m_valid, &$m_names) {
	
	echo bold("check methods execution...\n");
	$contents = "check methods execution...\n";
	
	$input = shell_exec("$program --list");	
	$methods_count = intval( grep_and_cut($input, "/^methods.count=/", 2) );

	$m_valid = array();
	$m_names = array();

	// get names of method
	for ($method = 1; $method <= $methods_count; ++$method) {
		$m_names[ $method ] = grep_and_cut($input, "/^method.id=$method,/", 3);
	}

	// create array of methods that didn't raise an Illegal Instruction signal	
	for ($method = 1; $method <= $methods_count; ++$method) {
		$command = "$program $vparam -m $method 2>&1";
		$output = shell_exec($command);
		//echo "$method $output\n";
		$method_name = $m_names[ $method ];
		$method_fmt = sprintf("%2d", $method);
		
		// look for signal exception like SIGILL for illegal instruction
		if (preg_match("/error SIG/", $output)) {
			echo " - method $method_fmt ". bold(red("FAIL")) ." $method_name \n";
			$contents .= " - method $method_fmt FAIL $method_name \n";
			$m_valid[ $method ] = false;
		} else {
			echo " + method $method_fmt " .bold(green("OK")). " $method_name\n";
			$contents .= " + method $method_fmt OK   $method_name\n";
			$m_valid[ $method ] = true;
		}
	}

	return $contents;
}

// ==================================================================
// CLAP: COMMAND LINE ARGUMENT PARSER
// ==================================================================

// Global variables
$options_short = array();
$options_long  = array();
$options_arguments = array();

function clap_option_exists($short, $long) {
	global $options_short;
	global $options_long;
	global $options_arguments;
	
	$n = count($options_short);
	if ($n == 0) return false;
	
	for ($i = 1; $i <= $n; ++$i) {
		if ($short == $options_short[$i]) return true;
		if ($long == $options_long[$i]) return true;
	}
	
	return false;
}

function clap_fill_tables(&$options) {
	global $options_short;
	global $options_long;
	global $options_arguments;

	$option_id = 1;
	foreach($options as $option) {
		$patterns = explode(",", $option);
		assert( count($patterns) == 2 );
		
		
		$short = $patterns[0][0];
		$long  = $patterns[1];
		$arg   = false;
		  
		if (strlen($patterns[0]) == 1) {
			// nothing to do
		} else if (strlen($patterns[0]) == 2) {
			assert( $patterns[0][0] == ":" );
			$arg = true;
		} 
		
		assert( strlen($long) > 1 );
		
		if (clap_option_exists($short, $long) == true) {
			die("option short or long already exists for $pattern");
		}
		
		$options_short[$option_id] = $short;
		$options_long[$option_id] = $long;
		$options_arguments[$option_id] = $arg;
		++$option_id;
	}

}

/**
 * Find if 'token' is present in array 'arr'
 * and return index value in 'arr'
 * return 0 if not found
 */
function clap_find_option($token, &$arr) {
	
	for ($i = 1; $i <= count($arr); ++$i) {
		if ($arr[$i] == $token) {
			return $i;
		}
	}
	
	return 0;
}


/**
 * Command line argument parsing
 * @param options definition of available options as array of string (see below)
 * @param command line arguments
 * 
 * @return array of options found and their arguments
 *
 * The options are described by a string of the following format:
 *
 *        letter[:],word
 *
 * where letter is the short option identifier and word is the long option
 * identifier, note that the character ':' is optional and will indicate that
 * the option will require an argument 
 *
 * For example:
 *         $options = new array( "v,verbose", "-i:,input-file" );
 * will enable to write as command line argument in short format:
 *         php myprogram.php  -v -i file.txt
 * or in long format
 *         php myprogram.php  --verbose -input-file=file.txt 
 */
function clap($options, $argv) {
	global $options_short;
	global $options_long;
	global $options_arguments;
	
	assert( is_array(options) == true );
	
	// fill arrays short, long and arguments
	clap_fill_tables($options);	
		
	//print_r($options_short);
	//print_r($options_long);
	//print_r($options_arguments);
	
	$nb_args = count($argv);
	
	// return value if no error that will be filled
	// with parsed data
	$result = array();
	
	$i = 1;
	while ($i < $nb_args) {
		$is_short = true;
		$token = $argv[$i];
		$argument = "";
		
		if ($token[0] != '-') {
			return "option should start with '-' or '--' for '$token'";
		}
		
		$argument = "";
		if (strncmp($token, "--", 2) == 0) {
			// long option
			$token = substr($token, 2);
			$pos_equal = strpos($token, "=");
			if ($pos_equal > 0) {
				$str = $token;
				$token = substr($str, 0, $pos_equal);
				$argument = substr($str, $pos_equal + 1);
			}
			$option_id = clap_find_option($token, $options_long);
			if ($option_id == 0) {
				return "could not find long option $token";
			}
			if ($options_arguments[ $option_id ] == true) {
				if (strlen($argument) == 0) {
					return "argument for option $token is missing";
				}
			} else {
				if (strlen($argument) != 0) {
					return "argument provided for option $token while not required";
				}
			}
			$token = $options_short[ $option_id ];
		} else {
			// short option
			$token = substr($token, 1);
			$option_id = clap_find_option($token, $options_short);
			if ($option_id == 0) {
				return "could not find short option $token";
			}
			if ($options_arguments[ $option_id ] == true) {
				++$i;
				if ($i >= $nb_args) {
					return "argument for option $token is missing";
				}
				$argument = $argv[$i];
			}
			$token = $options_short[ $option_id ];
		}
		
		$result[ $token ] = $argument;
		++$i;
		
	}
	
	
	return $result;
}
?>
