       COPY MORECOOL.
       01  PARENT.
       PROCEDURE DIVISION.
       MAINLINE.
           MOVE 0 TO XYZ-ID.
           MOVE 0 TO ABC-ID.
           MOVE 0 TO DEF-ID.
       COPY NEW REPLACING ==NAME2== BY ==NAME3== .
           GOBACK. 