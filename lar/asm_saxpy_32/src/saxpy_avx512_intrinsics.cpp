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


#ifdef __INTEL_COMPILER
f32 saxpy_avx512_intrinsics(f32 * restrict x, f32 * restrict y, f32 a, u32 size) {
#else
f32 saxpy_avx512_intrinsics(f32 * __restrict__ x, f32 * __restrict__ y, f32 a, u32 size) {
#endif

#ifdef CPU_AVX512_COMPLIANT

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

	__m512 _x, _y, _a, _sum, _z __attribute__((aligned(CPU_MEMORY_ALIGNMENT)));

	_sum = _mm512_setzero_ps();
    _a = _mm512_set1_ps(a);
    
    f32 sum = 0;
    
    if (size >= 16) {
        // compute by group of 16 float
        for ( ; i < (size & (~15)); i += 16) {
            _x = _mm512_load_ps((f32 *) &x[i]);
            _y = _mm512_load_ps((f32 *) &y[i]);
            _z = _mm512_mul_ps(_x, _a);
            _y = _mm512_add_ps(_z, _y);
            
            _sum = _mm512_add_ps(_sum, _y);
            _mm512_store_ps( (f32 *) &y[i], _y);
            
        }
        
        __m256 _sum1, _sum2;
        __m128 _lo1, _hi1, _lo2, _hi2;
        
		 _sum1 = _mm512_extractf32x8_ps(_sum, 0);
		 _sum2 = _mm512_extractf32x8_ps(_sum, 1);
		 
        _sum1 = _mm256_hadd_ps(_sum1, _sum1);
        _sum1 = _mm256_hadd_ps(_sum1, _sum1);
		
		_sum2 = _mm256_hadd_ps(_sum2, _sum2);
        _sum2 = _mm256_hadd_ps(_sum2, _sum2);
		
        _lo1 = _mm256_extractf128_ps(_sum1, 0);
        _hi1 = _mm256_extractf128_ps(_sum1, 1);
        _lo1 = _mm_add_ps(_lo1, _hi1);
        
		_lo2 = _mm256_extractf128_ps(_sum2, 0);
        _hi2 = _mm256_extractf128_ps(_sum2, 1);
        _lo2 = _mm_add_ps(_lo2, _hi2);
        
		_lo1 = _mm_add_ps(_lo1, _lo2);
        sum = _mm_cvtss_f32(_lo1);
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

