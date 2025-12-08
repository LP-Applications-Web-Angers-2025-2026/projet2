global u8_asm_popcnt
global u32_asm_popcnt
global u32_asm_popcnt_ur2
global u32_asm_popcnt_ur4
global u32_sse_popcnt_v1
global u32_sse_popcnt_v2
global u32_avx2_popcnt_v1

section .text

; ===================================================================
; u32 u8_asm_popcnt(u8 *x, u32 size) 
; load each byte and compute number of bits using the popcnt assembly 
; instruction 
; 
; eax u32     result
; esi u8*     &x[i]
; edi u8/u32  x[i] and popcnt(x[i])
; edx u32     size
; ecx u32     i
; ===================================================================
u8_asm_popcnt:
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi
	
	mov		esi, [ebp + 8]
	mov		edx, [ebp + 12]
	
	xor		ecx, ecx
	xor		eax, eax
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	edi, byte [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	inc		ecx
	jmp		.for
.endfor:

	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret

; ===================================================================
; u32 u32_asm_popcnt(u8 *x, u32 size)
; load each double word and compute number of bits using the popcnt 
; assembly instruction
; if size is not a multiple of 4 then the last iterations are
; computed for each byte
; see u8_asm_popcnt for register assignment
; ===================================================================
u32_asm_popcnt:
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi

	xor		eax, eax
	xor		ecx, ecx
		
	mov		esi, [ebp + 8]
	mov		edx, [ebp + 12]
	and		edx, ~3				; make size multiple of 4
	test	edx, edx			; if less than 4 go to .last3
	jz		.last3
		
.for_ur4:						; unroll by 4 bytes = one double word
	mov	edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 4
	cmp		ecx, edx
	jne		.for_ur4

.last3:							; last iterations 0, 1, 2 or 3
	mov		edx, [ebp + 12]		; reload size
	
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	edi, byte [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	inc		ecx	
	jmp		.for	
.endfor:

	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret


; ===================================================================
; u32 u32_asm_popcnt_ur2(u8 *x, u32 size)
; unroll by 2 subroutine u32_asm_popcnt so we consider at each iteration
; two double words
; if size is not a multiple of 8 then the last iterations are
; computed for a double word or each byte
; see u8_asm_popcnt for register assignment
; ===================================================================
u32_asm_popcnt_ur2:
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi
	
	xor		eax, eax
	xor		ecx, ecx
	
	mov		esi, [ebp + 8]
	mov		edx, [ebp + 12]
	and		edx, ~7
	test	edx, edx
	jz		.last7
		
.for_ur8:						; unroll by two double words
	mov		edi, [esi + ecx]	; first 
	popcnt	edi, edi
	add		eax, edi
	
	mov		edi, [esi + ecx + 4] ; second
	popcnt	edi, edi
	add		eax, edi
	
	add		ecx, 8
	cmp		ecx, edx
	jne		.for_ur8

.last7:							; consider last 7 iterations
	mov		edx, [ebp + 12]		; but 4 or more we treat
	and		edx, 7				; one double word
	cmp		edx, 4				; and consider last 3 iterations
	jl		.last3
	
	mov	edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 4

.last3:
	mov		edx, [ebp + 12]
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	edi, byte [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	inc		ecx	
	jmp		.for	
.endfor:

	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret

; ===================================================================
; u32 u32_asm_popcnt_ur4(u8 *x, u32 size)
; unroll by 4 subroutine u32_asm_popcnt so we consider at each 
; iteration four double words
; if size is not a multiple of 16 then the last iterations are
; computed for a double word a word or each byte
; see u8_asm_popcnt for register assignment
; ===================================================================
u32_asm_popcnt_ur4:
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi
	
	xor		eax, eax
	xor		ecx, ecx
		
	mov		esi, [ebp + 8]
	mov		edx, [ebp + 12]
	and		edx, ~15			; make size multiple of 16
	test	edx, edx			; but if less than 16 consider
	jz		.last15				; last 15 bytes
		
.for_ur16:
	mov		edi, [esi + ecx]	; first
	popcnt	edi, edi
	add		eax, edi
	mov		edi, [esi + ecx + 4] ; second
	popcnt	edi, edi
	add		eax, edi
	mov		edi, [esi + ecx + 8] ; third
	popcnt	edi, edi
	add		eax, edi
	mov		edi, [esi + ecx + 12] ; fourth
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 16
	cmp		ecx, edx
	jne		.for_ur16
		
.last15:	
	mov		edx, [ebp + 12] 	; if more than 8 then
	and		edx, 15				; consider code for two
	cmp		edx, 8				; double words
	jl		.last7
	
	mov		edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	mov		edi, [esi + ecx + 4]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 8
	
.last7:							
	mov		edx, [ebp + 12]		; if more than 4 then
	and		edx, 7				; consider code for one
	cmp		edx, 4				; double word
	jl		.last3
	
	mov	edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 4

.last3:
	mov		edx, [ebp + 12]
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	edi, byte [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	inc		ecx	
	jmp		.for	
.endfor:

	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret

; ===================================================================
; u32 u32_asm_sse_popcnt(u8 *x, u32 size)
; use sse register to load data then extract into other sse registers 
; and perform calculations 
; the solution is relatively stupid and not efficient
; 
; eax  u32     	result
; esi  u8*    	&x[i]
; xmm0 16b  	x[i:i+15]
; xmm1 16b		x[i+4:i+7]
; xmm2 16b		x[i+8:i+11]
; xmm3 16b		x[i+12:i+15]
; edx u32     	size
; ecx u32     	i
; ===================================================================
u32_sse_popcnt_v1:
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi
	push	ebx
	
	xor		eax, eax
	xor		ecx, ecx
	
	mov		esi, [ebp + 8]
	mov		edx, [ebp + 12]
	and		edx, ~15
	test	edx, edx
	jz		.last15
		
.for_u16:
	movdqa	xmm0, [esi + ecx]
	pshufd	xmm1, xmm0, 0x01
	pshufd	xmm2, xmm0, 0x02
	pshufd	xmm3, xmm0, 0x03	
	
	movd	edi, xmm0
	popcnt	edi, edi
	add		eax, edi
	
	movd	ebx, xmm1
	popcnt	ebx, ebx
	add		eax, ebx
	
	movd	edi, xmm2
	popcnt	edi, edi
	add		eax, edi
	
	movd	ebx, xmm3
	popcnt	ebx, ebx
	add		eax, ebx
	
	add		ecx, 16
	cmp		ecx, edx
	jne		.for_u16

.last15:	
	mov		edx, [ebp + 12]
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	mov		edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	mov		edi, [esi + ecx + 4]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 8
	
.last7:	
	mov		edx, [ebp + 12]
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov	edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 4

.last3:
	mov		edx, [ebp + 12]
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	edi, byte [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	inc		ecx	
	jmp		.for	
.endfor:

	pop		ebx
	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret

; ====================================================
; !!!
u32_sse_popcnt_v2:
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi
	push	ebx
	
	xor		eax, eax
	xor		ecx, ecx
	
	vpxor	xmm2, xmm2
	vpxor	xmm3, xmm3
	
	mov		esi, [ebp + 8]
	mov		edx, [ebp + 12]
	shr		edx, 4
	test	edx, edx
	jz		.last15
	
	mov		eax, 0x55555555
	movd	xmm4, eax
	vpshufd	xmm4, xmm4, 0

	mov		eax, 0x33333333
	movd	xmm5, eax
	vpshufd	xmm5, xmm5, 0

	mov		eax, 0x0f0f0f0f
	movd	xmm6, eax
	vpshufd	xmm6, xmm6, 0

	mov		eax, 0x00ff00ff
	movd	xmm7, eax
	vpshufd	xmm7, xmm7, 0
		
.for_ur16:
	movdqa	xmm0, [esi + ecx]
	
	; x = x - (x >> 1) & 0x5555
	vpsrlw	xmm1, xmm0, 1
	vpand	xmm1, xmm4
	vpsubw	xmm0, xmm1
	
	; x = (x & m2) + ((x >> 2) & m2);
	vpand 	xmm1, xmm0, xmm5
	vpsrlw 	xmm2, xmm0, 2
	vpand	xmm2, xmm5
	vpaddw	xmm0, xmm1, xmm2
	
	; x = (x + (x >> 4)) & m4;
	vpsrlw	xmm1, xmm0, 4
	vpaddw	xmm0, xmm1
	vpand	xmm0, xmm6
	
	; x += x >>  8
	vpsrlw	xmm1, xmm0, 8
	vpaddw	xmm0, xmm1
	vpand	xmm0, xmm7
	
	vpxor	xmm2, xmm2
	vpsadbw	xmm1, xmm0, xmm2
	vpaddq	xmm2, xmm1, xmm3
	vmovdqu	xmm3, xmm2
	
	add		ecx, 16
	dec		edx
	jnz		.for_ur16
	
	vmovd	ebx, xmm3
	vpunpckhqdq xmm1, xmm3, xmm3
	vmovd	eax, xmm1
	add		eax, ebx
	
.last15:	
	mov		edx, [ebp + 12]
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	mov		edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	mov		edi, [esi + ecx + 4]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 8
	
.last7:	
	mov		edx, [ebp + 12]
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov	edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 4

.last3:
	mov		edx, [ebp + 12]
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	edi, byte [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	inc		ecx	
	jmp		.for	
.endfor:

	pop		ebx
	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret





; ===================================================================
; u32 u32_asm_avx2_popcnt(u8 *x, u32 size)
; use sse register to load data then extract into other sse registers 
; and perform calculations 
; the solution is relatively stupid and not efficient
; 
; eax  u32     	result
; esi  u8*    	&x[i]
; ymm0 16b  	x[i:i+31]
; ymm1 16b		x[i+4:i+7]
; ymm2 16b		x[i+8:i+11]
; ymm3 16b		x[i+12:i+15]
; ymm4 16b  	x[i+16:i+19]
; ymm5 16b		x[i+20:i+23]
; ymm6 16b		x[i+24:i+27]
; ymm7 16b		x[i+28:i+31]

; edx u32     	size
; ecx u32     	i
; ===================================================================
u32_avx2_popcnt_v1:
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi
	push	ebx
	
	xor		eax, eax
	xor		ecx, ecx
		
	mov		esi, [ebp + 8]
	mov		edx, [ebp + 12]
	and		edx, ~31
	test	edx, edx
	jz		.last31
		
.for_u32:
	vmovaps	ymm0, [esi + ecx]
	vpshufd	xmm1, xmm0, 0x01
	vpshufd	xmm2, xmm0, 0x02
	vpshufd	xmm3, xmm0, 0x03	
	
	vextracti128 xmm4, ymm0, 1
	vpshufd	xmm5, xmm4, 0x01
	vpshufd	xmm6, xmm4, 0x02
	vpshufd	xmm7, xmm4, 0x03
	
	vmovd	edi, xmm0
	popcnt	edi, edi
	add		eax, edi
	
	vmovd	ebx, xmm1
	popcnt	ebx, ebx
	add		eax, ebx
	
	vmovd	edi, xmm2
	popcnt	edi, edi
	add		eax, edi
	
	vmovd	ebx, xmm3
	popcnt	ebx, ebx
	add		eax, ebx
	
	vmovd	edi, xmm4
	popcnt	edi, edi
	add		eax, edi
	
	vmovd	ebx, xmm5
	popcnt	ebx, ebx
	add		eax, ebx
	
	vmovd	edi, xmm6
	popcnt	edi, edi
	add		eax, edi
	
	vmovd	ebx, xmm7
	popcnt	ebx, ebx
	add		eax, ebx
	
	add		ecx, 32
	cmp		ecx, edx
	jne		.for_u32

.last31:
	mov		edx, [ebp + 12]
	and		edx, 31
	cmp		edx, 16
	jl		.last15
	
	vmovaps	xmm0, [esi + ecx]
	vpshufd	xmm1, xmm0, 0x01
	vpshufd	xmm2, xmm0, 0x02
	vpshufd	xmm3, xmm0, 0x03	
	
	vmovd	edi, xmm0
	popcnt	edi, edi
	add		eax, edi
	
	vmovd	ebx, xmm1
	popcnt	ebx, ebx
	add		eax, ebx
	
	vmovd	edi, xmm2
	popcnt	edi, edi
	add		eax, edi
	
	vmovd	ebx, xmm3
	popcnt	ebx, ebx
	add		eax, ebx
	
	add		ecx, 16

.last15:	
	mov		edx, [ebp + 12]
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	mov		edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	mov		edi, [esi + ecx + 4]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 8
	
.last7:	
	mov		edx, [ebp + 12]
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov	edi, [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	add		ecx, 4

.last3:
	mov		edx, [ebp + 12]
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	edi, byte [esi + ecx]
	popcnt	edi, edi
	add		eax, edi
	inc		ecx	
	jmp		.for	
.endfor:

	pop		ebx
	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret


