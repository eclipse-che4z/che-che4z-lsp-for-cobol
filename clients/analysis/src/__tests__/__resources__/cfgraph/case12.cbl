       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       PROCEDURE DIVISION.
       A-PARA.
           PERFORM DISPLAY 'IN A-PARA'
           END-PERFORM.
           PERFORM C-PARA THRU D-PARA.
           GO TO D-PARA.
       B-PARA.
           DISPLAY 'IN B-PARA'.
           STOP RUN.
       C-PARA.
           DISPLAY 'IN C-PARA'.
       MY1 SECTION.
       D-PARA.
           DISPLAY '---------'.
           DISPLAY 'IN D-PARA'.
           GO TO A-PARA.
       E-PARA.