       IDENTIFICATION DIVISION.
       PROGRAM-ID. CFGPSQE.
       DATA DIVISION.
       PROCEDURE DIVISION.
           IF 6<9
             STOP RUN
           END-IF.
           PERFORM A.
       A.
           DISPLAY 'ERROR'.
           STOP RUN.