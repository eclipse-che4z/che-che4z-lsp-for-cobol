        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_TASK PIC X(388) SYNC.
        01 WK_PROGRAM PIC X(8) SYNC.
        01 WK_TIME PIC S9(4) COMP SYNC.
        PROCEDURE DIVISION. 
           MOVE 'TEST' TO WK_TASK.
            MOVE 'TESTPROG' TO WK_PROGRAM.
            DC RETURN NEXT TASK CODE WK_TASK NORMAL
           TIMEOUT INTERVAL 10
           NEXT TASK INTERVAL 10 EVENT TYPE INTERNAL EVENT
           NAME 'TSTEVENT'.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsDcStatement.java
