void mp_tile_bxb_v4(f32* A, f32* B, f32* C, u32 size) {
    for (u32 i = 0; i < size; i += BLOCK_DIM) {
        for (u32 j = 0; j < size; j += BLOCK_DIM) {
            for (u32 k = 0; k < size; k += BLOCK_DIM) {
                // À l'intérieur du bloc : Inversion j,k optimisée
                for (u32 ib = i; ib < min(i + BLOCK_DIM, size); ib++) {
                    for (u32 kb = k; kb < min(k + BLOCK_DIM, size); kb++) {
                        f32* aib = a(ib, 0); // Pour optimisation adresse
                        f32* cib = c(ib, 0);
                        for (u32 jb = j; jb < min(j + BLOCK_DIM, size); jb++) {
                            cib[jb] += aib[kb] * b(kb, jb);
                        }
                    }
                }
            }
        }
    }
}