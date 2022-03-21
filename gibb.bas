CLS
PRINT "Type in code lines."
DO UNTIL INKEY$ = "Q"
  COLOR 15, RND(4) * 4 + 1
  IF INKEY$ <> "" THEN PRINT RND(1000) * 1000 + 1;
LOOP

