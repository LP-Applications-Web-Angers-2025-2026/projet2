void mp_tile_4x4(float* A, float* B, float* C, u32 dim) {
    __m128 row1 = _mm_load_ps(&B[0]);
    __m128 row2 = _mm_load_ps(&B[dim]);
    __m128 row3 = _mm_load_ps(&B[2*dim]);
    __m128 row4 = _mm_load_ps(&B[3*dim]);

    for (int i=0; i<4; i++) {
        __m128 dup1 = _mm_set1_ps(A[dim*i + 0]);
        __m128 dup2 = _mm_set1_ps(A[dim*i + 1]);
        __m128 dup3 = _mm_set1_ps(A[dim*i + 2]);
        __m128 dup4 = _mm_set1_ps(A[dim*i + 3]);

        __m128 sum1 = _mm_add_ps(_mm_mul_ps(dup1, row1), _mm_mul_ps(dup2, row2));
        __m128 sum2 = _mm_add_ps(_mm_mul_ps(dup3, row3), _mm_mul_ps(dup4, row4));
        __m128 row  = _mm_add_ps(sum1, sum2);

        __m128 old_row = _mm_load_ps(&C[dim*i]);
        row = _mm_add_ps(row, old_row);
        _mm_store_ps(&C[dim*i], row);
    }
}