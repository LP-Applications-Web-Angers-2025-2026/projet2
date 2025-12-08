import os
import re
import subprocess
import shlex
import sys
import shutil

compute_average = True

line_cr = "\033[0K\r" # carriage return
line_double = "=" *  40 
line_single = "-" * 40 
line_excmark = "!" *  40


def bold(s):
	return f"\033[1m" + s + "\033[0m"


def red(s):
	return f"\033[91m" + s + "\033[0m"


def green(s):
	return f"\033[92m" + s + "\033[0m"


def blue(s):
	return f"\033[34m" + s + "\033[0m"


def grep_and_cut(contents, needle, arg_number):
	for line in contents.split('\n'):
		expr = re.findall(needle, line)
		if len(expr) > 0:
			line = line.split("=")
			return line[arg_number-1]

def find_valid_methods(program, vparam):
	global methods_valid, methods_names
	
	print(bold("check methods execution..."))
	contents = "check methods execution..."
	
	result = subprocess.run([program, '--list'], stdout=subprocess.PIPE)
	shell_output = result.stdout.decode('utf-8')
	methods_count = int( grep_and_cut(shell_output, r"^methods.count=", 2) )

	methods_valid = {}
	methods_names = {}

	# get names of method
	for method in range(1,methods_count+1):
		methods_names[ method ] = grep_and_cut(shell_output, r"^method.id=%d," % method, 3)

	#print(methods_names)
	
	# create array of methods that didn't raise an Illegal Instruction signal	
	for method in range(1,methods_count+1):
		command = program + " " + vparam + " -m " + str(method) + " 2>&1"
		result = subprocess.run(command.split(' '), stdout=subprocess.PIPE)
		shell_output = result.stdout.decode('utf-8')

		method_name = methods_names[ method ]
		method_fmt = "%2d" % method
		
		# look for signal exception like SIGILL for illegal instruction
		matches = re.search(r"error SIG", shell_output)
		
		if matches is not None:
			print(" - method ", method_fmt , bold(red("FAIL")), method_name)
			#contents += " - method " + method_fmt + " FAIL " + method_name + "\n"
			methods_valid[ method ] = False
		else:
			print(" + method ", method_fmt, bold(green("OK")),  method_name)
			#contents += " + method " + method_fmt + " OK   " + method_name + "\n"
			methods_valid[ method ] = True

	return ""

def average_time(command, compute_average, nbr_times=10):

	output_file = "tmp/results_local.txt"
	try:
		os.remove(output_file)
	except:
		pass
	
	# execute program once
	script = "/usr/bin/time -f \"program.time=%U\" " + command + " 2>&1"
	result = subprocess.run(script, shell=True, stdout=subprocess.PIPE)
	shell_output = result.stdout.decode('utf-8')
	
	# check if something went wrong and report error for exemple
	# an illegal instruction executed
	matches = re.search( r"error SIG[ \S]+\n", shell_output)
	if matches is not None:
		return matches[0]
	
	#
	# otherwise take data into account
	#
	prog_extime = float( grep_and_cut(shell_output, r"^program.time=", 2) )
	prog_cycles = int( grep_and_cut(shell_output, r"^cycles=", 2) )

	# if don't compute average return execution time of first execution
	if compute_average == False:
		return str(prog_extime) + " " + str(prog_cycles)
	
	
	#
	if prog_extime > 4.0:
		return str(prog_extime) + " " + str(prog_cycles)
		
	
	extimes = [ prog_extime ]
	cycles  = [ prog_cycles ]
	
	for i in range(2, nbr_times+1):
		script = "/usr/bin/time -f \"program.time=%U\" " + command + " 2>&1"
		result = subprocess.run(script, shell=True, stdout=subprocess.PIPE)
		shell_output = result.stdout.decode('utf-8')
		
		prog_extime = float( grep_and_cut(shell_output, r"^program.time=", 2) )
		prog_cycles = int( grep_and_cut(shell_output, r"^cycles=", 2) )
		extimes.append(prog_extime)
		cycles.append(prog_cycles)

	
	prog_extime = sum(extimes) / len(extimes)
	prog_cycles = sum(cycles)  / len(cycles)	

	return str(prog_extime)+ " " +str(prog_cycles)




