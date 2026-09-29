        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_TASKCODE PIC X(8) SYNC.
        01 WK_PRIORITY PIC S9(3) SYNC.
        PROCEDURE DIVISION. 
           MOVE 'TESTCODE' TO WK_TASKCODE.
           ATTACH TASK CODE WK_TASKCODE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestAttachTaskCode.java
