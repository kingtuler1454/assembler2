; y> sinh(x)   -gamma
; y> (e^x-e^-x)/2 -gamma
%include "io64_float.inc"
%include "io64.inc"  

section .data ;для объявления неинициализированных переменных
       gamma: dd 0.0
       h: dd 2.0
       x: dd 3.0
       y: dd 0.0
       e: dd 2.71
section .text
    global main
        main:
        mov rbp, rsp; for correct debugging     fld dword [x]
        PRINT_STRING "Enter x: "
        READ_FLOAT [x]
        NEWLINE
        PRINT_STRING "Enter y: "
        READ_FLOAT [y]
        NEWLINE
        fldl2e
        fld dword[x]
        fmul
        fld1
        fld st1
        fprem
        f2xm1
        fadd
        fxch
        fld1
        fscale
        fmul st0,st2      
        fld1
        fdiv st1        
        fsub
        fld1
        fld1
        fadd
        fdiv 
        fld dword[gamma]      
        fsub                                                                                    
        fld dword[y]
        fcomip st1
        fstp ST0
        fstp ST0
        fstp ST0
        ja yes
        jbe no
        
   
        yes:
        PRINT_STRING "true"
        xor rax, rax
        ret
   
        no:
        PRINT_STRING "false"
        xor rax, rax
        ret