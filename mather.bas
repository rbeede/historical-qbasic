first: CLS
SCREEN 7
PRINT "The mather."
m1: INPUT "Number 1?", no1
IF no1 = e THEN PRINT "Type a number.": GOTO m1
m2: INPUT "Number 2?", no2
IF no2 = e THEN PRINT "Type a number.": GOTO m2
PRINT "The answer by dividing"; no1 / no2
PRINT "The answer by times is"; no1 * no2
PRINT "The answer by subtraction is"; no1 - no2
PRINT "The answer by addition is"; no1 + no2
PRINT "Another?"
DO
  a$ = INKEY$
  IF a$ = "y" THEN GOTO first
  IF a$ = "n" THEN END
LOOP
END

