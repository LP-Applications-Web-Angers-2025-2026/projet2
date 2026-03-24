.case:
    cmp eax, MAX_CASE
    ja .default
    jmp [jump_table + eax*4]