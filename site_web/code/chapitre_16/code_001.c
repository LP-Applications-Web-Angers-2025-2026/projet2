u32 fib_rec(u32 n) {
    if (n <= 1) {
        return n;
    } else {
        return fib_rec(n-1) + fib_rec(n-2);
    }
}