       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST1.
       ENVIRONMENT  DIVISION.
       IDMS-CONTROL SECTION.
       PROTOCOL.    MODE IS IDMS-DC-NONAUTO DEBUG
                    IDMS-RECORDS MANUAL.
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01  ROOT.
            05 VAR                         VALUE
           'RQS50  CV=01                                      ¦ M A I D
      -    '      entity-report'.
               07 FILLER               PIC X(10).
       PROCEDURE DIVISION.
           WRITE REPORT TABCD FROM VAR LENGTH 79 AFTER PAGE.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e765*4f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases/TestDaCoMapping.java