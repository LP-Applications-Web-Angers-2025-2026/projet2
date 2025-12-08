global prod1
global prod2
global prod3

section .text

; -------------------------------------------------------------------
; compute  sum of floating point values in simple precision
; with dependencies i.e. same register xmm0
; -------------------------------------------------------------------
prod1:
	push	ebp
	mov		ebp, esp
	push	ebx
	mov		ebx, [ebp+8]
	mov		edx, [ebp+12]
	xorps	xmm0, xmm0
	xor		ecx, ecx
.for_i:
	cmp		ecx, edx
	jge		.endfor_i
	addss	xmm0, [ebx + ecx*4 + 0]
	addss	xmm0, [ebx + ecx*4 + 4]
	addss	xmm0, [ebx + ecx*4 + 8]	
	addss	xmm0, [ebx + ecx*4 + 12]
	addss	xmm0, [ebx + ecx*4 + 16]
	addss	xmm0, [ebx + ecx*4 + 20]
	addss	xmm0, [ebx + ecx*4 + 24]	
	addss	xmm0, [ebx + ecx*4 + 28]
	add		ecx, 8
	jmp		.for_i
.endfor_i:	
	sub		esp,4
	movss	[esp], xmm0
	fld		dword [esp]
	add		esp, 4
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret

; -------------------------------------------------------------------
; compute  sum of floating point values in simple precision
; by removing dependencies i.e. with registers xmm0 to xmm3
; -------------------------------------------------------------------
prod2:
	push	ebp
	mov		ebp, esp
	push	ebx
	mov		ebx, [ebp+8]
	mov		edx, [ebp+12]
	xorps	xmm0, xmm0
	xorps	xmm1, xmm1
	xorps	xmm2, xmm2
	xorps	xmm3, xmm3
	xor		ecx, ecx
.for_i:
	cmp		ecx, edx
	jge		.endfor_i
	addss	xmm0, [ebx + ecx*4 + 0]
	addss	xmm1, [ebx + ecx*4 + 4]
	addss	xmm2, [ebx + ecx*4 + 8]	
	addss	xmm3, [ebx + ecx*4 + 12]
	addss	xmm0, [ebx + ecx*4 + 16]
	addss	xmm1, [ebx + ecx*4 + 20]
	addss	xmm2, [ebx + ecx*4 + 24]	
	addss	xmm3, [ebx + ecx*4 + 28]
	add		ecx, 8
	jmp		.for_i
.endfor_i:	
	addss	xmm0, xmm1
	addss	xmm2, xmm3
	addss	xmm0, xmm2
	sub		esp,4
	movss	[esp], xmm0
	fld		dword [esp]
	add		esp, 4
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret	


; -------------------------------------------------------------------
; compute  sum of floating point values in simple precision
; by removing dependencies i.e. with registers xmm0 to xmm7
; -------------------------------------------------------------------
prod3:
	push	ebp
	mov		ebp, esp
	push	ebx
	mov		ebx, [ebp+8]
	mov		edx, [ebp+12]
	xorps	xmm0, xmm0
	xorps	xmm1, xmm1
	xorps	xmm2, xmm2
	xorps	xmm3, xmm3
	xorps	xmm4, xmm4
	xorps	xmm5, xmm5
	xorps	xmm6, xmm6
	xorps	xmm7, xmm7
	xor		ecx, ecx
.for_i:
	cmp		ecx, edx
	jge		.endfor_i
	addss	xmm0, [ebx + ecx*4 + 0]
	addss	xmm1, [ebx + ecx*4 + 4]
	addss	xmm2, [ebx + ecx*4 + 8]	
	addss	xmm3, [ebx + ecx*4 + 12]
	addss	xmm4, [ebx + ecx*4 + 16]
	addss	xmm5, [ebx + ecx*4 + 20]
	addss	xmm6, [ebx + ecx*4 + 24]	
	addss	xmm7, [ebx + ecx*4 + 28]
	add		ecx, 8
	jmp		.for_i
.endfor_i:	
	addss	xmm0, xmm1
	addss	xmm2, xmm3
	addss	xmm4, xmm5
	addss	xmm6, xmm7
	
	addss	xmm0, xmm2
	addss	xmm4, xmm6
	addss	xmm0, xmm4
	
	sub		esp,4
	movss	[esp], xmm0
	fld		dword [esp]
	add		esp, 4
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret	


