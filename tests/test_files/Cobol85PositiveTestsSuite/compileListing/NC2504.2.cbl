1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:47   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:47   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2504.2
   000002         000200 PROGRAM-ID.                                                      NC2504.2
   000003         000300     NC250A.                                                      NC2504.2
   000004         000400                                                                  NC2504.2
   000005         000600*                                                              *  NC2504.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2504.2
   000007         000800*                                                              *  NC2504.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2504.2
   000009         001000*                                                              *  NC2504.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2504.2
   000011         001200*                                                              *  NC2504.2
   000012         001400*                                                              *  NC2504.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2504.2
   000014         001600*                                                              *  NC2504.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2504.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2504.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2504.2
   000018         002000*                                                              *  NC2504.2
   000019         002200*                                                                 NC2504.2
   000020         002300*    PROGRAM NC250A TESTS THE GENERAL FORMAT OF THE "IF" STATEMENTNC2504.2
   000021         002400*    A VARIETY OF QUALIFIED DATA-NAMES AND CONDITION-NAMES        NC2504.2
   000022         002500*    ARE USED.                                                    NC2504.2
   000023         002600*                                                                 NC2504.2
   000024         002700                                                                  NC2504.2
   000025         002800 ENVIRONMENT DIVISION.                                            NC2504.2
   000026         002900 CONFIGURATION SECTION.                                           NC2504.2
   000027         003000 SOURCE-COMPUTER.                                                 NC2504.2
   000028         003100     XXXXX082.                                                    NC2504.2
   000029         003200 OBJECT-COMPUTER.                                                 NC2504.2
   000030         003300     XXXXX083.                                                    NC2504.2
   000031         003400 INPUT-OUTPUT SECTION.                                            NC2504.2
   000032         003500 FILE-CONTROL.                                                    NC2504.2
   000033         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2504.2 37
   000034         003700     XXXXX055.                                                    NC2504.2
   000035         003800 DATA DIVISION.                                                   NC2504.2
   000036         003900 FILE SECTION.                                                    NC2504.2
   000037         004000 FD  PRINT-FILE.                                                  NC2504.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004100 01  PRINT-REC PICTURE X(120).                                    NC2504.2
   000039         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2504.2
   000040         004300 WORKING-STORAGE SECTION.                                         NC2504.2
   000041         004400 01  WRK-DU-1V0-1 PIC 9 VALUE 1.                                  NC2504.2
   000042         004500 01  WRK-DU-1V0-2 PIC 9 VALUE 2.                                  NC2504.2
   000043         004600 01  WRK-DU-1V0-3 PIC 9 VALUE 3.                                  NC2504.2
   000044         004700 01  WRK-DU-1V0-4 PIC 9 VALUE ZERO.                               NC2504.2 IMP
   000045         004800 01  WRK-DU-2V0-1 PIC 99 VALUE 10.                                NC2504.2
   000046         004900 01  WRK-DU-2V0-2 PIC 99 VALUE 11.                                NC2504.2
   000047         005000 01  WRK-DU-2V0-3 PIC 99 VALUE 12.                                NC2504.2
   000048         005100 77  SMALL-VALU   PICTURE 99 VALUE 7.                             NC2504.2
   000049         005200 77  SMALLER-VALU PICTURE 99 VALUE 6.                             NC2504.2
   000050         005300 77  SMALLEST-VALU   PICTURE 99 VALUE 5.                          NC2504.2
   000051         005400 77  EVEN-SMALLER PICTURE 99 VALUE 1.                             NC2504.2
   000052         005500 77  WRK-DS-02V00                 PICTURE S99.                    NC2504.2
   000053         005600     88 TEST-2NUC-COND-99         VALUE 99.                       NC2504.2
   000054         005700 77  WRK-DS-06V06     PICTURE S9(6)V9(6).                         NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06                        NC2504.2 54
   000056         005900                                  PICTURE S9(12).                 NC2504.2
   000057         006000 77  A02TWOS-DS-02V00             PICTURE S99    VALUE 22.        NC2504.2
   000058         006100 77  WRK-DS-01V00                 PICTURE S9.                     NC2504.2
   000059         006200 77  A02TWOS-DS-03V02             PICTURE S999V99 VALUE +022.00.  NC2504.2
   000060         006300 77  A990-DS-0201P                PICTURE S99P   VALUE 990.       NC2504.2
   000061         006400 77  A02ONES-DS-02V00             PICTURE S99    VALUE 11.        NC2504.2
   000062         006500 77  A01ONE-DS-P0801              PICTURE SP(8)9 VALUE .000000001.NC2504.2
   000063         006600 77  ATWO-DS-01V00                PICTURE S9     VALUE 2.         NC2504.2
   000064         006700 77  WRK-XN-00001                 PICTURE X.                      NC2504.2
   000065         006800 77  WRK-XN-00005                 PICTURE X(5).                   NC2504.2
   000066         006900 77  TWO  PICTURE 9 VALUE 2.                                      NC2504.2
   000067         007000 77  THREE PICTURE 9 VALUE 3.                                     NC2504.2
   000068         007100 77  SEVEN PICTURE 9 VALUE 7.                                     NC2504.2
   000069         007200 77  EIGHT PICTURE 9 VALUE 8.                                     NC2504.2
   000070         007300 77  NINE  PICTURE 9 VALUE 9.                                     NC2504.2
   000071         007400 77  TEN  PICTURE 99 VALUE 10.                                    NC2504.2
   000072         007500 77  TWENTY PICTURE 99 VALUE 20.                                  NC2504.2
   000073         007600 77  ALTERCOUNT PICTURE 999 VALUE ZERO.                           NC2504.2 IMP
   000074         007700 77  XRAY PICTURE IS X.                                           NC2504.2
   000075         007800 77  IF-D1 PICTURE S9(4)V9(2) VALUE 0.                            NC2504.2
   000076         007900 77  IF-D2 PICTURE S9(4)V9(2) VALUE ZERO.                         NC2504.2 IMP
   000077         008000 77  IF-D3 PICTURE X(10) VALUE "0000000000".                      NC2504.2
   000078         008100 77  IF-D4 PICTURE X(15) VALUE "               ".                 NC2504.2
   000079         008200 77  IF-D5 PICTURE X(10) VALUE ALL QUOTE.                         NC2504.2 IMP
   000080         008300 77  IF-D6 PICTURE A(10) VALUE "BABABABABA".                      NC2504.2
   000081         008400 77  IF-D7 PICTURE S9(6)V9(4) VALUE +123.45.                      NC2504.2
   000082         008500 77  IF-D8 PICTURE 9(6)V9(4) VALUE 12300.                         NC2504.2
   000083         008600 77  IF-D9 PICTURE X(3) VALUE "123".                              NC2504.2
   000084         008700 77  IF-D11 PICTURE X(6) VALUE "ABCDEF".                          NC2504.2
   000085         008800 77  IF-D13 PICTURE 9(6)V9(4) VALUE 12300.                        NC2504.2
   000086         008900 77  IF-D14 PICTURE S9(4)V9(2) VALUE +123.45.                     NC2504.2
   000087         009000 77  IF-D15 PICTURE S999PP VALUE 12300.                           NC2504.2
   000088         009100 77  IF-D16 PICTURE PP99 VALUE .0012.                             NC2504.2
   000089         009200 77  IF-D17 PICTURE SV9(4) VALUE .0012.                           NC2504.2
   000090         009300 77  IF-D18 PICTURE X(10) VALUE "BABABABABA".                     NC2504.2
   000091         009400 77  IF-D19 PICTURE X(10) VALUE "ABCDEF    ".                     NC2504.2
   000092         009500 77  IF-D23 PICTURE $9,9B9.90+.                                   NC2504.2
   000093         009600 77  IF-D24 PICTURE X(10) VALUE "$1,2 3.40+".                     NC2504.2
   000094         009700 77  IF-D25 PICTURE ABABX0A.                                      NC2504.2
   000095         009800 77  IF-D26 PICTURE X(8) VALUE "A C D0E".                         NC2504.2
   000096         009900 77  IF-D27 PICTURE IS 9(6)V9(4) VALUE IS 2137.45                 NC2504.2
   000097         010000     USAGE IS COMPUTATIONAL.                                      NC2504.2
   000098         010100 77  IF-D28 PICTURE IS 999999V9999 VALUE IS 2137.45.              NC2504.2
   000099         010200 77  IF-D31 PICTURE S9(6) VALUE -123.                             NC2504.2
   000100         010300 77  IF-D32 PICTURE S9(4)V99.                                     NC2504.2
   000101         010400     88  A  VALUE 1.                                              NC2504.2
   000102         010500     88  B VALUES ARE 2 THRU 4.                                   NC2504.2
   000103         010600     88  C VALUE IS ZERO.                                         NC2504.2 IMP
   000104         010700     88  D VALUE IS +12.34.                                       NC2504.2
   000105         010800     88  E  VALUE IS .01, .11, .21 .81.                           NC2504.2
   000106         010900     88  F  VALUE IS 100 THRU 128 1000 THRU 1280 -9 THRU -2.      NC2504.2
   000107         011000     88  G  VALUE IS 8765.43 1234 THRU 5678 5 -9999 THRU 10.      NC2504.2
   000108         011100 77  IF-D33 PICTURE X(4).                                         NC2504.2
   000109         011200     88  B   VALUE QUOTE.                                         NC2504.2 IMP
   000110         011300     88  C   VALUE SPACE.                                         NC2504.2 IMP
   000111         011400     88 D VALUE ALL "BAC".                                        NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 77  IF-D34 PICTURE A(4).                                         NC2504.2
   000113         011600     88  B VALUE "A A ".                                          NC2504.2
   000114         011700 77  IF-D37 PICTURE 9(5) VALUE 12345.                             NC2504.2
   000115         011800 77  IF-D38 PICTURE X(9) VALUE "12345    ".                       NC2504.2
   000116         011900 77  CCON-1 PICTURE 99 VALUE 11.                                  NC2504.2
   000117         012000 77  CCON-2 PICTURE 99 VALUE 12.                                  NC2504.2
   000118         012100 77  CCON-3 PICTURE 99 VALUE 13.                                  NC2504.2
   000119         012200 77  COMP-SGN1  PICTURE S9(1) VALUE +9 COMPUTATIONAL.             NC2504.2
   000120         012300 77  COMP-SGN2  PICTURE S9(18) VALUE +3 COMPUTATIONAL.            NC2504.2
   000121         012400 77  COMP-SGN3  PICTURE S9(1) VALUE -5 COMPUTATIONAL.             NC2504.2
   000122         012500 77  COMP-SGN4  PICTURE S9(18) VALUE -3167598765431 COMPUTATIONAL.NC2504.2
   000123         012600 77  START-POINT        PICTURE 9(6) COMPUTATIONAL.               NC2504.2
   000124         012700 77  INC-VALUE          PICTURE 9(6) COMPUTATIONAL.               NC2504.2
   000125         012800 77  SWITCH-PFM-1 PICTURE 9 VALUE ZERO.                           NC2504.2 IMP
   000126         012900 77  SWITCH-PFM-2 PICTURE 9 VALUE ZERO.                           NC2504.2 IMP
   000127         013000 77  PFM-11-COUNTER PICTURE 999 VALUE ZERO.                       NC2504.2 IMP
   000128         013100 77  PFM-12-COUNTER  PICTURE 999 VALUE 100.                       NC2504.2
   000129         013200 77  PFM-12-ANS1  PICTURE 999 VALUE ZERO.                         NC2504.2 IMP
   000130         013300 77  PFM-12-ANS2  PICTURE 999 VALUE ZERO.                         NC2504.2 IMP
   000131         013400 01  SUBSCRIPT-6 PICTURE 99999 VALUE ZERO.                        NC2504.2 IMP
   000132         013500 01  IF-TABLE.                                                    NC2504.2
   000133         013600     02 IF-ELEM PICTURE X OCCURS 12 TIMES.                        NC2504.2
   000134         013700 01  QUOTE-DATA.                                                  NC2504.2
   000135         013800     02 QU-1 PICTURE X(3) VALUE "123".                            NC2504.2
   000136         013900     02 QU-2 PICTURE X VALUE QUOTE.                               NC2504.2 IMP
   000137         014000     02 QU-3 PICTURE X(6) VALUE "ABC456".                         NC2504.2
   000138         014100 01  IF-D10.                                                      NC2504.2
   000139         014200     02  D1 PICTURE X(2) VALUE "01".                              NC2504.2
   000140         014300     02  D2 PICTURE X(2) VALUE "23".                              NC2504.2
   000141         014400     02  D3.                                                      NC2504.2
   000142         014500     03  D4 PICTURE X(4) VALUE "4567".                            NC2504.2
   000143         014600     03 D5 PICTURE X(4) VALUE "8912".                             NC2504.2
   000144         014700 01  IF-D12.                                                      NC2504.2
   000145         014800     02  D1 PICTURE X(3) VALUE "ABC".                             NC2504.2
   000146         014900     02  D2.                                                      NC2504.2
   000147         015000     03  D3.                                                      NC2504.2
   000148         015100     04  D4      PICTURE XX     VALUE "DE".                       NC2504.2
   000149         015200     04  D5 PICTURE X VALUE "F".                                  NC2504.2
   000150         015300 01  IF-D20.                                                      NC2504.2
   000151         015400     02  FILLER    PICTURE 9(5)   VALUE ZERO.                     NC2504.2 IMP
   000152         015500     02  D1 PICTURE 9(2) VALUE 12.                                NC2504.2
   000153         015600     02  D2 PICTURE 9 VALUE 3.                                    NC2504.2
   000154         015700     02  D3 PICTURE 9(2) VALUE 45.                                NC2504.2
   000155         015800 01  IF-D21.                                                      NC2504.2
   000156         015900     02  D1 PICTURE 9(5) VALUE ZEROS.                             NC2504.2 IMP
   000157         016000     02  D2 PICTURE 9(5) VALUE 12345.                             NC2504.2
   000158         016100 01  IF-D22.                                                      NC2504.2
   000159         016200     02  D1 PICTURE A(2) VALUE "AB".                              NC2504.2
   000160         016300     02  D2 PICTURE A(4) VALUE "CDEF".                            NC2504.2
   000161         016400 01  IF-D35.                                                      NC2504.2
   000162         016500     02  AA PICTURE X(2).                                         NC2504.2
   000163         016600     88  A1 VALUE "AA".                                           NC2504.2
   000164         016700     88  A2 VALUE "AB".                                           NC2504.2
   000165         016800     02  BB PICTURE IS X(2).                                      NC2504.2
   000166         016900     88  B1 VALUE "CC".                                           NC2504.2
   000167         017000     88  B2 VALUE "CD".                                           NC2504.2
   000168         017100     02 BB-2 REDEFINES BB.                                        NC2504.2 165
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     03  AAA PICTURE X.                                           NC2504.2
   000170         017300     88  AA1 VALUE "A".                                           NC2504.2
   000171         017400     88  AA2 VALUE "C".                                           NC2504.2
   000172         017500     03  BBB PICTURE X.                                           NC2504.2
   000173         017600     88  BB1    VALUE "B".                                        NC2504.2
   000174         017700     88  BB2 VALUE "D".                                           NC2504.2
   000175         017800 01  IF-D36  PICTURE X(120) VALUE IS    "ABCDEFGHIJKLMNOPQRSTUVWXYNC2504.2
   000176         017900-    "Z1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNC2504.2
   000177         018000-    "NOPQRSTUVWXYZ1234567890ABCDEFGHIJKL".                       NC2504.2
   000178         018100 01  IF-D40 PICTURE 9(5) VALUE 12345                              NC2504.2
   000179         018200              COMPUTATIONAL SYNCHRONIZED RIGHT.                   NC2504.2
   000180         018300     88 IF-D40A VALUE ZERO THRU 10000.                            NC2504.2 IMP
   000181         018400     88 IF-D40B VALUE 10001 THRU 99999.                           NC2504.2
   000182         018500     88 IF-D40C VALUE 99999.                                      NC2504.2
   000183         018600 01  PERFORM1  PICTURE XXX  VALUE SPACES.                         NC2504.2 IMP
   000184         018700 01  PERFORM2  PICTURE S999 VALUE 20.                             NC2504.2
   000185         018800 01  PERFORM3  PICTURE  9  VALUE  5.                              NC2504.2
   000186         018900 01  PERFORM4  PICTURE S99V9.                                     NC2504.2
   000187         019000 01  PERFORM5  PICTURE S99V9  VALUE 10.0.                         NC2504.2
   000188         019100 01  PERFORM6  PICTURE  99V9.                                     NC2504.2
   000189         019200 01  PERFORM7.                                                    NC2504.2
   000190         019300     02  PERFORM8  OCCURS 7 TIMES  PICTURE  99V9.                 NC2504.2
   000191         019400 01  PERFORM9  PICTURE 9   VALUE 3.                               NC2504.2
   000192         019500 01  PERFORM10  PICTURE  S9  VALUE -1.                            NC2504.2
   000193         019600 01  PERFORM11  PICTURE  99  VALUE 6.                             NC2504.2
   000194         019700 01  PERFORM12.                                                   NC2504.2
   000195         019800     02 PERFORM13  OCCURS 4 TIMES.                                NC2504.2
   000196         019900         03 PERFORM14  OCCURS 20 TIMES  PICTURE  99V9.            NC2504.2
   000197         020000         03 PERFORM15  OCCURS 10 TIMES.                           NC2504.2
   000198         020100             04 PERFORM16  OCCURS 5 TIMES  PICTURE 99V9.          NC2504.2
   000199         020200 01  PERFORM17          PICTURE 9(6) COMPUTATIONAL.               NC2504.2
   000200         020300 01  PERFORM18          PICTURE 9(6) COMPUTATIONAL.               NC2504.2
   000201         020400 01  PERFORM-KEY  PICTURE 9.                                      NC2504.2
   000202         020500 01  PERFORM-SEVEN-LEVEL-TABLE.                                   NC2504.2
   000203         020600   03   PFM71                OCCURS 2.                            NC2504.2
   000204         020700     05  PFM72               OCCURS 2.                            NC2504.2
   000205         020800       07  PFM73             OCCURS 2.                            NC2504.2
   000206         020900         09  PFM74           OCCURS 2.                            NC2504.2
   000207         021000           11  PFM75         OCCURS 2.                            NC2504.2
   000208         021100             13  PFM76       OCCURS 2.                            NC2504.2
   000209         021200               15  PFM77     OCCURS 2.                            NC2504.2
   000210         021300                 17  PFM77-1 PIC X.                               NC2504.2
   000211         021400 01  S1                      PIC S9(3) COMP.                      NC2504.2
   000212         021500 01  S2                      PIC S9(3) COMP.                      NC2504.2
   000213         021600 01  S3                      PIC S9(3) COMP.                      NC2504.2
   000214         021700 01  S4                      PIC S9(3) COMP.                      NC2504.2
   000215         021800 01  S5                      PIC S9(3) COMP.                      NC2504.2
   000216         021900 01  S6                      PIC S9(3) COMP.                      NC2504.2
   000217         022000 01  S7                      PIC S9(3) COMP.                      NC2504.2
   000218         022100 01  PFM-7-TOT               PIC S9(3) COMP.                      NC2504.2
   000219         022200 01  PFM-F4-24-TOT           PIC S9(3) COMP.                      NC2504.2
   000220         022300 01  PFM-A                   PIC S9(3) COMP.                      NC2504.2
   000221         022400 01  PFM-B                   PIC S9(3) COMP.                      NC2504.2
   000222         022500 01  FILLER-A.                                                    NC2504.2
   000223         022600   03  PFM-F4-25-A           PIC S9(3) COMP OCCURS 10.            NC2504.2
   000224         022700 01  FILLER-B.                                                    NC2504.2
   000225         022800   03  PFM-F4-25-B           PIC S9(3) COMP OCCURS 10.            NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 01  FILLER-C.                                                    NC2504.2
   000227         023000   03  PFM-F4-25-C           PIC S9(3) COMP OCCURS 10.            NC2504.2
   000228         023100 01  RECEIVING-TABLE.                                             NC2504.2
   000229         023200     03 TBL-ELEMEN-A.                                             NC2504.2
   000230         023300         05 TBL-ELEMEN-B          PICTURE X(18).                  NC2504.2
   000231         023400         05 TBL-ELEMEN-C          PICTURE X(18).                  NC2504.2
   000232         023500     03  TBL-ELEMEN-D.                                            NC2504.2
   000233         023600         05 TBL-ELEMEN-E          PICTURE X OCCURS 36 TIMES.      NC2504.2
   000234         023700 01  LITERAL-SPLITTER.                                            NC2504.2
   000235         023800     02 PART1                     PICTURE X(20).                  NC2504.2
   000236         023900     02 PART2                     PICTURE X(20).                  NC2504.2
   000237         024000     02 PART3                     PICTURE X(20).                  NC2504.2
   000238         024100     02 PART4                     PICTURE X(20).                  NC2504.2
   000239         024200 01  LITERAL-TABLE REDEFINES LITERAL-SPLITTER.                    NC2504.2 234
   000240         024300     02 80PARTS                   PICTURE X      OCCURS 80 TIMES. NC2504.2
   000241         024400 01  GRP-FOR-88-LEVELS.                                           NC2504.2
   000242         024500     03 WRK-DS-02V00-COND         PICTURE 99.                     NC2504.2
   000243         024600         88 COND-1                VALUE IS 01 THRU 05.            NC2504.2
   000244         024700         88 COND-2                VALUES ARE 06 THRU 10           NC2504.2
   000245         024800                                           16 THRU 20  00.        NC2504.2
   000246         024900         88 COND-3                VALUES 11 THRU 15.              NC2504.2
   000247         025000 01  GRP-MOVE-CONSTANTS.                                          NC2504.2
   000248         025100     03 GRP-GROUP-MOVE-FROM.                                      NC2504.2
   000249         025200         04 GRP-ALPHABETIC.                                       NC2504.2
   000250         025300             05 ALPHABET-AN-00026 PICTURE A(26)                   NC2504.2
   000251         025400                        VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".       NC2504.2
   000252         025500         04 GRP-NUMERIC.                                          NC2504.2
   000253         025600             05 DIGITS-DV-10V00   PICTURE 9(10) VALUE 0123456789. NC2504.2
   000254         025700         05 DIGITS-DU-06V04-S REDEFINES DIGITS-DV-10V00           NC2504.2 253
   000255         025800                                  PICTURE 9(6)V9999.              NC2504.2
   000256         025900         04 GRP-ALPHANUMERIC.                                     NC2504.2
   000257         026000             05 ALPHANUMERIC-XN-00049 PICTURE X(50)               NC2504.2
   000258         026100     VALUE  "ABCDEFGHIJKLMNOPQRSTUVWXYZ+-><=$,;.()/* 0123456789". NC2504.2
   000259         026200             05 FILLER                PICTURE X  VALUE QUOTE.     NC2504.2 IMP
   000260         026300 01  GRP-FOR-2N058.                                               NC2504.2
   000261         026400     02 SUB-GRP-FOR-2N058-A.                                      NC2504.2
   000262         026500         03 ELEM-FOR-2N058-A PICTURE 999  VALUE ZEROES.           NC2504.2 IMP
   000263         026600         03 ELEM-FOR-2N058-B PICTURE XXX  VALUE ZEROS.            NC2504.2 IMP
   000264         026700         03 ELEM-FOR-2N058-C PICTURE XXX  VALUE SPACES.           NC2504.2 IMP
   000265         026800         03 ELEM-FOR-2N058-D PICTURE X(6) VALUE ALL "ABC".        NC2504.2
   000266         026900         03 ELEM-FOR-2N058-E PICTURE XXX  VALUE ALL "Z".          NC2504.2
   000267         027000         03 ELEM-FOR-2N058-F PICTURE XXX  VALUE ALL SPACES.       NC2504.2 IMP
   000268         027100         03 ELEM-FOR-2N058-G PICTURE XXX  VALUE ALL ZEROES.       NC2504.2 IMP
   000269         027200         03 ELEM-FOR-2N058-H PICTURE 999  VALUE ALL ZEROS.        NC2504.2 IMP
   000270         027300         03 ELEM-FOR-2N058-I PICTURE XXX  VALUE QUOTES.           NC2504.2 IMP
   000271         027400         03 ELEM-FOR-2N058-J PICTURE XXX  VALUE ALL QUOTES.       NC2504.2 IMP
   000272         027500         03 ELEM-FOR-2N058-K PICTURE XXX  VALUE ALL HIGH-VALUES.  NC2504.2 IMP
   000273         027600         03 ELEM-FOR-2N058-L PICTURE XXX  VALUE ALL LOW-VALUES.   NC2504.2 IMP
   000274         027700         03 ELEM-FOR-2N058-M PICTURE XXX  VALUE HIGH-VALUES.      NC2504.2 IMP
   000275         027800         03 ELEM-FOR-2N058-N PICTURE XXX  VALUE LOW-VALUES.       NC2504.2 IMP
   000276         027900     02 SUB-GRP-FOR-2N058-B.                                      NC2504.2
   000277         028000         03 SUB-SUB-BA.                                           NC2504.2
   000278         028100             04 ELEM-FOR-2N058-A  PICTURE 999.                    NC2504.2
   000279         028200             04 ELEM-FOR-2N058-B  PICTURE XXX.                    NC2504.2
   000280         028300             04 ELEM-FOR-2N058-C  PICTURE XXX.                    NC2504.2
   000281         028400             04 ELEM-FOR-2N058-D  PICTURE X(6).                   NC2504.2
   000282         028500         03 SUB-SUB-BB.                                           NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600             04 ELEM-FOR-2N058-E  PICTURE XXX.                    NC2504.2
   000284         028700             04 ELEM-FOR-2N058-F  PICTURE XXX.                    NC2504.2
   000285         028800             04 ELEM-FOR-2N058-G  PICTURE XXX.                    NC2504.2
   000286         028900             04 ELEM-FOR-2N058-H  PICTURE 999.                    NC2504.2
   000287         029000         03 SUB-SUB-BC.                                           NC2504.2
   000288         029100             04 ELEM-FOR-2N058-I  PICTURE XXX.                    NC2504.2
   000289         029200             04 ELEM-FOR-2N058-J  PICTURE XXX.                    NC2504.2
   000290         029300             04 ELEM-FOR-2N058-K  PICTURE XXX.                    NC2504.2
   000291         029400             04 ELEM-FOR-2N058-L  PICTURE XXX.                    NC2504.2
   000292         029500             04 ELEM-FOR-2N058-M  PICTURE XXX.                    NC2504.2
   000293         029600             04 ELEM-FOR-2N058-N  PICTURE XXX.                    NC2504.2
   000294         029700 01  CHARACTER-BREAKDOWN-S.                                       NC2504.2
   000295         029800     02   FIRST-20S PICTURE X(20).                                NC2504.2
   000296         029900     02  SECOND-20S PICTURE X(20).                                NC2504.2
   000297         030000     02   THIRD-20S PICTURE X(20).                                NC2504.2
   000298         030100     02  FOURTH-20S PICTURE X(20).                                NC2504.2
   000299         030200     02   FIFTH-20S PICTURE X(20).                                NC2504.2
   000300         030300     02   SIXTH-20S PICTURE X(20).                                NC2504.2
   000301         030400     02 SEVENTH-20S PICTURE X(20).                                NC2504.2
   000302         030500     02  EIGHTH-20S PICTURE X(20).                                NC2504.2
   000303         030600     02   NINTH-20S PICTURE X(20).                                NC2504.2
   000304         030700     02   TENTH-20S PICTURE X(20).                                NC2504.2
   000305         030800 01  CHARACTER-BREAKDOWN-R.                                       NC2504.2
   000306         030900     02   FIRST-20R PICTURE X(20).                                NC2504.2
   000307         031000     02  SECOND-20R PICTURE X(20).                                NC2504.2
   000308         031100     02   THIRD-20R PICTURE X(20).                                NC2504.2
   000309         031200     02  FOURTH-20R PICTURE X(20).                                NC2504.2
   000310         031300     02   FIFTH-20R PICTURE X(20).                                NC2504.2
   000311         031400     02   SIXTH-20R PICTURE X(20).                                NC2504.2
   000312         031500     02 SEVENTH-20R PICTURE X(20).                                NC2504.2
   000313         031600     02  EIGHTH-20R PICTURE X(20).                                NC2504.2
   000314         031700     02   NINTH-20R PICTURE X(20).                                NC2504.2
   000315         031800     02   TENTH-20R PICTURE X(20).                                NC2504.2
   000316         031900 01  TABLE-80.                                                    NC2504.2
   000317         032000     02  ELMT OCCURS 3 TIMES PIC 9.                               NC2504.2
   000318         032100     88  A80  VALUES ARE ZERO THRU 7.                             NC2504.2 IMP
   000319         032200     88  B80  VALUE 8.                                            NC2504.2
   000320         032300     88  C80  VALUES ARE 7, 8 THROUGH 9.                          NC2504.2
   000321         032400                                                                  NC2504.2
   000322         032500 01  TABLE-86.                                                    NC2504.2
   000323         032600     88  A86  VALUE "ABC".                                        NC2504.2
   000324         032700     88  B86  VALUE "ABCABC".                                     NC2504.2
   000325         032800     88  C86  VALUE "   ABC".                                     NC2504.2
   000326         032900     02  DATANAME-86  PIC XXX  VALUE "ABC".                       NC2504.2
   000327         033000     02  DNAME-86.                                                NC2504.2
   000328         033100         03  FILLER  PIC X  VALUE "A".                            NC2504.2
   000329         033200         03  FILLER  PIC X  VALUE "B".                            NC2504.2
   000330         033300         03  FILLER  PIC X   VALUE "C".                           NC2504.2
   000331         033400 01  FIGCON-DATA.                                                 NC2504.2
   000332         033500     02 SPACE-X         PICTURE X(10) VALUE "          ".         NC2504.2
   000333         033600     02 QUOTE-X         PICTURE X(5)  VALUE QUOTE.                NC2504.2 IMP
   000334         033700     02 LOW-VAL         PICTURE X(5)  VALUE LOW-VALUE.            NC2504.2 IMP
   000335         033800     02 ABC PICTURE XXX VALUE "ABC".                              NC2504.2
   000336         033900     02 ONE23           PICTURE 9999  VALUE 123.                  NC2504.2
   000337         034000     02 ZERO-C          PICTURE 9(10) VALUE 0 COMPUTATIONAL.      NC2504.2
   000338         034100     02 ZERO-D          PICTURE 9     VALUE ZERO USAGE DISPLAY.   NC2504.2 IMP
   000339         034200 01  TEST-RESULTS.                                                NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     02 FILLER                   PIC X      VALUE SPACE.          NC2504.2 IMP
   000341         034400     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2504.2 IMP
   000342         034500     02 FILLER                   PIC X      VALUE SPACE.          NC2504.2 IMP
   000343         034600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2504.2 IMP
   000344         034700     02 FILLER                   PIC X      VALUE SPACE.          NC2504.2 IMP
   000345         034800     02  PAR-NAME.                                                NC2504.2
   000346         034900       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2504.2 IMP
   000347         035000       03  PARDOT-X              PIC X      VALUE SPACE.          NC2504.2 IMP
   000348         035100       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2504.2 IMP
   000349         035200     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2504.2 IMP
   000350         035300     02 RE-MARK                  PIC X(61).                       NC2504.2
   000351         035400 01  TEST-COMPUTED.                                               NC2504.2
   000352         035500     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2504.2 IMP
   000353         035600     02 FILLER                   PIC X(17)  VALUE                 NC2504.2
   000354         035700            "       COMPUTED=".                                   NC2504.2
   000355         035800     02 COMPUTED-X.                                               NC2504.2
   000356         035900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2504.2 IMP
   000357         036000     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2504.2 356
   000358         036100                                 PIC -9(9).9(9).                  NC2504.2
   000359         036200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2504.2 356
   000360         036300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2504.2 356
   000361         036400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2504.2 356
   000362         036500     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2504.2 356
   000363         036600         04 COMPUTED-18V0                    PIC -9(18).          NC2504.2
   000364         036700         04 FILLER                           PIC X.               NC2504.2
   000365         036800     03 FILLER PIC X(50) VALUE SPACE.                             NC2504.2 IMP
   000366         036900 01  TEST-CORRECT.                                                NC2504.2
   000367         037000     02 FILLER PIC X(30) VALUE SPACE.                             NC2504.2 IMP
   000368         037100     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2504.2
   000369         037200     02 CORRECT-X.                                                NC2504.2
   000370         037300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2504.2 IMP
   000371         037400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2504.2 370
   000372         037500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2504.2 370
   000373         037600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2504.2 370
   000374         037700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2504.2 370
   000375         037800     03      CR-18V0 REDEFINES CORRECT-A.                         NC2504.2 370
   000376         037900         04 CORRECT-18V0                     PIC -9(18).          NC2504.2
   000377         038000         04 FILLER                           PIC X.               NC2504.2
   000378         038100     03 FILLER PIC X(2) VALUE SPACE.                              NC2504.2 IMP
   000379         038200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2504.2 IMP
   000380         038300 01  CCVS-C-1.                                                    NC2504.2
   000381         038400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2504.2
   000382         038500-    "SS  PARAGRAPH-NAME                                          NC2504.2
   000383         038600-    "       REMARKS".                                            NC2504.2
   000384         038700     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2504.2 IMP
   000385         038800 01  CCVS-C-2.                                                    NC2504.2
   000386         038900     02 FILLER                     PIC X        VALUE SPACE.      NC2504.2 IMP
   000387         039000     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2504.2
   000388         039100     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2504.2 IMP
   000389         039200     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2504.2
   000390         039300     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2504.2 IMP
   000391         039400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2504.2 IMP
   000392         039500 01  REC-CT                        PIC 99       VALUE ZERO.       NC2504.2 IMP
   000393         039600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2504.2 IMP
   000394         039700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2504.2 IMP
   000395         039800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2504.2 IMP
   000396         039900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2504.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2504.2 IMP
   000398         040100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2504.2 IMP
   000399         040200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2504.2 IMP
   000400         040300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2504.2 IMP
   000401         040400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2504.2 IMP
   000402         040500 01  CCVS-H-1.                                                    NC2504.2
   000403         040600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2504.2 IMP
   000404         040700     02  FILLER                    PIC X(42)    VALUE             NC2504.2
   000405         040800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2504.2
   000406         040900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2504.2 IMP
   000407         041000 01  CCVS-H-2A.                                                   NC2504.2
   000408         041100   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2504.2 IMP
   000409         041200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2504.2
   000410         041300   02  FILLER                        PIC XXXX   VALUE             NC2504.2
   000411         041400     "4.2 ".                                                      NC2504.2
   000412         041500   02  FILLER                        PIC X(28)  VALUE             NC2504.2
   000413         041600            " COPY - NOT FOR DISTRIBUTION".                       NC2504.2
   000414         041700   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2504.2 IMP
   000415         041800                                                                  NC2504.2
   000416         041900 01  CCVS-H-2B.                                                   NC2504.2
   000417         042000   02  FILLER                        PIC X(15)  VALUE             NC2504.2
   000418         042100            "TEST RESULT OF ".                                    NC2504.2
   000419         042200   02  TEST-ID                       PIC X(9).                    NC2504.2
   000420         042300   02  FILLER                        PIC X(4)   VALUE             NC2504.2
   000421         042400            " IN ".                                               NC2504.2
   000422         042500   02  FILLER                        PIC X(12)  VALUE             NC2504.2
   000423         042600     " HIGH       ".                                              NC2504.2
   000424         042700   02  FILLER                        PIC X(22)  VALUE             NC2504.2
   000425         042800            " LEVEL VALIDATION FOR ".                             NC2504.2
   000426         042900   02  FILLER                        PIC X(58)  VALUE             NC2504.2
   000427         043000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2504.2
   000428         043100 01  CCVS-H-3.                                                    NC2504.2
   000429         043200     02  FILLER                      PIC X(34)  VALUE             NC2504.2
   000430         043300            " FOR OFFICIAL USE ONLY    ".                         NC2504.2
   000431         043400     02  FILLER                      PIC X(58)  VALUE             NC2504.2
   000432         043500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2504.2
   000433         043600     02  FILLER                      PIC X(28)  VALUE             NC2504.2
   000434         043700            "  COPYRIGHT   1985 ".                                NC2504.2
   000435         043800 01  CCVS-E-1.                                                    NC2504.2
   000436         043900     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2504.2 IMP
   000437         044000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2504.2
   000438         044100     02 ID-AGAIN                     PIC X(9).                    NC2504.2
   000439         044200     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2504.2 IMP
   000440         044300 01  CCVS-E-2.                                                    NC2504.2
   000441         044400     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2504.2 IMP
   000442         044500     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2504.2 IMP
   000443         044600     02 CCVS-E-2-2.                                               NC2504.2
   000444         044700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2504.2 IMP
   000445         044800         03 FILLER                   PIC X      VALUE SPACE.      NC2504.2 IMP
   000446         044900         03 ENDER-DESC               PIC X(44)  VALUE             NC2504.2
   000447         045000            "ERRORS ENCOUNTERED".                                 NC2504.2
   000448         045100 01  CCVS-E-3.                                                    NC2504.2
   000449         045200     02  FILLER                      PIC X(22)  VALUE             NC2504.2
   000450         045300            " FOR OFFICIAL USE ONLY".                             NC2504.2
   000451         045400     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2504.2 IMP
   000452         045500     02  FILLER                      PIC X(58)  VALUE             NC2504.2
   000453         045600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2504.2 IMP
   000455         045800     02 FILLER                       PIC X(15)  VALUE             NC2504.2
   000456         045900             " COPYRIGHT 1985".                                   NC2504.2
   000457         046000 01  CCVS-E-4.                                                    NC2504.2
   000458         046100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2504.2 IMP
   000459         046200     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2504.2
   000460         046300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2504.2 IMP
   000461         046400     02 FILLER                       PIC X(40)  VALUE             NC2504.2
   000462         046500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2504.2
   000463         046600 01  XXINFO.                                                      NC2504.2
   000464         046700     02 FILLER                       PIC X(19)  VALUE             NC2504.2
   000465         046800            "*** INFORMATION ***".                                NC2504.2
   000466         046900     02 INFO-TEXT.                                                NC2504.2
   000467         047000       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2504.2 IMP
   000468         047100       04 XXCOMPUTED                 PIC X(20).                   NC2504.2
   000469         047200       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2504.2 IMP
   000470         047300       04 XXCORRECT                  PIC X(20).                   NC2504.2
   000471         047400     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2504.2
   000472         047500 01  HYPHEN-LINE.                                                 NC2504.2
   000473         047600     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2504.2 IMP
   000474         047700     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2504.2
   000475         047800-    "*****************************************".                 NC2504.2
   000476         047900     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2504.2
   000477         048000-    "******************************".                            NC2504.2
   000478         048100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2504.2
   000479         048200     "NC250A".                                                    NC2504.2
   000480         048300 PROCEDURE DIVISION.                                              NC2504.2
   000481         048400 CCVS1 SECTION.                                                   NC2504.2
   000482         048500 OPEN-FILES.                                                      NC2504.2
   000483         048600     OPEN     OUTPUT PRINT-FILE.                                  NC2504.2 37
   000484         048700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2504.2 478 419 478 438
   000485         048800     MOVE    SPACE TO TEST-RESULTS.                               NC2504.2 IMP 339
   000486         048900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2504.2 509 514
   000487         049000     GO TO CCVS1-EXIT.                                            NC2504.2 591
   000488         049100 CLOSE-FILES.                                                     NC2504.2
   000489         049200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2504.2 518 539 37
   000490         049300 TERMINATE-CCVS.                                                  NC2504.2
   000491         049400     STOP     RUN.                                                NC2504.2
   000492         049500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2504.2 343 395
   000493         049600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2504.2 343 396
   000494         049700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2504.2 343 394
   000495         049800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2504.2 343 393
   000496         049900     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2504.2 350
   000497         050000 PRINT-DETAIL.                                                    NC2504.2
   000498         050100     IF REC-CT NOT EQUAL TO ZERO                                  NC2504.2 392 IMP
   000499      1  050200             MOVE "." TO PARDOT-X                                 NC2504.2 347
   000500      1  050300             MOVE REC-CT TO DOTVALUE.                             NC2504.2 392 348
   000501         050400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2504.2 339 38 551
   000502         050500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2504.2 343 551
   000503      1  050600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2504.2 568 581
   000504      1  050700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2504.2 582 590
   000505         050800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2504.2 IMP 343 IMP 355
   000506         050900     MOVE SPACE TO CORRECT-X.                                     NC2504.2 IMP 369
   000507         051000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2504.2 392 IMP IMP 345
   000508         051100     MOVE     SPACE TO RE-MARK.                                   NC2504.2 IMP 350
   000509         051200 HEAD-ROUTINE.                                                    NC2504.2
   000510         051300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2504.2 402 39 551
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2504.2 407 39 551
   000512         051500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2504.2 416 39 551
   000513         051600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2504.2 428 39 551
   000514         051700 COLUMN-NAMES-ROUTINE.                                            NC2504.2
   000515         051800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2504.2 380 39 551
   000516         051900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2504.2 385 39 551
   000517         052000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2504.2 472 39 551
   000518         052100 END-ROUTINE.                                                     NC2504.2
   000519         052200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2504.2 472 39 551
   000520         052300 END-RTN-EXIT.                                                    NC2504.2
   000521         052400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2504.2 435 39 551
   000522         052500 END-ROUTINE-1.                                                   NC2504.2
   000523         052600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2504.2 394 398 395
   000524         052700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2504.2 398 393 398
   000525         052800      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2504.2 396 398
   000526         052900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2504.2
   000527         053000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2504.2 396 458
   000528         053100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2504.2 398 460
   000529         053200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2504.2 457 443
   000530         053300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2504.2 440 39 551
   000531         053400  END-ROUTINE-12.                                                 NC2504.2
   000532         053500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2504.2 446
   000533         053600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2504.2 394 IMP
   000534      1  053700         MOVE "NO " TO ERROR-TOTAL                                NC2504.2 444
   000535         053800         ELSE                                                     NC2504.2
   000536      1  053900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2504.2 394 444
   000537         054000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2504.2 440 39
   000538         054100     PERFORM WRITE-LINE.                                          NC2504.2 551
   000539         054200 END-ROUTINE-13.                                                  NC2504.2
   000540         054300     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2504.2 393 IMP
   000541      1  054400         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2504.2 444
   000542      1  054500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2504.2 393 444
   000543         054600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2504.2 446
   000544         054700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2504.2 440 39 551
   000545         054800      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2504.2 395 IMP
   000546      1  054900          MOVE "NO " TO ERROR-TOTAL                               NC2504.2 444
   000547      1  055000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2504.2 395 444
   000548         055100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2504.2 446
   000549         055200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2504.2 440 39 551
   000550         055300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2504.2 448 39 551
   000551         055400 WRITE-LINE.                                                      NC2504.2
   000552         055500     ADD 1 TO RECORD-COUNT.                                       NC2504.2 400
   000553         055600     IF RECORD-COUNT GREATER 50                                   NC2504.2 400
   000554      1  055700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2504.2 39 399
   000555      1  055800         MOVE SPACE TO DUMMY-RECORD                               NC2504.2 IMP 39
   000556      1  055900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2504.2 39
   000557      1  056000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2504.2 380 39 563
   000558      1  056100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2504.2 385 39 563
   000559      1  056200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2504.2 472 39 563
   000560      1  056300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2504.2 399 39
   000561      1  056400         MOVE ZERO TO RECORD-COUNT.                               NC2504.2 IMP 400
   000562         056500     PERFORM WRT-LN.                                              NC2504.2 563
   000563         056600 WRT-LN.                                                          NC2504.2
   000564         056700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2504.2 39
   000565         056800     MOVE SPACE TO DUMMY-RECORD.                                  NC2504.2 IMP 39
   000566         056900 BLANK-LINE-PRINT.                                                NC2504.2
   000567         057000     PERFORM WRT-LN.                                              NC2504.2 563
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100 FAIL-ROUTINE.                                                    NC2504.2
   000569         057200     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2504.2 355 IMP 576
   000570         057300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2504.2 369 IMP 576
   000571         057400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2504.2 401 471
   000572         057500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2504.2 466
   000573         057600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2504.2 463 39 551
   000574         057700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2504.2 IMP 471
   000575         057800     GO TO  FAIL-ROUTINE-EX.                                      NC2504.2 581
   000576         057900 FAIL-ROUTINE-WRITE.                                              NC2504.2
   000577         058000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2504.2 351 38 551
   000578         058100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2504.2 401 379
   000579         058200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2504.2 366 38 551
   000580         058300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2504.2 IMP 379
   000581         058400 FAIL-ROUTINE-EX. EXIT.                                           NC2504.2
   000582         058500 BAIL-OUT.                                                        NC2504.2
   000583         058600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2504.2 356 IMP 585
   000584         058700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2504.2 370 IMP 590
   000585         058800 BAIL-OUT-WRITE.                                                  NC2504.2
   000586         058900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2504.2 370 470 356 468
   000587         059000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2504.2 401 471
   000588         059100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2504.2 463 39 551
   000589         059200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2504.2 IMP 471
   000590         059300 BAIL-OUT-EX. EXIT.                                               NC2504.2
   000591         059400 CCVS1-EXIT.                                                      NC2504.2
   000592         059500     EXIT.                                                        NC2504.2
   000593         059600 SECT-NC201A-001 SECTION.                                         NC2504.2
   000594         059700*                                                                 NC2504.2
   000595         059800 IF--INIT-A.                                                      NC2504.2
   000596         059900     MOVE   "VI-89 6.15" TO ANSI-REFERENCE.                       NC2504.2 401
   000597         060000     PERFORM END-ROUTINE.                                         NC2504.2 518
   000598         060100     MOVE SPACE TO TEST-RESULTS.                                  NC2504.2 IMP 339
   000599         060200     MOVE "THE FOLLOWING TESTS        " TO RE-MARK.               NC2504.2 350
   000600         060300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000601         060400     MOVE "COMPARE FIGURATIVE         " TO RE-MARK.               NC2504.2 350
   000602         060500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000603         060600     MOVE "CONSTANTS, SIGN OF DATA,   " TO RE-MARK.               NC2504.2 350
   000604         060700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000605         060800     MOVE "AND CONDITION-NAMES        " TO RE-MARK.               NC2504.2 350
   000606         060900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000607         061000     MOVE "IN VARYING COMBINATIONS.   " TO RE-MARK.               NC2504.2 350
   000608         061100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000609         061200     MOVE "COMPARE--           " TO FEATURE.                      NC2504.2 341
   000610         061300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000611         061400     MOVE "  FIG. CONSTANTS    " TO FEATURE.                      NC2504.2 341
   000612         061500 IF--TEST-1.                                                      NC2504.2
   000613         061600     IF ZEROES IS EQUAL TO IF-D3 PERFORM PASS ELSE PERFORM FAIL.  NC2504.2 IMP 77 493 494
   000614         061700*        NOTE FIGURATIVE ZEROES VS ALPHANUMERIC FIELD.            NC2504.2
   000615         061800     GO TO IF--WRITE-1.                                           NC2504.2 618
   000616         061900 IF--DELETE-1.                                                    NC2504.2
   000617         062000     PERFORM DE-LETE.                                             NC2504.2 495
   000618         062100 IF--WRITE-1.                                                     NC2504.2
   000619         062200     MOVE "IF--TEST-1 " TO PAR-NAME.                              NC2504.2 345
   000620         062300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000621         062400 IF--TEST-2.                                                      NC2504.2
   000622         062500     IF SPACES EQUAL TO IF-D4 PERFORM PASS ELSE PERFORM FAIL.     NC2504.2 IMP 78 493 494
   000623         062600*        NOTE FIGURATIVE SPACES VS ALPHANUMERIC FIELD.            NC2504.2
   000624         062700     GO TO IF--WRITE-2.                                           NC2504.2 627
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 IF--DELETE-2.                                                    NC2504.2
   000626         062900     PERFORM DE-LETE.                                             NC2504.2 495
   000627         063000 IF--WRITE-2.                                                     NC2504.2
   000628         063100     MOVE "IF--TEST-2 " TO PAR-NAME.                              NC2504.2 345
   000629         063200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000630         063300 IF--TEST-3.                                                      NC2504.2
   000631         063400     IF QUOTES EQUAL TO IF-D5 PERFORM PASS ELSE PERFORM FAIL.     NC2504.2 IMP 79 493 494
   000632         063500*        NOTE FIGURATIVE QUOTES VS ALPHANUMERIC FIELD.            NC2504.2
   000633         063600     GO TO IF--WRITE-3.                                           NC2504.2 636
   000634         063700 IF--DELETE-3.                                                    NC2504.2
   000635         063800     PERFORM DE-LETE.                                             NC2504.2 495
   000636         063900 IF--WRITE-3.                                                     NC2504.2
   000637         064000     MOVE "IF--TEST-3 " TO PAR-NAME.                              NC2504.2 345
   000638         064100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000639         064200 IF--TEST-4.                                                      NC2504.2
   000640         064300     IF IF-D6 EQUAL TO ALL "BA" PERFORM PASS ELSE PERFORM FAIL.   NC2504.2 80 493 494
   000641         064400*        NOTE ALL ANY LITERAL VS ALPHANUMERIC FIELD.              NC2504.2
   000642         064500     GO TO IF--WRITE-4.                                           NC2504.2 645
   000643         064600 IF--DELETE-4.                                                    NC2504.2
   000644         064700     PERFORM DE-LETE.                                             NC2504.2 495
   000645         064800 IF--WRITE-4.                                                     NC2504.2
   000646         064900     MOVE "IF--TEST-4 " TO PAR-NAME.                              NC2504.2 345
   000647         065000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000648         065100 IF--TEST-5.                                                      NC2504.2
   000649         065200     IF IF-D4 GREATER THAN SPACES PERFORM FAIL ELSE               NC2504.2 78 IMP 494
   000650      1  065300     PERFORM PASS.                                                NC2504.2 493
   000651         065400*        NOTE FIG-SPACES VS ALPHANUMERIC FIELD.                   NC2504.2
   000652         065500     GO TO IF--WRITE-5.                                           NC2504.2 655
   000653         065600 IF--DELETE-5.                                                    NC2504.2
   000654         065700     PERFORM DE-LETE.                                             NC2504.2 495
   000655         065800 IF--WRITE-5.                                                     NC2504.2
   000656         065900     MOVE "IF--TEST-5 " TO PAR-NAME.                              NC2504.2 345
   000657         066000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000658         066100 IF--TEST-6.                                                      NC2504.2
   000659         066200     IF QUOTES GREATER THAN IF-D5 PERFORM FAIL ELSE PERFORM PASS. NC2504.2 IMP 79 494 493
   000660         066300*        NOTE FIG-QUOTES VS ALPHANUMERIC FIELD.                   NC2504.2
   000661         066400     GO TO IF--WRITE-6.                                           NC2504.2 664
   000662         066500 IF--DELETE-6.                                                    NC2504.2
   000663         066600     PERFORM DE-LETE.                                             NC2504.2 495
   000664         066700 IF--WRITE-6.                                                     NC2504.2
   000665         066800     MOVE "IF--TEST-6 " TO PAR-NAME.                              NC2504.2 345
   000666         066900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000667         067000 IF--TEST-7.                                                      NC2504.2
   000668         067100     IF ALL "BA" GREATER THAN IF-D6 PERFORM FAIL                  NC2504.2 80 494
   000669      1  067200     ELSE PERFORM PASS.                                           NC2504.2 493
   000670         067300*    NOTE ALL ANY LITERAL VS ALPHA FIELD.                         NC2504.2
   000671         067400     GO TO IF--WRITE-7.                                           NC2504.2 674
   000672         067500 IF--DELETE-7.                                                    NC2504.2
   000673         067600     PERFORM DE-LETE.                                             NC2504.2 495
   000674         067700 IF--WRITE-7.                                                     NC2504.2
   000675         067800     MOVE "IF--TEST-7 " TO PAR-NAME.                              NC2504.2 345
   000676         067900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000677         068000 IF--INIT-B.                                                      NC2504.2
   000678         068100     MOVE "  UNEQUAL LENGTHS   " TO FEATURE.                      NC2504.2 341
   000679         068200 IF--TEST-8.                                                      NC2504.2
   000680         068300     IF IF-D22 GREATER THAN IF-D19 PERFORM FAIL ELSE PERFORM PASS.NC2504.2 158 91 494 493
   000681         068400*        NOTE ALPHANUMERIC GROUP VS ALPHANUMERIC FIELD.           NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500*    NOTE UNEQUAL LENGTHS.                                        NC2504.2
   000683         068600     GO TO IF--WRITE-8.                                           NC2504.2 686
   000684         068700 IF--DELETE-8.                                                    NC2504.2
   000685         068800     PERFORM DE-LETE.                                             NC2504.2 495
   000686         068900 IF--WRITE-8.                                                     NC2504.2
   000687         069000     MOVE "IF--TEST-8 " TO PAR-NAME.                              NC2504.2 345
   000688         069100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000689         069200 IF--INIT-C.                                                      NC2504.2
   000690         069300     MOVE "  POSITIVE          " TO FEATURE.                      NC2504.2 341
   000691         069400 IF--TEST-9.                                                      NC2504.2
   000692         069500     IF IF-D1 IS NOT POSITIVE PERFORM PASS ELSE PERFORM FAIL.     NC2504.2 75 493 494
   000693         069600*        NOTE POSITIVE TEST ON ZERO VALUE.                        NC2504.2
   000694         069700     GO TO IF--WRITE-9.                                           NC2504.2 697
   000695         069800 IF--DELETE-9.                                                    NC2504.2
   000696         069900     PERFORM DE-LETE.                                             NC2504.2 495
   000697         070000 IF--WRITE-9.                                                     NC2504.2
   000698         070100     MOVE "IF--TEST-9 " TO PAR-NAME.                              NC2504.2 345
   000699         070200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000700         070300 IF--TEST-10.                                                     NC2504.2
   000701         070400     IF IF-D8 POSITIVE PERFORM PASS ELSE      PERFORM FAIL.       NC2504.2 82 493 494
   000702         070500*        NOTE POSITIVE TEST ON UNSIGNED VALUE.                    NC2504.2
   000703         070600     GO TO IF--WRITE-10.                                          NC2504.2 706
   000704         070700 IF--DELETE-10.                                                   NC2504.2
   000705         070800     PERFORM DE-LETE.                                             NC2504.2 495
   000706         070900 IF--WRITE-10.                                                    NC2504.2
   000707         071000     MOVE "IF--TEST-10" TO PAR-NAME.                              NC2504.2 345
   000708         071100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000709         071200 IF--TEST-11.                                                     NC2504.2
   000710         071300     IF IF-D16 POSITIVE PERFORM PASS ELSE PERFORM FAIL.           NC2504.2 88 493 494
   000711         071400*        NOTE POSITIVE TEST ON SCALED VALUE.                      NC2504.2
   000712         071500     GO TO IF--WRITE-11.                                          NC2504.2 715
   000713         071600 IF--DELETE-11.                                                   NC2504.2
   000714         071700     PERFORM DE-LETE.                                             NC2504.2 495
   000715         071800 IF--WRITE-11.                                                    NC2504.2
   000716         071900     MOVE "IF--TEST-11" TO PAR-NAME.                              NC2504.2 345
   000717         072000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000718         072100 IF--TEST-12.                                                     NC2504.2
   000719         072200     IF IF-D27 POSITIVE PERFORM PASS ELSE PERFORM FAIL.           NC2504.2 96 493 494
   000720         072300*        NOTE POSITIVE TEST ON COMPUTATIONAL FIELD.               NC2504.2
   000721         072400     GO TO IF--WRITE-12.                                          NC2504.2 724
   000722         072500 IF--DELETE-12.                                                   NC2504.2
   000723         072600     PERFORM DE-LETE.                                             NC2504.2 495
   000724         072700 IF--WRITE-12.                                                    NC2504.2
   000725         072800     MOVE "IF--TEST-12" TO PAR-NAME.                              NC2504.2 345
   000726         072900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000727         073000 IF--TEST-13.                                                     NC2504.2
   000728         073100     IF IF-D28 POSITIVE PERFORM PASS ELSE PERFORM FAIL.           NC2504.2 98 493 494
   000729         073200*        NOTE POSITIVE TEST ON NUMERIC DISPLAY IFELD.             NC2504.2
   000730         073300     GO TO IF--WRITE-13.                                          NC2504.2 733
   000731         073400 IF--DELETE-13.                                                   NC2504.2
   000732         073500     PERFORM DE-LETE.                                             NC2504.2 495
   000733         073600 IF--WRITE-13.                                                    NC2504.2
   000734         073700     MOVE "IF--TEST-13" TO PAR-NAME.                              NC2504.2 345
   000735         073800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000736         073900 IF--TEST-14.                                                     NC2504.2
   000737         074000     IF IF-D31 IS POSITIVE PERFORM FAIL ELSE PERFORM PASS.        NC2504.2 99 494 493
   000738         074100*        NOTE POSITIVE TEST ON NEGATIVE FIELD.                    NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     GO TO IF--WRITE-14.                                          NC2504.2 742
   000740         074300 IF--DELETE-14.                                                   NC2504.2
   000741         074400     PERFORM DE-LETE.                                             NC2504.2 495
   000742         074500 IF--WRITE-14.                                                    NC2504.2
   000743         074600     MOVE "IF--TEST-14" TO PAR-NAME.                              NC2504.2 345
   000744         074700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000745         074800 IF--TEST-15.                                                     NC2504.2
   000746         074900     IF IF-D31 IS NOT POSITIVE PERFORM PASS ELSE PERFORM FAIL.    NC2504.2 99 493 494
   000747         075000*        NOTE NOT POSITIVE TEST ON NEGATIVE VALUE.                NC2504.2
   000748         075100     GO TO IF--WRITE-15.                                          NC2504.2 751
   000749         075200 IF--DELETE-15.                                                   NC2504.2
   000750         075300     PERFORM DE-LETE.                                             NC2504.2 495
   000751         075400 IF--WRITE-15.                                                    NC2504.2
   000752         075500     MOVE "IF--TEST-15" TO PAR-NAME.                              NC2504.2 345
   000753         075600     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000754         075700 IF--TEST-16.                                                     NC2504.2
   000755         075800     IF IF-D28 IS NOT POSITIVE PERFORM FAIL ELSE PERFORM PASS.    NC2504.2 98 494 493
   000756         075900*        NOTE NOT POSITIVE TEST ON UNSIGNED FIELD.                NC2504.2
   000757         076000     GO TO IF--WRITE-16.                                          NC2504.2 760
   000758         076100 IF--DELETE-16.                                                   NC2504.2
   000759         076200     PERFORM DE-LETE.                                             NC2504.2 495
   000760         076300 IF--WRITE-16.                                                    NC2504.2
   000761         076400     MOVE "IF--TEST-16" TO PAR-NAME.                              NC2504.2 345
   000762         076500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000763         076600 IF--INIT-D.                                                      NC2504.2
   000764         076700     MOVE "  NEGATIVE          " TO FEATURE.                      NC2504.2 341
   000765         076800 IF--TEST-17.                                                     NC2504.2
   000766         076900     IF IF-D31 IS NEGATIVE PERFORM PASS ELSE PERFORM FAIL.        NC2504.2 99 493 494
   000767         077000*        NOTE NEGATIVE TEST ON NEGATIVE VALUE.                    NC2504.2
   000768         077100     GO TO IF--WRITE-17.                                          NC2504.2 771
   000769         077200 IF--DELETE-17.                                                   NC2504.2
   000770         077300     PERFORM DE-LETE.                                             NC2504.2 495
   000771         077400 IF--WRITE-17.                                                    NC2504.2
   000772         077500     MOVE "IF--TEST-17" TO PAR-NAME.                              NC2504.2 345
   000773         077600     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000774         077700 IF--TEST-18.                                                     NC2504.2
   000775         077800     IF IF-D31 IS NOT NEGATIVE PERFORM FAIL ELSE PERFORM PASS.    NC2504.2 99 494 493
   000776         077900*        NOTE NOT NEGATIVE TEST ON NEGATIVE VALUE.                NC2504.2
   000777         078000     GO TO IF--WRITE-18.                                          NC2504.2 780
   000778         078100 IF--DELETE-18.                                                   NC2504.2
   000779         078200     PERFORM DE-LETE.                                             NC2504.2 495
   000780         078300 IF--WRITE-18.                                                    NC2504.2
   000781         078400     MOVE "IF--TEST-18" TO PAR-NAME.                              NC2504.2 345
   000782         078500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000783         078600 IF--TEST-19.                                                     NC2504.2
   000784         078700     IF IF-D16 NOT NEGATIVE PERFORM PASS ELSE PERFORM FAIL.       NC2504.2 88 493 494
   000785         078800*        NOTE NOT NEGATIVE TEST ON UNSIGNED FIELD.                NC2504.2
   000786         078900     GO TO IF--WRITE-19.                                          NC2504.2 789
   000787         079000 IF--DELETE-19.                                                   NC2504.2
   000788         079100     PERFORM DE-LETE.                                             NC2504.2 495
   000789         079200 IF--WRITE-19.                                                    NC2504.2
   000790         079300     MOVE "IF--TEST-19" TO PAR-NAME.                              NC2504.2 345
   000791         079400     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000792         079500 IF--INIT-E.                                                      NC2504.2
   000793         079600     MOVE "  ZERO              " TO FEATURE.                      NC2504.2 341
   000794         079700 IF--TEST-20.                                                     NC2504.2
   000795         079800     IF IF-D1 IS ZERO PERFORM PASS ELSE PERFORM FAIL.             NC2504.2 75 493 494
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900*        NOTE ZERO TEST ON ZERO VALUE.                            NC2504.2
   000797         080000     GO TO IF--WRITE-20.                                          NC2504.2 800
   000798         080100 IF--DELETE-20.                                                   NC2504.2
   000799         080200     PERFORM DE-LETE.                                             NC2504.2 495
   000800         080300 IF--WRITE-20.                                                    NC2504.2
   000801         080400     MOVE "IF--TEST-20" TO PAR-NAME.                              NC2504.2 345
   000802         080500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000803         080600 IF--TEST-21.                                                     NC2504.2
   000804         080700     IF IF-D10 NOT EQUAL TO ZERO                                  NC2504.2 138 IMP
   000805      1  080800         PERFORM PASS  ELSE                                       NC2504.2 493
   000806      1  080900     MOVE IF-D10 TO COMPUTED-A                                    NC2504.2 138 356
   000807      1  081000     MOVE ZERO TO CORRECT-N                                       NC2504.2 IMP 371
   000808      1  081100     PERFORM FAIL.                                                NC2504.2 494
   000809         081200*    NOTE NOT EQUAL TO ZERO TEST ON NON-ZERO VALUE.               NC2504.2
   000810         081300     GO TO IF--WRITE-21.                                          NC2504.2 813
   000811         081400 IF--DELETE-21.                                                   NC2504.2
   000812         081500     PERFORM DE-LETE.                                             NC2504.2 495
   000813         081600 IF--WRITE-21.                                                    NC2504.2
   000814         081700     MOVE "IF--TEST-21" TO PAR-NAME.                              NC2504.2 345
   000815         081800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000816         081900 IF--INIT-F.                                                      NC2504.2
   000817         082000     MOVE "  CONDITION-NAMES   " TO FEATURE.                      NC2504.2 341
   000818         082100 IF--TEST-22.                                                     NC2504.2
   000819         082200     MOVE 1 TO IF-D32. IF A OF IF-D32 PERFORM PASS                NC2504.2 100 101 100 493
   000820      1  082300     ELSE PERFORM FAIL.                                           NC2504.2 494
   000821         082400*        NOTE TEST OF SIGNED NUMERIC FIELD FOR SINGLE VALUE.      NC2504.2
   000822         082500     GO TO IF--WRITE-22.                                          NC2504.2 825
   000823         082600 IF--DELETE-22.                                                   NC2504.2
   000824         082700     PERFORM DE-LETE.                                             NC2504.2 495
   000825         082800 IF--WRITE-22.                                                    NC2504.2
   000826         082900     MOVE "IF--TEST-22" TO PAR-NAME.                              NC2504.2 345
   000827         083000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000828         083100 IF--TEST-23.                                                     NC2504.2
   000829         083200     MOVE 3 TO IF-D32. IF B OF IF-D32 PERFORM PASS                NC2504.2 100 102 100 493
   000830      1  083300     ELSE PERFORM FAIL.                                           NC2504.2 494
   000831         083400*        NOTE TEST OF SIGNED NUMERIC FIELD FOR MULTIPLE VALUES.   NC2504.2
   000832         083500     GO TO IF--WRITE-23.                                          NC2504.2 835
   000833         083600 IF--DELETE-23.                                                   NC2504.2
   000834         083700     PERFORM DE-LETE.                                             NC2504.2 495
   000835         083800 IF--WRITE-23.                                                    NC2504.2
   000836         083900     MOVE "IF--TEST-23" TO PAR-NAME.                              NC2504.2 345
   000837         084000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000838         084100 IF--TEST-24.                                                     NC2504.2
   000839         084200             MOVE ZERO   TO IF-D32. IF C OF IF-D32 PERFORM PASS   NC2504.2 IMP 100 103 100 493
   000840      1  084300     ELSE PERFORM FAIL.                                           NC2504.2 494
   000841         084400*        NOTE TEST OF SIGNED NUMERIC FIELD FOR FIG-ZERO.          NC2504.2
   000842         084500     GO TO IF--WRITE-24.                                          NC2504.2 845
   000843         084600 IF--DELETE-24.                                                   NC2504.2
   000844         084700     PERFORM DE-LETE.                                             NC2504.2 495
   000845         084800 IF--WRITE-24.                                                    NC2504.2
   000846         084900     MOVE "IF--TEST-24" TO PAR-NAME.                              NC2504.2 345
   000847         085000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000848         085100 IF--TEST-25.                                                     NC2504.2
   000849         085200     MOVE +12.34 TO IF-D32.                                       NC2504.2 100
   000850         085300     IF D OF IF-D32 PERFORM PASS ELSE PERFORM FAIL.               NC2504.2 104 100 493 494
   000851         085400*    NOTE SIGNED CONDITION-NAME.                                  NC2504.2
   000852         085500     GO TO IF--WRITE-25.                                          NC2504.2 855
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600 IF--DELETE-25.                                                   NC2504.2
   000854         085700     PERFORM DE-LETE.                                             NC2504.2 495
   000855         085800 IF--WRITE-25.                                                    NC2504.2
   000856         085900     MOVE "IF--TEST-25" TO PAR-NAME.                              NC2504.2 345
   000857         086000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000858         086100 IF--TEST-26.                                                     NC2504.2
   000859         086200     MOVE QUOTE  TO IF-D33. IF B OF IF-D33 AND NOT B OF IF-D32    NC2504.2 IMP 108 109 108 102 100
   000860      1  086300     PERFORM PASS ELSE PERFORM FAIL.                              NC2504.2 493 494
   000861         086400*        NOTE TEST OF ALPHANUMERIC FIELD FOR FIG-QUOTES.          NC2504.2
   000862         086500     GO TO IF--WRITE-26.                                          NC2504.2 865
   000863         086600 IF--DELETE-26.                                                   NC2504.2
   000864         086700     PERFORM DE-LETE.                                             NC2504.2 495
   000865         086800 IF--WRITE-26.                                                    NC2504.2
   000866         086900     MOVE "IF--TEST-26" TO PAR-NAME.                              NC2504.2 345
   000867         087000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000868         087100 IF--TEST-27.                                                     NC2504.2
   000869         087200     MOVE SPACE TO IF-D33. IF C OF IF-D33 PERFORM PASS            NC2504.2 IMP 108 110 108 493
   000870      1  087300     ELSE PERFORM FAIL.                                           NC2504.2 494
   000871         087400*        NOTE TEST OF ALPHANUMERIC FIELD FOR FIG-SPACES.          NC2504.2
   000872         087500     GO TO IF--WRITE-27.                                          NC2504.2 875
   000873         087600 IF--DELETE-27.                                                   NC2504.2
   000874         087700     PERFORM DE-LETE.                                             NC2504.2 495
   000875         087800 IF--WRITE-27.                                                    NC2504.2
   000876         087900     MOVE "IF--TEST-27" TO PAR-NAME.                              NC2504.2 345
   000877         088000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000878         088100 IF--TEST-28.                                                     NC2504.2
   000879         088200     MOVE "BACB" TO IF-D33. IF D OF IF-D33 PERFORM PASS           NC2504.2 108 111 108 493
   000880      1  088300     ELSE PERFORM FAIL.                                           NC2504.2 494
   000881         088400*        NOTE TEST OF ALPHANUMERIC FIELD FOR ALL ANY LITERAL.     NC2504.2
   000882         088500     GO TO IF--WRITE-28.                                          NC2504.2 885
   000883         088600 IF--DELETE-28.                                                   NC2504.2
   000884         088700     PERFORM DE-LETE.                                             NC2504.2 495
   000885         088800 IF--WRITE-28.                                                    NC2504.2
   000886         088900     MOVE "IF--TEST-28" TO PAR-NAME.                              NC2504.2 345
   000887         089000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000888         089100 IF--TEST-29.                                                     NC2504.2
   000889         089200     IF NOT B OF IF-D34 PERFORM PASS ELSE PERFORM FAIL.           NC2504.2 113 112 493 494
   000890         089300     GO TO IF--WRITE-29.                                          NC2504.2 893
   000891         089400 IF--DELETE-29.                                                   NC2504.2
   000892         089500     PERFORM DE-LETE.                                             NC2504.2 495
   000893         089600 IF--WRITE-29.                                                    NC2504.2
   000894         089700     MOVE "IF--TEST-29" TO PAR-NAME.                              NC2504.2 345
   000895         089800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000896         089900 IF--TEST-30.                                                     NC2504.2
   000897         090000     MOVE "ABCD" TO IF-D35.                                       NC2504.2 161
   000898         090100     IF A2 AND B2 PERFORM PASS ELSE PERFORM FAIL.                 NC2504.2 164 167 493 494
   000899         090200     GO TO IF--WRITE-30.                                          NC2504.2 902
   000900         090300 IF--DELETE-30.                                                   NC2504.2
   000901         090400     PERFORM DE-LETE.                                             NC2504.2 495
   000902         090500 IF--WRITE-30.                                                    NC2504.2
   000903         090600     MOVE "IF--TEST-30" TO PAR-NAME.                              NC2504.2 345
   000904         090700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000905         090800 IF--TEST-31.                                                     NC2504.2
   000906         090900     MOVE .21 TO IF-D32.                                          NC2504.2 100
   000907         091000     IF E PERFORM PASS ELSE PERFORM FAIL.                         NC2504.2 105 493 494
   000908         091100*    NOTE TESTS VALUE SERIES.                                     NC2504.2
   000909         091200     GO TO IF--WRITE-31.                                          NC2504.2 912
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300 IF--DELETE-31.                                                   NC2504.2
   000911         091400     PERFORM DE-LETE.                                             NC2504.2 495
   000912         091500 IF--WRITE-31.                                                    NC2504.2
   000913         091600     MOVE "IF--TEST-31" TO PAR-NAME.                              NC2504.2 345
   000914         091700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000915         091800 IF--TEST-32.                                                     NC2504.2
   000916         091900     MOVE 1279.99 TO IF-D32.                                      NC2504.2 100
   000917         092000     IF F PERFORM PASS ELSE PERFORM FAIL.                         NC2504.2 106 493 494
   000918         092100*    NOTE TESTS VALUE RANGE SERIES.                               NC2504.2
   000919         092200     GO TO IF--WRITE-32.                                          NC2504.2 922
   000920         092300 IF--DELETE-32.                                                   NC2504.2
   000921         092400     PERFORM DE-LETE.                                             NC2504.2 495
   000922         092500 IF--WRITE-32.                                                    NC2504.2
   000923         092600     MOVE "IF--TEST-32" TO PAR-NAME.                              NC2504.2 345
   000924         092700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000925         092800 IF--TEST-33.                                                     NC2504.2
   000926         092900     MOVE -4321.88 TO IF-D32.                                     NC2504.2 100
   000927         093000     IF G PERFORM PASS ELSE PERFORM FAIL.                         NC2504.2 107 493 494
   000928         093100*    NOTE TESTS VALUE SERIES RANGE SERIES.                        NC2504.2
   000929         093200     GO TO IF--WRITE-33.                                          NC2504.2 932
   000930         093300 IF--DELETE-33.                                                   NC2504.2
   000931         093400     PERFORM DE-LETE.                                             NC2504.2 495
   000932         093500 IF--WRITE-33.                                                    NC2504.2
   000933         093600     MOVE "IF--TEST-33" TO PAR-NAME.                              NC2504.2 345
   000934         093700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000935         093800 IF--INIT-G.                                                      NC2504.2
   000936         093900     PERFORM END-ROUTINE.                                         NC2504.2 518
   000937         094000     MOVE SPACES TO FEATURE.                                      NC2504.2 IMP 341
   000938         094100     MOVE "THE FOLLOWING TESTS USE ARITHMETIC-EXPRESSIONS"        NC2504.2
   000939         094200     TO RE-MARK.                                                  NC2504.2 350
   000940         094300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000941         094400     MOVE "IN RELATION OR SIGN CONDITIONS."                       NC2504.2
   000942         094500     TO RE-MARK.                                                  NC2504.2 350
   000943         094600     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000944         094700     MOVE "  EQUAL             " TO FEATURE.                      NC2504.2 341
   000945         094800 IF--TEST-34.                                                     NC2504.2
   000946         094900     IF  1 + (TWO * 3) EQUAL TO (TWO * 3) + 1                     NC2504.2 66 66
   000947      1  095000               PERFORM PASS                                       NC2504.2 493
   000948         095100     ELSE                                                         NC2504.2
   000949      1  095200               PERFORM FAIL.                                      NC2504.2 494
   000950         095300     GO TO IF--WRITE-34.                                          NC2504.2 953
   000951         095400 IF--DELETE-34.                                                   NC2504.2
   000952         095500     PERFORM DE-LETE.                                             NC2504.2 495
   000953         095600 IF--WRITE-34.                                                    NC2504.2
   000954         095700     MOVE "IF--TEST-34" TO PAR-NAME.                              NC2504.2 345
   000955         095800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000956         095900 IF--TEST-35.                                                     NC2504.2
   000957         096000     IF 9 + TWO + 2 * 3 EQUAL TO 2 * 3 + TWO + 9                  NC2504.2 66 66
   000958      1  096100         PERFORM PASS                                             NC2504.2 493
   000959         096200     ELSE                                                         NC2504.2
   000960      1  096300         PERFORM FAIL.                                            NC2504.2 494
   000961         096400     GO TO IF--WRITE-35.                                          NC2504.2 964
   000962         096500 IF--DELETE-35.                                                   NC2504.2
   000963         096600     PERFORM DE-LETE.                                             NC2504.2 495
   000964         096700 IF--WRITE-35.                                                    NC2504.2
   000965         096800     MOVE "IF--TEST-35" TO PAR-NAME.                              NC2504.2 345
   000966         096900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000 IF--TEST-36.                                                     NC2504.2
   000968         097100     IF  NINE ** 2 EQUAL TO 9 ** 2                                NC2504.2 70
   000969      1  097200              PERFORM PASS                                        NC2504.2 493
   000970         097300     ELSE                                                         NC2504.2
   000971      1  097400              PERFORM FAIL.                                       NC2504.2 494
   000972         097500     GO TO IF--WRITE-36.                                          NC2504.2 975
   000973         097600 IF--DELETE-36.                                                   NC2504.2
   000974         097700     PERFORM DE-LETE.                                             NC2504.2 495
   000975         097800 IF--WRITE-36.                                                    NC2504.2
   000976         097900     MOVE "IF--TEST-36" TO PAR-NAME.                              NC2504.2 345
   000977         098000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000978         098100 IF--TEST-37.                                                     NC2504.2
   000979         098200     IF 100 + (TWENTY + 3.4) + .05 EQUAL TO                       NC2504.2 72
   000980         098300        .05 + (100 + TWENTY) + 3.4                                NC2504.2 72
   000981      1  098400            PERFORM PASS                                          NC2504.2 493
   000982         098500     ELSE                                                         NC2504.2
   000983      1  098600            PERFORM FAIL.                                         NC2504.2 494
   000984         098700     GO TO IF--WRITE-37.                                          NC2504.2 987
   000985         098800 IF--DELETE-37.                                                   NC2504.2
   000986         098900     PERFORM DE-LETE.                                             NC2504.2 495
   000987         099000 IF--WRITE-37.                                                    NC2504.2
   000988         099100     MOVE "IF--TEST-37" TO PAR-NAME.                              NC2504.2 345
   000989         099200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   000990         099300 IF--INIT-H.                                                      NC2504.2
   000991         099400     MOVE "  GREATER           " TO FEATURE.                      NC2504.2 341
   000992         099500 IF--TEST-38.                                                     NC2504.2
   000993         099600     IF NINE * 8 IS GREATER THAN  9 * 7 + 8 PERFORM PASS          NC2504.2 70 493
   000994      1  099700     ELSE PERFORM FAIL.                                           NC2504.2 494
   000995         099800     GO TO IF--WRITE-38.                                          NC2504.2 998
   000996         099900 IF--DELETE-38.                                                   NC2504.2
   000997         100000     PERFORM DE-LETE.                                             NC2504.2 495
   000998         100100 IF--WRITE-38.                                                    NC2504.2
   000999         100200     MOVE "IF--TEST-38" TO PAR-NAME.                              NC2504.2 345
   001000         100300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001001         100400 IF--TEST-39.                                                     NC2504.2
   001002         100500     IF  10 ** 2 + 25 GREATER THAN IF-D14 PERFORM PASS ELSE       NC2504.2 86 493
   001003      1  100600     PERFORM FAIL.                                                NC2504.2 494
   001004         100700     GO TO IF--WRITE-39.                                          NC2504.2 1007
   001005         100800 IF--DELETE-39.                                                   NC2504.2
   001006         100900     PERFORM DE-LETE.                                             NC2504.2 495
   001007         101000 IF--WRITE-39.                                                    NC2504.2
   001008         101100     MOVE "IF--TEST-39" TO PAR-NAME.                              NC2504.2 345
   001009         101200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001010         101300 IF--TEST-40.                                                     NC2504.2
   001011         101400     IF 1000 GREATER THAN TEN ** 3 - 1 PERFORM PASS ELSE PERFORM  NC2504.2 71 493
   001012         101500     FAIL.                                                        NC2504.2 494
   001013         101600     GO TO IF--WRITE-40.                                          NC2504.2 1016
   001014         101700 IF--DELETE-40.                                                   NC2504.2
   001015         101800     PERFORM DE-LETE.                                             NC2504.2 495
   001016         101900 IF--WRITE-40.                                                    NC2504.2
   001017         102000     MOVE "IF--TEST-40" TO PAR-NAME.                              NC2504.2 345
   001018         102100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001019         102200 IF--INIT-I.                                                      NC2504.2
   001020         102300     MOVE "  LESS              " TO FEATURE.                      NC2504.2 341
   001021         102400 IF--TEST-41.                                                     NC2504.2
   001022         102500     IF 1000 LESS THAN 10 ** THREE + 1 PERFORM PASS ELSE          NC2504.2 67 493
   001023      1  102600     PERFORM FAIL.                                                NC2504.2 494
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     GO TO IF--WRITE-41.                                          NC2504.2 1027
   001025         102800 IF--DELETE-41.                                                   NC2504.2
   001026         102900     PERFORM DE-LETE.                                             NC2504.2 495
   001027         103000 IF--WRITE-41.                                                    NC2504.2
   001028         103100     MOVE "IF--TEST-41" TO PAR-NAME.                              NC2504.2 345
   001029         103200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001030         103300 IF--TEST-42.                                                     NC2504.2
   001031         103400     IF 10 ** 2 + 20 LESS THAN IF-D14 PERFORM PASS ELSE           NC2504.2 86 493
   001032      1  103500     PERFORM FAIL.                                                NC2504.2 494
   001033         103600     GO TO IF--WRITE-42.                                          NC2504.2 1036
   001034         103700 IF--DELETE-42.                                                   NC2504.2
   001035         103800     PERFORM DE-LETE.                                             NC2504.2 495
   001036         103900 IF--WRITE-42.                                                    NC2504.2
   001037         104000     MOVE "IF--TEST-42" TO PAR-NAME.                              NC2504.2 345
   001038         104100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001039         104200 IF--TEST-43.                                                     NC2504.2
   001040         104300     IF 9 * 8 LESS THAN 9 * 7 + TEN PERFORM PASS ELSE PERFORM     NC2504.2 71 493
   001041         104400     FAIL.                                                        NC2504.2 494
   001042         104500     GO TO IF--WRITE-43.                                          NC2504.2 1045
   001043         104600 IF--DELETE-43.                                                   NC2504.2
   001044         104700     PERFORM DE-LETE.                                             NC2504.2 495
   001045         104800 IF--WRITE-43.                                                    NC2504.2
   001046         104900     MOVE "IF--TEST-43" TO PAR-NAME.                              NC2504.2 345
   001047         105000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001048         105100 IF--TEST-44-45.                                                  NC2504.2
   001049         105200     MOVE SPACES TO TEST-RESULTS.                                 NC2504.2 IMP 339
   001050         105300     MOVE "NOT USED" TO RE-MARK.                                  NC2504.2 350
   001051         105400     MOVE "IF--TEST-44" TO PAR-NAME.                              NC2504.2 345
   001052         105500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001053         105600     MOVE "NOT USED" TO RE-MARK.                                  NC2504.2 350
   001054         105700     MOVE "IF--TEST-45" TO PAR-NAME.                              NC2504.2 345
   001055         105800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001056         105900 IF--INIT-J.                                                      NC2504.2
   001057         106000     MOVE "  NOT EQUAL          " TO FEATURE.                     NC2504.2 341
   001058         106100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001059         106200 IF--TEST-46.                                                     NC2504.2
   001060         106300     IF NINE * 9 - 7 * SEVEN NOT EQUAL - (SEVEN * 7) + 9 * NINE   NC2504.2 70 68 68 70
   001061      1  106400                PERFORM FAIL                                      NC2504.2 494
   001062         106500     ELSE                                                         NC2504.2
   001063      1  106600                PERFORM PASS.                                     NC2504.2 493
   001064         106700                                                                  NC2504.2
   001065         106800     GO TO IF--WRITE-46.                                          NC2504.2 1068
   001066         106900 IF--DELETE-46.                                                   NC2504.2
   001067         107000     PERFORM DE-LETE.                                             NC2504.2 495
   001068         107100 IF--WRITE-46.                                                    NC2504.2
   001069         107200     MOVE "IF--TEST-46" TO PAR-NAME.                              NC2504.2 345
   001070         107300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001071         107400 IF--TEST-47.                                                     NC2504.2
   001072         107500     IF IF-D14 - IF-D7 NOT EQUAL - IF-D7 + IF-D14                 NC2504.2 86 81 81 86
   001073      1  107600     PERFORM FAIL ELSE PERFORM PASS.                              NC2504.2 494 493
   001074         107700     GO TO IF--WRITE-47.                                          NC2504.2 1077
   001075         107800 IF--DELETE-47.                                                   NC2504.2
   001076         107900     PERFORM DE-LETE.                                             NC2504.2 495
   001077         108000 IF--WRITE-47.                                                    NC2504.2
   001078         108100     MOVE "IF--TEST-47" TO PAR-NAME.                              NC2504.2 345
   001079         108200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001080         108300 IF--INIT-K.                                                      NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400     MOVE "  NOT GREATER       " TO FEATURE.                      NC2504.2 341
   001082         108500 IF--TEST-48.                                                     NC2504.2
   001083         108600     IF NINE * 8 IS NOT GREATER THAN 9 * SEVEN + 8 THEN           NC2504.2 70 68
   001084      1  108700                   PERFORM FAIL                                   NC2504.2 494
   001085         108800     ELSE                                                         NC2504.2
   001086      1  108900                   PERFORM PASS.                                  NC2504.2 493
   001087         109000     GO TO IF--WRITE-48.                                          NC2504.2 1090
   001088         109100 IF--DELETE-48.                                                   NC2504.2
   001089         109200     PERFORM DE-LETE.                                             NC2504.2 495
   001090         109300 IF--WRITE-48.                                                    NC2504.2
   001091         109400     MOVE "IF--TEST-48" TO PAR-NAME.                              NC2504.2 345
   001092         109500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001093         109600 IF--TEST-49.                                                     NC2504.2
   001094         109700     IF 10 ** 2 + 25 NOT GREATER THAN IF-D14 PERFORM FAIL ELSE    NC2504.2 86 494
   001095      1  109800     PERFORM PASS.                                                NC2504.2 493
   001096         109900     GO TO IF--WRITE-49.                                          NC2504.2 1099
   001097         110000 IF--DELETE-49.                                                   NC2504.2
   001098         110100     PERFORM DE-LETE.                                             NC2504.2 495
   001099         110200 IF--WRITE-49.                                                    NC2504.2
   001100         110300     MOVE "IF--TEST-49" TO PAR-NAME.                              NC2504.2 345
   001101         110400     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001102         110500 IF--TEST-50.                                                     NC2504.2
   001103         110600     IF 1000 NOT GREATER THAN 10 ** THREE - 1 PERFORM FAIL ELSE   NC2504.2 67 494
   001104      1  110700     PERFORM PASS.                                                NC2504.2 493
   001105         110800     GO TO IF--WRITE-50.                                          NC2504.2 1108
   001106         110900 IF--DELETE-50.                                                   NC2504.2
   001107         111000     PERFORM DE-LETE.                                             NC2504.2 495
   001108         111100 IF--WRITE-50.                                                    NC2504.2
   001109         111200     MOVE "IF--TEST-50" TO PAR-NAME.                              NC2504.2 345
   001110         111300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001111         111400 IF--INIT-L.                                                      NC2504.2
   001112         111500     MOVE "  NOT LESS          " TO FEATURE.                      NC2504.2 341
   001113         111600 IF--TEST-51.                                                     NC2504.2
   001114         111700     IF 1000 NOT LESS THAN TEN ** 3 + 1 PERFORM FAIL ELSE         NC2504.2 71 494
   001115      1  111800     PERFORM PASS.                                                NC2504.2 493
   001116         111900     GO TO IF--WRITE-51.                                          NC2504.2 1119
   001117         112000 IF--DELETE-51.                                                   NC2504.2
   001118         112100     PERFORM DE-LETE.                                             NC2504.2 495
   001119         112200 IF--WRITE-51.                                                    NC2504.2
   001120         112300     MOVE "IF--TEST-51" TO PAR-NAME.                              NC2504.2 345
   001121         112400     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001122         112500 IF--TEST-52.                                                     NC2504.2
   001123         112600     IF 10 ** 2 + 20 NOT LESS THAN IF-D14 PERFORM FAIL ELSE       NC2504.2 86 494
   001124      1  112700     PERFORM PASS.                                                NC2504.2 493
   001125         112800     GO TO IF--WRITE-52.                                          NC2504.2 1128
   001126         112900 IF--DELETE-52.                                                   NC2504.2
   001127         113000     PERFORM DE-LETE.                                             NC2504.2 495
   001128         113100 IF--WRITE-52.                                                    NC2504.2
   001129         113200     MOVE "IF--TEST-52" TO PAR-NAME.                              NC2504.2 345
   001130         113300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001131         113400 IF--TEST-53.                                                     NC2504.2
   001132         113500     IF NINE * 8 NOT LESS THAN 9 * 7 + TEN PERFORM FAIL ELSE      NC2504.2 70 71 494
   001133      1  113600     PERFORM PASS.                                                NC2504.2 493
   001134         113700     GO TO IF--WRITE-53.                                          NC2504.2 1137
   001135         113800 IF--DELETE-53.                                                   NC2504.2
   001136         113900     PERFORM DE-LETE.                                             NC2504.2 495
   001137         114000 IF--WRITE-53.                                                    NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100     MOVE "IF--TEST-53" TO PAR-NAME.                              NC2504.2 345
   001139         114200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001140         114300 IF--INIT-M.                                                      NC2504.2
   001141         114400     MOVE "  POS, NEG, ZERO    " TO FEATURE.                      NC2504.2 341
   001142         114500 IF--TEST-54.                                                     NC2504.2
   001143         114600     IF 9 ** TWO + (180 - 90) IS NOT POSITIVE PERFORM FAIL ELSE   NC2504.2 66 494
   001144      1  114700     PERFORM PASS.                                                NC2504.2 493
   001145         114800     GO TO IF--WRITE-54.                                          NC2504.2 1148
   001146         114900 IF--DELETE-54.                                                   NC2504.2
   001147         115000     PERFORM DE-LETE.                                             NC2504.2 495
   001148         115100 IF--WRITE-54.                                                    NC2504.2
   001149         115200     MOVE "IF--TEST-54" TO PAR-NAME.                              NC2504.2 345
   001150         115300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001151         115400 IF--TEST-55.                                                     NC2504.2
   001152         115500     IF NINE ** 2 + (90 - 180) IS POSITIVE PERFORM FAIL ELSE      NC2504.2 70 494
   001153      1  115600     PERFORM PASS.                                                NC2504.2 493
   001154         115700     GO TO IF--WRITE-55.                                          NC2504.2 1157
   001155         115800 IF--DELETE-55.                                                   NC2504.2
   001156         115900     PERFORM DE-LETE.                                             NC2504.2 495
   001157         116000 IF--WRITE-55.                                                    NC2504.2
   001158         116100     MOVE "IF--TEST-55" TO PAR-NAME.                              NC2504.2 345
   001159         116200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001160         116300 IF--TEST-56.                                                     NC2504.2
   001161         116400     IF 8 * EIGHT - 8 * 8 NOT ZERO                                NC2504.2 69
   001162      1  116500             PERFORM FAIL ELSE PERFORM PASS.                      NC2504.2 494 493
   001163         116600     GO TO IF--WRITE-56.                                          NC2504.2 1166
   001164         116700 IF--DELETE-56.                                                   NC2504.2
   001165         116800     PERFORM DE-LETE.                                             NC2504.2 495
   001166         116900 IF--WRITE-56.                                                    NC2504.2
   001167         117000     MOVE "IF--TEST-56" TO PAR-NAME.                              NC2504.2 345
   001168         117100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001169         117200 IF--TEST-57-58.                                                  NC2504.2
   001170         117300     MOVE SPACES TO TEST-RESULTS.                                 NC2504.2 IMP 339
   001171         117400     MOVE "NOT USED" TO RE-MARK.                                  NC2504.2 350
   001172         117500     MOVE "IF--TEST-57" TO PAR-NAME.                              NC2504.2 345
   001173         117600     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001174         117700     MOVE "NOT USED" TO RE-MARK.                                  NC2504.2 350
   001175         117800     MOVE "IF--TEST-58" TO PAR-NAME.                              NC2504.2 345
   001176         117900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001177         118000     MOVE "  POS, NEG, ZERO     " TO FEATURE.                     NC2504.2 341
   001178         118100 IF--TEST-59.                                                     NC2504.2
   001179         118200     IF 10 ** THREE + 99 - (1500 - 400) IS NEGATIVE PERFORM PASS  NC2504.2 67 493
   001180      1  118300     ELSE PERFORM FAIL.                                           NC2504.2 494
   001181         118400     GO TO IF--WRITE-59.                                          NC2504.2 1184
   001182         118500 IF--DELETE-59.                                                   NC2504.2
   001183         118600     PERFORM DE-LETE.                                             NC2504.2 495
   001184         118700 IF--WRITE-59.                                                    NC2504.2
   001185         118800     MOVE "IF--TEST-59" TO PAR-NAME.                              NC2504.2 345
   001186         118900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001187         119000 IF--TEST-60.                                                     NC2504.2
   001188         119100     IF TEN ** 3 + 99 - (1500 - 400) IS NOT POSITIVE PERFORM PASS NC2504.2 71 493
   001189      1  119200     ELSE PERFORM FAIL.                                           NC2504.2 494
   001190         119300     GO TO IF--WRITE-60.                                          NC2504.2 1193
   001191         119400 IF--DELETE-60.                                                   NC2504.2
   001192         119500     PERFORM DE-LETE.                                             NC2504.2 495
   001193         119600 IF--WRITE-60.                                                    NC2504.2
   001194         119700     MOVE "IF--TEST-60" TO PAR-NAME.                              NC2504.2 345
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001196         119900 IF--TEST-61.                                                     NC2504.2
   001197         120000     IF 8 * EIGHT - 8 * 8 IS ZERO                                 NC2504.2 69
   001198      1  120100             PERFORM PASS ELSE PERFORM FAIL.                      NC2504.2 493 494
   001199         120200     GO TO IF--WRITE-61.                                          NC2504.2 1202
   001200         120300 IF--DELETE-61.                                                   NC2504.2
   001201         120400     PERFORM DE-LETE.                                             NC2504.2 495
   001202         120500 IF--WRITE-61.                                                    NC2504.2
   001203         120600     MOVE "IF--TEST-61" TO PAR-NAME.                              NC2504.2 345
   001204         120700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001205         120800 IF--TEST-62.                                                     NC2504.2
   001206         120900     MOVE SPACES TO TEST-RESULTS.                                 NC2504.2 IMP 339
   001207         121000     MOVE "NOT USED" TO RE-MARK.                                  NC2504.2 350
   001208         121100     MOVE "IF--TEST-62" TO PAR-NAME.                              NC2504.2 345
   001209         121200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001210         121300     MOVE "POS, NEG, ZERO      " TO FEATURE.                      NC2504.2 341
   001211         121400 IF--TEST-63.                                                     NC2504.2
   001212         121500     IF 10 ** THREE + 99 - (1500 - 400) IS NOT NEGATIVE           NC2504.2 67
   001213      1  121600              PERFORM FAIL ELSE PERFORM PASS.                     NC2504.2 494 493
   001214         121700     GO TO IF--WRITE-63.                                          NC2504.2 1217
   001215         121800 IF--DELETE-63.                                                   NC2504.2
   001216         121900     PERFORM DE-LETE.                                             NC2504.2 495
   001217         122000 IF--WRITE-63.                                                    NC2504.2
   001218         122100     MOVE "IF--TEST-63" TO PAR-NAME.                              NC2504.2 345
   001219         122200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001220         122300 IF--INIT-N.                                                      NC2504.2
   001221         122400     MOVE "  SYMBOLS > < =     " TO FEATURE.                      NC2504.2 341
   001222         122500 IF--TEST-64.                                                     NC2504.2
   001223         122600     IF TEN * 10 - 10 * 10 = - TEN * 10 + 10 * 10                 NC2504.2 71 71
   001224      1  122700               PERFORM PASS                                       NC2504.2 493
   001225         122800     ELSE                                                         NC2504.2
   001226      1  122900               PERFORM FAIL.                                      NC2504.2 494
   001227         123000     GO TO IF--WRITE-64.                                          NC2504.2 1230
   001228         123100 IF--DELETE-64.                                                   NC2504.2
   001229         123200     PERFORM DE-LETE.                                             NC2504.2 495
   001230         123300 IF--WRITE-64.                                                    NC2504.2
   001231         123400     MOVE "IF--TEST-64" TO PAR-NAME.                              NC2504.2 345
   001232         123500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001233         123600 IF--TEST-65.                                                     NC2504.2
   001234         123700     IF NINE * 8 > 9 * 7 + 8 PERFORM PASS ELSE PERFORM FAIL.      NC2504.2 70 493 494
   001235         123800     GO TO IF--WRITE-65.                                          NC2504.2 1238
   001236         123900 IF--DELETE-65.                                                   NC2504.2
   001237         124000     PERFORM DE-LETE.                                             NC2504.2 495
   001238         124100 IF--WRITE-65.                                                    NC2504.2
   001239         124200     MOVE "IF--TEST-65" TO PAR-NAME.                              NC2504.2 345
   001240         124300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001241         124400 IF--TEST-66.                                                     NC2504.2
   001242         124500     IF 1000 < 10 ** THREE + 1 PERFORM PASS ELSE PERFORM FAIL.    NC2504.2 67 493 494
   001243         124600     GO TO IF--WRITE-66.                                          NC2504.2 1246
   001244         124700 IF--DELETE-66.                                                   NC2504.2
   001245         124800     PERFORM DE-LETE.                                             NC2504.2 495
   001246         124900 IF--WRITE-66.                                                    NC2504.2
   001247         125000     MOVE "IF--TEST-66" TO PAR-NAME.                              NC2504.2 345
   001248         125100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001249         125200 IF--TEST-67.                                                     NC2504.2
   001250         125300     IF 100 + TWENTY + 3.4 + .05 NOT = 100 + TWENTY + 3.4 + 0.6   NC2504.2 72 72
   001251      1  125400          PERFORM PASS                                            NC2504.2 493
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500     ELSE                                                         NC2504.2
   001253      1  125600          PERFORM FAIL.                                           NC2504.2 494
   001254         125700     GO TO IF--WRITE-67.                                          NC2504.2 1257
   001255         125800 IF--DELETE-67.                                                   NC2504.2
   001256         125900     PERFORM DE-LETE.                                             NC2504.2 495
   001257         126000 IF--WRITE-67.                                                    NC2504.2
   001258         126100     MOVE "IF--TEST-67" TO PAR-NAME.                              NC2504.2 345
   001259         126200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001260         126300 IF--TEST-68.                                                     NC2504.2
   001261         126400     IF NINE * 8 NOT > 9 * 7 + 8 PERFORM FAIL ELSE PERFORM PASS.  NC2504.2 70 494 493
   001262         126500     GO TO IF--WRITE-68.                                          NC2504.2 1265
   001263         126600 IF--DELETE-68.                                                   NC2504.2
   001264         126700     PERFORM DE-LETE.                                             NC2504.2 495
   001265         126800 IF--WRITE-68.                                                    NC2504.2
   001266         126900     MOVE "IF--TEST-68" TO PAR-NAME.                              NC2504.2 345
   001267         127000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001268         127100 IF--TEST-69.                                                     NC2504.2
   001269         127200     IF 1000 NOT < 10 ** THREE + 1 PERFORM FAIL ELSE PERFORM PASS.NC2504.2 67 494 493
   001270         127300     GO TO IF--WRITE-69.                                          NC2504.2 1273
   001271         127400 IF--DELETE-69.                                                   NC2504.2
   001272         127500     PERFORM DE-LETE.                                             NC2504.2 495
   001273         127600 IF--WRITE-69.                                                    NC2504.2
   001274         127700     MOVE "IF--TEST-69" TO PAR-NAME.                              NC2504.2 345
   001275         127800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001276         127900 IF--TEST-70.                                                     NC2504.2
   001277         128000     MOVE SPACES TO TEST-RESULTS.                                 NC2504.2 IMP 339
   001278         128100     MOVE "NOT USED" TO RE-MARK.                                  NC2504.2 350
   001279         128200     MOVE "IF--TEST-70" TO PAR-NAME.                              NC2504.2 345
   001280         128300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001281         128400 IF--INIT-N1.                                                     NC2504.2
   001282         128500     PERFORM END-ROUTINE.                                         NC2504.2 518
   001283         128600     MOVE SPACES TO FEATURE.                                      NC2504.2 IMP 341
   001284         128700     MOVE "THE FOLLOWING TESTS COMBINATIONS OF"                   NC2504.2
   001285         128800             TO RE-MARK.                                          NC2504.2 350
   001286         128900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001287         129000     MOVE "RELATIONAL AND SIZE ERROR CONDITIONS."                 NC2504.2
   001288         129100             TO RE-MARK.                                          NC2504.2 350
   001289         129200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001290         129300 IF--TEST-71.                                                     NC2504.2
   001291         129400     MOVE     "X" TO WRK-XN-00001.                                NC2504.2 64
   001292         129500     MOVE     ZERO TO WRK-DS-01V00.                               NC2504.2 IMP 58
   001293         129600     IF       WRK-XN-00001 IS EQUAL TO "X"                        NC2504.2 64
   001294      1  129700              MOVE "Z" TO WRK-XN-00001                            NC2504.2 64
   001295      1  129800              ADD 1 TO WRK-DS-01V00 ON SIZE ERROR                 NC2504.2 58
   001296      2  129900              MOVE "Y" TO WRK-XN-00001                            NC2504.2 64
   001297         130000              ELSE                                                NC2504.2
   001298      1  130100              ADD 2 TO WRK-DS-01V00 ON SIZE ERROR                 NC2504.2 58
   001299      2  130200              MOVE "W" TO WRK-XN-00001.                           NC2504.2 64
   001300         130300     IF  WRK-XN-00001 EQUAL TO "Z" AND                            NC2504.2 64
   001301         130400              WRK-DS-01V00 EQUAL TO 1                             NC2504.2 58
   001302      1  130500              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001303         130600*    NOTE     COMBINATION OF RELATIONAL AND SIZE ERROR CONDITIONS.NC2504.2
   001304         130700     GO       TO IF--WRITE-71.                                    NC2504.2 1307
   001305         130800 IF--DELETE-71.                                                   NC2504.2
   001306         130900     PERFORM  DE-LETE.                                            NC2504.2 495
   001307         131000 IF--WRITE-71.                                                    NC2504.2
   001308         131100     MOVE     "  INCL SIZE ERROR" TO FEATURE.                     NC2504.2 341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200     MOVE     "IF--TEST-71" TO PAR-NAME.                          NC2504.2 345
   001310         131300     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001311         131400 IF--INIT-O.                                                      NC2504.2
   001312         131500     MOVE     "  UNEQUAL LENGTHS" TO FEATURE.                     NC2504.2 341
   001313         131600 IF--TEST-73.                                                     NC2504.2
   001314         131700     MOVE     "X" TO WRK-XN-00001.                                NC2504.2 64
   001315         131800     MOVE     "X    " TO WRK-XN-00005.                            NC2504.2 65
   001316         131900     IF       WRK-XN-00001 IS EQUAL TO WRK-XN-00005               NC2504.2 64 65
   001317      1  132000              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001318         132100*    NOTE     EQUAL QUANTITIES IN UNEQUAL LENGTH FIELDS.          NC2504.2
   001319         132200     GO       TO IF--WRITE-73.                                    NC2504.2 1322
   001320         132300 IF--DELETE-73.                                                   NC2504.2
   001321         132400     PERFORM  DE-LETE.                                            NC2504.2 495
   001322         132500 IF--WRITE-73.                                                    NC2504.2
   001323         132600     MOVE     "IF--TEST-73" TO PAR-NAME.                          NC2504.2 345
   001324         132700     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001325         132800 IF--TEST-74.                                                     NC2504.2
   001326         132900     MOVE     "X" TO WRK-XN-00001.                                NC2504.2 64
   001327         133000     MOVE     "Y    " TO WRK-XN-00005.                            NC2504.2 65
   001328         133100     IF       WRK-XN-00001 IS NOT EQUAL TO WRK-XN-00005           NC2504.2 64 65
   001329      1  133200              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001330         133300*    NOTE     UNEQUAL QUANTITIES IN UNEQUAL LENGTH FIELDS.        NC2504.2
   001331         133400     GO       TO IF--WRITE-74.                                    NC2504.2 1334
   001332         133500 IF--DELETE-74.                                                   NC2504.2
   001333         133600     PERFORM  DE-LETE.                                            NC2504.2 495
   001334         133700 IF--WRITE-74.                                                    NC2504.2
   001335         133800     MOVE     "IF--TEST-74" TO PAR-NAME.                          NC2504.2 345
   001336         133900     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001337         134000 IF--TEST-75.                                                     NC2504.2
   001338         134100     MOVE     "X" TO WRK-XN-00001.                                NC2504.2 64
   001339         134200     MOVE     "X   X" TO WRK-XN-00005.                            NC2504.2 65
   001340         134300     IF       WRK-XN-00001 IS NOT EQUAL TO WRK-XN-00005           NC2504.2 64 65
   001341      1  134400              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001342         134500*    NOTE     UNEQUAL QUANTITIES IN UNEQUAL LENGTH FIELDS.        NC2504.2
   001343         134600     GO       TO IF--WRITE-75.                                    NC2504.2 1346
   001344         134700 IF--DELETE-75.                                                   NC2504.2
   001345         134800     PERFORM  DE-LETE.                                            NC2504.2 495
   001346         134900 IF--WRITE-75.                                                    NC2504.2
   001347         135000     MOVE     "IF--TEST-75" TO PAR-NAME.                          NC2504.2 345
   001348         135100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001349         135200 IF--INIT-P.                                                      NC2504.2
   001350         135300     MOVE     "  UNEQUAL LENGTHS" TO FEATURE.                     NC2504.2 341
   001351         135400 IF--TEST-77.                                                     NC2504.2
   001352         135500     IF       IF-D37 NOT EQUAL TO IF-D21                          NC2504.2 114 155
   001353      1  135600              PERFORM PASS GO TO IF--WRITE-77.                    NC2504.2 493 1362
   001354         135700*    NOTE     NUMERIC VS GROUP COMPARISON, UNEQUAL LENGTHS.       NC2504.2
   001355         135800     GO       TO IF--FAIL-77.                                     NC2504.2 1359
   001356         135900 IF--DELETE-77.                                                   NC2504.2
   001357         136000     PERFORM DE-LETE.                                             NC2504.2 495
   001358         136100     GO       TO IF--WRITE-11.                                    NC2504.2 715
   001359         136200 IF--FAIL-77.                                                     NC2504.2
   001360         136300     PERFORM  FAIL.                                               NC2504.2 494
   001361         136400     MOVE     "IF-D37 SHOULD PAD ON RIGHT" TO RE-MARK.            NC2504.2 350
   001362         136500 IF--WRITE-77.                                                    NC2504.2
   001363         136600     MOVE     "IF--TEST-77" TO PAR-NAME.                          NC2504.2 345
   001364         136700     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001365         136800 IF--TEST-78.                                                     NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900     IF       IF-D37 EQUAL TO IF-D38                              NC2504.2 114 115
   001367      1  137000              PERFORM PASS GO TO IF--WRITE-78.                    NC2504.2 493 1376
   001368         137100*    NOTE     NUMERIC VS ALPHANUMERIC COMPARISON, UNEQUAL LENGTHS.NC2504.2
   001369         137200     GO       TO IF--FAIL-78.                                     NC2504.2 1373
   001370         137300 IF--DELETE-78.                                                   NC2504.2
   001371         137400     PERFORM  DE-LETE.                                            NC2504.2 495
   001372         137500     GO       TO IF--WRITE-78.                                    NC2504.2 1376
   001373         137600 IF--FAIL-78.                                                     NC2504.2
   001374         137700     PERFORM  FAIL.                                               NC2504.2 494
   001375         137800     MOVE     "IF-D37 SHOULD PAD ON RIGHT" TO RE-MARK.            NC2504.2 350
   001376         137900 IF--WRITE-78.                                                    NC2504.2
   001377         138000     MOVE     "IF--TEST-78" TO PAR-NAME.                          NC2504.2 345
   001378         138100     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001379         138200 IF--TEST-79.                                                     NC2504.2
   001380         138300     MOVE ZERO TO IF-D10.                                         NC2504.2 IMP 138
   001381         138400     IF D3 OF IF-D10 EQUAL TO "00000000"                          NC2504.2 141 138
   001382      1  138500         PERFORM PASS                                             NC2504.2 493
   001383      1  138600         GO TO IF-WRITE-79.                                       NC2504.2 1390
   001384         138700     MOVE D3 IN IF-D10 TO COMPUTED-A.                             NC2504.2 141 138 356
   001385         138800     MOVE "00000000" TO CORRECT-A.                                NC2504.2 370
   001386         138900     PERFORM FAIL.                                                NC2504.2 494
   001387         139000     GO TO IF-WRITE-79.                                           NC2504.2 1390
   001388         139100 IF-DELETE-79.                                                    NC2504.2
   001389         139200     PERFORM DE-LETE.                                             NC2504.2 495
   001390         139300 IF-WRITE-79.                                                     NC2504.2
   001391         139400     MOVE "QUALIFIED GROUP   " TO FEATURE.                        NC2504.2 341
   001392         139500     MOVE "IF--TEST-79 " TO PAR-NAME.                             NC2504.2 345
   001393         139600     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001394         139700 IF--INIT-80.                                                     NC2504.2
   001395         139800     PERFORM END-ROUTINE.                                         NC2504.2 518
   001396         139900     MOVE SPACES TO FEATURE.                                      NC2504.2 IMP 341
   001397         140000     MOVE "THESE SPECIAL CONDITION-   " TO RE-MARK.               NC2504.2 350
   001398         140100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001399         140200     MOVE "NAME TESTS VERIFY THE    " TO RE-MARK.                 NC2504.2 350
   001400         140300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001401         140400     MOVE "ABILITY OF THE COMPILER TO " TO RE-MARK.               NC2504.2 350
   001402         140500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001403         140600     MOVE "ACCEPT SUBSCRIPTED 88 LEVEL" TO RE-MARK.               NC2504.2 350
   001404         140700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001405         140800*    NOTE *******                  ******                *********NC2504.2
   001406         140900*        *****  A NOTE AS THE FIRST STATEMENT IN THIS ******      NC2504.2
   001407         141000*               PARAGRAPH WILL BYPASS ALL THE SPECIAL *****       NC2504.2
   001408         141100*               CONDITION-NAME TESTS, BUT A NOTE STATEMENT        NC2504.2
   001409         141200*               MIGHT NEED TO BE INSERTED IN EACH TEST            NC2504.2
   001410         141300*               SO THE SYNTAX WOULD BE IGNORED BY THE COMPILER.   NC2504.2
   001411         141400     MOVE "OCCURS WITH 88 LEVEL" TO FEATURE.                      NC2504.2 341
   001412         141500     MOVE 123 TO TABLE-80.                                        NC2504.2 316
   001413         141600     GO TO IF--TEST-80.                                           NC2504.2 1421
   001414         141700 IF-DELETE-80.                                                    NC2504.2
   001415         141800     PERFORM DE-LETE.                                             NC2504.2 495
   001416         141900     MOVE "IF--TEST-80" TO PAR-NAME.                              NC2504.2 345
   001417         142000     MOVE "TEST-80 THRU 85 DELETED  " TO RE-MARK.                 NC2504.2 350
   001418         142100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001419         142200     ADD 5 TO DELETE-COUNTER.                                     NC2504.2 393
   001420         142300     GO TO IF--TEST-86.                                           NC2504.2 1493
   001421         142400 IF--TEST-80.                                                     NC2504.2
   001422         142500     IF A80 (2)                                                   NC2504.2 318
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423      1  142600         PERFORM PASS ELSE                                        NC2504.2 493
   001424      1  142700     PERFORM FAIL.                                                NC2504.2 494
   001425         142800*    NOTE ELMT(2) SHOULD CONTAIN A 2 WHICH IS CONTAINED IN        NC2504.2
   001426         142900*        THE VALUE OF THE A80 88 LEVEL.                           NC2504.2
   001427         143000     GO TO IF-WRITE-80.                                           NC2504.2 1430
   001428         143100 IF--DELETE-80.                                                   NC2504.2
   001429         143200     PERFORM DE-LETE.                                             NC2504.2 495
   001430         143300 IF-WRITE-80.                                                     NC2504.2
   001431         143400     MOVE "IF--TEST-80" TO PAR-NAME.                              NC2504.2 345
   001432         143500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001433         143600 IF--TEST-81.                                                     NC2504.2
   001434         143700     IF C80 (1)                                                   NC2504.2 320
   001435      1  143800         PERFORM FAIL ELSE                                        NC2504.2 494
   001436      1  143900     PERFORM PASS.                                                NC2504.2 493
   001437         144000*    NOTE ELMT(1) SHOULD CONTAIN A 1 WHICH IS NOT CONTAINED       NC2504.2
   001438         144100*        IN THE VALUE OF THE C80 88 LEVEL.                        NC2504.2
   001439         144200     GO TO IF-WRITE-81.                                           NC2504.2 1442
   001440         144300 IF-DELETE-81.                                                    NC2504.2
   001441         144400     PERFORM DE-LETE.                                             NC2504.2 495
   001442         144500 IF-WRITE-81.                                                     NC2504.2
   001443         144600     MOVE "IF--TEST-81" TO PAR-NAME.                              NC2504.2 345
   001444         144700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001445         144800 IF--TEST-82.                                                     NC2504.2
   001446         144900     IF B80 (3)                                                   NC2504.2 319
   001447      1  145000         PERFORM FAIL ELSE                                        NC2504.2 494
   001448      1  145100     PERFORM PASS.                                                NC2504.2 493
   001449         145200*    NOTE ELMT(3) SHOULD CONTAIN A 3 WHICH IS NOT CONTAINED       NC2504.2
   001450         145300*        IN THE VALUE OF THE B80 88 LEVEL.                        NC2504.2
   001451         145400     GO TO IF-WRITE-82.                                           NC2504.2 1454
   001452         145500 IF-DELETE-82.                                                    NC2504.2
   001453         145600     PERFORM DE-LETE.                                             NC2504.2 495
   001454         145700 IF-WRITE-82.                                                     NC2504.2
   001455         145800     MOVE "IF--TEST-82" TO PAR-NAME.                              NC2504.2 345
   001456         145900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001457         146000 IF--TEST-83.                                                     NC2504.2
   001458         146100     IF NOT A80 OF TABLE-80 (3)                                   NC2504.2 318 316
   001459      1  146200         PERFORM FAIL ELSE                                        NC2504.2 494
   001460      1  146300     PERFORM PASS.                                                NC2504.2 493
   001461         146400*    NOTE ELMT(3) SHOULD CONTAIN A 3 BUT THE NOT CONDITION        NC2504.2
   001462         146500*        SHOULD CAUSE THE TEST TO FAIL EVEN THOUGH THE A80        NC2504.2
   001463         146600*        VALUE INCLUDES THE VALUE 3.                              NC2504.2
   001464         146700     GO TO IF-WRITE-83.                                           NC2504.2 1467
   001465         146800 IF-DELETE-83.                                                    NC2504.2
   001466         146900     PERFORM DE-LETE.                                             NC2504.2 495
   001467         147000 IF-WRITE-83.                                                     NC2504.2
   001468         147100     MOVE "IF--TEST-83" TO PAR-NAME.                              NC2504.2 345
   001469         147200     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001470         147300 IF--TEST-84.                                                     NC2504.2
   001471         147400     IF NOT B80 (1)                                               NC2504.2 319
   001472      1  147500         PERFORM PASS ELSE                                        NC2504.2 493
   001473      1  147600     PERFORM FAIL.                                                NC2504.2 494
   001474         147700*    NOTE ELMT(1) CONTAINS A 1 AND THE VALUE OF B80 IS 8          NC2504.2
   001475         147800*        SO, SAYING NOT 8 IS TRUE.                                NC2504.2
   001476         147900     GO TO IF-WRITE-84.                                           NC2504.2 1479
   001477         148000 IF-DELETE-84.                                                    NC2504.2
   001478         148100     PERFORM DE-LETE.                                             NC2504.2 495
   001479         148200 IF-WRITE-84.                                                     NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148300     MOVE "IF--TEST-84" TO PAR-NAME.                              NC2504.2 345
   001481         148400     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001482         148500 IF--TEST-85.                                                     NC2504.2
   001483         148600     IF C80 OF TABLE-80 (2)                                       NC2504.2 320 316
   001484      1  148700         PERFORM FAIL ELSE                                        NC2504.2 494
   001485      1  148800     PERFORM PASS.                                                NC2504.2 493
   001486         148900*    NOTE ELMT(2) IS 2 AND THE VALUES OF C80 DO NOT CONTAIN A 2.  NC2504.2
   001487         149000     GO TO IF-WRITE-85.                                           NC2504.2 1490
   001488         149100 IF-DELETE-85.                                                    NC2504.2
   001489         149200     PERFORM DE-LETE.                                             NC2504.2 495
   001490         149300 IF-WRITE-85.                                                     NC2504.2
   001491         149400     MOVE "IF--TEST-85" TO PAR-NAME.                              NC2504.2 345
   001492         149500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001493         149600 IF--TEST-86.                                                     NC2504.2
   001494         149700     IF A86                                                       NC2504.2 323
   001495      1  149800         PERFORM FAIL ELSE                                        NC2504.2 494
   001496      1  149900     PERFORM PASS.                                                NC2504.2 493
   001497         150000*    NOTE A86 (ABC   ) SHOULD NOT EQUAL TABLE-86 (ABCABC).        NC2504.2
   001498         150100     GO TO IF-WRITE-86.                                           NC2504.2 1501
   001499         150200 IF-DELETE-86.                                                    NC2504.2
   001500         150300     PERFORM DE-LETE.                                             NC2504.2 495
   001501         150400 IF-WRITE-86.                                                     NC2504.2
   001502         150500     MOVE "IF--TEST-86" TO PAR-NAME.                              NC2504.2 345
   001503         150600     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001504         150700 IF--TEST-87.                                                     NC2504.2
   001505         150800     IF NOT B86                                                   NC2504.2 324
   001506      1  150900         PERFORM FAIL ELSE                                        NC2504.2 494
   001507      1  151000     PERFORM PASS.                                                NC2504.2 493
   001508         151100*    NOTE B86 (ABCABC) SHOULD EQUAL TABLE-86 (ABCABC) THUS        NC2504.2
   001509         151200*        FAILING THE TEST.                                        NC2504.2
   001510         151300     GO TO IF-WRITE-87.                                           NC2504.2 1513
   001511         151400 IF-DELETE-87.                                                    NC2504.2
   001512         151500     PERFORM DE-LETE.                                             NC2504.2 495
   001513         151600 IF-WRITE-87.                                                     NC2504.2
   001514         151700     MOVE "IF--TEST-87" TO PAR-NAME.                              NC2504.2 345
   001515         151800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001516         151900 IF--TEST-88.                                                     NC2504.2
   001517         152000     MOVE SPACES TO DATANAME-86.                                  NC2504.2 IMP 326
   001518         152100     IF C86                                                       NC2504.2 325
   001519      1  152200         PERFORM PASS ELSE                                        NC2504.2 493
   001520      1  152300     PERFORM FAIL.                                                NC2504.2 494
   001521         152400*    NOTE TABLE-86 (   ABC) SHOULD EQUAL C86 (   ABC).            NC2504.2
   001522         152500     GO TO IF-WRITE-88.                                           NC2504.2 1525
   001523         152600 IF-DELETE-88.                                                    NC2504.2
   001524         152700     PERFORM DE-LETE.                                             NC2504.2 495
   001525         152800 IF-WRITE-88.                                                     NC2504.2
   001526         152900     MOVE "IF--TEST-88" TO PAR-NAME.                              NC2504.2 345
   001527         153000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001528         153100 IF--INIT-R.                                                      NC2504.2
   001529         153200     MOVE     "FIGCON < = > D-NAME" TO FEATURE.                   NC2504.2 341
   001530         153300 IF--TEST-89.                                                     NC2504.2
   001531         153400     IF       ZEROS NOT < LOW-VAL                                 NC2504.2 IMP 334
   001532      1  153500              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001533         153600     GO       TO IF--WRITE-89.                                    NC2504.2 1536
   001534         153700 IF--DELETE-89.                                                   NC2504.2
   001535         153800     PERFORM DE-LETE.                                             NC2504.2 495
   001536         153900 IF--WRITE-89.                                                    NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154000     MOVE     "IF--TEST-89 " TO PAR-NAME.                         NC2504.2 345
   001538         154100     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001539         154200 IF--TEST-90.                                                     NC2504.2
   001540         154300     IF       ZEROS < ONE23                                       NC2504.2 IMP 336
   001541      1  154400              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001542         154500     GO       TO IF--WRITE-90.                                    NC2504.2 1545
   001543         154600 IF--DELETE-90.                                                   NC2504.2
   001544         154700     PERFORM DE-LETE.                                             NC2504.2 495
   001545         154800 IF--WRITE-90.                                                    NC2504.2
   001546         154900     MOVE     "IF--TEST-90 " TO PAR-NAME.                         NC2504.2 345
   001547         155000     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001548         155100 IF--TEST-91.                                                     NC2504.2
   001549         155200     IF       ZEROS = ZERO-C                                      NC2504.2 IMP 337
   001550      1  155300              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001551         155400     GO       TO IF--WRITE-91.                                    NC2504.2 1554
   001552         155500 IF--DELETE-91.                                                   NC2504.2
   001553         155600     PERFORM DE-LETE.                                             NC2504.2 495
   001554         155700 IF--WRITE-91.                                                    NC2504.2
   001555         155800     MOVE     "IF--TEST-91 " TO PAR-NAME.                         NC2504.2 345
   001556         155900     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001557         156000 IF--TEST-92.                                                     NC2504.2
   001558         156100     IF       ZEROS NOT = ZERO-D                                  NC2504.2 IMP 338
   001559      1  156200              PERFORM FAIL ELSE PERFORM PASS.                     NC2504.2 494 493
   001560         156300     GO       TO IF--WRITE-92.                                    NC2504.2 1563
   001561         156400 IF--DELETE-92.                                                   NC2504.2
   001562         156500     PERFORM DE-LETE.                                             NC2504.2 495
   001563         156600 IF--WRITE-92.                                                    NC2504.2
   001564         156700     MOVE     "IF--TEST-92 " TO PAR-NAME.                         NC2504.2 345
   001565         156800     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001566         156900 IF--TEST-93.                                                     NC2504.2
   001567         157000     IF       SPACES = SPACE-X                                    NC2504.2 IMP 332
   001568      1  157100              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001569         157200     GO       TO IF--WRITE-93.                                    NC2504.2 1572
   001570         157300 IF--DELETE-93.                                                   NC2504.2
   001571         157400     PERFORM DE-LETE.                                             NC2504.2 495
   001572         157500 IF--WRITE-93.                                                    NC2504.2
   001573         157600     MOVE     "IF--TEST-93 " TO PAR-NAME.                         NC2504.2 345
   001574         157700     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001575         157800 IF--TEST-94.                                                     NC2504.2
   001576         157900     IF       SPACES NOT = QUOTE-X                                NC2504.2 IMP 333
   001577      1  158000              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001578         158100     GO       TO IF--WRITE-94.                                    NC2504.2 1581
   001579         158200 IF--DELETE-94.                                                   NC2504.2
   001580         158300     PERFORM DE-LETE.                                             NC2504.2 495
   001581         158400 IF--WRITE-94.                                                    NC2504.2
   001582         158500     MOVE     "IF--TEST-94 " TO PAR-NAME.                         NC2504.2 345
   001583         158600     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001584         158700 IF--TEST-95.                                                     NC2504.2
   001585         158800     IF       SPACES > ABC OR < ABC                               NC2504.2 IMP 335 335
   001586      1  158900              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001587         159000     GO       TO IF--WRITE-95.                                    NC2504.2 1590
   001588         159100 IF--DELETE-95.                                                   NC2504.2
   001589         159200     PERFORM DE-LETE.                                             NC2504.2 495
   001590         159300 IF--WRITE-95.                                                    NC2504.2
   001591         159400     MOVE     "IF--TEST-95 " TO PAR-NAME.                         NC2504.2 345
   001592         159500     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001593         159600 IF--TEST-96.                                                     NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159700     IF       QUOTES NOT > QUOTE-X                                NC2504.2 IMP 333
   001595      1  159800              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001596         159900     GO       TO IF--WRITE-96.                                    NC2504.2 1599
   001597         160000 IF--DELETE-96.                                                   NC2504.2
   001598         160100     PERFORM DE-LETE.                                             NC2504.2 495
   001599         160200 IF--WRITE-96.                                                    NC2504.2
   001600         160300     MOVE     "IF--TEST-96 " TO PAR-NAME.                         NC2504.2 345
   001601         160400     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001602         160500 IF--TEST-97.                                                     NC2504.2
   001603         160600     IF       QUOTES NOT = ZERO-D                                 NC2504.2 IMP 338
   001604      1  160700              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001605         160800     GO       TO IF--WRITE-97.                                    NC2504.2 1608
   001606         160900 IF--DELETE-97.                                                   NC2504.2
   001607         161000     PERFORM DE-LETE.                                             NC2504.2 495
   001608         161100 IF--WRITE-97.                                                    NC2504.2
   001609         161200     MOVE     "IF--TEST-97 " TO PAR-NAME.                         NC2504.2 345
   001610         161300     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001611         161400 IF--TEST-98.                                                     NC2504.2
   001612         161500     IF       HIGH-VALUES > LOW-VAL                               NC2504.2 IMP 334
   001613      1  161600              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001614         161700     GO       TO IF--WRITE-98.                                    NC2504.2 1617
   001615         161800 IF--DELETE-98.                                                   NC2504.2
   001616         161900     PERFORM DE-LETE.                                             NC2504.2 495
   001617         162000 IF--WRITE-98.                                                    NC2504.2
   001618         162100     MOVE     "IF--TEST-98 " TO PAR-NAME.                         NC2504.2 345
   001619         162200     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001620         162300 IF--TEST-99.                                                     NC2504.2
   001621         162400     IF       HIGH-VALUES > ABC                                   NC2504.2 IMP 335
   001622      1  162500              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001623         162600     GO       TO IF--WRITE-99.                                    NC2504.2 1626
   001624         162700 IF--DELETE-99.                                                   NC2504.2
   001625         162800     PERFORM DE-LETE.                                             NC2504.2 495
   001626         162900 IF--WRITE-99.                                                    NC2504.2
   001627         163000     MOVE     "IF--TEST-99 " TO PAR-NAME.                         NC2504.2 345
   001628         163100     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001629         163200 IF--TEST-100.                                                    NC2504.2
   001630         163300     IF       HIGH-VALUES NOT > ONE23                             NC2504.2 IMP 336
   001631      1  163400              PERFORM FAIL ELSE PERFORM PASS.                     NC2504.2 494 493
   001632         163500     GO       TO IF--WRITE-100.                                   NC2504.2 1635
   001633         163600 IF--DELETE-100.                                                  NC2504.2
   001634         163700     PERFORM DE-LETE.                                             NC2504.2 495
   001635         163800 IF--WRITE-100.                                                   NC2504.2
   001636         163900     MOVE     "IF--TEST-100" TO PAR-NAME.                         NC2504.2 345
   001637         164000     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001638         164100 IF--TEST-101.                                                    NC2504.2
   001639         164200     IF       HIGH-VALUES = ZERO-D                                NC2504.2 IMP 338
   001640      1  164300              PERFORM FAIL ELSE PERFORM PASS.                     NC2504.2 494 493
   001641         164400     GO       TO IF--WRITE-101.                                   NC2504.2 1644
   001642         164500 IF--DELETE-101.                                                  NC2504.2
   001643         164600     PERFORM DE-LETE.                                             NC2504.2 495
   001644         164700 IF--WRITE-101.                                                   NC2504.2
   001645         164800     MOVE     "IF--TEST-101" TO PAR-NAME.                         NC2504.2 345
   001646         164900     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001647         165000 IF--TEST-102.                                                    NC2504.2
   001648         165100     IF       LOW-VALUES = LOW-VAL                                NC2504.2 IMP 334
   001649      1  165200              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001650         165300     GO       TO IF--WRITE-102.                                   NC2504.2 1653
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165400 IF--DELETE-102.                                                  NC2504.2
   001652         165500     PERFORM DE-LETE.                                             NC2504.2 495
   001653         165600 IF--WRITE-102.                                                   NC2504.2
   001654         165700     MOVE     "IF--TEST-102" TO PAR-NAME.                         NC2504.2 345
   001655         165800     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001656         165900 IF--TEST-103.                                                    NC2504.2
   001657         166000     IF       LOW-VALUES < ABC                                    NC2504.2 IMP 335
   001658      1  166100              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001659         166200     GO       TO IF--WRITE-103.                                   NC2504.2 1662
   001660         166300 IF--DELETE-103.                                                  NC2504.2
   001661         166400     PERFORM DE-LETE.                                             NC2504.2 495
   001662         166500 IF--WRITE-103.                                                   NC2504.2
   001663         166600     MOVE     "IF--TEST-103" TO PAR-NAME.                         NC2504.2 345
   001664         166700     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001665         166800 IF--TEST-104.                                                    NC2504.2
   001666         166900     IF       ALL "00" < ONE23                                    NC2504.2 336
   001667      1  167000              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001668         167100     GO       TO IF--WRITE-104.                                   NC2504.2 1671
   001669         167200 IF--DELETE-104.                                                  NC2504.2
   001670         167300     PERFORM DE-LETE.                                             NC2504.2 495
   001671         167400 IF--WRITE-104.                                                   NC2504.2
   001672         167500     MOVE     "IF--TEST-104" TO PAR-NAME.                         NC2504.2 345
   001673         167600     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001674         167700 IF--TEST-105.                                                    NC2504.2
   001675         167800     IF       ALL ZEROES = ZERO-D                                 NC2504.2 IMP 338
   001676      1  167900              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001677         168000     GO       TO IF--WRITE-105.                                   NC2504.2 1680
   001678         168100 IF--DELETE-105.                                                  NC2504.2
   001679         168200     PERFORM DE-LETE.                                             NC2504.2 495
   001680         168300 IF--WRITE-105.                                                   NC2504.2
   001681         168400     MOVE     "IF--TEST-105" TO PAR-NAME.                         NC2504.2 345
   001682         168500     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001683         168600 IF--TEST-106.                                                    NC2504.2
   001684         168700     IF       ALL "00" NOT > ZERO-D                               NC2504.2 338
   001685      1  168800              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001686         168900     GO       TO IF--WRITE-106.                                   NC2504.2 1689
   001687         169000 IF--DELETE-106.                                                  NC2504.2
   001688         169100     PERFORM DE-LETE.                                             NC2504.2 495
   001689         169200 IF--WRITE-106.                                                   NC2504.2
   001690         169300     MOVE     "IF--TEST-106" TO PAR-NAME.                         NC2504.2 345
   001691         169400     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001692         169500 IF--TEST-107.                                                    NC2504.2
   001693         169600     IF       ALL "A" = SPACE-X                                   NC2504.2 332
   001694      1  169700              PERFORM FAIL ELSE PERFORM PASS.                     NC2504.2 494 493
   001695         169800     GO       TO IF--WRITE-107.                                   NC2504.2 1698
   001696         169900 IF--DELETE-107.                                                  NC2504.2
   001697         170000     PERFORM DE-LETE.                                             NC2504.2 495
   001698         170100 IF--WRITE-107.                                                   NC2504.2
   001699         170200     MOVE     "IF--TEST-107" TO PAR-NAME.                         NC2504.2 345
   001700         170300     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001701         170400 IF--TEST-108.                                                    NC2504.2
   001702         170500     IF       ALL "A" > ABC                                       NC2504.2 335
   001703      1  170600              PERFORM FAIL ELSE PERFORM PASS.                     NC2504.2 494 493
   001704         170700     GO       TO IF--WRITE-108.                                   NC2504.2 1707
   001705         170800 IF--DELETE-108.                                                  NC2504.2
   001706         170900     PERFORM DE-LETE.                                             NC2504.2 495
   001707         171000 IF--WRITE-108.                                                   NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171100     MOVE     "IF--TEST-108" TO PAR-NAME.                         NC2504.2 345
   001709         171200     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001710         171300 IF--TEST-109.                                                    NC2504.2
   001711         171400     IF       IF-D4 ALPHABETIC                                    NC2504.2 78
   001712      1  171500              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001713         171600     GO       TO IF--WRITE-109.                                   NC2504.2 1716
   001714         171700 IF--DELETE-109.                                                  NC2504.2
   001715         171800     PERFORM  DE-LETE.                                            NC2504.2 495
   001716         171900 IF--WRITE-109.                                                   NC2504.2
   001717         172000     MOVE     "CLASS --- ALPHABETIC" TO FEATURE.                  NC2504.2 341
   001718         172100     MOVE     "IF--TEST-109" TO PAR-NAME.                         NC2504.2 345
   001719         172200     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001720         172300 IF--INIT-S.                                                      NC2504.2
   001721         172400     MOVE     "SIGN --- ZERO" TO FEATURE.                         NC2504.2 341
   001722         172500 IF--TEST-110.                                                    NC2504.2
   001723         172600     IF      SMALLEST-VALU GREATER THAN SMALL-VALU                NC2504.2 50 48
   001724         172700         AND IS NOT LESS THAN EVEN-SMALLER OR SMALLER-VALU        NC2504.2 51 49
   001725      1  172800             MOVE "CONDITION FALSE" TO CORRECT-A                  NC2504.2 370
   001726      1  172900             MOVE "CONDITION TRUE " TO COMPUTED-A                 NC2504.2 356
   001727      1  173000             PERFORM FAIL                                         NC2504.2 494
   001728      1  173100             GO TO IF--WRITE-110.                                 NC2504.2 1733
   001729         173200     PERFORM PASS.                                                NC2504.2 493
   001730         173300     GO TO IF--WRITE-110.                                         NC2504.2 1733
   001731         173400 IF--DELETE-110.                                                  NC2504.2
   001732         173500     PERFORM  DE-LETE.                                            NC2504.2 495
   001733         173600 IF--WRITE-110.                                                   NC2504.2
   001734         173700     MOVE     "IF--TEST-110" TO PAR-NAME.                         NC2504.2 345
   001735         173800     MOVE "ABBREV CONDITIONS" TO FEATURE.                         NC2504.2 341
   001736         173900     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001737         174000 IF--TEST-111.                                                    NC2504.2
   001738         174100     IF SMALLEST-VALU LESS THAN SMALL-VALU AND                    NC2504.2 50 48
   001739         174200     (SMALLEST-VALU GREATER THAN EVEN-SMALLER OR SMALLER-VALU)    NC2504.2 50 51 49
   001740      1  174300              PERFORM PASS GO TO IF--WRITE-111.                   NC2504.2 493 1747
   001741         174400     MOVE "CONDITION TRUE" TO CORRECT-A.                          NC2504.2 370
   001742         174500     MOVE "CONDITION FALSE" TO COMPUTED-A.                        NC2504.2 356
   001743         174600     PERFORM  FAIL.                                               NC2504.2 494
   001744         174700     GO       TO IF--WRITE-111.                                   NC2504.2 1747
   001745         174800 IF--DELETE-111.                                                  NC2504.2
   001746         174900     PERFORM  DE-LETE.                                            NC2504.2 495
   001747         175000 IF--WRITE-111.                                                   NC2504.2
   001748         175100     MOVE     "IF--TEST-111" TO PAR-NAME.                         NC2504.2 345
   001749         175200     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001750         175300 IF--TEST-112.                                                    NC2504.2
   001751         175400     IF       IF-D40B                                             NC2504.2 181
   001752      1  175500              PERFORM PASS ELSE PERFORM FAIL.                     NC2504.2 493 494
   001753         175600     GO       TO IF--WRITE-112.                                   NC2504.2 1756
   001754         175700 IF--DELETE-112.                                                  NC2504.2
   001755         175800     PERFORM  DE-LETE.                                            NC2504.2 495
   001756         175900 IF--WRITE-112.                                                   NC2504.2
   001757         176000     MOVE "CONDITION---NAME" TO FEATURE.                          NC2504.2 341
   001758         176100     MOVE     "IF--TEST-112" TO PAR-NAME.                         NC2504.2 345
   001759         176200     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001760         176300 IF--INIT-T.                                                      NC2504.2
   001761         176400     MOVE "ABBREV---CONDITION" TO FEATURE.                        NC2504.2 341
   001762         176500 IF--TEST-113.                                                    NC2504.2
   001763         176600     IF SMALLEST-VALU LESS THAN SMALL-VALU AND (SMALLEST-VALU NOT NC2504.2 50 48 50
   001764         176700     GREATER THAN EVEN-SMALLER OR SMALLER-VALU)                   NC2504.2 51 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765      1  176800             PERFORM PASS                                         NC2504.2 493
   001766      1  176900         GO TO IF--WRITE-113.                                     NC2504.2 1773
   001767         177000     MOVE "CONDITION TRUE" TO CORRECT-A.                          NC2504.2 370
   001768         177100     MOVE "CONDITION FALSE" TO COMPUTED-A.                        NC2504.2 356
   001769         177200     PERFORM FAIL.                                                NC2504.2 494
   001770         177300     GO TO IF--WRITE-113.                                         NC2504.2 1773
   001771         177400 IF--DELETE-113.                                                  NC2504.2
   001772         177500     PERFORM  DE-LETE.                                            NC2504.2 495
   001773         177600 IF--WRITE-113.                                                   NC2504.2
   001774         177700     MOVE     "IF--TEST-113" TO PAR-NAME.                         NC2504.2 345
   001775         177800     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001776         177900 IF--TEST-114.                                                    NC2504.2
   001777         178000     IF      SMALLEST-VALU LESS THAN SMALL-VALU                   NC2504.2 50 48
   001778         178100             AND NOT EVEN-SMALLER OR SMALLER-VALU                 NC2504.2 51 49
   001779      1  178200             PERFORM PASS                                         NC2504.2 493
   001780      1  178300             GO TO IF--WRITE-114                                  NC2504.2 1788
   001781         178400             ELSE                                                 NC2504.2
   001782      1  178500             PERFORM FAIL                                         NC2504.2 494
   001783      1  178600             MOVE "CONDITION FALSE" TO CORRECT-A                  NC2504.2 370
   001784      1  178700             MOVE "CONDITION TRUE" TO COMPUTED-A                  NC2504.2 356
   001785      1  178800             GO TO IF--WRITE-114.                                 NC2504.2 1788
   001786         178900 IF--DELETE-114.                                                  NC2504.2
   001787         179000     PERFORM  DE-LETE.                                            NC2504.2 495
   001788         179100 IF--WRITE-114.                                                   NC2504.2
   001789         179200     MOVE     "IF--TEST-114" TO PAR-NAME.                         NC2504.2 345
   001790         179300     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001791         179400 IF--TEST-115.                                                    NC2504.2
   001792         179500     IF COMP-SGN1 IS POSITIVE                                     NC2504.2 119
   001793      1  179600         PERFORM PASS                                             NC2504.2 493
   001794      1  179700         GO TO IF--WRITE-115.                                     NC2504.2 1801
   001795         179800     MOVE "POSITIVE EXPECTED" TO CORRECT-A.                       NC2504.2 370
   001796         179900     MOVE COMP-SGN1 TO COMPUTED-14V4.                             NC2504.2 119 361
   001797         180000     PERFORM FAIL.                                                NC2504.2 494
   001798         180100     GO TO IF--WRITE-115.                                         NC2504.2 1801
   001799         180200 IF--DELETE-115.                                                  NC2504.2
   001800         180300     PERFORM DE-LETE.                                             NC2504.2 495
   001801         180400 IF--WRITE-115.                                                   NC2504.2
   001802         180500     MOVE "POS/NEG SIGN TEST" TO FEATURE.                         NC2504.2 341
   001803         180600     MOVE "IF--TEST-115" TO PAR-NAME.                             NC2504.2 345
   001804         180700     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001805         180800 IF--TEST-116.                                                    NC2504.2
   001806         180900     IF COMP-SGN2 NOT POSITIVE                                    NC2504.2 120
   001807      1  181000         MOVE COMP-SGN2 TO COMPUTED-14V4                          NC2504.2 120 361
   001808      1  181100         MOVE "POSITIVE EXPECTED" TO CORRECT-A                    NC2504.2 370
   001809      1  181200         PERFORM FAIL                                             NC2504.2 494
   001810      1  181300         GO TO IF--WRITE-116.                                     NC2504.2 1815
   001811         181400     PERFORM PASS.                                                NC2504.2 493
   001812         181500     GO TO IF--WRITE-116.                                         NC2504.2 1815
   001813         181600 IF--DELETE-116.                                                  NC2504.2
   001814         181700     PERFORM DE-LETE.                                             NC2504.2 495
   001815         181800 IF--WRITE-116.                                                   NC2504.2
   001816         181900     MOVE "IF--TEST-116" TO PAR-NAME.                             NC2504.2 345
   001817         182000     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001818         182100 IF--TEST-117.                                                    NC2504.2
   001819         182200     IF COMP-SGN3 NOT NEGATIVE                                    NC2504.2 121
   001820      1  182300         MOVE COMP-SGN3 TO COMPUTED-14V4                          NC2504.2 121 361
   001821      1  182400         MOVE "NEGATIVE EXPECTED" TO CORRECT-A                    NC2504.2 370
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822      1  182500         PERFORM FAIL                                             NC2504.2 494
   001823      1  182600         GO TO IF--WRITE-117.                                     NC2504.2 1828
   001824         182700     PERFORM PASS.                                                NC2504.2 493
   001825         182800     GO TO IF--WRITE-117.                                         NC2504.2 1828
   001826         182900 IF--DELETE-117.                                                  NC2504.2
   001827         183000     PERFORM DE-LETE.                                             NC2504.2 495
   001828         183100 IF--WRITE-117.                                                   NC2504.2
   001829         183200     MOVE "IF--TEST-117" TO PAR-NAME.                             NC2504.2 345
   001830         183300     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001831         183400 IF--TEST-118.                                                    NC2504.2
   001832         183500     IF COMP-SGN4 NOT POSITIVE                                    NC2504.2 122
   001833      1  183600         PERFORM PASS                                             NC2504.2 493
   001834      1  183700         GO TO IF--WRITE-118.                                     NC2504.2 1841
   001835         183800     MOVE COMP-SGN4 TO COMPUTED-14V4.                             NC2504.2 122 361
   001836         183900     MOVE "NEGATIVE EXPECTED" TO CORRECT-A.                       NC2504.2 370
   001837         184000     PERFORM FAIL.                                                NC2504.2 494
   001838         184100     GO TO IF--WRITE-118.                                         NC2504.2 1841
   001839         184200 IF--DELETE-118.                                                  NC2504.2
   001840         184300     PERFORM DE-LETE.                                             NC2504.2 495
   001841         184400 IF--WRITE-118.                                                   NC2504.2
   001842         184500     MOVE "IF--TEST-118" TO PAR-NAME.                             NC2504.2 345
   001843         184600     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001844         184700 IF--TEST-119.                                                    NC2504.2
   001845         184800     MOVE SPACES TO TEST-RESULTS.                                 NC2504.2 IMP 339
   001846         184900     MOVE "NOT USED" TO RE-MARK.                                  NC2504.2 350
   001847         185000     MOVE "IF--TEST-119" TO PAR-NAME.                             NC2504.2 345
   001848         185100     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001849         185200 IF--TEST-120.                                                    NC2504.2
   001850         185300     MOVE     -10 TO WRK-DS-06V06.                                NC2504.2 54
   001851         185400     ADD      +10 TO WRK-DS-06V06.                                NC2504.2 54
   001852         185500     IF       WRK-DS-06V06 NEGATIVE                               NC2504.2 54
   001853      1  185600              PERFORM FAIL-120-121                                NC2504.2 1872
   001854      1  185700              MOVE "NEGATIVE ZERO DETECTED" TO RE-MARK            NC2504.2 350
   001855      1  185800              GO TO IF--WRITE-120.                                NC2504.2 1867
   001856         185900     IF       WRK-DS-06V06 POSITIVE                               NC2504.2 54
   001857      1  186000              PERFORM FAIL-120-121                                NC2504.2 1872
   001858      1  186100              MOVE "POSITIVE ZERO DETECTED" TO RE-MARK            NC2504.2 350
   001859      1  186200              GO TO IF--WRITE-120.                                NC2504.2 1867
   001860         186300     IF       WRK-DS-06V06 ZERO                                   NC2504.2 54
   001861      1  186400              PERFORM PASS GO TO IF--WRITE-120.                   NC2504.2 493 1867
   001862         186500     PERFORM  FAIL-120-121.                                       NC2504.2 1872
   001863         186600     MOVE     "NEITHER POS, NEG, NOR ZERO" TO RE-MARK.            NC2504.2 350
   001864         186700     GO       TO IF--WRITE-120.                                   NC2504.2 1867
   001865         186800 IF--DELETE-120.                                                  NC2504.2
   001866         186900     PERFORM  DE-LETE.                                            NC2504.2 495
   001867         187000 IF--WRITE-120.                                                   NC2504.2
   001868         187100     MOVE     "SIGN TEST ON ZERO" TO FEATURE.                     NC2504.2 341
   001869         187200     MOVE     "IF--TEST-120" TO PAR-NAME.                         NC2504.2 345
   001870         187300     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001871         187400     GO       TO IF--EXIT-120.                                    NC2504.2 1876
   001872         187500 FAIL-120-121.                                                    NC2504.2
   001873         187600     PERFORM  FAIL.                                               NC2504.2 494
   001874         187700     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC2504.2 54 357
   001875         187800     MOVE     ZERO TO CORRECT-N.                                  NC2504.2 IMP 371
   001876         187900 IF--EXIT-120.                                                    NC2504.2
   001877         188000     EXIT.                                                        NC2504.2
   001878         188100 IF--TEST-121.                                                    NC2504.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188200     MOVE     10 TO WRK-DS-06V06.                                 NC2504.2 54
   001880         188300     SUBTRACT 10 FROM WRK-DS-06V06.                               NC2504.2 54
   001881         188400     IF       WRK-DS-06V06 NEGATIVE                               NC2504.2 54
   001882      1  188500              PERFORM FAIL-120-121                                NC2504.2 1872
   001883      1  188600              MOVE "NEGATIVE ZERO DETECTED" TO RE-MARK            NC2504.2 350
   001884      1  188700              GO TO IF--WRITE-121.                                NC2504.2 1897
   001885         188800     IF       WRK-DS-06V06 POSITIVE                               NC2504.2 54
   001886      1  188900              PERFORM FAIL-120-121                                NC2504.2 1872
   001887      1  189000              MOVE "POSITIVE ZERO DETECTED" TO RE-MARK            NC2504.2 350
   001888      1  189100              GO TO IF--WRITE-121.                                NC2504.2 1897
   001889         189200                                                                  NC2504.2
   001890         189300     IF       WRK-DS-06V06 ZERO                                   NC2504.2 54
   001891      1  189400              PERFORM PASS GO TO IF--WRITE-121.                   NC2504.2 493 1897
   001892         189500     PERFORM  FAIL-120-121.                                       NC2504.2 1872
   001893         189600     MOVE     "NEITHER POS, NEG, NOR ZERO" TO RE-MARK.            NC2504.2 350
   001894         189700     GO       TO IF--WRITE-120.                                   NC2504.2 1867
   001895         189800 IF--DELETE-121.                                                  NC2504.2
   001896         189900     PERFORM  DE-LETE.                                            NC2504.2 495
   001897         190000 IF--WRITE-121.                                                   NC2504.2
   001898         190100     MOVE     "IF--TEST-121" TO PAR-NAME.                         NC2504.2 345
   001899         190200     PERFORM  PRINT-DETAIL.                                       NC2504.2 497
   001900         190300 IF-INIT-122.                                                     NC2504.2
   001901         190400     MOVE   "VI-89 6.15" TO ANSI-REFERENCE.                       NC2504.2 401
   001902         190500     MOVE    1 TO WRK-DU-1V0-1.                                   NC2504.2 41
   001903         190600     MOVE    2 TO WRK-DU-1V0-2.                                   NC2504.2 42
   001904         190700     MOVE    3 TO WRK-DU-1V0-3.                                   NC2504.2 43
   001905         190800     MOVE    0 TO WRK-DU-1V0-4.                                   NC2504.2 44
   001906         190900 IF-TEST-122.                                                     NC2504.2
   001907         191000     IF NOT (WRK-DU-1V0-1 NOT GREATER WRK-DU-1V0-2 AND            NC2504.2 41 42
   001908      1  191100         WRK-DU-1V0-3 AND NOT WRK-DU-1V0-4) GO TO BUMMER-122      NC2504.2 43 44 1915
   001909      1  191200         ELSE NEXT SENTENCE.                                      NC2504.2
   001910         191300     PERFORM PASS.                                                NC2504.2 493
   001911         191400     GO TO IF-WRITE-122.                                          NC2504.2 1919
   001912         191500 IF-DELETE-122.                                                   NC2504.2
   001913         191600     PERFORM DE-LETE.                                             NC2504.2 495
   001914         191700     GO TO IF-WRITE-122.                                          NC2504.2 1919
   001915         191800 BUMMER-122.                                                      NC2504.2
   001916         191900     PERFORM FAIL.                                                NC2504.2 494
   001917         192000     MOVE "RESULT TRUE" TO COMPUTED-A.                            NC2504.2 356
   001918         192100     MOVE "SHOULD BE FALSE" TO CORRECT-A.                         NC2504.2 370
   001919         192200 IF-WRITE-122.                                                    NC2504.2
   001920         192300     MOVE "IF-TEST-122" TO PAR-NAME.                              NC2504.2 345
   001921         192400     MOVE "ABR. COM. REL. CONDT" TO FEATURE.                      NC2504.2 341
   001922         192500     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001923         192600 IF-INIT-123.                                                     NC2504.2
   001924         192700     MOVE   "VI-89 6.15" TO ANSI-REFERENCE.                       NC2504.2 401
   001925         192800     MOVE 9 TO WRK-DU-1V0-1.                                      NC2504.2 41
   001926         192900     MOVE 8 TO WRK-DU-1V0-2.                                      NC2504.2 42
   001927         193000     MOVE 7 TO WRK-DU-1V0-3.                                      NC2504.2 43
   001928         193100 IF-LOGICAL-CONN-TEST-123.                                        NC2504.2
   001929         193200     IF WRK-DU-1V0-1 > WRK-DU-1V0-2 AND NOT < WRK-DU-2V0-1 OR     NC2504.2 41 42 45
   001930         193300             WRK-DU-2V0-2 OR NOT WRK-DU-2V0-3 AND WRK-DU-1V0-3    NC2504.2 46 47 43
   001931      1  193400             PERFORM PASS                                         NC2504.2 493
   001932         193500     ELSE                                                         NC2504.2
   001933      1  193600             PERFORM FAIL MOVE "FALSE RESULT FOUND" TO COMPUTED-A NC2504.2 494 356
   001934      1  193700             MOVE "SHOULD BE TRUE" TO CORRECT-A.                  NC2504.2 370
   001935         193800     GO TO IF-WRITE-123.                                          NC2504.2 1938
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900 IF-DELETE-123.                                                   NC2504.2
   001937         194000     PERFORM DE-LETE.                                             NC2504.2 495
   001938         194100 IF-WRITE-123.                                                    NC2504.2
   001939         194200     MOVE "IF-TEST-123" TO PAR-NAME.                              NC2504.2 345
   001940         194300     MOVE "LOGICAL CONNECTIVES" TO FEATURE.                       NC2504.2 341
   001941         194400     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001942         194500     PERFORM END-ROUTINE.                                         NC2504.2 518
   001943         194600     MOVE    " COLLATING-AND-ALPHABET-TEST-9  SYNTAX CHECK IN OBJENC2504.2
   001944         194700-    "CT-COMPUTER AND SPECIAL-NAMES" TO TEST-RESULTS.             NC2504.2 339
   001945         194800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001946         194900     MOVE SPACE TO TEST-RESULTS.                                  NC2504.2 IMP 339
   001947         195000 IF-INIT-124.                                                     NC2504.2
   001948         195100*    ===-->  ARITHMETIC EXPRESSION CONTAINING ZERO  <--===        NC2504.2
   001949         195200     MOVE   "VI-58 6.3.1.5 AND VI-51 6.2" TO ANSI-REFERENCE.      NC2504.2 401
   001950         195300     MOVE    4 TO WRK-DU-1V0-1.                                   NC2504.2 41
   001951         195400     MOVE   "IF-TEST-124" TO PAR-NAME.                            NC2504.2 345
   001952         195500 IF-TEST-124.                                                     NC2504.2
   001953         195600     IF      ZERO - WRK-DU-1V0-1 IS NEGATIVE                      NC2504.2 IMP 41
   001954      1  195700             PERFORM PASS                                         NC2504.2 493
   001955         195800     ELSE                                                         NC2504.2
   001956      1  195900             PERFORM FAIL                                         NC2504.2 494
   001957      1  196000             MOVE "POSITIVE RESULT FOUND" TO COMPUTED-A           NC2504.2 356
   001958      1  196100             MOVE "SHOULD BE NEGATIVE" TO CORRECT-A.              NC2504.2 370
   001959         196200     GO TO IF-WRITE-124.                                          NC2504.2 1962
   001960         196300 IF-DELETE-124.                                                   NC2504.2
   001961         196400     PERFORM DE-LETE.                                             NC2504.2 495
   001962         196500 IF-WRITE-124.                                                    NC2504.2
   001963         196600     MOVE "IF-TEST-124" TO PAR-NAME.                              NC2504.2 345
   001964         196700     MOVE "LOGICAL CONNECTIVES" TO FEATURE.                       NC2504.2 341
   001965         196800     PERFORM PRINT-DETAIL.                                        NC2504.2 497
   001966         196900 CCVS-EXIT SECTION.                                               NC2504.2
   001967         197000 CCVS-999999.                                                     NC2504.2
   001968         197100     GO TO CLOSE-FILES.                                           NC2504.2 488
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    38
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      101   A. . . . . . . . . . . . . . .  819
      162   AA
      169   AAA
      170   AA1
      171   AA2
      335   ABC. . . . . . . . . . . . . .  1585 1585 1621 1657 1702
      250   ALPHABET-AN-00026
      257   ALPHANUMERIC-XN-00049
       73   ALTERCOUNT
      401   ANSI-REFERENCE . . . . . . . .  571 578 587 M596 M1901 M1924 M1949
       63   ATWO-DS-01V00
       62   A01ONE-DS-P0801
       61   A02ONES-DS-02V00
       57   A02TWOS-DS-02V00
       59   A02TWOS-DS-03V02
      163   A1
      164   A2 . . . . . . . . . . . . . .  898
      318   A80. . . . . . . . . . . . . .  1422 1458
      323   A86. . . . . . . . . . . . . .  1494
       60   A990-DS-0201P
      102   B. . . . . . . . . . . . . . .  829 859
      109   B. . . . . . . . . . . . . . .  859
      113   B. . . . . . . . . . . . . . .  889
      165   BB . . . . . . . . . . . . . .  168
      168   BB-2
      172   BBB
      173   BB1
      174   BB2
      166   B1
      167   B2 . . . . . . . . . . . . . .  898
      319   B80. . . . . . . . . . . . . .  1446 1471
      324   B86. . . . . . . . . . . . . .  1505
      103   C. . . . . . . . . . . . . . .  839
      110   C. . . . . . . . . . . . . . .  869
      116   CCON-1
      117   CCON-2
      118   CCON-3
      380   CCVS-C-1 . . . . . . . . . . .  515 557
      385   CCVS-C-2 . . . . . . . . . . .  516 558
      435   CCVS-E-1 . . . . . . . . . . .  521
      440   CCVS-E-2 . . . . . . . . . . .  530 537 544 549
      443   CCVS-E-2-2 . . . . . . . . . .  M529
      448   CCVS-E-3 . . . . . . . . . . .  550
      457   CCVS-E-4 . . . . . . . . . . .  529
      458   CCVS-E-4-1 . . . . . . . . . .  M527
      460   CCVS-E-4-2 . . . . . . . . . .  M528
      402   CCVS-H-1 . . . . . . . . . . .  510
      407   CCVS-H-2A. . . . . . . . . . .  511
      416   CCVS-H-2B. . . . . . . . . . .  512
      428   CCVS-H-3 . . . . . . . . . . .  513
      478   CCVS-PGM-ID. . . . . . . . . .  484 484
      305   CHARACTER-BREAKDOWN-R
      294   CHARACTER-BREAKDOWN-S
      362   CM-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    39
