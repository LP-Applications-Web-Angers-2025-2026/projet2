global chr_repl_sse20_u2

section .text

; u32 char_replace_sse20(u8 *dst, u8 *src, u32 size, u8 c, u8 d);
; System V AMD64 ABI calling conventions
; note that RBP, RBX, R12 to R15 must not be modified
; dst    | u8 *   | rdi |
; src    | u8 *   | rsi |
; size   | u32    | rdx | (r10 = size adjusted)
; c      | u8     | rcx | 
; d      | u8     | r8  | 
; changes| u32    |     | rax  
; i      | u32    |     | r9
;        | u8[16] |     | xmm2 = [c x 16]
;        | u8[16] |     | xmm3 = [c x 16]
; 
; unroll by two so treat 32 bytes per iteration
chr_repl_sse20_u2:

	mov		[rsp-16], rbx   ; save rbx
	mov		[rsp-24], rdx   ; temporary save size

	; create vector of 16 characters c in xmm2
	mov		eax, 0x01010101
	imul	eax, ecx
	movd	xmm2, eax
	pshufd	xmm2, xmm2, 0
	 
	; create vector of 16 characters d in xmm3 
	mov     eax, 0x01010101
	imul    eax, r8d
	movd	xmm3, eax
	pshufd	xmm3, xmm3, 0
	
	xor		rax, rax		; changes
	xor		r9, r9 			; i

	mov		rdx, [rsp - 24]
	shr		edx, 5			; divide by 32
	test	edx, edx		; if (size / 32 == 0) then
	jz		.last_31		; treat last 31 characters
	
.loop_x32:
	movdqa 		xmm0, [rsi + r9]
	movdqa 		xmm5, [rsi + r9 + 16]
	
	movdqa		xmm1, xmm0
	movdqa		xmm6, xmm5
	
	; xmm0 <= xmm0 compare to xmm2 (c...c)
	pcmpeqb 	xmm0, xmm2
	pmovmskb	ebx, xmm0
	movdqa		xmm4, xmm0
	popcnt		ebx, ebx
	add			eax, ebx
	
	pcmpeqb 	xmm5, xmm2
	pmovmskb	ebx, xmm5
	movdqa		xmm7, xmm5
	popcnt		ebx, ebx
	add			eax, ebx
	
	pand		xmm0, xmm3
	pandn		xmm4, xmm1
	por	 		xmm0, xmm4
	movdqa		[rdi + r9], xmm0	
	
	pand		xmm5, xmm3
	pandn		xmm7, xmm6
	por	 		xmm5, xmm7
	movdqa		[rdi + r9 + 16], xmm5	
	
	add			r9, 32
	dec			edx
	jnz			.loop_x32
	
.last_31:

	mov			rdx, [rsp-24]
	and			edx, 31
	cmp			edx, 16
	jl			.last_15
	
.next_x16:
	movdqa 		xmm0, [rsi + r9]
	movdqa		xmm1, xmm0
	; xmm0 <= xmm0 compare to xmm2 (c...c)
	pcmpeqb 	xmm0, xmm2
	pmovmskb	ebx, xmm0
	movdqa		xmm4, xmm0

	pand		xmm0, xmm3
	pandn		xmm4, xmm1
	por	 		xmm0, xmm4

	movdqa		[rdi + r9], xmm0	
	popcnt		ebx, ebx
	add			eax, ebx
	
	add			r9, 16
	
.last_15:	
	mov			rdx, [rsp-24]
	and			edx, 15
	test		edx, edx
	jz 			.end

.loop_x1:
	movzx		ebx, byte [rsi + r9]
	cmp			ebx, ecx
	jne			.else

		mov		ebx, r8d
		add		eax, 1

.else:
	mov		byte [rdi + r9], bl
	inc		r9
	dec		edx
	jnz		.loop_x1

.end:

	mov		    rbx, [rsp - 16]
	mov			rdx, [rsp - 24]
	ret

