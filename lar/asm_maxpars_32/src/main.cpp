/*
    asm_maxpars_32 helps compare different implementations of the Fitch
    function used to solve the Maximum Parsimony problem in bioinformatics.
    This is the 32 bits version.
    
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

// sequences
u8 *x, *y, *z;
// identifier of method to test
u32 method_id = 1;
// size of vectors
u32 size = 131075;
// number of iterations
u32 zillions = 10000;
// perform test ?
bool test_flag = false;
// if true return name of method
string select_by_name = "";
// methods not to test
set<u32> test_avoid;
// verbose mode
bool verbose_flag = false;


// ==================================================================
// Assembly methods
// ==================================================================
extern "C" {
	u32 maxpars_asm(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_no_if_asm(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_no_if_opt_asm(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_no_if_opt_ur4_asm(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_no_if_opt_ur8_asm(u8 *x, u8 *y, u8 *z, u32 size);
	
	u32 maxpars_movzx(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_sse2_v1(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_sse2_v2(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_sse2_u2(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_sse41(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_avx2(u8 *x, u8 *y, u8 *z, u32 size);
    u32 maxpars_avx2_v2(u8 *x, u8 *y, u8 *z, u32 size);
    u32 maxpars_avx2_v3(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_avx2_u2(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_avx2_u4_v1(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_avx2_u4_v2(u8 *x, u8 *y, u8 *z, u32 size);

#ifdef CPU_AVX512_COMPLIANT	
	u32 maxpars_avx512(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_avx512_u2(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_avx512_u8_dep(u8 *x, u8 *y, u8 *z, u32 size);
	u32 maxpars_avx512_u8_no_dep(u8 *x, u8 *y, u8 *z, u32 size);
#endif	
}



// ==================================================================
// Other external methods
// ==================================================================
extern u32 maxpars_ref_v1_O2(u8 *x, u8 *y, u8 *z, u32 size);
extern u32 maxpars_ref_v1_O3(u8 *x, u8 *y, u8 *z, u32 size);

extern u32 maxpars_ref_v2_O2(u8 *x, u8 *y, u8 *z, u32 size);
extern u32 maxpars_ref_v2_O3(u8 *x, u8 *y, u8 *z, u32 size);

extern u32 maxpars_ref_v3_O2(u8 *x, u8 *y, u8 *z, u32 size);
extern u32 maxpars_ref_v3_O3(u8 *x, u8 *y, u8 *z, u32 size);

extern u32 maxpars_ref_v4_O2(u8 *x, u8 *y, u8 *z, u32 size);
extern u32 maxpars_ref_v4_O3(u8 *x, u8 *y, u8 *z, u32 size);

extern u32 maxpars_avx2_intrinsics(u8 *x, u8 *y, u8 *z, u32 size);

#ifdef CPU_AVX512_COMPLIANT
extern u32 maxpars_avx512_intrinsics(u8 *x, u8 *y, u8 *z, u32 size);
#endif

/**
 * Allocation and initialisation of resources
 */
void allocate_resources() {
	x = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	y = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	z = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	cout << hex;
	cout << "x=" << (u32 *) x << endl;
	cout << "y=" << (u32 *) y << endl;
	cout << "z=" << (u32 *) z << endl;
	cout << dec;

	// initialize random number generator
	srand(19702013);
	
	u8 init_values[] = { 0x01, 0x02, 0x04, 0x08, 0x09, 0x0A, 0x0C };	

	// initialize
	for (u32 i = 0; i < size; ++i) {
		x[i] = init_values[rand() %  7];
		y[i] = init_values[rand() %  7];
	}
}

/**
 * free resources
 */
void free_resources() {
	_mm_free(x);
	_mm_free(y);
	_mm_free(z);
}


