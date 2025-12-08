/*
    asm_vector_merge_sort helps compare different implementations of 
    the merge sort algorithm
    
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
#include <algorithm>
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


#ifdef TEXT_SECTION_WRITABLE

#include <errno.h>
#include <unistd.h>
#include <sys/mman.h>

/**
 * Change permission of text/code segment for given function.
 * @param addr address of function
 * @return 0 if change was possible, -1 otherwise
 */
int change_page_permissions_of_address(void *addr) {
    int page_size = getpagesize();
    addr -= (unsigned long)addr % page_size;

	int protection = PROT_READ | PROT_WRITE | PROT_EXEC;
    return mprotect(addr, page_size, protection);
}

#endif

// ==================================================================
// GLOBAL VARIABLES
// ==================================================================

// sequences
int *tab;
// identifier of method to test
u32 method_id = 1;
// size of vectors
u32 size = 1024*1024;
// initialisation method
u32 init_method = 1;
// perform test ?
bool test_flag = false;
// if true return name of method
string select_by_name = "";
// methods not to test
set<u32> test_avoid;
// verbose mode
bool verbose_flag = false;

size_t min_display_index = 10;

// ==================================================================
// Assembly methods
// ==================================================================
extern "C" {
	// note that for fast call parameter t is in ECX
	void asm_sse_sort(int *t) __attribute__((fastcall));
}


/**
 * improved version of merge on an array of size 
 * 'n' that was divided in two at index 'm'
 * @param t array
 * @param n numbre of elements of array
 * @param m index of half of the array
 */
void merge(int *t, u32 n, u32 m) {
	u32 i, j, k;

	// create temporary array
	int *x = new int[n];
	
	// reorder values by placing in temporary array
	// the smallest value that comes from first or
	// second half of array depending on smallest 
	// value
	for (i = 0, j = m, k = 0; k < n; k++) {
		x[k] = (j == n)		? t[i++]
			 : (i == m)		? t[j++]
			 : t[j] < t[i]	? t[j++]
			 :				  t[i++];
	}
	
	// note that the following code is equivalent by
	// generally runs slower
	/*
	i =0; j = m; k = 0;
	while ((i < m) && (j < n)) {
		x[k++] = (t[i] < t[j]) ? t[i++] : t[j++];
	}
	while (i < m) {
		x[k++] = t[i++];
	}
	while (j < n) {
		x[k++] = t[j++];
	}
	*/
	
	// copy temporary that contains reordered values
	// into array t
	memcpy(t, x, n * sizeof(int));
	
	// free temporary array
	delete [] x;
}

/**
 * Recursively split initial array t of size sz into two smaller arrays
 * until array size is equal to 4
 * @param t array of integers
 * @param n number of elements of array
 */
void sort_std(int *t, u32 sz) {
	if (sz == 4) {
		std::sort(&t[0], &t[4]);
		return ;
	}
	// divide array t in its middle
	u32 m = (sz / 2);
	// split into two sub arrays
	sort_std(t, m);
	sort_std(t + m, sz - m);
	// merge sub arrays
	merge(t, sz, m);
}

/**
 * Recursively split initial array t of size sz into two smaller arrays
 * until array size is equal to 4
 */
void sort_vec(int *t, u32 sz) {
	if (sz == 4) {
		asm_sse_sort(t);
		return ;
	}
	// divide array t in its middle
	int m = (sz / 2);
	// split into two sub arrays
	sort_vec(t, m);
	sort_vec(t + m, sz - m);
	// merge sub arrays
	merge(t, sz, m);
}


/**
 * check if array is sorted, return true if it is the case
 */
bool is_sorted(int *t, int sz) {
	for (int i = 1; i < sz; ++i) {
		if (t[i-1] > t[i]) return false;
	}
	return true;
}


/**
 * Allocation and initialisation of resources
 */
void allocate_resources() {
	tab = (int *) _mm_malloc(size * sizeof(u32), CPU_MEMORY_ALIGNMENT);
	cout << hex;
	cout << "tab=" << (u32 *) tab << endl;
	cout << dec;
	
	srand(19702013);
	
	switch(init_method) {
	case 1:
		for (u32 i=0; i<size; ++i) tab[i] = i;
		break;
		
	case 2:
		for (u32 i=0;i<size; ++i) tab[i] = size-i;
		break;
		
	case 3:
		for (u32 i=0;i<size; ++i) tab[i] = rand() % size;
		break;
	}
}

/**
 * free resources
 */
void free_resources() {
	_mm_free(tab);
}


// ==================================================================
// array of methods to test
// ==================================================================
MethodDeclaration methods[] = {
	{ nullptr, "not defined" },
	add_method(sort_std),
	add_method(sort_vec),
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

bool are_equal(int *t_ref, int *t_wrk, u32 size, u32& index) {
	for (u32 i = 0; i < size; ++i) {
		if (t_wrk[i] != t_ref[i]) {
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
	int *tab_copy = (int *) _mm_malloc(size * sizeof(u32), CPU_MEMORY_ALIGNMENT);
	int *tab_work = (int *) _mm_malloc(size * sizeof(u32), CPU_MEMORY_ALIGNMENT);
	
	memcpy(tab_copy, tab, size * sizeof(u32));
	
	CPUTimer timer;
	timer.start();
	methods[1].method(tab, size); 
	timer.stop();
	
	cout << 1 << " " << setw(25) << methods[1].name;
	cout << setw(20) << timer << " " ;
	cout << endl;
	
	for (u32 i = 2; methods[i].method != nullptr; ++i) {
		memcpy(tab_work, tab_copy, size * sizeof(u32));
		
		timer.start();
		methods[i].method(tab_work, size);
		timer.stop();
		cout << i << " " << setw(25) << methods[i].name << " ";
		cout << setw(20) << timer << " ";
		
		u32 index =  0;
		if (are_equal(tab, tab_work, size, index)) {
			cout << " OK";
		} else {
			cout << " !!! FAIL !!! for index=" << index;
			cout << "v1=" << tab[index] << " != v2=" << tab_work[index];  
		}
		cout << endl;
	}
	free_resources();
	_mm_free(tab_copy);
	_mm_free(tab_work);
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
	cout << "\tcompute result of merge sort implementations" << endl << endl;

	cout << b_option << "-h, --help" << e_option;
	cout << "this message" << endl << endl;

	cout << b_option << "-c, --copying" << e_option;
	cout << "print GNU GPL" << endl << endl;
	
	cout << b_option << "-i INT, --init=INT" << e_option;
	cout << "initialisation method (1=asc, 2=desc, 3=random)" << endl << endl;

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
	
	cout << b_option << "-z, --zillions=INT" << e_option;
	cout << "number of times the method is called" << endl << endl;

	cout << b_option << "-v, --verbose" << e_option;
	cout << "print matrices " << endl << endl;

	cout << b_option << "-a, --avoid=LIST" << e_option;
	cout << "comma separated list of method not to test" << endl << endl;
	
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
 * main function
 */
int main(int argc, char *argv[]) {
	SignalHandler sh;

	string program_name = "asm_vector_merge_sort32";
	gnu_header(program_name);

#ifdef TEXT_SECTION_WRITABLE
	void *proc_addr = (void*)asm_sse_sort;

	if(change_page_permissions_of_address(proc_addr) == -1) {
        cerr << "Error while changing page permissions" << endl;
        cerr << strerror(errno) << endl;
        return 1;
    }
#endif

	srand(time(nullptr));
	 
	// get parameters
	while (1) {
		int option_index = 0;
		static struct option long_options[] = {
			OPTION_NO_ARG("help", 'h'),
			OPTION_NO_ARG("copying", 'c'),
			OPTION_ARG("init", 'i'),
			OPTION_NO_ARG("list", 'l'),
			OPTION_ARG("method", 'm'),
			OPTION_ARG("method-name", 'n'),
			OPTION_ARG("size", 's'),
			OPTION_ARG("test", 't'),
			OPTION_ARG("avoid", 'a'),
			OPTION_NO_ARG("verbose", 'v'),
			{0, 0, 0, 0 }
		};

		int c = getopt_long(argc, argv, "hciltvlm:s:a:", long_options, &option_index);
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
				
			case 'i':	
				init_method = static_cast<size_t>(atoi(optarg));
				break;
				
			case 's':
				size = static_cast<size_t>(atoi(optarg));
				break;

			case 'l':
				list_methods();
				break;
				
			case 'a':
				tokenize(test_avoid, optarg);
				break;
					
			case 'm':
				method_id = atoi(optarg);
				break;
							
			case 'n':
				select_by_name = optarg;
				break;

			case 't':
				test_flag = true;
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
	
	if ((size < 4) || ((size % 4) !=0)) {
		cerr << "Warning, size of the array must be positive and a multiple of 4 !" << endl;
		exit(EXIT_FAILURE);
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

	// print information about parameters
	cout << "size=" << size << endl;
	cout << "initialisation method=" << init_method << endl;
#ifdef CPU_BMI2_COMPLIANT
	cout << "BMI compliant=true" << endl;
#else
	cout << "BMI compliant=false" << endl;
#endif
	
	CPUTimer timer;	
	timer.start();
	methods[method_id].method(tab, size);
	timer.stop();
	cout << "cycles=" << timer << endl;
	cout << "method.name=" << methods[method_id].name << endl;
	
	// check if array is really sorted
	if (!is_sorted(tab, size)) {
		cout << "!!! NOT SORTED !!!" << endl;
	}
	
	free_resources();
		
	return 0;
}
