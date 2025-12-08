%if __NASM_MAJOR__ >= 2 && __NASM_MINOR__ >= 14
	
%macro _VPXORD_ZMM0 0
	vpxord	zmm0, zmm0
%endmacro
	
%else
	
%macro _VPXORD_ZMM0 0
	vpxor ymm0, ymm0
%endmacro 	
	
%endif
	

