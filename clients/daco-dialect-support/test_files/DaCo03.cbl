       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COPY MAID DACO03 ABC.
       PROCEDURE DIVISION.
           DISPLAY BHTRGL2.
           DISPLAY NOT_EXISTING.
      * server/dialect-daco/src/test/java/org/eclipse/lsp/cobol/dialects/daco/us
      *ecases/TestCopyMaidWithQualifierHasCorrectDefinition.java
           