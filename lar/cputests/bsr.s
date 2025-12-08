	.file	"bsr.cpp"
	.intel_syntax noprefix
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1394:
	.cfi_startproc
	endbr32
	movzx	eax, BYTE PTR 8[esp]
	ret
	.cfi_endproc
.LFE1394:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.globl	_Z12function_bsrj
	.type	_Z12function_bsrj, @function
_Z12function_bsrj:
.LFB1986:
	.cfi_startproc
	endbr32
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	mov	eax, 31
	mov	ebx, DWORD PTR 8[esp]
	mov	ecx, 1
	jmp	.L6
	.p2align 4
	.p2align 3
.L10:
	sub	eax, 1
	jb	.L9
.L6:
	shlx	edx, ecx, eax
	test	edx, ebx
	je	.L10
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4
	.p2align 3
.L9:
	.cfi_restore_state
	mov	eax, 255
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE1986:
	.size	_Z12function_bsrj, .-_Z12function_bsrj
	.p2align 4
	.globl	_Z8method_1Pjj
	.type	_Z8method_1Pjj, @function
_Z8method_1Pjj:
.LFB1987:
	.cfi_startproc
	endbr32
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
	mov	eax, DWORD PTR 24[esp]
	test	eax, eax
	je	.L17
	mov	ebx, DWORD PTR 20[esp]
	xor	esi, esi
	mov	ecx, 1
	lea	edi, [ebx+eax*4]
	.p2align 4
	.p2align 3
.L16:
	mov	ebp, DWORD PTR [ebx]
	mov	eax, 31
	jmp	.L15
	.p2align 4
	.p2align 3
.L22:
	sub	eax, 1
	jb	.L21
.L15:
	shlx	edx, ecx, eax
	test	edx, ebp
	je	.L22
	add	ebx, 4
	add	esi, eax
	cmp	ebx, edi
	jne	.L16
.L11:
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	mov	eax, esi
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
	.p2align 4
	.p2align 3
.L21:
	.cfi_restore_state
	mov	eax, 255
	add	ebx, 4
	add	esi, eax
	cmp	ebx, edi
	jne	.L16
	jmp	.L11
.L17:
	xor	esi, esi
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	mov	eax, esi
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
.LFE1987:
	.size	_Z8method_1Pjj, .-_Z8method_1Pjj
	.p2align 4
	.globl	_Z8method_2Pjj
	.type	_Z8method_2Pjj, @function
_Z8method_2Pjj:
.LFB1988:
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
	je	.L26
	mov	eax, DWORD PTR 16[esp]
	mov	esi, 31
	lea	edi, [eax+edx*4]
	xor	edx, edx
	.p2align 4
	.p2align 3
.L25:
	mov	ecx, esi
	lzcnt	ebx, DWORD PTR [eax]
	add	eax, 4
	sub	ecx, ebx
	add	edx, ecx
	cmp	edi, eax
	jne	.L25
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	mov	eax, edx
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4
	.p2align 3
.L26:
	.cfi_restore_state
	xor	edx, edx
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	mov	eax, edx
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE1988:
	.size	_Z8method_2Pjj, .-_Z8method_2Pjj
	.p2align 4
	.globl	_Z8method_3Pjj
	.type	_Z8method_3Pjj, @function
_Z8method_3Pjj:
.LFB1989:
	.cfi_startproc
	endbr32
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	mov	edx, DWORD PTR 12[esp]
	test	edx, edx
	je	.L32
	mov	eax, DWORD PTR 8[esp]
	xor	ecx, ecx
	lea	ebx, [eax+edx*4]
	.p2align 4
	.p2align 3
.L31:
	mov	edx, DWORD PTR [eax]
	add	eax, 4
#APP
# 36 "src/bsr.cpp" 1
	bsr edx, edx
# 0 "" 2
#NO_APP
	add	ecx, edx
	cmp	eax, ebx
	jne	.L31
	mov	eax, ecx
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4
	.p2align 3
.L32:
	.cfi_restore_state
	xor	ecx, ecx
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	mov	eax, ecx
	ret
	.cfi_endproc
.LFE1989:
	.size	_Z8method_3Pjj, .-_Z8method_3Pjj
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"=== TEST ==="
.LC2:
	.string	"v="
