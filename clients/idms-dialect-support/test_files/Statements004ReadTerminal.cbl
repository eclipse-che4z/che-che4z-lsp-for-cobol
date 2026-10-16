       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-READ-TERM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC X(80).
       PROCEDURE DIVISION.
           READ TERMINAL WAIT INTO WS-A MAX LENGTH 80
               ON ANY-ERROR-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsReadStatement.java
