	.file	"a.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	_Z9maxpars_cPhS_S_j
	.type	_Z9maxpars_cPhS_S_j, @function
_Z9maxpars_cPhS_S_j:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	push	edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	call	__x86.get_pc_thunk.di
	add	edi, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	sub	esp, 28
	.cfi_def_cfa_offset 48
	mov	ecx, DWORD PTR 60[esp]
	mov	edx, DWORD PTR 48[esp]
	mov	eax, DWORD PTR 56[esp]
	test	ecx, ecx
	je	.L25
	lea	ebx, 16[edx]
	lea	esi, 16[eax]
	mov	ebp, DWORD PTR 60[esp]
	cmp	eax, ebx
	setnb	cl
	cmp	edx, esi
	setnb	bl
	or	ebx, ecx
	lea	ecx, -1[ebp]
	cmp	ecx, 14
	seta	cl
	test	bl, cl
	je	.L26
	mov	ebp, DWORD PTR 52[esp]
	lea	ebx, 16[ebp]
	cmp	eax, ebx
	setnb	bl
	cmp	ebp, esi
	setnb	cl
	or	cl, bl
	je	.L26
	mov	esi, DWORD PTR 60[esp]
	xor	ebp, ebp
	pxor	xmm1, xmm1
	pxor	xmm3, xmm3
	movdqa	xmm2, XMMWORD PTR .LC0@GOTOFF[edi]
	and	esi, -16
	test	esi, 16
	jne	.L85
	mov	edi, DWORD PTR 52[esp]
	.p2align 4,,10
	.p2align 3
.L5:
	movdqu	xmm6, XMMWORD PTR [edi+ebp]
	movdqu	xmm4, XMMWORD PTR [edx+ebp]
	pand	xmm4, xmm6
	movdqa	xmm7, xmm4
	movups	XMMWORD PTR [eax+ebp], xmm4
	movdqu	xmm5, XMMWORD PTR [edi+ebp]
	movdqu	xmm6, XMMWORD PTR [edx+ebp]
	pcmpeqb	xmm7, xmm3
	por	xmm6, xmm5
	movdqa	xmm0, xmm7
	pand	xmm7, xmm2
	pblendvb	xmm4, xmm6, xmm0
	movups	XMMWORD PTR [eax+ebp], xmm4
	pmovzxbw	xmm4, xmm7
	psrldq	xmm7, 8
	pmovzxbw	xmm6, xmm7
	pmovzxwd	xmm0, xmm4
	pmovzxwd	xmm7, xmm6
	psrldq	xmm4, 8
	psrldq	xmm6, 8
	pmovzxwd	xmm4, xmm4
	pmovzxwd	xmm5, xmm6
	paddd	xmm4, xmm0
	movdqu	xmm6, XMMWORD PTR 16[edi+ebp]
	paddd	xmm5, xmm7
	paddd	xmm4, xmm5
	paddd	xmm1, xmm4
	movdqu	xmm4, XMMWORD PTR 16[edx+ebp]
	pand	xmm4, xmm6
	movdqa	xmm0, xmm4
	movups	XMMWORD PTR 16[eax+ebp], xmm4
	movdqu	xmm5, XMMWORD PTR 16[edi+ebp]
	movdqu	xmm7, XMMWORD PTR 16[edx+ebp]
	pcmpeqb	xmm0, xmm3
	por	xmm7, xmm5
	pblendvb	xmm4, xmm7, xmm0
	pand	xmm0, xmm2
	movups	XMMWORD PTR 16[eax+ebp], xmm4
	pmovzxbw	xmm4, xmm0
	psrldq	xmm0, 8
	add	ebp, 32
	pmovzxbw	xmm6, xmm0
	pmovzxwd	xmm5, xmm4
	pmovzxwd	xmm7, xmm6
	psrldq	xmm4, 8
	psrldq	xmm6, 8
	pmovzxwd	xmm4, xmm4
	pmovzxwd	xmm0, xmm6
	paddd	xmm4, xmm5
	paddd	xmm0, xmm7
	paddd	xmm0, xmm4
	paddd	xmm1, xmm0
	cmp	ebp, esi
	jne	.L5
	mov	DWORD PTR 52[esp], edi
