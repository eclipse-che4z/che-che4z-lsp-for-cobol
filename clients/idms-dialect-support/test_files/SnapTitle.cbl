       IDENTIFICATION DIVISION.
       PROGRAM-ID. SNAP-TITLE-TEST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WK_TITLE.
          05 WK1 PIC X.
          05 WK2 PIC X.
          05 WK3 PIC X.
          05 WK4 PIC X.
       PROCEDURE DIVISION.
           SNAP TITLE IS WK_TITLE SYSTEM FROM WK1 TO WK2
               FROM WK3 TO WK4.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestSnapTitle.java
