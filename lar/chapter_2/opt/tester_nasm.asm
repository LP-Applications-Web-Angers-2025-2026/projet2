global main
extern posix_memalign
extern printf
extern atoi

section .data
	
	SIZE	EQU 100000+3
	
	tab:	dd 0
	t_start:	dd 0, 0
	t_stop:		dd 0, 0
	t_diff:		dd 0, 0
	
	method:	dd 1
	
	msg:		db "cycles=%lu", 10, 0
	
section .text

; ====================================================
; call to bsr on Ryzen 5 3600
; ====================================================
align 16
f1:
    push	ebx
	mov	edx, [esp+12]
	test	edx, edx
	je	.L4
	mov	eax, [esp+8]
	xor	ebx, ebx
	lea	ecx, [eax+edx*4]
	lea	edx, [0+edx*4-4]
	shr	edx, 2
	inc	edx
	and	edx, 3
	je	.L3
	cmp	edx, 1
	je	.L15
	cmp	edx, 2
	je	.L16
	mov	ebx, [eax]
	add	eax, 4
	bsr ebx, ebx
.L16:
	mov	edx, [eax]
	add	eax, 4
	bsr edx, edx
	add	ebx, edx
.L15:
	mov	edx, [eax]
	add	eax, 4
	bsr edx, edx
	add	ebx, edx
	cmp	eax, ecx
	je	.L1
.L3:
	mov	edx, [eax]
	add	eax, 16
	bsr edx, edx
	add	edx, ebx
	mov	ebx, [eax-12]
	bsr ebx, ebx
	add	edx, ebx
	mov	ebx, [eax-8]
	bsr ebx, ebx
	add	edx, ebx
	mov	ebx, [eax-4]
	bsr ebx, ebx
	add	ebx, edx
	cmp	eax, ecx
	jne	.L3
.L1:
	mov	eax, ebx
	pop	ebx
	ret
	
.L4:
	xor	ebx, ebx
	mov	eax, ebx
	pop	ebx
	ret

; ====================================================
; call 31 - __builtin_clz(t[i]) on Ryzen 5 3600
; ====================================================
align 16
f2:
	push	edi
	push	esi
	push	ebx
	mov		edx, [esp+20]
	test	edx, edx
	je	.L4
	mov	eax, [esp+16]
	lea	edi, [0+edx*4-4]
	xor	esi, esi
	mov	ecx, 31
	shr	edi, 2
	inc	edi
	and	edi, 3
	lea	ebx, [eax+edx*4]
	je	.L3
	cmp	edi, 1
	je	.L15
	cmp	edi, 2
	je	.L16
	bsr	edx, [eax]
	mov	esi, ecx
	xor	edx, 31
	add	eax, 4
	sub	esi, edx
.L16:
	bsr	edx, [eax]
	mov	edi, ecx
	xor	edx, 31
	add	eax, 4
	sub	edi, edx
	add	esi, edi
.L15:
	bsr	edx, [eax]
	mov	edi, ecx
	xor	edx, 31
	add	eax, 4
	sub	edi, edx
	add	esi, edi
	cmp	ebx, eax
	je	.L1
.L3:
	bsr	edi, [eax]
	mov	edx, ecx
	xor	edi, 31
	add	eax, 16
	sub	edx, edi
	mov	edi, ecx
	add	edx, esi
	bsr	esi, [eax-12]
	xor	esi, 31
	sub	edi, esi
	bsr	esi, [eax-8]
	xor	esi, 31
	add	edx, edi
	mov	edi, ecx
	sub	edi, esi
	mov	esi, ecx
	add	edx, edi
	bsr	edi, [eax-4]
	xor	edi, 31
	sub	esi, edi
	add	esi, edx
	cmp	ebx, eax
	jne	.L3
.L1:
	pop	ebx
	mov	eax, esi
	pop	esi
	pop	edi
	ret
	
.L4:
	
	xor	esi, esi
	pop	ebx
	mov	eax, esi
	pop	esi
	pop	edi
	ret


align 4
table_methods: dd 0, f1, f2, 0


; ====================================================
main:
	push	ebp
	mov		ebp, esp
	
	; command line parameter is method number
	mov		eax, [ebp+8]
	cmp		eax, 1
	jle		.next

	; method = atoi(argv[1])
	mov		eax, [ebp + 12]
	push	dword [eax + 4]
	call	atoi
	add		esp, 4
	mov		[method], eax
	

.next:	
	mov		eax, SIZE
	shl		eax, 2
	
	push	eax
	push	dword 16
	push	dword tab
	call	posix_memalign
	add		esp, 12
	
	xor		eax, eax
	cpuid
	rdtsc
	mov		[t_start], eax
	mov		[t_start+4], edx
	
	mov		ebx, 10000
.while:	
	
	mov		eax, SIZE
	push	eax
	push	dword [tab]
	mov		eax, [method]
	call	[table_methods + eax * 4]
	add		esp, 8
	
	dec		ebx
	jnz		.while
	
	xor		eax, eax
	cpuid
	rdtsc
	mov		[t_stop], eax
	mov		[t_stop+4], edx
	
	sub		eax, [t_start]
	mov		[t_diff], eax
	sbb		edx, [t_start+4]
	mov		[t_diff+4], edx
	
	
	push	dword [t_diff+4]
	push	dword [t_diff]
	push	dword msg
	call	printf
	add		esp, 12
		
	
	xor		eax, eax
	mov		esp, ebp
	pop		ebp
	ret
