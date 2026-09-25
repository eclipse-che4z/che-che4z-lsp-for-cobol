       IDENTIFICATION DIVISION.
       PROGRAM-ID. MIXED-COPYBOOKS.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY IDMS CBOOK.
       COPY CBOOK.
       PROCEDURE DIVISION.
           DISPLAY PROGRAM-STATUS.
           DISPLAY PROGRAM-NAME.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecases:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestMixedCopybookNavigation.java
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsControlSectionAll.java
