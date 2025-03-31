       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CFGPSQE.
       PROCEDURE DIVISION.
           DISPLAY 'OUT'.
           IF 2 > 1 THEN
               GO TO PARAG2
           END-IF.
       PARAG1.
           DISPLAY 'PARAG1'.
       PARAG2.
           DISPLAY 'PARAG2'.
           STOP RUN.
