CLS
FOR i% = 1 TO 50
    SOUND 850, .3
    SOUND 800, .3
    SOUND 825, .3
NEXT i%
FOR i% = 1 TO 5
    SOUND 500, 10
    SOUND 450, 10
NEXT i%
FOR i% = 37 TO 32767
    SOUND i%, .3
    LOCATE 1, 1
    PRINT i%
NEXT i%

