; y> sin (h) * x -hamma

%include "io64_float.inc"
%include "io64.inc"  

section .data ;для объявления неинициализированных переменных
       gamma: dd -24.0
       h: dd 2.0
       x: dd 0.0
       y: dd 0.0
section .text
    global main
        main:
        mov rbp, rsp; for correct debugging     fld dword [x]
        PRINT_STRING "Enter y: "
        READ_FLOAT [y]
        NEWLINE
        PRINT_STRING "Enter x: "
        READ_FLOAT [x]
        NEWLINE
        
        fld dword[h]
        fsin
        fld dword[x]
        fmul
        fld dword[gamma]
        fsub 
        fld dword[y]
        fcomi st1
        ja yes
        jbe no
        
        yes:
        PRINT_STRING "true"
         ret
        no:
        PRINT_STRING "false"
        ret