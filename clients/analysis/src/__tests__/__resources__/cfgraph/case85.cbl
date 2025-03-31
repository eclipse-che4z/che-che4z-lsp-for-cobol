       IDENTIFICATION DIVISION.
       PROGRAM-ID.   PROG.

       PROCEDURE DIVISION.

           PERFORM MAIN.
           PERFORM NOT-REACHABLE.
           GOBACK.

       MAIN.
           IF A > B
             GO TO B.
           
           IF C > B
             GO TO B.
           
           PERFORM A.

       NOT-REACHABLE.
           DISPLAY "A".

       A.
           DISPLAY "A".
           GOBACK.

       B.
           DISPLAY "B".