0 Defined   Cross-reference of data names   References

0     119   COMP-SGN1. . . . . . . . . . .  1792 1796
      120   COMP-SGN2. . . . . . . . . . .  1806 1807
      121   COMP-SGN3. . . . . . . . . . .  1819 1820
      122   COMP-SGN4. . . . . . . . . . .  1832 1835
      356   COMPUTED-A . . . . . . . . . .  357 359 360 361 362 583 586 M806 M1384 M1726 M1742 M1768 M1784 M1917 M1933 M1957
      357   COMPUTED-N . . . . . . . . . .  M1874
      355   COMPUTED-X . . . . . . . . . .  M505 569
      359   COMPUTED-0V18
      361   COMPUTED-14V4. . . . . . . . .  M1796 M1807 M1820 M1835
      363   COMPUTED-18V0
      360   COMPUTED-4V14
      243   COND-1
      244   COND-2
      246   COND-3
      379   COR-ANSI-REFERENCE . . . . . .  M578 M580
      370   CORRECT-A. . . . . . . . . . .  371 372 373 374 375 584 586 M1385 M1725 M1741 M1767 M1783 M1795 M1808 M1821 M1836
                                            M1918 M1934 M1958
      371   CORRECT-N. . . . . . . . . . .  M807 M1875
      369   CORRECT-X. . . . . . . . . . .  M506 570
      372   CORRECT-0V18
      374   CORRECT-14V4
      376   CORRECT-18V0
      373   CORRECT-4V14
      375   CR-18V0
      320   C80. . . . . . . . . . . . . .  1434 1483
      325   C86. . . . . . . . . . . . . .  1518
      104   D. . . . . . . . . . . . . . .  850
      111   D. . . . . . . . . . . . . . .  879
      326   DATANAME-86. . . . . . . . . .  M1517
      393   DELETE-COUNTER . . . . . . . .  M495 524 540 542 M1419
      254   DIGITS-DU-06V04-S
      253   DIGITS-DV-10V00. . . . . . . .  254
      327   DNAME-86
      348   DOTVALUE . . . . . . . . . . .  M500
      399   DUMMY-HOLD . . . . . . . . . .  M554 560
       39   DUMMY-RECORD . . . . . . . . .  M510 M511 M512 M513 M515 M516 M517 M519 M521 M530 M537 M544 M549 M550 554 M555
                                            556 M557 M558 M559 M560 564 M565 M573 M588
      139   D1
      145   D1
      152   D1
      156   D1
      159   D1
      140   D2
      146   D2
      153   D2
      157   D2
      160   D2
      141   D3 . . . . . . . . . . . . . .  1381 1384
      147   D3
      154   D3
      142   D4
      148   D4
      143   D5
      149   D5
      105   E. . . . . . . . . . . . . . .  907
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    40
0 Defined   Cross-reference of data names   References

