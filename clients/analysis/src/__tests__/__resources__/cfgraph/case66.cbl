       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PROG.

       PROCEDURE DIVISION.
           PERFORM PAR1.
           GOBACK.

       PAR1.
           IF A > B THEN
               DISPLAY "A > B"
           ELSE 
               GOBACK.

       PAR2.
           EXIT.
           EJECT

       SEC-2 SECTION.
