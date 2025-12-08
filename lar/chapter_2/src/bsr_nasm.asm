global method_4
global method_5
global method_6
global method_7
global method_8
global method_9

section .text

%macro BODY_BSR1 1
	mov		esi, [ebx + ecx * 4]	; load t[i]
	bsr		esi, esi				; find msb
	add		eax, esi				; add to final result
%endmacro

%macro BODY_BSR2 2
	mov		edi, [ebx + ecx * 4]	; load t[i]
	bsr		edi, edi				; find msb
	add		eax, edi				; add to final result
%endmacro


%macro BODYLZ 1
	mov		edi, 31
	mov		esi, [ebx + ecx * 4 + %1]	; load t[i]
	lzcnt	esi, esi					; find msb
	sub		edi, esi
	add		eax, edi					; add to final result

%endmacro


; -------------------------------------------------------------------
; SUBPROGRAM
;    
;   u32 method_4(u32 *t, u32 size);
;
; DESCRIPTION
;  
;   Function that computes the sum of the most significant bits
;   of an array of unsigned integers by using a loop that calls
;   the bsr instruction
;
; PARAMETERS
;
;   t		u32 *		array of unsigned values
;	size	u32			size of the array
;
; RETURN VALUE
;
;  the sum of all significant bits of the array 't'
;
; VARIABLES / REGISTERS
;
; t			u32 *		array of u32		[ebp+8]		ebx
; size		u32			size of the array 	[ebp+12]	edx
; i			u32			loop variable					ecx
; 			u32			temporary						esi
;			u32			sum, return value				eax
; -------------------------------------------------------------------
method_4:
	push	ebp
	mov		ebp, esp
	xor		eax, eax				; sum = 0
	
	mov		edx, [ebp+12]			; if size == 0 go to end
	test	edx, edx
	jz		.end
	
	push	ebx
	push	esi
	
	mov		ebx, [ebp + 8]
	xor		ecx, ecx
	
.for:
	mov		esi, [ebx + ecx * 4]	; load t[i]
	bsr		esi, esi				; find msb
	add		eax, esi				; add to final result
	
	inc		ecx
	cmp		ecx, edx			
	jne		.for	

	
	pop		esi
	pop		ebx
	
.end:	
	mov		esp, ebp
	pop		ebp
	ret
; end of method_4


; -------------------------------------------------------------------
; SUBPROGRAM
;    
;   u32 method_5(u32 *t, u32 size);
;
; DESCRIPTION
;  
;   Function that computes the sum of the most significant bits
;   of an array of unsigned integers by using a loop that calls
;   the bsr instruction and unroll the loop by 4
;
; PARAMETERS
;
;   t		u32 *		array of unsigned values
;	size	u32			size of the array
;
; RETURN VALUE
;
;  the sum of all significant bits of the array 't'
;
; VARIABLES / REGISTERS
;
; t			u32 *		array of u32		[ebp+8]		ebx
; size		u32			size of the array 	[ebp+12]	edx
; i			u32			loop variable					ecx
; 			u32			temporary						esi
;			u32			sum, return value				eax
; -------------------------------------------------------------------
method_5:
	push	ebp
	mov		ebp, esp
	xor		eax, eax
	
	mov		edx, [ebp+12]			; if size == 0 go to end
	test	edx, edx
	jz		.end
	
	push	ebx
	push	esi
	
	mov		ebx, [ebp + 8]			; ebx = t
	
	and		edx, ~3					; edx = size multiple of 4
	test	edx, edx
	jz		.last_3
	xor		ecx, ecx
	
.for:
	mov		esi, [ebx + ecx * 4]		; load t[i]
	bsr		esi, esi
	add		eax, esi					; add to final result
	
	mov		esi, [ebx + ecx * 4 + 4]	; load t[i+1]
	bsr		esi, esi
	add		eax, esi					; add to final result
	
	mov		esi, [ebx + ecx * 4 + 8]	; load t[i+2]
	bsr		esi, esi
	add		eax, esi					; add to final result
	
	mov		esi, [ebx + ecx * 4 + 12]	; load t[i+3]
	bsr		esi, esi
	add		eax, esi					; add to final result
	
	add		ecx, 4
	cmp		ecx, edx			
	jne		.for	


.last_3:
	mov		edx, [ebp+12]
	and		edx, 3
	test	edx, edx
	jz		.next
	cmp		edx, 2
	je		.last_2
	cmp		edx, 1
	je		.last_1
	
	mov		esi, [ebx + ecx * 4]		; load t[i]
	bsr		esi, esi					; find msb
	add		eax, esi					; add to final result	
	inc		ecx
.last_2:
	mov		esi, [ebx + ecx * 4]		; load t[i]
	bsr		esi, esi					; find msb
	add		eax, esi					; add to final result	
	inc		ecx
.last_1:	
	mov		esi, [ebx + ecx * 4]		; load t[i]
	bsr		esi, esi					; find msb
	add		eax, esi					; add to final result	
	inc		ecx

.next:
	pop		esi
	pop		ebx
	
.end:	
	mov		esp, ebp
	pop		ebp
	ret
