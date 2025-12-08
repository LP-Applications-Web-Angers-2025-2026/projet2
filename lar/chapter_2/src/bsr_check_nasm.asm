global _bsr
global _lzcnt
global full_bsr
global full_lzcnt
global full_bsr_ur4
global full_lzcnt_ur4

section .text

_bsr:
	push	ebp
	mov		ebp, esp
	mov		eax, [ebp+8]
	bsr		eax, eax
	mov		esp, ebp
	pop		ebp
	ret

full_bsr:
	push	ebp
	mov		ebp, esp
	push	ebx
	
	mov		ebx, [ebp + 8]
	mov		ecx, 3000000000
.begin:	
	mov		eax, ebx
	bsr		eax, eax
	loop	.begin
	
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret


full_bsr_ur4:
	push	ebp
	mov		ebp, esp
	push	ebx
	
	mov		ebx, [ebp + 8]
	mov		ecx, 3000000000/4
.begin:	
	mov		eax, ebx
	bsr		eax, eax
	mov		eax, ebx
	bsr		eax, eax
	mov		eax, ebx
	bsr		eax, eax
	mov		eax, ebx
	bsr		eax, eax
	
	loop	.begin
	
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret
	
_lzcnt:
	push	ebp
	mov		ebp, esp
	mov		eax, 31
	mov		edx, [ebp+8]
	lzcnt	edx, edx
	sub		eax, edx
	mov		esp, ebp
	pop		ebp
	ret	


full_lzcnt:
	push	ebp
	mov		ebp, esp
	push	ebx
	
	mov		ebx, [ebp + 8]
	
	mov		ecx, 3000000000
.begin:	
	mov		eax, 31
	mov		edx, ebx
	lzcnt	ebx, ebx
	sub		eax, ebx
	loop	.begin
	
	
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret
	
full_lzcnt_ur4:
	push	ebp
	mov		ebp, esp
	push	ebx
	
	mov		ebx, [ebp + 8]
	
	mov		ecx, 3000000000/4
.begin:	
	mov		eax, 31
	mov		edx, ebx
	lzcnt	ebx, ebx
	sub		eax, ebx
	
	mov		eax, 31
	mov		edx, ebx
	lzcnt	ebx, ebx
	sub		eax, ebx

	mov		eax, 31
	mov		edx, ebx
	lzcnt	ebx, ebx
	sub		eax, ebx

	mov		eax, 31
	mov		edx, ebx
	lzcnt	ebx, ebx
	sub		eax, ebx
	
	loop	.begin
	
	pop		ebx
	mov		esp, ebp
	pop		ebp
	ret	
