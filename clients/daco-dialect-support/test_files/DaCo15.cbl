       IDENTIFICATION DIVISION.
       PROGRAM-ID. test1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AREA.
          03 AREA-XW1.
            05 DET001-XW1.
              07 FILLER               PIC X(5)    VALUE 'REMBD'.
       PROCEDURE DIVISION.
           WRITE REPORT AUTO DET001-XW1.
           WRITE REPORT AUTO DET001-XW1 END DET001-XW1.
      * Negative tests
           WRITE REPORT AUTO ASD.
           WRITE REPORT AUTO ASD END ASD.
           WRITE REPORT AUTO DET001-XW1 END ASD.
           WRITE REPORT AUTO ASD END DET001-XW1.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoAutoWriteReport.java