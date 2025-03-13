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
           GO TO C.
       B.
           DISPLAY "B".
       C.
           DISPLAY "C".
       D.
           DISPLAY "D".
       