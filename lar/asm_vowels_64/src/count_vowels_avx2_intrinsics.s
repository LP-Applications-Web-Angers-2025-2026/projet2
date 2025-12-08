	.file	"count_vowels_avx2_intrinsics.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z18cv_avx2_intrinsicsPhjPj
	.type	_Z18cv_avx2_intrinsicsPhjPj, @function
_Z18cv_avx2_intrinsicsPhjPj:
.LFB6943:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	mov	r12d, esi
	mov	r13d, r12d
	push	rbx
	.cfi_offset 3, -56
	mov	rbx, rdi
	and	rsp, -32
	add	rsp, -128
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 120[rsp], rax
	xor	eax, eax
	mov	esi, DWORD PTR [rdx]
	mov	r8d, DWORD PTR 4[rdx]
	mov	edi, DWORD PTR 8[rdx]
	mov	r9d, DWORD PTR 12[rdx]
	mov	r10d, DWORD PTR 16[rdx]
	mov	r11d, DWORD PTR 20[rdx]
	and	r13d, -32
	je	.L9
	vmovdqa	ymm8, YMMWORD PTR .LC0[rip]
	vmovdqa	ymm7, YMMWORD PTR .LC1[rip]
	vmovdqa	ymm6, YMMWORD PTR .LC2[rip]
	vmovdqa	ymm5, YMMWORD PTR .LC3[rip]
	vmovdqa	ymm4, YMMWORD PTR .LC4[rip]
	vmovdqa	ymm3, YMMWORD PTR .LC5[rip]
	vpcmpeqd	ymm1, ymm1, ymm1
	.p2align 4,,10
	.p2align 3
.L3:
	mov	ecx, eax
	vmovdqa	ymm0, YMMWORD PTR [rbx+rcx]
	xor	r15d, r15d
	vpcmpb	k1, ymm0, ymm8, 0
	vpcmpb	k2, ymm0, ymm7, 0
	vpcmpb	k3, ymm0, ymm6, 0
	vpcmpb	k4, ymm0, ymm5, 0
	vmovdqu8	ymm2{k1}{z}, ymm1
	vpmovmskb	r14d, ymm2
	vpcmpb	k5, ymm0, ymm4, 0
	vmovdqu8	ymm9{k2}{z}, ymm1
	popcnt	r15d, r14d
	vpmovmskb	ecx, ymm9
	vpcmpb	k6, ymm0, ymm3, 0
	xor	r14d, r14d
	vmovdqu8	ymm10{k3}{z}, ymm1
	popcnt	r14d, ecx
	add	esi, r15d
	xor	ecx, ecx
	vpmovmskb	r15d, ymm10
	vmovdqu8	ymm11{k4}{z}, ymm1
	popcnt	ecx, r15d
	add	r8d, r14d
	xor	r15d, r15d
	vpmovmskb	r14d, ymm11
	vmovdqu8	ymm12{k5}{z}, ymm1
	popcnt	r15d, r14d
	add	edi, ecx
	xor	r14d, r14d
	vpmovmskb	ecx, ymm12
	vmovdqu8	ymm13{k6}{z}, ymm1
	add	r9d, r15d
	popcnt	r14d, ecx
	vpmovmskb	r15d, ymm13
	xor	ecx, ecx
	add	r10d, r14d
	popcnt	ecx, r15d
	add	eax, 32
	add	r11d, ecx
	mov	DWORD PTR [rdx], esi
	mov	DWORD PTR 4[rdx], r8d
	mov	DWORD PTR 8[rdx], edi
	mov	DWORD PTR 12[rdx], r9d
	mov	DWORD PTR 16[rdx], r10d
	mov	DWORD PTR 20[rdx], r11d
	cmp	eax, r13d
	jb	.L3
	vzeroupper
.L2:
	lea	r14, 16[rsp]
	xor	r15d, r15d
	xor	ecx, ecx
