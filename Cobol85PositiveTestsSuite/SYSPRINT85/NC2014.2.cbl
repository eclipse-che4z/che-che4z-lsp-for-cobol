1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:58   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:58   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2014.2
   000002         000200 PROGRAM-ID.                                                      NC2014.2
   000003         000300     NC201A.                                                      NC2014.2
   000004         000500*                                                              *  NC2014.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2014.2
   000006         000700*                                                              *  NC2014.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2014.2
   000008         000900*                                                              *  NC2014.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2014.2
   000010         001100*                                                              *  NC2014.2
   000011         001300*                                                              *  NC2014.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2014.2
   000013         001500*                                                              *  NC2014.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2014.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2014.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2014.2
   000017         001900*                                                              *  NC2014.2
   000018         002100*    PROGRAM NC201A TESTS FORMAT 3 AND 4 OF THE "PERFORM"         NC2014.2
   000019         002200*    STATEMENT.                                                   NC2014.2
   000020         002300*    A VARIETY OF QUALIFIED DATA-NAMES AND CONDITION-NAMES        NC2014.2
   000021         002400*    ARE USED.                                                    NC2014.2
   000022         002500*                                                                 NC2014.2
   000023         002600*                                                                 NC2014.2
   000024         002700                                                                  NC2014.2
   000025         002800 ENVIRONMENT DIVISION.                                            NC2014.2
   000026         002900 CONFIGURATION SECTION.                                           NC2014.2
   000027         003000 SOURCE-COMPUTER.                                                 NC2014.2
   000028         003100     XXXXX082.                                                    NC2014.2
   000029         003200 OBJECT-COMPUTER.                                                 NC2014.2
   000030         003300     XXXXX083.                                                    NC2014.2
   000031         003400 INPUT-OUTPUT SECTION.                                            NC2014.2
   000032         003500 FILE-CONTROL.                                                    NC2014.2
   000033         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2014.2 37
   000034         003700     XXXXX055.                                                    NC2014.2
   000035         003800 DATA DIVISION.                                                   NC2014.2
   000036         003900 FILE SECTION.                                                    NC2014.2
   000037         004000 FD  PRINT-FILE.                                                  NC2014.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004100 01  PRINT-REC PICTURE X(120).                                    NC2014.2
   000039         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2014.2
   000040         004300 WORKING-STORAGE SECTION.                                         NC2014.2
   000041         004400 01  WRK-DU-2V1-1 PIC 99V9 VALUE ZERO.                            NC2014.2 IMP
   000042         004500 01  WRK-DU-0V1-1 PIC V9 VALUE .1.                                NC2014.2
   000043         004600 01  WRK-DU-2V1-2 PIC 99V9 VALUE 0.1.                             NC2014.2
   000044         004700 01  WRK-DU-2V1-3  PIC 99V9  VALUE  11.1.                         NC2014.2
   000045         004800 01  WRK-DU-1V0-1 PIC 9 VALUE 1.                                  NC2014.2
   000046         004900 01  WRK-DU-1V0-2 PIC 9 VALUE 2.                                  NC2014.2
   000047         005000 01  WRK-DU-1V0-3 PIC 9 VALUE 3.                                  NC2014.2
   000048         005100 01  WRK-DU-1V0-4 PIC 9 VALUE ZERO.                               NC2014.2 IMP
   000049         005200 01  WRK-DU-2V0-1 PIC 99 VALUE 10.                                NC2014.2
   000050         005300 01  WRK-DU-2V0-2 PIC 99 VALUE 11.                                NC2014.2
   000051         005400 01  WRK-DU-2V0-3 PIC 99 VALUE 12.                                NC2014.2
   000052         005500 01  COUNT-DU-6V0  PIC 9(6).                                      NC2014.2
   000053         005600 77  SMALL-VALU   PICTURE 99 VALUE 7.                             NC2014.2
   000054         005700 77  SMALLER-VALU PICTURE 99 VALUE 6.                             NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 77  SMALLEST-VALU   PICTURE 99 VALUE 5.                          NC2014.2
   000056         005900 77  EVEN-SMALLER PICTURE 99 VALUE 1.                             NC2014.2
   000057         006000 77  WRK-DS-02V00                 PICTURE S99.                    NC2014.2
   000058         006100     88 TEST-2NUC-COND-99         VALUE 99.                       NC2014.2
   000059         006200 77  WRK-DS-06V06     PICTURE S9(6)V9(6).                         NC2014.2
   000060         006300 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06                        NC2014.2 59
   000061         006400                                  PICTURE S9(12).                 NC2014.2
   000062         006500 77  A02TWOS-DS-02V00             PICTURE S99    VALUE 22.        NC2014.2
   000063         006600 77  WRK-DS-01V00                 PICTURE S9.                     NC2014.2
   000064         006700 77  A02TWOS-DS-03V02             PICTURE S999V99 VALUE +022.00.  NC2014.2
   000065         006800 77  A990-DS-0201P                PICTURE S99P   VALUE 990.       NC2014.2
   000066         006900 77  A02ONES-DS-02V00             PICTURE S99    VALUE 11.        NC2014.2
   000067         007000 77  A01ONE-DS-P0801              PICTURE SP(8)9 VALUE .000000001.NC2014.2
   000068         007100 77  ATWO-DS-01V00                PICTURE S9     VALUE 2.         NC2014.2
   000069         007200 77  WRK-XN-00001                 PICTURE X.                      NC2014.2
   000070         007300 77  WRK-XN-00005                 PICTURE X(5).                   NC2014.2
   000071         007400 77  TWO  PICTURE 9 VALUE 2.                                      NC2014.2
   000072         007500 77  THREE PICTURE 9 VALUE 3.                                     NC2014.2
   000073         007600 77  SEVEN PICTURE 9 VALUE 7.                                     NC2014.2
   000074         007700 77  NINE  PICTURE 9 VALUE 9.                                     NC2014.2
   000075         007800 77  TEN  PICTURE 99 VALUE 10.                                    NC2014.2
   000076         007900 77  ALTERCOUNT PICTURE 999 VALUE ZERO.                           NC2014.2 IMP
   000077         008000 77  XRAY PICTURE IS X.                                           NC2014.2
   000078         008100 77  IF-D1 PICTURE S9(4)V9(2) VALUE 0.                            NC2014.2
   000079         008200 77  IF-D2 PICTURE S9(4)V9(2) VALUE ZERO.                         NC2014.2 IMP
   000080         008300 77  IF-D3 PICTURE X(10) VALUE "0000000000".                      NC2014.2
   000081         008400 77  IF-D4 PICTURE X(15) VALUE "               ".                 NC2014.2
   000082         008500 77  IF-D5 PICTURE X(10) VALUE ALL QUOTE.                         NC2014.2 IMP
   000083         008600 77  IF-D6 PICTURE A(10) VALUE "BABABABABA".                      NC2014.2
   000084         008700 77  IF-D7 PICTURE S9(6)V9(4) VALUE +123.45.                      NC2014.2
   000085         008800 77  IF-D8 PICTURE 9(6)V9(4) VALUE 12300.                         NC2014.2
   000086         008900 77  IF-D9 PICTURE X(3) VALUE "123".                              NC2014.2
   000087         009000 77  IF-D11 PICTURE X(6) VALUE "ABCDEF".                          NC2014.2
   000088         009100 77  IF-D13 PICTURE 9(6)V9(4) VALUE 12300.                        NC2014.2
   000089         009200 77  IF-D14 PICTURE S9(4)V9(2) VALUE +123.45.                     NC2014.2
   000090         009300 77  IF-D15 PICTURE S999PP VALUE 12300.                           NC2014.2
   000091         009400 77  IF-D16 PICTURE PP99 VALUE .0012.                             NC2014.2
   000092         009500 77  IF-D17 PICTURE SV9(4) VALUE .0012.                           NC2014.2
   000093         009600 77  IF-D18 PICTURE X(10) VALUE "BABABABABA".                     NC2014.2
   000094         009700 77  IF-D19 PICTURE X(10) VALUE "ABCDEF    ".                     NC2014.2
   000095         009800 77  IF-D23 PICTURE $9,9B9.90+.                                   NC2014.2
   000096         009900 77  IF-D24 PICTURE X(10) VALUE "$1,2 3.40+".                     NC2014.2
   000097         010000 77  IF-D25 PICTURE ABABX0A.                                      NC2014.2
   000098         010100 77  IF-D26 PICTURE X(8) VALUE "A C D0E".                         NC2014.2
   000099         010200 77  IF-D27 PICTURE IS 9(6)V9(4) VALUE IS 2137.45                 NC2014.2
   000100         010300     USAGE IS COMPUTATIONAL.                                      NC2014.2
   000101         010400 77  IF-D28 PICTURE IS 999999V9999 VALUE IS 2137.45.              NC2014.2
   000102         010500 77  IF-D31 PICTURE S9(6) VALUE -123.                             NC2014.2
   000103         010600 77  IF-D32 PICTURE S9(4)V99.                                     NC2014.2
   000104         010700     88  A  VALUE 1.                                              NC2014.2
   000105         010800     88  B VALUES ARE 2 THRU 4.                                   NC2014.2
   000106         010900     88  C VALUE IS ZERO.                                         NC2014.2 IMP
   000107         011000     88  D VALUE IS +12.34.                                       NC2014.2
   000108         011100     88  E  VALUE IS .01, .11, .21 .81.                           NC2014.2
   000109         011200     88  F  VALUE IS 100 THRU 128 1000 THRU 1280 -9 THRU -2.      NC2014.2
   000110         011300     88  G  VALUE IS 8765.43 1234 THRU 5678 5 -9999 THRU 10.      NC2014.2
   000111         011400 77  IF-D33 PICTURE X(4).                                         NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     88  B   VALUE QUOTE.                                         NC2014.2 IMP
   000113         011600     88  C   VALUE SPACE.                                         NC2014.2 IMP
   000114         011700     88 D VALUE ALL "BAC".                                        NC2014.2
   000115         011800 77  IF-D34 PICTURE A(4).                                         NC2014.2
   000116         011900     88  B VALUE "A A ".                                          NC2014.2
   000117         012000 77  IF-D37 PICTURE 9(5) VALUE 12345.                             NC2014.2
   000118         012100 77  IF-D38 PICTURE X(9) VALUE "12345    ".                       NC2014.2
   000119         012200 77  CCON-1 PICTURE 99 VALUE 11.                                  NC2014.2
   000120         012300 77  CCON-2 PICTURE 99 VALUE 12.                                  NC2014.2
   000121         012400 77  CCON-3 PICTURE 99 VALUE 13.                                  NC2014.2
   000122         012500 77  COMP-SGN1  PICTURE S9(1) VALUE +9 COMPUTATIONAL.             NC2014.2
   000123         012600 77  COMP-SGN2  PICTURE S9(18) VALUE +3 COMPUTATIONAL.            NC2014.2
   000124         012700 77  COMP-SGN3  PICTURE S9(1) VALUE -5 COMPUTATIONAL.             NC2014.2
   000125         012800 77  COMP-SGN4  PICTURE S9(18) VALUE -3167598765431 COMPUTATIONAL.NC2014.2
   000126         012900 77  START-POINT        PICTURE 9(6) COMPUTATIONAL.               NC2014.2
   000127         013000 77  INC-VALUE          PICTURE 9(6) COMPUTATIONAL.               NC2014.2
   000128         013100 77  SWITCH-PFM-1 PICTURE 9 VALUE ZERO.                           NC2014.2 IMP
   000129         013200 77  SWITCH-PFM-2 PICTURE 9 VALUE ZERO.                           NC2014.2 IMP
   000130         013300 77  PFM-11-COUNTER PICTURE 999 VALUE ZERO.                       NC2014.2 IMP
   000131         013400 77  PFM-12-COUNTER  PICTURE 999 VALUE 100.                       NC2014.2
   000132         013500 77  PFM-12-ANS1  PICTURE 999 VALUE ZERO.                         NC2014.2 IMP
   000133         013600 77  PFM-12-ANS2  PICTURE 999 VALUE ZERO.                         NC2014.2 IMP
   000134         013700 01  SUBSCRIPT-6 PICTURE 99999 VALUE ZERO.                        NC2014.2 IMP
   000135         013800 01  IF-TABLE.                                                    NC2014.2
   000136         013900     02 IF-ELEM PICTURE X OCCURS 12 TIMES.                        NC2014.2
   000137         014000 01  QUOTE-DATA.                                                  NC2014.2
   000138         014100     02 QU-1 PICTURE X(3) VALUE "123".                            NC2014.2
   000139         014200     02 QU-2 PICTURE X VALUE QUOTE.                               NC2014.2 IMP
   000140         014300     02 QU-3 PICTURE X(6) VALUE "ABC456".                         NC2014.2
   000141         014400 01  IF-D10.                                                      NC2014.2
   000142         014500     02  D1 PICTURE X(2) VALUE "01".                              NC2014.2
   000143         014600     02  D2 PICTURE X(2) VALUE "23".                              NC2014.2
   000144         014700     02  D3.                                                      NC2014.2
   000145         014800     03  D4 PICTURE X(4) VALUE "4567".                            NC2014.2
   000146         014900     03 D5 PICTURE X(4) VALUE "8912".                             NC2014.2
   000147         015000 01  IF-D12.                                                      NC2014.2
   000148         015100     02  D1 PICTURE X(3) VALUE "ABC".                             NC2014.2
   000149         015200     02  D2.                                                      NC2014.2
   000150         015300     03  D3.                                                      NC2014.2
   000151         015400     04  D4      PICTURE XX     VALUE "DE".                       NC2014.2
   000152         015500     04  D5 PICTURE X VALUE "F".                                  NC2014.2
   000153         015600 01  IF-D20.                                                      NC2014.2
   000154         015700     02  FILLER    PICTURE 9(5)   VALUE ZERO.                     NC2014.2 IMP
   000155         015800     02  D1 PICTURE 9(2) VALUE 12.                                NC2014.2
   000156         015900     02  D2 PICTURE 9 VALUE 3.                                    NC2014.2
   000157         016000     02  D3 PICTURE 9(2) VALUE 45.                                NC2014.2
   000158         016100 01  IF-D21.                                                      NC2014.2
   000159         016200     02  D1 PICTURE 9(5) VALUE ZEROS.                             NC2014.2 IMP
   000160         016300     02  D2 PICTURE 9(5) VALUE 12345.                             NC2014.2
   000161         016400 01  IF-D22.                                                      NC2014.2
   000162         016500     02  D1 PICTURE A(2) VALUE "AB".                              NC2014.2
   000163         016600     02  D2 PICTURE A(4) VALUE "CDEF".                            NC2014.2
   000164         016700 01  IF-D35.                                                      NC2014.2
   000165         016800     02  AA PICTURE X(2).                                         NC2014.2
   000166         016900     88  A1 VALUE "AA".                                           NC2014.2
   000167         017000     88  A2 VALUE "AB".                                           NC2014.2
   000168         017100     02  BB PICTURE IS X(2).                                      NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     88  B1 VALUE "CC".                                           NC2014.2
   000170         017300     88  B2 VALUE "CD".                                           NC2014.2
   000171         017400     02 BB-2 REDEFINES BB.                                        NC2014.2 168
   000172         017500     03  AAA PICTURE X.                                           NC2014.2
   000173         017600     88  AA1 VALUE "A".                                           NC2014.2
   000174         017700     88  AA2 VALUE "C".                                           NC2014.2
   000175         017800     03  BBB PICTURE X.                                           NC2014.2
   000176         017900     88  BB1    VALUE "B".                                        NC2014.2
   000177         018000     88  BB2 VALUE "D".                                           NC2014.2
   000178         018100 01  IF-D36  PICTURE X(120) VALUE IS    "ABCDEFGHIJKLMNOPQRSTUVWXYNC2014.2
   000179         018200-    "Z1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNC2014.2
   000180         018300-    "NOPQRSTUVWXYZ1234567890ABCDEFGHIJKL".                       NC2014.2
   000181         018400 01  IF-D40 PICTURE 9(5) VALUE 12345                              NC2014.2
   000182         018500              COMPUTATIONAL SYNCHRONIZED RIGHT.                   NC2014.2
   000183         018600     88 IF-D40A VALUE ZERO THRU 10000.                            NC2014.2 IMP
   000184         018700     88 IF-D40B VALUE 10001 THRU 99999.                           NC2014.2
   000185         018800     88 IF-D40C VALUE 99999.                                      NC2014.2
   000186         018900 01  PERFORM1  PICTURE XXX  VALUE SPACES.                         NC2014.2 IMP
   000187         019000 01  PERFORM2  PICTURE S999 VALUE 20.                             NC2014.2
   000188         019100 01  PERFORM3  PICTURE  9  VALUE  5.                              NC2014.2
   000189         019200 01  PERFORM4  PICTURE S99V9.                                     NC2014.2
   000190         019300 01  PERFORM5  PICTURE S99V9  VALUE 10.0.                         NC2014.2
   000191         019400 01  PERFORM6  PICTURE  99V9.                                     NC2014.2
   000192         019500 01  PERFORM7.                                                    NC2014.2
   000193         019600     02  PERFORM8  OCCURS 7 TIMES  PICTURE  99V9.                 NC2014.2
   000194         019700 01  PERFORM9  PICTURE 9   VALUE 3.                               NC2014.2
   000195         019800 01  PERFORM10  PICTURE  S9  VALUE -1.                            NC2014.2
   000196         019900 01  PERFORM11  PICTURE  99  VALUE 6.                             NC2014.2
   000197         020000 01  PERFORM12.                                                   NC2014.2
   000198         020100     02 PERFORM13  OCCURS 4 TIMES.                                NC2014.2
   000199         020200         03 PERFORM14  OCCURS 20 TIMES  PICTURE  99V9.            NC2014.2
   000200         020300         03 PERFORM15  OCCURS 10 TIMES.                           NC2014.2
   000201         020400             04 PERFORM16  OCCURS 5 TIMES  PICTURE 99V9.          NC2014.2
   000202         020500 01  PERFORM17          PICTURE 9(6) COMPUTATIONAL.               NC2014.2
   000203         020600 01  PERFORM18          PICTURE 9(6) COMPUTATIONAL.               NC2014.2
   000204         020700 01  PERFORM-KEY  PICTURE 9.                                      NC2014.2
   000205         020800 01  PERFORM-SEVEN-LEVEL-TABLE.                                   NC2014.2
   000206         020900   03   PFM71                OCCURS 2.                            NC2014.2
   000207         021000     05  PFM72               OCCURS 2.                            NC2014.2
   000208         021100       07  PFM73             OCCURS 2.                            NC2014.2
   000209         021200         09  PFM74           OCCURS 2.                            NC2014.2
   000210         021300           11  PFM75         OCCURS 2.                            NC2014.2
   000211         021400             13  PFM76       OCCURS 2.                            NC2014.2
   000212         021500               15  PFM77     OCCURS 2.                            NC2014.2
   000213         021600                 17  PFM77-1 PIC X.                               NC2014.2
   000214         021700 01  S1                      PIC S9(5) COMP.                      NC2014.2
   000215         021800 01  S2                      PIC S9(5) COMP.                      NC2014.2
   000216         021900 01  S3                      PIC S9(5) COMP.                      NC2014.2
   000217         022000 01  S4                      PIC S9(5) COMP.                      NC2014.2
   000218         022100 01  S5                      PIC S9(5) COMP.                      NC2014.2
   000219         022200 01  S6                      PIC S9(5) COMP.                      NC2014.2
   000220         022300 01  S7                      PIC S9(5) COMP.                      NC2014.2
   000221         022400 01  PFM-7-TOT               PIC S9(5) COMP.                      NC2014.2
   000222         022500 01  PFM-F4-23-TOT           PIC S9(5) COMP.                      NC2014.2
   000223         022600 01  PFM-A1                  PIC S9(5) COMP.                      NC2014.2
   000224         022700 01  PFM-B1                  PIC S9(5) COMP.                      NC2014.2
   000225         022800 01  FILLER-A.                                                    NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900   03  PFM-F4-24-A           PIC S9(3) COMP OCCURS 10.            NC2014.2
   000227         023000 01  FILLER-B.                                                    NC2014.2
   000228         023100   03  PFM-F4-24-B           PIC S9(3) COMP OCCURS 10.            NC2014.2
   000229         023200 01  FILLER-C.                                                    NC2014.2
   000230         023300   03  PFM-F4-24-C           PIC S9(3) COMP OCCURS 10.            NC2014.2
   000231         023400 01  RECEIVING-TABLE.                                             NC2014.2
   000232         023500     03 TBL-ELEMEN-A.                                             NC2014.2
   000233         023600         05 TBL-ELEMEN-B          PICTURE X(18).                  NC2014.2
   000234         023700         05 TBL-ELEMEN-C          PICTURE X(18).                  NC2014.2
   000235         023800     03  TBL-ELEMEN-D.                                            NC2014.2
   000236         023900         05 TBL-ELEMEN-E          PICTURE X OCCURS 36 TIMES.      NC2014.2
   000237         024000 01  LITERAL-SPLITTER.                                            NC2014.2
   000238         024100     02 PART1                     PICTURE X(20).                  NC2014.2
   000239         024200     02 PART2                     PICTURE X(20).                  NC2014.2
   000240         024300     02 PART3                     PICTURE X(20).                  NC2014.2
   000241         024400     02 PART4                     PICTURE X(20).                  NC2014.2
   000242         024500 01  LITERAL-TABLE REDEFINES LITERAL-SPLITTER.                    NC2014.2 237
   000243         024600     02 80PARTS                   PICTURE X      OCCURS 80 TIMES. NC2014.2
   000244         024700 01  GRP-FOR-88-LEVELS.                                           NC2014.2
   000245         024800     03 WRK-DS-02V00-COND         PICTURE 99.                     NC2014.2
   000246         024900         88 COND-1                VALUE IS 01 THRU 05.            NC2014.2
   000247         025000         88 COND-2                VALUES ARE 06 THRU 10           NC2014.2
   000248         025100                                           16 THRU 20  00.        NC2014.2
   000249         025200         88 COND-3                VALUES 11 THRU 15.              NC2014.2
   000250         025300 01  GRP-MOVE-CONSTANTS.                                          NC2014.2
   000251         025400     03 GRP-GROUP-MOVE-FROM.                                      NC2014.2
   000252         025500         04 GRP-ALPHABETIC.                                       NC2014.2
   000253         025600             05 ALPHABET-AN-00026 PICTURE A(26)                   NC2014.2
   000254         025700                        VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".       NC2014.2
   000255         025800         04 GRP-NUMERIC.                                          NC2014.2
   000256         025900             05 DIGITS-DV-10V00   PICTURE 9(10) VALUE 0123456789. NC2014.2
   000257         026000         05 DIGITS-DU-06V04-S REDEFINES DIGITS-DV-10V00           NC2014.2 256
   000258         026100                                  PICTURE 9(6)V9999.              NC2014.2
   000259         026200         04 GRP-ALPHANUMERIC.                                     NC2014.2
   000260         026300             05 ALPHANUMERIC-XN-00049 PICTURE X(50)               NC2014.2
   000261         026400     VALUE  "ABCDEFGHIJKLMNOPQRSTUVWXYZ+-><=$,;.()/* 0123456789". NC2014.2
   000262         026500             05 FILLER                PICTURE X  VALUE QUOTE.     NC2014.2 IMP
   000263         026600 01  GRP-FOR-2N058.                                               NC2014.2
   000264         026700     02 SUB-GRP-FOR-2N058-A.                                      NC2014.2
   000265         026800         03 ELEM-FOR-2N058-A PICTURE 999  VALUE ZEROES.           NC2014.2 IMP
   000266         026900         03 ELEM-FOR-2N058-B PICTURE XXX  VALUE ZEROS.            NC2014.2 IMP
   000267         027000         03 ELEM-FOR-2N058-C PICTURE XXX  VALUE SPACES.           NC2014.2 IMP
   000268         027100         03 ELEM-FOR-2N058-D PICTURE X(6) VALUE ALL "ABC".        NC2014.2
   000269         027200         03 ELEM-FOR-2N058-E PICTURE XXX  VALUE ALL "Z".          NC2014.2
   000270         027300         03 ELEM-FOR-2N058-F PICTURE XXX  VALUE ALL SPACES.       NC2014.2 IMP
   000271         027400         03 ELEM-FOR-2N058-G PICTURE XXX  VALUE ALL ZEROES.       NC2014.2 IMP
   000272         027500         03 ELEM-FOR-2N058-H PICTURE 999  VALUE ALL ZEROS.        NC2014.2 IMP
   000273         027600         03 ELEM-FOR-2N058-I PICTURE XXX  VALUE QUOTES.           NC2014.2 IMP
   000274         027700         03 ELEM-FOR-2N058-J PICTURE XXX  VALUE ALL QUOTES.       NC2014.2 IMP
   000275         027800         03 ELEM-FOR-2N058-K PICTURE XXX  VALUE ALL HIGH-VALUES.  NC2014.2 IMP
   000276         027900         03 ELEM-FOR-2N058-L PICTURE XXX  VALUE ALL LOW-VALUES.   NC2014.2 IMP
   000277         028000         03 ELEM-FOR-2N058-M PICTURE XXX  VALUE HIGH-VALUES.      NC2014.2 IMP
   000278         028100         03 ELEM-FOR-2N058-N PICTURE XXX  VALUE LOW-VALUES.       NC2014.2 IMP
   000279         028200     02 SUB-GRP-FOR-2N058-B.                                      NC2014.2
   000280         028300         03 SUB-SUB-BA.                                           NC2014.2
   000281         028400             04 ELEM-FOR-2N058-A  PICTURE 999.                    NC2014.2
   000282         028500             04 ELEM-FOR-2N058-B  PICTURE XXX.                    NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600             04 ELEM-FOR-2N058-C  PICTURE XXX.                    NC2014.2
   000284         028700             04 ELEM-FOR-2N058-D  PICTURE X(6).                   NC2014.2
   000285         028800         03 SUB-SUB-BB.                                           NC2014.2
   000286         028900             04 ELEM-FOR-2N058-E  PICTURE XXX.                    NC2014.2
   000287         029000             04 ELEM-FOR-2N058-F  PICTURE XXX.                    NC2014.2
   000288         029100             04 ELEM-FOR-2N058-G  PICTURE XXX.                    NC2014.2
   000289         029200             04 ELEM-FOR-2N058-H  PICTURE 999.                    NC2014.2
   000290         029300         03 SUB-SUB-BC.                                           NC2014.2
   000291         029400             04 ELEM-FOR-2N058-I  PICTURE XXX.                    NC2014.2
   000292         029500             04 ELEM-FOR-2N058-J  PICTURE XXX.                    NC2014.2
   000293         029600             04 ELEM-FOR-2N058-K  PICTURE XXX.                    NC2014.2
   000294         029700             04 ELEM-FOR-2N058-L  PICTURE XXX.                    NC2014.2
   000295         029800             04 ELEM-FOR-2N058-M  PICTURE XXX.                    NC2014.2
   000296         029900             04 ELEM-FOR-2N058-N  PICTURE XXX.                    NC2014.2
   000297         030000 01  CHARACTER-BREAKDOWN-S.                                       NC2014.2
   000298         030100     02   FIRST-20S PICTURE X(20).                                NC2014.2
   000299         030200     02  SECOND-20S PICTURE X(20).                                NC2014.2
   000300         030300     02   THIRD-20S PICTURE X(20).                                NC2014.2
   000301         030400     02  FOURTH-20S PICTURE X(20).                                NC2014.2
   000302         030500     02   FIFTH-20S PICTURE X(20).                                NC2014.2
   000303         030600     02   SIXTH-20S PICTURE X(20).                                NC2014.2
   000304         030700     02 SEVENTH-20S PICTURE X(20).                                NC2014.2
   000305         030800     02  EIGHTH-20S PICTURE X(20).                                NC2014.2
   000306         030900     02   NINTH-20S PICTURE X(20).                                NC2014.2
   000307         031000     02   TENTH-20S PICTURE X(20).                                NC2014.2
   000308         031100 01  CHARACTER-BREAKDOWN-R.                                       NC2014.2
   000309         031200     02   FIRST-20R PICTURE X(20).                                NC2014.2
   000310         031300     02  SECOND-20R PICTURE X(20).                                NC2014.2
   000311         031400     02   THIRD-20R PICTURE X(20).                                NC2014.2
   000312         031500     02  FOURTH-20R PICTURE X(20).                                NC2014.2
   000313         031600     02   FIFTH-20R PICTURE X(20).                                NC2014.2
   000314         031700     02   SIXTH-20R PICTURE X(20).                                NC2014.2
   000315         031800     02 SEVENTH-20R PICTURE X(20).                                NC2014.2
   000316         031900     02  EIGHTH-20R PICTURE X(20).                                NC2014.2
   000317         032000     02   NINTH-20R PICTURE X(20).                                NC2014.2
   000318         032100     02   TENTH-20R PICTURE X(20).                                NC2014.2
   000319         032200 01  TABLE-80.                                                    NC2014.2
   000320         032300     02  ELMT OCCURS 3 TIMES PIC 9.                               NC2014.2
   000321         032400     88  A80  VALUES ARE ZERO THRU 7.                             NC2014.2 IMP
   000322         032500     88  B80  VALUE 8.                                            NC2014.2
   000323         032600     88  C80  VALUES ARE 7, 8 THROUGH 9.                          NC2014.2
   000324         032700                                                                  NC2014.2
   000325         032800 01  TABLE-86.                                                    NC2014.2
   000326         032900     88  A86  VALUE "ABC".                                        NC2014.2
   000327         033000     88  B86  VALUE "ABCABC".                                     NC2014.2
   000328         033100     88  C86  VALUE "   ABC".                                     NC2014.2
   000329         033200     02  DATANAME-86  PIC XXX  VALUE "ABC".                       NC2014.2
   000330         033300     02  DNAME-86.                                                NC2014.2
   000331         033400         03  FILLER  PIC X  VALUE "A".                            NC2014.2
   000332         033500         03  FILLER  PIC X  VALUE "B".                            NC2014.2
   000333         033600         03  FILLER  PIC X   VALUE "C".                           NC2014.2
   000334         033700 01  FIGCON-DATA.                                                 NC2014.2
   000335         033800     02 SPACE-X         PICTURE X(10) VALUE "          ".         NC2014.2
   000336         033900     02 QUOTE-X         PICTURE X(5)  VALUE QUOTE.                NC2014.2 IMP
   000337         034000     02 LOW-VAL         PICTURE X(5)  VALUE LOW-VALUE.            NC2014.2 IMP
   000338         034100     02 ABC PICTURE XXX VALUE "ABC".                              NC2014.2
   000339         034200     02 ONE23           PICTURE 9999  VALUE 123.                  NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     02 ZERO-C          PICTURE 9(10) VALUE 0 COMPUTATIONAL.      NC2014.2
   000341         034400     02 ZERO-D          PICTURE 9     VALUE ZERO USAGE DISPLAY.   NC2014.2 IMP
   000342         034500 01  TEST-RESULTS.                                                NC2014.2
   000343         034600     02 FILLER                   PIC X      VALUE SPACE.          NC2014.2 IMP
   000344         034700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2014.2 IMP
   000345         034800     02 FILLER                   PIC X      VALUE SPACE.          NC2014.2 IMP
   000346         034900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2014.2 IMP
   000347         035000     02 FILLER                   PIC X      VALUE SPACE.          NC2014.2 IMP
   000348         035100     02  PAR-NAME.                                                NC2014.2
   000349         035200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2014.2 IMP
   000350         035300       03  PARDOT-X              PIC X      VALUE SPACE.          NC2014.2 IMP
   000351         035400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2014.2 IMP
   000352         035500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2014.2 IMP
   000353         035600     02 RE-MARK                  PIC X(61).                       NC2014.2
   000354         035700 01  TEST-COMPUTED.                                               NC2014.2
   000355         035800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2014.2 IMP
   000356         035900     02 FILLER                   PIC X(17)  VALUE                 NC2014.2
   000357         036000            "       COMPUTED=".                                   NC2014.2
   000358         036100     02 COMPUTED-X.                                               NC2014.2
   000359         036200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2014.2 IMP
   000360         036300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2014.2 359
   000361         036400                                 PIC -9(9).9(9).                  NC2014.2
   000362         036500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2014.2 359
   000363         036600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2014.2 359
   000364         036700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2014.2 359
   000365         036800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2014.2 359
   000366         036900         04 COMPUTED-18V0                    PIC -9(18).          NC2014.2
   000367         037000         04 FILLER                           PIC X.               NC2014.2
   000368         037100     03 FILLER PIC X(50) VALUE SPACE.                             NC2014.2 IMP
   000369         037200 01  TEST-CORRECT.                                                NC2014.2
   000370         037300     02 FILLER PIC X(30) VALUE SPACE.                             NC2014.2 IMP
   000371         037400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2014.2
   000372         037500     02 CORRECT-X.                                                NC2014.2
   000373         037600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2014.2 IMP
   000374         037700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2014.2 373
   000375         037800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2014.2 373
   000376         037900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2014.2 373
   000377         038000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2014.2 373
   000378         038100     03      CR-18V0 REDEFINES CORRECT-A.                         NC2014.2 373
   000379         038200         04 CORRECT-18V0                     PIC -9(18).          NC2014.2
   000380         038300         04 FILLER                           PIC X.               NC2014.2
   000381         038400     03 FILLER PIC X(2) VALUE SPACE.                              NC2014.2 IMP
   000382         038500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2014.2 IMP
   000383         038600 01  CCVS-C-1.                                                    NC2014.2
   000384         038700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2014.2
   000385         038800-    "SS  PARAGRAPH-NAME                                          NC2014.2
   000386         038900-    "       REMARKS".                                            NC2014.2
   000387         039000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2014.2 IMP
   000388         039100 01  CCVS-C-2.                                                    NC2014.2
   000389         039200     02 FILLER                     PIC X        VALUE SPACE.      NC2014.2 IMP
   000390         039300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2014.2
   000391         039400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2014.2 IMP
   000392         039500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2014.2
   000393         039600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2014.2 IMP
   000394         039700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2014.2 IMP
   000395         039800 01  REC-CT                        PIC 99       VALUE ZERO.       NC2014.2 IMP
   000396         039900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2014.2 IMP
   000398         040100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2014.2 IMP
   000399         040200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2014.2 IMP
   000400         040300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2014.2 IMP
   000401         040400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2014.2 IMP
   000402         040500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2014.2 IMP
   000403         040600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2014.2 IMP
   000404         040700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2014.2 IMP
   000405         040800 01  CCVS-H-1.                                                    NC2014.2
   000406         040900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2014.2 IMP
   000407         041000     02  FILLER                    PIC X(42)    VALUE             NC2014.2
   000408         041100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2014.2
   000409         041200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2014.2 IMP
   000410         041300 01  CCVS-H-2A.                                                   NC2014.2
   000411         041400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2014.2 IMP
   000412         041500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2014.2
   000413         041600   02  FILLER                        PIC XXXX   VALUE             NC2014.2
   000414         041700     "4.2 ".                                                      NC2014.2
   000415         041800   02  FILLER                        PIC X(28)  VALUE             NC2014.2
   000416         041900            " COPY - NOT FOR DISTRIBUTION".                       NC2014.2
   000417         042000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2014.2 IMP
   000418         042100                                                                  NC2014.2
   000419         042200 01  CCVS-H-2B.                                                   NC2014.2
   000420         042300   02  FILLER                        PIC X(15)  VALUE             NC2014.2
   000421         042400            "TEST RESULT OF ".                                    NC2014.2
   000422         042500   02  TEST-ID                       PIC X(9).                    NC2014.2
   000423         042600   02  FILLER                        PIC X(4)   VALUE             NC2014.2
   000424         042700            " IN ".                                               NC2014.2
   000425         042800   02  FILLER                        PIC X(12)  VALUE             NC2014.2
   000426         042900     " HIGH       ".                                              NC2014.2
   000427         043000   02  FILLER                        PIC X(22)  VALUE             NC2014.2
   000428         043100            " LEVEL VALIDATION FOR ".                             NC2014.2
   000429         043200   02  FILLER                        PIC X(58)  VALUE             NC2014.2
   000430         043300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2014.2
   000431         043400 01  CCVS-H-3.                                                    NC2014.2
   000432         043500     02  FILLER                      PIC X(34)  VALUE             NC2014.2
   000433         043600            " FOR OFFICIAL USE ONLY    ".                         NC2014.2
   000434         043700     02  FILLER                      PIC X(58)  VALUE             NC2014.2
   000435         043800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2014.2
   000436         043900     02  FILLER                      PIC X(28)  VALUE             NC2014.2
   000437         044000            "  COPYRIGHT   1985 ".                                NC2014.2
   000438         044100 01  CCVS-E-1.                                                    NC2014.2
   000439         044200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2014.2 IMP
   000440         044300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2014.2
   000441         044400     02 ID-AGAIN                     PIC X(9).                    NC2014.2
   000442         044500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2014.2 IMP
   000443         044600 01  CCVS-E-2.                                                    NC2014.2
   000444         044700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2014.2 IMP
   000445         044800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2014.2 IMP
   000446         044900     02 CCVS-E-2-2.                                               NC2014.2
   000447         045000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2014.2 IMP
   000448         045100         03 FILLER                   PIC X      VALUE SPACE.      NC2014.2 IMP
   000449         045200         03 ENDER-DESC               PIC X(44)  VALUE             NC2014.2
   000450         045300            "ERRORS ENCOUNTERED".                                 NC2014.2
   000451         045400 01  CCVS-E-3.                                                    NC2014.2
   000452         045500     02  FILLER                      PIC X(22)  VALUE             NC2014.2
   000453         045600            " FOR OFFICIAL USE ONLY".                             NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2014.2 IMP
   000455         045800     02  FILLER                      PIC X(58)  VALUE             NC2014.2
   000456         045900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2014.2
   000457         046000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2014.2 IMP
   000458         046100     02 FILLER                       PIC X(15)  VALUE             NC2014.2
   000459         046200             " COPYRIGHT 1985".                                   NC2014.2
   000460         046300 01  CCVS-E-4.                                                    NC2014.2
   000461         046400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2014.2 IMP
   000462         046500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2014.2
   000463         046600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2014.2 IMP
   000464         046700     02 FILLER                       PIC X(40)  VALUE             NC2014.2
   000465         046800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2014.2
   000466         046900 01  XXINFO.                                                      NC2014.2
   000467         047000     02 FILLER                       PIC X(19)  VALUE             NC2014.2
   000468         047100            "*** INFORMATION ***".                                NC2014.2
   000469         047200     02 INFO-TEXT.                                                NC2014.2
   000470         047300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2014.2 IMP
   000471         047400       04 XXCOMPUTED                 PIC X(20).                   NC2014.2
   000472         047500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2014.2 IMP
   000473         047600       04 XXCORRECT                  PIC X(20).                   NC2014.2
   000474         047700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2014.2
   000475         047800 01  HYPHEN-LINE.                                                 NC2014.2
   000476         047900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2014.2 IMP
   000477         048000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2014.2
   000478         048100-    "*****************************************".                 NC2014.2
   000479         048200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2014.2
   000480         048300-    "******************************".                            NC2014.2
   000481         048400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2014.2
   000482         048500     "NC201A".                                                    NC2014.2
   000483         048600 PROCEDURE DIVISION.                                              NC2014.2
   000484         048700 CCVS1 SECTION.                                                   NC2014.2
   000485         048800 OPEN-FILES.                                                      NC2014.2
   000486         048900     OPEN     OUTPUT PRINT-FILE.                                  NC2014.2 37
   000487         049000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2014.2 481 422 481 441
   000488         049100     MOVE    SPACE TO TEST-RESULTS.                               NC2014.2 IMP 342
   000489         049200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2014.2 514 519
   000490         049300     GO TO CCVS1-EXIT.                                            NC2014.2 596
   000491         049400 CLOSE-FILES.                                                     NC2014.2
   000492         049500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2014.2 523 544 37
   000493         049600 TERMINATE-CCVS.                                                  NC2014.2
   000494         049700     EXIT PROGRAM.                                                NC2014.2
   000495         049800 TERMINATE-CALL.                                                  NC2014.2
   000496         049900     STOP     RUN.                                                NC2014.2
   000497         050000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2014.2 346 398
   000498         050100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2014.2 346 399
   000499         050200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2014.2 346 397
   000500         050300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2014.2 346 396
   000501         050400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2014.2 353
   000502         050500 PRINT-DETAIL.                                                    NC2014.2
   000503         050600     IF REC-CT NOT EQUAL TO ZERO                                  NC2014.2 395 IMP
   000504      1  050700             MOVE "." TO PARDOT-X                                 NC2014.2 350
   000505      1  050800             MOVE REC-CT TO DOTVALUE.                             NC2014.2 395 351
   000506         050900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2014.2 342 38 556
   000507         051000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2014.2 346 556
   000508      1  051100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2014.2 573 586
   000509      1  051200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2014.2 587 595
   000510         051300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2014.2 IMP 346 IMP 358
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE SPACE TO CORRECT-X.                                     NC2014.2 IMP 372
   000512         051500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2014.2 395 IMP IMP 348
   000513         051600     MOVE     SPACE TO RE-MARK.                                   NC2014.2 IMP 353
   000514         051700 HEAD-ROUTINE.                                                    NC2014.2
   000515         051800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2014.2 405 39 556
   000516         051900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2014.2 410 39 556
   000517         052000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2014.2 419 39 556
   000518         052100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2014.2 431 39 556
   000519         052200 COLUMN-NAMES-ROUTINE.                                            NC2014.2
   000520         052300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2014.2 383 39 556
   000521         052400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2014.2 388 39 556
   000522         052500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2014.2 475 39 556
   000523         052600 END-ROUTINE.                                                     NC2014.2
   000524         052700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2014.2 475 39 556
   000525         052800 END-RTN-EXIT.                                                    NC2014.2
   000526         052900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2014.2 438 39 556
   000527         053000 END-ROUTINE-1.                                                   NC2014.2
   000528         053100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2014.2 397 401 398
   000529         053200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2014.2 401 396 401
   000530         053300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2014.2 399 401
   000531         053400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2014.2
   000532         053500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2014.2 399 461
   000533         053600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2014.2 401 463
   000534         053700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2014.2 460 446
   000535         053800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2014.2 443 39 556
   000536         053900  END-ROUTINE-12.                                                 NC2014.2
   000537         054000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2014.2 449
   000538         054100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2014.2 397 IMP
   000539      1  054200         MOVE "NO " TO ERROR-TOTAL                                NC2014.2 447
   000540         054300         ELSE                                                     NC2014.2
   000541      1  054400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2014.2 397 447
   000542         054500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2014.2 443 39
   000543         054600     PERFORM WRITE-LINE.                                          NC2014.2 556
   000544         054700 END-ROUTINE-13.                                                  NC2014.2
   000545         054800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2014.2 396 IMP
   000546      1  054900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2014.2 447
   000547      1  055000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2014.2 396 447
   000548         055100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2014.2 449
   000549         055200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2014.2 443 39 556
   000550         055300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2014.2 398 IMP
   000551      1  055400          MOVE "NO " TO ERROR-TOTAL                               NC2014.2 447
   000552      1  055500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2014.2 398 447
   000553         055600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2014.2 449
   000554         055700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2014.2 443 39 556
   000555         055800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2014.2 451 39 556
   000556         055900 WRITE-LINE.                                                      NC2014.2
   000557         056000     ADD 1 TO RECORD-COUNT.                                       NC2014.2 403
   000558         056100     IF RECORD-COUNT GREATER 50                                   NC2014.2 403
   000559      1  056200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2014.2 39 402
   000560      1  056300         MOVE SPACE TO DUMMY-RECORD                               NC2014.2 IMP 39
   000561      1  056400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2014.2 39
   000562      1  056500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2014.2 383 39 568
   000563      1  056600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2014.2 388 39 568
   000564      1  056700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2014.2 475 39 568
   000565      1  056800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2014.2 402 39
   000566      1  056900         MOVE ZERO TO RECORD-COUNT.                               NC2014.2 IMP 403
   000567         057000     PERFORM WRT-LN.                                              NC2014.2 568
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100 WRT-LN.                                                          NC2014.2
   000569         057200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2014.2 39
   000570         057300     MOVE SPACE TO DUMMY-RECORD.                                  NC2014.2 IMP 39
   000571         057400 BLANK-LINE-PRINT.                                                NC2014.2
   000572         057500     PERFORM WRT-LN.                                              NC2014.2 568
   000573         057600 FAIL-ROUTINE.                                                    NC2014.2
   000574         057700     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2014.2 358 IMP 581
   000575         057800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2014.2 372 IMP 581
   000576         057900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2014.2 404 474
   000577         058000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2014.2 469
   000578         058100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2014.2 466 39 556
   000579         058200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2014.2 IMP 474
   000580         058300     GO TO  FAIL-ROUTINE-EX.                                      NC2014.2 586
   000581         058400 FAIL-ROUTINE-WRITE.                                              NC2014.2
   000582         058500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2014.2 354 38 556
   000583         058600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2014.2 404 382
   000584         058700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2014.2 369 38 556
   000585         058800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2014.2 IMP 382
   000586         058900 FAIL-ROUTINE-EX. EXIT.                                           NC2014.2
   000587         059000 BAIL-OUT.                                                        NC2014.2
   000588         059100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2014.2 359 IMP 590
   000589         059200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2014.2 373 IMP 595
   000590         059300 BAIL-OUT-WRITE.                                                  NC2014.2
   000591         059400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2014.2 373 473 359 471
   000592         059500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2014.2 404 474
   000593         059600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2014.2 466 39 556
   000594         059700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2014.2 IMP 474
   000595         059800 BAIL-OUT-EX. EXIT.                                               NC2014.2
   000596         059900 CCVS1-EXIT.                                                      NC2014.2
   000597         060000     EXIT.                                                        NC2014.2
   000598         060100 SECT-NC201A-001 SECTION.                                         NC2014.2
   000599         060200 PFM-INIT-F3-1.                                                   NC2014.2
   000600         060300     MOVE "PFM-TEST-F3-1" TO PAR-NAME.                            NC2014.2 348
   000601         060400     MOVE   "VI-112 6.20.4 GR10(d)" TO ANSI-REFERENCE.            NC2014.2 404
   000602         060500     MOVE "PERFORM UNTIL" TO FEATURE.                             NC2014.2 344
   000603         060600     MOVE 1 TO PERFORM2.                                          NC2014.2 187
   000604         060700 PFM-TEST-F3-0.                                                   NC2014.2
   000605         060800     PERFORM  PFM-A THRU PFM-AA UNTIL PERFORM2 EQUAL TO 48.       NC2014.2 861 863 187
   000606         060900*    NOTE IN THIS TEST THE CONDITION IS NOT SATISFIED             NC2014.2
   000607         061000*    ORIGINALLY WHEN THE PERFORM IS ENTERED.                      NC2014.2
   000608         061100 PFM-TEST-F3-1.                                                   NC2014.2
   000609         061200     IF PERFORM2 EQUAL TO 48 PERFORM PASS                         NC2014.2 187 498
   000610      1  061300                             GO TO PFM-WRITE-F3-1.                NC2014.2 619
   000611         061400     GO TO PFM-FAIL-F3-1.                                         NC2014.2 615
   000612         061500 PFM-DELETE-F3-1.                                                 NC2014.2
   000613         061600     PERFORM DE-LETE.                                             NC2014.2 500
   000614         061700     GO TO PFM-WRITE-F3-1.                                        NC2014.2 619
   000615         061800 PFM-FAIL-F3-1.                                                   NC2014.2
   000616         061900     MOVE PERFORM2 TO COMPUTED-N.                                 NC2014.2 187 360
   000617         062000     MOVE 48 TO CORRECT-N.                                        NC2014.2 374
   000618         062100     PERFORM FAIL.                                                NC2014.2 499
   000619         062200 PFM-WRITE-F3-1.                                                  NC2014.2
   000620         062300     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000621         062400*                                                                 NC2014.2
   000622         062500 PFM-INIT-F3-2.                                                   NC2014.2
   000623         062600     MOVE "PFM-TEST-F3-2" TO PAR-NAME.                            NC2014.2 348
   000624         062700     MOVE 50 TO PERFORM2.                                         NC2014.2 187
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800*    NOTE IN THIS TEST CONDITION IS SATISFIED WHEN PERFORM IS     NC2014.2
   000626         062900*    ENTERED AND CONTROL SHOULD NOT BE PASSED TO PFM-C.           NC2014.2
   000627         063000 PFM-TEST-F3-2.                                                   NC2014.2
   000628         063100     PERFORM PFM-C UNTIL PERFORM2 GREATER THAN 25.                NC2014.2 871 187
   000629         063200     IF PERFORM2 EQUAL TO 50 PERFORM PASS                         NC2014.2 187 498
   000630      1  063300                             GO TO PFM-WRITE-F3-2.                NC2014.2 639
   000631         063400     GO TO PFM-FAIL-F3-2.                                         NC2014.2 635
   000632         063500 PFM-DELETE-F3-2.                                                 NC2014.2
   000633         063600     PERFORM DE-LETE.                                             NC2014.2 500
   000634         063700     GO TO PFM-WRITE-F3-2.                                        NC2014.2 639
   000635         063800 PFM-FAIL-F3-2.                                                   NC2014.2
   000636         063900     MOVE PERFORM2 TO COMPUTED-N.                                 NC2014.2 187 360
   000637         064000     MOVE 50 TO CORRECT-N.                                        NC2014.2 374
   000638         064100     PERFORM FAIL.                                                NC2014.2 499
   000639         064200 PFM-WRITE-F3-2.                                                  NC2014.2
   000640         064300     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000641         064400*                                                                 NC2014.2
   000642         064500 PFM-INIT-F4-1.                                                   NC2014.2
   000643         064600     MOVE "PFM-TEST-F4-1" TO PAR-NAME.                            NC2014.2 348
   000644         064700     MOVE "PERFORM VARYING" TO FEATURE.                           NC2014.2 344
   000645         064800 PFM-TEST-F4-1.                                                   NC2014.2
   000646         064900     PERFORM PFM-E VARYING PERFORM4 FROM PERFORM5 BY -0.2         NC2014.2 879 189 190
   000647         065000         UNTIL PERFORM4 LESS THAN 9.0.                            NC2014.2 189
   000648         065100     IF PERFORM4 EQUAL TO 8.8 AND PERFORM6 EQUAL TO 12.5          NC2014.2 189 191
   000649      1  065200               PERFORM PASS                                       NC2014.2 498
   000650      1  065300               GO TO PFM-WRITE-F4-1.                              NC2014.2 663
   000651         065400     GO TO PFM-FAIL-F4-1.                                         NC2014.2 655
   000652         065500 PFM-DELETE-F4-1.                                                 NC2014.2
   000653         065600     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000654         065700     GO TO PFM-WRITE-F4-1.                                        NC2014.2 663
   000655         065800 PFM-FAIL-F4-1.                                                   NC2014.2
   000656         065900     MOVE PERFORM4 TO COMPUTED-N.                                 NC2014.2 189 360
   000657         066000     MOVE 8.8 TO CORRECT-N.                                       NC2014.2 374
   000658         066100     PERFORM FAIL.                                                NC2014.2 499
   000659         066200     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000660         066300     MOVE SPACE TO P-OR-F.                                        NC2014.2 IMP 346
   000661         066400     MOVE PERFORM6 TO COMPUTED-N.                                 NC2014.2 191 360
   000662         066500     MOVE 12.5 TO CORRECT-N.                                      NC2014.2 374
   000663         066600 PFM-WRITE-F4-1.                                                  NC2014.2
   000664         066700     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000665         066800*                                                                 NC2014.2
   000666         066900 PFM-INIT-F4-2.                                                   NC2014.2
   000667         067000     MOVE "PFM-TEST-F4-2" TO PAR-NAME.                            NC2014.2 348
   000668         067100     MOVE 5.5 TO PERFORM4.                                        NC2014.2 189
   000669         067200     MOVE 5.5 TO PERFORM8 (7).                                    NC2014.2 193
   000670         067300 PFM-TEST-F4-2.                                                   NC2014.2
   000671         067400*    NOTE IN THIS TEST ONE SUBSCRIPT IS VARIED.                   NC2014.2
   000672         067500*    NOTE  THIS ALSO TESTS THAT WHEN THE CONDITION IS TRUE,       NC2014.2
   000673         067600*    CONTROL FALLS THRU AND THE PROCEDURE IS NOT EXECUTED.        NC2014.2
   000674         067700     PERFORM PFM-G VARYING PERFORM3 FROM 1 BY 2 UNTIL             NC2014.2 887 188
   000675         067800     PERFORM3 GREATER THAN 5.                                     NC2014.2 188
   000676         067900     IF PERFORM8 (1) EQUAL TO 13.5 AND PERFORM8 (3) EQUAL TO 13.8 NC2014.2 193 193
   000677         068000     AND PERFORM8 (5) EQUAL TO 14.1 AND PERFORM8 (7) EQUAL TO     NC2014.2 193 193
   000678         068100     5.5 AND PERFORM3 EQUAL TO 7                                  NC2014.2 188
   000679      1  068200               PERFORM PASS                                       NC2014.2 498
   000680      1  068300               GO TO PFM-WRITE-F4-2.                              NC2014.2 709
   000681         068400*    NOTE THE OCCURS CLAUSE IS NEEDED IN THE DATA DESCRIPTION     NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500*        FOR THESE PERFORM TESTS --- MORE EXHAUSTIVE TESTS OF THE NC2014.2
   000683         068600*        OCCURS CLAUSE CAN BE FOUND IN THE TABLE HANDLING TESTS.  NC2014.2
   000684         068700     GO TO PFM-FAIL-F4-2.                                         NC2014.2 688
   000685         068800 PFM-DELETE-F4-2.                                                 NC2014.2
   000686         068900     PERFORM DE-LETE.                                             NC2014.2 500
   000687         069000     GO TO PFM-WRITE-F4-2.                                        NC2014.2 709
   000688         069100 PFM-FAIL-F4-2.                                                   NC2014.2
   000689         069200     MOVE PERFORM8 (1) TO COMPUTED-N.                             NC2014.2 193 360
   000690         069300     MOVE 13.5 TO CORRECT-N.                                      NC2014.2 374
   000691         069400     PERFORM FAIL.                                                NC2014.2 499
   000692         069500     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000693         069600     MOVE SPACE TO P-OR-F.                                        NC2014.2 IMP 346
   000694         069700     MOVE PERFORM8 (3) TO COMPUTED-N.                             NC2014.2 193 360
   000695         069800     MOVE 13.8 TO CORRECT-N.                                      NC2014.2 374
   000696         069900     MOVE "PFM-TEST-F4-2" TO PAR-NAME.                            NC2014.2 348
   000697         070000     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000698         070100     MOVE PERFORM8 (5) TO COMPUTED-N.                             NC2014.2 193 360
   000699         070200     MOVE 14.1 TO CORRECT-N.                                      NC2014.2 374
   000700         070300     MOVE "PFM-TEST-F4-2" TO PAR-NAME.                            NC2014.2 348
   000701         070400     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000702         070500     MOVE PERFORM8 (7) TO COMPUTED-N.                             NC2014.2 193 360
   000703         070600     MOVE  5.5 TO CORRECT-N.                                      NC2014.2 374
   000704         070700     MOVE "PFM-TEST-F4-2" TO PAR-NAME.                            NC2014.2 348
   000705         070800     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000706         070900     MOVE PERFORM3 TO COMPUTED-N.                                 NC2014.2 188 360
   000707         071000     MOVE 7 TO CORRECT-N.                                         NC2014.2 374
   000708         071100     MOVE "PFM-TEST-F4-2" TO PAR-NAME.                            NC2014.2 348
   000709         071200 PFM-WRITE-F4-2.                                                  NC2014.2
   000710         071300     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000711         071400*                                                                 NC2014.2
   000712         071500 PFM-INIT-F4-3.                                                   NC2014.2
   000713         071600     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000714         071700     MOVE 1.5 TO PERFORM4.                                        NC2014.2 189
   000715         071800 PFM-TEST-F4-3.                                                   NC2014.2
   000716         071900*    NOTE IN THIS TEST TWO SUBSCRIPTS ARE VARIED.                 NC2014.2
   000717         072000     PERFORM PFM-I THRU PFM-J VARYING PERFORM3                    NC2014.2 896 899 188
   000718         072100     FROM PERFORM9 BY PERFORM10 UNTIL PERFORM3 EQUAL TO 1         NC2014.2 194 195 188
   000719         072200     AFTER PERFORM2 FROM 2 BY PERFORM11 UNTIL PERFORM2            NC2014.2 187 196 187
   000720         072300     GREATER THAN 20.                                             NC2014.2
   000721         072400     IF PERFORM14 (3, 2) EQUAL TO 15.0 AND PERFORM14 (3, 8)       NC2014.2 199 199
   000722         072500     EQUAL TO 20.0 AND PERFORM14 (3, 14) EQUAL TO 25.0            NC2014.2 199
   000723         072600     AND PERFORM14 (3, 20) EQUAL TO 30.0 AND PERFORM14 (2, 2)     NC2014.2 199 199
   000724      1  072700     EQUAL TO 35.0 MOVE "A" TO XRAY.                              NC2014.2 77
   000725         072800     IF PERFORM14 (2, 8) EQUAL TO 40.0 AND                        NC2014.2 199
   000726         072900     PERFORM14 (2, 14) EQUAL TO 45.0 AND PERFORM14 (2, 20)        NC2014.2 199 199
   000727         073000     EQUAL TO 50.0 AND PERFORM2 EQUAL TO 2 AND PERFORM3           NC2014.2 187 188
   000728      1  073100     EQUAL TO 1 AND XRAY EQUAL TO "A" PERFORM PASS                NC2014.2 77 498
   000729      1  073200         GO TO PFM-WRITE-F4-3.                                    NC2014.2 779
   000730         073300     GO TO PFM-FAIL-F4-3.                                         NC2014.2 734
   000731         073400 PFM-DELETE-F4-3.                                                 NC2014.2
   000732         073500     PERFORM DE-LETE.                                             NC2014.2 500
   000733         073600     GO TO PFM-WRITE-F4-3.                                        NC2014.2 779
   000734         073700 PFM-FAIL-F4-3.                                                   NC2014.2
   000735         073800     MOVE PERFORM14 (3,  2) TO COMPUTED-N.                        NC2014.2 199 360
   000736         073900     MOVE 15.0 TO CORRECT-N.                                      NC2014.2 374
   000737         074000     PERFORM FAIL.                                                NC2014.2 499
   000738         074100     PERFORM PRINT-DETAIL.                                        NC2014.2 502
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     MOVE SPACE TO P-OR-F.                                        NC2014.2 IMP 346
   000740         074300     MOVE PERFORM14 (3,  8) TO COMPUTED-N.                        NC2014.2 199 360
   000741         074400     MOVE 20.0 TO CORRECT-N.                                      NC2014.2 374
   000742         074500     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000743         074600     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000744         074700     MOVE PERFORM14 (3, 14) TO COMPUTED-N.                        NC2014.2 199 360
   000745         074800     MOVE 25.0 TO CORRECT-N.                                      NC2014.2 374
   000746         074900     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000747         075000     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000748         075100     MOVE PERFORM14 (3, 20) TO COMPUTED-N.                        NC2014.2 199 360
   000749         075200     MOVE 30.0 TO CORRECT-N.                                      NC2014.2 374
   000750         075300     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000751         075400     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000752         075500     MOVE PERFORM14 (2,  2) TO COMPUTED-N.                        NC2014.2 199 360
   000753         075600     MOVE 35.0 TO CORRECT-N.                                      NC2014.2 374
   000754         075700     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000755         075800     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000756         075900     MOVE PERFORM14 (2,  8) TO COMPUTED-N.                        NC2014.2 199 360
   000757         076000     MOVE 40.0 TO CORRECT-N.                                      NC2014.2 374
   000758         076100     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000759         076200     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000760         076300     MOVE PERFORM14 (2, 14) TO COMPUTED-N.                        NC2014.2 199 360
   000761         076400     MOVE 45.0 TO CORRECT-N.                                      NC2014.2 374
   000762         076500     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000763         076600     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000764         076700     MOVE PERFORM14 (2, 20) TO COMPUTED-N.                        NC2014.2 199 360
   000765         076800     MOVE 50.0 TO CORRECT-N.                                      NC2014.2 374
   000766         076900     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000767         077000     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000768         077100     MOVE PERFORM2 TO COMPUTED-N.                                 NC2014.2 187 360
   000769         077200     MOVE    2 TO CORRECT-N.                                      NC2014.2 374
   000770         077300     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000771         077400     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000772         077500     MOVE PERFORM3 TO COMPUTED-N.                                 NC2014.2 188 360
   000773         077600     MOVE    1 TO CORRECT-N.                                      NC2014.2 374
   000774         077700     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000775         077800     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000776         077900     MOVE XRAY TO COMPUTED-A.                                     NC2014.2 77 359
   000777         078000     MOVE "A" TO CORRECT-A.                                       NC2014.2 373
   000778         078100     MOVE "PFM-TEST-F4-3" TO PAR-NAME.                            NC2014.2 348
   000779         078200 PFM-WRITE-F4-3.                                                  NC2014.2
   000780         078300     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000781         078400*                                                                 NC2014.2
   000782         078500 PFM-INIT-F4-4.                                                   NC2014.2
   000783         078600     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000784         078700     MOVE 2 TO PERFORM9.                                          NC2014.2 194
   000785         078800     MOVE 2 TO PERFORM10.                                         NC2014.2 195
   000786         078900 PFM-TEST-F4-4.                                                   NC2014.2
   000787         079000*    NOTE IN THIS TEST THREE SUBSCRIPTS ARE VARIED.               NC2014.2
   000788         079100     PERFORM PFM-L VARYING PERFORM3 FROM PERFORM9 BY 2            NC2014.2 907 188 194
   000789         079200     UNTIL PERFORM3 GREATER THAN 4 AFTER PERFORM2 FROM 10         NC2014.2 188 187
   000790         079300     BY -5 UNTIL PERFORM2 EQUAL TO 0  AFTER PERFORM11             NC2014.2 187 196
   000791         079400     FROM 3 BY PERFORM10 UNTIL PERFORM11 GREATER THAN 5.          NC2014.2 195 196
   000792         079500     IF PERFORM16 (2, 10, 3) EQUAL TO 5.0 AND PERFORM16 (2, 10, 5)NC2014.2 201 201
   000793         079600     EQUAL TO 5.7 AND PERFORM16 (2, 5, 3) EQUAL TO 6.4 AND        NC2014.2 201
   000794         079700     PERFORM16 (2, 5, 5) EQUAL TO 7.1 AND PERFORM16 (4, 10, 3)    NC2014.2 201 201
   000795         079800     EQUAL TO 7.8 AND PERFORM16 (4, 10, 5) EQUAL TO 8.5           NC2014.2 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796      1  079900     MOVE "B" TO XRAY. IF                                         NC2014.2 77
   000797      1  080000     PERFORM16 (4, 5, 3) EQUAL TO 9.2 AND PERFORM16 (4, 5, 5)     NC2014.2 201 201
   000798      1  080100     EQUAL TO 9.9 AND PERFORM11 EQUAL TO 3 AND PERFORM2 EQUAL     NC2014.2 196 187
   000799      1  080200     TO 10 AND PERFORM3 EQUAL TO 6 AND XRAY EQUAL TO "B"          NC2014.2 188 77
   000800      1  080300     PERFORM PASS GO TO PFM-WRITE-F4-4.                           NC2014.2 498 858
   000801         080400     GO TO PFM-FAIL-F4-4.                                         NC2014.2 805
   000802         080500 PFM-DELETE-F4-4.                                                 NC2014.2
   000803         080600     PERFORM DE-LETE.                                             NC2014.2 500
   000804         080700     GO TO PFM-WRITE-F4-4.                                        NC2014.2 858
   000805         080800 PFM-FAIL-F4-4.                                                   NC2014.2
   000806         080900     MOVE PERFORM16 (2, 10, 3) TO COMPUTED-N.                     NC2014.2 201 360
   000807         081000     MOVE 5.0 TO CORRECT-N.                                       NC2014.2 374
   000808         081100     PERFORM FAIL.                                                NC2014.2 499
   000809         081200     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000810         081300     MOVE SPACE TO P-OR-F.                                        NC2014.2 IMP 346
   000811         081400     MOVE PERFORM16 (2, 10, 3) TO COMPUTED-N.                     NC2014.2 201 360
   000812         081500     MOVE 5.0 TO CORRECT-N.                                       NC2014.2 374
   000813         081600     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000814         081700     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000815         081800     MOVE PERFORM16 (2, 10, 5) TO COMPUTED-N.                     NC2014.2 201 360
   000816         081900     MOVE 5.7 TO CORRECT-N.                                       NC2014.2 374
   000817         082000     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000818         082100     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000819         082200     MOVE PERFORM16 (2,  5, 3) TO COMPUTED-N.                     NC2014.2 201 360
   000820         082300     MOVE 6.4 TO CORRECT-N.                                       NC2014.2 374
   000821         082400     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000822         082500     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000823         082600     MOVE PERFORM16 (2,  5, 5) TO COMPUTED-N.                     NC2014.2 201 360
   000824         082700     MOVE 7.1 TO CORRECT-N.                                       NC2014.2 374
   000825         082800     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000826         082900     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000827         083000     MOVE PERFORM16 (4, 10, 3) TO COMPUTED-N.                     NC2014.2 201 360
   000828         083100     MOVE 7.8 TO CORRECT-N.                                       NC2014.2 374
   000829         083200     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000830         083300     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000831         083400     MOVE PERFORM16 (4, 10, 5) TO COMPUTED-N.                     NC2014.2 201 360
   000832         083500     MOVE 8.5 TO CORRECT-N.                                       NC2014.2 374
   000833         083600     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000834         083700     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000835         083800     MOVE PERFORM16 (4,  5, 3) TO COMPUTED-N.                     NC2014.2 201 360
   000836         083900     MOVE 9.2 TO CORRECT-N.                                       NC2014.2 374
   000837         084000     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000838         084100     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000839         084200     MOVE PERFORM16 (4,  5, 5) TO COMPUTED-N.                     NC2014.2 201 360
   000840         084300     MOVE 9.9 TO CORRECT-N.                                       NC2014.2 374
   000841         084400     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000842         084500     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000843         084600     MOVE PERFORM11            TO COMPUTED-N.                     NC2014.2 196 360
   000844         084700     MOVE 3   TO CORRECT-N.                                       NC2014.2 374
   000845         084800     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000846         084900     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000847         085000     MOVE PERFORM2             TO COMPUTED-N.                     NC2014.2 187 360
   000848         085100     MOVE 10  TO CORRECT-N.                                       NC2014.2 374
   000849         085200     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000850         085300     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000851         085400     MOVE PERFORM3             TO COMPUTED-N.                     NC2014.2 188 360
   000852         085500     MOVE 6   TO CORRECT-N.                                       NC2014.2 374
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000854         085700     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000855         085800     MOVE XRAY TO COMPUTED-A.                                     NC2014.2 77 359
   000856         085900     MOVE "B" TO CORRECT-A.                                       NC2014.2 373
   000857         086000     MOVE "PFM-TEST-F4-4" TO PAR-NAME.                            NC2014.2 348
   000858         086100 PFM-WRITE-F4-4.                                                  NC2014.2
   000859         086200     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   000860         086300     GO TO PFM-CONTINUE.                                          NC2014.2 917
   000861         086400 PFM-A.                                                           NC2014.2
   000862         086500     MULTIPLY PERFORM3 BY 6 GIVING PERFORM2.                      NC2014.2 188 187
   000863         086600 PFM-AA.                                                          NC2014.2
   000864         086700     ADD 1 TO PERFORM3.                                           NC2014.2 188
   000865         086800 PFM-B.                                                           NC2014.2
   000866         086900     PERFORM FAIL.                                                NC2014.2 499
   000867         087000     MOVE "PFM-B ERRONIOUSLY ENTERED" TO RE-MARK.                 NC2014.2 353
   000868         087100*    NOTE CONTROL SHOULD NEVER FALL THRU TO THIS PARAGRAPH FROM   NC2014.2
   000869         087200*        THE PREVIOUS ONE.                                        NC2014.2
   000870         087300     GO TO PFM-WRITE-F3-1.                                        NC2014.2 619
   000871         087400 PFM-C.                                                           NC2014.2
   000872         087500     ADD 1 TO PERFORM2.                                           NC2014.2 187
   000873         087600 PFM-D.                                                           NC2014.2
   000874         087700     PERFORM FAIL.                                                NC2014.2 499
   000875         087800     MOVE "PFM-D ERRONIOUSLY ENTERED" TO RE-MARK.                 NC2014.2 353
   000876         087900*    NOTE CONTROL SHOULD NEVER FALL THRU TO THIS PARAGRAPH FROM   NC2014.2
   000877         088000*        THE PREVIOUS ONE.                                        NC2014.2
   000878         088100     GO TO PFM-WRITE-F3-2.                                        NC2014.2 639
   000879         088200 PFM-E.                                                           NC2014.2
   000880         088300     ADD PERFORM4 3.5 GIVING PERFORM6.                            NC2014.2 189 191
   000881         088400 PFM-F.                                                           NC2014.2
   000882         088500     PERFORM FAIL.                                                NC2014.2 499
   000883         088600     MOVE "PFM-F ERRONIOUSLY ENTERED" TO RE-MARK.                 NC2014.2 353
   000884         088700*    NOTE CONTROL SHOULD NEVER FALL THRU TO THIS PARAGRAPH FROM   NC2014.2
   000885         088800*        THE PREVIOUS ONE.                                        NC2014.2
   000886         088900     GO TO PFM-WRITE-F4-1.                                        NC2014.2 663
   000887         089000 PFM-G.                                                           NC2014.2
   000888         089100     ADD PERFORM4 8 GIVING PERFORM8 (PERFORM3).                   NC2014.2 189 193 188
   000889         089200     ADD .3 TO PERFORM4.                                          NC2014.2 189
   000890         089300 PFM-H.                                                           NC2014.2
   000891         089400     PERFORM FAIL.                                                NC2014.2 499
   000892         089500     MOVE "PFM-H ERRONIOUSLY ENTERED" TO RE-MARK.                 NC2014.2 353
   000893         089600*    NOTE CONTROL SHOULD NEVER FALL THRU TO THIS PARAGRAPH FROM   NC2014.2
   000894         089700*        THE PREVIOUS ONE.                                        NC2014.2
   000895         089800     GO TO PFM-WRITE-F4-2.                                        NC2014.2 709
   000896         089900 PFM-I.                                                           NC2014.2
   000897         090000     MULTIPLY PERFORM4 BY 10 GIVING PERFORM14                     NC2014.2 189 199
   000898         090100         (PERFORM3, PERFORM2).                                    NC2014.2 188 187
   000899         090200 PFM-J.                                                           NC2014.2
   000900         090300     ADD .5 TO PERFORM4.                                          NC2014.2 189
   000901         090400 PFM-K.                                                           NC2014.2
   000902         090500     PERFORM FAIL.                                                NC2014.2 499
   000903         090600     MOVE "PFM-K ERRONIOUSLY ENTERED" TO RE-MARK.                 NC2014.2 353
   000904         090700*    NOTE CONTROL SHOULD NEVER FALL THRU TO THIS PARAGRAPH FROM   NC2014.2
   000905         090800*        THE PREVIOUS ONE.                                        NC2014.2
   000906         090900     GO TO PFM-WRITE-F4-3.                                        NC2014.2 779
   000907         091000 PFM-L.                                                           NC2014.2
   000908         091100     SUBTRACT 5.0 FROM PERFORM5 GIVING PERFORM16                  NC2014.2 190 201
   000909         091200         (PERFORM3, PERFORM2, PERFORM11).                         NC2014.2 188 187 196
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     ADD .7 TO PERFORM5.                                          NC2014.2 190
   000911         091400 PFM-M.                                                           NC2014.2
   000912         091500     PERFORM FAIL.                                                NC2014.2 499
   000913         091600     MOVE "PFM-M ERRONIOUSLY ENTERED" TO RE-MARK.                 NC2014.2 353
   000914         091700*    NOTE CONTROL SHOULD NEVER FALL THRU TO THIS PARAGRAPH FROM   NC2014.2
   000915         091800*        THE PREVIOUS ONE.                                        NC2014.2
   000916         091900     GO TO PFM-WRITE-F4-4.                                        NC2014.2 858
   000917         092000 PFM-CONTINUE.                                                    NC2014.2
   000918         092100     EXIT.                                                        NC2014.2
   000919         092200*                                                                 NC2014.2
   000920         092300 PFM-INIT-F3-3.                                                   NC2014.2
   000921         092400     MOVE "PFM-TEST-F3-3  " TO PAR-NAME.                          NC2014.2 348
   000922         092500     MOVE "VI-122 6.20.4 GR10(C)" TO ANSI-REFERENCE.              NC2014.2 404
   000923         092600     MOVE ZERO TO WRK-DS-02V00.                                   NC2014.2 IMP 57
   000924         092700     GO TO PFM-TEST-F3-3.                                         NC2014.2 929
   000925         092800 PFM-A-3-3.                                                       NC2014.2
   000926         092900     EXIT.                                                        NC2014.2
   000927         093000 PFM-B-3-3.                                                       NC2014.2
   000928         093100     ADD      1 TO WRK-DS-02V00.                                  NC2014.2 57
   000929         093200 PFM-TEST-F3-3.                                                   NC2014.2
   000930         093300     PERFORM PFM-A-3-3 THROUGH PFM-B-3-3 UNTIL TEST-2NUC-COND-99. NC2014.2 925 927 58
   000931         093400     IF WRK-DS-02V00 EQUAL TO 99                                  NC2014.2 57
   000932      1  093500              PERFORM PASS GO TO PFM-WRITE-F3-3.                  NC2014.2 498 941
   000933         093600     GO TO PFM-FAIL-F3-3.                                         NC2014.2 937
   000934         093700 PFM-DELETE-F3-3.                                                 NC2014.2
   000935         093800     PERFORM  DE-LETE.                                            NC2014.2 500
   000936         093900     GO TO PFM-WRITE-F3-3.                                        NC2014.2 941
   000937         094000 PFM-FAIL-F3-3.                                                   NC2014.2
   000938         094100     MOVE     WRK-DS-02V00 TO COMPUTED-N.                         NC2014.2 57 360
   000939         094200     MOVE     99 TO CORRECT-N.                                    NC2014.2 374
   000940         094300     PERFORM  FAIL.                                               NC2014.2 499
   000941         094400 PFM-WRITE-F3-3.                                                  NC2014.2
   000942         094500     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   000943         094600*                                                                 NC2014.2
   000944         094700 PFM-INIT-F4-5.                                                   NC2014.2
   000945         094800     MOVE     "PFM-TEST-F4-5" TO PAR-NAME.                        NC2014.2 348
   000946         094900     MOVE     ZERO TO WRK-DS-02V00.                               NC2014.2 IMP 57
   000947         095000     MOVE     ZERO TO WRK-DS-06V06.                               NC2014.2 IMP 59
   000948         095100     PERFORM  PFM-A-4-5 THROUGH PFM-C-4-5 VARYING WRK-DS-02V00    NC2014.2 951 955 57
   000949         095200              FROM 1 BY 1 UNTIL TEST-2NUC-COND-99.                NC2014.2 58
   000950         095300     GO TO PFM-TEST-F4-5.                                         NC2014.2 957
   000951         095400 PFM-A-4-5.                                                       NC2014.2
   000952         095500     ADD      0.000001 TO WRK-DS-06V06.                           NC2014.2 59
   000953         095600 PFM-B-4-5.                                                       NC2014.2
   000954         095700     ADD      1 TO WRK-DS-06V06.                                  NC2014.2 59
   000955         095800 PFM-C-4-5.                                                       NC2014.2
   000956         095900     SUBTRACT 1 FROM WRK-DS-06V06.                                NC2014.2 59
   000957         096000 PFM-TEST-F4-5.                                                   NC2014.2
   000958         096100     ADD      WRK-DS-02V00 TO WRK-DS-06V06.                       NC2014.2 57 59
   000959         096200     IF   WRK-DS-06V06 EQUAL TO 99.000098                         NC2014.2 59
   000960      1  096300              PERFORM PASS GO TO PFM-WRITE-F4-5.                  NC2014.2 498 969
   000961         096400     GO       TO PFM-FAIL-F4-5.                                   NC2014.2 965
   000962         096500 PFM-DELETE-F4-5.                                                 NC2014.2
   000963         096600     PERFORM  DE-LETE.                                            NC2014.2 500
   000964         096700     GO TO    PFM-WRITE-F4-5.                                     NC2014.2 969
   000965         096800 PFM-FAIL-F4-5.                                                   NC2014.2
   000966         096900     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC2014.2 59 360
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     MOVE 99.000098 TO CORRECT-N.                                 NC2014.2 374
   000968         097100     PERFORM  FAIL.                                               NC2014.2 499
   000969         097200 PFM-WRITE-F4-5.                                                  NC2014.2
   000970         097300     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   000971         097400*                                                                 NC2014.2
   000972         097500 PFM-INIT-F4-6.                                                   NC2014.2
   000973         097600     MOVE     "PFM-TEST-F4-6" TO PAR-NAME.                        NC2014.2 348
   000974         097700     MOVE     ZERO TO WRK-DS-02V00.                               NC2014.2 IMP 57
   000975         097800     MOVE     ZERO TO WRK-DS-06V06.                               NC2014.2 IMP 59
   000976         097900     PERFORM  PFM-A-4-6 VARYING WRK-DS-02V00 FROM A02TWOS-DS-02V00NC2014.2 978 57 62
   000977         098000              BY A02TWOS-DS-02V00 UNTIL (WRK-DS-02V00 + 12) = 100.NC2014.2 62 57
   000978         098100 PFM-A-4-6.                                                       NC2014.2
   000979         098200     ADD      0.000001 TO WRK-DS-06V06.                           NC2014.2 59
   000980         098300 PFM-TEST-F4-6.                                                   NC2014.2
   000981         098400     ADD      WRK-DS-02V00 TO WRK-DS-06V06.                       NC2014.2 57 59
   000982         098500     IF       WRK-DS-06V06 EQUAL TO 88.000004                     NC2014.2 59
   000983      1  098600              PERFORM PASS GO TO PFM-WRITE-F4-6.                  NC2014.2 498 992
   000984         098700     GO       TO PFM-FAIL-F4-6.                                   NC2014.2 988
   000985         098800 PFM-DELETE-F4-6.                                                 NC2014.2
   000986         098900     PERFORM  DE-LETE.                                            NC2014.2 500
   000987         099000     GO       TO PFM-WRITE-F4-6.                                  NC2014.2 992
   000988         099100 PFM-FAIL-F4-6.                                                   NC2014.2
   000989         099200     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC2014.2 59 360
   000990         099300     MOVE     88.000004 TO CORRECT-N.                             NC2014.2 374
   000991         099400     PERFORM  FAIL.                                               NC2014.2 499
   000992         099500 PFM-WRITE-F4-6.                                                  NC2014.2
   000993         099600     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   000994         099700*                                                                 NC2014.2
   000995         099800 PFM-INIT-F4-7.                                                   NC2014.2
   000996         099900     MOVE     "PFM-TEST-F4-7" TO PAR-NAME.                        NC2014.2 348
   000997         100000     GO TO PFM-TEST-F4-7.                                         NC2014.2 1000
   000998         100100 PFM-A-10.                                                        NC2014.2
   000999         100200     EXIT.                                                        NC2014.2
   001000         100300 PFM-TEST-F4-7.                                                   NC2014.2
   001001         100400     PERFORM  PFM-A-10                                            NC2014.2 998
   001002         100500              VARYING PERFORM4                                    NC2014.2 189
   001003         100600              FROM -5.5                                           NC2014.2
   001004         100700              BY 0.1                                              NC2014.2
   001005         100800              UNTIL PERFORM4 > 90.                                NC2014.2 189
   001006         100900     IF       PERFORM4 EQUAL TO 90.1                              NC2014.2 189
   001007      1  101000              PERFORM PASS GO TO PFM-WRITE-F4-7.                  NC2014.2 498 1018
   001008         101100     GO       TO PFM-FAIL-F4-7.                                   NC2014.2 1014
   001009         101200*        NOTE PFM-A-10 SHOULD BE "EXECUTED" UNTIL PERFORM4 IS 90.1NC2014.2
   001010         101300*             EVEN THOUGH PFM-A-10 IS NOTHING BUT AN EXIT.        NC2014.2
   001011         101400 PFM-DELETE-F4-7.                                                 NC2014.2
   001012         101500     PERFORM  DE-LETE.                                            NC2014.2 500
   001013         101600     GO       TO PFM-WRITE-F4-7.                                  NC2014.2 1018
   001014         101700 PFM-FAIL-F4-7.                                                   NC2014.2
   001015         101800     PERFORM  FAIL.                                               NC2014.2 499
   001016         101900     MOVE PERFORM4 TO COMPUTED-N.                                 NC2014.2 189 360
   001017         102000     MOVE 90.1 TO CORRECT-N.                                      NC2014.2 374
   001018         102100 PFM-WRITE-F4-7.                                                  NC2014.2
   001019         102200     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   001020         102300*                                                                 NC2014.2
   001021         102400 PFM-INIT-F4-8.                                                   NC2014.2
   001022         102500     MOVE "PFM-TEST-F4-8" TO PAR-NAME.                            NC2014.2 348
   001023         102600     MOVE ZERO TO PFM-11-COUNTER.                                 NC2014.2 IMP 130
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     MOVE ZERO TO SWITCH-PFM-1.                                   NC2014.2 IMP 128
   001025         102800*    NOTE  THIS AUDIT ROUTINE TESTS NESTED PERFORMS               NC2014.2
   001026         102900*        IF THE PROGRAM CANNOT SET RETURNS AT THE PROPER PLACE    NC2014.2
   001027         103000*             OR  EXECUTE THEM IN PROPER SEQUENCE A FAIL WILL     NC2014.2
   001028         103100*                 RESULT.                                         NC2014.2
   001029         103200 PFM-TEST-F4-8.                                                   NC2014.2
   001030         103300     GO TO PFM-PART-A.                                            NC2014.2 1034
   001031         103400 PFM-DELETE-F4-8.                                                 NC2014.2
   001032         103500     PERFORM DE-LETE.                                             NC2014.2 500
   001033         103600     GO TO PFM-WRITE-F4-8.                                        NC2014.2 1071
   001034         103700 PFM-PART-A SECTION.                                              NC2014.2
   001035         103800 PARA-PART-A.                                                     NC2014.2
   001036         103900     IF SWITCH-PFM-1 = 1                                          NC2014.2 128
   001037      1  104000         GO TO PFM-SEC-A3.                                        NC2014.2 1041
   001038         104100 PFM-SEC-A2.                                                      NC2014.2
   001039         104200     PERFORM PFM-SEC-B1 THRU PFM-SEC-B6.                          NC2014.2 1048 1060
   001040         104300     GO TO PFM-SEC-A4.                                            NC2014.2 1045
   001041         104400 PFM-SEC-A3.                                                      NC2014.2
   001042         104500     ADD 2 TO PFM-11-COUNTER.                                     NC2014.2 130
   001043         104600     MOVE 1 TO SWITCH-PFM-2.                                      NC2014.2 129
   001044         104700          PERFORM PFM-SEC-B1 THRU PFM-SEC-B5.                     NC2014.2 1048 1058
   001045         104800 PFM-SEC-A4.                                                      NC2014.2
   001046         104900     EXIT.                                                        NC2014.2
   001047         105000 PFM-PART-B SECTION.                                              NC2014.2
   001048         105100 PFM-SEC-B1.                                                      NC2014.2
   001049         105200     MULTIPLY  PFM-11-COUNTER BY 10 GIVING PFM-11-COUNTER.        NC2014.2 130 130
   001050         105300     IF SWITCH-PFM-2 EQUAL TO 1                                   NC2014.2 129
   001051      1  105400              GO TO PFM-SEC-B5.                                   NC2014.2 1058
   001052         105500 PFM-SEC-B2.                                                      NC2014.2
   001053         105600     MOVE 1 TO SWITCH-PFM-1.                                      NC2014.2 128
   001054         105700 PFM-SEC-B3.                                                      NC2014.2
   001055         105800     PERFORM PFM-PART-A.                                          NC2014.2 1034
   001056         105900 PFM-SEC-B4.                                                      NC2014.2
   001057         106000     EXIT.                                                        NC2014.2
   001058         106100 PFM-SEC-B5.                                                      NC2014.2
   001059         106200     EXIT.                                                        NC2014.2
   001060         106300 PFM-SEC-B6.                                                      NC2014.2
   001061         106400     EXIT.                                                        NC2014.2
   001062         106500 PFM-SEC-B7.                                                      NC2014.2
   001063         106600     EXIT.                                                        NC2014.2
   001064         106700 PFM-SEC-STOP.                                                    NC2014.2
   001065         106800     IF PFM-11-COUNTER EQUAL TO 200                               NC2014.2 130
   001066      1  106900              PERFORM PASS                                        NC2014.2 498
   001067      1  107000              GO TO PFM-WRITE-F4-8.                               NC2014.2 1071
   001068         107100     PERFORM FAIL.                                                NC2014.2 499
   001069         107200     MOVE "200" TO CORRECT-A.                                     NC2014.2 373
   001070         107300     MOVE PFM-11-COUNTER TO COMPUTED-A.                           NC2014.2 130 359
   001071         107400 PFM-WRITE-F4-8.                                                  NC2014.2
   001072         107500     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001073         107600*                                                                 NC2014.2
   001074         107700 PFM-INIT-F4-9.                                                   NC2014.2
   001075         107800     MOVE "PFM-TEST-F4-9" TO PAR-NAME.                            NC2014.2 348
   001076         107900     ADD 44 TO PFM-12-ANS1.                                       NC2014.2 132
   001077         108000     ADD 46 TO PFM-12-ANS2.                                       NC2014.2 133
   001078         108100*    NOTE  THIS PROGRAM TESTS THE ABILITY OF THE COMPILER TO      NC2014.2
   001079         108200*        PERFORM A STATEMENT WITH A VARYING CLAUSE INCLUDED.      NC2014.2
   001080         108300     GO TO PFM-TEST-F4-9.                                         NC2014.2 1091
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400 PFM-F4-9-A.                                                      NC2014.2
   001082         108500     ADD 1 TO PFM-12-ANS2.                                        NC2014.2 133
   001083         108600     SUBTRACT 2 FROM PFM-12-ANS1.                                 NC2014.2 132
   001084         108700     IF PFM-12-ANS2 LESS THAN PFM-12-ANS1                         NC2014.2 133 132
   001085      1  108800         GO TO PFM-F4-9-B ELSE                                    NC2014.2 1089
   001086      1  108900     DIVIDE PFM-12-COUNTER BY 2 GIVING PFM-12-COUNTER.            NC2014.2 131 131
   001087         109000     IF PFM-12-COUNTER LESS THAN 36 SUBTRACT 4 FROM               NC2014.2 131
   001088         109100     PFM-12-COUNTER.                                              NC2014.2 131
   001089         109200 PFM-F4-9-B.                                                      NC2014.2
   001090         109300     EXIT.                                                        NC2014.2
   001091         109400 PFM-TEST-F4-9.                                                   NC2014.2
   001092         109500     PERFORM PFM-F4-9-A VARYING PFM-12-COUNTER FROM 100 BY 4      NC2014.2 1081 131
   001093         109600       UNTIL PFM-12-COUNTER NOT GREATER THAN 15                   NC2014.2 131
   001094         109700             AND PFM-12-ANS1 LESS THAN PFM-12-ANS2                NC2014.2 132 133
   001095         109800             OR PFM-12-ANS2 GREATER THAN 50.                      NC2014.2 133
   001096         109900     IF PFM-12-COUNTER EQUAL TO 13                                NC2014.2 131
   001097      1  110000         PERFORM PASS                                             NC2014.2 498
   001098      1  110100         GO TO PFM-WRITE-F4-9.                                    NC2014.2 1107
   001099         110200     GO TO PFM-FAIL-F4-9.                                         NC2014.2 1103
   001100         110300 PFM-DELETE-F4-9.                                                 NC2014.2
   001101         110400     PERFORM DE-LETE.                                             NC2014.2 500
   001102         110500     GO TO PFM-WRITE-F4-9.                                        NC2014.2 1107
   001103         110600 PFM-FAIL-F4-9.                                                   NC2014.2
   001104         110700     PERFORM FAIL.                                                NC2014.2 499
   001105         110800     MOVE PFM-12-COUNTER TO COMPUTED-A.                           NC2014.2 131 359
   001106         110900     MOVE "13" TO CORRECT-A.                                      NC2014.2 373
   001107         111000 PFM-WRITE-F4-9.                                                  NC2014.2
   001108         111100     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001109         111200*                                                                 NC2014.2
   001110         111300 PFM-INIT-F4-10.                                                  NC2014.2
   001111         111400     MOVE     "PFM-TEST-F4-10" TO PAR-NAME.                       NC2014.2 348
   001112         111500     MOVE     0 TO PERFORM18.                                     NC2014.2 203
   001113         111600     MOVE     1 TO START-POINT.                                   NC2014.2 126
   001114         111700     MOVE     3 TO INC-VALUE.                                     NC2014.2 127
   001115         111800     GO TO PFM-TEST-F4-10.                                        NC2014.2 1124
   001116         111900 PFM-F4-10-A.                                                     NC2014.2
   001117         112000     ADD      1 TO PERFORM18.                                     NC2014.2 203
   001118         112100     ADD      3 TO PERFORM17.                                     NC2014.2 202
   001119         112200*        NOTE MANIPULATING PERFORM17 IS SUPPOSED TO AFFECT THE    NC2014.2
   001120         112300*             NUMBER OF TIMES THIS PARAGRAPH IS PERFORMED --- IN  NC2014.2
   001121         112400*             PARTICULAR PFM-F4-10-A WOULD HAVE BEEN EXECUTED 15  NC2014.2
   001122         112500*             TIMES WITHOUT THE ABOVE ADDITION TO PERFORM17, BUT  NC2014.2
   001123         112600*             IN FACT IT SHOULD NOW BE EXECUTED ONLY 8 TIMES.     NC2014.2
   001124         112700 PFM-TEST-F4-10.                                                  NC2014.2
   001125         112800     PERFORM  PFM-F4-10-A                                         NC2014.2 1116
   001126         112900              VARYING PERFORM17                                   NC2014.2 202
   001127         113000              FROM START-POINT                                    NC2014.2 126
   001128         113100              BY INC-VALUE                                        NC2014.2 127
   001129         113200              UNTIL PERFORM17 GREATER THAN 45                     NC2014.2 202
   001130         113300     IF       PERFORM18 EQUAL TO 8 PERFORM PASS                   NC2014.2 203 498
   001131      1  113400                                   GO TO PFM-WRITE-F4-10.         NC2014.2 1140
   001132         113500     GO TO PFM-FAIL-F4-10.                                        NC2014.2 1136
   001133         113600 PFM-DELETE-F4-10.                                                NC2014.2
   001134         113700     PERFORM  DE-LETE.                                            NC2014.2 500
   001135         113800     GO       TO PFM-WRITE-F4-10.                                 NC2014.2 1140
   001136         113900 PFM-FAIL-F4-10.                                                  NC2014.2
   001137         114000     PERFORM  FAIL.                                               NC2014.2 499
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100     MOVE     PERFORM18 TO COMPUTED-N.                            NC2014.2 203 360
   001139         114200     MOVE     8 TO CORRECT-N.                                     NC2014.2 374
   001140         114300 PFM-WRITE-F4-10.                                                 NC2014.2
   001141         114400     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   001142         114500*                                                                 NC2014.2
   001143         114600 PFM-INIT-F4-11.                                                  NC2014.2
   001144         114700     MOVE     "PFM-TEST-F4-11" TO PAR-NAME.                       NC2014.2 348
   001145         114800     MOVE     0 TO PERFORM18.                                     NC2014.2 203
   001146         114900     MOVE     1 TO START-POINT.                                   NC2014.2 126
   001147         115000     MOVE     3 TO INC-VALUE.                                     NC2014.2 127
   001148         115100     GO TO PFM-TEST-F4-11.                                        NC2014.2 1154
   001149         115200 PFM-F4-11-A.                                                     NC2014.2
   001150         115300     ADD      1 TO PERFORM18.                                     NC2014.2 203
   001151         115400     MOVE     46 TO START-POINT.                                  NC2014.2 126
   001152         115500*        NOTE THE ABOVE MOVE HAS NO EFFECT ON THE NUMBER OF TIMES NC2014.2
   001153         115600*             PFM-F4-11-A IS EXECUTED (15).                       NC2014.2
   001154         115700 PFM-TEST-F4-11.                                                  NC2014.2
   001155         115800     PERFORM  PFM-F4-11-A                                         NC2014.2 1149
   001156         115900              VARYING PERFORM17                                   NC2014.2 202
   001157         116000              FROM START-POINT                                    NC2014.2 126
   001158         116100              BY INC-VALUE                                        NC2014.2 127
   001159         116200              UNTIL PERFORM17 GREATER THAN 45                     NC2014.2 202
   001160         116300     IF       PERFORM18 EQUAL TO 15 PERFORM PASS                  NC2014.2 203 498
   001161      1  116400                                    GO TO PFM-WRITE-F4-11.        NC2014.2 1170
   001162         116500     GO TO PFM-FAIL-F4-11.                                        NC2014.2 1166
   001163         116600 PFM-DELETE-F4-11.                                                NC2014.2
   001164         116700     PERFORM  DE-LETE.                                            NC2014.2 500
   001165         116800     GO       TO PFM-WRITE-F4-11.                                 NC2014.2 1170
   001166         116900 PFM-FAIL-F4-11.                                                  NC2014.2
   001167         117000     PERFORM  FAIL.                                               NC2014.2 499
   001168         117100     MOVE     PERFORM18 TO COMPUTED-N.                            NC2014.2 203 360
   001169         117200     MOVE     15 TO CORRECT-N.                                    NC2014.2 374
   001170         117300 PFM-WRITE-F4-11.                                                 NC2014.2
   001171         117400     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   001172         117500*                                                                 NC2014.2
   001173         117600 PFM-INIT-F4-12.                                                  NC2014.2
   001174         117700     MOVE     "PFM-TEST-F4-12" TO PAR-NAME.                       NC2014.2 348
   001175         117800     MOVE     0 TO PERFORM18.                                     NC2014.2 203
   001176         117900     MOVE     1 TO START-POINT.                                   NC2014.2 126
   001177         118000     MOVE     3 TO INC-VALUE.                                     NC2014.2 127
   001178         118100     GO TO PFM-TEST-F4-12.                                        NC2014.2 1185
   001179         118200 PFM-F4-12-A.                                                     NC2014.2
   001180         118300     ADD      1 TO PERFORM18.                                     NC2014.2 203
   001181         118400     ADD      1 TO INC-VALUE.                                     NC2014.2 127
   001182         118500*        NOTE THE ABOVE ADD TO INC-VALUE SHOULD ACCELERATE THE    NC2014.2
   001183         118600*             SPEED AT WHICH PERFORM17 APPROACHES 46 --- THEREFORENC2014.2
   001184         118700*             PFM-F4-12-A IS EXECUTED ONLY 7 TIMES INSTEAD OF 15. NC2014.2
   001185         118800 PFM-TEST-F4-12.                                                  NC2014.2
   001186         118900     PERFORM  PFM-F4-12-A                                         NC2014.2 1179
   001187         119000              VARYING PERFORM17                                   NC2014.2 202
   001188         119100              FROM START-POINT                                    NC2014.2 126
   001189         119200              BY INC-VALUE                                        NC2014.2 127
   001190         119300              UNTIL PERFORM17 GREATER THAN 45                     NC2014.2 202
   001191         119400     IF       PERFORM18 EQUAL TO 7 PERFORM PASS                   NC2014.2 203 498
   001192      1  119500                                   GO TO PFM-WRITE-F4-12.         NC2014.2 1201
   001193         119600     GO TO PFM-FAIL-F4-12.                                        NC2014.2 1197
   001194         119700 PFM-DELETE-F4-12.                                                NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800     PERFORM  DE-LETE.                                            NC2014.2 500
   001196         119900     GO       TO PFM-WRITE-F4-12.                                 NC2014.2 1201
   001197         120000 PFM-FAIL-F4-12.                                                  NC2014.2
   001198         120100     PERFORM  FAIL.                                               NC2014.2 499
   001199         120200     MOVE     PERFORM18 TO COMPUTED-N.                            NC2014.2 203 360
   001200         120300     MOVE     7 TO CORRECT-N.                                     NC2014.2 374
   001201         120400 PFM-WRITE-F4-12.                                                 NC2014.2
   001202         120500     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   001203         120600 PFM-INIT-F3-4.                                                   NC2014.2
   001204         120700*    ===--> "TEST BEFORE" PHRASE <--===                           NC2014.2
   001205         120800     MOVE   "VI-112 6.20.2 GR10" TO ANSI-REFERENCE.               NC2014.2 404
   001206         120900     MOVE 1 TO PERFORM2.                                          NC2014.2 187
   001207         121000*    NOTE IN THIS TEST THE CONDITION IS NOT SATISFIED             NC2014.2
   001208         121100*    ORIGINALLY WHEN THE PERFORM IS ENTERED.                      NC2014.2
   001209         121200 PFM-TEST-F3-4-0.                                                 NC2014.2
   001210         121300     PERFORM PFM-A THRU PFM-AA TEST BEFORE                        NC2014.2 861 863
   001211         121400             UNTIL PERFORM2 EQUAL TO 48.                          NC2014.2 187
   001212         121500 PFM-TEST-F3-4-1.                                                 NC2014.2
   001213         121600     IF PERFORM2 EQUAL TO 48 PERFORM PASS GO TO PFM-WRITE-F3-4.   NC2014.2 187 498 1222
   001214         121700     GO TO PFM-FAIL-F3-4.                                         NC2014.2 1218
   001215         121800 PFM-DELETE-F3-4.                                                 NC2014.2
   001216         121900     PERFORM DE-LETE.                                             NC2014.2 500
   001217         122000     GO TO PFM-WRITE-F3-4.                                        NC2014.2 1222
   001218         122100 PFM-FAIL-F3-4.                                                   NC2014.2
   001219         122200     MOVE PERFORM2 TO COMPUTED-N.                                 NC2014.2 187 360
   001220         122300     MOVE 48 TO CORRECT-N.                                        NC2014.2 374
   001221         122400     PERFORM FAIL.                                                NC2014.2 499
   001222         122500 PFM-WRITE-F3-4.                                                  NC2014.2
   001223         122600     MOVE "PFM-TEST-F3-4" TO PAR-NAME.                            NC2014.2 348
   001224         122700     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001225         122800 PFM-INIT-F3-5.                                                   NC2014.2
   001226         122900*    ===--> "TEST BEFORE" PHRASE <--===                           NC2014.2
   001227         123000     MOVE   "VI-112 6.20.2 GR10" TO ANSI-REFERENCE.               NC2014.2 404
   001228         123100     MOVE 50 TO PERFORM2.                                         NC2014.2 187
   001229         123200*    NOTE IN THIS TEST CONDITION IS SATISFIED WHEN PERFORM IS     NC2014.2
   001230         123300*    ENTERED AND CONTROL SHOULD NOT BE PASSED TO PFM-C.           NC2014.2
   001231         123400 PFM-TEST-F3-5-0.                                                 NC2014.2
   001232         123500     PERFORM PFM-F3-5-C TEST BEFORE                               NC2014.2 1240
   001233         123600             UNTIL PERFORM2 GREATER THAN 25.                      NC2014.2 187
   001234         123700 PFM-TEST-F3-5-1.                                                 NC2014.2
   001235         123800     IF PERFORM2 EQUAL TO 50 PERFORM PASS GO TO PFM-WRITE-F3-5.   NC2014.2 187 498 1246
   001236         123900     GO TO PFM-FAIL-F3-5.                                         NC2014.2 1242
   001237         124000 PFM-DELETE-F3-5.                                                 NC2014.2
   001238         124100     PERFORM DE-LETE.                                             NC2014.2 500
   001239         124200     GO TO PFM-WRITE-F3-5.                                        NC2014.2 1246
   001240         124300 PFM-F3-5-C.                                                      NC2014.2
   001241         124400     ADD 1 TO PERFORM2.                                           NC2014.2 187
   001242         124500 PFM-FAIL-F3-5.                                                   NC2014.2
   001243         124600     MOVE PERFORM2 TO COMPUTED-N.                                 NC2014.2 187 360
   001244         124700     MOVE 50 TO CORRECT-N.                                        NC2014.2 374
   001245         124800     PERFORM FAIL.                                                NC2014.2 499
   001246         124900 PFM-WRITE-F3-5.                                                  NC2014.2
   001247         125000     MOVE "PFM-TEST-F3-5" TO PAR-NAME.                            NC2014.2 348
   001248         125100     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001249         125200 PFM-INIT-F3-6.                                                   NC2014.2
   001250         125300*    ===--> "TEST BEFORE" PHRASE <--===                           NC2014.2
   001251         125400     MOVE   "VI-112 6.20.2 GR10" TO ANSI-REFERENCE.               NC2014.2 404
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500     MOVE    ZERO TO WRK-DS-02V00.                                NC2014.2 IMP 57
   001253         125600 PFM-TEST-F3-6-0.                                                 NC2014.2
   001254         125700     PERFORM PFM-A-F3-6 THROUGH PFM-B-F3-6                        NC2014.2 1259 1261
   001255         125800             WITH TEST BEFORE                                     NC2014.2
   001256         125900             UNTIL TEST-2NUC-COND-99.                             NC2014.2 58
   001257         126000 PFM-TEST-F3-6.                                                   NC2014.2
   001258         126100     GO TO   PFM-TESTT-F3-6.                                      NC2014.2 1263
   001259         126200 PFM-A-F3-6.                                                      NC2014.2
   001260         126300     EXIT.                                                        NC2014.2
   001261         126400 PFM-B-F3-6.                                                      NC2014.2
   001262         126500     ADD     1 TO WRK-DS-02V00.                                   NC2014.2 57
   001263         126600 PFM-TESTT-F3-6.                                                  NC2014.2
   001264         126700     IF      WRK-DS-02V00 EQUAL TO 99                             NC2014.2 57
   001265      1  126800             PERFORM PASS GO TO PFM-WRITE-F3-6.                   NC2014.2 498 1274
   001266         126900     GO TO   PFM-FAIL-F3-6.                                       NC2014.2 1270
   001267         127000 PFM-DELETE-F3-6.                                                 NC2014.2
   001268         127100     PERFORM DE-LETE.                                             NC2014.2 500
   001269         127200     GO      TO PFM-WRITE-F3-6.                                   NC2014.2 1274
   001270         127300 PFM-FAIL-F3-6.                                                   NC2014.2
   001271         127400     MOVE    WRK-DS-02V00 TO COMPUTED-N.                          NC2014.2 57 360
   001272         127500     MOVE    99 TO CORRECT-N.                                     NC2014.2 374
   001273         127600     PERFORM  FAIL.                                               NC2014.2 499
   001274         127700 PFM-WRITE-F3-6.                                                  NC2014.2
   001275         127800     MOVE     "PFM-TEST-F3-6  " TO PAR-NAME.                      NC2014.2 348
   001276         127900     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   001277         128000 PFM-INIT-F3-7.                                                   NC2014.2
   001278         128100*    ===--> "TEST AFTER"  PHRASE <--===                           NC2014.2
   001279         128200     MOVE   "VI-112 6.20.4 GR10(C)" TO ANSI-REFERENCE.            NC2014.2 404
   001280         128300     MOVE 1 TO PERFORM2.                                          NC2014.2 187
   001281         128400     MOVE 5 TO PERFORM3.                                          NC2014.2 188
   001282         128500*    NOTE IN THIS TEST THE CONDITION IS NOT SATISFIED             NC2014.2
   001283         128600*    ORIGINALLY WHEN THE PERFORM IS ENTERED.                      NC2014.2
   001284         128700 PFM-TEST-F3-7-0.                                                 NC2014.2
   001285         128800     PERFORM PFM-A THRU PFM-AA TEST AFTER                         NC2014.2 861 863
   001286         128900             UNTIL PERFORM2 EQUAL TO 48.                          NC2014.2 187
   001287         129000 PFM-TEST-F3-7-1.                                                 NC2014.2
   001288         129100     IF PERFORM2 EQUAL TO 48 PERFORM PASS GO TO PFM-WRITE-F3-7.   NC2014.2 187 498 1297
   001289         129200     GO TO PFM-FAIL-F3-7.                                         NC2014.2 1293
   001290         129300 PFM-DELETE-F3-7.                                                 NC2014.2
   001291         129400     PERFORM DE-LETE.                                             NC2014.2 500
   001292         129500     GO TO PFM-WRITE-F3-7.                                        NC2014.2 1297
   001293         129600 PFM-FAIL-F3-7.                                                   NC2014.2
   001294         129700     MOVE PERFORM2 TO COMPUTED-N.                                 NC2014.2 187 360
   001295         129800     MOVE 48 TO CORRECT-N.                                        NC2014.2 374
   001296         129900     PERFORM FAIL.                                                NC2014.2 499
   001297         130000 PFM-WRITE-F3-7.                                                  NC2014.2
   001298         130100     MOVE "PFM-TEST-F3-7" TO PAR-NAME.                            NC2014.2 348
   001299         130200     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001300         130300 PFM-INIT-F3-8.                                                   NC2014.2
   001301         130400*    ===--> "TEST AFTER"  PHRASE <--===                           NC2014.2
   001302         130500     MOVE   "VI-112 6.20.2 GR10" TO ANSI-REFERENCE.               NC2014.2 404
   001303         130600     MOVE 50 TO PERFORM2.                                         NC2014.2 187
   001304         130700*    NOTE IN THIS TEST CONDITION IS SATISFIED AFTER PERFORM IS    NC2014.2
   001305         130800*    ENTERED AND CONTROL SHOULD BE PASSED TO PFM-C ONCE.          NC2014.2
   001306         130900 PFM-TEST-F3-8-0.                                                 NC2014.2
   001307         131000     PERFORM PFM-F3-8-C TEST AFTER                                NC2014.2 1315
   001308         131100             UNTIL PERFORM2 GREATER THAN 25.                      NC2014.2 187
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200 PFM-TEST-F3-8-1.                                                 NC2014.2
   001310         131300     IF PERFORM2 EQUAL TO 51 PERFORM PASS GO TO PFM-WRITE-F3-8.   NC2014.2 187 498 1321
   001311         131400     GO TO PFM-FAIL-F3-8.                                         NC2014.2 1317
   001312         131500 PFM-DELETE-F3-8.                                                 NC2014.2
   001313         131600     PERFORM DE-LETE.                                             NC2014.2 500
   001314         131700     GO TO PFM-WRITE-F3-8.                                        NC2014.2 1321
   001315         131800 PFM-F3-8-C.                                                      NC2014.2
   001316         131900     ADD 1 TO PERFORM2.                                           NC2014.2 187
   001317         132000 PFM-FAIL-F3-8.                                                   NC2014.2
   001318         132100     MOVE PERFORM2 TO COMPUTED-N.                                 NC2014.2 187 360
   001319         132200     MOVE 51 TO CORRECT-N.                                        NC2014.2 374
   001320         132300     PERFORM FAIL.                                                NC2014.2 499
   001321         132400 PFM-WRITE-F3-8.                                                  NC2014.2
   001322         132500     MOVE "PFM-TEST-F3-8" TO PAR-NAME.                            NC2014.2 348
   001323         132600     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001324         132700 PFM-INIT-F3-9.                                                   NC2014.2
   001325         132800*    ===--> "TEST AFTER " PHRASE <--===                           NC2014.2
   001326         132900     MOVE   "VI-112 6.20.2 GR10" TO ANSI-REFERENCE.               NC2014.2 404
   001327         133000     MOVE    ZERO TO WRK-DS-02V00.                                NC2014.2 IMP 57
   001328         133100 PFM-TEST-F3-9-0.                                                 NC2014.2
   001329         133200     PERFORM PFM-A-F3-9 THROUGH PFM-B-F3-9                        NC2014.2 1334 1336
   001330         133300             WITH TEST AFTER                                      NC2014.2
   001331         133400             UNTIL TEST-2NUC-COND-99.                             NC2014.2 58
   001332         133500 PFM-TEST-F3-9.                                                   NC2014.2
   001333         133600     GO TO   PFM-TESTT-F3-9.                                      NC2014.2 1338
   001334         133700 PFM-A-F3-9.                                                      NC2014.2
   001335         133800     EXIT.                                                        NC2014.2
   001336         133900 PFM-B-F3-9.                                                      NC2014.2
   001337         134000     ADD     1 TO WRK-DS-02V00.                                   NC2014.2 57
   001338         134100 PFM-TESTT-F3-9.                                                  NC2014.2
   001339         134200     IF      WRK-DS-02V00 EQUAL TO 99                             NC2014.2 57
   001340      1  134300             PERFORM PASS GO TO PFM-WRITE-F3-9.                   NC2014.2 498 1349
   001341         134400     GO TO   PFM-FAIL-F3-9.                                       NC2014.2 1345
   001342         134500 PFM-DELETE-F3-9.                                                 NC2014.2
   001343         134600     PERFORM DE-LETE.                                             NC2014.2 500
   001344         134700     GO      TO PFM-WRITE-F3-9.                                   NC2014.2 1349
   001345         134800 PFM-FAIL-F3-9.                                                   NC2014.2
   001346         134900     MOVE    WRK-DS-02V00 TO COMPUTED-N.                          NC2014.2 57 360
   001347         135000     MOVE    99 TO CORRECT-N.                                     NC2014.2 374
   001348         135100     PERFORM  FAIL.                                               NC2014.2 499
   001349         135200 PFM-WRITE-F3-9.                                                  NC2014.2
   001350         135300     MOVE     "PFM-TEST-F3-9" TO PAR-NAME.                        NC2014.2 348
   001351         135400     PERFORM  PRINT-DETAIL.                                       NC2014.2 502
   001352         135500*                                                                 NC2014.2
   001353         135600 PFM-INIT-F4-13.                                                  NC2014.2
   001354         135700*    ===--> "WITH TEST BEFORE" PHRASE <--===                      NC2014.2
   001355         135800     MOVE   "VI-114 6.20.4 GR10(d)1" TO ANSI-REFERENCE.           NC2014.2 404
   001356         135900     MOVE    20  TO PERFORM2.                                     NC2014.2 187
   001357         136000     MOVE     9  TO PERFORM3.                                     NC2014.2 188
   001358         136100     MOVE    1.5 TO PERFORM4.                                     NC2014.2 189
   001359         136200     MOVE     3  TO PERFORM9.                                     NC2014.2 194
   001360         136300     MOVE    -1  TO PERFORM10.                                    NC2014.2 195
   001361         136400     MOVE     6  TO PERFORM11.                                    NC2014.2 196
   001362         136500     MOVE  ZEROS TO PERFORM12.                                    NC2014.2 IMP 197
   001363         136600     MOVE    SPACE TO XRAY.                                       NC2014.2 IMP 77
   001364         136700*    NOTE IN THIS TEST TWO SUBSCRIPTS ARE VARIED.                 NC2014.2
   001365         136800 PFM-TEST-F4-13-0.                                                NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900     PERFORM PFM-I-F4-13 THRU PFM-J-F4-13 WITH TEST BEFORE        NC2014.2 1372 1375
   001367         137000             VARYING PERFORM3 FROM PERFORM9 BY PERFORM10          NC2014.2 188 194 195
   001368         137100               UNTIL PERFORM3 EQUAL TO 1                          NC2014.2 188
   001369         137200               AFTER PERFORM2 FROM 2 BY PERFORM11                 NC2014.2 187 196
   001370         137300               UNTIL PERFORM2 GREATER THAN 20.                    NC2014.2 187
   001371         137400     GO TO     PFM-TEST-F4-13-1.                                  NC2014.2 1377
   001372         137500 PFM-I-F4-13.                                                     NC2014.2
   001373         137600     MULTIPLY PERFORM4 BY 10 GIVING PERFORM14                     NC2014.2 189 199
   001374         137700         (PERFORM3, PERFORM2).                                    NC2014.2 188 187
   001375         137800 PFM-J-F4-13.                                                     NC2014.2
   001376         137900     ADD .5 TO PERFORM4.                                          NC2014.2 189
   001377         138000 PFM-TEST-F4-13-1.                                                NC2014.2
   001378         138100     IF PERFORM14 (3, 2) EQUAL TO 15.0 AND PERFORM14 (3, 8)       NC2014.2 199 199
   001379         138200     EQUAL TO 20.0 AND PERFORM14 (3, 14) EQUAL TO 25.0            NC2014.2 199
   001380         138300     AND PERFORM14 (3, 20) EQUAL TO 30.0 AND PERFORM14 (2, 2)     NC2014.2 199 199
   001381      1  138400     EQUAL TO 35.0 MOVE "A" TO XRAY.                              NC2014.2 77
   001382         138500     IF PERFORM14 (2, 8) EQUAL TO 40.0 AND                        NC2014.2 199
   001383         138600     PERFORM14 (2, 14) EQUAL TO 45.0 AND PERFORM14 (2, 20)        NC2014.2 199 199
   001384         138700     EQUAL TO 50.0 AND PERFORM2 EQUAL TO 2 AND PERFORM3           NC2014.2 187 188
   001385      1  138800     EQUAL TO 1 AND XRAY EQUAL TO "A" PERFORM PASS                NC2014.2 77 498
   001386      1  138900         GO TO PFM-WRITE-F4-13.                                   NC2014.2 1436
   001387         139000     GO TO PFM-FAIL-F4-13.                                        NC2014.2 1391
   001388         139100 PFM-DELETE-F4-13.                                                NC2014.2
   001389         139200     PERFORM DE-LETE.                                             NC2014.2 500
   001390         139300     GO TO PFM-WRITE-F4-13.                                       NC2014.2 1436
   001391         139400 PFM-FAIL-F4-13.                                                  NC2014.2
   001392         139500     MOVE PERFORM14 (3,  2) TO COMPUTED-N.                        NC2014.2 199 360
   001393         139600     MOVE 15.0 TO CORRECT-N.                                      NC2014.2 374
   001394         139700     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001395         139800     PERFORM FAIL.                                                NC2014.2 499
   001396         139900     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001397         140000     MOVE SPACE TO P-OR-F.                                        NC2014.2 IMP 346
   001398         140100     MOVE PERFORM14 (3,  8) TO COMPUTED-N.                        NC2014.2 199 360
   001399         140200     MOVE 20.0 TO CORRECT-N.                                      NC2014.2 374
   001400         140300     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001401         140400     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001402         140500     MOVE PERFORM14 (3, 14) TO COMPUTED-N.                        NC2014.2 199 360
   001403         140600     MOVE 25.0 TO CORRECT-N.                                      NC2014.2 374
   001404         140700     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001405         140800     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001406         140900     MOVE PERFORM14 (3, 20) TO COMPUTED-N.                        NC2014.2 199 360
   001407         141000     MOVE 30.0 TO CORRECT-N.                                      NC2014.2 374
   001408         141100     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001409         141200     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001410         141300     MOVE PERFORM14 (2,  2) TO COMPUTED-N.                        NC2014.2 199 360
   001411         141400     MOVE 35.0 TO CORRECT-N.                                      NC2014.2 374
   001412         141500     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001413         141600     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001414         141700     MOVE PERFORM14 (2,  8) TO COMPUTED-N.                        NC2014.2 199 360
   001415         141800     MOVE 40.0 TO CORRECT-N.                                      NC2014.2 374
   001416         141900     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001417         142000     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001418         142100     MOVE PERFORM14 (2, 14) TO COMPUTED-N.                        NC2014.2 199 360
   001419         142200     MOVE 45.0 TO CORRECT-N.                                      NC2014.2 374
   001420         142300     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001421         142400     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001422         142500     MOVE PERFORM14 (2, 20) TO COMPUTED-N.                        NC2014.2 199 360
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142600     MOVE 50.0 TO CORRECT-N.                                      NC2014.2 374
   001424         142700     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001425         142800     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001426         142900     MOVE PERFORM2 TO COMPUTED-N.                                 NC2014.2 187 360
   001427         143000     MOVE    2 TO CORRECT-N.                                      NC2014.2 374
   001428         143100     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001429         143200     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001430         143300     MOVE PERFORM3 TO COMPUTED-N.                                 NC2014.2 188 360
   001431         143400     MOVE    1 TO CORRECT-N.                                      NC2014.2 374
   001432         143500     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001433         143600     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001434         143700     MOVE XRAY TO COMPUTED-A.                                     NC2014.2 77 359
   001435         143800     MOVE "A" TO CORRECT-A.                                       NC2014.2 373
   001436         143900 PFM-WRITE-F4-13.                                                 NC2014.2
   001437         144000     MOVE "PFM-TEST-F4-13" TO PAR-NAME.                           NC2014.2 348
   001438         144100     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001439         144200*                                                                 NC2014.2
   001440         144300 PFM-INIT-F4-14.                                                  NC2014.2
   001441         144400*    ===--> "WITH TEST AFTER" PHRASE <--===                       NC2014.2
   001442         144500     MOVE   "VI-117/8 6.20.4 GR10(d)2" TO ANSI-REFERENCE.         NC2014.2 404
   001443         144600     MOVE   "PFM-TEST-F4-14" TO PAR-NAME.                         NC2014.2 348
   001444         144700     MOVE    ZEROS TO PERFORM12.                                  NC2014.2 IMP 197
   001445         144800     MOVE    SPACE TO XRAY.                                       NC2014.2 IMP 77
   001446         144900     MOVE    6  TO PERFORM11.                                     NC2014.2 196
   001447         145000     MOVE   -1  TO PERFORM10.                                     NC2014.2 195
   001448         145100     MOVE    2  TO PERFORM9.                                      NC2014.2 194
   001449         145200     MOVE    1  TO PERFORM4.                                      NC2014.2 189
   001450         145300     MOVE    2  TO PERFORM3.                                      NC2014.2 188
   001451         145400     MOVE    20 TO PERFORM2.                                      NC2014.2 187
   001452         145500     MOVE    1  TO REC-CT.                                        NC2014.2 395
   001453         145600*    NOTE:   IN THIS TEST TWO SUBSCRIPTS ARE VARIED.              NC2014.2
   001454         145700 PFM-TEST-F4-14-0.                                                NC2014.2
   001455         145800     PERFORM PFM-I-F4-14 THRU PFM-J-F4-14 WITH TEST AFTER         NC2014.2 1461 1464
   001456         145900             VARYING PERFORM3 FROM PERFORM9 BY PERFORM10          NC2014.2 188 194 195
   001457         146000               UNTIL PERFORM3 EQUAL TO 1                          NC2014.2 188
   001458         146100               AFTER PERFORM2 FROM 2 BY PERFORM11                 NC2014.2 187 196
   001459         146200               UNTIL PERFORM2 GREATER THAN 19.                    NC2014.2 187
   001460         146300     GO TO   PFM-TEST-F4-14-1.                                    NC2014.2 1472
   001461         146400 PFM-I-F4-14.                                                     NC2014.2
   001462         146500     MULTIPLY PERFORM4 BY 10 GIVING PERFORM14                     NC2014.2 189 199
   001463         146600         (PERFORM3, PERFORM2).                                    NC2014.2 188 187
   001464         146700 PFM-J-F4-14.                                                     NC2014.2
   001465         146800     ADD .5 TO PERFORM4.                                          NC2014.2 189
   001466         146900     MOVE    1 TO PERFORM3.                                       NC2014.2 188
   001467         147000     MOVE    99 TO PERFORM2.                                      NC2014.2 187
   001468         147100 PFM-DELETE-F4-14.                                                NC2014.2
   001469         147200     PERFORM DE-LETE.                                             NC2014.2 500
   001470         147300     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001471         147400     GO TO   PFM-INIT-F4-15.                                      NC2014.2 1495
   001472         147500 PFM-TEST-F4-14-1.                                                NC2014.2
   001473         147600     MOVE   "PFM-TEST-F4-14-1" TO PAR-NAME.                       NC2014.2 348
   001474         147700     IF      PERFORM14 (2, 2) NOT EQUAL TO 10.0                   NC2014.2 199
   001475      1  147800             MOVE PERFORM14 (2, 2) TO COMPUTED-N                  NC2014.2 199 360
   001476      1  147900             MOVE 10.0 TO CORRECT-N                               NC2014.2 374
   001477      1  148000             PERFORM FAIL                                         NC2014.2 499
   001478      1  148100             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001479         148200     ELSE                                                         NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480      1  148300             PERFORM PASS                                         NC2014.2 498
   001481      1  148400             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001482         148500     MOVE    SPACE TO P-OR-F.                                     NC2014.2 IMP 346
   001483         148600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001484         148700 PFM-TEST-F4-14-2.                                                NC2014.2
   001485         148800     MOVE   "PFM-TEST-F4-14-2" TO PAR-NAME.                       NC2014.2 348
   001486         148900     IF      PERFORM4  NOT = 1.5                                  NC2014.2 189
   001487      1  149000             MOVE PERFORM4  TO COMPUTED-N                         NC2014.2 189 360
   001488      1  149100             MOVE 1.5  TO CORRECT-N                               NC2014.2 374
   001489      1  149200             PERFORM FAIL                                         NC2014.2 499
   001490      1  149300             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001491         149400     ELSE                                                         NC2014.2
   001492      1  149500             PERFORM PASS                                         NC2014.2 498
   001493      1  149600             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001494         149700*                                                                 NC2014.2
   001495         149800 PFM-INIT-F4-15.                                                  NC2014.2
   001496         149900*    ===--> "     TEST AFTER " PHRASE <--===                      NC2014.2
   001497         150000     MOVE   "VI-117/8 6.20.4 GR10(d)2" TO ANSI-REFERENCE.         NC2014.2 404
   001498         150100     MOVE   "PFM-TEST-F4-15"           TO PAR-NAME.               NC2014.2 348
   001499         150200     MOVE    ZEROS TO PERFORM12.                                  NC2014.2 IMP 197
   001500         150300     MOVE     1 TO REC-CT.                                        NC2014.2 395
   001501         150400     MOVE    20 TO PERFORM2.                                      NC2014.2 187
   001502         150500     MOVE     5 TO PERFORM3.                                      NC2014.2 188
   001503         150600     MOVE     1 TO PERFORM4.                                      NC2014.2 189
   001504         150700     MOVE     3 TO PERFORM9.                                      NC2014.2 194
   001505         150800     MOVE    -1 TO PERFORM10.                                     NC2014.2 195
   001506         150900     MOVE     6 TO PERFORM11.                                     NC2014.2 196
   001507         151000*    NOTE IN THIS TEST TWO SUBSCRIPTS ARE VARIED.                 NC2014.2
   001508         151100 PFM-TEST-F4-15-0.                                                NC2014.2
   001509         151200     PERFORM PFM-I-F4-15 THRU PFM-J-F4-15 TEST AFTER              NC2014.2 1515 1518
   001510         151300             VARYING PERFORM3 FROM PERFORM9 BY PERFORM10          NC2014.2 188 194 195
   001511         151400               UNTIL PERFORM3 EQUAL TO 2                          NC2014.2 188
   001512         151500               AFTER PERFORM2 FROM 2 BY PERFORM11                 NC2014.2 187 196
   001513         151600               UNTIL PERFORM2 GREATER THAN 19.                    NC2014.2 187
   001514         151700     GO TO   PFM-TEST-F4-15-1.                                    NC2014.2 1525
   001515         151800 PFM-I-F4-15.                                                     NC2014.2
   001516         151900     MULTIPLY PERFORM4 BY 10 GIVING PERFORM14                     NC2014.2 189 199
   001517         152000         (PERFORM3, PERFORM2).                                    NC2014.2 188 187
   001518         152100 PFM-J-F4-15.                                                     NC2014.2
   001519         152200     ADD .5 TO PERFORM4.                                          NC2014.2 189
   001520         152300     MOVE 20 TO PERFORM2.                                         NC2014.2 187
   001521         152400 PFM-DELETE-F4-15.                                                NC2014.2
   001522         152500     PERFORM DE-LETE.                                             NC2014.2 500
   001523         152600     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001524         152700     GO TO   PFM-INIT-F4-16.                                      NC2014.2 1545
   001525         152800 PFM-TEST-F4-15-1.                                                NC2014.2
   001526         152900     IF      PERFORM14 (2, 2) NOT = 15.0                          NC2014.2 199
   001527      1  153000             MOVE    PERFORM14 (2, 2) TO COMPUTED-N               NC2014.2 199 360
   001528      1  153100             MOVE    15.0 TO CORRECT-N                            NC2014.2 374
   001529      1  153200             PERFORM FAIL                                         NC2014.2 499
   001530      1  153300             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001531         153400     ELSE                                                         NC2014.2
   001532      1  153500             PERFORM PASS                                         NC2014.2 498
   001533      1  153600             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001534         153700     ADD     1 TO REC-CT.                                         NC2014.2 395
   001535         153800 PFM-TEST-F4-15-2.                                                NC2014.2
   001536         153900     IF      PERFORM14 (3, 2) NOT = 10.0                          NC2014.2 199
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537      1  154000             MOVE    PERFORM14 (3, 2) TO COMPUTED-N               NC2014.2 199 360
   001538      1  154100             MOVE    10.0 TO CORRECT-N                            NC2014.2 374
   001539      1  154200             PERFORM FAIL                                         NC2014.2 499
   001540      1  154300             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001541         154400     ELSE                                                         NC2014.2
   001542      1  154500             PERFORM PASS                                         NC2014.2 498
   001543      1  154600             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001544         154700*                                                                 NC2014.2
   001545         154800 PFM-INIT-F4-16.                                                  NC2014.2
   001546         154900*    ===-->  6 AFTER PHRASES          <--===                      NC2014.2
   001547         155000     MOVE   "VI-110 6.20.3 SR12" TO ANSI-REFERENCE.               NC2014.2 404
   001548         155100     MOVE   "PFM-TEST-F4-16"           TO PAR-NAME.               NC2014.2 348
   001549         155200     MOVE    SPACES TO PERFORM-SEVEN-LEVEL-TABLE.                 NC2014.2 IMP 205
   001550         155300     MOVE    0 TO PFM-7-TOT.                                      NC2014.2 221
   001551         155400     MOVE     1 TO REC-CT.                                        NC2014.2 395
   001552         155500     MOVE     1 TO S1 S2 S3 S4 S5 S6 S7.                          NC2014.2 214 215 216 217 218 219 220
   001553         155600*    NOTE IN THIS TEST SEVEN SUBSCRIPTS ARE VARIED.               NC2014.2
   001554         155700 PFM-TEST-F4-16-0.                                                NC2014.2
   001555         155800     PERFORM PFM-I-F4-16 THRU PFM-J-F4-16                         NC2014.2 1571 1573
   001556         155900             VARYING S1 FROM 1 BY 1                               NC2014.2 214
   001557         156000               UNTIL S1 = 3                                       NC2014.2 214
   001558         156100               AFTER S2 FROM 1 BY 1                               NC2014.2 215
   001559         156200               UNTIL S2 = 3                                       NC2014.2 215
   001560         156300               AFTER S3 FROM 1 BY 1                               NC2014.2 216
   001561         156400               UNTIL S3 = 3                                       NC2014.2 216
   001562         156500               AFTER S4 FROM 1 BY 1                               NC2014.2 217
   001563         156600               UNTIL S4 = 3                                       NC2014.2 217
   001564         156700               AFTER S5 FROM 1 BY 1                               NC2014.2 218
   001565         156800               UNTIL S5 = 3                                       NC2014.2 218
   001566         156900               AFTER S6 FROM 1 BY 1                               NC2014.2 219
   001567         157000               UNTIL S6 = 3                                       NC2014.2 219
   001568         157100               AFTER S7 FROM 1 BY 1                               NC2014.2 220
   001569         157200               UNTIL S7 = 3.                                      NC2014.2 220
   001570         157300     GO TO   PFM-TEST-F4-16-1.                                    NC2014.2 1579
   001571         157400 PFM-I-F4-16.                                                     NC2014.2
   001572         157500     MOVE   "*" TO PFM77-1 (S1 S2 S3 S4 S5 S6 S7).                NC2014.2 213 214 215 216 217 218 219 220
   001573         157600 PFM-J-F4-16.                                                     NC2014.2
   001574         157700     ADD     1  TO PFM-7-TOT.                                     NC2014.2 221
   001575         157800 PFM-DELETE-F4-16.                                                NC2014.2
   001576         157900     PERFORM DE-LETE.                                             NC2014.2 500
   001577         158000     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001578         158100     GO TO   PFM-INIT-F4-17.                                      NC2014.2 1669
   001579         158200 PFM-TEST-F4-16-1.                                                NC2014.2
   001580         158300     IF      PFM77-1 (1 1 1 1 1 1 1) NOT = "*"                    NC2014.2 213
   001581      1  158400             MOVE    PFM77-1 (1 1 1 1 1 1 1) TO COMPUTED-A        NC2014.2 213 359
   001582      1  158500             MOVE   "*" TO CORRECT-A                              NC2014.2 373
   001583      1  158600             PERFORM FAIL                                         NC2014.2 499
   001584      1  158700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001585         158800     ELSE                                                         NC2014.2
   001586      1  158900             PERFORM PASS                                         NC2014.2 498
   001587      1  159000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001588         159100     ADD     1 TO REC-CT.                                         NC2014.2 395
   001589         159200 PFM-TEST-F4-16-2.                                                NC2014.2
   001590         159300     IF      PFM77-1 (1 1 1 1 1 1 2) NOT = "*"                    NC2014.2 213
   001591      1  159400             MOVE    PFM77-1 (1 1 1 1 1 1 2) TO COMPUTED-A        NC2014.2 213 359
   001592      1  159500             MOVE   "*" TO CORRECT-A                              NC2014.2 373
   001593      1  159600             PERFORM FAIL                                         NC2014.2 499
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594      1  159700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001595         159800     ELSE                                                         NC2014.2
   001596      1  159900             PERFORM PASS                                         NC2014.2 498
   001597      1  160000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001598         160100     ADD     1 TO REC-CT.                                         NC2014.2 395
   001599         160200 PFM-TEST-F4-16-3.                                                NC2014.2
   001600         160300     IF      PFM77-1 (1 1 1 1 1 2 1) NOT = "*"                    NC2014.2 213
   001601      1  160400             MOVE    PFM77-1 (1 1 1 1 1 2 1) TO COMPUTED-A        NC2014.2 213 359
   001602      1  160500             MOVE   "*" TO CORRECT-A                              NC2014.2 373
   001603      1  160600             PERFORM FAIL                                         NC2014.2 499
   001604      1  160700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001605         160800     ELSE                                                         NC2014.2
   001606      1  160900             PERFORM PASS                                         NC2014.2 498
   001607      1  161000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001608         161100     ADD     1 TO REC-CT.                                         NC2014.2 395
   001609         161200 PFM-TEST-F4-16-4.                                                NC2014.2
   001610         161300     IF      PFM77-1 (1 1 1 1 1 2 2) NOT = "*"                    NC2014.2 213
   001611      1  161400             MOVE    PFM77-1 (1 1 1 1 1 2 2) TO COMPUTED-A        NC2014.2 213 359
   001612      1  161500             MOVE   "*" TO CORRECT-A                              NC2014.2 373
   001613      1  161600             PERFORM FAIL                                         NC2014.2 499
   001614      1  161700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001615         161800     ELSE                                                         NC2014.2
   001616      1  161900             PERFORM PASS                                         NC2014.2 498
   001617      1  162000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001618         162100     ADD     1 TO REC-CT.                                         NC2014.2 395
   001619         162200 PFM-TEST-F4-16-5.                                                NC2014.2
   001620         162300     IF      PFM77-1 (1 1 1 1 2 1 1) NOT = "*"                    NC2014.2 213
   001621      1  162400             MOVE    PFM77-1 (1 1 1 1 2 1 1) TO COMPUTED-A        NC2014.2 213 359
   001622      1  162500             MOVE   "*" TO CORRECT-A                              NC2014.2 373
   001623      1  162600             PERFORM FAIL                                         NC2014.2 499
   001624      1  162700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001625         162800     ELSE                                                         NC2014.2
   001626      1  162900             PERFORM PASS                                         NC2014.2 498
   001627      1  163000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001628         163100     ADD     1 TO REC-CT.                                         NC2014.2 395
   001629         163200 PFM-TEST-F4-16-6.                                                NC2014.2
   001630         163300     IF      PFM77-1 (1 1 1 1 2 1 2) NOT = "*"                    NC2014.2 213
   001631      1  163400             MOVE    PFM77-1 (1 1 1 1 2 1 2) TO COMPUTED-A        NC2014.2 213 359
   001632      1  163500             MOVE   "*" TO CORRECT-A                              NC2014.2 373
   001633      1  163600             PERFORM FAIL                                         NC2014.2 499
   001634      1  163700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001635         163800     ELSE                                                         NC2014.2
   001636      1  163900             PERFORM PASS                                         NC2014.2 498
   001637      1  164000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001638         164100     ADD     1 TO REC-CT.                                         NC2014.2 395
   001639         164200 PFM-TEST-F4-16-7.                                                NC2014.2
   001640         164300     IF      PFM77-1 (1 1 1 2 1 1 1) NOT = "*"                    NC2014.2 213
   001641      1  164400             MOVE    PFM77-1 (1 1 1 2 1 1 1) TO COMPUTED-A        NC2014.2 213 359
   001642      1  164500             MOVE   "*" TO CORRECT-A                              NC2014.2 373
   001643      1  164600             PERFORM FAIL                                         NC2014.2 499
   001644      1  164700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001645         164800     ELSE                                                         NC2014.2
   001646      1  164900             PERFORM PASS                                         NC2014.2 498
   001647      1  165000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001648         165100     ADD     1 TO REC-CT.                                         NC2014.2 395
   001649         165200 PFM-TEST-F4-16-9.                                                NC2014.2
   001650         165300     IF      PFM77-1 (1 1 1 2 1 1 2) NOT = "*"                    NC2014.2 213
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651      1  165400             MOVE    PFM77-1 (1 1 1 2 1 1 2) TO COMPUTED-A        NC2014.2 213 359
   001652      1  165500             MOVE   "*" TO CORRECT-A                              NC2014.2 373
   001653      1  165600             PERFORM FAIL                                         NC2014.2 499
   001654      1  165700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001655         165800     ELSE                                                         NC2014.2
   001656      1  165900             PERFORM PASS                                         NC2014.2 498
   001657      1  166000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001658         166100     ADD     1 TO REC-CT.                                         NC2014.2 395
   001659         166200 PFM-TEST-F4-16-10.                                               NC2014.2
   001660         166300     IF      PFM-7-TOT NOT = 128                                  NC2014.2 221
   001661      1  166400             MOVE    PFM-7-TOT TO COMPUTED-18V0                   NC2014.2 221 366
   001662      1  166500             MOVE    128 TO CORRECT-18V0                          NC2014.2 379
   001663      1  166600             PERFORM FAIL                                         NC2014.2 499
   001664      1  166700             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001665         166800     ELSE                                                         NC2014.2
   001666      1  166900             PERFORM PASS                                         NC2014.2 498
   001667      1  167000             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001668         167100*                                                                 NC2014.2
   001669         167200 PFM-INIT-F4-17.                                                  NC2014.2
   001670         167300*    ===-->  6 AFTER PHRASES          <--===                      NC2014.2
   001671         167400*    ===--> "WITH TEST BEFORE" PHRASE <--===                      NC2014.2
   001672         167500     MOVE   "PFM-TEST-F4-17"           TO PAR-NAME.               NC2014.2 348
   001673         167600     MOVE   "VI-114 6.20.4 GR10(d)2" TO ANSI-REFERENCE.           NC2014.2 404
   001674         167700     MOVE    SPACES TO PERFORM-SEVEN-LEVEL-TABLE.                 NC2014.2 IMP 205
   001675         167800     MOVE    101 TO COUNT-DU-6V0.                                 NC2014.2 52
   001676         167900     MOVE    0   TO PFM-7-TOT.                                    NC2014.2 221
   001677         168000     MOVE    1 TO REC-CT.                                         NC2014.2 395
   001678         168100*    NOTE IN THIS TEST SEVEN SUBSCRIPTS ARE VARIED.               NC2014.2
   001679         168200 PFM-TEST-F4-17-0.                                                NC2014.2
   001680         168300     PERFORM PFM-I-F4-17 THRU PFM-J-F4-17 WITH TEST BEFORE        NC2014.2 1696 1698
   001681         168400             VARYING S1 FROM 1 BY 1                               NC2014.2 214
   001682         168500               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001683         168600               AFTER S2 FROM 1 BY 1                               NC2014.2 215
   001684         168700               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001685         168800               AFTER S3 FROM 1 BY 1                               NC2014.2 216
   001686         168900               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001687         169000               AFTER S4 FROM 1 BY 1                               NC2014.2 217
   001688         169100               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001689         169200               AFTER S5 FROM 1 BY 1                               NC2014.2 218
   001690         169300               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001691         169400               AFTER S6 FROM 1 BY 1                               NC2014.2 219
   001692         169500               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001693         169600               AFTER S7 FROM 1 BY 1                               NC2014.2 220
   001694         169700               UNTIL COUNT-DU-6V0 > 100.                          NC2014.2 52
   001695         169800     GO TO   PFM-TEST-F4-17-1.                                    NC2014.2 1704
   001696         169900 PFM-I-F4-17.                                                     NC2014.2
   001697         170000     MOVE   "*" TO PFM77-1 (S1 S2 S3 S4 S5 S6 S7).                NC2014.2 213 214 215 216 217 218 219 220
   001698         170100 PFM-J-F4-17.                                                     NC2014.2
   001699         170200     ADD     1  TO PFM-7-TOT.                                     NC2014.2 221
   001700         170300 PFM-DELETE-F4-17.                                                NC2014.2
   001701         170400     PERFORM DE-LETE.                                             NC2014.2 500
   001702         170500     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001703         170600     GO TO   PFM-INIT-F4-18.                                      NC2014.2 1794
   001704         170700 PFM-TEST-F4-17-1.                                                NC2014.2
   001705         170800     IF      PFM77-1 (1 1 1 1 1 1 1) NOT = SPACE                  NC2014.2 213 IMP
   001706      1  170900             MOVE    PFM77-1 (1 1 1 1 1 1 1) TO COMPUTED-A        NC2014.2 213 359
   001707      1  171000             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708      1  171100             PERFORM FAIL                                         NC2014.2 499
   001709      1  171200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001710         171300     ELSE                                                         NC2014.2
   001711      1  171400             PERFORM PASS                                         NC2014.2 498
   001712      1  171500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001713         171600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001714         171700 PFM-TEST-F4-17-2.                                                NC2014.2
   001715         171800     IF      PFM77-1 (1 1 1 1 1 1 2) NOT = SPACE                  NC2014.2 213 IMP
   001716      1  171900             MOVE    PFM77-1 (1 1 1 1 1 1 2) TO COMPUTED-A        NC2014.2 213 359
   001717      1  172000             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001718      1  172100             PERFORM FAIL                                         NC2014.2 499
   001719      1  172200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001720         172300     ELSE                                                         NC2014.2
   001721      1  172400             PERFORM PASS                                         NC2014.2 498
   001722      1  172500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001723         172600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001724         172700 PFM-TEST-F4-17-3.                                                NC2014.2
   001725         172800     IF      PFM77-1 (1 1 1 1 1 2 1) NOT = SPACE                  NC2014.2 213 IMP
   001726      1  172900             MOVE    PFM77-1 (1 1 1 1 1 2 1) TO COMPUTED-A        NC2014.2 213 359
   001727      1  173000             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001728      1  173100             PERFORM FAIL                                         NC2014.2 499
   001729      1  173200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001730         173300     ELSE                                                         NC2014.2
   001731      1  173400             PERFORM PASS                                         NC2014.2 498
   001732      1  173500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001733         173600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001734         173700 PFM-TEST-F4-17-4.                                                NC2014.2
   001735         173800     IF      PFM77-1 (1 1 1 1 1 2 2) NOT = SPACE                  NC2014.2 213 IMP
   001736      1  173900             MOVE    PFM77-1 (1 1 1 1 1 2 2) TO COMPUTED-A        NC2014.2 213 359
   001737      1  174000             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001738      1  174100             PERFORM FAIL                                         NC2014.2 499
   001739      1  174200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001740         174300     ELSE                                                         NC2014.2
   001741      1  174400             PERFORM PASS                                         NC2014.2 498
   001742      1  174500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001743         174600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001744         174700 PFM-TEST-F4-17-5.                                                NC2014.2
   001745         174800     IF      PFM77-1 (1 1 1 1 2 1 1) NOT = SPACE                  NC2014.2 213 IMP
   001746      1  174900             MOVE    PFM77-1 (1 1 1 1 2 1 1) TO COMPUTED-A        NC2014.2 213 359
   001747      1  175000             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001748      1  175100             PERFORM FAIL                                         NC2014.2 499
   001749      1  175200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001750         175300     ELSE                                                         NC2014.2
   001751      1  175400             PERFORM PASS                                         NC2014.2 498
   001752      1  175500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001753         175600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001754         175700 PFM-TEST-F4-17-6.                                                NC2014.2
   001755         175800     IF      PFM77-1 (1 1 1 1 2 1 2) NOT = SPACE                  NC2014.2 213 IMP
   001756      1  175900             MOVE    PFM77-1 (1 1 1 1 2 1 2) TO COMPUTED-A        NC2014.2 213 359
   001757      1  176000             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001758      1  176100             PERFORM FAIL                                         NC2014.2 499
   001759      1  176200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001760         176300     ELSE                                                         NC2014.2
   001761      1  176400             PERFORM PASS                                         NC2014.2 498
   001762      1  176500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001763         176600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001764         176700 PFM-TEST-F4-17-7.                                                NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176800     IF      PFM77-1 (1 1 1 2 1 1 1) NOT = SPACE                  NC2014.2 213 IMP
   001766      1  176900             MOVE    PFM77-1 (1 1 1 2 1 1 1) TO COMPUTED-A        NC2014.2 213 359
   001767      1  177000             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001768      1  177100             PERFORM FAIL                                         NC2014.2 499
   001769      1  177200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001770         177300     ELSE                                                         NC2014.2
   001771      1  177400             PERFORM PASS                                         NC2014.2 498
   001772      1  177500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001773         177600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001774         177700 PFM-TEST-F4-17-8.                                                NC2014.2
   001775         177800     IF      PFM77-1 (1 1 1 2 1 1 2) NOT = SPACE                  NC2014.2 213 IMP
   001776      1  177900             MOVE    PFM77-1 (1 1 1 2 1 1 2) TO COMPUTED-A        NC2014.2 213 359
   001777      1  178000             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001778      1  178100             PERFORM FAIL                                         NC2014.2 499
   001779      1  178200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001780         178300     ELSE                                                         NC2014.2
   001781      1  178400             PERFORM PASS                                         NC2014.2 498
   001782      1  178500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001783         178600     ADD     1 TO REC-CT.                                         NC2014.2 395
   001784         178700 PFM-TEST-F4-17-9.                                                NC2014.2
   001785         178800     IF      PFM-7-TOT NOT = ZERO                                 NC2014.2 221 IMP
   001786      1  178900             MOVE    PFM-7-TOT TO COMPUTED-18V0                   NC2014.2 221 366
   001787      1  179000             MOVE    ZERO TO CORRECT-18V0                         NC2014.2 IMP 379
   001788      1  179100             PERFORM FAIL                                         NC2014.2 499
   001789      1  179200             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001790         179300     ELSE                                                         NC2014.2
   001791      1  179400             PERFORM PASS                                         NC2014.2 498
   001792      1  179500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001793         179600*                                                                 NC2014.2
   001794         179700 PFM-INIT-F4-18.                                                  NC2014.2
   001795         179800*    ===-->  6 AFTER PHRASES          <--===                      NC2014.2
   001796         179900*    ===-->  TEST AFTER" PHRASE       <--===                      NC2014.2
   001797         180000     MOVE   "PFM-TEST-F4-18"           TO PAR-NAME.               NC2014.2 348
   001798         180100     MOVE   "VI-119 6.20.4 GR10(d)2" TO ANSI-REFERENCE.           NC2014.2 404
   001799         180200     MOVE    SPACES TO PERFORM-SEVEN-LEVEL-TABLE.                 NC2014.2 IMP 205
   001800         180300     MOVE    0 TO COUNT-DU-6V0.                                   NC2014.2 52
   001801         180400     MOVE    0 TO PFM-7-TOT.                                      NC2014.2 221
   001802         180500     MOVE    1 TO REC-CT.                                         NC2014.2 395
   001803         180600*    NOTE IN THIS TEST SEVEN SUBSCRIPTS ARE VARIED.               NC2014.2
   001804         180700 PFM-TEST-F4-18-0.                                                NC2014.2
   001805         180800     PERFORM PFM-I-F4-18 THRU PFM-J-F4-18 TEST AFTER              NC2014.2 1821 1824
   001806         180900             VARYING S1 FROM 1 BY 1                               NC2014.2 214
   001807         181000               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001808         181100               AFTER S2 FROM 1 BY 1                               NC2014.2 215
   001809         181200               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001810         181300               AFTER S3 FROM 1 BY 1                               NC2014.2 216
   001811         181400               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001812         181500               AFTER S4 FROM 1 BY 1                               NC2014.2 217
   001813         181600               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001814         181700               AFTER S5 FROM 1 BY 1                               NC2014.2 218
   001815         181800               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001816         181900               AFTER S6 FROM 1 BY 1                               NC2014.2 219
   001817         182000               UNTIL COUNT-DU-6V0 > 100                           NC2014.2 52
   001818         182100               AFTER S7 FROM 1 BY 1                               NC2014.2 220
   001819         182200               UNTIL COUNT-DU-6V0 > 100.                          NC2014.2 52
   001820         182300     GO TO   PFM-TEST-F4-18-1.                                    NC2014.2 1830
   001821         182400 PFM-I-F4-18.                                                     NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182500     MOVE   "*" TO PFM77-1 (S1 S2 S3 S4 S5 S6 S7).                NC2014.2 213 214 215 216 217 218 219 220
   001823         182600     MOVE    101 TO COUNT-DU-6V0.                                 NC2014.2 52
   001824         182700 PFM-J-F4-18.                                                     NC2014.2
   001825         182800     ADD     1  TO PFM-7-TOT.                                     NC2014.2 221
   001826         182900 PFM-DELETE-F4-18.                                                NC2014.2
   001827         183000     PERFORM DE-LETE.                                             NC2014.2 500
   001828         183100     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001829         183200     GO TO   PFM-INIT-F4-20.                                      NC2014.2 1922
   001830         183300 PFM-TEST-F4-18-1.                                                NC2014.2
   001831         183400     IF      PFM77-1 (1 1 1 1 1 1 1) NOT = "*"                    NC2014.2 213
   001832      1  183500             MOVE    PFM77-1 (1 1 1 1 1 1 1) TO COMPUTED-A        NC2014.2 213 359
   001833      1  183600             MOVE   "*"  TO CORRECT-A                             NC2014.2 373
   001834      1  183700             PERFORM FAIL                                         NC2014.2 499
   001835      1  183800             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001836         183900     ELSE                                                         NC2014.2
   001837      1  184000             PERFORM PASS                                         NC2014.2 498
   001838      1  184100             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001839         184200     ADD     1 TO REC-CT.                                         NC2014.2 395
   001840         184300 PFM-TEST-F4-18-2.                                                NC2014.2
   001841         184400     IF      PFM77-1 (1 1 1 1 1 1 2) NOT = SPACE                  NC2014.2 213 IMP
   001842      1  184500             MOVE    PFM77-1 (1 1 1 1 1 1 2) TO COMPUTED-A        NC2014.2 213 359
   001843      1  184600             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001844      1  184700             PERFORM FAIL                                         NC2014.2 499
   001845      1  184800             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001846         184900     ELSE                                                         NC2014.2
   001847      1  185000             PERFORM PASS                                         NC2014.2 498
   001848      1  185100             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001849         185200     ADD     1 TO REC-CT.                                         NC2014.2 395
   001850         185300 PFM-TEST-F4-18-3.                                                NC2014.2
   001851         185400     IF      PFM77-1 (1 1 1 1 1 2 1) NOT = SPACE                  NC2014.2 213 IMP
   001852      1  185500             MOVE    PFM77-1 (1 1 1 1 1 2 1) TO COMPUTED-A        NC2014.2 213 359
   001853      1  185600             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001854      1  185700             PERFORM FAIL                                         NC2014.2 499
   001855      1  185800             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001856         185900     ELSE                                                         NC2014.2
   001857      1  186000             PERFORM PASS                                         NC2014.2 498
   001858      1  186100             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001859         186200     ADD     1 TO REC-CT.                                         NC2014.2 395
   001860         186300 PFM-TEST-F4-18-4.                                                NC2014.2
   001861         186400     IF      PFM77-1 (1 1 1 1 1 2 2) NOT = SPACE                  NC2014.2 213 IMP
   001862      1  186500             MOVE    PFM77-1 (1 1 1 1 1 2 2) TO COMPUTED-A        NC2014.2 213 359
   001863      1  186600             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001864      1  186700             PERFORM FAIL                                         NC2014.2 499
   001865      1  186800             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001866         186900     ELSE                                                         NC2014.2
   001867      1  187000             PERFORM PASS                                         NC2014.2 498
   001868      1  187100             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001869         187200     ADD     1 TO REC-CT.                                         NC2014.2 395
   001870         187300 PFM-TEST-F4-18-5.                                                NC2014.2
   001871         187400     IF      PFM77-1 (1 1 1 1 2 1 1) NOT = SPACE                  NC2014.2 213 IMP
   001872      1  187500             MOVE    PFM77-1 (1 1 1 1 2 1 1) TO COMPUTED-A        NC2014.2 213 359
   001873      1  187600             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001874      1  187700             PERFORM FAIL                                         NC2014.2 499
   001875      1  187800             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001876         187900     ELSE                                                         NC2014.2
   001877      1  188000             PERFORM PASS                                         NC2014.2 498
   001878      1  188100             PERFORM PRINT-DETAIL.                                NC2014.2 502
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188200     ADD     1 TO REC-CT.                                         NC2014.2 395
   001880         188300 PFM-TEST-F4-18-6.                                                NC2014.2
   001881         188400     IF      PFM77-1 (1 1 1 1 2 1 2) NOT = SPACE                  NC2014.2 213 IMP
   001882      1  188500             MOVE    PFM77-1 (1 1 1 1 2 1 2) TO COMPUTED-A        NC2014.2 213 359
   001883      1  188600             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001884      1  188700             PERFORM FAIL                                         NC2014.2 499
   001885      1  188800             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001886         188900     ELSE                                                         NC2014.2
   001887      1  189000             PERFORM PASS                                         NC2014.2 498
   001888      1  189100             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001889         189200     ADD     1 TO REC-CT.                                         NC2014.2 395
   001890         189300 PFM-TEST-F4-18-7.                                                NC2014.2
   001891         189400     IF      PFM77-1 (1 1 1 2 1 1 1) NOT = SPACE                  NC2014.2 213 IMP
   001892      1  189500             MOVE    PFM77-1 (1 1 1 2 1 1 1) TO COMPUTED-A        NC2014.2 213 359
   001893      1  189600             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001894      1  189700             MOVE   "PFM-TEST-F4-18-8" TO PAR-NAME                NC2014.2 348
   001895      1  189800             PERFORM FAIL                                         NC2014.2 499
   001896      1  189900             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001897         190000     ELSE                                                         NC2014.2
   001898      1  190100             PERFORM PASS                                         NC2014.2 498
   001899      1  190200             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001900         190300     ADD     1 TO REC-CT.                                         NC2014.2 395
   001901         190400 PFM-TEST-F4-18-8.                                                NC2014.2
   001902         190500     IF      PFM77-1 (1 1 1 2 1 1 2) NOT = SPACE                  NC2014.2 213 IMP
   001903      1  190600             MOVE    PFM77-1 (1 1 1 2 1 1 2) TO COMPUTED-A        NC2014.2 213 359
   001904      1  190700             MOVE    SPACE TO CORRECT-A                           NC2014.2 IMP 373
   001905      1  190800             PERFORM FAIL                                         NC2014.2 499
   001906      1  190900             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001907         191000     ELSE                                                         NC2014.2
   001908      1  191100             PERFORM PASS                                         NC2014.2 498
   001909      1  191200             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001910         191300     ADD     1 TO REC-CT.                                         NC2014.2 395
   001911         191400 PFM-TEST-F4-18-9.                                                NC2014.2
   001912         191500     IF      PFM-7-TOT NOT = 1                                    NC2014.2 221
   001913      1  191600             MOVE    PFM-7-TOT TO COMPUTED-18V0                   NC2014.2 221 366
   001914      1  191700             MOVE    1  TO CORRECT-18V0                           NC2014.2 379
   001915      1  191800             PERFORM FAIL                                         NC2014.2 499
   001916      1  191900             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001917         192000     ELSE                                                         NC2014.2
   001918      1  192100             PERFORM PASS                                         NC2014.2 498
   001919      1  192200             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001920         192300*                                                                 NC2014.2
   001921         192400*                                                                 NC2014.2
   001922         192500 PFM-INIT-F4-20.                                                  NC2014.2
   001923         192600     MOVE   "VI-112 6.20.4 GR10(d)" TO ANSI-REFERENCE             NC2014.2 404
   001924         192700     MOVE   "PFM-TEST-F4-20"        TO PAR-NAME.                  NC2014.2 348
   001925         192800     MOVE    SPACES TO PERFORM-SEVEN-LEVEL-TABLE.                 NC2014.2 IMP 205
   001926         192900     MOVE   "VARYING BY FRAC." TO FEATURE.                        NC2014.2 344
   001927         193000     MOVE   "PERFORM VARYING"  TO RE-MARK.                        NC2014.2 353
   001928         193100     MOVE    ZERO TO COUNT-DU-6V0.                                NC2014.2 IMP 52
   001929         193200     MOVE    ZERO TO REC-CT.                                      NC2014.2 IMP 395
   001930         193300 PFM-TEST-F4-20-0.                                                NC2014.2
   001931         193400     PERFORM PFM-LOOP-F4-20 THROUGH PFM-LOOP-F4-20-EXIT           NC2014.2 1940 1942
   001932         193500     VARYING WRK-DU-2V1-1                                         NC2014.2 41
   001933         193600        FROM WRK-DU-0V1-1 BY .1                                   NC2014.2 42
   001934         193700       UNTIL WRK-DU-2V1-1 + WRK-DU-2V1-3 > 12.1.                  NC2014.2 41 44
   001935         193800     GO TO   PFM-TEST-F4-20-1.                                    NC2014.2 1944
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900 PFM-DELETE-F4-20.                                                NC2014.2
   001937         194000     PERFORM DE-LETE.                                             NC2014.2 500
   001938         194100     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001939         194200     GO      TO PFM-INIT-F4-21.                                   NC2014.2 1954
   001940         194300 PFM-LOOP-F4-20.                                                  NC2014.2
   001941         194400     ADD     1 TO COUNT-DU-6V0.                                   NC2014.2 52
   001942         194500 PFM-LOOP-F4-20-EXIT.                                             NC2014.2
   001943         194600     EXIT.                                                        NC2014.2
   001944         194700 PFM-TEST-F4-20-1.                                                NC2014.2
   001945         194800     IF      COUNT-DU-6V0 = 10                                    NC2014.2 52
   001946      1  194900             PERFORM PASS                                         NC2014.2 498
   001947      1  195000             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001948         195100     ELSE                                                         NC2014.2
   001949      1  195200             PERFORM FAIL                                         NC2014.2 499
   001950      1  195300             MOVE    COUNT-DU-6V0 TO COMPUTED-N                   NC2014.2 52 360
   001951      1  195400             MOVE    10 TO CORRECT-N                              NC2014.2 374
   001952      1  195500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001953         195600*                                                                 NC2014.2
   001954         195700 PFM-INIT-F4-21.                                                  NC2014.2
   001955         195800     MOVE   "VI-112 6.20.4 GR10(d)" TO ANSI-REFERENCE             NC2014.2 404
   001956         195900     MOVE   "PFM-TEST-F4-21"        TO PAR-NAME.                  NC2014.2 348
   001957         196000     MOVE   "CHANGE BY INCR." TO FEATURE.                         NC2014.2 344
   001958         196100     MOVE   "PERFORM VARYING" TO RE-MARK.                         NC2014.2 353
   001959         196200     MOVE    ZERO TO COUNT-DU-6V0.                                NC2014.2 IMP 52
   001960         196300 PFM-TEST-F4-21-0.                                                NC2014.2
   001961         196400     PERFORM LOOP-FOR-F4-21 THRU LOOP-F4-21-EXIT                  NC2014.2 1969 1972
   001962         196500     VARYING WRK-DU-2V1-1 FROM WRK-DU-0V1-1 BY WRK-DU-2V1-2       NC2014.2 41 42 43
   001963         196600       UNTIL WRK-DU-2V1-1 + 11.1 > 12.1.                          NC2014.2 41
   001964         196700     GO TO   PFM-TEST-F4-21-1.                                    NC2014.2 1974
   001965         196800 PFM-DELETE-F4-21.                                                NC2014.2
   001966         196900     PERFORM DE-LETE.                                             NC2014.2 500
   001967         197000     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   001968         197100     GO TO   PFM-INIT-F4-22.                                      NC2014.2 1984
   001969         197200 LOOP-FOR-F4-21.                                                  NC2014.2
   001970         197300     ADD    1 TO COUNT-DU-6V0.                                    NC2014.2 52
   001971         197400     ADD   .1 TO WRK-DU-2V1-2.                                    NC2014.2 43
   001972         197500 LOOP-F4-21-EXIT.                                                 NC2014.2
   001973         197600     EXIT.                                                        NC2014.2
   001974         197700 PFM-TEST-F4-21-1.                                                NC2014.2
   001975         197800     IF      COUNT-DU-6V0 = 4                                     NC2014.2 52
   001976      1  197900             PERFORM PASS                                         NC2014.2 498
   001977      1  198000             PERFORM PRINT-DETAIL                                 NC2014.2 502
   001978         198100     ELSE                                                         NC2014.2
   001979      1  198200             PERFORM FAIL                                         NC2014.2 499
   001980      1  198300             MOVE    COUNT-DU-6V0 TO COMPUTED-N                   NC2014.2 52 360
   001981      1  198400             MOVE    4 TO CORRECT-N                               NC2014.2 374
   001982      1  198500             PERFORM PRINT-DETAIL.                                NC2014.2 502
   001983         198600*                                                                 NC2014.2
   001984         198700 PFM-INIT-F4-22.                                                  NC2014.2
   001985         198800*    ===-->  EXPLICIT SCOPE TERMINATOR <--===                     NC2014.2
   001986         198900     MOVE   "VI-110 6.20.4 GR5" TO ANSI-REFERENCE.                NC2014.2 404
   001987         199000     MOVE   "PFM-TEST-F4-22"    TO PAR-NAME.                      NC2014.2 348
   001988         199100     MOVE   "CHANGE BY INCR."   TO FEATURE.                       NC2014.2 344
   001989         199200     MOVE   "PERFORM VARYING"   TO RE-MARK.                       NC2014.2 353
   001990         199300     MOVE    44 TO PFM-12-ANS1.                                   NC2014.2 132
   001991         199400     MOVE    46 TO PFM-12-ANS2.                                   NC2014.2 133
   001992         199500*    NOTE  THIS PROGRAM TESTS THE ABILITY OF THE COMPILER TO      NC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993         199600*        PERFORM A STATEMENT WITH A VARYING CLAUSE INCLUDED.      NC2014.2
   001994         199700 PFM-TEST-F4-22-0.                                                NC2014.2
   001995         199800     PERFORM VARYING PFM-12-COUNTER FROM 100 BY 4                 NC2014.2 131
   001996         199900       UNTIL PFM-12-COUNTER NOT GREATER THAN 15                   NC2014.2 131
   001997         200000         AND PFM-12-ANS1 LESS THAN PFM-12-ANS2                    NC2014.2 132 133
   001998         200100          OR PFM-12-ANS2 GREATER THAN 50                          NC2014.2 133
   001999      1  200200             ADD      1   TO PFM-12-ANS2                          NC2014.2 133
   002000      1  200300             SUBTRACT 2 FROM PFM-12-ANS1                          NC2014.2 132
   002001      1  200400             IF       PFM-12-ANS2 GREATER THAN OR EQUAL TO        NC2014.2 133
   002002      1  200500                      PFM-12-ANS1                                 NC2014.2 132
   002003      2  200600                      DIVIDE PFM-12-COUNTER BY 2                  NC2014.2 131
   002004      2  200700                      GIVING PFM-12-COUNTER                       NC2014.2 131
   002005      2  200800                      IF       PFM-12-COUNTER LESS THAN 36        NC2014.2 131
   002006      3  200900                               SUBTRACT 4 FROM PFM-12-COUNTER     NC2014.2 131
   002007      2  201000                      END-IF                                      NC2014.2
   002008      1  201100             END-IF                                               NC2014.2
   002009         201200     END-PERFORM.                                                 NC2014.2
   002010         201300     GO TO   PFM-TEST-F4-22-1.                                    NC2014.2 2014
   002011         201400 PFM-DELETE-F4-22.                                                NC2014.2
   002012         201500     PERFORM DE-LETE.                                             NC2014.2 500
   002013         201600     GO TO   PFM-WRITE-F4-22.                                     NC2014.2 2021
   002014         201700 PFM-TEST-F4-22-1.                                                NC2014.2
   002015         201800     IF      PFM-12-COUNTER EQUAL TO 13                           NC2014.2 131
   002016      1  201900             PERFORM PASS                                         NC2014.2 498
   002017      1  202000             GO TO   PFM-WRITE-F4-22.                             NC2014.2 2021
   002018         202100     PERFORM FAIL.                                                NC2014.2 499
   002019         202200     MOVE    PFM-12-COUNTER TO COMPUTED-A.                        NC2014.2 131 359
   002020         202300     MOVE   "13" TO CORRECT-A.                                    NC2014.2 373
   002021         202400 PFM-WRITE-F4-22.                                                 NC2014.2
   002022         202500     MOVE   "PFM-TEST-F4-22" TO PAR-NAME.                         NC2014.2 348
   002023         202600     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   002024         202700*                                                                 NC2014.2
   002025         202800*                                                                 NC2014.2
   002026         202900 PFM-INIT-F4-23.                                                  NC2014.2
   002027         203000*    ===-->  ORDER OF INITIALISATION   <--===                     NC2014.2
   002028         203100*    ===-->  OF VARYING IDENTIFIERS.   <--===                     NC2014.2
   002029         203200     MOVE   "VI-114 6.20.4 GR10(d)1" TO ANSI-REFERENCE.           NC2014.2 404
   002030         203300     MOVE   "PFM-TEST-F4-23"         TO PAR-NAME.                 NC2014.2 348
   002031         203400     MOVE    SPACES TO PERFORM-SEVEN-LEVEL-TABLE.                 NC2014.2 IMP 205
   002032         203500     MOVE    0 TO PFM-F4-23-TOT.                                  NC2014.2 222
   002033         203600 PFM-TEST-F4-23-0.                                                NC2014.2
   002034         203700     PERFORM PFM-F4-23-PROC                                       NC2014.2 2044
   002035         203800             VARYING PFM-A1 FROM 1 BY 1                           NC2014.2 223
   002036         203900               UNTIL PFM-A1 > 3                                   NC2014.2 223
   002037         204000               AFTER PFM-B1 FROM PFM-A1 BY 1                      NC2014.2 224 223
   002038         204100               UNTIL PFM-B1 > 3.                                  NC2014.2 224
   002039         204200     GO TO   PFM-TEST-F4-23-1.                                    NC2014.2 2046
   002040         204300 PFM-DELETE-F4-23.                                                NC2014.2
   002041         204400     PERFORM DE-LETE.                                             NC2014.2 500
   002042         204500     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   002043         204600     GO TO   PFM-INIT-F4-24.                                      NC2014.2 2058
   002044         204700 PFM-F4-23-PROC.                                                  NC2014.2
   002045         204800     ADD     1 TO PFM-F4-23-TOT.                                  NC2014.2 222
   002046         204900 PFM-TEST-F4-23-1.                                                NC2014.2
   002047         205000     IF      PFM-F4-23-TOT = 6                                    NC2014.2 222
   002048      1  205100             PERFORM PASS                                         NC2014.2 498
   002049      1  205200             PERFORM PRINT-DETAIL                                 NC2014.2 502
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205300     ELSE                                                         NC2014.2
   002051      1  205400             MOVE    6      TO CORRECT-18V0                       NC2014.2 379
   002052      1  205500             MOVE    PFM-F4-23-TOT TO COMPUTED-18V0               NC2014.2 222 366
   002053      1  205600             PERFORM FAIL                                         NC2014.2 499
   002054      1  205700             PERFORM PRINT-DETAIL.                                NC2014.2 502
   002055         205800     MOVE 2 TO PERFORM9.                                          NC2014.2 194
   002056         205900     MOVE 2 TO PERFORM10.                                         NC2014.2 195
   002057         206000*                                                                 NC2014.2
   002058         206100 PFM-INIT-F4-24.                                                  NC2014.2
   002059         206200*    ===-->  MANIPULATING SUBSCRIPTS   <--===                     NC2014.2
   002060         206300     MOVE   "VI-112 6.20.4 GR10(d)" TO ANSI-REFERENCE.            NC2014.2 404
   002061         206400     MOVE   "PFM-TEST-F4-24"        TO PAR-NAME.                  NC2014.2 348
   002062         206500     INITIALIZE FILLER-A.                                         NC2014.2 225
   002063         206600     MOVE    1  TO S1 S2 S3.                                      NC2014.2 214 215 216
   002064         206700     MOVE    10 TO PFM-F4-24-B (1) MOVE 20  TO PFM-F4-24-B (2).   NC2014.2 228 228
   002065         206800     MOVE    30 TO PFM-F4-24-B (3) MOVE 40  TO PFM-F4-24-B (4).   NC2014.2 228 228
   002066         206900     MOVE    50 TO PFM-F4-24-B (5) MOVE 60  TO PFM-F4-24-B (6).   NC2014.2 228 228
   002067         207000     MOVE    70 TO PFM-F4-24-B (7) MOVE 80  TO PFM-F4-24-B (8).   NC2014.2 228 228
   002068         207100     MOVE    90 TO PFM-F4-24-B (9) MOVE 100 TO PFM-F4-24-B (10).  NC2014.2 228 228
   002069         207200     MOVE    10 TO PFM-F4-24-C (1) MOVE 20  TO PFM-F4-24-C (2).   NC2014.2 230 230
   002070         207300     MOVE    30 TO PFM-F4-24-C (3) MOVE 40  TO PFM-F4-24-C (4).   NC2014.2 230 230
   002071         207400     MOVE    50 TO PFM-F4-24-C (5) MOVE 60  TO PFM-F4-24-C (6).   NC2014.2 230 230
   002072         207500     MOVE    70 TO PFM-F4-24-C (7) MOVE 80  TO PFM-F4-24-C (8).   NC2014.2 230 230
   002073         207600     MOVE    90 TO PFM-F4-24-C (9) MOVE 100 TO PFM-F4-24-C (10).  NC2014.2 230 230
   002074         207700     MOVE    0 TO PERFORM18.                                      NC2014.2 203
   002075         207800 PFM-TEST-F4-24-0.                                                NC2014.2
   002076         207900     PERFORM PFM-A-F4-24                                          NC2014.2 2091
   002077         208000             VARYING PFM-F4-24-A (S1)                             NC2014.2 226 214
   002078         208100                FROM 10                                           NC2014.2
   002079         208200                  BY PFM-F4-24-C (S2)                             NC2014.2 230 215
   002080         208300               UNTIL PFM-F4-24-A (S1) > 70.                       NC2014.2 226 214
   002081         208400 PFM-TEST-F4-24-1.                                                NC2014.2
   002082         208500     IF      PFM-F4-24-A (S1) EQUAL TO 80                         NC2014.2 226 214
   002083      1  208600             PERFORM PASS GO TO PFM-WRITE-F4-24-1.                NC2014.2 498 2095
   002084         208700     PERFORM FAIL.                                                NC2014.2 499
   002085         208800     MOVE    PFM-F4-24-A (S1) TO COMPUTED-N.                      NC2014.2 226 214 360
   002086         208900     MOVE    80  TO CORRECT-N.                                    NC2014.2 374
   002087         209000     GO TO   PFM-WRITE-F4-24-1.                                   NC2014.2 2095
   002088         209100 PFM-DELETE-F4-24-1.                                              NC2014.2
   002089         209200     PERFORM DE-LETE.                                             NC2014.2 500
   002090         209300     GO      TO PFM-WRITE-F4-24-1.                                NC2014.2 2095
   002091         209400 PFM-A-F4-24.                                                     NC2014.2
   002092         209500     ADD     1 TO PERFORM18.                                      NC2014.2 203
   002093         209600     MULTIPLY 2 BY S2.                                            NC2014.2 215
   002094         209700     ADD     1 TO S1 S3.                                          NC2014.2 214 216
   002095         209800 PFM-WRITE-F4-24-1.                                               NC2014.2
   002096         209900     MOVE   "PFM-TEST-F4-24" TO PAR-NAME.                         NC2014.2 348
   002097         210000     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   002098         210100 PFM-TEST-F4-24-2.                                                NC2014.2
   002099         210200     IF      S1 EQUAL TO 4                                        NC2014.2 214
   002100      1  210300             PERFORM PASS GO TO PFM-WRITE-F4-24-2.                NC2014.2 498 2112
   002101         210400     PERFORM FAIL.                                                NC2014.2 499
   002102         210500     MOVE    S1  TO COMPUTED-N.                                   NC2014.2 214 360
   002103         210600     MOVE    4   TO CORRECT-N.                                    NC2014.2 374
   002104         210700     GO TO   PFM-WRITE-F4-24-2.                                   NC2014.2 2112
   002105         210800 PFM-DELETE-F4-24-2.                                              NC2014.2
   002106         210900     PERFORM DE-LETE.                                             NC2014.2 500
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211000     GO      TO PFM-WRITE-F4-24-2.                                NC2014.2 2112
   002108         211100 PFM-A-F4-24-2.                                                   NC2014.2
   002109         211200     ADD     1 TO PERFORM18.                                      NC2014.2 203
   002110         211300     MULTIPLY 2 BY S2.                                            NC2014.2 215
   002111         211400     ADD     1 TO S1 S3.                                          NC2014.2 214 216
   002112         211500 PFM-WRITE-F4-24-2.                                               NC2014.2
   002113         211600     MOVE   "PFM-TEST-F4-24" TO PAR-NAME.                         NC2014.2 348
   002114         211700     PERFORM PRINT-DETAIL.                                        NC2014.2 502
   002115         211800 CCVS-EXIT SECTION.                                               NC2014.2
   002116         211900 CCVS-999999.                                                     NC2014.2
   002117         212000     GO TO CLOSE-FILES.                                           NC2014.2 491
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    41
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      104   A
      165   AA
      172   AAA
      173   AA1
      174   AA2
      338   ABC
      253   ALPHABET-AN-00026
      260   ALPHANUMERIC-XN-00049
       76   ALTERCOUNT
      404   ANSI-REFERENCE . . . . . . . .  576 583 592 M601 M922 M1205 M1227 M1251 M1279 M1302 M1326 M1355 M1442 M1497 M1547
                                            M1673 M1798 M1923 M1955 M1986 M2029 M2060
       68   ATWO-DS-01V00
       67   A01ONE-DS-P0801
       66   A02ONES-DS-02V00
       62   A02TWOS-DS-02V00 . . . . . . .  976 977
       64   A02TWOS-DS-03V02
      166   A1
      167   A2
      321   A80
      326   A86
       65   A990-DS-0201P
      105   B
      112   B
      116   B
      168   BB . . . . . . . . . . . . . .  171
      171   BB-2
      175   BBB
      176   BB1
      177   BB2
      169   B1
      170   B2
      322   B80
      327   B86
      106   C
      113   C
      119   CCON-1
      120   CCON-2
      121   CCON-3
      383   CCVS-C-1 . . . . . . . . . . .  520 562
      388   CCVS-C-2 . . . . . . . . . . .  521 563
      438   CCVS-E-1 . . . . . . . . . . .  526
      443   CCVS-E-2 . . . . . . . . . . .  535 542 549 554
      446   CCVS-E-2-2 . . . . . . . . . .  M534
      451   CCVS-E-3 . . . . . . . . . . .  555
      460   CCVS-E-4 . . . . . . . . . . .  534
      461   CCVS-E-4-1 . . . . . . . . . .  M532
      463   CCVS-E-4-2 . . . . . . . . . .  M533
      405   CCVS-H-1 . . . . . . . . . . .  515
      410   CCVS-H-2A. . . . . . . . . . .  516
      419   CCVS-H-2B. . . . . . . . . . .  517
      431   CCVS-H-3 . . . . . . . . . . .  518
      481   CCVS-PGM-ID. . . . . . . . . .  487 487
      308   CHARACTER-BREAKDOWN-R
      297   CHARACTER-BREAKDOWN-S
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    42
0 Defined   Cross-reference of data names   References

