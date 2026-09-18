       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-CONNECT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPLOYEE PIC X.
       01 EMP-SET PIC X.
       PROCEDURE DIVISION.
           CONNECT EMPLOYEE TO EMP-SET
               ON DB-REC-NOT-FOUND CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsConDisconnectStatement.java
