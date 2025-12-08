global asm_cmpack_avx2
global asm_cmpack_avx2_compact

common threshold 1

section .data

section .text

; -------------------------------------------------------------------
; u32 asm_cmpack_avx2(u8 *x, u8 *y, u32 size);
; this is a AVX2 version of the reference function
; -------------------------------------------------------------------
; edi = &x[i]
; esi = &y[j]
; edx = size
; eax = return value
; ebx = temporary computations
; -------------------------------------------------------------------
asm_cmpack_avx2:
		push		ebp
		mov		ebp, esp

		sub             esp, 4
		
		push		edi
		push		esi
		push		ebx
		
		xor			eax, eax			; total = 0
		mov			edi, [ebp + 8]
		mov			esi, [ebp + 12]
		mov			edx, [ebp + 16]
		test		edx, edx
		jz			.end

		vpxor		ymm2, ymm2
		mov			ebx, 0x01010101
		movd		xmm7, ebx
		vpbroadcastb	ymm7, xmm7
		
		vpbroadcastb	ymm1, byte [threshold]
		
		shr			edx, 5		; size / 32
		test		edx, edx
		jz			.last31
		  
.for_ur32:
		vmovdqu		ymm0, [edi]
		
		vpsubusb	ymm0, ymm1			; subtract unsigned packed byte
										; we compute x[i] - threshold
										; values under threshold will 
										; have a result of 0
										
		vpcmpeqb	ymm0, ymm2			; compare each byte of 
										; x[i] - threshold
										; to 0
										; so it will give us the number
										; of values under the threshold
										
		vpmovmskb   ebx, ymm0			; get this values under threshold
		
										; 
		xor			ebx, 0xFFFFFFFF		; invert the 32 bits because 
										; we consider AVX register 
										; which contains 32 bytes
										
		popcnt		ebx, ebx			; count number of values > threshold
		add			eax, ebx			; add them to the variable 'total'
		
		vpandn		ymm0, ymm7			; compute complement to have values
										; greater than threshold
										
		vmovdqu     [esi], ymm0			; store result
		
		add			edi, 32
		add			esi, 32
		dec			edx
		jnz			.for_ur32	  	
	  
.last31:
	  	mov			edx, [ebp + 16]
	  	and			edx, 31
	  	cmp			edx, 16
	  	jl			.last15

		vmovdqu		xmm0, [edi]
		vpsubusb	xmm0, xmm1
		vpcmpeqb	xmm0, xmm2
		vpmovmskb   ebx, xmm0
		xor			ebx, 0xFFFF
		popcnt		ebx, ebx
		add			eax, ebx
		vpandn		xmm0, xmm7
		vmovdqu     [esi], xmm0
	  	
		add			edi, 16
		add			esi, 16
	
.last15:
		; store 'total' which was in eax into stack
		mov			[ebp-4], eax
		mov			edx, [ebp + 16]
		and			edx, 15
		jz			.end
		
		movzx		ecx, byte [threshold]
.for:
		movzx		ebx, byte [edi]
		xor			eax, eax
		cmp			ebx, ecx
		setg		al
		add			[ebp-4], eax
		mov			[esi], al
		inc			esi
		inc			edi
		dec			edx
		jnz			.for

		mov			eax, [ebp-4]
.end:		
		pop			ebx
		pop			esi		
		pop			edi
		
		mov			esp, ebp
		pop			ebp
		ret


; -------------------------------------------------------------------
; u32 asm_cmpack_avx2_compact(u8 *x, u8 *y, u32 size);
; this is a AVX2 version of the reference function
; -------------------------------------------------------------------
; edi = &x[i]
; esi = &y[j]
; edx = size
; eax = return value
; ebx = temporary computations
; -------------------------------------------------------------------
asm_cmpack_avx2_compact:
		push		ebp
		mov			ebp, esp

		sub			esp, 4
		
		push		edi
		push		esi
		push		ebx
		
		xor			eax, eax			; total = 0
		mov			edi, [ebp + 8]
		mov			esi, [ebp + 12]
		mov			edx, [ebp + 16]
		test		edx, edx
		jz			.end

		vpxor		ymm2, ymm2
		mov			ebx, 0x01010101
		movd		xmm7, ebx
		vpbroadcastb	ymm7, xmm7
		
		vpbroadcastb	ymm1, byte [threshold]
		
		shr			edx, 5		; size / 32
		test		edx, edx
		jz			.last31
		  
.for_ur32:
		vmovdqu		ymm0, [edi]
		
		vpsubusb	ymm0, ymm1			; subtract unsigned packed byte
										; we compute x[i] - threshold
										; values under threshold will 
										; have a result of 0
										
		vpcmpeqb	ymm0, ymm2			; compare each byte of 
										; x[i] - threshold
										; to 0
										; so it will give us the number
										; of values under the threshold
										
		vpmovmskb   ebx, ymm0			; get this values under threshold
		
										; 
		xor			ebx, 0xFFFFFFFF		; invert the 32 bits because 
										; we consider AVX register 
										; which contains 32 bytes
		
		mov			[esi], ebx
		add			esi, 4
										
		popcnt		ebx, ebx			; count number of values > threshold
		add			eax, ebx			; add them to the variable 'total'
										; greater than threshold
										
		vmovdqu     [esi], ymm0			; store result
		
		add			edi, 32
		dec			edx
		jnz			.for_ur32	  	
	  
.last31:
	  	mov			edx, [ebp + 16]
	  	and			edx, 31
	  	cmp			edx, 16
	  	jl			.last15

		vmovdqu		xmm0, [edi]
		vpsubusb	xmm0, xmm1
		vpcmpeqb	xmm0, xmm2
		vpmovmskb   ebx, xmm0
		xor			ebx, 0xFFFF
		mov			[esi], bx
		add			esi, 2
		popcnt		ebx, ebx
		add			eax, ebx
		vpandn		xmm0, xmm7
		vmovdqu     [esi], xmm0
	  	
		add			edi, 16
		
	
.last15:
		; store 'total' which was in eax into stack
		mov			[ebp-4], eax
		mov			edx, [ebp + 16]
		and			edx, 15
cmp			edx, 8
		jl			.last7
		
		; treat one byte		
		mov			edx, 8
		call		asm_cmpack_avx2_compact_subroutine
		mov			[esi], al
		inc			esi
.last7:
		mov			eax, [ebp-4]
		mov			edx, [ebp + 16]
		and			edx, 7
		test		edx, edx
		jz			.end
		
		call		asm_cmpack_avx2_compact_subroutine
		mov			[esi], al		
		mov			eax, [ebp-4]
.end:		
		pop			ebx
		pop			esi		
		pop			edi
		
		mov			esp, ebp
		pop			ebp
		ret

asm_cmpack_avx2_compact_subroutine:
		push		edx
		movzx		ecx, byte [threshold]
		push		esi
		xor			esi, esi
.for:
		xor			eax, eax	
		movzx		ebx, byte [edi + edx - 1]
		cmp			ebx, ecx 
		setg		al
		add			[ebp-4], eax
		shl			esi, 1
		or			esi, eax
		dec			edx
		jnz			.for
		mov			eax, esi
		pop			esi
		pop			edx
		add			edi, edx
		ret