0     365   CM-18V0
      122   COMP-SGN1
      123   COMP-SGN2
      124   COMP-SGN3
      125   COMP-SGN4
      359   COMPUTED-A . . . . . . . . . .  360 362 363 364 365 588 591 M776 M855 M1070 M1105 M1434 M1581 M1591 M1601 M1611
                                            M1621 M1631 M1641 M1651 M1706 M1716 M1726 M1736 M1746 M1756 M1766 M1776 M1832
                                            M1842 M1852 M1862 M1872 M1882 M1892 M1903 M2019
      360   COMPUTED-N . . . . . . . . . .  M616 M636 M656 M661 M689 M694 M698 M702 M706 M735 M740 M744 M748 M752 M756 M760
                                            M764 M768 M772 M806 M811 M815 M819 M823 M827 M831 M835 M839 M843 M847 M851 M938
                                            M966 M989 M1016 M1138 M1168 M1199 M1219 M1243 M1271 M1294 M1318 M1346 M1392 M1398
                                            M1402 M1406 M1410 M1414 M1418 M1422 M1426 M1430 M1475 M1487 M1527 M1537 M1950
                                            M1980 M2085 M2102
      358   COMPUTED-X . . . . . . . . . .  M510 574
      362   COMPUTED-0V18
      364   COMPUTED-14V4
      366   COMPUTED-18V0. . . . . . . . .  M1661 M1786 M1913 M2052
      363   COMPUTED-4V14
      246   COND-1
      247   COND-2
      249   COND-3
      382   COR-ANSI-REFERENCE . . . . . .  M583 M585
      373   CORRECT-A. . . . . . . . . . .  374 375 376 377 378 589 591 M777 M856 M1069 M1106 M1435 M1582 M1592 M1602 M1612
                                            M1622 M1632 M1642 M1652 M1707 M1717 M1727 M1737 M1747 M1757 M1767 M1777 M1833
                                            M1843 M1853 M1863 M1873 M1883 M1893 M1904 M2020
      374   CORRECT-N. . . . . . . . . . .  M617 M637 M657 M662 M690 M695 M699 M703 M707 M736 M741 M745 M749 M753 M757 M761
                                            M765 M769 M773 M807 M812 M816 M820 M824 M828 M832 M836 M840 M844 M848 M852 M939
                                            M967 M990 M1017 M1139 M1169 M1200 M1220 M1244 M1272 M1295 M1319 M1347 M1393 M1399
                                            M1403 M1407 M1411 M1415 M1419 M1423 M1427 M1431 M1476 M1488 M1528 M1538 M1951
                                            M1981 M2086 M2103
      372   CORRECT-X. . . . . . . . . . .  M511 575
      375   CORRECT-0V18
      377   CORRECT-14V4
      379   CORRECT-18V0 . . . . . . . . .  M1662 M1787 M1914 M2051
      376   CORRECT-4V14
       52   COUNT-DU-6V0 . . . . . . . . .  M1675 1682 1684 1686 1688 1690 1692 1694 M1800 1807 1809 1811 1813 1815 1817
                                            1819 M1823 M1928 M1941 1945 1950 M1959 M1970 1975 1980
      378   CR-18V0
      323   C80
      328   C86
      107   D
      114   D
      329   DATANAME-86
      396   DELETE-COUNTER . . . . . . . .  M500 529 545 547
      257   DIGITS-DU-06V04-S
      256   DIGITS-DV-10V00. . . . . . . .  257
      330   DNAME-86
      351   DOTVALUE . . . . . . . . . . .  M505
      402   DUMMY-HOLD . . . . . . . . . .  M559 565
       39   DUMMY-RECORD . . . . . . . . .  M515 M516 M517 M518 M520 M521 M522 M524 M526 M535 M542 M549 M554 M555 559 M560
                                            561 M562 M563 M564 M565 569 M570 M578 M593
      142   D1
      148   D1
      155   D1
      159   D1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    43
