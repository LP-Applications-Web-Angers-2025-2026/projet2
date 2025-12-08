global main

section .data
v1:	db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
	db 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32

v2: times 32 db 0

ones: db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1	
	db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	
threshold: db 6
	
section .text

main:
	vpxor	ymm0, ymm0
	vpxor	ymm3, ymm3
	vmovdqu ymm4, [ones]
	
	vpbroadcastb	ymm5, byte [threshold]
	
	vmovdqu		ymm0, [v1]
	vpsubusb	ymm0, ymm5
	vpcmpeqb	ymm0, ymm3
	vpmovmskb   ebx, ymm0
	popcnt		ebx, ebx
	vpandn		ymm0, ymm4
	
	vmovups      [v2], ymm0

    
    ret
