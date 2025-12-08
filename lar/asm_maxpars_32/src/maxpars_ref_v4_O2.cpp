#include "common.h"

/**
 * Reference function
 * @return sum of y[i]'s, where y[i] = a * x[i] + y[i]
 * @param x first vector
 * @param y second vector
 * @param a constant
 * @param size size of vectors 
 */
u32 maxpars_ref_v4_O2(u8 *x, u8 *y, u8 *z, u32 size) {
	u32 mutations = 0;
	for (u32 i = 0; i < size; ++i) {
		char x_, y_;
		int c;
		x_ = x[i] & y[i];
		y_ = x[i] | y[i];
		z[i] = (x_ == 0) ? y_ : x_;  // change here !
		c = ((!x_) & 1);
		mutations += c;
	}
	return mutations;
}
