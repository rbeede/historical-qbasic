'dos echo This sentence demonstrates pre MAKE DOS calls...
'dos pause
'begin make
' 
'  begin bas
'    COLOR /o
'  begin OBJ
'end make

1 CLS
PRINT "Colors:"
PRINT "       0. Black"
PRINT "       1. Blue"
PRINT "       2. Green"
PRINT "       3. Cyan"
PRINT "       4. Red"
PRINT "       5. Magenta"
PRINT "       6. Brown"
PRINT "       7. White"
PRINT "       8. Gray"
PRINT "       9. Light Blue"
PRINT "      10. Light green"
PRINT "      11. Light cyan"
PRINT "      12. Light red"
PRINT "      13. Light magenta"
PRINT "      14. Yellow"
PRINT "      15. Bright White"
INPUT "Type forecolor. ", forecolor
IF forecolor < 0 OR forecolor > 15 THEN
   PRINT "Incorrect number."
   DO
   LOOP UNTIL INKEY$ <> ""
   GOTO 1
END IF
INPUT "Type background color.", bgdclr
IF bgdclr < 0 OR bgdclr > 15 THEN
   PRINT "Incorrect number."
   DO
   LOOP UNTIL INKEY$ <> ""
   GOTO 1
END IF
COLOR forecolor, bgdclr
CLS














