%include "src/asm_config.inc"

global cv_letters_asm
global cv_letters_asm_ur4_v1
global cv_letters_asm_ur4_v2
global cv_letters_asm_ur8_v1
global cv_letters_asm_ur8_v2
global cv_letters_asm_ur8_v3

; -------------------------------------------------------------------
; basic translation of C function cv_letters(u8 *s, u32 size, u32 v[6])
; rdi = s
; rsi = size
; rdx = &v[0]
; rbx = letters
; rcx = i
; we perform a simple loop
; -------------------------------------------------------------------
cv_letters_asm:
	mov		[rsp - 8], rbx
	lea		rbx, [rsp - (8 + 4*26) ]
	and		rbx, ~(32-1)	; rbx multiple of 32 
							; to bottom of stack
							; (red zone)
	xor		rax, rax	

;	%assign i 0
;	%rep 13
;	mov		[rbx + i], rax
;	%assign i i + 8
;	%endrep

%ifdef CPU_AVX2_COMPLIANT
	vpxor	ymm0, ymm0
	vmovdqa	[rbx], ymm0			; 26-8
	vmovdqa	[rbx + 32], ymm0	; 26-16
	vmovdqa	[rbx + 64], ymm0	; 26-24
	vzeroupper
	mov		[rbx + 96], rax		; 26-24
%else
	xor		eax, eax
	mov		r8, rdi	
	mov		rdi, rbx
	mov		ecx, 13
	rep 	stosq
	mov		rdi, r8
%endif	
	
	test	esi, esi		; if (size == 0) 
	jz		.end_while		;	goto .end_while
	xor		ecx, ecx

align 16	
.while:
	movzx	eax, byte [rdi + rcx]	; s[i]
	sub		eax, 'a'				; s[i] - 'a'
	inc		dword [rbx + rax * 4]	;++letters[ s[i]-'a' ]
	inc		rcx						; ++i
	;add		rcx, 1

	cmp		rcx, rsi				; if (i < size)

	jne		.while					;	goto .while
.end_while:


	mov		r9, 'a'-'a'				; store number of occurences
	mov		eax, [rbx + r9 * 4]		;  of 'a' into v[0]
	mov		[rdx], eax

	mov		r9, 'e'-'a'				; store number of occurences
	mov		eax, [rbx + r9 * 4]		;  of 'e' into v[0]
	mov		[rdx + 4], eax

	mov		r9, 'i'-'a'				; store number of occurences
	mov		eax, [rbx + r9 * 4]		;  of 'i' into v[0]
	mov		[rdx + 8], eax

	mov		r9, 'o'-'a'				; store number of occurences
	mov		eax, [rbx + r9 * 4]		;  of 'o' into v[0]
	mov		[rdx + 12], eax

	mov		r9, 'u'-'a'				; store number of occurences
	mov		eax, [rbx + r9 * 4]		;  of 'u' into v[0]
	mov		[rdx + 16], eax

	mov		r9, 'y'-'a'				; store number of occurences
	mov		eax, [rbx + r9 * 4]		;  of 'y' into v[0]
	mov		[rdx + 20], eax
	
	mov		rbx, [rsp - 8]			; restore rbx
	ret

; -------------------------------------------------------------------
; basic translation of C function cv_letters(u8 *s, u32 size, u32 v[6])
; with loop unrolling of 4
; rdi = s
; rsi = size or size multiple of 4
; rdx = &v[0]
; rbx = letters
; rcx = i
; -------------------------------------------------------------------
cv_letters_asm_ur4_v1:
	mov		[rsp - 8], rbx		; save rbx
	mov		[rsp - 16], rsi		; save rsi = size
	
	lea		rbx, [rsp - (16 + 4*26)]
	and		rbx, ~(32-1)		; rbx multiple of 32
	xor		rax, rax
	
;	%assign i 0
;	%rep 13
;	mov		[rbx + i], rax
;	%assign i i + 8
;	%endrep

%ifdef CPU_AVX2_COMPLIANT
	vpxor	ymm0, ymm0
	vmovdqa	[rbx], ymm0			; 26-8
	vmovdqa	[rbx + 32], ymm0	; 26-16
	vmovdqa	[rbx + 64], ymm0	; 26-24
	vzeroupper
	mov		[rbx + 96], rax		; 26-24
%else
	xor		eax, eax
	mov		r8, rdi	
	mov		rdi, rbx
	mov		ecx, 13
	rep 	stosq
	mov		rdi, r8
