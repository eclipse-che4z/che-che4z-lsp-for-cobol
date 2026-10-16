      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsInquireMapStatement.java
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDITIONS-004.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPMAP PIC X.
       01 MAP1.
          02 MFLD2 PIC X.
       PROCEDURE DIVISION.
           INQUIRE MAP EMPMAP
               IF CURSOR AT DFLD MFLD2 OF MAP1
               THEN DISPLAY 'CURSOR'
           END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
