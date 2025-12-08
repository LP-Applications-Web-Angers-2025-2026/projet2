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
.LFB1835:
	.cfi_startproc
	movzx	eax, BYTE PTR 8[esp]
	ret
	.cfi_endproc
.LFE1835:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB4592:
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
.LFSB4592:
.L8:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE4592:
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
.LFB3890:
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
	lea	eax, -32[ebp]
	sub	esp, 44
	.cfi_offset 1, -24
	mov	esi, DWORD PTR gs:20
	mov	DWORD PTR -28[ebp], esi
	mov	esi, DWORD PTR data_size@GOTOFF[ebx]
	sal	esi, 3
	push	esi
	push	32
	push	eax
	call	posix_memalign@PLT
	add	esp, 16
	mov	edx, eax
	xor	eax, eax
	test	edx, edx
	jne	.L11
	mov	eax, DWORD PTR -32[ebp]
.L11:
	sub	esp, 4
	mov	DWORD PTR x@GOTOFF[ebx], eax
	lea	eax, -36[ebp]
	push	esi
	push	32
	push	eax
	call	posix_memalign@PLT
	add	esp, 16
	mov	edx, eax
	xor	eax, eax
	test	edx, edx
	jne	.L12
	mov	eax, DWORD PTR -36[ebp]
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
.LFSB3890:
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
.LFE3890:
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
.LFB3891:
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
.LFE3891:
	.size	_Z14free_resourcesv, .-_Z14free_resourcesv
	.p2align 4
	.globl	_Z7saxpy_cPdS_dj
	.type	_Z7saxpy_cPdS_dj, @function
_Z7saxpy_cPdS_dj:
.LFB3892:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	and	esp, -64
	sub	esp, 64
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	mov	esi, DWORD PTR 24[ebp]
	mov	ecx, DWORD PTR 8[ebp]
	fld	QWORD PTR 16[ebp]
	test	esi, esi
	je	.L68
	lea	eax, -1[esi]
	cmp	eax, 2
	jbe	.L59
	mov	edx, DWORD PTR 12[ebp]
	sub	edx, ecx
	sub	edx, 4
	cmp	edx, 56
	jbe	.L59
	cmp	eax, 6
	jbe	.L69
	fst	QWORD PTR 56[esp]
	mov	ebx, esi
	vbroadcastsd	zmm3, QWORD PTR 56[esp]
	mov	eax, DWORD PTR 12[ebp]
	mov	edx, ecx
	fldz
	shr	ebx, 3
	sal	ebx, 6
	add	ebx, ecx
	.p2align 4
	.p2align 3
.L61:
	vmovupd	zmm0, ZMMWORD PTR [edx]
	vfmadd213pd	zmm0, zmm3, ZMMWORD PTR [eax]
	vmovlpd	QWORD PTR 56[esp], xmm0
	fld	QWORD PTR 56[esp]
	vextractf64x2	xmm4, ymm0, 1
	vmovhpd	QWORD PTR 56[esp], xmm0
	faddp	st(1), st
	fld	QWORD PTR 56[esp]
	faddp	st(1), st
	vmovupd	ZMMWORD PTR [eax], zmm0
	vmovsd	QWORD PTR 56[esp], xmm4
	valignq	ymm5, ymm0, ymm0, 3
	vextractf64x4	ymm0, zmm0, 0x1
	fadd	QWORD PTR 56[esp]
	vmovsd	QWORD PTR 56[esp], xmm5
	add	edx, 64
	add	eax, 64
	vextractf64x2	xmm6, ymm0, 1
	fadd	QWORD PTR 56[esp]
	vmovlpd	QWORD PTR 56[esp], xmm0
	valignq	ymm7, ymm0, ymm0, 3
	fld	QWORD PTR 56[esp]
	vmovhpd	QWORD PTR 56[esp], xmm0
	faddp	st(1), st
	fld	QWORD PTR 56[esp]
	vmovsd	QWORD PTR 56[esp], xmm6
	faddp	st(1), st
	fadd	QWORD PTR 56[esp]
	vmovsd	QWORD PTR 56[esp], xmm7
	fld	QWORD PTR 56[esp]
	faddp	st(1), st
	cmp	edx, ebx
	jne	.L61
	mov	eax, esi
	and	eax, -8
	test	esi, 7
	je	.L83
	mov	edx, esi
	sub	edx, eax
	lea	ebx, -1[edx]
	cmp	ebx, 2
	jbe	.L64
	fxch	st(1)
