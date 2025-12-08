	.file	"b.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z8method_2Pjj
	.type	_Z8method_2Pjj, @function
_Z8method_2Pjj:
.LFB1580:
	.cfi_startproc
	endbr32
	push	edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	push	esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	push	ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	edx, DWORD PTR 20[esp]
	test	edx, edx
	je	.L4
	mov	eax, DWORD PTR 16[esp]
	lea	edi, -4[0+edx*4]
	xor	esi, esi
	mov	ecx, 31
	shr	edi, 2
	inc	edi
	and	edi, 3
	lea	ebx, [eax+edx*4]
	je	.L3
	cmp	edi, 1
	je	.L15
	cmp	edi, 2
	je	.L16
	bsr	edx, DWORD PTR [eax]
	mov	esi, ecx
	xor	edx, 31
	add	eax, 4
	sub	esi, edx
.L16:
	bsr	edx, DWORD PTR [eax]
	mov	edi, ecx
	xor	edx, 31
	add	eax, 4
	sub	edi, edx
	add	esi, edi
.L15:
	bsr	edx, DWORD PTR [eax]
	mov	edi, ecx
	xor	edx, 31
	add	eax, 4
	sub	edi, edx
	add	esi, edi
	cmp	ebx, eax
	je	.L1
.L3:
	bsr	edi, DWORD PTR [eax]
	mov	edx, ecx
	xor	edi, 31
	add	eax, 16
	sub	edx, edi
	mov	edi, ecx
	add	edx, esi
	bsr	esi, DWORD PTR -12[eax]
	xor	esi, 31
	sub	edi, esi
	bsr	esi, DWORD PTR -8[eax]
	xor	esi, 31
	add	edx, edi
	mov	edi, ecx
	sub	edi, esi
	mov	esi, ecx
	add	edx, edi
	bsr	edi, DWORD PTR -4[eax]
	xor	edi, 31
	sub	esi, edi
	add	esi, edx
	cmp	ebx, eax
	jne	.L3
.L1:
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	mov	eax, esi
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4
	.p2align 3
.L4:
	.cfi_restore_state
	xor	esi, esi
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	mov	eax, esi
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE1580:
	.size	_Z8method_2Pjj, .-_Z8method_2Pjj
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__Z8method_2Pjj, @function
_GLOBAL__sub_I__Z8method_2Pjj:
.LFB1911:
	.cfi_startproc
	endbr32
	push	esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	push	ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	sub	esp, 16
	.cfi_def_cfa_offset 28
	lea	esi, _ZStL8__ioinit@GOTOFF[ebx]
	push	esi
	.cfi_def_cfa_offset 32
	call	_ZNSt8ios_base4InitC1Ev@PLT
	add	esp, 12
	.cfi_def_cfa_offset 20
	lea	eax, __dso_handle@GOTOFF[ebx]
	push	eax
	.cfi_def_cfa_offset 24
	push	esi
	.cfi_def_cfa_offset 28
	push	DWORD PTR _ZNSt8ios_base4InitD1Ev@GOT[ebx]
	.cfi_def_cfa_offset 32
	call	__cxa_atexit@PLT
	add	esp, 20
	.cfi_def_cfa_offset 12
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE1911:
	.size	_GLOBAL__sub_I__Z8method_2Pjj, .-_GLOBAL__sub_I__Z8method_2Pjj
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I__Z8method_2Pjj
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB1912:
	.cfi_startproc
	mov	ebx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE1912:
	.hidden	__dso_handle
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
