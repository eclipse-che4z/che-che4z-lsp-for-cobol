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
       S010 SECTION.
           display 'section S010'.
       S090 SECTION.
           display 'section S090'.
           STOP RUN.       