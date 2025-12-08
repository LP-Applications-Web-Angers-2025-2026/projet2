	.file	"test_file.cpp"
	.intel_syntax noprefix
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1402:
	.cfi_startproc
	movzx	eax, BYTE PTR 8[esp]
	ret
	.cfi_endproc
.LFE1402:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB3353:
	.cfi_startproc
	push	edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	push	esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	mov	esi, eax
	push	ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	eax, DWORD PTR [eax]
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR -12[eax]
	mov	edi, DWORD PTR 124[esi+eax]
	test	edi, edi
	je	.L8
	cmp	BYTE PTR 28[edi], 0
	je	.L5
	movsx	eax, BYTE PTR 39[edi]
.L6:
	sub	esp, 8
	.cfi_def_cfa_offset 24
	push	eax
	.cfi_def_cfa_offset 28
	push	esi
	.cfi_def_cfa_offset 32
	call	_ZNSo3putEc@PLT
	mov	DWORD PTR [esp], eax
	call	_ZNSo5flushEv@PLT
	add	esp, 16
	.cfi_def_cfa_offset 16
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4
	.p2align 3
.L5:
	.cfi_restore_state
	sub	esp, 12
	.cfi_def_cfa_offset 28
	push	edi
	.cfi_def_cfa_offset 32
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	eax, DWORD PTR [edi]
	lea	ecx, _ZNKSt5ctypeIcE8do_widenEc@GOTOFF[ebx]
	add	esp, 16
	.cfi_def_cfa_offset 16
	mov	edx, DWORD PTR 24[eax]
	mov	eax, 10
	cmp	edx, ecx
	je	.L6
	sub	esp, 8
	.cfi_def_cfa_offset 24
	push	10
	.cfi_def_cfa_offset 28
	push	edi
	.cfi_def_cfa_offset 32
	call	edx
	movsx	eax, al
	add	esp, 16
	.cfi_def_cfa_offset 16
	jmp	.L6
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0.cold, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0.cold:
.LFSB3353:
.L8:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE3353:
	.text
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.section	.text.unlikely
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0.cold, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0.cold
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"x="
.LC2:
	.string	"y="
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4
	.globl	_Z18allocate_resourcesv
	.type	_Z18allocate_resourcesv, @function
_Z18allocate_resourcesv:
.LFB2977:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	ecx
	lea	esi, -32[ebp]
	sub	esp, 44
	.cfi_offset 1, -24
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -28[ebp], eax
	mov	eax, DWORD PTR data_size@GOTOFF[ebx]
	sal	eax, 3
	push	eax
	push	32
	push	esi
	call	posix_memalign@PLT
	add	esp, 16
	mov	edx, eax
	xor	eax, eax
	test	edx, edx
	jne	.L11
	mov	eax, DWORD PTR -32[ebp]
.L11:
	mov	DWORD PTR x@GOTOFF[ebx], eax
	mov	eax, DWORD PTR data_size@GOTOFF[ebx]
	sub	esp, 4
	sal	eax, 3
	push	eax
	push	32
	push	esi
	call	posix_memalign@PLT
	add	esp, 16
	mov	edx, eax
	xor	eax, eax
	test	edx, edx
	jne	.L12
	mov	eax, DWORD PTR -32[ebp]
.L12:
	mov	esi, DWORD PTR _ZSt4cout@GOT[ebx]
	mov	DWORD PTR y@GOTOFF[ebx], eax
	sub	esp, 4
	mov	eax, DWORD PTR [esi]
	mov	edx, DWORD PTR -12[eax]
	add	edx, esi
	mov	eax, DWORD PTR 12[edx]
	and	eax, -75
	or	eax, 8
	mov	DWORD PTR 12[edx], eax
	lea	eax, .LC1@GOTOFF[ebx]
	push	2
	push	eax
	push	esi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	ecx
	pop	edi
	push	DWORD PTR x@GOTOFF[ebx]
	push	esi
	call	_ZNSo9_M_insertIPKvEERSoT_@PLT
	add	esp, 16
	mov	ecx, eax
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR -12[eax]
	mov	edi, DWORD PTR 124[ecx+eax]
	test	edi, edi
	je	.L17
	cmp	BYTE PTR 28[edi], 0
	je	.L15
	movsx	eax, BYTE PTR 39[edi]
