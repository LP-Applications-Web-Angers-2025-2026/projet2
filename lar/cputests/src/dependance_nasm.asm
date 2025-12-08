global prod1
global prod2
global prod3
global prod4
global prod5
global prod6
global prod7

section .text

; -------------------------------------------------------------------
; compute  sum of floating point values in simple precision
; with dependancies i.e. same register xmm0
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
; by removing dependancies i.e. with registers xmm0 to xmm3
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
; by removing dependancies i.e. with registers xmm0 to xmm7
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

; -------------------------------------------------------------------
; compute  sum of floating point values in simple precision
; by removing dependancies i.e. with registers xmm0 to xmm7
; with AVX
; -------------------------------------------------------------------
prod4:
	push	ebp
	mov		ebp, esp
	push	ebx
	mov		ebx, [ebp+8]
	mov		edx, [ebp+12]
	vxorps	xmm0, xmm0
	vxorps	xmm1, xmm1
	vxorps	xmm2, xmm2
	vxorps	xmm3, xmm3
	vxorps	xmm4, xmm4
	vxorps	xmm5, xmm5
	vxorps	xmm6, xmm6
	vxorps	xmm7, xmm7
	xor		ecx, ecx
.for_i:
	cmp		ecx, edx
	jge		.endfor_i
	vaddss	xmm0, [ebx + ecx*4 + 0]
	vaddss	xmm1, [ebx + ecx*4 + 4]
	vaddss	xmm2, [ebx + ecx*4 + 8]	
	vaddss	xmm3, [ebx + ecx*4 + 12]
	vaddss	xmm4, [ebx + ecx*4 + 16]
	vaddss	xmm5, [ebx + ecx*4 + 20]
	vaddss	xmm6, [ebx + ecx*4 + 24]	
	vaddss	xmm7, [ebx + ecx*4 + 28]
	add		ecx, 8
	jmp		.for_i
.endfor_i:	
	vaddss	xmm0, xmm1
	vaddss	xmm2, xmm3
	vaddss	xmm4, xmm5
	vaddss	xmm6, xmm7
	
	vaddss	xmm0, xmm2
	vaddss	xmm4, xmm6
	vaddss	xmm0, xmm4
	
	sub		esp,4
	vmovss	[esp], xmm0
	fld		dword [esp]
	add		esp, 4
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret	


; -------------------------------------------------------------------
; compute  sum of floating point values in simple precision
; in one loop without loop unrolling using register xmm0
; -------------------------------------------------------------------
prod5:
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
	addss	xmm0, [ebx + ecx*4]
	add		ecx, 1
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
; by removing dependancies i.e. with registers xmm0 to xmm3
; same as prod2 but put dependencies close to each other
; -------------------------------------------------------------------
prod6:
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
	addss	xmm0, [ebx + ecx*4 + 4]
	addss	xmm1, [ebx + ecx*4 + 8]	
	addss	xmm1, [ebx + ecx*4 + 12]
	addss	xmm2, [ebx + ecx*4 + 16]
	addss	xmm3, [ebx + ecx*4 + 20]
	addss	xmm3, [ebx + ecx*4 + 24]	
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
; by removing dependancies i.e. with registers xmm0 to xmm3
; same as prod2 but put dependencies close to each other
; -------------------------------------------------------------------
prod7:
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
	addss	xmm0, [ebx + ecx*4 + 16]
	addss	xmm1, [ebx + ecx*4 + 4]
	addss	xmm1, [ebx + ecx*4 + 20]
	addss	xmm2, [ebx + ecx*4 + 8]	
	addss	xmm2, [ebx + ecx*4 + 24]	
	addss	xmm3, [ebx + ecx*4 + 12]
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
