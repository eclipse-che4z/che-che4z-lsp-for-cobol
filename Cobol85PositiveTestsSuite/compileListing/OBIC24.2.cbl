1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:41   Page     1
0Options in effect:
  NOADATA
    ADV
    AFP(NOVOLATILE)
    QUOTE
    ARCH(8)
    ARITH(COMPAT)
  NOAWO
  NOBLOCK0
    BUFSIZE(4096)
  NOCICS
    CODEPAGE(1140)
  NOCOMPILE(S)
  NOCOPYLOC
  NOCOPYRIGHT
  NOCURRENCY
    DATA(31)
    DBCS
  NODECK
  NODEFINE
  NODIAGTRUNC
    DISPSIGN(COMPAT)
  NODLL
  NODUMP
  NODYNAM
  NOEXIT
  NOEXPORTALL
  NOFASTSRT
    FLAG(I,I)
  NOFLAGSTD
    HGPR(PRESERVE)
  NOINITCHECK
  NOINITIAL
    INLINE
    INTDATE(ANSI)
  NOINVDATA
    LANGUAGE(EN)
    LINECOUNT(60)
  NOLIST
    LP(32)
  NOMAP
    MAXPCF(100000)
  NOMDECK
  NONAME
    NSYMBOL(NATIONAL)
  NONUMBER
  NONUMCHECK
    NUMPROC(NOPFD)
    OBJECT
  NOOFFSET
    OPTIMIZE(0)
    OUTDD(SYSOUT)
  NOPARMCHECK
    PGMNAME(COMPAT)
    QUALIFY(COMPAT)
    RENT
    RMODE(AUTO)
  NORULES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:41   Page     2
