u32 fib_rec_improved(u32 n) {
    if (n <= 1) return n;
    if (n % 2 == 1) {
        u32 k = (n + 1) >> 1;
        u32 f1 = fib_rec_improved(k - 1);
        u32 f2 = fib_rec_improved(k);
        return (f1 * f1 + f2 * f2);
    } else {
        u32 k = n >> 1;
        u32 f1 = fib_rec_improved(k - 1);
        u32 f2 = fib_rec_improved(k);
        return (2 * f1 + f2) * f2;
    }
}