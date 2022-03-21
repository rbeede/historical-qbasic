CLS
PRINT "The PC is now locked up."
PRINT "You will have to restart to use it."
DO
a$ = INKEY$
IF a$ <> "" THEN GOTO 10
LOOP
10 INPUT "What is the password?", password$
IF password$ = "Rodney is the master." THEN PRINT "Nope" ELSE PRINT "Access Denied."
IF password$ = "Rodney is the master." THEN PRINT "NOT": GOTO 0
GOTO 10
0 SYSTEM


