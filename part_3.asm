; 2^𝑐𝑡𝑔 (𝑥) = alpha
; библиотека для макросов SASM
;x = arctan(ln(alpha) / ln(2))
;полиз

%include "io64_float.inc"

section .data ;для объявления неинициализированных переменных
       alpha: dd 1024.0
       two: dd 2.0

section .text
    global main
        main:
        
        mov rbp, rsp; for correct debugging     fld dword [x]
        fld1 ;
        fld1
        fld dword [alpha]
        fyl2x ; st0 - log2 alpha
        
        fpatan 
        xor rax,rax
        ret