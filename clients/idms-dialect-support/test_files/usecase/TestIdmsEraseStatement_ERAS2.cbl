        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS BATCH-AUTOSTATUS.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 EMPLOYEE PIC X(8).
        PROCEDURE DIVISION.
           ERASE EMPLOYEE ALL MEMBERS.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsEraseStatement.java
