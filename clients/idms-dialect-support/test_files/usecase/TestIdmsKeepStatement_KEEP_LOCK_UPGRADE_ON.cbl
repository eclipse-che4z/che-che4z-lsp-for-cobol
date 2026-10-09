        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_ID PIC X(8).
        01 WK_LOC PIC S9(8) COMP.
        01 EMPLOYEE PIC S9(8) COMP.
        01 DEPT-EMP PIC S9(8) COMP.
        PROCEDURE DIVISION.
           MOVE 'TSTID' TO WK_ID.
           KEEP LONGTERM WK_ID UPGRADE EXCLUSIVE RETURN NOTIFICATION
           INTO WK_LOC
           ON ANY-STATUS GOBACK END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsKeepStatement.java
