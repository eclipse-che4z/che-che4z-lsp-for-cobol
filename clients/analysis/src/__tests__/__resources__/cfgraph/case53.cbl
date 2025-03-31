       IDENTIFICATION DIVISION.
       PROGRAM-ID. HLLOWRLD.
       DATA DIVISION. 

       PROCEDURE DIVISION.
           PERFORM C OF B THRU C OF E.
           STOP RUN.
       A SECTION.
           DISPLAY 'A'.
       B SECTION.
           DISPLAY 'B'.
           EXIT SECTION.
       C.
           DISPLAY 'B-C'.
       D.
           DISPLAY 'D'.
       E SECTION.
           DISPLAY 'E'.
       C.
           DISPLAY 'E-C'.
       X.
           DISPLAY 'X'.
