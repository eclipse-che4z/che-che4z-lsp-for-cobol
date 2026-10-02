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
            05 TBLPRO-XL1. 
              07 FILLER               PIC X(5)    VALUE 'REMBD'. 
            05 TBFPRO-XL1. 
              07 FILLER               PIC X(5)    VALUE 'REMBD'. 
            05 DSAPRO-XL1. 
              07 FILLER               PIC X(5)    VALUE 'REMBD'. 
       PROCEDURE DIVISION. 
           ROW SAVE TBLPRO-XL1 IN 2. 
           ROW SAVE TBLPRO-XL1 IN 'ABC'. 
           ROW SAVE TBLPRO-XL1 IN DSAPRO-XL1.
      * Negative tests
           ROW SAVE DSAPRO-XL1 IN 2. 
           ROW SAVE GBR4 IN 2. 
           ROW SAVE TBLPRO-XL1 IN GBR4. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoTableRowSaveStatement.java