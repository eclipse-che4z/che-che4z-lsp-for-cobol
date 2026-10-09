        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ERROR-STATUS PIC X(4) VALUE '1400'.
           88 DB-STATUS-OK VALUE '0000'.
           88 ANY-STATUS VALUE ' ' THRU '9999'.
           88 ANY-ERROR-STATUS VALUE '0001' THRU '9999'.
           88 DB-END-OF-SET VALUE '0307'.
           88 DB-REC-NOT-FOUND VALUE '0326'.
       01 DB1 PIC X(8).
       01 DC1 PIC X(8).
       01 EMP-LOC PIC S9(8) COMP SYNC.
       01 DB-KEY1 PIC S9(8) COMP SYNC.
       01 employee PIC S9(8) COMP SYNC.
       01 DEPT-EMPL PIC S9(8) COMP SYNC.
       01 EMP_AREA PIC S9(8) COMP SYNC.
       01 ABC-PROC PIC S9(8) COMP SYNC.
       PROCEDURE DIVISION.
           ACCEPT EMP-LOC FROM EMPLOYEE BIND
           ON ANY-STATUS DISPLAY 'ACCEPT ADDRESS '.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsAcceptDbStatements.java
