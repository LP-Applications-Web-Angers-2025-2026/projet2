typedef unsigned int u32;
typedef float f32;

void mp_inv_jk(f32 *a, f32 *b, f32 *c, u32 size) {
	a = (f32 *) __builtin_assume_aligned(a, 32);
	b = (f32 *) __builtin_assume_aligned(b, 32);
	c = (f32 *) __builtin_assume_aligned(c, 32);
	for (u32 i = 0; i < size; ++i) {
		for (u32 k = 0; k < size; ++k) {
			f32 *pc = &c[i*size];
			f32 *pa = &a[i*size+k];
			f32 *pb = &b[k*size];
			for (u32 j = 0; j < size; ++j) {
				*pc++ += (*pa) * *pb++;
			}
		}
	} 
}

pa = ebx
pb = esi
pc = edi
j  = ecx
size = edx

push ebp
mov	ebp, esp
sub	esp, 8 ; i, k

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
	jge		.end_for_k		
	
	mov		eax, [ebp-4]
	mul		dword [ebp+20]
	
	mov		edi, eax
	mov     ebx, eax
	add		ebx, ecx
	shl		edi, 2
	shl		ebx, 2
	add		edi, [ebp+16]
	add		ebx, [ebp+8]
	
	vmovss	xmm0, [ebx]
	vshufps	xmm0, xmm0, 0
	vinsertf128 ymm0, xmm0, 1
	
	mov		eax, ecx
	mul		dword [ebp+20]
	shl		eax, 2
	mov		esi, [ebp+12]
	add		esi, eax
	
	xor		ecx, ecx
	mov		edx, [ebp+20]
	
.for_j:	
	cmp		ecx, edx
	jge		.endfor_j
	
	vmovdqu	ymm1, [esi]
	vmovdqu ymm2, [edi]
	vmulps	ymm1, ymm0
	vaddps  ymm1, ymm2
	vmovdqu [edi], ymm2

	add		ecx, 8
	jmp		.for_j	
.endfor_j:
	
	
	inc		dword [ebp-8]
	jmp		.for_k
.endfor_k:	
	inc		dword [ebp - 4]
	jmp		.for_i		
.endfor_i:
	mov		esp, ebp
	pop		ebp
	ret


