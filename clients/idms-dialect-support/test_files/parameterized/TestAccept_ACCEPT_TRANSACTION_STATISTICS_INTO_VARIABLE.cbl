        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1. 
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        01 ABC PIC X(388) SYNC.
        01 LTERMID PIC X(8).
        01 TASKID PIC S9(8) COMP SYNC.
        01 SYSVERSION_WK PIC S9(4) COMP.
        01 SCREENSIZE_WK.
           05 SCREENSIZE_WK1 PIC S9(4) COMP.
           05 SCREENSIZE_WK2 PIC S9(4) COMP.
        01 STATS1 PIC S9(4) COMP.
        PROCEDURE DIVISION. 
           ACCEPT TRANSACTION STATISTICS INTO ABC.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestAccept.java