0      69   EIGHT. . . . . . . . . . . . .  1161 1197
      313   EIGHTH-20R
      302   EIGHTH-20S
      262   ELEM-FOR-2N058-A
      278   ELEM-FOR-2N058-A
      263   ELEM-FOR-2N058-B
      279   ELEM-FOR-2N058-B
      264   ELEM-FOR-2N058-C
      280   ELEM-FOR-2N058-C
      265   ELEM-FOR-2N058-D
      281   ELEM-FOR-2N058-D
      266   ELEM-FOR-2N058-E
      283   ELEM-FOR-2N058-E
      267   ELEM-FOR-2N058-F
      284   ELEM-FOR-2N058-F
      268   ELEM-FOR-2N058-G
      285   ELEM-FOR-2N058-G
      269   ELEM-FOR-2N058-H
      286   ELEM-FOR-2N058-H
      270   ELEM-FOR-2N058-I
      288   ELEM-FOR-2N058-I
      271   ELEM-FOR-2N058-J
      289   ELEM-FOR-2N058-J
      272   ELEM-FOR-2N058-K
      290   ELEM-FOR-2N058-K
      273   ELEM-FOR-2N058-L
      291   ELEM-FOR-2N058-L
      274   ELEM-FOR-2N058-M
      292   ELEM-FOR-2N058-M
      275   ELEM-FOR-2N058-N
      293   ELEM-FOR-2N058-N
      317   ELMT
      446   ENDER-DESC . . . . . . . . . .  M532 M543 M548
      394   ERROR-COUNTER. . . . . . . . .  M494 523 533 536
      398   ERROR-HOLD . . . . . . . . . .  M523 M524 M524 M525 528
      444   ERROR-TOTAL. . . . . . . . . .  M534 M536 M541 M542 M546 M547
       51   EVEN-SMALLER . . . . . . . . .  1724 1739 1764 1778
      106   F. . . . . . . . . . . . . . .  917
      341   FEATURE. . . . . . . . . . . .  M609 M611 M678 M690 M764 M793 M817 M937 M944 M991 M1020 M1057 M1081 M1112 M1141
                                            M1177 M1210 M1221 M1283 M1308 M1312 M1350 M1391 M1396 M1411 M1529 M1717 M1721
                                            M1735 M1757 M1761 M1802 M1868 M1921 M1940 M1964
      310   FIFTH-20R
      299   FIFTH-20S
      331   FIGCON-DATA
      222   FILLER-A
      224   FILLER-B
      226   FILLER-C
      306   FIRST-20R
      295   FIRST-20S
      309   FOURTH-20R
      298   FOURTH-20S
      107   G. . . . . . . . . . . . . . .  927
      249   GRP-ALPHABETIC
      256   GRP-ALPHANUMERIC
      260   GRP-FOR-2N058
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    41
0 Defined   Cross-reference of data names   References