.LC3:
	.string	", "
.LC4:
	.string	" "
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4
	.globl	_Z4testv
	.type	_Z4testv, @function
_Z4testv:
.LFB1990:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1990
	endbr32
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	call	__x86.get_pc_thunk.di
	add	edi, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	ebx
	sub	esp, 80
	.cfi_offset 3, -20
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -28[ebp], eax
	xor	eax, eax
	push	12
	mov	ebx, DWORD PTR _ZSt4cout@GOT[edi]
	lea	eax, .LC0@GOTOFF[edi]
	push	eax
	mov	esi, ebx
	push	ebx
	mov	DWORD PTR -60[ebp], ebx
	mov	ebx, edi
.LEHB0:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	add	esp, 16
	mov	eax, DWORD PTR [esi]
	mov	eax, DWORD PTR -12[eax]
	mov	esi, DWORD PTR 124[eax+esi]
	test	esi, esi
	je	.L56
	cmp	BYTE PTR 28[esi], 0
	je	.L37
	movsx	eax, BYTE PTR 39[esi]
.L38:
	sub	esp, 8
	mov	ebx, edi
	push	eax
	push	DWORD PTR -60[ebp]
	call	_ZNSo3putEc@PLT
	mov	DWORD PTR [esp], eax
	call	_ZNSo5flushEv@PLT
	vmovdqa	xmm0, XMMWORD PTR .LC1@GOTOFF[edi]
	mov	DWORD PTR [esp], 24
	mov	DWORD PTR -40[ebp], 2147483647
	mov	DWORD PTR -36[ebp], -1
	vmovdqa	XMMWORD PTR -56[ebp], xmm0
	call	_Znwj@PLT
.LEHE0:
	add	esp, 16
	mov	ecx, eax
	mov	DWORD PTR -88[ebp], eax
	mov	eax, DWORD PTR -56[ebp]
	mov	DWORD PTR -64[ebp], ecx
	mov	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR -52[ebp]
	mov	DWORD PTR 4[ecx], eax
	mov	eax, DWORD PTR -48[ebp]
	mov	DWORD PTR 8[ecx], eax
	mov	eax, DWORD PTR -44[ebp]
	mov	DWORD PTR 12[ecx], eax
	mov	eax, DWORD PTR -40[ebp]
	mov	DWORD PTR 16[ecx], eax
	mov	eax, DWORD PTR -36[ebp]
	mov	DWORD PTR 20[ecx], eax
	mov	eax, ecx
	add	eax, 24
	mov	DWORD PTR -76[ebp], eax
	lea	eax, .LC2@GOTOFF[edi]
	mov	DWORD PTR -80[ebp], eax
	lea	eax, .LC3@GOTOFF[edi]
	mov	DWORD PTR -84[ebp], eax
	lea	eax, .LC4@GOTOFF[edi]
	mov	DWORD PTR -72[ebp], eax
	.p2align 4
	.p2align 3
.L45:
	mov	eax, DWORD PTR -64[ebp]
	sub	esp, 4
	mov	ebx, edi
	mov	esi, DWORD PTR [eax]
	push	2
	push	DWORD PTR -80[ebp]
	push	DWORD PTR -60[ebp]
.LEHB1:
	.cfi_escape 0x2e,0x10
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	ecx
	pop	eax
	push	esi
	push	DWORD PTR -60[ebp]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	esp, 12
	mov	DWORD PTR -68[ebp], eax
	push	2
	push	DWORD PTR -84[ebp]
	push	eax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	eax
	tzcnt	eax, esi
	pop	edx
	push	eax
	push	DWORD PTR -68[ebp]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	esp, 12
	push	1
	push	DWORD PTR -72[ebp]
	push	DWORD PTR -60[ebp]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	edx
	pop	ecx
	bsr	eax, esi
	push	eax
	push	DWORD PTR -60[ebp]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	esp, 12
	push	1
	push	DWORD PTR -72[ebp]
	push	DWORD PTR -60[ebp]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	add	esp, 16
	mov	eax, 31
	mov	ecx, 1
	jmp	.L41
	.p2align 4
	.p2align 3
.L58:
	sub	eax, 1
	jb	.L57
