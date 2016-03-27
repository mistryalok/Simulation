Data segment
        num db 57h
Data ends


code segment
    assume cs:code,ds:data
    
    
start: mov ax,data
        mov ds,ax       
        mov al,num
        mov ah,al
        and al,0Fh
        mov cx,0004h
        shr ah,cl
        or ax,3030h
        
 code ends
end start




