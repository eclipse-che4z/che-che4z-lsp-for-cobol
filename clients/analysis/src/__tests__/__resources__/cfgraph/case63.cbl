       IDENTIFICATION DIVISION.
       PROGRAM-ID. HLLOWRLD.
       DATA DIVISION. 

       PROCEDURE DIVISION.
           PERFORM B.
           DISPLAY 'END'.
           STOP RUN.
       A SECTION.
           DISPLAY 'A'.
       B SECTION.
           DISPLAY 'B'.
           PERFORM C.
       C.
           DISPLAY 'C'.
           PERFORM D.
       D.
           DISPLAY 'D'.
       E SECTION.
           DISPLAY 'E'.
           GOBACK.
