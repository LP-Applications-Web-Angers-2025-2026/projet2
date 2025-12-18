 u32pop_count_8(u8n){
    u32count_bits =0;

    while (n){
        if((n&1)!=0)++count_bits;
        n=n>> 1;
    }
    return count_bits;
}
