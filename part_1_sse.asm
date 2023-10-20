%include "io64_float.inc"
%include "io64.inc"

section .data
    value: dq 0.0

section .text

global main
main:
    mov rbp, rsp; for correct debugging
    xor rax, rax
    READ_DOUBLE xmm0
    stmxcsr [value] ; save
    or qword[value], 0x00004000
    ldmxcsr [value] ; load 
    cvtsd2si rax, xmm0
    PRINT_DEC 8, rax
    xor rax, rax
    ret