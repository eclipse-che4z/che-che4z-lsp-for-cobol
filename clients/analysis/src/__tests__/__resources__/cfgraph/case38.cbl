       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       DATA DIVISION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            IF WS-OUT-STAT NOT EQUAL ZEROES
               PERFORM STOP-RUN
            END-IF

            IF WS-OUT-STAT NOT EQUAL ZEROES
               PERFORM STOP-RUN
            END-IF
            .

       NEXT-PROC.

       STOP-RUN.
            STOP RUN.
