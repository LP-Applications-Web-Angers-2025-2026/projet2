global main

section .data

	x0:	dd	0, 3, 2, 1
	
	
section .text

main:
	pushad
	
	movdqu	xmm0, [x0]
	; xmm1 = [4, 1, 2, 3]
	pshufd  xmm1, xmm0, 00111001b ; 0x39
	; xmm2 = [3, 4, 1, 2]
	pshufd 	xmm2, xmm0, 01001110b ; 0x4E

	push		ebx				; save EBX
	
	mov			edx, 0x1111		; mask for pext
	
	pcmpgtd		xmm1, xmm0
	pmovmskb 	eax, xmm1
	pext		ebx, eax, edx
	
	pop		ebx
	
	popad
	xor		eax, eax
	ret
