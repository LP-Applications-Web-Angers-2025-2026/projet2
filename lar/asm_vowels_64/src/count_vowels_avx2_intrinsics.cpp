#include "common.h"
#include <xmmintrin.h>
#include <immintrin.h> // AVX
#include <smmintrin.h>
#include "cpp_config.h"
#include <signal.h>
#include <cstring>

#ifdef __INTEL_COMPILER
void cv_avx2_intrinsics(u8 * restrict s, u32 size, u32 v[6]) {
#else
void cv_avx2_intrinsics(u8 * __restrict__ s, u32 size, u32 v[6]) {
#endif
#ifdef CPU_AVX2_COMPLIANT

	u32 i = 0;
#ifdef __INTEL_COMPILER
	__assume_aligned(s, CPU_MEMORY_ALIGNMENT);
	__assume(i%CPU_MEMORY_ALIGNMENT==0);
#endif
#if __GNUC__ > 3 
	s = (u8 *) __builtin_assume_aligned(s, CPU_MEMORY_ALIGNMENT);
#endif

    __m256i y2, y3, y4, y5, y6, y7;
    
    y2 = _mm256_set1_epi32(static_cast<int>(0x61616161));
    y3 = _mm256_set1_epi32(0x65656565);
    y4 = _mm256_set1_epi32(0x69696969);
    y5 = _mm256_set1_epi32(0x6F6F6F6F);
    y6 = _mm256_set1_epi32(0x75757575);
    y7 = _mm256_set1_epi32(0x79797979);
    
    for ( ; i < (size & (~31)); i += 32) {
        __m256i y8, y9, y10, y11, y12, y13;
        
        y8 = _mm256_loadu_si256( (__m256i *) &s[i]);
        y9 = y8;
        y10 = y8;
        y11 = y8;
        y12 = y8;
        y13 = y8;
        
        y8 = _mm256_cmpeq_epi8(y8, y2);
        v[0] += _mm_popcnt_u32( _mm256_movemask_epi8(y8) );
        
        y9 = _mm256_cmpeq_epi8(y9, y3);
        v[1] += _mm_popcnt_u32( _mm256_movemask_epi8(y9) );
        
        y10 = _mm256_cmpeq_epi8(y10, y4);
        v[2] += _mm_popcnt_u32( _mm256_movemask_epi8(y10) );
        
        y11 = _mm256_cmpeq_epi8(y11, y5);
        v[3] += _mm_popcnt_u32( _mm256_movemask_epi8(y11) );
        
        y12 = _mm256_cmpeq_epi8(y12, y6);
        v[4] += _mm_popcnt_u32( _mm256_movemask_epi8(y12) );
        
        y13 = _mm256_cmpeq_epi8(y13, y7);
        v[5] += _mm_popcnt_u32( _mm256_movemask_epi8(y13) );
        
    }
    
    u32 letters[26];
	memset(letters, 0, 26*sizeof(u32));
    
    // last iterations
	for ( ; i<size; ++i) {
		++letters[ s[i] - 'a' ];
	}
	
	v[0] += letters['a'-'a'];
	v[1] += letters['e'-'a'];
	v[2] += letters['i'-'a'];
	v[3] += letters['o'-'a'];
	v[4] += letters['u'-'a'];
	v[5] += letters['y'-'a'];

	
#else
	raise(SIGILL);
#endif		
}
