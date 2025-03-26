       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.
       
       PROCEDURE DIVISION.
           DISPLAY "BEGIN".
           PERFORM SEC1.
           DISPLAY "END".
           STOP RUN.
           
       SEC1 SECTION.
           DISPLAY "SEC1".
           EXIT.
           GO TO SEC2-END.

       SEC2 SECTION.
           DISPLAY "SEC2".

       SEC2-END.
           DISPLAY "SEC2-END".
           EXIT.

       SEC3 SECTION.
           DISPLAY "SEC3".
       