	.file	"b.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z18popcnt_shift_v2_u8h
	.type	_Z18popcnt_shift_v2_u8h, @function
_Z18popcnt_shift_v2_u8h:
.LFB1639:
	.cfi_startproc
	endbr32
	mov	eax, DWORD PTR 4[esp]
	mov	edx, eax
	shr	dx
	and	edx, 85
	sub	eax, edx
	mov	ecx, eax
	shr	ax, 2
	and	ecx, 51
	and	eax, 51
	add	eax, ecx
	mov	edx, eax
	shr	dx, 4
	add	eax, edx
	and	eax, 15
	ret
	.cfi_endproc
.LFE1639:
	.size	_Z18popcnt_shift_v2_u8h, .-_Z18popcnt_shift_v2_u8h
	.p2align 4
	.globl	_Z19popcnt_shift_v2_u32j
	.type	_Z19popcnt_shift_v2_u32j, @function
_Z19popcnt_shift_v2_u32j:
.LFB1640:
	.cfi_startproc
	endbr32
	mov	eax, DWORD PTR 4[esp]
	mov	edx, eax
	shr	edx
	and	edx, 1431655765
	sub	eax, edx
	mov	ecx, eax
	shr	eax, 2
	and	eax, 858993459
	and	ecx, 858993459
	add	ecx, eax
	mov	eax, ecx
	shr	eax, 4
	add	eax, ecx
	and	eax, 252645135
	mov	edx, eax
	shr	edx, 8
	add	edx, eax
	mov	eax, edx
	shr	eax, 16
	add	eax, edx
	and	eax, 127
	ret
	.cfi_endproc
.LFE1640:
	.size	_Z19popcnt_shift_v2_u32j, .-_Z19popcnt_shift_v2_u32j
	.p2align 4
	.globl	_Z19u32_popcnt_shift_v2Phj
	.type	_Z19u32_popcnt_shift_v2Phj, @function
_Z19u32_popcnt_shift_v2Phj:
.LFB1641:
	.cfi_startproc
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	and	esp, -32
	sub	esp, 192
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	mov	eax, DWORD PTR 12[ebp]
	mov	edx, DWORD PTR 12[ebp]
	call	__x86.get_pc_thunk.di
	add	edi, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	dec	eax
	and	edx, -4
	mov	DWORD PTR 120[esp], eax
	mov	DWORD PTR 124[esp], edx
	je	.L52
	lea	ecx, -1[edx]
	cmp	ecx, 11
	jbe	.L23
	mov	ebx, ecx
	shr	ebx, 2
	mov	DWORD PTR 116[esp], ebx
	lea	esi, 1[ebx]
	cmp	ecx, 27
	jbe	.L24
	mov	eax, DWORD PTR 8[ebp]
	mov	ecx, esi
	vmovdqa	ymm2, YMMWORD PTR .LC4@GOTOFF[edi]
	vmovdqa	ymm0, YMMWORD PTR .LC6@GOTOFF[edi]
	shr	ecx, 3
	vmovdqa	ymm5, YMMWORD PTR .LC2@GOTOFF[edi]
	vmovdqa	ymm4, YMMWORD PTR .LC3@GOTOFF[edi]
	lea	edx, -1[ecx]
	vmovdqa	ymm3, YMMWORD PTR .LC0@GOTOFF[edi]
	vmovdqa	ymm7, YMMWORD PTR .LC5@GOTOFF[edi]
	and	edx, 1
	vmovdqu	ymm1, YMMWORD PTR [eax]
	vmovdqa	ymm6, YMMWORD PTR .LC1@GOTOFF[edi]
	mov	eax, 1
	vmovdqa	YMMWORD PTR 160[esp], ymm2
	vmovdqa	YMMWORD PTR 64[esp], ymm0
	vmovdqa	YMMWORD PTR 128[esp], ymm7
	vpsrld	ymm2, ymm1, 1
	vpand	ymm0, ymm2, ymm5
	vmovdqa	YMMWORD PTR 32[esp], ymm1
	vpaddd	ymm7, ymm3, ymm6
	vpsubd	ymm2, ymm1, ymm0
	vpsrld	ymm1, ymm2, 2
	vpand	ymm2, ymm2, ymm4
	vpand	ymm0, ymm1, ymm4
	vpaddd	ymm1, ymm0, ymm2
	vpsrld	ymm0, ymm1, 4
	vpaddd	ymm2, ymm0, ymm1
	vpand	ymm1, ymm2, YMMWORD PTR 160[esp]
	vpsrld	ymm0, ymm1, 8
	vpaddd	ymm1, ymm0, ymm1
	vpsrld	ymm2, ymm1, 16
	vpaddd	ymm0, ymm2, ymm1
	vpaddd	ymm1, ymm3, YMMWORD PTR 64[esp]
	vpand	ymm2, ymm0, YMMWORD PTR 128[esp]
	cmp	ecx, 1
	jbe	.L10
	test	edx, edx
	jne	.L53
