/*
    asm_popcnt64 helps compare different implementations of population
    count function that counts the number of bits set to one in a word,
    double word or quad word.
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
u8 *x;
// identifier of method to test
u32 method_id = 1;
// size of vectors
u32 size = 131075;
// number of iterations
u32 zillions = 2000;
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
	u32 u8_asm_popcnt(u8 *x, u32 size);
	u32 u32_asm_popcnt(u8 *x, u32 size);
	u32 u64_asm_popcnt(u8 *x, u32 size);
	u32 u64_asm_popcnt_ur2(u8 *x, u32 size);
	u32 u64_asm_popcnt_ur4(u8 *x, u32 size);
	u32 u32_asm_popcnt_ur2(u8 *x, u32 size);
	u32 u32_asm_popcnt_ur4(u8 *x, u32 size);
	u32 u32_sse_popcnt(u8 *x, u32 size);
	u32 u32_avx2_popcnt_v1(u8 *x, u32 size);
    u32 u32_avx2_popcnt_v2(u8 *x, u32 size);
    u32 u32_avx2_popcnt_v3(u8 *x, u32 size);
}

// ==================================================================
// Other external methods
// ==================================================================


/**
 * Allocation and initialisation of resources
 */
void allocate_resources() {
	x = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	cout << hex;
	cout << "x=" << (u32 *) x << endl;
	cout << dec;

	// initialize random number generator
	srand(19702013);
	
	// initialize
	for (u32 i = 0; i < size; ++i) {
		x[i] = rand() % 255;
	}
}

/**
 * free resources
 */
void free_resources() {
	_mm_free(x);
}


// ===============================================================
// Popcnt functions for an element of the array
// ===============================================================

u32 popcnt_reference_u8(u8 x) {
	u32 count = 0;
	
	while (x) {
		if ((x & 1) != 0) ++count;
		x = x >> 1;
	}
	return count;
}

// supposed to be best when x is close to zero
u32 popcnt_wegner_u8(u8 x) {
    int count;
    
    for (count=0; x; count++)
        x &= x - 1;
    return count;
}

u32 popcnt_wegner_u32(u32 x) {
    int count;
    
    for (count=0; x; count++)
        x &= x - 1;
    return count;
}

const u32 m1  = 0x55555555; //binary: 0101...
const u32 m2  = 0x33333333; //binary: 00110011..
const u32 m4  = 0x0f0f0f0f; //binary:  4 zeros,  4 ones ...
const u32 m8  = 0x00ff00ff; //binary:  8 zeros,  8 ones ...
const u32 m16 = 0x0000ffff; //binary: 16 zeros, 16 ones ...
const u32 m32 = 0xffffffff; //binary: 32 zeros, 32 ones

u32 popcnt_shift_v1_u8(u8 x) {
    x = (x & m1 ) + ((x >>  1) & m1 ); //put count of each  2 bits into those  2 bits 
    x = (x & m2 ) + ((x >>  2) & m2 ); //put count of each  4 bits into those  4 bits 
    x = (x & m4 ) + ((x >>  4) & m4 ); //put count of each  8 bits into those  8 bits 
    return x;
}

u32 popcnt_shift_v1_u32(u32 x) {
    x = (x & m1 ) + ((x >>  1) & m1 ); //put count of each  2 bits into those  2 bits 
    x = (x & m2 ) + ((x >>  2) & m2 ); //put count of each  4 bits into those  4 bits 
    x = (x & m4 ) + ((x >>  4) & m4 ); //put count of each  8 bits into those  8 bits 
    x = (x & m8 ) + ((x >>  8) & m8 ); //put count of each 16 bits into those 16 bits 
    x = (x & m16) + ((x >> 16) & m16); //put count of each 32 bits into those 32 bits
    return x;
}
    
u32 popcnt_shift_v2_u8(u8 x) {
    x -= (x >> 1) & m1;             //put count of each 2 bits into those 2 bits
    x = (x & m2) + ((x >> 2) & m2); //put count of each 4 bits into those 4 bits 
    x = (x + (x >> 4)) & m4;        //put count of each 8 bits into those 8 bits 
    return x & 0x7f;
}

