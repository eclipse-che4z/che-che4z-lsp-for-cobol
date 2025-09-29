       IDENTIFICATION DIVISION.
       PROGRAM-ID. perform-bug.
       DATA DIVISION.
       PROCEDURE DIVISION.
           PERFORM MAIN-PROCESSING.
           STOP RUN.
           DISPLAY "HELLO".
           
        MAIN-PROCESSING SECTION.
           PERFORM UNTIL 1 + 1 < 2
              GO TO ERROR-HANDLER
           END-PERFORM.

        ERROR-HANDLER SECTION.
           STOP RUN.