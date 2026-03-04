#include <immintrin.h>

void sum_intrinsics_sse(int* u, int* v, int size) {
    int i = 0;
    for (; i < (size & ~3); i += 4) {   // Equivalent à i < size - (size%4)
        // charger quatre entiers de chaque tableau (unaligned)
        __m128i x1 = _mm_loadu_si128((__m128i*) &u[i]);
        __m128i x2 = _mm_loadu_si128((__m128i*) &v[i]);

        // additionner en parallèle
        x1 = _mm_add_epi32(x1, x2);

        // stocker le résultat
        _mm_storeu_si128((__m128i*) &u[i], x1);
    }

    // traiter le reliquat (si non multiple de 4)
    while (i < size) {
        u[i] = u[i] + v[i];
        i++;
    }
}