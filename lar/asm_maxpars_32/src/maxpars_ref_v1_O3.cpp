#include "common.h"

/**
 * Reference function
 * @return number of mutations
 * @param x first sequence
 * @param y second sequence
 * @param z hypothetical sequence
 * @param size size of sequences
 */
u32 maxpars_ref_v1_O3(u8 *x, u8 *y, u8 *z, u32 size) {
	u32 mutations = 0;

	for (u32 i = 0; i < size; ++i) {
		if ((x[i] & y[i]) == 0) {
			z[i] = x[i] | y[i];
			++mutations;
		} else {
			z[i] = x[i] & y[i];
		}
	}
	return mutations;
}
