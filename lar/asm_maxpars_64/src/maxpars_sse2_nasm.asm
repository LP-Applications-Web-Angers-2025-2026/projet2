%include "src/popcount_nasm.inc"

global maxpars_sse2
extern popcount_table

section .text

; u32 maxpars_sse2(u8 *x, u8 *y, u8 *z, u32 size);
; RDI = x
; RSI = y
; RDX = z
; RCX = size
; R9  = i 
; RAX = mutations
; R10d = copy of RCX
; maximum parsimony with SSE2 implementation
maxpars_sse2:
	xor			eax, eax
	test		rcx, rcx
	jz			.end

	xor			r9, r9				; i = 0
	
	pxor		xmm0, xmm0
	
	; compute number of iterations using xmm registers
	; a SSE register can handle 16 bytes
	mov			r10, rcx	
	shr			ecx, 4				; ecx <- size / 16
	test		ecx, ecx
	jz			.last15	
	

.for_u16:
	movdqa		xmm5, xmm0			; future mask and result
	
	movdqa		xmm1, [rdi + r9]	; xmm1 <- x[i:i+15]
	movdqa		xmm2, [rsi + r9]   	; xmm2 <- y[i:i+15]
	movdqa		xmm3, xmm1
	movdqa		xmm4, xmm2
	pand		xmm3, xmm2      	; xmm3 <- x & y
	por			xmm4, xmm1      	; xmm4 <- x | y
	
	pcmpeqb 	xmm5, xmm3      	; xmm5 is the mask at this point
									; if (x[i] & y[i] == 0) 
									; then xmm5[i] = 0xFF
									; else xmm5[i] = 0x00
	
	pmovmskb 	r8d, xmm5			; pmovmskb
	_POPCOUNT32_	r8d, r8d
	
	
	add			eax, r8d
	
	pand		xmm4, xmm5  
	pandn		xmm5, xmm3  
	por			xmm5, xmm4

	movdqa		[rdx + r9], xmm5 	; put result in z
	add			r9, 16
	dec			ecx		
	jnz			.for_u16

.last15:
	mov			ecx, r10d
	and			ecx, 15
	shr			ecx, 2				; (size & 15) / 4
	test		ecx, ecx
	jz			.last3
	
.for_u4:
	movdqa		xmm5, xmm0			; future mask an result
	
	movd		xmm1, [rdi + r9]	; xmm1 <- x[i:i+15]
	movd		xmm2, [rsi + r9]   	; xmm2 <- y[i:i+15]
	movdqa		xmm3, xmm1
	movdqa		xmm4, xmm2
	pand		xmm3, xmm2      	; xmm3 <- x & y
	por			xmm4, xmm1      	; xmm4 <- x | y
	
	pcmpeqb 	xmm5, xmm3      	; xmm5 is the mask at this point
									; if (x[i] & y[i] == 0) 
									; then xmm5[i] = 0xFF
									; else xmm5[i] = 0x00
	
	pmovmskb 	r8d, xmm5			; pmovmskb
	and			r8d, 0xF
	_POPCOUNT32_	r8d, r8d
	add			eax, r8d
	
	pand		xmm4, xmm5  
	pandn		xmm5, xmm3  
	por			xmm5, xmm4

	movd		[rdx + r9], xmm5     ; put result in z
	add			r9, 4
	dec			ecx		
	jnz			.for_u4
	
.last3:
	mov			ecx, r10d
	and			ecx, 3				; size & 3
	test		ecx, ecx
	jz			.end
	
	mov			[rsp-8], r12
	mov			[rsp-16], r13
	mov			[rsp-24], r14	
	
.for_u1:
	xor			r14d, r14d
	mov			r11b, [rdi + r9]
	mov			r13b, [rsi + r9]
	mov			r12b, r11b
	and			r11b, r13b
	or			r12b, r13b
	cmp			r11b, 0
	cmove		r11, r12
	sete		r14b
	add			eax, r14d	
	mov			[rdx + r9], r11b
	add			r9, 1
	dec			ecx
	jnz			.for_u1

	mov			r12, [rsp-8]
	mov			r13, [rsp-16]
	mov			r14, [rsp-24]	

.end:	
	ret
	
