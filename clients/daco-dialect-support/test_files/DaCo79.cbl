       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CPYFROM.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
            PROTOCOL. MODE ABC.
            IDMS-RECORDS MANUAL
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01  ROOT.
           03 AREA-XXX COPY-FROM DY.
       01  COPY MAID PROTOCC.
       PROCEDURE DIVISION.
           DISPLAY PR1-XXX.
           DISPLAY NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */3fe90031bbf19146ec805e3ffdd94e8bde1b970f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases/TestDaCoCopyFrom6.java