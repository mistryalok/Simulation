;
; MCU Co-Sim Test Program Suite
; Blinking Lights
; Copyright 2005 Electronics Workbench Inc.
$MOD51

 $TITLE(BLINKING LIGHTS TEST)

; Output connected to LED bank.
; OUTPORT EQU   P2
; move stack pointer past register banks
      

		MOV P0,#00H
		MOV P1,#00H
		MOV P2,#00H
		MOV P3,#00H												; SENT 00 & FF TO PORT 1
	CONT:	MOV P1,#0FFH
		MOV P0,#0FFH
		
		MOV P2,#0FFH
		MOV P3,#0FFH

		ACALL DELAY

		MOV P0,#00H
		MOV P1,#00H
		MOV P2,#00H
		MOV P3,#00H

		ACALL DELAY
		AJMP CONT

		

DELAY: MOV R0,#04H
A3:		MOV R1,#0FFH
A2:		MOV R2,#0FFH
A1:		DJNZ R2,A1
		DJNZ R1,A2
		DJNZ R0,A3
		RET
		END