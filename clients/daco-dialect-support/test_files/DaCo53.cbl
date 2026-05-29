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
                   07 FILLER               PIC X(5)    VALUE 'REMBD'. 
       PROCEDURE DIVISION. 
               READ FILE 0123. 
               READ FILE 0123 MAX LENGTH 2. 
               READ FILE 0123 MAX LENGTH DET001-XW1. 
               READ FILE 0123 MAX LENGTH LAYOUT.
      * Negative Tests     
               READ FILE 01. 
               READ FILE 01234. 
               READ FILE 0123 MAX LENGTH ABCD. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoFileReadStatement.java