.L16:
	sub	esp, 8
	push	eax
	push	ecx
	call	_ZNSo3putEc@PLT
	mov	DWORD PTR [esp], eax
	call	_ZNSo5flushEv@PLT
	add	esp, 12
	lea	eax, .LC2@GOTOFF[ebx]
	push	2
	push	eax
	push	esi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	eax
	pop	edx
	push	DWORD PTR y@GOTOFF[ebx]
	push	esi
	call	_ZNSo9_M_insertIPKvEERSoT_@PLT
	add	esp, 16
	mov	ecx, eax
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR -12[eax]
	mov	edi, DWORD PTR 124[ecx+eax]
	test	edi, edi
	je	.L17
	cmp	BYTE PTR 28[edi], 0
	je	.L18
	movsx	eax, BYTE PTR 39[edi]
.L19:
	sub	esp, 8
	push	eax
	push	ecx
	call	_ZNSo3putEc@PLT
	mov	DWORD PTR [esp], eax
	call	_ZNSo5flushEv@PLT
	mov	eax, DWORD PTR [esi]
	add	esp, 16
	add	esi, DWORD PTR -12[eax]
	mov	eax, DWORD PTR 12[esi]
	and	eax, -75
	or	eax, 2
	mov	DWORD PTR 12[esi], eax
	mov	esi, DWORD PTR data_size@GOTOFF[ebx]
	test	esi, esi
	je	.L10
	mov	ecx, DWORD PTR y@GOTOFF[ebx]
	lea	eax, -1[esi]
	mov	edi, DWORD PTR x@GOTOFF[ebx]
	mov	DWORD PTR -48[ebp], ecx
	cmp	eax, 2
	jbe	.L22
	mov	edx, ecx
	sub	edx, edi
	sub	edx, 4
	cmp	edx, 56
	jbe	.L22
	cmp	eax, 6
	jbe	.L37
	mov	edx, ecx
	vmovapd	zmm1, ZMMWORD PTR .LC3@GOTOFF[ebx]
	mov	ecx, esi
	vmovapd	zmm0, ZMMWORD PTR .LC4@GOTOFF[ebx]
	shr	ecx, 3
	sal	ecx, 6
	mov	eax, edi
	add	ecx, edi
	.p2align 5
	.p2align 4
	.p2align 3
.L24:
	vmovupd	ZMMWORD PTR [eax], zmm1
	add	eax, 64
	add	edx, 64
	vmovupd	ZMMWORD PTR -64[edx], zmm0
	cmp	ecx, eax
	jne	.L24
	mov	eax, esi
	and	eax, -8
	test	esi, 7
	je	.L50
	mov	ecx, esi
	sub	ecx, eax
	mov	edx, ecx
	mov	DWORD PTR -52[ebp], ecx
	dec	edx
	cmp	edx, 2
	jbe	.L27
.L23:
	vmovapd	ymm0, YMMWORD PTR .LC6@GOTOFF[ebx]
	lea	edx, 0[0+eax*8]
	mov	ecx, DWORD PTR -48[ebp]
	vmovupd	YMMWORD PTR [edi+edx], ymm0
	vmovapd	ymm0, YMMWORD PTR .LC7@GOTOFF[ebx]
	vmovupd	YMMWORD PTR [ecx+edx], ymm0
	mov	ecx, DWORD PTR -52[ebp]
	mov	edx, ecx
	and	edx, -4
	add	eax, edx
	and	ecx, 3
	je	.L28