.L50:
	mov	edx, DWORD PTR 8[ebp]
.L11:
	mov	ebx, eax
	vpaddd	ymm3, ymm7, ymm6
	sal	ebx, 5
	vmovdqu	ymm7, YMMWORD PTR [edx+ebx]
	mov	ebx, eax
	add	eax, 2
	sal	ebx, 5
	vpsrld	ymm0, ymm7, 1
	vpand	ymm1, ymm0, ymm5
	vpsubd	ymm7, ymm7, ymm1
	vpsrld	ymm0, ymm7, 2
	vpand	ymm7, ymm7, ymm4
	vpand	ymm1, ymm0, ymm4
	vpaddd	ymm1, ymm1, ymm7
	vpsrld	ymm0, ymm1, 4
	vpaddd	ymm7, ymm0, ymm1
	vpand	ymm0, ymm7, YMMWORD PTR 160[esp]
	vpsrld	ymm1, ymm0, 8
	vpaddd	ymm7, ymm1, ymm0
	vpsrld	ymm0, ymm7, 16
	vpaddd	ymm1, ymm0, ymm7
	vpand	ymm7, ymm1, YMMWORD PTR 128[esp]
	vmovdqu	ymm1, YMMWORD PTR 32[ebx+edx]
	vpsrld	ymm0, ymm1, 1
	vpand	ymm0, ymm0, ymm5
	vpaddd	ymm2, ymm2, ymm7
	vpaddd	ymm7, ymm3, ymm6
	vpsubd	ymm0, ymm1, ymm0
	vpsrld	ymm1, ymm0, 2
	vpand	ymm0, ymm0, ymm4
	vpand	ymm1, ymm1, ymm4
	vpaddd	ymm1, ymm1, ymm0
	vpsrld	ymm0, ymm1, 4
	vpaddd	ymm1, ymm0, ymm1
	vpand	ymm0, ymm1, YMMWORD PTR 160[esp]
	vpsrld	ymm1, ymm0, 8
	vpaddd	ymm1, ymm1, ymm0
	vpsrld	ymm0, ymm1, 16
	vpaddd	ymm1, ymm0, ymm1
	vpand	ymm0, ymm1, YMMWORD PTR 128[esp]
	vpaddd	ymm1, ymm3, YMMWORD PTR 64[esp]
	vpaddd	ymm2, ymm2, ymm0
	cmp	ecx, eax
	ja	.L11
.L10:
	vextracti128	xmm4, ymm2, 0x1
	mov	ebx, esi
	vextracti128	xmm6, ymm1, 0x1
	vpaddd	xmm3, xmm2, xmm4
	and	ebx, -8
	vpextrd	edx, xmm6, 3
	vpsrldq	xmm7, xmm3, 8
	vpaddd	xmm2, xmm3, xmm7
	lea	ecx, 0[0+ebx*4]
	vpsrldq	xmm1, xmm2, 4
	vpaddd	xmm0, xmm2, xmm1
	mov	DWORD PTR 160[esp], ecx
	add	ecx, DWORD PTR 8[ebp]
	vmovd	eax, xmm0
	cmp	esi, ebx
	je	.L12
