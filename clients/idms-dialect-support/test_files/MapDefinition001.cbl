       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAP-DEFINITION-ONE.
       DATA DIVISION.
       MAP SECTION.
          MAX FIELD LIST 30.
          MAP ABCDE.
       WORKING-STORAGE SECTION.
       01 LDAR.
          07 ITENUM PIC X(7).
       PROCEDURE DIVISION.
           MODIFY MAP ABCDE CURSOR AT DFLD ITENUM.
           DISPLAY ABCDE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestMapDefinition.java
