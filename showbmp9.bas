DIM xstart, xsiz, ystart, ysiz AS INTEGER
DEF SEG = 0
'generate image
'CLS
FILES "*.bmp"
RANDOMIZE TIMER
grey = 0            'My dithering algorithm needs work, beware.
slowpal = 0
va = &H3C8
vd = &H3C9

INPUT "Bitmap filename to load: ", filename$
PRINT
PRINT "The Program will read in the source file and display it on the screen."
PRINT
PRINT "Source file: "; filename$
PRINT
CLS
IF INSTR(filename$, ".") = 0 THEN filename$ = filename$ + ".BMP"
OPEN filename$ FOR BINARY AS #1
IF LOF(1) = 0 THEN
   CLOSE #1
   PRINT "Empty File. Deleting"
   KILL filename$
   END
END IF

header$ = SPACE$(14)
sizing$ = SPACE$(4)
GET #1, 1, header$
IF LEN(header$) = 0 THEN PRINT "Not a valid Bitmap file.": CLOSE : END
IF MID$(header$, 1, 2) <> "BM" THEN PRINT "Not a valid Bitmap file.": CLOSE : END
GET #1, 15, sizing$
bmpinfosize = CVI(sizing$)
'bmpinfosize - Is the size of the information header for the bitmap.
'              Different bitmap versions have variations in filetypes.
'              40 is a standard windows 3.1 bitmap.
'              12 is for OS/2 bitmaps
'The next routine reads in the appropriate headers and colour tables.
'nbits is the number of bits per pixel - i.e. number of colours
'1 bit = 2 colours, 4 bits = 16 colours, 8 bits = 256 colours, etc.
'the 24 bit mode does not have a palette, its colours are expressed as
'image data

'Design of a windows 3.1 bitmap - Taken from bmp.txt on the
'x2ftp.oulu.fi ftp site under /pub/msdos/programming/formats
'Specifications for a Windows 3.1 bitmap. (.BMP)
'Email any questions/responses to me at zabudsk@ecf.utoronto.ca
'or post to alt.lang.basic or comp.lang.basic.misc.

'       | # of   |
'Offset | bytes  | Function (value)
'-------+--------+--- General Picture information starts here---------
'  0    |   2    | (BM) - Tells us that the picture is in bmp format
'  2    |   4    | Size of the file (without header?)
'  6    |   2    | (0) Reserved1 - Must be zero
'  8    |   2    | (0) Reserved2 - Must be zero
'  10   |   4    | Number of bytes offset of the picture data
'-------+--------+--- Information Header starts here -----------------
'  14   |   4    | (40/12) Size of information header (Win3.1/OS2)
'  18   |   4    | Picture width in pixels
'  22   |   4    | Picture Height in pixels
'  26   |   2    | (1) Number of planes, must be 1
'  28   |   2    | Number of bits per pixel (bpp), must be 1,4,8 or 24
'  30   |   4    | (0) Compression - 0 means no compression, 1,2 are RLEs
'  34   |   4    | Image size in bytes
'  38   |   4    | picture width in pels per metre
'  42   |   4    | picture height in pels per metre
'  46   |   4    | (0) Number of colours used in the picture, 0 means all
'  50   |   4    | (0) Number of important colours, 0 means all
'-------+--------+--- Palette data starts here -----------------------
'  54   |   1    | (b) - blue intensity component, color 0 - range 0 to 255
'  55   |   1    | (g) - green intensity component, color 0 - range 0 to 255
'  56   |   1    | (r) - red intensity component, color 0 - range 0 to 255
'  57   |   1    | (0) - unused
'  58   |   1    | (b) - blue intensity component, color 0 - range 0 to 255
'  ...  | ...    |
'  54   | 4*2^bpp| total range of palette
'-------+--------+--- Image data starts here -------------------------
'54+    | width* | Bitmap data starting at lower left portion of the
'(4*2^n)| height*| image moving from left towards right. Moving up 1
'       | (8/bpp)| pixel when at the right hand side of the image, starting
'       |        | from the left side again, until the top right of the
'       |        | image is reached

