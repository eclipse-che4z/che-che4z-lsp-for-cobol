       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.
       
       PROCEDURE DIVISION.
           DISPLAY "BEGIN".
           PERFORM A.
           DISPLAY "END".
           STOP RUN.
       A.
           DISPLAY "A".
           EXIT.
           GO TO B.
       B.
           DISPLAY "B".
       C.
           DISPLAY "C".
       D.
           DISPLAY "D".
       