.L4:
	movdqa	xmm2, xmm1
	mov	esi, DWORD PTR 60[esp]
	psrldq	xmm2, 8
	paddd	xmm1, xmm2
	and	esi, -16
	movdqa	xmm3, xmm1
	mov	DWORD PTR 8[esp], esi
	psrldq	xmm3, 4
	paddd	xmm1, xmm3
	movd	ecx, xmm1
	movd	DWORD PTR 12[esp], xmm1
	cmp	DWORD PTR 60[esp], esi
	je	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	ebp, [edx+esi]
	movzx	ebx, BYTE PTR 0[ebp]
	add	edi, esi
	add	esi, eax
	and	bl, BYTE PTR [edi]
	mov	BYTE PTR [esi], bl
	jne	.L7
	movzx	ebx, BYTE PTR 0[ebp]
	add	ecx, 1
	or	bl, BYTE PTR [edi]
	mov	BYTE PTR [esi], bl
	mov	DWORD PTR 12[esp], ecx
.L7:
	mov	ecx, DWORD PTR 8[esp]
	lea	ebx, 1[ecx]
	cmp	ebx, DWORD PTR 60[esp]
	jnb	.L1
	mov	esi, DWORD PTR 52[esp]
	lea	edi, [edx+ebx]
	add	esi, ebx
	add	ebx, eax
	movzx	ecx, BYTE PTR [esi]
	and	cl, BYTE PTR [edi]
	mov	BYTE PTR [ebx], cl
	jne	.L8
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
.L8:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebx, 2[ebx]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	add	edi, ebx
	add	ebx, eax
	movzx	ecx, BYTE PTR [edi]
	and	cl, BYTE PTR [esi]
	mov	BYTE PTR [ebx], cl
	jne	.L9
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
.L9:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebx, 3[ebx]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	movzx	ecx, BYTE PTR [esi]
	add	edi, ebx
	add	ebx, eax
	and	cl, BYTE PTR [edi]
	mov	BYTE PTR [ebx], cl
	jne	.L10
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
.L10:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebx, 4[ebx]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	movzx	ecx, BYTE PTR [esi]
	add	edi, ebx
	add	ebx, eax
	and	cl, BYTE PTR [edi]
	mov	BYTE PTR [ebx], cl
	jne	.L11
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
.L11:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebx, 5[ebx]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	movzx	ecx, BYTE PTR [esi]
	add	edi, ebx
	add	ebx, eax
	and	cl, BYTE PTR [edi]
	mov	BYTE PTR [ebx], cl
	je	.L93
.L12:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebx, 6[ebx]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	movzx	ecx, BYTE PTR [esi]
	add	edi, ebx
	add	ebx, eax
	and	cl, BYTE PTR [edi]
	mov	BYTE PTR [ebx], cl
	je	.L94
.L13:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebx, 7[ebx]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	movzx	ecx, BYTE PTR [esi]
	add	edi, ebx
	add	ebx, eax
	and	cl, BYTE PTR [edi]
	mov	BYTE PTR [ebx], cl
	je	.L95
.L14:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebx, 8[ebx]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	movzx	ecx, BYTE PTR [esi]
	add	edi, ebx
	add	ebx, eax
	and	cl, BYTE PTR [edi]
	mov	BYTE PTR [ebx], cl
	je	.L96
.L15:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebx, 9[ebx]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	movzx	ecx, BYTE PTR [esi]
	add	edi, ebx
	add	ebx, eax
	and	cl, BYTE PTR [edi]
	mov	BYTE PTR [ebx], cl
	je	.L97
.L16:
	mov	ebx, DWORD PTR 8[esp]
	lea	ebp, 10[ebx]
	cmp	DWORD PTR 60[esp], ebp
	jbe	.L1
	mov	esi, DWORD PTR 52[esp]
	lea	edi, [edx+ebp]
	lea	ecx, [eax+ebp]
	movzx	ebx, BYTE PTR [edi]
	add	esi, ebp
	and	bl, BYTE PTR [esi]
	mov	BYTE PTR [ecx], bl
	jne	.L17
	movzx	ebx, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	bl, BYTE PTR [esi]
	mov	BYTE PTR [ecx], bl
.L17:
	mov	ebp, DWORD PTR 8[esp]
	lea	ecx, 11[ebp]
	cmp	DWORD PTR 60[esp], ecx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ecx]
	lea	ebp, [eax+ecx]
	movzx	ebx, BYTE PTR [esi]
	add	edi, ecx
	and	bl, BYTE PTR [edi]
	mov	BYTE PTR 0[ebp], bl
	jne	.L18
	movzx	ecx, BYTE PTR [esi]
	add	DWORD PTR 12[esp], 1
	or	cl, BYTE PTR [edi]
	mov	BYTE PTR 0[ebp], cl
