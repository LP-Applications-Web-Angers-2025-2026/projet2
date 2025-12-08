; ------------------------------------------------------------------
; Author: Jean-Michel RICHER
; Email: jean-michel.richer@univ-angers.fr
; Date: September 2018
; ------------------------------------------------------------------

;
; version with .text section writable
; so the instruction in the .text section is modified
;

%include "src/asm_config.inc"

global asm_sse_sort

section .data
  
			 
 	
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
	
	
	BMI2_PEXT		eax, eax, edx
	
	add 		eax, ebx

	pop			ebx		; restore EBX
	
	mov			eax, dword [cases_table + eax * 4]
	jmp			eax


align 4
LP0:
	pshufd xmm0,xmm0,0
	movdqu [ecx],xmm0
	ret
	
align 4	
LP228:
	pshufd xmm0,xmm0,228
	movdqu [ecx],xmm0
	ret
	
align 4	
LP108:
	pshufd xmm0,xmm0,108
	movdqu [ecx],xmm0
	ret

align 4
LP225:
	pshufd xmm0,xmm0,225
	movdqu [ecx],xmm0
	ret

align 4
LP177:
	pshufd xmm0,xmm0,177
	movdqu [ecx],xmm0
	ret

align 4
LP180:
	pshufd xmm0,xmm0,180
	movdqu [ecx],xmm0
	ret

align 4
LP156:
	pshufd xmm0,xmm0,156
	movdqu [ecx],xmm0
	ret

align 4
LP210:
	pshufd xmm0,xmm0,210
	movdqu [ecx],xmm0
	ret

align 4
LP198:
	pshufd xmm0,xmm0,198
	movdqu [ecx],xmm0
	ret

align 4
LP216:
	pshufd xmm0,xmm0,216
	movdqu [ecx],xmm0
	ret

align 4
LP120:
	pshufd xmm0,xmm0,120
	movdqu [ecx],xmm0
	ret

align 4
LP114:
	pshufd xmm0,xmm0,114
	movdqu [ecx],xmm0
	ret

align 4
LP201:
	pshufd xmm0,xmm0,201
	movdqu [ecx],xmm0
	ret

align 4
LP147:
	pshufd xmm0,xmm0,147
	movdqu [ecx],xmm0
	ret

align 4
LP27:
	pshufd xmm0,xmm0,27
	movdqu [ecx],xmm0
	ret

align 4
LP99:
	pshufd xmm0,xmm0,99
	movdqu [ecx],xmm0
	ret

align 4
LP75:
	pshufd xmm0,xmm0,75
	movdqu [ecx],xmm0
	ret

align 4
LP141:
	pshufd xmm0,xmm0,141
	movdqu [ecx],xmm0
	ret

align 4
LP45:
	pshufd xmm0,xmm0,45
	movdqu [ecx],xmm0
	ret

align 4
LP135:
	pshufd xmm0,xmm0,135
	movdqu [ecx],xmm0
	ret

align 4
LP39:
	pshufd xmm0,xmm0,39
	movdqu [ecx],xmm0
	ret

align 4
LP54:
	pshufd xmm0,xmm0,54
	movdqu [ecx],xmm0
	ret

align 4
LP30:
	pshufd xmm0,xmm0,30
	movdqu [ecx],xmm0
	ret

align 4
LP78:
	pshufd xmm0,xmm0,78
	movdqu [ecx],xmm0
	ret

align 4
LP57:
	pshufd xmm0,xmm0,57
	movdqu [ecx],xmm0
	ret


align 16	
cases_table:	
dd LP228, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;9
dd LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP228, LP0, LP0,  ;19
dd LP0, LP0, LP0, LP0, LP0, LP108, LP0, LP0, LP0, LP0,  ;29
dd LP0, LP0, LP0, LP0, LP225, LP177, LP0, LP0, LP0, LP0,  ;39
dd LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP180,  ;49
dd LP0, LP180, LP0, LP0, LP0, LP0, LP0, LP156, LP0, LP0,  ;59
dd LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP210, LP0,  ;69
dd LP198, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;79
dd LP0, LP0, LP0, LP216, LP0, LP0, LP210, LP0, LP0, LP120,  ;89
dd LP0, LP0, LP114, LP0, LP0, LP0, LP0, LP0, LP225, LP225,  ;99
dd LP0, LP0, LP201, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;109
dd LP0, LP0, LP0, LP0, LP0, LP228, LP0, LP0, LP0, LP0,  ;119
dd LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;129
dd LP0, LP0, LP0, LP0, LP0, LP0, LP147, LP0, LP0, LP0,  ;139
dd LP27, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;149
dd LP0, LP0, LP99, LP99, LP0, LP0, LP75, LP0, LP0, LP0,  ;159
dd LP0, LP0, LP0, LP141, LP0, LP0, LP45, LP0, LP0, LP135,  ;169
dd LP0, LP0, LP39, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;179
dd LP0, LP0, LP0, LP0, LP0, LP147, LP0, LP0, LP0, LP0,  ;189
dd LP0, LP0, LP0, LP0, LP0, LP0, LP54, LP0, LP54, LP0,  ;199
dd LP0, LP0, LP0, LP0, LP30, LP0, LP0, LP0, LP0, LP0,  ;209
dd LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;219
dd LP78, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;229
dd LP57, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;239
dd LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0, LP0,  ;249
dd LP0, LP0, LP0, LP0, LP0, LP0,

