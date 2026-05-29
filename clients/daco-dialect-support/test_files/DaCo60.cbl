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
             05 DSAPRO-XL2. 
               07 FILLER               PIC X(5)    VALUE 10. 
       PROCEDURE DIVISION. 
           STRING MATCH DSAPRO-XL1 DSAPRO-XL1. 
           STRING MATCH 'SFDFDFDSFF' 'SDFSDSFWE'. 
           STRING MATCH DSAPRO-XL1 DSAPRO-XL1 DSAPRO-XL2. 
           STRING MATCH 'SFDFDFDSFF' 'SDFSDSFWE' 10.
      * Negative Tests     
           STRING MATCH GBR4 DSAPRO-XL1. 
           STRING MATCH DSAPRO-XL1 GBR4. 
           STRING MATCH DSAPRO-XL1 DSAPRO-XL1 GBR4. 
           STRING MATCH DSAPRO-XL1 DSAPRO-XL1 256. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoStringMatchStatement.java