%macro defsp 1-*
%1:
    %rotate 1
    push rbp
    mov  rbp, rsp
    %rep %0 - 1
        %ifnum %1
            sub rsp, %1
        %else
            push %1
        %endif
        %rotate 1
    %endrep
    and  rsp, ~0xF
%endmacro