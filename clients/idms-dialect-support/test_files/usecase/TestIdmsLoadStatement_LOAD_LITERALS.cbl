        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_TABLE PIC X(8).
        01 WK_NODE PIC X(8).
        01 WK_NAME PIC X(8).
        01 WK_LOAD PIC X(8).
        01 WK_1 PIC X(8).
        01 WK_2 PIC X(1).
        PROCEDURE DIVISION.
           LOAD TABLE 'TSTTABL' INTO WK_1 TO WK_2 DICTNODE 
           'TSTDICT' DICTNAME 'TSTDICT' LOADLIB 'TSTLOAD' NOWAIT.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsLoadStatement.java
