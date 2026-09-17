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
           ROW GET TBLPRO-XL1. 
           ROW GET TBFPRO-XL1. 
           ROW GET TBLPRO-XL1 ON 2. 
           ROW GET TBFPRO-XL1 ON 2. 
           ROW GET TBLPRO-XL1 ON 'ABC'. 
           ROW GET TBFPRO-XL1 ON 'ABC'. 
           ROW GET TBLPRO-XL1 ON DSAPRO-XL1. 
           ROW GET TBFPRO-XL1 ON DSAPRO-XL1. 
           ROW GET TBLPRO-XL1 ON DSAPRO-XL1 TO DSAPRO-XL1. 
           ROW GET TBFPRO-XL1 ON DSAPRO-XL1 TO DSAPRO-XL1. 
           ROW GET TBLPRO-XL1 TO DSAPRO-XL1. 
           ROW GET TBFPRO-XL1 TO DSAPRO-XL1. 
      * Negative tests
           ROW GET DSAPRO-XL1.
           ROW GET GBR4. 
           ROW GET TBLPRO-XL1 ON GBR4. 
           ROW GET TBLPRO-XL1 ON DSAPRO-XL1 TO GBR4. 
           ROW GET TBLPRO-XL1 TO GBR4. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */ec60b8b1d88da1ebf8a3fca8cc2efd68a572441b/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoTableRowGetStatement.java