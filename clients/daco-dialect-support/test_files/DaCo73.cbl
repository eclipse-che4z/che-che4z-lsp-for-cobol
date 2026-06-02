       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1. 
       ENVIRONMENT DIVISION.
       DACO-CONTROL SECTION.
           ROW BUFFER TBLLAY-XW4 IS YES.
      * Negative Tests
       DACO-CONTROL SECTION.
           ROW BUFFER UNKVAR-XW4 IS YES.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-AREA. 
          03 AREA-XW4. 
            05 TBLLAY-XW4         PIC X(4)    VALUE SPACE.
       PROCEDURE DIVISION. 
           DISPLAY TBLLAY-XW4. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoControlSection.java