       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-SNAP.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC X(80).
       PROCEDURE DIVISION.
           SNAP ALL FROM WS-A LENGTH 1
               ON ANY-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsSnapStatement.java
