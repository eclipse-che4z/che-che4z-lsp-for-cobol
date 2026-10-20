        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK1 PIC X(8).
        01 WK2 PIC X(8).
        01 WK3 PIC X(8).
        01 WK4 PIC X(8).
        01 WK5 PIC X(8).
        01 WK6 PIC X(8).
        01 WK_TITLE PIC X(134).
        01 WK_LENGTH PIC S9(8) COMP SYNC.
        PROCEDURE DIVISION. 
            MOVE '  TITLE' TO WK_TITLE.
            SNAP TITLE IS WK_TITLE SYSTEM FROM WK1 LENGTH 10
            FROM WK3 LENGTH 10.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsSnapStatement.java
