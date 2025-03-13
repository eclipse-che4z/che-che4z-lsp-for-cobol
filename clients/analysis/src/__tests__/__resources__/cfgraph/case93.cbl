       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
    
           GO TO PAR1.

       PAR1.
           PERFORM PAR2.

       PAR2.
           GO TO PAR3.

       PAR3.
           GO TO PAR4.

       PAR4.
           ALTER PAR3 TO PROCEED TO PAR-EXIT
           GO TO PAR1.

       PAR-EXIT.
           DISPLAY "PAR-EXIT".
           GOBACK.
           