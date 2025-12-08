/*
    asm_cmpack32 helps compare different implementations of the compact
    function
    
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
#include <cstdlib>
#include <xmmintrin.h>
#include <pmmintrin.h>
#include <stdint.h>
#include <cstring>
#include <iomanip>
#include <getopt.h>
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

// array of bytes
u8 *x; // input data
u8 *y; // output_data
u8 threshold = 128;
// identifier of method to test
u32 method_id = 1;
// size of vectors
u32 size = 131075;
// number of iterations
u32 zillions = 10000;
// perform test ?
bool test_flag = false;
// methods not to test
set<u32> test_avoid;
// if true return name of method
string select_by_name = "";
// verbose mode
bool verbose_flag = false;

// ==================================================================
// Assembly methods
// ==================================================================
extern "C" {
	u32 asm_cmpack_sse_v1(u8 *x, u8 *y, u32 size);
	u32 asm_cmpack_sse_v2(u8 *x, u8 *y, u32 size);
	u32 asm_cmpack_sse_compact(u8 *x, u8 *y, u32 size);
	u32 asm_cmpack_avx2(u8 *x, u8 *y, u32 size);
	u32 asm_cmpack_avx2_compact(u8 *x, u8 *y, u32 size);
}

// ==================================================================
// Other external methods
// ==================================================================


/**
 * Allocation and initialisation of resources
 */
void allocate_resources() {
	x = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	y = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	cout << hex;
	cout << "x=" << (u32 *) x << endl;
	cout << "y=" << (u32 *) y << endl;
	cout << dec;

	// initialize random number generator
	srand(19702013);
	
	// initialize
	for (u32 i = 0; i < size; ++i) {
		char v = rand() % 126;
		x[i] = ((i % 4) < 3) ? v : 129 + v;
	}
	memset(y, 0, size * sizeof(u8));
}

/**
 * free resources
 */ 
void free_resources() {
	_mm_free(x);
	_mm_free(y);
}


/**
 * reference function
 *
 * element y[i] is true if x[i] is greater than
 * threshold value and we count the number of
 * values set to true and return it as the result
 * of the function
 *
 * @param x input array
 * @param y output array
 * @param size size of input and output array 
 *
 * variable threshold is considered as global
 */
u32 cmpack_reference(u8 *x, u8 *y, u32 size) {
	u32 total = 0;
	
	for (u32 i = 0; i < size; ++i) {
		if (x[i] > threshold) {
			y[i] = 1;
			++total;
		}
		/*
		cout << "i=" << i;
		cout << " x[i]=" << hex << (int) x[i];
		cout << " y[i]=" << hex << (int) y[i];
		cout << " total=" << dec << total << endl;
		*/
	}
	return total;
}

/**
 * reference function rewritten to enable optimization
 *
 * element y[i] is true if x[i] is greater than
 * threshold value and we count the number of
 * values set to true and return it as the result
 * of the function.
 * we rewrite the inner part of the main loop.
 *
 * @param x input array
 * @param y output array
 * @param size size of input and output array 
 *
 * variable threshold is considered as global
 */
u32 cmpack_reference_rew(u8 *x, u8 *y, u32 size) {
	u32 total = 0;
	
	for (u32 i = 0; i < size; ++i) {
		y[i] = (x[i] > threshold) ? 1 : 0;
		total += static_cast<u32>(y[i]);
	}
	return total;
}


/**
 * reference function but with output as a compact
 * array of boolean i.e. each bit correponds to an
 * element of the output array so the output array
 * as a size of (size + 7) / 8 bytes
 *
 * element y[i] is true if x[i] is greater than
 * threshold value and we count the number of
 * values set to true and return it as the result
 * of the function.
 * we rewrite the inner part of the main loop.
 *
 * @param x input array
 * @param y output array
 * @param size size of input array 
 *
 * variable threshold is considered as global
 */
u32 cmpack_compact(u8 *x, u8 *y, u32 size) {
	// number of bits in a byte
	const u32 size_of_byte = 8;
	
	u32 total = 0;
	
	u32 i, j = 0;
	for (i = 0; i < (size & ~(size_of_byte-1)); i += 8) {
		u8 bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7;
		
		bit0 = (x[i+0] > threshold) ? 1 : 0;
		bit1 = (x[i+1] > threshold) ? 1 : 0;
		bit2 = (x[i+2] > threshold) ? 1 : 0;
		bit3 = (x[i+3] > threshold) ? 1 : 0;
		bit4 = (x[i+4] > threshold) ? 1 : 0;
		bit5 = (x[i+5] > threshold) ? 1 : 0;
		bit6 = (x[i+6] > threshold) ? 1 : 0;
		bit7 = (x[i+7] > threshold) ? 1 : 0;
		
		u8 byte = bit0 | (bit1 << 1) | (bit2 << 2) | (bit3 << 3) | 
			(bit4 << 4) | (bit5 << 5) | (bit6 << 6) | (bit7 << 7);
		y[j++] = byte;  
		total += __builtin_popcount(byte);
	}
	
	if (i < size) {
		u8 byte = 0;
		while (i < size) {
			u8 value = (x[i] > threshold) ? 1 : 0 ;
			byte |= value << (i & (size_of_byte-1));
			total += static_cast<u32>(value);
			++i;
		}
		y[j] = byte;
	}
	
	return total;
}


