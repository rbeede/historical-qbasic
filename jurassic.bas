CLS : numberrap = 20: auxpower = 100: part = 1
LOCATE 25
INPUT "System Ready", q$
IF q$ = "RoBear" THEN password$ = "Raptor #1": PRINT "Adnormal program start.": auxpower = 1000000: GOTO 5
CLS
PRINT "Jurassic Park Main Control"
INPUT "Enter the password.  It's Raptor #1 :) ", password$
5 IF NOT (password$ = "Raptor #1") THEN PRINT "Incorrect Identification.": SYSTEM: END
PRINT "OK"
DO while INKEY$ = ""
   LOCATE 3, 3, 1
LOOP
7 CLS
IF auxpower <= 30 THEN COLOR 20 ELSE COLOR 7, 0
PRINT "Jurassic Main Control"
LOCATE 10, 1, 0
PRINT "Raptor pit"
LOCATE 10, 30, 0
PRINT "Power Supplies"
LOCATE 20, 1, 0
PRINT "Fences"
LOCATE 20, 30, 0
PRINT "Animal count"
IF auxpower <= 0 THEN LOCATE 1, 1: FOR tt = 1 TO 10: FOR t = 1 TO 5000: NEXT t: PRINT "All power gone!!!  The Dinosaurs have escaped.  You have been eating by raptors.  You lose!!!": NEXT tt: SYSTEM: END
DO
  a$ = UCASE$(INKEY$)
  IF a$ = "J" THEN GOTO 10
  IF a$ = "R" THEN GOTO 20
  IF a$ = "P" THEN GOTO 30
  IF a$ = "F" THEN GOTO 40
  IF a$ = "A" THEN GOTO 50
LOOP
10 CLS
   PRINT "Jurassic Park"
   PRINT
   PRINT "1. Comm"
   PRINT "2. Tour"
   PRINT "3. DNA"
   PRINT "4. Travel"
   PRINT "5. Kill 2 Raptors."
   PRINT "6. Quit Game."
11 INPUT "Type 1, 2, 3, 4, 5 or 6 and press ENTER when ready. ", want
   IF want < 1 OR want > 6 THEN PRINT "Invalied selection.  Please try again.": auxpower = auxpower - 15: GOTO 11
   auxpower = auxpower - 9
   IF want = 1 THEN
              INPUT "Enter DNA code. ", dnapass$
              IF dnapass$ = "5555555 T-REX" THEN
                 CLS
                 PRINT "Jurassic Comm System"
                 PRINT "Find the two kids lost in JP"
                 PRINT "by looking at Fences and the number of Animals."
                 DO
                 LOOP UNTIL INKEY$ <> ""
              END IF
   END IF
   IF want = 2 THEN
              CLS
              PRINT "Jurassic Park Tour"
              PRINT "The Raptors are starting to break free."
              PRINT "You are Grant and must find the two kids"
              PRINT " before all power is gone."
              PRINT "Then you must decode the DNA strands to leave JP."
              PRINT "The power amounts needed are as follows:"
              PRINT "Jurassic Main Control 9% auxpower"
              PRINT "  1.  9% auxpower"
              PRINT "  2.  0% auxpower"
              PRINT "  3. 10% auxpower"
              PRINT "  4.  5% auxpower"
              PRINT "  5.  0% auxpower"
              PRINT "  6.  0% auxpower"
              PRINT "Raptor pit 10% auxpower"
              PRINT "Power Supplies 10% auxpower"
              PRINT "Fences 20% auxpower"
              PRINT "Animal Count 18% auxpower"
              PRINT "Good Luck."
              PRINT "--------------END TRANSMISSION----------------"
              DO
              a$ = INKEY$
              LOOP UNTIL a$ <> ""
   END IF
   IF want = 3 THEN
               INPUT "Warning!!!  This will kill 5 Raptors.  Ok to proceed?", o$
               ok$ = UCASE$(o$)
               IF ok$ = "Y" THEN
                                  numberrap = numberrap - 5
                                  auxpower = auxpower - 10
                                  IF numberrap <= 0 THEN COLOR 20, 14: PRINT "Not enough of Raptors.  All raptors are dead.  You lose": END
                                  PRINT
                                  IF part = 1 THEN PRINT "DNA 555"
                                  IF part = 2 THEN PRINT "DNA 5555555"
                                  IF part = 3 THEN PRINT "DNA 5555555 T-"
                                  IF part = 4 THEN PRINT "DNA 5555555 T-REX"
                                  part = part + 1
                                  IF part > 4 THEN part = 4
                                  DO UNTIL INKEY$ <> ""
                                  LOOP
               END IF
   END IF
   IF want = 4 THEN
     IF part = 4 AND kidsfound = 2 AND auxpower >= 5 THEN
         PRINT "Leaving Jurassic Park.  Have a safe trip.": SYSTEM: END
     ELSE
      PRINT "Incorrect DNA strand.  Kids not with you.  Go find them."
      PRINT "Must have 5% or above auxpower supply left!"
      DO
      LOOP UNTIL INKEY$ <> ""
     END IF
   END IF
   IF want = 5 THEN
           PRINT "Killing"
           IF numberrap <= 0 THEN PRINT "No Raptors to kill.": numberrap = numberrap + 2
           numberrap = numberrap - 2
           IF numberrap <= 0 THEN
                        PRINT "All raptors are dead. No power up."
           ELSE
              auxpower = auxpower + 19
              PRINT " 10% powerup."
           END IF
           DO
           LOOP UNTIL INKEY$ <> ""
   END IF
   IF want = 6 THEN SYSTEM: END
   GOTO 7
