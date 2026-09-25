       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONTROL-INCREMENT.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. SUBSCHEMA-NAMES LENGTH IS 16
           IDMS-RECORDS WITHIN WORKING-STORAGE
               LEVELS INCREMENTED 18.
       DATA DIVISION.
       SCHEMA SECTION.
           DB EMPSS01 WITHIN ENPSCHM VERSION 1234.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           DISPLAY EMPLOYEE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsControlSectionAll.java
