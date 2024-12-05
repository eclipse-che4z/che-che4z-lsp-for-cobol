PROCESS XMLPARSE(XMLSS)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. XML5.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  REQUEST.
           06 ROUTE.
               11 NAME                  PIC  X(030).
               11 VERSION               PIC  9(004).
           06 QUESTION.
               11 IDENT                 PIC  9(009).
               11 XMLFILENAME           PIC  X(006).
               11 XMLFILEINH            PIC  X(5000).
       
       
       01  XML-DOC                    PIC X(5000) USAGE NATIONAL.
       01  XML-IDX                    PIC S9(9) BINARY.
       01  XML-CHAR-CNT               PIC S9(9) BINARY.
       
       PROCEDURE DIVISION.
       MAINLINE SECTION.
           MOVE 'serviceRequest' TO NAME
           MOVE 1                TO VERSION
           MOVE 111111111        TO IDENT
           MOVE 'FILE-1'         TO XMLFILENAME
           MOVE '<?xml version="1.0" encoding="UTF-8"?><SOAP-ENV:Envelop
      -          'e.....<SOAP-ENV:Envelope>'
               TO XMLFILEINH
       
           XML PARSE XML-DOC ENCODING 1200
           VALIDATING WITH QUESTION
           PROCESSING PROCEDURE XML-HANDLER
               ON EXCEPTION
                     DISPLAY 'XML Error: ' XML-CODE
                     GOBACK
               NOT ON EXCEPTION
                     DISPLAY 'ALL DONE.'
           END-XML
           GOBACK
           .
       
       XML-HANDLER.
           DISPLAY XML-EVENT (1:22) ':' XML-TEXT
           .