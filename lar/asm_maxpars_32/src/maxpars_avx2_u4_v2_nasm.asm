global maxpars_avx2_u4_v2

%macro U1 0
	movzx	ebx, byte [esi]
	movzx	ecx, byte [edi]
	mov		dl, cl
	add		esi, 1
	and		cl, bl
	or		dl, bl
	xor		ebx, ebx
	add		edi, 1
	cmp		cl, 0
	cmove 	ecx, edx
	sete	bl

	add		eax, ebx
	mov		[ebp], cl
	add		ebp, 1
%endmacro

section .text

; implementation with AVX2, loop unrolling of 4 and dependancies
; esi = x
; edi = y
; ebx = z
; ecx = i
; edx = size
; eax = mutations
; ebp = temporary computations
maxpars_avx2_u4_v2:
	push	ebp
	mov		ebp, esp

	push	esi
	push	edi
	push	ebx

	mov		eax, [ebp + 20] ; if (size == 0) return 0
	test	eax, eax
	jz		end_maxpars_avx2_u4
	
	xor		ecx, ecx		; i = 0
	xor		eax, eax		; mutations = 0
	mov		esi, [ebp + 8]  ; x
	mov		edi, [ebp + 12] ; y
	mov		ebx, [ebp + 16] ; z
	mov		edx, [ebp + 20] ; size
	
	shr		edx, 7			; /128
	test	edx, edx
	jz		.last127

	vpxor		ymm0, ymm0
	
	push		ebp
.for_u128:
	push		edx			; save edx as it will used for temporary computations
	vmovdqa		ymm3, [esi + ecx]
	vpand		ymm1, ymm3, [edi + ecx]
	vpor		ymm2, ymm3, [edi + ecx]
	vpcmpeqb	ymm5, ymm0, ymm1
	vpmovmskb	ebp, ymm5
	popcnt  	edx, ebp
	add			eax, edx
	vpblendvb	ymm1, ymm2, ymm5
	vmovdqa		[ebx + ecx], ymm1

	vmovdqa		ymm3, [esi + ecx + 32]
	vpand		ymm1, ymm3, [edi + ecx + 32]
	vpor		ymm2, ymm3, [edi + ecx + 32]
	vpcmpeqb	ymm5, ymm0, ymm1
	vpmovmskb	ebp, ymm5
	popcnt  	edx, ebp
	add			eax, edx
	vpblendvb	ymm1, ymm2, ymm5
	vmovdqa		[ebx + ecx + 32], ymm1

	vmovdqa		ymm3, [esi + ecx + 64]
	vpand		ymm1, ymm3, [edi + ecx + 64]
	vpor		ymm2, ymm3, [edi + ecx + 64]
	vpcmpeqb	ymm5, ymm0, ymm1
	vpmovmskb	ebp, ymm5
	popcnt  	edx, ebp
	add			eax, edx
	vpblendvb	ymm1, ymm2, ymm5
	vmovdqa		[ebx + ecx + 64], ymm1

	vmovdqa		ymm3, [esi + ecx + 96]
	vpand		ymm1, ymm3, [edi + ecx + 96]
	vpor		ymm2, ymm3, [edi + ecx + 96]	
	vpcmpeqb	ymm5, ymm0, ymm1
	vpmovmskb	ebp, ymm5
	popcnt  	edx, ebp
	add			eax, edx
	vpblendvb	ymm1, ymm2, ymm5
	vmovdqa		[ebx + ecx + 96], ymm1

	pop			edx
	add			ecx, 128
	dec			edx
	jnz			.for_u128
	pop 		ebp
	
.last127:
	mov		edx, [ebp + 20] ; size
	and		edx, 127
	cmp		edx, 64
	jl		.last63

	vmovdqa		ymm3, [esi + ecx]
	vpand		ymm1, ymm3, [edi + ecx]
	vpor		ymm2, ymm3, [edi + ecx]
	vpcmpeqb	ymm5, ymm0, ymm1
	vpmovmskb	edx, ymm5
	popcnt  	edx, edx
	add			eax, edx
	vpblendvb	ymm1, ymm2, ymm5
	vmovdqa		[ebx + ecx], ymm1

	vmovdqa		ymm3, [esi + ecx + 32]
	vpand		ymm1, ymm3, [edi + ecx + 32]
	vpor		ymm2, ymm3, [edi + ecx + 32]	
	vpcmpeqb	ymm5, ymm0, ymm1
	vpmovmskb	edx, ymm5
	popcnt  	edx, edx
	add			eax, edx
	vpblendvb	ymm1, ymm2, ymm5
	vmovdqa		[ebx + ecx + 32], ymm1

	add			ecx, 64

.last63:
	mov			edx, [ebp + 20] ; size
	and			edx, 63
	cmp			edx, 32
	jl			.last31

	vmovdqa		ymm3, [esi + ecx]
	vpand		ymm1, ymm3, [edi + ecx]
	vpor		ymm2, ymm3, [edi + ecx]
	vpcmpeqb	ymm5, ymm0, ymm1
	vpmovmskb	edx, ymm5
	popcnt  	edx, edx
	add			eax, edx	
	vpblendvb	ymm1, ymm2, ymm5
	vmovdqa		[ebx + ecx], ymm1

	add			ecx, 32
	
.last31:
	vzeroupper
	
	mov			edx, [ebp + 20]
	and			edx, 31
	cmp			edx, 16
	jl			.last_15
	
	movdqu		xmm1, [esi + ecx]
	movdqu		xmm3, [edi + ecx]	
	movdqa		xmm2, xmm1
	movdqa		xmm4, xmm3
	pand		xmm1, xmm3
	por			xmm2, xmm4
	pcmpeqb		xmm0, xmm1
	pmovmskb	edx, xmm0
	popcnt  	edx, edx
	add			eax, edx
	pblendvb	xmm1, xmm2, xmm0
	movdqa		[ebx + ecx], xmm1
	add			ecx, 16

.last_15:
	mov		edx, [ebp + 20]
	and		edx, 15
	test	edx, edx	
	jz		end_maxpars_avx2_u4
	
	add		esi, ecx
	add		edi, ecx
	add		ebx, ecx
	
	push	ebp
	mov		ebp, ebx
	
	jmp		[case_avx2_u4 + edx * 4]


end_maxpars_avx2_u4:	
	pop		ebx
	pop		edi
	pop		esi

	mov		esp, ebp
	pop		ebp
	ret

L15:	U1
L14:	U1
L13:	U1	
L12:	U1	
L11:	U1		
L10:	U1	
L9:		U1	
L8:		U1
L7:		U1
L6:		U1
L5:		U1
L4:		U1
L3:		U1
L2:		U1
L1:		U1
	
	pop		ebp
	jmp		end_maxpars_avx2_u4


align(16)
case_avx2_u4: 	dd 	0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15	
