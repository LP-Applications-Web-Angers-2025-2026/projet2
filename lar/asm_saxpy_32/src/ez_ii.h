/*
 *
 *  Created on: March 16, 2020
 *      Author: Jean-Michel Richer
 * 
 * Interface to Intrinsics
 */
#ifndef EZ_INTRINSICS_INTERFACE
#define EZ_INTRINSICS_INTERFACE

#include "common.h"
#include <xmmintrin.h>
#include <immintrin.h>
#include <smmintrin.h>
#include <iostream>

namespace ez {
    
namespace ii {    

/**
 * Configuration of print mode 
 */
enum class IntegerType  {
    BYTE = 1,           // u8
    WORD = 2,           // u16
    DOUBLE_WORD = 3,    // u32
    QUAD_WORD = 4,      // u64
    
    SBYTE = -1,           // i8
    SWORD = -2,           // i16
    SDOUBLE_WORD = -3,    // i32
    SQUAD_WORD = -4,      // i64

};

// ==================================================================
// Types
// ==================================================================
#define i128 __m128i
#define d128 __m128d
#define f128 __m128

#define i256 __m256i
#define d256 __m256d
#define f256 __m256

#ifdef AVX512_COMPLIANT
#define i512 __m512i
#define d512 __m512d
#define f512 __m512
#endif

void split_as(IntegerType type);


void print_i128(std::ostream& out, i128 reg);
void print_f128(std::ostream& out, f128 reg);
void print_d128(std::ostream& out, d128 reg);

void print_i256(std::ostream& out, i256 reg);
void print_f256(std::ostream& out, f256 reg);
void print_d256(std::ostream& out, d256 reg);

#ifdef __INTEL_COMPILER
#define assume_aligned(x, type, boundary) __assume_aligned(x, boundary)
#define assume_condition(cond) __assume(cond)
#define restricted_access(type,x) type restrict x
#endif

#if __GNUC__ > 3 
#define assume_aligned(x, type, boundary) x = (type) __builtin_assume_aligned(x, boundary)
#define assume_condition(cond) do { if (!(cond)) __builtin_unreachable(); } while (0)
#define Restrict __restrict__
#define restricted_access(type, x) type __restrict__ x
#endif


// ==================================================================
// SSE
// ==================================================================
#define sse_lda_i128(x)            _mm_load_si128 ((__m128i *) x)
#define sse_ldu_i128(x)            _mm_loadu_si128((__m128i *) x)
#define sse_sta_i128(x,y)          _mm_store_si128((__m128i *) x, y)
#define sse_stu_i128(x,y)          _mm_storeu_si128((__m128i *) x, y)

#define sse_ld_i32(i32)             _mm_cvtsi32_si128(i32)
#define sse_ld_i64(i64)             _mm_cvtsi64_si128(i64)

#define sse_st_i32(x)               _mm_cvtsi128_si32(x)
#define sse_st_i64(x)               _mm_cvtsi128_si64(x)

#define sse_lda_f128(x)            _mm_load_ps ((__m128i *) x)
#define sse_ldu_f128(x)            _mm_loadu_ps((__m128i *) x)
#define sse_sta_f128(x,y)          _mm_store_ps((__m128i *) x, y)
#define sse_stu_f128(x,y)          _mm_storeu_ps((__m128i *) x, y)

#define sse_ld_f32(pf32)           _mm_load_ss(pf32)
#define sse_ld_f64(pf64)           _mm_load_sd(pf64)

#define sse_st_f32(pf32,x)         _mm_store_ss(pf32,x)
#define sse_st_f64(pf64,x)         _mm_store_sd(pf64,x)
#define sse_get_f32(x)             _mm_cvtss_f32(x)

#define sse_mv_f32(x,y)            _mm_move_ss(x,y)
#define sse_mv_f64(x,y)            _mm_move_sd(x,y)

#define sse_set_i4x32(e0, e1, e2, e3)   _mm_set_epi32(e3, e2, e1, e0)
#define sse_set_f4x32(e0, e1, e2, e3)   _mm_set_ps(e3, e2, e1, e0)
#define sse_set_d2x64(e0, e1)           _mm_set_pd(e1, e0)

#define sse_shuffle_i4x32(x,y,c8)       _mm_shuffle_epi32(x,y,c8)
#define sse_shuffle_f4x32(x,y,c8)       _mm_shuffle_ps(x,y,c8)

#define sse_and_i128(x,y)               _mm_and_si128(x,y)
#define sse_or_i128(x,y)                _mm_or_si128(x,y)
#define sse_xor_i128(x,y)               _mm_xor_si128(x,y)

#define sse_equal_i16x8(x,y)            _mm_cmpeq_epi8(x, y)                 
#define sse_mv_mask(x)                  _mm_movemask_epi8(x)

#define sse_add_f4x32(x,y)              _mm_add_ps(x,y)


#define popcnt_i32(i32)                 _mm_popcnt_u32(i32)
#define popcnt_i64(i64)                 _mm_popcnt_u64(i64)

// ==================================================================
// AVX
// ==================================================================

#define avx_lda_i256(x)            _mm256_load_si256((__m256i *) x)
#define avx_ldu_i256(x)            _mm256_loadu_si256((__m256i *) x)
#define avx_sta_i256(x,y)          _mm256_store_si256((__m256i *) x, y)
#define avx_stu_i256(x,y)          _mm256_storeu_si256((__m256i *) x, y)

#define avx_ld_i32(i32)             _mm_cvtsi32_si128(i32)
#define avx_ld_i64(i64)             _mm_cvtsi64_si128(i64)

#define avx_lda_f256(pf32)        _mm256_load_ps(pf32)
#define avx_ldu_f256(pf32)        _mm256_loadu_ps(pf32)
#define avx_sta_f256(pf32,y)      _mm256_store_ps(pf32,y)
#define avx_stu_f256(pf32,y)      _mm256_storeu_ps(pf32,y)



#define avx_bcast_1x8(i8)       _mm256_set1_epi8(i8)
#define avx_and_i256(x,y)       _mm256_and_si256(x,y)
#define avx_or_i256(x,y)        _mm256_or_si256(x,y)
#define avx_xor_i256(x,y)       _mm256_xor_si256(x,y)

#define avx_bcast_i32(i32)      _mm256_set1_epi32(i32)
#define avx_bcast_f32(f32)      _mm256_set1_ps(f32)

#define avx_equal_i32x8(x,y)    _mm256_cmpeq_epi8(x,y)
#define avx_mv_mask(x)          _mm256_movemask_epi8(x)

#define avx_blend_i32x8(x,y,z)  _mm256_blendv_epi8(x,y,z)

#define avx_mul_f8x32(x,y)      _mm256_mul_ps(x,y)
#define avx_add_f8x32(x,y)      _mm256_add_ps(x,y)
#define avx_zero_f256()         _mm256_setzero_ps()
#define avx_hadd_f8x32(x,y)     _mm256_hadd_ps(x,y)
#define avx_to_sse_lo(x)        _mm256_extractf128_ps((__m256)x, 0)
#define avx_to_sse_hi(x)        _mm256_extractf128_ps((__m256)x, 1)

#define avx_fmadd231(x,y,z)         _mm256_fmadd_ps(x,y,z) 


// ==================================================================
// AVX512
// ==================================================================


std::ostream& operator<<(std::ostream& out, i128 reg);
std::ostream& operator<<(std::ostream& out, f128 reg);
std::ostream& operator<<(std::ostream& out, f128 reg);
std::ostream& operator<<(std::ostream& out, d128 reg);
std::ostream& operator<<(std::ostream& out, i256 reg);
std::ostream& operator<<(std::ostream& out, f256 reg) ;
std::ostream& operator<<(std::ostream& out, d256 reg);

} // end of namespace ii

} // end of namespace ez





#endif
