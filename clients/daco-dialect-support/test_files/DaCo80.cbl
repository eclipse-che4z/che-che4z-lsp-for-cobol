       IDENTIFICATION DIVISION.
       PROGRAM-ID. CPFROM.
       ENVIRONMENT  DIVISION.
       IDMS-CONTROL SECTION.
       PROTOCOL. MODE IS BATCH DEBUG
                    IDMS-RECORDS MANUAL.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ROOT.
           03 TBLCRI-XW5 COPY-FROM W4.
           03 TBLCRI-XW4.
              04 RUSCRI-BW4 PIC S9(2) VALUE ZERO COMP.
       PROCEDURE DIVISION.
           MOVE ZERO TO RUSCRI-BW5.
           DISPLAY NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */ec60b8b1d88da1ebf8a3fca8cc2efd68a572441b/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoCopyFromDuplicateVariablesIssue.java