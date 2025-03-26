       IDENTIFICATION DIVISION.
       PROGRAM-ID. CFGPSQE.
       DATA DIVISION.
       PROCEDURE DIVISION.
           IF 6<9
             GO TO A
           ELSE
             GO TO B
           END-IF.
           PERFORM C.
       A.
           PERFORM C.
           STOP RUN.
       B.
           PERFORM C.
           STOP RUN.
       C.
           DISPLAY 'ERROR'.
           STOP RUN.