       IDENTIFICATION DIVISION.                    
       PROGRAM-ID. TEST14.                     
       DATA DIVISION.                              
       WORKING-STORAGE SECTION.  
       01 GREET. 
           05 GREETMSG PIC X(80) VALUE 'Hello !!'.
      *    05 DOC PIC X(512).
      *    05 DOC-LENGTH PIC 9(05).
       01 DOC PIC X(512).
       01 DOC-LENGTH PIC 9(05).

      * NAMESPACE AND PREFIX              
       01 NSPACE PIC X(20) VALUE 'http://example'.
       01 NPREFIX PIC X(5) VALUE 'pre'.

       PROCEDURE DIVISION.
      *    MOVE 0 TO XYZ-ID.
      * GENERATE THE XML VALIDATES OUTPUT AND ENCODING.
           XML GENERATE DOC FROM GREET
            COUNT IN DOC-LENGTH
               
               WITH ENCODING 1208                
               NAMESPACE IS NSPACE
               NAMESPACE-PREFIX IS NPREFIX
               ON EXCEPTION
               DISPLAY 'ERROR IN GENERATE XML:' XML-CODE
            END-XML.
            STOP RUN.   