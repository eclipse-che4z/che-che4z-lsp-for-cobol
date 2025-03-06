       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       PROCEDURE DIVISION.
           PERFORM UNTIL EXIT
               PERFORM PAR1
               EXIT PERFORM CYCLE
           END-PERFORM.
           PERFORM PAR2.
           STOP RUN.

       PAR1.
           DISPLAY "PAR1".

       PAR2.
           DISPLAY "PAR1".                     