data segment
    
    num db 6,6,6,6,6,6,6
    
   
data ends

code segment
    
    assume cs:code, ds:data
    
start:    mov ax,data
    mov ds,ax
    
    lea si,num[0]
    mov al,num[0]
    mov cl,al    
    mov bp,0001h 
    mov al,00h
next: add al,[si+bp]
    inc bp
    loop next
    mov bl,num[0]
    mov ah,00h
    div bl    
    
    
code ends
end start