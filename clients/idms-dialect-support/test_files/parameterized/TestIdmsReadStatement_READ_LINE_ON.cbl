        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 WK_1 PIC X(80).
        01 WK_2 PIC X(80).
        01 WK_POSITION PIC S9(4) COMP SYNC.
        01 WK_LENGTH PIC S9(8) COMP SYNC.
        01 ERROR-STATUS PIC X(4) VALUE '1400'.
           88 ANY-ERROR-STATUS VALUE '0001' THRU '9999'.
        PROCEDURE DIVISION. 
            READ LINE TERMINAL INTO WK_1 MAX LENGTH 30
             ON ANY-ERROR-STATUS DISPLAY 'READ ERROR'.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsReadStatement.java
