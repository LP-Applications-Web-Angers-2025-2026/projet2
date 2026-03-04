u32 popcnt_table_opt(u8* x, u32 size) {
    u32 count = 0, i;
    u32* y = (u32*)x;

    for (i = 0; i < (size & ~3); i += 4) {
        count += popcnt_table_u32(*y++);
    }
    // ... reliquat
}