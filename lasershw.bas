CLS
SCREEN 7
DO
   h1 = RND(319) * 319 + 1
   LINE (0, 0)-STEP(h1, 199), 4
   FOR t = 1 TO 100
   NEXT t
   LINE (0, 0)-STEP(h1, 199), 0
   h2 = RND(319) * 319 + 1
   LINE (0, 0)-STEP(h2, 199), 1
   FOR t = 1 TO 100
   NEXT t
   LINE (0, 0)-STEP(h2, 199), 0
LOOP UNTIL INKEY$ <> ""
DO UNTIL INKEY$ = "Q"
   h1 = RND(319) * 319 + 1
   v1 = RND(199) * 199 + 1
   LINE (150, 100)-(h1, v1), 14
   LINE (150, 100)-(h1, v1), 0
   PSET (h1, v1), 4
LOOP

