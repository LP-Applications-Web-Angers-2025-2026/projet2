%include "src/popcount_nasm.inc"
%include "src/vpxord_nasm.inc"

global maxpars_avx512_u2
extern popcount_table

section .text
; esi = x
; edi = y
; ebx = z
; ecx = i
; edx = size
; eax = mutations
; ebp = temporary computations
maxpars_avx512_u2:
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
	
	shr		edx, 7			; /64
	test	edx, edx
	jz		.last_127
	
	push		ebp             ; temporary
	
	_VPXORD_ZMM0
	
.for_u128:
	vmovdqa64	zmm3, [esi + ecx]
	vpandd		zmm1, zmm3, [edi + ecx]	
	vpord		zmm2, zmm3, [edi + ecx]	
	
	vpcmpeqb	k1, zmm0, zmm1
	
	vmovdqu8	zmm1 {k1}, zmm2
	vmovdqa64	[ebx + ecx], zmm1
	
	kmovd		ebp, k1		
	kshiftrq	k2, k1, 32
	popcnt  	ebp, ebp
	add			eax, ebp
	kmovd		ebp, k2
	popcnt 		ebp, ebp
	add			eax, ebp

	vmovdqa64	zmm6, [esi + ecx + 64]
	vpandd		zmm4, zmm6, [edi + ecx + 64]	
	vpord		zmm5, zmm6, [edi + ecx + 64]	
	
	vpcmpeqb	k3, zmm0, zmm4
	
	vmovdqu8	zmm4 {k3}, zmm5
	vmovdqa64	[ebx + ecx + 64], zmm4
	
	kmovd		ebp, k3		
	kshiftrq	k4, k3, 32
	popcnt  	ebp, ebp
	add			eax, ebp
	kmovd		ebp, k4
	popcnt 		ebp, ebp
	add			eax, ebp

	add		ecx, 128
	dec		edx
	jnz		.for_u128
	pop		ebp
	vzeroupper
	
.last_127:	
	mov		edx, [ebp + 20]
	and		edx, 127
	cmp		edx, 64
	jl		.last_63
	
	push		ebp
	vmovdqa64	zmm3, [esi + ecx]
	vpandd		zmm1, zmm3, [edi + ecx]	
	vpord		zmm2, zmm3, [edi + ecx]	
	
	vpcmpeqb	k1, zmm0, zmm1
	
	vmovdqu8	zmm1 {k1}, zmm2
	vmovdqa64	[ebx + ecx], zmm1
	
	kmovd		ebp, k1		
	kshiftrq	k2, k1, 32
	popcnt  	ebp, ebp
	add			eax, ebp
	kmovd		ebp, k2
	popcnt 		ebp, ebp
	add			eax, ebp
	
	add		ecx, 64
	pop		ebp
	vzeroupper
	
.last_63:
	mov		edx, [ebp + 20]
	and		edx, 63
	cmp		edx, 32
	jl		.last_31

	push	ebp             ; temporary

	vpxor	ymm0, ymm0
	vmovdqa	ymm3, [esi + ecx]
	vmovdqa	ymm4, [edi + ecx]	
	
	vpand	ymm1, ymm3, ymm4
	vpor	ymm2, ymm3, ymm4
	
	vpcmpeqb	ymm0, ymm1
	
	vpmovmskb	ebp, ymm0
	popcnt  ebp, ebp
	add		eax, ebp
	
	vpblendvb	ymm1, ymm2, ymm0
	
	vmovdqa	[ebx + ecx], ymm1

	add		ecx, 32
	pop		ebp
	
	
.last_31:
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
	
