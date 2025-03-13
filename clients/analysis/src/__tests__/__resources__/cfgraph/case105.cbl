       IDENTIFICATION DIVISION.
       PROGRAM-ID. HLLOWRLD.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  VAR PIC 9(1).
       01  S-3-VAR PIC 9(1).

       PROCEDURE DIVISION.
       0000-MAIN SECTION.
           MOVE 1 TO VAR.
           MOVE 1 TO S-3-VAR.

           DISPLAY 'START'.
           PERFORM 2-S
           DISPLAY 'MIDDLE'.
           MOVE 0 TO S-3-VAR.
           GO TO 3-S.

           DISPLAY 'END'.
           GOBACK.

       2-S SECTION.
           DISPLAY '2-S'.
           PERFORM 2-EXIT.
           DISPLAY '2-S-END'.

       2-EXIT.
           DISPLAY '2-EXIT'.
           IF VAR EQUAL TO 1 THEN
               PERFORM 3-S
           END-IF.
           DISPLAY '2-EXIT-END'.

       3-S SECTION.
           DISPLAY '3-S'.
           MOVE 0 TO VAR.
           IF S-3-VAR EQUAL TO 1 THEN
               GO TO 2-EXIT
           END-IF.


