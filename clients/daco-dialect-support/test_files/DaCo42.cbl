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
           ROW MODIFY TBLPRO-XL1. 
           ROW MODIFY TBLPRO-XL1 ON DSAPRO-XL1. 
           ROW MODIFY TBLPRO-XL1 WITH DSAPRO-XL1. 
           ROW MODIFY TBLPRO-XL1 ON DSAPRO-XL1 WITH DSAPRO-XL1. 
           ROW MODIFY TBLPRO-XL1 ON 'ASDF' WITH DSAPRO-XL1. 
           ROW MODIFY TBFPRO-XL1 ON DSAPRO-XL1 WITH DSAPRO-XL1. 
           ROW MODIFY TBFPRO-XL1 ON 'FDERT' WITH DSAPRO-XL1. 
           ROW MODIFY TBFPRO-XL1 ON 'FDERT' WITH 'Y'.
      * Negative tests           
           ROW MODIFY DSAPRO-XL1 ON DSAPRO-XL1 WITH DSAPRO-XL1. 
           ROW MODIFY GBR4 ON DSAPRO-XL1 WITH DSAPRO-XL1. 
           ROW MODIFY TBFPRO-XL1 ON GBR4 WITH DSAPRO-XL1. 
           ROW MODIFY TBFPRO-XL1 ON DSAPRO-XL1 WITH GBR4. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */ec60b8b1d88da1ebf8a3fca8cc2efd68a572441b/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoTableRowModifyStatement.java