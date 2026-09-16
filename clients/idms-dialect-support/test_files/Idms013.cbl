        IDENTIFICATION DIVISION. 
        PROGRAM-ID. test1.
        ENVIRONMENT DIVISION.
        IDMS-CONTROL SECTION.
            PROTOCOL. MODE ABC.
            IDMS-RECORDS MANUAL
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
             SELECT EMP-FILE ASSIGN TO DUMMY
             ORGANIZATION IS LINE SEQUENTIAL
             ACCESS MODE IS SEQUENTIAL.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 EMPLOYEE PIC X(10).
        FILE SECTION.
            COPY IDMS FILE COPY013_FL002 VERSION 1.
       PROCEDURE DIVISION.
           DISPLAY EMP-FILE.
           DISPLAY NOT_EXISTING.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */8f42f475c3824e9eaf1fdd0ecd5b133aada8c304/server/dialect-idms/src/test
      */java/org/eclipse/lsp/cobol/dialects/idms/usecases
      */TestIdmsCopy.java