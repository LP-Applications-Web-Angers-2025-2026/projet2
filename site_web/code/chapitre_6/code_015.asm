push
mov ,rsp
%rep %0 - 1
%ifnum %1
sub ,1
%else
push%1
%endif
%rotate 1
%endrep
and ,0xF
15%endmacro