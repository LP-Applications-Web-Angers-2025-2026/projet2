mov ,esp+12]
vmovdqa ,avx_vect0]
vmovdqa ,avx_vect1]
sub ,32
mov ,ecx
and ,7
shr ,3 ; / 8
jz
18.while_ur8:
vpaddd ,ymm1
vpaddd ,ymm0
vpaddd ,ymm1
vpaddd ,ymm0
vpaddd ,ymm1
vpaddd ,ymm0
vpaddd ,ymm1
vpaddd ,ymm0
dec
jnz
31.last_7:
vmovdqu[esp],ymm0
mov ,esp+eax*4]
add ,32
ret