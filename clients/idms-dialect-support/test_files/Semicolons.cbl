       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEMICOLON-TEST.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL.
       DATA DIVISION.
       MAP SECTION.
           MAP MC.
       WORKING-STORAGE SECTION.
       01 CARRIAGE-CONTROL PIC 9.
       01 LINE-SPACING PIC 9.
       01 REPORT-TITLE PIC X(100).
       01 PROGRAM-WORK-FIELDS.
          88 NEW-PAGE VALUE 30.
          02 PAGE-COUNT PIC 9(3).
          02 ITENUM PIC X(7).
       PROCEDURE DIVISION.
           PERFORM WRITE-REPORT-LINE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
       WRITE-REPORT-LINE.
           IF NEW-PAGE
              PERFORM WRITE-HEADER;
              MOVE 2 TO LINE-SPACING.
           MOVE LINE-SPACING TO CARRIAGE-CONTROL.
       WRITE-HEADER.
           MOVE LINE-SPACING TO CARRIAGE-CONTROL;
           ADD 1 TO PAGE-COUNT;
           MOVE 'TITLE' TO REPORT-TITLE.
           IF NEW-PAGE
              MODIFY MAP MC FOR DFLD ITENUM EDIT ERROR
              CALL 'spacing' USING LINE-SPACING;
              MOVE '  ' TO LINE-SPACING
           END-IF.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestStatementTerminationWithSemicolons.java
