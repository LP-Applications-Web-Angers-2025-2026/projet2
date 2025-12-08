/*
 *
 *  Created on: March 5, 2020
 *      Author: Jean-Michel Richer
 */

#include "common.h"
#include <xmmintrin.h>
#include <immintrin.h> // AVX 512
#include <smmintrin.h>
#include "cpp_config.h"
#include <signal.h>

#ifdef CPU_AVX2_COMPLIANT

#ifdef __INTEL_COMPILER
u32 maxpars_avx512_intrinsics(u8 * restrict x, u8 * restrict y, u8 * restrict z, u32 size) {
#else
u32 maxpars_avx512_intrinsics(u8 * __restrict__ x, u8 * __restrict__ y, u8 * __restrict__ z, u32 size) {
#endif
#ifdef CPU_AVX512_COMPLIANT

	u32 i = 0, mutations=0;
#ifdef __INTEL_COMPILER
	__assume_aligned(x, CPU_MEMORY_ALIGNMENT);
	__assume_aligned(y, CPU_MEMORY_ALIGNMENT);
	__assume_aligned(z, CPU_MEMORY_ALIGNMENT);
	__assume(i%CPU_MEMORY_ALIGNMENT==0);
#endif
#if __GNUC__ > 3 
	x = (u8 *) __builtin_assume_aligned(x, CPU_MEMORY_ALIGNMENT);
	y = (u8 *) __builtin_assume_aligned(y, CPU_MEMORY_ALIGNMENT);
	z = (u8 *) __builtin_assume_aligned(z, CPU_MEMORY_ALIGNMENT);
#endif

	
	__mmask64 k2;
	
	__m512i _zero512 = _mm512_set1_epi8(0);
 
	for ( ; i < (size & (~63)); i+=64) {
        __m512i _x, _y, _z, _x_and_y, _x_or_y __attribute__((aligned(64)));
        
		_x = _mm512_load_si512((__m512i *) &x[i]);
		_y = _mm512_load_si512((__m512i *) &y[i]);

		_x_and_y = _mm512_and_si512(_x, _y);
		_x_or_y = _mm512_or_si512(_x, _y);
		// compare _x_and_y to zero
		// k2[i] is set to 1 if _x_and_y[i*8:i*8+7] == 0
		k2 = _mm512_cmpeq_epi8_mask(_zero512, _x_and_y);
		
		_z = _mm512_mask_mov_epi8(_x_and_y, k2, _x_or_y); 

		uint64_t r = _cvtmask64_u64(k2);
		mutations += _mm_popcnt_u64(r);
		
		_mm512_store_si512( (__m512i *) &z[i], _z);
	}
	
	__m256i _zero256 = _mm256_set1_epi8(0);
	if ((size-i) >= 32) {
        _mm256_zeroupper();
        __m256i _x, _y, _z, _x_and_y, _x_or_y, _cmp __attribute__((aligned(32)));
        _x = _mm256_load_si256((__m256i *) &x[i]);
		_y = _mm256_load_si256((__m256i *) &y[i]);
		_x_and_y = _mm256_and_si256(_x, _y);
		_x_or_y = _mm256_or_si256(_x, _y);
		_cmp = _mm256_cmpeq_epi8(_zero256, _x_and_y);
		u32 r = _mm256_movemask_epi8(_cmp);
		mutations += _mm_popcnt_u32(r);
        
        // use
		// _x = _mm256_andnot_si256(_cmp, _x_and_y);
		// _y = _mm256_and_si256(_cmp, _x_or_y);
		// _z = _mm256_or_si256(_x, _y);
        // or vpblendvb
		_z = _mm256_blendv_epi8 (_x_and_y, _x_or_y, _cmp);
        
		_mm256_store_si256( (__m256i *) &z[i], _z);
        i += 32;
    }

	// last iterations
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

#endif

