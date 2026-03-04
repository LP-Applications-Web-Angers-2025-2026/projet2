u32 pop_count_8_noif(u8 n) {
    u32 count_bits = 0;
    while (n) {
        count_bits += (n & 1);
        n = n >> 1;
    }
    return count_bits;
}