0     241   GRP-FOR-88-LEVELS
      248   GRP-GROUP-MOVE-FROM
      247   GRP-MOVE-CONSTANTS
      252   GRP-NUMERIC
      472   HYPHEN-LINE. . . . . . . . . .  517 519 559
      438   ID-AGAIN . . . . . . . . . . .  M484
       75   IF-D1. . . . . . . . . . . . .  692 795
      138   IF-D10 . . . . . . . . . . . .  804 806 M1380 1381 1384
       84   IF-D11
      144   IF-D12
       85   IF-D13
       86   IF-D14 . . . . . . . . . . . .  1002 1031 1072 1072 1094 1123
       87   IF-D15
       88   IF-D16 . . . . . . . . . . . .  710 784
       89   IF-D17
       90   IF-D18
       91   IF-D19 . . . . . . . . . . . .  680
       76   IF-D2
      150   IF-D20
      155   IF-D21 . . . . . . . . . . . .  1352
      158   IF-D22 . . . . . . . . . . . .  680
       92   IF-D23
       93   IF-D24
       94   IF-D25
       95   IF-D26
       96   IF-D27 . . . . . . . . . . . .  719
       98   IF-D28 . . . . . . . . . . . .  728 755
       77   IF-D3. . . . . . . . . . . . .  613
       99   IF-D31 . . . . . . . . . . . .  737 746 766 775
      100   IF-D32 . . . . . . . . . . . .  M819 819 M829 829 M839 839 M849 850 859 M906 M916 M926
      108   IF-D33 . . . . . . . . . . . .  M859 859 M869 869 M879 879
      112   IF-D34 . . . . . . . . . . . .  889
      161   IF-D35 . . . . . . . . . . . .  M897
      175   IF-D36
      114   IF-D37 . . . . . . . . . . . .  1352 1366
      115   IF-D38 . . . . . . . . . . . .  1366
       78   IF-D4. . . . . . . . . . . . .  622 649 1711
      178   IF-D40
      180   IF-D40A
      181   IF-D40B. . . . . . . . . . . .  1751
      182   IF-D40C
       79   IF-D5. . . . . . . . . . . . .  631 659
       80   IF-D6. . . . . . . . . . . . .  640 668
       81   IF-D7. . . . . . . . . . . . .  1072 1072
       82   IF-D8. . . . . . . . . . . . .  701
       83   IF-D9
      133   IF-ELEM
      132   IF-TABLE
      124   INC-VALUE
      471   INF-ANSI-REFERENCE . . . . . .  M571 M574 M587 M589
      466   INFO-TEXT. . . . . . . . . . .  M572
      395   INSPECT-COUNTER. . . . . . . .  M492 523 545 547
      234   LITERAL-SPLITTER . . . . . . .  239
      239   LITERAL-TABLE
      334   LOW-VAL. . . . . . . . . . . .  1531 1612 1648
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    42
0 Defined   Cross-reference of data names   References

