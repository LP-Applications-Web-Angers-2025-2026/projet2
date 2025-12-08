#include "common.h"

extern u64 nbr_add;
extern u64 nbr_mul;

void mp_inv_jk_O2(f32 *A, f32 *B, f32 *C, u32 size) {
	for (u32 i = 0; i < size; ++i) {
		for (u32 k = 0; k < size; ++k) {
			for (u32 j = 0; j < size; ++j) {
				c(i,j) += a(i,k) * b(k,j);
				++nbr_add;
				++nbr_mul;
			}
		}
	} 
}
