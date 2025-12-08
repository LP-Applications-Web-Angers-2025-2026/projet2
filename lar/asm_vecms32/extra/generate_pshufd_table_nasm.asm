global asm_sse_sort

; === DATA ===
section .data

pshufd_label:
	db 0x66, 0x0f, 0x70, 0xc0, 0xe0   ; pshufd xmm0,xmm0,0xe0
	db 0xf3, 0x0f, 0x7f, 0x01         ; movdqu  [ecx], xmm0
	db 0x89, 0xec                     ; mov    esp,ebp
	db 0x5d                      	  ; pop    ebp
    db 0xc3                           ; ret   

; === CODE ===
section .text

; void asm_sse_sort(int *t, int imm);
asm_sse_sort:
	push	ebp
	mov		ebp, esp
	
	mov		ecx, [ebp+8]
	movdqu  xmm0, [ecx]
	mov		eax, [ebp+12]
	mov		edx, pshufd_label
	mov		[edx+4], al
	jmp		pshufd_label
		
	mov		esp, ebp
	pop		ebp
		