0      70   NINE . . . . . . . . . . . . .  968 993 1060 1060 1083 1132 1152 1234 1261
      314   NINTH-20R
      303   NINTH-20S
      336   ONE23. . . . . . . . . . . . .  1540 1630 1666
      343   P-OR-F . . . . . . . . . . . .  M492 M493 M494 M495 502 M505
      345   PAR-NAME . . . . . . . . . . .  M507 M619 M628 M637 M646 M656 M665 M675 M687 M698 M707 M716 M725 M734 M743 M752
                                            M761 M772 M781 M790 M801 M814 M826 M836 M846 M856 M866 M876 M886 M894 M903 M913
                                            M923 M933 M954 M965 M976 M988 M999 M1008 M1017 M1028 M1037 M1046 M1051 M1054
                                            M1069 M1078 M1091 M1100 M1109 M1120 M1129 M1138 M1149 M1158 M1167 M1172 M1175
                                            M1185 M1194 M1203 M1208 M1218 M1231 M1239 M1247 M1258 M1266 M1274 M1279 M1309
                                            M1323 M1335 M1347 M1363 M1377 M1392 M1416 M1431 M1443 M1455 M1468 M1480 M1491
                                            M1502 M1514 M1526 M1537 M1546 M1555 M1564 M1573 M1582 M1591 M1600 M1609 M1618
                                            M1627 M1636 M1645 M1654 M1663 M1672 M1681 M1690 M1699 M1708 M1718 M1734 M1748
                                            M1758 M1774 M1789 M1803 M1816 M1829 M1842 M1847 M1869 M1898 M1920 M1939 M1951
                                            M1963
      347   PARDOT-X . . . . . . . . . . .  M499
      235   PART1
      236   PART2
      237   PART3
      238   PART4
      396   PASS-COUNTER . . . . . . . . .  M493 525 527
      201   PERFORM-KEY
      202   PERFORM-SEVEN-LEVEL-TABLE
      183   PERFORM1
      192   PERFORM10
      193   PERFORM11
      194   PERFORM12
      195   PERFORM13
      196   PERFORM14
      197   PERFORM15
      198   PERFORM16
      199   PERFORM17
      200   PERFORM18
      184   PERFORM2
      185   PERFORM3
      186   PERFORM4
      187   PERFORM5
      188   PERFORM6
      189   PERFORM7
      190   PERFORM8
      191   PERFORM9
      220   PFM-A
      221   PFM-B
      219   PFM-F4-24-TOT
      223   PFM-F4-25-A
      225   PFM-F4-25-B
      227   PFM-F4-25-C
      127   PFM-11-COUNTER
      129   PFM-12-ANS1
      130   PFM-12-ANS2
      128   PFM-12-COUNTER
      218   PFM-7-TOT
      203   PFM71
      204   PFM72
      205   PFM73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    43