0 Defined   Cross-reference of data names   References

0     162   D1
      143   D2
      149   D2
      156   D2
      160   D2
      163   D2
      144   D3
      150   D3
      157   D3
      145   D4
      151   D4
      146   D5
      152   D5
      108   E
      316   EIGHTH-20R
      305   EIGHTH-20S
      265   ELEM-FOR-2N058-A
      281   ELEM-FOR-2N058-A
      266   ELEM-FOR-2N058-B
      282   ELEM-FOR-2N058-B
      267   ELEM-FOR-2N058-C
      283   ELEM-FOR-2N058-C
      268   ELEM-FOR-2N058-D
      284   ELEM-FOR-2N058-D
      269   ELEM-FOR-2N058-E
      286   ELEM-FOR-2N058-E
      270   ELEM-FOR-2N058-F
      287   ELEM-FOR-2N058-F
      271   ELEM-FOR-2N058-G
      288   ELEM-FOR-2N058-G
      272   ELEM-FOR-2N058-H
      289   ELEM-FOR-2N058-H
      273   ELEM-FOR-2N058-I
      291   ELEM-FOR-2N058-I
      274   ELEM-FOR-2N058-J
      292   ELEM-FOR-2N058-J
      275   ELEM-FOR-2N058-K
      293   ELEM-FOR-2N058-K
      276   ELEM-FOR-2N058-L
      294   ELEM-FOR-2N058-L
      277   ELEM-FOR-2N058-M
      295   ELEM-FOR-2N058-M
      278   ELEM-FOR-2N058-N
      296   ELEM-FOR-2N058-N
      320   ELMT
      449   ENDER-DESC . . . . . . . . . .  M537 M548 M553
      397   ERROR-COUNTER. . . . . . . . .  M499 528 538 541
      401   ERROR-HOLD . . . . . . . . . .  M528 M529 M529 M530 533
      447   ERROR-TOTAL. . . . . . . . . .  M539 M541 M546 M547 M551 M552
       56   EVEN-SMALLER
      109   F
      344   FEATURE. . . . . . . . . . . .  M602 M644 M1926 M1957 M1988
      313   FIFTH-20R
      302   FIFTH-20S
      334   FIGCON-DATA
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    44
0 Defined   Cross-reference of data names   References

