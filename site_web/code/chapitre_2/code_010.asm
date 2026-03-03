mov eax, 173        ; x
mov edx, 0xCCCCCCCD ; a
mul edx
mov eax, edx
shr eax, 3