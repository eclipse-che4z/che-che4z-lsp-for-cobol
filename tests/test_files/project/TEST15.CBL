       IDENTIFICATION DIVISION.
       PROGRAM-ID. prog.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  x PIC X(200).
       01  y.
           03  z PIC X(15) VALUE "hello, world!".
           03  az PIC X(15) VALUE "goodbye, world!".
           03  ab.
               05  abc PIC x(3) value spaces.

       PROCEDURE DIVISION.
           XML GENERATE x
               FROM y
               WITH XML-DECLARATION
               NAME OF abc IS "ABCDEF", z IS "zeta"
               TYPE OF z IS ATTRIBUTE
               SUPPRESS WHEN SPACES

           DISPLAY FUNCTION TRIM(x)
           .