20 CLS
   PRINT "Raptor pit status"
   PRINT
   IF numberrap < 0 THEN numberrap = 0
   PRINT "Number in pit "; numberrap
   PRINT "Number expected "; "20"
   IF numberrap > 30 THEN PRINT "Warning raptor pit to small raptors are escaping!!!"
   IF numberrap = 40 THEN PRINT "Too many raptors.  You bearly escape.  Jurassic Park is a failer!!": END
   IF numberrap <= 0 THEN PRINT "All raptors are dead.  Loss of money.  70% power drain.": auxpower = auxpower - 70
   IF numberrap <= 0 THEN PRINT "No more Raptors to hatch." ELSE numberrap = numberrap + 1
   auxpower = auxpower - 10
   PRINT "Press any key to exit"
   DO UNTIL INKEY$ <> ""
   LOOP
   GOTO 7
30 CLS
   auxpower = auxpower - 5
   PRINT "Jurassic Park Power Supplies"
   PRINT
   IF auxpower < 0 THEN PRINT "Warning all power gone. Emergancy power kicking in.": auxpower = 20
   PRINT auxpower; "% auxiliary power left."
   PRINT "Main power destroyed"
   PRINT "Press any key to exit"
   b$ = UCASE$(INKEY$)
   DO UNTIL b$ <> ""
   b$ = UCASE$(INKEY$)
   LOOP
   IF b$ = "T" THEN auxpower = 0: PRINT "T-REX eats all power supplyes and gets fried.  You eat him.  All power gone.": DO UNTIL INKEY$ <> "": LOOP
   GOTO 7
40 CLS
   auxpower = auxpower - 20
   CLS
   PRINT "T-REX fences down"
   PRINT "Raptor fences up"
   PRINT "All fences percent working 70"
   IF part = 4 AND NOT (kidsfound = 1) AND NOT (kidsfound = 2) THEN PRINT "One kid near Raptor fence.": kidsfound = 1
   PRINT "Press any key to continue..."
   DO
   LOOP UNTIL INKEY$ <> ""
   GOTO 7
50 CLS
   auxpower = auxpower - 18
   CLS
   PRINT "Number of animals expected 1000"
   PRINT "Number Found 700"
   PRINT "100 are dead"
   PRINT "500 animals sorce unknown.  200 in captivity."
   IF numberrap <= 0 THEN PRINT "All raptors are dead!!!"
   IF part = 4 AND kidsfound = 1 THEN
         kidsfound = 2
         PRINT "Another kid found!!"
   END IF
   PRINT "Press any key to continue..."
   DO
   LOOP UNTIL INKEY$ <> ""
GOTO 7
SYSTEM
           

