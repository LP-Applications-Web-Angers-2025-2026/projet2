bool est_premier(int n) {
    if (n < 0) return false;
    int nbr_diviseurs = 0;
    for (int i = 1; i <= n; i++)
        if ((n % i) == 0) nbr_diviseurs++;
    return (nbr_diviseurs == 2);
}