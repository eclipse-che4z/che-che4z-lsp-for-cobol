       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PROG.

       PROCEDURE DIVISION.
           PERFORM PAR1.
           GOBACK.

       PAR1.
           GO TO PAR2.

       PAR2.
           PERFORM PAR3.

       PAR3.
           PERFORM PAR1.
