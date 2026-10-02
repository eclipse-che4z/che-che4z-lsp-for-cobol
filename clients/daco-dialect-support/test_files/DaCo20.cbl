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
           GET ITEM ANY DET001-XW1 DET001-XW1 DET001-XW1. 
           GET ITEM ANY 'SDF' 'GTERE' 'TYERWE'. 
           GET ITEM ANY 'SDF' 'GTERE' 'TYERWE'. 
           GET ITEM GRS DET001-XW1 DET001-XW1. 
           GET ITEM SEQ 'SDF' 'GTERE'. 
           GET ITEM SEQ 'SDF'. 
           GET ITEM SEQ DET001-XW1 DET001-XW1. 
           GET ITEM SEQ DET001-XW1. 
           GET ITEM GRS 'RETERW' 'DFDFD'. 
           GET ITEM GRS DET001-XW1 DET001-XW1 DET001-XW1. 
      * Negative tests     
           GET ITEM ANY DSR443-RW1 'FGTREW' 'GTREE'. 
           GET ITEM ANY DET001-XW1 DET001-XW1 DSR443-RW1. 
           GET ITEM ANY DET001-XW1 DSR443-RW1 DET001-XW1. 
           GET ITEM SEQ DSR443-RW1 
           GET ITEM SEQ 'SDFSS' DSR443-RW1. 
           GET ITEM GRS 'FERES' DSR443-RW1. 
           GET ITEM GRS 'FERES' 'DFERETS' DSR443-RW1.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoGetItemStatement.java