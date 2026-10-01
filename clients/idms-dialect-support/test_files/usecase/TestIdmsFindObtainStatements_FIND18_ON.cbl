        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPDBK PIC S9(8) COMP.
       01 EMPPGI PIC S9(8) COMP.
       01 EMPL-ID PIC X(4).
       01 ERROR-STATUS PIC X(4) VALUE '1400'.
           88 DB-END-OF-SET VALUE '0307'.
       01 EMPLOYEE PIC S9(8) COMP SYNC.
       01 DEPT-EMPLOYEE PIC S9(8) COMP SYNC.
       01 DEPT-AREA PIC S9(8) COMP SYNC.
       01 EMP-AREA PIC S9(8) COMP SYNC.
       01 OFFICE-AREA PIC S9(8) COMP SYNC.
       01 OFFICE PIC S9(8) COMP SYNC.
       01 DEPARTMENT PIC S9(8) COMP SYNC.
        PROCEDURE DIVISION.
           OBTAIN NEXT EMPLOYEE WITHIN DEPT-EMPLOYEE ON DB-END-OF-SET
                   DISPLAY 'END OF SET' END-IF.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsFindObtainStatements.java
