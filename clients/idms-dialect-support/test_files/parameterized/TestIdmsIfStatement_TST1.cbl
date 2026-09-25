        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MT-FLAG PIC X.
       01 IX-EMP PIC X.
        PROCEDURE DIVISION.
           IF NOT IX-EMP MEMBER DISPLAY 'X' ELSE DISPLAY 'Y' END-IF  .
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsIfStatement.java
