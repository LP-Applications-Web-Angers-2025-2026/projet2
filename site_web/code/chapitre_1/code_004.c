bool est_premier_v2(int n) {
    if (n <= 1) return false;
    if (n <= 3) return true;
    // est-ce un nombre pair ?
    if ((n % 2) == 0) return false;
    // chercher les diviseurs impairs jusqu'à la racine carrée de n
    int limit = static_cast<int>(floor(sqrt(n)));
    for (int k = 3; k <= limit; k += 2)
        if ((n % k) == 0) return false;
    return true;
}