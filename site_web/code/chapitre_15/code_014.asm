movdqu ,rdi+rcx]
movdqu ,xmm8 ; xmm9 = xmm8
movdqu ,xmm8 ; ...
movdqu ,xmm8
movdqu ,xmm8
movdqu ,xmm8 ; xmm13 = xmm8
; 'a' ; trouver 'a'
pcmpeqb ,xmm2 ; comparer s[i:i+15] à ['a',...,'a']
pmovmskb ,xmm8 ; xmm8.b[i] = 0xFF si s[i] == 'a'
popcnt ,ebx ; compter le nombre de 'a'
add ,rbx ; ajouter au compteur de 'a'
; 'e'
pcmpeqb ,xmm3
pmovmskb ,xmm9
popcnt ,ebx
add ,rbx
...
add ,16 ; 16 prochains caractères
jmp
28.end_for: