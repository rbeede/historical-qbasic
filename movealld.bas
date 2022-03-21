CLS
SCREEN 7
h = 160
v = 99
c = 1
PSET (h, v), 1
5 a$ = INKEY$
  a$ = UCASE$(a$)
  IF a$ = "U" THEN GOTO 10
  IF a$ = "D" THEN GOTO 20
  IF a$ = "L" THEN GOTO 30
  IF a$ = "R" THEN GOTO 40
  IF a$ = "C" THEN GOTO 50
  IF a$ = "E" THEN END
GOTO 5
10 v = v - 1
IF v <= 0 THEN v = 0
PSET (h, v), c
PRESET (h, v + 1)
GOTO 5
20 v = v + 1
IF v >= 199 THEN v = 199
PSET (h, v), c
PRESET (h, v - 1)
GOTO 5
30 h = h - 1
IF h <= 0 THEN h = 0
PSET (h, v), c
PRESET (h + 1, v)
GOTO 5
40 h = h + 1
IF h >= 319 THEN h = 319
PSET (h, v), c
PRESET (h - 1, v)
GOTO 5
50
c = c + 1
IF c > 16 THEN c = 0
IF c < 0 THEN c = 16
GOTO 5

