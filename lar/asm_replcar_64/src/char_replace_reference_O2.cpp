#include "common.h"

/**
 * Reference function but that will be compiled using -O2 compilation
 * flag instead of -O3
 * @param dst destination string
 * @param src source string
 * @param size size of source and destination strings
 * @param c character to look for
 * @param d character the will replace c in destination string
 * @return number of replacements
 */
u32 chr_repl_ref_O2(u8 *dst, u8 *src, u32 size, u8 c, u8 d) {
	u32 nbr_replacements=0;

	for (u32 i=0; i<size; ++i) {
		if (src[i] == c) {
			dst[i] = d;
			++nbr_replacements;
		} else {
			dst[i] = src[i];
		}
	}
	return nbr_replacements;
}
