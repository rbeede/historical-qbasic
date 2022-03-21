CLS
PRINT "Welcome to Doom!"
INPUT "Do you want to play and die in this realistic death game"; doom$
IF doom$ = "Yes" THEN PRINT "GO ON" ELSE : END
DO
LOOP UNTIL INKEY$ <> ""
CLS
PRINT "Prepare to push up daisie!"
DO
LOOP UNTIL INKEY$ <> ""
CLS
PLAY "l8"
PLAY "o1"
PLAY "dddl4d"
PRINT "Imagine this:Your at a beach with @%^^%$^"
DO
LOOP UNTIL INKEY$ <> ""
CLS
BEEP
BEEP
PRINT " OOPS WRONG SCENERIO!"
PRINT " You are in a dark castle! All of a     sudden a imp pops up."
INPUT "What weapon shall you use"; weapon$
DO
LOOP UNTIL INKEY$ <> ""
CLS
PRINT "Well done, You have destroyed the imp with the "; weapon$; "!"
DO
LOOP UNTIL INKEY$ <> ""
CLS
PRINT "You walk down the hall to an Elevator!But wait!There's a password!"
DO
LOOP UNTIL INKEY$ <> ""
INPUT "Enter password!"; pass$
IF pass$ = "Barney Sucks" THEN PRINT " Good" ELSE : END
DO
LOOP UNTIL INKEY$ <> ""
CLS
PRINT " The elevator opens and Bill Clintons severed head comes out and bites your arm!"
INPUT " What weapon shall you use"; bill$
IF bill$ = "Impeachment" THEN PRINT "Well done!" ELSE : END
DO
LOOP UNTIL INKEY$ <> ""
CLS
PRINT " You are almost at the exit to win!"
DO
LOOP UNTIL INKEY$ <> ""
CLS
INPUT "The only way to win is to input the ULTIMATE password!"; niv$
IF niv$ = "NIRVANA" THEN PRINT " YOU WIN!" ELSE : END
DO
LOOP UNTIL INKEY$ <> ""
CLS
SCREEN 7
COLOR 4
PRINT " SO LONG FELLOW BEEDE'S"
END







