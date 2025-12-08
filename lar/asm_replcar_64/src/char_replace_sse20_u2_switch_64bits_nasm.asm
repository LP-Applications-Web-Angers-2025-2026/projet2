global chr_repl_sse20_u2_switch

%macro treatone 2
%2:
	movzx	ebx, byte [rsi + r9 + %1]
	xor		eax, eax
	cmp		bl, cl
	cmove	ebx, r8d
	sete	al
	add		r10d, eax
	mov		[rdi + r9 + %1], bl
%endmacro

section .text

; u32 char_replace_sse20(u8 *dst, u8 *src, u32 size, u8 c, u8 d);
; System V AMD64 ABI calling conventions
; note that RBP, RBX, R12 to R15 must not be modified
; dst    | u8 *   | rdi |
; src    | u8 *   | rsi |
; size   | u32    | rdx | (r10 = size adjusted) | later changes
; c      | u8     | rcx | 
; d      | u8     | r8  | 
; changes| u32    |     | rax  
; i      | u32    |     | r9
;        | u8[16] |     | xmm2 = [c x 16]
;        | u8[16] |     | xmm3 = [c x 16]
; 
; unroll by two so treat 32 bytes per iteration
chr_repl_sse20_u2_switch:

	mov		[rsp-16], rbx   ; save rbx
	mov		r10, rdx   ; temporary save size

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

	mov		rdx, r10
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

	mov			rdx, r10
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
	mov			rdx, r10
	mov			r10, rax
	and			edx, 15
	test		edx, edx
	jz			end

	mov		r11, branch_table
	lea		r11, [r11 + rdx * 8]
	jmp		[r11]
	
	treatone 14, L15
	treatone 13, L14
	treatone 12, L13
	treatone 11, L12
	treatone 10, L11
	treatone 9, L10
	treatone 8, L9
	treatone 7, L8
	treatone 6, L7
	treatone 5, L6
	treatone 4, L5
	treatone 3, L4
	treatone 2, L3
	treatone 1, L2
	treatone 0, L1

L0:	
	nop
.end:
end:
	mov			rax, r10
	mov		    rbx, [rsp - 16]
	ret


align(16)
branch_table: dq L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15