u32 popcnt_shift_v2_u32(u32 x) {
    x -= (x >> 1) & m1;             //put count of each 2 bits into those 2 bits
    x = (x & m2) + ((x >> 2) & m2); //put count of each 4 bits into those 4 bits 
    x = (x + (x >> 4)) & m4;        //put count of each 8 bits into those 8 bits 
    x += x >>  8;  //put count of each 16 bits into their lowest 8 bits
    x += x >> 16;  //put count of each 32 bits into their lowest 8 bits
    return x & 0x7f;
}

static const char *popcnt_table __attribute__((aligned(16))) =  
    "\0\1\1\2\1\2\2\3\1\2\2\3\2\3\3\4"	\
    "\1\2\2\3\2\3\3\4\2\3\3\4\3\4\4\5"		\
    "\1\2\2\3\2\3\3\4\2\3\3\4\3\4\4\5"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\1\2\2\3\2\3\3\4\2\3\3\4\3\4\4\5"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\3\4\4\5\4\5\5\6\4\5\5\6\5\6\6\7"		\
    "\1\2\2\3\2\3\3\4\2\3\3\4\3\4\4\5"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\3\4\4\5\4\5\5\6\4\5\5\6\5\6\6\7"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\3\4\4\5\4\5\5\6\4\5\5\6\5\6\6\7"		\
    "\3\4\4\5\4\5\5\6\4\5\5\6\5\6\6\7"		\
    "\4\5\5\6\5\6\6\7\5\6\6\7\6\7\7\10";
    
u32 popcnt_table_v1_u32(u32 x) {   
  u32 count = 0;
  do { 
	count += (u32) popcnt_table [x & 0xFF];
  } while ((x >>= 8)!=0);
  return count;
}

u32 popcnt_table_v2_u32(u32 x) {   
  u32 count = popcnt_table[ x & 0xFF ];
  x >>= 8;
  count +=  popcnt_table[x & 0xFF];
  x >>= 8;
  count +=  popcnt_table[x & 0xFF];
  x >>= 8;
  count +=  popcnt_table[x & 0xFF];
  return count;
}
// ===============================================================
// Popcnt functions for an array
// ===============================================================

u32 u8_popcnt_reference(u8 *x, u32 size) {
	u32 count = 0;
	
	for (u32 i = 0; i < size; ++i) count += popcnt_reference_u8(x[i]);
	return count;
}

u32 u8_popcnt_wegner(u8 *x, u32 size) {
	u32 count = 0;
	
	for (u32 i = 0; i < size; ++i) count += popcnt_wegner_u8(x[i]);
	return count;
}

u32 u32_popcnt_wegner(u8 *x, u32 size) {
	u32 count = 0;
	u32 i;
	u32 *y = (u32 *) x;
	
	for (i = 0; i < (size & ~3); i+=4) count += popcnt_wegner_u32(*y++);
	while (i < size) {
		count += popcnt_wegner_u8(x[i]);
		++i;
	}
	return count;
}

u32 u8_popcnt_shift_v1(u8 *x, u32 size) {
	u32 count = 0;
	
	for (u32 i = 0; i < size; ++i) count += popcnt_shift_v1_u8(x[i]);
	return count;
}

u32 u32_popcnt_shift_v1(u8 *x, u32 size) {
	u32 count = 0;
	u32 i;
	u32 *y = (u32 *) x;
	
	for (i = 0; i < (size & ~3); i+=4) count += popcnt_shift_v1_u32(*y++);
	while (i < size) {
		count += popcnt_shift_v1_u8(x[i]);
		++i;
	}
	return count;
}

u32 u8_popcnt_shift_v2(u8 *x, u32 size) {
	u32 count = 0;
	
	for (u32 i = 0; i < size; ++i) count += popcnt_shift_v2_u8(x[i]);
	return count;
}

u32 u32_popcnt_shift_v2(u8 *x, u32 size) {
	u32 count = 0;
	u32 i;
	u32 *y = (u32 *) x;
	
	for (i = 0; i < (size & ~3); i+=4) count += popcnt_shift_v2_u32(*y++);
	while (i < size) {
		count += popcnt_shift_v2_u8(x[i]);
		++i;
	}
	return count;
}

