       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PARENT-XLO.
           05 COPY MAID DACO08-XBG WRK.
       PROCEDURE DIVISION.
           DISPLAY F91-XLO.
           DISPLAY NOT_EXISTING.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol
      */blob/40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server
      */dialect-daco/src/test/java/org/eclipse/lsp/cobol/dialects/daco
      */usecases/TestCopyMaidWithWrkRedefines.java