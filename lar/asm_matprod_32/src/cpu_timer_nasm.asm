;%include "src/asm_config.inc"

global cpu_rdtsc_read

%if __BITS__ = 32
 

; void cpu_rdtsc_read(u32 tab[2])  
cpu_rdtsc_read:
	push  	ebx
	xor	 	eax, eax
	cpuid
	rdtsc
	mov	 	ebx, [esp + 8]
	mov		[ebx], eax
	mov  	[ebx + 4], edx
	pop 	ebx
	ret 
 
%else

; void cpu_rdtsc_read(u32 tab[2]) 
cpu_rdtsc_read:
	mov  	[rsp-16], rbx
	xor	 	eax, eax
	cpuid
	rdtsc
	mov		[rdi], eax
	mov  	[rdi + 4], edx
	mov     rbx, [rsp-16]
	ret 

%endif 
