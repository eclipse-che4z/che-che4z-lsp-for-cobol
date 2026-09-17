       IDENTIFICATION DIVISION.
       PROGRAM-ID.    BADPA61M.
       ENVIRONMENT  DIVISION.
       IDMS-CONTROL SECTION.
       PROTOCOL.    MODE IS BATCH           DEBUG
              IDMS-RECORDS            MANUAL.
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01 AREA-XW4.
           03 TBLOPT-XW4.
               07 TBLCRI-XW4.
                 09 RUSCRI-BW4       PIC S9(2)   VALUE ZERO  COMP.
                 09 ROWCRI-XW4                   OCCURS 40.
       01 AREA-XW5.
           05 TBLCRI-XW6  COPY-FROM W4.
       PROCEDURE DIVISION.
           DISPLAY NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */8f42f475c3824e9eaf1fdd0ecd5b133aada8c304/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestGroupVariables.java     