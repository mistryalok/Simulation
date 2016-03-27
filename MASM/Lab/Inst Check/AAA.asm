Data Segment
Inkey Db ?
Buf Db 20 Dup(?)
Mes Db 10,13, 'Dayananda Sagar College Of Engineering $'
Data Ends   

Code Segment
Assume Cs:Code , Ds:Data
Start: Mov Ax,Data
Mov Ds,Ax    


mov al,35h
mov bl,39h  
add al,bl  
aaa

Code Ends
End Start