       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-BIND-PROC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ABCPROC PIC X.
       01 WS-A PIC X(80).
       PROCEDURE DIVISION.
           BIND PROCEDURE FOR ABCPROC TO WS-A
               ON ANY-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsBindStatement.java
