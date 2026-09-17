       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PROG1.
       ENVIRONMENT  DIVISION.
       IDMS-CONTROL SECTION.
       PROTOCOL.    MODE IS IDMS-DC-NONAUTO DEBUG
                    IDMS-RECORDS MANUAL.
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01  VAR1.
             03 VAR3                      VALUE
           ' SOME TEXT SOME TEXT SOME TEXT SOME TEXT SOME TEXT SOME TEXT
      -    'SOME TEXT SOME TEXT'.
               05 VAR5           PIC X(2)    OCCURS 42.
       01  COPY IDMS COPY019.
       PROCEDURE DIVISION.
           DISPLAY NOT_EXISTING.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */8f42f475c3824e9eaf1fdd0ecd5b133aada8c304/server/dialect-idms/src/test
      */java/org/eclipse/lsp/cobol/dialects/idms/usecases
      */TestIdmsCopyAfterConcat.java