.L4:
	mov	r13d, ecx
	add	ecx, 32
	mov	QWORD PTR [r14+r13], r15
	mov	QWORD PTR 8[r14+r13], r15
	mov	QWORD PTR 16[r14+r13], r15
	mov	QWORD PTR 24[r14+r13], r15
	cmp	ecx, 96
	jb	.L4
	mov	QWORD PTR [r14+rcx], 0
	cmp	r12d, eax
	jbe	.L6
	mov	r14d, eax
	dec	r12d
	lea	r15, [rbx+r14]
	sub	r12d, eax
	lea	rbx, 1[rbx+r14]
	add	r12, rbx
	mov	rax, r12
	sub	rax, r15
	and	eax, 7
	je	.L7
	cmp	rax, 1
	je	.L34
	cmp	rax, 2
	je	.L35
	cmp	rax, 3
	je	.L36
	cmp	rax, 4
	je	.L37
	cmp	rax, 5
	je	.L38
	cmp	rax, 6
	jne	.L52
.L39:
	movzx	eax, BYTE PTR [r15]
	inc	r15
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
.L38:
	movzx	eax, BYTE PTR [r15]
	inc	r15
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
.L37:
	movzx	eax, BYTE PTR [r15]
	inc	r15
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
.L36:
	movzx	eax, BYTE PTR [r15]
	inc	r15
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
.L35:
	movzx	eax, BYTE PTR [r15]
	inc	r15
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
.L34:
	movzx	eax, BYTE PTR [r15]
	inc	r15
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	cmp	r15, r12
	je	.L48
.L7:
	movzx	eax, BYTE PTR [r15]
	add	r15, 8
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	movzx	eax, BYTE PTR -7[r15]
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	movzx	eax, BYTE PTR -6[r15]
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	movzx	eax, BYTE PTR -5[r15]
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	movzx	eax, BYTE PTR -4[r15]
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	movzx	eax, BYTE PTR -3[r15]
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	movzx	eax, BYTE PTR -2[r15]
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	movzx	eax, BYTE PTR -1[r15]
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	cmp	r15, r12
	jne	.L7
.L48:
	add	esi, DWORD PTR 16[rsp]
	add	r8d, DWORD PTR 32[rsp]
	add	edi, DWORD PTR 48[rsp]
	add	r9d, DWORD PTR 72[rsp]
	add	r10d, DWORD PTR 96[rsp]
	add	r11d, DWORD PTR 112[rsp]
.L6:
	vmovd	xmm14, edi
	vmovd	xmm8, esi
	vpinsrd	xmm15, xmm14, r9d, 1
	vpinsrd	xmm7, xmm8, r8d, 1
	mov	DWORD PTR 16[rdx], r10d
	mov	DWORD PTR 20[rdx], r11d
	vpunpcklqdq	xmm6, xmm7, xmm15
	vmovdqu	XMMWORD PTR [rdx], xmm6
	mov	rax, QWORD PTR 120[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L53
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	movzx	eax, BYTE PTR [r15]
	inc	r15
	sub	eax, 97
	cdqe
	inc	DWORD PTR 16[rsp+rax*4]
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L9:
	xor	eax, eax
	jmp	.L2
.L53:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE6943:
	.size	_Z18cv_avx2_intrinsicsPhjPj, .-_Z18cv_avx2_intrinsicsPhjPj
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__Z18cv_avx2_intrinsicsPhjPj, @function
_GLOBAL__sub_I__Z18cv_avx2_intrinsicsPhjPj:
.LFB7274:
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
.LFE7274:
	.size	_GLOBAL__sub_I__Z18cv_avx2_intrinsicsPhjPj, .-_GLOBAL__sub_I__Z18cv_avx2_intrinsicsPhjPj
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z18cv_avx2_intrinsicsPhjPj
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.align 32
.LC1:
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.byte	101
	.align 32
.LC2:
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.byte	105
	.align 32
.LC3:
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.byte	111
	.align 32
.LC4:
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.byte	117
	.align 32
.LC5:
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.byte	121
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 10-20200411-0ubuntu1) 10.0.1 20200411 (experimental) [master revision bb87d5cc77d:75961caccb7:f883c46b4877f637e0fa5025b4d6b5c9040ec566]"
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
