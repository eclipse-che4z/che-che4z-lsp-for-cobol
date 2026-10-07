        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPDBK PIC S9(8) COMP.
       01 EMPPGI PIC S9(8) COMP.
       01 IX-EMP PIC S9(8) COMP.
       01 INDEX-KEY.
            03  EMP-LAST    PIC X(15) VALUE SPACES.
            03  EMP-FIRST   PIC X(10) VALUE SPACES.
       01 EMPL-KEY PIC X(25).
       01 ERROR-STATUS PIC X(4) VALUE '1400'.
           88 DB-REC-NOT-FOUND VALUE '0326'.
        PROCEDURE DIVISION.
           RETURN EMPDBK FROM IX-EMP USING INDEX-KEY
           ON DB-REC-NOT-FOUND DISPLAY 'NOT FOUND'.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsReturnStatement.java
