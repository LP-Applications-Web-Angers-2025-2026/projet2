extern printf

section .data
    x:   dd 3.14
    msg: db "%f", 0

section .text
    fld  dword [x]      ; charge x
    sub  esp, 8         ; réservation de 64 bits pour la double précision
    fstp qword [esp]    ; stocke en double précision dans la pile
    push msg            ; adresse du format
    call printf
    add  esp, 12        ; supprime les paramètres (8 + 4 octets)