/*
    asm_saxpy32 helps compare different implementations of the saxpy
    function that computes the sum of a constant 'alpha' that is
    multiplied by the variable 'x' and added to the variable 'y'.
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
#include <cmath>
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

// vectors
f32 *x, *y;
// identifier of function to test
u32 method_id = 1;
// size of vectors
u32 size = 131075;
// number of iterations
u32 zillions = 100000;
// tells if we need to report number of available methods
bool methods_count_flag = false;
// perform test ?
bool test_flag = false;
// methods not to test
set<u32> test_avoid;
// select method by name
string select_by_name = "";
// print vectors
bool verbose_flag = false;

// ==================================================================
// Assembly methods
// ==================================================================

extern "C" {
	f32 saxpy_fpu(f32 *x, f32 *y, f32 a, u32 size);
	f32 saxpy_fpu_u4(f32 *x, f32 *y, f32 a, u32 size);
	f32 saxpy_sse(f32 *x, f32 *y, f32 a, u32 size);
	f32 saxpy_avx(f32 *x, f32 *y, f32 a, u32 size);
	f32 saxpy_avx2_u2(f32 *x, f32 *y, f32 a, u32 size);
	f32 saxpy_avx2_u4(f32 *x, f32 *y, f32 a, u32 size);
    
	f32 saxpy_fma(f32 *x, f32 *y, f32 a, u32 size);
}

extern f32 saxpy_avx2_intrinsics(f32 *x, f32 *y, f32 a, u32 size);
extern f32 saxpy_avx2_ez_ii(f32 *x, f32 *y, f32 a, u32 size);
extern f32 saxpy_avx2_fma_ez_ii(f32 *x, f32 *y, f32 a, u32 size);

#ifdef CPU_AVX512_COMPLIANT
extern f32 saxpy_avx512_intrinsics(f32 *x, f32 *y, f32 a, u32 size);
extern f32 saxpy_avx512_fma_intrinsics(f32 *x, f32 *y, f32 a, u32 size);
#endif

void print_vector(string name, f32 *v, u32 sz) {
	cout << "Vector " << name << endl;
	for (u32 i=0; i<sz; ++i) {
		cout << v[i] << " ";
	}
	cout << endl;
}

/**
 * Allocation of resources
 */
void allocate_resources() {
	x = (f32 *) _mm_malloc(size * sizeof(f32), CPU_MEMORY_ALIGNMENT);
	y = (f32 *) _mm_malloc(size * sizeof(f32), CPU_MEMORY_ALIGNMENT);
	cout << hex;
	cout << "x=" << (u32 *) x << endl;
	cout << "y=" << (u32 *) y << endl;
	cout << dec;
	
	// initialize vectors
	for (u32 i = 0; i < size; ++i) {
		x[i] = 1.05;
		y[i] = 1.2;
	}
	if (size > 0) x[0] = 2.3;
	if (size > 3) x[3] = 5.4;
}

/**
 * free resources
 */
void free_resources() {
	_mm_free(x);
	_mm_free(y);
}
	
/**
 * Reference method
 * @return sum of y[i]'s, where y[i] = a * x[i] + y[i]
 * @param x first vector
 * @param y second vector
 * @param a constant
 * @param size size of vectors 
 */
f32 saxpy_c(f32 *x, f32 *y, f32 a, u32 size) {
	f32 sum = 0.0;
	for (u32 i = 0; i < size; ++i) {
		y[i] = a * x[i] + y[i];
		sum += y[i];
	}
	return sum;
}

#if defined( __INTEL_COMPILER )
    #define RESTRICT restrict
#elif defined( __clang__ )
    #define RESTRICT __restrict__
#elif defined( __PGIC__ )
    #define RESTRICT __restrict__
#elif defined( __GNUC__ )
    #define RESTRICT __restrict__
#endif

/**
 * Reference method with intrinsics
 */
f32 saxpy_sse_intrinsics(f32 * RESTRICT x, f32 * RESTRICT  y, f32 a, u32 size) {
	__m128 vs, vx, vy, va, vz;
	
	x = (f32 *) __builtin_assume_aligned(x, 16);
	y = (f32 *) __builtin_assume_aligned(y, 16);
	
	vs = (__m128) _mm_setzero_si128();
	va = (__m128) _mm_set_ps1(a);
		
	size_t i;
	for (i = 0; i<(size & ~3) ; i += 4) {
			vx = _mm_load_ps(&x[i]);
			vy = _mm_load_ps(&y[i]);
			vz = _mm_mul_ps(vx, va);
			vz = _mm_add_ps(vz, vy);
			_mm_store_ps(&y[i], vz);
			vs = _mm_add_ps(vs, vz);
	}
	
	vs = _mm_hadd_ps(vs, vs);
	vs = _mm_hadd_ps(vs, vs);

	float sum = 0;
	_mm_store_ss(&sum, vs);
	
	while (i < size) {
		y[i] = a * x[i] + y[i];
		sum += y[i];
		++i;
	}
	return sum;
}

