       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ABC.
           05 COPY MAID DACO05-ABC WRK.
       PROCEDURE DIVISION.
           DISPLAY BHTRGL-XBC.
           DISPLAY CHILDBC.
           DISPLAY BHT-XBC.
           DISPLAY BHT-3BC.
           DISPLAY BBC.
           DISPLAY BHTRGL-XABC.
           DISPLAY NOT_EXISTING.
      *server/dialect-daco/src/test/java/org/eclipse/lsp/cobol/dialects/daco
      */usecases/TestCopyMaidWithWrkAppendsSuffixToVariablesWithoutDash.java
      