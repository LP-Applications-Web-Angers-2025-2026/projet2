movdqa ,esi+ecx]
; x = x - (x >> 1) & 0x5555... 5 (version 2)
vpsrlw ,xmm0,1
vpand ,xmm4
vpsubw ,xmm1
; x = (x & m2) + ((x >> 2) & m2);
vpand ,xmm0,xmm5
vpsrlw ,xmm0,2
vpand ,xmm5
vpaddw ,xmm1,xmm2
; x = (x & m4) + ((x >> 4)) & m4);
vpand ,xmm0,xmm6
vpsrlw ,xmm0,4
vpand ,xmm6
vpaddw ,xmm1,xmm2
; x = (x & m5) + ((x >> 8)) & m5);
vpand ,xmm0,xmm7
vpsrlw ,xmm0,8
vpand ,xmm7
vpaddw ,xmm1,xmm2
vpxor ,xmm2
; sum of absolute differences
; [v[0]-w[0],...v[15]-w[15]], puis
; [v[0]+..+v[7], 0, .. , 0, v[8]+..+v[15], 0, ..., 0]
vpsadbw ,xmm0,xmm2
vmovd ,xmm1
; interleave high-order quadword
vpunpckhqdq ,xmm1,xmm1
vmovd ,xmm2
add ,ebx
add ,16
dec
jnz
vmovd ,xmm3
vpunpckhqdq ,xmm3,xmm3
vmovd ,xmm1
add ,ebx