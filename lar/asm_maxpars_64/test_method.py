import sys, getopt
import subprocess
import re
import numpy as np

def grep_and_cut(contents, needle, arg_number):
	for line in contents.split('\n'):
		expr = re.findall(needle, line)
		if len(expr) > 0:
			line = line.split("=")
			return line[arg_number-1]

def execute(method, size):
	command="/usr/bin/time -f time=%U build/bin/asm_maxpars_64.exe -s " + str(size) + " -m " + str(method) 
	args = command.split(' ')
	ls = []
	lc = []
	for i in range(10):	
		result = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
		shell_output = result.stdout.decode('utf-8')
		#print("###", shell_output, "###")
		cycles = float( grep_and_cut(shell_output, r"^cycles=", 2) )
		seconds = float( grep_and_cut(shell_output, r"^time=", 2) )
		print("%2d %20f %8.4f" % (i+1, cycles, seconds))
		lc.append(cycles)
		ls.append(seconds)

	return lc, ls
	
def main():
	"""
		fonction principale
		
		on peut passer en argument du programme la taille ou la méthode
	"""
	method = 1
	size = 524417
	try:
		opts, args = getopt.getopt(sys.argv[1:], "hs:m:", ["help", "size=", "method"])
	except getopt.GetoptError as err:
		# print help information and exit:
		print(err) # will print something like "option -a not recognized"
		usage()
		sys.exit(2)
	for o, a in opts:
		if o == "-m":
			method = int(a)
		elif o == "-s":
			size = int(a)	
		elif o in ("-h", "--help"):
			usage()
		else:
			assert False, "unhandled option"

	lc, ls = execute(method, size)
	nplc = np.array(lc)
	npls = np.array(ls)
	
	print( "moyenne (cycles) =", nplc.mean() )
	print( "moyenne (secondes) =", npls.mean() )


if __name__ == "__main__":
    main()