.L60:
	mov	ebx, DWORD PTR 12[ebp]
	lea	edi, 0[0+eax*8]
	fst	QWORD PTR 56[esp]
	vbroadcastsd	ymm0, QWORD PTR 56[esp]
	add	ebx, edi
	vmovupd	ymm3, YMMWORD PTR [ebx]
	vfmadd132pd	ymm0, ymm3, YMMWORD PTR [ecx+edi]
	vmovlpd	QWORD PTR 56[esp], xmm0
	fld	QWORD PTR 56[esp]
	vextractf64x2	xmm3, ymm0, 1
	vmovhpd	QWORD PTR 56[esp], xmm0
	faddp	st(2), st
	fld	QWORD PTR 56[esp]
	vmovupd	YMMWORD PTR [ebx], ymm0
	faddp	st(2), st
	fxch	st(1)
	vmovsd	QWORD PTR 56[esp], xmm3
	valignq	ymm3, ymm0, ymm0, 3
	fadd	QWORD PTR 56[esp]
	mov	ebx, edx
	vmovsd	QWORD PTR 56[esp], xmm3
	and	ebx, -4
	add	eax, ebx
	and	edx, 3
	fld	QWORD PTR 56[esp]
	faddp	st(1), st
	je	.L84
.L64:
	mov	ebx, DWORD PTR 12[ebp]
	lea	edx, 0[0+eax*8]
	fld	QWORD PTR [ecx+edx]
	fmul	st, st(2)
	add	ebx, edx
	fadd	QWORD PTR [ebx]
	fst	QWORD PTR [ebx]
	lea	ebx, 1[eax]
	faddp	st(1), st
	cmp	ebx, esi
	jnb	.L85
	mov	edi, DWORD PTR 12[ebp]
	fld	QWORD PTR 8[ecx+edx]
	add	eax, 2
	fmul	st, st(2)
	lea	ebx, 8[edi+edx]
	fadd	QWORD PTR [ebx]
	fst	QWORD PTR [ebx]
	faddp	st(1), st
	cmp	eax, esi
	jnb	.L86
	fxch	st(1)
	fmul	QWORD PTR 16[ecx+edx]
	lea	eax, 16[edi+edx]
	fadd	QWORD PTR [eax]
	fst	QWORD PTR [eax]
	faddp	st(1), st
	vzeroupper
	lea	esp, -12[ebp]
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L83:
	.cfi_restore_state
	fstp	st(1)
	jmp	.L81
	.p2align 4
	.p2align 3
.L84:
	fstp	st(1)
	jmp	.L81
	.p2align 4
	.p2align 3
.L85:
	fstp	st(1)
	jmp	.L81
	.p2align 4
	.p2align 3
.L86:
	fstp	st(1)
.L81:
	vzeroupper
	lea	esp, -12[ebp]
	pop	ebx
	.cfi_remember_state
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
.L59:
	.cfi_restore_state
	mov	eax, DWORD PTR 12[ebp]
	lea	edx, [ecx+esi*8]
	fldz
	.p2align 5
	.p2align 4
	.p2align 3
.L66:
	fld	QWORD PTR [ecx]
	add	ecx, 8
	add	eax, 8
	fmul	st, st(2)
	fadd	QWORD PTR -8[eax]
	fst	QWORD PTR -8[eax]
	faddp	st(1), st
	cmp	edx, ecx
	jne	.L66
	fstp	st(1)
	lea	esp, -12[ebp]
	pop	ebx
	.cfi_remember_state
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
.L68:
	.cfi_restore_state
	ffreep	st(0)
	lea	esp, -12[ebp]
	fldz
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L69:
	.cfi_restore_state
	mov	edx, esi
	xor	eax, eax
	fldz
	fxch	st(1)
	jmp	.L60
	.cfi_endproc
.LFE3892:
	.size	_Z7saxpy_cPdS_dj, .-_Z7saxpy_cPdS_dj
	.section	.rodata.str1.1
.LC16:
	.string	"size="
.LC17:
	.string	"zillions="
.LC21:
	.string	"result.first="
