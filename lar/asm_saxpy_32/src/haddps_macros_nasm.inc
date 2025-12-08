%include "src/asm_config.inc"

%ifdef CPU_SSE3_COMPLIANT

	%macro M_HADDPS32b	2
		haddps	%1, %2
	%endmacro

	%macro M_2xHADDPS32b 1
		haddps	%1, %1
		haddps	%1, %1
	%endmacro

%else

	%macro M_HADDPS32b	2
		sub			esp, 32
		movdqu		[esp], %2
		movdqu		[esp+16], %1
		
		movss		%1, [esp+28]
		addss		%1, [esp+24]
		movss		[esp+28], %1
		
		movss		%1, [esp+16]
		addss		%1, [esp+20]
		movss		[esp+24], %1
		
		movss		%1, [esp+12]
		addss		%1, [esp+8]
		movss		[esp+20], %1
		
		movss		%1, [esp+4]
		addss		%1, [esp+0]
		movss		[esp+16], %1
		
		movdqu		%1, [esp+16]
		add			esp, 32
	%endmacro
	
	%macro M_2xHADDPS32b 1
		sub		esp, 16
		movdqu	[esp], %1
		addss	%1, [esp+4]
		addss	%1, [esp+8]
		addss	%1, [esp+12]
		shufps	%1, %1, 0
		add		esp, 16		
	%endmacro

%endif
