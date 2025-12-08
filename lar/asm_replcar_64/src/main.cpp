/*
    asm_replcar64 helps compare different implementations of the 
    function that replaces a character 'c' by another character
    'd' in a string.
    This is the 64 bits version.
    
    Copyright (C) 2019  Jean-Michel RICHER

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

	Contact: jean-michel.richer@univ-angers.fr
	
 */
#include <iostream>
#include <sstream>
#include <string>
#include <cstdlib>
#include <getopt.h>
#include <xmmintrin.h>
#include <stdint.h>
#include <cstring>
#include <iomanip>
#include <set>
using namespace std;
#include "cpu_timer.h"
#include "signal_handler.h"
#include "cpp_config.h"
#include "common.h"
#include "gnu_gpl.h"

#ifdef __PGIC__
#include <mm_malloc.h>
#endif

void report_compiler() {
#if defined( __INTEL_COMPILER )
    cout << "compiler=intel" << endl;
#elif defined( __clang__ )
    cout << "compiler=llvm" << endl;
#elif defined( __PGIC__ )
    cout << "compiler=pgi" << endl;                
#elif defined( __GNUC__ )
    cout << "compiler=gnu" << endl;
#else
	cout << "compiler=unknown" << endl;
#endif
}


// ==================================================================
// GLOBAL VARIABLES
// ==================================================================
// strings
const int MAX_STRINGS = 100;
char **strings_src;
char **strings_dst;
// default size (should be multiple of 32
u32  size = 256000;
// default method
u32 method_id = 1;
// number of iterations
u32 zillions = 1000;
// perform test ?
bool test_flag = false;
// methods not to test
set<u32> test_avoid;
// select method by name
string select_by_name = "";
// pattern used to fill
u32 pattern = 2;
// verbose mode
bool verbose_flag = false;
// estimate method for all patterns 0 to 16
bool estimate_flag = false;

