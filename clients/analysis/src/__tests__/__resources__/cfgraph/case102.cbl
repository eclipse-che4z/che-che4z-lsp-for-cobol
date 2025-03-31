       IDENTIFICATION DIVISION.
       PROGRAM-ID. HLLOWRLD.
       DATA DIVISION.

       PROCEDURE DIVISION.
       0000-MAIN SECTION.
           DISPLAY 'START'.
           PERFORM 1-S
           DISPLAY 'END'.
           GOBACK.

       1-S SECTION.
           DISPLAY '1-S'.
           PERFORM 1-EXIT.

       1-EXIT.
           DISPLAY '1-EXIT'.
           EXIT SECTION.

       1-NOT.
           DISPLAY '1-NOT'.

       2-S SECTION.
           DISPLAY '2-S'.
           
