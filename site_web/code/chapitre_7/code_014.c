float puissance(float x, int n) {
    float result = 1;
    for (int i = 0; i < n; i++)
        result *= x;
    return result;
}