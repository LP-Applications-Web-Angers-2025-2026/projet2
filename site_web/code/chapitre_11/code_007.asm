mov ,ebp+20]
4.for_j:
cmp ,edx ; fin de boucle si j >= dim
jge
movdqu ,esi+ecx*4]
movdqu ,edi+ecx*4]
mulps ,xmm0 ; xmm1 = <a(i,k)*b(k,j+3), ... >
addps ,xmm1
movdqu[edi+ecx*4],xmm2
add ,4 ; j += 4
jmp
16.endfor_j: