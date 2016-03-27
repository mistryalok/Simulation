
data segment
    
    a db 6,5,4,3,2,1
    
    
data ends

code segment
    assume cs:code,ds:data
start: 
    mov ax,data
    mov ds,ax
    mov cx,0005h
    
    lea si,a
again: 
       mov bx,0005h
       mov al,[si]
nexti:    inc si
    mov dl,[si]
    cmp al,dl
    jb end
    mov [si],al
    dec si   
    mov [si],dl
    inc si 
    dec bx
    cmp bl,00h
    jne nexti
    jmp ending  
    
end:xchg al,dl 
    dec bx
    cmp bl,00h
    jne nexti
    jmp ending
            

    
ending: mov si,0000h
        loop again
 code ends 
end start

    
        