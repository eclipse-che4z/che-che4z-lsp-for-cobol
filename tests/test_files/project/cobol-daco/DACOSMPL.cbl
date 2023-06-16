000800*----------------------------------------------------------------*
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID.    DABPA11N.
000800*----------------------------------------------------------------*
001000*----------------------------------------------------------------*
001100 ENVIRONMENT  DIVISION.
001200 IDMS-CONTROL SECTION.
001300 PROTOCOL.    MODE IS BATCH           DEBUG.
001400              IDMS-RECORDS            MANUAL.
001500 CONFIGURATION    SECTION.
001600*----------------------------------------------------------------*
001700 DATA   DIVISION.
001800 WORKING-STORAGE SECTION.
001810 01  COPY MAID MAIDABCD
001900 01  WS-AREA.                                                       D00000
002000     03 AREA-XW1.                                                   D00000
002100       05 MDUNAM-XW1                         VALUE 'DABPA11N'.      D00000
002200         07 FILLER               PIC X(2).                          D00000
002700       05 OCKREI-XW1             PIC X       VALUE SPACE.           D00018
002800       05 OSKEEL-XW1             PIC X       VALUE SPACE.           D00019
003700     03 AREA-XW2.                                                   D00066
003900       05 RBIPKKOKD-XW2          PIC X(3).                          D00067
004000       05 POSPKTOTD-XW2          PIC X.                             D0006A
004100       05 KOEPITNOD-XW2          PIC X.                             D0006B
004700     03 AREA-XW4.                                                   D00070
004900       05 OTPBTL-XW4.                                               D00072
005000         07 ORPOTW-XW4                       OCCURS 1000.           D00072
005400           09 TBLCRI-XW4.                                           D0007A
005500             11 RUSCRI-BW4       PIC S9(2)   VALUE ZERO  COMP.      D0007A
005600             11 ROWCRI-XW4                   OCCURS 40.             D0007C
005800     03 AREA-XW5.                                                   D0FB82
005900       05 XICNKCOED-XW5          PIC X.                             D0FB82
006000       05 CRI-BW5                PIC S9(2)   VALUE ZERO  COMP.      D0FB83
006100       05 TBLCRI-XW5  COPY-FROM W4.
006200     03 AREA-XW6.                                                   D10807
006300       05 TBLCRI-XW6  COPY-FROM W4.
008100*----------------------------------------------------------------*
008400 PROCEDURE DIVISION.
039100 S310 SECTION.
039300 S310-000.
039400     MOVE 'N'                    TO OCKREI-XW1.                     P01D90
039500     MOVE SPACE                  TO XICNKCOED-XW5.                  P01D94
039600     MOVE 1                      TO CRI-BW5.                        P01D94
039800 S310-500.
039900     IF OCKREI-XW1 = 'N'                                            P01D9E
040100        PERFORM S311                                                P01ED6
040300        PERFORM S312                                                P01ED6
040400        IF CRI-BW5 NOT = ZERO                                       P01ED6
040500           GO TO S310-500.                                          P01EE0
040600 S310-999.
040700     EXIT.                                                          P01DA6
040800*----------------------------------------------------------------*
040900 S311 SECTION.
041100 S311-000.
041200     MOVE ZERO                   TO RUSCRI-BW6.                     P01DA6
041300     ROW GET  TBLCRI-XW5 ON CRI-BW5.                                I8014
041600 S311-100.
041700     MOVE ROWCRI-XW5             TO ROWCRI-XW6.                     P01F34
041800     ROW ADD     TBLCRI-XW6.                                        I8015
042100     ROW NEXT    TBLCRI-XW5                                         I8016
042900     MOVE RCUCRI-BW5             TO CRI-BW5.                        P01E48
043000 S311-999.
043100     EXIT.                                                          P01E54
043200*----------------------------------------------------------------*
043300 S312 SECTION.
043500 S312-000.
043600     MOVE SPACE                  TO RBIPKKOKD-XW2.                  P01E54
043700     MOVE SPACE                  TO POSPKTOTD-XW2.                  P01E54
043800     MOVE SPACE                  TO KOEPITNOD-XW2.                  P01E54
043900     ROW START   TBLCRI-XW6.
044000 S312-100.
044100     ROW NEXT    TBLCRI-XW6.                                        I8017
045200     IF RBIPKKOKD-XW2 NOT = SPACE                                   P0214E
045500        AND
045600        POSPKTOTD-XW2 = 'I'
045700        AND
045800        KOEPITNOD-XW2 NOT = 'Y'
046100        GO TO S312-999.                                             P0228E
046600     MOVE OSKEEL-XW1             TO KOEPITNOD-XW2.                  P022A2
047100     IF OSKEEL-XW1 = 'Y'                                            P022B2
047300        GO TO S312-999.                                             P022B8
047400     GO TO S312-100.                                                P02112
047500 S312-200.
047600     IF RBIPKKOKD-XW2 NOT = SPACE                                   P02112
047700        AND
047800        POSPKTOTD-XW2 = 'I'
047900        AND
048000        KOEPITNOD-XW2 NOT = 'Y'
048300        GO TO S312-999.                                             P0212C
048400     MOVE 'Y'                    TO OCKREI-XW1.                     P022BC
049000 S312-999.
049100     EXIT.                                                          P02176