.L9:
	mov	edx, DWORD PTR 116[esp]
	sub	esi, ebx
	sub	edx, ebx
	cmp	edx, 2
	jbe	.L14
	mov	edx, DWORD PTR 8[ebp]
	vmovdqa	xmm2, XMMWORD PTR .LC8@GOTOFF[edi]
	mov	DWORD PTR 128[esp], esi
	vmovdqu	xmm6, XMMWORD PTR [edx+ebx*4]
	vpsrld	xmm5, xmm6, 1
	vpand	xmm4, xmm5, XMMWORD PTR .LC7@GOTOFF[edi]
	vpsubd	xmm3, xmm6, xmm4
	vpand	xmm0, xmm3, xmm2
	vpsrld	xmm7, xmm3, 2
	vpand	xmm1, xmm7, xmm2
	vpaddd	xmm6, xmm1, xmm0
	vpsrld	xmm5, xmm6, 4
	vpaddd	xmm4, xmm5, xmm6
	vpand	xmm3, xmm4, XMMWORD PTR .LC9@GOTOFF[edi]
	vbroadcastss	xmm5, DWORD PTR 160[esp]
	vpaddd	xmm4, xmm5, XMMWORD PTR .LC11@GOTOFF[edi]
	vpsrld	xmm7, xmm3, 8
	vpaddd	xmm2, xmm7, xmm3
	vpsrld	xmm1, xmm2, 16
	vpaddd	xmm0, xmm1, xmm2
	vpand	xmm6, xmm0, XMMWORD PTR .LC10@GOTOFF[edi]
	vpextrd	edx, xmm4, 3
	vpsrldq	xmm3, xmm6, 8
	vpaddd	xmm7, xmm6, xmm3
	vpsrldq	xmm2, xmm7, 4
	vpaddd	xmm1, xmm7, xmm2
	vmovd	ebx, xmm1
	add	eax, ebx
	mov	ebx, esi
	and	ebx, -4
	lea	esi, 0[0+ebx*4]
	add	DWORD PTR 160[esp], esi
	add	ecx, esi
	cmp	DWORD PTR 128[esp], ebx
	je	.L12
.L14:
	mov	edx, DWORD PTR [ecx]
	mov	ebx, edx
	shr	ebx
	and	ebx, 1431655765
	sub	edx, ebx
	mov	esi, edx
	shr	edx, 2
	and	esi, 858993459
	and	edx, 858993459
	add	edx, esi
	mov	ebx, edx
	shr	ebx, 4
	add	edx, ebx
	and	edx, 252645135
	mov	esi, edx
	shr	esi, 8
	add	edx, esi
	mov	esi, DWORD PTR 160[esp]
	mov	ebx, edx
	shr	ebx, 16
	add	edx, ebx
	and	edx, 127
	add	eax, edx
	lea	edx, 4[esi]
	cmp	DWORD PTR 124[esp], edx
	jbe	.L12
	mov	edx, DWORD PTR 4[ecx]
	mov	ebx, edx
	shr	ebx
	and	ebx, 1431655765
	sub	edx, ebx
	mov	ebx, edx
	shr	edx, 2
	and	ebx, 858993459
	and	edx, 858993459
	add	edx, ebx
	mov	ebx, edx
	shr	ebx, 4
	add	edx, ebx
	and	edx, 252645135
	mov	ebx, edx
	shr	ebx, 8
	add	edx, ebx
	mov	ebx, edx
	shr	ebx, 16
	add	edx, ebx
	and	edx, 127
	add	eax, edx
	lea	edx, 8[esi]
	cmp	DWORD PTR 124[esp], edx
	jbe	.L12
	mov	edx, DWORD PTR 8[ecx]
	add	esi, 12
	mov	ecx, edx
	shr	ecx
	and	ecx, 1431655765
	sub	edx, ecx
	mov	ebx, edx
	shr	edx, 2
	and	ebx, 858993459
	and	edx, 858993459
	add	edx, ebx
	mov	ecx, edx
	shr	ecx, 4
	add	edx, ecx
	and	edx, 252645135
	mov	ebx, edx
	shr	ebx, 8
	add	edx, ebx
	mov	ecx, edx
	shr	ecx, 16
	add	edx, ecx
	and	edx, 127
	add	eax, edx
	mov	edx, esi
