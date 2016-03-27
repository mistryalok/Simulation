Data segment
        num db 72h
        num2 db 14h
        
        
Data ends


code segment
    assume cs:code,ds:data
    
    
start: mov ax,data
        mov ds,ax       
   
        
        mov al,num
        mov dl,num2
        
iter:        cmp al,dl
        jge cont
        xchg al,dl
        mov ah,00h
        
   cont:     div dl
        xor ah,00h
        jz gcd
        mov al,ah
        mov ah,00h
        jmp iter
        
        
        gcd: mov al,dl
     
code ends
end start




