       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       PROCEDURE DIVISION.
           PERFORM 
               PERFORM SEC1
           END-PERFORM.
           STOP RUN.

       SEC0 SECTION.
           DISPLAY "SEC0".
           STOP RUN.

       SEC1 SECTION.
           DISPLAY "SEC1".
       PARAG0.
           DISPLAY "PARAG0".
           GO TO PARAG1.

       PARAG1.
           GO TO PARAG2.

       PARAG2.
           ALTER PARAG1 TO SEC0.

       PARAG_END.
           DISPLAY "PARAG_END".
                     