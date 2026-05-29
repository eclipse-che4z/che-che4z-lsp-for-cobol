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
            05 DSAPRO-XL1. 
              07 FILLER               PIC X(5)    VALUE 'REMBD'. 
       PROCEDURE DIVISION. 
           STRING REPLACE ALL DSAPRO-XL1 DSAPRO-XL1 BY DSAPRO-XL1. 
           STRING REPLACE DSAPRO-XL1 DSAPRO-XL1 BY DSAPRO-XL1. 
           STRING REPLACE ALL DSAPRO-XL1 'SFSDFER' BY 'FERE'. 
           STRING REPLACE DSAPRO-XL1 'DFDERE' BY 'FD'.
      * Negative Tests     
           STRING REPLACE GBR4 DSAPRO-XL1 BY DSAPRO-XL1. 
           STRING REPLACE ALL GBR4 DSAPRO-XL1 BY DSAPRO-XL1. 
           STRING REPLACE DSAPRO-XL1 GBR4 BY DSAPRO-XL1. 
           STRING REPLACE ALL DSAPRO-XL1 GBR4 BY DSAPRO-XL1. 
           STRING REPLACE DSAPRO-XL1 DSAPRO-XL1 BY GBR4. 
           STRING REPLACE ALL DSAPRO-XL1 DSAPRO-XL1 BY GBR4. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoStringReplaceStatement.java