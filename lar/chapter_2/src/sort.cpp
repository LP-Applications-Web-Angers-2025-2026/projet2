#include <iostream>
#include <iomanip>
#include <cstdint>
#include <cstring>
#include <algorithm>
#include <functional>
#include <getopt.h>
#include <xmmintrin.h>
using namespace std;
#include "cpu_timer.h"

// ------------------------------------
// definition of types
// ------------------------------------
typedef uint8_t u8;
typedef int32_t i32;
typedef uint32_t u32;
typedef uint64_t u64;
typedef float f32;

// ------------------------------------
// definition of method
// ------------------------------------
typedef void (*Method)(int t[], int n);

// types definition
typedef struct _MethodDeclaration {
        Method method;
        const char *name;
} MethodDeclaration;

// macro instruction to declare method
#define add_method(x) { x, #x }

// ------------------------------------
// macros for getopt to define options
// ------------------------------------
#define OPTION_ARG(x,y) { x, required_argument, 0, y}
#define OPTION_NO_ARG(x,y) { x, no_argument, 0, y}

// ==================================================================
// GLOBAL VARIABLES
// ==================================================================
// identifiant of method used for sort
u32 method_id = 1;
// type of initialisation
u32 initialize = 1;
// size of table
int size = 10000;
// table to sort
int *table = nullptr;
// verbose flag
bool verbose_flag = false;

/**
 * Allocation of table
 */
void allocate_resources() {
	table = (int *) _mm_malloc(size * sizeof(int), 32);
}

/**
 * free matrices
 */
void free_resources() {
	_mm_free(table);
}

/**
 * return true if all values of table 't' of size 'sz'
 * are in ascending order
 */
bool is_ordered(int t[], int n) {
	for (int i=0; i<n-1; ++i) {
		if (t[i] > t[i+1]) return false;
	}
	return true;
}

void init(int *t, int n) {

	if (initialize == 1) {
		for (int i=0; i<n; ++i) t[i] = i;
	} else 	if (initialize == 2) {
		for (int i=0; i<n; ++i) t[i] = n-i;
	} else 	if (initialize == 3) {
		srand(19702013);
		for (int i=0; i<n; ++i) t[i] = rand() % n;
	} 
}

/**
 * bubble sort version 1
 * @param t : table of integers
 * @param sz size of the table
 */
void bubble_sort_v1(int t[], int n) {
	for (int i = n-1; i > 0; --i) {
		for (int j = 0; j < i; ++j) {
			if (t[j] > t[j+1]) {
				swap(t[j], t[j+1]);
			}
		}
	}
}

/**
 * bubble sort version 2, 
 * @param t : table of integers
 * @param sz size of the table
 */
void bubble_sort_v2(int t[], int n) {
    bool restart = true;
        
    int last = n - 1;
    while (restart) {
    	restart = false;
        for (int i = 0; i < last; ++i) {
        	if (t[i] > t[i+1]) {
        		swap(t[i], t[i+1]);
                restart = true;
            }
        }
        --last;
    }
}


/**
 * quick sort version 
 *
 */
void _quick_sort(int t[], int a, int b) {

	if (a < b) {
		// partition
		int i, q;
		q = (b + a + 1) / 2;
		int x = t[q];
		
		swap(t[q], t[b]);

		q = i = a;
		while (i < b) {
			
			if (t[i] <= x) swap(t[i], t[q++]);
			++i;
		}
		swap(t[b], t[q]);
				
		if (a < q) _quick_sort(t, a, q-1);
		if (q < b) _quick_sort(t, q+1, b);
	}
}

/**
 * quick sort version 2 main entry
 * calls _quick_sort_v2 to perform sort
 * this second version is based on selection of pivot 
 * in the middle of the array
 * @param t array of integers
 * @param n size of the array 
 */
void quick_sort(int t[], int n) {
	_quick_sort(t, 0, n-1);
}

/**
 * first version of merge sort based on
 * basic implementation of merge
 * @param t array of integers
 * @param n size of the array 
 */
void merge_sort_v1(int *t, int n) {
	if (n == 1) return ;
	if (n > 1) {
		merge_sort_v1(t, n/2);
		merge_sort_v1(&t[n/2], n - n/2);
	}
	// merge
	int *tmp  = new int [ n ];
	int i = 0, j = n/2, k = 0;
	while ((i < n/2) && (j < n)) {
		if (t[i] < t[j]) {
			tmp[k++] = t[i++];
		} else if (t[j] < t[i]) {
			tmp[k++] = t[j++];
		} else {
			tmp[k++] = t[i++];
			tmp[k++] = t[j++];
		}
	}
	while (i < n/2) {
		tmp[k++] = t[i++];
	}
	while (j < n) {
		tmp[k++] = t[j++];
	}
	
	memcpy(t, tmp, n * sizeof(int));
	delete [] tmp;
}

/**
 * second version of merge sort based on concise
 * implementation of merge 
 * @param t array of integers
 * @param n size of the array
 */
