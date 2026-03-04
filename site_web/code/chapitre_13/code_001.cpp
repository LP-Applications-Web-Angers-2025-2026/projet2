f32 saxpy_ref(f32* x, f32* y, f32 a, u32 size) {
    f32 sum = 0.0f;
    for (u32 i = 0; i < size; i++) {
        y[i] = a * x[i] + y[i];
        sum += y[i];
    }
    return sum;
}