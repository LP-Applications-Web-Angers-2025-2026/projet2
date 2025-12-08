	.file	"b.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z12mp_referencePfS_S_j
	.type	_Z12mp_referencePfS_S_j, @function
_Z12mp_referencePfS_S_j:
.LFB0:
	.cfi_startproc
	endbr32
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	push	edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	push	esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	sub	esp, 12
	.cfi_def_cfa_offset 32
	mov	DWORD PTR 4[esp], eax
	mov	eax, DWORD PTR 44[esp]
	test	eax, eax
	je	.L1
	mov	eax, DWORD PTR 44[esp]
	mov	ebp, DWORD PTR 32[esp]
	mov	DWORD PTR 8[esp], 0
	mov	edi, DWORD PTR 40[esp]
	lea	ecx, 0[0+eax*4]
	lea	ebx, 0[ebp+ecx]
	.p2align 4,,10
	.p2align 3
.L6:
	xor	esi, esi
	.p2align 4,,10
	.p2align 3
.L4:
	mov	eax, DWORD PTR 36[esp]
	mov	DWORD PTR [esp], ebp
	fldz
	lea	edx, [eax+esi*4]
	mov	eax, ebp
	.p2align 4,,10
	.p2align 3
.L3:
	fld	DWORD PTR [eax]
	fmul	DWORD PTR [edx]
	add	eax, 4
	add	edx, ecx
	faddp	st(1), st
	cmp	ebx, eax
	jne	.L3
	fstp	DWORD PTR [edi+esi*4]
	lea	eax, 1[esi]
	cmp	DWORD PTR 44[esp], eax
	je	.L11
	mov	esi, eax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L11:
	mov	edx, DWORD PTR 8[esp]
	add	edi, ecx
	add	ebp, ecx
	add	ebx, ecx
	lea	eax, 1[edx]
	cmp	esi, edx
	je	.L1
	mov	DWORD PTR 8[esp], eax
	jmp	.L6
.L1:
	add	esp, 12
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
	.cfi_endproc
.LFE0:
	.size	_Z12mp_referencePfS_S_j, .-_Z12mp_referencePfS_S_j
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
	.ident	"GCC: (Ubuntu 10-20200411-0ubuntu1) 10.0.1 20200411 (experimental) [master revision bb87d5cc77d:75961caccb7:f883c46b4877f637e0fa5025b4d6b5c9040ec566]"
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
