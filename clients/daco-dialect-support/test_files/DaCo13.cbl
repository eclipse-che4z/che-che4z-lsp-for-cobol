       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
       DATA   DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE ABC.
            IDMS-RECORDS MANUAL
       WORKING-STORAGE SECTION.
       01 A PIC X.
       01 MISMAP PIC X.
       PROCEDURE DIVISION.
           MODIFY MAP MISMAP
               FOR DFLD A ON RCU EDIT ERROR;
           SHOW ERROR 010
           CONTINUE.
           DISPLAY NOT_EXISTING.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */20ef22ea2abb78a799818bb6cd95685bdbec721c/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestOnRcuRangeException.java