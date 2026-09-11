       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE ABC.
            IDMS-RECORDS MANUAL
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01  ROOT PIC X.
       PROCEDURE DIVISION.
           INQUIRE MAP ROOT
           IF CURSOR AT DFLD ROOT ON RCU THEN
              CONTINUE
           END-IF
           DISPLAY NOT_EXISTING.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */20ef22ea2abb78a799818bb6cd95685bdbec721c/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases/TestDaCoRcu.java
