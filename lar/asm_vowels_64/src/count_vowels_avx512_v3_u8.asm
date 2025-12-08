%include "src/popcnt_nasm.inc"

global cv_avx512_asm_v3_u8

%macro BODY_SSE 1

	movdqu	 xmm8, [rdi + rcx + %1]
	movdqa	 xmm9, xmm8
	movdqa	 xmm10, xmm8
	movdqa	 xmm11, xmm9
	movdqa	 xmm12, xmm10
	movdqa	 xmm13, xmm11
		
	; 'a'
	pcmpeqb	 	xmm8, xmm1
	pmovmskb 	ebx, xmm8
	popcnt		eax, ebx
	add		 	r8d, eax
	
	; 'e'
	pcmpeqb	 	xmm9, xmm2
	pmovmskb 	ebx, xmm9
	popcnt		eax, ebx
	add		 	r9d, eax
				
	; 'i'
	pcmpeqb		xmm10, xmm3
	pmovmskb 	ebx, xmm10
	popcnt		eax, ebx
	add			r10d, eax
		
	; 'o'
	pcmpeqb		xmm11, xmm4
	pmovmskb	ebx, xmm11
	popcnt		eax, ebx
	add			r11d, eax
		
	; 'u'
	pcmpeqb		xmm12, xmm5
	pmovmskb 	ebx, xmm12
	popcnt		eax, ebx
	add			r12d, eax
		
	; 'y'
	pcmpeqb		xmm13, xmm6
	pmovmskb 	ebx, xmm13
	popcnt		eax, ebx
	add			r13d, eax
%endmacro	

%macro BODY_AVX2 1

		vmovdqu	ymm8, [rdi + rcx + %1]
		vmovdqa ymm9, ymm8
		vmovdqa ymm10, ymm8
		vmovdqa ymm11, ymm9
		vmovdqa ymm12, ymm10
		vmovdqa ymm13, ymm11
		
		; 'a'
		vpcmpeqb	ymm8, ymm1	;  AVX
		vpmovmskb 	ebx, ymm8     ; AVX
		popcnt		eax, ebx 
		add			r8d, eax
		
		; 'e'
		vpcmpeqb	ymm9, ymm2
		vpmovmskb 	ebx, ymm9
		popcnt		eax, ebx
		add			r9d, eax
				
		; 'i'
		vpcmpeqb	ymm10, ymm3
		vpmovmskb 	ebx, ymm10
		popcnt		eax, ebx
		add			r10d, eax
		
		; 'o'
		vpcmpeqb	ymm11, ymm4
		vpmovmskb ebx, ymm11
		popcnt		eax, ebx
		add			r11d, eax
		
		; 'u'
		vpcmpeqb	ymm12, ymm5
		vpmovmskb 	ebx, ymm12
		popcnt		eax, ebx
		add			r12d, eax
		
		; 'y'
		vpcmpeqb	ymm13, ymm6
		vpmovmskb 	ebx, ymm13
		popcnt		eax, ebx
		add			r13d, eax
		
%endmacro		

%macro BODY_AVX512 1

		vmovdqa32	zmm8, [rdi + rcx + %1]
		
		; 'a'
		vpcmpeqb	k1, zmm1, zmm8
		kmovq		rbx, k1	
		popcnt		rax, rbx 
		add			r8d, eax
		
		; 'e'
		vpcmpeqb	k2, zmm2, zmm8
		kmovq 		rbx, k2
		popcnt		rax, rbx
		add			r9d, eax
				
		; 'i'
		vpcmpeqb	k3, zmm3, zmm8
		kmovq 		rbx, k3
		popcnt		rax, rbx
		add			r10d, eax
		
		; 'o'
		vpcmpeqb	k4, zmm4, zmm8
		kmovq 		rbx, k4
		popcnt		rax, rbx
		add			r11d, eax
		
		; 'u'
		vpcmpeqb	k5, zmm5, zmm8
		kmovq 		rbx, k5
		popcnt		rax, rbx
		add			r12d, eax
		
		; 'y'
		vpcmpeqb	k6, zmm6, zmm8
		kmovq 		rbx, k6
		popcnt		rax, rbx
		add			r13d, eax
		
%endmacro		

