%include "io64_float.inc"

section .data
    start: dq 1
    var: dd 3.0
    end: dq 25
    
    
section .rodata
    one: dd 1.0
    two: dd 2.0
    
    
section .text
    global main
    main:
        mov rbp, rsp; for correct debugging
        READ_FLOAT xmm0
        movss xmm1, xmm0
         movss xmm8, [one]
        movss xmm7, [two]
        movss xmm3, [one]
         addss xmm3, xmm0
        mov rax, [start]
        mov rbx, [end]
        loop:
         cmp rax, rbx
         jge finish
          mulss xmm1, xmm0
          movss xmm2, xmm1
          mulss xmm8, xmm7
          divss xmm2, xmm8
          addss xmm3, xmm2
          addss xmm7, [one]
          inc rax 
         jmp loop ; xmm3 результат
        finish:
        xor rax, rax
        ret