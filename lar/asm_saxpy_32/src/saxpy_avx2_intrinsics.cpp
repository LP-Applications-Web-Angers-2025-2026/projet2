/*
 *
 *  Created on: March 17, 2020
 *      Author: Jean-Michel Richer
 * 
 *  Implementation of modified version of SAXPY with AVX2 intrinsics
 */

#include "common.h"
#include <xmmintrin.h>
#include <immintrin.h> // AVX
#include <smmintrin.h>
#include <xmmintrin.h>
#include "cpp_config.h"
#include <signal.h>

void print256f(__m256 var) {
    f32 *val = (f32 *) &var;
    printf("Numerical: %f %f %f %f %f %f %f %f \n", 
           val[0], val[1], val[2], val[3], val[4], val[5], 
           val[6], val[7]);
}

#ifdef __INTEL_COMPILER
f32 saxpy_avx2_intrinsics(f32 * restrict x, f32 * restrict y, f32 a, u32 size) {
#else
f32 saxpy_avx2_intrinsics(f32 * __restrict__ x, f32 * __restrict__ y, f32 a, u32 size) {
#endif

#ifdef CPU_AVX2_COMPLIANT

	u32 i = 0;
#ifdef __INTEL_COMPILER
	__assume_aligned(x, CPU_MEMORY_ALIGNMENT);
	__assume_aligned(y, CPU_MEMORY_ALIGNMENT);
	__assume(i%CPU_MEMORY_ALIGNMENT==0);
#endif
#if __GNUC__ > 3 
	x = (f32 *) __builtin_assume_aligned(x, CPU_MEMORY_ALIGNMENT);
	y = (f32 *) __builtin_assume_aligned(y, CPU_MEMORY_ALIGNMENT);
#endif

	__m256 _x, _y, _a, _sum, _z __attribute__((aligned(CPU_MEMORY_ALIGNMENT)));

	_sum = _mm256_setzero_ps();
    _a = _mm256_set1_ps(a);
    
    f32 sum = 0;
    
    if (size >= 32) {
        // compute by group of 32 bytes
        for ( ; i < (size & (~7)); i+=8) {
            _x = _mm256_load_ps((f32 *) &x[i]);
            _y = _mm256_load_ps((f32 *) &y[i]);
            _z = _mm256_mul_ps(_x, _a);
            _y = _mm256_add_ps(_z, _y);
            			
            _sum = _mm256_add_ps(_sum, _y);
            _mm256_store_ps( (f32 *) &y[i], _y);
            
        }
        
        __m128 _lo, _hi;
        
        _sum = _mm256_hadd_ps(_sum, _sum);
        _sum = _mm256_hadd_ps(_sum, _sum);
        _lo = _mm256_extractf128_ps(_sum, 0);
        _hi = _mm256_extractf128_ps(_sum, 1);
        _lo = _mm_add_ps(_lo, _hi);
        
        sum = _mm_cvtss_f32(_lo);
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