.L12:
	cmp	DWORD PTR 12[ebp], edx
	jbe	.L4
	mov	ecx, DWORD PTR 120[esp]
	mov	ebx, DWORD PTR 12[ebp]
	sub	ecx, edx
	sub	ebx, edx
	cmp	ecx, 30
	mov	ecx, edx
	jbe	.L25
	vmovdqa	ymm1, YMMWORD PTR .LC12@GOTOFF[edi]
	vmovdqa	ymm5, YMMWORD PTR .LC13@GOTOFF[edi]
	mov	esi, ebx
	vpxor	xmm2, xmm2, xmm2
	vmovdqa	ymm3, YMMWORD PTR .LC14@GOTOFF[edi]
	vmovdqa	ymm4, YMMWORD PTR .LC15@GOTOFF[edi]
	and	esi, -32
	add	ecx, DWORD PTR 8[ebp]
	add	esi, ecx
	.p2align 4
	.p2align 3
.L19:
	vmovdqu	ymm7, YMMWORD PTR [ecx]
	vpmovzxbw	ymm0, XMMWORD PTR [ecx]
	add	ecx, 32
	vextracti128	xmm6, ymm7, 0x1
	vpsrlw	ymm0, ymm0, 1
	vpand	ymm0, ymm1, ymm0
	vpmovzxbw	ymm6, xmm6
	vpsrlw	ymm6, ymm6, 1
	vpand	ymm6, ymm1, ymm6
	vpackuswb	ymm0, ymm0, ymm6
	vpermq	ymm6, ymm0, 216
	vpand	ymm0, ymm5, ymm6
	vpsubb	ymm0, ymm7, ymm0
	vextracti128	xmm7, ymm0, 0x1
	vpmovzxbw	ymm6, xmm0
	vpand	ymm0, ymm0, ymm3
	vpmovzxbw	ymm7, xmm7
	vpsrlw	ymm6, ymm6, 2
	vpand	ymm6, ymm1, ymm6
	vpsrlw	ymm7, ymm7, 2
	vpand	ymm7, ymm1, ymm7
	vpackuswb	ymm6, ymm6, ymm7
	vpermq	ymm7, ymm6, 216
	vpand	ymm6, ymm3, ymm7
	vpaddb	ymm0, ymm6, ymm0
	vextracti128	xmm7, ymm0, 0x1
	vpmovzxbw	ymm6, xmm0
	vpmovzxbw	ymm7, xmm7
	vpsrlw	ymm6, ymm6, 4
	vpand	ymm6, ymm1, ymm6
	vpsrlw	ymm7, ymm7, 4
	vpand	ymm7, ymm1, ymm7
	vpackuswb	ymm6, ymm6, ymm7
	vpermq	ymm7, ymm6, 216
	vpaddb	ymm0, ymm0, ymm7
	vpand	ymm7, ymm0, ymm4
	vpmovzxbw	ymm6, xmm7
	vextracti128	xmm0, ymm7, 0x1
	vextracti128	xmm7, ymm6, 0x1
	vpmovzxbw	ymm0, xmm0
	vpmovzxwd	ymm6, xmm6
	vpmovzxwd	ymm7, xmm7
	vpaddd	ymm6, ymm7, ymm6
	vpmovzxwd	ymm7, xmm0
	vextracti128	xmm0, ymm0, 0x1
	vpaddd	ymm6, ymm6, ymm7
	vpmovzxwd	ymm7, xmm0
	vpaddd	ymm6, ymm6, ymm7
	vpaddd	ymm2, ymm2, ymm6
	cmp	ecx, esi
	jne	.L19
	vextracti128	xmm1, ymm2, 0x1
	mov	esi, ebx
	vpaddd	xmm5, xmm1, xmm2
	and	esi, -32
	vpsrldq	xmm3, xmm5, 8
	vpaddd	xmm4, xmm5, xmm3
	add	edx, esi
	vpsrldq	xmm0, xmm4, 4
	vpaddd	xmm7, xmm4, xmm0
	vmovd	ecx, xmm7
	add	eax, ecx
	mov	ecx, edx
	cmp	esi, ebx
	je	.L4
