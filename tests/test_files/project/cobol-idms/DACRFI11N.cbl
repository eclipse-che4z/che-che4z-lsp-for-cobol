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
007800         07 FILLER               PIC X(2).                        31
007900         07 TAKKOD-XW1           PIC X(4).                        31
008000         07 FILLER               PIC X(2).                        31
008100       05 MDUOUD-XW1             PIC X(8)    VALUE 'INACTIVE'.
008200       05 MDUFIR-XW1             PIC X(8)    VALUE SPACE.         52
008300       05 MDULNK-XW1             PIC X(8).
008400       05 CVEVSI-BW1             PIC S9(4)   VALUE ZERO  COMP.
008500*    *
051100     03 AREA-XW6.                                                 20
051200       05 UVN-XW6                PIC X(3)    VALUE SPACE.         05
051300       05 RUSNAM-BW6             PIC S9(2)   VALUE ZERO  COMP.
051400       05 TBLNAM-XW6.                                             52
051500         07 ROWNAM_XW6                       OCCURS 18.
051600           09 SELNAM_XW6         PIC X(20).
051700     03 AREA-XW8.                                                 38
051800       05 TBFANW-XW8.                                             52
051900         07 ANW_XW8              PIC X       OCCURS 9999.
052000       05 SS1-BW8                PIC S9(4)   VALUE 1890  COMP.
052100       05 SS2-BW8                PIC S9(4)   VALUE 2357  COMP.
052200     03 AREA-XS1.
052300       05 S01-BS1                PIC S9(4)   VALUE ZERO  COMP.
052400       05 CTR-BS1                PIC S9(4)   VALUE ZERO  COMP.
052500       05 SELKOD-BS1             PIC S9(4)   VALUE ZERO  COMP.    38
052600     03 AREA-XWA.
     1       05 LDTA34TM-XWA.                                              159
     2         07 TRAKOD-XWA           PIC X(4)    VALUE 'TA34'.             1
     3         07 TAKKOD-XWA           PIC X(4)    VALUE SPACE.              5
     4         07 FABORS-XWA           PIC X(3)    VALUE SPACE.              9
     5         07 MRTKOD-XWA           PIC X(3)    VALUE SPACE.             12
     6         07 TPTUVNIND-XWA        PIC X       VALUE SPACE.             15
     7         07 FILLER               PIC X(17)   VALUE SPACE.             16
     8         07 ADKBSM-XWA           PIC X(8)    OCCURS 2.                33
     9         07 OMS-XWA              PIC X(40)   VALUE SPACE.             49
    10         07 ADKDTLIND-XWA        PIC X       VALUE SPACE.             89
    11         07 STUIDE-XWA           PIC X(10)   VALUE SPACE.             90
    12         07 TPTNAMPAT-XWA        PIC X(35)   VALUE SPACE.            100
    13         07 MRTNAM-XWA           PIC X(25)   VALUE SPACE.            135
052900     03 AREA-XWB.
     1       05 LDABO21M-XWB.                                               99
     2         07 ABOIND-XWB           PIC X(2)    VALUE SPACE.              1
     3         07 RECSRT-XWB           PIC X       VALUE SPACE.              3
     4         07 LNDKOD-XWB           PIC X(3)    OCCURS 2.                 4
     5         07 UVNIND-XWB           PIC X(3)    OCCURS 2.                10
     6         07 KMKABO-XWB           PIC X(4)    VALUE SPACE.             16
     7         07 TPTGEG-XWB                       OCCURS 4.                20
     8           09 TPTUVNIND-XWB      PIC X.                               20
     9           09 ABOTPT-XWB         PIC X(4).                            21
    10           09 TPTNAM-XWB         PIC X(15).                           25
053200     03 AREA-XWC.                                                 14
     1       05 LDHANATM-XWC.                                              452
     2         07 TRAKOD-XWC           PIC X(4)    VALUE SPACE.              1
     3         07 TPTUVNKEY-XWC        PIC X(6)    VALUE SPACE.              5
     4         07 FILLER               PIC X(22)   VALUE SPACE.             11
     5         07 TXT-XWC              PIC X(35)   OCCURS 12.               33
053500     03 AREA-XWE.                                                 28
     1       05 LDKLE59M-XWE.                                              983
     2         07 TAKKOD-XWE           PIC X(4)    VALUE SPACE.              1
     3         07 PROIND-XWE           PIC X       VALUE SPACE.              5
     4         07 KLETPS-XWE           PIC X       VALUE SPACE.              6
     5         07 YWK-BWE              PIC S9(6)   VALUE ZERO  COMP.         7
     6         07 RTTKOD-XWE           PIC X(4)    VALUE SPACE.             11
     7         07 KLEMAS-XWE.                                               15
     8           09 KLEMASDBK-BWE      PIC S9(9)   VALUE ZERO  COMP.        15
     9           09 KLENAM-XWE         PIC X(9)    VALUE SPACE.             19
    10           09 KLEOMS-XWE         PIC X(30)   VALUE SPACE.             28
    11           09 KLEKAT-XWE         PIC X(2)    VALUE SPACE.             58
    12           09 RGBKOD-BWE         PIC S9(4)   OCCURS 3    COMP.        60
    13           09 OPVREGNUM-XWE      PIC X(8)    VALUE SPACE.             66
    14           09 WYZREGNUM-XWE      PIC X(8)    VALUE SPACE.             74
    15           09 OPVYMD-BWE         PIC S9(8)   VALUE ZERO  COMP.        82
    16           09 WYZYMD-BWE         PIC S9(8)   VALUE ZERO  COMP.        86
    17           09 WYZUMS-BWE         PIC S9(6)   VALUE ZERO  COMP.        90
    18           09 OPVUMS-BWE         PIC S9(6)   VALUE ZERO  COMP.        94
    19         07 KLESEL-XWE.                                               98
    20           09 SELKOD-BWE         PIC S9(4)   VALUE ZERO  COMP.        98
    21           09 KLESRT-XWE         PIC X       VALUE SPACE.            100
    22           09 KLETPSSEL-XWE      PIC X       VALUE SPACE.            101
    23           09 UVNYWKBEG-BWE      PIC S9(6)   VALUE ZERO  COMP.       102
    24           09 UVNYWKEND-BWE      PIC S9(6)   VALUE ZERO  COMP.       106
    25           09 INGYWK-BWE         PIC S9(6)   VALUE ZERO  COMP.       110
    26           09 VVLYWK-BWE         PIC S9(6)   VALUE ZERO  COMP.       114
    27         07 KLEALT-XWE.                                              118
    28           09 ALTKLENAM-XWE      PIC X(9)    VALUE SPACE.            118
    29           09 ALTKLEOMS-XWE      PIC X(30)   VALUE SPACE.            127
    30           09 KLETPSALT-XWE      PIC X       VALUE SPACE.            157
    31           09 LVCIDE-XWE         PIC X(3)    VALUE SPACE.            158
    32           09 ITENUM-XWE         PIC X(10)   VALUE SPACE.            161
    33           09 FILLER             PIC X(15)   VALUE SPACE.            171
    34           09 YWKBEG-BWE         PIC S9(6)   VALUE ZERO  COMP.       186
    35           09 YWKTEM-BWE         PIC S9(6)   VALUE ZERO  COMP.       190
    36         07 KLETXT-XWE.                                              194
    37           09 TXT-XWE            PIC X(79)   OCCURS 10.              194
053800*    *                                                            14
     1 01  LDCOOD8M-XK1.                                                  9055
     2     03 FOTKOD-XK1               PIC X       VALUE SPACE.              1
     3     03 FOTOMS-XK1               PIC X(50)   VALUE SPACE.              2
     4     03 TBLOPT-XK1.                                                   52
     5       05 RUSOPT-BK1             PIC S9(5)   VALUE ZERO  COMP.        52
     6       05 ROWOPT_XK1                         OCCURS 1000.
     7         07 FEAIDE_BK1           PIC S9(4)               COMP.
     8         07 SORKEY_XK1.
     9           09 SORKNM_XK1         PIC X.
    10           09 OPTIDE_BK1         PIC S9(6)               COMP.
    11         07 ORSKOD_NK1           PIC 9.
    12         07 OPTSRT_XK1           PIC X.
054100*01  COPY MAID
     1 01  LDCOOD9M-XK2.                                                    24
     2     03 TAKKOD-XK2               PIC X(4)    VALUE SPACE.              1
     3     03 VKPORN-BK2               PIC S9(6)   VALUE ZERO  COMP.         5
     4     03 OPDKOD-XK2               PIC X(3)    VALUE SPACE.              9
     5     03 GRPIDE-XK2               PIC X       VALUE SPACE.             12
     6     03 VLGIND-XK2               PIC X       VALUE SPACE.             13
     7     03 FEAYON-XK2               PIC X       VALUE SPACE.             14
     8     03 FILLER                   PIC X(10)   VALUE SPACE.             15
