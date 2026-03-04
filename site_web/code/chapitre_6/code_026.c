double exercise28(double *tab, int n, double k) {
    double sum = 0;
    for (int i = 0; i < n; i++)
        sum += tab[i] + k;
    return sum;
}