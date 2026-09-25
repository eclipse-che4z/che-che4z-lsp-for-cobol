        IDENTIFICATION DIVISION.
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE IS IDMS-DC.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 EMPMAP PIC X(8).
        01 EMPMAPTOOLONG PIC X(8).
       PROCEDURE DIVISION.
           STARTPAGE SESSION EMPMAP BACKPAGE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
      * Java usecase:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases/TestIdmsStartpageStatement.java
