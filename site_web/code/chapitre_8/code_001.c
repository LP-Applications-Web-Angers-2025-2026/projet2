float v1[4], v2[4], v3[4];

void vector_sum(float* x, float* y, float* z, int n) {
    for (int i = 0; i < 4; i++) {
        z[i] = x[i] + y[i];
    }
}

vector_sum(v1, v2, v3, 4);