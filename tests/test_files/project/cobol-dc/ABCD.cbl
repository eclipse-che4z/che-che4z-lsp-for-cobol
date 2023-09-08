      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    calc2.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT  DIVISION.
       IDMS-CONTROL SECTION.
       PROTOCOL.    MODE IS BATCH           DEBUG
                            IDMS-RECORDS            MANUAL.
       CONFIGURATION    SECTION.
      *****************************************************************
      *****************************************************************
       DATA   DIVISION.
       WORKING-STORAGE SECTION.
       01 TEST-ITEM-FIRST.
           05 TEST-RENAME-FIRST PIC X(5).
           66 TEST-RENAME-SECOND RENAMES TEST-RENAME-FIRST.
       01 TEST-ITEM-SECOND REDEFINES TEST-ITEM-FIRST PIC X(5).
       01 COPY MAID ABCD.
       PROCEDURE DIVISION. 
           COPY MAID ABCD.
           MOVE 0 TO TEST-ITEM-FIRST.
           DISPLAY ABCD1.