// ==================================================================
// array of methods to test
// ==================================================================
MethodDeclaration methods[] = {
	{ nullptr, "not defined" },
	add_method(maxpars_ref_v1_O2),
	add_method(maxpars_ref_v1_O3),
	add_method(maxpars_ref_v2_O2),
	add_method(maxpars_ref_v2_O3),
	add_method(maxpars_ref_v3_O2),
	add_method(maxpars_ref_v3_O3),
	add_method(maxpars_ref_v4_O2),
	add_method(maxpars_ref_v4_O3),
	add_method(maxpars_asm), 
	add_method(maxpars_no_if_asm),
	add_method(maxpars_no_if_opt_asm),
	add_method(maxpars_no_if_opt_ur4_asm),
	add_method(maxpars_no_if_opt_ur8_asm),
	add_method(maxpars_sse2_v1),
	add_method(maxpars_sse2_v2),  
	add_method(maxpars_sse2_u2), 
	add_method(maxpars_sse41),
	add_method(maxpars_avx2),
	add_method(maxpars_avx2_v2),
	add_method(maxpars_avx2_v3),
	add_method(maxpars_avx2_u2),
	add_method(maxpars_avx2_u4_v1),
	add_method(maxpars_avx2_u4_v2),
	add_method(maxpars_avx2_intrinsics),
#ifdef CPU_AVX512_COMPLIANT	
	add_method(maxpars_avx512),
	add_method(maxpars_avx512_u2),
	add_method(maxpars_avx512_u8_dep),
	add_method(maxpars_avx512_u8_no_dep),
	add_method(maxpars_avx512_intrinsics),
#endif	
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

bool are_equal(u8 *v, u8 *w, u32 size, u32& index) {
	for (u32 i = 0; i < size; ++i) {
		if (v[i] != w[i]) {
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
	u8 *z2 = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	
	CPUTimer timer;
	timer.start();
	u32 mutations_expected = methods[1].method(x, y, z, size); 
	timer.stop();
	
	cerr << 1 << "  " << setw(25) << methods[1].name << " ";
	cerr << setw(20) << timer << " " << mutations_expected << " ";
	cerr << endl;
	
	for (u32 i = 2; methods[i].method != nullptr; ++i) {
		if (test_avoid.find(i) != test_avoid.end()) continue;
		
		memset(z2, 0, size*sizeof(u8));
		timer.start();
		u32 mutations_computed = methods[i].method(x, y, z2, size);
		timer.stop();
		cerr << i << " ";
		if (i < 10) cout << " ";
		cout << setw(25) << methods[i].name << " ";
		cerr << setw(20) << timer << " " << mutations_computed << " ";
		
		if (mutations_computed == mutations_expected) {
			cerr << " OK for mutations";
		} else {
			cerr << " !!! FAIL for mutations !!!";
		}
				
		u32 index = 0;
		if (are_equal(z, z2, size, index)) {
			cerr << " OK";
		} else {
			u32 maxi = std::min(size, index+32);
			for (; index < maxi; ++index) {
				cerr << " !!! FAIL !!! at index " << index << " " ;
				cerr << (int) z[index] << " " << (int) z2[index];
				cerr << ", x=" << (int) x[index] << " y=" << (int) y[index];
				cerr << endl;
			}
		}
		cerr << endl;
	}
	free_resources();
	_mm_free(z2);
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
	cout << "\tcompute result of Fitch function" << endl << endl;

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
	
	string program_name = "asm_maxpars32";
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
			OPTION_ARG("zillions", 'z'),
			OPTION_NO_ARG("test", 't'),
			OPTION_ARG("avoid", 'a'),
			OPTION_NO_ARG("verbose", 'v'),
			{0, 0, 0, 0 }
		};

		int c = getopt_long(argc, argv, "hclm:n:s:z:ta:v", long_options, &option_index);
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
	
	if (size == 0) {
		cerr << "size should be greater than 0" << endl;
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
		validity_test();
	}
	
	// performance test with 10000 call to the method to test
	CPUTimer timer;
	timer.start();
	u32 mutations = 0;
	for (u32 zillion = 1; zillion <= zillions; ++zillion) {
		mutations = methods[method_id].method(x, y, z, size);
	}
	timer.stop();
	cout << "cycles=" << timer << endl;
	cout << "result=" << mutations << endl;
	cout << "method.name=" << methods[method_id].name << endl;
	
	free_resources();
			
	return EXIT_SUCCESS;
}