.L27:
	mov	edx, DWORD PTR -48[ebp]
	lea	ecx, 0[0+eax*8]
	fld	QWORD PTR .LC8@GOTOFF[ebx]
	fst	QWORD PTR [edi+ecx]
	fld	QWORD PTR .LC9@GOTOFF[ebx]
	fst	QWORD PTR [edx+ecx]
	lea	edx, 1[eax]
	cmp	edx, esi
	jnb	.L53
	fxch	st(1)
	mov	edx, ecx
	fst	QWORD PTR 8[edi+ecx]
	fxch	st(1)
	mov	DWORD PTR -52[ebp], ecx
	mov	ecx, DWORD PTR -48[ebp]
	add	eax, 2
	fst	QWORD PTR 8[ecx+edx]
	cmp	eax, esi
	jnb	.L54
	fxch	st(1)
	mov	edx, ecx
	mov	ecx, DWORD PTR -52[ebp]
	fstp	QWORD PTR 16[edi+ecx]
	fstp	QWORD PTR 16[edx+ecx]
	jmp	.L28
	.p2align 4
	.p2align 3
.L53:
	ffreep	st(0)
	ffreep	st(0)
	jmp	.L28
	.p2align 4
	.p2align 3
.L54:
	ffreep	st(0)
	ffreep	st(0)
	.p2align 4
	.p2align 3
.L28:
	fld	QWORD PTR .LC5@GOTOFF[ebx]
	fstp	QWORD PTR -48[ebp]
	vmovsd	xmm3, QWORD PTR -48[ebp]
	vmovsd	QWORD PTR [edi], xmm3
	vzeroupper
.L26:
	fld	QWORD PTR .LC10@GOTOFF[ebx]
	fstp	QWORD PTR -48[ebp]
	vmovsd	xmm4, QWORD PTR -48[ebp]
	vmovsd	QWORD PTR 24[edi], xmm4
.L10:
	mov	eax, DWORD PTR -28[ebp]
	sub	eax, DWORD PTR gs:20
	jne	.L51
	lea	esp, -16[ebp]
	pop	ecx
	.cfi_remember_state
	.cfi_restore 1
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4
	.p2align 3
.L18:
	.cfi_restore_state
	sub	esp, 12
	mov	DWORD PTR -48[ebp], ecx
	push	edi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	eax, DWORD PTR [edi]
	lea	ecx, _ZNKSt5ctypeIcE8do_widenEc@GOTOFF[ebx]
	add	esp, 16
	mov	edx, DWORD PTR 24[eax]
	mov	eax, 10
	cmp	edx, ecx
	mov	ecx, DWORD PTR -48[ebp]
	je	.L19
	sub	esp, 8
	push	10
	push	edi
	call	edx
	mov	ecx, DWORD PTR -48[ebp]
	movsx	eax, al
	add	esp, 16
	jmp	.L19
	.p2align 4
	.p2align 3
.L15:
	sub	esp, 12
	mov	DWORD PTR -48[ebp], ecx
	push	edi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	eax, DWORD PTR [edi]
	lea	ecx, _ZNKSt5ctypeIcE8do_widenEc@GOTOFF[ebx]
	add	esp, 16
	mov	edx, DWORD PTR 24[eax]
	mov	eax, 10
	cmp	edx, ecx
	mov	ecx, DWORD PTR -48[ebp]
	je	.L16
	sub	esp, 8
	push	10
	push	edi
	call	edx
	mov	ecx, DWORD PTR -48[ebp]
	movsx	eax, al
	add	esp, 16
	jmp	.L16
	.p2align 4
	.p2align 3
.L22:
	mov	eax, DWORD PTR -48[ebp]
	mov	edx, edi
	lea	ecx, [edi+esi*8]
	fld	QWORD PTR .LC8@GOTOFF[ebx]
	.p2align 6
	.p2align 4
	.p2align 3
