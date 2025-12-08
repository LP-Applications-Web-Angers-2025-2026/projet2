	.file	"gnu_gpl.cpp"
	.intel_syntax noprefix
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1335:
	.cfi_startproc
	endbr64
	mov	eax, esi
	ret
	.cfi_endproc
.LFE1335:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev, @function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev:
.LFB2677:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, QWORD PTR 8[rdi]
	mov	rbp, QWORD PTR [rdi]
	cmp	rbx, rbp
	je	.L4
	.p2align 4,,10
	.p2align 3
.L8:
	mov	rdi, QWORD PTR 0[rbp]
	lea	rax, 16[rbp]
	cmp	rdi, rax
	je	.L5
	add	rbp, 32
	call	_ZdlPv@PLT
	cmp	rbx, rbp
	jne	.L8
.L6:
	mov	rbp, QWORD PTR [r12]
.L4:
	test	rbp, rbp
	je	.L10
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	rdi, rbp
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	add	rbp, 32
	cmp	rbx, rbp
	jne	.L8
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L10:
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2677:
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
	.set	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"basic_string::_M_construct null not valid"
	.section	.text.startup,"ax",@progbits
	.align 2
	.p2align 4
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0:
.LFB2902:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	lea	r13, 16[rdi]
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 24
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	mov	QWORD PTR [rdi], r13
	test	rsi, rsi
	je	.L13
	mov	rbx, rdi
	mov	rdi, rsi
	mov	rbp, rsi
	call	strlen@PLT
	mov	QWORD PTR [rsp], rax
	mov	r12, rax
	cmp	rax, 15
	ja	.L26
	cmp	rax, 1
	jne	.L17
	movzx	eax, BYTE PTR 0[rbp]
	mov	BYTE PTR 16[rbx], al
