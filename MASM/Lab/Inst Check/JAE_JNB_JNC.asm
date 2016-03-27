Data Segment
alok db 4,7,8,8,9,4,5,4
Data Ends   
     

Code Segment
Assume Cs:Code , Ds:Data,

Start: Mov Ax,Data
Mov Ds,Ax    


mov ax,0045h 

cmp ax,0044h
;   jae max
 
   ; jnb max
    
     
    jnc max
       jmp ending
max: mov ah,00h   ; Zero flag on  



ending: nop
Code Ends
End Start
