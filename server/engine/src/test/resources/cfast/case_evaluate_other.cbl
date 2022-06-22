       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       PROCEDURE DIVISION.
           EVALUATE WS-NUM1
               WHEN "0"
                   GO TO PAR1
               WHEN "1" THRU "9"
                   GO TO PAR1
               WHEN OTHER
                   STOP RUN
           END-EVALUATE.
       PAR1.
           CONTINUE.