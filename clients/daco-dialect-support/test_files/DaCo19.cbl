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
           GET ENTITY 'TAK' DET001-XW1 OWNER. 
           GET ENTITY 'TAKS' DET001-XW1 'OWNER'. 
           GET ENTITY 'TAK' DET001-XW1 OWN. 
           GET ENTITY 'TAK' DET001-XW1 'OWN'. 
           GET ENTITY 'TAK' DET001-XW1 DESIGNER. 
           GET ENTITY 'TAK' DET001-XW1 'DESIGNER'. 
           GET ENTITY 'TAK' DET001-XW1 AVG. 
           GET ENTITY 'TAK' DET001-XW1 'AVG'. 
           GET ENTITY 'TAK' DET001-XW1 ANALIST. 
           GET ENTITY 'TAK' DET001-XW1 'ANALIST'. 
           GET ENTITY 'TAK' DET001-XW1 ANA. 
           GET ENTITY 'TAK' DET001-XW1 'ANA'. 
           GET ENTITY 'TAK' 'DECENT-INKOOP' OWNER. 
           GET ENTITY 'TAK' DET001-XW1 DESCRIPTION 'VD'. 
           GET ENTITY DOM DET001-XW1 DESCRIPTION. 
           GET ENTITY 'DOM' DET001-XW1 DESCRIPTION.
      * Negative tests   
           GET ENTITY 'TA' DET001-XW1 OWNER. 
           GET ENTITY 'TAKSE' DET001-XW1 'OWNER'. 
           GET ENTITY 'TAK' DET001-XW1 'OWNERT'. 
           GET ENTITY 'TAK' DET001-XW1 DESCRIPTION 'VDW'. 
           GET ENTITY 'DOMA' DET001-XW1 DESCRIPTION.
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test
      */java/org/eclipse/lsp/cobol/dialects/daco/usecases
      */TestDaCoGetEntityStatement.java