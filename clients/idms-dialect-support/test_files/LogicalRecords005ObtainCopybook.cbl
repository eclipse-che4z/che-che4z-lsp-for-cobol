       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOGICAL-RECORDS-005.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           COPY IDMS LR LOGICAL-RECORD.
       PROCEDURE DIVISION.
           OBTAIN NEXT EMP-JOB-LR INTO LR-AREA
               WHERE LR-FIELD EQ 'X'.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecases:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestObtainLRStatement.java
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsCopy.java
