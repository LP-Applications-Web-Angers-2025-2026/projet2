/*
    asm_vowels64 helps compare different implementations of the 
    function that counts the number of vowels (aeiouy) in a string.
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
// string
u8 *str = nullptr;
// default size (should be multiple of 64 for AVX512)
u32  size = 255999;
// default method
u32 method_id = 1;
// number of iterations
u32 zillions = 10000;
// perform test ?
bool test_flag = false;
// methods not to test
set<u32> test_avoid;
// select method by name
string select_by_name = "";
// verbose mode
bool verbose_flag = false;
// percentage of vowels produced when generating string contents
u32 vowels_ratio = 20;

// ==================================================================
// Assembly methods
// ==================================================================
extern "C" {
	void cv_letters_asm(u8 *s, u32 size, u32 v[6]);
	void cv_letters_asm_ur4_v1(u8 *s, u32 size, u32 v[6]);
	void cv_letters_asm_ur4_v2(u8 *s, u32 size, u32 v[6]);
	void cv_letters_asm_ur8_v1(u8 *s, u32 size, u32 v[6]);
	void cv_letters_asm_ur8_v2(u8 *s, u32 size, u32 v[6]);
	void cv_letters_asm_ur8_v3(u8 *s, u32 size, u32 v[6]);
	
	void cv_sse2_v1(u8 *s, u32 size, u32 v[6]);
	void cv_sse2_v2(u8 *s, u32 size, u32 v[6]);
	void cv_avx(u8 *s, u32 size, u32 v[6]);
	void cv_avx2_v1(u8 *s, u32 size, u32 v[6]);
	void cv_avx2_v2(u8 *s, u32 size, u32 v[6]);
	void cv_avx2_v3(u8 *s, u32 size, u32 v[6]);
	void cv_avx2_u2_v1(u8 *s, u32 size, u32 v[6]);
	void cv_avx2_u2_v2(u8 *s, u32 size, u32 v[6]);
    void cv_avx2_v2_u4(u8 *s, u32 size, u32 v[6]);
	void cv_avx2_v2_u8(u8 *s, u32 size, u32 v[6]);
	void cv_avx512_asm_v1(u8 *s, u32 size, u32 v[6]);
    void cv_avx512_asm_v2(u8 *s, u32 size, u32 v[6]);
	void cv_avx512_asm_v4(u8 *s, u32 size, u32 v[6]);
	void cv_avx512_asm_v5(u8 *s, u32 size, u32 v[6]);
	void cv_avx512_asm_v2_u8(u8 *s, u32 size, u32 v[6]);
	void cv_avx512_asm_v3_u8(u8 *s, u32 size, u32 v[6]);
}

extern void cv_sse2_intrinsics(u8 *s, u32 size, u32 v[6]);

extern void cv_avx2_intrinsics(u8 *s, u32 size, u32 v[6]);
extern void cv_avx512_intrinsics_v1(u8 *s, u32 size, u32 v[6]);
extern void cv_avx512_intrinsics_v2(u8 *s, u32 size, u32 v[6]);

/**
 * Allocation of resources
 */
void allocate_resources() {
	str = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	cout << hex;
	cout << "str=" << (u32 *) str << endl;
	cout << dec;

	// initialize random number generator
	srand(19702013);

	char sv[] = "aeiouy";
	char sc[] = "bcdfghjklmnpqrstvwxz";
	
	// fill string
	for (u32 i=0; i<size; ++i) {
		u32 percentage = rand() % 100;
		if (percentage < vowels_ratio) {	
			str[i] = sv[ rand() % 6];
		} else {
			str[i] = sc[ rand() % 20];
		}
	}
	
	if (verbose_flag) {
		int mini = (size < 32) ? size : 32;
		cout << "str.contents=";
		for (int i=0; i < mini; ++i) {
			cout << str[i];
		}
		cout << "..." << endl;
	}
}

/**
 * free resources
 */
void free_resources() {
	_mm_free(str);
}


/**
 * default method to count number of vowels in a string
 * using if then else
 * @param s string
 * @param size size of string
 * @param v array that contains the number of occurrences of
 *        each vowel
 */
void cv_if(u8 *s, u32 size, u32 v[6]) {
	for (u32 i=0; i<size; ++i) {
		if (s[i] == 'a') {
			++v[0];
		} else if (s[i] == 'e') {
			++v[1];
		} else if (s[i] == 'i') {
			++v[2];
		} else if (s[i] == 'o') {
			++v[3];
		} else if (s[i] == 'u') {
			++v[4];
		} else if (s[i] == 'y') {
			++v[5];
		}  
	}
}

/**
 * method to count number of vowels in a string using a switch
 * @param s string
 * @param size size of string
 * @param v array that contains the number of occurrences of
 *        each vowel
 */

void cv_switch(u8 *s, u32 size, u32 v[6]) {
	for (u32 i=0; i<size; ++i) {
		switch(s[i]) {
			case 'a': ++v[0]; break;
			case 'e': ++v[1]; break;			
			case 'i': ++v[2]; break;
			case 'o': ++v[3]; break;
			case 'u': ++v[4]; break;
			case 'y': ++v[5]; break;
		}  
	}
}

/**
 * method to count number of vowels in a string: all the
 * occurrences of the 26 letters are recorded
 * @param s string
 * @param size size of string
 * @param v array that contains the number of occurrences of
 *        each vowel
 */

