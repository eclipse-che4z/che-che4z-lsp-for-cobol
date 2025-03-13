       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       PROCEDURE DIVISION.
           GO TO PAR1.
       SEC1.
           DISPLAY "SEC1".
       PAR1.
           DISPLAY "PAR1".
           if 2 < 1
              EXIT SECTION
           END-IF.
       PAR2.
           DISPLAY "PAR2".