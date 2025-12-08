%ifdef CPU_POPCNT_COMPLIANT

	%macro _POPCOUNT_ 2
	
		popcnt	%1, %2
		
	%endmacro
	
%else

	%macro _POPCOUNT_ 2

		push    ecx
		push    ebx
		mov		ebx, %1
        movzx   ecx, bh
		and     ebx, 0xFF
		movzx   ebx, byte [popcount_table + ebx]
        movzx   ecx, byte [popcount_table + ecx]
		lea     ebx, [ebx + ecx]
		mov		%2, ebx
		pop		ebx
		pop     ecx
	
	%endmacro

%endif

