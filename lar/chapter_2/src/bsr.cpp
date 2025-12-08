#include <iostream>
#include <stdint.h>
#include <stdlib.h>
#include <vector>
#include <xmmintrin.h>
#include "cpu_timer.h"
#include <getopt.h>
using namespace std;
typedef uint32_t u32;

#define OPTION_ARG(x,y) { x, required_argument, 0, y}
#define OPTION_NO_ARG(x,y) { x, no_argument, 0, y}

// array of integers
u32 *tab; 
// method
u32 method_id = 1;
// size of the array 'tab'
u32 size = 100000+3;
// number of iterations
u32 zillions = 10000;

u32 CPU_MEMORY_ALIGNMENT = 64;
	
typedef u32 (*MethodType)(u32 *t, u32 size);

/**
 * SUBPROGRAM
 *    
 *   function_bsr
 *
 * DESCRIPTION
 *  
 *   Function that find the most significant bit
 *   in a 32 bits unsigned value by using a loop 
 *   that start from bit 31 and goes down to bit 0
 *
 * PARAMETERS
 *
 *   n		int		number to check
 *
 * RETURN VALUE
 *
 *  the most significant bit or 0xFF if 'n' == 0
 *
 **/
u32 function_bsr(u32 a) {
	for (int i = 31; i >= 0; --i) { 
		if ((a & (1 << i)) != 0) return (u32) i;
	}
	return 0xFF;
}

/**
 * SUBPROGRAM
 *    
 *   method_1
 *
 * DESCRIPTION
 *  
 *   Function that sums the result of the function
 *   that finds the most significant bit
 *   in a 32 bits unsigned value by calling
 *   'function_bsr'
 *
 * PARAMETERS
 *
 *   t			int *		array of unsigned values
 *   size		uint		size of the array
 *
 * RETURN VALUE
 *
 *  the sum of most significant bits of the array t
 *
 **/
u32 method_1(u32 *t, u32 size) {
	u32 sum = 0; 
	for (u32 i = 0; i < size; ++i) {
		sum += function_bsr(t[i]);
	}
	return sum;
}

/**
 * SUBPROGRAM
 *    
 *   method_2
 *
 * DESCRIPTION
 *  
 *   Function that sums the result of the function
 *   that finds the most significant bit
 *   in a 32 bits unsigned value by calling
 *   __builtin_clz
 *
 * PARAMETERS
 *
 *   t			int *		array of unsigned values
 *   size		uint		size of the array
 *
 * RETURN VALUE
 *
 *  the sum of most significant bits of the array t
 *
 **/
u32 method_2(u32 *t, u32 size) {
	u32 sum = 0; 
	for (u32 i = 0; i < size; ++i) {
		sum += (31 - __builtin_clz(t[i]));
	}
	return sum;
}

/**
 * SUBPROGRAM
 *    
 *   method_2
 *
 * DESCRIPTION
 *  
 *   Function that sums the result of the function
 *   that finds the most significant bit
 *   in a 32 bits unsigned value by calling
 *   the bsr assembly instruction
 *
 * PARAMETERS
 *
 *   t			int *		array of unsigned values
 *   size		uint		size of the array
 *
 * RETURN VALUE
 *
 *  the sum of most significant bits of the array t
 *
 **/
u32 method_3(u32 *t, u32 size) {
	u32 sum = 0; 
	for (u32 i = 0; i < size; ++i) {
		u32 input = t[i];
		u32 output;
		asm("bsr %0, %1"
			: "=r" (output)
			: "r" (input)
			:
		);
		sum += output;
	}	
	return sum;
}

extern "C" {
	u32 method_4(u32 *t, u32 size);
	u32 method_5(u32 *t, u32 size);
	u32 method_6(u32 *t, u32 size);
	u32 method_7(u32 *t, u32 size);
	u32 method_8(u32 *t, u32 size);
	u32 method_9(u32 *t, u32 size);
}


/**
 * Allocation and initialisation of resources
 */
void allocate_resources() {
	tab = (u32 *) _mm_malloc(size * sizeof(u32), CPU_MEMORY_ALIGNMENT);
	cout << hex;
	cout << "tab=" << (u32 *) tab << endl;
	cout << dec;

	// initialize random number generator
	srand(19702013);
	
	// initialize
	for (u32 i=0; i<size; ++i) {
		tab[i] = (rand() & 0xFFFFF) + 1;
	}
}

