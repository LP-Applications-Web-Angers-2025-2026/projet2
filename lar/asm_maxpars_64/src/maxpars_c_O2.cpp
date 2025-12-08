#include "common.h"

/**
 * Reference function
 * @return number of mutations
 * @param x first sequence
 * @param y second sequence
 * @param z hypothetical sequence
 * @param size size of sequences
 */
u32 maxpars_c_O2(u8 *x, u8 *y, u8 *z, u32 size) {
	u32 mutations = 0;
	for (u32 i = 0; i < size; ++i) {
		z[i] = x[i] & y[i];
		if (z[i] == 0) {
			z[i] = x[i] | y[i];
			++mutations;
		}
	}
	return mutations;
}
