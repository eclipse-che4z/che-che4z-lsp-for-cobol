       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CFGPSQE.
       PROCEDURE DIVISION.
           IF 2 > 1 THEN
               GO TO PARAG2
               IF 2 > 1
                   DISPLAY 'TEST'
               END-IF    
               GO TO PARAG3
           END-IF.    
       PARAG1.
           DISPLAY 'PARAG1'.
           STOP RUN.
       PARAG2.
           DISPLAY 'PARAG2'.
           STOP RUN.
       PARAG3.
           DISPLAY 'PARAG3'.
