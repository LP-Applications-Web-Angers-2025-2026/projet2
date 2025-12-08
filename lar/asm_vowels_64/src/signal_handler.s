	.file	"signal_handler.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0, @function
_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0:
.LFB1922:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	test	rsi, rsi
	je	.L5
	mov	rdi, rsi
	mov	rbp, rsi
	call	strlen@PLT
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	rsi, rbp
	pop	rbp
	.cfi_def_cfa_offset 16
	mov	rdi, r12
	mov	rdx, rax
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L5:
	.cfi_restore_state
	mov	rax, QWORD PTR [rdi]
	mov	rdi, QWORD PTR -24[rax]
	add	rdi, r12
	mov	esi, DWORD PTR 32[rdi]
	pop	rax
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	or	esi, 1
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
	.cfi_endproc
.LFE1922:
	.size	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0, .-_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"error SIGSEGV: Segmentation Fault\n"
	.align 8
.LC1:
	.string	"error SIGINT: Interactive attention signal, (usually ctrl+c)\n"
	.align 8
.LC2:
	.string	"error SIGFPE: (integer divide by zero)\n"
	.align 8
.LC3:
	.string	"error SIGFPE: (integer overflow)\n"
	.align 8
.LC4:
	.string	"error SIGFPE: (floating-point divide by zero)\n"
	.align 8
.LC5:
	.string	"error SIGFPE: (floating-point overflow)\n"
	.align 8
.LC6:
	.string	"error SIGFPE: (floating-point underflow)\n"
	.align 8
.LC7:
	.string	"error SIGFPE: (floating-point inexact result)\n"
	.align 8
.LC8:
	.string	"error SIGFPE: (floating-point invalid operation)\n"
	.align 8
.LC9:
	.string	"error SIGFPE: (subscript out of range)\n"
	.align 8
.LC10:
	.string	"error SIGFPE: Arithmetic Exception\n"
	.align 8
.LC11:
	.string	"error SIGILL: (illegal opcode)\n"
	.align 8
.LC12:
	.string	"error SIGILL: (illegal operand)\n"
	.align 8
.LC13:
	.string	"error SIGILL: (illegal addressing mode)\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC14:
	.string	"error SIGILL: (illegal trap)\n"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"error SIGILL: (privileged opcode)\n"
	.align 8
.LC16:
	.string	"error SIGILL: (privileged register)\n"
	.align 8
.LC17:
	.string	"error SIGILL: (coprocessor error)\n"
	.align 8
.LC18:
	.string	"error SIGILL: (internal stack error)\n"
	.align 8
.LC19:
	.string	"error SIGILL: Illegal Instruction\n"
	.align 8
.LC20:
	.string	"error SIGTERM: a termination request was sent to the program\n"
	.align 8
.LC21:
	.string	"error SIGABRT: usually caused by an abort() or assert()\n"
	.text
	.p2align 4
	.globl	_Z20posix_signal_handleriP9siginfo_tPv
	.type	_Z20posix_signal_handleriP9siginfo_tPv, @function
_Z20posix_signal_handleriP9siginfo_tPv:
.LFB1582:
	.cfi_startproc
	endbr64
	push	rax
	.cfi_def_cfa_offset 16
	pop	rax
	.cfi_def_cfa_offset 8
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	cmp	edi, 15
	ja	.L7
	lea	rdx, .L9[rip]
	mov	edi, edi
	movsx	rax, DWORD PTR [rdx+rdi*4]
	add	rax, rdx
	notrack jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L9:
	.long	.L7-.L9
	.long	.L7-.L9
	.long	.L14-.L9
	.long	.L7-.L9
	.long	.L13-.L9
	.long	.L7-.L9
	.long	.L12-.L9
	.long	.L7-.L9
	.long	.L11-.L9
	.long	.L7-.L9
	.long	.L7-.L9
	.long	.L10-.L9
	.long	.L7-.L9
	.long	.L7-.L9
	.long	.L7-.L9
	.long	.L8-.L9
	.text
