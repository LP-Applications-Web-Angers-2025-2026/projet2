	.file	"a.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	_Z11lower_qwordDv2_x
	.type	_Z11lower_qwordDv2_x, @function
_Z11lower_qwordDv2_x:
.LFB515:
	.cfi_startproc
	movd	edx, xmm0
	pextrd	eax, xmm0, 1
	add	eax, edx
	ret
	.cfi_endproc
.LFE515:
	.size	_Z11lower_qwordDv2_x, .-_Z11lower_qwordDv2_x
	.p2align 4,,15
	.globl	_Z12higher_qwordDv2_x
	.type	_Z12higher_qwordDv2_x, @function
_Z12higher_qwordDv2_x:
.LFB516:
	.cfi_startproc
	punpckhqdq	xmm0, xmm0
	movd	edx, xmm0
	pextrd	eax, xmm0, 1
	add	eax, edx
	ret
	.cfi_endproc
.LFE516:
	.size	_Z12higher_qwordDv2_x, .-_Z12higher_qwordDv2_x
	.section	.rodata
	.align 4
.LC3:
	.string	""
	.string	"\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.text
	.p2align 4,,15
	.globl	_Z20u8_popcnt_intrinsicsPhj
	.type	_Z20u8_popcnt_intrinsicsPhj, @function
_Z20u8_popcnt_intrinsicsPhj:
.LFB517:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	push	edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	push	esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	call	__x86.get_pc_thunk.si
	add	esi, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	sub	esp, 76
	.cfi_def_cfa_offset 96
	mov	eax, DWORD PTR 100[esp]
	mov	ecx, DWORD PTR 96[esp]
	and	eax, -64
	je	.L9
	pxor	xmm5, xmm5
	movdqa	xmm7, XMMWORD PTR .LC1@GOTOFF[esi]
	movdqa	xmm6, XMMWORD PTR .LC2@GOTOFF[esi]
	xor	edx, edx
	movaps	XMMWORD PTR [esp], xmm5
	movdqa	xmm5, XMMWORD PTR .LC0@GOTOFF[esi]
	.p2align 4,,10
	.p2align 3
.L6:
	movdqu	xmm0, XMMWORD PTR [ecx+edx]
	movdqu	xmm4, XMMWORD PTR [ecx+edx]
	psrlw	xmm0, 1
	pand	xmm0, xmm5
	psubb	xmm4, xmm0
	movdqa	xmm0, xmm4
	movdqa	xmm1, xmm4
	pand	xmm0, xmm7
	psrlw	xmm1, 2
	movdqa	xmm4, xmm0
	movdqu	xmm0, XMMWORD PTR 16[ecx+edx]
	pand	xmm1, xmm7
	paddb	xmm4, xmm1
	movdqu	xmm1, XMMWORD PTR 16[ecx+edx]
	psrlw	xmm0, 1
	movdqa	xmm3, xmm4
	pand	xmm0, xmm5
	psrlw	xmm3, 4
	psubb	xmm1, xmm0
	movaps	XMMWORD PTR 16[esp], xmm3
	movdqu	xmm3, XMMWORD PTR 32[ecx+edx]
	movdqa	xmm0, xmm1
	pand	xmm1, xmm7
	psrlw	xmm0, 2
	pand	xmm0, xmm7
	paddb	xmm1, xmm0
	movdqu	xmm0, XMMWORD PTR 32[ecx+edx]
	movdqa	xmm2, xmm1
	psrlw	xmm0, 1
	psrlw	xmm2, 4
	pand	xmm0, xmm5
	movaps	XMMWORD PTR 32[esp], xmm2
	paddb	xmm1, XMMWORD PTR 32[esp]
	psubb	xmm3, xmm0
	movdqa	xmm2, xmm3
	movdqa	xmm0, xmm3
	pand	xmm1, xmm6
	psrlw	xmm2, 2
	pand	xmm0, xmm7
	pand	xmm2, xmm7
	paddb	xmm0, xmm2
	movdqu	xmm2, XMMWORD PTR 48[ecx+edx]
	movdqa	xmm3, xmm0
	psrlw	xmm3, 4
	psrlw	xmm2, 1
	movaps	XMMWORD PTR 48[esp], xmm3
	movdqu	xmm3, XMMWORD PTR 48[ecx+edx]
	pand	xmm2, xmm5
	paddb	xmm0, XMMWORD PTR 48[esp]
	add	edx, 64
	psubb	xmm3, xmm2
	pand	xmm0, xmm6
	movdqa	xmm2, xmm3
	pand	xmm3, xmm7
	psrlw	xmm2, 2
	pand	xmm2, xmm7
	paddb	xmm2, xmm3
	movdqa	xmm3, xmm2
	psrlw	xmm3, 4
	paddb	xmm2, xmm3
	pand	xmm2, xmm6
	paddb	xmm0, xmm2
	movdqa	xmm2, XMMWORD PTR 16[esp]
	paddb	xmm2, xmm4
	pxor	xmm4, xmm4
	pand	xmm2, xmm6
	paddb	xmm2, xmm1
	paddb	xmm0, xmm2
	psadbw	xmm0, xmm4
	paddq	xmm0, XMMWORD PTR [esp]
	movaps	XMMWORD PTR [esp], xmm0
	cmp	eax, edx
	ja	.L6
	movdqa	xmm0, XMMWORD PTR [esp]
.L5:
	movd	ebx, xmm0
	pextrd	edi, xmm0, 1
	movdqa	xmm0, XMMWORD PTR [esp]
	add	ebx, edi
	punpckhqdq	xmm0, xmm0
	movd	ebp, xmm0
	pextrd	eax, xmm0, 1
	add	ebp, ebx
	add	eax, ebp
	cmp	DWORD PTR 100[esp], edx
	jbe	.L4
	add	edx, ecx
	add	ecx, DWORD PTR 100[esp]
	.p2align 4,,10
	.p2align 3
.L8:
	movzx	ebx, BYTE PTR [edx]
	add	edx, 1
	movsx	ebx, BYTE PTR .LC3@GOTOFF[ebx+esi]
	add	eax, ebx
	cmp	ecx, edx
	jne	.L8
.L4:
	add	esp, 76
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
.L9:
	.cfi_restore_state
	pxor	xmm6, xmm6
	xor	edx, edx
	pxor	xmm0, xmm0
	movaps	XMMWORD PTR [esp], xmm6
	jmp	.L5
	.cfi_endproc
.LFE517:
	.size	_Z20u8_popcnt_intrinsicsPhj, .-_Z20u8_popcnt_intrinsicsPhj
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.align 16
.LC1:
	.long	858993459
	.long	858993459
	.long	858993459
	.long	858993459
	.align 16
.LC2:
	.long	252645135
	.long	252645135
	.long	252645135
	.long	252645135
	.section	.text.__x86.get_pc_thunk.si,"axG",@progbits,__x86.get_pc_thunk.si,comdat
	.globl	__x86.get_pc_thunk.si
	.hidden	__x86.get_pc_thunk.si
	.type	__x86.get_pc_thunk.si, @function
__x86.get_pc_thunk.si:
.LFB518:
	.cfi_startproc
	mov	esi, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE518:
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
