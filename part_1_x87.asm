%include "io64_float.inc"
%include "io64.inc"

section .data
    value: dq 0.0
    round_mode: dd 0

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    READ_DOUBLE value
    fstcw [round_mode] ; save the control word
    and al, 0xF3 ; reset 
    mov al, [round_mode+1]
    or al, 8
    mov [round_mode+1], al
    fldcw [round_mode] ; load the control word
    fld qword[value]
    fistp qword[value]
    mov rax, [value]
    PRINT_DEC 8, rax
    xor rax, rax
    ret