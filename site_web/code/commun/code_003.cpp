void count_letters(unsigned char *s, unsigned int size, unsigned int v[6]) {
    unsigned int letters[26];
    for (unsigned int i = 0; i < 26; ++i) letters[i] = 0;

    for (unsigned int i = 0; i < size; ++i) {
       ++letters[s[i] - 'a']; // Pas de if, exécution fluide
    }

    v[0] = letters['a' - 'a'];
    v[1] = letters['e' - 'a'];
    v[2] = letters['i' - 'a'];
    v[3] = letters['o' - 'a'];
    v[4] = letters['u' - 'a'];
    v[5] = letters['y' - 'a'];
}