0     225   FILLER-A . . . . . . . . . . .  M2062
      227   FILLER-B
      229   FILLER-C
      309   FIRST-20R
      298   FIRST-20S
      312   FOURTH-20R
      301   FOURTH-20S
      110   G
      252   GRP-ALPHABETIC
      259   GRP-ALPHANUMERIC
      263   GRP-FOR-2N058
      244   GRP-FOR-88-LEVELS
      251   GRP-GROUP-MOVE-FROM
      250   GRP-MOVE-CONSTANTS
      255   GRP-NUMERIC
      475   HYPHEN-LINE. . . . . . . . . .  522 524 564
      441   ID-AGAIN . . . . . . . . . . .  M487
       78   IF-D1
      141   IF-D10
       87   IF-D11
      147   IF-D12
       88   IF-D13
       89   IF-D14
       90   IF-D15
       91   IF-D16
       92   IF-D17
       93   IF-D18
       94   IF-D19
       79   IF-D2
      153   IF-D20
      158   IF-D21
      161   IF-D22
       95   IF-D23
       96   IF-D24
       97   IF-D25
       98   IF-D26
       99   IF-D27
      101   IF-D28
       80   IF-D3
      102   IF-D31
      103   IF-D32
      111   IF-D33
      115   IF-D34
      164   IF-D35
      178   IF-D36
      117   IF-D37
      118   IF-D38
       81   IF-D4
      181   IF-D40
      183   IF-D40A
      184   IF-D40B
      185   IF-D40C
       82   IF-D5
       83   IF-D6
       84   IF-D7
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    45
0 Defined   Cross-reference of data names   References

