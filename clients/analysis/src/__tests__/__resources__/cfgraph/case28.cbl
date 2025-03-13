       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       PROCEDURE DIVISION.
           EVALUATE WS-NUM1
               WHEN "0"
                   GO TO PARAG2
                   GO TO PARAG3
               WHEN "1" THRU "9"
                   CONTINUE
           END-EVALUATE.
       PARAG1.
           STOP RUN.
       PARAG2.
           STOP RUN.
       PARAG3.
           CONTINUE.                      