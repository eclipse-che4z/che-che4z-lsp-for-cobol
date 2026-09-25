       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIMER-BRANCHES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-EVENT PIC X(8).
       01 WS-TIMER PIC X(8).
       01 WS-AREA PIC X(80).
       PROCEDURE DIVISION.
           SET TIMER POST INTERVAL 10 EVENT WS-EVENT
               TIMER ID WS-TIMER.
           SET TIMER START INTERVAL 10 TASK CODE 'TSTTASK'
               TIMER ID WS-TIMER DATA FROM WS-AREA LENGTH 10.
           WAIT LONG EVENT WS-EVENT EVENT WS-TIMER.
           WAIT REDISPATCH EVENT WS-EVENT EVENT WS-TIMER.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecases:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsSetStatement.java
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsWaitStatement.java
