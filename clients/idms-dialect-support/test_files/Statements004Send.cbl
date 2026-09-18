       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-SEND.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC X(80).
       01 WS-B PIC X(80).
       PROCEDURE DIVISION.
           SEND MESSAGE TO USER ID WS-A FROM WS-B LENGTH 1
               ON ANY-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsSendStatement.java
