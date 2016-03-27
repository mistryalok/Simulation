Data Segment

Data Ends   

Code Segment
Assume Cs:Code , Ds:Data
Start: Mov Ax,Data
Mov Ds,Ax    


mov ah,04h
mov al,05h
aad

Code Ends
End Start