.L41:
	shlx	edx, ecx, eax
	test	edx, esi
	je	.L58
.L40:
	mov	esi, DWORD PTR -60[ebp]
	sub	esp, 8
	mov	ebx, edi
	push	eax
	push	esi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	mov	eax, DWORD PTR [esi]
	add	esp, 16
	mov	eax, DWORD PTR -12[eax]
	mov	esi, DWORD PTR 124[eax+esi]
	test	esi, esi
	je	.L59
	cmp	BYTE PTR 28[esi], 0
	je	.L43
	movsx	eax, BYTE PTR 39[esi]
.L44:
	sub	esp, 8
	mov	ebx, edi
	push	eax
	push	DWORD PTR -60[ebp]
	call	_ZNSo3putEc@PLT
	mov	DWORD PTR [esp], eax
	call	_ZNSo5flushEv@PLT
	add	DWORD PTR -64[ebp], 4
	add	esp, 16
	mov	eax, DWORD PTR -64[ebp]
	cmp	eax, DWORD PTR -76[ebp]
	jne	.L45
	sub	esp, 8
	push	24
	push	DWORD PTR -88[ebp]
	call	_ZdlPvj@PLT
	add	esp, 16
	mov	eax, DWORD PTR -28[ebp]
	sub	eax, DWORD PTR gs:20
	jne	.L60
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
.L43:
	.cfi_restore_state
	sub	esp, 12
	mov	ebx, edi
	push	esi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	eax, DWORD PTR [esi]
	lea	ecx, _ZNKSt5ctypeIcE8do_widenEc@GOTOFF[edi]
	add	esp, 16
	mov	edx, DWORD PTR 24[eax]
	mov	eax, 10
	cmp	edx, ecx
	je	.L44
	sub	esp, 8
	push	10
	push	esi
	call	edx
.LEHE1:
	add	esp, 16
	movsx	eax, al
	jmp	.L44
	.p2align 4
	.p2align 3
.L57:
	mov	eax, 255
	jmp	.L40
.L37:
	sub	esp, 12
	push	esi
.LEHB2:
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	eax, DWORD PTR [esi]
	lea	ecx, _ZNKSt5ctypeIcE8do_widenEc@GOTOFF[edi]
	add	esp, 16
	mov	edx, DWORD PTR 24[eax]
	mov	eax, 10
	cmp	edx, ecx
	je	.L38
	sub	esp, 8
	push	10
	push	esi
	call	edx
.LEHE2:
	movsx	eax, al
	add	esp, 16
	jmp	.L38
.L59:
	mov	ebx, edi
.LEHB3:
	.cfi_escape 0x2e,0
	call	_ZSt16__throw_bad_castv@PLT
.LEHE3:
.L56:
.LEHB4:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE4:
.L60:
	call	__stack_chk_fail_local
.L50:
	endbr32
	mov	esi, eax
	jmp	.L46
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1990:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1990-.LLSDACSB1990
.LLSDACSB1990:
	.uleb128 .LEHB0-.LFB1990
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1990
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L50-.LFB1990
	.uleb128 0
	.uleb128 .LEHB2-.LFB1990
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB1990
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L50-.LFB1990
	.uleb128 0
	.uleb128 .LEHB4-.LFB1990
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE1990:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC1990
	.type	_Z4testv.cold, @function
_Z4testv.cold:
.LFSB1990:
.L46:
	.cfi_def_cfa 5, 8
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	push	eax
	push	eax
	mov	ebx, edi
	push	24
	push	DWORD PTR -88[ebp]
	vzeroupper
	call	_ZdlPvj@PLT
	mov	DWORD PTR [esp], esi
.LEHB5:
	call	_Unwind_Resume@PLT
.LEHE5:
	.cfi_endproc
.LFE1990:
	.section	.gcc_except_table
.LLSDAC1990:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC1990-.LLSDACSBC1990
.LLSDACSBC1990:
	.uleb128 .LEHB5-.LCOLDB5
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSEC1990:
	.section	.text.unlikely
	.text
	.size	_Z4testv, .-_Z4testv
	.section	.text.unlikely
	.size	_Z4testv.cold, .-_Z4testv.cold
.LCOLDE5:
	.text
