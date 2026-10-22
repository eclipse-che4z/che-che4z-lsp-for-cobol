       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-MAP-IN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPMAP PIC X.
       PROCEDURE DIVISION.
           MAP IN USING EMPMAP IO INPUT DATA YES
               ON ANY-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsMapInStatement.java
