#include <stdint.h>
typedef uint8_t u8;
typedef uint32_t u32;

u32 maxpars_c(u8 *x, u8 *y, u8 *z, u32 size) {
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
