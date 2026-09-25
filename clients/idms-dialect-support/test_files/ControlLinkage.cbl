       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONTROL-LINKAGE.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS WITHIN LINKAGE,
           SUBSCHEMA-NAMES LENGTH 18;
       DATA DIVISION.
       SCHEMA SECTION.
           DB EMPSS01 WITHIN ENPSCHM VERSION 1234.
       LINKAGE SECTION.
       PROCEDURE DIVISION.
           DISPLAY EMPLOYEE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsControlSectionAll.java