0      85   IF-D8
       86   IF-D9
      136   IF-ELEM
      135   IF-TABLE
      127   INC-VALUE. . . . . . . . . . .  M1114 1128 M1147 1158 M1177 M1181 1189
      474   INF-ANSI-REFERENCE . . . . . .  M576 M579 M592 M594
      469   INFO-TEXT. . . . . . . . . . .  M577
      398   INSPECT-COUNTER. . . . . . . .  M497 528 550 552
      237   LITERAL-SPLITTER . . . . . . .  242
      242   LITERAL-TABLE
      337   LOW-VAL
       74   NINE
      317   NINTH-20R
      306   NINTH-20S
      339   ONE23
      346   P-OR-F . . . . . . . . . . . .  M497 M498 M499 M500 507 M510 M660 M693 M739 M810 M1397 M1482
      348   PAR-NAME . . . . . . . . . . .  M512 M600 M623 M643 M667 M696 M700 M704 M708 M713 M742 M746 M750 M754 M758 M762
                                            M766 M770 M774 M778 M783 M813 M817 M821 M825 M829 M833 M837 M841 M845 M849 M853
                                            M857 M921 M945 M973 M996 M1022 M1075 M1111 M1144 M1174 M1223 M1247 M1275 M1298
                                            M1322 M1350 M1394 M1400 M1404 M1408 M1412 M1416 M1420 M1424 M1428 M1432 M1437
                                            M1443 M1473 M1485 M1498 M1548 M1672 M1797 M1894 M1924 M1956 M1987 M2022 M2030
                                            M2061 M2096 M2113
      350   PARDOT-X . . . . . . . . . . .  M504
      238   PART1
      239   PART2
      240   PART3
      241   PART4
      399   PASS-COUNTER . . . . . . . . .  M498 530 532
      204   PERFORM-KEY
      205   PERFORM-SEVEN-LEVEL-TABLE. . .  M1549 M1674 M1799 M1925 M2031
      186   PERFORM1
      195   PERFORM10. . . . . . . . . . .  718 M785 791 M1360 1367 M1447 1456 M1505 1510 M2056
      196   PERFORM11. . . . . . . . . . .  719 M790 791 798 843 909 M1361 1369 M1446 1458 M1506 1512
      197   PERFORM12. . . . . . . . . . .  M1362 M1444 M1499
      198   PERFORM13
      199   PERFORM14. . . . . . . . . . .  721 721 722 723 723 725 726 726 735 740 744 748 752 756 760 764 M897 M1373 1378
                                            1378 1379 1380 1380 1382 1383 1383 1392 1398 1402 1406 1410 1414 1418 1422 M1462
                                            1474 1475 M1516 1526 1527 1536 1537
      200   PERFORM15
      201   PERFORM16. . . . . . . . . . .  792 792 793 794 794 795 797 797 806 811 815 819 823 827 831 835 839 M908
      202   PERFORM17. . . . . . . . . . .  M1118 M1126 1129 M1156 1159 M1187 1190
      203   PERFORM18. . . . . . . . . . .  M1112 M1117 1130 1138 M1145 M1150 1160 1168 M1175 M1180 1191 1199 M2074 M2092
                                            M2109
      187   PERFORM2 . . . . . . . . . . .  M603 605 609 616 M624 628 629 636 M719 719 727 768 M789 790 798 847 M862 M872
                                            898 909 M1206 1211 1213 1219 M1228 1233 1235 M1241 1243 M1280 1286 1288 1294
                                            M1303 1308 1310 M1316 1318 M1356 M1369 1370 1374 1384 1426 M1451 M1458 1459 1463
                                            M1467 M1501 M1512 1513 1517 M1520
      188   PERFORM3 . . . . . . . . . . .  M674 675 678 706 M717 718 727 772 M788 789 799 851 862 M864 888 898 909 M1281
                                            M1357 M1367 1368 1374 1384 1430 M1450 M1456 1457 1463 M1466 M1502 M1510 1511
                                            1517
      189   PERFORM4 . . . . . . . . . . .  M646 647 648 656 M668 M714 880 888 M889 897 M900 M1002 1005 1006 1016 M1358 1373
                                            M1376 M1449 1462 M1465 1486 1487 M1503 1516 M1519
      190   PERFORM5 . . . . . . . . . . .  646 908 M910
      191   PERFORM6 . . . . . . . . . . .  648 661 M880
      192   PERFORM7
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    46
0 Defined   Cross-reference of data names   References

