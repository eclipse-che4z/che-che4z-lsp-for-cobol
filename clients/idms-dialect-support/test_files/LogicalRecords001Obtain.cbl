       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOGICAL-RECORDS-001.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OBTAIN-AREA PIC X(20).
       01 TEMP-VAR PIC X.
       PROCEDURE DIVISION.
           OBTAIN FIRST EMPLOYEE-TABLE
               WHERE EMP-LAST-NAME-0415 EQ 'X'
               ON ALL NEXT SENTENCE.
           OBTAIN NEXT EMP-JOB-LR INTO OBTAIN-AREA
               WHERE OFFICE-CODE-0450 EQ OFFICE-CODE-IN
               ON LR-NOT-FOUND GO TO END-OF-LR.
           OBTAIN NEXT EMP-JOB-LR
               WHERE DEPT-ID-410 EQ DEPT-ID-0410 OF LR.
           OBTAIN NEXT TASK-ID
               WHERE DEPT-ID-410 EQ DEPT-ID-0410 OF LR
               ON DB-REC-NOT-FOUND
               MOVE 'Y' TO TEMP-VAR
           END-IF.
       END-OF-LR.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestObtainLRStatement.java
