data segment
    
    num db 03h
    sqr db ?
    cube db ?
   
data ends

code segment
    
    assume cs:code, ds:data
    
start:    mov ax,data
    mov ds,ax
    
    mov al,num
    mov cl,al
    dec cl
 again:  mul cl
        loop again
        
    
    
code ends
end start