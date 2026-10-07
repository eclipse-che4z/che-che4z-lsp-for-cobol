      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsIfStatement.java
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDITIONS-002.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 IX-EMP PIC X.
       01 MT-FLAG PIC X.
       PROCEDURE DIVISION.
           IF IX-EMP EMPTY AND MT-FLAG = 'Y'
               DISPLAY 'X'
           END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
