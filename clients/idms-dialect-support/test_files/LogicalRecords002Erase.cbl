       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOGICAL-RECORDS-002.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ERASE-AREA PIC X(20).
       01 RESULT-VAR PIC X.
       PROCEDURE DIVISION.
           ERASE SOME-DATA-LR FROM ERASE-AREA
               WHERE DATA = ANOTHER-DATA
               ON LR-NOT-FOUND
               ERASE SOME-LR
                   WHERE DATA > '1'
                   AND SOME-DATA EQ 'SOME-DATA'
                   ON INVALID-DATA
                   MOVE 'X' TO RESULT-VAR
               END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsEraseLRStatement.java
