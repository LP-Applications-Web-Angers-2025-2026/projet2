global saxpy_fpu_u4

section .text

%macro fpu_body 1
	fld		dword [edi + ecx * 4 + %1] ; x[i]
	fmul	dword [ebp + 16]           ; a*x[i]
	fadd	dword [esi + ecx * 4 + %1] ; a*x[i]+y[i]
	fst		dword [esi + ecx * 4 + %1] 
	faddp	st1, st0	               ; sum += y[i]
%endmacro

; f32 saxpy_fpu_u4(f32 *x, f32 *y, f32 a, u32 size)
; edi = x | [ebp + 8]
; esi = y | [ebp + 12]
; ecx = i
; edx = size | [ebp + 20]
; st0 = sum
saxpy_fpu_u4:
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
		jz		.last3
		
.for_u4:
		%assign i 0
		%rep 4
		   fpu_body i
		   %assign i i+4
		%endrep
		add		ecx, 4	
		cmp		ecx, edx		
		jl		.for_u4
						
.last3:
		; last iterations
		; here ecx = (size / 4) * 4
		mov		edx, [ebp + 20]
.for:
		cmp		ecx, edx
		jge		.endfor
		fpu_body  0	
		inc		ecx	
		jmp		.for	
.endfor:	

		pop		esi
		pop		edi
.end:			
		mov		esp, ebp
		pop		ebp
		ret
		
