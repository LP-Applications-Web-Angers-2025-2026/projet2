	.file	"a.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z8method_3Pjj
	.type	_Z8method_3Pjj, @function
_Z8method_3Pjj:
.LFB1580:
	.cfi_startproc
	endbr32
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	mov	edx, DWORD PTR 12[esp]
	test	edx, edx
	je	.L4
	mov	eax, DWORD PTR 8[esp]
	xor	ebx, ebx
	lea	ecx, [eax+edx*4]
	lea	edx, -4[0+edx*4]
	shr	edx, 2
	inc	edx
	and	edx, 3
	je	.L3
	cmp	edx, 1
	je	.L15
	cmp	edx, 2
	je	.L16
	mov	ebx, DWORD PTR [eax]
	add	eax, 4
#APP
# 12 "a.cpp" 1
	bsr ebx, ebx
# 0 "" 2
#NO_APP
.L16:
	mov	edx, DWORD PTR [eax]
	add	eax, 4
#APP
# 12 "a.cpp" 1
	bsr edx, edx
# 0 "" 2
#NO_APP
	add	ebx, edx
.L15:
	mov	edx, DWORD PTR [eax]
	add	eax, 4
#APP
# 12 "a.cpp" 1
	bsr edx, edx
# 0 "" 2
#NO_APP
	add	ebx, edx
	cmp	eax, ecx
	je	.L1
.L3:
	mov	edx, DWORD PTR [eax]
	add	eax, 16
#APP
# 12 "a.cpp" 1
	bsr edx, edx
# 0 "" 2
#NO_APP
	add	edx, ebx
	mov	ebx, DWORD PTR -12[eax]
#APP
# 12 "a.cpp" 1
	bsr ebx, ebx
# 0 "" 2
#NO_APP
	add	edx, ebx
	mov	ebx, DWORD PTR -8[eax]
#APP
# 12 "a.cpp" 1
	bsr ebx, ebx
# 0 "" 2
#NO_APP
	add	edx, ebx
	mov	ebx, DWORD PTR -4[eax]
#APP
# 12 "a.cpp" 1
	bsr ebx, ebx
# 0 "" 2
#NO_APP
	add	ebx, edx
	cmp	eax, ecx
	jne	.L3
.L1:
	mov	eax, ebx
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4
	.p2align 3
.L4:
	.cfi_restore_state
	xor	ebx, ebx
	mov	eax, ebx
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE1580:
	.size	_Z8method_3Pjj, .-_Z8method_3Pjj
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__Z8method_3Pjj, @function
_GLOBAL__sub_I__Z8method_3Pjj:
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
	.size	_GLOBAL__sub_I__Z8method_3Pjj, .-_GLOBAL__sub_I__Z8method_3Pjj
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I__Z8method_3Pjj
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
