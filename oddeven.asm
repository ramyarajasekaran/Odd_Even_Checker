;PROGRAM TO CHECK IF A NUMBER IS EVEN OR ODD
.ORIG x3000
  ;INPUT 
 ADD R7,R7,#1

	
INPUTLOOP  
           LEA R0, PROMPT
  	   PUTS		
		GETC; --> accepting char into R0
		OUT;
		ADD R4,R0,#-10; --> to check if R0 == 'enter'
	   BRz SKIP
		ADD R3,R0,#0; --> copying R0 into R3
		LD R5,ASCIIOFFSET
		ADD R3,R3,R5
		BRz ZERO
		
  ;PROCESSING
	   	
	   AND R4,R3,#1; --> applying bitmask x0001 to check if odd/even
	   BRz EVEN
	   BRnp ODD	
  ;OUTPUT
ZERO LEA R0,MSG4
     PUTS
     BRnzp INPUTLOOP

ODD  LEA R0,MSG1
     PUTS
     BRnzp INPUTLOOP

EVEN LEA R0,MSG2
     PUTS
     Brnzp INPUTLOOP

SKIP LEA R0,MSG3
     PUTS

STOP HALT
PROMPT .STRINGZ "Enter a character: "
MSG1 .STRINGZ "\nIt is odd\n"
MSG2 .STRINGZ "\nIt is even\n"
MSG3 .STRINGZ "\nThank you!\n"
MSG4 .STRINGZ "\nZero is crazy\n"
ASCIIOFFSET .FILL #-48
.END