.L18:
	mov	rcx, QWORD PTR [rsp]
	mov	rsi, QWORD PTR [rbx]
	mov	QWORD PTR 8[rbx], rcx
	mov	BYTE PTR [rsi+rcx], 0
	mov	rax, QWORD PTR 8[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L27
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
.L17:
	.cfi_restore_state
	test	rax, rax
	je	.L18
	jmp	.L16
.L26:
	xor	edx, edx
	mov	rsi, rsp
	mov	rdi, rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	mov	rdx, QWORD PTR [rsp]
	mov	QWORD PTR [rbx], rax
	mov	QWORD PTR 16[rbx], rdx
	mov	r13, rax
.L16:
	mov	rdx, r12
	mov	rsi, rbp
	mov	rdi, r13
	call	memcpy@PLT
	jmp	.L18
.L27:
	call	__stack_chk_fail@PLT
.L13:
	lea	rdi, .LC0[rip]
	call	_ZSt19__throw_logic_errorPKc@PLT
	.cfi_endproc
.LFE2902:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	.text
	.p2align 4
	.globl	_Z9draw_hzlni
	.type	_Z9draw_hzlni, @function
_Z9draw_hzlni:
.LFB2442:
	.cfi_startproc
	endbr64
	test	edi, edi
	jle	.L69
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	eax, edi
	mov	r13d, edi
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xor	r12d, r12d
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	lea	rbp, _ZL3hln[rip]
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	lea	rbx, _ZSt4cout[rip]
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	and	eax, 7
	je	.L30
	cmp	eax, 1
	je	.L53
	cmp	eax, 2
	je	.L54
	cmp	eax, 3
	je	.L55
	cmp	eax, 4
	je	.L56
	cmp	eax, 5
	je	.L57
	cmp	eax, 6
	jne	.L72
.L58:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	inc	r12d
.L57:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	inc	r12d
.L56:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	inc	r12d
.L55:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	inc	r12d
.L54:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	inc	r12d
.L53:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	inc	r12d
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmp	r13d, r12d
	je	.L67
.L30:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	add	r12d, 8
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmp	r13d, r12d
	jne	.L30
.L67:
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L72:
	.cfi_restore_state
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	r12d, 1
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L69:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE2442:
	.size	_Z9draw_hzlni, .-_Z9draw_hzlni
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"    "
	.text
	.p2align 4
	.globl	_Z8draw_ulnv
	.type	_Z8draw_ulnv, @function
_Z8draw_ulnv:
.LFB2443:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	edx, 4
	lea	rsi, .LC1[rip]
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	lea	rdi, _ZSt4cout[rip]
	mov	r12d, 70
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	lea	rbp, _ZL3hln[rip]
	lea	rbx, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3ulc[rip+8]
	mov	rsi, QWORD PTR _ZL3ulc[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L74:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	sub	r12d, 10
	jne	.L74
	mov	rdx, QWORD PTR _ZL3urc[rip+8]
	mov	rsi, QWORD PTR _ZL3urc[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rbp, rax
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -24[rax]
	mov	r12, QWORD PTR 240[rbp+rdx]
	test	r12, r12
	je	.L90
	cmp	BYTE PTR 56[r12], 0
	je	.L76
	movsx	esi, BYTE PTR 67[r12]
.L77:
	mov	rdi, rbp
	call	_ZNSo3putEc@PLT
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	mov	rdi, rax
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
	mov	rdi, r12
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	rcx, QWORD PTR [r12]
	lea	rdi, _ZNKSt5ctypeIcE8do_widenEc[rip]
	mov	rbx, QWORD PTR 48[rcx]
	mov	esi, 10
	cmp	rbx, rdi
	je	.L77
	mov	rdi, r12
	call	rbx
	movsx	esi, al
	jmp	.L77
.L90:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2443:
	.size	_Z8draw_ulnv, .-_Z8draw_ulnv
	.p2align 4
	.globl	_Z8draw_blnv
	.type	_Z8draw_blnv, @function
_Z8draw_blnv:
.LFB2444:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	edx, 4
	lea	rsi, .LC1[rip]
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	lea	rdi, _ZSt4cout[rip]
	mov	r12d, 70
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	lea	rbp, _ZL3hln[rip]
	lea	rbx, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3blc[rip+8]
	mov	rsi, QWORD PTR _ZL3blc[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L92:
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3hln[rip+8]
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	sub	r12d, 10
	jne	.L92
	mov	rdx, QWORD PTR _ZL3brc[rip+8]
	mov	rsi, QWORD PTR _ZL3brc[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rbp, rax
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -24[rax]
	mov	r12, QWORD PTR 240[rbp+rdx]
	test	r12, r12
	je	.L108
	cmp	BYTE PTR 56[r12], 0
	je	.L94
	movsx	esi, BYTE PTR 67[r12]
.L95:
	mov	rdi, rbp
	call	_ZNSo3putEc@PLT
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	mov	rdi, rax
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
	.p2align 4,,10
	.p2align 3
.L94:
	.cfi_restore_state
	mov	rdi, r12
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	rcx, QWORD PTR [r12]
	lea	rdi, _ZNKSt5ctypeIcE8do_widenEc[rip]
	mov	rbx, QWORD PTR 48[rcx]
	mov	esi, 10
	cmp	rbx, rdi
	je	.L95
	mov	rdi, r12
	call	rbx
	movsx	esi, al
	jmp	.L95
.L108:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2444:
	.size	_Z8draw_blnv, .-_Z8draw_blnv
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4
	.globl	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2445:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2445
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	mov	edx, 32
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	rbx, rdi
	sub	rsp, 80
	.cfi_def_cfa_offset 128
	mov	rbp, QWORD PTR fs:40
	mov	QWORD PTR 72[rsp], rbp
	mov	ebp, 70
	lea	r13, 16[rsp]
	mov	QWORD PTR [rsp], r13
	lea	r14, 48[rsp]
	sub	rbp, QWORD PTR 8[rdi]
	mov	rsi, rbp
	shr	rsi
	sub	rbp, rsi
	mov	rdi, rsp
.LEHB0:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc@PLT
.LEHE0:
	lea	rdi, 32[rsp]
	mov	edx, 32
	mov	rsi, rbp
	mov	QWORD PTR 32[rsp], r14
.LEHB1:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEmc@PLT
.LEHE1:
	mov	edx, 4
	lea	rsi, .LC1[rip]
	lea	rdi, _ZSt4cout[rip]
.LEHB2:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3vln[rip+8]
	mov	rsi, QWORD PTR _ZL3vln[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 8[rsp]
	mov	rsi, QWORD PTR [rsp]
	mov	rdi, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 8[rbx]
	mov	rsi, QWORD PTR [rbx]
	mov	rdi, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 40[rsp]
	mov	rsi, QWORD PTR 32[rsp]
	mov	rdi, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _ZL3vln[rip+8]
	mov	rsi, QWORD PTR _ZL3vln[rip]
	mov	rdi, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rbp, rax
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -24[rax]
	mov	r12, QWORD PTR 240[rbp+rdx]
	test	r12, r12
	je	.L126
	cmp	BYTE PTR 56[r12], 0
	je	.L111
	movsx	esi, BYTE PTR 67[r12]
.L112:
	mov	rdi, rbp
	call	_ZNSo3putEc@PLT
	mov	rdi, rax
	call	_ZNSo5flushEv@PLT
	mov	rdi, QWORD PTR 32[rsp]
	cmp	rdi, r14
	je	.L113
	call	_ZdlPv@PLT
.L113:
	mov	rdi, QWORD PTR [rsp]
	cmp	rdi, r13
	je	.L109
	call	_ZdlPv@PLT
.L109:
	mov	rax, QWORD PTR 72[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L127
	add	rsp, 80
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L111:
	.cfi_restore_state
	mov	rdi, r12
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	rcx, QWORD PTR [r12]
	lea	rdi, _ZNKSt5ctypeIcE8do_widenEc[rip]
	mov	rbx, QWORD PTR 48[rcx]
	mov	esi, 10
	cmp	rbx, rdi
	je	.L112
	mov	rdi, r12
	call	rbx
	movsx	esi, al
	jmp	.L112
.L127:
	call	__stack_chk_fail@PLT
.L126:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE2:
.L122:
	endbr64
	mov	rbx, rax
	jmp	.L115
.L121:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L117
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA2445:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2445-.LLSDACSB2445
.LLSDACSB2445:
	.uleb128 .LEHB0-.LFB2445
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2445
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L121-.LFB2445
	.uleb128 0
	.uleb128 .LEHB2-.LFB2445
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L122-.LFB2445
	.uleb128 0
.LLSDACSE2445:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC2445
	.type	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold, @function
_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold:
.LFSB2445:
.L115:
	.cfi_def_cfa_offset 128
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	mov	rdi, QWORD PTR 32[rsp]
	cmp	rdi, r14
	je	.L123
	vzeroupper
	call	_ZdlPv@PLT
.L117:
	mov	rdi, QWORD PTR [rsp]
	cmp	rdi, r13
	je	.L118
	call	_ZdlPv@PLT
.L118:
	mov	rdi, rbx
.LEHB3:
	call	_Unwind_Resume@PLT
.LEHE3:
.L123:
	vzeroupper
	jmp	.L117
	.cfi_endproc
.LFE2445:
	.section	.gcc_except_table
.LLSDAC2445:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC2445-.LLSDACSBC2445
.LLSDACSBC2445:
	.uleb128 .LEHB3-.LCOLDB2
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSEC2445:
	.section	.text.unlikely
	.text
	.size	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.text.unlikely
	.size	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold, .-_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold
.LCOLDE2:
	.text
.LHOTE2:
	.p2align 4
	.globl	_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2446:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	_Z8draw_ulnv
	mov	rbx, QWORD PTR _Z14header_stringsB5cxx11[rip]
	mov	rbp, QWORD PTR _Z14header_stringsB5cxx11[rip+8]
	cmp	rbx, rbp
	je	.L129
	mov	rax, rbp
	sub	rax, rbx
	sub	rax, 32
	shr	rax, 5
	inc	rax
	and	eax, 7
	je	.L130
	cmp	rax, 1
	je	.L153
	cmp	rax, 2
	je	.L154
	cmp	rax, 3
	je	.L155
	cmp	rax, 4
	je	.L156
	cmp	rax, 5
	je	.L157
	cmp	rax, 6
	jne	.L168
.L158:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L157:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L156:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L155:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L154:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L153:
	mov	rdi, rbx
	add	rbx, 32
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	cmp	rbp, rbx
	je	.L129
.L130:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 32[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 64[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 96[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 128[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 160[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 192[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 224[rbx]
	add	rbx, 256
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	cmp	rbp, rbx
	jne	.L130
.L129:
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	jmp	_Z8draw_blnv
	.p2align 4,,10
	.p2align 3
.L168:
	.cfi_restore_state
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
	jmp	.L158
	.cfi_endproc
.LFE2446:
	.size	_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.p2align 4
	.globl	_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2447:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	_Z8draw_ulnv
	mov	rbx, QWORD PTR _Z11gpl_stringsB5cxx11[rip]
	mov	rbp, QWORD PTR _Z11gpl_stringsB5cxx11[rip+8]
	cmp	rbx, rbp
	je	.L170
	mov	rax, rbp
	sub	rax, rbx
	sub	rax, 32
	shr	rax, 5
	inc	rax
	and	eax, 7
	je	.L171
	cmp	rax, 1
	je	.L194
	cmp	rax, 2
	je	.L195
	cmp	rax, 3
	je	.L196
	cmp	rax, 4
	je	.L197
	cmp	rax, 5
	je	.L198
	cmp	rax, 6
	jne	.L209
.L199:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L198:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L197:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L196:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L195:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
.L194:
	mov	rdi, rbx
	add	rbx, 32
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	cmp	rbp, rbx
	je	.L170
.L171:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 32[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 64[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 96[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 128[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 160[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 192[rbx]
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	lea	rdi, 224[rbx]
	add	rbx, 256
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	cmp	rbp, rbx
	jne	.L171
.L170:
	call	_Z8draw_blnv
	xor	edi, edi
	call	exit@PLT
.L209:
	mov	rdi, rbx
	call	_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	add	rbx, 32
	jmp	.L199
	.cfi_endproc
.LFE2447:
	.size	_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.rodata._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"cannot create std::vector larger than max_size()"
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC5ESt16initializer_listIS5_ERKS6_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_, @function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_:
.LFB2674:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2674
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	sal	rdx, 5
	movabs	rcx, 9223372036854775776
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	mov	r15, rdi
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 56
	.cfi_def_cfa_offset 112
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	lea	rax, [rsi+rdx]
	mov	QWORD PTR [rdi], 0
	mov	QWORD PTR 8[rdi], 0
	mov	QWORD PTR 16[rdi], 0
	mov	QWORD PTR 8[rsp], rax
	cmp	rdx, rcx
	ja	.L276
	mov	rbx, rdx
	test	rdx, rdx
	je	.L212
	mov	rdi, rdx
	mov	rbp, rsi
	mov	r12, rsi
.LEHB4:
	call	_Znwm@PLT
.LEHE4:
	mov	rdx, QWORD PTR 8[rsp]
	add	rbx, rax
	mov	QWORD PTR 24[rsp], rax
	mov	QWORD PTR [r15], rax
	mov	QWORD PTR 16[r15], rbx
	cmp	rbp, rdx
	je	.L228
	mov	rbx, rax
	mov	rax, rdx
	lea	rsi, 32[rsp]
	sub	rax, rbp
	mov	QWORD PTR 16[rsp], rsi
	test	al, 32
	je	.L219
	mov	r13, QWORD PTR 0[rbp]
	mov	r8, QWORD PTR 24[rsp]
	mov	r12, QWORD PTR 8[rbp]
	mov	r9, r13
	lea	rdi, 16[r8]
	add	r9, r12
	mov	QWORD PTR [r8], rdi
	je	.L241
	test	r13, r13
	je	.L266
.L241:
	mov	QWORD PTR 32[rsp], r12
	cmp	r12, 15
	ja	.L277
	cmp	r12, 1
	jne	.L278
	movzx	r10d, BYTE PTR 0[r13]
	mov	r11, QWORD PTR 24[rsp]
	mov	BYTE PTR 16[r11], r10b
.L244:
	mov	rbx, QWORD PTR 24[rsp]
	mov	QWORD PTR 8[rbx], r12
	mov	BYTE PTR [rdi+r12], 0
	lea	r12, 32[rbp]
	lea	rbx, 32[rbx]
	cmp	QWORD PTR 8[rsp], r12
	jne	.L219
	.p2align 4,,10
	.p2align 3
.L213:
	mov	QWORD PTR 8[r15], rbx
	mov	rax, QWORD PTR 40[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L279
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L282:
	.cfi_restore_state
	test	r12, r12
	jne	.L272
.L250:
	mov	QWORD PTR 8[rbp], r12
	mov	BYTE PTR [rdi+r12], 0
	lea	r12, 32[r14]
	lea	rbx, 32[rbp]
	cmp	QWORD PTR 8[rsp], r12
	je	.L213
.L219:
	mov	rbp, QWORD PTR [r12]
	mov	r13, QWORD PTR 8[r12]
	mov	rdx, rbp
	lea	rdi, 16[rbx]
	add	rdx, r13
	mov	QWORD PTR [rbx], rdi
	je	.L214
	test	rbp, rbp
	je	.L266
.L214:
	mov	QWORD PTR 32[rsp], r13
	cmp	r13, 15
	ja	.L280
	cmp	r13, 1
	jne	.L217
	movzx	esi, BYTE PTR 0[rbp]
	mov	BYTE PTR 16[rbx], sil
.L218:
	mov	QWORD PTR 8[rbx], r13
	mov	BYTE PTR [rdi+r13], 0
	lea	r14, 32[r12]
	lea	rbp, 32[rbx]
	mov	r13, QWORD PTR 32[r12]
	mov	r12, QWORD PTR 8[r14]
	mov	r8, r13
	lea	rdi, 16[rbp]
	add	r8, r12
	mov	QWORD PTR 0[rbp], rdi
	mov	rbx, rbp
	je	.L247
	test	r13, r13
	je	.L266
.L247:
	mov	QWORD PTR 32[rsp], r12
	cmp	r12, 15
	ja	.L281
	cmp	r12, 1
	jne	.L282
	movzx	r9d, BYTE PTR 0[r13]
	mov	BYTE PTR 16[rbp], r9b
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L217:
	test	r13, r13
	je	.L218
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L281:
	mov	rsi, QWORD PTR 16[rsp]
	xor	edx, edx
	mov	rdi, rbp
.LEHB5:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	mov	r10, QWORD PTR 32[rsp]
	mov	QWORD PTR 0[rbp], rax
	mov	QWORD PTR 16[rbp], r10
	mov	rdi, rax
.L272:
	mov	rdx, r12
	mov	rsi, r13
	call	memcpy@PLT
	mov	r12, QWORD PTR 32[rsp]
	mov	rdi, QWORD PTR 0[rbp]
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L280:
	mov	rsi, QWORD PTR 16[rsp]
	xor	edx, edx
	mov	rdi, rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	mov	QWORD PTR [rbx], rax
	mov	rdi, rax
	mov	rax, QWORD PTR 32[rsp]
	mov	QWORD PTR 16[rbx], rax
.L216:
	mov	rdx, r13
	mov	rsi, rbp
	call	memcpy@PLT
	mov	r13, QWORD PTR 32[rsp]
	mov	rdi, QWORD PTR [rbx]
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L278:
	test	r12, r12
	je	.L244
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L277:
	mov	r14, QWORD PTR 24[rsp]
	mov	rsi, QWORD PTR 16[rsp]
	xor	edx, edx
	mov	rdi, r14
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	mov	rcx, QWORD PTR 32[rsp]
	mov	QWORD PTR [r14], rax
	mov	QWORD PTR 16[r14], rcx
	mov	rdi, rax
.L269:
	mov	rdx, r12
	mov	rsi, r13
	call	memcpy@PLT
	mov	rdi, QWORD PTR 24[rsp]
	mov	r12, QWORD PTR 32[rsp]
	mov	rdi, QWORD PTR [rdi]
	jmp	.L244
	.p2align 4,,10
	.p2align 3
.L212:
	mov	QWORD PTR [rdi], 0
	mov	QWORD PTR 16[rdi], 0
	xor	ebx, ebx
	jmp	.L213
.L266:
	lea	rdi, .LC0[rip]
	call	_ZSt19__throw_logic_errorPKc@PLT
.LEHE5:
.L276:
	lea	rdi, .LC3[rip]
.LEHB6:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE6:
.L279:
	call	__stack_chk_fail@PLT
.L228:
	mov	rbx, QWORD PTR 24[rsp]
	jmp	.L213
.L231:
	endbr64
	mov	rdi, rax
	jmp	.L220
.L229:
	endbr64
	mov	rbx, rax
	jmp	.L225
.L220:
	vzeroupper
	call	__cxa_begin_catch@PLT
.L223:
	cmp	rbx, QWORD PTR 24[rsp]
	jne	.L283
.LEHB7:
	call	__cxa_rethrow@PLT
.LEHE7:
.L224:
	vzeroupper
	call	__cxa_end_catch@PLT
.L225:
	mov	rdi, QWORD PTR [r15]
	test	rdi, rdi
	je	.L273
	vzeroupper
	call	_ZdlPv@PLT
.L226:
	mov	rdi, rbx
.LEHB8:
	call	_Unwind_Resume@PLT
.LEHE8:
.L283:
	mov	r11, QWORD PTR 24[rsp]
	mov	rdi, QWORD PTR [r11]
	add	r11, 16
	cmp	rdi, r11
	je	.L222
	call	_ZdlPv@PLT
.L222:
	add	QWORD PTR 24[rsp], 32
	jmp	.L223
.L273:
	vzeroupper
	jmp	.L226
.L230:
	endbr64
	mov	rbx, rax
	jmp	.L224
	.cfi_endproc
.LFE2674:
	.section	.gcc_except_table
	.align 4
.LLSDA2674:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT2674-.LLSDATTD2674
.LLSDATTD2674:
	.byte	0x1
	.uleb128 .LLSDACSE2674-.LLSDACSB2674
.LLSDACSB2674:
	.uleb128 .LEHB4-.LFB2674
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L229-.LFB2674
	.uleb128 0
	.uleb128 .LEHB5-.LFB2674
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L231-.LFB2674
	.uleb128 0x1
	.uleb128 .LEHB6-.LFB2674
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L229-.LFB2674
	.uleb128 0
	.uleb128 .LEHB7-.LFB2674
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L230-.LFB2674
	.uleb128 0
	.uleb128 .LEHB8-.LFB2674
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
.LLSDACSE2674:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT2674:
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC5ESt16initializer_listIS5_ERKS6_,comdat
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1ESt16initializer_listIS5_ERKS6_
	.set	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1ESt16initializer_listIS5_ERKS6_,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ESt16initializer_listIS5_ERKS6_
	.section	.rodata.str1.1
.LC4:
	.string	"\342\224\214"
.LC5:
	.string	"\342\224\220"
.LC6:
	.string	"\342\224\224"
.LC7:
	.string	"\342\224\230"
.LC8:
	.string	"\342\224\200"
.LC9:
	.string	"\342\224\202"
.LC10:
	.string	"GNU GENERAL PUBLIC LICENSE"
.LC11:
	.string	"Version 3, 29 June 2007"
.LC12:
	.string	" "
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"ASM_VOWELS64 helps compare different implementations of the"
	.align 8
.LC14:
	.string	"product of two square matrices"
	.align 8
.LC15:
	.string	"Copyright (C) 2019  Jean-Michel RICHER"
	.align 8
.LC16:
	.string	"This program is free software: you can redistribute it and/or modify"
	.align 8
.LC17:
	.string	"it under the terms of the GNU General Public License as published by"
	.align 8
.LC18:
	.string	"the Free Software Foundation, either version 3 of the License, or"
	.align 8
.LC19:
	.string	"(at your option) any later version."
	.align 8
.LC20:
	.string	"This program is distributed in the hope that it will be useful,"
	.align 8
.LC21:
	.string	"but WITHOUT ANY WARRANTY; without even the implied warranty of"
	.align 8
.LC22:
	.string	"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
	.align 8
.LC23:
	.string	"GNU General Public License for more details."
	.align 8
.LC24:
	.string	"You should have received a copy of the GNU General Public License"
	.align 8
.LC25:
	.string	"along with this program.  If not, see <https://www.gnu.org/licenses/>"
	.align 8
.LC26:
	.string	"Contact: jean-michel.richer@univ-angers.fr"
	.section	.rodata.str1.1
.LC27:
	.string	"ASM_VOWELS64"
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"This program comes with ABSOLUTELY NO WARRANTY; for details type `-h'"
	.align 8
.LC29:
	.string	"This is free software, and you are welcome to redistribute it"
	.align 8
.LC30:
	.string	"under certain conditions; type `-c' for details."
	.section	.text.unlikely
.LCOLDB31:
	.section	.text.startup
.LHOTB31:
	.p2align 4
	.type	_Z41__static_initialization_and_destruction_0ii.constprop.0, @function
_Z41__static_initialization_and_destruction_0ii.constprop.0:
.LFB2903:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2903
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	lea	rdi, _ZStL8__ioinit[rip]
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 792
	.cfi_def_cfa_offset 848
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 776[rsp], rax
	xor	eax, eax
.LEHB9:
	call	_ZNSt8ios_base4InitC1Ev@PLT
	mov	rdi, QWORD PTR _ZNSt8ios_base4InitD1Ev@GOTPCREL[rip]
	lea	rdx, __dso_handle[rip]
	lea	rsi, _ZStL8__ioinit[rip]
	call	__cxa_atexit@PLT
	lea	rsi, .LC4[rip]
	lea	rdi, _ZL3ulc[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	mov	rbp, QWORD PTR _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@GOTPCREL[rip]
	lea	rdx, __dso_handle[rip]
	mov	rdi, rbp
	lea	rsi, _ZL3ulc[rip]
	call	__cxa_atexit@PLT
	lea	rsi, .LC5[rip]
	lea	rdi, _ZL3urc[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdx, __dso_handle[rip]
	mov	rdi, rbp
	lea	rsi, _ZL3urc[rip]
	call	__cxa_atexit@PLT
	lea	rsi, .LC6[rip]
	lea	rdi, _ZL3blc[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdx, __dso_handle[rip]
	mov	rdi, rbp
	lea	rsi, _ZL3blc[rip]
	call	__cxa_atexit@PLT
	lea	rsi, .LC7[rip]
	lea	rdi, _ZL3brc[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdx, __dso_handle[rip]
	mov	rdi, rbp
	lea	rsi, _ZL3brc[rip]
	call	__cxa_atexit@PLT
	lea	rsi, .LC8[rip]
	lea	rdi, _ZL3hln[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdx, __dso_handle[rip]
	mov	rdi, rbp
	lea	rsi, _ZL3hln[rip]
	call	__cxa_atexit@PLT
	lea	rsi, .LC9[rip]
	lea	rdi, _ZL3vln[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rbx, 32[rsp]
	lea	rdx, __dso_handle[rip]
	mov	rdi, rbp
	lea	rsi, _ZL3vln[rip]
	call	__cxa_atexit@PLT
	lea	r15, 64[rsp]
	lea	rsi, .LC10[rip]
	mov	rdi, rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	r14, 96[rsp]
	lea	rsi, .LC11[rip]
	mov	rdi, r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	r13, 128[rsp]
	lea	rsi, .LC12[rip]
	mov	rdi, r14
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rbp, 160[rsp]
	lea	rsi, .LC13[rip]
	mov	rdi, r13
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rsi, .LC14[rip]
	mov	rdi, rbp
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 192[rsp]
	lea	rsi, .LC12[rip]
	mov	QWORD PTR 8[rsp], rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 224[rsp]
	lea	rsi, .LC15[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 256[rsp]
	lea	rsi, .LC12[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 288[rsp]
	lea	rsi, .LC16[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 320[rsp]
	lea	rsi, .LC17[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 352[rsp]
	lea	rsi, .LC18[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 384[rsp]
	lea	rsi, .LC19[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 416[rsp]
	lea	rsi, .LC12[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 448[rsp]
	lea	rsi, .LC20[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 480[rsp]
	lea	rsi, .LC21[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 512[rsp]
	lea	rsi, .LC22[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 544[rsp]
	lea	rsi, .LC23[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 576[rsp]
	lea	rsi, .LC12[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 608[rsp]
	lea	rsi, .LC24[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 640[rsp]
	lea	rsi, .LC25[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 672[rsp]
	lea	rsi, .LC12[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rdi, 704[rsp]
	lea	rsi, .LC26[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	r12, 31[rsp]
	lea	rdi, 736[rsp]
	lea	rsi, .LC12[rip]
	mov	QWORD PTR [rsp], rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
.LEHE9:
	mov	rcx, r12
	mov	rsi, rbx
	mov	edx, 23
	lea	rdi, _Z11gpl_stringsB5cxx11[rip]
.LEHB10:
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1ESt16initializer_listIS5_ERKS6_
.LEHE10:
	mov	rsi, QWORD PTR [rsp]
	jmp	.L291
	.p2align 4,,10
	.p2align 3
.L310:
	mov	QWORD PTR [rsp], rsi
	call	_ZdlPv@PLT
	mov	rax, QWORD PTR [rsp]
	lea	rcx, -32[rax]
	cmp	rbx, rax
	je	.L289
.L290:
	mov	rsi, rcx
.L291:
	mov	rdi, QWORD PTR [rsi]
	lea	rdx, 16[rsi]
	cmp	rdi, rdx
	jne	.L310
	lea	rcx, -32[rsi]
	cmp	rbx, rsi
	jne	.L290
.L289:
	lea	rdx, __dso_handle[rip]
	lea	rsi, _Z11gpl_stringsB5cxx11[rip]
	lea	rdi, _ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev[rip]
	call	__cxa_atexit@PLT
	lea	rsi, .LC27[rip]
	mov	rdi, rbx
.LEHB11:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rsi, .LC15[rip]
	mov	rdi, r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rsi, .LC28[rip]
	mov	rdi, r14
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rsi, .LC29[rip]
	mov	rdi, r13
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	lea	rsi, .LC30[rip]
	mov	rdi, rbp
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
.LEHE11:
	mov	rcx, r12
	mov	rsi, rbx
	mov	edx, 5
	lea	rdi, _Z14header_stringsB5cxx11[rip]
.LEHB12:
	call	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1ESt16initializer_listIS5_ERKS6_
.LEHE12:
	mov	r15, QWORD PTR 8[rsp]
.L296:
	sub	r15, 32
	mov	rdi, QWORD PTR [r15]
	lea	r8, 16[r15]
	cmp	rdi, r8
	je	.L295
	call	_ZdlPv@PLT
.L295:
	cmp	r15, rbx
	jne	.L296
	mov	rax, QWORD PTR 776[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L311
	add	rsp, 792
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	lea	rdx, __dso_handle[rip]
	lea	rsi, _Z14header_stringsB5cxx11[rip]
	lea	rdi, _ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev[rip]
	pop	r15
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
.L311:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L301:
	endbr64
	mov	r14, rax
	jmp	.L293
.L302:
	endbr64
	mov	r14, rax
	jmp	.L286
	.section	.gcc_except_table
.LLSDA2903:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2903-.LLSDACSB2903
.LLSDACSB2903:
	.uleb128 .LEHB9-.LFB2903
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB10-.LFB2903
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L302-.LFB2903
	.uleb128 0
	.uleb128 .LEHB11-.LFB2903
	.uleb128 .LEHE11-.LEHB11
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB12-.LFB2903
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L301-.LFB2903
	.uleb128 0
.LLSDACSE2903:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC2903
	.type	_Z41__static_initialization_and_destruction_0ii.constprop.0.cold, @function
_Z41__static_initialization_and_destruction_0ii.constprop.0.cold:
.LFSB2903:
.L293:
	.cfi_def_cfa_offset 848
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	mov	r13, QWORD PTR 8[rsp]
	vzeroupper
.L294:
	sub	r13, 32
	mov	rdi, QWORD PTR 0[r13]
	lea	r9, 16[r13]
	cmp	rdi, r9
	je	.L299
	call	_ZdlPv@PLT
.L299:
	cmp	r13, rbx
	jne	.L294
.L309:
	mov	rdi, r14
.LEHB13:
	call	_Unwind_Resume@PLT
.LEHE13:
.L286:
	lea	rbp, 768[rsp]
	vzeroupper
.L287:
	sub	rbp, 32
	mov	rdi, QWORD PTR 0[rbp]
	lea	r10, 16[rbp]
	cmp	rdi, r10
	je	.L298
	call	_ZdlPv@PLT
.L298:
	cmp	rbp, rbx
	je	.L309
	jmp	.L287
	.cfi_endproc
.LFE2903:
	.section	.gcc_except_table
.LLSDAC2903:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC2903-.LLSDACSBC2903
.LLSDACSBC2903:
	.uleb128 .LEHB13-.LCOLDB31
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSEC2903:
	.section	.text.unlikely
	.section	.text.startup
	.size	_Z41__static_initialization_and_destruction_0ii.constprop.0, .-_Z41__static_initialization_and_destruction_0ii.constprop.0
	.section	.text.unlikely
	.size	_Z41__static_initialization_and_destruction_0ii.constprop.0.cold, .-_Z41__static_initialization_and_destruction_0ii.constprop.0.cold
.LCOLDE31:
	.section	.text.startup
.LHOTE31:
	.p2align 4
	.type	_GLOBAL__sub_I__Z11gpl_stringsB5cxx11, @function
_GLOBAL__sub_I__Z11gpl_stringsB5cxx11:
.LFB2892:
	.cfi_startproc
	endbr64
	jmp	_Z41__static_initialization_and_destruction_0ii.constprop.0
	.cfi_endproc
.LFE2892:
	.size	_GLOBAL__sub_I__Z11gpl_stringsB5cxx11, .-_GLOBAL__sub_I__Z11gpl_stringsB5cxx11
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z11gpl_stringsB5cxx11
	.globl	_Z14header_stringsB5cxx11
	.bss
	.align 16
	.type	_Z14header_stringsB5cxx11, @object
	.size	_Z14header_stringsB5cxx11, 24
_Z14header_stringsB5cxx11:
	.zero	24
	.globl	_Z11gpl_stringsB5cxx11
	.align 16
	.type	_Z11gpl_stringsB5cxx11, @object
	.size	_Z11gpl_stringsB5cxx11, 24
_Z11gpl_stringsB5cxx11:
	.zero	24
	.local	_ZL3vln
	.comm	_ZL3vln,32,32
	.local	_ZL3hln
	.comm	_ZL3hln,32,32
	.local	_ZL3brc
	.comm	_ZL3brc,32,32
	.local	_ZL3blc
	.comm	_ZL3blc,32,32
	.local	_ZL3urc
	.comm	_ZL3urc,32,32
	.local	_ZL3ulc
	.comm	_ZL3ulc,32,32
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
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
