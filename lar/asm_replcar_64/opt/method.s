	.file	"method.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	_Z8chr_replPhS_jhh
	.type	_Z8chr_replPhS_jhh, @function
_Z8chr_replPhS_jhh:
.LFB0:
	.cfi_startproc
	test	edx, edx
	je	.L20
	lea	rax, 32[rdi]
	mov	r11d, ecx
	cmp	rsi, rax
	lea	rax, 32[rsi]
	setnb	r9b
	cmp	rdi, rax
	setnb	al
	or	r9b, al
	je	.L3
	cmp	edx, 35
	jbe	.L3
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	lea	r9d, -1[rdx]
	push	QWORD PTR -8[r10]
	push	rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	mov	rbp, rsp
	push	r14
	push	r13
	push	r12
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	mov	r12, rsi
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	neg	r12
	push	rbx
	and	r12d, 31
	lea	eax, 31[r12]
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	cmp	r9d, eax
	jb	.L21
	test	r12d, r12d
	je	.L22
	lea	r10d, -1[r12]
	mov	eax, 1
	add	r10, 2
	.p2align 4,,10
	.p2align 3
.L6:
	movzx	r9d, BYTE PTR -1[rsi+rax]
	cmp	r11b, r9b
	je	.L37
	mov	BYTE PTR -1[rdi+rax], r9b
	mov	r9d, eax
	add	rax, 1
	cmp	r10, rax
	jne	.L6
.L5:
	mov	BYTE PTR -49[rbp], r11b
	mov	eax, edx
	mov	ebx, r12d
	sub	eax, r12d
	vpbroadcastb	ymm3, BYTE PTR -49[rbp]
	mov	BYTE PTR -49[rbp], r8b
	mov	r14d, eax
	vpbroadcastb	ymm2, BYTE PTR -49[rbp]
	mov	r12d, eax
	lea	r13, [rsi+rbx]
	shr	r14d, 5
	add	rbx, rdi
	xor	eax, eax
	xor	r10d, r10d
	.p2align 4,,10
	.p2align 3
.L11:
	vmovdqa	ymm0, YMMWORD PTR 0[r13+rax]
	add	r10d, 1
	vpcmpeqb	ymm1, ymm0, ymm3
	vpblendvb	ymm1, ymm0, ymm2, ymm1
	vmovups	XMMWORD PTR [rbx+rax], xmm1
	vextracti128	XMMWORD PTR 16[rbx+rax], ymm1, 0x1
	add	rax, 32
	cmp	r10d, r14d
	jb	.L11
	vextracti128	xmm0, ymm0, 0x1
	mov	r10d, r12d
	and	r10d, -32
	add	r9d, r10d
	cmp	r12d, r10d
	vpextrb	eax, xmm0, 15
	je	.L38
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L13:
	mov	r10d, r9d
	movzx	eax, BYTE PTR [rsi+r10]
	cmp	r11b, al
	je	.L39
	add	r9d, 1
	mov	BYTE PTR [rdi+r10], al
	cmp	edx, r9d
	ja	.L13
.L18:
	pop	rbx
	pop	r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	cmp	cl, al
	sete	al
	pop	r12
	movzx	eax, al
	pop	r13
	pop	r14
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	.cfi_restore_state
	add	r9d, 1
	mov	BYTE PTR [rdi+r10], r8b
	cmp	edx, r9d
	ja	.L13
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L37:
	mov	BYTE PTR -1[rdi+rax], r8b
	mov	r9d, eax
	add	rax, 1
	cmp	r10, rax
	jne	.L6
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	lea	r9d, -1[rdx]
	xor	edx, edx
	add	r9, 1
	.p2align 4,,10
	.p2align 3
.L16:
	movzx	eax, BYTE PTR [rsi+rdx]
	cmp	r11b, al
	je	.L17
	mov	BYTE PTR [rdi+rdx], al
	add	rdx, 1
	cmp	r9, rdx
	jne	.L16
.L32:
	cmp	cl, al
	sete	al
	movzx	eax, al
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	mov	BYTE PTR [rdi+rdx], r8b
	add	rdx, 1
	cmp	r9, rdx
	jne	.L16
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L20:
	xor	eax, eax
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	xor	r9d, r9d
	jmp	.L13
.L22:
	xor	r9d, r9d
	jmp	.L5
.L38:
	vzeroupper
	jmp	.L18
	.cfi_endproc
.LFE0:
	.size	_Z8chr_replPhS_jhh, .-_Z8chr_replPhS_jhh
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