.L29:
	fst	QWORD PTR [edx]
	add	edx, 8
	fld	QWORD PTR .LC9@GOTOFF[ebx]
	add	eax, 8
	fstp	QWORD PTR -48[ebp]
	vmovsd	xmm2, QWORD PTR -48[ebp]
	vmovsd	QWORD PTR -8[eax], xmm2
	cmp	ecx, edx
	jne	.L29
	ffreep	st(0)
	fld	QWORD PTR .LC5@GOTOFF[ebx]
	fstp	QWORD PTR -48[ebp]
	vmovsd	xmm5, QWORD PTR -48[ebp]
	vmovsd	QWORD PTR [edi], xmm5
	cmp	esi, 3
	ja	.L26
	jmp	.L10
	.p2align 4
	.p2align 3
.L50:
	fld	QWORD PTR .LC5@GOTOFF[ebx]
	fstp	QWORD PTR -48[ebp]
	vmovsd	xmm6, QWORD PTR -48[ebp]
	vmovsd	QWORD PTR [edi], xmm6
	vzeroupper
	jmp	.L26
.L37:
	xor	eax, eax
	mov	DWORD PTR -52[ebp], esi
	jmp	.L23
.L51:
	call	__stack_chk_fail_local
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	_Z18allocate_resourcesv.cold, @function
_Z18allocate_resourcesv.cold:
.LFSB2977:
.L17:
	.cfi_def_cfa 5, 8
	.cfi_offset 1, -24
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	mov	eax, DWORD PTR -28[ebp]
	sub	eax, DWORD PTR gs:20
	jne	.L52
	call	_ZSt16__throw_bad_castv@PLT
.L52:
	call	__stack_chk_fail_local
	.cfi_endproc
.LFE2977:
	.text
	.size	_Z18allocate_resourcesv, .-_Z18allocate_resourcesv
	.section	.text.unlikely
	.size	_Z18allocate_resourcesv.cold, .-_Z18allocate_resourcesv.cold
.LCOLDE14:
	.text
.LHOTE14:
	.p2align 4
	.globl	_Z14free_resourcesv
	.type	_Z14free_resourcesv, @function
_Z14free_resourcesv:
.LFB2978:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	sub	esp, 20
	.cfi_def_cfa_offset 28
	push	DWORD PTR x@GOTOFF[ebx]
	.cfi_def_cfa_offset 32
	call	free@PLT
	pop	eax
	.cfi_def_cfa_offset 28
	push	DWORD PTR y@GOTOFF[ebx]
	.cfi_def_cfa_offset 32
	call	free@PLT
	add	esp, 24
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE2978:
	.size	_Z14free_resourcesv, .-_Z14free_resourcesv
	.p2align 4
	.globl	_Z7saxpy_cPdS_dj
	.type	_Z7saxpy_cPdS_dj, @function
_Z7saxpy_cPdS_dj:
.LFB2979:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 8
	.cfi_def_cfa_offset 16
	mov	ecx, DWORD PTR 32[esp]
	fld	QWORD PTR 24[esp]
	test	ecx, ecx
	je	.L60
	mov	eax, DWORD PTR 16[esp]
	mov	edx, DWORD PTR 20[esp]
	fldz
	lea	ecx, [eax+ecx*8]
	.p2align 6
	.p2align 4
	.p2align 3
.L59:
	fld	st(1)
	fmul	QWORD PTR [eax]
	add	eax, 8
	add	edx, 8
	fadd	QWORD PTR -8[edx]
	fstp	QWORD PTR [esp]
	fld	QWORD PTR [esp]
	fst	QWORD PTR -8[edx]
	faddp	st(1), st
	fstp	QWORD PTR [esp]
	fld	QWORD PTR [esp]
	cmp	ecx, eax
	jne	.L59
	fstp	st(1)
	add	esp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4
	.p2align 3
.L60:
	.cfi_restore_state
	ffreep	st(0)
	add	esp, 8
	.cfi_def_cfa_offset 8
	fldz
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE2979:
	.size	_Z7saxpy_cPdS_dj, .-_Z7saxpy_cPdS_dj
	.section	.rodata.str1.1
