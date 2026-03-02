mov %1,rbp-i]
%assign i i + 8
%endif
%rotate 1
%endrep
mov ,rbp
pop
ret
17%endmacro