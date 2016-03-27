Data Segment
alok db 4,7,8,8,9,4,5,4
Data Ends   
     

Code Segment
Assume Cs:Code , Ds:Data,

Start: Mov Ax,Data
Mov Ds,Ax    


mov dx,0ff78h
int 0  
Iret
   ; Zero flag on  



        
Code Ends
End Start
