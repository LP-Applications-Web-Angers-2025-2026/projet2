global saxpy_fma

section .text

; f32 saxpy_fma(f32 *x, f32 *y, f32 a, u32 size)
; esi = x, parameter in [ebp + 8]
; edi = y, parameter in [ebp + 12]
; ecx = i
; edx = size, parameter in [ebp + 20]
; ymm0 = [sum7, ..., sum0]
; st0 = sum
saxpy_fma:
		push	ebp
		mov		ebp, esp
		; resultat 0 si la taille 'size' est egale à 0
		fldz
		cmp		dword [ebp + 20], 0
		jz		.end
		
		push	esi
		push	edi
		mov		esi, [ebp + 8]
		mov		edi, [ebp + 12]
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
		vmovaps		ymm1, [esi + ecx * 4]
		vmovaps		ymm2, [edi + ecx * 4]
		;vmulps	ymm1, ymm3
		;vaddps  ymm2, ymm1
		vfmadd321ps ymm2, ymm1, ymm3
		vmovaps 	[edi + ecx *4], ymm2			
		vaddps		ymm0, ymm2	
		add			ecx, 8	
		cmp			ecx, edx
		jl			.for_u8	
		
		vhaddps	ymm0, ymm0
		vhaddps	ymm0, ymm0
		
		vextractf128	xmm1, ymm0, 1
		vaddps  xmm0, xmm1
		sub		esp, 4
		vmovss	[esp], xmm0
		fadd	dword [esp]
		add		esp, 4
		
.last_7:		
		; last iterations 
		; here ecx = (size / 8) * 8
		mov		edx, [ebp + 20]
		cmp		ecx, edx
		jge		.endfor
.for:
		fld		dword [esi + ecx * 4]
		fmul	dword [ebp + 16]
		fadd	dword [edi + ecx * 4] ; a*x[i]+y[i]
		fst		dword [edi + ecx * 4]
		faddp	st1, st0	
		inc		ecx	
		cmp		ecx, edx
		jl		.for	
.endfor:	

		pop		edi
		pop		esi
.end:			
		mov		esp, ebp
		pop		ebp
		ret

