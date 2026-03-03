// nombre d'enregistrements
const int N = 7000000;
// nombre de champs
const int P = 10;
int *enr = new int[N * P];
void cherche_doublons(int *enr, bool *elimine) {
    for (int i = 0; i < N - 1; i++)
        for (int j = i + 1; j < N; j++)
            if (identique(&enr[i * P], &enr[j * P]))
                elimine[j] = true;
}