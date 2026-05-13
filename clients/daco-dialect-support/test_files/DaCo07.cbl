       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PARENT-XLD.
           05 CHILD-XLD PIC X(2).
               88 AB VALUE "AB".
           05 COPY MAID DACO07-XBG WRK.
       PROCEDURE DIVISION.
           DISPLAY BHTRGL-XLD.
           DISPLAY NOT_EXISTING.
      *server/dialect-daco/src/test/java/org/eclipse/lsp/cobol/dialects/daco/
      *usecases/TestCopyMaidWithWrkDoesNotTakeNameFrom88.java