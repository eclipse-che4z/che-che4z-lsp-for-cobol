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
           DEBUG DSAPRO-XL1 LENGTH 2. 
           DEBUG DSAPRO-XL1 LENGTH DSAPRO-XL1. 
           DEBUG DSAPRO-XL1 LENGTH DSAPRO-XL1 COLS 10. 
           DEBUG DSAPRO-XL1 LENGTH DSAPRO-XL1 COLS 10 TABLE 20. 
           DEBUG DSAPRO-XL1 LENGTH DSAPRO-XL1 COLS 10 TABLE 20 NO-POS. 
           DEBUG DSAPRO-XL1 LENGTH DSAPRO-XL1 COLS 10 TABLE 20 NO-POS 
           HEX. 
           DEBUG DSAPRO-XL1 LENGTH DSAPRO-XL1 COLS 10 TABLE 20 NO-POS 
           DISPLAY. 
           DEBUG DSAPRO-XL1 LENGTH DSAPRO-XL1 COLS 10 TABLE 20 NO-POS 
           BOTH.
      * Negative Tests     
           DEBUG GBR4 LENGTH 2. 
           DEBUG DSAPRO-XL1 LENGTH GBR4. 
           DEBUG DSAPRO-XL1 LENGTH DSAPRO-XL1 COLS 10 TABLE GBR4.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoDebugFieldStatement.java