0 NOSERVICE
    SEQUENCE
    SOURCE(DEC)
    SPACE(1)
  NOSQL
    SQLCCSID
  NOSQLIMS
  NOSSRANGE
  NOSTGOPT
    SUPPRESS
  NOTERM
  NOTEST(NODWARF,NOSOURCE,NOSEPARATE)
  NOTHREAD
    TRUNC(STD)
    TUNE(8)
  NOVBREF
    VLR(STANDARD)
    VSAMOPENFS(COMPAT)
  NOWORD
    XMLPARSE(XMLSS)
    XREF(FULL)
    ZWB
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         OBIC24.2
   000002         000200 PROGRAM-ID.                                                      OBIC24.2
   000003         000300     OBIC2A.                                                      OBIC24.2
   000004         000500*                                                              *  OBIC24.2
   000005         000600*    VALIDATION FOR:-                                          *  OBIC24.2
   000006         000700*                                                              *  OBIC24.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBIC24.2
   000008         000900*                                                              *  OBIC24.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBIC24.2
   000010         001100*                                                              *  OBIC24.2
   000011         001300*                                                              *  OBIC24.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  OBIC24.2
   000013         001500*                                                              *  OBIC24.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  OBIC24.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  OBIC24.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  OBIC24.2
   000017         001900*                                                              *  OBIC24.2
   000018         002100*                                                                 OBIC24.2
   000019         002200*        THE SUBPROGRAM IC219 TESTS THE USE OF A SORT STATEMENT   OBIC24.2
   000020         002300*    IN A SEGMENTED SUBPROGRAM.  THE FIRST NON-DECLARATIVE SECTIONOBIC24.2
   000021         002400*    OF THE SUBPROGRAM CONSISTS OF A SORT STATEMENT AND A STOP RUNOBIC24.2
   000022         002500*    STATEMENT IN A FIXED PERMANENT SEGMENT.  THE SORT INPUT      OBIC24.2
   000023         002600*    PROCEDURE AND THE SORT OUTPUT PROCEDURE ARE CONTAINED IN TWO OBIC24.2
   000024         002700*    INDEPENDENT SEGMENTS.  THE MAIN PROGRAM IC218 CALLS THIS     OBIC24.2
   000025         002800*    SUBPROGRAM AND THE SUBPROGRAM IC220 IS CALLED FROM THE       OBIC24.2
   000026         002900*    OUTPUT PROCEDURE SECTION TO PRINT THE OUTPUT REPORT.         OBIC24.2
   000027         003000*                                                                 OBIC24.2
   000028         003200 ENVIRONMENT DIVISION.                                            OBIC24.2
   000029         003300 CONFIGURATION SECTION.                                           OBIC24.2
   000030         003400 SOURCE-COMPUTER.                                                 OBIC24.2
   000031         003500     XXXXX082.                                                    OBIC24.2
   000032         003600 OBJECT-COMPUTER.                                                 OBIC24.2
   000033         003700     XXXXX083.                                                    OBIC24.2
   000034         003800 INPUT-OUTPUT SECTION.                                            OBIC24.2
   000035         003900 FILE-CONTROL.                                                    OBIC24.2
   000036         004000     SELECT ST-FS1 ASSIGN TO                                      OBIC24.2 40
   000037         004100     XXXXX027.                                                    OBIC24.2
   000038         004200 DATA DIVISION.                                                   OBIC24.2
   000039         004300 FILE SECTION.                                                    OBIC24.2
   000040         004400 SD  ST-FS1                                                       OBIC24.2
   000041         004500     DATA RECORD IS ST-FS1R1-F-G-126.                             OBIC24.2 *
   000042         004600 01  ST-FS1R1-F-G-126.                                            OBIC24.2
   000043         004700     02  ST-FS1-1-120.                                            OBIC24.2
   000044         004800         03  FILLER          PICTURE X(34).                       OBIC24.2
   000045         004900         03  ST-FS1-REC-NO   PICTURE 9(6).                        OBIC24.2
   000046         005000         03  FILLER          PICTURE X(80).                       OBIC24.2
   000047         005100     02  ST-FS1-121-124      PICTURE X(4).                        OBIC24.2
   000048         005200     02  ST-FS1-125-126      PICTURE 99.                          OBIC24.2
   000049         005300 WORKING-STORAGE SECTION.                                         OBIC24.2
   000050         005400 01  TEMP1               PICTURE X(4).                            OBIC24.2
   000051         005500 01  TEMP2               PICTURE 999.                             OBIC24.2
   000052         005600 01  TEMP3               PICTURE 999.                             OBIC24.2
   000053         005700 01  TEMP4               PICTURE 9(6).                            OBIC24.2
   000054         005800 01  FAIL-COUNT          PICTURE 999    VALUE ZERO.               OBIC24.2 IMP
   000055         005900 01  EOF-FLAG            PICTURE 9    VALUE ZERO.                 OBIC24.2 IMP
   000056         006000 01  PRINT-LINE-VALUES.                                           OBIC24.2
   000057         006100     02  PASS-OR-FAIL        PICTURE X(5).                        OBIC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200     02  R-COUNT             PICTURE 99.                          OBIC24.2
   000059         006300     02  FEATURE-TESTED      PICTURE X(20).                       OBIC24.2
   000060         006400     02  COMPUTED-SORT-KEY.                                       OBIC24.2
   000061         006500         03  COMPUTED-1-4    PICTURE X(4).                        OBIC24.2
   000062         006600         03  COMPUTED-5-6    PICTURE 99.                          OBIC24.2
   000063         006700         03  COMPUTED-7-12   PICTURE 9(6).                        OBIC24.2
   000064         006800         03  FILLER          PICTURE X(8)  VALUE SPACE.           OBIC24.2 IMP
   000065         006900     02  CORRECT-SORT-KEY.                                        OBIC24.2
   000066         007000         03  CORRECT-1-4     PICTURE X(4).                        OBIC24.2
   000067         007100         03  CORRECT-5-6     PICTURE 99.                          OBIC24.2
   000068         007200         03  CORRECT-7-12    PICTURE 9(6).                        OBIC24.2
   000069         007300         03  FILLER          PICTURE X(8)   VALUE SPACE.          OBIC24.2 IMP
   000070         007400     02  PARAGRAPH-NAME      PICTURE X(12).                       OBIC24.2
   000071         007500 01  PRINT-FLAG              PICTURE 9.                           OBIC24.2
   000072         007600 01  FILE-RECORD-INFORMATION-REC.                                 OBIC24.2
   000073         007700     03 FILE-RECORD-INFO-SKELETON.                                OBIC24.2
   000074         007800        05 FILLER                 PICTURE X(48)       VALUE       OBIC24.2
   000075         007900             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  OBIC24.2
   000076         008000        05 FILLER                 PICTURE X(46)       VALUE       OBIC24.2
   000077         008100             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    OBIC24.2
   000078         008200        05 FILLER                 PICTURE X(26)       VALUE       OBIC24.2
   000079         008300             ",LFIL=000000,ORG=  ,LBLR= ".                        OBIC24.2
   000080         008400        05 FILLER                 PICTURE X(37)       VALUE       OBIC24.2
   000081         008500             ",RECKEY=                             ".             OBIC24.2
   000082         008600        05 FILLER                 PICTURE X(38)       VALUE       OBIC24.2
   000083         008700             ",ALTKEY1=                             ".            OBIC24.2
   000084         008800        05 FILLER                 PICTURE X(38)       VALUE       OBIC24.2
   000085         008900             ",ALTKEY2=                             ".            OBIC24.2
   000086         009000        05 FILLER                 PICTURE X(7)        VALUE SPACE.OBIC24.2 IMP
   000087         009100     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              OBIC24.2
   000088         009200        05 FILE-RECORD-INFO-P1-120.                               OBIC24.2
   000089         009300           07 FILLER              PIC X(5).                       OBIC24.2
   000090         009400           07 XFILE-NAME           PIC X(6).                      OBIC24.2
   000091         009500           07 FILLER              PIC X(8).                       OBIC24.2
   000092         009600           07 XRECORD-NAME         PIC X(6).                      OBIC24.2
   000093         009700           07 FILLER              PIC X(1).                       OBIC24.2
   000094         009800           07 REELUNIT-NUMBER     PIC 9(1).                       OBIC24.2
   000095         009900           07 FILLER              PIC X(7).                       OBIC24.2
   000096         010000           07 XRECORD-NUMBER       PIC 9(6).                      OBIC24.2
   000097         010100           07 FILLER              PIC X(6).                       OBIC24.2
   000098         010200           07 UPDATE-NUMBER       PIC 9(2).                       OBIC24.2
   000099         010300           07 FILLER              PIC X(5).                       OBIC24.2
   000100         010400           07 ODO-NUMBER          PIC 9(4).                       OBIC24.2
   000101         010500           07 FILLER              PIC X(5).                       OBIC24.2
   000102         010600           07 XPROGRAM-NAME        PIC X(5).                      OBIC24.2
   000103         010700           07 FILLER              PIC X(7).                       OBIC24.2
   000104         010800           07 XRECORD-LENGTH       PIC 9(6).                      OBIC24.2
   000105         010900           07 FILLER              PIC X(7).                       OBIC24.2
   000106         011000           07 CHARS-OR-RECORDS    PIC X(2).                       OBIC24.2
   000107         011100           07 FILLER              PIC X(1).                       OBIC24.2
   000108         011200           07 XBLOCK-SIZE          PIC 9(4).                      OBIC24.2
   000109         011300           07 FILLER              PIC X(6).                       OBIC24.2
   000110         011400           07 RECORDS-IN-FILE     PIC 9(6).                       OBIC24.2
   000111         011500           07 FILLER              PIC X(5).                       OBIC24.2
   000112         011600           07 XFILE-ORGANIZATION   PIC X(2).                      OBIC24.2
   000113         011700           07 FILLER              PIC X(6).                       OBIC24.2
   000114         011800           07 XLABEL-TYPE          PIC X(1).                      OBIC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000115         011900        05 FILE-RECORD-INFO-P121-240.                             OBIC24.2
   000116         012000           07 FILLER              PIC X(8).                       OBIC24.2
   000117         012100           07 XRECORD-KEY          PIC X(29).                     OBIC24.2
   000118         012200           07 FILLER              PIC X(9).                       OBIC24.2
   000119         012300           07 ALTERNATE-KEY1      PIC X(29).                      OBIC24.2
   000120         012400           07 FILLER              PIC X(9).                       OBIC24.2
   000121         012500           07 ALTERNATE-KEY2      PIC X(29).                      OBIC24.2
   000122         012600           07 FILLER              PIC X(7).                       OBIC24.2
   000123         012700 LINKAGE SECTION.                                                 OBIC24.2
   000124         012800 01  SORT-LINK           PICTURE 9.                               OBIC24.2
   000125         012900 PROCEDURE DIVISION USING SORT-LINK.                              OBIC24.2 124
   000126         013000 SECT-IC219-0001 SECTION 30.                                      OBIC24.2
   000127         013100*                                                                 OBIC24.2
   000128         013200*        THIS SECTION CONTAINS A SORT STATEMENT AND A STOP RUN    OBIC24.2
   000129         013300*    STATEMENT, THE ONLY STATEMENTS PERMITTED IN THE FIRST NON-   OBIC24.2
   000130         013400*    DECLARATIVE PORTION OF THE PROCEDURE DIVISION IN SORT LEVEL 1OBIC24.2
   000131         013500*                                                                 OBIC24.2
   000132         013600 SORT-PARAGRAPH.                                                  OBIC24.2
   000133         013700     SORT ST-FS1                                                  OBIC24.2 40
   000134         013800         ASCENDING KEY ST-FS1-121-124                             OBIC24.2 47
   000135         013900         ASCENDING KEY ST-FS1-125-126                             OBIC24.2 48
   000136         014000         ASCENDING KEY ST-FS1-REC-NO                              OBIC24.2 45
   000137         014100             INPUT PROCEDURE IS SECT-IC219-0002                   OBIC24.2 140
   000138         014200             OUTPUT PROCEDURE IS SECT-IC219-0003.                 OBIC24.2 195
   000139         014300     STOP RUN.                                                    OBIC24.2
   000140         014400 SECT-IC219-0002 SECTION 60.                                      OBIC24.2
   000141         014500*                                                                 OBIC24.2
   000142         014600*        THE SORT INPUT PROCEDURE RELEASES 500 SORT RECORDS OF    OBIC24.2
   000143         014700*    LENGTH 126 CHARACTERS.  THREE ITEMS ARE USED AS THE SORT KEY,OBIC24.2
   000144         014800*    THEY ARE CHARACTERS 121-124 PICX(4), CHARACTERS 125-126      OBIC24.2
   000145         014900*    PIC 99, AND THE RECORD NUMBER FIELD CHARACTERS 35-40 PIC 9(6)OBIC24.2
   000146         015000*    THE RECORDS ARE WRITTEN WITH THE SORT KEY ITEMS CONTAINING   OBIC24.2
   000147         015100*    THE FOLLOWING CHARACTERS                                     OBIC24.2
   000148         015200*                                                                 OBIC24.2
   000149         015300*        FIRST 100 RECORDS  ABCD  00 THRU 99  000001 THRU 000100  OBIC24.2
   000150         015400*        SECOND 100 RECORDS AAAA  00 THRU 99  000101 THRU 000200  OBIC24.2
   000151         015500*        THIRD 100 RECORDS  ABCD  00 THRU 99  000201 THRU 00300   OBIC24.2
   000152         015600*        FOURTH 100 RECORDS UVWY  00 THRU 99  000301 THRU 000400  OBIC24.2
   000153         015700*        FIFTH 100 RECORDS  UVWX  00 THRU 99  000401 THRU 000500  OBIC24.2
   000154         015800*                                                                 OBIC24.2
   000155         015900 SORT-INPUT-PROCEDURE.                                            OBIC24.2
   000156         016000     MOVE 1 TO SORT-LINK.                                         OBIC24.2 124
   000157         016100     MOVE FILE-RECORD-INFO-SKELETON TO FILE-RECORD-INFO (1).      OBIC24.2 73 87
   000158         016200     PERFORM RECORD-AREA-INIT.                                    OBIC24.2 175
   000159         016300     MOVE "ABCD" TO TEMP1.                                        OBIC24.2 50
   000160         016400     MOVE 0 TO TEMP2.                                             OBIC24.2 51
   000161         016500     PERFORM RELEASE-RECORD 100 TIMES.                            OBIC24.2 186
   000162         016600     MOVE "AAAA" TO TEMP1.                                        OBIC24.2 50
   000163         016700     MOVE 0 TO TEMP2.                                             OBIC24.2 51
   000164         016800     PERFORM RELEASE-RECORD 100 TIMES.                            OBIC24.2 186
   000165         016900     MOVE "ABCD" TO TEMP1.                                        OBIC24.2 50
   000166         017000     MOVE 0 TO TEMP2.                                             OBIC24.2 51
   000167         017100     PERFORM RELEASE-RECORD 100 TIMES.                            OBIC24.2 186
   000168         017200     MOVE "UVWY" TO TEMP1.                                        OBIC24.2 50
   000169         017300     MOVE 0 TO TEMP2.                                             OBIC24.2 51
   000170         017400     PERFORM RELEASE-RECORD 100 TIMES.                            OBIC24.2 186
   000171         017500     MOVE "UVWX" TO TEMP1.                                        OBIC24.2 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000172         017600     MOVE 0 TO TEMP2.                                             OBIC24.2 51
   000173         017700     PERFORM RELEASE-RECORD 100 TIMES.                            OBIC24.2 186
   000174         017800     GO TO SECT-IC219-0002-EXIT.                                  OBIC24.2 193
   000175         017900 RECORD-AREA-INIT.                                                OBIC24.2
   000176         018000     MOVE "ST-FS1" TO XFILE-NAME (1).                             OBIC24.2 90
   000177         018100     MOVE "R1-F-G" TO XRECORD-NAME (1).                           OBIC24.2 92
   000178         018200     MOVE "IC219" TO XPROGRAM-NAME (1).                           OBIC24.2 102
   000179         018300     MOVE 126 TO XRECORD-LENGTH (1).                              OBIC24.2 104
   000180         018400     MOVE "RC" TO CHARS-OR-RECORDS (1).                           OBIC24.2 106
   000181         018500     MOVE 0001 TO XBLOCK-SIZE (1).                                OBIC24.2 108
   000182         018600     MOVE 500 TO RECORDS-IN-FILE (1).                             OBIC24.2 110
   000183         018700     MOVE "NA" TO XFILE-ORGANIZATION (1).                         OBIC24.2 112
   000184         018800     MOVE "N" TO XLABEL-TYPE (1).                                 OBIC24.2 114
   000185         018900     MOVE 1 TO XRECORD-NUMBER (1).                                OBIC24.2 96
   000186         019000 RELEASE-RECORD.                                                  OBIC24.2
   000187         019100     MOVE FILE-RECORD-INFO-P1-120 (1) TO ST-FS1-1-120.            OBIC24.2 88 43
   000188         019200     MOVE TEMP1 TO ST-FS1-121-124.                                OBIC24.2 50 47
   000189         019300     MOVE TEMP2 TO ST-FS1-125-126.                                OBIC24.2 51 48
   000190         019400     RELEASE ST-FS1R1-F-G-126.                                    OBIC24.2 42
   000191         019500     ADD 1 TO XRECORD-NUMBER (1).                                 OBIC24.2 96
   000192         019600     ADD 1 TO TEMP2.                                              OBIC24.2 51
   000193         019700 SECT-IC219-0002-EXIT.                                            OBIC24.2
   000194         019800     EXIT.                                                        OBIC24.2
   000195         019900 SECT-IC219-0003 SECTION 80.                                      OBIC24.2
   000196         020000*                                                                 OBIC24.2
   000197         020100*        THE SORT OUTPUT PROCEDURE RETURNS 500 SORT RECORDS.  THE OBIC24.2
   000198         020200*    DATA ITEMS COMPRISING THE SORT KEY ARE CHECKED TO ENSURE THE OBIC24.2
   000199         020300*    RECORDS ARE RETURNED IN THE EXPECTED SORT ORDER.  THE SUBPRO-OBIC24.2
   000200         020400*    GRAM IC220 IS CALLED TO PRODUCE THE OUTPUT REPORT FOR THE    OBIC24.2
   000201         020500*    TEST RESULTS.                                                OBIC24.2
   000202         020600*                                                                 OBIC24.2
   000203         020700*        THE RECORDS SHOULD BE RETURNED WITH THE SORT KEY ITEMS   OBIC24.2
   000204         020800*    CONTAINING THE FOLLOWING CHARACTERS                          OBIC24.2
   000205         020900*                                                                 OBIC24.2
   000206         021000*        FIRST 100 RECORDS  AAAA  00 THRU 99  000101 THRU 000200  OBIC24.2
   000207         021100*                           ABCD  00          000001              OBIC24.2
   000208         021200*        NEXT               ABCD  00          000201              OBIC24.2
   000209         021300*            200            ABCD  01          000002              OBIC24.2
   000210         021400*               RECORDS     ABCD  01          000202              OBIC24.2
   000211         021500*                            . . .            . . .               OBIC24.2
   000212         021600*                           ABCD  99          000100              OBIC24.2
   000213         021700*                           ABCD  99          000300              OBIC24.2
   000214         021800*        FOURTH 100 RECORDS UVWX  00 THRU 99  000401 THRU 000500  OBIC24.2
   000215         021900*        FIFTH 100 RECORDS  UVWY  00 THRU 99  000301 THRU 000400  OBIC24.2
   000216         022000*                                                                 OBIC24.2
   000217         022100 SORT-OUTPUT-INIT.                                                OBIC24.2
   000218         022200     MOVE 2 TO SORT-LINK.                                         OBIC24.2 124
   000219         022300     MOVE 1 TO PRINT-FLAG.                                        OBIC24.2 71
   000220         022400     CALL "OBIC3A" USING PRINT-LINE-VALUES  PRINT-FLAG.           OBIC24.2 EXT 56 71
   000221         022500     MOVE "SORT IN SUBPROGRAM" TO FEATURE-TESTED.                 OBIC24.2 59
   000222         022600     MOVE "IC-SORT-TEST" TO PARAGRAPH-NAME.                       OBIC24.2 70
   000223         022700     MOVE 0 TO R-COUNT.                                           OBIC24.2 58
   000224         022800 CHECK-OUTPUT-FROM-SORT.                                          OBIC24.2
   000225         022900     MOVE "AAAA" TO TEMP1.                                        OBIC24.2 50
   000226         023000     MOVE 0 TO TEMP3.                                             OBIC24.2 52
   000227         023100     MOVE 100 TO TEMP4.                                           OBIC24.2 53
   000228         023200     PERFORM CHECK-RECORD 100 TIMES.                              OBIC24.2 266
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000229         023300     MOVE "ABCD" TO TEMP1.                                        OBIC24.2 50
   000230         023400     MOVE 0 TO TEMP3.                                             OBIC24.2 52
   000231         023500     MOVE 0 TO TEMP4.                                             OBIC24.2 53
   000232         023600     PERFORM CHECK-ABCD-RECORDS 100 TIMES.                        OBIC24.2 277
   000233         023700     MOVE "UVWX" TO TEMP1.                                        OBIC24.2 50
   000234         023800     MOVE 0 TO TEMP3.                                             OBIC24.2 52
   000235         023900     MOVE 400 TO TEMP4.                                           OBIC24.2 53
   000236         024000     PERFORM CHECK-RECORD 100 TIMES.                              OBIC24.2 266
   000237         024100     MOVE "UVWY" TO TEMP1.                                        OBIC24.2 50
   000238         024200     MOVE 0 TO TEMP3.                                             OBIC24.2 52
   000239         024300     MOVE 300 TO TEMP4.                                           OBIC24.2 53
   000240         024400     PERFORM CHECK-RECORD 100 TIMES.                              OBIC24.2 266
   000241         024500 CHECK-RESULTS.                                                   OBIC24.2
   000242         024600     IF EOF-FLAG EQUAL TO 1                                       OBIC24.2 55
   000243      1  024700         MOVE "PREMATURE EOF" TO COMPUTED-SORT-KEY                OBIC24.2 60
   000244      1  024800         MOVE "DATA RECORD EXPECTED" TO CORRECT-SORT-KEY          OBIC24.2 65
   000245      1  024900         GO TO FAIL-WRITE.                                        OBIC24.2 256
   000246         025000     RETURN ST-FS1 AT END GO TO CHECK-FAIL-COUNT.                 OBIC24.2 40 250
   000247         025100     MOVE "NO EOF - 500 READ" TO COMPUTED-SORT-KEY.               OBIC24.2 60
   000248         025200     MOVE "EOF EXPECTED" TO CORRECT-SORT-KEY.                     OBIC24.2 65
   000249         025300     GO TO FAIL-WRITE.                                            OBIC24.2 256
   000250         025400 CHECK-FAIL-COUNT.                                                OBIC24.2
   000251         025500     IF FAIL-COUNT EQUAL TO ZERO                                  OBIC24.2 54 IMP
   000252      1  025600         MOVE "PASS " TO PASS-OR-FAIL                             OBIC24.2 57
   000253      1  025700         GO TO WRITE-RESULTS.                                     OBIC24.2 258
   000254         025800     MOVE "SORT ERRORS" TO COMPUTED-SORT-KEY.                     OBIC24.2 60
   000255         025900     MOVE SPACE TO CORRECT-SORT-KEY.                              OBIC24.2 IMP 65
   000256         026000 FAIL-WRITE.                                                      OBIC24.2
   000257         026100     MOVE "FAIL " TO PASS-OR-FAIL.                                OBIC24.2 57
   000258         026200 WRITE-RESULTS.                                                   OBIC24.2
   000259         026300     MOVE 0 TO R-COUNT.                                           OBIC24.2 58
   000260         026400     MOVE 2 TO PRINT-FLAG.                                        OBIC24.2 71
   000261         026500     CALL "OBIC3A" USING PRINT-LINE-VALUES  PRINT-FLAG.           OBIC24.2 EXT 56 71
   000262         026600 WRAPUP-OUTPUT-PROC.                                              OBIC24.2
   000263         026700     MOVE 3 TO PRINT-FLAG.                                        OBIC24.2 71
   000264         026800     CALL "OBIC3A" USING PRINT-LINE-VALUES  PRINT-FLAG.           OBIC24.2 EXT 56 71
   000265         026900     GO TO SECT-IC219-0003-EXIT.                                  OBIC24.2 305
   000266         027000 CHECK-RECORD.                                                    OBIC24.2
   000267         027100     PERFORM RETURN-RECORD THROUGH RETURN-EXIT.                   OBIC24.2 271 275
   000268         027200     ADD 1 TO TEMP4.                                              OBIC24.2 53
   000269         027300     PERFORM COMPARE-VALUES THROUGH COMPARE-EXIT.                 OBIC24.2 283 303
   000270         027400     ADD 1 TO TEMP3.                                              OBIC24.2 52
   000271         027500 RETURN-RECORD.                                                   OBIC24.2
   000272         027600     IF EOF-FLAG EQUAL TO 1                                       OBIC24.2 55
   000273      1  027700         GO TO RETURN-EXIT.                                       OBIC24.2 275
   000274         027800     RETURN ST-FS1  AT END  MOVE 1 TO EOF-FLAG.                   OBIC24.2 40 55
   000275         027900 RETURN-EXIT.                                                     OBIC24.2
   000276         028000     EXIT.                                                        OBIC24.2
   000277         028100 CHECK-ABCD-RECORDS.                                              OBIC24.2
   000278         028200     PERFORM CHECK-RECORD.                                        OBIC24.2 266
   000279         028300     SUBTRACT 1 FROM TEMP3.                                       OBIC24.2 52
   000280         028400     ADD 199 TO TEMP4.                                            OBIC24.2 53
   000281         028500     PERFORM CHECK-RECORD.                                        OBIC24.2 266
   000282         028600     SUBTRACT 200 FROM TEMP4.                                     OBIC24.2 53
   000283         028700 COMPARE-VALUES.                                                  OBIC24.2
   000284         028800     IF TEMP1 NOT EQUAL TO ST-FS1-121-124                         OBIC24.2 50 47
   000285      1  028900         GO TO SORT-FAIL.                                         OBIC24.2 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000286         029000     IF TEMP3 NOT EQUAL TO ST-FS1-125-126                         OBIC24.2 52 48
   000287      1  029100         GO TO SORT-FAIL.                                         OBIC24.2 291
   000288         029200     IF TEMP4 NOT EQUAL TO ST-FS1-REC-NO                          OBIC24.2 53 45
   000289      1  029300         GO TO SORT-FAIL.                                         OBIC24.2 291
   000290         029400     GO TO COMPARE-EXIT.                                          OBIC24.2 303
   000291         029500 SORT-FAIL.                                                       OBIC24.2
   000292         029600     MOVE "FAIL " TO PASS-OR-FAIL.                                OBIC24.2 57
   000293         029700     ADD 1 TO R-COUNT.                                            OBIC24.2 58
   000294         029800     MOVE TEMP1 TO CORRECT-1-4.                                   OBIC24.2 50 66
   000295         029900     MOVE TEMP3 TO CORRECT-5-6.                                   OBIC24.2 52 67
   000296         030000     MOVE TEMP4 TO CORRECT-7-12.                                  OBIC24.2 53 68
   000297         030100     MOVE ST-FS1-121-124 TO COMPUTED-1-4.                         OBIC24.2 47 61
   000298         030200     MOVE ST-FS1-125-126 TO COMPUTED-5-6.                         OBIC24.2 48 62
   000299         030300     MOVE ST-FS1-REC-NO TO COMPUTED-7-12.                         OBIC24.2 45 63
   000300         030400     MOVE 2 TO PRINT-FLAG.                                        OBIC24.2 71
   000301         030500     CALL "OBIC3A" USING PRINT-LINE-VALUES  PRINT-FLAG.           OBIC24.2 EXT 56 71
   000302         030600     ADD 1 TO FAIL-COUNT.                                         OBIC24.2 54
   000303         030700 COMPARE-EXIT.                                                    OBIC24.2
   000304         030800     EXIT.                                                        OBIC24.2
   000305         030900 SECT-IC219-0003-EXIT.                                            OBIC24.2
   000306         031000     EXIT.                                                        OBIC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page     9
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      119   ALTERNATE-KEY1
      121   ALTERNATE-KEY2
      106   CHARS-OR-RECORDS . . . . . . .  M180
       60   COMPUTED-SORT-KEY. . . . . . .  M243 M247 M254
       61   COMPUTED-1-4 . . . . . . . . .  M297
       62   COMPUTED-5-6 . . . . . . . . .  M298
       63   COMPUTED-7-12. . . . . . . . .  M299
       65   CORRECT-SORT-KEY . . . . . . .  M244 M248 M255
       66   CORRECT-1-4. . . . . . . . . .  M294
       67   CORRECT-5-6. . . . . . . . . .  M295
       68   CORRECT-7-12 . . . . . . . . .  M296
       55   EOF-FLAG . . . . . . . . . . .  242 272 M274
       54   FAIL-COUNT . . . . . . . . . .  251 M302
       59   FEATURE-TESTED . . . . . . . .  M221
       87   FILE-RECORD-INFO . . . . . . .  M157
       88   FILE-RECORD-INFO-P1-120. . . .  187
      115   FILE-RECORD-INFO-P121-240
       73   FILE-RECORD-INFO-SKELETON. . .  157
       72   FILE-RECORD-INFORMATION-REC
      100   ODO-NUMBER
       70   PARAGRAPH-NAME . . . . . . . .  M222
       57   PASS-OR-FAIL . . . . . . . . .  M252 M257 M292
       71   PRINT-FLAG . . . . . . . . . .  M219 220 M260 261 M263 264 M300 301
       56   PRINT-LINE-VALUES. . . . . . .  220 261 264 301
       58   R-COUNT. . . . . . . . . . . .  M223 M259 M293
      110   RECORDS-IN-FILE. . . . . . . .  M182
       94   REELUNIT-NUMBER
      124   SORT-LINK. . . . . . . . . . .  125 M156 M218
       40   ST-FS1 . . . . . . . . . . . .  36 133 246 274
       45   ST-FS1-REC-NO. . . . . . . . .  136 288 299
       43   ST-FS1-1-120 . . . . . . . . .  M187
       47   ST-FS1-121-124 . . . . . . . .  134 M188 284 297
       48   ST-FS1-125-126 . . . . . . . .  135 M189 286 298
       42   ST-FS1R1-F-G-126 . . . . . . .  190
       50   TEMP1. . . . . . . . . . . . .  M159 M162 M165 M168 M171 188 M225 M229 M233 M237 284 294
       51   TEMP2. . . . . . . . . . . . .  M160 M163 M166 M169 M172 189 M192
       52   TEMP3. . . . . . . . . . . . .  M226 M230 M234 M238 M270 M279 286 295
       53   TEMP4. . . . . . . . . . . . .  M227 M231 M235 M239 M268 M280 M282 288 296
       98   UPDATE-NUMBER
      108   XBLOCK-SIZE. . . . . . . . . .  M181
       90   XFILE-NAME . . . . . . . . . .  M176
      112   XFILE-ORGANIZATION . . . . . .  M183
      114   XLABEL-TYPE. . . . . . . . . .  M184
      102   XPROGRAM-NAME. . . . . . . . .  M178
      117   XRECORD-KEY
      104   XRECORD-LENGTH . . . . . . . .  M179
       92   XRECORD-NAME . . . . . . . . .  M177
       96   XRECORD-NUMBER . . . . . . . .  M185 M191
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page    10
0Context usage is indicated by the letter preceding a procedure-name reference.
 These letters and their meanings are:
     A = ALTER (procedure-name)
     D = GO TO (procedure-name) DEPENDING ON
     E = End of range of (PERFORM) through (procedure-name)
     G = GO TO (procedure-name)
     P = PERFORM (procedure-name)
     T = (ALTER) TO PROCEED TO (procedure-name)
     U = USE FOR DEBUGGING (procedure-name)

  Defined   Cross-reference of procedures   References

      277   CHECK-ABCD-RECORDS . . . . . .  P232
      250   CHECK-FAIL-COUNT . . . . . . .  G246
      224   CHECK-OUTPUT-FROM-SORT
      266   CHECK-RECORD . . . . . . . . .  P228 P236 P240 P278 P281
      241   CHECK-RESULTS
      303   COMPARE-EXIT . . . . . . . . .  E269 G290
      283   COMPARE-VALUES . . . . . . . .  P269
      256   FAIL-WRITE . . . . . . . . . .  G245 G249
      175   RECORD-AREA-INIT . . . . . . .  P158
      186   RELEASE-RECORD . . . . . . . .  P161 P164 P167 P170 P173
      275   RETURN-EXIT. . . . . . . . . .  E267 G273
      271   RETURN-RECORD. . . . . . . . .  P267
      126   SECT-IC219-0001
      140   SECT-IC219-0002. . . . . . . .  P137
      193   SECT-IC219-0002-EXIT . . . . .  G174
      195   SECT-IC219-0003. . . . . . . .  P138
      305   SECT-IC219-0003-EXIT . . . . .  G265
      291   SORT-FAIL. . . . . . . . . . .  G285 G287 G289
      155   SORT-INPUT-PROCEDURE
      217   SORT-OUTPUT-INIT
      132   SORT-PARAGRAPH
      262   WRAPUP-OUTPUT-PROC
      258   WRITE-RESULTS. . . . . . . . .  G253
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC2A    Date 06/04/2022  Time 11:57:41   Page    11
0 Defined   Cross-reference of programs     References

        3   OBIC2A
 EXTERNAL   OBIC3A . . . . . . . . . . . .  220 261 264 301
-* Statistics for COBOL program OBIC2A:
 *    Source records = 306
 *    Data Division statements = 47
 *    Procedure Division statements = 115
 *    Generated COBOL statements = 0
 *    Program complexity factor = 115
0End of compilation 1,  program OBIC2A,  no statements flagged.
0Return code 0
