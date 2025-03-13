       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. HLLOWRLD.                                                    
       PROCEDURE DIVISION.
       A.
           DISPLAY "A".
       B.
           DISPLAY "B".
           PERFORM C.
           EXIT PARAGRAPH.

           DISPLAY "NOT REACHABLE".
           STOP RUN.
       C.
           DISPLAY "C".
       D.
           DISPLAY "D".
