       IDENTIFICATION DIVISION.
       PROGRAM-ID. CFGPSQE.
       DATA DIVISION.
       PROCEDURE DIVISION.
           EVALUATE WS-NUM1
           WHEN "0"
              IF 6<9
                GO TO A
              ELSE
                GO TO B
              END-IF
             
             PERFORM C
           END-EVALUATE.
       A.
           STOP RUN.
       B.
           STOP RUN.
       C.
           STOP RUN.