global mp_inv_jk_sse
common nbr_add 4
common nbr_mul 4

section .text

mp_inv_jk_sse:
		push 	ebp
		mov		ebp, esp
		sub		esp, 8 ; i, k

		push	ebx
		push	edi
		push	esi
	
		xor		eax, eax
		mov		[ebp - 4], eax
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
	
		movss	xmm0, [ebx]
		pshufd 	xmm0, xmm0, 0
		
		mov		eax, ecx		; k
		mul		dword [ebp+20]	; k*size
		shl		eax, 2			; k*size*4
		mov		esi, [ebp+12]	; b
		add		esi, eax		; b[k*size]
		
		xor		ecx, ecx
		mov		edx, [ebp+20]
.for_j:	
		cmp		ecx, edx
		jge		.endfor_j
		
		movdqu	xmm1, [esi + ecx * 4]
		movdqu 	xmm2, [edi + ecx * 4]
		mulps	xmm1, xmm0
		addps  xmm2, xmm1
		movdqu [edi + ecx * 4], xmm2

		add		dword [nbr_add], 4
		add		dword [nbr_mul], 4
		
		add		ecx, 4
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

