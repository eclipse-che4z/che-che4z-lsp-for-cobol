       IDENTIFICATION DIVISION. 
       PROGRAM-ID. test1. 
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 ERROR-STATUS PIC 9.
       PROCEDURE DIVISION.
122140 S950-000.
122150     BIND RUN-UNIT.                                                 I3327
122160     IF ERROR-STATUS = ZERO                                         P29E18
122170        COPY MAID PMOREC                                          B8I3328
              GO TO S950-000.
122190     PERFORM S999.                                                  P29EE0
           DISPLAY NOT_EXISTING.
