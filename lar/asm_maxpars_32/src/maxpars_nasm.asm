global maxpars_asm
global maxpars_no_if_asm
global maxpars_no_if_opt_asm
global maxpars_no_if_opt_ur4_asm
global maxpars_no_if_opt_ur8_asm

section .text

; =============================
maxpars_asm:
	push	ebp
	mov		ebp, esp

	mov		eax, [ebp + 20] ; if (size == 0) return 0
	test	eax, eax
	jz		.end
	
	push	esi				; save registers
	push	edi
	push	ebx
							; load parameters
	mov		esi, [ebp + 8]  ; x into esi
	mov		edi, [ebp + 12] ; y into edi
	mov		ebx, [ebp + 16] ; z into ebx
	
	xor		eax, eax 		; mutations = 0
	xor		ecx, ecx		; i = 0
.for:
	cmp		ecx, [ebp + 20] ; if i >= size goto .endfor
	jge		.endfor
	mov		dl, [esi + ecx] ; 
	and		dl, [edi + ecx] ; dl = x[i] & y[i]
	jnz		.endif          ; if dl != 0 goto .endif 
	mov		dl, [esi + ecx] ; 
	or		dl, [edi + ecx] ; dl = x[i] | y[i]
	inc		eax             ; ++mutations
.endif:	
	mov		[ebx + ecx], dl ; z[i] = dl
	inc		ecx             ; ++i
	jmp		.for
.endfor:	
	
	pop		ebx				; restore registers
	pop		edi
	pop		esi
	
.end:	
	mov		esp, ebp		; leave function
	pop		ebp
	ret

; =============================
; u32 maxpars_no_if_asm(u8 *x, u8 *y, u8 *z, u32 size);
; esi = x, z
; edi = y
; eax, ebx, edx = computations
; ecx = i
; !!! cmov only works with r16 or r32
;
maxpars_no_if_asm:
	push	ebp
	mov		ebp, esp
	sub		esp, 4			 ; mutations = 0
	mov		dword [ebp-4], 0 ;
	mov		eax, [ebp + 20]  ; if (size == 0) return 0
	test	eax, eax
	jz		.end
	
	push	esi				; save registers
	push	edi
	push	ebx
	
	mov		esi, [ebp + 8]  ; x ; load registers
	mov		edi, [ebp + 12] ; y
	
	xor		ecx, ecx		; i = 0
.for:
	mov		esi, [ebp+8]
	cmp		ecx, [ebp + 20]
	jge		.endfor
	movzx	edx, byte [edi + ecx]
	movzx	eax, byte [esi + ecx]
	mov		ebx, eax
	mov		esi, [ebp+16]
	or		ebx, edx
	and		eax, edx
	sete	dl
	cmovz	eax, ebx
	add		[ebp-4], edx
	mov		[esi + ecx], al	
	
	add		ecx, 1
	jmp		.for

.endfor:	
	mov		eax, [ebp-4]
	
	pop		ebx
	pop		edi
	pop		esi
.end:	
	mov		esp, ebp
	pop		ebp
	ret

; =============================
; eax, mutations
; esi = x
; edi = y, z
; edx = number of iterations
; ecx = i
; edx = computation
; ebp = computation
; ebx = x[i] & y[i] or x[i] | y[i]
;
maxpars_no_if_opt_asm:
	mov		eax, [esp + 16]
	test	eax, eax
	jz		.end

	xor		eax, eax	; mutations = 0
	
	push	ebp			; save registers
	push	esi
	push	edi
	push	ebx

	mov		esi, [esp + 20]	; x
	mov		edi, [esp + 24]	; y
	mov		ebp, [esp + 28]	; z
	
	xor		ecx, ecx		; i = 0
.for:
	movzx	ebx, byte [esi + ecx]	; bl = x[i]
	movzx	edx, byte [edi + ecx]	; dl = y|i]
	mov		edi, ebx				; edi = x[i]
	
	or		edi, edx	; edi = x[i] | y[i]
	and		ebx, edx	; ebx = x[i] & y[i]
	sete	dl			; dl = (ebx == 0) ? 1 : 0
	cmovz	ebx, edi	; ebx = (ebx == 0) ? edi : ebx
	add		eax, edx	; mutations += edx
	mov		[ebp + ecx], bl	; z[i] = bl

	mov		edi, [esp + 24]	; point to y
	add		ecx, 1			; ++i
	cmp		ecx, [esp + 32] ; exit for if i >= size
	jl		.for
	
	pop		ebx
	pop		edi
	pop		esi
	pop		ebp	
	
.end:
	ret

; =============================
; eax, mutations
; esi = x
; edi = y, z
; edx = number of iterations
; ecx = i
; edx = computation
; ebp = computation
; ebx = x[i] & y[i] or x[i] | y[i]
;
maxpars_no_if_opt_ur4_asm:
	mov		eax, [esp + 16]		; size
	test	eax, eax
	jz		.end

	xor		eax, eax	; mutations = 0
	
	push	ebp
	push	esi
	push	edi
	push	ebx

	mov		esi, [esp + 20]		; x
	mov		edi, [esp + 24]		; y
	mov		ebp, [esp + 28]		; z
	
	xor		ecx, ecx			; i = 0
	mov		edx, [esp + 32]		; size
	shr		edx, 2				; edx <- size / 4
	jz		.last_3	
	
