       IDENTIFICATION DIVISION.
       PROGRAM-ID. test1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           READ TRANSACTION PIBV.
           READ TRANSACTION OSD2.
           READ TRANSACTION 3167.
           READ TRANSACTION.
      * Negative tests
           READ TRANSACTION R-DS.
           READ TRANSACTION RD.
           READ TRANSACTION RDERW.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoReadTransaction.java