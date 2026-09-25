        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MFLD PIC X(8).
       01 EMPMAP PIC X(8).
       PROCEDURE DIVISION.
           MAP OUTIN USING EMPMAP OUTPUT LITERALS
              INPUT DATA YES MESSAGE IS MFLD LENGTH 10.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsMapOutInStatement.java
