data segment
    
    num db 04h
    sqr db ?
    cube db ?
   
data ends

code segment
    
    assume cs:code, ds:data
    
start:    mov ax,data
    mov ds,ax
    
    mov al,num
    mov bl,al
    mul bl
    mov sqr,al
    mul bl
    mov cube,al
    
    
code ends
end start