'Note that this format is slightly different for a OS/2 Bitmap.
'The header is the same up to (but not including) bit 30-
'The palette colour values follow at bit 30, with the form...
'1 byte blue intensity
'1 byte green intensity
'1 byte red intensity
'For each colour of the picture.
'Bitmapped image data follows the colour tables


'Special note: When storing 1 bit (2 colour) pictures.
'8 horizontal pixels are packed into 1 byte. Each bit determines
'the colour of one pixel (colour 0 or colour 1)

'4 bit pictures (16 colours) use 2 nibbles (4 bits) for each pixel
'thus there are 2 pixels for each byte of image data.

'8 bit pictures use 1 byte per pixel. Each byte of image data
'represents one of 256 colours.

'24 bit pictures express colour values by using 3 bytes and each has a
'value between 0 and 255. The first byte is for red, the second is for
'green and the third is for blue. Thus (256)^3 or 2^24 of 16777216 different
'colours.

'Even more special note:
'each line of bitmap images have a long word integer boundary;
'this means that at the end of each line, there may be extra "padding"
'bytes to ensure that the actual amount of data encoded with each line
'is encoded to be a multiple of 4 bytes (the size of a long word).




IF bmpinfosize = 12 THEN
   infoheader$ = SPACE$(12)
   GET #1, 15, infoheader$
   nbits = CVI(MID$(infoheader$, 15, 4))
 
   IF nbits = 1 THEN
      palet$ = SPACE$(6)
      GET #1, bmpinfosize + 15, palet$
   ELSEIF nbits = 4 THEN
      palet$ = SPACE$(48)
      GET #1, bmpinfosize + 15, palet$
   ELSEIF nbits = 8 THEN
      palet$ = SPACE$(768)
      GET #1, bmpinfosize + 15, palet$
   END IF
ELSEIF bmpinfosize = 40 THEN
   infoheader$ = SPACE$(40)
   GET #1, 15, infoheader$
   nbits = CVI(MID$(infoheader$, 15, 4))
   IF nbits = 1 THEN
      palet$ = SPACE$(8)
      GET #1, bmpinfosize + 15, palet$
   ELSEIF nbits = 4 THEN
      palet$ = SPACE$(64)
      GET #1, bmpinfosize + 15, palet$
   ELSEIF nbits = 8 THEN
      palet$ = SPACE$(1024)
      GET #1, bmpinfosize + 15, palet$
   END IF
END IF
    

ft$ = MID$(header$, 1, 2)
PRINT "Type of file (Should be BM): "; ft$

filesize = CVL(MID$(header$, 3, 4))
PRINT "Size of file: "; filesize

r1 = CVI(MID$(header$, 7, 2))
PRINT "Reserved 1: "; r1

r2 = CVI(MID$(header$, 9, 2))
PRINT "Reserved 2: "; r2

offset = CVL(MID$(header$, 11, 4))
PRINT "Number of bytes offset from beginning: "; offset

PRINT

headersize = CVL(MID$(infoheader$, 1, 4))
PRINT "Size of header: "; headersize

picwidth = CVL(MID$(infoheader$, 5, 4))
PRINT "Width: "; picwidth

picheight = CVL(MID$(infoheader$, 9, 4))
PRINT "Height: "; picheight

nplanes = CVI(MID$(infoheader$, 13, 4))
PRINT "Planes: "; nplanes

PRINT "Bits per plane: "; nbits

PRINT