.LHOTE5:
	.section	.rodata.str1.1
.LC6:
	.string	"sum="
	.section	.text.unlikely
.LCOLDB7:
	.section	.text.startup,"ax",@progbits
.LHOTB7:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1991:
	.cfi_startproc
	endbr32
	lea	ecx, 4[esp]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	mov	ebp, esp
	push	edi
	push	esi
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	call	__x86.get_pc_thunk.si
	add	esi, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	ebx
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	sub	esp, 36
	mov	edi, DWORD PTR [ecx]
	mov	ebx, esi
	mov	DWORD PTR -32[ebp], esi
	xor	esi, esi
	mov	DWORD PTR -28[ebp], edi
	mov	edi, DWORD PTR 4[ecx]
	push	19702013
	call	srand@PLT
	add	esp, 16
	cmp	DWORD PTR -28[ebp], 1
	jle	.L62
	push	esi
	push	10
	push	0
	push	DWORD PTR 4[edi]
	call	strtol@PLT
	add	esp, 16
	mov	esi, eax
.L62:
	mov	ebx, DWORD PTR -32[ebp]
	sub	esp, 12
	push	4000000
	call	_Znaj@PLT
	mov	DWORD PTR -40[ebp], esi
	add	esp, 16
	mov	edi, eax
	mov	DWORD PTR -36[ebp], eax
	lea	eax, 4000000[eax]
	mov	DWORD PTR -28[ebp], eax
	mov	esi, eax
	.p2align 4
	.p2align 3
.L63:
	mov	ebx, DWORD PTR -32[ebp]
	add	edi, 4
	call	rand@PLT
	and	eax, 1048575
	inc	eax
	mov	DWORD PTR -4[edi], eax
	cmp	esi, edi
	jne	.L63
	mov	esi, DWORD PTR -40[ebp]
	cmp	esi, 4
	ja	.L81
	mov	eax, DWORD PTR -32[ebp]
	add	eax, DWORD PTR .L66@GOTOFF[eax+esi*4]
	notrack jmp	eax
	.section	.rodata
	.align 4
	.align 4
.L66:
	.long	.L70@GOTOFF
	.long	.L82@GOTOFF
	.long	.L83@GOTOFF
	.long	.L84@GOTOFF
	.long	.L85@GOTOFF
	.section	.text.startup
.L84:
	mov	ebx, DWORD PTR -28[ebp]
	mov	edi, DWORD PTR -36[ebp]
	mov	ecx, 1000
	.p2align 4
	.p2align 3
.L67:
	mov	eax, edi
	xor	esi, esi
	.p2align 4
	.p2align 3
.L76:
	mov	edx, DWORD PTR [eax]
	add	eax, 4
#APP
# 36 "src/bsr.cpp" 1
	bsr edx, edx
# 0 "" 2
#NO_APP
	add	esi, edx
	cmp	ebx, eax
	jne	.L76
	dec	ecx
	jne	.L67
.L64:
	mov	ebx, DWORD PTR -32[ebp]
	sub	esp, 4
	push	4
	mov	edi, DWORD PTR _ZSt4cout@GOT[ebx]
	lea	eax, .LC6@GOTOFF[ebx]
	push	eax
	push	edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@PLT
	pop	edx
	pop	ecx
	push	esi
	push	edi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	esp, 16
	mov	esi, eax
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR -12[eax]
	mov	edi, DWORD PTR 124[esi+eax]
	test	edi, edi
	je	.L104
	cmp	BYTE PTR 28[edi], 0
	je	.L78
	movzx	eax, BYTE PTR 39[edi]
.L79:
	mov	ebx, DWORD PTR -32[ebp]
	sub	esp, 8
	movsx	eax, al
	push	eax
	push	esi
	call	_ZNSo3putEc@PLT
	mov	DWORD PTR [esp], eax
	call	_ZNSo5flushEv@PLT
	add	esp, 16
	lea	esp, -16[ebp]
	pop	ecx
	.cfi_remember_state
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	xor	eax, eax
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
.L83:
	.cfi_restore_state
	mov	edi, 1000
	mov	ebx, 31
	mov	DWORD PTR -40[ebp], edi
	mov	edi, DWORD PTR -28[ebp]
	.p2align 4
	.p2align 3
