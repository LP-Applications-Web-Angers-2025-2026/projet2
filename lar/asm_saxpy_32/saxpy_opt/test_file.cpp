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

//typedef float real;
typedef double real;
typedef uint32_t u32;
typedef int32_t i32;

// ==================================================================
// GLOBAL VARIABLES
// ==================================================================

// vectors
real *x, *y;
// identifier of function to test
u32 method_id = 1;
// size of vectors
u32 data_size = 524287;
// number of iterations
u32 zillions = 10000;

// ==================================================================
// Assembly methods
// ==================================================================

#define CPU_MEMORY_ALIGNMENT 32

/**
 * Allocation of resources
 */
void allocate_resources() {
	x = (real *) _mm_malloc(data_size * sizeof(real), CPU_MEMORY_ALIGNMENT);
	y = (real *) _mm_malloc(data_size * sizeof(real), CPU_MEMORY_ALIGNMENT);
	cout << hex;
	cout << "x=" << (u32 *) x << endl;
	cout << "y=" << (u32 *) y << endl;
	cout << dec;
	
	// initialize vectors
	for (u32 i = 0; i < data_size; ++i) {
		x[i] = 1.05;
		y[i] = 1.2;
	}
	if (data_size > 0) x[0] = 2.3;
	if (data_size > 3) x[3] = 5.4;
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
real saxpy_c(real *x, real *y, real a, u32 size) {
	real sum = 0.0;
	for (u32 i = 0; i < size; ++i) {
		y[i] = a * x[i] + y[i];
		sum += y[i];
	}
	return sum;
}

int main() {

    // allocation of vectors
	allocate_resources();

	cout << "size=" << data_size << endl;
	cout << "zillions=" << zillions << endl;
	
	real r = saxpy_c(x, y, 0.75, data_size);
	cout << "result.first=" << std::fixed << std::setprecision(10) << r << endl;
	for (u32 z = 2; z <= zillions; ++z) {
		r += saxpy_c(x, y, 0.75, data_size);

	}


	cout << "result.final=" << std::fixed << std::setprecision(10) << r << endl;

	
	free_resources();
			
	return EXIT_SUCCESS;

}