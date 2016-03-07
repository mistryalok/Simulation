#include <REGX51.H>
#include <Display.H>
#include <gsmcont.H>
org 0030h

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////// LCD INITILIZATION //////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
LCDSTART:		MOV A,#38H                           ; initialization LCD 2lines, 5×7 matrix.
				LCALL COMM                   ; call command subroutine.
				LCALL LCDDELAY                          ; call delay subroutine.
				MOV A,#0EH                           ; display on, cursor on
				LCALL COMM
				LCALL LCDDELAY
				MOV A,#01H                           ; Clear LCD
				LCALL COMM
				LCALL LCDDELAY
				MOV A,#06H                           ; shift cursor right
				LCALL COMM
				LCALL LCDDELAY
				MOV A,#80H                           ; cursor at beginning of 1st line
				LCALL COMM
				LCALL LCDDELAY
				RET


		////////////////////////// DELAY /////////////////////////////////////////////////////////////////////////////////////////////

			DELAY: MOV R5,#0FFH
			A1:		MOV R6,#0FFH
					DJNZ R6,$
					DJNZ R5,A1
					RET
		////////////////// DELAY ////////////////////////////////////////////////////
LCDDELAY: 			MOV R5,#12
			B1:		MOV R6,#255
					DJNZ R6,$
					DJNZ R5,B1
					RET			  	 
		//////////////////// COMMAND SEND ///////////////////////////////////////////////	
			COMM: MOV LCDdata,A
				CLR RS		   ;DE DATA
				CLR RW		   ;R/W					
				SETB EN		   ;ENA
			
				CLR EN
				RET
		/////////////// DATA SEND //////////////////////////////////////////////////////	
			 DISP: MOV LCDdata,A
			 		SETB RS
					CLR RW
					SETB EN
					LCALL LCDDELAY
					CLR EN
					RET





///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////S/// CONTROL COMMANDS ////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////// DISPLY MOTOR ON AND OFF ///////////////////////////////////////////////////////////////
						///////////////// DISP MOTOR OFF ///////////////////////////////////////			
						MOTOROFF: 	MOV A,#01H
									LCALL COMM
									CLR A
									MOV DPTR,#3660
									MOV R4,#9
						DISPNEXTCHAR1:	MOVC A,@A+DPTR
									LCALL DISP
									//LCALL DELAY
									CLR A
									INC DPTR
									DJNZ R4,DISPNEXTCHAR1
									RET

						 ////////////////// DISP MOTOR ON //////////////////////////////////////

						 MOTORON: 	MOV A,#01H
									LCALL COMM
						 			CLR A
						 			MOV DPTR,#3650
						 			MOV R4,#8
						DISPNEXTCHAR2:	MOVC A,@A+DPTR
									LCALL DISP
								//	LCALL DELAY
									CLR A
									INC DPTR
									DJNZ R4,DISPNEXTCHAR2
									RET

						///////////// DISPLY GSM BASED MONITOR ////////////////////////////////
					   GSMBASEDMONITOR: MOV A,#01H
									LCALL COMM
									CLR A
						 			MOV DPTR,#3670
						 			MOV R4,#17
						DISPNEXTCHAR3:	MOVC A,@A+DPTR
									LCALL DISP
									LCALL DELAY
									CLR A
									INC DPTR
									DJNZ R4,DISPNEXTCHAR3

									MOV R4,#20
						SHIFT:			MOV A,#18H
									LCALL COMM
									LCALL DELAY
									DJNZ R4,SHIFT

					
										LCALL MOTORON
										RET 
										
						//////////////// DISPLY CALLING /////////////////////////////////////////

						CALLING: MOV A,#01H
									LCALL COMM
									CLR A
						 			MOV DPTR,#3700
						 			MOV R4,#10
						DISPNEXTCHAR4:	MOVC A,@A+DPTR
									LCALL DISP
									LCALL DELAY
									CLR A
									INC DPTR
									DJNZ R4,DISPNEXTCHAR4
									RET