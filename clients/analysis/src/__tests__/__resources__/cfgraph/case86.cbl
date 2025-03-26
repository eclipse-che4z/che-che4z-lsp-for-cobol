       IDENTIFICATION DIVISION.
       PROGRAM-ID.   PROG.

       PROCEDURE DIVISION.

           PERFORM MAIN.
           GOBACK.

       MAIN SECTION.
           IF A > B
             GO TO MAIN-EXIT.

           IF A > B
             GO TO MAIN-EXIT.

           PERFORM SEC1.

       MAIN-EXIT.
           DISPLAY "MAIN-EXIT".
           EXIT.

       SEC1 SECTION.
           DISPLAY "SEC1".


