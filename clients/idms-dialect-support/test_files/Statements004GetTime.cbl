       IDENTIFICATION DIVISION.
       PROGRAM-ID. STMT-GET-TIME.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-LENGTH PIC 9(4) COMP.
       PROCEDURE DIVISION.
           GET TIME INTO WS-LENGTH COMP
               ON ANY-STATUS CONTINUE END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsGetStatement.java
