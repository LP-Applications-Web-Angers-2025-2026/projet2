global mp_inv_jk_avx

section .text

mp_inv_jk_avx:
	push ebp
	mov	ebp, esp
	sub	esp, 8 ; i, k

	push	ebx
	push	edi
	push	esi
	
	xor	eax, eax
	mov	[ebp - 4], eax
.for_i:
	mov		eax, [ebp-4]
	cmp		eax, [ebp + 20]
	jge		.endfor_i

	xor		ecx, ecx
	mov		[ebp-8], ecx
.for_k:
	mov		ecx, [ebp-8]
	cmp		ecx, [ebp+20]
	jge		.endfor_k		
	
	mov		eax, [ebp-4]
	mul		dword [ebp+20]
	
	mov		edi, eax	; i*size
	mov     ebx, eax	; i*size
	add		ebx, ecx	; i*size+k
	shl		edi, 2		; (i*size)*4
	shl		ebx, 2		; (i*size+k)*4
	add		edi, [ebp+16] ; c[i*size]
	add		ebx, [ebp+8]  ; a[i*size+k]
	
	vmovss	xmm0, [ebx]
	vpshufd 	xmm0, xmm0, 0
	vinsertf128 ymm0, ymm0, xmm0, 1
	
	mov		eax, ecx		; k
	mul		dword [ebp+20]	; k*size
	shl		eax, 2			; k*size*4
	mov		esi, [ebp+12]	; b
	add		esi, eax		; b[k*size]
	
	xor		ecx, ecx
	mov		edx, [ebp+20]
	and		edx, ~7
.for_j_u8:	
	cmp		ecx, edx
	jge		.endfor_j_u8
	
	vmovdqu	ymm1, [esi + ecx*4]
	vmovdqu ymm2, [edi + ecx*4]
	vmulps	ymm1, ymm0
	vaddps  ymm2, ymm1
	vmovdqu [edi + ecx*4], ymm2

	add		ecx, 8
	jmp		.for_j_u8	
.endfor_j_u8:
	mov		edx, [ebp+20]
.for_j:
	cmp		ecx, edx
	jge		.endfor_j
	
	movss	xmm1, [esi + ecx*4]
	movdqu 	xmm2, [edi + ecx*4]
	mulss	xmm1, xmm0
	addss  	xmm2, xmm1
	movss 	[edi + ecx*4], xmm2
 
	inc		ecx
	jmp		.for_j
.endfor_j:
	
	inc		dword [ebp-8]
	jmp		.for_k
.endfor_k:

	inc		dword [ebp - 4]
	jmp		.for_i		
.endfor_i:

	pop		esi
	pop		edi
	pop		ebx
	
	mov		esp, ebp
	pop		ebp
	ret