.LC22:
	.string	"result.final="
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3893:
	.cfi_startproc
	lea	ecx, 4[esp]
	.cfi_def_cfa 1, 0
	and	esp, -64
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
	sub	esp, 104
	call	_Z18allocate_resourcesv
	mov	edi, DWORD PTR _ZSt4cout@GOT[ebx]
	sub	esp, 4
	lea	eax, .LC16@GOTOFF[ebx]
	push	5
	push	eax
	mov	DWORD PTR -100[ebp], edi
	push	edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	eax
	pop	edx
	push	DWORD PTR data_size@GOTOFF[ebx]
	push	edi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	esp, 16
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	sub	esp, 4
	lea	eax, .LC17@GOTOFF[ebx]
	push	9
	push	eax
	push	edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	ecx
	pop	esi
	push	DWORD PTR zillions@GOTOFF[ebx]
	push	edi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	esp, 16
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	mov	esi, DWORD PTR y@GOTOFF[ebx]
	mov	edi, DWORD PTR data_size@GOTOFF[ebx]
	mov	ecx, DWORD PTR x@GOTOFF[ebx]
	mov	DWORD PTR -68[ebp], esi
	test	edi, edi
	je	.L115
	lea	eax, -1[edi]
	cmp	eax, 2
	jbe	.L89
	mov	edx, esi
	sub	edx, ecx
	sub	edx, 4
	cmp	edx, 56
	jbe	.L89
	cmp	eax, 6
	jbe	.L116
	mov	eax, esi
	vmovapd	zmm3, ZMMWORD PTR .LC18@GOTOFF[ebx]
	mov	esi, edi
	mov	edx, ecx
	shr	esi, 3
	fldz
	sal	esi, 6
	add	esi, ecx
	.p2align 4
	.p2align 3
.L91:
	vmovupd	zmm0, ZMMWORD PTR [edx]
	vfmadd213pd	zmm0, zmm3, ZMMWORD PTR [eax]
	vmovlpd	QWORD PTR -64[ebp], xmm0
	fld	QWORD PTR -64[ebp]
	vextractf64x2	xmm4, ymm0, 1
	faddp	st(1), st
	vmovhpd	QWORD PTR -64[ebp], xmm0
	fld	QWORD PTR -64[ebp]
	vmovupd	ZMMWORD PTR [eax], zmm0
	vmovsd	QWORD PTR -64[ebp], xmm4
	valignq	ymm4, ymm0, ymm0, 3
	vextractf64x4	ymm0, zmm0, 0x1
	faddp	st(1), st
	fadd	QWORD PTR -64[ebp]
	vmovsd	QWORD PTR -64[ebp], xmm4
	add	edx, 64
	add	eax, 64
	vextractf64x2	xmm4, ymm0, 1
	fadd	QWORD PTR -64[ebp]
	vmovlpd	QWORD PTR -64[ebp], xmm0
	fld	QWORD PTR -64[ebp]
	vmovhpd	QWORD PTR -64[ebp], xmm0
	faddp	st(1), st
	fld	QWORD PTR -64[ebp]
	vmovsd	QWORD PTR -64[ebp], xmm4
	valignq	ymm4, ymm0, ymm0, 3
	faddp	st(1), st
	fadd	QWORD PTR -64[ebp]
	vmovsd	QWORD PTR -64[ebp], xmm4
	fadd	QWORD PTR -64[ebp]
	cmp	edx, esi
	jne	.L91
	mov	eax, edi
	and	eax, -8
	test	edi, 7
	je	.L144
	mov	edx, edi
	sub	edx, eax
	lea	esi, -1[edx]
	cmp	esi, 2
	jbe	.L94
.L90:
	mov	esi, DWORD PTR -68[ebp]
	vmovupd	ymm0, YMMWORD PTR [ecx+eax*8]
	lea	esi, [esi+eax*8]
	vmovupd	ymm4, YMMWORD PTR [esi]
	vfmadd132pd	ymm0, ymm4, YMMWORD PTR .LC19@GOTOFF[ebx]
	vmovlpd	QWORD PTR -64[ebp], xmm0
	fld	QWORD PTR -64[ebp]
	vextractf64x2	xmm4, ymm0, 1
	vmovhpd	QWORD PTR -64[ebp], xmm0
	faddp	st(1), st
	fld	QWORD PTR -64[ebp]
	vmovupd	YMMWORD PTR [esi], ymm0
	faddp	st(1), st
	vmovsd	QWORD PTR -64[ebp], xmm4
	valignq	ymm4, ymm0, ymm0, 3
	fadd	QWORD PTR -64[ebp]
	mov	esi, edx
	vmovsd	QWORD PTR -64[ebp], xmm4
	and	esi, -4
	add	eax, esi
	and	dl, 3
	fld	QWORD PTR -64[ebp]
	faddp	st(1), st
	je	.L144
