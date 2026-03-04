void set(u32 n) {
    tab_process_bits[n/8] |= (1 << (n%8));
}

void unset(u32 n) {
    tab_process_bits[n/8] &= ~(1 << (n%8));
}

bool use(u32 n) {
    return (tab_process_bits[n/8] & (1 << (n%8))) != 0;
}

u32 count() {
    u32 total = 0;
    for (u32 i = 0; i < MAX_RECORDS_IN_BYTES; i++) {
        total += pop_count_8(tab_process_bits[i]);
    }
    return total;
}