      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsInquireMapStatement.java
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDITIONS-003.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPMAP PIC X.
       PROCEDURE DIVISION.
           INQUIRE MAP EMPMAP IF INPUT CHANGED
               THEN DISPLAY 'CHANGED'
           END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
