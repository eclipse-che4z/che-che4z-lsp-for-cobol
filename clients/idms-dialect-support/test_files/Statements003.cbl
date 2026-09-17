      * Java usecases:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/tree
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases
      * TestIdmsReadyAfterIfNotProducesError,
      * TestDialectMultilineInsideIf, TestEndIfAndDot,
      * TestAbendCode, TestObtainAnyAfterMoveParsedCorrectly.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STATEMENTS-003.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-FLAG PIC 9 VALUE 1.
       01 WS-ABEND-CODE PIC X(4) VALUE '1234'.
       01 WS-A PIC X.
       PROCEDURE DIVISION.
           BIND RUN-UNIT.
           READY AREA-A USAGE-MODE IS RETRIEVAL
           READY AREA-B USAGE-MODE IS RETRIEVAL
           IF WS-FLAG = 1
               READY AREA-C USAGE-MODE IS UPDATE
               READY AREA-D USAGE-MODE IS UPDATE
           ELSE
               READY AREA-C USAGE-MODE IS RETRIEVAL
               READY AREA-D USAGE-MODE IS RETRIEVAL
           END-IF
           DISPLAY WS-A.
           IF WS-FLAG = 1
               MODIFY MAP EMPMAP
                   FOR DFLD WS-A ATTRIBUTES BRIGHT
           END-IF.
           IF WS-FLAG = 1
               ADD 1 TO WS-FLAG
           END-IF
           ABEND CODE WS-ABEND-CODE.
           MOVE 'A' TO WS-A
           OBTAIN ANY EMPLOYEE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
