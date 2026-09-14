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
           RETURN INFO 002. 
           RETURN WARNING 002. 
           RETURN ERROR 002. 
           RETURN INFO 002 'SDG GFG'. 
           RETURN WARNING 002 'SDG GFG'. 
           RETURN ERROR 002 'SDG GFG'. 
           RETURN INFO 002 DET001-XW1. 
           RETURN WARNING 002 DET001-XW1. 
           RETURN ERROR 002 DET001-XW1. 
           RETURN ERROR 002 DET001-XW1 DET001-XW1. 
           RETURN ERROR 002 DET001-XW1 DET001-XW1 DET001-XW1. 
           RETURN ERROR 002 'MODULE' DET001-XW1. 
           RETURN ERROR 002 'MODULE' DET001-XW1 DET001-XW1. 
      * Negative tests     
           RETURN INFO 00.
           RETURN WARNING 00. 
           RETURN ERROR 00. 
           RETURN INFO 0023. 
           RETURN WARNING 0023. 
           RETURN ERROR 0023. 
           RETURN INFO 002 ASD. 
           RETURN WARNING 002 ASD. 
           RETURN ERROR 002 ASD.
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoReturnStatusStatement.java 
