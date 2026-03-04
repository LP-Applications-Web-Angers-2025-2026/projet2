; Listing 6.2.2 – Appelé en 32 bits
sum:
    push ebp              ; entrée : sauvegarde de ebp
    mov  ebp, esp         ; ebp pointe sur le sommet de pile actuel
    sub  esp, 4           ; création de la variable locale 'r'
    push ebx              ; sauvegarde de ebx (registre à préserver)
    mov  eax, [ebp+8]     ; chargement de 'a'
    mov  ebx, [ebp+12]    ; chargement de 'b'
    add  eax, ebx         ; calcul du résultat
    mov  [ebp-4], eax     ; stockage du résultat dans 'r'
    mov  eax, [ebp-4]     ; valeur de retour dans eax
    pop  ebx              ; restauration de ebx
    mov  esp, ebp         ; sortie : restauration de esp
    pop  ebp              ; restauration de ebp
    ret