switch_values_table: ,3,22
switch_jumps_table: ,..@case_3,..@case_22
5section
6main:
...
xor ,ecx
mov ,3
10.for:
cmp ,edx
jge
cmp [switch_values_table+ecx*4],eax
jne
jmp [switch_jumps_table+ecx*4]
16.endif:
inc
jmp
20..@case_1:
...
jmp
23..@case_3:
...
jmp
26..@case_22:
...
jmp
29.default:
...
31.endswitch: