       IDENTIFICATION DIVISION.
       PROGRAM-ID. IDMS-LENGTH-116.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL.
           SUBSCHEMA-NAMES LENGTH 116
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Extends the invalid-length case in the Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsControlSectionAll.java
