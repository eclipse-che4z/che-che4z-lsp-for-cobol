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
           PERFORM B.
       B.
           DISPLAY "B".
           GO TO C. 
       C.
           DISPLAY "C1".
           EXIT.
           DISPLAY "C2".
       D.
           DISPLAY "D".
       