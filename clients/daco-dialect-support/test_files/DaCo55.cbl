       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1. 
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-AREA. 
          03 AREA-XW1. 
            05 DET001-XW1. 
              07 FILLER               PIC X(5)    VALUE 'REMBD'. 
       PROCEDURE DIVISION. 
           CLOSE FILE INPUT 0123. 
           CLOSE FILE INPUT ALL. 
           CLOSE FILE OUTPUT 0123. 
           CLOSE FILE OUTPUT ALL.
      * Negative Tests     
           CLOSE FILE INPUT 01234. 
           CLOSE FILE OUTPUT 01234. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */ec60b8b1d88da1ebf8a3fca8cc2efd68a572441b/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoFileCloseStatement.java