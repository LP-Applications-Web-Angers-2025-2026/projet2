bool est_premier_v3(int n) {
    if (n <= 3) return n > 1;
    if ((0 == n % 2) || (0 == n % 3)) return false;
    for (int i = 5; i * i <= n; i += 6)
        if ((n % i == 0) || (n % (i + 2) == 0))
            return false;
    return true;
}