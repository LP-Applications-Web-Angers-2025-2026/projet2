mov ,esp+12]
movdqa ,sse_vect0]
movdqa ,sse_vect1]
mov ,ecx
and ,3
sub ,16 ; espace pour stockage du résultat
shr ,2 ; / 4
jz
14.while_ur4: ; dépliage par 4
paddd ,xmm1
paddd ,xmm0
paddd ,xmm1
paddd ,xmm0
dec
jnz
23.last_3:
vmovdqu[esp],xmm0 ; stockage du résultat
mov ,esp+eax*4]
add ,16
ret