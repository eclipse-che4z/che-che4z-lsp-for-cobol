        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_ECB.
        02 WK_ECB1 PIC S9(8).
        02 WK_ECB2 PIC S9(8).
        02 WK_ECB3 PIC S9(8).
        01 WK_ECBID PIC X(8).
        PROCEDURE DIVISION. 
           MOVE 'ECBID' TO WK_ECBID.
           POST EVENT NAME WK_ECBID CLEAR.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsPostStatement.java
