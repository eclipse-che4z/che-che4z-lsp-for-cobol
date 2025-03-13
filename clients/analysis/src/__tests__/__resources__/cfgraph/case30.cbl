       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CFGEXIT.
       PROCEDURE DIVISION.
           DISPLAY 'OUT'.
           IF 2 > 1 THEN
               GO TO PARAG2
           END-IF.
       PARAG1.
           DISPLAY 'PARAG1'.
           EXIT PROGRAM.
       PARAG2.
           DISPLAY 'PARAG2'.