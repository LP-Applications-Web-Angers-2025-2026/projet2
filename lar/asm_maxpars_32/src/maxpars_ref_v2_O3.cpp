#include "common.h"

/**
 * Reference function
 * @return sum of y[i]'s, where y[i] = a * x[i] + y[i]
 * @param x first vector
 * @param y second vector
 * @param a constant
 * @param size size of vectors 
 */
u32 maxpars_ref_v2_O3(u8 *x, u8 *y, u8 *z, u32 size) {
	u32 mutations = 0;
	for (u32 i = 0; i < size; ++i) {
		z[i] = x[i] & y[i];
		if (z[i] == 0) {
			z[i] = x[i] | y[i];
			++mutations;
		}
		//cout << "z[" << i << "]=" << (int) z[i] << endl;
	}
	return mutations;
}