.L10:
	lea	rsi, .LC0[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	.p2align 4,,10
	.p2align 3
.L7:
	mov	edi, 1
	call	exit@PLT
.L8:
	lea	rsi, .LC20[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L14:
	lea	rsi, .LC1[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L13:
	mov	r9d, DWORD PTR 8[rsi]
	dec	r9d
	cmp	r9d, 7
	ja	.L25
	lea	r10, .L27[rip]
	movsx	r11, DWORD PTR [r10+r9*4]
	add	r11, r10
	notrack jmp	r11
	.section	.rodata
	.align 4
	.align 4
.L27:
	.long	.L34-.L27
	.long	.L33-.L27
	.long	.L32-.L27
	.long	.L31-.L27
	.long	.L30-.L27
	.long	.L29-.L27
	.long	.L28-.L27
	.long	.L26-.L27
	.text
.L12:
	lea	rsi, .LC21[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L11:
	mov	ecx, DWORD PTR 8[rsi]
	dec	ecx
	cmp	ecx, 7
	ja	.L15
	lea	rsi, .L17[rip]
	movsx	r8, DWORD PTR [rsi+rcx*4]
	add	r8, rsi
	notrack jmp	r8
	.section	.rodata
	.align 4
	.align 4
.L17:
	.long	.L24-.L17
	.long	.L23-.L17
	.long	.L22-.L17
	.long	.L21-.L17
	.long	.L20-.L17
	.long	.L19-.L17
	.long	.L18-.L17
	.long	.L16-.L17
	.text
.L18:
	lea	rsi, .LC8[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L19:
	lea	rsi, .LC7[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L20:
	lea	rsi, .LC6[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L21:
	lea	rsi, .LC5[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L22:
	lea	rsi, .LC4[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L23:
	lea	rsi, .LC3[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L24:
	lea	rsi, .LC2[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L16:
	lea	rsi, .LC9[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L28:
	lea	rsi, .LC17[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L29:
	lea	rsi, .LC16[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L30:
	lea	rsi, .LC15[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L31:
	lea	rsi, .LC14[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L32:
	lea	rsi, .LC13[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L33:
	lea	rsi, .LC12[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L34:
	lea	rsi, .LC11[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L26:
	lea	rsi, .LC18[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L15:
	lea	rsi, .LC10[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
.L25:
	lea	rsi, .LC19[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	jmp	.L7
	.cfi_endproc
.LFE1582:
	.size	_Z20posix_signal_handleriP9siginfo_tPv, .-_Z20posix_signal_handleriP9siginfo_tPv
	.section	.rodata.str1.1
.LC22:
	.string	"sigaction"
	.text
	.p2align 4
	.globl	_Z18set_signal_handlerv
	.type	_Z18set_signal_handlerv, @function
_Z18set_signal_handlerv:
.LFB1583:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xor	edx, edx
	sub	rsp, 160
	.cfi_def_cfa_offset 176
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 152[rsp], rax
	xor	eax, eax
	lea	rdi, 8[rsp]
.L37:
	mov	ecx, eax
	add	eax, 32
	mov	QWORD PTR 8[rsp+rcx], rdx
	mov	QWORD PTR 16[rsp+rcx], rdx
	mov	QWORD PTR 24[rsp+rcx], rdx
	mov	QWORD PTR 32[rsp+rcx], rdx
	cmp	eax, 128
	jb	.L37
	add	rax, rdi
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	lea	rsi, _Z20posix_signal_handleriP9siginfo_tPv[rip]
	mov	rbp, rsp
	mov	QWORD PTR [rsp], rsi
	call	sigemptyset@PLT
	xor	edx, edx
	mov	rsi, rbp
	mov	edi, 11
	mov	DWORD PTR 136[rsp], 134217732
	call	sigaction@PLT
	test	eax, eax
	jne	.L40
	xor	edx, edx
	mov	rsi, rbp
	mov	edi, 8
	call	sigaction@PLT
	test	eax, eax
	jne	.L40
	xor	edx, edx
	mov	rsi, rbp
	mov	edi, 2
	call	sigaction@PLT
	test	eax, eax
	jne	.L40
	xor	edx, edx
	mov	rsi, rbp
	mov	edi, 4
	call	sigaction@PLT
	test	eax, eax
	jne	.L40
	xor	edx, edx
	mov	rsi, rbp
	mov	edi, 15
	call	sigaction@PLT
	test	eax, eax
	jne	.L40
	xor	edx, edx
	mov	rsi, rbp
	mov	edi, 6
	call	sigaction@PLT
	test	eax, eax
	jne	.L40
	mov	rax, QWORD PTR 152[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L45
	add	rsp, 160
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L40:
	.cfi_restore_state
	lea	rsi, .LC22[rip]
	mov	edi, 1
	xor	eax, eax
	call	err@PLT
.L45:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1583:
	.size	_Z18set_signal_handlerv, .-_Z18set_signal_handlerv
	.align 2
	.p2align 4
	.globl	_ZN13SignalHandlerC2Ev
	.type	_ZN13SignalHandlerC2Ev, @function
_ZN13SignalHandlerC2Ev:
.LFB1585:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	call	_Z18set_signal_handlerv
	mov	edi, 5
	add	rsp, 8
	.cfi_def_cfa_offset 8
	jmp	feenableexcept@PLT
	.cfi_endproc
.LFE1585:
	.size	_ZN13SignalHandlerC2Ev, .-_ZN13SignalHandlerC2Ev
	.globl	_ZN13SignalHandlerC1Ev
	.set	_ZN13SignalHandlerC1Ev,_ZN13SignalHandlerC2Ev
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__Z20posix_signal_handleriP9siginfo_tPv, @function
_GLOBAL__sub_I__Z20posix_signal_handleriP9siginfo_tPv:
.LFB1920:
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
.LFE1920:
	.size	_GLOBAL__sub_I__Z20posix_signal_handleriP9siginfo_tPv, .-_GLOBAL__sub_I__Z20posix_signal_handleriP9siginfo_tPv
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z20posix_signal_handleriP9siginfo_tPv
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
