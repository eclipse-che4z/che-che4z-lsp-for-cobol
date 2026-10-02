000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID.    RAOMQP1M.                                           
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
000400 DATA   DIVISION.
000500 WORKING-STORAGE SECTION.
000550 01  SUBSCHEMA-CTRL.
000560    03  FILLER PIC X(12)   VALUE SPACE.
000570 01  LDSHTI1M-XKB.
000580    03  FILLER PIC X(12)   VALUE SPACE.
000600 PROCEDURE DIVISION.
000700 S794-000.
000800 D-B    EXEC 'BSSHTB1M'          USING SUBSCHEMA-CTRL             
000900 D-C    EXEC 'CSSHTI1M'          USING SUBSCHEMA-CTRL             
001000                                       LDSHTI1M-XKB
           DISPLAY NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoExecStatement.java