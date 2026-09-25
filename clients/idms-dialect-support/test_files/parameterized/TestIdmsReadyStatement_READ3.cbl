        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS BATCH-AUTOSTATUS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DB1 PIC X(8).
       01 DC1 PIC X(8).
       01 EMP-AREA PIC X(8).
       01 EMP-AREA-TOO-LONG PIC X(8).
       PROCEDURE DIVISION.
           BIND RUN-UNIT.
           READY EMP-AREA USAGE-MODE UPDATE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsReadyStatement.java
