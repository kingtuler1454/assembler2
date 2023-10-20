; Задание1: реализовать функцию, округляющую введенное 
; пользователем вещественное число до ближайшего целого:
; 1) вверх
;
; принимаем на вход значение
; если больше нуля то хуярим +1
; иначе -1
;
;
;

; библиотека для макросов SASM
%include "io64_float.inc"

section .data ;для объявления неинициализированных переменных
    value: dd 6.3
    ten: dd 10.0
    five: dd 5.0
    one: dd 1.0


section .text
    global main
        main:
        mov rbp, rsp       ; Устанавливаем rbp для правильной отладки
        fld dword [five]
        fld dword [value]
        fld dword [ten]   ; Загружаем целое число 10 на стек FPU
        fld dword [value]  
        fld dword [ten]             
        fmul    
        fprem     ; Выполняем деление
        fcomi st2
        jae more_five
        jb less_five
   
        
        less_five:
        fld dword [value]
        FRNDINT 
        fld dword [one] 
        fadd 
        fcomi st6
        jmp exit
  
        more_five:  
        fld dword [value]
        FRNDINT  
        fld dword [value]
        jmp exit   
        
        exit:
        finit
        xor eax eax
        ret
        
        
       