mov eax, [esp+4]
    cdq                              ; si x < 0, edx=-1. si x>=0, edx=0
    neg eax                          ; si eax!=0 alors CarryFlag=1
    adc eax, edx                     ; eax = CF + edx