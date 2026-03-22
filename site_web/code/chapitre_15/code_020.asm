; fill xmm2 vector with 'a,a,a,a,...'
mov ,0x61616161
movd ,eax
vpbroadcastd ,xmm1 ; AVX512
...
; unroll by 64
mov ,esi
shr ,6
test ,r14d
jz
14.for_u64:
vmovdqa32 ,rdi+rcx]
add ,64
vpcmpeqb ,zmm1,zmm8
vpcmpeqb ,zmm2,zmm8
vpcmpeqb ,zmm3,zmm8
vpcmpeqb ,zmm4,zmm8
vpcmpeqb ,zmm5,zmm8
vpcmpeqb ,zmm6,zmm8
; 'a'
kmovq ,k1
popcnt ,rbx
add ,ebx
...
dec
jnz
...