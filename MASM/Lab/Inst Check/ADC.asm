Data Segment
alok db ?
Data Ends   

Code Segment
Assume Cs:Code , Ds:Data
Start: Mov Ax,Data
Mov Ds,Ax    


mov al,00h
mov bh,09h
mov alok,45h
adc al,alok

Code Ends
End Start