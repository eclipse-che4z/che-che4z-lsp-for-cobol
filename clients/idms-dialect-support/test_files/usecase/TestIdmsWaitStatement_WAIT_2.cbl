        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK1 PIC X(8).
        01 WK_ECB1.
            02 WK_ECB1FLD1 PIC S9(8) COMP SYNC.
            02 WK_ECB1FLD2 PIC S9(8) COMP SYNC.
            02 WK_ECB1FLD3 PIC S9(8) COMP SYNC.
        01 WK_ECB2.
            02 WK_ECB2FLD1 PIC S9(8) COMP SYNC.
            02 WK_ECB2FLD2 PIC S9(8) COMP SYNC.
            02 WK_ECB2FLD3 PIC S9(8) COMP SYNC.
        PROCEDURE DIVISION. 
           MOVE 'TESTID' TO WK1.
           WAIT EVENT NAME WK1.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsWaitStatement.java
