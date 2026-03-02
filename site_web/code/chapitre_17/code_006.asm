push
mov ,esp
; ... identique à ad_asm_v1 ...
mov ,0xCCCCCCCD ; 0.1 dans edi
mov ,9
cmp ,10
jl
9.while_x_ge_10:
mov ,eax ; sauvegarde de x dans ebx
mul ; edx:eax <- x * 0.1
shr ,3 ; edx <- edx / 8 (éq. x/10)
lea ,edx+edx*4]
shl ,1 ; esi = 2*5*(x/10)
sub ,esi ; calcul du reste u de la division
dec ; --i
inc [esp+ebx]
mov [esp+ecx+16],bl ; digits[ i ] = u
mov ,edx ; eax <- x/10
cmp ,10
jge
22.x_lt_10:
; ... identique à ad_asm_v1 ...
mov ,ebp
pop
ret