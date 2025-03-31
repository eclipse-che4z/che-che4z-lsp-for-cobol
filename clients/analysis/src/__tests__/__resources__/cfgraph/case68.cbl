       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PROG.

       PROCEDURE DIVISION.
           PERFORM PAR1.
           GOBACK.

       PAR1.
           IF A > B
               DISPLAY "A > B"
           ELSE 
               GO TO PAR3.

       PAR2.
           GOBACK.

       PAR3.

