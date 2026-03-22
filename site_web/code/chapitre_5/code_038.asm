; Listing 5.4.8 – Exemple de switch avec table de conversion en assembleur 32 bits
section .data
    switch_values_table: dd 1, 3, 22
    switch_jumps_table:  dd ..@case_1, ..@case_3, ..@case_22
section .text
main:
    ; eax = valeur à comparer
    xor ecx, ecx
    mov edx, 3
.for:
    cmp ecx, edx
    jge .default
    cmp [switch_values_table+ecx*4], eax
    jne .endif
    jmp [switch_jumps_table+ecx*4]
.endif:
    inc ecx
    jmp .for
..@case_1:
    ...
    jmp .endswitch
..@case_3:
    ...
    jmp .endswitch
..@case_22:
    ...
    jmp .endswitch
.default:
    ...
.endswitch: