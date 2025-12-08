global u8_asm_popcnt
global u32_asm_popcnt
global u64_asm_popcnt
global u32_asm_popcnt_ur2
global u32_asm_popcnt_ur4
global u64_asm_popcnt_ur2
global u64_asm_popcnt_ur4
global u32_sse_popcnt
global u32_avx2_popcnt_v1
global u32_avx2_popcnt_v2
global u32_avx2_popcnt_v3

section .text

; =======================================
; u32 u8_asm_popcnt(u8 *x, u32 size);
; rdi = x
; rsi = size
u8_asm_popcnt:
	xor		ecx, ecx
	xor		eax, eax
.for:
	cmp		ecx, esi
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	inc		ecx
	jmp		.for
.endfor:
	ret

; =======================================
u32_asm_popcnt:
	mov		edx, esi
	xor		ecx, ecx
	xor		eax, eax
	and		edx, ~3
	test	edx, edx
	jz		.last3
	
.for_u4:
	mov		r8d, [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	add		ecx,4
	cmp		ecx, edx
	jl		.for_u4
	
.last3:

.for:
	cmp		ecx, esi
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	inc		ecx
	jmp		.for
.endfor:

	ret
	
	
; =======================================
u64_asm_popcnt:
	mov		edx, esi
	xor		ecx, ecx
	xor		eax, eax
	and		edx, ~7
	test	edx, edx
	jz		.last7
	
.for_u8:
	mov		r8, [rdi + rcx]
	popcnt	r8, r8
	add		eax, r8d
	add		ecx, 8
	cmp		ecx, edx
	jl		.for_u8
	
.last7:

.for:
	cmp		ecx, esi
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	inc		ecx
	jmp		.for
.endfor:

	ret
	
; =======================================
u64_asm_popcnt_ur2:
	mov		edx, esi
	xor		ecx, ecx
	xor		eax, eax
	and		edx, ~15
	test	edx, edx
	jz		.last15
	
.for_u16:	
	popcnt	r8, [rdi + rcx]
	add		eax, r8d
	popcnt	r9, [rdi + rcx + 8]
	add		eax, r9d
	add		ecx, 16
	cmp		ecx, edx
	jl		.for_u16

.last15:	
	mov		edx, esi
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	popcnt	r8, [rdi + rcx]
	add		eax, r8d
	add		ecx, 8	
	
.last7:
	mov		edx, esi
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov		r8d, [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	add		ecx, 4	
	
.last3:	
.for:
	cmp		ecx, esi
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	inc		ecx
	jmp		.for
.endfor:

	ret	


; =======================================
; u32 u64_asm_popcnt_ur4(u8 *x, u32 size);
; rdi = x
; rsi = size
u64_asm_popcnt_ur4:
	mov		edx, esi	; copy of esi=size
	xor		ecx, ecx
	xor		eax, eax	; result
	and		edx, ~31
	test	edx, edx
	jz		.last31
	
.for_u32:	
	popcnt	r8, [rdi + rcx]
	popcnt	r9, [rdi + rcx + 8]
	add		eax, r8d
	add		eax, r9d
	popcnt	r8, [rdi + rcx + 16]
	popcnt	r9, [rdi + rcx + 24]
	add		eax, r8d
	add		eax, r9d
	
	add		ecx, 32
	cmp		ecx, edx
	jl		.for_u32
	
.last31:	
	mov		edx, esi
	and		edx, 31
	cmp		edx, 16
	jl		.last15
	
	popcnt	r8, [rdi + rcx]
	add		eax, r8d
	popcnt	r9, [rdi + rcx + 8]
	add		eax, r9d
	add		ecx, 16

.last15:	
	mov		edx, esi
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	popcnt	r8, [rdi + rcx]
	add		eax, r8d
	add		ecx, 8	
	
.last7:
	mov		edx, esi
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov		r8d, [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	add		ecx, 4	
	
.last3:	
.for:
	cmp		ecx, esi
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	inc		ecx
	jmp		.for
.endfor:

	ret	


; =======================================
; treat u32 unroll by 2
u32_asm_popcnt_ur2:
	mov		edx, esi
	xor		ecx, ecx
	xor		eax, eax
	and		edx, ~7
	test	edx, edx
	jz		.last7
		
.for_u8:
	mov		r8d, [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	mov		r9d, [rdi + rcx + 4]
	popcnt	r9d, r9d
	add		eax, r9d
	add		ecx, 8
	cmp		ecx, edx
	jl		.for_u8
	
.last7:
	 mov	edx, esi
	 and	edx, 7
	 cmp	edx, 4
	 jl		.last3
	 	
	mov		r8d, [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	add		ecx, 4
	
.last3:

.for:
	cmp		ecx, esi
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	inc		ecx
	jmp		.for
.endfor:

	ret

; =======================================
; treat u32 unroll by 4
u32_asm_popcnt_ur4:
	mov		edx, esi
	xor		ecx, ecx
	xor		eax, eax
	and		edx, ~15
	test	edx, edx
	jz		.last15
		
.for_u16:
	mov		r8d, [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	mov		r9d, [rdi + rcx + 4]
	popcnt	r9d, r9d
	add		eax, r9d
	mov		r8d, [rdi + rcx + 8]
	popcnt	r8d, r8d
	add		eax, r8d
	mov		r9d, [rdi + rcx + 12]
	popcnt	r9d, r9d
	add		eax, r9d
	add		ecx, 16
	cmp		ecx, edx
	jl		.for_u16
	
.last15:
	mov		edx, esi
	and		edx, 15
	cmp		edx, 8
	jl		.last7

	mov		r8d, [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	mov		r9d, [rdi + rcx + 4]
	popcnt	r9d, r9d
	add		eax, r9d
	add		ecx, 8
	
.last7:
	mov	edx, esi
	and	edx, 7
	cmp	edx, 4
	jl		.last3
	 	
	mov		r8d, [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	add		ecx, 4
	
.last3:

.for:
	cmp		ecx, esi
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r8d, r8d
	add		eax, r8d
	inc		ecx
	jmp		.for
.endfor:

	ret

; ==========================================
u32_sse_popcnt:
	
	mov		edx, esi
	xor		ecx, ecx
	xor		eax, eax
	and		edx, ~15
	test	edx, edx
	jz		.last15
			
.for_u16:
	movaps	xmm0, [rdi + rcx]
	pshufd	xmm1, xmm0, 0xE
	
	movq	r8, xmm0
	popcnt	r9, r8
	add		eax, r9d
	
	movq	r8, xmm1
	popcnt	r9, r8
	add		eax, r9d
	
	add		ecx, 16
	cmp		ecx, edx
	jne		.for_u16

.last15:	
	mov		edx, esi
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	mov		r8d, [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	mov		r8d, [rdi + rcx + 4]
	popcnt	r9d, r8d
	add		eax, r9d
	add		ecx, 8
	
.last7:	
	mov		edx, esi
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov		r8d, [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	add		ecx, 4

.last3:
	mov		edx, esi
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	inc		ecx	
	jmp		.for	
.endfor:

	ret


; ==========================================
; rdi = x
; rsi = size
u32_avx2_popcnt_v1:
	mov		edx, esi
	xor		rcx, rcx
	xor		rax, rax
	and		edx, ~31
	test	edx, edx
	jz		.last31

.for_u32:
	vmovdqa	ymm0, [rdi + rcx]
	vpshufd	xmm1, xmm0, 0x01
	vpshufd	xmm2, xmm0, 0x02
	vpshufd	xmm3, xmm0, 0x03	
	
	vextracti128 xmm4, ymm0, 1
	vpshufd	xmm5, xmm4, 0x01
	vpshufd	xmm6, xmm4, 0x02
	vpshufd	xmm7, xmm4, 0x03
	
	vmovd	r8d, xmm0
	popcnt	r8d, r8d
	add		eax, r8d
	
	vmovd	r9d, xmm1
	popcnt	r9d, r9d
	add		eax, r9d
	
	vmovd	r8d, xmm2
	popcnt	r8d, r8d
	add		eax, r8d
	
	vmovd	r9d, xmm3
	popcnt	r9d, r9d
	add		eax, r9d
	
	vmovd	r8d, xmm4
	popcnt	r8d, r8d
	add		eax, r8d
	
	vmovd	r9d, xmm5
	popcnt	r9d, r9d
	add		eax, r9d
	
	vmovd	r8d, xmm6
	popcnt	r8d, r8d
	add		eax, r8d
	
	vmovd	r9d, xmm7
	popcnt	r9d, r9d
	add		eax, r9d
	
	add		ecx, 32
	cmp		ecx, edx
	jne		.for_u32

.last31:
	mov		edx, esi
	and		edx, 31
	cmp		edx, 16
	jl		.last15

	vmovdqa	xmm0, [rdi + rcx]
	vpshufd	xmm1, xmm0, 0xE
	
	vmovq	r8, xmm0
	popcnt	r9, r8
	add		eax, r9d
	
	vmovq	r8, xmm1
	popcnt	r9, r8
	add		eax, r9d
	
	add		ecx, 16

.last15:	
	mov		edx, esi
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	mov		r8d, [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	mov		r8d, [rdi + rcx + 4]
	popcnt	r9d, r8d
	add		eax, r9d
	add		ecx, 8
	
.last7:	
	mov		edx, esi
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov		r8d, [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	add		ecx, 4

.last3:
	mov		edx, esi
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	inc		ecx	
	jmp		.for	
.endfor:
    vzeroupper
	ret	
	
; ==========================================
u32_avx2_popcnt_v2:

	mov		edx, esi
	xor		ecx, ecx
	xor		eax, eax
	and		edx, ~31
	test	edx, edx
	jz		.last31

    
.for_u32:		
	vmovdqa	ymm0, [rdi + rcx]
	pshufd	xmm1, xmm0, 0xE
	vextracti128 xmm2, ymm0, 1
	pshufd	xmm3, xmm2, 0xE
	
	movq	r8, xmm0
	popcnt	r9, r8
	add		eax, r9d
	
	movq	r8, xmm1
	popcnt	r9, r8
	add		eax, r9d
	
	movq	r8, xmm2
	popcnt	r9, r8
	add		eax, r9d
	
	movq	r8, xmm3
	popcnt	r9, r8
	add		eax, r9d
	
	
	add		ecx, 32
	cmp		ecx, edx
	jne		.for_u32

.last31:
	mov		edx, esi
	and		edx, 31
	cmp		edx, 16
	jl		.last15

	vmovdqa	xmm0, [rdi + rcx]
	vpshufd	xmm1, xmm0, 0xE
	
	vmovq	r8, xmm0 
	popcnt	r9, r8
	add		eax, r9d
	
	vmovq	r8, xmm1
	popcnt	r9, r8
	add		eax, r9d
	
	add		ecx, 16

.last15:	
	mov		edx, esi
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	mov		r8d, [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	mov		r8d, [rdi + rcx + 4]
	popcnt	r9d, r8d
	add		eax, r9d
	add		ecx, 8
	
.last7:	
	mov		edx, esi
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov		r8d, [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	add		ecx, 4

.last3:
	mov		edx, esi
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	inc		ecx	
	jmp		.for	
.endfor:
    vzeroupper
	ret


; ==========================================
u32_avx2_popcnt_v3:

	mov		edx, esi
	xor		ecx, ecx
	xor		eax, eax
	and		edx, ~31
	test	edx, edx
	jz		.last31
    
.for_u32:		
	vmovdqa	ymm0, [rdi + rcx]
	pshufd	xmm1, xmm0, 0xE
	vextracti128 xmm2, ymm0, 1
	pshufd	xmm3, xmm2, 0xE
	
	movq	r8, xmm0
	popcnt	r9, r8
	add		eax, r9d
	
	movq	r10, xmm1
	popcnt	r11, r10
	add		eax, r11d
	
	movq	r8, xmm2
	popcnt	r9, r8
	add		eax, r9d
	
	movq	r10, xmm3
	popcnt	r11, r10
	add		eax, r11d
	
	
	add		ecx, 32
	cmp		ecx, edx
	jne		.for_u32

.last31:
	mov		edx, esi
	and		edx, 31
	cmp		edx, 16
	jl		.last15

	vmovdqa	xmm0, [rdi + rcx]
	vpshufd	xmm1, xmm0, 0xE
	
	vmovq	r8, xmm0 
	popcnt	r9, r8
	add		eax, r9d
	
	vmovq	r8, xmm1
	popcnt	r9, r8
	add		eax, r9d
	
	add		ecx, 16

.last15:	
	mov		edx, esi
	and		edx, 15
	cmp		edx, 8
	jl		.last7
	
	mov		r8d, [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	mov		r8d, [rdi + rcx + 4]
	popcnt	r9d, r8d
	add		eax, r9d
	add		ecx, 8
	
.last7:	
	mov		edx, esi
	and		edx, 7
	cmp		edx, 4
	jl		.last3
	
	mov		r8d, [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	add		ecx, 4

.last3:
	mov		edx, esi
.for:
	cmp		ecx, edx
	jge		.endfor
	movzx	r8d, byte [rdi + rcx]
	popcnt	r9d, r8d
	add		eax, r9d
	inc		ecx	
	jmp		.for	
.endfor:
    vzeroupper
	ret
