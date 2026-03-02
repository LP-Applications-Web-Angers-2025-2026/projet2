mov ,array
xorps ,xmm0 ; xmm0 = sum1 = 0.0
xorps ,xmm1 ; xmm1 = sum2 = 0.0
xorps ,xmm2 ; xmm2 = sum3 = 0.0
xorps ,xmm3 ; xmm3 = sum4 = 0.0
xor ,ecx ; i = 0
7for_i:
cmp ,320000 ; fin de boucle si i >= 320000
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
20endfor_i:
addss ,xmm1 ; sum1 += sum2
addss ,xmm3 ; sum3 += sum4
addss ,xmm2 ; sum1 += sum3