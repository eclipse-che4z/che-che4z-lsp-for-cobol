       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       PROCEDURE DIVISION.
           PERFORM UNTIL WS-NUM1 IS EQUAL "A"
               PERFORM PAR1
           END-PERFORM.
           PERFORM PAR2.

       PAR1.
           DISPLAY "PAR1".
           STOP RUN.

       PAR2.
           DISPLAY "PAR1".                     