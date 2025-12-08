%include "src/popcount_nasm.inc"

global maxpars_sse2_v2
extern popcount_table

section .text

; esi = x
; edi = y
; ebx = z
; ecx = i
; edx = size
; eax = mutations

maxpars_sse2_v2:
	push	ebp
	mov		ebp, esp
	
	push	esi
	push	edi
	push	ebx
	
	mov		eax, [ebp + 20] ; if (size == 0) return 0
	test	eax, eax
	jz		.end
	
	

	xor		ecx, ecx		; i = 0	
	xor		eax, eax		; mutations = 0
	mov		esi, [ebp + 8]  ; x
	mov		edi, [ebp + 12] ; y
	mov		ebx, [ebp + 16] ; z
	mov		edx, [ebp + 20] ; size
	
	shr		edx, 4	; /16
	test	edx, edx
	jz		.last15
	
	pxor	xmm6, xmm6		; sse2
	
.for_u16:
	movdqa	xmm0, [esi + ecx]	; x[i:i+15]
	movdqa	xmm2, [edi + ecx]   ; y[i:i+15]
	push	edx
	movdqa	xmm1, xmm0
	pand	xmm0, xmm2      ; xmm0 <- x & y
	por		xmm1, xmm2      ; xmm1 <- x | y
	
	movdqa	xmm4, xmm0      ; xmm4 <- x & y
	pcmpeqb xmm4, xmm6      ; xmm4 is the mask
							; if (x[i] & y[i] == 0) then xmm4[i] = 0xFF
							; else xmm4[i] = 0x00
	
	pmovmskb edx, xmm4		; pmovmskb
	_POPCOUNT_	edx, edx

	add		eax, edx
	
	; now compute resulting sequence
	; movdqa	xmm3, xmm4	; xmm3 and xmm4 are the masks
	pand	xmm1, xmm4  ; not(xmm4) & (x[i] | y[i])
	pop		edx
	pandn	xmm4, xmm0  
	por		xmm0, xmm1

	movdqa	[ebx+ecx],xmm0 ; put result in z
	add		ecx, 16
	dec		edx		
	jnz		.for_u16


.last15:
	mov		edx, [ebp + 20]
	and		edx, 15
	test	edx, edx
	jz		.end
	
	add		esi, ecx
	add		edi, ecx
	add		ebx, ecx
		
.for_u1:
	mov		cl, [esi]
	and		cl, [edi]
	cmp		cl, 0
	jnz		.endif
	mov		cl, [esi]
	or		cl, [edi]
	add		eax, 1
.endif:	
	add		esi, 1
	mov		[ebx], cl
	add		edi, 1
	add		ebx, 1
	dec		edx
	jnz		.for_u1


.end:	
	pop		ebx
	pop		edi
	pop		esi
	
	mov		esp, ebp
	pop		ebp
	ret
	
