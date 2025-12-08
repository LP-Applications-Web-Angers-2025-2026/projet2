%ifdef CPU_POPCNT_COMPLIANT

	%macro _POPCOUNT32_ 2
	
		popcnt	%1, %2
		
	%endmacro
	
%else

	%macro _POPCOUNT32_ 2

		mov     [rsp-64], rcx
		mov     [rsp-72], rbx
		mov     [rsp-80], r15
		mov		ebx, %1
        movzx   ecx, bh
		and     ebx, 0xFF
		mov		r15, popcount_table
		movzx   ebx, byte [r15 + rbx]
        movzx   ecx, byte [r15 + rcx]
		add     ebx, ecx
		mov		%2, ebx
		mov     r15, [rsp-80]
		mov		rbx, [rsp-72]
		mov     rcx, [rsp-64]
	
	%endmacro

%endif