.L94:
	mov	esi, DWORD PTR -68[ebp]
	lea	edx, 0[0+eax*8]
	fld	DWORD PTR .LC20@GOTOFF[ebx]
	fld	QWORD PTR [ecx+eax*8]
	fmul	st, st(1)
	add	esi, edx
	fadd	QWORD PTR [esi]
	fst	QWORD PTR [esi]
	lea	esi, 1[eax]
	faddp	st(2), st
	cmp	esi, edi
	jnb	.L150
	mov	esi, DWORD PTR -68[ebp]
	fld	QWORD PTR 8[ecx+edx]
	add	eax, 2
	fmul	st, st(1)
	lea	esi, 8[esi+edx]
	fadd	QWORD PTR [esi]
	fst	QWORD PTR [esi]
	faddp	st(2), st
	cmp	eax, edi
	jnb	.L151
	mov	esi, DWORD PTR -68[ebp]
	fmul	QWORD PTR 16[ecx+edx]
	lea	eax, 16[esi+edx]
	fadd	QWORD PTR [eax]
	fst	QWORD PTR [eax]
	faddp	st(1), st
	vzeroupper
.L88:
	mov	edi, DWORD PTR -100[ebp]
	sub	esp, 4
	lea	eax, .LC21@GOTOFF[ebx]
	fstp	QWORD PTR -64[ebp]
	push	13
	push	eax
	push	edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	mov	eax, DWORD PTR [edi]
	fld	QWORD PTR -64[ebp]
	mov	edx, DWORD PTR -12[eax]
	add	edx, edi
	mov	eax, DWORD PTR 12[edx]
	mov	DWORD PTR 4[edx], 10
	and	eax, -261
	or	eax, 4
	mov	DWORD PTR 12[edx], eax
	fstp	QWORD PTR 4[esp]
	mov	DWORD PTR [esp], edi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	add	esp, 16
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	mov	eax, DWORD PTR zillions@GOTOFF[ebx]
	fld	QWORD PTR -64[ebp]
	cmp	eax, 1
	mov	DWORD PTR -88[ebp], eax
	jbe	.L98
	mov	edi, DWORD PTR data_size@GOTOFF[ebx]
	mov	eax, DWORD PTR y@GOTOFF[ebx]
	mov	ecx, DWORD PTR x@GOTOFF[ebx]
	lea	esi, -1[edi]
	mov	DWORD PTR -76[ebp], eax
	mov	DWORD PTR -72[ebp], ecx
	mov	DWORD PTR -92[ebp], esi
	cmp	esi, 2
	jbe	.L99
	sub	eax, ecx
	sub	eax, 4
	cmp	eax, 56
	jbe	.L99
	fldz
	mov	DWORD PTR -68[ebp], 2
	test	edi, edi
	jne	.L147
	mov	edx, DWORD PTR -88[ebp]
	mov	eax, 2
.L100:
	inc	eax
	fadd	st(1), st
	cmp	edx, eax
	jnb	.L100
	ffreep	st(0)
.L98:
	mov	edi, DWORD PTR -100[ebp]
	sub	esp, 4
	lea	eax, .LC22@GOTOFF[ebx]
	fstp	QWORD PTR -64[ebp]
	push	13
	push	eax
	push	edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	mov	eax, DWORD PTR [edi]
	fld	QWORD PTR -64[ebp]
	mov	edx, DWORD PTR -12[eax]
	add	edx, edi
	mov	eax, DWORD PTR 12[edx]
	mov	DWORD PTR 4[edx], 10
	and	eax, -261
	or	eax, 4
	mov	DWORD PTR 12[edx], eax
	fstp	QWORD PTR 4[esp]
	mov	DWORD PTR [esp], edi
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
.L150:
	.cfi_restore_state
	ffreep	st(0)
	jmp	.L144
.L151:
	ffreep	st(0)
.L144:
	vzeroupper
	jmp	.L88
.L147:
	ffreep	st(0)
	mov	eax, edi
	vmovapd	ymm4, YMMWORD PTR .LC19@GOTOFF[ebx]
	vmovapd	zmm3, ZMMWORD PTR .LC18@GOTOFF[ebx]
	mov	DWORD PTR -80[ebp], edi
	shr	eax, 3
	sal	eax, 6
	add	eax, ecx
	mov	DWORD PTR -84[ebp], eax
	.p2align 4
	.p2align 3
