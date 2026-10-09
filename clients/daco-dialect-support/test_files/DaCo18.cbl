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
           OPEN PACKET ABCD FOR DET001-XW1.
           OPEN PACKET ABCD FOR 'DEF'.
           OPEN PACKET ABCD FOR DET001-XW1 SORT DET001-XW1.
           OPEN PACKET ABCD FOR DET001-XW1 VERSION DET001-XW1.
           OPEN PACKET ABCD FOR DET001-XW1 VERSION 3.
           OPEN PACKET ABCD FOR DET001-XW1 SORT DET001-XW1
           VERSION DET001-XW1.
           OPEN PACKET ABCD FOR DET001-XW1 SORT DET001-XW1
           VERSION 3.
      * Negative tests
           OPEN PACKET A FOR DET001-XW1.
           OPEN PACKET A FOR 'AS'.
           OPEN PACKET ABCDE FOR DET001-XW1.
           OPEN PACKET ABCD FOR ASD.
           OPEN PACKET ABCD FOR DET001-XW1 SORT ASD.
           OPEN PACKET ABCD FOR DET001-XW1 SORT DET001-XW1
           VERSION ASD. 
      *https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob
      */40bec9e7654f1e5d8c086e188a170dc4205fdc1f/server/dialect-daco/src/test/
      *java/org/eclipse/lsp/cobol/dialects/daco/usecases/TestDaCoOpenPacket.java
