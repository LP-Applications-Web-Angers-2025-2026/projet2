global asm_cmpack_sse_v1
global asm_cmpack_sse_v2
global asm_cmpack_sse_compact

common threshold 1

section .data

convertion_table:
	db 0, 1, 0, 0, 2, 3, 0, 0, ; 0->7
	db 0, 0, 0, 0, 0, 0, 0, 0, ; 8
	db 4, 5, 0, 0, 6, 7, 0, 0, ; 16
	db 0, 0, 0, 0, 0, 0, 0, 0, ; 24
	db 0, 0, 0, 0, 0, 0, 0, 0, ; 32
	db 0, 0, 0, 0, 0, 0, 0, 0, ; 40
	db 0, 0, 0, 0, 0, 0, 0, 0, ; 48
	db 0, 0, 0, 0, 0, 0, 0, 0, ; 56
	db 8, 9, 0, 0, 10, 11, 0, 0, ; 64
	db 0, 0, 0, 0, 0, 0, 0, 0,   ; 72
	db 12, 13, 0, 0, 14, 15, 0, 0 ; 80->87


section .text

; -------------------------------------------------------------------
; u32 asm_cmpack_sse_v1(u8 *x, u8 *y, u32 size);
; this is a SSE version of the reference function
; -------------------------------------------------------------------
; edi = &x[i]
; esi = &y[j]
; edx = size
; eax = return value
; ebx = temporary computations
; xmm1.w = [threshold x 8]
; xmm2.w = [0 x 8]
; xmm3.w = [x[i], ..., x[i+7]]
; xmm4.w = [x[i+8], ..., x[i+15]]
; -------------------------------------------------------------------
asm_cmpack_sse_v1:
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

		shr			edx, 4
		test		edx, edx
		jz			.last15
	
		movzx		ebx, byte [threshold]
		movd		xmm1, ebx		
		pshuflw		xmm1, xmm1, 0
		movdqa		xmm0, xmm1
		pslldq		xmm1, 8
		por			xmm1, xmm0
		
		mov		ebx, 0x01010101
		movd	xmm7, ebx
		pshufd	xmm7, xmm7, 0
	  
.for_ur16:
		pxor		xmm2, xmm2
		
		movdqa		xmm3, [edi]
		movdqa		xmm4, xmm3
		punpcklbw	xmm3, xmm2 
		punpckhbw	xmm4, xmm2
		
		pcmpgtw		xmm3, xmm1
		pmovmskb	ebx, xmm3
		and			ebx, 0x5555
		popcnt		ebx, ebx
		add			eax, ebx
		
		pcmpgtw		xmm4, xmm1
		pmovmskb	ecx, xmm4
		and			ecx, 0x5555
		popcnt		ecx, ecx
		add			eax, ecx
		
		pand		xmm3, xmm7
		packuswb 	xmm3, xmm2
		pand		xmm3, xmm7

		pand		xmm4, xmm7
		packuswb 	xmm2, xmm4
		pand		xmm2, xmm7
	
		por			xmm3, xmm2
		
		movdqa		[esi], xmm3
		
		add			esi, 16
		add			edi, 16
		dec			edx
		jnz			.for_ur16		
	
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

; --------------------------------------------
asm_cmpack_sse_v2:
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

		shr			edx, 4
		test		edx, edx
		jz			.last15
	
		mov			ecx, 0x01010101
		movzx		ebx, byte [threshold]
		imul		ebx, ecx
		movd		xmm1, ebx		
		pshufd		xmm1, xmm1, 0
				
		pxor		xmm2, xmm2
		
		mov			ebx, 0x01010101
		movd		xmm7, ebx
		pshufd		xmm7, xmm7, 0
	  
.for_ur16:
		movdqa		xmm0, [edi]
		psubusb		xmm0, xmm1
		pcmpeqb		xmm0, xmm2
		pmovmskb   	ebx, xmm0
		xor			ebx, 0xFFFF
		popcnt		ebx, ebx
		add			eax, ebx
		pandn		xmm0, xmm7
		vmovdqa     [esi], xmm0
		
		add			edi, 16
		add			esi, 16
		dec			edx
		jnz			.for_ur16		
	
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
; u32 asm_cmpack_compact(u8 *x, u8 *y, u32 size);
; this is a SSE version of the compact version of the
; reference function
; -------------------------------------------------------------------
; edi = &x[i]
; esi = &y[j]
; edx = size
; eax = return value
; eax = total
; ebx = temporary computations
; -------------------------------------------------------------------
asm_cmpack_sse_compact:
		push		ebp
		mov			ebp, esp
	
		; reserve space for temporary data
		; [ebp-4] will handle 'total' for last iterations
		; 
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

		shr			edx, 4
		test		edx, edx
		jz			.last15
	
		movzx		ebx, byte [threshold]
		movd		xmm1, ebx		
		pshuflw		xmm1, xmm1, 0
		movdqa		xmm0, xmm1
		pslldq		xmm1, 8
		por			xmm1, xmm0

		pxor		xmm2, xmm2
		
		push		ebp
		  
.for_ur16:
		movdqa		xmm3, [edi]
		
		movdqa		xmm4, xmm3
		punpcklbw	xmm3, xmm2 
		punpckhbw	xmm4, xmm2
		
		pcmpgtw		xmm3, xmm1
		pmovmskb	ebx, xmm3
		and			ebx, 0x5555
		popcnt		ebp, ebx
		add			eax, ebp
		mov			ecx, ebx
		and			ebx, 0xFF
		shr			ecx, 8
		movzx		ebx, byte [convertion_table + ebx]
		movzx		ecx, byte [convertion_table + ecx]
		shl			ecx, 4
		add			ecx, ebx
		mov			[esi], cl

		pcmpgtw		xmm4, xmm1
		pmovmskb	ebx, xmm4
		and			ebx, 0x5555
		popcnt		ebp, ebx
		add			eax, ebp
		mov			ecx, ebx
		and			ebx, 0xFF
		shr			ecx, 8
		movzx		ebx, byte [convertion_table + ebx]
		movzx		ecx, byte [convertion_table + ecx]
		shl			ecx, 4
		add			ecx, ebx
		mov			[esi + 1], cl
		
		add			esi, 2
		add			edi, 16
		dec			edx
		jnz			.for_ur16		
	
		pop			ebp
		
.last15:
		; store 'total' which was in eax into stack
		mov			[ebp-4], eax
		mov			edx, [ebp + 16]
		and			edx, 15
		cmp			edx, 8
		jl			.last7
		
		; treat one byte		
		mov			edx, 8
		call		asm_cmpack_sse_compact_subroutine
		mov			[esi], al
		inc			esi
.last7:
		mov			eax, [ebp-4]
		mov			edx, [ebp + 16]
		and			edx, 7
		test		edx, edx
		jz			.end
		
		call		asm_cmpack_sse_compact_subroutine
		mov			[esi], al		
		mov			eax, [ebp-4]
		
.end:		
		pop			ebx
		pop			esi		
		pop			edi
		mov			esp, ebp
		pop			ebp
		ret
		
asm_cmpack_sse_compact_subroutine:
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
		
