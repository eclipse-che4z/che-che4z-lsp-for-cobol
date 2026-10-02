       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1. 
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  AREA-XAA.
           03 TBLNAM-XAA PIC X(6).
       PROCEDURE DIVISION. 
           MOVE 6 to RUSNAM-BAA.
           DISPLAY NOT_EXISTING.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */87cfdc478079c3cb02e549ca75095a6f6f85122a/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoImplicitCode.java