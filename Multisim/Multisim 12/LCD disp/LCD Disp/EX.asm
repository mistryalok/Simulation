$MOD51 ; this includes 8051 definitions for the Metalink assembler
; Please insert your code here.
ORG 0000
MOV A,#38H ; initialize. LCD 2 lines, 5x7 Matrix.
ACALL COMNWRT ; Call command Subroutine
ACALL DELAY ; Give LCD some time.
MOV A, #0EH ; Display on, cursor on.
ACALL COMNWRT ; Call command Subroutine.
ACALL DELAY ; Give LCD some time.
MOV A, # 01 ; Clear LCD.
ACALL COMNWRT ; Call command subroutine
; ACALL DELAY ; Give LCD sometime
MOV A, # 06H ; Shift cursor right.
ACALL COMNWRT ; ACALL DELAY
BACK: MOV A, #82H ; Cursor at line 1 position 2
ACALL COMNWRT ; Call command subroutine.
; ACALL DELAY ; Give LCD some time
; // MESSAGE DISPLY
MOV A, #'K' ; Display letter K
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'S' ; Display letter S
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'W' ; Display letter W
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'U' ; Display letter U
ACALL DATAWRT ; Call Data command subroutine
MOV A, #' ' ; Leave some space
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'B' ; Display letter B
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'I' ; Display letter I
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'J' ; Display letter J
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'A' ; Display letter A
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'P' ; Display letter P
ACALL DATAWRT ; Call Data command subroutine	
MOV A, #'U' ; Display letter U
ACALL DATAWRT
MOV A, #'R' ; Display letter R
ACALL DATAWRT
; SECOND LINE DISPLY
MOV A, #0C0H ; Display in second line on position 0
ACALL COMNWRT ; Call Data command subroutine
MOV A, #'E' ; Display letter E
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'L' ; Display letter L
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'E' ; Display letter E
ACALL DATAWRT ; Call Data command subroutine

MOV A, #'C' ; Display letter C
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'T' ; Display letter T
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'R' ; Display letter R
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'O' ; Display letter O
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'N' ; Display letter N
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'I' ; Display letter I
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'C' ; Display letter C
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'S' ; Display letter S
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'-' ; Display -
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'D' ; Display letter D
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'E' ; Display letter E
ACALL DATAWRT ; Call Data command subroutine
MOV A, #'P' ; Display letter P
ACALL DATAWRT ; Call Data command subroutine
; MOV A, #'M' ; Display letter M
; ACALL DATAWRT ; Call Data command subroutine
MOV A, #'T' ; Display letter T
ACALL DATAWRT ; Call Data command subroutine
MOV A, #01 ; Clear screen
ACALL COMNWRT ; Call Data command subroutine
SJMP BACK ; Keep displaying these letters
; AGAIN: SJMP AGAIN
COMNWRT:
MOV P1, A
CLR P3.0; RS=0 FOR COMMAND WRITE
CLR P3.1; R/W=0FOR WRITE
SETB P3.2; E=1 FOR HIGH PUSLSE
CLR P3.2 ;E=0 FOR H-TO-L PULSE
RET
DATAWRT:
MOV P1, A; WRITE DATA TO LCD
SETB P3.0; RS=1 FOR DATA
CLR P3.1; R/W=0 F0R WRITE
SETB P3.2; E=1 FOR HIGH PULSE
CLR P3.2; E=0 FOR H-TO-L PULSE
RET
DELAY:
MOV R4,#1
HERE: DJNZ R4, HERE
RET
END