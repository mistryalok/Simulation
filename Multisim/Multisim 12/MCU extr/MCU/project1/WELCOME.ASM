#include <REGX51.H>
		ORG 0000H
		AJMP ST
		
		ORG 0030H
ST: 	MOV SCON,#50H
		MOV TMOD,#20H
		MOV TH1,#0FDH
		SETB TR1
		CLR A
		SETB REN
		MOV DPTR,#02DDH
		MOV R0,#07H
AGAIN:	MOVC A,@A+DPTR
		MOV SBUF,A
HERE:	JNB TI,HERE
		CLR TI
		INC DPTR
		CLR A
		DJNZ R0,AGAIN
	
	ORG 02DDH

	DB "WELCOME ALOK"
	
	
		END
		

		