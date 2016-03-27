Data segment
        num db 7,1,2,3,4,5,6,7
        num2 db 10 dup(?)
        
        
Data ends


code segment
    assume cs:code,ds:data
    
    
start: mov ax,data
        mov ds,ax       
   
        
     lea si,num[1]
     lea di,num2[0]
     
     mov cl,num[0] 
     
     st: mov al,[si]
         mov [di],al
        inc si
        inc di
        loop st
     
       
     
code ends
end start