.L104:
	cmp	DWORD PTR -92[ebp], 6
	jbe	.L117
	mov	edi, DWORD PTR -80[ebp]
	mov	eax, DWORD PTR -84[ebp]
	mov	esi, edi
	and	esi, 7
.L107:
	mov	ecx, DWORD PTR -72[ebp]
	mov	edx, DWORD PTR -76[ebp]
	fldz
	.p2align 4
	.p2align 3
.L102:
	vmovupd	zmm0, ZMMWORD PTR [ecx]
	vfmadd213pd	zmm0, zmm3, ZMMWORD PTR [edx]
	vmovlpd	QWORD PTR -64[ebp], xmm0
	fld	QWORD PTR -64[ebp]
	vextractf64x2	xmm5, ymm0, 1
	vmovhpd	QWORD PTR -64[ebp], xmm0
	faddp	st(1), st
	fld	QWORD PTR -64[ebp]
	faddp	st(1), st
	vmovupd	ZMMWORD PTR [edx], zmm0
	vmovsd	QWORD PTR -64[ebp], xmm5
	valignq	ymm6, ymm0, ymm0, 3
	vextractf64x4	ymm0, zmm0, 0x1
	fadd	QWORD PTR -64[ebp]
	vmovsd	QWORD PTR -64[ebp], xmm6
	add	ecx, 64
	add	edx, 64
	vextractf64x2	xmm7, ymm0, 1
	fadd	QWORD PTR -64[ebp]
	vmovlpd	QWORD PTR -64[ebp], xmm0
	valignq	ymm5, ymm0, ymm0, 3
	fld	QWORD PTR -64[ebp]
	vmovhpd	QWORD PTR -64[ebp], xmm0
	faddp	st(1), st
	fld	QWORD PTR -64[ebp]
	vmovsd	QWORD PTR -64[ebp], xmm7
	faddp	st(1), st
	fadd	QWORD PTR -64[ebp]
	vmovsd	QWORD PTR -64[ebp], xmm5
	fadd	QWORD PTR -64[ebp]
	cmp	ecx, eax
	jne	.L102
	test	esi, esi
	je	.L148
	mov	ecx, edi
	mov	edx, edi
	mov	DWORD PTR -80[ebp], edi
	mov	DWORD PTR -84[ebp], eax
	and	ecx, 7
	and	edx, -8
	lea	esi, -1[ecx]
	cmp	esi, 2
	jbe	.L108
.L101:
	mov	edi, DWORD PTR -76[ebp]
	lea	esi, 0[0+edx*8]
	mov	eax, esi
	add	esi, edi
	mov	edi, DWORD PTR -72[ebp]
	vmovupd	ymm0, YMMWORD PTR [edi+eax]
	vfmadd213pd	ymm0, ymm4, YMMWORD PTR [esi]
	vmovlpd	QWORD PTR -64[ebp], xmm0
	fld	QWORD PTR -64[ebp]
	vextractf64x2	xmm6, ymm0, 1
	vmovhpd	QWORD PTR -64[ebp], xmm0
	faddp	st(1), st
	fld	QWORD PTR -64[ebp]
	vmovupd	YMMWORD PTR [esi], ymm0
	faddp	st(1), st
	vmovsd	QWORD PTR -64[ebp], xmm6
	valignq	ymm7, ymm0, ymm0, 3
	fadd	QWORD PTR -64[ebp]
	mov	esi, ecx
	vmovsd	QWORD PTR -64[ebp], xmm7
	and	esi, -4
	add	edx, esi
	and	ecx, 3
	fadd	QWORD PTR -64[ebp]
	je	.L109
