/*
 *
 *  Created on: Jan 30, 2014
 *      Author: richer
 */

#include "common.h"
#include <xmmintrin.h>
#include <immintrin.h> // AVX
#include <smmintrin.h>
#include "cpp_config.h"
#include <signal.h>

#ifdef __INTEL_COMPILER
u32 maxpars_avx2_intrinsics(u8 * restrict x, u8 * restrict y, u8 * restrict z, u32 size) {
#else
u32 maxpars_avx2_intrinsics(u8 * __restrict__ x, u8 * __restrict__ y, u8 * __restrict__ z, u32 size) {
#endif
#ifdef CPU_AVX2_COMPLIANT

	u32 i, mutations=0;
#ifdef __INTEL_COMPILER
	__assume_aligned(x, CPU_MEMORY_ALIGNMENT);
	__assume_aligned(y, CPU_MEMORY_ALIGNMENT);
	__assume_aligned(z, CPU_MEMORY_ALIGNMENT);
	__assume(i%CPU_MEMORY_ALIGNMENT==0);
#endif
#if __GNU__ > 3 
	x = (u8 *) __builtin_assume_aligned(x, CPU_MEMORY_ALIGNMENT);
	y = (u8 *) __builtin_assume_aligned(y, CPU_MEMORY_ALIGNMENT);
	z = (u8 *) __builtin_assume_aligned(z, CPU_MEMORY_ALIGNMENT);
#endif

	__m256i _x, _y, _z, _x_and_y, _x_or_y, _zero, _cmp __attribute__((aligned(32)));

	_zero = _mm256_set1_epi8(0);
 
	for (i = 0; i < (size & (~31)); i+=32) { 
        _x = _mm256_load_si256((__m256i *) &x[i]);
        _y = _mm256_load_si256((__m256i *) &y[i]);
        _x_and_y = _mm256_and_si256(_x, _y);
        _x_or_y = _mm256_or_si256(_x, _y);
        _cmp = _mm256_cmpeq_epi8(_zero, _x_and_y);
        u32 r = _mm256_movemask_epi8(_cmp);
        mutations += _mm_popcnt_u32(r);
        _z = _mm256_blendv_epi8 (_x_and_y, _x_or_y, _cmp);
        _mm256_store_si256( (__m256i *) &z[i], _z);
	}

	for ( ; i<size; ++i) {
		z[i] = x[i] & y[i];
		if (z[i] == 0) {
			z[i] = x[i] | y[i];
			++mutations;
		}
	}

	return mutations;
#else
	raise(SIGILL);
	return 0;
#endif	
}
