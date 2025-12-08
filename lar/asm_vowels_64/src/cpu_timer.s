	.file	"cpu_timer.cpp"
	.intel_syntax noprefix
	.text
	.align 2
	.p2align 4
	.globl	_ZN8CPUTimerC2Ev
	.type	_ZN8CPUTimerC2Ev, @function
_ZN8CPUTimerC2Ev:
.LFB1582:
	.cfi_startproc
	endbr64
	xor	eax, eax
	mov	WORD PTR 24[rdi], ax
	ret
	.cfi_endproc
.LFE1582:
	.size	_ZN8CPUTimerC2Ev, .-_ZN8CPUTimerC2Ev
	.globl	_ZN8CPUTimerC1Ev
	.set	_ZN8CPUTimerC1Ev,_ZN8CPUTimerC2Ev
	.align 2
	.p2align 4
	.globl	_ZN8CPUTimer5startEv
	.type	_ZN8CPUTimer5startEv, @function
_ZN8CPUTimer5startEv:
.LFB1584:
	.cfi_startproc
	endbr64
	mov	BYTE PTR 24[rdi], 1
	add	rdi, 8
	jmp	cpu_rdtsc_read@PLT
	.cfi_endproc
.LFE1584:
	.size	_ZN8CPUTimer5startEv, .-_ZN8CPUTimer5startEv
	.align 2
	.p2align 4
	.globl	_ZN8CPUTimer4stopEv
	.type	_ZN8CPUTimer4stopEv, @function
_ZN8CPUTimer4stopEv:
.LFB1585:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi
	lea	rdi, 16[rdi]
	call	cpu_rdtsc_read@PLT
	mov	BYTE PTR 25[rbx], 1
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1585:
	.size	_ZN8CPUTimer4stopEv, .-_ZN8CPUTimer4stopEv
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"start() method not called"
.LC1:
	.string	"stop() method not called"
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB2:
	.text
.LHOTB2:
	.align 2
	.p2align 4
	.globl	_ZN8CPUTimer5printERSo
	.type	_ZN8CPUTimer5printERSo, @function
_ZN8CPUTimer5printERSo:
.LFB1586:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1586
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	cmp	BYTE PTR 24[rdi], 0
	je	.L13
	cmp	BYTE PTR 25[rdi], 0
	je	.L14
	mov	rdi, rsi
	mov	rsi, QWORD PTR 16[rbx]
	sub	rsi, QWORD PTR 8[rbx]
	mov	QWORD PTR [rbx], rsi
.LEHB0:
	call	_ZNSo9_M_insertImEERSoT_@PLT
.LEHE0:
	xor	eax, eax
	mov	WORD PTR 24[rbx], ax
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1586:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1586-.LLSDACSB1586
.LLSDACSB1586:
	.uleb128 .LEHB0-.LFB1586
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
.LLSDACSE1586:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC1586
	.type	_ZN8CPUTimer5printERSo.cold, @function
_ZN8CPUTimer5printERSo.cold:
.LFSB1586:
.L13:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	mov	edi, 16
	call	__cxa_allocate_exception@PLT
	mov	rdi, rax
	lea	rsi, .LC0[rip]
	mov	r12, rax
.LEHB1:
	call	_ZNSt11logic_errorC1EPKc@PLT
.LEHE1:
	mov	rdx, QWORD PTR _ZNSt11logic_errorD1Ev@GOTPCREL[rip]
	lea	rsi, _ZTISt11logic_error[rip]
	mov	rdi, r12
.LEHB2:
	call	__cxa_throw@PLT
.LEHE2:
.L14:
	mov	edi, 16
	call	__cxa_allocate_exception@PLT
	mov	rdi, rax
	lea	rsi, .LC1[rip]
	mov	r12, rax
.LEHB3:
	call	_ZNSt11logic_errorC1EPKc@PLT
.LEHE3:
	mov	rdx, QWORD PTR _ZNSt11logic_errorD1Ev@GOTPCREL[rip]
	lea	rsi, _ZTISt11logic_error[rip]
	mov	rdi, r12
.LEHB4:
	call	__cxa_throw@PLT
.L11:
	endbr64
	mov	rbx, rax
	mov	rdi, r12
	vzeroupper
	call	__cxa_free_exception@PLT
	mov	rdi, rbx
	call	_Unwind_Resume@PLT
.L12:
	endbr64
	mov	rbp, rax
	mov	rdi, r12
	vzeroupper
	call	__cxa_free_exception@PLT
	mov	rdi, rbp
	call	_Unwind_Resume@PLT
.LEHE4:
	.cfi_endproc
.LFE1586:
	.section	.gcc_except_table
.LLSDAC1586:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC1586-.LLSDACSBC1586
.LLSDACSBC1586:
	.uleb128 .LEHB1-.LCOLDB2
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L11-.LCOLDB2
	.uleb128 0
	.uleb128 .LEHB2-.LCOLDB2
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LCOLDB2
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L12-.LCOLDB2
	.uleb128 0
	.uleb128 .LEHB4-.LCOLDB2
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSEC1586:
	.section	.text.unlikely
	.text
	.size	_ZN8CPUTimer5printERSo, .-_ZN8CPUTimer5printERSo
	.section	.text.unlikely
	.size	_ZN8CPUTimer5printERSo.cold, .-_ZN8CPUTimer5printERSo.cold
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__ZN8CPUTimerC2Ev, @function
_GLOBAL__sub_I__ZN8CPUTimerC2Ev:
.LFB1918:
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
.LFE1918:
	.size	_GLOBAL__sub_I__ZN8CPUTimerC2Ev, .-_GLOBAL__sub_I__ZN8CPUTimerC2Ev
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__ZN8CPUTimerC2Ev
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