void cv_letters(u8 *s, u32 size, u32 v[6]) {
	u32 letters[26];
	memset(letters, 0, 26*sizeof(u32));
	
	for (u32 i=0; i<size; ++i) {
		++letters[s[i]-'a'];
	}
	
	v[0] = letters['a'-'a'];
	v[1] = letters['e'-'a'];
	v[2] = letters['i'-'a'];
	v[3] = letters['o'-'a'];
	v[4] = letters['u'-'a'];
	v[5] = letters['y'-'a'];
	
}


// ==================================================================
// array of methods to test
// ==================================================================
MethodDeclaration methods[] = {
	{ nullptr, "not defined" },
	add_method(cv_if),
	add_method(cv_switch),
	add_method(cv_letters),
	
	add_method(cv_letters_asm),
	add_method(cv_letters_asm_ur4_v1),
	add_method(cv_letters_asm_ur4_v2),
	add_method(cv_letters_asm_ur8_v1),
	add_method(cv_letters_asm_ur8_v2),
	add_method(cv_letters_asm_ur8_v3),
	
	add_method(cv_sse2_v1),
	add_method(cv_sse2_v2),
	add_method(cv_sse2_intrinsics),
	add_method(cv_avx),
	add_method(cv_avx2_v1),
	add_method(cv_avx2_v2),
	add_method(cv_avx2_v3),
	add_method(cv_avx2_u2_v1),
	add_method(cv_avx2_u2_v2),
	add_method(cv_avx2_v2_u4),
	add_method(cv_avx2_v2_u8),
	add_method(cv_avx2_intrinsics),
//#ifdef CPU_AVX512_COMPLIANT	
	add_method(cv_avx512_asm_v1),
	add_method(cv_avx512_asm_v2),
	add_method(cv_avx512_asm_v4),
	add_method(cv_avx512_asm_v5),
	add_method(cv_avx512_asm_v2_u8),
	add_method(cv_avx512_asm_v3_u8),
	add_method(cv_avx512_intrinsics_v1),
	add_method(cv_avx512_intrinsics_v2),
//#endif	
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
 * check if optimized function written in x86 assembly provides
 * same result as the reference function written in C
 */
void validity_test() {
	cout << "test" << endl;
	
	u32 v[6] = { 0, 0, 0, 0, 0, 0};
	
	CPUTimer timer;
	timer.start();
	methods[1].method(str, size, v); 
	timer.stop();
	cout << 1 << " " << setw(35) << methods[1].name ;
	cout << setw(20) << timer ;
	for (u32 j = 0; j < 6; ++j) cout << "," << v[j];
	cout << endl;

	for (u32 i = 2; methods[i].method != nullptr; ++i) {
		if (test_avoid.find(i) != test_avoid.end()) continue;
		
		u32 w[6] = { 0,0,0,0,0,0 };
		
		timer.start();
		methods[i].method(str, size, w);
		timer.stop();
		
		cout << i << " " << setw(35) << methods[i].name;  
		cout << setw(20) << timer;
		for (u32 j = 0; j < 6; ++j) cout << "," << w[j];
		u32 ind;
		if (are_equal(v,w,ind)) {
			cout << " OK";
		} else {
			cout << " !!! FAIL !!! at index=" << ind << endl;
		}
		cout << endl;
	}
	
	free_resources();
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

	cout << b_option << "-r, --ratio=INT" << e_option;
	cout << "ratio of wowels, 20 means 20% of vowels" << endl << endl;
	
	cout << b_option << "-s, --size=INT" << e_option;
	cout << "size of string used" << endl << endl;
	
	cout << b_option << "-t, --test" << e_option;
	cout << "test of all functions for validity" << endl << endl;
	
	cout << b_option << "-a, --avoid=LIST" << e_option;
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

	string program_name = "asm_vowels64";
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
			OPTION_NO_ARG("test", 't'),
			OPTION_ARG("avoid", 'a'),
			OPTION_NO_ARG("verbose", 'v'),
			OPTION_ARG("zillions", 'z'),
			OPTION_ARG("ratio", 'r'),
			{0, 0, 0, 0 }
		};

		int c = getopt_long(argc, argv, "hlm:n:s:tvz:a:r:", long_options, &option_index);
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
				
			case 'r':
				vowels_ratio = static_cast<u32>(atoi(optarg));
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

	// vowels counts	
	u32 v[6] = { 0, 0, 0, 0, 0, 0};

	cout << "size=" << size << endl;
	
	if (test_flag) {
		validity_test();
	}
		
	CPUTimer timer;
	timer.start();
	
	// repeat zillions times
	for (u32 z=0; z < zillions; ++z) {
		// set counters to 0
		for (int i=0;i<6; ++i) v[i] = 0;
		
		// call method
		methods[method_id].method(str, size, v);
	}
	timer.stop();
	
	cout << "cycles=" << timer << endl;
	cout << "method.name=" << methods[method_id].name << endl;
	cout << "result=" << v[0];
	int total = v[0];
	for (int i=1; i<6; ++i) {
		cout << "," << v[i];
		total += v[i];
	}
	cout << endl;
	float percentage = (((float) total) / size) * 100.0;
	cout << "vowels.percentage=" << std::fixed << std::setprecision(2) << percentage << endl;
	
	free_resources();
	
	return 0;
}
