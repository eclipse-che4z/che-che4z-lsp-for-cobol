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
       01 RETKEY PIC X(4).
       01 SEQ-NUM PIC S9(8).
       01 PAG-NUM PIC S9(8).
       01 DETKEY PIC S9(8) COMP.
       01 MFLD-LEN PIC S9(4).
       01 EMPMAP PIC S9(4).
       01 MAP2.
           03 FILLER OCCURS 10 TIMES INDEXED BY S1.
           05 MAP-FLD PIC X(5).
       PROCEDURE DIVISION.
           MAP OUT USING EMPMAP RESUME.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsMapOutStatement.java