.L108:
	lea	eax, 0[0+edx*8]
	lea	edi, 0[0+edx*8]
	fld	DWORD PTR .LC20@GOTOFF[ebx]
	mov	DWORD PTR -64[ebp], eax
	mov	eax, DWORD PTR -76[ebp]
	mov	ecx, DWORD PTR -64[ebp]
	fld	st(0)
	lea	esi, [eax+edi]
	mov	edi, DWORD PTR -72[ebp]
	fmul	QWORD PTR [edi+ecx]
	mov	ecx, DWORD PTR -80[ebp]
	fadd	QWORD PTR [esi]
	fst	QWORD PTR [esi]
	lea	esi, 1[edx]
	faddp	st(2), st
	cmp	esi, ecx
	jnb	.L152
	mov	esi, DWORD PTR -64[ebp]
	fld	st(0)
	add	edx, 2
	lea	esi, 8[eax+esi]
	mov	DWORD PTR -96[ebp], esi
	mov	esi, DWORD PTR -64[ebp]
	fmul	QWORD PTR 8[edi+esi]
	mov	esi, DWORD PTR -96[ebp]
	fadd	QWORD PTR [esi]
	fst	QWORD PTR [esi]
	faddp	st(2), st
	cmp	edx, ecx
	jnb	.L153
	mov	ecx, DWORD PTR -64[ebp]
	fmul	QWORD PTR 16[edi+ecx]
	lea	edx, 16[eax+ecx]
	fadd	QWORD PTR [edx]
	fst	QWORD PTR [edx]
	faddp	st(1), st
	jmp	.L109
	.p2align 4
	.p2align 3
.L152:
	ffreep	st(0)
	jmp	.L109
	.p2align 4
	.p2align 3
.L153:
	ffreep	st(0)
	.p2align 4
	.p2align 3
.L109:
	inc	DWORD PTR -68[ebp]
	mov	esi, DWORD PTR -68[ebp]
	faddp	st(1), st
	cmp	DWORD PTR -88[ebp], esi
	jnb	.L104
.L146:
	vzeroupper
	jmp	.L98
.L148:
	inc	DWORD PTR -68[ebp]
	mov	ecx, DWORD PTR -68[ebp]
	faddp	st(1), st
	cmp	DWORD PTR -88[ebp], ecx
	jnb	.L107
	jmp	.L146
.L117:
	mov	ecx, DWORD PTR -80[ebp]
	fldz
	xor	edx, edx
	jmp	.L101
.L99:
	mov	eax, DWORD PTR -72[ebp]
	mov	ecx, 2
	fldz
	lea	edx, [eax+edi*8]
	test	edi, edi
	jne	.L149
.L111:
	fadd	st(1), st
	inc	ecx
	cmp	DWORD PTR -88[ebp], ecx
	jnb	.L111
	ffreep	st(0)
	jmp	.L98
.L89:
	mov	eax, DWORD PTR -68[ebp]
	fldz
	lea	edx, [ecx+edi*8]
	fld	DWORD PTR .LC20@GOTOFF[ebx]
	.p2align 5
	.p2align 4
	.p2align 3
.L96:
	fld	st(0)
	fmul	QWORD PTR [ecx]
	add	ecx, 8
	add	eax, 8
	fadd	QWORD PTR -8[eax]
	fst	QWORD PTR -8[eax]
	faddp	st(2), st
	cmp	edx, ecx
	jne	.L96
	ffreep	st(0)
	jmp	.L88
.L115:
	fldz
	jmp	.L88
.L149:
	mov	edi, DWORD PTR -88[ebp]
	.p2align 4
	.p2align 3
.L113:
	mov	esi, DWORD PTR -76[ebp]
	mov	eax, DWORD PTR -72[ebp]
	fld	st(0)
	fld	DWORD PTR .LC20@GOTOFF[ebx]
	.p2align 5
	.p2align 4
	.p2align 3
.L112:
	fld	st(0)
	fmul	QWORD PTR [eax]
	add	eax, 8
	add	esi, 8
	fadd	QWORD PTR -8[esi]
	fst	QWORD PTR -8[esi]
	faddp	st(2), st
	cmp	edx, eax
	jne	.L112
	ffreep	st(0)
	inc	ecx
	faddp	st(2), st
	cmp	edi, ecx
	jnb	.L113
	ffreep	st(0)
	jmp	.L98
.L116:
	mov	edx, edi
	fldz
	xor	eax, eax
	jmp	.L90
	.cfi_endproc
.LFE3893:
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
	.section	.rodata
	.align 64
.LC18:
	.long	0
	.long	1072168960
	.long	0
	.long	1072168960
	.long	0
	.long	1072168960
	.long	0
	.long	1072168960
	.long	0
	.long	1072168960
	.long	0
	.long	1072168960
	.long	0
	.long	1072168960
	.long	0
	.long	1072168960
	.set	.LC19,.LC18
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC20:
	.long	1061158912
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB4598:
	.cfi_startproc
	mov	ebx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE4598:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 14.2.0-4ubuntu2~24.04) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