0 Defined   Cross-reference of data names   References

0     206   PFM74
      207   PFM75
      208   PFM76
      209   PFM77
      210   PFM77-1
       37   PRINT-FILE . . . . . . . . . .  33 483 489
       38   PRINT-REC. . . . . . . . . . .  M501 M577 M579
      135   QU-1
      136   QU-2
      137   QU-3
      134   QUOTE-DATA
      333   QUOTE-X. . . . . . . . . . . .  1576 1594
      350   RE-MARK. . . . . . . . . . . .  M496 M508 M599 M601 M603 M605 M607 M939 M942 M1050 M1053 M1171 M1174 M1207 M1278
                                            M1285 M1288 M1361 M1375 M1397 M1399 M1401 M1403 M1417 M1846 M1854 M1858 M1863
                                            M1883 M1887 M1893
      392   REC-CT . . . . . . . . . . . .  498 500 507
      391   REC-SKL-SUB
      228   RECEIVING-TABLE
      400   RECORD-COUNT . . . . . . . . .  M552 553 M561
      307   SECOND-20R
      296   SECOND-20S
       68   SEVEN. . . . . . . . . . . . .  1060 1060 1083
      312   SEVENTH-20R
      301   SEVENTH-20S
      311   SIXTH-20R
      300   SIXTH-20S
       48   SMALL-VALU . . . . . . . . . .  1723 1738 1763 1777
       49   SMALLER-VALU . . . . . . . . .  1724 1739 1764 1778
       50   SMALLEST-VALU. . . . . . . . .  1723 1738 1739 1763 1763 1777
      332   SPACE-X. . . . . . . . . . . .  1567 1693
      123   START-POINT
      261   SUB-GRP-FOR-2N058-A
      276   SUB-GRP-FOR-2N058-B
      277   SUB-SUB-BA
      282   SUB-SUB-BB
      287   SUB-SUB-BC
      131   SUBSCRIPT-6
      125   SWITCH-PFM-1
      126   SWITCH-PFM-2
      211   S1
      212   S2
      213   S3
      214   S4
      215   S5
      216   S6
      217   S7
      316   TABLE-80 . . . . . . . . . . .  M1412 1458 1483
      322   TABLE-86
      229   TBL-ELEMEN-A
      230   TBL-ELEMEN-B
      231   TBL-ELEMEN-C
      232   TBL-ELEMEN-D
      233   TBL-ELEMEN-E
       71   TEN. . . . . . . . . . . . . .  1011 1040 1114 1132 1188 1223 1223
      315   TENTH-20R
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    44
0 Defined   Cross-reference of data names   References

