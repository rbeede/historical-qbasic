CLS
INPUT "C:\>", c$
DO
LOOP UNTIL INKEY$ <> ""
CLS
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
END

