; ------------------------------------------------------------------
; Author: Jean-Michel RICHER
; Email: jean-michel.richer@univ-angers.fr
; Date: September 2018
; ------------------------------------------------------------------

;
; version with .data section modification
; so the instruction in the .data section is modified
;

%include "src/asm_config.inc"

global asm_sse_sort

section .data
  
			 
align(16)
pshufd_table: db 228,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,
db 228,0,0,0,0,0,0,0,
db 108,0,0,0,0,0,0,0,
db 0,225,177,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,
db 180,0,180,0,0,0,0,0,
db 156,0,0,0,0,0,0,0,
db 0,0,0,210,0,198,0,0,
db 0,0,0,0,0,0,0,0,
db 0,0,216,0,0,210,0,0,
db 120,0,0,114,0,0,0,0,
db 0,225,225,0,0,201,0,0,
db 0,0,0,0,0,0,0,0,
db 0,0,228,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,147,
db 0,0,0,27,0,0,0,0,
db 0,0,0,0,0,0,0,99,
db 99,0,0,75,0,0,0,0,
db 0,0,141,0,0,45,0,0,
db 135,0,0,39,0,0,0,0,
db 0,0,0,0,0,0,0,0,
db 147,0,0,0,0,0,0,0,
db 0,0,0,54,0,54,0,0,
db 0,0,0,30,0,0,0,0,
db 0,0,0,0,0,0,0,0,
db 0,0,0,78,0,0,0,0,
db 0,0,0,0,0,57,0,0,
db 0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0

;
align 16

pshufd_label_data: 	

	db	0x66, 0x0f, 0x70, 0xc0, 0xe0 ; pshufd xmm0,xmm0,0xe0
 	db  0xf3, 0x0f, 0x7f, 0x01       ; movdqu [ecx],xmm0
	db 	0xc3                         ; ret    
 	
section .text
	
; ------------------------------------------	
; !!!!!!!!!!!!!!!!!! Note !!!!!!!!!!!!!!!!!!
; this is a fast call subprogram so first
; parameter t is placed in ECX in 32 bits
; for GCC/G++
;
; void asm_sse_sort(int *t)
;

;%define BMI2

; PEXT result, input, mask

%ifdef CPU_BMI2_COMPLIANT

	%macro BMI2_PEXT 3
		pext		%1, %2, %3
	%endmacro

%else

	%macro BMI2_PEXT 3
		and		%2, %3
		mov		%1, %2
		shr		%2, 3
		or		%1, %2
		shr 	%2, 3
		or		%1, %2
		shr		%2, 3
		or		%1, %2
		and		%1, 1111b
	%endmacro

%endif


asm_sse_sort:
	; xmm0 = [1, 2, 3, 4]
	movdqu	xmm0, [ecx]
	; xmm1 = [4, 1, 2, 3]
	pshufd  xmm1, xmm0, 00111001b ; 0x39
	; xmm2 = [3, 4, 1, 2]
	pshufd 	xmm2, xmm0, 01001110b ; 0x4E

	push		ebx				; save EBX
	
	mov			edx, 0x1111		; mask for pext
	
	pcmpgtd		xmm1, xmm0
	pmovmskb 	eax, xmm1
	BMI2_PEXT	ebx, eax, edx
	
	;  and		eax, edx
	;	mov		ebx, eax
	;	shr		eax, 3
	;	or		ebx, eax
	;	shr 	eax, 3
	;	or		ebx, eax
	;	shr		eax, 3
	;	or		ebx, eax
	;	and		ebx, 1111b
		
	shl			ebx, 4
			
	pcmpgtd		xmm2, xmm0
	pmovmskb 	eax, xmm2
	
%ifdef CPU_BMI2_COMPLIANT
	BMI2_PEXT		eax, eax, edx
%else
	push			ebx
	mov				ebx, eax
	BMI2_PEXT		eax, ebx, edx
	pop				ebx
%endif	
	
	add 		eax, ebx

	; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	; !!!!!!!!!! modifiy in .text section !!!!!!!!!!
	; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	mov			edx, pshufd_label_data
	
	movzx		eax, byte [pshufd_table + eax]
	mov			[edx+4], al

	pop			ebx		; restore EBX
	
	; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	; !!!!!!!!!! modifiy in .text section !!!!!!!!!!
	; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
	jmp		pshufd_label_data