void merge_sort_v2(int *t, int n) {
	if (n < 2) return ;
	int m = (n / 2);
	merge_sort_v2(t, m);
	merge_sort_v2(t + m, n - m);
		
	int i, j, k;

	int *x = new int [ n ];
	for (i = 0, j = m, k = 0; k < n; ++k) {
		x[k] = (j == n)	? t[i++]
			 : (i == m)		? t[j++]
			 : t[j] < t[i]	? t[j++]
			 :				  t[i++];
	}
	memcpy(t, x, n * sizeof(int));
	delete [] x;
}



// table of methods to test
MethodDeclaration methods[] = {
        { nullptr, "not defined" },
        add_method(bubble_sort_v1),
        add_method(bubble_sort_v2),
        add_method(quick_sort),
        add_method(merge_sort_v1),
        add_method(merge_sort_v2),
        { nullptr, "not defined" }
};

/**
 * return number of methods
 */
u32 methods_count() {
    u32 i = 1;
    while (methods[i].method != nullptr) ++i;
    return i-1;
}

/**
 * list methods
 */
void list_methods() {
    u32 i;
    for (i = 1; methods[i].method != nullptr; ++i) {
            cout << "method.id=" << i << ",method.name=" << methods[i].name << endl;
    }
    cout << "methods.count=" << i-1 << endl;
    exit(EXIT_SUCCESS);
}

/**
 * Description of arguments of program
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
    cout << "\tsort array of values using different algorithms" << endl << endl;

    cout << b_option << "-h, --help" << e_option;
    cout << "this message" << endl << endl;

    cout << b_option << "-i INT, --initialize=INT" << e_option;
    cout << "initialization method" << endl;
    cout << "\t\t1: ascending" << endl;
    cout << "\t\t2: descending" << endl;
    cout << "\t\t3: random" << endl << endl;

    cout << b_option << "-l, --list" << e_option;
    cout << "list all methods" << endl << endl;
    
    cout << b_option << "-m INT, --method=INT" << e_option;
    cout << "select method given its integer identifier" << endl << endl;
    
    cout << b_option << "-s INT, --size=INT" << e_option;
    cout << "size of array" << endl << endl;
   
    exit(EXIT_SUCCESS);
}

/**
 * main method
 */
int main(int argc, char *argv[]) {
		
	while (true) {
		int option_index = 0;
		static struct option long_options[] = {
			OPTION_ARG("initialize", 'i'),
			OPTION_NO_ARG("list", 'l'),
			OPTION_ARG("method", 'm'),
			OPTION_ARG("size", 's'),
			OPTION_NO_ARG("verbose", 'v'),
			OPTION_NO_ARG("help", 'h'),
			{0, 0, 0, 0}
		};
	
		int c = getopt_long(argc, argv, "m:i:s:lhv", long_options, &option_index);
    	if (c == -1) break;
    	
    	switch(c) {
    		case 0: 
    			cerr << "option " << long_options[option_index].name;
                if (optarg) {
                	cerr << " with arg " << optarg;
                }               
                cerr << endl;
                break;

			case 'i': initialize = static_cast<u32>(atoi(optarg)); break;
			case 'm': method_id = static_cast<u32>(atoi(optarg)); break;
			case 's': size = atoi(optarg); break;
			case 'l': list_methods(); exit(EXIT_SUCCESS); break;
            case 'v': verbose_flag = true; break;
            case 'h': usage(argv[0]); break;	

            default:
            	cerr << "Error ! Check command line arguments !" << endl;
                exit(EXIT_FAILURE);

    	}
    }
    
    // check parameters
    if ((method_id < 1) || (method_id > methods_count())) {
            cerr << "method should be inside [1.." << methods_count() << "]" << endl;
            exit(EXIT_FAILURE);
    }

    if ((initialize < 1) || (initialize > 3)) {
            cerr << "method should be inside [1..3]" << endl;
            exit(EXIT_FAILURE);
    }
    
    if (size < 10) {
        cerr << "dimension should be greater or equal than 10" << endl;
        exit(EXIT_FAILURE);
    }

    allocate_resources();
 
 
 	switch (initialize) {
 		case 1: cout << "initialize=ascending order" << endl; break;
 		case 2: cout << "initialize=descending order" << endl; break;
 		case 3: cout << "initialize=random" << endl; break;
 	}
 	
 	init(table, size);
 	
 	cout << "method.name=" << methods[method_id].name << endl;
 	
    CPUTimer timer;
	timer.start(); 
	methods[method_id].method(table, size);
	timer.stop();
	
	cout << "cycles=" << timer << endl;
	
	
	if (is_ordered(table, size)) {
		cout << "is_ordered=OK" << endl;
	} else {
		cout << "is_ordered=FAIL" << endl;
	}
	
	if (verbose_flag) {
		for (int i = 0; i <size; ++i) {
			cout << table[i] << " ";
		}
		cout << endl;
	}
	
	free_resources();
	exit(EXIT_SUCCESS);

}