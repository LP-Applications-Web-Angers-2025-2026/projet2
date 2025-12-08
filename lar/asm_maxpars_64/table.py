#!/usr/bin/python3
import math, sys, argparse
import numpy as np

def usage():
    menu = """
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
    """
    print(menu)
    sys.exit(1)


def main():
    try:
        short_options = "bc:d:e:f:hm:s:v"
        long_options = [ "best", "compiler", "device", "extra-data", "format", "highlight-minimum",
                        "method", "size", "verbose"]
        list_options, list_arguments = getopt.gnu_getopt(sys.argv[1:], short_options, long_options)
    except getopt.GetoptError as error:
        print(error)
        usage()
    
  
    try:
        for option, argument in list_options:
            if option == "-o" or options
            
    except ValueError as error:
        print(error)
        usage()
            
if __name__ == "__main__":
    main()