.L18:
	mov	esi, DWORD PTR 8[esp]
	lea	ebp, 12[esi]
	cmp	DWORD PTR 60[esp], ebp
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	ecx, [edx+ebp]
	lea	esi, [eax+ebp]
	movzx	ebx, BYTE PTR [ecx]
	add	edi, ebp
	and	bl, BYTE PTR [edi]
	mov	BYTE PTR [esi], bl
	jne	.L19
	movzx	ecx, BYTE PTR [ecx]
	add	DWORD PTR 12[esp], 1
	or	cl, BYTE PTR [edi]
	mov	BYTE PTR [esi], cl
.L19:
	mov	ebp, DWORD PTR 8[esp]
	lea	ebx, 13[ebp]
	cmp	DWORD PTR 60[esp], ebx
	jbe	.L1
	mov	edi, DWORD PTR 52[esp]
	lea	esi, [edx+ebx]
	lea	ecx, [eax+ebx]
	add	edi, ebx
	movzx	ebx, BYTE PTR [esi]
	and	bl, BYTE PTR [edi]
	mov	BYTE PTR [ecx], bl
	jne	.L20
	movzx	ebx, BYTE PTR [esi]
	add	DWORD PTR 12[esp], 1
	or	bl, BYTE PTR [edi]
	mov	BYTE PTR [ecx], bl
.L20:
	mov	ebp, DWORD PTR 8[esp]
	add	ebp, 14
	cmp	DWORD PTR 60[esp], ebp
	jbe	.L1
	mov	esi, DWORD PTR 52[esp]
	add	edx, ebp
	add	esi, ebp
	add	ebp, eax
	movzx	eax, BYTE PTR [edx]
	and	al, BYTE PTR [esi]
	mov	BYTE PTR 0[ebp], al
	jne	.L1
	movzx	edx, BYTE PTR [edx]
	add	DWORD PTR 12[esp], 1
	or	dl, BYTE PTR [esi]
	mov	BYTE PTR 0[ebp], dl
.L1:
	mov	eax, DWORD PTR 12[esp]
	add	esp, 28
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
	mov	ecx, DWORD PTR 52[esp]
	movdqu	xmm1, XMMWORD PTR [edx]
	mov	ebp, 16
	movdqu	xmm7, XMMWORD PTR [ecx]
	mov	edi, ecx
	pand	xmm1, xmm7
	movups	XMMWORD PTR [eax], xmm1
	movdqu	xmm0, XMMWORD PTR [ecx]
	movdqu	xmm4, XMMWORD PTR [edx]
	por	xmm4, xmm0
	movdqa	xmm0, xmm1
	pcmpeqb	xmm0, xmm3
	pblendvb	xmm1, xmm4, xmm0
	pand	xmm0, xmm2
	pmovzxbw	xmm6, xmm0
	psrldq	xmm0, 8
	movups	XMMWORD PTR [eax], xmm1
	pmovzxbw	xmm5, xmm0
	pmovzxwd	xmm0, xmm6
	pmovzxwd	xmm1, xmm5
	psrldq	xmm6, 8
	psrldq	xmm5, 8
	pmovzxwd	xmm4, xmm6
	pmovzxwd	xmm7, xmm5
	paddd	xmm4, xmm0
	paddd	xmm1, xmm7
	paddd	xmm1, xmm4
	cmp	ebp, esi
	jne	.L5
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L93:
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L94:
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L95:
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L96:
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L97:
	movzx	ecx, BYTE PTR [esi]
	movzx	ebp, BYTE PTR [edi]
	add	DWORD PTR 12[esp], 1
	or	ecx, ebp
	mov	BYTE PTR [ebx], cl
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L26:
	mov	edi, DWORD PTR 60[esp]
	xor	ebx, ebx
	mov	DWORD PTR 12[esp], 0
	and	edi, 7
	je	.L88
	cmp	edi, 1
	je	.L69
	cmp	edi, 2
	je	.L70
	cmp	edi, 3
	je	.L71
	cmp	edi, 4
	je	.L72
	cmp	edi, 5
	je	.L73
	cmp	edi, 6
	je	.L74
	mov	ebp, DWORD PTR 52[esp]
	movzx	ecx, BYTE PTR [edx]
	and	cl, BYTE PTR 0[ebp]
	mov	BYTE PTR [eax], cl
	jne	.L32
	movzx	ebx, BYTE PTR [edx]
	or	bl, BYTE PTR 0[ebp]
	mov	DWORD PTR 12[esp], 1
	mov	BYTE PTR [eax], bl
