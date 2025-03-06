       IDENTIFICATION DIVISION.
       PROGRAM-ID. HLLOWRLD.
       DATA DIVISION. 

       PROCEDURE DIVISION.
       0000-MAIN SECTION.
           DISPLAY 'START'.
           PERFORM 1-S
           DISPLAY 'HELLO'.
           GOBACK
           .
       1-S SECTION.
           DISPLAY '1-START'.
           PERFORM 1-EXIT.
       1-EXIT.
           DISPLAY '1-EXIT'.
           EXIT SECTION.
       1-NOT.
           DISPLAY 'NOT REACHABLE'.
           
       2-S SECTION.
           DISPLAY '2-START'.
           PERFORM 2-EXIT.
       2-EXIT.
           DISPLAY '2-EXIT'.
           EXIT SECTION.
