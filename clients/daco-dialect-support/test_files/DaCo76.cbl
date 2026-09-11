       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CPYFROM.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
            PROTOCOL. MODE ABC.
            IDMS-RECORDS MANUAL
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01  ROOT.
           02 AREA-XXX COPY-FROM DY.
       01  COPY MAID PROTOCB.
       PROCEDURE DIVISION.
           DISPLAY PR1-XXX.
           DISPLAY NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob\
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases/TestDaCoCopyFrom3.java