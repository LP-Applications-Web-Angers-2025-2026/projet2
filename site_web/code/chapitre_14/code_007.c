#include <immintrin.h>

u32 fitch_intrin(u8* __restrict__ x, u8* __restrict__ y, u8* __restrict__ z, u32 size) {
    u32 i, mutations = 0;
    x = (u8*)__builtin_assume_aligned(x, 32);
    y = (u8*)__builtin_assume_aligned(y, 32);
    z = (u8*)__builtin_assume_aligned(z, 32);

    __m256i v_x, v_y, v_z, v_x_and_y, v_x_or_y, v_zero, v_cmp;
    v_zero = _mm256_setzero_si256();

    for(i = 0; i < (size & ~31); i += 32) {
        v_x = _mm256_load_si256((__m256i*)&x[i]);
        v_y = _mm256_load_si256((__m256i*)&y[i]);

        v_x_and_y = _mm256_and_si256(v_x, v_y);
        v_x_or_y  = _mm256_or_si256(v_x, v_y);

        v_cmp = _mm256_cmpeq_epi8(v_zero, v_x_and_y);

        u32 r = _mm256_movemask_epi8(v_cmp);
        mutations += _mm_popcnt_u32(r); 

        // Ou en AVX2 natif : v_z = _mm256_blendv_epi8(v_x_and_y, v_x_or_y, v_cmp)
        v_x = _mm256_andnot_si256(v_cmp, v_x_and_y);
        v_y = _mm256_and_si256(v_cmp, v_x_or_y);
        v_z = _mm256_or_si256(v_x, v_y);

        _mm256_store_si256((__m256i*)&z[i], v_z);
    }
    // ... fin de traitement
    return mutations;
}