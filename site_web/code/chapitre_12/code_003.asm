push
mov ,esp
mov ,ebp+8]
mov ,ecx ; edx = n
shr ,3 ; edx = n / 8
and ,7 ; ecx = n % 8
mov ,1 ; eax = 1
shl ,cl ; eax = 1 << (n % 8)
or [tab_process_bits +edx],al
mov ,ebp
pop
ret