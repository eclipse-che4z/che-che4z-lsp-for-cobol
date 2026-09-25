        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_NAME PIC X(8).
        01 WK_MSG PIC X(8).
        01 WK_BYTE PIC X(1).
        01 WK_LENGTH PIC S9(8).
        PROCEDURE DIVISION.
           MOVE 'TESTUSER' TO WK_NAME.
           SEND MESSAGE TO USER ID WK_NAME FROM WK_MSG TO WK_BYTE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsSendStatement.java
