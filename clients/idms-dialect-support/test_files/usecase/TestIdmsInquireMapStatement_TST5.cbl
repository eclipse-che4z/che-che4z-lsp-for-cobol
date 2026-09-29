        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MFLD PIC X(8).
       01 MAP1.
          02 MFLD2 PIC X(2).
          02 MFLD3 PIC X(3).
       01 ATT-KEY PIC X.
       01 CURROW PIC S9(4).
       01 CURCOL PIC S9(4).
       01 MFLD-LEN PIC S9(4).
       01 EMPMAP PIC S9(4).
       01 MAP2.
           03 FILLER OCCURS 10 TIMES INDEXED BY S1.
           05 MAP-FLD PIC X(5).
       PROCEDURE DIVISION.
           INQUIRE MAP EMPMAP
           IF CURSOR AT DFLD MFLD2 OF MAP1 THEN DISPLAY 'CURSOR'.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsInquireMapStatement.java
