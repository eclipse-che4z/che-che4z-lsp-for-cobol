       IDENTIFICATION DIVISION.
       PROGRAM-ID. IDMS-LEVEL-88.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MRB.
          03 COPY IDMS LV88-COPY.
       PROCEDURE DIVISION.
           OBTAIN NEXT MRB WITHIN VAR3.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases
      */TestCopyIdmsVariablesForNotAllowedLevels.java
