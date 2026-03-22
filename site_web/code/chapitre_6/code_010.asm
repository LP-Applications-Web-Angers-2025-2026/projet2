movss ,rdi]
add ,4 ; ++tab
divss ,xmm0 ; xmm1.ps[0] /= a
addss ,xmm1 ; s += xmm1.ps[O]
cmp ,rax ; si &t[i] < &tab[N] alors boucler
jne
movaps ,xmm2 ; résultat placé dans xmm0
ret
16.L4:
pxor ,xmm2 ; résultat mis à 0
movaps ,xmm2 ; et placé dans xmm0
ret