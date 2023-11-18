; 2^𝑐𝑡𝑔 (𝑥) = alpha
; библиотека для макросов SASM
;x = arctan(1/log2(alpha))
;полиз  x = 1 log2 alpha / arctan

%include "io64_float.inc"

section .data
       alpha: dd 1024.0
       two: dd 2.0

section .text
    global main
        main:
        
        mov rbp, rsp; for correct debugging     fld dword [x]
        fld1 ;
        fld1
        fld1
        fld dword [alpha]
        fyl2x ; st0 - log2 alpha
        fdiv ; 1/log
        fpatan 
        xor rax,rax
        ret