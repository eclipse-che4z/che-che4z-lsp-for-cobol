       IDENTIFICATION DIVISION.
       PROGRAM-ID. COPY-VARIABLES.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MRB.
          03 COPY IDMS CV-PARENT.
       01 COPY IDMS CV-CHAIN.
       PROCEDURE DIVISION.
           OBTAIN NEXT MRB WITHIN PROGRAM-NAME.
           DISPLAY VAR2.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestCopyIdmsVariables.java
