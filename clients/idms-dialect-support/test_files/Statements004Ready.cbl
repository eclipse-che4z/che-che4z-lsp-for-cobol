       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-READY.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 AREA-A PIC X.
       PROCEDURE DIVISION.
           READY AREA-A USAGE-MODE IS RETRIEVAL
               ON ANY-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsReadyStatement.java