.L68:
	mov	eax, DWORD PTR -36[ebp]
	xor	esi, esi
	.p2align 4
	.p2align 3
.L75:
	mov	edx, ebx
	lzcnt	ecx, DWORD PTR [eax]
	add	eax, 4
	sub	edx, ecx
	add	esi, edx
	cmp	edi, eax
	jne	.L75
	dec	DWORD PTR -40[ebp]
	jne	.L68
	jmp	.L64
.L82:
	mov	DWORD PTR -40[ebp], 1000
	mov	ebx, 1
	.p2align 4
	.p2align 3
.L69:
	mov	edi, DWORD PTR -36[ebp]
	xor	esi, esi
	.p2align 4
	.p2align 3
.L74:
	mov	ecx, DWORD PTR [edi]
	mov	eax, 31
	jmp	.L73
	.p2align 4
	.p2align 3
.L106:
	sub	eax, 1
	jb	.L105
.L73:
	shlx	edx, ebx, eax
	test	edx, ecx
	je	.L106
	add	esi, eax
	add	edi, 4
	cmp	DWORD PTR -28[ebp], edi
	jne	.L74
.L107:
	dec	DWORD PTR -40[ebp]
	jne	.L69
	jmp	.L64
.L85:
	mov	esi, DWORD PTR -36[ebp]
	mov	edi, 1000
	.p2align 4
	.p2align 3
.L65:
	mov	ebx, DWORD PTR -32[ebp]
	sub	esp, 8
	push	1000000
	push	esi
	call	method_4@PLT
	add	esp, 16
	dec	edi
	jne	.L65
	mov	esi, eax
	jmp	.L64
	.p2align 4
	.p2align 3
.L105:
	mov	eax, 255
	add	edi, 4
	add	esi, eax
	cmp	DWORD PTR -28[ebp], edi
	jne	.L74
	jmp	.L107
.L78:
	mov	ebx, DWORD PTR -32[ebp]
	sub	esp, 12
	push	edi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	eax, DWORD PTR [edi]
	lea	ecx, _ZNKSt5ctypeIcE8do_widenEc@GOTOFF[ebx]
	add	esp, 16
	mov	edx, DWORD PTR 24[eax]
	mov	eax, 10
	cmp	edx, ecx
	je	.L79
	push	eax
	push	eax
	push	10
	push	edi
	call	edx
	add	esp, 16
	jmp	.L79
.L70:
	call	_Z4testv
	xor	esi, esi
	jmp	.L64
.L104:
	mov	ebx, DWORD PTR -32[ebp]
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB1991:
.L81:
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	.cfi_escape 0x10,0x5,0x2,0x75,0
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	xor	esi, esi
	jmp	.L64
	.cfi_endproc
.LFE1991:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE7:
	.section	.text.startup
.LHOTE7:
	.p2align 4
	.type	_GLOBAL__sub_I__Z12function_bsrj, @function
_GLOBAL__sub_I__Z12function_bsrj:
.LFB2580:
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
.LFE2580:
	.size	_GLOBAL__sub_I__Z12function_bsrj, .-_GLOBAL__sub_I__Z12function_bsrj
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I__Z12function_bsrj
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB2588:
	.cfi_startproc
	mov	ebx, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE2588:
	.section	.text.__x86.get_pc_thunk.si,"axG",@progbits,__x86.get_pc_thunk.si,comdat
	.globl	__x86.get_pc_thunk.si
	.hidden	__x86.get_pc_thunk.si
	.type	__x86.get_pc_thunk.si, @function
__x86.get_pc_thunk.si:
.LFB2589:
	.cfi_startproc
	mov	esi, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE2589:
	.section	.text.__x86.get_pc_thunk.di,"axG",@progbits,__x86.get_pc_thunk.di,comdat
	.globl	__x86.get_pc_thunk.di
	.hidden	__x86.get_pc_thunk.di
	.type	__x86.get_pc_thunk.di, @function
__x86.get_pc_thunk.di:
.LFB2590:
	.cfi_startproc
	mov	edi, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE2590:
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 4
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 4
DW.ref.__gxx_personality_v0:
	.long	__gxx_personality_v0
	.hidden	__dso_handle
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0"
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