0     304   TENTH-20S
      351   TEST-COMPUTED. . . . . . . . .  577
      366   TEST-CORRECT . . . . . . . . .  579
      419   TEST-ID. . . . . . . . . . . .  M484
      339   TEST-RESULTS . . . . . . . . .  M485 501 M598 M1049 M1170 M1206 M1277 M1845 M1944 M1946
       53   TEST-2NUC-COND-99
      308   THIRD-20R
      297   THIRD-20S
       67   THREE. . . . . . . . . . . . .  1022 1103 1179 1212 1242 1269
      397   TOTAL-ERROR
       72   TWENTY . . . . . . . . . . . .  979 980 1250 1250
       66   TWO. . . . . . . . . . . . . .  946 946 957 957 1143
       58   WRK-DS-01V00 . . . . . . . . .  M1292 M1295 M1298 1301
       52   WRK-DS-02V00
      242   WRK-DS-02V00-COND
       54   WRK-DS-06V06 . . . . . . . . .  55 M1850 M1851 1852 1856 1860 1874 M1879 M1880 1881 1885 1890
       55   WRK-DS-12V00-S
       41   WRK-DU-1V0-1 . . . . . . . . .  M1902 1907 M1925 1929 M1950 1953
       42   WRK-DU-1V0-2 . . . . . . . . .  M1903 1907 M1926 1929
       43   WRK-DU-1V0-3 . . . . . . . . .  M1904 1908 M1927 1930
       44   WRK-DU-1V0-4 . . . . . . . . .  M1905 1908
       45   WRK-DU-2V0-1 . . . . . . . . .  1929
       46   WRK-DU-2V0-2 . . . . . . . . .  1930
       47   WRK-DU-2V0-3 . . . . . . . . .  1930
       64   WRK-XN-00001 . . . . . . . . .  M1291 1293 M1294 M1296 M1299 1300 M1314 1316 M1326 1328 M1338 1340
       65   WRK-XN-00005 . . . . . . . . .  M1315 1316 M1327 1328 M1339 1340
       74   XRAY
      468   XXCOMPUTED . . . . . . . . . .  M586
      470   XXCORRECT. . . . . . . . . . .  M586
      463   XXINFO . . . . . . . . . . . .  573 588
      337   ZERO-C . . . . . . . . . . . .  1549
      338   ZERO-D . . . . . . . . . . . .  1558 1603 1639 1675 1684
      240   80PARTS
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    45
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

      582   BAIL-OUT . . . . . . . . . . .  P504
      590   BAIL-OUT-EX. . . . . . . . . .  E504 G584
      585   BAIL-OUT-WRITE . . . . . . . .  G583
      566   BLANK-LINE-PRINT
     1915   BUMMER-122 . . . . . . . . . .  G1908
     1966   CCVS-EXIT
     1967   CCVS-999999
      481   CCVS1
      591   CCVS1-EXIT . . . . . . . . . .  G487
      488   CLOSE-FILES. . . . . . . . . .  G1968
      514   COLUMN-NAMES-ROUTINE . . . . .  E486
      495   DE-LETE. . . . . . . . . . . .  P617 P626 P635 P644 P654 P663 P673 P685 P696 P705 P714 P723 P732 P741 P750 P759
                                            P770 P779 P788 P799 P812 P824 P834 P844 P854 P864 P874 P884 P892 P901 P911 P921
                                            P931 P952 P963 P974 P986 P997 P1006 P1015 P1026 P1035 P1044 P1067 P1076 P1089
                                            P1098 P1107 P1118 P1127 P1136 P1147 P1156 P1165 P1183 P1192 P1201 P1216 P1229
                                            P1237 P1245 P1256 P1264 P1272 P1306 P1321 P1333 P1345 P1357 P1371 P1389 P1415
                                            P1429 P1441 P1453 P1466 P1478 P1489 P1500 P1512 P1524 P1535 P1544 P1553 P1562
                                            P1571 P1580 P1589 P1598 P1607 P1616 P1625 P1634 P1643 P1652 P1661 P1670 P1679
                                            P1688 P1697 P1706 P1715 P1732 P1746 P1755 P1772 P1787 P1800 P1814 P1827 P1840
                                            P1866 P1896 P1913 P1937 P1961
      518   END-ROUTINE. . . . . . . . . .  P489 P597 P936 P1282 P1395 P1942
      522   END-ROUTINE-1
      531   END-ROUTINE-12
      539   END-ROUTINE-13 . . . . . . . .  E489
      520   END-RTN-EXIT
      494   FAIL . . . . . . . . . . . . .  P613 P622 P631 P640 P649 P659 P668 P680 P692 P701 P710 P719 P728 P737 P746 P755
                                            P766 P775 P784 P795 P808 P820 P830 P840 P850 P860 P870 P880 P889 P898 P907 P917
                                            P927 P949 P960 P971 P983 P994 P1003 P1012 P1023 P1032 P1041 P1061 P1073 P1084
                                            P1094 P1103 P1114 P1123 P1132 P1143 P1152 P1162 P1180 P1189 P1198 P1213 P1226
                                            P1234 P1242 P1253 P1261 P1269 P1302 P1317 P1329 P1341 P1360 P1374 P1386 P1424
                                            P1435 P1447 P1459 P1473 P1484 P1495 P1506 P1520 P1532 P1541 P1550 P1559 P1568
                                            P1577 P1586 P1595 P1604 P1613 P1622 P1631 P1640 P1649 P1658 P1667 P1676 P1685
                                            P1694 P1703 P1712 P1727 P1743 P1752 P1769 P1782 P1797 P1809 P1822 P1837 P1873
                                            P1916 P1933 P1956
      568   FAIL-ROUTINE . . . . . . . . .  P503
      581   FAIL-ROUTINE-EX. . . . . . . .  E503 G575
      576   FAIL-ROUTINE-WRITE . . . . . .  G569 G570
     1872   FAIL-120-121 . . . . . . . . .  P1853 P1857 P1862 P1882 P1886 P1892
      509   HEAD-ROUTINE . . . . . . . . .  P486
      616   IF--DELETE-1
      704   IF--DELETE-10
     1633   IF--DELETE-100
     1642   IF--DELETE-101
     1651   IF--DELETE-102
     1660   IF--DELETE-103
     1669   IF--DELETE-104
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    46
0 Defined   Cross-reference of procedures   References

