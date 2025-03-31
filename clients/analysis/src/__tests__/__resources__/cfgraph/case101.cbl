       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.

       PROCEDURE DIVISION.
           DISPLAY "BEGIN_01".
           PERFORM A THRU C.
           DISPLAY "END".
           STOP RUN.
       A.
           DISPLAY "A".
       B.
           DISPLAY "B".
           GO TO D.
           DISPLAY "END-B".
       C.
           DISPLAY "C".
       D.
           DISPLAY "D".
           PERFORM E.

       E.
           DISPLAY "E".
           PERFORM C.
           GO TO C.

