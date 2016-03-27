Data Segment
alok db ?
Data Ends   

Code Segment
Assume Cs:Code , Ds:Data
Start: Mov Ax,Data
Mov Ds,Ax    


mov al,00h
mov bh,09h
AND al,bh

Code Ends
End Start