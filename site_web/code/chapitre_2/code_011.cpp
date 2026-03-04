void find_a_s(u32 d) {
    // on calcule 1/d sous forme d'une double
    double ratio = 1.0 / d;
    u64 *a = (u64*)&ratio;
    // décalage de 11 bits (exposant)
    // et on fixe le bit de la mantisse tronquée
    // on décale ensuite de 32 bits
    *a = ((*a << 11) | 0x8000000000000000) >> 32;
    // on fixe le bit de poids faible
    *a = *a | 0x01;
    u32 shift;
    u64 prod = (*a) * d;
    for (shift = 32; shift < 63; shift++) {
        u64 r = prod >> shift;
        if (r == 1)
            break;
    }
    cout << "a=" << hex << *a << endl;
    cout << "s=" << dec << shift << endl;
}