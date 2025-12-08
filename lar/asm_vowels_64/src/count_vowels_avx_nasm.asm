%include "src/popcnt_nasm.inc"

global cv_avx

%macro BODY_SSE 1

	movdqu	 xmm8, [rdi + rcx + %1]
	movdqa	 xmm9, xmm8
	movdqa	 xmm10, xmm8
	movdqa	 xmm11, xmm8
	movdqa	 xmm12, xmm8
	movdqa	 xmm13, xmm8
		
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



; -------------------------------------------------------------------	
; void cv_avx(char *s, int size, int v[6]);
; method that uses AVX instructions set
; rdi = s
; rsi = size
; rdx = v
; ecx = i
; r8, r9, r10, r11, r12, r13 to count a, e, i, o, u, y
; r14d for number of iterations
; eax, ebx are used for popcnt
; ymm8 to ymm13 = s[i:i+31]
; ymm1 to ymm6 are used for a,e,i,o,u,y
;
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; Note that we assume that has the processor has AVX instructions set
; it also have the popcnt instruction
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
cv_avx:
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
		
	; fill xmm1 vector with 'a,a,a,a,...'	
	mov			eax, 0x61616161
	movd		xmm1, eax
	vpshufd  	xmm1, xmm1, 0
	vinsertf128 ymm1, ymm1, xmm1, 0x1
	
	mov			eax, 0x65656565
	movd		xmm2, eax
	vpshufd  	xmm2, xmm2, 0			; AVX
	vinsertf128 ymm2, ymm2, xmm2, 0x1	; AVX
	
	mov			eax, 0x69696969
	movd		xmm3, eax
	vpshufd  	xmm3, xmm3, 0
	vinsertf128 ymm3, ymm3, xmm3, 0x1
	
	mov			eax, 0x6F6F6F6F
	movd		xmm4, eax
	vpshufd  	xmm4, xmm4, 0
	vinsertf128 ymm4, ymm4, xmm4, 0x1
	
	mov			eax, 0x75757575
	movd		xmm5, eax
	vpshufd  	xmm5, xmm5, 0
	vinsertf128 ymm5, ymm5, xmm5, 0x1
	
	mov			eax, 0x79797979
	movd		xmm6, eax
	vpshufd  	xmm6, xmm6, 0
	vinsertf128 ymm6, ymm6, xmm6, 0x1

	xor		rcx, rcx
	
	; unroll by 32
	mov 	r14d, esi
	shr		r14d, 5
	test	r14d, r14d
	jz		.last_31
	
.for_u32:
	vmovdqu	ymm8, [rdi + rcx]
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
	vpmovmskb	ebx, ymm10
	popcnt		eax, ebx
	add			r10d, eax
		
	; 'o'
	vpcmpeqb	ymm11, ymm4
	vpmovmskb 	ebx, ymm11
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
				
	add		ecx, 32
	dec		r14d
	jnz		.for_u32

.last_31:
	mov    	r14d, esi
	and		r14d, 31
	cmp		r14d, 16
	jl		.last_15
	
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

