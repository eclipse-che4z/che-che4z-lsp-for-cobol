       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAP-DEFINITION-TWO.
       DATA DIVISION.
       MAP SECTION.
       MAX FIELD LIST IS 12
       MAP MAP1 TYPE IS EXTENDED PAGING.
       MAP MAP2
       MAP MAP3 TYPE STANDARD.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           MAP IN USING MAP1.
           MODIFY MAP MAP2.
           DISPLAY MAP3.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsSections.java
