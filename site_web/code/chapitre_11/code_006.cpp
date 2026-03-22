#define a(y,x) A[(y)*dim+(x)]
#define b(y,x) B[(y)*dim+(x)]
#define c(y,x) C[(y)*dim+(x)]

void mp_reference(f32* A, f32* B, f32* C, u32 dim) {
    for (u32 i = 0; i < dim; i++) {
        for (u32 j = 0; j < dim; j++) {
            f32 sum = 0.0f;
            for (u32 k = 0; k < dim; k++) {
                sum += a(i,k) * b(k,j);
            }
            c(i,j) = sum;
        }
    }
}