%include "src/popcount_nasm.inc"

global maxpars_sse41
extern popcount_table

section .text

; esi = x
; edi = y
; ebx = z
; ecx = i
; edx = size
; eax = mutations
; ebp = temporary computations
maxpars_sse41:
	push	ebp
	mov		ebp, esp

	mov		eax, [ebp + 20]   ; if (size == 0) return 0
	test	eax, eax
	jz		.end
	
	push	esi
	push	edi
	push	ebx
	
	xor		ecx, ecx
	xor		eax, eax		  ; mutations = 0
	mov		esi, [ebp + 8]    ; x
	mov		edi, [ebp + 12]   ; y
	mov		ebx, [ebp + 16]   ; z
	mov		edx, [ebp + 20]   ; size
	
	and		edx, ~15
	test	edx, edx
	jz		.last_15

	push	ebp             ; temporary
	xor		ebp, ebp

.for_u16:
	cmp		ecx, edx
	jge		.endfor_u16

	pxor	xmm0, xmm0
	movdqu	xmm1, [esi + ecx]
	movdqu	xmm3, [edi + ecx]	
	movdqa	xmm2, xmm1
	movdqa	xmm4, xmm3
	
	pand	xmm1, xmm3
	por		xmm2, xmm4
	
	pcmpeqb	xmm0, xmm1
	
	pmovmskb	ebp, xmm0
	_POPCOUNT_  ebp, ebp
	add		eax, ebp
	
	pblendvb	xmm1, xmm2, xmm0
	
	movdqa	[ebx + ecx], xmm1

	add		ecx, 16
	jmp		.for_u16
.endfor_u16:

	pop		ebp

.last_15:
	mov		edx, [ebp + 20]
	push	ebp
	mov		ebp, eax	
	
.for:
	cmp		ecx, edx
	jge		.endfor
	mov		al, [esi + ecx]
	and		al, [edi + ecx]
	cmp		al, 0
	jnz		.endif
	mov		al, [esi + ecx]
	or		al, [edi + ecx]
	inc		ebp
.endif:	
	mov		[ebx + ecx], al
	add		ecx, 1
	jmp		.for
.endfor:	
	mov		eax, ebp
	pop		ebp
	
	pop		ebx
	pop		edi
	pop		esi
.end:	
	mov		esp, ebp
	pop		ebp
	ret
	
