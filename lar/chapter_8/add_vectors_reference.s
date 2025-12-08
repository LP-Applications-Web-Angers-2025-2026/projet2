	.file	"add_vectors_reference.cpp"
	.intel_syntax noprefix
	.text
	.globl	_Z4addvPiS_i
	.type	_Z4addvPiS_i, @function
_Z4addvPiS_i:
.LFB0:
	.cfi_startproc
	endbr64
	test	edx, edx
	jle	.L1
	mov	ecx, edx
	mov	eax, 0
.L3:
	mov	edx, DWORD PTR [rsi+rax*4]
	add	DWORD PTR [rdi+rax*4], edx
	add	rax, 1
	cmp	rax, rcx
	jne	.L3
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4addvPiS_i, .-_Z4addvPiS_i
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
