global saxpy_fpu

section .text

; float saxpy_fpu(f32 *x, f32 *y, f32 a, u32 size)
; edi = x, parameter in [ebp + 8]
; esi = y, parameter in [ebp + 12]
; ecx = i
; edx = size, parameter in [ebp + 20]
; st0 = sum
saxpy_fpu:
		push	ebp
		mov		ebp, esp
		; result is 0 if size == 0
		fldz
		cmp		dword [ebp + 20], 0
		jz		.end
		
		push	edi                ; sauvegarde
		push	esi                ;   des registres
		mov		edi, [ebp + 8]     ; initialisation
		mov		esi, [ebp + 12]    ;   des registres
		mov		edx, [ebp + 20]
		
		; for (i = 0; i < size; ++i)
		xor		ecx, ecx    ; i = 0
.for:
		fld		dword [edi + ecx * 4] ; x[i]
		fmul	dword [ebp + 16]      ; a*x[i]
		fadd	dword [esi + ecx * 4] ; a*x[i]+y[i]
		fst		dword [esi + ecx * 4] 
		faddp	st1, st0	          ; sum += y[i]
		inc		ecx	                  ; ++i
		cmp		ecx, edx
		jl		.for
			
.endfor:			
		pop		esi                ; restauration des registres 
		pop		edi
.end:			
		mov		esp, ebp
		pop		ebp
		ret
		
