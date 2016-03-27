Data Segment
Inkey Db ?
Buf Db 20 Dup(?)
Mes Db 10,13, 'Dayananda Sagar College Of Engineering $'
Data Ends   

Code Segment
Assume Cs:Code , Ds:Data
Start: Mov Ax,Data
Mov Ds,Ax    


Mov Buf,10
Mov Ah,0ah
Lea Dx,Buf
int 21h
Mov Ah,09h
Lea Dx,Buf
Int 21h
Mov Ah,4ch
Int 21h
Code Ends
End Start