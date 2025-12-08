%include "src/popcount_nasm.inc"

global maxpars_avx512_u4
extern popcount_table

section .text

; u32 maxpars_avx512_u4(u8 *x, u8 *y, u8 *z, u32 size);
; RDI = x
; RSI = y
; RDX = z
; RCX = size
; R9  = i 
; RAX = mutations
; R10d = copy of RCX
maxpars_avx512_u4:
	xor		eax, eax ; mutations = 0
	test	rcx, rcx
	jz		.end

	vpxord	zmm0, zmm0	
				
	xor		r9, r9		; i = 0
	
	mov		r10, rcx	
	shr		ecx, 8		; size / 256
	test	ecx, ecx
	jz		.last255
	
	
.for_u256:	
	; first
	vmovdqu8 	zmm1, [rdi + r9]		; zmm1 <- x[i:i+63]
	vpandd		zmm3, zmm1, [rsi + r9]	; zmm3 <- zmm1 & y[i:i+63]
	vpord		zmm4, zmm1, [rsi + r9]	; zmm4 <- zmm1 | y[i:i+63]
	vpcmpeqb	k1, zmm0, zmm3 			; compare zmm3 to zmm0 = [0,...,0]
										; and sets k1 consequently
	vmovdqu8	zmm3 {k1}, zmm4			; select zmm4 using k2 mask
	vmovdqu8	[rdx + r9], zmm3
	kmovq		r8, k1
	popcnt		r8, r8
	add			eax, r8d

	; second
	vmovdqu8 	zmm7, [rdi + r9 + 64]			; zmm7 <- x[i+64:i+127]
	vpandd		zmm9, zmm7, [rsi + r9 + 64]		; zmm3 <- zmm1 & y[i+64:i+127]
	vpord		zmm10, zmm7, [rsi + r9 + 64]	; zmm4 <- zmm1 | y[i+64:i+127]
	vpcmpeqb	k2, zmm0, zmm9 					; compare zmm7 to zmm0 = [0,...,0]
												; and sets k2 consequently
	vmovdqu8	zmm9 {k2}, zmm10				; select zmm9 using k2 mask
	vmovdqu8	[rdx + r9 + 64], zmm9
	kmovq		r11, k2
	popcnt		r11, r11
	add			eax, r11d

	; third
	vmovdqu8 	zmm13, [rdi + r9 + 128]			
	vpandd		zmm15, zmm13, [rsi + r9 + 128]	
	vpord		zmm16, zmm13, [rsi + r9 + 128]	
	vpcmpeqb	k3, zmm0, zmm15 				
	vmovdqu8	zmm15 {k3}, zmm16				
	vmovdqu8	[rdx + r9 + 128], zmm15
	kmovq		r8, k3
	popcnt		r8, r8
	add			eax, r8d

	; fourth
	vmovdqu8 	zmm19, [rdi + r9 + 192]			
	vpandd		zmm21, zmm19, [rsi + r9 + 192]	
	vpord		zmm22, zmm19, [rsi + r9 + 192]	
	vpcmpeqb	k4, zmm0, zmm21 				
	vmovdqu8	zmm21 {k4}, zmm22				
	vmovdqu8	[rdx + r9 + 192], zmm21
	kmovq		r11, k4
	popcnt		r11, r11
	add			eax, r11d

	add			r9, 256
	dec			ecx		
	jnz			.for_u256
		
.last255:
	mov			ecx, r10d
	and			ecx, 255
	cmp			ecx, 128
	jl			.last127

	vmovdqu8 	zmm1, [rdi + r9]		; zmm1 <- x[i:i+63]
	vpandd		zmm3, zmm1, [rsi + r9]	; zmm3 <- zmm1 & y[i:i+63]
	vpord		zmm4, zmm1, [rsi + r9]	; zmm4 <- zmm1 | y[i:i+63]

	vpcmpeqb	k1, zmm0, zmm3 			; compare zmm3 to zmm0 = [0,...,0]
										; and sets k1 consequently

	vmovdqu8	zmm3 {k1}, zmm4			; select zmm4 using k2 mask
	vmovdqu8	[rdx + r9], zmm3

	kmovq		r8, k1
	popcnt		r8, r8
	add			eax, r8d

	vmovdqu8 	zmm7, [rdi + r9 + 64]			; zmm7 <- x[i+64:i+127]
	vpandd		zmm9, zmm7, [rsi + r9 + 64]		; zmm3 <- zmm1 & y[i+64:i+127]
	vpord		zmm10, zmm7, [rsi + r9 + 64]	; zmm4 <- zmm1 | y[i+64:i+127]

	vpcmpeqb	k2, zmm0, zmm9 			; compare zmm7 to zmm0 = [0,...,0]
										; and sets k2 consequently

	vmovdqu8	zmm9 {k2}, zmm10			; select zmm9 using k2 mask
	vmovdqu8	[rdx + r9 + 64], zmm9

	kmovq		r8, k2
	popcnt		r8, r8
	add			eax, r8d

	add			r9, 128
	

