#include "common.h"
#include <xmmintrin.h>
#include <immintrin.h> // AVX
#include <smmintrin.h>
#include "cpp_config.h"
#include <signal.h>
#include <cstring>

#ifdef __INTEL_COMPILER
void cv_sse2_intrinsics(u8 * restrict s, u32 size, u32 v[6]) {
#else
void cv_sse2_intrinsics(u8 * __restrict__ s, u32 size, u32 v[6]) {
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

    __m128i y2, y3, y4, y5, y6, y7;
    
    y2 = _mm_set1_epi32(static_cast<int>(0x61616161));
    y3 = _mm_set1_epi32(0x65656565);
    y4 = _mm_set1_epi32(0x69696969);
    y5 = _mm_set1_epi32(0x6F6F6F6F);
    y6 = _mm_set1_epi32(0x75757575);
    y7 = _mm_set1_epi32(0x79797979);
    
    register u32 va, ve, vi, vo, vu, vy;
        
    va = ve = vi = vo = vu = vy = 0;
    
    for ( ; i < (size & (~15)); i += 16) {
        __m128i y8, y9, y10, y11, y12, y13;
        
        y8 = _mm_loadu_si128( (__m128i *) &s[i]);
        y9 = y8;
        y10 = y8;
        y11 = y8;
        y12 = y8;
        y13 = y8;
        
        y8 = _mm_cmpeq_epi8(y8, y2);
        va += _mm_popcnt_u32( _mm_movemask_epi8(y8) );
        
        y9 = _mm_cmpeq_epi8(y9, y3);
        ve += _mm_popcnt_u32( _mm_movemask_epi8(y9) );
        
        y10 = _mm_cmpeq_epi8(y10, y4);
        vi += _mm_popcnt_u32( _mm_movemask_epi8(y10) );
        
        y11 = _mm_cmpeq_epi8(y11, y5);
        vo += _mm_popcnt_u32( _mm_movemask_epi8(y11) );
        
        y12 = _mm_cmpeq_epi8(y12, y6);
        vu += _mm_popcnt_u32( _mm_movemask_epi8(y12) );
        
        y13 = _mm_cmpeq_epi8(y13, y7);
        vy += _mm_popcnt_u32( _mm_movemask_epi8(y13) );
        
    }
    
    u32 letters[26];
	memset(letters, 0, 26*sizeof(u32));
    
    // last iterations
	for ( ; i<size; ++i) {
		++letters[ s[i] - 'a' ];
	}
	
	v[0] = va + letters['a'-'a'];
	v[1] = ve + letters['e'-'a'];
	v[2] = vi + letters['i'-'a'];
	v[3] = vo + letters['o'-'a'];
	v[4] = vu + letters['u'-'a'];
	v[5] = vy + letters['y'-'a'];

	
#else
	raise(SIGILL);
#endif		
}
