       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CFGPSQE.
       PROCEDURE DIVISION.
           DISPLAY 'OUT'.
           IF 2 > 1 THEN
               GO TO PARAG2
           END-IF.
           PERFORM PARAG3.
       PARAG1.
           DISPLAY 'PARAG1'.
           STOP RUN.
       PARAG2.
           DISPLAY 'PARAG2'.
           STOP RUN.
       PARAG3.
           DISPLAY 'PARAG3'.
