       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. HLLOWRLD.                                                    
                                                                                
       PROCEDURE DIVISION.
           IF (A > B)
               PERFORM A
           ELSE
               PERFORM B.

           IF (A > B)
               PERFORM C
           ELSE
               IF (C > D)
                   PERFORM D
                ELSE
                   PERFORM E.

       X.
           DISPLAY "X".
           STOP RUN.
       A.
           DISPLAY "A".
           STOP RUN.
       B.
           DISPLAY "B".
       C.
           DISPLAY "C".
           STOP RUN.
       D.
           DISPLAY "D".
       E.
           DISPLAY "E".
           STOP RUN.

