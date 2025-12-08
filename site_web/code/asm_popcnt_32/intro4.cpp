voidset(u32n){
    tab_process_bits[n/8] |= 1<<(n%8);
}

voidunset(u32n){
    tab_process_bits[n/8] &=~(1 <<(n%8));
}

booluse(u32n){
    return (tab_process_bits[n/8]&(1<<(n% 8)))!= 0;
}

u32count(){
    u32 total = 0;
    for (u32i = 0; i < MAX_RECORDS_IN_BYTES; ++i){
        total += pop_count_8( tab_process_bits[i]);
    }
    return total;
}