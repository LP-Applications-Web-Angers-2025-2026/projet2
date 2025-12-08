global chr_repl_avx20

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
chr_repl_avx20:

	mov		[rsp-16], rbx   ; save rbx
	mov		[rsp-24], rdx   ; temporary save size

	; create vector of 16 characters c in xmm2
	mov		eax, 0x01010101
	imul	eax, ecx
	vmovd	xmm2, eax
	vpshufd	xmm2, xmm2, 0
	vpbroadcastb ymm2, xmm2
	 
	; create vector of 16 characters d in xmm3 
	mov     eax, 0x01010101
	imul    eax, r8d
	vmovd	xmm3, eax
	vpshufd	xmm3, xmm3, 0
	vpbroadcastb ymm3, xmm3
	
	xor		rax, rax		; changes
	xor		r9, r9 			; i

	mov		rdx, [rsp - 24]
	shr		edx, 5			; divide by 32
	test	edx, edx		; if (size / 32 == 0) then
	jz		.last_31		; treat last 31 characters
	
.loop_x32:
	vmovdqa 	ymm0, [rsi + r9]
	vmovdqa		ymm1, ymm0
	; xmm0 <= xmm0 compare to xmm2 (c...c)
	vpcmpeqb 	ymm0, ymm2
	vpmovmskb	ebx, ymm0
	vmovdqa		ymm4, ymm0

	vpand		ymm0, ymm3
	vpandn		ymm4, ymm1
	vpor	 	ymm0, ymm4

	vmovdqa		[rdi + r9], ymm0	
	popcnt		ebx, ebx
	add			eax, ebx
	
	add			r9, 32
	dec			edx
	jnz			.loop_x32

.last_31:
	mov			rdx, [rsp-24]
	and			edx, 31
	cmp			edx, 16
	jl			.last_15
	
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

