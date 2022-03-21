CLS
REM remarked statements will remember what cards were delt
REM this program shows randow numbers all differnt
DO
5 DIM t(520)
'7 DIM d(520)
10 FOR x = 1 TO 520
20 t(x) = x
30 NEXT x
40 FOR x = 1 TO 520
50 c = RND(520) * 520 \ 1
60 IF t(c) = 0 THEN 50
'70 d(x) = t(c)
80 t(c) = 0
'90 PRINT d(x); 'this is a replacement for line 90 to show ones memorized
90 PRINT c;
100 NEXT x
LOOP UNTIL INKEY$ <> ""

