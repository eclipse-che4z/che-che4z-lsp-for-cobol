       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 XML-STRING                PIC X(1000) VALUE SPACES.
       01 EZ-PTR                    PIC S9(4) COMP VALUE 1.
       
       PROCEDURE DIVISION.
          MAINLINE.
             DISPLAY 'XML-DOCUMENT=' XML-STRING(EZ-PTR)
             XML PARSE XML-STRING(EZ-PTR) RETURNING NATIONAL
                                PROCESSING PROCEDURE XML-HANDLER
               ON EXCEPTION
                 GO TO ABEND
               NOT ON EXCEPTION
                 PERFORM OK
              END-XML.
              STOP RUN.
              
       XML-HANDLER.
           DISPLAY 'XML-EVENT=' XML-EVENT.

       ABEND.
           DISPLAY 'ABEND'.
           STOP RUN.

       OK.
           DISPLAY 'XML DOCUMENT SUCCESSFULLY PARSED'.
           
