       IDENTIFICATION DIVISION.
       PROGRAM-ID TEST3.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  XML-INPUT.
           05  NAME         PIC X(10) VALUE "JANE".
           05  SALARY.
               10  BASIC    PIC X(5) VALUE "10000".
               10  HRA      PIC X(3) VALUE "2000".
           05 DEPT          PIC X(3) VALUE "SALES". 

       01  XML-OUT          PIC X(200).
 
       PROCEDURE DIVISION.
           XML GENERATE XML-OUT FROM XML-INPUT WITH ATTRIBUTES. 
