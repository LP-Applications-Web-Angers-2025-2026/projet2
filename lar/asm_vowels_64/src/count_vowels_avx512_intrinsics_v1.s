	.file	"count_vowels_avx512_intrinsics_v1.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z23cv_avx512_intrinsics_v1PhjPj
	.type	_Z23cv_avx512_intrinsics_v1PhjPj, @function
_Z23cv_avx512_intrinsics_v1PhjPj:
.LFB6943:
	.cfi_startproc
	endbr64
	mov	edi, 4
	jmp	raise@PLT
	.cfi_endproc
.LFE6943:
	.size	_Z23cv_avx512_intrinsics_v1PhjPj, .-_Z23cv_avx512_intrinsics_v1PhjPj
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__Z23cv_avx512_intrinsics_v1PhjPj, @function
_GLOBAL__sub_I__Z23cv_avx512_intrinsics_v1PhjPj:
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
	.size	_GLOBAL__sub_I__Z23cv_avx512_intrinsics_v1PhjPj, .-_GLOBAL__sub_I__Z23cv_avx512_intrinsics_v1PhjPj
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z23cv_avx512_intrinsics_v1PhjPj
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
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
