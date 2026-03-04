u32 fib_ref(u32 f0, u32 f1, u32 n) {
    if (n == 0) {
        return f0;
    } else {
        return fib_ref(f1, f0 + f1, n - 1);
    }
}
// Appel initial :
// u32 fn = fib_ref(0, 1, n);