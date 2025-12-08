	.file	"a.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	_Z9mp_inv_jkPfS_S_j
	.type	_Z9mp_inv_jkPfS_S_j, @function
_Z9mp_inv_jkPfS_S_j:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	and	esp, -32
	sub	esp, 64
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	mov	eax, DWORD PTR 20[ebp]
	test	eax, eax
	je	.L22
	mov	eax, DWORD PTR 20[ebp]
	mov	ebx, DWORD PTR 8[ebp]
	mov	DWORD PTR 12[esp], 0
	mov	edi, DWORD PTR 16[ebp]
	sal	eax, 2
	add	ebx, eax
	mov	DWORD PTR 44[esp], eax
	mov	DWORD PTR 48[esp], ebx
	lea	ebx, [edi+eax]
	neg	eax
	mov	DWORD PTR 4[esp], eax
	mov	eax, DWORD PTR 20[ebp]
	mov	DWORD PTR 40[esp], ebx
	lea	ebx, 32[edi]
	shr	eax, 3
	mov	DWORD PTR 36[esp], ebx
	mov	DWORD PTR 16[esp], eax
	mov	eax, DWORD PTR 20[ebp]
	and	eax, -8
	mov	DWORD PTR 32[esp], eax
	sal	eax, 2
	mov	DWORD PTR 28[esp], eax
	mov	eax, DWORD PTR 20[ebp]
	sub	eax, 1
	mov	DWORD PTR 24[esp], eax
	.p2align 4,,10
	.p2align 3
.L8:
	mov	ecx, DWORD PTR 32[esp]
	mov	eax, DWORD PTR 12[ebp]
	mov	esi, DWORD PTR 48[esp]
	add	esi, DWORD PTR 4[esp]
	add	ecx, 1
	mov	ebx, DWORD PTR 28[esp]
	mov	DWORD PTR 8[esp], esi
	mov	DWORD PTR 20[esp], ecx
	mov	DWORD PTR 60[esp], eax
	add	ebx, edi
	.p2align 4,,10
	.p2align 3
.L7:
	lea	ecx, 4[esi]
	mov	eax, ecx
	mov	DWORD PTR 56[esp], ecx
	mov	ecx, DWORD PTR 60[esp]
	mov	edx, ecx
	add	edx, 32
	cmp	edi, edx
	mov	edx, ecx
	mov	ecx, DWORD PTR 36[esp]
	setnb	BYTE PTR 52[esp]
	cmp	edx, ecx
	movzx	ecx, BYTE PTR 52[esp]
	setnb	dl
	or	ecx, edx
	cmp	esi, DWORD PTR 40[esp]
	setnb	dl
	cmp	edi, eax
	setnb	al
	or	edx, eax
	test	cl, dl
	je	.L9
	cmp	DWORD PTR 24[esp], 6
	jbe	.L9
	mov	DWORD PTR 52[esp], ebx
	vbroadcastss	ymm2, DWORD PTR [esi]
	xor	edx, edx
	xor	ecx, ecx
	mov	ebx, DWORD PTR 16[esp]
	mov	eax, DWORD PTR 60[esp]
	.p2align 4,,10
	.p2align 3
