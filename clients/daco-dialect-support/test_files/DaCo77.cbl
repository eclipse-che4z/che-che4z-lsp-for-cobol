       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGNAME.
       ENVIRONMENT  DIVISION.
       IDMS-CONTROL SECTION.
       PROTOCOL. MODE BATCH DEBUG IDMS-RECORDS MANUAL.
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01  A-SYY.
           03 AA-SYY PIC X(4).
       01  B PIC X(72)   VALUE                  
           '-
      -    '-'.
       01  A-SXX COPY-FROM YY.
       PROCEDURE DIVISION.
           DISPLAY A-SXX.
           DISPLAY NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases/TestDaCoCopyFrom4.java