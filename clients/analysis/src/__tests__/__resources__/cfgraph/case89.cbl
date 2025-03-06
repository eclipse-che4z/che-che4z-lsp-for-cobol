       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       PROCEDURE DIVISION.
           IF A > B THEN
               ALTER PAR1 TO PROCEED TO PAR2
           END-IF.
           GO TO PAR1.
       SEC1 SECTION.

       PAR1.
           GO TO ALTER_PAR1.
       PAR2.
           GO TO ALTER_PAR2.
       PAR3.
           GO TO ALTER_PAR3.

       ALTER_PAR1.
           DISPLAY "ALTER_PAR1".
           STOP RUN.

       ALTER_PAR2.
           DISPLAY "ALTER_PAR2".
           STOP RUN.

       ALTER_PAR3.
           DISPLAY "ALTER_PAR3".
           STOP RUN.
