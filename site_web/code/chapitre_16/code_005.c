u32 fib_arr(u32 f0, u32 f1, u32 n) {
    if (n <= 1) return n;
    u32 data[48];                    // Ou un malloc global
    data[0] = f0;
    data[1] = f1;
    u32 i = 2;
    while (i <= n) {
        data[i] = data[i-1] + data[i-2];
        ++i;
    }
    return data[i-1];
}