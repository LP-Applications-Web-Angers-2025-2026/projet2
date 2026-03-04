mov ,array
xorps ,xmm0 ; xmm0 = sum = 0.0
xor ,ecx ; i = 0
4for_i:
cmp ,320000 ; fin, si i >= 320000
jge
addss ,ebx+ecx*4+0]
addss ,ebx+ecx*4+4]
addss ,ebx+ecx*4+8]
addss ,ebx+ecx*4+12]
addss ,ebx+ecx*4+16]
addss ,ebx+ecx*4+20]
addss ,ebx+ecx*4+24]
addss ,ebx+ecx*4+28]
add ,8 ; i += 8
jmp
17endfor_i: