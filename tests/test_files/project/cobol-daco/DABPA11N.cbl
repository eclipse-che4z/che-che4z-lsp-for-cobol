000100*----------------------------------------------------------------*
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID.    DABPA11N.                                           
000800*----------------------------------------------------------------*
001000*----------------------------------------------------------------*
001100 ENVIRONMENT  DIVISION.
001200 IDMS-CONTROL SECTION.
001300 PROTOCOL.    MODE IS BATCH           DEBUG
001400              IDMS-RECORDS            MANUAL.
001500 CONFIGURATION    SECTION.
001600*----------------------------------------------------------------*
001700 DATA   DIVISION.
001800 WORKING-STORAGE SECTION.
001900 01  WS-AREA.                                                       D00000
002000     03 AREA-XW1.                                                   D00000
002100       05 MDUNAM-XW1                         VALUE 'DABPA11N'.      D00000
002200         07 FILLER               PIC X(2).                          D00000
002300         07 TAKKOD-XW1           PIC X(4).                          D00002
002400         07 FILLER               PIC X(2).                          D00006
002500       05 MDUOUD-XW1             PIC X(8)    VALUE 'INACTIVE'.      D00008
002600       05 MDUFIR-XW1             PIC X(8)    VALUE SPACE.           D00010
002700       05 CRIOKE-XW1             PIC X       VALUE SPACE.           D00018
002800       05 SELOKE-XW1             PIC X       VALUE SPACE.           D00019
002900       05 POLNAM-XW1             PIC X(15)   VALUE SPACE.           D0001A
003000       05 POLIND-XW1             PIC X       VALUE SPACE.           D00029
003100       05 VRAYWK-NW1             PIC 9(6)    VALUE ZERO.            D0002A
003200       05 DPRSRT-XW1             PIC X(2)    VALUE SPACE.           D00030
003700     03 AREA-XW2.                                                   D00066
003800       05 SPCIND-XW2             PIC X.                             D00066
003900       05 BPKKRIKOD-XW2          PIC X(3).                          D00067
004000       05 OPTTPSKOD-XW2          PIC X.                             D0006A
004100       05 OPTOKEIND-XW2          PIC X.                             D0006B
004200     03 AREA-XW3.                                                   D0006C
004300       05 ASNCFGBVS-XW3.                                            D0006C
004400         07 ASNCFGBVS-NW3        PIC 9(2)    VALUE ZERO.            D0006C
004500       05 GEWKLSKOD-XW3.                                            D0006E
004600         07 GEWKLSKOD-NW3        PIC 9(2)    VALUE ZERO.            D0006E
004700     03 AREA-XW4.                                                   D00070
004800       05 RUSOPT-BW4             PIC S9(4)   VALUE ZERO  COMP.      D00070
004900       05 TBLOPT-XW4.                                               D00072
005000         07 ROWOPT-XW4                       OCCURS 1000.           D00072
005100           09 OPTIDE-NW4         PIC 9(6)    VALUE ZERO.            D00072
005200           09 BSSOPTIND-XW4      PIC X.                             D00078
005300           09 BSSTSTIND-XW4      PIC X.                             D00079
005400           09 TBLCRI-XW4.                                           D0007A
005500             11 RUSCRI-BW4       PIC S9(2)   VALUE ZERO  COMP.      D0007A
005600             11 ROWCRI-XW4                   OCCURS 40.             D0007C
005700               13 COPY MAID POLCRI-XRI WRK.
005800     03 AREA-XW5.                                                   D0FB82
005900       05 INCEXCKOD-XW5          PIC X.                             D0FB82
006000       05 CRI-BW5                PIC S9(2)   VALUE ZERO  COMP.      D0FB83
006100       05 TBLCRI-XW5  COPY-FROM W4.
006200     03 AREA-XW6.                                                   D10807
006300       05 TBLCRI-XW6  COPY-FROM W4.
006600 01  COPY IDMS SUBSCHEMA-NAMES.
006700*----------------------------------------------------------------*
006800 LINKAGE SECTION.                                                   D00443
006900 01  COPY IDMS SUBSCHEMA-CTRL.                                      D00014
007200 01  COPY MAID PMOREC.
007300 01  COPY LDDPA61I KMKINP.                                     D00044
007500 01  COPY MAID LDDPA61O KMKOTP.
007700 01  COPY MAID LDDPKZ1I KMKINP.
007900 01  COPY MAID LDDPKZ1O KMKOTP.
008100*----------------------------------------------------------------*
008400 PROCEDURE DIVISION.
008500 S000 SECTION.
008600 S000-000.
008700     COPY MAID PMOSTU.
008800 S000-999.
008900     GOBACK.                                                        P00926
009000*----------------------------------------------------------------*
009100 S010 SECTION.
009300 S010-000.
009400 S010-999.
009500     EXIT.                                                          P0087C
009600*----------------------------------------------------------------*
009700 S090 SECTION.
009900 S090-000.
010000 S090-999.
010100     EXIT.                                                          P007D0
010200*----------------------------------------------------------------*
010300 S100 SECTION.
010500 S100-000.
010600     MOVE 'N'                    TO POLCTR-XO1.                     P007D0
010700     MOVE ZERO                   TO RUSOPT-BO1.                     P007D4
010900     PERFORM S110.                                                  P00A08
011100     PERFORM S150.                                                  P00A08
011200     IF SPCIND-XW2 = 'N'                                            P00A08
011300        GO TO S100-999.                                             P00A10
011500     IF CTRIND-XI1 = 'S'                                            P00A10
011600        MOVE 'Y'                 TO POLCTR-XO1                      P00C50
011700        GO TO S100-999.                                             P00C58
011900     PERFORM S200.                                                  P00866
012100     PERFORM S300.                                                  P00866
012200     IF RUSOPT-BO1 NOT = ZERO                                       P00866
012300        MOVE 'Y'                 TO POLCTR-XO1.                     P00874
012400 S100-999.
012500     EXIT.                                                          P007DE
012600*----------------------------------------------------------------*
012700 S110 SECTION.
012900 S110-000.
013000     MOVE POLNAM-XI1             TO POLNAM-XPH.                     P007DE
013100     MOVE POLIND-XI1             TO POLIND-XPH.                     P007EC
013200     OBTAIN ANY   POLHDR-XPH.                                       I3000
013300     IF ERROR-STATUS         NOT =  ZERO                            P00848
013400        PERFORM S999.                                               P00856
013500     IF VRAYWK-NI1               =  ZERO                            P00C5C
013600        MOVE 'INP1'              TO ERROR-STATUS                    P00C76
013700        PERFORM S999.                                               P00C86
014100     PERFORM S720.                                                  P00CF0
014300        MOVE 'DATE'              TO ERROR-STATUS                    P00D00
014400        PERFORM S999.                                               P00D10
014500     IF DPRSRT-XI1 NOT = 'GS'                                       P00D1E
014600        AND
014700        DPRSRT-XI1 NOT = 'MS'
014800        MOVE 'INP2'              TO ERROR-STATUS                    P00D3C
014900        PERFORM S999.                                               P00D4C
015000     MOVE DPRTYPKEY-XI1          TO DPRTYPKEY-XDY.                  P00D5A
015100     OBTAIN ANY DPRTYP-XDY.                                         I3001
015200     IF ERROR-STATUS         NOT =  ZERO                            P00DBE
015300        PERFORM S999.                                               P00DCC
015400     IF CTRIND-XI1           NOT =  'P'                             P00DDA
015500        AND
015600        CTRIND-XI1           NOT =  'S'
015700        AND
015800        CTRIND-XI1           NOT =  'O'
015900        MOVE 'INP3'              TO ERROR-STATUS                    P00DF6
016000        PERFORM S999.                                               P00E06
016100 S110-999.
016200     EXIT.                                                          P0096C
016300*----------------------------------------------------------------*
016400 S150 SECTION.
016600 S150-000.
016700     MOVE 'N'                    TO SPCIND-XW2.                     P0096C
016800     IF VRAYWK-NI1               <  YWKBEG-BDY                      P00970
016900        OR
017000        VRAYWK-NI1               >  YWKTEM-BDY
017100        GO TO S150-999.                                             P009A6
017200     IF TYPNAM-XPH = ALL '*'                                        P009A6
017300        OR
017400        TYPNAM-XPH = TYPNAM-XDY
017500        GO TO S150-010.                                             P009BE
017600     STRING MATCH TYPNAM-XPH TYPNAM-XDY 15.                         I8000
017700     IF ERROR-STATUS NOT =  ZERO                                    P00E7C
017800        GO TO S150-999.                                             P00E8E
017900 S150-010.
018000     IF TYPNAMMRT-XPH = ALL '*'                                     P00E8E
018100        OR
018200        TYPNAMMRT-XPH = TYPNAMMRT-XDY
018300        GO TO S150-020.                                             P00EAA
018400     STRING MATCH TYPNAMMRT-XPH TYPNAMMRT-XDY 15.                   I8001
018500     IF ERROR-STATUS NOT =  ZERO                                    P00F68
018600        GO TO S150-999.                                             P00F7A
018700 S150-020.
018800     IF TYPCLSKOD-XPH = ALL '*'                                     P00F7A
018900        OR
019000        TYPCLSKOD-XPH = TYPCLSKOD-XDY
019100        GO TO S150-030.                                             P00F96
019200     STRING MATCH TYPCLSKOD-XPH TYPCLSKOD-XDY 6.                    I8002
019300     IF ERROR-STATUS NOT =  ZERO                                    P01044
019400        GO TO S150-999.                                             P01056
019500 S150-030.
019600     IF UVNINDSEL-XPH = ALL '*'                                     P01056
019700        OR
019800        UVNINDSEL-XPH = UVNIND-XDY
019900        GO TO S150-040.                                             P01072
020000     STRING MATCH UVNINDSEL-XPH UVNIND-XDY 3.                       I8003
020100     IF ERROR-STATUS NOT =  ZERO                                    P0112C
020200        GO TO S150-999.                                             P0113E
020300 S150-040.
020400     IF PDKAPPCOD-XPH = ALL '*'                                     P0113E
020500        OR
020600        PDKAPPCOD-XPH = PDKAPPCOD-XDY
020700        GO TO S150-050.                                             P0115A
020800     STRING MATCH PDKAPPCOD-XPH PDKAPPCOD-XDY 3.                    I8004
020900     IF ERROR-STATUS NOT =  ZERO                                    P01212
021000        GO TO S150-999.                                             P01224
021100 S150-050.
021200     IF DPRARE-XPH = ALL '*'                                        P01224
021300        OR
021400        DPRARE-XPH = DPRARE-XDY
021500        GO TO S150-060.                                             P01248
021600     STRING MATCH DPRARE-XPH DPRARE-XDY 2.                          I8005
021700     IF ERROR-STATUS NOT =  ZERO                                    P01300
021800        GO TO S150-999.                                             P01312
021900 S150-060.
022000     IF TRKSER-XPH = ALL '*'                                        P01312
022100        OR
022200        TRKSER-XPH = TRKSER-XDY
022300        GO TO S150-070.                                             P0132E
022400     STRING MATCH TRKSER-XPH TRKSER-XDY 5.                          I8006
022500     IF ERROR-STATUS NOT =  ZERO                                    P013DC
022600        GO TO S150-999.                                             P01400
022700 S150-070.
022800     IF VRTTYPDPRSEL-XPH = ALL '*'                                  P01400
022900        OR
023000        VRTTYPDPRSEL-XPH = VRTTYPDPR-XDY
023100        GO TO S150-080.                                             P01424
023200     STRING MATCH VRTTYPDPRSEL-XPH VRTTYPDPR-XDY 2.                 I8007
023300     IF ERROR-STATUS NOT =  ZERO                                    P014D2
023400        GO TO S150-999.                                             P014E4
023500 S150-080.
023600     MOVE ASNCFGBVS-NDY          TO ASNCFGBVS-NW3.                  P014E4
023700     IF ASNCFGBVSSEL-XPH = ALL '*'                                  P014F2
023800        OR
023900        ASNCFGBVSSEL-XPH = ASNCFGBVS-XW3
024000        GO TO S150-090.                                             P01512
024100     STRING MATCH ASNCFGBVSSEL-XPH ASNCFGBVS-XW3 2.                 I8008
024200     IF ERROR-STATUS NOT =  ZERO                                    P015C2
024300        GO TO S150-999.                                             P015D4
024400 S150-090.
024500     MOVE GEWKLSKOD-NDY          TO GEWKLSKOD-NW3.                  P015D4
024600     IF GEWKLSKODSEL-XPH = ALL '*'                                  P015E2
024700        OR
024800        GEWKLSKODSEL-XPH = GEWKLSKOD-XW3
024900        MOVE 'Y'                 TO SPCIND-XW2                      P01602
025000        GO TO S150-999.                                             P01602
025100     STRING MATCH GEWKLSKODSEL-XPH GEWKLSKOD-XW3 2.                 I8009
025200     IF ERROR-STATUS NOT =  ZERO                                    P016B2
025300        GO TO S150-999.                                             P016C4
025400     MOVE 'Y'                    TO SPCIND-XW2.                     P00A04
025500 S150-999.
025600     EXIT.                                                          P00A1C
025700*----------------------------------------------------------------*
025800 S200 SECTION.
026000 S200-000.
026100     IF POLNAM-XI1 = POLNAM-XW1                                     P00A1C
026200        AND
026300        POLIND-XI1 = POLIND-XW1
026400        AND
026500        DPRSRT-XI1 = DPRSRT-XW1
026600        AND
026700        VRAYWK-NI1 = VRAYWK-NW1
026900        GO TO S200-999.                                             P016C8
027000     MOVE POLNAM-XI1             TO POLNAM-XW1.                     P016C8
027100     MOVE POLIND-XI1             TO POLIND-XW1.                     P016D2
027200     MOVE VRAYWK-NI1             TO VRAYWK-NW1.
027300     MOVE DPRSRT-XI1             TO DPRSRT-XW1.                     P016E2
027400     MOVE ZERO                   TO RUSOPT-BW4.                     P016E8
027500 S200-500.
027600     OBTAIN NEXT  POLOPT-XPO WITHIN POLHDR-POLOPT.                  I3002
027700     IF ERROR-STATUS             =  '0307'                          P01760
027800        GO TO S200-999.                                             P0176E
027900     IF ERROR-STATUS         NOT =  ZERO                            P0176E
028000        PERFORM S999.                                               P01778
028100     IF VRAYWK-NI1               <  YWKBEG-BPO                      P01786
028200        OR
028300        VRAYWK-NI1               >  YWKTEM-BPO
028400        GO TO S200-500.                                             P017BC
028600     PERFORM S210.                                                  P017BC
028700     GO TO S200-500.                                                P017BC
028800 S200-999.
028900     EXIT.                                                          P017BC
029000*----------------------------------------------------------------*
029100 S210 SECTION.
029300 S210-000.
029400     OBTAIN NEXT  POLBSS-XPB WITHIN POLOPT-POLBSS.                  I3003
029500     IF ERROR-STATUS             =  '0307'                          P0181C
029600        GO TO S210-999.                                             P0182A
029700     IF ERROR-STATUS         NOT =  ZERO                            P0182A
029800        PERFORM S999.                                               P01834
029900     IF DPRSRT-XI1 = 'GS'                                           P01846
030000        IF BSSOPTINDGSS-XPB = SPACE                                 P01854
030100           AND
030200           BSSTSTINDGSS-XPB = SPACE
030300           GO TO S210-000                                           P01868
030400        END-IF
030600        MOVE BSSOPTINDGSS-XPB    TO BSSOPTIND-XW4                   P01868
030700        MOVE BSSTSTINDGSS-XPB    TO BSSTSTIND-XW4                   P0187C
030800     ELSE
030900        IF BSSOPTIND-XPB = SPACE                                    P01886
031000           AND
031100           BSSTSTIND-XPB = SPACE
031200           GO TO S210-000                                           P0189A
031300        END-IF
031500        MOVE BSSOPTIND-XPB       TO BSSOPTIND-XW4                   P0189A
031600        MOVE BSSTSTIND-XPB       TO BSSTSTIND-XW4                   P018AE
031700     END-IF.
031800     MOVE OPTIDE-BPO             TO OPTIDE-NW4.                     P018B4
031900     MOVE ZERO                   TO RUSCRI-BW5.                     P018CC
032100     PERFORM S211.                                                  P01B58
032200     GO TO S210-000.                                                P01B58
032300 S210-999.
032400     EXIT.                                                          P01842
032500*----------------------------------------------------------------*
032600 S211 SECTION.
032800 S211-000.
032900     OBTAIN NEXT  POLCRI-XRI WITHIN POLBSS-POLCRI.                  I3004
033000     IF ERROR-STATUS             =  '0307'                          P01932
033100        MOVE TBLCRI-XW5          TO TBLCRI-XW4                      P01940
033200        ROW ADD     TBLOPT-XW4                                      I8010
033300        IF ERROR-STATUS NOT = ZERO                                  P01A48
033400           PERFORM S999                                             P01A5A
033500        END-IF
033600        GO TO S211-999.                                             P01A68
033700     IF ERROR-STATUS         NOT =  ZERO                            P01A6C
033800        PERFORM S999.                                               P01A7E
034000     IF DPRSRT-XI1 = 'GS'                                           P01A8C
034100        AND
034200        BPKKRIKOD-XRI =  'MRT'
034300        GO TO S211-000.                                             P01AA8
034400     MOVE POLCRI-XRI             TO POLCRI-XW5.                     P01AA8
034500     ROW ADD     TBLCRI-XW5.                                        I8011
034600     IF ERROR-STATUS = ZERO                                         P01B38
034700        GO TO S211-000.                                             P01B4A
034800     PERFORM S999.                                                  P01B4A
034900 S211-999.
035000     EXIT.                                                          P00B5E
035100*----------------------------------------------------------------*
035200 S300 SECTION.
035400 S300-000.
035600     PERFORM S700.                                                  P00B5E
035700     INSPECT VRTTYPOMS-XDY CONVERTING LOW-XW1 TO UPP-XW1.           P00B5E
035800     ROW START   TBLOPT-XW4.
035900 S300-500.
036000     ROW NEXT    TBLOPT-XW4.                                        I8012
036100     IF ERROR-STATUS = '8807'                                       P01B8C
036200        GO TO S300-999.                                             P01B9E
036300     MOVE OPTIDE-NW4             TO OPTIDE-BO2.                     P01B9E
036400     ROW ANY     TBLOPT-XO2   USING OPTIDE-BO2.                     I8013
036500     IF ERROR-STATUS NOT = ZERO                                     P01D22
036700        GO TO S300-500.                                             P01D34
036900     IF RUSCRI-BW4 = ZERO                                           P01D34
037000        IF CTRIND-XI1 = 'P'                                         P01E02
037100           MOVE 'Y'              TO POLCTR-XO1                      P01E0E
037200           GO TO S300-999                                           P01E16
037300        ELSE
037500           PERFORM S600                                             P01E1A
037600           GO TO S300-500                                           P01E28
037700        END-IF
037800     END-IF.
037900     MOVE TBLCRI-XW4             TO TBLCRI-XW5.                     P01D42
038100     PERFORM S310.                                                  P01E2C
038300     IF CTRIND-XI1 = 'P'                                            P01E2C
038400        AND
038500        POLCTR-XO1 = 'Y'
038600        GO TO S300-999.                                             P01E44
038700     GO TO S300-500.                                                P01D90
038800 S300-999.
038900     EXIT.                                                          P01D90
039000*----------------------------------------------------------------*
039100 S310 SECTION.
039300 S310-000.
039400     MOVE 'N'                    TO CRIOKE-XW1.                     P01D90
039500     MOVE SPACE                  TO INCEXCKOD-XW5.                  P01D94
039600     MOVE 1                      TO CRI-BW5.                        P01D94
039800 S310-500.
039900     IF CRIOKE-XW1 = 'N'                                            P01D9E
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
041400     IF ERROR-STATUS NOT = ZERO                                     P01F14
041500        PERFORM S999.                                               P01F26
041600 S311-100.
041700     MOVE ROWCRI-XW5             TO ROWCRI-XW6.                     P01F34
041800     ROW ADD     TBLCRI-XW6.                                        I8015
041900     IF ERROR-STATUS NOT = ZERO                                     P01FB6
042000        PERFORM S999.                                               P01FC8
042100     ROW NEXT    TBLCRI-XW5                                         I8016
042200     IF ERROR-STATUS = '8807'                                       P0208A
042400        MOVE ZERO                TO CRI-BW5                         P0209C
042500        GO TO S311-999.                                             P020A2
042700     IF VLGNUM-BW5 = VLGNUM-BW6                                     P020A6
042800        GO TO S311-100.                                             P020B8
042900     MOVE RCUCRI-BW5             TO CRI-BW5.                        P01E48
043000 S311-999.
043100     EXIT.                                                          P01E54
043200*----------------------------------------------------------------*
043300 S312 SECTION.
043500 S312-000.
043600     MOVE SPACE                  TO BPKKRIKOD-XW2.                  P01E54
043700     MOVE SPACE                  TO OPTTPSKOD-XW2.                  P01E54
043800     MOVE SPACE                  TO OPTOKEIND-XW2.                  P01E54
043900     ROW START   TBLCRI-XW6.
044000 S312-100.
044100     ROW NEXT    TBLCRI-XW6.                                        I8017
044200     IF ERROR-STATUS = '8807'                                       P020EC
044300        GO TO S312-200.                                             P02130
044400     IF BPKKRIKOD-XW2 = BPKKRIKOD-XW6                               P02130
044500        AND
044600        OPTTPSKOD-XW6 = 'I'
044700        AND
044800        OPTOKEIND-XW2 = 'Y'
045100        GO TO S312-100.                                             P0214E
045200     IF BPKKRIKOD-XW2 NOT = SPACE                                   P0214E
045300        AND
045400        BPKKRIKOD-XW2 NOT = BPKKRIKOD-XW6
045500        AND
045600        OPTTPSKOD-XW2 = 'I'
045700        AND
045800        OPTOKEIND-XW2 NOT = 'Y'
046100        GO TO S312-999.                                             P0228E
046300     PERFORM S320.                                                  P0228E
046400     MOVE BPKKRIKOD-XW6          TO BPKKRIKOD-XW2.                  P0228E
046500     MOVE OPTTPSKOD-XW6          TO OPTTPSKOD-XW2.                  P02298
046600     MOVE SELOKE-XW1             TO OPTOKEIND-XW2.                  P022A2
046700     IF OPTTPSKOD-XW6 = 'I'                                         P022AC
046900        GO TO S312-100.                                             P022B2
047100     IF SELOKE-XW1 = 'Y'                                            P022B2
047300        GO TO S312-999.                                             P022B8
047400     GO TO S312-100.                                                P02112
047500 S312-200.
047600     IF BPKKRIKOD-XW2 NOT = SPACE                                   P02112
047700        AND
047800        OPTTPSKOD-XW2 = 'I'
047900        AND
048000        OPTOKEIND-XW2 NOT = 'Y'
048300        GO TO S312-999.                                             P0212C
048400     MOVE 'Y'                    TO CRIOKE-XW1.                     P022BC
048500     IF CTRIND-XI1 = 'P'                                            P022C0
048600        MOVE 'Y'           TO POLCTR-XO1                            P022CC
048700     ELSE
048900        PERFORM S600.                                               P022D8
049000 S312-999.
049100     EXIT.                                                          P02176
049200*----------------------------------------------------------------*
066500 S321 SECTION.
066700 S321-000.
066800     MOVE 'Y'                    TO SELOKE-XW1.                     P0226C
066900 S321-999.
067000     EXIT.                                                          P02270
067100*----------------------------------------------------------------*
067200 S600 SECTION.
067400 S600-000.
067500     COMPUTE KRIQTY-BO1 = RUSCRI-BW4 * -1.                          P02D6C
067600     MOVE FEAIDE-BO2             TO FEAIDE-BO1.                     P02D7C
067700     MOVE OPTIDE-BO2             TO OPTIDE-BO1.                     P02D8E
067800     MOVE BSSOPTIND-XW4          TO BSSOPTIND-XO1.                  P02DA0
067900     MOVE BSSTSTIND-XW4          TO BSSTSTIND-XO1.                  P02DA0
068000     ROW ADD     TBLOPT-XO1.                                        I8029
068100     IF ERROR-STATUS NOT = ZERO                                     P02E2E
068200        PERFORM S999.                                               P02E40
068300 S600-999.
068400     EXIT.                                                          P02E4E
068500*----------------------------------------------------------------*
068600 S700 SECTION.
068800 S700-000.
068900     INITIALIZE LDDPKZ1I-XI2.                                       P00A60
069000     MOVE TAKKOD-XW1             TO TAKKOD-XI2.                     P00AAC
069100     MOVE DPRTYPKEY-XI1          TO DPRTYPKEY-XI2.                  P00AB2
069200     MOVE VRAYWK-NI1             TO VRAYWK-NI2.                   05
071100     CALL 'RADPKZ1M'.                                             09P00B02
071200     IF TBLOPT-XO2 = LOW-VALUE                                      P00B24
071300        MOVE 'A'                 TO TBOOPT-XO2.                     P00B50
071400 S700-999.
071500     EXIT.                                                          P00CBE
071600*----------------------------------------------------------------*
071700 S720 SECTION.
071900 S720-000.
072100 S720-999.
072200     EXIT.                                                          P00756
