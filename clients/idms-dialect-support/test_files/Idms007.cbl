       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
7      01  ROOT.
8          02  COPY IDMS COPY007_ISC.
9          03  COPY IDMS COPY007_ISC.
10     PROCEDURE DIVISION.
11         DISPLAY IDMS-NODE OF ISUBNODE OF ROOT.
12         DISPLAY IDMS-NODE OF ISUBNODE OF ISUBNODE OF ROOT.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */8f42f475c3824e9eaf1fdd0ecd5b133aada8c304/server/dialect-idms/src/test
      */java/org/eclipse/lsp/cobol/dialects/idms/usecases
      */TestCopyIdmsNested4.java