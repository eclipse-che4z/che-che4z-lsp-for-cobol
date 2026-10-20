       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-ACCEPT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC X(80).
       01 EMPLOYEE PIC X.
       PROCEDURE DIVISION.
           ACCEPT WS-A FOR EMPLOYEE
               ON DB-REC-NOT-FOUND CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsAcceptDbStatements.java
