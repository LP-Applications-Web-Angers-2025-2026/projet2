// Version inefficace de popcnt sur 32 bits par table
u32 popcnt_table_32_loop(u32 x) {
    u32 total = 0;
    do {
        total += popcnt_table[x & 0xFF];
    } while ((x >>= 8) != 0);
    return total;
}

// Version efficace (Dépliée) de popcnt sur 32 bits par table
u32 popcnt_table_32_unroll(u32 x) {
    u32 total = popcnt_table[x & 0xFF];
    x >>= 8;
    total += popcnt_table[x & 0xFF];
    x >>= 8;
    total += popcnt_table[x & 0xFF];
    x >>= 8;
    total += popcnt_table[x & 0xFF];
    return total;
}