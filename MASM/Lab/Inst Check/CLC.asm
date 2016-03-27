Data Segment
alok db ?
Data Ends   

Code Segment
Assume Cs:Code , Ds:Data
Start: Mov Ax,Data
Mov Ds,Ax    

mov al,84h
CBW


        
Code Ends
End Start
