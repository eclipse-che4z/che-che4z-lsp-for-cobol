       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CFGPSQE.
       PROCEDURE DIVISION.
           DISPLAY 'OUT'.
           PERFORM PARAG1.
           PERFORM PARAG2.
       PARAG1.
           DISPLAY 'PARAG1'.
       PARAG2.
           DISPLAY 'PARAG2'.
           GO TO PARAG1.
       PARAG3.
           DISPLAY 'PARAG3'.
