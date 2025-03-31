       IDENTIFICATION DIVISION.
       PROGRAM-ID.   PROG.

       PROCEDURE DIVISION.
           PERFORM 100-MAINLINE THRU 100-EXIT.
           GOBACK.

       100-MAINLINE.
           PERFORM 300-FIELD-EDITS THRU 300-EXIT.

       100-EXIT.
           EXIT.

       300-FIELD-EDITS.
           IF A > B
              GO TO 300-EXIT.
      
       300-EXIT.
           EXIT.