IF headersize = 40 THEN
   PRINT "Compression: ";
   comptype = CVL(MID$(infoheader$, 17, 4))
   IF comptype = 0 THEN PRINT "None"
   IF comptype = 1 THEN PRINT "Run Length - 8 Bits"
   IF comptype = 2 THEN PRINT "Run Length - 4 Bits"
 
   imagesize = CVL(MID$(infoheader$, 21, 4))
   PRINT "Image Size (bytes): "; imagesize
 
   xsize = CVL(MID$(infoheader$, 25, 4))
   PRINT "X size (pixels per metre): "; xsize
 
   ysize = CVL(MID$(infoheader$, 29, 4))
   PRINT "Y size (pixels per metre): "; ysize
 
   colorsused = CVL(MID$(infoheader$, 33, 4))
   PRINT "Number of colours used: "; colorsused
 
   neededcolours = CVL(MID$(infoheader$, 37, 4))
   PRINT "Number of important colours: "; neededcolours
END IF
PRINT
PRINT "Press Any key to continue."
WHILE INKEY$ = ""
WEND

IF nbits = 1 THEN
   SCREEN 11
   xres = 640
   yres = 480
   nc = 2
ELSEIF nbits = 4 THEN
   SCREEN 12
   xres = 640
   yres = 480
   nc = 16
ELSEIF nbits = 8 OR nbits = 24 THEN
   SCREEN 13
   xres = 320
   yres = 200
   nc = 256
END IF
IF bmpinfosize = 40 THEN ngroups = 4
IF bmpinfosize = 12 THEN ngroups = 3

IF nbits = 24 THEN
   IF grey = 1 THEN
      IF ngroups = 3 THEN
         FOR c = 0 TO 63
            d = c * 4
            palet$ = palet$ + CHR$(d) + CHR$(d) + CHR$(d)
            palet$ = palet$ + CHR$(d) + CHR$(d) + CHR$(d + 1)
            palet$ = palet$ + CHR$(d) + CHR$(d + 1) + CHR$(d)
            palet$ = palet$ + CHR$(d + 1) + CHR$(d) + CHR$(d)
         NEXT c
      ELSEIF ngroups = 4 THEN
         FOR c = 0 TO 63
            d = c * 4
            palet$ = palet$ + CHR$(d) + CHR$(d) + CHR$(d) + CHR$(0)
            palet$ = palet$ + CHR$(d) + CHR$(d) + CHR$(d + 1) + CHR$(0)
            palet$ = palet$ + CHR$(d) + CHR$(d + 1) + CHR$(d) + CHR$(0)
            palet$ = palet$ + CHR$(d + 1) + CHR$(d) + CHR$(d) + CHR$(0)
         NEXT c
      END IF
   ELSE
      FOR t = 0 TO 5
         FOR u = 0 TO 5
            FOR v = 0 TO 5
               palet$ = palet$ + CHR$(INT(v * (256 / 6)))
               palet$ = palet$ + CHR$(INT(u * (256 / 6)))
               palet$ = palet$ + CHR$(INT(t * (256 / 6)))
               IF ngroups = 4 THEN palet$ = palet$ + CHR$(0)
            NEXT v
         NEXT u
      NEXT t
      FOR count = 0 TO 31
         palet$ = palet$ + CHR$(count * 8) + CHR$(count * 8) + CHR$(count * 8)
         IF ngroups = 4 THEN palet$ = palet$ + CHR$(0)
      NEXT count
      palet$ = palet$ + CHR$(255) + CHR$(255) + CHR$(255)
   END IF
END IF

IF slowpal = 1 THEN
   FOR x = 1 TO LEN(palet$) STEP ngroups
      zb# = INT((ASC(MID$(palet$, x, 1))) / 4)
      zg# = INT((ASC(MID$(palet$, x + 1, 1))) / 4)
      zr# = INT((ASC(MID$(palet$, x + 2, 1))) / 4)
      zc# = zb# * 65536# + zg# * 256# + zr#
'      cres = ASC(MID$(palet$, x + 3, 1))
      PALETTE ((x - 1) / ngroups), zc#
   NEXT x
ELSE 'Use VGA Palette I/O Registers to set palette values - Faster
   OUT va, 0

   FOR x = 1 TO LEN(palet$) STEP ngroups
      zb = INT((ASC(MID$(palet$, x, 1))) / 4)
      zg = INT((ASC(MID$(palet$, x + 1, 1))) / 4)
      zr = INT((ASC(MID$(palet$, x + 2, 1))) / 4)
