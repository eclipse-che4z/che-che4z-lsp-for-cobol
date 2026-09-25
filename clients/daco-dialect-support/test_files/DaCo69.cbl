       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1. 
       DATA DIVISION. 
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       WORKING-STORAGE SECTION. 
       01 WS-AREA. 
          03 AREA-XW1. 
            05 DET001-XW1. 
              07 FILLER               PIC X(5)    VALUE 'REMBD'. 
       PROCEDURE DIVISION. 
           IF ROW AREA-XW1 ON WS-AREA = 'Y' 
           MOVE 'A' TO DET001-XW1.
           MOVE 'A' TO NOT_EXISTING.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */8f42f475c3824e9eaf1fdd0ecd5b133aada8c304/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoIfRowStatement.java 