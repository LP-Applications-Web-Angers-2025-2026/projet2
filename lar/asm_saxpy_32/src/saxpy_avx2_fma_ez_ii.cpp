/*
 *
 *  Created on: March 19, 2020
 *      Author: Jean-Michel Richer
 * 
 *  Implementation of modified version of SAXPY with 
 *  EZ Intrinsics Interface
 */

#include "common.h"
#include "ez_ii.h"
#include "cpp_config.h"
#include <signal.h>



f32 saxpy_avx2_fma_ez_ii(restricted_access(f32 *, x), 
                         restricted_access(f32 *, y), 
                         f32 a, 
                         u32 size) {

#ifdef CPU_AVX2_COMPLIANT

	u32 i = 0;

	assume_aligned(x, f32 *, CPU_MEMORY_ALIGNMENT);
	assume_aligned(y, f32 *, CPU_MEMORY_ALIGNMENT);
	assume_condition(i%CPU_MEMORY_ALIGNMENT==0);

	f256 _x, _y, _a, _sum, _z __attribute__((aligned(32)));

	_sum = avx_zero_f256();
    _a = avx_bcast_f32(a);
    
    f32 sum = 0;
    
    if (size >= 32) {
        // compute by group of 32 bytes
        for ( ; i < (size & (~7)); i+=8) {
            _x = avx_lda_f256( &x[i] );
            _y = avx_lda_f256( &y[i] );
            _z = avx_fmadd231(_a, _x, _y);
            
            _sum = avx_add_f8x32(_sum, _z);
            avx_sta_f256( &y[i], _z);
            
        }
        
        f128 _lo, _hi;
        
        _sum = avx_hadd_f8x32( _sum, _sum );
        _sum = avx_hadd_f8x32( _sum, _sum );
        _lo = avx_to_sse_lo( _sum );
        _hi = avx_to_sse_hi( _sum );
        _lo = sse_add_f4x32( _lo, _hi );
        
        sum = sse_get_f32(_lo);
    }
    
    // last iterations
	for ( ; i<size; ++i) {
    	y[i] = a * x[i] + y[i];
		sum += y[i];
	}
	
	return sum;
#else
	raise(SIGILL);
	return 0;
#endif		
}

