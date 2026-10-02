       IDENTIFICATION DIVISION.
       PROGRAM-ID. test1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           WRITE REPORT ENDRPT.
           WRITE REPORT TGD11 ENDRPT.
           WRITE REPORT RGD11 ENDRPT.
      * Negative tests
           WRITE REPORT R-CA ENDRPT.
           WRITE REPORT R-CAS ENDRPT.
           WRITE REPORT RFDRGR ENDRPT.
           WRITE REPORT STDFE ENDRPT. 
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoEndWriteReport.java