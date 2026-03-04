mov ,ebp-4]
mul [ebp+20] *dim
mov ,eax ; i*size
mov ,eax ; i*size
add ,ecx ; i*size+k
shl ,2 ; (i*size)*sizeof(float)
shl ,2 ; (i*size+k)*sizeof(float)
add ,ebp+8] *size+k]
add ,ebp+16] *size]
movss ,ebx]
pshufd ,xmm0,0 ; recopie dans xmm0
mov ,ecx ; k
mul [ebp+20] *size
shl ,2 ; k*size*sizeof(float)
mov ,ebp+12]
add ,eax ; b[k*size]
<<<3>>>