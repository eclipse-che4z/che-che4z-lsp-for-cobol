        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
        PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_PROGRAM PIC X(8).
        01 WK_REPLY PIC X(8).
        01 WK_TEXT PIC X(8).
        01 WK1 PIC X(8).
        01 WK2 PIC X(8).
        01 WK3 PIC X(8).
        01 WK4 PIC X(8).
        01 WK5 PIC X(8).
        01 WK6 PIC X(8).
        01 WK_MESSAGE PIC X(8).
        01 WK_HEADER PIC X(8).
        01 WK_LENGTH PIC X(8).
        01 ERROR-STATUS PIC X(4) VALUE '1400'.
           88 ANY-ERROR-STATUS VALUE '0001' THRU '9999'.
        PROCEDURE DIVISION. 
            MOVE 8 TO WK_LENGTH.
           MOVE 1 TO WK_HEADER.
           WRITE LINE TO TERMINAL WAIT NEWPAGE NOBACKPAGE
           FROM WK1 TO WK2 HEADER WK_HEADER.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsWriteClause.java