0    1678   IF--DELETE-105
     1687   IF--DELETE-106
     1696   IF--DELETE-107
     1705   IF--DELETE-108
     1714   IF--DELETE-109
      713   IF--DELETE-11
     1731   IF--DELETE-110
     1745   IF--DELETE-111
     1754   IF--DELETE-112
     1771   IF--DELETE-113
     1786   IF--DELETE-114
     1799   IF--DELETE-115
     1813   IF--DELETE-116
     1826   IF--DELETE-117
     1839   IF--DELETE-118
      722   IF--DELETE-12
     1865   IF--DELETE-120
     1895   IF--DELETE-121
      731   IF--DELETE-13
      740   IF--DELETE-14
      749   IF--DELETE-15
      758   IF--DELETE-16
      769   IF--DELETE-17
      778   IF--DELETE-18
      787   IF--DELETE-19
      625   IF--DELETE-2
      798   IF--DELETE-20
      811   IF--DELETE-21
      823   IF--DELETE-22
      833   IF--DELETE-23
      843   IF--DELETE-24
      853   IF--DELETE-25
      863   IF--DELETE-26
      873   IF--DELETE-27
      883   IF--DELETE-28
      891   IF--DELETE-29
      634   IF--DELETE-3
      900   IF--DELETE-30
      910   IF--DELETE-31
      920   IF--DELETE-32
      930   IF--DELETE-33
      951   IF--DELETE-34
      962   IF--DELETE-35
      973   IF--DELETE-36
      985   IF--DELETE-37
      996   IF--DELETE-38
     1005   IF--DELETE-39
      643   IF--DELETE-4
     1014   IF--DELETE-40
     1025   IF--DELETE-41
     1034   IF--DELETE-42
     1043   IF--DELETE-43
     1066   IF--DELETE-46
     1075   IF--DELETE-47
     1088   IF--DELETE-48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    47
0 Defined   Cross-reference of procedures   References

0    1097   IF--DELETE-49
      653   IF--DELETE-5
     1106   IF--DELETE-50
     1117   IF--DELETE-51
     1126   IF--DELETE-52
     1135   IF--DELETE-53
     1146   IF--DELETE-54
     1155   IF--DELETE-55
     1164   IF--DELETE-56
     1182   IF--DELETE-59
      662   IF--DELETE-6
     1191   IF--DELETE-60
     1200   IF--DELETE-61
     1215   IF--DELETE-63
     1228   IF--DELETE-64
     1236   IF--DELETE-65
     1244   IF--DELETE-66
     1255   IF--DELETE-67
     1263   IF--DELETE-68
     1271   IF--DELETE-69
      672   IF--DELETE-7
     1305   IF--DELETE-71
     1320   IF--DELETE-73
     1332   IF--DELETE-74
     1344   IF--DELETE-75
     1356   IF--DELETE-77
     1370   IF--DELETE-78
      684   IF--DELETE-8
     1428   IF--DELETE-80
     1534   IF--DELETE-89
      695   IF--DELETE-9
     1543   IF--DELETE-90
     1552   IF--DELETE-91
     1561   IF--DELETE-92
     1570   IF--DELETE-93
     1579   IF--DELETE-94
     1588   IF--DELETE-95
     1597   IF--DELETE-96
     1606   IF--DELETE-97
     1615   IF--DELETE-98
     1624   IF--DELETE-99
     1876   IF--EXIT-120 . . . . . . . . .  G1871
     1359   IF--FAIL-77. . . . . . . . . .  G1355
     1373   IF--FAIL-78. . . . . . . . . .  G1369
      595   IF--INIT-A
      677   IF--INIT-B
      689   IF--INIT-C
      763   IF--INIT-D
      792   IF--INIT-E
      816   IF--INIT-F
      935   IF--INIT-G
      990   IF--INIT-H
     1019   IF--INIT-I
     1056   IF--INIT-J
     1080   IF--INIT-K
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    48
0 Defined   Cross-reference of procedures   References

0    1111   IF--INIT-L
     1140   IF--INIT-M
     1220   IF--INIT-N
     1281   IF--INIT-N1
     1311   IF--INIT-O
     1349   IF--INIT-P
     1528   IF--INIT-R
     1720   IF--INIT-S
     1760   IF--INIT-T
     1394   IF--INIT-80
      612   IF--TEST-1
      700   IF--TEST-10
     1629   IF--TEST-100
     1638   IF--TEST-101
     1647   IF--TEST-102
     1656   IF--TEST-103
     1665   IF--TEST-104
     1674   IF--TEST-105
     1683   IF--TEST-106
     1692   IF--TEST-107
     1701   IF--TEST-108
     1710   IF--TEST-109
      709   IF--TEST-11
     1722   IF--TEST-110
     1737   IF--TEST-111
     1750   IF--TEST-112
     1762   IF--TEST-113
     1776   IF--TEST-114
     1791   IF--TEST-115
     1805   IF--TEST-116
     1818   IF--TEST-117
     1831   IF--TEST-118
     1844   IF--TEST-119
      718   IF--TEST-12
     1849   IF--TEST-120
     1878   IF--TEST-121
      727   IF--TEST-13
      736   IF--TEST-14
      745   IF--TEST-15
      754   IF--TEST-16
      765   IF--TEST-17
      774   IF--TEST-18
      783   IF--TEST-19
      621   IF--TEST-2
      794   IF--TEST-20
      803   IF--TEST-21
      818   IF--TEST-22
      828   IF--TEST-23
      838   IF--TEST-24
      848   IF--TEST-25
      858   IF--TEST-26
      868   IF--TEST-27
      878   IF--TEST-28
      888   IF--TEST-29
      630   IF--TEST-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    49
0 Defined   Cross-reference of procedures   References

0     896   IF--TEST-30
      905   IF--TEST-31
      915   IF--TEST-32
      925   IF--TEST-33
      945   IF--TEST-34
      956   IF--TEST-35
      967   IF--TEST-36
      978   IF--TEST-37
      992   IF--TEST-38
     1001   IF--TEST-39
      639   IF--TEST-4
     1010   IF--TEST-40
     1021   IF--TEST-41
     1030   IF--TEST-42
     1039   IF--TEST-43
     1048   IF--TEST-44-45
     1059   IF--TEST-46
     1071   IF--TEST-47
     1082   IF--TEST-48
     1093   IF--TEST-49
      648   IF--TEST-5
     1102   IF--TEST-50
     1113   IF--TEST-51
     1122   IF--TEST-52
     1131   IF--TEST-53
     1142   IF--TEST-54
     1151   IF--TEST-55
     1160   IF--TEST-56
     1169   IF--TEST-57-58
     1178   IF--TEST-59
      658   IF--TEST-6
     1187   IF--TEST-60
     1196   IF--TEST-61
     1205   IF--TEST-62
     1211   IF--TEST-63
     1222   IF--TEST-64
     1233   IF--TEST-65
     1241   IF--TEST-66
     1249   IF--TEST-67
     1260   IF--TEST-68
     1268   IF--TEST-69
      667   IF--TEST-7
     1276   IF--TEST-70
     1290   IF--TEST-71
     1313   IF--TEST-73
     1325   IF--TEST-74
     1337   IF--TEST-75
     1351   IF--TEST-77
     1365   IF--TEST-78
     1379   IF--TEST-79
      679   IF--TEST-8
     1421   IF--TEST-80. . . . . . . . . .  G1413
     1433   IF--TEST-81
     1445   IF--TEST-82
     1457   IF--TEST-83
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    50
0 Defined   Cross-reference of procedures   References

0    1470   IF--TEST-84
     1482   IF--TEST-85
     1493   IF--TEST-86. . . . . . . . . .  G1420
     1504   IF--TEST-87
     1516   IF--TEST-88
     1530   IF--TEST-89
      691   IF--TEST-9
     1539   IF--TEST-90
     1548   IF--TEST-91
     1557   IF--TEST-92
     1566   IF--TEST-93
     1575   IF--TEST-94
     1584   IF--TEST-95
     1593   IF--TEST-96
     1602   IF--TEST-97
     1611   IF--TEST-98
     1620   IF--TEST-99
      618   IF--WRITE-1. . . . . . . . . .  G615
      706   IF--WRITE-10 . . . . . . . . .  G703
     1635   IF--WRITE-100. . . . . . . . .  G1632
     1644   IF--WRITE-101. . . . . . . . .  G1641
     1653   IF--WRITE-102. . . . . . . . .  G1650
     1662   IF--WRITE-103. . . . . . . . .  G1659
     1671   IF--WRITE-104. . . . . . . . .  G1668
     1680   IF--WRITE-105. . . . . . . . .  G1677
     1689   IF--WRITE-106. . . . . . . . .  G1686
     1698   IF--WRITE-107. . . . . . . . .  G1695
     1707   IF--WRITE-108. . . . . . . . .  G1704
     1716   IF--WRITE-109. . . . . . . . .  G1713
      715   IF--WRITE-11 . . . . . . . . .  G712 G1358
     1733   IF--WRITE-110. . . . . . . . .  G1728 G1730
     1747   IF--WRITE-111. . . . . . . . .  G1740 G1744
     1756   IF--WRITE-112. . . . . . . . .  G1753
     1773   IF--WRITE-113. . . . . . . . .  G1766 G1770
     1788   IF--WRITE-114. . . . . . . . .  G1780 G1785
     1801   IF--WRITE-115. . . . . . . . .  G1794 G1798
     1815   IF--WRITE-116. . . . . . . . .  G1810 G1812
     1828   IF--WRITE-117. . . . . . . . .  G1823 G1825
     1841   IF--WRITE-118. . . . . . . . .  G1834 G1838
      724   IF--WRITE-12 . . . . . . . . .  G721
     1867   IF--WRITE-120. . . . . . . . .  G1855 G1859 G1861 G1864 G1894
     1897   IF--WRITE-121. . . . . . . . .  G1884 G1888 G1891
      733   IF--WRITE-13 . . . . . . . . .  G730
      742   IF--WRITE-14 . . . . . . . . .  G739
      751   IF--WRITE-15 . . . . . . . . .  G748
      760   IF--WRITE-16 . . . . . . . . .  G757
      771   IF--WRITE-17 . . . . . . . . .  G768
      780   IF--WRITE-18 . . . . . . . . .  G777
      789   IF--WRITE-19 . . . . . . . . .  G786
      627   IF--WRITE-2. . . . . . . . . .  G624
      800   IF--WRITE-20 . . . . . . . . .  G797
      813   IF--WRITE-21 . . . . . . . . .  G810
      825   IF--WRITE-22 . . . . . . . . .  G822
      835   IF--WRITE-23 . . . . . . . . .  G832
      845   IF--WRITE-24 . . . . . . . . .  G842
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    51
0 Defined   Cross-reference of procedures   References

0     855   IF--WRITE-25 . . . . . . . . .  G852
      865   IF--WRITE-26 . . . . . . . . .  G862
      875   IF--WRITE-27 . . . . . . . . .  G872
      885   IF--WRITE-28 . . . . . . . . .  G882
      893   IF--WRITE-29 . . . . . . . . .  G890
      636   IF--WRITE-3. . . . . . . . . .  G633
      902   IF--WRITE-30 . . . . . . . . .  G899
      912   IF--WRITE-31 . . . . . . . . .  G909
      922   IF--WRITE-32 . . . . . . . . .  G919
      932   IF--WRITE-33 . . . . . . . . .  G929
      953   IF--WRITE-34 . . . . . . . . .  G950
      964   IF--WRITE-35 . . . . . . . . .  G961
      975   IF--WRITE-36 . . . . . . . . .  G972
      987   IF--WRITE-37 . . . . . . . . .  G984
      998   IF--WRITE-38 . . . . . . . . .  G995
     1007   IF--WRITE-39 . . . . . . . . .  G1004
      645   IF--WRITE-4. . . . . . . . . .  G642
     1016   IF--WRITE-40 . . . . . . . . .  G1013
     1027   IF--WRITE-41 . . . . . . . . .  G1024
     1036   IF--WRITE-42 . . . . . . . . .  G1033
     1045   IF--WRITE-43 . . . . . . . . .  G1042
     1068   IF--WRITE-46 . . . . . . . . .  G1065
     1077   IF--WRITE-47 . . . . . . . . .  G1074
     1090   IF--WRITE-48 . . . . . . . . .  G1087
     1099   IF--WRITE-49 . . . . . . . . .  G1096
      655   IF--WRITE-5. . . . . . . . . .  G652
     1108   IF--WRITE-50 . . . . . . . . .  G1105
     1119   IF--WRITE-51 . . . . . . . . .  G1116
     1128   IF--WRITE-52 . . . . . . . . .  G1125
     1137   IF--WRITE-53 . . . . . . . . .  G1134
     1148   IF--WRITE-54 . . . . . . . . .  G1145
     1157   IF--WRITE-55 . . . . . . . . .  G1154
     1166   IF--WRITE-56 . . . . . . . . .  G1163
     1184   IF--WRITE-59 . . . . . . . . .  G1181
      664   IF--WRITE-6. . . . . . . . . .  G661
     1193   IF--WRITE-60 . . . . . . . . .  G1190
     1202   IF--WRITE-61 . . . . . . . . .  G1199
     1217   IF--WRITE-63 . . . . . . . . .  G1214
     1230   IF--WRITE-64 . . . . . . . . .  G1227
     1238   IF--WRITE-65 . . . . . . . . .  G1235
     1246   IF--WRITE-66 . . . . . . . . .  G1243
     1257   IF--WRITE-67 . . . . . . . . .  G1254
     1265   IF--WRITE-68 . . . . . . . . .  G1262
     1273   IF--WRITE-69 . . . . . . . . .  G1270
      674   IF--WRITE-7. . . . . . . . . .  G671
     1307   IF--WRITE-71 . . . . . . . . .  G1304
     1322   IF--WRITE-73 . . . . . . . . .  G1319
     1334   IF--WRITE-74 . . . . . . . . .  G1331
     1346   IF--WRITE-75 . . . . . . . . .  G1343
     1362   IF--WRITE-77 . . . . . . . . .  G1353
     1376   IF--WRITE-78 . . . . . . . . .  G1367 G1372
      686   IF--WRITE-8. . . . . . . . . .  G683
     1536   IF--WRITE-89 . . . . . . . . .  G1533
      697   IF--WRITE-9. . . . . . . . . .  G694
     1545   IF--WRITE-90 . . . . . . . . .  G1542
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    52
0 Defined   Cross-reference of procedures   References

0    1554   IF--WRITE-91 . . . . . . . . .  G1551
     1563   IF--WRITE-92 . . . . . . . . .  G1560
     1572   IF--WRITE-93 . . . . . . . . .  G1569
     1581   IF--WRITE-94 . . . . . . . . .  G1578
     1590   IF--WRITE-95 . . . . . . . . .  G1587
     1599   IF--WRITE-96 . . . . . . . . .  G1596
     1608   IF--WRITE-97 . . . . . . . . .  G1605
     1617   IF--WRITE-98 . . . . . . . . .  G1614
     1626   IF--WRITE-99 . . . . . . . . .  G1623
     1912   IF-DELETE-122
     1936   IF-DELETE-123
     1960   IF-DELETE-124
     1388   IF-DELETE-79
     1414   IF-DELETE-80
     1440   IF-DELETE-81
     1452   IF-DELETE-82
     1465   IF-DELETE-83
     1477   IF-DELETE-84
     1488   IF-DELETE-85
     1499   IF-DELETE-86
     1511   IF-DELETE-87
     1523   IF-DELETE-88
     1900   IF-INIT-122
     1923   IF-INIT-123
     1947   IF-INIT-124
     1928   IF-LOGICAL-CONN-TEST-123
     1906   IF-TEST-122
     1952   IF-TEST-124
     1919   IF-WRITE-122 . . . . . . . . .  G1911 G1914
     1938   IF-WRITE-123 . . . . . . . . .  G1935
     1962   IF-WRITE-124 . . . . . . . . .  G1959
     1390   IF-WRITE-79. . . . . . . . . .  G1383 G1387
     1430   IF-WRITE-80. . . . . . . . . .  G1427
     1442   IF-WRITE-81. . . . . . . . . .  G1439
     1454   IF-WRITE-82. . . . . . . . . .  G1451
     1467   IF-WRITE-83. . . . . . . . . .  G1464
     1479   IF-WRITE-84. . . . . . . . . .  G1476
     1490   IF-WRITE-85. . . . . . . . . .  G1487
     1501   IF-WRITE-86. . . . . . . . . .  G1498
     1513   IF-WRITE-87. . . . . . . . . .  G1510
     1525   IF-WRITE-88. . . . . . . . . .  G1522
      492   INSPT
      482   OPEN-FILES
      493   PASS . . . . . . . . . . . . .  P613 P622 P631 P640 P650 P659 P669 P680 P692 P701 P710 P719 P728 P737 P746 P755
                                            P766 P775 P784 P795 P805 P819 P829 P839 P850 P860 P869 P879 P889 P898 P907 P917
                                            P927 P947 P958 P969 P981 P993 P1002 P1011 P1022 P1031 P1040 P1063 P1073 P1086
                                            P1095 P1104 P1115 P1124 P1133 P1144 P1153 P1162 P1179 P1188 P1198 P1213 P1224
                                            P1234 P1242 P1251 P1261 P1269 P1302 P1317 P1329 P1341 P1353 P1367 P1382 P1423
                                            P1436 P1448 P1460 P1472 P1485 P1496 P1507 P1519 P1532 P1541 P1550 P1559 P1568
                                            P1577 P1586 P1595 P1604 P1613 P1622 P1631 P1640 P1649 P1658 P1667 P1676 P1685
                                            P1694 P1703 P1712 P1729 P1740 P1752 P1765 P1779 P1793 P1811 P1824 P1833 P1861
                                            P1891 P1910 P1931 P1954
      497   PRINT-DETAIL . . . . . . . . .  P600 P602 P604 P606 P608 P610 P620 P629 P638 P647 P657 P666 P676 P688 P699 P708
                                            P717 P726 P735 P744 P753 P762 P773 P782 P791 P802 P815 P827 P837 P847 P857 P867
                                            P877 P887 P895 P904 P914 P924 P934 P940 P943 P955 P966 P977 P989 P1000 P1009
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    53
0 Defined   Cross-reference of procedures   References

0                                           P1018 P1029 P1038 P1047 P1052 P1055 P1058 P1070 P1079 P1092 P1101 P1110 P1121
                                            P1130 P1139 P1150 P1159 P1168 P1173 P1176 P1186 P1195 P1204 P1209 P1219 P1232
                                            P1240 P1248 P1259 P1267 P1275 P1280 P1286 P1289 P1310 P1324 P1336 P1348 P1364
                                            P1378 P1393 P1398 P1400 P1402 P1404 P1418 P1432 P1444 P1456 P1469 P1481 P1492
                                            P1503 P1515 P1527 P1538 P1547 P1556 P1565 P1574 P1583 P1592 P1601 P1610 P1619
                                            P1628 P1637 P1646 P1655 P1664 P1673 P1682 P1691 P1700 P1709 P1719 P1736 P1749
                                            P1759 P1775 P1790 P1804 P1817 P1830 P1843 P1848 P1870 P1899 P1922 P1941 P1945
                                            P1965
      593   SECT-NC201A-001
      490   TERMINATE-CCVS
      551   WRITE-LINE . . . . . . . . . .  P501 P502 P510 P511 P512 P513 P515 P516 P517 P519 P521 P530 P538 P544 P549 P550
                                            P573 P577 P579 P588
      563   WRT-LN . . . . . . . . . . . .  P557 P558 P559 P562 P567
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    54
0 Defined   Cross-reference of programs     References

        3   NC250A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC250A    Date 06/04/2022  Time 11:59:47   Page    55
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC250A:
 *    Source records = 1968
 *    Data Division statements = 346
 *    Procedure Division statements = 1151
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1173
0End of compilation 1,  program NC250A,  highest severity 0.
0Return code 0
