global method_4
global method_5

section .text

; simple loop with bsr
method_4:
	push	ebp
	mov		ebp, esp
	xor		eax, eax
	mov		edx, [ebp+12]
	test	edx, edx
	jz		.end
	
	push	ebx
	push	esi
	push	edi
	
	mov		ebx, [ebp + 8]
	xor		ecx, ecx
.for:
	mov		esi, [ebx + ecx * 4]
	bsr		edi, esi
	add		eax, edi
	inc		ecx
	dec		edx
	jnz		.for	

.end:	
	pop		edi
	pop		esi
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret
	
; loop unrolled by 4	
method_5:
	push	ebp
	mov		ebp, esp
	xor		eax, eax
	mov		edx, [ebp+12]
	test	edx, edx
	jz		.end
	
	push	ebx
	push	esi
	push	edi
	
	xor		edi, edi
	
	mov		ebx, [ebp + 8]
	xor		ecx, ecx
	push	ebp
.for_ur4:
	mov		esi, [ebx + ecx * 4]
	bsr		esi, esi
	add		eax, esi

	mov		ebp, [ebx + ecx * 4 + 4]
	bsr		ebp, ebp
	add		edi, ebp
	
	mov		esi, [ebx + ecx * 4 + 8]
	bsr		esi, esi
	add		eax, esi

	mov		ebp, [ebx + ecx * 4 + 12]
	bsr		ebp, ebp
	add		edi, ebp

	add		ecx, 4
	sub		edx, 4
	jnz		.for_ur4	

	add		eax, edi
.end:	
	pop		ebp
	pop		edi
	pop		esi
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret
		
