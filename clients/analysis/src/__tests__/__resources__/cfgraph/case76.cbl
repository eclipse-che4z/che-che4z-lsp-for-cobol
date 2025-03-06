       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       PROCEDURE DIVISION.

           PERFORM PROC.
      *    PERFORM PROC.
           GO TO PAR-EXIT.

       PROC.
           DISPLAY "PROC".           
           PERFORM PAR1.

       PAR1.
           DISPLAY "PAR1".           

       PAR-EXIT.
           GOBACK.