// ==================================================================
// array of methods to test
// ==================================================================
MethodDeclaration methods[] = {
	{ nullptr, "not defined" },
	add_method(cmpack_reference),
	add_method(cmpack_reference_rew),
	add_method(cmpack_compact),
	add_method(asm_cmpack_sse_v1),
	add_method(asm_cmpack_sse_v2),
	add_method(asm_cmpack_sse_compact),
	add_method(asm_cmpack_avx2),
	add_method(asm_cmpack_avx2_compact),
	{ nullptr, "not defined" }
};

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
 * compare to output array 
 *
 * @param v output array of bytes
 * @param w output array of bytes or in compact mode
 */
bool are_equal(u8 *v, u8 *w, u32 size, u32& index, bool compact) {
	for (u32 i = 0; i < size; ++i) {
		u8 value = 0;
			
		if (compact) {
			value = (w[i / 8]) & (1 << (i % 8));
			value = (value != 0) ? 1 : 0;
		} else {
			value = w[i];
		}
		
		if (v[i] != value) {
			cerr << " v[i]=" << (int) v[i];
			cerr << " w[i]=" << (int) w[i];
			cerr << " value=" << (int) value << endl;
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
	u8 *y2 = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	memset(y2, 0, size * sizeof(u8));
	
	CPUTimer timer;
	timer.start();
	u32 count_expected = methods[1].method(x, y, size); 
	timer.stop();
	
	cerr << setw(2) << 1 << " " << setw(25) << methods[1].name;
	cerr << setw(20) << timer << " " << count_expected << " ";
	cerr << endl;
	
	for (u32 i = 2; methods[i].method != nullptr; ++i) {
		if (test_avoid.find(i) != test_avoid.end()) continue;
		
		memset(y2, 0, size * sizeof(u8));
		timer.start();
		u32 count_computed = methods[i].method(x, y2, size);
		timer.stop();
		cerr << setw(2) << i << " " << setw(25) << methods[i].name;
		cerr << setw(20) << timer << " " << count_computed << " ";
		
		bool fail = false;
		
		fail = (count_computed != count_expected);
		
		u32 index = 0;
		bool compact = strstr(methods[i].name, "compact") != nullptr;
		if (!are_equal(y, y2, size, index, compact)) {
			cerr << " index " << index;
			fail = true;
		}

		if (!fail) {
			cerr << " OK";
		} else {
			cerr << " !!! FAIL !!!";
		}
		
		cerr << endl;
	}
	free_resources();
	_mm_free(y2);
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
	cout << "\ttest implementations of the popcnt function" << endl << endl;

	cout << b_option << "-h, --help" << e_option;
	cout << "this message" << endl << endl;

	cout << b_option << "-c, --copying" << e_option;
	cout << "print GNU GPL" << endl << endl;
	
	cout << b_option << "-l, --list" << e_option;
	cout << "list all methods" << endl << endl;
	
	cout << b_option << "-m, --method=INT" << e_option;
	cout << "version of Fitch method" << endl << endl;

	cout << b_option << "-n, --name=STRING" << e_option;
	cout << "select method given its name" << endl << endl;

	cout << b_option << "-s, --size=INT" << e_option;
	cout << "size of sequences" << endl << endl;

	cout << b_option << "-y, --threshold=BYTE" << e_option;
	cout << "thresold for values to compare by default 128" << endl << endl;

	cout << b_option << "-t, --test" << e_option;
	cout << "test of all methods" << endl << endl;
	
	cout << b_option << "-a, --avoid=LIST" << e_option;
	cout << "comma separated list of method not to test" << endl << endl;
	
	cout << b_option << "-z, --zillions=INT" << e_option;
	cout << "number of times the method is called" << endl << endl;

	cout << b_option << "-v, --verbose" << e_option;
	cout << "print matrices " << endl << endl;

	
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
 * main program
 */
int main(int argc, char *argv[]) {
	SignalHandler sh;
	
	string program_name = "asm_cmpack32";
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
			OPTION_ARG("size", 's'),
			OPTION_ARG("threshold", 'y'),
			OPTION_ARG("zillions", 'z'),
			OPTION_NO_ARG("test", 't'),
			OPTION_ARG("avoid", 'a'),
			OPTION_NO_ARG("verbose", 'v'),
			{0, 0, 0, 0 }
		};

		int c = getopt_long(argc, argv, "hcltvlm:s:z:a:y:", long_options, &option_index);
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
				
			case 's':
				size = static_cast<size_t>(atoi(optarg));
				break;
				
			case 'y':
				threshold = static_cast<u8>(static_cast<size_t>(atoi(optarg)) & 255);
				break;
				
			case 'l':
				list_methods();
				break;
				
			case 'm':
				method_id = atoi(optarg);
				break;
							
			case 'n':
				select_by_name = optarg;
				break;

			case 'z':
				zillions = atoi(optarg);
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
	
	if (zillions == 0) {
		zillions = 1;
	}
	
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
	
	report_compiler();
	
	// allocation of sequences x, y and z
	allocate_resources();
	
	cout << "size=" << size << endl;
	
	if (test_flag) {
		if (test_avoid.find(1) != test_avoid.end()) {
			cerr << "Reference method (1) can not be removed from test" << endl;
			exit(EXIT_FAILURE);
		}
		validity_test();
	}
	
	// performance test with 10000 call to the method to test
	CPUTimer timer;
	timer.start();
	u32 total = 0;
	for (u32 zillion = 1; zillion <= zillions; ++zillion) {
		total = methods[method_id].method(x, y, size);
	}
	timer.stop();
	cout << "cycles=" << timer << endl;
	cout << "result=" << total << endl;
	cout << "method.name=" << methods[method_id].name << endl;
	
	free_resources();
			
	return EXIT_SUCCESS;
}
