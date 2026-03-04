; équivalent avec enter/leave :
push ebp          ; → enter 4, 0 (remplace push ebp + mov ebp, esp + sub esp, 4)
mov  ebp, esp
sub  esp, 4
...
mov  esp, ebp     ; → leave (remplace mov esp, ebp + pop ebp)
pop  ebp
ret