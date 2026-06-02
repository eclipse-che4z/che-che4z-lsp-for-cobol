       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  A1 PIC 9.
       PROCEDURE DIVISION.
009800 S000  SECTION.
       D-C MOVE 0 TO A1
       D-B MOVE 0 TO A1
           DISPLAY A1.
           DISPLAY NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */8f42f475c3824e9eaf1fdd0ecd5b133aada8c304/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases/TestDaCoCleanup.java