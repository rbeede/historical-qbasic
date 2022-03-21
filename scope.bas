1 CLS
COLOR 7
PRINT "This is a phone line connected directally to a huge telescope in Arkansaw."
PRINT "The phone call is free and this service is free."
PRINT "All you have to do is type 1, 2, 3, or 4."
PRINT "1. See the sky in Kansas City."
PRINT "2. See a stores bouncing balls."
PRINT "3. See the stars in the GOab system."
PRINT "4. End connection."
5 INPUT "Type 1, 2, 3 or 4. ", see
IF see = 4 THEN END
IF see < 1 OR see > 3 THEN PRINT "Invalid number.": GOTO 5
IF see = 1 THEN
   SHELL "sky"
   GOTO 1
ELSEIF see = 2 THEN
   SHELL "balls"
   GOTO 1
ELSEIF see = 3 THEN
   SHELL "stars"
   GOTO 1
END IF

