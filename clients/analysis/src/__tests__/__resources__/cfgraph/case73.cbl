       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PROG.

       PROCEDURE DIVISION.
           PERFORM PAR1.
           GOBACK.

       PAR1.
           PERFORM PAR2.

       PAR2.
           GO TO PAR3.

       PAR3.
           PERFORM PAR1.
