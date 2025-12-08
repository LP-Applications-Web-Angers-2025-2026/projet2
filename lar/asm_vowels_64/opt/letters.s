	.file	"letters.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z10cv_lettersPhjPj
	.type	_Z10cv_lettersPhjPj, @function
_Z10cv_lettersPhjPj:
.LFB1671:
	.cfi_startproc
	endbr64
	sub	rsp, 120
	.cfi_def_cfa_offset 128
	mov	r9, rdx
	mov	r8, rdi
	mov	ecx, 13
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 104[rsp], rax
	xor	eax, eax
	mov	rdx, rsp
	mov	rdi, rdx
	rep stosq
	test	esi, esi
	je	.L5
	lea	eax, -1[rsi]
	mov	rdi, r8
	lea	rdx, 1[r8+rax]
	.p2align 4
	.p2align 3
.L3:
	movzx	eax, BYTE PTR [rdi]
	inc	rdi
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	cmp	rdi, rdx
	jne	.L3
	vmovd	xmm1, DWORD PTR 32[rsp]
	mov	esi, DWORD PTR [rsp]
	mov	ecx, DWORD PTR 16[rsp]
	mov	edi, DWORD PTR 56[rsp]
	mov	edx, DWORD PTR 80[rsp]
	mov	eax, DWORD PTR 96[rsp]
.L2:
	vmovd	xmm2, esi
	vpinsrd	xmm1, xmm1, edi, 1
	mov	DWORD PTR 16[r9], edx
	mov	DWORD PTR 20[r9], eax
	vpinsrd	xmm0, xmm2, ecx, 1
	vpunpcklqdq	xmm0, xmm0, xmm1
	vmovdqu	XMMWORD PTR [r9], xmm0
	mov	rax, QWORD PTR 104[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L10
	add	rsp, 120
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L5:
	.cfi_restore_state
	xor	eax, eax
	xor	edx, edx
	xor	edi, edi
	vpxor	xmm1, xmm1, xmm1
	xor	ecx, ecx
	jmp	.L2
.L10:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1671:
	.size	_Z10cv_lettersPhjPj, .-_Z10cv_lettersPhjPj
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__Z10cv_lettersPhjPj, @function
_GLOBAL__sub_I__Z10cv_lettersPhjPj:
.LFB2164:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	lea	rdi, _ZStL8__ioinit[rip]
	call	_ZNSt8ios_base4InitC1Ev@PLT
	mov	rdi, QWORD PTR _ZNSt8ios_base4InitD1Ev@GOTPCREL[rip]
	lea	rdx, __dso_handle[rip]
	lea	rsi, _ZStL8__ioinit[rip]
	add	rsp, 8
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2164:
	.size	_GLOBAL__sub_I__Z10cv_lettersPhjPj, .-_GLOBAL__sub_I__Z10cv_lettersPhjPj
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z10cv_lettersPhjPj
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
