       IDENTIFICATION DIVISION.
       PROGRAM-ID. CFGPSQE.
       DATA DIVISION.
       PROCEDURE DIVISION.
           EVALUATE WS-NUM1
           WHEN "0"
              GO TO A
           WHEN "1"
              GO TO B
           WHEN OTHER
              GO TO B
           END-EVALUATE.
          
           PERFORM C.
       A.
           STOP RUN.
       B.
           STOP RUN.
       C.
           STOP RUN.