'      zc# = zb# * 65536# + zg# * 256# + zr#
'      cres = ASC(MID$(palet$, x + 3, 1))
      OUT vd, zr
      OUT vd, zg
      OUT vd, zb
      'PALETTE ((x - 1) / ngroups), zc#
   NEXT x
END IF


IF comptype = 0 THEN
   'No Compression
   IF nbits = 24 THEN
      y = picheight - 1
      x = 0
      lin$ = SPACE$((INT((3 * picwidth - 1) / 4) + 1) * 4)
      WHILE y >= 0
         GET 1, , lin$
         IF grey = 0 THEN
            WHILE x < picwidth
               b = ASC(MID$(lin$, x * 3 + 1, 1))
               g = ASC(MID$(lin$, x * 3 + 2, 1))
               r = ASC(MID$(lin$, x * 3 + 3, 1))
               IF b = g AND g = r THEN
                  p1 = INT(b / 8) + 216
                  IF b = 255 THEN p1 = 247
               ELSE
                  r = INT(r * (6 / 256))
                  g = INT(g * (6 / 256))
                  b = INT(b * (6 / 256))
                  qa = INT(RND(1) * (r + 1)) * .4
                  qb = INT(RND(1) * (g + 1)) * .4
                  qc = INT(RND(1) * (b + 1)) * .4
                  r = INT(r + qa - (r * .2))
                  g = INT(g + qg - (g * .2))
                  b = INT(b + qb - (b * .2))
                  IF r > 5 THEN r = 5
                  IF r < 0 THEN r = 0
                  IF g > 5 THEN g = 5
                  IF g < 0 THEN g = 0
                  IF b > 5 THEN b = 5
                  IF b < 0 THEN b = 0
        
                  p1 = r * 36 + g * 6 + b
               END IF
               PSET (x, y), p1
               x = x + 1
            WEND
         ELSE
            WHILE x < picwidth
               p1 = INT((ASC(MID$(lin$, x * 3 + 1, 1)) + ASC(MID$(lin$, x * 3 + 2, 1)) + ASC(MID$(lin$, x * 3 + 3, 1))) / 3)
               PSET (x, y), p1
               x = x + 1
            WEND
         END IF
         y = y - 1
         x = 0
      WEND
   ELSEIF nbits = 8 THEN
      y = picheight - 1
      x = 0
      lin$ = SPACE$((INT((picwidth - 1) / 4) + 1) * 4)
      WHILE y >= 0
         GET #1, , lin$
         WHILE x < picwidth
            PSET (x, y), ASC(MID$(lin$, x + 1, 1))
            x = x + 1
         WEND
         y = y - 1
         x = 0
      WEND
   ELSEIF nbits = 4 THEN
      y = picheight - 1
      x = 0
      lin$ = SPACE$((INT((picwidth - 1) / 8) + 1) * 4)
      WHILE y >= 0
         GET 1, , lin$
         WHILE x < picwidth
            p2 = ASC(MID$(lin$, INT(x / 2) + 1, 1)) AND 15
            p1 = (ASC(MID$(lin$, INT(x / 2) + 1, 1)) AND 240) / 16
            PSET (x, y), p1
            IF x + 1 < picwidth THEN PSET (x + 1, y), p2
            x = x + 2
         WEND
         y = y - 1
         x = 0
      WEND
   ELSEIF nbits = 1 THEN
      y = picheight - 1
      x = 0
      lin$ = SPACE$((INT((picwidth - 1) / 32) + 1) * 4)
      WHILE y >= 0
         GET 1, , lin$
         WHILE x < picwidth
            p8 = ASC(MID$(lin$, INT(x / 8) + 1, 1))
            FOR b = 0 TO 7
               IF x + (7 - b) < picwidth THEN PSET (x + (7 - b), y), (p8 AND 2 ^ b) / 2 ^ b
            NEXT b
            x = x + 8
         WEND
         y = y - 1
         x = 0
      WEND
   END IF
