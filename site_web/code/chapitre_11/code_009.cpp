void mp_inv_jk(f32* A, f32* B, f32* C, u32 dim) {
    for (u32 i = 0; i < dim; i++) {
        for (u32 k = 0; k < dim; k++) {
            for (u32 j = 0; j < dim; j++) {
                c(i,j) += a(i,k) * b(k,j);
            }
        }
    }
}