Data Segment
alok db 4,7,8,8,9,4,5,4
Data Ends   
     
extra segment
    alok1 db 4,7,6,6,6,6,5,5

extra ends
Code Segment
Assume Cs:Code , Ds:Data, Es:data

Start: Mov Ax,Data
Mov Ds,Ax    
mov es,ax

mov al,84h 
mov SI,offset alok
mov DI,offset alok1
cld
mov cx,07h
repe cmpsb
   ; Zero flag on  



        
Code Ends
End Start
