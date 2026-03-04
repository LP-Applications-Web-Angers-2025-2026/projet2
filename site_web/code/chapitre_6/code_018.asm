; adressage absolu (-no-pie) :
0:  48 83 ec 08   sub  rsp, 0x8
4:  48 8d 3c 25   lea  rdi, ds:0x0   ; R_X86_64_32S
c:  48 8d 34 25   lea  rsi, ds:0x0   ; R_X86_64_32S
14: b8 00 00 00   mov  eax, 0x0
19: e8 00 00 00   call scanf          ; R_X86_64_PLT32
1e: 48 83 c4 08   add  rsp, 0x8

; adressage relatif (PIC) :
0:  48 83 ec 08   sub  rsp, 0x8
4:  48 8d 3d 00   lea  rdi, [rip+0x0] ; R_X86_64_PC32
b:  48 8d 35 00   lea  rsi, [rip+0x0] ; R_X86_64_PC32
12: b8 00 00 00   mov  eax, 0x0
17: e8 00 00 00   call scanf           ; R_X86_64_PLT32
1c: 48 83 c4 08   add  rsp, 0x8