; -------------------------------------------------------------------	
; void count_avx512_v3_ur8(char *s, int size, int v[6]);
; method that uses AVX instructions set
; rdi = s
; rsi = size
; rdx = v
; ecx = i
; r8, r9, r10, r11, r12, r13 for a, e, i, o ,u, y
; 
; zmm1 to zmm6 = s[i:i+63]
; zmm8 to zmm13 are used for a,e,i,o,u,y
;
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; Note that we assume that the CPU has the processor has AVX512 
; instructions set and the popcnt instruction
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
cv_avx512_asm_v3_u8:
	mov		[rsp - 16], rbx
	mov		[rsp - 24], r12
	mov		[rsp - 32], r13
	mov		[rsp - 40], r14
	
	xor		r8, r8			; for #a
	xor		r9, r9			; for #e
	xor		r10, r10		; for #i
	xor		r11, r11		; for #o
	xor		r12, r12		; for #u
	xor		r13, r13		; for #y
		
	
	; fill xmm2 vector with 'a,a,a,a,...'	
	mov		eax, 0x61616161
	movd	xmm1, eax
	vpbroadcastd zmm1, xmm1		; AVX512
	
	mov		eax, 0x65656565
	movd	xmm2, eax
	vpbroadcastd zmm2, xmm2		; AVX512
	
	mov		eax, 0x69696969
	movd	xmm3, eax
	vpbroadcastd zmm3, xmm3		; AVX512
	
	mov		eax, 0x6F6F6F6F
	movd	xmm4, eax
	vpbroadcastd zmm4, xmm4		; AVX512
	
	mov		eax, 0x75757575
	movd	xmm5, eax
	vpbroadcastd zmm5, xmm5		; AVX512
	
	mov		eax, 0x79797979
	movd	xmm6, eax
	vpbroadcastd zmm6, xmm6		; AVX512

	xor		rcx, rcx
	
	; unroll by 64*8
	mov 	r14d, esi
	shr		r14d, 9				; r14d = size / 512
	test	r14d, r14d
	jz		.last_511

.for_u512:
		
	BODY_AVX512		0*64	
	BODY_AVX512		1*64
	BODY_AVX512		2*64
	BODY_AVX512		3*64
	BODY_AVX512		4*64
	BODY_AVX512		5*64
	BODY_AVX512		6*64
	BODY_AVX512		7*64
				
	add		ecx, 512
	dec 	r14d
	jnz		.for_u512
	
.last_511:
	mov    	r14d, esi
	and		r14d, 511
	cmp		r14d, 256
	jl		.last_255
	
	BODY_AVX512		0*64	
	BODY_AVX512		1*64
	BODY_AVX512		2*64
	BODY_AVX512		3*64
	
	add		ecx, 256

.last_255:
	mov    	r14d, esi
	and		r14d, 255
	cmp		r14d, 128
	jl		.last_127
	
	BODY_AVX512		0*64	
	BODY_AVX512		1*64
	
	add		ecx, 128

.last_127:
	mov    	r14d, esi
	and		r14d, 127
	cmp		r14d, 64
	jl		.last_63
	
	BODY_AVX512		0*64	
	
	add		ecx, 64


.last_63:
	mov    	r14d, esi
	and		r14d, 63
	cmp		r14d, 32
	jl		.last_31
	
	BODY_AVX2	0
	
	add		ecx, 32
	
.last_31:
	mov    	r14d, esi
	and		r14d, 31
	cmp		r14d, 16
	jl		.last_15

	vzeroupper
	BODY_SSE 	0
	
	add		ecx, 16
	
	
.last_15:
	cmp		ecx, esi
	jge		.end
	
	xor		rax, rax
	mov     [rsp-60], rax
	mov     [rsp-68], rax
	mov     [rsp-76], rax
	mov     [rsp-84], rax
	
.for_u1:
	cmp		ecx, esi
	jge		.endfor_u1
	
	movzx   eax, byte [rdi + rcx]
	sub		eax, 'a'
	add		byte [rsp + rax - 84], 1
	add		ecx, 1
	jmp		.for_u1
.endfor_u1:

	movzx	eax, byte [rsp  - 84 + 'a' - 'a']
	add		r8d, eax
	movzx	eax, byte [rsp  - 84 + 'e' - 'a']
	add		r9d, eax
	movzx	eax, byte [rsp  - 84 + 'i' - 'a']
	add		r10d, eax
	movzx	eax, byte [rsp  - 84 + 'o' - 'a']
	add		r11d, eax
	movzx	eax, byte [rsp  - 84 + 'u' - 'a']
	add		r12d, eax
	movzx	eax, byte [rsp  - 84 + 'y' - 'a']
	add		r13d, eax

.end:
	mov		[rdx], r8d
	mov		[rdx + 4], r9d
	mov		[rdx + 8], r10d
	mov		[rdx + 12], r11d
	mov		[rdx + 16], r12d
	mov		[rdx + 20], r13d

	mov		r14, [rsp - 40]
	mov		r13, [rsp - 32]
	mov		r12, [rsp - 24]
	mov		rbx, [rsp - 16]
	
	ret

