global maxpars_asm
global maxpars_no_if_asm

section .text

; RDI = x
; RSI = y
; RDX = z
; RCX = size
; R9  = i 
; RAX = mutations
maxpars_asm:
	xor		eax, eax	; mutations = 0
	test	ecx, ecx
	jz		.end

	mov		[rsp-16], r12
	xor		r9, r9	
.for:
	movzx	r10d, byte [rdi + r9]		
	movzx	r12d, byte [rsi + r9]
	mov		r11d, r10d
	and		r10d, r12d
	jnz		.next
	mov		r10d, r11d
	or		r10d, r12d
	add		eax, 1
.next:
	mov		[rdx + r9], r10b
	inc		r9d
	cmp		r9, rcx
	jl		.for

	mov		r12, [rsp-16]
.end:
	ret
	
; RDI = x
; RSI = y
; RDX = z
; RCX = size
; R9  = i 
; RAX = mutations
maxpars_no_if_asm:
	
	xor		eax, eax	; mutations = 0
	test	ecx, ecx
	jz		.end

	mov		[rsp-16], r12
	xor		r8, r8
	xor		r9, r9	
.for:
	movzx	r10d, byte [rdi + r9]		
	movzx	r12d, byte [rsi + r9]
	mov		r11d, r10d
	or		r11d, r12d
	and		r10d, r12d
	sete	r8b
	cmovz	r10d, r11d
	add		eax, r8d
	mov		[rdx + r9], r10b
	inc		r9d
	cmp		r9, rcx
	jl		.for
	
	mov		r12, [rsp-16]
	
.end:
	
	ret	

