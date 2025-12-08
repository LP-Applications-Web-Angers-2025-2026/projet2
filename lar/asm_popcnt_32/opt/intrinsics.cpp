#include <xmmintrin.h>
#include <pmmintrin.h>

typedef unsigned char u8;
typedef unsigned int u32;

#define CPU_MEMORY_ALIGNMENT 32

static const char *popcnt_table __attribute__((aligned(16))) =  
    "\0\1\1\2\1\2\2\3\1\2\2\3\2\3\3\4"	\
    "\1\2\2\3\2\3\3\4\2\3\3\4\3\4\4\5"		\
    "\1\2\2\3\2\3\3\4\2\3\3\4\3\4\4\5"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\1\2\2\3\2\3\3\4\2\3\3\4\3\4\4\5"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\3\4\4\5\4\5\5\6\4\5\5\6\5\6\6\7"		\
    "\1\2\2\3\2\3\3\4\2\3\3\4\3\4\4\5"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\3\4\4\5\4\5\5\6\4\5\5\6\5\6\6\7"		\
    "\2\3\3\4\3\4\4\5\3\4\4\5\4\5\5\6"		\
    "\3\4\4\5\4\5\5\6\4\5\5\6\5\6\6\7"		\
    "\3\4\4\5\4\5\5\6\4\5\5\6\5\6\6\7"		\
    "\4\5\5\6\5\6\6\7\5\6\6\7\6\7\7\10";
    
u32 lower_qword(__m128i v) {
	__m128i w;
	u32 r = _mm_cvtsi128_si32(v);
	w = _mm_shuffle_epi32(v, 1); 
	return r + _mm_cvtsi128_si32(w);
}

u32 higher_qword(__m128i v) {
	return lower_qword(_mm_unpackhi_epi64(v, v));
}


u32 u8_popcnt_intrinsics(u8* __restrict__ x, u32 size) {
	u32 i = 0;

	x = (u8 *) __builtin_assume_aligned(x, CPU_MEMORY_ALIGNMENT);

	const __m128i xm1  = _mm_set1_epi8(0x55);
	const __m128i xm2  = _mm_set1_epi8(0x33);
	const __m128i xm4 = _mm_set1_epi8(0x0f);

	__m128i acc = _mm_setzero_si128();

	for (i = 0; i < (size & ~63); i += 64) {
		__m128i partial = _mm_setzero_si128();
		
		{
		__m128i t1, t2, t3, t4;
		
		t1 = _mm_loadu_si128(reinterpret_cast<const __m128i*>(x + i)); 
		t2 = _mm_sub_epi8(t1, _mm_and_si128( _mm_srli_epi16(t1, 1), xm1) ); 
		t3 = _mm_add_epi8(_mm_and_si128(t2, xm2), _mm_and_si128( _mm_srli_epi16(t2, 2), xm2) ); 
		t4 = _mm_and_si128( _mm_add_epi8(t3, _mm_srli_epi16(t3, 4)),  xm4); 
		partial = _mm_add_epi8(partial, t4); 
		}
		
		{
		__m128i t1, t2, t3, t4;
		
		t1 = _mm_loadu_si128(reinterpret_cast<const __m128i*>(x + i + 16)); 
		t2 = _mm_sub_epi8(t1, _mm_and_si128( _mm_srli_epi16(t1, 1), xm1) ); 
		t3 = _mm_add_epi8(_mm_and_si128(t2, xm2), _mm_and_si128( _mm_srli_epi16(t2, 2), xm2) ); 
		t4 = _mm_and_si128( _mm_add_epi8(t3, _mm_srli_epi16(t3, 4)),  xm4); 
		partial = _mm_add_epi8(partial, t4); 
		}
		
		{
		__m128i t1, t2, t3, t4;
	
		t1 = _mm_loadu_si128(reinterpret_cast<const __m128i*>(x + i + 32)); 
		t2 = _mm_sub_epi8(t1, _mm_and_si128( _mm_srli_epi16(t1, 1), xm1) ); 
		t3 = _mm_add_epi8(_mm_and_si128(t2, xm2), _mm_and_si128( _mm_srli_epi16(t2, 2), xm2) ); 
		t4 = _mm_and_si128( _mm_add_epi8(t3, _mm_srli_epi16(t3, 4)),  xm4); 
		partial = _mm_add_epi8(partial, t4); 
		}
		
		{
		__m128i t1, t2, t3, t4;
		
		t1 = _mm_loadu_si128(reinterpret_cast<const __m128i*>(x + i + 48)); 
		t2 = _mm_sub_epi8(t1, _mm_and_si128( _mm_srli_epi16(t1, 1), xm1) ); 
		t3 = _mm_add_epi8(_mm_and_si128(t2, xm2), _mm_and_si128( _mm_srli_epi16(t2, 2), xm2) ); 
		t4 = _mm_and_si128( _mm_add_epi8(t3, _mm_srli_epi16(t3, 4)),  xm4);  
		partial = _mm_add_epi8(partial, t4); 
		}
		
		acc = _mm_add_epi64(acc, _mm_sad_epu8(partial, _mm_setzero_si128()));
	}
	
	u32 result = lower_qword(acc) + higher_qword(acc);

	for ( ; i < size; i++) {
		result += popcnt_table[ x[i] ];
	}

	return result;
}

