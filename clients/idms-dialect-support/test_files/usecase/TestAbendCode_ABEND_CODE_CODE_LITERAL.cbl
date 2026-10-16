       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 ID1 PIC X(4).
       PROCEDURE DIVISION. 
           ABEND CODE '1234'.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestAbendCode.java
