Data Segment
alok db ?
Data Ends   

Code Segment
Assume Cs:Code , Ds:Data
Start: Mov Ax,Data
Mov Ds,Ax    


mov al,00h
mov bh,09h
Call Anding
jmp ending           
           
Anding: And al,bh
    ret
          

ending: NOP          
Code Ends
End Start
