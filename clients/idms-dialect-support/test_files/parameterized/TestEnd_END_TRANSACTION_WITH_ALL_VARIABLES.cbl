        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_INTO PIC X(8) SYNC.
        01 WK_LENGTH PIC X(8) SYNC.
        PROCEDURE DIVISION. 
           MOVE 388 TO WK_LENGTH.
           END TRANSACTION STATISTICS WRITE INTO WK_INTO LENGTH
           WK_LENGTH.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestEnd.java