0     193   PERFORM8 . . . . . . . . . . .  M669 676 676 677 677 689 694 698 702 M888
      194   PERFORM9 . . . . . . . . . . .  718 M784 788 M1359 1367 M1448 1456 M1504 1510 M2055
      223   PFM-A1 . . . . . . . . . . . .  M2035 2036 2037
      224   PFM-B1 . . . . . . . . . . . .  M2037 2038
      222   PFM-F4-23-TOT. . . . . . . . .  M2032 M2045 2047 2052
      226   PFM-F4-24-A. . . . . . . . . .  M2077 2080 2082 2085
      228   PFM-F4-24-B. . . . . . . . . .  M2064 M2064 M2065 M2065 M2066 M2066 M2067 M2067 M2068 M2068
      230   PFM-F4-24-C. . . . . . . . . .  M2069 M2069 M2070 M2070 M2071 M2071 M2072 M2072 M2073 M2073 2079
      130   PFM-11-COUNTER . . . . . . . .  M1023 M1042 1049 M1049 1065 1070
      132   PFM-12-ANS1. . . . . . . . . .  M1076 M1083 1084 1094 M1990 1997 M2000 2002
      133   PFM-12-ANS2. . . . . . . . . .  M1077 M1082 1084 1094 1095 M1991 1997 1998 M1999 2001
      131   PFM-12-COUNTER . . . . . . . .  1086 M1086 1087 M1088 M1092 1093 1096 1105 M1995 1996 2003 M2004 2005 M2006 2015
                                            2019
      221   PFM-7-TOT. . . . . . . . . . .  M1550 M1574 1660 1661 M1676 M1699 1785 1786 M1801 M1825 1912 1913
      206   PFM71
      207   PFM72
      208   PFM73
      209   PFM74
      210   PFM75
      211   PFM76
      212   PFM77
      213   PFM77-1. . . . . . . . . . . .  M1572 1580 1581 1590 1591 1600 1601 1610 1611 1620 1621 1630 1631 1640 1641 1650
                                            1651 M1697 1705 1706 1715 1716 1725 1726 1735 1736 1745 1746 1755 1756 1765 1766
                                            1775 1776 M1822 1831 1832 1841 1842 1851 1852 1861 1862 1871 1872 1881 1882 1891
                                            1892 1902 1903
       37   PRINT-FILE . . . . . . . . . .  33 486 492
       38   PRINT-REC. . . . . . . . . . .  M506 M582 M584
      138   QU-1
      139   QU-2
      140   QU-3
      137   QUOTE-DATA
      336   QUOTE-X
      353   RE-MARK. . . . . . . . . . . .  M501 M513 M867 M875 M883 M892 M903 M913 M1927 M1958 M1989
      395   REC-CT . . . . . . . . . . . .  503 505 512 M1452 M1483 M1500 M1534 M1551 M1588 M1598 M1608 M1618 M1628 M1638
                                            M1648 M1658 M1677 M1713 M1723 M1733 M1743 M1753 M1763 M1773 M1783 M1802 M1839
                                            M1849 M1859 M1869 M1879 M1889 M1900 M1910 M1929
      394   REC-SKL-SUB
      231   RECEIVING-TABLE
      403   RECORD-COUNT . . . . . . . . .  M557 558 M566
      310   SECOND-20R
      299   SECOND-20S
       73   SEVEN
      315   SEVENTH-20R
      304   SEVENTH-20S
      314   SIXTH-20R
      303   SIXTH-20S
       53   SMALL-VALU
       54   SMALLER-VALU
       55   SMALLEST-VALU
      335   SPACE-X
      126   START-POINT. . . . . . . . . .  M1113 1127 M1146 M1151 1157 M1176 1188
      264   SUB-GRP-FOR-2N058-A
      279   SUB-GRP-FOR-2N058-B
      280   SUB-SUB-BA
      285   SUB-SUB-BB
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    47
0 Defined   Cross-reference of data names   References

