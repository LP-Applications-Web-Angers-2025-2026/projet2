void cv_if(unsigned char *s, unsigned int size, unsigned int v[6]) {
    for (unsigned int i = 0; i < size; ++i) {
        if (s[i] == 'a') {
            ++v[0];
        } else if (s[i] == 'e') {
            ++v[1];
        } else if (s[i] == 'i') {
            ++v[2];
        } else if (s[i] == 'o') {
            ++v[3];
        } else if (s[i] == 'u') {
            ++v[4];
        } else if (s[i] == 'y') {
            ++v[5];
        }
    }
}