u32 u32_popcnt_table_v1(u8 *x, u32 size) {
	u32 count = 0;
	u32 i;
	u32 *y = (u32 *) x;
	
	for (i = 0; i < (size & ~3); i+=4) count += popcnt_table_v1_u32(*y++);
	while (i < size) {
		count += popcnt_table[ x[i] ];
		++i;
	}
	return count;
}


u32 u32_popcnt_table_v2(u8 *x, u32 size) {
	u32 count = 0;
	u32 i;
	u32 *y = (u32 *) x;
	
	for (i = 0; i < (size & ~3); i+=4) count += popcnt_table_v2_u32(*y++);
	while (i < size) {
		count += popcnt_table[ x[i] ];
		++i;
	}
	return count;
}

u32 lower_qword(__m128i v) {
	__m128i w;
	u32 r = _mm_cvtsi128_si32(v);
	w = _mm_shuffle_epi32(v, 1); 
	return r + _mm_cvtsi128_si32(w);
}

u32 higher_qword(__m128i v) {
	return lower_qword(_mm_unpackhi_epi64(v, v));
}

#ifdef __INTEL_COMPILER
u32 u8_popcnt_intrinsics(u8* restrict x, u32 size) {
#else
u32 u8_popcnt_intrinsics(u8* __restrict__ x, u32 size) {
#endif
	u32 i = 0;

#ifdef __INTEL_COMPILER
	__assume_aligned(x, CPU_MEMORY_ALIGNMENT);
	__assume(i%CPU_MEMORY_ALIGNMENT==0);
#endif
#if __GNU__ > 3 && (__GNUC_MINOR__ > 6)
	x = (u8 *) __builtin_assume_aligned(x, CPU_MEMORY_ALIGNMENT);
#endif

	const __m128i xm1  = _mm_set1_epi8(0x55);
	const __m128i xm2  = _mm_set1_epi8(0x33);
	const __m128i xm4 = _mm_set1_epi8(0x0f);

	__m128i acc = _mm_setzero_si128();

	for (i = 0; i < (size & ~63); i += 64) {
		__m128i partial = _mm_setzero_si128();
		
		{
		__m128i t1, t2, t3, t4;
		
		t1 = _mm_loadu_si128(reinterpret_cast<const __m128i*>(x + i)); 
		t2 = _mm_sub_epi8(t1, _mm_and_si128( _mm_srli_epi16(t1, 1), xm1) ); 
		t3 = _mm_add_epi8(_mm_and_si128(t2, xm2), _mm_and_si128( _mm_srli_epi16(t2, 2), xm2) ); 
		t4 = _mm_and_si128( _mm_add_epi8(t3, _mm_srli_epi16(t3, 4)),  xm4); 
		partial = _mm_add_epi8(partial, t4); 
		}
		
		{
		__m128i t1, t2, t3, t4;
		
		t1 = _mm_loadu_si128(reinterpret_cast<const __m128i*>(x + i + 16)); 
		t2 = _mm_sub_epi8(t1, _mm_and_si128( _mm_srli_epi16(t1, 1), xm1) ); 
		t3 = _mm_add_epi8(_mm_and_si128(t2, xm2), _mm_and_si128( _mm_srli_epi16(t2, 2), xm2) ); 
		t4 = _mm_and_si128( _mm_add_epi8(t3, _mm_srli_epi16(t3, 4)),  xm4); 
		partial = _mm_add_epi8(partial, t4); 
		}
		
		{
		__m128i t1, t2, t3, t4;
	
		t1 = _mm_loadu_si128(reinterpret_cast<const __m128i*>(x + i + 32)); 
		t2 = _mm_sub_epi8(t1, _mm_and_si128( _mm_srli_epi16(t1, 1), xm1) ); 
		t3 = _mm_add_epi8(_mm_and_si128(t2, xm2), _mm_and_si128( _mm_srli_epi16(t2, 2), xm2) ); 
		t4 = _mm_and_si128( _mm_add_epi8(t3, _mm_srli_epi16(t3, 4)),  xm4); 
		partial = _mm_add_epi8(partial, t4); 
		}
		
		{
		__m128i t1, t2, t3, t4;
		
		t1 = _mm_loadu_si128(reinterpret_cast<const __m128i*>(x + i + 48)); 
		t2 = _mm_sub_epi8(t1, _mm_and_si128( _mm_srli_epi16(t1, 1), xm1) ); 
		t3 = _mm_add_epi8(_mm_and_si128(t2, xm2), _mm_and_si128( _mm_srli_epi16(t2, 2), xm2) ); 
		t4 = _mm_and_si128( _mm_add_epi8(t3, _mm_srli_epi16(t3, 4)),  xm4);  
		partial = _mm_add_epi8(partial, t4); 
		}
		
		acc = _mm_add_epi64(acc, _mm_sad_epu8(partial, _mm_setzero_si128()));
	}
	
	u32 result = lower_qword(acc) + higher_qword(acc);

	for ( ; i < size; i++) {
		result += popcnt_table[ x[i] ];
	}

	return result;
}


// ==================================================================
// array of methods to test
// ==================================================================
MethodDeclaration methods[] = {
	{ nullptr, "not defined" },
	add_method(u8_popcnt_reference),
	add_method(u8_popcnt_wegner),
	add_method(u32_popcnt_wegner),
	add_method(u8_popcnt_shift_v1),
	add_method(u32_popcnt_shift_v1),
	add_method(u8_popcnt_shift_v2),
	add_method(u32_popcnt_shift_v2),
	add_method(u32_popcnt_table_v1),
	add_method(u32_popcnt_table_v2),
	add_method(u8_asm_popcnt),
	add_method(u32_asm_popcnt),
	add_method(u32_asm_popcnt_ur2),
	add_method(u32_asm_popcnt_ur4),
	add_method(u64_asm_popcnt),
	add_method(u64_asm_popcnt_ur2),
	add_method(u64_asm_popcnt_ur4),
	add_method(u32_sse_popcnt),	
	add_method(u32_avx2_popcnt_v1),
	add_method(u32_avx2_popcnt_v2),
	add_method(u32_avx2_popcnt_v3),
	add_method(u8_popcnt_intrinsics),
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
	u8 *x2 = (u8 *) _mm_malloc(size * sizeof(u8), CPU_MEMORY_ALIGNMENT);
	memcpy(x2, x, size * sizeof(u8));
	
	CPUTimer timer;
	timer.start();
	u32 count_expected = methods[1].method(x, size); 
	timer.stop();
	
	cerr << setw(2) << 1 << " " << setw(25) << methods[1].name;
	cerr << setw(20) << timer << " " << count_expected << " ";
	cerr << endl;
	
	for (u32 i = 2; methods[i].method != nullptr; ++i) {
		if (test_avoid.find(i) != test_avoid.end()) continue;
		
		memcpy(x, x2, size*sizeof(u8));
		timer.start();
		u32 count_computed = methods[i].method(x2, size);
		timer.stop();
		cerr << setw(2) << i << " " << setw(25) << methods[i].name;
		cerr << setw(20) << timer << " " << count_computed << " ";
		
		if (count_computed == count_expected) {
			cerr << " OK";
		} else {
			cerr << " !!! FAIL !!!";
		}
				
		cerr << endl;
	}
	free_resources();
	_mm_free(x2);
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

	cout << b_option << "-t, --test" << e_option;
	cout << "test of all methods" << endl << endl;
	
	cout << b_option << "-a, --avoid" << e_option;
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
	
	string program_name = "asm_popcnt64";
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

		int c = getopt_long(argc, argv, "hcltvlm:s:z:a:", long_options, &option_index);
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
		mutations = methods[method_id].method(x, size);
	}
	timer.stop();
	cout << "cycles=" << timer << endl;
	cout << "result=" << mutations << endl;
	cout << "method.name=" << methods[method_id].name << endl;
	
	free_resources();
			
	return EXIT_SUCCESS;
}