.last127:
	mov			ecx, r10d
	and			ecx, 127
	cmp			ecx, 64
	jl			.last63
	
	vmovdqu8 	zmm1, [rdi + r9]		; zmm1 <- x[i:i+63]
	vpandd		zmm3, zmm1, [rsi + r9]	; zmm3 <- zmm1 & y[i:i+63]
	vpord		zmm4, zmm1, [rsi + r9]	; zmm4 <- zmm1 | y[i:i+63]

	vpcmpeqb	k1, zmm0, zmm3 			; compare zmm3 to zmm0 = [0,...,0]
										; and sets k1 consequently

	vmovdqu8	zmm3 {k1}, zmm4			; select zmm4 using k2 mask
	vmovdqu8	[rdx + r9], zmm3

	kmovq		r8, k1
	popcnt		r8, r8
	add			eax, r8d
	
	add			r9, 64	

.last63:
	mov			ecx, r10d
	and			ecx, 63
	cmp			ecx, 32
	jl			.last31

	vmovdqa		ymm1, [rdi + r9]	; x[i:i+31]
	vmovdqa		ymm2, [rsi + r9]    ; y[i:i+31]
	vpand		ymm3, ymm1, ymm2    ; ymm3 <- x & y
	vpor		ymm4, ymm1, ymm2    ; ymm4 <- x | y
	
	vpcmpeqb 	ymm5, ymm0, ymm3    ; xmm5 is the mask
									; if (x[i] & y[i] == 0) 
									; then xmm5[i] = 0xFF
									; else xmm5[i] = 0x00
	
	vpmovmskb 	r8d, ymm5
	popcnt		r8d, r8d
	add			eax, r8d
	
	vpblendvb	ymm3, ymm4, ymm5  

	vmovdqa		[rdx + r9], ymm3	; put result in z
	add			r9, 32
	
.last31:
	mov		ecx, r10d
	and		ecx, 31
	cmp		ecx, 16
	jl		.last15
	
	vmovdqa		xmm5, xmm0
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
	popcnt		r8d, r8d
	add			eax, r8d
	
	pand		xmm4, xmm5  
	pandn		xmm5, xmm3  
	por			xmm5, xmm4

	movdqa		[rdx + r9], xmm5 	; put result in z
	add		r9, 16	

.last15:
	mov		ecx, r10d
	and		ecx, 15
	shr		ecx, 2		; / 4
	test	ecx, ecx
	jz		.last3
	
	
.for_u4:
	movdqa		xmm5, xmm0
	movd		xmm1, [rdi + r9]	; x[i:i+15]
	movd		xmm2, [rsi + r9]   	; y[i:i+15]
	movdqa		xmm3, xmm1
	movdqa		xmm4, xmm2
	pand		xmm3, xmm2      	; xmm3 <- x & y
	por			xmm4, xmm1      	; xmm4 <- x | y
	

	pcmpeqb 	xmm5, xmm3  	    ; xmm0 is the mask
									; if (x[i] & y[i] == 0) 
									; then xmm0[i] = 0xFF
									; else xmm0[i] = 0x00
	
	pmovmskb 	r8d, xmm5			; pmovmskb
	and			r8d, 0xF
	popcnt		r8d, r8d
	add			eax, r8d
	
	pand		xmm4, xmm5  
	pandn		xmm5, xmm3  
	por			xmm5, xmm4

	movd		[rdx + r9], xmm5 		; put result in z
	add			r9, 4
	dec			ecx		
	jnz			.for_u4
	
.last3:
	mov			ecx, r10d
	and			ecx, 3
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
	vzeroupper	
	ret
	
	
	
	
	





