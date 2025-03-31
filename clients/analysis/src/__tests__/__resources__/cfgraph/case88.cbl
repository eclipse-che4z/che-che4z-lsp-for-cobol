       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       PROCEDURE DIVISION.
           ALTER PAR1 TO PROCEED TO PAR2.
           GO TO PAR1.

       PAR1.
           GO TO NOT_REACHABLE.
       PAR2.
           GO TO ALTER_PAR2.
       PAR3.
           GO TO ALTER_PAR3.

       NOT_REACHABLE.
           DISPLAY "NOT_REACHABLE".
           STOP RUN.

       ALTER_PAR2.
           DISPLAY "ALTER_PAR2".
           STOP RUN.

       ALTER_PAR3.
           DISPLAY "ALTER_PAR3".
           STOP RUN.
