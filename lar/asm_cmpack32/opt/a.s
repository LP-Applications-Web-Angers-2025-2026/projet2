	.file	"a.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	_Z16cmpack_referencePhS_j
	.type	_Z16cmpack_referencePhS_j, @function
_Z16cmpack_referencePhS_j:
.LFB0:
	.cfi_startproc
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	and	esp, -32
	sub	esp, 32
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	mov	ebx, DWORD PTR 16[ebp]
	mov	esi, DWORD PTR 12[ebp]
	mov	DWORD PTR 28[esp], eax
	test	ebx, ebx
	je	.L9
	mov	eax, DWORD PTR 8[ebp]
	add	eax, 32
	cmp	esi, eax
	lea	eax, 32[esi]
	setnb	dl
	cmp	DWORD PTR 8[ebp], eax
	setnb	al
	or	eax, edx
	lea	edx, -1[ebx]
	cmp	edx, 30
	seta	dl
	test	al, dl
	je	.L21
	mov	edi, DWORD PTR 28[esp]
	lea	eax, [esi+ebx]
	mov	edi, DWORD PTR threshold@GOT[edi]
	cmp	eax, edi
	lea	eax, 1[edi]
	setbe	dl
	cmp	esi, eax
	setnb	al
	or	dl, al
	je	.L10
	mov	eax, DWORD PTR 8[ebp]
	mov	ecx, ebx
	vpbroadcastb	ymm5, BYTE PTR [edi]
	mov	edx, esi
	and	ecx, -32
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	mov	DWORD PTR 24[esp], eax
	add	ecx, eax
	mov	eax, DWORD PTR 28[esp]
	vmovdqa	ymm4, YMMWORD PTR .LC0@GOTOFF[eax]
	mov	eax, DWORD PTR 24[esp]
	.p2align 4,,10
	.p2align 3
.L5:
	vmovdqu	xmm7, XMMWORD PTR [eax]
	vinserti128	ymm0, ymm7, XMMWORD PTR 16[eax], 0x1
	add	eax, 32
	add	edx, 32
	vpsubusb	ymm0, ymm0, ymm5
	vpcmpeqb	ymm0, ymm0, ymm3
	vpandn	ymm0, ymm0, ymm4
	vpmovzxbw	ymm1, xmm0
	vmovups	XMMWORD PTR -32[edx], xmm0
	vextracti128	XMMWORD PTR -16[edx], ymm0, 0x1
	vextracti128	xmm0, ymm0, 0x1
	vpmovzxbw	ymm0, xmm0
	vpmovzxwd	ymm6, xmm0
	vextracti128	xmm0, ymm0, 0x1
	vpmovzxwd	ymm0, xmm0
	vpaddd	ymm0, ymm6, ymm0
	vpmovzxwd	ymm6, xmm1
	vextracti128	xmm1, ymm1, 0x1
	vpmovzxwd	ymm1, xmm1
	vpaddd	ymm1, ymm6, ymm1
	vpaddd	ymm0, ymm0, ymm1
	vpaddd	ymm2, ymm2, ymm0
	cmp	ecx, eax
	jne	.L5
	vmovdqa	xmm0, xmm2
	vextracti128	xmm2, ymm2, 1
	mov	edx, ebx
	vpaddd	xmm2, xmm0, xmm2
	and	edx, -32
	vpsrldq	xmm0, xmm2, 8
	vpaddd	xmm2, xmm2, xmm0
	vpsrldq	xmm0, xmm2, 4
	vpaddd	xmm2, xmm2, xmm0
	vmovd	eax, xmm2
	cmp	ebx, edx
	je	.L17
	mov	DWORD PTR 16[ebp], ebx
	.p2align 4,,10
	.p2align 3
.L7:
	mov	ebx, DWORD PTR 8[ebp]
	movzx	ecx, BYTE PTR [edi]
	cmp	BYTE PTR [ebx+edx], cl
	seta	cl
	mov	BYTE PTR [esi+edx], cl
	movzx	ecx, cl
	add	edx, 1
	add	eax, ecx
	cmp	DWORD PTR 16[ebp], edx
	ja	.L7
.L17:
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
.L21:
	.cfi_restore_state
	mov	eax, DWORD PTR 28[esp]
	mov	edi, DWORD PTR threshold@GOT[eax]
.L10:
	mov	DWORD PTR 16[ebp], ebx
	xor	edx, edx
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L3:
	mov	ebx, DWORD PTR 8[ebp]
	movzx	ecx, BYTE PTR [edi]
	cmp	BYTE PTR [ebx+edx], cl
	seta	cl
	mov	BYTE PTR [esi+edx], cl
	movzx	ecx, cl
	add	edx, 1
	add	eax, ecx
	cmp	DWORD PTR 16[ebp], edx
	jne	.L3
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
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	lea	esp, -12[ebp]
	xor	eax, eax
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_Z16cmpack_referencePhS_j, .-_Z16cmpack_referencePhS_j
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB1:
	.cfi_startproc
	mov	eax, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE1:
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
