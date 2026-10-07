        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
       ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
             SELECT SCRATCH ASSIGN TO TEST2 
             ORGANIZATION IS LINE SEQUENTIAL 
             ACCESS MODE IS SEQUENTIAL. 
        DATA DIVISION. 
        FILE SECTION.
        FD  SCRATCH 
           LABEL RECORDS ARE STANDARD. 
        WORKING-STORAGE SECTION. 
        01 WK_QUEUEID PIC X(8) SYNC.
        01 WK_AREAID PIC X(8) SYNC.
        01 WK_RECORDID_1 PIC X(8) SYNC.
        01 WK_RECORDID_2 PIC X(8) SYNC.
        01 WK1 PIC X(8).
        01 WK2 PIC X(8).
        01 WK3 PIC X(8).
        01 WK4 PIC X(8).
        01 ERROR-STATUS PIC X(4) VALUE '1400'.
           88 ANY-ERROR-STATUS VALUE '0001' THRU '9999'.
        PROCEDURE DIVISION. 
           DELETE SCRATCH AREA ID 'TEST'.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestDelete.java