.LC16:
	.string	"size="
.LC17:
	.string	"zillions="
.LC19:
	.string	"result.first="
.LC20:
	.string	"result.final="
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2980:
	.cfi_startproc
	lea	ecx, 4[esp]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	push	edi
	push	esi
	push	ebx
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	call	__x86.get_pc_thunk.bx
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	sub	esp, 40
	call	_Z18allocate_resourcesv
	mov	esi, DWORD PTR _ZSt4cout@GOT[ebx]
	sub	esp, 4
	lea	eax, .LC16@GOTOFF[ebx]
	push	5
	push	eax
	push	esi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	eax
	pop	edx
	push	DWORD PTR data_size@GOTOFF[ebx]
	push	esi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	esp, 16
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	sub	esp, 4
	lea	eax, .LC17@GOTOFF[ebx]
	push	9
	push	eax
	push	esi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	ecx
	pop	edi
	push	DWORD PTR zillions@GOTOFF[ebx]
	push	esi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	esp, 16
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	mov	ecx, DWORD PTR data_size@GOTOFF[ebx]
	mov	edx, DWORD PTR y@GOTOFF[ebx]
	mov	eax, DWORD PTR x@GOTOFF[ebx]
	test	ecx, ecx
	je	.L71
	fldz
	lea	ecx, [eax+ecx*8]
	fld	DWORD PTR .LC18@GOTOFF[ebx]
	jmp	.L65
	.p2align 6
	.p2align 4
	.p2align 3
.L80:
	fxch	st(1)
.L65:
	fld	st(0)
	fmul	QWORD PTR [eax]
	add	eax, 8
	add	edx, 8
	fadd	QWORD PTR -8[edx]
	fstp	QWORD PTR -32[ebp]
	fld	QWORD PTR -32[ebp]
	fst	QWORD PTR -8[edx]
	faddp	st(2), st
	fxch	st(1)
	fstp	QWORD PTR -32[ebp]
	fld	QWORD PTR -32[ebp]
	cmp	ecx, eax
	jne	.L80
	fstp	st(1)
.L64:
	sub	esp, 4
	lea	eax, .LC19@GOTOFF[ebx]
	fstp	QWORD PTR -32[ebp]
	push	13
	push	eax
	push	esi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	mov	eax, DWORD PTR [esi]
	fld	QWORD PTR -32[ebp]
	mov	edx, DWORD PTR -12[eax]
	add	edx, esi
	mov	eax, DWORD PTR 12[edx]
	mov	DWORD PTR 4[edx], 10
	and	eax, -261
	or	eax, 4
	mov	DWORD PTR 12[edx], eax
	fstp	QWORD PTR 4[esp]
	mov	DWORD PTR [esp], esi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	add	esp, 16
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	mov	eax, DWORD PTR zillions@GOTOFF[ebx]
	fld	QWORD PTR -32[ebp]
	cmp	eax, 1
	mov	DWORD PTR -36[ebp], eax
	jbe	.L66
	mov	edi, DWORD PTR y@GOTOFF[ebx]
	mov	eax, DWORD PTR data_size@GOTOFF[ebx]
	fldz
	mov	DWORD PTR -40[ebp], edi
	mov	edi, DWORD PTR x@GOTOFF[ebx]
	lea	ecx, [edi+eax*8]
	mov	DWORD PTR -44[ebp], edi
	mov	edi, 2
	test	eax, eax
	jne	.L69
	mov	eax, DWORD PTR -36[ebp]
	jmp	.L67
	.p2align 5
	.p2align 4
	.p2align 3
.L81:
	fxch	st(1)
.L67:
	fld	st(0)
	inc	edi
	faddp	st(2), st
	fxch	st(1)
	fstp	QWORD PTR -32[ebp]
	fld	QWORD PTR -32[ebp]
	cmp	eax, edi
	jnb	.L81
	fstp	st(1)
	jmp	.L66
	.p2align 4
	.p2align 3
.L82:
	fstp	st(1)
