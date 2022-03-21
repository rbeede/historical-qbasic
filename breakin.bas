CLS
COLOR 15, 4
CLS
LOCATE 7, 15
PRINT "Modem online."
LOCATE 8, 15
PRINT "Hiding location now."
LOCATE 9, 15
PRINT "Calling FBI headquaters."
LOCATE 10, 15
PRINT "Starting password breaker program."
COLOR 30, 4
DO
   LOCATE 13, 15
   PRINT "Breaking into FBI computer system..."
LOOP UNTIL INKEY$ <> ""
COLOR 14, 4
LOCATE 13, 15
PRINT "Break in is sucessful.                  "
COLOR 15, 4
LOCATE 15, 15
PRINT "Putting in virus now."
FOR waittime = 1 TO 10000
NEXT waittime
LOCATE 17, 15
PRINT "Virus in."
LOCATE 17, 15
PRINT "Breaking link."

