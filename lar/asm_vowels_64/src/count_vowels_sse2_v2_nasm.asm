%include "src/popcnt_nasm.inc"
extern popcount_table

global cv_sse2_v2

; -------------------------------------------------------------------
; void cv_sse2_v2(char *s, int size, int v[6]);
; method that uses SSE2 instructions set
; rdi = s
; rsi = size
; rdx = v
; ecx = i
; r8, r9, r10, r11, r12, r13 to count a, e, i, o, u, y
; r14d for number of iterations
; eax, ebx are used for popcnt
; xmm8 to xmm13 = s[i:i+15]
; xmm1 to xmm6 are used for a,e,i,o,u,y
;
cv_sse2_v2:
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
	mov		eax, 0x61616161
	movd	xmm1, eax
	pshufd  xmm1, xmm1, 0
	
	mov		eax, 0x65656565
	movd	xmm2, eax
	pshufd  xmm2, xmm2, 0

	mov		eax, 0x69696969
	movd	xmm3, eax
	pshufd  xmm3, xmm3, 0
	
	mov		eax, 0x6f6f6f6f
	movd	xmm4, eax
	pshufd  xmm4, xmm4, 0
	
	mov		eax, 0x75757575
	movd	xmm5, eax
	pshufd  xmm5, xmm5, 0
	
	mov		eax, 0x79797979
	movd	xmm6, eax
	pshufd  xmm6, xmm6, 0

	xor		rcx, rcx
	
	; unroll by 16
	mov 	r14d, esi
	shr		r14d, 4
	test	r14d, r14d
	jz		.last_15
	
.for_u16:
	movdqu	 xmm8, [rdi + rcx]
	movdqa	 xmm9, xmm8
	movdqa	 xmm10, xmm8
	movdqa	 xmm11, xmm9
	movdqa	 xmm12, xmm10
	movdqa	 xmm13, xmm11
	
	pcmpeqb	 	xmm8, xmm1
	pcmpeqb	 	xmm9, xmm2
	pcmpeqb		xmm10, xmm3
	pcmpeqb		xmm11, xmm4
	pcmpeqb		xmm12, xmm5
	pcmpeqb		xmm13, xmm6
	
	; 'a'
	pmovmskb 	ebx, xmm8
	_POPCNT16_EAX_EBX_
	add		 	r8d, eax
	
	; 'e'
	pmovmskb 	ebx, xmm9
	_POPCNT16_EAX_EBX_
	add		 	r9d, eax
				
	; 'i'
	pmovmskb 	ebx, xmm10
	_POPCNT16_EAX_EBX_
	add			r10d, eax
		
	; 'o'
	pmovmskb	ebx, xmm11
	_POPCNT16_EAX_EBX_
	add			r11d, eax
		
	; 'u'
	pmovmskb 	ebx, xmm12
	_POPCNT16_EAX_EBX_
	add			r12d, eax
		
	; 'y'
	pmovmskb 	ebx, xmm13
	_POPCNT16_EAX_EBX_
	add			r13d, eax
				
	add		ecx, 16	
	dec		r14d
	jnz		.for_u16

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

