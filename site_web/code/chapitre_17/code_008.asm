mov ,0x51EB851F ; edi = 0.01
mov ,9 ; indice dans digits
cmp ,10 ; si x < 10 alors traduire
jl ; directement
5.while_x_ge_10:
mov ,eax ; on sauvegarde x
mul ; on multiplie par 0.01
shr ,5 ; on décale edx de 5 rangs à droite
; on calcule ensuite le reste de la division
lea ,edx+edx*4]; esi = 5 * (x/100)
lea ,esi+esi*4]; eax = 5 * (5 * (x/100))
shl ,2 ; eax = 4 * 25 * (x/100)
sub ,eax ; obtenir le reste
mov ,edx ; eax = x/100
movzx ,word[values_100+ebx*2]
sub ,2
mov [esp+ecx+16],dx
movzx ,dh
xor ,dh
inc [esp+ebx]
inc [esp+edx]
cmp ,10
jge
24.x_lt_10:
cmp ,0
jz
inc [esp+eax]
dec
mov [esp+ecx+16],al