COLOR 7, 0
CLS
CLS
LOCATE 12, 1
BEEP
FOR td = 120 TO 0 STEP -1
PRINT "Totally systems failer in "; td; " seconds.  "
COLOR 0, 4
FOR t = 1 TO 5000
a$ = INKEY$
IF a$ <> "" THEN t = t + 1000
NEXT t
LOCATE 12, 1
NEXT td
COLOR 18, 0
DO UNTIL INKEY$ = "a" OR INKEY$ = "A"
   s% = RND(38) * 10000
   c% = RND(15) * 15
   IF c% > 15 THEN c% = 15
   IF c% < 1 THEN c% = 1
   IF s% < 38 THEN s% = 38
   IF s% > 4186 THEN s% = 4186
   COLOR c%, 0
   PRINT "&#^%(#&!#%^#$&$%&&$@^@^@!$#%@&^%@^*&%^#*%$<>?,./:::;'|||||\\\\&%#*%#@!@!~@@##$$"
   SOUND s%, 1
LOOP

