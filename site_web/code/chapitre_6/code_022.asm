%macro endsp 1-*
end_%1:
    %rotate 1
    %assign i 8
    %rep %0 - 1
        %ifnum %1
            %assign i i + %1
        %else
            mov %1, [rbp-i]
            %assign i i + 8
        %endif
        %rotate 1
    %endrep
    mov rsp, rbp
    pop rbp
    ret
%endmacro