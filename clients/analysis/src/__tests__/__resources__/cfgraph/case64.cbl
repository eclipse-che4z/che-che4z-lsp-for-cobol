       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PROG.

       PROCEDURE DIVISION.
           PERFORM SEC1.
           GOBACK.

       SEC1 SECTION.
      
           PERFORM UNTIL A EQUAL 100
               IF  B EQUAL ZEROES
                   PERFORM VARYING A FROM A BY -1
                       UNTIL B
                       NOT EQUAL SPACES
                   END-PERFORM
               END-IF
           END-PERFORM.
      
       SEC1-EXIT.
           EXIT.
           EJECT

       SEC-2 SECTION.
