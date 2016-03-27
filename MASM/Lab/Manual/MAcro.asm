data segment
    
    num db 10 dup(10)
       s db 'Alok$'
    
   
data ends
   
     alok macro m1,m2
       mov m1,00h 
       mov m2,05h
       endm  
        
code segment
    
    assume cs:code, ds:data 
    
start:    mov ax,data
    mov ds,ax
   
    
     mov ah,0ah
    lea dx,num
    int 21h  
        alok al,ah
    
    lea dx,s
    mov ah,09h
    int 21h
    nop
      
    
    
code ends
end start