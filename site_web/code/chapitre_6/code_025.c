float exercise27(int *tab, int n) {
    float sum = 0;
    for (int i = 0; i < n; i++) {
        tab[i] = tab[i] * 2;
        sum += tab[i] * 1.25f;
    }
    return sum;
}