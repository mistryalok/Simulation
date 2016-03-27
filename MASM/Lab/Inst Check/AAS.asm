Data Segment

Data Ends   

Code Segment
Assume Cs:Code , Ds:Data
Start: Mov Ax,Data
Mov Ds,Ax    


mov al,35h
mov bh,33h
sub al,bh 
aam

Code Ends
End Start