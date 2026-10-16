       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAP-DEFINITION-THREE.
       DATA DIVISION.
       MAP SECTION.
       MAP
          FIRST VERSION 1 TYPE STANDARD
       MAP SECOND.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           MODIFY MAP FIRST.
           DISPLAY SECOND.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Custom coverage for multiline declarations, an omitted period, and
      * references from both an IDMS statement and a regular COBOL statement.
