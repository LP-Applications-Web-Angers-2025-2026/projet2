float sum(float *t, int n, float a) {
    float s = 0;
    for (int i = 0; i < n; i++)
        s = s + t[i] / a;
    return s;
}