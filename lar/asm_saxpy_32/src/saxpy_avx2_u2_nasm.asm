global saxpy_avx2_u2

section .text

; f32 ps_avx2_u2(f32 *x, f32 *y, f32 a, u32 size)
; edi = x | [ebp + 8]
; esi = y | [ebp + 12]
; ecx = i
; edx = size | [ebp + 20]
; ymm0 = [sum7, ..., sum0]
; st0 = sum
saxpy_avx2_u2:
		push	ebp
		mov		ebp, esp
		; result is 0 if size==0 
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
		vmovaps	ymm7, ymm3
		xor		ecx, ecx
		
		; unroll by 2*8=16
		and		edx, ~15
		test	edx, edx
		jz		.last_15
				
.for_u16:
		cmp		ecx, edx
		jge		.endfor_u16
		
		vmovaps	ymm1, [edi + ecx * 4] ; ymm1 = x[i:i+7]
		vmovaps	ymm2, [esi + ecx * 4] ; ymm2 = y[i:i+7]
		vmulps	ymm1, ymm3 ; x[i:i+7]*a
		vaddps  ymm2, ymm1 ; y[i:i+7] + x[i:i+7]*a 
		vmovaps [esi + ecx * 4], ymm2
		vaddps	ymm0, ymm2
		
		vmovaps	ymm5, [edi + ecx * 4 + 32]
		vmovaps	ymm6, [esi + ecx * 4 + 32]
		vmulps	ymm5, ymm7
		vaddps  ymm6, ymm5
		vmovaps [esi + ecx * 4 + 32], ymm6
		vaddps	ymm0, ymm6
		
		add		ecx, 16	
		jmp		.for_u16	
.endfor_u16:			
		
		
.last_15:
		mov		edx, [ebp + 20]		
		and		edx, 15
		cmp		edx, 8
		jl		.last_7
		
		vmovaps	ymm1, [edi + ecx * 4]
		vmovaps	ymm2, [esi + ecx * 4]
		vmulps	ymm1, ymm3
		vaddps  ymm2, ymm1
		vmovaps [esi + ecx * 4], ymm2
		vaddps	ymm0, ymm2
		add		ecx, 8	

.last_7:			
		vextractf128	xmm1, ymm0, 1
		vhaddps	ymm0, ymm0
		vhaddps	ymm0, ymm0
		
		vextractf128	xmm1, ymm0, 1
		vaddps  xmm0, xmm1
		;vaddps  xmm0, xmm1
		sub		esp, 4
		movss	[esp], xmm0 
		fadd	dword [esp]
		add		esp, 4
		
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

