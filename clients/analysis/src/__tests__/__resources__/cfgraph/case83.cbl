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
           IF 2 > 1
              GO TO SEC1-END
           END-IF.
           STOP RUN.
       
       SEC1-END.
           DISPLAY "SEC1-END".
           EXIT.

       SEC2 SECTION.
           DISPLAY "SEC2".
       