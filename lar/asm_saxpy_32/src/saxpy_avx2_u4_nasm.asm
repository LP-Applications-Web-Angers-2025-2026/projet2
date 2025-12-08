global saxpy_avx2_u4

section .text

; f32 ps_avx2_u2(f32 *x, f32 *y, f32 a, u32 size)
; edi = x | [ebp + 8]
; esi = y | [ebp + 12]
; ecx = i
; edx = size | [ebp + 20]
; ymm0 = [sum7, ..., sum0]
; st0 = sum
saxpy_avx2_u4:
		push	ebp
		mov		ebp, esp
		
		; result is 0 if size==0 
		fldz
		cmp		dword [ebp + 20], 0
		jz		.end
		
		vxorps	ymm0, ymm0
		movss	xmm3, [ebp + 16]
		shufps  xmm3, xmm3, 0
		
		
		push	edi
		push	esi
		mov		edi, [ebp + 8]
		mov		esi, [ebp + 12]
		mov		edx, [ebp + 20]
		
		vinsertf128 ymm3, ymm3, xmm3, 1
		vmovaps	ymm7, ymm3
		xor		ecx, ecx
		
		; unroll by 4*8=32
		and		edx, ~31
		test	edx, edx
		jz		.last_31

.for_u32:
		cmp		ecx, edx
		jge		.endfor_u32
		
		vmovaps	ymm1, [edi + ecx * 4]
		vmovaps	ymm2, [esi + ecx * 4]
		vmulps	ymm1, ymm3
		vaddps  ymm2, ymm1
		vmovaps [esi + ecx * 4], ymm2
		vaddps	ymm0, ymm2
		
		vmovaps	ymm5, [edi + ecx * 4 + 32]
		vmovaps	ymm6, [esi + ecx * 4 + 32]
		vmulps	ymm5, ymm7
		vaddps  ymm6, ymm5
		vmovaps [esi + ecx * 4 + 32], ymm6
		vaddps	ymm0, ymm6

		vmovaps	ymm1, [edi + ecx * 4 + 64]
		vmovaps	ymm2, [esi + ecx * 4 + 64]
		vmulps	ymm1, ymm3
		vaddps  ymm2, ymm1
		vmovaps [esi + ecx * 4 + 64], ymm2
		vaddps	ymm0, ymm2
		
		vmovaps	ymm5, [edi + ecx * 4 + 96]
		vmovaps	ymm6, [esi + ecx * 4 + 96]
		vmulps	ymm5, ymm7
		vaddps  ymm6, ymm5
		vmovaps [esi + ecx * 4 + 96], ymm6
		vaddps	ymm0, ymm6
		
		add		ecx, 32	
		jmp		.for_u32	
.endfor_u32:			

.last_31:
		mov		edx, [ebp + 20]		
		and		edx, 31
		cmp		edx, 16
		jl		.last_15

		
		vmovaps	ymm1, [edi + ecx * 4]
		vmovaps	ymm2, [esi + ecx * 4]
		vmulps	ymm1, ymm3
		vaddps  ymm2, ymm1
		vmovaps [esi + ecx * 4], ymm2
		vaddps	ymm0, ymm2
		
		vmovaps	ymm5, [edi + ecx * 4 + 32]
		vmovaps	ymm6, [esi + ecx * 4 + 32]
		vmulps	ymm5, ymm7
		vaddps  ymm6, ymm5
		vmovaps [esi + ecx * 4 + 32], ymm6
		vaddps	ymm0, ymm6
		
		add		ecx, 16	
		
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
				
		; derniere iterations de la boucle
		; ecx = (size / 8) * 8
		mov		edx, [ebp + 20]
		and		edx, 7
		test	edx, edx
		jz		.endfor
.for:
		movss	xmm1, [edi + ecx * 4]
		mulss	xmm1, xmm3
		addss	xmm1, [esi + ecx * 4] ; a*x[i]+y[i]
		movss	[esi + ecx * 4], xmm1
		addss	xmm0, xmm1
		add		ecx, 1	
		sub		edx, 1
		jnz		.for	
.endfor:

		sub		esp, 4
		movss	[esp], xmm0 
		fadd	dword [esp]
		add		esp, 4
		
		pop		esi
		pop		edi
.end:			
		mov		esp, ebp
		pop		ebp
		ret

