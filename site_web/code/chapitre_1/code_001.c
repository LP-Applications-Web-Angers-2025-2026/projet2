// fonction qui implante bsr (bit scan reverse)
u32 function_bsr(u32 a) {
    for (int i = 31; i >= 0; i--)
        if ((a & (1 << i)) != 0) return (u32)i;
    return 0;
}
// retourne la somme des bsr(t[i]) pour i dans [0..n-1]
u32 method_1(u32 *t, u32 n) {
    u32 sum = 0;
    for (u32 i = 0; i < n; i++)
        sum += function_bsr(t[i]);
    return sum;
}