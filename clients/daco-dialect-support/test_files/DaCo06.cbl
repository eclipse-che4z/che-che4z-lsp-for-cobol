       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PARENT-XNT.
           05 COPY MAID DACO06-XBG WRK.
       PROCEDURE DIVISION.
           DISPLAY BHTRGL-XNT.
           DISPLAY NOT_EXISTING.
      *server/dialect-daco/src/test/java/org/eclipse/lsp/cobol/dialects/daco
      */usecases/TestCopyMaidWithWrkDifferentCase.java