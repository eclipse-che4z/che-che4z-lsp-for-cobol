       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PARENT.
           03 AREA-XW7.
             05 FILLER PIC X(8) VALUE 'AREA-XW8'.
             05 TABMAX-PW7 PIC S9(4) VALUE ZERO COMP-3.
             05 BHTTAB-XW7.
               07 BHTREG-XW8 OCCURS 50.
                 09 COPY MAID DACO04-XBG WRK.
       PROCEDURE DIVISION.
           DISPLAY BHTRGL-XW8 OF BHTTAB-XW7.
           DISPLAY NOT_EXISTING.
      * server/dialect-daco/src/test/java/org/eclipse/lsp/cobol/dialects/daco/us
      *ecases/TestCopyMaidWithWRK.java
           