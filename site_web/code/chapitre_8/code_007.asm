mov [rsp],rdi
mov [rsp+8],rsi
mov [rsp+16],rdx
mov [rsp+24],rcx
mov [rsp+32],r8
mov [rsp+40],rax
lea ,str_sse_int]
movdqu[rsp+56], 1
mov ,rsp+56]
mov ,rsp+60]
mov ,rsp+64]
mov ,rsp+68]
xor ,rax
call WRT..plt
mov ,rsp+40]
mov ,rsp+32]
mov ,rsp+24]
mov ,rsp+16]
mov ,rsp+8]
mov ,rsp]
add ,128+16+8*6
34%endmacro
36%macro print_sse_flt 1
sub ,128+5*16
movdqu[rsp+16],xmm0 ; sauvegarde des registres
movdqu[rsp+32],xmm1 ; utilisé pour le passage
movdqu[rsp+48],xmm2 ; des flottants
movdqu[rsp+64],xmm3
movdqu[rsp], 1
cvtss2sd ,rsp]
cvtss2sd ,rsp+4]
cvtss2sd ,rsp+8]
cvtss2sd ,rsp+12]
lea ,str_sse_flt]
mov ,4
call WRT..plt
movdqu ,rsp+64]
movdqu ,rsp+48]
movdqu ,rsp+32]
movdqu ,rsp+16]
add ,128+5*16
55%endmacro