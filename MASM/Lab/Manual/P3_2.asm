
data segment
    
    a db 6,5,4,3,2,1
    
    
data ends

code segment
    assume cs:code,ds:data
start: 
    mov ax,data
    mov ds,ax
    mov cx,0005h
    lea si,a[0]
    mov al,[si]
    mov bp,0000h
    inc bp
    mov dl,[si+bp]
    cmp al,dl
    jb ok
    dec bp
    mov dl,[si+bp]
     
    
    
 code ends 
end start

    
        