054300*01  COPY MAID
*DACO: 01  LDDCII1M-XII.
*DACO:     03 OPDATOINI-XII            PIC X(3)    VALUE SPACE.
*DACO:     03 LAYADRINI-BII                                    POINTER.
*DACO: 01  AREA-XG1.
*DACO:     03 PMTEEN-XG1.
*DACO:       05 FILLER                 PIC X.
*DACO:       05 MDUNAM-XG1             PIC X(8).
*DACO:     03 PMTTWE-XG1.
*DACO:       05 FILLER                 PIC X.
*DACO:       05 CNLKOD-XG1             PIC X(4).
*DACO:     03 PMTDRI-XG1.
*DACO:       05 FILLER                 PIC X.
*DACO:       05 FOTDML-NG1             PIC 9(4).
*DACO: 01  WS-AREA-END                 PIC X.
18_    01  TBWPST_XW5.
21_TBI     03 TBIPST_XW5               PIC X(16)   VALUE 'TBLPST-XW5'.
21_RMX     03 RMXPST_BW5               PIC S9(8)   VALUE       30
00                                                             COMP.
21_RLE     03 RLEPST_BW5               PIC S9(4)   VALUE    1
00                                                             COMP.
21_        03 TBKPST_XW5.
23_          05 TBMPST_XW5             PIC X(3)    VALUE LOW-VALUE.
25 RUS       05 RUSPST-BW5             PIC S9(8)   VALUE ZERO  COMP.
25           05 RCUPST-BW5             PIC S9(8)   VALUE ZERO  COMP.
25           05 TBOPST-XW5             PIC X       VALUE LOW-VALUE.
25 UMX       05 RMXPST-BW5             PIC S9(8)   VALUE       30  COMP.
25 RMP       05 RMPPST-BW5             PIC S9(4)   VALUE ZERO  COMP.
23_TBP       05 TBPPST_BW5             PIC S9(4)   VALUE    0  COMP.
23_SBE       05 SBEPST_BW5             PIC S9(4)   VALUE    1  COMP.
23_SLE       05 SLEPST_BW5             PIC S9(4)   VALUE    1  COMP.
23_          05 BCUPST_XW5.
25_            07 BCUPST_BW5           PIC S9(8)   OCCURS 4    COMP.
23_          05 BEGPST_XW5             PIC X       VALUE SPACE.
18_    01  TBBPST_XW5.
23 ROW     03 ROWPST-XW5.
047200           09 POS-XW5            PIC X.
18_    01  TBWBSS_XW5.
21_TBI     03 TBIBSS_XW5               PIC X(16)   VALUE 'TBLBSS-XW5'.
21_RMX     03 RMXBSS_BW5               PIC S9(8)   VALUE       30
00                                                             COMP.
21_RLE     03 RLEBSS_BW5               PIC S9(4)   VALUE    1
00                                                             COMP.
21_        03 TBKBSS_XW5.
23_          05 TBMBSS_XW5             PIC X(3)    VALUE LOW-VALUE.
25 RUS       05 RUSBSS-BW5             PIC S9(8)   VALUE ZERO  COMP.
25           05 RCUBSS-BW5             PIC S9(8)   VALUE ZERO  COMP.
25           05 TBOBSS-XW5             PIC X       VALUE LOW-VALUE.
25 UMX       05 RMXBSS-BW5             PIC S9(8)   VALUE       30  COMP.
25 RMP       05 RMPBSS-BW5             PIC S9(4)   VALUE ZERO  COMP.
23_TBP       05 TBPBSS_BW5             PIC S9(4)   VALUE    0  COMP.
23_SBE       05 SBEBSS_BW5             PIC S9(4)   VALUE    1  COMP.
23_SLE       05 SLEBSS_BW5             PIC S9(4)   VALUE    1  COMP.
23_          05 BCUBSS_XW5.
25_            07 BCUBSS_BW5           PIC S9(8)   OCCURS 4    COMP.
23_          05 BEGBSS_XW5             PIC X       VALUE SPACE.
18_    01  TBBBSS_XW5.
23 ROW     03 ROWBSS-XW5.
047500           09 BSS-XW5            PIC X.
18_    01  TBBLND_XW5.
047700         07 AHLPOSEEN-XW5        PIC X                .
18_    01  TBBWOP_XW5.
047900         07 AHLPOSTWE-XW5        PIC X                .
055400 LINKAGE SECTION.
055500*01  COPY IDMS
*DACO: 01  SUBSCHEMA-CTRL.
*DACO:     03 PROGRAM-NAME             PIC X(8)    VALUE SPACE.
*DACO:     03 ERROR-STATUS             PIC X(4)    VALUE '1400'.
*DACO:       88 DB-STATUS-OK                       VALUE '0000'.
*DACO:       88 ANY-ERROR-STATUS                   VALUE '0001'
*DACO:                                             THRU  '9999'.
*DACO:       88 DB-END-OF-SET                      VALUE '0307'
*DACO:                                                   '1707'.
*DACO:       88 DB-REC-NOT-FOUND                   VALUE '0326'
*DACO:                                                   '1726'.
*DACO:       88 DC-NEW-STORAGE                     VALUE '3210'.
*DACO:       88 TB-END-OF-TABLE                    VALUE '8807'.
*DACO:       88 TB-TABLE-NOT-FOUND                 VALUE '8826'.
*DACO:       88 TB-TABLE-FULL                      VALUE '8811'.
*DACO:     03 DBKEY                    PIC S9(9)   VALUE ZERO  COMP.
*DACO:     03 RECORD-NAME                          VALUE SPACE.
*DACO:       05 SSC-NODN               PIC X(8).
*DACO:       05 SSC-DBN                PIC X(8).
*DACO:     03 AREA-NAME                PIC X(16)   VALUE SPACE.
*DACO:     03 ERROR-SET                PIC X(16)   VALUE SPACE.
*DACO:     03 ERROR-RECORD             PIC X(16)   VALUE SPACE.
*DACO:     03 ERROR-AREA               PIC X(16)   VALUE SPACE.
*DACO:     03 IDBMSCOM-AREA                        VALUE LOW-VALUE.
*DACO:       05 IDBMSCOM               PIC X       OCCURS 100.
*DACO:     03 IDBMSCOM-AREA-R1 REDEFINES IDBMSCOM-AREA.
*DACO:       05 FILLER                 PIC X(92).
*DACO:       05 DB-ACTIVE              PIC X(4).
*DACO:       05 FILLER                 PIC X(4).
*DACO:     03 RIDBMSCOM REDEFINES IDBMSCOM-AREA.
*DACO:       05 PAGE-INFO.
*DACO:         07 PAGE-INFO-GROUP      PIC S9(4) COMP.
*DACO:         07 PAGE-INFO-DBK-FORMAT PIC 9(4) COMP.
*DACO:       05 FILLER PIC X(96).
*DACO:     03 DIRECT-DBKEY             PIC S9(9)   VALUE ZERO  COMP.
*DACO:     03 DCBMSCOM-AREA                        VALUE LOW-VALUE.
*DACO:       05 DCBMSCOM               PIC X       OCCURS 100.
*DACO:     03 DCBMSCOM-AREA-R1 REDEFINES DCBMSCOM-AREA.
*DACO:       05 FILLER                 PIC X(44).
*DACO:       05 DCSTR1.
*DACO:         07 DCSTR2.
*DACO:           09 DCSTR4             PIC X(4).
*DACO:           09 DCSTR5             PIC X(4).
*DACO:         07 DCSTR3               PIC X(8).
*DACO:       05 DCNUM1                 PIC S9(8)               COMP.
*DACO:       05 DCNUM2                 PIC S9(8)               COMP.
*DACO:       05 DCNUM3                 PIC S9(8)               COMP.
*DACO:       05 DCFLG1                 PIC S9(4)               COMP.
*DACO:       05 DCFLG2                 PIC S9(4)               COMP.
*DACO:       05 DCFLG3                 PIC S9(4)               COMP.
*DACO:       05 DCFLG4                 PIC S9(4)               COMP.
*DACO:       05 DCFLG5                 PIC S9(4)               COMP.
*DACO:       05 DCFLG6                 PIC S9(4)               COMP.
*DACO:       05 DCCVER                 PIC S9(4)               COMP.
*DACO:       05 FILLER                 PIC X(14).
*DACO:     03 SSC-ERRSTAT-SAVE         PIC X(4)    VALUE SPACE.
*DACO:     03 SSC-DMLSEQ-SAVE          PIC S9(9)   VALUE ZERO  COMP.
*DACO:     03 DML-SEQUENCE             PIC S9(9)   VALUE ZERO  COMP.
*DACO:     03 RECORD-OCCUR             PIC S9(9)   VALUE ZERO  COMP.
*DACO:     03 SUBSCHEMA-CTRL-END       PIC X(4)    VALUE 'END '.
057400*01  COPY MAID
     1 01  LDDFTZ1O-XO5.                                                    33
     2     03 FAKNUM-XO5.                                                    1
     3       05 FAKKNM-XO5             PIC X(2).                             1
     4       05 FILLER                 PIC X.                                3
     5       05 FAKNUMLAT-NO5          PIC 9(5).                             4
     6     03 FAKSTS-XO5               PIC X.                                9
     7     03 ADKYMD-NO5               PIC 9(8).                            10
     8     03 FAKBDR-BO5               PIC S9(13)V9(2)         COMP.        18
     9     03 FAKBDREUR-BO5            PIC S9(13)V9(2)         COMP.        26
