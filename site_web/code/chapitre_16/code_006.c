u32 fib_iter(u32 f0, u32 f1, u32 n) {
    while (n != 0) {
        u32 tmp = f1;
        f1 += f0;
        f0 = tmp;
        --n;
    }
    return f0;
}