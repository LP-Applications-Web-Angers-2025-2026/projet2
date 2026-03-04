bool ad_div(u32 x) {
    u8 counts[10] = {0,0,0,0,0,0,0,0,0,0};
    u8 digits[10];

    // convertir x et compter les occurrences
    i32 i = 0;
    while(x != 0) {
        u32 u = x % 10;
        digits[i++] = u;
        ++counts[u];
        x = x / 10;
    }

    // comparer le nombre d'occurrences avec les chiffres
    --i;
    for(i32 j=0; i >= 0; --i, ++j) {
        if(digits[i] != counts[j]) return false;
    }
    return true;
}