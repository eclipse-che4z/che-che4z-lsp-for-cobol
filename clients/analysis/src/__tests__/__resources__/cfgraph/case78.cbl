       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.
       
       PROCEDURE DIVISION.
           DISPLAY "BEGIN".
           PERFORM A THRU C.
           DISPLAY "END".
           STOP RUN.
       A.
           DISPLAY "A".
           GO TO B.
       B.
           DISPLAY "B".
           EXIT.
       C.
           DISPLAY "C".
       D.
           DISPLAY "D".
       