.for_ur4:
	push	edx
	
	movzx	ebx, byte [esi + ecx]	; bl  <- x[i]
	movzx	edx, byte [edi + ecx]	; dl  <- y[i]
	mov		edi, ebx				; dil <- x[i]
	or		edi, edx				; dil <- x[i] | y[i]
	and		ebx, edx				; bl  <- x[i] & y[i] and set flags
	setz	dl						; if bl == 0 then dl = 1
	cmovz	ebx, edi				; if bl == 0 then bl <- dil
	add		eax, edx
	mov		[ebp + ecx], bl
	mov		edi, [esp + 28]			; point to y

	movzx	ebx, byte [esi + ecx + 1]
	movzx	edx, byte [edi + ecx + 1]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	setz	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 1], bl
	mov		edi, [esp + 28]	; point to y

	movzx	ebx, byte [esi + ecx + 2]
	movzx	edx, byte [edi + ecx + 2]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	setz	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 2], bl
	mov		edi, [esp + 28]	; point to y

	movzx	ebx, byte [esi + ecx + 3]
	movzx	edx, byte [edi + ecx + 3]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	setz	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 3], bl
	mov		edi, [esp + 28]	; point to y

	pop		edx
	add		ecx, 4
	dec		edx
	jnz		.for_ur4
	
.last_3:
	cmp		ecx, [esp + 32]
	je		.before_end
	
.for:
	movzx	ebx, byte [esi + ecx]
	movzx	edx, byte [edi + ecx]
	mov		edi, ebx
	
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx], bl

	mov		edi, [esp + 24]	; point to y
	add		ecx, 1
	cmp		ecx, [esp + 32]
	jl		.for

.before_end:
	pop		ebx
	pop		edi
	pop		esi
	pop		ebp	
	
.end:
	ret
	
	
; =============================
; eax, mutations
; esi = x
; edi = y, z
; edx = number of iterations
; ecx = i
; edx = computation
; ebp = computation
; ebx = x[i] & y[i] or x[i] | y[i]
;
maxpars_no_if_opt_ur8_asm:
	mov		eax, [esp + 16]
	test	eax, eax
	jz		.end

	xor		eax, eax	; mutations = 0
	
	push	ebp
	push	esi
	push	edi
	push	ebx

	mov		esi, [esp + 20]
	mov		edi, [esp + 24]
	mov		ebp, [esp + 28]
	
	xor		ecx, ecx
	mov		edx, [esp + 32]
	shr		edx, 3
	jz		.last_7	
	
.for_ur8:
	push	edx
	
	movzx	ebx, byte [esi + ecx]
	movzx	edx, byte [edi + ecx]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx], bl
	mov		edi, [esp + 28]	; point to y

	movzx	ebx, byte [esi + ecx + 1]
	movzx	edx, byte [edi + ecx + 1]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 1], bl
	mov		edi, [esp + 28]	; point to y

	movzx	ebx, byte [esi + ecx + 2]
	movzx	edx, byte [edi + ecx + 2]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 2], bl
	mov		edi, [esp + 28]	; point to y

	movzx	ebx, byte [esi + ecx + 3]
	movzx	edx, byte [edi + ecx + 3]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 3], bl
	mov		edi, [esp + 28]	; point to y

	movzx	ebx, byte [esi + ecx + 4]
	movzx	edx, byte [edi + ecx + 4]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 4], bl
	mov		edi, [esp + 28]	; point to y

	movzx	ebx, byte [esi + ecx + 5]
	movzx	edx, byte [edi + ecx + 5]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 5], bl
	mov		edi, [esp + 28]	; point to y
	
	movzx	ebx, byte [esi + ecx + 6]
	movzx	edx, byte [edi + ecx + 6]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 6], bl
	mov		edi, [esp + 28]	; point to y

	movzx	ebx, byte [esi + ecx + 7]
	movzx	edx, byte [edi + ecx + 7]
	mov		edi, ebx
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx + 7], bl
	mov		edi, [esp + 28]	; point to y

	pop		edx
	add		ecx, 8
	dec		edx
	jnz		.for_ur8

.last_7:
	cmp		ecx, [esp + 32]
	je		.before_end
	
	
.for:
	movzx	ebx, byte [esi + ecx]
	movzx	edx, byte [edi + ecx]
	mov		edi, ebx
	
	or		edi, edx
	and		ebx, edx
	sete	dl
	cmovz	ebx, edi
	add		eax, edx
	mov		[ebp + ecx], bl

	mov		edi, [esp + 24]	; point to y
	add		ecx, 1
	cmp		ecx, [esp + 32]
	jl		.for

.before_end:	
	pop		ebx
	pop		edi
	pop		esi
	pop		ebp	
	
.end:
	ret	
