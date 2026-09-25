       IDENTIFICATION DIVISION.
       PROGRAM-ID. MISSING-SUBSCHEMA.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE IS BATCH DEBUG
           IDMS-RECORDS MANUAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COPY IDMS SUBSCHEMA-NAMES.
       PROCEDURE DIVISION.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsMissedCopybook.java
