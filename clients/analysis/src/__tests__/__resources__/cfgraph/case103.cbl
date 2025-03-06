       IDENTIFICATION DIVISION.
       PROGRAM-ID. HLLOWRLD.
       DATA DIVISION.

       PROCEDURE DIVISION.
       0000-MAIN SECTION.
           DISPLAY 'START'.
           PERFORM 2-S
           DISPLAY 'END'.
           GOBACK.

       2-S SECTION.
           DISPLAY '2-S'.
           PERFORM 2-EXIT.
           DISPLAY '2-S-END'.

       2-CALC.
           DISPLAY '2-CALC'.

       2-EXIT.
           DISPLAY '2-EXIT'.
           EXIT SECTION.
           DISPLAY '2-EXIT-END'.


