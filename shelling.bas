CLS
BEEP
BEEP
BEEP
PRINT "The program runner."
PRINT "Don't forget to type the drive and path."
INPUT "What program do you wish to run?", program$
IF program$ = "none" THEN END
SHELL (program$)
PRINT "Done"
END
SYSTEM

