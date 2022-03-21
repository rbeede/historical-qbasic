CLS
DO UNTIL INKEY$ <> ""
  no = RND(1296) * 1296
  c = RND(4000) * 4000
  cr = RND(31) * 31
  IF c > 4000 THEN c = 2000
  IF c < 36 THEN c = 40
  IF cr > 31 THEN cr = 31
  IF cr < 17 THEN cr = RND(8) * 8
  SOUND c, 1
  COLOR cr, 0
  PRINT no; 'faster-no; no; no; no; no; no
LOOP
                             

