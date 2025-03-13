       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       PROCEDURE DIVISION.
       MAIN.
           PERFORM PAR1.
           PERFORM PAR2.
           GOBACK.

       PAR1.
           READ PROD-LINE-FILE-IN
               INTO WS-PROD-LINE-REC
                   AT END MOVE 'Y' TO SW-EOF-PROD.
       PAR2.
           DISPLAY "PAR2".
