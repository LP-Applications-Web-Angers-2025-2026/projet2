import os
import re
import sys
import shutil


def sprintf(buf, fmt, *args):
    buf.write(fmt % args)
    
line_cr = "\033[0K\r"
line_double = "=" * 40 + "\n"
line_single = "-" * 40 + "\n"
line_excmark = "!" * 40 + "\n"

def bold(s):
    return "\033[1m" + s + "\033[0m"

def red(s):
    return "\033[911m" + s + "\033[0m"
    
def green(s):
    return "\033[92m" + s + "\033[0m"
    
def grep_and_cut(input, pattern, cut, separator='='):
    if type(input) == str:
        arr = input.split('\n')
    else:
        arr = input
    for line in arr:
        grep = re.search(pattern, line)
        if grep is not None:
            x = line.split('=')
            return x[cut-1]
    return ""

def find_valid_methods(program, vparam, m_valid, m_names):
    print(bold("check methods execution..."))
    contents = "check methods execution..."
	
    input = os.popen(program + " --list").read()
    print(input)	
    methods_count = int( grep_and_cut(input, r"^methods.count=", 2) )
    print("count=" + str(methods_count))
    m_valid = { }
    m_names = { }

	# get names of method
    for method in range(1, methods_count+1):
        m_names[ method ] = grep_and_cut(input, r"^method.id=" + str(method) + ",", 3)
    
    # create array of methods that didn't raise an Illegal Instruction signal	
    for method in range(1, methods_count+1):
        command = program + " " + vparam + " -m " + str(method) + " 2>&1"
        output = os.popen(command).read()
        method_name = m_names[ method ]
        method_fmt = '%26s' % method_name
		
		# look for signal exception like SIGILL for illegal instruction
        if re.search(r"error SIG", output):
            print(" - method " + method_fmt + " " + bold(red("FAIL")) + " " + method_name)
            contents = contents + " - method " + method_fmt + " FAIL " + method_name + "\n"
            m_valid[ method ] = False
        else:
            s = " - method " + method_fmt + " " + bold(green("OK")) + " " + method_name
            print(s)
            contents = contents + " - method " + method_fmt + " OK   " + method_name + "\n"
            m_valid[ method ] = True

    return (m_names, m_valid, contents)

compute_average = True

project_output = os.popen("cat cfg/project.cfg").read()
print(project_output)
project_name = grep_and_cut(project_output, r"PROJECT_NAME", 2)
print('Project Name='+project_name)

program = "build/bin/" + project_name  + ".exe";
validation_parameters = grep_and_cut( project_output, r"VALIDATION_PARAMETERS", 2);
sizes = grep_and_cut( project_output, r"PERFORMANCE_TEST_SIZES", 2).split(',');

print(sizes)

# ==================================================================
# GLOBAL VARIABLES DECLARATION
# ==================================================================

cpu = os.popen("./cpu_name.sh").read()
print(bold("Current CPU is " + cpu));

print("program=" + program)
if shutil.which(program) is None:
        print(line_ecxmark)
        print("Program " + program + " does not exist")
        print("please run make")
        print(line_excmark) 
        os.exit(99)
        
# =======================================
# EXECUTE VALIDITY TEST AND CHECK OUTPUT
# =======================================

print( bold("perform validity test, please wait ...") );

#output = os.popen("php validity_test.php").read();
#$nbr_errors = intval( grep_and_cut($output, "/number_of_errors=/", 2) );        

compiler = os.popen(program  + " --list | grep \"^compiler=\" | cut -d'=' -f2").read()
output_dir = "results/" + cpu
if not os.path.isdir(output_dir):
    try:  
        os.mkdir(output_dir)
    except OSError:  
        print ("could not create directory %s" % output_dir)
    
methods_valid = []
methods_names = []

(methods_names, methods_valid, output) = find_valid_methods(program, validation_parameters, [], []) 


methods_count = len(methods_valid)
print(')===========')
print(methods_valid)
print(methods_names)
print(bold("there are " + str(sum(methods_valid.values())) + " methods"))
print(sum(methods_valid.values()))

print(line_single)

