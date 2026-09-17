       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1. 
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-AREA. 
           03 AREA-XW1. 
               05 DET001-XW1. 
                 07 FILLER               PIC X(5)    VALUE 2. 
       PROCEDURE DIVISION. 
           OPEN FILE 0123. 
           OPEN FILE 0123 MAX LENGTH 2. 
           OPEN FILE 0123 MAX LENGTH DET001-XW1. 
           OPEN FILE 0123 MAX LENGTH LAYOUT.
      * Negative Tests     
           OPEN FILE 01. 
           OPEN FILE 01234. 
           OPEN FILE 0123 MAX LENGTH ABCD. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoFileOpenStatement.java