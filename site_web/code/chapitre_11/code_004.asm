mov ,ebp-4]
cmp ,ebp+20]
jge ;
<<<1>>>
inc [ebp-4]
jmp
21.endfor_i:
pop ; restauration des registres
pop
pop
mov ,ebp
pop
ret