%endif	
	
	test	esi, esi
	jz		.end_while
	xor		ecx, ecx
	
	and		esi, ~3
.while_ur4:	
	movzx	eax, byte [rdi + rcx]	
	sub		eax, 'a'
	cdqe
	inc		dword [rbx + rax * 4]

	movzx	eax, byte [rdi + rcx + 1]	
	sub		eax, 'a'
	cdqe
	inc		dword [rbx + rax * 4]
	
	movzx	eax, byte [rdi + rcx + 2]	
	sub		eax, 'a'
	cdqe
	inc		dword [rbx + rax * 4]

	movzx	eax, byte [rdi + rcx + 3]	
	sub		eax, 'a'
	cdqe
	inc		dword [rbx + rax * 4]
	
	add		ecx, 4
	cmp		ecx, esi
	jl		.while_ur4
.end_while_ur4:
	
	mov		rsi, [rsp - 16]
	cmp		ecx, esi
	jge		.end_while
	
.while:
	movzx	eax, byte [rdi + rcx]	
	inc		ecx
	sub		eax, 'a'
	cdqe
	inc		dword [rbx + rax * 4]
	cmp		ecx, esi
	jl		.while
.end_while:

	mov		r9, 'a'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx], eax

	mov		r9, 'e'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 4], eax

	mov		r9, 'i'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 8], eax

	mov		r9, 'o'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 12], eax

	mov		r9, 'u'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 16], eax

	mov		r9, 'y'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 20], eax
	
	mov		rsi, [rsp - 16]
	mov		rbx, [rsp - 8]
	ret

; -------------------------------------------------------------------
; basic translation of C function cv_letters(u8 *s, u32 size, u32 v[6])
; with loop unrolling of 4
; and usage of several registers
; rdi = s
; rsi = size or size multiple of 4
; rdx = &v[0]
; rbx = letters
; rcx = i
; -------------------------------------------------------------------
cv_letters_asm_ur4_v2:
	mov		[rsp - 8], rbx
	mov		[rsp - 16], rsi
	lea		rbx, [rsp - (16 + 4*26)]
	and		rbx, ~(32-1)
	xor		rax, rax
	
;	%assign i 0
;	%rep 13
;	mov		[rbx + i], rax
;	%assign i i + 8
;	%endrep

%ifdef CPU_AVX2_COMPLIANT
	vpxor	ymm0, ymm0
	vmovdqa	[rbx], ymm0			; 26-8
	vmovdqa	[rbx + 32], ymm0	; 26-16
	vmovdqa	[rbx + 64], ymm0	; 26-24
	vzeroupper
	mov		[rbx + 96], rax		; 26-24
%else
	xor		eax, eax
	mov		r8, rdi	
	mov		rdi, rbx
	mov		ecx, 13
	rep 	stosq
	mov		rdi, r8
%endif	
	
	test	esi, esi
	jz		.end_while
	xor		ecx, ecx
	
	and		esi, ~3
.while_ur4:	
	mov		eax,  dword [rdi + rcx]	
	add		ecx, 4
	
	movzx	r8, al
	shr		eax, 8
	movzx	r9, al
	shr		eax, 8
	movzx	r10, al
	shr		eax, 8
	
	sub		eax, 'a'
	sub		r8,  'a'
	sub		r9,  'a'
	sub		r10, 'a'
	
	inc		dword [rbx + rax * 4]
	inc		dword [rbx + r8 * 4]
	inc		dword [rbx + r9 * 4]
	inc		dword [rbx + r10 * 4]
	
	cmp		ecx, esi
	jl		.while_ur4
.end_while_ur4:
	
	mov		rsi, [rsp - 16]
	cmp		ecx, esi
	jge		.end_while
	
.while:
	movzx	eax, byte [rdi + rcx]	
	inc		ecx
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]
	cmp		ecx, esi
	jl		.while
.end_while:

	mov		r9, 'a'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx], eax

	mov		r9, 'e'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 4], eax

	mov		r9, 'i'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 8], eax

	mov		r9, 'o'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 12], eax

	mov		r9, 'u'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 16], eax

	mov		r9, 'y'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 20], eax
	
	mov		rsi, [rsp - 16]
	mov		rbx, [rsp - 8]
	ret


; -------------------------------------------------------------------
; basic translation of C function cv_letters(u8 *s, u32 size, u32 v[6])
; with loop unrolling of 8
; and usage of several registers
; rdi = s
; rsi = size or size multiple of 4
; rdx = &v[0]
; rbx = letters
; rcx = i
; -------------------------------------------------------------------
cv_letters_asm_ur8_v1:
	mov		[rsp - 8], rbx
	mov		[rsp - 16], rsi
	lea		rbx, [rsp - (16 + 4*26)]
	and		rbx, ~(32-1)
	xor		rax, rax
	
