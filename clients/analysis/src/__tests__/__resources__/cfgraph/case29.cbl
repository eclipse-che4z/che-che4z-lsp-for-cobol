       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       PROCEDURE DIVISION.
           PERFORM UNTIL WS-NUM1 IS EQUAL "A"
               GO TO PARAG2
           END-PERFORM.
       PARAG1.
           STOP RUN.
       PARAG2.
           CONTINUE.
                     