result = subprocess.run(['cat', 'cfg/project.cfg'], stdout=subprocess.PIPE)
project_output = result.stdout.decode('utf-8')
project_name = grep_and_cut( project_output, r"PROJECT_NAME", 2)
program = "build/bin/" + project_name + ".exe"
validation_parameters = grep_and_cut( project_output, r"VALIDATION_PARAMETERS", 2)
sizes = grep_and_cut(project_output, r"PERFORMANCE_TEST_SIZES", 2).split(",")
print(sizes)

# ==================================================================
# GLOBAL VARIABLES DECLARATION
# ==================================================================

result = subprocess.run(['./cpu_name.sh'], stdout=subprocess.PIPE)
shell_output = result.stdout.decode('utf-8')

cpu = shell_output.strip()
print( bold("Current CPU is " + cpu + "\n"))


if shutil.which(program) is None:
	print(line_excmark)
	print("Program ", program, " does not exist")
	print("Please run make")
	print(line_excmark)
	sys.exit(99)

# =======================================
# EXECUTE VALIDITY TEST AND CHECK OUTPUT
# =======================================

print(bold("perform validity test, please wait ..."))

result = subprocess.run(['php','validity_test.php'], stdout=subprocess.PIPE)
shell_output = result.stdout.decode('utf-8')

nbr_errors =  int (grep_and_cut(shell_output, r"number_of_errors=", 2) )

if nbr_errors != 0:
	print(line_excmark)
	print("Performance test will not be executed due to errors")
	print("when executing the validity test.")
	print("Please check your source code.")
	print(line_excmark)
	sys.exit(99)
else:
	print("validity test " + bold(green("OK")) )

result = subprocess.run([program, '--list', '|', 'grep', '\"^compiler=\"', '|', 'cut', "-d'='", '-f2'], stdout=subprocess.PIPE)
shell_output = result.stdout.decode('utf-8')

result = subprocess.run([ program, '-l'], stdout=subprocess.PIPE)
program_output = result.stdout.decode('utf-8')
compiler = grep_and_cut( program_output, r"^compiler=", 2)
                        
output_dir = "results/" + cpu
if not os.path.exists(output_dir):
	try:
		os.mkdirs( output_dir, Oo777 )
	except:	
		print("could not create directory:", output_dir)
		sys.exit(99)

# update methods_count
methods_valid = {}
methods_names = {}


output = find_valid_methods(program, validation_parameters) 
contents = output
#print(methods_valid)
methods_count = len([i for i in methods_valid.values() if i == True])

print(bold("there are " + str(len(methods_valid)) + " methods"))
print(bold("and " + str( methods_count) + " methods to test"))
print(line_single)


for method in methods_valid.keys():

	if methods_valid[ method ] == False:
		continue
	
	method_name = methods_names[ method ]
	output_file = output_dir + "/method_" + method_name + "_"  + compiler + ".gpd"

	try:
		os.remove(output_file)
	except:
		pass
	
	contents = ""
	
	print("results are send to ", output_file)
	print("------------------------------------------")
	print("    size | time (s) |               cycles")
	print("------------------------------------------")
	for size in sizes:
		command = program + " -m " + str(method) + " -s " + size;
		result = average_time(command, compute_average);
		
		matches = re.search(r"^error", result)
	
		if matches == None:
			arr = result.split(' ')
			prt = float(arr[0])
			prc = float(arr[1])
			
			contents += size + " " + str(prt) + " " + str(prc)
			size_fmt= "%8d" % int(size)
			prt_fmt= "%9.2f" % prt
			prc_fmt= "%20.2f" % prc
			print(size_fmt,  prt_fmt,  prc_fmt)

	#file_put_contents($output_file, $contents);

