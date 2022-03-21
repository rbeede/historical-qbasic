SCREEN 2
CLS
INPUT "Please type your name. ", name1$
IF name1$ = "" THEN END
PRINT "You just won the lottery!"
PLAY "o" + "3"
PLAY "l8"
PLAY "bdacbdacbdacbdacbdac"
PRINT "What are you going to do next";
INPUT nex$
IF nex$ = "I'm going to Disney World." THEN
          PRINT "Great choice.": PLAY "bagfedcbagfedcbagfedcbagfedc"
ELSE
          PRINT "IRS just took half of your money."
          PLAY "o" + "2"
          PLAY "l4"
          PLAY "bag"
          PLAY "l1"
          PLAY "f"
END IF

