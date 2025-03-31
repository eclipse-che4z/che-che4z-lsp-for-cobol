       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PROG.

       PROCEDURE DIVISION.

       MAIN SECTION.

           EVALUATE A

               WHEN '0'
                   IF B
                       IF C
                           PERFORM SEC1
                       ELSE
                           PERFORM SEC0
                       END-IF
      
                   END-IF

               WHEN OTHER

                   MOVE 3 TO D

           END-EVALUATE.
           GOBACK.
      
       SEC0 SECTION.
      
           PERFORM UNTIL A EQUAL 100

               IF  B EQUAL ZEROES
      
                   PERFORM VARYING L FROM D BY -1
                       UNTIL F
                       NOT EQUAL SPACES OR W LESS 1
                   END-PERFORM
      
               END-IF
      
           END-PERFORM.
      
       SEC0-EXIT.
           EXIT.
           EJECT
      
       SEC1 SECTION.
