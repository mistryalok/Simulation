Data segment
        num dw 3135h
Data ends


code segment
    assume cs:code,ds:data
    
    
start: mov ax,data
        mov ds,ax       
        mov ax,num
        sub al,30h
        mov cx,0004h
        shr al,cl
        sub ah,30h
        mov cx,0004h
        shr ah,cl
        
     
code ends
end start




