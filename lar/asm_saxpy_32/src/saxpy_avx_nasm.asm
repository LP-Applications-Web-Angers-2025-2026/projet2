global saxpy_avx

section .text

; f32 ps_avx(f32 *x, f32 *y, f32 a, u32 size)
; esi = x | [ebp + 8]
; edi = y | [ebp + 12]
; ecx = i
; edx = size | [ebp + 20]
; xmm0 = [sum3, sum2, sum1, sum0]
; st0 = sum
saxpy_avx:
		push	ebp
		mov		ebp, esp
		; resultat 0 si la taille 'size' est egale à 0
		fldz
		cmp		dword [ebp + 20], 0
		jz		.end
		
		push	edi
		push	esi
		mov		edi, [ebp + 8]
		mov		esi, [ebp + 12]
		mov		edx, [ebp + 20]
		
		vxorps	ymm0, ymm0
		movss	xmm3, [ebp + 16]
		shufps  xmm3, xmm3, 0
		vinsertf128 ymm3, ymm3, xmm3, 1
		xor		ecx, ecx
		
		; depliage par 8
		and		edx, ~7
		test	edx, edx
		jz		.last_7
.for_u8:
		cmp		ecx, edx
		jge		.endfor_u8
		vmovaps	ymm1, [edi + ecx * 4]
		vmovaps	ymm2, [esi + ecx * 4]
		vmulps	ymm1, ymm3
		vaddps  ymm2, ymm1
		vmovaps [esi + ecx * 4], ymm2
		vaddps	ymm0, ymm2
		add		ecx, 8	
		jmp		.for_u8	
		
.endfor_u8:			
		
		vhaddps	ymm0, ymm0
		vhaddps	ymm0, ymm0
		
		vextractf128	xmm1, ymm0, 1
		vaddps  xmm0, xmm1
		;vaddps  xmm0, xmm1
		sub		esp, 4
		movss	[esp], xmm0 
		fadd	dword [esp]
		add		esp, 4
		
.last_7:		
		; derniere iterations de la boucle
		; ecx = (size / 8) * 8
		mov		edx, [ebp + 20]
		and		edx, 7
		test	edx, edx
		jz		.endfor
.for:
		fld		dword [edi + ecx * 4]
		fmul	dword [ebp + 16]
		fadd	dword [esi + ecx * 4] ; a*x[i]+y[i]
		fst		dword [esi + ecx * 4]
		faddp	st1, st0	
		inc		ecx	
		dec		edx
		jnz		.for	
.endfor:	

		pop		esi
		pop		edi
.end:			
		mov		esp, ebp
		pop		ebp
		ret
