first: CLS
FOR ch = 31 TO 1 STEP -1
   FOR h = 60 TO 1 STEP -1
   LOCATE 12, h
   COLOR ch, 0
   PRINT "Happy birthday!!"
   FOR t = 1 TO 1000
   NEXT t
   CLS
NEXT h, ch
LOCATE 13, 25
PRINT "Have a happy Halloween!!!!!!!!!!"
FOR t = 59 TO 0 STEP -1
FOR tt = 1 TO 5000
NEXT tt
IF t = 44 THEN BEEP
IF t = 29 THEN BEEP: BEEP
IF t = 14 THEN BEEP: BEEP: BEEP
IF t = 0 THEN BEEP: BEEP: BEEP: BEEP: GOTO first
NEXT t

