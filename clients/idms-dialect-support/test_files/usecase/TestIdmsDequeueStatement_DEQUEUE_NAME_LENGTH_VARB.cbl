        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK-NAME PIC X(8).
        01 WK-LENGTH PIC S9(8).
        PROCEDURE DIVISION. 
           MOVE 'TEST' TO WK-NAME.
            MOVE 8 TO WK-LENGTH.
             DEQUEUE NAME WK-NAME LENGTH WK-LENGTH.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsDequeueStatement.java