; end of method_5

	
; -------------------------------------------------------------------
; SUBPROGRAM
;    
;   u32 method_6(u32 *t, u32 size);
;
; DESCRIPTION
;  
;   Function that computes the sum of the most significant bits
;   of an array of unsigned integers by using a loop that calls
;   the bsr instruction and :
;   - unroll the loop by 4
;   - try to avoid dependancies using edi and ebp
;   - use a switch for the last iterations
;   - don't use ebp to get parameters get them from esp
;
; PARAMETERS
;
;   t		u32 *		array of unsigned values
;	size	u32			size of the array
;
; RETURN VALUE
;
;  the sum of all significant bits of the array 't'
;
; VARIABLES / REGISTERS
;
; t			u32 *		array of u32		[ebp+8]		ebx
; size		u32			size of the array 	[ebp+12]	edx
; i			u32			loop variable					ecx
; 			u32			temporary						esi
; 			u32			temporary						edi
; 			u32			partial sum  					ebp
;			u32			partiam sum, return value		eax
; -------------------------------------------------------------------
align 4
method_6_switch:	dd ..@case0, ..@case1, ..@case2, ..@case3,

align 4
method_6:
;	push	ebp
;	mov		ebp, esp
	xor		eax, eax
	
;	mov		edx, [ebp+12]			; if size == 0 go to end
	mov		edx, [esp+8]
	test	edx, edx
	jz		.end
	
	push	ebx
	push	esi
	push	edi
	
;	mov		ebx, [ebp + 8]
	mov		ebx, [esp + 16]
	and		edx, ~3
	test	edx, edx
	jz		.last_3
	xor		ecx, ecx
	
	push	ebp
	xor		ebp, ebp
	
	; partial sums
	; eax and esi
	; ebp and edi
.for:
	mov		esi, [ebx + ecx * 4]		; load t[i]
	bsr		esi, esi
	add		eax, esi					; add to final result
	
	mov		edi, [ebx + ecx * 4 + 4]	; load t[i+1]
	bsr		edi, edi
	add		ebp, edi					; add to final result

	mov		esi, [ebx + ecx * 4 + 8]	; load t[i+2]
	bsr		esi, esi
	add		eax, esi					; add to final result

	mov		edi, [ebx + ecx * 4 + 12]	; load t[i+3]
	bsr		edi, edi
	add		ebp, edi					; add to final result
		
	add		ecx, 4
	cmp		ecx, edx			
	jne		.for	


	add		eax, ebp
	pop		ebp

.last_3:
;	mov		edx, [ebp+12]
	mov		edx, [esp+20]
	and		edx, 3
	jmp		[method_6_switch + edx * 4]

	nop
	
align 16
..@case3:	
	mov		esi, [ebx + ecx * 4]		; load t[i]
	bsr		esi, esi
	add		eax, esi
	inc		ecx

..@case2:	
	mov		esi, [ebx + ecx * 4]		; load t[i]
	bsr		esi, esi
	add		eax, esi
	inc		ecx

..@case1:	
	mov		esi, [ebx + ecx * 4]		; load t[i]
	bsr		esi, esi
	add		eax, esi
	
..@case0:
	
	pop		edi
	pop		esi
	pop		ebx

.end:
;	mov		esp, ebp
;	pop		ebp
	ret	
; end of method 6




; -------------------------------------------------------------------
; SUBPROGRAM
;    
;   u32 method_7(u32 *t, u32 size);
;
; DESCRIPTION
;  
;   Function that computes the sum of the most significant bits
;   of an array of unsigned integers by using a loop that calls
;   the lzcnt instruction
;
; PARAMETERS
;
;   t		u32 *		array of unsigned values
;	size	u32			size of the array
;
; RETURN VALUE
;
;  the sum of all significant bits of the array 't'
;
; VARIABLES / REGISTERS
;
; t			u32 *		array of u32		[ebp+8]		ebx
; size		u32			size of the array 	[ebp+12]	edx
; i			u32			loop variable					ecx
; 			u32			temporary						esi
; 			u32			temporary						edi
;			u32			return value					eax
; -------------------------------------------------------------------
method_7:
	push	ebp
	mov		ebp, esp
	xor		eax, eax
	
	mov		edx, [ebp+12]			; if size == 0 go to end
	test	edx, edx
	jz		.end
	
	push	ebx
	push	esi
	push	edi
	
	mov		ebx, [ebp + 8]
	xor		ecx, ecx
	
.for:
	mov		edi, 31
	mov		esi, [ebx + ecx * 4]		; load t[i]
	inc		ecx
	lzcnt	esi, esi					; find msb
	sub		edi, esi
	add		eax, edi
	cmp		ecx, edx			
	jne		.for	

	pop		edi
	pop		esi
	pop		ebx
	
.end:	
	mov		esp, ebp
	pop		ebp
	ret
; end of method 7	
	


