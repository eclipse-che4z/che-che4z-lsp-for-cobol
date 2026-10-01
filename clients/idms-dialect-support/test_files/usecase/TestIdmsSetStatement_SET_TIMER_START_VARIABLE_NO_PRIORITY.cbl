        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_PROG PIC X(8).
        01 WK_INT PIC S9(8).
        01 WK_EVENT PIC S9(8) COMP SYNC.
        01 WK_TIMER PIC S9(8) COMP SYNC.
        01 WK_AREA1 PIC X(8).
        01 WK_TASK PIC X(8).
        01 WK_LENGTH PIC X(8).
        01 ERROR-STATUS PIC X(4) VALUE '1400'.
           88 ANY-ERROR-STATUS VALUE '0001' THRU '9999'.
        PROCEDURE DIVISION.
           MOVE 10 TO WK_INT.
           MOVE 8 TO WK_LENGTH.
           MOVE 'TSTTAKE' TO WK_TASK.
           SET TIMER START INTERVAL WK_INT TASK CODE WK_TASK
           TIMER ID WK_TIMER DATA FROM WK_AREA1 LENGTH 10.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsSetStatement.java