.L66:
	sub	esp, 4
	lea	eax, .LC20@GOTOFF[ebx]
	fstp	QWORD PTR -32[ebp]
	push	13
	push	eax
	push	esi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	mov	eax, DWORD PTR [esi]
	fld	QWORD PTR -32[ebp]
	mov	edx, DWORD PTR -12[eax]
	add	edx, esi
	mov	eax, DWORD PTR 12[edx]
	mov	DWORD PTR 4[edx], 10
	and	eax, -261
	or	eax, 4
	mov	DWORD PTR 12[edx], eax
	fstp	QWORD PTR 4[esp]
	mov	DWORD PTR [esp], esi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	add	esp, 16
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	call	_Z14free_resourcesv
	lea	esp, -16[ebp]
	xor	eax, eax
	pop	ecx
	.cfi_remember_state
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	lea	esp, -4[ecx]
	.cfi_def_cfa 4, 4
	ret
	.p2align 4
	.p2align 3
.L79:
	.cfi_restore_state
	faddp	st(2), st
	fxch	st(1)
	inc	edi
	fstp	QWORD PTR -32[ebp]
	fld	QWORD PTR -32[ebp]
	cmp	DWORD PTR -36[ebp], edi
	jb	.L82
	fxch	st(1)
.L69:
	mov	edx, DWORD PTR -40[ebp]
	mov	eax, DWORD PTR -44[ebp]
	fld	st(0)
	fld	DWORD PTR .LC18@GOTOFF[ebx]
	jmp	.L68
	.p2align 6
	.p2align 4
	.p2align 3
.L83:
	fxch	st(1)
.L68:
	fld	st(0)
	fmul	QWORD PTR [eax]
	add	eax, 8
	add	edx, 8
	fadd	QWORD PTR -8[edx]
	fstp	QWORD PTR -32[ebp]
	fld	QWORD PTR -32[ebp]
	fst	QWORD PTR -8[edx]
	faddp	st(2), st
	fxch	st(1)
	fstp	QWORD PTR -32[ebp]
	fld	QWORD PTR -32[ebp]
	cmp	ecx, eax
	jne	.L83
	fstp	st(1)
	jmp	.L79
.L71:
	fldz
	jmp	.L64
	.cfi_endproc
.LFE2980:
	.size	main, .-main
	.globl	zillions
	.data
	.align 4
	.type	zillions, @object
	.size	zillions, 4
zillions:
	.long	10000
	.globl	data_size
	.align 4
	.type	data_size, @object
	.size	data_size, 4
data_size:
	.long	524287
	.globl	method_id
	.align 4
	.type	method_id, @object
	.size	method_id, 4
method_id:
	.long	1
	.globl	y
	.bss
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.globl	x
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.section	.rodata
	.align 64
.LC3:
	.long	-858993459
	.long	1072745676
	.long	-858993459
	.long	1072745676
	.long	-858993459
	.long	1072745676
	.long	-858993459
	.long	1072745676
	.long	-858993459
	.long	1072745676
	.long	-858993459
	.long	1072745676
	.long	-858993459
	.long	1072745676
	.long	-858993459
	.long	1072745676
	.align 64
.LC4:
	.long	858993459
	.long	1072902963
	.long	858993459
	.long	1072902963
	.long	858993459
	.long	1072902963
	.long	858993459
	.long	1072902963
	.long	858993459
	.long	1072902963
	.long	858993459
	.long	1072902963
	.long	858993459
	.long	1072902963
	.long	858993459
	.long	1072902963
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	1717986918
	.long	1073899110
	.set	.LC6,.LC3
	.set	.LC7,.LC4
	.set	.LC8,.LC3
	.set	.LC9,.LC4
	.align 8
.LC10:
	.long	-1717986918
	.long	1075157401
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC18:
	.long	1061158912
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB3359:
	.cfi_startproc
	mov	ebx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE3359:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 14.2.0-4ubuntu2~24.04) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
