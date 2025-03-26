       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CFGPSQE.
       PROCEDURE DIVISION.
           DISPLAY 'OUT'.
           PERFORM PARAG2.
       PARAG1.
           DISPLAY 'PARAG1'.
           STOP RUN.
       PARAG2.
           DISPLAY 'PARAG2'.
           IF 1 < 2 THEN
                GO TO PARAG3
           END-IF.
       PARAG3.
           DISPLAY 'PARAG3'.
