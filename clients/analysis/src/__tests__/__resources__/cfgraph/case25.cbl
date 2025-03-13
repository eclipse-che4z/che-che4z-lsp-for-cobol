       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CASE25.
       PROCEDURE DIVISION.
           DISPLAY 'OUT'.
           PERFORM PARAG2.
       PARAG1.
           DISPLAY 'PARAG1'.
       PARAG2.
           DISPLAY 'PARAG2'.
           IF 2 > 1 THEN
                GO TO PARAG1
           END-IF.     
       PARAG3.
           DISPLAY 'PARAG3'.