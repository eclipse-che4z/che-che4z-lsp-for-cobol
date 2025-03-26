       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPTSEC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       
           PERFORM BIG_SEC.
           GOBACK.
           
       BIG_SEC SECTION.
           DISPLAY "BIG_SEC".
           IF A > B
               GO TO BIG_SEC_EXIT.

           GO TO PAR1.
           
       PAR1.
           DISPLAY "FALSE POSITIVE".

       BIG_SEC_EXIT.
           DISPLAY "BIG_SEC_EXIT".