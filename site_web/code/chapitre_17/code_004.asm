mov ,10 ; constante 10 pour division par 10
mov ,9 ; i = 9, indice pour tableau digits
cmp ,10 ; si x < 10 alors aller en .x_lt_10
jl
6.while_x_ge_10: ; tantque x >= 10 faire
xor ,edx
div ; u, x = x % 10, x / 10
inc [esp+edx]
dec ; digits[ --i ] = u
mov [esp+ecx+16],dl
cmp ,10
jge ; fin tantque
; si x < 10, il n'est pas nécessaire de diviser
15.x_lt_10:
cmp ,0 ; si x == 0 alors aller en .next
jz
inc [esp+eax]
dec ; digits[ --i ] = x
mov [esp+ecx+16],al