.L32:
	mov	ebx, 1
.L74:
	mov	edi, DWORD PTR 52[esp]
	movzx	ecx, BYTE PTR [edx+ebx]
	and	cl, BYTE PTR [edi+ebx]
	mov	BYTE PTR [eax+ebx], cl
	jne	.L34
	mov	ebp, DWORD PTR 52[esp]
	movzx	ecx, BYTE PTR [edx+ebx]
	add	DWORD PTR 12[esp], 1
	or	cl, BYTE PTR 0[ebp+ebx]
	mov	BYTE PTR [eax+ebx], cl
.L34:
	add	ebx, 1
.L73:
	mov	esi, DWORD PTR 52[esp]
	movzx	ecx, BYTE PTR [edx+ebx]
	and	cl, BYTE PTR [esi+ebx]
	mov	BYTE PTR [eax+ebx], cl
	je	.L98
.L36:
	add	ebx, 1
.L72:
	mov	edi, DWORD PTR 52[esp]
	movzx	ecx, BYTE PTR [edx+ebx]
	and	cl, BYTE PTR [edi+ebx]
	mov	BYTE PTR [eax+ebx], cl
	je	.L99
.L38:
	add	ebx, 1
.L71:
	mov	ebp, DWORD PTR 52[esp]
	movzx	ecx, BYTE PTR [edx+ebx]
	and	cl, BYTE PTR 0[ebp+ebx]
	mov	BYTE PTR [eax+ebx], cl
	jne	.L40
	movzx	ecx, BYTE PTR [edx+ebx]
	add	DWORD PTR 12[esp], 1
	or	cl, BYTE PTR 0[ebp+ebx]
	mov	BYTE PTR [eax+ebx], cl
.L40:
	add	ebx, 1
.L70:
	mov	esi, DWORD PTR 52[esp]
	movzx	ecx, BYTE PTR [edx+ebx]
	and	cl, BYTE PTR [esi+ebx]
	mov	BYTE PTR [eax+ebx], cl
	jne	.L42
	movzx	ecx, BYTE PTR [edx+ebx]
	add	DWORD PTR 12[esp], 1
	or	cl, BYTE PTR [esi+ebx]
	mov	BYTE PTR [eax+ebx], cl
.L42:
	add	ebx, 1
.L69:
	mov	ebp, DWORD PTR 52[esp]
	movzx	ecx, BYTE PTR [edx+ebx]
	and	cl, BYTE PTR 0[ebp+ebx]
	mov	BYTE PTR [eax+ebx], cl
	jne	.L44
	movzx	ecx, BYTE PTR [edx+ebx]
	add	DWORD PTR 12[esp], 1
	or	cl, BYTE PTR 0[ebp+ebx]
	mov	BYTE PTR [eax+ebx], cl
.L44:
	add	ebx, 1
	cmp	DWORD PTR 60[esp], ebx
	je	.L1
	mov	esi, DWORD PTR 12[esp]
	mov	ecx, DWORD PTR 52[esp]
	mov	DWORD PTR 56[esp], eax
.L3:
	mov	edi, DWORD PTR 56[esp]
	movzx	eax, BYTE PTR [edx+ebx]
	and	al, BYTE PTR [ecx+ebx]
	mov	BYTE PTR [edi+ebx], al
	jne	.L23
	movzx	eax, BYTE PTR [edx+ebx]
	or	al, BYTE PTR [ecx+ebx]
	add	esi, 1
	mov	BYTE PTR [edi+ebx], al
.L23:
	mov	ebp, DWORD PTR 56[esp]
	movzx	eax, BYTE PTR 1[edx+ebx]
	lea	edi, 1[ebx]
	and	al, BYTE PTR 1[ecx+ebx]
	mov	BYTE PTR 1[ebp+ebx], al
	jne	.L46
	mov	ebp, DWORD PTR 56[esp]
	movzx	eax, BYTE PTR 1[edx+ebx]
	add	esi, 1
	or	al, BYTE PTR 1[ecx+ebx]
	mov	BYTE PTR 1[ebp+ebx], al
