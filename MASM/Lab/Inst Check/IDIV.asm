Data Segment
alok db 4,7,8,8,9,4,5,4
Data Ends   
     

Code Segment
Assume Cs:Code , Ds:Data,

Start: Mov Ax,Data
Mov Ds,Ax    


mov al,08h
mov bl,2h 
mov ah,00h
idiv bl
   ; Zero flag on  



        
Code Ends
End Start
