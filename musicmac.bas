CLS  'Clear off screen

DIM List$(500)  'Make array for list of files

CONST NumFiles = 329  'Declare number of music files

'Open up the output from DIR /ON /B > C:\TEMP\BARELIST
OPEN "c:\temp\barelist" FOR INPUT AS #1

'Loop until end of file list is reached
DO WHILE NOT EOF(1)
     FOR C = 1 TO NumFiles  'Loop through all entries
          LINE INPUT #1, List$(C)
     NEXT C
LOOP
   
CLOSE #1  'Close file

OPEN "c:\temp\LIST" FOR OUTPUT AS #1  'Make a new file for formatted list
   
FOR f = 1 TO NumFiles  'Loop through array adding formatted list
     PRINT #1, "snd[" + LTRIM$(STR$(f)) + "]='" + UCASE$(List$(f)) + "'"
NEXT f
  
CLOSE #1  'Close the new list
   
'Echo the file back
OPEN "c:\temp\LIST" FOR INPUT AS #1  'Open up the new list

CLS  'Clear screen
   
PRINT "Entries in file:": PRINT  'Tell user what is being shown
   
DO WHILE NOT EOF(1)  'Loop until all entries are shown
     LINE INPUT #1, REC$  'Read entries from the file.
     PRINT REC$           'Print the entries on the screen.
LOOP

CLOSE #1  'Close the file

