void count_switch(unsigned char *s, unsigned int size, unsigned int v[6]) {
    for (unsigned int i = 0; i < size; ++i) {
        switch(s[i]) {
            case 'a': ++v[0]; break;
            case 'e': ++v[1]; break;
            case 'i': ++v[2]; break;
            case 'o': ++v[3]; break;
            case 'u': ++v[4]; break;
            case 'y': ++v[5]; break;
        }
    }
}