;	%assign i 0
;	%rep 13
;	mov		[rbx + i], rax
;	%assign i i + 8
;	%endrep

%ifdef CPU_AVX2_COMPLIANT
	vpxor	ymm0, ymm0
	vmovdqa	[rbx], ymm0			; 26-8
	vmovdqa	[rbx + 32], ymm0	; 26-16
	vmovdqa	[rbx + 64], ymm0	; 26-24
	vzeroupper
	mov		[rbx + 96], rax		; 26-24
%else
	xor		eax, eax
	mov		r8, rdi	
	mov		rdi, rbx
	mov		ecx, 13
	rep 	stosq
	mov		rdi, r8
%endif	
	
	test	esi, esi
	jz		.end_while
	xor		ecx, ecx
	
	and		esi, ~7
.while_ur8:	
	movzx	eax, byte [rdi + rcx]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]

	movzx	eax, byte [rdi + rcx + 1]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]
	
	movzx	eax, byte [rdi + rcx + 2]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]

	movzx	eax, byte [rdi + rcx + 3]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]
	
	movzx	eax, byte [rdi + rcx + 4]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]

	movzx	eax, byte [rdi + rcx + 5]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]
	
	movzx	eax, byte [rdi + rcx + 6]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]

	movzx	eax, byte [rdi + rcx + 7]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]
	
	add		ecx, 8
	cmp		ecx, esi
	jl		.while_ur8
.end_while_ur8:
	
	mov		rsi, [rsp - 16]
	cmp		ecx, esi
	jge		.end_while
	
.while:
	movzx	eax, byte [rdi + rcx]	
	inc		ecx
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]
	cmp		ecx, esi
	jl		.while
.end_while:

	mov		r9, 'a'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx], eax

	mov		r10, 'e'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 4], r11d

	mov		r9, 'i'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 8], eax

	mov		r10, 'o'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 12], r11d

	mov		r9, 'u'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 16], eax

	mov		r10, 'y'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 20], r11d
	
	mov		rsi, [rsp - 16]
	mov		rbx, [rsp - 8]
	ret


; -------------------------------------------------------------------
; basic translation of C function cv_letters(u8 *s, u32 size, u32 v[6])
; with loop unrolling of 8
; and usage of several registers
; rdi = s
; rsi = size or size multiple of 4
; rdx = &v[0]
; rbx = letters
; rcx = i
; -------------------------------------------------------------------
cv_letters_asm_ur8_v2:
	mov		[rsp - 8], rbx
	mov		[rsp - 16], rsi
	lea		rbx, [rsp - (16 + 4*26)]
	and		rbx, ~(32-1)
	xor		rax, rax
	
;	%assign i 0
;	%rep 13
;	mov		[rbx + i], rax
;	%assign i i + 8
;	%endrep

%ifdef CPU_AVX2_COMPLIANT
	vpxor	ymm0, ymm0
	vmovdqa	[rbx], ymm0			; 26-8
	vmovdqa	[rbx + 32], ymm0	; 26-16
	vmovdqa	[rbx + 64], ymm0	; 26-24
	vzeroupper
	mov		[rbx + 96], rax		; 26-24
%else
	xor		eax, eax
	mov		r8, rdi	
	mov		rdi, rbx
	mov		ecx, 13
	rep 	stosq
	mov		rdi, r8
%endif	
	
	test	esi, esi
	jz		.end_while
	xor		ecx, ecx
	
	and		esi, ~7
.while_ur8:	
	mov		eax,  dword [rdi + rcx]	
	add		ecx, 4
	
	movzx	r8d, al
	shr		eax, 8
	movzx	r9d, al
	shr		eax, 8
	movzx	r10d, al
	shr		eax, 8
	
	sub		eax, 'a'
	sub		r8d, 'a'
	sub		r9d, 'a'
	sub		r10d, 'a'
	
	inc		dword [rbx + rax * 4]
	inc		dword [rbx + r8 * 4]
	inc		dword [rbx + r9 * 4]
	inc		dword [rbx + r10 * 4]

	mov		eax,  dword [rdi + rcx]	
	add		ecx, 4
	
	movzx	r8d, al
	shr		eax, 8
	movzx	r9d, al
	shr		eax, 8
	movzx	r10d, al
	shr		eax, 8
	
	sub		eax, 'a'
	sub		r8d, 'a'
	sub		r9d, 'a'
	sub		r10d, 'a'
	
	inc		dword [rbx + rax * 4]
	inc		dword [rbx + r8 * 4]
	inc		dword [rbx + r9 * 4]
	inc		dword [rbx + r10 * 4]
	
	cmp		ecx, esi
	jl		.while_ur8
