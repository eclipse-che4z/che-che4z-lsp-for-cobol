       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CASE4.
       PROCEDURE DIVISION.
           DISPLAY 'OUT'.
           GO TO PARAG1.
       PARAG1.
           DISPLAY 'PARAG1'.
           PERFORM PARAG3.
           PERFORM PARAG2.
        copy CPY1.
        copy cpy1 REPLACING LEADING ==PARAG2== by ==PARAG3==.
           STOP RUN.      