Data Segment
alok db 4,7,8,8,9,4,5,4
Data Ends   
     

Code Segment
Assume Cs:Code , Ds:Data,

Start: Mov Ax,Data
Mov Ds,Ax    


mov ax,8Fh
mov bl,82h

imul bl
   ; Zero flag on  



        
Code Ends
End Start