.L17:
	sub	ebx, esi
	mov	esi, DWORD PTR 120[esp]
	sub	esi, edx
	cmp	esi, 14
	jbe	.L21
	mov	esi, DWORD PTR 8[ebp]
	vmovdqa	xmm7, XMMWORD PTR .LC16@GOTOFF[edi]
	vmovdqu	xmm6, XMMWORD PTR [esi+edx]
	mov	edx, ebx
	and	edx, -16
	add	ecx, edx
	vpmovzxbw	xmm2, xmm6
	vpsrldq	xmm1, xmm6, 8
	vpmovzxbw	xmm5, xmm1
	vpsrlw	xmm4, xmm2, 1
	vpsrlw	xmm3, xmm5, 1
	vpand	xmm0, xmm7, xmm4
	vpand	xmm2, xmm7, xmm3
	vpackuswb	xmm1, xmm0, xmm2
	vpand	xmm5, xmm1, XMMWORD PTR .LC17@GOTOFF[edi]
	vpsubb	xmm6, xmm6, xmm5
	vpsrldq	xmm3, xmm6, 8
	vpmovzxbw	xmm0, xmm3
	vmovdqa	xmm3, XMMWORD PTR .LC18@GOTOFF[edi]
	vpmovzxbw	xmm4, xmm6
	vpsrlw	xmm2, xmm4, 2
	vpsrlw	xmm5, xmm0, 2
	vpand	xmm1, xmm7, xmm2
	vpand	xmm4, xmm7, xmm5
	vpackuswb	xmm0, xmm1, xmm4
	vpand	xmm2, xmm0, xmm3
	vpand	xmm6, xmm6, xmm3
	vpaddb	xmm5, xmm2, xmm6
	vpmovzxbw	xmm1, xmm5
	vpsrldq	xmm4, xmm5, 8
	vpmovzxbw	xmm3, xmm4
	vpsrlw	xmm0, xmm1, 4
	vpsrlw	xmm2, xmm3, 4
	vpand	xmm6, xmm7, xmm0
	vpand	xmm7, xmm7, xmm2
	vpackuswb	xmm1, xmm6, xmm7
	vpaddb	xmm5, xmm1, xmm5
	vpand	xmm4, xmm5, XMMWORD PTR .LC19@GOTOFF[edi]
	vpmovzxbw	xmm2, xmm4
	vpsrldq	xmm3, xmm4, 8
	vpmovzxbw	xmm0, xmm3
	vpmovzxwd	xmm1, xmm0
	vpsrldq	xmm6, xmm2, 8
	vpmovzxwd	xmm7, xmm6
	vpsrldq	xmm4, xmm0, 8
	vpaddd	xmm5, xmm7, xmm1
	vpmovzxwd	xmm3, xmm4
	vpmovzxwd	xmm2, xmm2
	vpaddd	xmm0, xmm5, xmm3
	vpaddd	xmm6, xmm0, xmm2
	vpsrldq	xmm7, xmm6, 8
	vpaddd	xmm5, xmm6, xmm7
	vpsrldq	xmm1, xmm5, 4
	vpaddd	xmm4, xmm5, xmm1
	vmovd	edi, xmm4
	add	eax, edi
	cmp	ebx, edx
	je	.L4
