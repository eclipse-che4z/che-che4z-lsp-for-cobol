       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       PROCEDURE DIVISION.
           PERFORM PAR1.
           STOP RUN.

       PAR1.
           DISPLAY "PAR1".
           IF 2 < 1
              STOP RUN
              PERFORM PAR2
           END-IF.

       PAR2.
           DISPLAY "PAR2".