u32 method_3(u32 *t, u32 n) {
    u32 sum = 0;
    for (u32 i = 0; i < n; i++) {
        u32 input = t[i];
        u32 output;
        asm("bsr %0, %1" : "=r"(output) : "r"(input));
        sum += output;
    }
    return sum;
}