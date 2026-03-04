u8 bits_table[256] = {0, 1, 1, 2, 1, 2, 2, 3, /* ... jusqu'à 255 */};

u32 pop_count_8(u8 n) {
    return bits_table[n];
}