*DACO:*----------------------------------------------------------------*
*DACO:*----------------------------------------------------------------*
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID.    DACRFI11N.
006400*----------------------------------------------------------------*
006500*    * 
006600*----------------------------------------------------------------*
006700 ENVIRONMENT  DIVISION.
006800 IDMS-CONTROL SECTION.
006900 PROTOCOL.    MODE IS IDMS-DC-NONAUTO DEBUG
007000              IDMS-RECORDS MANUAL.
007100 CONFIGURATION    SECTION.
007200 OBJECT-COMPUTER. IBM-370.
007300 DATA   DIVISION.
*DACO: SCHEMA SECTION.
*DACO:     DB IVVPO31M WITHIN DAFDB01 .
007400 WORKING-STORAGE SECTION.
007500 01  WS-AREA.
007600     03 AREA-XW1.
007700       05 MDUNAM-XW1                         VALUE 'DACRFI11N'.
008000         07 FILLER               PIC X(2).                        31
008300       05 LMNDKU-XW1             PIC X(8).
008500*    *
053500     03 AREA-XWE.                                                 28
     1       05 LLED5K9M-XWE.                                              983
     3         07 IPNRDO-XWE           PIC X       VALUE SPACE.              5
     4         07 TKPLSE-XWE           PIC X       VALUE SPACE.              6
053800*    *                                                            14
055400 LINKAGE SECTION.
*DACO: 01  SUBSCHEMA-CTRL.
*DACO:     03 PROGRAM-NAME             PIC X(8)    VALUE SPACE.
*DACO:     03 ERROR-STATUS             PIC X(4)    VALUE '1400'.
*DACO:     03 RECORD-NAME                          VALUE SPACE.
*DACO:       05 CSS-ONDN               PIC X(8).
*DACO:       05 CSS-NDB                PIC X(8).
*DACO:     03 LDM-SEQUENCE             PIC S9(9)   VALUE ZERO  COMP.
058100*----------------------------------------------------------------*
058500 PROCEDURE DIVISION.                                              52
103800 S410 SECTION.                                                    01
104000 S410-000.                                                        01
*DACO:     MOVE 8006                   TO LDM-SEQUENCE                  DMLC8006
*DACO:                                                                 .
104600     IF ERROR-STATUS = '8826'                                     48
104700        GO TO S410-999.                                           48
105000     MOVE ZERO                   TO ERROR-STATUS.                 08
105100     MOVE 'CSQSEL1M'             TO LMNDKU-XW1.                   08
105200     CALL LMNDKU-XW1          USING SUBSCHEMA-CTRL.
105400     IF ERROR-STATUS = '0326'                                     08
105500        OR                                                        48
105600        ERROR-STATUS = 'INPE'                                     48
105700        GO TO S410-999.                                           08
106300        MOVE ZERO                TO ERROR-STATUS                  08
106400        MOVE 'CSQSEL1M'          TO LMNDKU-XW1                    08
106500        CALL LMNDKU-XW1       USING SUBSCHEMA-CTRL.
106800 S410-999.                                                        01
106900     EXIT.                                                        01
107000*----------------------------------------------------------------*16
107100 S420 SECTION.                                                    16
107300 S420-000.                                                        16
107400     INITIALIZE LLED5K9M-XWE.
107500     MOVE 'Z'                    TO IPNRDO-XWE.
107700     MOVE 'C'                    TO TKPLSE-XWE.
108000     MOVE 'CSDATE1M'             TO LMNDKU-XW1.                   31
108300     MOVE 'CSKLE51M'             TO LMNDKU-XW1.
109400 S420-999.                                                        16
109500     EXIT.                                                        16
109600*----------------------------------------------------------------*
188300 S630 SECTION.                                                    14
188500 S630-000.                                                        14
189200     IF ERROR-STATUS = ZERO                                       14
189300        GO TO S630-200.                                           14
189400     IF ERROR-STATUS = '0326'                                     03
189600        GO TO S630-999.                                           03
189800 S630-200.                                                        14
191100 S630-999.                                                        14
191200     EXIT.                                                        14
191300*----------------------------------------------------------------*14
196800 S660 SECTION.                                                    20
197000 S660-000.                                                        20
*DACO:     MOVE 8050                   TO LDM-SEQUENCE
*DACO:     MOVE 'QGTI'                 TO RECORD-NAME
*DACO:                                                                 .
197300     IF ERROR-STATUS NOT = ZERO                                   40
197400        GO TO S660-999.                                           40
197700     MOVE 'CSQKOL1M'             TO LMNDKU-XW1.
198500 S660-999.                                                        20
198600     EXIT.                                                        20
203200*----------------------------------------------------------------*26
204500 S675 SECTION.                                                    40
204700 S675-000.                                                        40
205300     IF ERROR-STATUS = '0307'                                     40
205500        GO TO S675-999.                                           40
*DACO:        MOVE ZERO                TO ERROR-STATUS
*DACO:        MOVE 8055                TO LDM-SEQUENCE
*DACO:        MOVE '8802'              TO ERROR-STATUS
*DACO:                                                                 .
206600 S675-500.                                                        52
207600 S675-999.                                                        40
207700     EXIT.                                                        40
207800*----------------------------------------------------------------*29
*DACO: SOPT-T1-TFI SECTION.
*DACO: SOPT-T1-TFI-000.
*DACO:     GO TO SOPT-T1-TFI-999.
*DACO: SOPT-T1-TFI-100.
*DACO:     MOVE '8826'                 TO ERROR-STATUS.
*DACO:     GO TO SOPT-T1-TFI-999.
*DACO: SOPT-T1-TFI-200.
*DACO:     MOVE ZERO                   TO ERROR-STATUS.
*DACO: SOPT-T1-TFI-999.
*DACO:     EXIT.
