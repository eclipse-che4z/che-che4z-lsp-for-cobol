       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-CHECK-TERM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC X(80).
       01 WS-LENGTH PIC 9(4) COMP.
       PROCEDURE DIVISION.
           CHECK TERMINAL GET STORAGE INTO WS-A MAX LENGTH 80
               RETURN LENGTH INTO WS-LENGTH
               ON ANY-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestCheckTerminal.java
