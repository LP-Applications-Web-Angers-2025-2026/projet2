global maxpars_avx2_u2

section .text

; esi = x
; edi = y
; ebx = z
; ecx = i
; edx = size
; eax = mutations
; ebp = temporary computations
maxpars_avx2_u2:
	push	ebp
	mov		ebp, esp

	mov		eax, [ebp + 20] ; if (size == 0) return 0
	test	eax, eax
	jz		.end
	
	push	esi
	push	edi
	push	ebx
	
	xor		ecx, ecx		; i = 0
	xor		eax, eax		; mutations = 0
	mov		esi, [ebp + 8]  ; x
	mov		edi, [ebp + 12] ; y
	mov		ebx, [ebp + 16] ; z
	mov		edx, [ebp + 20] ; size
	
	shr		edx, 6			; /64
	test	edx, edx
	jz		.last63
	
	push	ebp             ; temporary

.for_u64:
	vpxor	ymm0, ymm0
	vmovdqa	ymm1, [esi + ecx]
	vmovdqa	ymm3, [edi + ecx]	
	vmovdqa	ymm2, ymm1
	vmovdqa	ymm4, ymm3
	vpand	ymm1, ymm3
	vpor	ymm2, ymm4
	vpcmpeqb	ymm0, ymm1
	vpmovmskb	ebp, ymm0
	popcnt  ebp, ebp
	add		eax, ebp
	vpblendvb	ymm1, ymm2, ymm0
	vmovdqa	[ebx + ecx], ymm1

	vpxor	ymm0, ymm0
	vmovdqa	ymm1, [esi + ecx + 32]
	vmovdqa	ymm3, [edi + ecx + 32]	
	vmovdqa	ymm2, ymm1
	vmovdqa	ymm4, ymm3
	vpand	ymm1, ymm3
	vpor	ymm2, ymm4	
	vpcmpeqb	ymm0, ymm1
	vpmovmskb	ebp, ymm0
	popcnt  ebp, ebp
	add		eax, ebp
	vpblendvb	ymm1, ymm2, ymm0
	vmovdqa	[ebx + ecx + 32], ymm1

	add		ecx, 64
	dec		edx
	jnz		.for_u64
	pop		ebp
	

.last63:
	mov		edx, [ebp + 20] ; size
	and		edx, 63
	cmp		edx, 32
	jl		.last31

	push	ebp
	vpxor	ymm0, ymm0
	vmovdqa	ymm1, [esi + ecx]
	vmovdqa	ymm3, [edi + ecx]	
	vmovdqa	ymm2, ymm1
	vmovdqa	ymm4, ymm3
	vpand	ymm1, ymm3
	vpor	ymm2, ymm4
	vpcmpeqb	ymm0, ymm1
	vpmovmskb	ebp, ymm0
	popcnt  ebp, ebp
	add		eax, ebp	
	vpblendvb	ymm1, ymm2, ymm0
	vmovdqa	[ebx + ecx], ymm1

	add		ecx, 32
	pop		ebp
	
.last31:
	mov		edx, [ebp + 20]
	and		edx, 31
	cmp		edx, 16
	jl		.last_15
	
	push	ebp
	pxor	xmm0, xmm0
	movdqu	xmm1, [esi + ecx]
	movdqu	xmm3, [edi + ecx]	
	movdqa	xmm2, xmm1
	movdqa	xmm4, xmm3
	pand	xmm1, xmm3
	por		xmm2, xmm4
	pcmpeqb	xmm0, xmm1
	pmovmskb	ebp, xmm0
	popcnt  ebp, ebp
	add		eax, ebp
	pblendvb	xmm1, xmm2, xmm0
	movdqa	[ebx + ecx], xmm1
	add		ecx, 16
	pop		ebp

.last_15:
	mov		edx, [ebp + 20]
	and		edx, 15
	jz		.skip_last
	
	push	ebp
	mov		ebp, eax	
	
.for:
	mov		al, [esi + ecx]
	and		al, [edi + ecx]
	cmp		al, 0
	jnz		.endif
	mov		al, [esi + ecx]
	or		al, [edi + ecx]
	add		ebp, 1
.endif:	
	mov		[ebx + ecx], al
	add		ecx, 1
	dec		edx
	jnz		.for
	
	mov		eax, ebp
	pop		ebp

.skip_last:	
	pop		ebx
	pop		edi
	pop		esi
.end:	
	mov		esp, ebp
	pop		ebp
	ret
	
