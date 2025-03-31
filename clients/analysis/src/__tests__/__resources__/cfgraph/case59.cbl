       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. HLLOWRLD.                                                    
       PROCEDURE DIVISION.
       A.
           DISPLAY "A".
           PERFORM C.
       B.
           DISPLAY "B".
           STOP RUN.
       C.
           DISPLAY "C".
           EXIT PARAGRAPH.
           GO TO D.
       D.
           DISPLAY "D".
