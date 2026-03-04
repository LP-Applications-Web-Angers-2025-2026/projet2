push edx        ; on sauvegarde edx
mov eax, 5
mov ecx, 7
mul ecx         ; edx:eax = 0:35
pop edx         ; on restaure edx