/**
 * free resources
 */
void free_resources() {
	_mm_free( tab );
}

/*
ctz : returns the number of trailing 0-bits in x, starting at the least 
		significant bit position. If x is 0, the result is undefined
		
clz : returns the number of leading 0-bits in x, starting at the most 
	significant bit position. If x is 0, the result is undefined
	
ffs : Returns one plus the index of the least significant 1-bit of x, 
	or if x is zero, returns zero.
	
*/
void test() {
	cout << "=== TEST ===" << endl;
	vector<u32> values = { 0, 1, 2, 3, 0x7FFFFFFF, 0xFFFFFFFF };
	
	for (auto v : values) {
		cout << "v=" << v << ", " << (u32) __builtin_ctz(v);
		cout << " " << (u32) (31 - (u32) __builtin_clz(v));
		cout << " " << (u32) function_bsr(v);
		cout << endl;
	}
}

typedef struct {
	MethodType function;
	string name;
} MethodEntry;

MethodEntry tab_methods[] = {
	{ nullptr, "unknown"},
	{ method_1, "C_function_bsr" },
	{ method_2, "C_builtin_clz" },
	{ method_3, "C_bsr" },
	{ method_4, "asm_bsr" },
	{ method_5, "asm_bsr_ur4" },
	{ method_6, "asm_bsr_ur4_nodep" },
	{ method_7, "asm_lzcnt" },
	{ method_7, "asm_lzcnt_ur4_nodep" },
	{ method_9, "asm_avx512_vplzcnt" },
	{ nullptr, "unknown"}
};


/**
 * return number of methods
 * @return number of methods
 */
u32 methods_count() {
	u32 i = 1;
	while (tab_methods[i].function != nullptr) ++i;
	return i-1;
}

/**
 * list methods and print the number of the method (id)
 * and the name of the method
 */
void list_methods() {
	u32 i;
	for (i = 1; tab_methods[i].function != nullptr; ++i) {
		cout << "method.id=" << i << ",method.name=" << tab_methods[i].name << endl;
	}
	cout << "methods.count=" << i-1 << endl;
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

	cout << b_option << "-l, --list" << e_option;
	cout << "list all methods" << endl << endl;
	
	cout << b_option << "-m, --method=INT" << e_option;
	cout << "version of Fitch method" << endl << endl;

	cout << b_option << "-s, --size=INT" << e_option;
	cout << "size of sequences" << endl << endl;

	cout << b_option << "-z, --zillions=INT" << e_option;
	cout << "number of times the method is called" << endl << endl;

	exit(EXIT_SUCCESS);
}

/**
 * main function
 */
int main(int  argc, char *argv[]) {
	srand(19702013);
	
	
	// get parameters
	while (1) {
		int option_index = 0;
		static struct option long_options[] = {
			OPTION_NO_ARG("help", 'h'),
		
			OPTION_NO_ARG("list", 'l'),
			OPTION_ARG("method", 'm'),
			OPTION_ARG("method-name", 'n'),
			OPTION_ARG("size", 's'),
			OPTION_ARG("zillions", 'z'),

			{0, 0, 0, 0 }
		};

		int c = getopt_long(argc, argv, "hlm:s:z:", long_options, &option_index);
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
			
				
			case 's':
				size = static_cast<size_t>(atoi(optarg));
				break;

			case 'l':
				list_methods();
				break;
				
			case 'm':
				method_id = atoi(optarg);
				break;
							

			case 'z':
				zillions = atoi(optarg);
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
	
	allocate_resources();
	
	cout << "size=" << size << endl;
	cout << "zillions=" << zillions << endl;
	
	CPUTimer timer;
	
	u32 sum = 0;
	
	if (method_id == 0) {
		test();
	} else {
		cout << "method=" << tab_methods[ method_id  ].name << endl;
		timer.start();
		for (u32 z = 0; z < zillions; ++z) sum = tab_methods[ method_id  ].function(tab, size);
		timer.stop();
	}

	cout << "cycles=" << timer << endl;	
	cout << "sum=" << sum << endl;
	
	free_resources();
	
	return 0;
}