ELSEIF comptype = 1 THEN
   'Compression Essentials
   '[a][b] a>0, repeat b a-times
   '[0][0] End of line
   '[0][1] End of bitmap
   '[0][2][h][v] Move current position h to the right and v down
   'PRINT "Wow! RLE-8 Compression."
   a$ = " "
   x = 0
   y = 0
   ef = 0
   WHILE ef = 0
   GET #1, , a$
   c = ASC(a$)
   IF c > 0 THEN
      GET #1, , a$
      b = ASC(a$)
      FOR count = 1 TO c
        PSET (picwidth - x - 1, picheight - y - 1), b
        x = x + 1
        'if x>=picwidth then x=0:y=y+1
      NEXT count
   ELSE
      GET #1, , a$
      c = ASC(a$)
      IF c = 0 THEN
         x = 0
         y = y + 1
      ELSEIF c = 1 THEN
         ef = 1
      ELSEIF c = 2 THEN
         GET #1, , a$
         h = ASC(a$)
         GET #1, , a$
         v = ASC(a$)
         x = x + h
         y = y + v
      ELSE
         FOR count = 1 TO c
            GET #1, , a$
            p1 = ASC(a$)
            PSET (picwidth - x - 1, picheight - y - 1), p1
            x = x + 1
            'if x>=picwidth then x=0:y=y+1
         NEXT count
         IF c MOD 2 = 1 THEN GET #1, , a$
      END IF
      IF (y = picheight - 1 AND x >= picwidth) OR y >= picheight THEN ef = 1
   END IF
      IF EOF(1) THEN ef = 1
   WEND
ELSEIF comptype = 2 THEN
   'Compression Essentials
   '[a][b1|b0] a>0, repeat b1|b0 a/2-times e.g. a=5 -> b1 b0 b1 b0 b1
   '[0][0] End of line
   '[0][1] End of bitmap
   '[0][2][h][v] Move current position h to the right and v down
   'PRINT "Wow! RLE-4 Compression."
   a$ = " "
   x = 0
   y = 0
   ef = 0
   WHILE ef = 0
   GET #1, , a$
   c = ASC(a$)
   IF c > 0 THEN
      GET #1, , a$
      b = ASC(a$)
      FOR count = 1 TO c
        IF (count MOD 2) = 0 THEN
           PSET (picwidth - x - 1, picheight - y - 1), b AND 15
        ELSE
           PSET (picwidth - x - 1, picheight - y - 1), (b AND 240) / 16
        END IF
        x = x + 1
        'if x>=picwidth then x=0:y=y+1
      NEXT count
   ELSE
      GET #1, , a$
      c = ASC(a$)
      IF c = 0 THEN
         x = 0
         y = y + 1
      ELSEIF c = 1 THEN
         ef = 1
      ELSEIF c = 2 THEN
         GET #1, , a$
         h = ASC(a$)
         GET #1, , a$
         v = ASC(a$)
         x = x + h
         y = y + v
      ELSE
         FOR count = 1 TO INT(c / 2)
            GET #1, , a$
            p1 = ASC(a$)
            PSET (picwidth - x - 1, picheight - y - 1), (p1 AND 240) / 16
            x = x + 1
            PSET (picwidth - x - 1, picheight - y - 1), p1 AND 15
            x = x + 1
            'if x>=picwidth then x=0:y=y+1
         NEXT count
         br = INT(c / 2)
         IF (c MOD 2) = 1 THEN
            GET #1, , a$
            PSET (picwidth - x - 1, picheight - y - 1), (p1 AND 240) / 16
            x = x + 1
            br = br + 1
         END IF
         IF br MOD 2 = 1 THEN GET #1, , a$
      END IF
      IF (y = picheight - 1 AND x >= picwidth) OR y >= picheight THEN ef = 1
   END IF
      IF EOF(1) THEN ef = 1
   WEND


END IF
CLOSE

