global mp_asm_fpu
global mp_asm_fpu_ur4


section .text


; -------------------------------------------------------------------
; Direct translation in assembly of the reference method
; -------------------------------------------------------------------
; esi = A
; edi = B
; ebx = C
; [ebp-4] = i = eax
; [ebp-8] = j = edx
; ecx = k
mp_asm_fpu:
	push	ebp
	mov		ebp, esp
	sub		esp, 8	; i, j
	
	push	esi
	push	edi
	push	ebx
	
	mov		esi, [ebp + 8]		; esi = A
	mov		edi, [ebp + 12]		; edi = B
	mov		ebx, [ebp + 16]		; ebx = C
	
	xor		eax, eax			; i = 0
	mov		[ebp-4], eax
.for_i:
	mov		eax, [ebp-4]		; if i >= size then goto .end_for_i
	cmp		eax, [ebp + 20]
	jge		.end_for_i
	
	xor		edx, edx			; j = 0
	mov		[ebp - 8], edx
.for_j:
	mov		edx, [ebp - 8]		; if j >= size then goto .end_for_j
	cmp		edx, [ebp + 20]
	jge		.end_for_j

	mov		eax, [ebp-4]		; eax = i

	push	esi					; save registers to perform inner k loop
	push	edi
	push	ebx 
	
	lea		edi, [edi + edx * 4]; b(k=0,j)
	
	mov		ebx, [ebp + 20]		; ebx = size
	mul		ebx					; eax = i * size, edx modifié
	lea		esi, [esi + eax * 4] ; a(i,k=0)
	
	mov		eax, ebx			; eax = 4*size
	shl		eax, 2				; 
	
	fldz
	xor		ecx, ecx
.for_k:
	cmp		ecx, ebx
	jge		.end_for_k


	fld		dword [esi]
	add		esi, 4
	fmul	dword [edi]
	add		edi, eax
	
	faddp	st1, st0
	
	inc		ecx
	jmp		.for_k
.end_for_k: 

	pop		ebx
	pop		edi
	pop		esi
	
	fstp	dword [ebx]
	add		ebx, 4	
	
	inc		dword [ebp - 8]		; ++j
	jmp		.for_j
.end_for_j:
	
	inc		dword [ebp - 4]		; ++i
	jmp		.for_i
.end_for_i:

	pop		ebx
	pop		edi
	pop		esi
	
	mov		esp, ebp
	pop		ebp
	ret
	
; -------------------------------------------------------------------
; Direct translation in assembly of the reference method
; unroll k loop by 4
; -------------------------------------------------------------------
mp_asm_fpu_ur4:
	push	ebp
	mov		ebp, esp
	sub		esp, 8	; i, j
	
	push	esi
	push	edi
	push	ebx
	
	mov		esi, [ebp + 8]		; esi = A
	mov		edi, [ebp + 12]		; edi = B
	mov		ebx, [ebp + 16]		; ebx = C
	
	xor		eax, eax			; i = 0
	mov		[ebp-4], eax
.for_i:
	mov		eax, [ebp-4]		; if i >= size then goto .end_for_i
	cmp		eax, [ebp + 20]
	jge		.end_for_i
	
	xor		edx, edx			; j = 0
	mov		[ebp - 8], edx
.for_j:
	mov		edx, [ebp - 8]		; if j >= size then goto .end_for_j
	cmp		edx, [ebp + 20]
	jge		.end_for_j

	mov		eax, [ebp-4]		; eax = i

	push	esi					; save registers to perform inner k loop
	push	edi
	push	ebx 
	push	ebp
	
	lea		edi, [edi + edx * 4]; b(k=0,j)
	
	mov		ebx, [ebp + 20]		; ebx = size
	mul		ebx					; eax = i * size, edx modifié
	lea		esi, [esi + eax * 4] ; a(i,k=0)
	
	mov		eax, ebx			; eax = 4*size
	shl		eax, 2				; 
	
	mov		ebp, ebx
	and		ebp, ~3
	
	fldz
	xor		ecx, ecx
.for_k_ur4:
	cmp		ecx, ebp
	jge		.end_for_k_ur4


	fld		dword [esi]
	fmul	dword [edi]
	faddp	st1, st0

	fld		dword [esi + 4]
	fmul	dword [edi + eax]
	faddp	st1, st0

	lea		edi, [edi + eax * 2]
	
	fld		dword [esi + 8]
	fmul	dword [edi]
	faddp	st1, st0

	fld		dword [esi + 12]
	fmul	dword [edi + eax]
	faddp	st1, st0
	
	lea		edi, [edi + eax * 2]
	add		esi, 16

	add		ecx, 4
	jmp		.for_k_ur4
.end_for_k_ur4: 



.for_k:
	cmp		ecx, ebx
	jge		.end_for_k

	fld		dword [esi]
	add		esi, 4
	fmul	dword [edi]
	add		edi, eax
	faddp	st1, st0
	
	inc		ecx
	jmp		.for_k
.end_for_k: 


	pop		ebp
	pop		ebx
	pop		edi
	pop		esi
	
	fstp	dword [ebx]
	add		ebx, 4	
	
	inc		dword [ebp - 8]		; ++j
	jmp		.for_j
.end_for_j:
	
	inc		dword [ebp - 4]		; ++i
	jmp		.for_i
.end_for_i:

	pop		ebx
	pop		edi
	pop		esi
	
	mov		esp, ebp
	pop		ebp
	ret	
