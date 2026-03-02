movss ,rdi]
add ,4 ; ++tab
divss ,xmm0 ; xmm1.ps[0] /= a
addss ,xmm1 ; s += tab[i] / a
cmp ,rax ; si &t[i] < &tab[N] alors boucler
jne
13.end:
movaps ,xmm2 ; résultat placé dans xmm0
ret