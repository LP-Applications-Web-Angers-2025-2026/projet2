%include "src/asm_config.inc"

; Note that this is a definition of a macro to replace
; the assembly popcnt instruction in case it is not present
; in the instruction set of old processors that have SSE/SSE2

; This macro only deals with 16 bits

%ifdef CPU_POPCNT_COMPLIANT 

	%macro _POPCNT16_EAX_EBX_ 0
	
		popcnt	eax, ebx
		
	%endmacro
	
%else

	%macro _POPCNT16_EAX_EBX_ 0
	
		mov		r15, popcount_table
	    movzx   eax, bh
        and     ebx, 0xFF
        movzx   ebx, byte [r15 + rbx]
        movzx   eax, byte [r15 + rax]
        lea     eax, [eax + ebx]
		
	%endmacro

%endif