057600*01  COPY MAID
     1 01  LDSNPC1I-XI6.                                                    21
     2     03 TYPNAM-XI6               PIC X(15).                            1
     3     03 VKPORN-NI6               PIC 9(6).                            16
057800*01  COPY MAID
     1 01  LDSNPC1O-XO6.                                                    64
     2     03 PDTKATIND-XO6            PIC X.                                1
     3     03 PDTKAT-XO6               PIC X(15).                            2
     4     03 STKNUMIND-XO6            PIC X.                               17
     5     03 STKNUM-NO6               PIC 9(15).                           18
     6     03 STKNUMNEW-NO6            PIC 9(14).                           33
     7     03 STKNUM008-NO6            PIC 9(8).                            47
     8     03 STKNUM010-NO6            PIC 9(10).                           55
058100*----------------------------------------------------------------*
058500 PROCEDURE DIVISION.                                              52
059800 S090 SECTION.                                                    52
060000 S090-000.                                                        52
060100 S090-999.                                                        52
*DACO:        MOVE MDUNAM-XW1          TO MDUFIR-XW1
*DACO:        MOVE 'CSDCII1M'          TO MDULNK-XW1
*DACO:        CALL MDULNK-XW1
*DACO:     MOVE MDUOUD-XW1             TO PROGRAM-NAME.
*DACO:     MOVE 'INACTIVE'             TO MDUOUD-XW1.
060200     EXIT.                                                        52
060300*----------------------------------------------------------------*
060400 S100 SECTION.
060600 S100-000.
061100     PERFORM S680.                                                29
061300     MOVE 1                      TO CTR-BS1.                      14
063800     PERFORM S675.                                                40
064000     PERFORM S110.
064200     PERFORM S640.                                                14
064300     IF MRTKOD-XWA > SPACE
064400        IF ADKBSM-XWA (1) = SPACE
064600           GO TO S100-999                                         03
064700        END-IF
064800     ELSE
064900        IF ADKBSM-XWA (1) = SPACE                                 03
065000           OR                                                     03
065100           ADKBSM-XWA (2) = SPACE                                 03
065300           GO TO S100-999                                         03
065400        END-IF
065500     END-IF
065700     IF UVN-XW6              = 'DAP'                              05
066200        GO TO S100-100.                                           14
066800 S100-100.                                                        14
067000     IF UVN-XW6              = 'DAP'                              05
067500        GO TO S100-200.                                           45
068100 S100-200.                                                        05
068800 S100-999.
068900     EXIT.
069000*----------------------------------------------------------------*45
069100 S102 SECTION.                                                    45
069300 S102-000.                                                        45
069500     PERFORM S630.                                                14
071400     EXIT.                                                        45
074100*----------------------------------------------------------------*48
074200 S106 SECTION.                                                    48
074400 S106-000.                                                        48
074500     INITIALIZE LDCOOD9M-XK2.                                     48
074600     MOVE TAKKOD-XW1             TO TAKKOD-XK2.                   48
074800     MOVE 'MUI'                  TO OPDKOD-XK2.                   48
074900     MOVE 'N'                    TO GRPIDE-XK2.                   48
075000     MOVE 'U'                    TO VLGIND-XK2.                   48
075100     MOVE 'Y'                    TO FEAYON-XK2.                   48
075200     MOVE 'CSCOOD1M'             TO MDULNK-XW1.                   48
075300     CALL MDULNK-XW1          USING SUBSCHEMA-CTRL                48
075600                                    LDCOOD8M-XK1                  48
075700                                    LDCOOD9M-XK2.                 48
075800 S106-999.                                                        48
075900     EXIT.                                                        48
076000*----------------------------------------------------------------*
076100 S110 SECTION.
076300 S110-000.
076400     MOVE SPACE                  TO LDTA34TM-XWA.                 06
076500     MOVE 'DIRQ'                 TO TAKKOD-XWA.                   53
078800 S110-200.                                                        09
078900     MOVE UVN-XW6                TO FABORS-XWA.                   05
*DACO:     MOVE 'TA34'                 TO TRAKOD-XWA
*DACO:                                                                 .
079400     IF ERROR-STATUS = ZERO                                       13
079500        GO TO S110-999.                                           13
079600     IF ERROR-STATUS = '0326'                                     06
079800        PERFORM S115                                              53
079900        GO TO S110-999.                                           06
080100 S110-999.
080200     EXIT.
080300*----------------------------------------------------------------*53
080400 S115 SECTION.                                                    53
080600 S115-000.                                                        53
080700     MOVE SPACE                  TO TPTUVNIND-XWA.                53
*DACO:     MOVE 'TA34'                 TO TRAKOD-XWA
*DACO:                                                                 .
081200     IF ERROR-STATUS = '0326'                                     53
081400        PERFORM S116
081500        GO TO S115-999.                                           53
081700 S115-999.                                                        53
081800     EXIT.                                                        53
081900*----------------------------------------------------------------*01
082000 S116 SECTION.                                                    53
082200 S116-000.                                                        53
082300     MOVE SPACE                  TO MRTKOD-XWA.                   53
*DACO:                                                                 .
082800     IF ERROR-STATUS = '0326'                                     53
082900        MOVE SPACE               TO LDTA34TM-XWA                  53
083000        GO TO S116-999.                                           53
083200 S116-999.                                                        53
083300     EXIT.                                                        53
083400*----------------------------------------------------------------*01
083500 S400 SECTION.
083700 S400-000.
088600     MOVE 1                      TO CTR-BS1.                      43
090200     PERFORM S410.                                                14
090400     PERFORM S420.                                                16
090800     MOVE 4                      TO CTR-BS1.
094000 S400-050.                                                        36
095400     PERFORM S430.                                                36
096900     MOVE 4                      TO CTR-BS1.                      18
099600 S400-100.                                                        17
100800      MOVE 2                   TO CTR-BS1.                        29
102900     MOVE 36                     TO CTR-BS1.
103500 S400-999.
103600     EXIT.
103700*----------------------------------------------------------------*01
103800 S410 SECTION.                                                    01
104000 S410-000.                                                        01
*DACO:     MOVE 8006                   TO DML-SEQUENCE                  DMLC8006
*DACO:                                                                 .
104600     IF ERROR-STATUS = '8826'                                     48
104700        GO TO S410-999.                                           48
105000     MOVE ZERO                   TO ERROR-STATUS.                 08
105100     MOVE 'CSQSEL1M'             TO MDULNK-XW1.                   08
105200     CALL MDULNK-XW1          USING SUBSCHEMA-CTRL.
105400     IF ERROR-STATUS = '0326'                                     08
105500        OR                                                        48
105600        ERROR-STATUS = 'INPE'                                     48
105700        GO TO S410-999.                                           08
106300        MOVE ZERO                TO ERROR-STATUS                  08
106400        MOVE 'CSQSEL1M'          TO MDULNK-XW1                    08
106500        CALL MDULNK-XW1       USING SUBSCHEMA-CTRL.
106800 S410-999.                                                        01
106900     EXIT.                                                        01
107000*----------------------------------------------------------------*16
107100 S420 SECTION.                                                    16
107300 S420-000.                                                        16
107400     INITIALIZE LDKLE59M-XWE.
107500     MOVE 'Z'                    TO PROIND-XWE.
107700     MOVE 'C'                    TO KLETPS-XWE.
108000     MOVE 'CSDATE1M'             TO MDULNK-XW1.                   31
108300     MOVE 'CSKLE51M'             TO MDULNK-XW1.
109400 S420-999.                                                        16
109500     EXIT.                                                        16
109600*----------------------------------------------------------------*
109700 S430 SECTION.
109900 S430-000.
110300     IF ERROR-STATUS = ZERO                                       14
110500        GO TO S430-999.
110600     IF ERROR-STATUS = '0326'
110800        GO TO S430-999.
111000 S430-999.
111100     EXIT.
163000*----------------------------------------------------------------*
174200 S530 SECTION.                                                    53
174400 S530-000.                                                        53
175400     MOVE 'RATYNA1M'             TO MDULNK-XW1.                   53
175500     CALL MDULNK-XW1.                                             53
175600 S530-999.                                                        53
175700     EXIT.                                                        53
177700*----------------------------------------------------------------*53
177800 S535 SECTION.                                                    53
178000 S535-000.                                                        53
179100     MOVE ZERO                   TO RUSBSS-BW5.                   53
179200     MOVE RMXPST-BW5             TO RUSPST-BW5.                   53
*DACO:     MOVE ZERO                   TO RCUPST-BW5
*DACO:     MOVE 'Y'                    TO BEGPST_XW5
*DACO:                                                                 .
179500 S535-100.                                                        53
*DACO:     IF RCUPST-BW5               <  ZERO                          DMLC8044
*DACO:        COMPUTE RCUPST-BW5 = RCUPST-BW5 * -1
*DACO:     END-IF
*DACO:     MOVE SPACE                  TO BEGPST_XW5
*DACO:     IF RCUPST-BW5               <  RUSPST-BW5
*DACO:        AND                      <  000030
*DACO:        COMPUTE RCUPST-BW5 = RCUPST-BW5 +  1
*DACO:        MOVE ZERO                    TO ERROR-STATUS
*DACO:     ELSE
*DACO:        MOVE ZERO                    TO RCUPST-BW5
*DACO:        MOVE 8044                    TO DML-SEQUENCE
*DACO:        MOVE '8807'                  TO ERROR-STATUS
*DACO:        MOVE TBIPST_XW5              TO ERROR-RECORD
*DACO:     END-IF
*DACO:                                                                 .
179700     IF ERROR-STATUS = '8807'                                     53
179900        GO TO S535-999.                                           53
180000     IF POS-XW5 NOT = SPACE                                       53
180100        GO TO S535-100.                                           53
*DACO:     IF RCUPST-BW5               <  ZERO                          DMLC8045
*DACO:        COMPUTE RCUPST-BW5 = RCUPST-BW5 * -1
*DACO:     END-IF
*DACO:     MOVE SPACE                  TO BEGPST_XW5
*DACO:     IF RCUPST-BW5               <  RUSPST-BW5
*DACO:        AND                      <  000030
*DACO:        COMPUTE RCUPST-BW5 = RCUPST-BW5 +  1
*DACO:        MOVE ZERO                    TO ERROR-STATUS
*DACO:     ELSE
*DACO:        MOVE ZERO                    TO RCUPST-BW5
*DACO:        MOVE 8045                    TO DML-SEQUENCE
*DACO:        MOVE '8807'                  TO ERROR-STATUS
*DACO:        MOVE TBIPST_XW5              TO ERROR-RECORD
*DACO:     END-IF
*DACO:                                                                 .
180300     IF ERROR-STATUS = '8807'                                     53
180500        GO TO S535-999.                                           53
180600     IF POS-XW5 NOT = SPACE                                       53
180700        GO TO S535-100.                                           53
180900 S535-200.                                                        53
*DACO:     IF RCUPST-BW5               <  ZERO                          DMLC8046
*DACO:        COMPUTE RCUPST-BW5 = RCUPST-BW5 * -1
*DACO:     END-IF
*DACO:     MOVE SPACE                  TO BEGPST_XW5
*DACO:     IF RCUPST-BW5               <  RUSPST-BW5
*DACO:        AND                      <  000030
*DACO:        COMPUTE RCUPST-BW5 = RCUPST-BW5 +  1
*DACO:        MOVE ZERO                    TO ERROR-STATUS
*DACO:     ELSE
*DACO:        MOVE ZERO                    TO RCUPST-BW5
*DACO:        MOVE 8046                    TO DML-SEQUENCE
*DACO:        MOVE '8807'                  TO ERROR-STATUS
*DACO:        MOVE TBIPST_XW5              TO ERROR-RECORD
*DACO:     END-IF
*DACO:                                                                 .
181100     IF ERROR-STATUS = '8807'                                     53
181200        GO TO S535-999.                                           53
181300     IF POS-XW5 = SPACE                                           53
181400        GO TO S535-200.                                           53
181600 S535-250.                                                        53
181700     MOVE POS-XW5                TO BSS-XW5.
*DACO:     IF RUSBSS-BW5               >=  ZERO                         DMLC8047
*DACO:        AND                      <   000030
*DACO:        COMPUTE RCUBSS-BW5 = RUSBSS-BW5 + 1
*DACO:        MOVE RCUBSS-BW5          TO RUSBSS-BW5
*DACO:        MOVE ZERO                TO ERROR-STATUS
*DACO:     ELSE
*DACO:        MOVE 8047                TO DML-SEQUENCE
*DACO:        MOVE TBIBSS_XW5          TO ERROR-RECORD
*DACO:        MOVE '8811'              TO ERROR-STATUS
*DACO:     END-IF
*DACO:                                                                 .
*DACO:     IF RCUPST-BW5               <  ZERO                          DMLC8048
*DACO:        COMPUTE RCUPST-BW5 = RCUPST-BW5 * -1
*DACO:     END-IF
*DACO:     MOVE SPACE                  TO BEGPST_XW5
*DACO:     IF RCUPST-BW5               <  RUSPST-BW5
*DACO:        AND                      <  000030
*DACO:        COMPUTE RCUPST-BW5 = RCUPST-BW5 +  1
*DACO:        MOVE ZERO                    TO ERROR-STATUS
*DACO:     ELSE
*DACO:        MOVE ZERO                    TO RCUPST-BW5
*DACO:        MOVE 8048                    TO DML-SEQUENCE
*DACO:        MOVE '8807'                  TO ERROR-STATUS
*DACO:        MOVE TBIPST_XW5              TO ERROR-RECORD
*DACO:     END-IF
*DACO:                                                                 .
182200     IF ERROR-STATUS = ZERO                                       53
182300        GO TO S535-250.                                           53
182500 S535-999.                                                        53
182600     EXIT.                                                        53
182700*----------------------------------------------------------------*53
182800 S540 SECTION.                                                    53
183000 S540-000.                                                        53
184000     MOVE 'CADFTZ1M'             TO MDULNK-XW1.
184100     CALL MDULNK-XW1.
184200 S540-999.                                                        53
184300     EXIT.                                                        53
184400*----------------------------------------------------------------*17
184500 S600 SECTION.
184700 S600-000.                                                        03
185200     MOVE 'CAGRAM1M'             TO MDULNK-XW1.                   52
185300     CALL MDULNK-XW1.                                             52
185800 S600-999.
185900     EXIT.
186000*----------------------------------------------------------------*12
186100 S610 SECTION.                                                    12
186300 S610-000.                                                        12
186900 S610-999.                                                        12
187000     EXIT.                                                        12
187100*----------------------------------------------------------------*
187200 S620 SECTION.                                                    03
187400 S620-000.                                                        03
187800     MOVE 'RASNPC1M'             TO MDULNK-XW1
187900     CALL MDULNK-XW1.
188000 S620-999.                                                        03
188100     EXIT.                                                        03
188200*----------------------------------------------------------------*14
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
191400 S640 SECTION.                                                    14
191600 S640-000.                                                        14
191700     MOVE SPACE                  TO LDHANATM-XWC.                 14
*DACO:                                                                 .
195100     EXIT.                                                        14
196700*----------------------------------------------------------------*20
196800 S660 SECTION.                                                    20
197000 S660-000.                                                        20
*DACO:     MOVE 8050                   TO DML-SEQUENCE
*DACO:     MOVE 'QGTI'                 TO RECORD-NAME
*DACO:                                                                 .
197300     IF ERROR-STATUS NOT = ZERO                                   40
197400        GO TO S660-999.                                           40
197700     MOVE 'CSQKOL1M'             TO MDULNK-XW1.
198500 S660-999.                                                        20
198600     EXIT.                                                        20
198700*----------------------------------------------------------------*45
198800 S665 SECTION.                                                    45
199000 S665-000.                                                        45
*DACO:                                                                 .
199400 S665-200.                                                        01
*DACO:                                                                 .
200000     GO TO S665-200.
*DACO:                                                                 .
200500     IF ERROR-STATUS = ZERO                                       52
200600        GO TO S665-999.                                           52
200900     MOVE ZERO                   TO ERROR-STATUS.                 08
201000     MOVE 'CSQSEL1M'             TO MDULNK-XW1.                   08
201100     CALL MDULNK-XW1          USING SUBSCHEMA-CTRL.
201300     IF ERROR-STATUS = '0326'                                     08
201400        OR                                                        08
201500        ERROR-STATUS = 'INPE'                                     08
201600        GO TO S665-999.                                           08
202200        MOVE ZERO                TO ERROR-STATUS                  08
202300        MOVE 'CSQSEL1M'          TO MDULNK-XW1                    08
202400        CALL MDULNK-XW1       USING SUBSCHEMA-CTRL.
*DACO:     IF RUSNAM-BW6               >=  ZERO                         DMLC8054
*DACO:        AND                      <   000018
*DACO:        MOVE ZERO                TO ERROR-STATUS
*DACO:     ELSE
*DACO:        MOVE 8054                TO DML-SEQUENCE
*DACO:        MOVE '8811'              TO ERROR-STATUS
*DACO:     END-IF
*DACO:                                                                 .
203000 S665-999.                                                        45
203100     EXIT.                                                        45
203200*----------------------------------------------------------------*26
204500 S675 SECTION.                                                    40
204700 S675-000.                                                        40
205300     IF ERROR-STATUS = '0307'                                     40
205500        GO TO S675-999.                                           40
*DACO:        MOVE ZERO                TO ERROR-STATUS
*DACO:        MOVE 8055                TO DML-SEQUENCE
*DACO:        MOVE '8802'              TO ERROR-STATUS
*DACO:                                                                 .
206600 S675-500.                                                        52
207600 S675-999.                                                        40
207700     EXIT.                                                        40
207800*----------------------------------------------------------------*29
207900 S680 SECTION.                                                    29
208100 S680-000.                                                        29
208500     IF ERROR-STATUS = '0307'
208700        PERFORM S685                                              53
208800        GO TO S680-999.                                           42
210100 S680-010.
*DACO:     MOVE 8056                   TO DML-SEQUENCE
*DACO:     MOVE 'QGTI'                 TO RECORD-NAME
*DACO:                                                                 .
210400     IF ERROR-STATUS = '0307'
210500        GO TO S680-999.                                           53
210600     PERFORM S997.                                                53
211200 S680-999.                                                        29
211300     EXIT.                                                        29
212400*----------------------------------------------------------------*53
212500 S685 SECTION.                                                    53
212700 S685-000.                                                        53
213800     MOVE 'CAOVSK1M'             TO MDULNK-XW1.                   52
213900     CALL MDULNK-XW1.                                             53
214000 S685-999.                                                        53
214100     EXIT.                                                        53
228600*----------------------------------------------------------------*
*DACO: S997 SECTION.
*DACO: S997-000.
*DACO:     IF ERROR-STATUS         NOT =  ZERO
*DACO:     EXIT.
*DACO:*----------------------------------------------------------------*
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
