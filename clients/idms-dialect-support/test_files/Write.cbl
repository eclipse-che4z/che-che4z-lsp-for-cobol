       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITE-BRANCHES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC X(80).
       01 WS-B PIC X(80).
       01 WS-C PIC X(80).
       01 WS-LENGTH PIC 9(4).
       01 WS-HEADER PIC X(8).
       01 WS-MESSAGE PIC 9(7).
       01 WS-REPLY PIC X(80).
       PROCEDURE DIVISION.
           WRITE LINE TO TERMINAL WAIT NEWPAGE NOBACKPAGE
               FROM WS-A TO WS-B HEADER WS-HEADER.
           WRITE LOG MESSAGE ID WS-MESSAGE REPLY INTO
               WS-REPLY MAX LENGTH WS-LENGTH
               TEXT INTO WS-C TO WS-A TEXT ONLY.
           WRITE PRINTER NEWPAGE ENDRPT NATIVE
               FROM WS-A LENGTH WS-LENGTH
               COPIES 3 REPORT ID 34 DESTINATION 'TSTDEST'
               ALL HOLD KEEP.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsWriteClause.java
