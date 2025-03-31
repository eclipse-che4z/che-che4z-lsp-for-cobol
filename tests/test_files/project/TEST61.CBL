       IDENTIFICATION DIVISION.
       PROGRAM-ID TEST3.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 MSGS.
           05 MSG PIC X(80) VALUE 'Hello world!'.
       01  OUT          PIC X(200).
 
       PROCEDURE DIVISION.
           XML GENERATE OUT FROM MSGS       
           WITH ENCODING 1200
           WITH XML-DECLARATION.