%include "src/popcount_nasm.inc"

global maxpars_avx2_u4_vpblendvb_nodep
extern popcount_table

section .text

; u32 maxpars_avx2_u4_v3(u8 *x, u8 *y, u8 *z, u32 size);
; RDI = x
; RSI = y
; RDX = z
; RCX = size
; R9  = i 
; RAX = mutations
; R10d = copy of RCX
maxpars_avx2_u4_vpblendvb_nodep:
	xor			eax, eax	; mutations = 0
	test		rcx, rcx
	jz			.end
		
	vpxor		ymm0, ymm0
	
	xor			r9, r9		; i = 0
	
	mov			r10, rcx	
	shr			ecx, 7		; / 128
	test		ecx, ecx
	jz			.last127	

.for_u128:
	; first 32
	vmovdqa		ymm1, [rdi + r9]	; ymm1 <- x[i:i+15]
	vmovdqa		ymm2, [rsi + r9]    ; ymm2 <- y[i:i+15]

	vpand		ymm3, ymm1, ymm2    ; ymm3 <- x & y
	vpor		ymm4, ymm1, ymm2    ; xmm4 <- x | y
	
	vpcmpeqb 	ymm5, ymm0, ymm3    ; xmm5 is the mask
									; if (x[i] & y[i] == 0) 
									; then xmm5[i] = 0xFF
									; else xmm5[i] = 0x00
	vpmovmskb 	r8d, ymm5		
	popcnt		r8d, r8d
	add			eax, r8d
	
	vpblendvb	ymm3, ymm4, ymm5
	vmovdqa		[rdx + r9], ymm3 	; put result in z

	; ---------------------------------------------
	; next 32
	vmovdqa		ymm6, [rdi + r9 + 32]	
	vmovdqa		ymm7, [rsi + r9 + 32]   
	vpand		ymm8, ymm6, ymm7    
	vpor		ymm9, ymm6, ymm7    
	vpcmpeqb 	ymm10, ymm0, ymm8    
	vpmovmskb 	r11d, ymm10		
	popcnt		r11d, r11d
	add			eax, r11d
	vpblendvb	ymm8, ymm9, ymm10  
	vmovdqa		[rdx + r9 + 32], ymm8 	; put result in z
	
	; ---------------------------------------------
	; next 32
	vmovdqa		ymm11, [rdi + r9 + 64]	
	vmovdqa		ymm12, [rsi + r9 + 64]   
	vpand		ymm13, ymm11, ymm12    
	vpor		ymm14, ymm11, ymm12    
	vpcmpeqb 	ymm15, ymm0, ymm13    
	vpmovmskb 	r8d, ymm15		
	popcnt		r8d, r8d
	add			eax, r8d
	vpblendvb	ymm13, ymm14, ymm15  
	vmovdqa		[rdx + r9 + 64], ymm13 	; put result in z

	; ---------------------------------------------
	; next 32
	vmovdqa		ymm1, [rdi + r9 + 96]	
	vmovdqa		ymm2, [rsi + r9 + 96]   
	vpand		ymm3, ymm1, ymm2    
	vpor		ymm4, ymm1, ymm2    
	vpcmpeqb 	ymm5, ymm0, ymm3    
	vpmovmskb 	r11d, ymm5		
	popcnt		r11d, r11d
	add			eax, r11d
	vpblendvb	ymm3, ymm4, ymm5  
	vmovdqa		[rdx + r9 + 96], ymm3 	; put result in z


	add			r9, 128
	dec			ecx		
	jnz			.for_u128

.last127:	
	mov			ecx, r10d
	and			ecx, 127	
	cmp			ecx, 64
	jl			.last63

	; first 32
	vmovdqa		ymm1, [rdi + r9]	; ymm1 <- x[i:i+15]
	vmovdqa		ymm2, [rsi + r9]    ; ymm2 <- y[i:i+15]

	vpand		ymm3, ymm1, ymm2    ; ymm3 <- x & y
	vpor		ymm4, ymm1, ymm2    ; xmm4 <- x | y
	
	vpcmpeqb 	ymm5, ymm0, ymm3    ; xmm5 is the mask
									; if (x[i] & y[i] == 0) 
									; then xmm5[i] = 0xFF
									; else xmm5[i] = 0x00
	vpmovmskb 	r8d, ymm5		
	popcnt		r8d, r8d
	add			eax, r8d
	
	vpand		ymm1, ymm4, ymm5  
	vpandn		ymm2, ymm5, ymm3  
	vpor		ymm1, ymm2
	vmovdqa		[rdx + r9], ymm1 	; put result in z

	; next 32
	vmovdqa		ymm1, [rdi + r9 + 32]	; ymm1 <- x[i:i+15]
	vmovdqa		ymm2, [rsi + r9 + 32]    ; ymm2 <- y[i:i+15]

	vpand		ymm3, ymm1, ymm2    ; ymm3 <- x & y
	vpor		ymm4, ymm1, ymm2    ; xmm4 <- x | y
	
	vpcmpeqb 	ymm5, ymm0, ymm3    ; xmm5 is the mask
									; if (x[i] & y[i] == 0) 
									; then xmm5[i] = 0xFF
									; else xmm5[i] = 0x00
	vpmovmskb 	r8d, ymm5		
	popcnt		r8d, r8d
	add			eax, r8d
	
	vpand		ymm1, ymm4, ymm5  
	vpandn		ymm2, ymm5, ymm3  
	vpor		ymm1, ymm2
	vmovdqa		[rdx + r9 + 32], ymm1 	; put result in z	

	add		r9, 64

.last63:
	mov			ecx, r10d
	and			ecx, 63
	cmp			ecx, 32
	jl			.last31

	vmovdqa		ymm1, [rdi + r9]	; ymm1 <- x[i:i+15]
	vmovdqa		ymm2, [rsi + r9]    ; ymm2 <- y[i:i+15]

	vpand		ymm3, ymm1, ymm2    ; ymm3 <- x & y
	vpor		ymm4, ymm1, ymm2    ; xmm4 <- x | y
	
	vpcmpeqb 	ymm5, ymm0, ymm3    ; xmm5 is the mask
									; if (x[i] & y[i] == 0) 
									; then xmm5[i] = 0xFF
									; else xmm5[i] = 0x00
	vpmovmskb 	r8d, ymm5		
	popcnt		r8d, r8d
	add			eax, r8d
	
	vpand		ymm1, ymm4, ymm5  
	vpandn		ymm2, ymm5, ymm3  
	vpor		ymm1, ymm2
	vmovdqa		[rdx + r9], ymm1 	; put result in z	
	
	add		r9, 32
	

.last31:
	mov			ecx, r10d
	and			ecx, 31
	cmp			ecx, 16
	jl			.last15
	
	vzeroupper
	movdqa		xmm5, xmm0
	movdqa		xmm1, [rdi + r9]	; x[i:i+15]
	movdqa		xmm2, [rsi + r9]   	; y[i:i+15]
	movdqa		xmm3, xmm1
	movdqa		xmm4, xmm2
	pand		xmm3, xmm2      	; xmm3 <- x & y
	por			xmm4, xmm1      	; xmm4 <- x | y
	
	pcmpeqb 	xmm5, xmm3      	; xmm5 is the mask
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
	add			r9, 16	

.last15:
	mov			ecx, r10d
	and			ecx, 15
	shr			ecx, 2				; (size & 15)/ 4
	test		ecx, ecx
	jz			.last3
	
	
.for_u4:
	vzeroupper
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
	
