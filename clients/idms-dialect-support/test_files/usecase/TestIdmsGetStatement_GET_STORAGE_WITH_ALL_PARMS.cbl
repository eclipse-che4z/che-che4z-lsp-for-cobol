        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WK_NAME PIC X(8).
        01 WK_AREA1 PIC X(8).
        01 WK_AREA2 PIC X(8).
        01 WK_LENGTH PIC S9(8).
        01 WK_ID PIC S9(8) COMP.
        01 WK_TIME PIC S9(11) COMP-3.
        01 WK_DATE PIC S9(7).
        01 EMPLOYEE PIC S9(7).
        01 EMP-AREA PIC S9(7).
       PROCEDURE DIVISION.
           MOVE 8 TO WK_LENGTH.
           MOVE '123' TO WK_ID. GET STORAGE FOR WK_AREA1
           TO WK_AREA2 LENGTH WK_LENGTH WAIT KEEP LONG
           SHARED STGID '123' VALUE IS HIGH-VALUE LOCATION IS ANY.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsGetStatement.java
