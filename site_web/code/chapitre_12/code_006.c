u32 pop_count_8(u8 n) {
    u32 count_bits = 0;
    while (n) {
        if ((n & 1) != 0) count_bits++;
        n = n >> 1;
    }
    return count_bits;
}