// ==================================================================
// array of methods to test
// ==================================================================
MethodDeclaration methods[] = {
	{ nullptr, "not defined" },
	add_method(saxpy_c),
	add_method(saxpy_fpu), 
	add_method(saxpy_fpu_u4), 
	add_method(saxpy_sse), 
	add_method(saxpy_sse_intrinsics),	
	add_method(saxpy_avx), 
	add_method(saxpy_avx2_u2), 
	add_method(saxpy_avx2_u4), 
	add_method(saxpy_avx2_intrinsics),
	add_method(saxpy_avx2_ez_ii),
	add_method(saxpy_fma), 
	add_method(saxpy_avx2_fma_ez_ii),
#ifdef CPU_AVX512_COMPLIANT
	add_method(saxpy_avx512_intrinsics),
	add_method(saxpy_avx512_fma_intrinsics),
#endif
	{ nullptr, "not defined" }
};

/**
 * check if optimized function written in x86 assembly provides
 * same result as the reference function written in C
 */
void validity_test(f32 *x, f32 *y, u32 size) {
	cout << "test" << endl;
	
	f32 *y_copy = (f32 *) _mm_malloc(size * sizeof(f32), 16);
	memcpy(y_copy, y, size * sizeof(f32));
		
	CPUTimer timer;
	timer.start();
	
	//f32 r_expected = methods[1].method(x, y, 0.75, size);
	f32 r_expected = methods[1].method(x, y, 1.0, size);  
	if (verbose_flag) print_vector("y", y, size);
	
	timer.stop();
	
	cout << 1 << " " << setw(25) << methods[1].name << " ";
	cout << setw(20) << timer << " " << r_expected << " ";
	cout << endl;
	
	
	for (u32 i = 2; methods[i].method != nullptr; ++i) {
		if (test_avoid.find(i) != test_avoid.end()) continue;
		
		memcpy(y, y_copy, size * sizeof(f32));
		timer.start();
		//f32 r_computed = methods[i].method(x, y, 0.75, size);
		f32 r_computed = methods[i].method(x, y, 1.0, size);
		timer.stop();
		cout << i << " " << setw(25) << methods[i].name << " ";
		cout << setw(20) << timer << " " << r_computed;
		
		if (fabs(r_computed - r_expected) < 1e-4) {
			cout << " OK";
		} else {
			cout << " !!! FAIL !!! ";
			cout << " expected=" << r_expected;
			cout << ",computed=" << r_computed;
			cout << ",diff=" << fabs(r_computed - r_expected);
		}
		if (verbose_flag) print_vector("y", y, size);
		cout << endl;
	}
	free_resources();
	_mm_free(y_copy);
	exit(EXIT_SUCCESS);
	
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
	cout << "\tcompute a variant of SAXPY" << endl << endl;

	cout << b_option << "-h, --help" << e_option;
	cout << "this message" << endl << endl;

	cout << b_option << "-c, --copying" << e_option;
	cout << "print GNU GPL" << endl << endl;
	
	cout << b_option << "-l, --list" << e_option;
	cout << "list all methods" << endl << endl;

	cout << b_option << "-m, --method=INT" << e_option;
	cout << "method used to perform SAXPY" << endl << endl;
	
	cout << b_option << "-n, --name=STRING" << e_option;
	cout << "select method given its name" << endl << endl;
        
	cout << b_option << "-s, --size=INT" << e_option;
	cout << "size of vector" << endl << endl;

	cout << b_option << "-t, --test" << e_option;
	cout << "test of all functions" << endl << endl;
	
	cout << b_option << "-a, --avoid" << e_option;
	cout << "comma separated list of method not to test" << endl << endl;
	
	cout << b_option << "-z, --zillions=INT" << e_option;
	cout << "number of times the method is repeated" << endl << endl;

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
	
	string program_name = "asm_saxpy32";
	gnu_header(program_name);
	
	// get parameters
	while (1) {
		int option_index = 0;
		static struct option long_options[] = {
			OPTION_NO_ARG("help", 'h'),
			OPTION_NO_ARG("list", 'l'),
			OPTION_NO_ARG("copying", 'c'),
			OPTION_ARG("method", 'm'),
			OPTION_ARG("method-name", 'n'),
			OPTION_ARG("size", 's'),
			OPTION_ARG("zillions", 'z'),
			OPTION_NO_ARG("test", 't'),
			OPTION_ARG("avoid", 'a'),
			OPTION_NO_ARG("verbose", 'v'),
			{0, 0, 0, 0 }
		};

		int c = getopt_long(argc, argv, "hctvlm:n:s:z:a:", long_options, &option_index);
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

			case 'm':
				method_id = atoi(optarg);
				break;

			case 'z':
				zillions = atoi(optarg);
				break;
				
			case 'l':
				list_methods();
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

	report_compiler();
		
	// allocation of vectors
	allocate_resources();

	cout << "size=" << size << endl;
	
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
	
	cout << "zillions=" << zillions << endl;
	
	if (test_flag) {
		validity_test(x, y, size);
	}
	
	// performance test with zillions iterations
	CPUTimer timer;
	timer.start();
	f32 r = 0.0;
	for (u32 z = 1; z <= zillions; ++z) {
		r = methods[method_id].method(x, y, 0.75, size);
	}
	timer.stop();
	cout << "cycles=" << timer << endl;
	cout << "result=" << r << endl;
	cout << "method.name=" << methods[method_id].name << endl;
	
	if (verbose_flag) {
		print_vector("x", x, size);
		print_vector("y", y, size);
	}
	free_resources();
			
	return EXIT_SUCCESS;
}