.L46:
	mov	eax, DWORD PTR 56[esp]
	movzx	ebx, BYTE PTR 1[edx+edi]
	and	bl, BYTE PTR 1[ecx+edi]
	mov	BYTE PTR 1[eax+edi], bl
	jne	.L47
	movzx	ebx, BYTE PTR 1[edx+edi]
	or	bl, BYTE PTR 1[ecx+edi]
	add	esi, 1
	mov	BYTE PTR 1[eax+edi], bl
.L47:
	mov	ebp, DWORD PTR 56[esp]
	movzx	ebx, BYTE PTR 2[edx+edi]
	and	bl, BYTE PTR 2[ecx+edi]
	mov	BYTE PTR 2[ebp+edi], bl
	jne	.L48
	movzx	eax, BYTE PTR 2[edx+edi]
	or	al, BYTE PTR 2[ecx+edi]
	add	esi, 1
	mov	BYTE PTR 2[ebp+edi], al
.L48:
	mov	ebp, DWORD PTR 56[esp]
	movzx	ebx, BYTE PTR 3[edx+edi]
	and	bl, BYTE PTR 3[ecx+edi]
	mov	BYTE PTR 3[ebp+edi], bl
	jne	.L49
	movzx	eax, BYTE PTR 3[edx+edi]
	or	al, BYTE PTR 3[ecx+edi]
	add	esi, 1
	mov	BYTE PTR 3[ebp+edi], al
.L49:
	mov	ebp, DWORD PTR 56[esp]
	movzx	ebx, BYTE PTR 4[edx+edi]
	and	bl, BYTE PTR 4[ecx+edi]
	mov	BYTE PTR 4[ebp+edi], bl
	jne	.L50
	movzx	eax, BYTE PTR 4[edx+edi]
	or	al, BYTE PTR 4[ecx+edi]
	add	esi, 1
	mov	BYTE PTR 4[ebp+edi], al
.L50:
	mov	ebp, DWORD PTR 56[esp]
	movzx	ebx, BYTE PTR 5[edx+edi]
	and	bl, BYTE PTR 5[ecx+edi]
	mov	BYTE PTR 5[ebp+edi], bl
	jne	.L51
	movzx	eax, BYTE PTR 5[edx+edi]
	or	al, BYTE PTR 5[ecx+edi]
	add	esi, 1
	mov	BYTE PTR 5[ebp+edi], al
.L51:
	mov	ebp, DWORD PTR 56[esp]
	movzx	ebx, BYTE PTR 6[edx+edi]
	and	bl, BYTE PTR 6[ecx+edi]
	mov	BYTE PTR 6[ebp+edi], bl
	jne	.L52
	movzx	eax, BYTE PTR 6[edx+edi]
	or	al, BYTE PTR 6[ecx+edi]
	add	esi, 1
	mov	BYTE PTR 6[ebp+edi], al
.L52:
	lea	ebx, 7[edi]
	cmp	DWORD PTR 60[esp], ebx
	jne	.L3
	mov	DWORD PTR 12[esp], esi
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L25:
	mov	DWORD PTR 12[esp], 0
	mov	eax, DWORD PTR 12[esp]
	add	esp, 28
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L99:
	.cfi_restore_state
	movzx	ecx, BYTE PTR [edx+ebx]
	or	cl, BYTE PTR [edi+ebx]
	mov	BYTE PTR [eax+ebx], cl
	add	DWORD PTR 12[esp], 1
	jmp	.L38
.L98:
	movzx	ecx, BYTE PTR [edx+ebx]
	or	cl, BYTE PTR [esi+ebx]
	mov	BYTE PTR [eax+ebx], cl
	add	DWORD PTR 12[esp], 1
	jmp	.L36
.L88:
	xor	esi, esi
	mov	ecx, DWORD PTR 52[esp]
	mov	DWORD PTR 56[esp], eax
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	_Z9maxpars_cPhS_S_j, .-_Z9maxpars_cPhS_S_j
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
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
	.section	.text.__x86.get_pc_thunk.di,"axG",@progbits,__x86.get_pc_thunk.di,comdat
	.globl	__x86.get_pc_thunk.di
	.hidden	__x86.get_pc_thunk.di
	.type	__x86.get_pc_thunk.di, @function
__x86.get_pc_thunk.di:
.LFB1:
	.cfi_startproc
	mov	edi, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE1:
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
