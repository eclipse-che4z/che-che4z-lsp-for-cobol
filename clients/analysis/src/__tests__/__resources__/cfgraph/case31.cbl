       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CFGPSQE.
       PROCEDURE DIVISION.
       PARAG1.
           IF 6<9
             PERFORM PARAG3
           END-IF.
           DISPLAY 'PARAG1'.
       PARAG2.
           DISPLAY 'PARAG2'.
           STOP RUN.
       PARAG3.
           DISPLAY 'PARAG3'.
           STOP RUN.