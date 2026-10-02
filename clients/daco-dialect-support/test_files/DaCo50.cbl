       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1. 
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       PROCEDURE DIVISION. 
           GET TABLE ANY GACP. 
           GET TABLE SEQ GACP.
      * Negative tests     
           GET TABLE ANY GA.
           GET TABLE SEQ GA. 
           GET TABLE ANY GAFSD. 
           GET TABLE SEQ GAFSD. 
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoTableGetStatement.java