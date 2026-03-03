void tri_bulles(int t[], int n) {
  for (int i = n - 1; i > 0; i--)
      for (int j = 0; j < i; j++)
          if (t[j] > t[j + 1])
              swap(t[j], t[j + 1]);
}