.end_while_ur8:
	
	mov		rsi, [rsp - 16]
	cmp		ecx, esi
	jge		.end_while
	
.while:
	movzx	eax, byte [rdi + rcx]	
	inc		ecx
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]
	cmp		ecx, esi
	jl		.while
.end_while:

	mov		r9, 'a'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx], eax

	mov		r10, 'e'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 4], r11d

	mov		r9, 'i'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 8], eax

	mov		r10, 'o'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 12], r11d

	mov		r9, 'u'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 16], eax

	mov		r10, 'y'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 20], r11d
	
	mov		rsi, [rsp - 16]
	mov		rbx, [rsp - 8]
	ret
	
; -------------------------------------------------------------------
; basic translation of C function cv_letters(u8 *s, u32 size, u32 v[6])
; with loop unrolling of 8
; like v1 but with no dependency
; rdi = s
; rsi = size or size multiple of 4
; rdx = &v[0]
; rbx = letters
; rcx = i
; -------------------------------------------------------------------
cv_letters_asm_ur8_v3:
	mov		[rsp - 8], rbx
	mov		[rsp - 16], rsi
	lea		rbx, [rsp - (16 + 4*26)]
	and		rbx, ~(32-1)
	xor		rax, rax
	
;	%assign i 0
;	%rep 13
;	mov		[rbx + i], rax
;	%assign i i + 8
;	%endrep

%ifdef CPU_AVX2_COMPLIANT
	vpxor	ymm0, ymm0
	vmovdqa	[rbx], ymm0			; 26-8
	vmovdqa	[rbx + 32], ymm0	; 26-16
	vmovdqa	[rbx + 64], ymm0	; 26-24
	vzeroupper
	mov		[rbx + 96], rax		; 26-24
%else
	xor		eax, eax
	mov		r8, rdi	
	mov		rdi, rbx
	mov		ecx, 13
	rep 	stosq
	mov		rdi, r8
%endif	
	
	test	esi, esi
	jz		.end_while
	xor		ecx, ecx
	
	and		esi, ~7
.while_ur8:	
	movzx	eax, byte [rdi + rcx]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]

	movzx	r8d, byte [rdi + rcx + 1]	
	sub		r8d, 'a'
	inc		dword [rbx + r8 * 4]
	
	movzx	r9d, byte [rdi + rcx + 2]	
	sub		r9d, 'a'
	inc		dword [rbx + r9 * 4]

	movzx	r10d, byte [rdi + rcx + 3]	
	sub		r10d, 'a'
	inc		dword [rbx + r10 * 4]
	
	movzx	eax, byte [rdi + rcx + 4]	
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]

	movzx	r8d, byte [rdi + rcx + 5]	
	sub		r8d, 'a'
	inc		dword [rbx + r8 * 4]
	
	movzx	r9d, byte [rdi + rcx + 6]	
	sub		r9d, 'a'
	inc		dword [rbx + r9 * 4]

	movzx	r10d, byte [rdi + rcx + 7]	
	sub		r10d, 'a'
	inc		dword [rbx + r10 * 4]
	
	add		ecx, 8
	cmp		ecx, esi
	jl		.while_ur8
.end_while_ur8:
	
	mov		rsi, [rsp - 16]
	cmp		ecx, esi
	jge		.end_while
	
.while:
	movzx	eax, byte [rdi + rcx]	
	inc		ecx
	sub		eax, 'a'
	inc		dword [rbx + rax * 4]
	cmp		ecx, esi
	jl		.while
.end_while:

	mov		r9, 'a'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx], eax

	mov		r10, 'e'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 4], r11d

	mov		r9, 'i'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 8], eax

	mov		r10, 'o'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 12], r11d

	mov		r9, 'u'-'a'
	mov		eax, [rbx + r9 * 4]
	mov		[rdx + 16], eax

	mov		r10, 'y'-'a'
	mov		r11d, [rbx + r10 * 4]
	mov		[rdx + 20], r11d
	
	mov		rsi, [rsp - 16]
	mov		rbx, [rsp - 8]
	ret	
