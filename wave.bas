' Program WAVE.BAS
' Wouter Bergmann Tiest
' 17th December 1995

' This program plays an 8-bit mono WAV file using SoundBlaster DSP

DECLARE SUB ResetSB ()
DECLARE SUB PlayWav (FileName$)
CONST BaseAddr = &H220 'Change if your sound card uses another base address

CONST CommAddr = BaseAddr + &HC, ResetAddr = BaseAddr + &H6

DEFINT A-Z

LINE INPUT "Enter file name: "; FileName$
PlayWav FileName$
END

SUB PlayWav (FileName$)
  PRINT "Loading file..."
  OPEN FileName$ FOR BINARY AS #1
  dummy$ = INPUT$(40, #1) 'Discard first 40 bytes
  length& = CVL(INPUT$(4, #1)) 'Next 4 bytes is length (4 bytes = LONG)
  IF length& > 32766 THEN 'Only WAVs shorter than 32767 bytes can be played
    PRINT "Lenght of file exceeds maximum array length."
    PRINT "Only the first 32766 bytes will be played."
    length& = 32766
  END IF
  length = length& 'Convert to integer for more speed
  DIM Byte(1 TO length)
  FOR i = 1 TO length
    Byte(i) = ASC(INPUT$(1, #1)) 'Read a byte in
  NEXT i
  CLOSE #1
 
  PRINT "Playing back..."
  ResetSB
  OUT CommAddr, &HD1 'Turn speaker on
  FOR i = 1 TO length
    OUT CommAddr, &H10 'Give command to output a byte
    OUT CommAddr, Byte(i) 'Output value
  NEXT i
  OUT CommAddr, &HD3 'Turn speaker off
END SUB

SUB ResetSB
  OUT ResetAddr, 1
  OUT ResetAddr, 0
END SUB

