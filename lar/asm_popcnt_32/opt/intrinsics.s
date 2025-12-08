	.file	"intrinsics.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	_Z11lower_qwordDv2_x
	.type	_Z11lower_qwordDv2_x, @function
_Z11lower_qwordDv2_x:
.LFB528:
	.cfi_startproc
	vmovd	edx, xmm0
	vpextrd	eax, xmm0, 1
	add	eax, edx
	ret
	.cfi_endproc
.LFE528:
	.size	_Z11lower_qwordDv2_x, .-_Z11lower_qwordDv2_x
	.p2align 4,,15
	.globl	_Z12higher_qwordDv2_x
	.type	_Z12higher_qwordDv2_x, @function
_Z12higher_qwordDv2_x:
.LFB529:
	.cfi_startproc
	vpunpckhqdq	xmm0, xmm0, xmm0
	vmovd	edx, xmm0
	vpextrd	eax, xmm0, 1
	add	eax, edx
	ret
	.cfi_endproc
.LFE529:
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
.LFB530:
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
	vpxor	xmm6, xmm6, xmm6
	vmovdqa	xmm5, XMMWORD PTR .LC0@GOTOFF[esi]
	vmovdqa	xmm7, XMMWORD PTR .LC1@GOTOFF[esi]
	xor	edx, edx
	vmovaps	XMMWORD PTR [esp], xmm6
	vmovdqa	xmm6, XMMWORD PTR .LC2@GOTOFF[esi]
	.p2align 4,,10
	.p2align 3
.L6:
	vmovdqa	xmm4, XMMWORD PTR [ecx+edx]
	vmovdqa	xmm2, XMMWORD PTR 16[ecx+edx]
	vpsrlw	xmm0, xmm4, 1
	vmovdqa	xmm4, XMMWORD PTR [ecx+edx]
	vpand	xmm0, xmm5, xmm0
	vpsubb	xmm0, xmm4, xmm0
	vpsrlw	xmm1, xmm0, 2
	vpand	xmm0, xmm7, xmm0
	vpand	xmm1, xmm7, xmm1
	vpaddb	xmm4, xmm0, xmm1
	vmovdqa	xmm1, XMMWORD PTR 16[ecx+edx]
	vpsrlw	xmm3, xmm4, 4
	vpsrlw	xmm1, xmm1, 1
	vmovaps	XMMWORD PTR 16[esp], xmm3
	vmovdqa	xmm3, XMMWORD PTR 32[ecx+edx]
	vpand	xmm1, xmm5, xmm1
	vpsubb	xmm1, xmm2, xmm1
	vpsrlw	xmm0, xmm1, 2
	vpand	xmm1, xmm7, xmm1
	vpand	xmm0, xmm7, xmm0
	vpaddb	xmm1, xmm1, xmm0
	vmovdqa	xmm0, XMMWORD PTR 32[ecx+edx]
	vpsrlw	xmm2, xmm1, 4
	vpsrlw	xmm0, xmm0, 1
	vmovaps	XMMWORD PTR 32[esp], xmm2
	vpaddb	xmm1, xmm1, XMMWORD PTR 32[esp]
	vpand	xmm0, xmm5, xmm0
	vpsubb	xmm0, xmm3, xmm0
	vpand	xmm1, xmm6, xmm1
	vpsrlw	xmm2, xmm0, 2
	vpand	xmm0, xmm7, xmm0
	vpand	xmm2, xmm7, xmm2
	vpaddb	xmm0, xmm0, xmm2
	vmovdqa	xmm2, XMMWORD PTR 48[ecx+edx]
	vpsrlw	xmm3, xmm0, 4
	vmovaps	XMMWORD PTR 48[esp], xmm3
	vpsrlw	xmm3, xmm2, 1
	vmovdqa	xmm2, XMMWORD PTR 48[ecx+edx]
	add	edx, 64
	vpand	xmm3, xmm5, xmm3
	vpaddb	xmm0, xmm0, XMMWORD PTR 48[esp]
	vpsubb	xmm3, xmm2, xmm3
	vpsrlw	xmm2, xmm3, 2
	vpand	xmm3, xmm7, xmm3
	vpand	xmm0, xmm6, xmm0
	vpand	xmm2, xmm7, xmm2
	vpaddb	xmm2, xmm2, xmm3
	vpsrlw	xmm3, xmm2, 4
	vpaddb	xmm2, xmm2, xmm3
	vpand	xmm2, xmm6, xmm2
	vpaddb	xmm0, xmm0, xmm2
	vpaddb	xmm2, xmm4, XMMWORD PTR 16[esp]
	vpxor	xmm4, xmm4, xmm4
	vpand	xmm2, xmm6, xmm2
	vpaddb	xmm2, xmm1, xmm2
	vpaddb	xmm0, xmm0, xmm2
	vpsadbw	xmm2, xmm0, xmm4
	vpaddq	xmm4, xmm2, XMMWORD PTR [esp]
	vmovaps	XMMWORD PTR [esp], xmm4
	cmp	eax, edx
	ja	.L6
	vmovdqa	xmm0, XMMWORD PTR [esp]
	vmovdqa	xmm5, xmm4
.L5:
	vmovd	ebx, xmm0
	vpextrd	edi, xmm0, 1
	vpunpckhqdq	xmm0, xmm5, xmm5
	vmovd	ebp, xmm0
	add	ebx, edi
	vpextrd	eax, xmm0, 1
	add	ebp, ebx
	add	eax, ebp
	cmp	DWORD PTR 100[esp], edx
	jbe	.L12
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
.L12:
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
	vpxor	xmm6, xmm6, xmm6
	xor	edx, edx
	vpxor	xmm0, xmm0, xmm0
	vmovaps	XMMWORD PTR [esp], xmm6
	vmovdqa	xmm5, xmm6
	jmp	.L5
	.cfi_endproc
.LFE530:
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
.LFB531:
	.cfi_startproc
	mov	esi, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE531:
	.ident	"GCC: (Ubuntu 8.2.0-7ubuntu1) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