.L4:
	vmovups	xmm3, XMMWORD PTR [eax+edx]
	vinsertf128	ymm0, ymm3, XMMWORD PTR 16[eax+edx], 0x1
	add	ecx, 1
	vmovups	xmm4, XMMWORD PTR [edi+edx]
	vinsertf128	ymm1, ymm4, XMMWORD PTR 16[edi+edx], 0x1
	vmulps	ymm0, ymm0, ymm2
	vaddps	ymm0, ymm0, ymm1
	vmovups	XMMWORD PTR [edi+edx], xmm0
	vextractf128	XMMWORD PTR 16[edi+edx], ymm0, 0x1
	add	edx, 32
	cmp	ebx, ecx
	jne	.L4
	mov	ecx, DWORD PTR 28[esp]
	mov	ebx, DWORD PTR 52[esp]
	mov	DWORD PTR 60[esp], eax
	lea	edx, [eax+ecx]
	mov	ecx, DWORD PTR 32[esp]
	cmp	DWORD PTR 20[ebp], ecx
	je	.L6
	fld	DWORD PTR [esi]
	fmul	DWORD PTR [edx]
	fadd	DWORD PTR [ebx]
	mov	eax, DWORD PTR 20[esp]
	fstp	DWORD PTR [ebx]
	cmp	DWORD PTR 20[ebp], eax
	jbe	.L6
	fld	DWORD PTR 4[edx]
	fmul	DWORD PTR [esi]
	mov	eax, ecx
	add	ecx, 2
	fadd	DWORD PTR 4[ebx]
	fstp	DWORD PTR 4[ebx]
	cmp	DWORD PTR 20[ebp], ecx
	jbe	.L6
	fld	DWORD PTR [esi]
	fmul	DWORD PTR 8[edx]
	mov	ecx, eax
	fadd	DWORD PTR 8[ebx]
	add	ecx, 3
	fstp	DWORD PTR 8[ebx]
	cmp	DWORD PTR 20[ebp], ecx
	jbe	.L6
	fld	DWORD PTR [esi]
	fmul	DWORD PTR 12[edx]
	mov	ecx, eax
	fadd	DWORD PTR 12[ebx]
	add	ecx, 4
	fstp	DWORD PTR 12[ebx]
	cmp	DWORD PTR 20[ebp], ecx
	jbe	.L6
	fld	DWORD PTR [esi]
	fmul	DWORD PTR 16[edx]
	mov	ecx, eax
	fadd	DWORD PTR 16[ebx]
	add	ecx, 5
	fstp	DWORD PTR 16[ebx]
	cmp	DWORD PTR 20[ebp], ecx
	jbe	.L6
	fld	DWORD PTR [esi]
	fmul	DWORD PTR 20[edx]
	mov	ecx, eax
	fadd	DWORD PTR 20[ebx]
	add	ecx, 6
	fstp	DWORD PTR 20[ebx]
	cmp	DWORD PTR 20[ebp], ecx
	jbe	.L6
	fld	DWORD PTR [esi]
	fmul	DWORD PTR 24[edx]
	fadd	DWORD PTR 24[ebx]
	fstp	DWORD PTR 24[ebx]
.L6:
	mov	esi, DWORD PTR 44[esp]
	add	DWORD PTR 60[esp], esi
	mov	esi, DWORD PTR 56[esp]
	cmp	esi, DWORD PTR 48[esp]
	jne	.L7
	mov	ebx, DWORD PTR 8[esp]
	mov	esi, DWORD PTR 20[ebp]
	add	DWORD PTR 12[esp], 1
	mov	eax, DWORD PTR 12[esp]
	lea	ebx, [ebx+esi*8]
	mov	DWORD PTR 48[esp], ebx
	mov	ebx, DWORD PTR 44[esp]
	add	DWORD PTR 40[esp], ebx
	add	edi, ebx
	add	DWORD PTR 36[esp], ebx
	cmp	esi, eax
	jne	.L8
	vzeroupper
.L22:
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
	mov	eax, DWORD PTR 60[esp]
	mov	ecx, DWORD PTR 20[ebp]
	xor	edx, edx
	.p2align 4,,10
	.p2align 3
.L3:
	fld	DWORD PTR [eax+edx*4]
	fmul	DWORD PTR [esi]
	fadd	DWORD PTR [edi+edx*4]
	fstp	DWORD PTR [edi+edx*4]
	add	edx, 1
	cmp	ecx, edx
	jne	.L3
	mov	DWORD PTR 60[esp], eax
	jmp	.L6
	.cfi_endproc
.LFE0:
	.size	_Z9mp_inv_jkPfS_S_j, .-_Z9mp_inv_jkPfS_S_j
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