; -------------------------------------------------------------------
; SUBPROGRAM
;    
;   u32 method_8(u32 *t, u32 size);
;
; DESCRIPTION
;  
;   Function that computes the sum of the most significant bits
;   of an array of unsigned integers by using a loop that calls
;   the lzcnt instruction. The loops is unrolled by a factor of 4
;
; PARAMETERS
;
;   t		u32 *		array of unsigned values
;	size	u32			size of the array
;
; RETURN VALUE
;
;  the sum of all significant bits of the array 't'
;
; VARIABLES / REGISTERS
;
; t			u32 *		array of u32		[ebp+8]		ebx
; size		u32			size of the array 	[ebp+12]	edx
; i			u32			loop variable					ecx
; 			u32			temporary						esi
; 			u32			temporary						edi
;			u32			return value					eax
; -------------------------------------------------------------------
align 4
method_8_switch:	dd ..@m8_case0, ..@m8_case1, ..@m8_case2, ..@m8_case3,

align 4
method_8:
	push	ebp
	mov		ebp, esp
	xor		eax, eax
	
	mov		edx, [ebp+12]			; if size == 0 go to end
	test	edx, edx
	jz		.end
	
	push	ebx
	push	esi
	push	edi
	
	and		edx, ~3
	test	edx, edx
	jz		.last_3
	
	mov		ebx, [ebp + 8]
	xor		ecx, ecx
	
	push	ebp
	xor		ebp, ebp
	
.for:
	
	add		eax, 31*2
	add		ebp, 31*2
	
	mov		esi, [ebx + ecx * 4]		; load t[i]
	lzcnt	esi, esi					; find msb
	sub		eax, esi
	
	mov		edi, [ebx + ecx * 4 + 4]	; load t[i+1]
	lzcnt	edi, edi					; find msb
	sub		ebp, edi

	mov		esi, [ebx + ecx * 4 + 8]	; load t[i+2]
	lzcnt	esi, esi					; find msb
	sub		eax, esi
	
	mov		edi, [ebx + ecx * 4 + 12]	; load t[i+3]
	lzcnt	edi, edi					; find msb
	sub		ebp, edi
	
	add		ecx, 4
	cmp		ecx, edx			
	jne		.for	

	add		eax, ebp
	pop		ebp

.last_3:
.last_3:
	mov		edx, [ebp+12]
	and		edx, 3
	jmp		[method_6_switch + edx * 4]

	nop
	
align 16
..@m8_case3:	
	add		eax, 31
	mov		esi, [ebx + ecx * 4]		; load t[i]
	inc		ecx
	lzcnt	esi, esi					; find msb
	sub		eax, esi

..@m8_case2:	
	add		eax, 31
	mov		esi, [ebx + ecx * 4]		; load t[i]
	inc		ecx
	lzcnt	esi, esi					; find msb
	sub		eax, esi

..@m8_case1:	
	add		eax, 31
	mov		esi, [ebx + ecx * 4]		; load t[i]
	lzcnt	esi, esi					; find msb
	sub		eax, esi
	
..@m8_case0:
	
	pop		edi
	pop		esi
	pop		ebx

.end:
	mov		esp, ebp
	pop		ebp
	ret	
; end of method 8



; -------------------------------------------------------------------
; SUBPROGRAM
;    
;   u32 method_9(u32 *t, u32 size);
;
; DESCRIPTION
;  
;   Function that computes the sum of the most significant bits
;   of an array of unsigned integers by using a loop that calls
;   the vector lzcnt instruction. Can only be used with AVX-512.
;
; PARAMETERS
;
;   t		u32 *		array of unsigned values
;	size	u32			size of the array
;
; RETURN VALUE
;
;  the sum of all significant bits of the array 't'
;
; VARIABLES / REGISTERS
;
; t			u32 *		array of u32		[ebp+8]		ebx
; size		u32			size of the array 	[ebp+12]	edx
; i			u32			loop variable					ecx
; 			u32			temporary						esi
; 			u32			temporary						edi
;			u32			return value					eax
; -------------------------------------------------------------------
method_9:
	push	ebp
	mov		ebp, esp
	
	xor		eax, eax
	mov		edx, [ebp + 12]
	test	edx, edx
	jz		.end
	
	mov		ebx, [ebp + 8]

	xor		ecx, ecx
	
	and		edx, ~3
	cmp		edx, 4
	jl		.last_3
	
	mov		eax, 31
	movd	xmm7, eax
	pshufd	xmm7, xmm7, 0
	pxor	xmm0, xmm0
	
.for:
	movdqa	xmm1, xmm7
	vplzcntd	xmm2, [ebx + ecx * 4] 
	psubd	xmm1, xmm2	
	paddd	xmm0, xmm1

	add		ecx, 4
	
	cmp		ecx, edx			
	jne		.for	

	phaddd	xmm0, xmm0
	phaddd	xmm0, xmm0
	movd	eax, xmm0


.last_3:
	mov		edx, [ebp + 12]
	push	edi
	push	esi
.while:
	cmp		ecx, edx
	jge		.end_while

	mov		edi, 31
	mov		esi, [ebx + ecx * 4]
	lzcnt	esi, esi
	sub		edi, esi	
	add		eax, edi

	inc		ecx	
	jmp		.while
.end_while:
	pop		esi
	pop		edi

.end:	
	mov		esp, ebp
	pop		ebp
	ret
; end of method 9
