// on teste les nombres de 1 a un million
const int N = 1000000;
// tableau qui indique si un nombre est premier ou non
bool *tab = new bool[N + 1];
// 0 et 1 ne sont pas premiers
tab[0] = false;
tab[1] = false;
// tous les autres nombres sont initialement premiers
for (int i = 2; i <= N; i++) tab[i] = true;
// on élimine les multiples de chaque nombre
int n = 2;
while (n <= N) {
    if (tab[n])
        for (int j = 2 * n; j < N; j += n) tab[j] = false;
    ++n;
}
}