%include "src/haddps_macros_nasm.inc"

global saxpy_sse

section .text

; float saxpy_sse(f32 *x, f32 *y, f32 a, u32 size)
; edi = x, parameter in [ebp + 8]
; esi = y, parameter in [ebp + 12]
; ecx = i
; edx = size, parameter in [ebp + 20]
; xmm0 = [sum3, sum2, sum1, sum0]
; st0 = sum
saxpy_sse:
		push	ebp
		mov		ebp, esp
		; result is 0 if size == 0
		fldz
		cmp		dword [ebp + 20], 0
		jz		.end
		
		push	edi
		push	esi
		
		mov		edi, [ebp + 8]
		mov		esi, [ebp + 12]
		mov		edx, [ebp + 20]

		xor		ecx, ecx
		
		; depliage par 4
		and		edx, ~3
		test	edx, edx
		jz		.last_3
			
		xorps	xmm0, xmm0
		movss	xmm3, [ebp + 16]
		shufps  xmm3, xmm3, 0
				
.for_u4:
		movaps	xmm1, [edi + ecx * 4] ; x[i:i+3]
		movaps	xmm2, [esi + ecx * 4] ; y[i:i+3]
		mulps	xmm1, xmm3            ; x[i:i+3] * a
		addps	xmm2, xmm1            ; y[i:i+3] += x[i:i+3] * a
		movaps	[esi + ecx * 4], xmm2
		addps	xmm0, xmm2			
		add		ecx, 4	
		cmp		ecx, edx
		jl		.for_u4	
					
		; macro to replace 2x haddps xmm0, xmm0
		M_2xHADDPS32b	xmm0
	 	
		sub		esp, 4
		movss	[esp], xmm0
		fadd	dword [esp]
		add		esp, 4
		
		; last iterations
		; here ecx = (size / 4) * 4
.last_3:
		mov		edx, [ebp + 20]
		cmp		ecx, edx
		jge		.endfor
.for:
		fld		dword [edi + ecx * 4] ; x[i]
		fmul	dword [ebp + 16]      ; a*x[i]
		fadd	dword [esi + ecx * 4] ; a*x[i]+y[i]
		fst		dword [esi + ecx * 4] 
		faddp	st1, st0	          ; sum += y[i]
		inc		ecx	
		cmp		ecx, edx
		jl		.for
.endfor:	

		pop		esi
		pop		edi
.end:			
		mov		esp, ebp
		pop		ebp
		ret