0     290   SUB-SUB-BC
      134   SUBSCRIPT-6
      128   SWITCH-PFM-1 . . . . . . . . .  M1024 1036 M1053
      129   SWITCH-PFM-2 . . . . . . . . .  M1043 1050
      214   S1 . . . . . . . . . . . . . .  M1552 M1556 1557 1572 M1681 1697 M1806 1822 M2063 2077 2080 2082 2085 M2094 2099
                                            2102 M2111
      215   S2 . . . . . . . . . . . . . .  M1552 M1558 1559 1572 M1683 1697 M1808 1822 M2063 2079 M2093 M2110
      216   S3 . . . . . . . . . . . . . .  M1552 M1560 1561 1572 M1685 1697 M1810 1822 M2063 M2094 M2111
      217   S4 . . . . . . . . . . . . . .  M1552 M1562 1563 1572 M1687 1697 M1812 1822
      218   S5 . . . . . . . . . . . . . .  M1552 M1564 1565 1572 M1689 1697 M1814 1822
      219   S6 . . . . . . . . . . . . . .  M1552 M1566 1567 1572 M1691 1697 M1816 1822
      220   S7 . . . . . . . . . . . . . .  M1552 M1568 1569 1572 M1693 1697 M1818 1822
      319   TABLE-80
      325   TABLE-86
      232   TBL-ELEMEN-A
      233   TBL-ELEMEN-B
      234   TBL-ELEMEN-C
      235   TBL-ELEMEN-D
      236   TBL-ELEMEN-E
       75   TEN
      318   TENTH-20R
      307   TENTH-20S
      354   TEST-COMPUTED. . . . . . . . .  582
      369   TEST-CORRECT . . . . . . . . .  584
      422   TEST-ID. . . . . . . . . . . .  M487
      342   TEST-RESULTS . . . . . . . . .  M488 506
       58   TEST-2NUC-COND-99. . . . . . .  930 949 1256 1331
      311   THIRD-20R
      300   THIRD-20S
       72   THREE
      400   TOTAL-ERROR
       71   TWO
       63   WRK-DS-01V00
       57   WRK-DS-02V00 . . . . . . . . .  M923 M928 931 938 M946 M948 958 M974 M976 977 981 M1252 M1262 1264 1271 M1327
                                            M1337 1339 1346
      245   WRK-DS-02V00-COND
       59   WRK-DS-06V06 . . . . . . . . .  60 M947 M952 M954 M956 M958 959 966 M975 M979 M981 982 989
       60   WRK-DS-12V00-S
       42   WRK-DU-0V1-1 . . . . . . . . .  1933 1962
       45   WRK-DU-1V0-1
       46   WRK-DU-1V0-2
       47   WRK-DU-1V0-3
       48   WRK-DU-1V0-4
       49   WRK-DU-2V0-1
       50   WRK-DU-2V0-2
       51   WRK-DU-2V0-3
       41   WRK-DU-2V1-1 . . . . . . . . .  M1932 1934 M1962 1963
       43   WRK-DU-2V1-2 . . . . . . . . .  1962 M1971
       44   WRK-DU-2V1-3 . . . . . . . . .  1934
       69   WRK-XN-00001
       70   WRK-XN-00005
       77   XRAY . . . . . . . . . . . . .  M724 728 776 M796 799 855 M1363 M1381 1385 1434 M1445
      471   XXCOMPUTED . . . . . . . . . .  M591
      473   XXCORRECT. . . . . . . . . . .  M591
      466   XXINFO . . . . . . . . . . . .  578 593
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    48
0 Defined   Cross-reference of data names   References

