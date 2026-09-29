       IDENTIFICATION DIVISION.
       PROGRAM-ID. GET-DELETE-TEST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AREA1 PIC X(80).
       01 WS-AREA2 PIC X(80).
       01 WS-LENGTH PIC S9(8).
       01 WS-ID PIC X(8).
       PROCEDURE DIVISION.
           GET QUEUE INTO WS-AREA1 TO WS-AREA2.
           GET SCRATCH AREA ID WS-ID RECORD ID WS-ID
               INTO WS-AREA1 MAX LENGTH WS-LENGTH
               RETURN LENGTH INTO WS-AREA2.
           GET STORAGE FOR WS-AREA1 TO WS-AREA2
               LENGTH WS-LENGTH WAIT KEEP LONG SHARED
               STGID '123' VALUE IS HIGH-VALUE
               LOCATION IS ANY.
           DELETE TABLE FROM WS-AREA1.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecases:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsGetStatement.java
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestDelete.java
