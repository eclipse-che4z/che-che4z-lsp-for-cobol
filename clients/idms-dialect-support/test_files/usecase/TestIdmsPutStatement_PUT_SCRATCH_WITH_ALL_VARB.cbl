        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_ID PIC X(8).
        01 WK_AID PIC X(8).
        01 WK_RID PIC X(8).
        01 WK_AREA1 PIC X(8).
        01 WK_AREA2 PIC X(8).
        01 WK_RETURN PIC S9(8) COMP.
        01 WK_LENGTH PIC S9(8) .
        01 WK_RETENTION PIC S9(8) .
        PROCEDURE DIVISION. 
           MOVE 'SCRATCH' TO WK_AID.
           MOVE '1000' TO WK_RID.
           PUT SCRATCH AREA ID WK_AID FROM WK_AREA1 TO WK_AREA2
             RECORD ID WK_RID REPLACE RETURN RECORD ID INTO WK_RETURN.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsPutStatement.java