0     340   ZERO-C
      341   ZERO-D
      243   80PARTS
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    49
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

      587   BAIL-OUT . . . . . . . . . . .  P509
      595   BAIL-OUT-EX. . . . . . . . . .  E509 G589
      590   BAIL-OUT-WRITE . . . . . . . .  G588
      571   BLANK-LINE-PRINT
     2115   CCVS-EXIT
     2116   CCVS-999999
      484   CCVS1
      596   CCVS1-EXIT . . . . . . . . . .  G490
      491   CLOSE-FILES. . . . . . . . . .  G2117
      519   COLUMN-NAMES-ROUTINE . . . . .  E489
      500   DE-LETE. . . . . . . . . . . .  P613 P633 P686 P732 P803 P935 P963 P986 P1012 P1032 P1101 P1134 P1164 P1195 P1216
                                            P1238 P1268 P1291 P1313 P1343 P1389 P1469 P1522 P1576 P1701 P1827 P1937 P1966
                                            P2012 P2041 P2089 P2106
      523   END-ROUTINE. . . . . . . . . .  P492
      527   END-ROUTINE-1
      536   END-ROUTINE-12
      544   END-ROUTINE-13 . . . . . . . .  E492
      525   END-RTN-EXIT
      499   FAIL . . . . . . . . . . . . .  P618 P638 P658 P691 P737 P808 P866 P874 P882 P891 P902 P912 P940 P968 P991 P1015
                                            P1068 P1104 P1137 P1167 P1198 P1221 P1245 P1273 P1296 P1320 P1348 P1395 P1477
                                            P1489 P1529 P1539 P1583 P1593 P1603 P1613 P1623 P1633 P1643 P1653 P1663 P1708
                                            P1718 P1728 P1738 P1748 P1758 P1768 P1778 P1788 P1834 P1844 P1854 P1864 P1874
                                            P1884 P1895 P1905 P1915 P1949 P1979 P2018 P2053 P2084 P2101
      573   FAIL-ROUTINE . . . . . . . . .  P508
      586   FAIL-ROUTINE-EX. . . . . . . .  E508 G580
      581   FAIL-ROUTINE-WRITE . . . . . .  G574 G575
      514   HEAD-ROUTINE . . . . . . . . .  P489
      497   INSPT
     1969   LOOP-FOR-F4-21 . . . . . . . .  P1961
     1972   LOOP-F4-21-EXIT. . . . . . . .  E1961
      485   OPEN-FILES
     1035   PARA-PART-A
      498   PASS . . . . . . . . . . . . .  P609 P629 P649 P679 P728 P800 P932 P960 P983 P1007 P1066 P1097 P1130 P1160 P1191
                                            P1213 P1235 P1265 P1288 P1310 P1340 P1385 P1480 P1492 P1532 P1542 P1586 P1596
                                            P1606 P1616 P1626 P1636 P1646 P1656 P1666 P1711 P1721 P1731 P1741 P1751 P1761
                                            P1771 P1781 P1791 P1837 P1847 P1857 P1867 P1877 P1887 P1898 P1908 P1918 P1946
                                            P1976 P2016 P2048 P2083 P2100
      861   PFM-A. . . . . . . . . . . . .  P605 P1210 P1285
     1259   PFM-A-F3-6 . . . . . . . . . .  P1254
     1334   PFM-A-F3-9 . . . . . . . . . .  P1329
     2091   PFM-A-F4-24. . . . . . . . . .  P2076
     2108   PFM-A-F4-24-2
      998   PFM-A-10 . . . . . . . . . . .  P1001
      925   PFM-A-3-3. . . . . . . . . . .  P930
      951   PFM-A-4-5. . . . . . . . . . .  P948
      978   PFM-A-4-6. . . . . . . . . . .  P976
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    50
0 Defined   Cross-reference of procedures   References

0     863   PFM-AA . . . . . . . . . . . .  E605 E1210 E1285
      865   PFM-B
     1261   PFM-B-F3-6 . . . . . . . . . .  E1254
     1336   PFM-B-F3-9 . . . . . . . . . .  E1329
      927   PFM-B-3-3. . . . . . . . . . .  E930
      953   PFM-B-4-5
      871   PFM-C. . . . . . . . . . . . .  P628
      955   PFM-C-4-5. . . . . . . . . . .  E948
      917   PFM-CONTINUE . . . . . . . . .  G860
      873   PFM-D
      612   PFM-DELETE-F3-1
      632   PFM-DELETE-F3-2
      934   PFM-DELETE-F3-3
     1215   PFM-DELETE-F3-4
     1237   PFM-DELETE-F3-5
     1267   PFM-DELETE-F3-6
     1290   PFM-DELETE-F3-7
     1312   PFM-DELETE-F3-8
     1342   PFM-DELETE-F3-9
      652   PFM-DELETE-F4-1
     1133   PFM-DELETE-F4-10
     1163   PFM-DELETE-F4-11
     1194   PFM-DELETE-F4-12
     1388   PFM-DELETE-F4-13
     1468   PFM-DELETE-F4-14
     1521   PFM-DELETE-F4-15
     1575   PFM-DELETE-F4-16
     1700   PFM-DELETE-F4-17
     1826   PFM-DELETE-F4-18
      685   PFM-DELETE-F4-2
     1936   PFM-DELETE-F4-20
     1965   PFM-DELETE-F4-21
     2011   PFM-DELETE-F4-22
     2040   PFM-DELETE-F4-23
     2088   PFM-DELETE-F4-24-1
     2105   PFM-DELETE-F4-24-2
      731   PFM-DELETE-F4-3
      802   PFM-DELETE-F4-4
      962   PFM-DELETE-F4-5
      985   PFM-DELETE-F4-6
     1011   PFM-DELETE-F4-7
     1031   PFM-DELETE-F4-8
     1100   PFM-DELETE-F4-9
      879   PFM-E. . . . . . . . . . . . .  P646
      881   PFM-F
      615   PFM-FAIL-F3-1. . . . . . . . .  G611
      635   PFM-FAIL-F3-2. . . . . . . . .  G631
      937   PFM-FAIL-F3-3. . . . . . . . .  G933
     1218   PFM-FAIL-F3-4. . . . . . . . .  G1214
     1242   PFM-FAIL-F3-5. . . . . . . . .  G1236
     1270   PFM-FAIL-F3-6. . . . . . . . .  G1266
     1293   PFM-FAIL-F3-7. . . . . . . . .  G1289
     1317   PFM-FAIL-F3-8. . . . . . . . .  G1311
     1345   PFM-FAIL-F3-9. . . . . . . . .  G1341
      655   PFM-FAIL-F4-1. . . . . . . . .  G651
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    51
0 Defined   Cross-reference of procedures   References

0    1136   PFM-FAIL-F4-10 . . . . . . . .  G1132
     1166   PFM-FAIL-F4-11 . . . . . . . .  G1162
     1197   PFM-FAIL-F4-12 . . . . . . . .  G1193
     1391   PFM-FAIL-F4-13 . . . . . . . .  G1387
      688   PFM-FAIL-F4-2. . . . . . . . .  G684
      734   PFM-FAIL-F4-3. . . . . . . . .  G730
      805   PFM-FAIL-F4-4. . . . . . . . .  G801
      965   PFM-FAIL-F4-5. . . . . . . . .  G961
      988   PFM-FAIL-F4-6. . . . . . . . .  G984
     1014   PFM-FAIL-F4-7. . . . . . . . .  G1008
     1103   PFM-FAIL-F4-9. . . . . . . . .  G1099
     1240   PFM-F3-5-C . . . . . . . . . .  P1232
     1315   PFM-F3-8-C . . . . . . . . . .  P1307
     1116   PFM-F4-10-A. . . . . . . . . .  P1125
     1149   PFM-F4-11-A. . . . . . . . . .  P1155
     1179   PFM-F4-12-A. . . . . . . . . .  P1186
     2044   PFM-F4-23-PROC . . . . . . . .  P2034
     1081   PFM-F4-9-A . . . . . . . . . .  P1092
     1089   PFM-F4-9-B . . . . . . . . . .  G1085
      887   PFM-G. . . . . . . . . . . . .  P674
      890   PFM-H
      896   PFM-I. . . . . . . . . . . . .  P717
     1372   PFM-I-F4-13. . . . . . . . . .  P1366
     1461   PFM-I-F4-14. . . . . . . . . .  P1455
     1515   PFM-I-F4-15. . . . . . . . . .  P1509
     1571   PFM-I-F4-16. . . . . . . . . .  P1555
     1696   PFM-I-F4-17. . . . . . . . . .  P1680
     1821   PFM-I-F4-18. . . . . . . . . .  P1805
      599   PFM-INIT-F3-1
      622   PFM-INIT-F3-2
      920   PFM-INIT-F3-3
     1203   PFM-INIT-F3-4
     1225   PFM-INIT-F3-5
     1249   PFM-INIT-F3-6
     1277   PFM-INIT-F3-7
     1300   PFM-INIT-F3-8
     1324   PFM-INIT-F3-9
      642   PFM-INIT-F4-1
     1110   PFM-INIT-F4-10
     1143   PFM-INIT-F4-11
     1173   PFM-INIT-F4-12
     1353   PFM-INIT-F4-13
     1440   PFM-INIT-F4-14
     1495   PFM-INIT-F4-15 . . . . . . . .  G1471
     1545   PFM-INIT-F4-16 . . . . . . . .  G1524
     1669   PFM-INIT-F4-17 . . . . . . . .  G1578
     1794   PFM-INIT-F4-18 . . . . . . . .  G1703
      666   PFM-INIT-F4-2
     1922   PFM-INIT-F4-20 . . . . . . . .  G1829
     1954   PFM-INIT-F4-21 . . . . . . . .  G1939
     1984   PFM-INIT-F4-22 . . . . . . . .  G1968
     2026   PFM-INIT-F4-23
     2058   PFM-INIT-F4-24 . . . . . . . .  G2043
      712   PFM-INIT-F4-3
      782   PFM-INIT-F4-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    52
0 Defined   Cross-reference of procedures   References

0     944   PFM-INIT-F4-5
      972   PFM-INIT-F4-6
      995   PFM-INIT-F4-7
     1021   PFM-INIT-F4-8
     1074   PFM-INIT-F4-9
      899   PFM-J. . . . . . . . . . . . .  E717
     1375   PFM-J-F4-13. . . . . . . . . .  E1366
     1464   PFM-J-F4-14. . . . . . . . . .  E1455
     1518   PFM-J-F4-15. . . . . . . . . .  E1509
     1573   PFM-J-F4-16. . . . . . . . . .  E1555
     1698   PFM-J-F4-17. . . . . . . . . .  E1680
     1824   PFM-J-F4-18. . . . . . . . . .  E1805
      901   PFM-K
      907   PFM-L. . . . . . . . . . . . .  P788
     1940   PFM-LOOP-F4-20 . . . . . . . .  P1931
     1942   PFM-LOOP-F4-20-EXIT. . . . . .  E1931
      911   PFM-M
     1034   PFM-PART-A . . . . . . . . . .  G1030 P1055
     1047   PFM-PART-B
     1038   PFM-SEC-A2
     1041   PFM-SEC-A3 . . . . . . . . . .  G1037
     1045   PFM-SEC-A4 . . . . . . . . . .  G1040
     1048   PFM-SEC-B1 . . . . . . . . . .  P1039 P1044
     1052   PFM-SEC-B2
     1054   PFM-SEC-B3
     1056   PFM-SEC-B4
     1058   PFM-SEC-B5 . . . . . . . . . .  E1044 G1051
     1060   PFM-SEC-B6 . . . . . . . . . .  E1039
     1062   PFM-SEC-B7
     1064   PFM-SEC-STOP
      604   PFM-TEST-F3-0
      608   PFM-TEST-F3-1
      627   PFM-TEST-F3-2
      929   PFM-TEST-F3-3. . . . . . . . .  G924
     1209   PFM-TEST-F3-4-0
     1212   PFM-TEST-F3-4-1
     1231   PFM-TEST-F3-5-0
     1234   PFM-TEST-F3-5-1
     1257   PFM-TEST-F3-6
     1253   PFM-TEST-F3-6-0
     1284   PFM-TEST-F3-7-0
     1287   PFM-TEST-F3-7-1
     1306   PFM-TEST-F3-8-0
     1309   PFM-TEST-F3-8-1
     1332   PFM-TEST-F3-9
     1328   PFM-TEST-F3-9-0
      645   PFM-TEST-F4-1
     1124   PFM-TEST-F4-10 . . . . . . . .  G1115
     1154   PFM-TEST-F4-11 . . . . . . . .  G1148
     1185   PFM-TEST-F4-12 . . . . . . . .  G1178
     1365   PFM-TEST-F4-13-0
     1377   PFM-TEST-F4-13-1 . . . . . . .  G1371
     1454   PFM-TEST-F4-14-0
     1472   PFM-TEST-F4-14-1 . . . . . . .  G1460
     1484   PFM-TEST-F4-14-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    53
0 Defined   Cross-reference of procedures   References

0    1508   PFM-TEST-F4-15-0
     1525   PFM-TEST-F4-15-1 . . . . . . .  G1514
     1535   PFM-TEST-F4-15-2
     1554   PFM-TEST-F4-16-0
     1579   PFM-TEST-F4-16-1 . . . . . . .  G1570
     1659   PFM-TEST-F4-16-10
     1589   PFM-TEST-F4-16-2
     1599   PFM-TEST-F4-16-3
     1609   PFM-TEST-F4-16-4
     1619   PFM-TEST-F4-16-5
     1629   PFM-TEST-F4-16-6
     1639   PFM-TEST-F4-16-7
     1649   PFM-TEST-F4-16-9
     1679   PFM-TEST-F4-17-0
     1704   PFM-TEST-F4-17-1 . . . . . . .  G1695
     1714   PFM-TEST-F4-17-2
     1724   PFM-TEST-F4-17-3
     1734   PFM-TEST-F4-17-4
     1744   PFM-TEST-F4-17-5
     1754   PFM-TEST-F4-17-6
     1764   PFM-TEST-F4-17-7
     1774   PFM-TEST-F4-17-8
     1784   PFM-TEST-F4-17-9
     1804   PFM-TEST-F4-18-0
     1830   PFM-TEST-F4-18-1 . . . . . . .  G1820
     1840   PFM-TEST-F4-18-2
     1850   PFM-TEST-F4-18-3
     1860   PFM-TEST-F4-18-4
     1870   PFM-TEST-F4-18-5
     1880   PFM-TEST-F4-18-6
     1890   PFM-TEST-F4-18-7
     1901   PFM-TEST-F4-18-8
     1911   PFM-TEST-F4-18-9
      670   PFM-TEST-F4-2
     1930   PFM-TEST-F4-20-0
     1944   PFM-TEST-F4-20-1 . . . . . . .  G1935
     1960   PFM-TEST-F4-21-0
     1974   PFM-TEST-F4-21-1 . . . . . . .  G1964
     1994   PFM-TEST-F4-22-0
     2014   PFM-TEST-F4-22-1 . . . . . . .  G2010
     2033   PFM-TEST-F4-23-0
     2046   PFM-TEST-F4-23-1 . . . . . . .  G2039
     2075   PFM-TEST-F4-24-0
     2081   PFM-TEST-F4-24-1
     2098   PFM-TEST-F4-24-2
      715   PFM-TEST-F4-3
      786   PFM-TEST-F4-4
      957   PFM-TEST-F4-5. . . . . . . . .  G950
      980   PFM-TEST-F4-6
     1000   PFM-TEST-F4-7. . . . . . . . .  G997
     1029   PFM-TEST-F4-8
     1091   PFM-TEST-F4-9. . . . . . . . .  G1080
     1263   PFM-TESTT-F3-6 . . . . . . . .  G1258
     1338   PFM-TESTT-F3-9 . . . . . . . .  G1333
      619   PFM-WRITE-F3-1 . . . . . . . .  G610 G614 G870
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    54
0 Defined   Cross-reference of procedures   References

0     639   PFM-WRITE-F3-2 . . . . . . . .  G630 G634 G878
      941   PFM-WRITE-F3-3 . . . . . . . .  G932 G936
     1222   PFM-WRITE-F3-4 . . . . . . . .  G1213 G1217
     1246   PFM-WRITE-F3-5 . . . . . . . .  G1235 G1239
     1274   PFM-WRITE-F3-6 . . . . . . . .  G1265 G1269
     1297   PFM-WRITE-F3-7 . . . . . . . .  G1288 G1292
     1321   PFM-WRITE-F3-8 . . . . . . . .  G1310 G1314
     1349   PFM-WRITE-F3-9 . . . . . . . .  G1340 G1344
      663   PFM-WRITE-F4-1 . . . . . . . .  G650 G654 G886
     1140   PFM-WRITE-F4-10. . . . . . . .  G1131 G1135
     1170   PFM-WRITE-F4-11. . . . . . . .  G1161 G1165
     1201   PFM-WRITE-F4-12. . . . . . . .  G1192 G1196
     1436   PFM-WRITE-F4-13. . . . . . . .  G1386 G1390
      709   PFM-WRITE-F4-2 . . . . . . . .  G680 G687 G895
     2021   PFM-WRITE-F4-22. . . . . . . .  G2013 G2017
     2095   PFM-WRITE-F4-24-1. . . . . . .  G2083 G2087 G2090
     2112   PFM-WRITE-F4-24-2. . . . . . .  G2100 G2104 G2107
      779   PFM-WRITE-F4-3 . . . . . . . .  G729 G733 G906
      858   PFM-WRITE-F4-4 . . . . . . . .  G800 G804 G916
      969   PFM-WRITE-F4-5 . . . . . . . .  G960 G964
      992   PFM-WRITE-F4-6 . . . . . . . .  G983 G987
     1018   PFM-WRITE-F4-7 . . . . . . . .  G1007 G1013
     1071   PFM-WRITE-F4-8 . . . . . . . .  G1033 G1067
     1107   PFM-WRITE-F4-9 . . . . . . . .  G1098 G1102
      502   PRINT-DETAIL . . . . . . . . .  P620 P640 P653 P659 P664 P692 P697 P701 P705 P710 P738 P743 P747 P751 P755 P759
                                            P763 P767 P771 P775 P780 P809 P814 P818 P822 P826 P830 P834 P838 P842 P846 P850
                                            P854 P859 P942 P970 P993 P1019 P1072 P1108 P1141 P1171 P1202 P1224 P1248 P1276
                                            P1299 P1323 P1351 P1396 P1401 P1405 P1409 P1413 P1417 P1421 P1425 P1429 P1433
                                            P1438 P1470 P1478 P1481 P1490 P1493 P1523 P1530 P1533 P1540 P1543 P1577 P1584
                                            P1587 P1594 P1597 P1604 P1607 P1614 P1617 P1624 P1627 P1634 P1637 P1644 P1647
                                            P1654 P1657 P1664 P1667 P1702 P1709 P1712 P1719 P1722 P1729 P1732 P1739 P1742
                                            P1749 P1752 P1759 P1762 P1769 P1772 P1779 P1782 P1789 P1792 P1828 P1835 P1838
                                            P1845 P1848 P1855 P1858 P1865 P1868 P1875 P1878 P1885 P1888 P1896 P1899 P1906
                                            P1909 P1916 P1919 P1938 P1947 P1952 P1967 P1977 P1982 P2023 P2042 P2049 P2054
                                            P2097 P2114
      598   SECT-NC201A-001
      495   TERMINATE-CALL
      493   TERMINATE-CCVS
      556   WRITE-LINE . . . . . . . . . .  P506 P507 P515 P516 P517 P518 P520 P521 P522 P524 P526 P535 P543 P549 P554 P555
                                            P578 P582 P584 P593
      568   WRT-LN . . . . . . . . . . . .  P562 P563 P564 P567 P572
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    55
0 Defined   Cross-reference of programs     References

        3   NC201A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC201A    Date 06/04/2022  Time 11:59:58   Page    56
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   1039  IGYCB7309-W   There may be a loop from the "PERFORM" statement at "PERFORM (line 1039.1)" to itself.

   1044  IGYCB7309-W   There may be a loop from the "PERFORM" statement at "PERFORM (line 1044.1)" to itself.

   1055  IGYCB7309-W   There may be a loop from the "PERFORM" statement at "PERFORM (line 1055.1)" to itself.

   1092  IGYCB7309-W   There may be a loop from the "PERFORM" statement at "PERFORM (line 1092.1)" to itself.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       5           1              4
-* Statistics for COBOL program NC201A:
 *    Source records = 2117
 *    Data Division statements = 349
 *    Procedure Division statements = 1151
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1163
0End of compilation 1,  program NC201A,  highest severity 4.
0Return code 4
