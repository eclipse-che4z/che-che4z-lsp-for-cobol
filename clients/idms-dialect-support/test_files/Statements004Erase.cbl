       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-ERASE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPLOYEE PIC X.
       PROCEDURE DIVISION.
           ERASE EMPLOYEE
               ON ANY-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsEraseStatement.java
