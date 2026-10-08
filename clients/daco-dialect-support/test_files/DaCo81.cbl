       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNDEFVARS.
       ENVIRONMENT  DIVISION.
       IDMS-CONTROL SECTION.
       PROTOCOL.    MODE IS BATCH           DEBUG
                    IDMS-RECORDS            MANUAL.
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01  ROOT.
           02 TBLCRI-XW4.
            11 RUSCRI-BW4 PIC S9(2) VALUE ZERO COMP.
            11 ROWCRI-XW4 OCCURS 2.
              13 COPY MAID POLCRI WRK.
           02 TBLCRI-XW5  COPY-FROM W4.
       PROCEDURE DIVISION.
           DISPLAY POLCRI-XW5.
           DISPLAY NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoCopyFromUndefineVariablesIssue.java 