        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS BATCH-AUTOSTATUS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ERROR-STATUS PIC X(4) VALUE '1400'.
           88 DB-REC-NOT-FOUND VALUE '0326'.
       01 EMPLOYEE PIC X(8).
       01 OFFICE-EMPLOYEE PIC X(8).
       PROCEDURE DIVISION.
           DISCONNECT EMPLOYEE FROM OFFICE-EMPLOYEE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsConDisconnectStatement.java
