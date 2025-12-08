#include "common.h"
#include <xmmintrin.h>
#include <immintrin.h> // AVX 512
#include <smmintrin.h>
#include "cpp_config.h"
#include <signal.h>
#include <cstring>

#ifdef __INTEL_COMPILER
void cv_avx512_intrinsics_v1(u8 * restrict s, u32 size, u32 v[6]) {
#else
void cv_avx512_intrinsics_v1(u8 * __restrict__ s, u32 size, u32 v[6]) {
#endif
#ifdef CPU_AVX512_COMPLIANT

	u32 i = 0;
#ifdef __INTEL_COMPILER
	__assume_aligned(s, CPU_MEMORY_ALIGNMENT);
	__assume(i%CPU_MEMORY_ALIGNMENT==0);
#endif
#if __GNUC__ > 3
	s = (u8 *) __builtin_assume_aligned(s, CPU_MEMORY_ALIGNMENT);
#endif

    __m512i y2, y3, y4, y5, y6, y7;
    
    y2 = _mm512_set1_epi32(static_cast<int>(0x61616161));
    y3 = _mm512_set1_epi32(0x65656565);
    y4 = _mm512_set1_epi32(0x69696969);
    y5 = _mm512_set1_epi32(0x6F6F6F6F);
    y6 = _mm512_set1_epi32(0x75757575);
    y7 = _mm512_set1_epi32(0x79797979);
    
    for ( ; i < (size & (~63)); i+=64) {
        __m512i y8; //, y9, y10, y11, y12, y13;
        __mmask64 k1, k2, k3, k4, k5, k6;
        
        y8 = _mm512_loadu_si512( (__m512i *) &s[i]);
                
        k1 = _mm512_cmpeq_epi8_mask(y8, y2);
        v[0] += static_cast<u32>( _mm_popcnt_u64( _cvtmask64_u64(k1) ) );
        
        k2 = _mm512_cmpeq_epi8_mask(y8, y3);
        v[1] += static_cast<u32>( _mm_popcnt_u64( _cvtmask64_u64(k2) ) );
        
        k3 = _mm512_cmpeq_epi8_mask(y8, y4);
        v[2] += static_cast<u32>( _mm_popcnt_u64( _cvtmask64_u64(k3) ) );
        
        k4 = _mm512_cmpeq_epi8_mask(y8, y5);
        v[3] += static_cast<u32>( _mm_popcnt_u64( _cvtmask64_u64(k4) ) );
        
        k5 = _mm512_cmpeq_epi8_mask(y8, y6);
        v[4] += static_cast<u32>( _mm_popcnt_u64( _cvtmask64_u64(k5) ) );
        
        k6 = _mm512_cmpeq_epi8_mask(y8, y7);
        v[5] += static_cast<u32>( _mm_popcnt_u64( _cvtmask64_u64(k6) ) );
        
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