char fill_patterns[][16] = {
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, // 0
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, // 1
		{ 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, // 2
		{ 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },  // 5
		{ 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },	// 16
		{ 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
		{ 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0 }  // 18
};

// ==================================================================
// Assembly methods
// ==================================================================
extern "C" {
	u32 chr_repl_sse20(u8 *dst, u8 *src, u32 size, u8 c, u8 d);
	u32 chr_repl_sse20_u2(u8 *dst, u8 *src, u32 size, u8 c, u8 d);
	u32 chr_repl_sse20_u2_switch(u8 *dst, u8 *src, u32 size, u8 c, u8 d);
	u32 chr_repl_avx20(u8 *dst, u8 *src, u32 size, u8 c, u8 d);
	u32 chr_repl_avx20_u2(u8 *dst, u8 *src, u32 size, u8 c, u8 d);
}

// ==================================================================
// Other external methods
// ==================================================================
extern u32 chr_repl_ref_O2(u8 *dst, u8 *src, u32 size, u8 c, u8 d);


/**
 * Allocation of resources
 */
void allocate_resources() {
	srand(19702013);
	
	strings_src = (char **) _mm_malloc(MAX_STRINGS * sizeof(char *), CPU_MEMORY_ALIGNMENT);
	strings_dst = (char **) _mm_malloc(MAX_STRINGS * sizeof(char *), CPU_MEMORY_ALIGNMENT);
	for (int i=0; i<MAX_STRINGS; ++i) {
		char *s = (char *) _mm_malloc(size, sizeof(char) * CPU_MEMORY_ALIGNMENT);
		for (u32 j=0; j<size; ++j) {
			if (fill_patterns[pattern][j % 16]==1) {
				s[j] = 'A';
			} else {
				s[j] = 'B' + rand() % 25;
			}
		}
		strings_src[i] = s;
		strings_dst[i] = (char *) _mm_malloc(size, sizeof(char) * CPU_MEMORY_ALIGNMENT);
	}
}

/**
 * free resources
 */
void free_resources() {
	for (int i=0; i<MAX_STRINGS; ++i) {
		_mm_free(strings_src[i]);
		_mm_free(strings_dst[i]);
	}
	_mm_free(strings_src);
	_mm_free(strings_dst);
}


/**
 * Reference function that will be compiled using -O3 compilation
 * flag and other vector related flags depending on the architecture
 * @param dst destination string
 * @param src source string
 * @param size size of source and destination strings
 * @param c character to look for
 * @param d character that will replace c in destination string
 * @return number of replacements
 */
u32 chr_repl_reference(u8 *dst, u8 *src, u32 size, u8 c, u8 d) {
	// number of replacements
	u32 nbr_replacements = 0;

	for (u32 i=0; i<size; ++i) {
		if (src[i] == c) {
			dst[i] = d;
			++nbr_replacements;
		} else {
			dst[i] = src[i];
		}
	}
	return nbr_replacements;
}



// ==================================================================
// array of methods to test
// ==================================================================
MethodDeclaration methods[] = {
	{ nullptr, "not defined" },
	add_method(chr_repl_reference),
	add_method(chr_repl_ref_O2),
	add_method(chr_repl_sse20),
	add_method(chr_repl_sse20_u2),
	add_method(chr_repl_sse20_u2_switch),
	add_method(chr_repl_avx20),
	add_method(chr_repl_avx20_u2),
	{ nullptr, "not defined" },
};	

/**
 * check if the two arrays that count the number of occurrences
 * of the vowels are equal, if not return the index where they 
 * differ
 * @param v array of 6 unsigned int
 * @param w array of 6 unsigned int
 * @param index index where the array differ
 * @return true if arrays are equal, false otherwise
 */
bool are_equal(u32 *v, u32 *w, u32 &index) {
	for (u32 i = 0; i < 6; ++i) {
		if (v[i] != w[i]) {
			index = i;
			return false;
		}
	}
	return true;
}

/**
 * return number of methods
 * @return number of methods
 */
u32 methods_count() {
	u32 i = 1;
	while (methods[i].method != nullptr) ++i;
	return i-1;
}

/**
 * print string of characters
 * @param s string to print, note the the string is not terminated
 *        by a null character '\0'
 * @param size size of string in numbers of characters
 */
void print(char *s, u32 size) {
	for (u32 i = 0; i < size; ++i) cout << s[i];
}

/**
 * list methods and print the number of the method (id)
 * and the name of the method
 */
void list_methods() {
	u32 i;
	for (i = 1; methods[i].method != nullptr; ++i) {
		cout << "method.id=" << i << ",method.name=" << methods[i].name << endl;
	}
	cout << "methods.count=" << i-1 << endl;
	report_compiler();
	exit(EXIT_SUCCESS);
}

/**
 * check if two strings are equal and if they differ return
 * the index 
 * @param s first string
 * @param t second string
 * @param size size of strings in number of characters
 * @param index index where strings differ
 * @return true if strings are equal, false otherwise
 */
bool are_equal(u8 *s, u8 *t, u32 size, u32& index) {
	for (u32 i = 0; i < size; ++i) {
		if (s[i] != t[i]) {
			cout << "FAILURE AT " << i << endl;
			cout << "s[i] = " << (u32) s[i] << endl;
			cout << "t[i] = " << (u32) t[i] << endl;
			index = i;
			return false;
		}
	}
	return true;
}

/**
 * check if optimized function written in x86 assembly provides
 * same result as the reference function written in C
 */
void validity_test() {
	cout << "test" << endl;
	
	if (verbose_flag) {
		cout << "src="; 
		print(strings_src[0], size);
		cout << endl;
	}
	
	CPUTimer timer;
	timer.start();
	u32 total_ref = chr_repl_reference((u8 *)strings_dst[0], (u8 *)strings_src[0], size, 'A', 'B');
	timer.stop();
	cout << 1 << " " << setw(25) << methods[1].name ;
	cout << setw(20) << timer << " " << total_ref << " ";
	if (verbose_flag) print(strings_dst[0], size);
	
	cout << endl;
	
	for (u32 i = 2; methods[i].method != nullptr; ++i) {
		if (test_avoid.find(i) != test_avoid.end()) continue;
		
		timer.start();
		u32 total_cpt = methods[i].method((u8 *)strings_dst[1], (u8 *)strings_src[0], size, 'A', 'B');
		timer.stop();
		cout << i << " " << setw(25) << methods[i].name;  
		cout << setw(20) << timer << " " << total_cpt << " ";
		if (verbose_flag) print(strings_dst[1], size);
		
		// compare results
		u32 index = 0;
		if (are_equal((u8 *)strings_dst[0], (u8 *)strings_dst[1], size, index)) {
			cout << " OK" << endl;
		} else {
			cout << " !!! FAIL !!! at index=" << index << endl;
			for (u32 j = 0; j < 128; ++j) {
				cout << strings_src[0][j];
			}
			cout << endl;
			for (u32 j = 0; j < 128; ++j) {
				cout << strings_dst[0][j];
			}
			cout << endl;
			for (u32 j = 0; j < 128; ++j) {
				cout << strings_dst[1][j];
			}
			cout << endl;
			
		}
	}
	exit(EXIT_SUCCESS);
}

// estimate time for one method for all patterns 0 to 16
void estimate() {
	CPUTimer timer;
	
	for (int pattern = 0; pattern <= 16; ++pattern) {
		timer.start();
		u32 total_cpt = methods[method_id].method((u8 *)strings_dst[1], (u8 *)strings_src[0], size, 'A', 'B');
		timer.stop();
		cout << pattern << " " << setw(20) << timer << endl;
	}
	exit(EXIT_SUCCESS);
}

/**
 * description of arguments of program
 */ 
void usage(string program_name) {
	size_t pos = program_name.find_last_of("/");
	if (pos != string::npos) program_name = program_name.substr(pos+1);
	
	string b_bold = "\e[1m";
	string e_bold = "\e[0m";
	string b_option = "\t\e[1m";
	string e_option = "\e[0m\n\t\t";
	
	cout << b_bold << "NAME" << e_bold << endl;
	cout << "\t" << program_name << endl << endl;
	cout << b_bold << "SYNOPSIS" << e_bold << endl;
	cout << "\t" << program_name << " [OPTION]..." << endl << endl;
	cout << b_bold << "DESCRIPTION" << e_bold << endl;
	cout << "\tcount vowels in a string" << endl << endl;

	cout << b_option << "-h, --help" << e_option;
	cout << "this message" << endl << endl;

	cout << b_option << "-c, --copying" << e_option;
	cout << "print GNU GPL" << endl << endl;
	
	cout << b_option << "-l, --list" << e_option;
	cout << "list all methods" << endl << endl;
	
	cout << b_option << "-m, --method=INT" << e_option;
	cout << "method used to count vowels" << endl << endl;

	cout << b_option << "-n, --name=STRING" << e_option;
	cout << "select method given its name" << endl << endl;

	cout << b_option << "-p, --pattern=INT" << e_option;
	cout << "select pattern that fills strings" << endl << endl;
	
	cout << b_option << "-s, --size=INT" << e_option;
	cout << "size of string used" << endl << endl;
	
	cout << b_option << "-t, --test" << e_option;
	cout << "test of all functions for validity" << endl << endl;
	
	cout << b_option << "-a, --avoid" << e_option;
	cout << "comma separated list of method not to test" << endl << endl;
	
	cout << b_option << "-v, --verbose" << e_option;
	cout << "verbose mode" << endl << endl;

	cout << b_option << "-z, --zillions=INT" << e_option;
	cout << "number of times the method is repeated" << endl << endl;
	
	exit(EXIT_SUCCESS);
}

/**
 *  Transform comma separated values string into a set of integers
 */
void tokenize(set<u32> &tokens, string s, char delimiter=',') {
	string token;
	if (s.length() == 0) return ;
	if (s[0] == '=') s.replace(0, 1, "");
	istringstream iss(s);

   while (std::getline(iss, token, delimiter)) {
      tokens.insert(std::stoi(token));
   }
   
}

/**
 * main method
 */
int main(int argc, char *argv[]) {
	SignalHandler sh;
	
	string program_name = "asm_replcar64";
	gnu_header(program_name);

	// get parameters
	while (1) {
		int option_index = 0;
		static struct option long_options[] = {
			OPTION_NO_ARG("help", 'h'),
			OPTION_NO_ARG("copying", 'c'),
			OPTION_NO_ARG("list", 'l'),
			OPTION_ARG("method", 'm'),
			OPTION_ARG("method-name", 'n'),
			OPTION_ARG("pattern", 'p'),
			OPTION_ARG("size", 's'),
			OPTION_NO_ARG("test", 't'),
			OPTION_ARG("avoid", 'a'),
			OPTION_NO_ARG("verbose", 'v'),
			OPTION_ARG("zillions", 'z'),
			OPTION_ARG("estimate", 'e'),
			{0, 0, 0, 0 }
		};

		int c = getopt_long(argc, argv, "hcelm:n:p:s:tvz:a:", long_options, &option_index);
		if (c == -1) break;

		switch (c) {
			case 0:
               cerr << "option " << long_options[option_index].name;
				if (optarg) {
					cerr << " with arg " << optarg;
				}		
				cerr << endl;
				break;

			case 'h':
				usage(argv[0]); 
				break;
				
			case 'c':
				gnu_gpl(program_name);
				break;	
				
			case 'l':
				list_methods();
				break;
				
			case 'e':
				estimate_flag = true;
				break;
						
			case 'p':
				pattern = static_cast<u32>(atoi(optarg));
				break;
				
			case 's':
				size = static_cast<u32>(atoi(optarg));
				break;

			case 'm':
				method_id = static_cast<u32>(atoi(optarg));
				break;

			case 'n':
				select_by_name = optarg;
				break;
					
			case 't':
				test_flag = true;
				break;
			
			case 'a':
				tokenize(test_avoid, optarg);
				break;	
				
			case 'v':
				verbose_flag = true;
				break;	
				
			case 'z':
				zillions = static_cast<u32>(atoi(optarg));
				break;
				
			default:
				cerr << "Error ! Check command line arguments !" << endl;
				exit(EXIT_FAILURE);		
		};		
	}	
	
	// check parameters
	if ((method_id < 1) || (method_id > methods_count())) {
		cerr << "method should be inside [1.." << methods_count() << "]" << endl;
		exit(EXIT_FAILURE);
	}
	
	if (pattern > 18) {
		cerr << "pattern must be between 0 and 18" << endl;
		exit(EXIT_FAILURE);
	}
	
	if (zillions == 0) {
		zillions = 1;
	}
	
	report_compiler();
	
	// allocation of string
	allocate_resources();
	
	if (select_by_name.length() != 0) {
		u32 id;
		for (id = 1; methods[id].method != nullptr; ++id) {
			if (methods[id].name == select_by_name) {
				break;
			}
		}
		if (methods[id].method == nullptr) {
			cerr << "There is no method of name '" << select_by_name << "'" << endl;
			exit(EXIT_FAILURE);
		} else {
			method_id = id;
		}
	}

	cout << "size=" << size << endl;
	
	if (test_flag) {
		validity_test();
	}
	
	if (estimate_flag) {
		estimate();
	}
		
	CPUTimer timer;
	timer.start();
	
	u32 total = 0;
	
	// repeat zillions times
	for (u32 z=0; z < zillions; ++z) {
		// repeat for maximum number of strings
		for (u32 i=0; i < MAX_STRINGS; ++i)  {
			if (verbose_flag) {
				cout << "src[" << i << "]=";
				print(strings_src[i], size);
				cout << endl;
			}	
			total += methods[method_id].method((u8 *)strings_dst[i], (u8 *)strings_src[i], size, 'A', 'B');
			if (verbose_flag) {
				cout << "dst[" << i << "]=";
				print(strings_dst[i], size);
				cout << endl;
			}
		 }
	}
	timer.stop();
	
	cout << "cycles=" << timer << endl;
	cout << "method.name=" << methods[method_id].name << endl;
	cout << "total=" << total << endl;
	
	free_resources();
	
	return 0;
}
