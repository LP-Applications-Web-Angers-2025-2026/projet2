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
#include <gmpxx.h>

typedef float f32;
typedef uint32_t u32;
typedef int32_t i32;

// ==================================================================
// GLOBAL VARIABLES
// ==================================================================

// vectors
mpf_class *x, *y;
// identifier of function to test
u32 method_id = 1;
// size of vectors
u32 data_size = 524287;

// ==================================================================
// Assembly methods
// ==================================================================

/**
 * Allocation of resources
 */
void allocate_resources() {
	x = new mpf_class[ data_size ];
	y = new mpf_class[ data_size ];
	
	// initialize vectors
	for (u32 i = 0; i < data_size; ++i) {
		x[i].set_str("1.05", 10);
		y[i].set_str("1.2", 10);
	}
	if (data_size > 0) x[0].set_str("2.3",10);
	if (data_size > 3) x[3].set_str("5.4", 10);
}

/**
 * free resources
 */
void free_resources() {
	delete [] x;
	delete [] y;
}
	
/**
 * Reference method
 * @return sum of y[i]'s, where y[i] = a * x[i] + y[i]
 * @param x first vector
 * @param y second vector
 * @param a constant
 * @param size size of vectors 
 */
void saxpy_c(mpf_class *x, mpf_class *y, mpf_class& a, u32 size) {
	mpf_class sum = 0;
	for (u32 i = 0; i < size; ++i) {
		y[i] = a * x[i] + y[i];
		sum += y[i];
	}
	cout <<  std::fixed << std::setprecision(50) << sum << endl;
}

int main() {

    mpf_set_default_prec(30);

    // allocation of vectors
	allocate_resources();

	cout << "size=" << data_size << endl;

    cout <<  "x[0]=" << std::fixed << std::setprecision(50) << x[0] << endl;
    cout <<  "x[1]=" << std::fixed << std::setprecision(50) << x[1] << endl;
	
    mpf_class factor("0.75");
	saxpy_c(x, y, factor, data_size);
	
	free_resources();
			
	return EXIT_SUCCESS;

}