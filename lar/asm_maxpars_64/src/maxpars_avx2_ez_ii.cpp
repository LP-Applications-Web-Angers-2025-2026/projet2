/*
 *
 *  Created on: Jan 30, 2014
 *      Author: Jean-Michel Richer
 * 
 * Implementation of Fitch function using AVX2 intrinsics
 */

#include "common.h"
#include "ez_ii.h"
#include "cpp_config.h"
#include <signal.h>


u32 maxpars_avx2_ez_ii(restricted_access(u8 *, x), 
                       restricted_access(u8 *, y), 
                       restricted_access(u8 *,z), 
                       u32 size) {
#ifdef CPU_AVX2_COMPLIANT

	u32 i = 0, mutations=0;

    assume_aligned(x, u8 *, CPU_MEMORY_ALIGNMENT );
	assume_aligned(y, u8 *, CPU_MEMORY_ALIGNMENT );
	assume_aligned(z, u8 *, CPU_MEMORY_ALIGNMENT );
	assume_condition( i % CPU_MEMORY_ALIGNMENT == 0 );

	__m256i _x, _y, _z, _x_and_y, _x_or_y, _zero, _cmp __attribute__((aligned(32)));

	_zero = avx_bcast_1x8(0);
 
    // compute by group of 32 bytes
	for ( ; i < (size & (~31)); i+=32) {
		_x = avx_lda_i256( &x[i] );
		_y = avx_lda_i256( &y[i] );
		_x_and_y = avx_and_i256(_x, _y);
		_x_or_y = avx_or_i256(_x, _y);
		_cmp = avx_equal_i32x8(_zero, _x_and_y);
		u32 r = avx_mv_mask(_cmp);
		mutations += popcnt_i32(r);
        
        // use
		// _x = m256_andnot(_cmp, _x_and_y);
		// _y = m256_and(_cmp, _x_or_y);
		// _z = m256_or(_x, _y);
        // or vpblendvb
		_z = avx_blend_i32x8(_x_and_y, _x_or_y, _cmp);
        
		avx_sta_i256( &z[i], _z );
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