.L21:
	mov	edi, DWORD PTR 8[ebp]
	movzx	edx, BYTE PTR [edi+ecx]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	add	edx, esi
	lea	esi, 1[ecx]
	mov	ebx, edx
	shr	bx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 1[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	add	edx, esi
	lea	esi, 2[ecx]
	mov	ebx, edx
	shr	bx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 2[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	add	edx, esi
	lea	esi, 3[ecx]
	mov	ebx, edx
	shr	bx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 3[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	add	edx, esi
	lea	esi, 4[ecx]
	mov	ebx, edx
	shr	bx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 4[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	lea	ebx, [edx+esi]
	lea	esi, 5[ecx]
	mov	edx, ebx
	shr	dx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 5[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	add	edx, esi
	lea	esi, 6[ecx]
	mov	ebx, edx
	shr	bx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 6[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	add	edx, esi
	lea	esi, 7[ecx]
	mov	ebx, edx
	shr	bx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 7[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	add	edx, esi
	lea	esi, 8[ecx]
	mov	ebx, edx
	shr	bx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 8[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	add	edx, esi
	lea	esi, 9[ecx]
	mov	ebx, edx
	shr	bx, 4
	add	ebx, edx
	and	ebx, 15
	add	eax, ebx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 9[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	lea	ebx, [esi+edx]
	lea	esi, 10[ecx]
	mov	edx, ebx
	shr	dx, 4
	add	edx, ebx
	and	edx, 15
	add	eax, edx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 10[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	lea	ebx, [esi+edx]
	lea	esi, 11[ecx]
	mov	edx, ebx
	shr	dx, 4
	add	edx, ebx
	and	edx, 15
	add	eax, edx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 11[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	lea	ebx, [esi+edx]
	lea	esi, 12[ecx]
	mov	edx, ebx
	shr	dx, 4
	add	edx, ebx
	and	edx, 15
	add	eax, edx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 12[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	lea	ebx, [esi+edx]
	lea	esi, 13[ecx]
	mov	edx, ebx
	shr	dx, 4
	add	edx, ebx
	and	edx, 15
	add	eax, edx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 13[ecx+edi]
	mov	ebx, edx
	shr	bx
	and	ebx, 85
	sub	edx, ebx
	mov	esi, edx
	shr	dx, 2
	and	esi, 51
	and	edx, 51
	lea	ebx, [esi+edx]
	lea	esi, 14[ecx]
	mov	edx, ebx
	shr	dx, 4
	add	edx, ebx
	and	edx, 15
	add	eax, edx
	cmp	DWORD PTR 12[ebp], esi
	jbe	.L4
	movzx	edx, BYTE PTR 14[ecx+edi]
	mov	ecx, edx
	shr	cx
	and	ecx, 85
	sub	edx, ecx
	mov	edi, edx
	shr	dx, 2
	and	edi, 51
	and	edx, 51
	lea	ebx, [edx+edi]
	mov	esi, ebx
	shr	si, 4
	add	esi, ebx
	and	esi, 15
	add	eax, esi
.L4:
	vzeroupper
	lea	esp, -12[ebp]
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4
	.p2align 3
.L53:
	.cfi_restore_state
	mov	ebx, DWORD PTR 8[ebp]
	vmovdqa	YMMWORD PTR [esp], ymm7
	mov	eax, 2
	vpaddd	ymm7, ymm7, ymm6
	vmovdqu	ymm3, YMMWORD PTR 32[ebx]
	vpsrld	ymm1, ymm3, 1
	vpand	ymm0, ymm1, ymm5
	vmovdqa	YMMWORD PTR 32[esp], ymm3
	vpsubd	ymm0, ymm3, ymm0
	vpsrld	ymm3, ymm0, 2
	vpand	ymm0, ymm0, ymm4
	vpand	ymm1, ymm3, ymm4
	vpaddd	ymm3, ymm1, ymm0
	vpsrld	ymm1, ymm3, 4
	vpaddd	ymm0, ymm1, ymm3
	vpand	ymm3, ymm0, YMMWORD PTR 160[esp]
	vpsrld	ymm1, ymm3, 8
	vpaddd	ymm0, ymm1, ymm3
	vpsrld	ymm3, ymm0, 16
	vpaddd	ymm1, ymm3, ymm0
	vpand	ymm0, ymm1, YMMWORD PTR 128[esp]
	vmovdqa	ymm3, YMMWORD PTR [esp]
	vpaddd	ymm1, ymm3, YMMWORD PTR 64[esp]
	vpaddd	ymm2, ymm2, ymm0
	cmp	ecx, 2
	ja	.L50
	jmp	.L10
	.p2align 4
	.p2align 3
.L23:
	mov	eax, DWORD PTR 8[ebp]
	shr	ecx, 2
	and	ecx, 3
	mov	eax, DWORD PTR [eax]
	mov	esi, eax
	shr	esi
	and	esi, 1431655765
	sub	eax, esi
	mov	edx, eax
	shr	eax, 2
	and	edx, 858993459
	and	eax, 858993459
	add	eax, edx
	mov	ebx, eax
	shr	ebx, 4
	add	eax, ebx
	and	eax, 252645135
	mov	esi, eax
	shr	esi, 8
	add	eax, esi
	mov	edx, eax
	shr	edx, 16
	add	eax, edx
	mov	edx, 4
	and	eax, 127
	cmp	DWORD PTR 124[esp], 4
	jbe	.L12
	test	ecx, ecx
	je	.L47
	cmp	ecx, 1
	je	.L38
	cmp	ecx, 2
	jne	.L54
.L39:
	mov	ecx, DWORD PTR 8[ebp]
	mov	esi, DWORD PTR [ecx+edx]
	add	edx, 4
	mov	ebx, esi
	shr	ebx
	and	ebx, 1431655765
	sub	esi, ebx
	mov	ecx, esi
	shr	esi, 2
	and	ecx, 858993459
	and	esi, 858993459
	add	esi, ecx
	mov	ebx, esi
	shr	ebx, 4
	add	esi, ebx
	and	esi, 252645135
	mov	ecx, esi
	shr	ecx, 8
	add	esi, ecx
	mov	ebx, esi
	shr	ebx, 16
	add	esi, ebx
	and	esi, 127
	add	eax, esi
.L38:
	mov	esi, DWORD PTR 8[ebp]
	mov	ecx, DWORD PTR [esi+edx]
	add	edx, 4
	mov	ebx, ecx
	shr	ebx
	and	ebx, 1431655765
	sub	ecx, ebx
	mov	ebx, ecx
	shr	ecx, 2
	and	ebx, 858993459
	and	ecx, 858993459
	add	ecx, ebx
	mov	ebx, ecx
	shr	ebx, 4
	add	ecx, ebx
	and	ecx, 252645135
	mov	ebx, ecx
	shr	ebx, 8
	add	ecx, ebx
	mov	ebx, ecx
	shr	ebx, 16
	add	ecx, ebx
	mov	ebx, esi
	and	ecx, 127
	add	eax, ecx
	cmp	DWORD PTR 124[esp], edx
	jbe	.L12
.L8:
	mov	esi, DWORD PTR [ebx+edx]
	mov	ecx, esi
	shr	ecx
	and	ecx, 1431655765
	sub	esi, ecx
	mov	ecx, esi
	shr	esi, 2
	and	ecx, 858993459
	and	esi, 858993459
	add	esi, ecx
	mov	ecx, esi
	shr	ecx, 4
	add	esi, ecx
	and	esi, 252645135
	mov	ecx, esi
	shr	ecx, 8
	add	ecx, esi
	mov	esi, ecx
	shr	esi, 16
	add	ecx, esi
	and	ecx, 127
	add	ecx, eax
	mov	eax, DWORD PTR 4[ebx+edx]
	mov	esi, eax
	shr	esi
	and	esi, 1431655765
	sub	eax, esi
	mov	esi, eax
	shr	eax, 2
	and	esi, 858993459
	and	eax, 858993459
	add	eax, esi
	mov	esi, eax
	shr	esi, 4
	add	eax, esi
	and	eax, 252645135
	mov	esi, eax
	shr	esi, 8
	add	eax, esi
	mov	esi, eax
	shr	esi, 16
	add	eax, esi
	and	eax, 127
	add	eax, ecx
	mov	ecx, DWORD PTR 8[ebx+edx]
	mov	esi, ecx
	shr	esi
	and	esi, 1431655765
	sub	ecx, esi
	mov	esi, ecx
	shr	ecx, 2
	and	esi, 858993459
	and	ecx, 858993459
	add	ecx, esi
	mov	esi, ecx
	shr	esi, 4
	add	ecx, esi
	and	ecx, 252645135
	mov	esi, ecx
	shr	esi, 8
	add	ecx, esi
	mov	esi, ecx
	shr	esi, 16
	add	ecx, esi
	and	ecx, 127
	add	eax, ecx
	mov	ecx, DWORD PTR 12[ebx+edx]
	mov	esi, ecx
	shr	esi
	and	esi, 1431655765
	sub	ecx, esi
	mov	esi, ecx
	shr	ecx, 2
	and	esi, 858993459
	and	ecx, 858993459
	add	ecx, esi
	mov	esi, ecx
	shr	esi, 4
	add	ecx, esi
	and	ecx, 252645135
	mov	esi, ecx
	shr	esi, 8
	add	ecx, esi
	mov	esi, ecx
	shr	esi, 16
	add	ecx, esi
	and	ecx, 127
	add	eax, ecx
	add	edx, 16
	cmp	DWORD PTR 124[esp], edx
	ja	.L8
	jmp	.L12
	.p2align 4
	.p2align 3
.L52:
	xor	edx, edx
	xor	eax, eax
	jmp	.L12
.L25:
	xor	esi, esi
	jmp	.L17
.L24:
	mov	ecx, DWORD PTR 8[ebp]
	xor	ebx, ebx
	mov	DWORD PTR 160[esp], 0
	xor	eax, eax
	jmp	.L9
.L54:
	mov	ecx, DWORD PTR 8[ebp]
	mov	ebx, DWORD PTR 4[ecx]
	mov	esi, ebx
	shr	esi
	and	esi, 1431655765
	sub	ebx, esi
	mov	edx, ebx
	shr	ebx, 2
	and	edx, 858993459
	and	ebx, 858993459
	add	ebx, edx
	mov	ecx, ebx
	shr	ecx, 4
	add	ebx, ecx
	and	ebx, 252645135
	mov	esi, ebx
	shr	esi, 8
	add	esi, ebx
	mov	edx, esi
	shr	edx, 16
	add	esi, edx
	mov	edx, 8
	and	esi, 127
	add	eax, esi
	jmp	.L39
.L47:
	mov	ebx, DWORD PTR 8[ebp]
	jmp	.L8
	.cfi_endproc
.LFE1641:
	.size	_Z19u32_popcnt_shift_v2Phj, .-_Z19u32_popcnt_shift_v2Phj
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__Z18popcnt_shift_v2_u8h, @function
_GLOBAL__sub_I__Z18popcnt_shift_v2_u8h:
.LFB2134:
	.cfi_startproc
	endbr32
	push	esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	push	ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	sub	esp, 16
	.cfi_def_cfa_offset 28
	lea	esi, _ZStL8__ioinit@GOTOFF[ebx]
	push	esi
	.cfi_def_cfa_offset 32
	call	_ZNSt8ios_base4InitC1Ev@PLT
	add	esp, 12
	.cfi_def_cfa_offset 20
	lea	eax, __dso_handle@GOTOFF[ebx]
	push	eax
	.cfi_def_cfa_offset 24
	push	esi
	.cfi_def_cfa_offset 28
	push	DWORD PTR _ZNSt8ios_base4InitD1Ev@GOT[ebx]
	.cfi_def_cfa_offset 32
	call	__cxa_atexit@PLT
	add	esp, 20
	.cfi_def_cfa_offset 12
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE2134:
	.size	_GLOBAL__sub_I__Z18popcnt_shift_v2_u8h, .-_GLOBAL__sub_I__Z18popcnt_shift_v2_u8h
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I__Z18popcnt_shift_v2_u8h
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	4
	.long	8
	.long	12
	.long	16
	.long	20
	.long	24
	.long	28
	.align 32
.LC1:
	.long	32
	.long	32
	.long	32
	.long	32
	.long	32
	.long	32
	.long	32
	.long	32
	.align 32
.LC2:
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.align 32
.LC3:
	.long	858993459
	.long	858993459
	.long	858993459
	.long	858993459
	.long	858993459
	.long	858993459
	.long	858993459
	.long	858993459
	.align 32
.LC4:
	.long	252645135
	.long	252645135
	.long	252645135
	.long	252645135
	.long	252645135
	.long	252645135
	.long	252645135
	.long	252645135
	.align 32
.LC5:
	.long	127
	.long	127
	.long	127
	.long	127
	.long	127
	.long	127
	.long	127
	.long	127
	.align 32
.LC6:
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.align 16
.LC8:
	.long	858993459
	.long	858993459
	.long	858993459
	.long	858993459
	.align 16
.LC9:
	.long	252645135
	.long	252645135
	.long	252645135
	.long	252645135
	.align 16
.LC10:
	.long	127
	.long	127
	.long	127
	.long	127
	.align 16
.LC11:
	.long	4
	.long	8
	.long	12
	.long	16
	.section	.rodata.cst32
	.align 32
.LC12:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.align 32
.LC13:
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.align 32
.LC14:
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.align 32
.LC15:
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.section	.rodata.cst16
	.align 16
.LC16:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.align 16
.LC17:
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.align 16
.LC18:
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.align 16
.LC19:
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB2135:
	.cfi_startproc
	mov	ebx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE2135:
	.section	.text.__x86.get_pc_thunk.di,"axG",@progbits,__x86.get_pc_thunk.di,comdat
	.globl	__x86.get_pc_thunk.di
	.hidden	__x86.get_pc_thunk.di
	.type	__x86.get_pc_thunk.di, @function
__x86.get_pc_thunk.di:
.LFB2136:
	.cfi_startproc
	mov	edi, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE2136:
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 4
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 4
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 4
4:
