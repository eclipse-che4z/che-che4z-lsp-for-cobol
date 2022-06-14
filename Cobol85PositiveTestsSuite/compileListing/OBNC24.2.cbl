1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:55   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:55   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         OBNC24.2
   000002         000200 PROGRAM-ID.                                                      OBNC24.2
   000003         000300     OBNC2M.                                                      OBNC24.2
   000004         000400                                                                  OBNC24.2
   000005         000600*                                                              *  OBNC24.2
   000006         000700*    VALIDATION FOR:-                                          *  OBNC24.2
   000007         000800*                                                              *  OBNC24.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBNC24.2
   000009         001000*                                                              *  OBNC24.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBNC24.2
   000011         001200*                                                              *  OBNC24.2
   000012         001400*                                                              *  OBNC24.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  OBNC24.2
   000014         001600*                                                              *  OBNC24.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  OBNC24.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  OBNC24.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  OBNC24.2
   000018         002000*                                                              *  OBNC24.2
   000019         002200*    PROGRAM OBNC2M CONTAINS CCVS74 TESTS OF LANGUAGE ELEMENTS *  OBNC24.2
   000020         002300*    DEFINED AS OBSOLETE IN THE 198X STANDARDS.                *  OBNC24.2
   000021         002500 DATE-COMPILED. 06/04/22.                                         OBNC24.2
   000022         002600*    THIS COMMENT LINE SHOULD NOT BE REPLACED                     OBNC24.2
   000023         002700*    THIS COMMENT ENTRY SHOULD APPEAR AS THE LAST LINE BEFORE     OBNC24.2
   000024         002800*    THE ENVIRONMENT DIVISION.                                    OBNC24.2
   000025         002900 ENVIRONMENT DIVISION.                                            OBNC24.2
   000026         003000 CONFIGURATION SECTION.                                           OBNC24.2
   000027         003100 SOURCE-COMPUTER.                                                 OBNC24.2
   000028         003200     XXXXX082.                                                    OBNC24.2
   000029         003300 OBJECT-COMPUTER.                                                 OBNC24.2
   000030         003400     XXXXX083.                                                    OBNC24.2
   000031         003500 INPUT-OUTPUT SECTION.                                            OBNC24.2
   000032         003600 FILE-CONTROL.                                                    OBNC24.2
   000033         003700     SELECT PRINT-FILE ASSIGN TO                                  OBNC24.2 37
   000034         003800     XXXXX055.                                                    OBNC24.2
   000035         003900 DATA DIVISION.                                                   OBNC24.2
   000036         004000 FILE SECTION.                                                    OBNC24.2
   000037         004100 FD  PRINT-FILE.                                                  OBNC24.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004200 01  PRINT-REC PICTURE X(120).                                    OBNC24.2
   000039         004300 01  DUMMY-RECORD PICTURE X(120).                                 OBNC24.2
   000040         004400 WORKING-STORAGE SECTION.                                         OBNC24.2
   000041         004500 77  SMALL-VALU   PICTURE 99 VALUE 7.                             OBNC24.2
   000042         004600 77  SMALLER-VALU PICTURE 99 VALUE 6.                             OBNC24.2
   000043         004700 77  SMALLEST-VALU   PICTURE 99 VALUE 5.                          OBNC24.2
   000044         004800 77  EVEN-SMALLER PICTURE 99 VALUE 1.                             OBNC24.2
   000045         004900 77  WRK-DS-02V00                 PICTURE S99.                    OBNC24.2
   000046         005000     88 TEST-2NUC-COND-99         VALUE 99.                       OBNC24.2
   000047         005100 77  WRK-DS-06V06     PICTURE S9(6)V9(6).                         OBNC24.2
   000048         005200 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06                        OBNC24.2 47
   000049         005300                                  PICTURE S9(12).                 OBNC24.2
   000050         005400 77  A02TWOS-DS-02V00             PICTURE S99    VALUE 22.        OBNC24.2
   000051         005500 77  WRK-DS-01V00                 PICTURE S9.                     OBNC24.2
   000052         005600 77  A02TWOS-DS-03V02             PICTURE S999V99 VALUE +022.00.  OBNC24.2
   000053         005700 77  A990-DS-0201P                PICTURE S99P   VALUE 990.       OBNC24.2
   000054         005800 77  A02ONES-DS-02V00             PICTURE S99    VALUE 11.        OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  A01ONE-DS-P0801              PICTURE SP(8)9 VALUE .000000001.OBNC24.2
   000056         006000 77  ATWO-DS-01V00                PICTURE S9     VALUE 2.         OBNC24.2
   000057         006100 77  WRK-XN-00001                 PICTURE X.                      OBNC24.2
   000058         006200 77  WRK-XN-00005                 PICTURE X(5).                   OBNC24.2
   000059         006300 77  TWO  PICTURE 9 VALUE 2.                                      OBNC24.2
   000060         006400 77  THREE PICTURE 9 VALUE 3.                                     OBNC24.2
   000061         006500 77  SEVEN PICTURE 9 VALUE 7.                                     OBNC24.2
   000062         006600 77  NINE  PICTURE 9 VALUE 9.                                     OBNC24.2
   000063         006700 77  TEN  PICTURE 99 VALUE 10.                                    OBNC24.2
   000064         006800 77  ALTERCOUNT PICTURE 999 VALUE ZERO.                           OBNC24.2 IMP
   000065         006900 77  QT5    PIC X(4) VALUE SPACE.                                 OBNC24.2 IMP
   000066         007000 77  XRAY PICTURE IS X.                                           OBNC24.2
   000067         007100 77  IF-D1 PICTURE S9(4)V9(2) VALUE 0.                            OBNC24.2
   000068         007200 77  IF-D2 PICTURE S9(4)V9(2) VALUE ZERO.                         OBNC24.2 IMP
   000069         007300 77  IF-D3 PICTURE X(10) VALUE "0000000000".                      OBNC24.2
   000070         007400 77  IF-D4 PICTURE X(15) VALUE "               ".                 OBNC24.2
   000071         007500 77  IF-D5 PICTURE X(10) VALUE ALL QUOTE.                         OBNC24.2 IMP
   000072         007600 77  IF-D6 PICTURE A(10) VALUE "BABABABABA".                      OBNC24.2
   000073         007700 77  IF-D7 PICTURE S9(6)V9(4) VALUE +123.45.                      OBNC24.2
   000074         007800 77  IF-D8 PICTURE 9(6)V9(4) VALUE 12300.                         OBNC24.2
   000075         007900 77  IF-D9 PICTURE X(3) VALUE "123".                              OBNC24.2
   000076         008000 77  IF-D11 PICTURE X(6) VALUE "ABCDEF".                          OBNC24.2
   000077         008100 77  IF-D13 PICTURE 9(6)V9(4) VALUE 12300.                        OBNC24.2
   000078         008200 77  IF-D14 PICTURE S9(4)V9(2) VALUE +123.45.                     OBNC24.2
   000079         008300 77  IF-D15 PICTURE S999PP VALUE 12300.                           OBNC24.2
   000080         008400 77  IF-D16 PICTURE PP99 VALUE .0012.                             OBNC24.2
   000081         008500 77  IF-D17 PICTURE SV9(4) VALUE .0012.                           OBNC24.2
   000082         008600 77  IF-D18 PICTURE X(10) VALUE "BABABABABA".                     OBNC24.2
   000083         008700 77  IF-D19 PICTURE X(10) VALUE "ABCDEF    ".                     OBNC24.2
   000084         008800 77  IF-D23 PICTURE $9,9B9.90+.                                   OBNC24.2
   000085         008900 77  IF-D24 PICTURE X(10) VALUE "$1,2 3.40+".                     OBNC24.2
   000086         009000 77  IF-D25 PICTURE ABABX0A.                                      OBNC24.2
   000087         009100 77  IF-D26 PICTURE X(8) VALUE "A C D0E".                         OBNC24.2
   000088         009200 77  IF-D27 PICTURE IS 9(6)V9(4) VALUE IS 2137.45                 OBNC24.2
   000089         009300     USAGE IS COMPUTATIONAL.                                      OBNC24.2
   000090         009400 77  IF-D28 PICTURE IS 999999V9999 VALUE IS 2137.45.              OBNC24.2
   000091         009500 77  IF-D31 PICTURE S9(6) VALUE -123.                             OBNC24.2
   000092         009600 77  IF-D32 PICTURE S9(4)V99.                                     OBNC24.2
   000093         009700     88  A  VALUE 1.                                              OBNC24.2
   000094         009800     88  B VALUES ARE 2 THRU 4.                                   OBNC24.2
   000095         009900     88  C VALUE IS ZERO.                                         OBNC24.2 IMP
   000096         010000     88  D VALUE IS +12.34.                                       OBNC24.2
   000097         010100     88  E  VALUE IS .01, .11, .21 .81.                           OBNC24.2
   000098         010200     88  F  VALUE IS 100 THRU 128 1000 THRU 1280 -9 THRU -2.      OBNC24.2
   000099         010300     88  G  VALUE IS 8765.43 1234 THRU 5678 5 -9999 THRU 10.      OBNC24.2
   000100         010400 77  IF-D33 PICTURE X(4).                                         OBNC24.2
   000101         010500     88  B   VALUE QUOTE.                                         OBNC24.2 IMP
   000102         010600     88  C   VALUE SPACE.                                         OBNC24.2 IMP
   000103         010700     88 D VALUE ALL "BAC".                                        OBNC24.2
   000104         010800 77  IF-D34 PICTURE A(4).                                         OBNC24.2
   000105         010900     88  B VALUE "A A ".                                          OBNC24.2
   000106         011000 77  IF-D37 PICTURE 9(5) VALUE 12345.                             OBNC24.2
   000107         011100 77  IF-D38 PICTURE X(9) VALUE "12345    ".                       OBNC24.2
   000108         011200 77  CCON-1 PICTURE 99 VALUE 11.                                  OBNC24.2
   000109         011300 77  CCON-2 PICTURE 99 VALUE 12.                                  OBNC24.2
   000110         011400 77  CCON-3 PICTURE 99 VALUE 13.                                  OBNC24.2
   000111         011500 77  COMP-SGN1  PICTURE S9(1) VALUE +9 COMPUTATIONAL.             OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 77  COMP-SGN2  PICTURE S9(18) VALUE +3 COMPUTATIONAL.            OBNC24.2
   000113         011700 77  COMP-SGN3  PICTURE S9(1) VALUE -5 COMPUTATIONAL.             OBNC24.2
   000114         011800 77  COMP-SGN4  PICTURE S9(18) VALUE -3167598765431 COMPUTATIONAL.OBNC24.2
   000115         011900 77  START-POINT        PICTURE 9(6) COMPUTATIONAL.               OBNC24.2
   000116         012000 77  INC-VALUE          PICTURE 9(6) COMPUTATIONAL.               OBNC24.2
   000117         012100 77  SWITCH-PFM-1 PICTURE 9 VALUE ZERO.                           OBNC24.2 IMP
   000118         012200 77  SWITCH-PFM-2 PICTURE 9 VALUE ZERO.                           OBNC24.2 IMP
   000119         012300 77  PFM-11-COUNTER PICTURE 999 VALUE ZERO.                       OBNC24.2 IMP
   000120         012400 77  PFM-12-COUNTER  PICTURE 999 VALUE 100.                       OBNC24.2
   000121         012500 77  PFM-12-ANS1  PICTURE 999 VALUE ZERO.                         OBNC24.2 IMP
   000122         012600 77  PFM-12-ANS2  PICTURE 999 VALUE ZERO.                         OBNC24.2 IMP
   000123         012700 01  SUBSCRIPT-6 PICTURE 99999 VALUE ZERO.                        OBNC24.2 IMP
   000124         012800 01  IF-TABLE.                                                    OBNC24.2
   000125         012900     02 IF-ELEM PICTURE X OCCURS 12 TIMES.                        OBNC24.2
   000126         013000 01  QUOTE-DATA.                                                  OBNC24.2
   000127         013100     02 QU-1 PICTURE X(3) VALUE "123".                            OBNC24.2
   000128         013200     02 QU-2 PICTURE X VALUE QUOTE.                               OBNC24.2 IMP
   000129         013300     02 QU-3 PICTURE X(6) VALUE "ABC456".                         OBNC24.2
   000130         013400 01  IF-D10.                                                      OBNC24.2
   000131         013500     02  D1 PICTURE X(2) VALUE "01".                              OBNC24.2
   000132         013600     02  D2 PICTURE X(2) VALUE "23".                              OBNC24.2
   000133         013700     02  D3.                                                      OBNC24.2
   000134         013800     03  D4 PICTURE X(4) VALUE "4567".                            OBNC24.2
   000135         013900     03 D5 PICTURE X(4) VALUE "8912".                             OBNC24.2
   000136         014000 01  IF-D12.                                                      OBNC24.2
   000137         014100     02  D1 PICTURE X(3) VALUE "ABC".                             OBNC24.2
   000138         014200     02  D2.                                                      OBNC24.2
   000139         014300     03  D3.                                                      OBNC24.2
   000140         014400     04  D4      PICTURE XX     VALUE "DE".                       OBNC24.2
   000141         014500     04  D5 PICTURE X VALUE "F".                                  OBNC24.2
   000142         014600 01  IF-D20.                                                      OBNC24.2
   000143         014700     02  FILLER    PICTURE 9(5)   VALUE ZERO.                     OBNC24.2 IMP
   000144         014800     02  D1 PICTURE 9(2) VALUE 12.                                OBNC24.2
   000145         014900     02  D2 PICTURE 9 VALUE 3.                                    OBNC24.2
   000146         015000     02  D3 PICTURE 9(2) VALUE 45.                                OBNC24.2
   000147         015100 01  IF-D21.                                                      OBNC24.2
   000148         015200     02  D1 PICTURE 9(5) VALUE ZEROS.                             OBNC24.2 IMP
   000149         015300     02  D2 PICTURE 9(5) VALUE 12345.                             OBNC24.2
   000150         015400 01  IF-D22.                                                      OBNC24.2
   000151         015500     02  D1 PICTURE A(2) VALUE "AB".                              OBNC24.2
   000152         015600     02  D2 PICTURE A(4) VALUE "CDEF".                            OBNC24.2
   000153         015700 01  IF-D35.                                                      OBNC24.2
   000154         015800     02  AA PICTURE X(2).                                         OBNC24.2
   000155         015900     88  A1 VALUE "AA".                                           OBNC24.2
   000156         016000     88  A2 VALUE "AB".                                           OBNC24.2
   000157         016100     02  BB PICTURE IS X(2).                                      OBNC24.2
   000158         016200     88  B1 VALUE "CC".                                           OBNC24.2
   000159         016300     88  B2 VALUE "CD".                                           OBNC24.2
   000160         016400     02 BB-2 REDEFINES BB.                                        OBNC24.2 157
   000161         016500     03  AAA PICTURE X.                                           OBNC24.2
   000162         016600     88  AA1 VALUE "A".                                           OBNC24.2
   000163         016700     88  AA2 VALUE "C".                                           OBNC24.2
   000164         016800     03  BBB PICTURE X.                                           OBNC24.2
   000165         016900     88  BB1    VALUE "B".                                        OBNC24.2
   000166         017000     88  BB2 VALUE "D".                                           OBNC24.2
   000167         017100 01  IF-D36  PICTURE X(120) VALUE IS    "ABCDEFGHIJKLMNOPQRSTUVWXYOBNC24.2
   000168         017200-    "Z1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMOBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300-    "NOPQRSTUVWXYZ1234567890ABCDEFGHIJKL".                       OBNC24.2
   000170         017400 01  IF-D40 PICTURE 9(5) VALUE 12345                              OBNC24.2
   000171         017500              COMPUTATIONAL SYNCHRONIZED RIGHT.                   OBNC24.2
   000172         017600     88 IF-D40A VALUE ZERO THRU 10000.                            OBNC24.2 IMP
   000173         017700     88 IF-D40B VALUE 10001 THRU 99999.                           OBNC24.2
   000174         017800     88 IF-D40C VALUE 99999.                                      OBNC24.2
   000175         017900 01  PERFORM1  PICTURE XXX  VALUE SPACES.                         OBNC24.2 IMP
   000176         018000 01  PERFORM2  PICTURE S999 VALUE 20.                             OBNC24.2
   000177         018100 01  PERFORM3  PICTURE  9  VALUE  5.                              OBNC24.2
   000178         018200 01  PERFORM4  PICTURE S99V9.                                     OBNC24.2
   000179         018300 01  PERFORM5  PICTURE S99V9  VALUE 10.0.                         OBNC24.2
   000180         018400 01  PERFORM6  PICTURE  99V9.                                     OBNC24.2
   000181         018500 01  PERFORM7.                                                    OBNC24.2
   000182         018600     02  PERFORM8  OCCURS 7 TIMES  PICTURE  99V9.                 OBNC24.2
   000183         018700 01  PERFORM9  PICTURE 9   VALUE 3.                               OBNC24.2
   000184         018800 01  PERFORM10  PICTURE  S9  VALUE -1.                            OBNC24.2
   000185         018900 01  PERFORM11  PICTURE  99  VALUE 6.                             OBNC24.2
   000186         019000 01  PERFORM12.                                                   OBNC24.2
   000187         019100     02 PERFORM13  OCCURS 4 TIMES.                                OBNC24.2
   000188         019200         03 PERFORM14  OCCURS 20 TIMES  PICTURE  99V9.            OBNC24.2
   000189         019300         03 PERFORM15  OCCURS 10 TIMES.                           OBNC24.2
   000190         019400             04 PERFORM16  OCCURS 5 TIMES  PICTURE 99V9.          OBNC24.2
   000191         019500 01  PERFORM17          PICTURE 9(6) COMPUTATIONAL.               OBNC24.2
   000192         019600 01  PERFORM18          PICTURE 9(6) COMPUTATIONAL.               OBNC24.2
   000193         019700 01  PERFORM-KEY  PICTURE 9.                                      OBNC24.2
   000194         019800 01  PERFORM-SEVEN-LEVEL-TABLE.                                   OBNC24.2
   000195         019900   03   PFM71                OCCURS 2.                            OBNC24.2
   000196         020000     05  PFM72               OCCURS 2.                            OBNC24.2
   000197         020100       07  PFM73             OCCURS 2.                            OBNC24.2
   000198         020200         09  PFM74           OCCURS 2.                            OBNC24.2
   000199         020300           11  PFM75         OCCURS 2.                            OBNC24.2
   000200         020400             13  PFM76       OCCURS 2.                            OBNC24.2
   000201         020500               15  PFM77     OCCURS 2.                            OBNC24.2
   000202         020600                 17  PFM77-1 PIC X.                               OBNC24.2
   000203         020700 01  S1                      PIC S9(3) COMP.                      OBNC24.2
   000204         020800 01  S2                      PIC S9(3) COMP.                      OBNC24.2
   000205         020900 01  S3                      PIC S9(3) COMP.                      OBNC24.2
   000206         021000 01  S4                      PIC S9(3) COMP.                      OBNC24.2
   000207         021100 01  S5                      PIC S9(3) COMP.                      OBNC24.2
   000208         021200 01  S6                      PIC S9(3) COMP.                      OBNC24.2
   000209         021300 01  S7                      PIC S9(3) COMP.                      OBNC24.2
   000210         021400 01  PFM-7-TOT               PIC S9(3) COMP.                      OBNC24.2
   000211         021500 01  PFM-F4-24-TOT           PIC S9(3) COMP.                      OBNC24.2
   000212         021600 01  PFM-A                   PIC S9(3) COMP.                      OBNC24.2
   000213         021700 01  PFM-B                   PIC S9(3) COMP.                      OBNC24.2
   000214         021800 01  FILLER-A.                                                    OBNC24.2
   000215         021900   03  PFM-F4-25-A           PIC S9(3) COMP OCCURS 10.            OBNC24.2
   000216         022000 01  FILLER-B.                                                    OBNC24.2
   000217         022100   03  PFM-F4-25-B           PIC S9(3) COMP OCCURS 10.            OBNC24.2
   000218         022200 01  FILLER-C.                                                    OBNC24.2
   000219         022300   03  PFM-F4-25-C           PIC S9(3) COMP OCCURS 10.            OBNC24.2
   000220         022400 01  RECEIVING-TABLE.                                             OBNC24.2
   000221         022500     03 TBL-ELEMEN-A.                                             OBNC24.2
   000222         022600         05 TBL-ELEMEN-B          PICTURE X(18).                  OBNC24.2
   000223         022700         05 TBL-ELEMEN-C          PICTURE X(18).                  OBNC24.2
   000224         022800     03  TBL-ELEMEN-D.                                            OBNC24.2
   000225         022900         05 TBL-ELEMEN-E          PICTURE X OCCURS 36 TIMES.      OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 01  LITERAL-SPLITTER.                                            OBNC24.2
   000227         023100     02 PART1                     PICTURE X(20).                  OBNC24.2
   000228         023200     02 PART2                     PICTURE X(20).                  OBNC24.2
   000229         023300     02 PART3                     PICTURE X(20).                  OBNC24.2
   000230         023400     02 PART4                     PICTURE X(20).                  OBNC24.2
   000231         023500 01  LITERAL-TABLE REDEFINES LITERAL-SPLITTER.                    OBNC24.2 226
   000232         023600     02 80PARTS                   PICTURE X      OCCURS 80 TIMES. OBNC24.2
   000233         023700 01  GRP-FOR-88-LEVELS.                                           OBNC24.2
   000234         023800     03 WRK-DS-02V00-COND         PICTURE 99.                     OBNC24.2
   000235         023900         88 COND-1                VALUE IS 01 THRU 05.            OBNC24.2
   000236         024000         88 COND-2                VALUES ARE 06 THRU 10           OBNC24.2
   000237         024100                                           16 THRU 20  00.        OBNC24.2
   000238         024200         88 COND-3                VALUES 11 THRU 15.              OBNC24.2
   000239         024300 01  GRP-MOVE-CONSTANTS.                                          OBNC24.2
   000240         024400     03 GRP-GROUP-MOVE-FROM.                                      OBNC24.2
   000241         024500         04 GRP-ALPHABETIC.                                       OBNC24.2
   000242         024600             05 ALPHABET-AN-00026 PICTURE A(26)                   OBNC24.2
   000243         024700                        VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".       OBNC24.2
   000244         024800         04 GRP-NUMERIC.                                          OBNC24.2
   000245         024900             05 DIGITS-DV-10V00   PICTURE 9(10) VALUE 0123456789. OBNC24.2
   000246         025000         05 DIGITS-DU-06V04-S REDEFINES DIGITS-DV-10V00           OBNC24.2 245
   000247         025100                                  PICTURE 9(6)V9999.              OBNC24.2
   000248         025200         04 GRP-ALPHANUMERIC.                                     OBNC24.2
   000249         025300             05 ALPHANUMERIC-XN-00049 PICTURE X(50)               OBNC24.2
   000250         025400     VALUE  "ABCDEFGHIJKLMNOPQRSTUVWXYZ+-><=l,;.()/* 0123456789". OBNC24.2
   000251         025500             05 FILLER                PICTURE X  VALUE QUOTE.     OBNC24.2 IMP
   000252         025600 01  GRP-FOR-2N058.                                               OBNC24.2
   000253         025700     02 SUB-GRP-FOR-2N058-A.                                      OBNC24.2
   000254         025800         03 ELEM-FOR-2N058-A PICTURE 999  VALUE ZEROES.           OBNC24.2 IMP
   000255         025900         03 ELEM-FOR-2N058-B PICTURE XXX  VALUE ZEROS.            OBNC24.2 IMP
   000256         026000         03 ELEM-FOR-2N058-C PICTURE XXX  VALUE SPACES.           OBNC24.2 IMP
   000257         026100         03 ELEM-FOR-2N058-D PICTURE X(6) VALUE ALL "ABC".        OBNC24.2
   000258         026200         03 ELEM-FOR-2N058-E PICTURE XXX  VALUE ALL "Z".          OBNC24.2
   000259         026300         03 ELEM-FOR-2N058-F PICTURE XXX  VALUE ALL SPACES.       OBNC24.2 IMP
   000260         026400         03 ELEM-FOR-2N058-G PICTURE XXX  VALUE ALL ZEROES.       OBNC24.2 IMP
   000261         026500         03 ELEM-FOR-2N058-H PICTURE 999  VALUE ALL ZEROS.        OBNC24.2 IMP
   000262         026600         03 ELEM-FOR-2N058-I PICTURE XXX  VALUE QUOTES.           OBNC24.2 IMP
   000263         026700         03 ELEM-FOR-2N058-J PICTURE XXX  VALUE ALL QUOTES.       OBNC24.2 IMP
   000264         026800         03 ELEM-FOR-2N058-K PICTURE XXX  VALUE ALL HIGH-VALUES.  OBNC24.2 IMP
   000265         026900         03 ELEM-FOR-2N058-L PICTURE XXX  VALUE ALL LOW-VALUES.   OBNC24.2 IMP
   000266         027000         03 ELEM-FOR-2N058-M PICTURE XXX  VALUE HIGH-VALUES.      OBNC24.2 IMP
   000267         027100         03 ELEM-FOR-2N058-N PICTURE XXX  VALUE LOW-VALUES.       OBNC24.2 IMP
   000268         027200     02 SUB-GRP-FOR-2N058-B.                                      OBNC24.2
   000269         027300         03 SUB-SUB-BA.                                           OBNC24.2
   000270         027400             04 ELEM-FOR-2N058-A  PICTURE 999.                    OBNC24.2
   000271         027500             04 ELEM-FOR-2N058-B  PICTURE XXX.                    OBNC24.2
   000272         027600             04 ELEM-FOR-2N058-C  PICTURE XXX.                    OBNC24.2
   000273         027700             04 ELEM-FOR-2N058-D  PICTURE X(6).                   OBNC24.2
   000274         027800         03 SUB-SUB-BB.                                           OBNC24.2
   000275         027900             04 ELEM-FOR-2N058-E  PICTURE XXX.                    OBNC24.2
   000276         028000             04 ELEM-FOR-2N058-F  PICTURE XXX.                    OBNC24.2
   000277         028100             04 ELEM-FOR-2N058-G  PICTURE XXX.                    OBNC24.2
   000278         028200             04 ELEM-FOR-2N058-H  PICTURE 999.                    OBNC24.2
   000279         028300         03 SUB-SUB-BC.                                           OBNC24.2
   000280         028400             04 ELEM-FOR-2N058-I  PICTURE XXX.                    OBNC24.2
   000281         028500             04 ELEM-FOR-2N058-J  PICTURE XXX.                    OBNC24.2
   000282         028600             04 ELEM-FOR-2N058-K  PICTURE XXX.                    OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700             04 ELEM-FOR-2N058-L  PICTURE XXX.                    OBNC24.2
   000284         028800             04 ELEM-FOR-2N058-M  PICTURE XXX.                    OBNC24.2
   000285         028900             04 ELEM-FOR-2N058-N  PICTURE XXX.                    OBNC24.2
   000286         029000 01  CHARACTER-BREAKDOWN-S.                                       OBNC24.2
   000287         029100     02   FIRST-20S PICTURE X(20).                                OBNC24.2
   000288         029200     02  SECOND-20S PICTURE X(20).                                OBNC24.2
   000289         029300     02   THIRD-20S PICTURE X(20).                                OBNC24.2
   000290         029400     02  FOURTH-20S PICTURE X(20).                                OBNC24.2
   000291         029500     02   FIFTH-20S PICTURE X(20).                                OBNC24.2
   000292         029600     02   SIXTH-20S PICTURE X(20).                                OBNC24.2
   000293         029700     02 SEVENTH-20S PICTURE X(20).                                OBNC24.2
   000294         029800     02  EIGHTH-20S PICTURE X(20).                                OBNC24.2
   000295         029900     02   NINTH-20S PICTURE X(20).                                OBNC24.2
   000296         030000     02   TENTH-20S PICTURE X(20).                                OBNC24.2
   000297         030100 01  CHARACTER-BREAKDOWN-R.                                       OBNC24.2
   000298         030200     02   FIRST-20R PICTURE X(20).                                OBNC24.2
   000299         030300     02  SECOND-20R PICTURE X(20).                                OBNC24.2
   000300         030400     02   THIRD-20R PICTURE X(20).                                OBNC24.2
   000301         030500     02  FOURTH-20R PICTURE X(20).                                OBNC24.2
   000302         030600     02   FIFTH-20R PICTURE X(20).                                OBNC24.2
   000303         030700     02   SIXTH-20R PICTURE X(20).                                OBNC24.2
   000304         030800     02 SEVENTH-20R PICTURE X(20).                                OBNC24.2
   000305         030900     02  EIGHTH-20R PICTURE X(20).                                OBNC24.2
   000306         031000     02   NINTH-20R PICTURE X(20).                                OBNC24.2
   000307         031100     02   TENTH-20R PICTURE X(20).                                OBNC24.2
   000308         031200 01  TABLE-80.                                                    OBNC24.2
   000309         031300     02  ELMT OCCURS 3 TIMES PIC 9.                               OBNC24.2
   000310         031400     88  A80  VALUES ARE ZERO THRU 7.                             OBNC24.2 IMP
   000311         031500     88  B80  VALUE 8.                                            OBNC24.2
   000312         031600     88  C80  VALUES ARE 7, 8 THROUGH 9.                          OBNC24.2
   000313         031700                                                                  OBNC24.2
   000314         031800 01  TABLE-86.                                                    OBNC24.2
   000315         031900     88  A86  VALUE "ABC".                                        OBNC24.2
   000316         032000     88  B86  VALUE "ABCABC".                                     OBNC24.2
   000317         032100     88  C86  VALUE "   ABC".                                     OBNC24.2
   000318         032200     02  DATANAME-86  PIC XXX  VALUE "ABC".                       OBNC24.2
   000319         032300     02  DNAME-86.                                                OBNC24.2
   000320         032400         03  FILLER  PIC X  VALUE "A".                            OBNC24.2
   000321         032500         03  FILLER  PIC X  VALUE "B".                            OBNC24.2
   000322         032600         03  FILLER  PIC X   VALUE "C".                           OBNC24.2
   000323         032700 01  FIGCON-DATA.                                                 OBNC24.2
   000324         032800     02 SPACE-X         PICTURE X(10) VALUE "          ".         OBNC24.2
   000325         032900     02 QUOTE-X         PICTURE X(5)  VALUE QUOTE.                OBNC24.2 IMP
   000326         033000     02 LOW-VAL         PICTURE X(5)  VALUE LOW-VALUE.            OBNC24.2 IMP
   000327         033100     02 ABC PICTURE XXX VALUE "ABC".                              OBNC24.2
   000328         033200     02 ONE23           PICTURE 9999  VALUE 123.                  OBNC24.2
   000329         033300     02 ZERO-C          PICTURE 9(10) VALUE 0 COMPUTATIONAL.      OBNC24.2
   000330         033400     02 ZERO-D          PICTURE 9     VALUE ZERO USAGE DISPLAY.   OBNC24.2 IMP
   000331         033500 01  TEST-RESULTS.                                                OBNC24.2
   000332         033600     02 FILLER                   PIC X      VALUE SPACE.          OBNC24.2 IMP
   000333         033700     02 FEATURE                  PIC X(20)  VALUE SPACE.          OBNC24.2 IMP
   000334         033800     02 FILLER                   PIC X      VALUE SPACE.          OBNC24.2 IMP
   000335         033900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          OBNC24.2 IMP
   000336         034000     02 FILLER                   PIC X      VALUE SPACE.          OBNC24.2 IMP
   000337         034100     02  PAR-NAME.                                                OBNC24.2
   000338         034200       03 FILLER                 PIC X(19)  VALUE SPACE.          OBNC24.2 IMP
   000339         034300       03  PARDOT-X              PIC X      VALUE SPACE.          OBNC24.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400       03 DOTVALUE               PIC 99     VALUE ZERO.           OBNC24.2 IMP
   000341         034500     02 FILLER                   PIC X(8)   VALUE SPACE.          OBNC24.2 IMP
   000342         034600     02 RE-MARK                  PIC X(61).                       OBNC24.2
   000343         034700 01  TEST-COMPUTED.                                               OBNC24.2
   000344         034800     02 FILLER                   PIC X(30)  VALUE SPACE.          OBNC24.2 IMP
   000345         034900     02 FILLER                   PIC X(17)  VALUE                 OBNC24.2
   000346         035000            "       COMPUTED=".                                   OBNC24.2
   000347         035100     02 COMPUTED-X.                                               OBNC24.2
   000348         035200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          OBNC24.2 IMP
   000349         035300     03 COMPUTED-N               REDEFINES COMPUTED-A             OBNC24.2 348
   000350         035400                                 PIC -9(9).9(9).                  OBNC24.2
   000351         035500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         OBNC24.2 348
   000352         035600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     OBNC24.2 348
   000353         035700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     OBNC24.2 348
   000354         035800     03       CM-18V0 REDEFINES COMPUTED-A.                       OBNC24.2 348
   000355         035900         04 COMPUTED-18V0                    PIC -9(18).          OBNC24.2
   000356         036000         04 FILLER                           PIC X.               OBNC24.2
   000357         036100     03 FILLER PIC X(50) VALUE SPACE.                             OBNC24.2 IMP
   000358         036200 01  TEST-CORRECT.                                                OBNC24.2
   000359         036300     02 FILLER PIC X(30) VALUE SPACE.                             OBNC24.2 IMP
   000360         036400     02 FILLER PIC X(17) VALUE "       CORRECT =".                OBNC24.2
   000361         036500     02 CORRECT-X.                                                OBNC24.2
   000362         036600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         OBNC24.2 IMP
   000363         036700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      OBNC24.2 362
   000364         036800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         OBNC24.2 362
   000365         036900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     OBNC24.2 362
   000366         037000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     OBNC24.2 362
   000367         037100     03      CR-18V0 REDEFINES CORRECT-A.                         OBNC24.2 362
   000368         037200         04 CORRECT-18V0                     PIC -9(18).          OBNC24.2
   000369         037300         04 FILLER                           PIC X.               OBNC24.2
   000370         037400     03 FILLER PIC X(2) VALUE SPACE.                              OBNC24.2 IMP
   000371         037500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     OBNC24.2 IMP
   000372         037600 01  CCVS-C-1.                                                    OBNC24.2
   000373         037700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAOBNC24.2
   000374         037800-    "SS  PARAGRAPH-NAME                                          OBNC24.2
   000375         037900-    "       REMARKS".                                            OBNC24.2
   000376         038000     02 FILLER                     PIC X(20)    VALUE SPACE.      OBNC24.2 IMP
   000377         038100 01  CCVS-C-2.                                                    OBNC24.2
   000378         038200     02 FILLER                     PIC X        VALUE SPACE.      OBNC24.2 IMP
   000379         038300     02 FILLER                     PIC X(6)     VALUE "TESTED".   OBNC24.2
   000380         038400     02 FILLER                     PIC X(15)    VALUE SPACE.      OBNC24.2 IMP
   000381         038500     02 FILLER                     PIC X(4)     VALUE "FAIL".     OBNC24.2
   000382         038600     02 FILLER                     PIC X(94)    VALUE SPACE.      OBNC24.2 IMP
   000383         038700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       OBNC24.2 IMP
   000384         038800 01  REC-CT                        PIC 99       VALUE ZERO.       OBNC24.2 IMP
   000385         038900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       OBNC24.2 IMP
   000386         039000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       OBNC24.2 IMP
   000387         039100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       OBNC24.2 IMP
   000388         039200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       OBNC24.2 IMP
   000389         039300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       OBNC24.2 IMP
   000390         039400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       OBNC24.2 IMP
   000391         039500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      OBNC24.2 IMP
   000392         039600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       OBNC24.2 IMP
   000393         039700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     OBNC24.2 IMP
   000394         039800 01  CCVS-H-1.                                                    OBNC24.2
   000395         039900     02  FILLER                    PIC X(39)    VALUE SPACES.     OBNC24.2 IMP
   000396         040000     02  FILLER                    PIC X(42)    VALUE             OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 OBNC24.2
   000398         040200     02  FILLER                    PIC X(39)    VALUE SPACES.     OBNC24.2 IMP
   000399         040300 01  CCVS-H-2A.                                                   OBNC24.2
   000400         040400   02  FILLER                        PIC X(40)  VALUE SPACE.      OBNC24.2 IMP
   000401         040500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  OBNC24.2
   000402         040600   02  FILLER                        PIC XXXX   VALUE             OBNC24.2
   000403         040700     "4.2 ".                                                      OBNC24.2
   000404         040800   02  FILLER                        PIC X(28)  VALUE             OBNC24.2
   000405         040900            " COPY - NOT FOR DISTRIBUTION".                       OBNC24.2
   000406         041000   02  FILLER                        PIC X(41)  VALUE SPACE.      OBNC24.2 IMP
   000407         041100                                                                  OBNC24.2
   000408         041200 01  CCVS-H-2B.                                                   OBNC24.2
   000409         041300   02  FILLER                        PIC X(15)  VALUE             OBNC24.2
   000410         041400            "TEST RESULT OF ".                                    OBNC24.2
   000411         041500   02  TEST-ID                       PIC X(9).                    OBNC24.2
   000412         041600   02  FILLER                        PIC X(4)   VALUE             OBNC24.2
   000413         041700            " IN ".                                               OBNC24.2
   000414         041800   02  FILLER                        PIC X(12)  VALUE             OBNC24.2
   000415         041900     " HIGH       ".                                              OBNC24.2
   000416         042000   02  FILLER                        PIC X(22)  VALUE             OBNC24.2
   000417         042100            " LEVEL VALIDATION FOR ".                             OBNC24.2
   000418         042200   02  FILLER                        PIC X(58)  VALUE             OBNC24.2
   000419         042300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBNC24.2
   000420         042400 01  CCVS-H-3.                                                    OBNC24.2
   000421         042500     02  FILLER                      PIC X(34)  VALUE             OBNC24.2
   000422         042600            " FOR OFFICIAL USE ONLY    ".                         OBNC24.2
   000423         042700     02  FILLER                      PIC X(58)  VALUE             OBNC24.2
   000424         042800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBNC24.2
   000425         042900     02  FILLER                      PIC X(28)  VALUE             OBNC24.2
   000426         043000            "  COPYRIGHT   1985 ".                                OBNC24.2
   000427         043100 01  CCVS-E-1.                                                    OBNC24.2
   000428         043200     02 FILLER                       PIC X(52)  VALUE SPACE.      OBNC24.2 IMP
   000429         043300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              OBNC24.2
   000430         043400     02 ID-AGAIN                     PIC X(9).                    OBNC24.2
   000431         043500     02 FILLER                       PIC X(45)  VALUE SPACES.     OBNC24.2 IMP
   000432         043600 01  CCVS-E-2.                                                    OBNC24.2
   000433         043700     02  FILLER                      PIC X(31)  VALUE SPACE.      OBNC24.2 IMP
   000434         043800     02  FILLER                      PIC X(21)  VALUE SPACE.      OBNC24.2 IMP
   000435         043900     02 CCVS-E-2-2.                                               OBNC24.2
   000436         044000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      OBNC24.2 IMP
   000437         044100         03 FILLER                   PIC X      VALUE SPACE.      OBNC24.2 IMP
   000438         044200         03 ENDER-DESC               PIC X(44)  VALUE             OBNC24.2
   000439         044300            "ERRORS ENCOUNTERED".                                 OBNC24.2
   000440         044400 01  CCVS-E-3.                                                    OBNC24.2
   000441         044500     02  FILLER                      PIC X(22)  VALUE             OBNC24.2
   000442         044600            " FOR OFFICIAL USE ONLY".                             OBNC24.2
   000443         044700     02  FILLER                      PIC X(12)  VALUE SPACE.      OBNC24.2 IMP
   000444         044800     02  FILLER                      PIC X(58)  VALUE             OBNC24.2
   000445         044900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBNC24.2
   000446         045000     02  FILLER                      PIC X(13)  VALUE SPACE.      OBNC24.2 IMP
   000447         045100     02 FILLER                       PIC X(15)  VALUE             OBNC24.2
   000448         045200             " COPYRIGHT 1985".                                   OBNC24.2
   000449         045300 01  CCVS-E-4.                                                    OBNC24.2
   000450         045400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      OBNC24.2 IMP
   000451         045500     02 FILLER                       PIC X(4)   VALUE " OF ".     OBNC24.2
   000452         045600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      OBNC24.2 IMP
   000453         045700     02 FILLER                       PIC X(40)  VALUE             OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       OBNC24.2
   000455         045900 01  XXINFO.                                                      OBNC24.2
   000456         046000     02 FILLER                       PIC X(19)  VALUE             OBNC24.2
   000457         046100            "*** INFORMATION ***".                                OBNC24.2
   000458         046200     02 INFO-TEXT.                                                OBNC24.2
   000459         046300       04 FILLER                     PIC X(8)   VALUE SPACE.      OBNC24.2 IMP
   000460         046400       04 XXCOMPUTED                 PIC X(20).                   OBNC24.2
   000461         046500       04 FILLER                     PIC X(5)   VALUE SPACE.      OBNC24.2 IMP
   000462         046600       04 XXCORRECT                  PIC X(20).                   OBNC24.2
   000463         046700     02 INF-ANSI-REFERENCE           PIC X(48).                   OBNC24.2
   000464         046800 01  HYPHEN-LINE.                                                 OBNC24.2
   000465         046900     02 FILLER  PIC IS X VALUE IS SPACE.                          OBNC24.2 IMP
   000466         047000     02 FILLER  PIC IS X(65)    VALUE IS "************************OBNC24.2
   000467         047100-    "*****************************************".                 OBNC24.2
   000468         047200     02 FILLER  PIC IS X(54)    VALUE IS "************************OBNC24.2
   000469         047300-    "******************************".                            OBNC24.2
   000470         047400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             OBNC24.2
   000471         047500     "OBNC2M".                                                    OBNC24.2
   000472         047600 PROCEDURE DIVISION.                                              OBNC24.2
   000473         047700 CCVS1 SECTION.                                                   OBNC24.2
   000474         047800 OPEN-FILES.                                                      OBNC24.2
   000475         047900     OPEN     OUTPUT PRINT-FILE.                                  OBNC24.2 37
   000476         048000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   OBNC24.2 470 411 470 430
   000477         048100     MOVE    SPACE TO TEST-RESULTS.                               OBNC24.2 IMP 331
   000478         048200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             OBNC24.2 503 508
   000479         048300     GO TO CCVS1-EXIT.                                            OBNC24.2 585
   000480         048400 CLOSE-FILES.                                                     OBNC24.2
   000481         048500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   OBNC24.2 512 533 37
   000482         048600 TERMINATE-CCVS.                                                  OBNC24.2
   000483         048700     EXIT PROGRAM.                                                OBNC24.2
   000484         048800 TERMINATE-CALL.                                                  OBNC24.2
   000485         048900     STOP     RUN.                                                OBNC24.2
   000486         049000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         OBNC24.2 335 387
   000487         049100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           OBNC24.2 335 388
   000488         049200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          OBNC24.2 335 386
   000489         049300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      OBNC24.2 335 385
   000490         049400     MOVE "****TEST DELETED****" TO RE-MARK.                      OBNC24.2 342
   000491         049500 PRINT-DETAIL.                                                    OBNC24.2
   000492         049600     IF REC-CT NOT EQUAL TO ZERO                                  OBNC24.2 384 IMP
   000493      1  049700             MOVE "." TO PARDOT-X                                 OBNC24.2 339
   000494      1  049800             MOVE REC-CT TO DOTVALUE.                             OBNC24.2 384 340
   000495         049900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      OBNC24.2 331 38 545
   000496         050000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               OBNC24.2 335 545
   000497      1  050100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 OBNC24.2 562 575
   000498      1  050200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 OBNC24.2 576 584
   000499         050300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              OBNC24.2 IMP 335 IMP 347
   000500         050400     MOVE SPACE TO CORRECT-X.                                     OBNC24.2 IMP 361
   000501         050500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         OBNC24.2 384 IMP IMP 337
   000502         050600     MOVE     SPACE TO RE-MARK.                                   OBNC24.2 IMP 342
   000503         050700 HEAD-ROUTINE.                                                    OBNC24.2
   000504         050800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  OBNC24.2 394 39 545
   000505         050900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  OBNC24.2 399 39 545
   000506         051000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  OBNC24.2 408 39 545
   000507         051100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  OBNC24.2 420 39 545
   000508         051200 COLUMN-NAMES-ROUTINE.                                            OBNC24.2
   000509         051300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBNC24.2 372 39 545
   000510         051400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBNC24.2 377 39 545
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        OBNC24.2 464 39 545
   000512         051600 END-ROUTINE.                                                     OBNC24.2
   000513         051700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.OBNC24.2 464 39 545
   000514         051800 END-RTN-EXIT.                                                    OBNC24.2
   000515         051900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBNC24.2 427 39 545
   000516         052000 END-ROUTINE-1.                                                   OBNC24.2
   000517         052100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      OBNC24.2 386 390 387
   000518         052200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               OBNC24.2 390 385 390
   000519         052300      ADD PASS-COUNTER TO ERROR-HOLD.                             OBNC24.2 388 390
   000520         052400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   OBNC24.2
   000521         052500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            OBNC24.2 388 450
   000522         052600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              OBNC24.2 390 452
   000523         052700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                OBNC24.2 449 435
   000524         052800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           OBNC24.2 432 39 545
   000525         052900  END-ROUTINE-12.                                                 OBNC24.2
   000526         053000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        OBNC24.2 438
   000527         053100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      OBNC24.2 386 IMP
   000528      1  053200         MOVE "NO " TO ERROR-TOTAL                                OBNC24.2 436
   000529         053300         ELSE                                                     OBNC24.2
   000530      1  053400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       OBNC24.2 386 436
   000531         053500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           OBNC24.2 432 39
   000532         053600     PERFORM WRITE-LINE.                                          OBNC24.2 545
   000533         053700 END-ROUTINE-13.                                                  OBNC24.2
   000534         053800     IF DELETE-COUNTER IS EQUAL TO ZERO                           OBNC24.2 385 IMP
   000535      1  053900         MOVE "NO " TO ERROR-TOTAL  ELSE                          OBNC24.2 436
   000536      1  054000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      OBNC24.2 385 436
   000537         054100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   OBNC24.2 438
   000538         054200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBNC24.2 432 39 545
   000539         054300      IF   INSPECT-COUNTER EQUAL TO ZERO                          OBNC24.2 387 IMP
   000540      1  054400          MOVE "NO " TO ERROR-TOTAL                               OBNC24.2 436
   000541      1  054500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   OBNC24.2 387 436
   000542         054600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            OBNC24.2 438
   000543         054700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          OBNC24.2 432 39 545
   000544         054800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBNC24.2 440 39 545
   000545         054900 WRITE-LINE.                                                      OBNC24.2
   000546         055000     ADD 1 TO RECORD-COUNT.                                       OBNC24.2 392
   000547         055100     IF RECORD-COUNT GREATER 50                                   OBNC24.2 392
   000548      1  055200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          OBNC24.2 39 391
   000549      1  055300         MOVE SPACE TO DUMMY-RECORD                               OBNC24.2 IMP 39
   000550      1  055400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  OBNC24.2 39
   000551      1  055500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             OBNC24.2 372 39 557
   000552      1  055600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     OBNC24.2 377 39 557
   000553      1  055700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          OBNC24.2 464 39 557
   000554      1  055800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          OBNC24.2 391 39
   000555      1  055900         MOVE ZERO TO RECORD-COUNT.                               OBNC24.2 IMP 392
   000556         056000     PERFORM WRT-LN.                                              OBNC24.2 557
   000557         056100 WRT-LN.                                                          OBNC24.2
   000558         056200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               OBNC24.2 39
   000559         056300     MOVE SPACE TO DUMMY-RECORD.                                  OBNC24.2 IMP 39
   000560         056400 BLANK-LINE-PRINT.                                                OBNC24.2
   000561         056500     PERFORM WRT-LN.                                              OBNC24.2 557
   000562         056600 FAIL-ROUTINE.                                                    OBNC24.2
   000563         056700     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. OBNC24.2 347 IMP 570
   000564         056800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.OBNC24.2 361 IMP 570
   000565         056900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 OBNC24.2 393 463
   000566         057000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   OBNC24.2 458
   000567         057100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBNC24.2 455 39 545
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         OBNC24.2 IMP 463
   000569         057300     GO TO  FAIL-ROUTINE-EX.                                      OBNC24.2 575
   000570         057400 FAIL-ROUTINE-WRITE.                                              OBNC24.2
   000571         057500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         OBNC24.2 343 38 545
   000572         057600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 OBNC24.2 393 371
   000573         057700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. OBNC24.2 358 38 545
   000574         057800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         OBNC24.2 IMP 371
   000575         057900 FAIL-ROUTINE-EX. EXIT.                                           OBNC24.2
   000576         058000 BAIL-OUT.                                                        OBNC24.2
   000577         058100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   OBNC24.2 348 IMP 579
   000578         058200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           OBNC24.2 362 IMP 584
   000579         058300 BAIL-OUT-WRITE.                                                  OBNC24.2
   000580         058400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  OBNC24.2 362 462 348 460
   000581         058500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 OBNC24.2 393 463
   000582         058600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBNC24.2 455 39 545
   000583         058700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         OBNC24.2 IMP 463
   000584         058800 BAIL-OUT-EX. EXIT.                                               OBNC24.2
   000585         058900 CCVS1-EXIT.                                                      OBNC24.2
   000586         059000     EXIT.                                                        OBNC24.2
   000587         059100 SECT-OBNC2M-001 SECTION.                                         OBNC24.2
   000588         059200*                                                                 OBNC24.2
   000589         059300 GO--TEST-1.                                                      OBNC24.2
   000590         059400     ALTER GO--A TO PROCEED TO GO--C.                             OBNC24.2 597 602
   000591         059500*    NOTE THE GO STATEMENT IN GO--A IS NOT LEGAL UNLESS IT IS     OBNC24.2
   000592         059600*        ALTERED AS SHOWN ABOVE BEFORE CONTROL PASSES TO IT.      OBNC24.2
   000593         059700     GO TO GO--A.                                                 OBNC24.2 597
   000594         059800 GO--DELETE-1.                                                    OBNC24.2
   000595         059900     PERFORM DE-LETE.                                             OBNC24.2 489
   000596         060000     GO TO GO--WRITE-1.                                           OBNC24.2 604
   000597         060100 GO--A.                                                           OBNC24.2
   000598         060200     GO TO.                                                       OBNC24.2
   000599         060300 GO--B.                                                           OBNC24.2
   000600         060400     PERFORM FAIL.                                                OBNC24.2 488
   000601         060500     GO TO GO--WRITE-1.                                           OBNC24.2 604
   000602         060600 GO--C.                                                           OBNC24.2
   000603         060700     PERFORM PASS.                                                OBNC24.2 487
   000604         060800 GO--WRITE-1.                                                     OBNC24.2
   000605         060900     PERFORM END-ROUTINE.                                         OBNC24.2 512
   000606         061000     MOVE "UNFINISHED GO TO" TO FEATURE.                          OBNC24.2 333
   000607         061100     MOVE "GO--TEST-1" TO PAR-NAME.                               OBNC24.2 337
   000608         061200     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000609         061300 ALTER-TEST-1.                                                    OBNC24.2
   000610         061400     ALTER ALTER-A TO PROCEED TO ALTER-C                          OBNC24.2 617 622
   000611         061500           ALTER-D TO PROCEED TO ALTER-F                          OBNC24.2 624 629
   000612         061600           ALTER-F TO PROCEED TO ALTER-H.                         OBNC24.2 629 634
   000613         061700     GO TO ALTER-A.                                               OBNC24.2 617
   000614         061800 ALTER-DELETE-1.                                                  OBNC24.2
   000615         061900     PERFORM DE-LETE.                                             OBNC24.2 489
   000616         062000     GO TO ALTER-WRITE-1.                                         OBNC24.2 640
   000617         062100 ALTER-A.                                                         OBNC24.2
   000618         062200     GO TO ALTER-B.                                               OBNC24.2 619
   000619         062300 ALTER-B.                                                         OBNC24.2
   000620         062400     ADD 1 TO ALTERCOUNT.                                         OBNC24.2 64
   000621         062500     GO TO ALTER-FAIL-1.                                          OBNC24.2 636
   000622         062600 ALTER-C.                                                         OBNC24.2
   000623         062700     PERFORM PASS.                                                OBNC24.2 487
   000624         062800 ALTER-D.                                                         OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     GO TO ALTER-E.                                               OBNC24.2 626
   000626         063000 ALTER-E.                                                         OBNC24.2
   000627         063100     ADD 10 TO ALTERCOUNT.                                        OBNC24.2 64
   000628         063200     GO TO ALTER-FAIL-1.                                          OBNC24.2 636
   000629         063300 ALTER-F.                                                         OBNC24.2
   000630         063400     GO TO ALTER-G.                                               OBNC24.2 631
   000631         063500 ALTER-G.                                                         OBNC24.2
   000632         063600     ADD 100 TO ALTERCOUNT.                                       OBNC24.2 64
   000633         063700     GO TO ALTER-FAIL-1.                                          OBNC24.2 636
   000634         063800 ALTER-H.                                                         OBNC24.2
   000635         063900     GO TO ALTER-WRITE-1.                                         OBNC24.2 640
   000636         064000 ALTER-FAIL-1.                                                    OBNC24.2
   000637         064100     MOVE ALTERCOUNT TO COMPUTED-N.                               OBNC24.2 64 349
   000638         064200     MOVE ZERO TO CORRECT-N.                                      OBNC24.2 IMP 363
   000639         064300     PERFORM FAIL.                                                OBNC24.2 488
   000640         064400 ALTER-WRITE-1.                                                   OBNC24.2
   000641         064500     PERFORM END-ROUTINE.                                         OBNC24.2 512
   000642         064600     MOVE "SERIES ALTER" TO FEATURE.                              OBNC24.2 333
   000643         064700     MOVE "ALTER-TEST-1" TO PAR-NAME.                             OBNC24.2 337
   000644         064800     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000645         064900 ALTER-INIT-B.                                                    OBNC24.2
   000646         065000     MOVE     "SERIES ALTER" TO FEATURE.                          OBNC24.2 333
   000647         065100 ALTER-TEST-2.                                                    OBNC24.2
   000648         065200     MOVE     ZERO TO SUBSCRIPT-6.                                OBNC24.2 IMP 123
   000649         065300     MOVE     SPACE TO RECEIVING-TABLE.                           OBNC24.2 IMP 220
   000650         065400 ALTER-TESTT-2.                                                   OBNC24.2
   000651         065500     GO       TO ALTER-TESTTT-2.                                  OBNC24.2 675
   000652         065600 ALTER-A-2.                                                       OBNC24.2
   000653         065700     GO       TO ALTER-C-2.                                       OBNC24.2 657
   000654         065800 ALTER-B-2.                                                       OBNC24.2
   000655         065900     MOVE     "M" TO WRK-XN-00001.                                OBNC24.2 57
   000656         066000     PERFORM  ALTER-G-2.                                          OBNC24.2 672
   000657         066100 ALTER-C-2.                                                       OBNC24.2
   000658         066200     MOVE     "N" TO WRK-XN-00001.                                OBNC24.2 57
   000659         066300     PERFORM  ALTER-G-2.                                          OBNC24.2 672
   000660         066400     MOVE     " " TO WRK-XN-00001.                                OBNC24.2 57
   000661         066500     PERFORM  ALTER-G-2.                                          OBNC24.2 672
   000662         066600 ALTER-D-2.                                                       OBNC24.2
   000663         066700     GO       TO ALTER-F-2.                                       OBNC24.2 667
   000664         066800 ALTER-E-2.                                                       OBNC24.2
   000665         066900     MOVE     "O" TO WRK-XN-00001.                                OBNC24.2 57
   000666         067000     PERFORM  ALTER-G-2.                                          OBNC24.2 672
   000667         067100 ALTER-F-2.                                                       OBNC24.2
   000668         067200     MOVE     "P" TO WRK-XN-00001.                                OBNC24.2 57
   000669         067300     PERFORM  ALTER-G-2.                                          OBNC24.2 672
   000670         067400     MOVE     " " TO WRK-XN-00001.                                OBNC24.2 57
   000671         067500     PERFORM  ALTER-G-2.                                          OBNC24.2 672
   000672         067600 ALTER-G-2.                                                       OBNC24.2
   000673         067700     ADD      1 TO SUBSCRIPT-6.                                   OBNC24.2 123
   000674         067800     MOVE     WRK-XN-00001 TO TBL-ELEMEN-E (SUBSCRIPT-6).         OBNC24.2 57 225 123
   000675         067900 ALTER-TESTTT-2.                                                  OBNC24.2
   000676         068000     PERFORM  ALTER-A-2 THRU ALTER-F-2.                           OBNC24.2 652 667
   000677         068100     ALTER    ALTER-A-2 TO PROCEED TO ALTER-B-2                   OBNC24.2 652 654
   000678         068200              ALTER-TESTT-2 TO PROCEED TO ALTER-TESTT-2           OBNC24.2 650 650
   000679         068300              ALTER-D-2 TO PROCEED TO ALTER-E-2.                  OBNC24.2 662 664
   000680         068400     PERFORM  ALTER-A-2 THRU ALTER-F-2.                           OBNC24.2 652 667
   000681         068500     PERFORM  ALTER-A-2 THRU ALTER-F-2.                           OBNC24.2 652 667
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     MOVE     TBL-ELEMEN-D TO TBL-ELEMEN-B.                       OBNC24.2 224 222
   000683         068700     IF       TBL-ELEMEN-B EQUAL TO "N P MN OP MN OP "            OBNC24.2 222
   000684      1  068800              PERFORM PASS GO TO ALTER-WRITE-2.                   OBNC24.2 487 693
   000685         068900     GO       TO ALTER-FAIL-2.                                    OBNC24.2 689
   000686         069000 ALTER-DELETE-2.                                                  OBNC24.2
   000687         069100     PERFORM  DE-LETE.                                            OBNC24.2 489
   000688         069200     GO       TO ALTER-WRITE-2.                                   OBNC24.2 693
   000689         069300 ALTER-FAIL-2.                                                    OBNC24.2
   000690         069400     MOVE     TBL-ELEMEN-B TO COMPUTED-A.                         OBNC24.2 222 348
   000691         069500     MOVE     "N P MN OP MN OP " TO CORRECT-A.                    OBNC24.2 362
   000692         069600     PERFORM  FAIL.                                               OBNC24.2 488
   000693         069700 ALTER-WRITE-2.                                                   OBNC24.2
   000694         069800     MOVE     "ALTER-TEST-2" TO PAR-NAME.                         OBNC24.2 337
   000695         069900     PERFORM  PRINT-DETAIL.                                       OBNC24.2 491
   000696         070000 ALTER-INIT-3.                                                    OBNC24.2
   000697         070100*    NOTE  THE FOLLOWING TESTS UTILIZE THE ALTER STATEMENT WITH   OBNC24.2
   000698         070200*          11 OPERANDS  A DELETE IN ALTER-TEST-3 WILL CAUSE THE   OBNC24.2
   000699         070300*         REST OF THE ALTER TESTS TO BE BYPASSED.                 OBNC24.2
   000700         070400 ALTER-TEST-3.                                                    OBNC24.2

 ==000700==> IGYPS2015-I The paragraph or section prior to paragraph or section "ALTER-TEST-3" did
                         not contain any statements.

   000701         070500     ALTER TEST-3A TO PROCEED TO TEST-3C  TEST-4A TO TEST-4C      OBNC24.2 712 719 726 733
   000702         070600         TEST-5A TO TEST-5B  TEST-6A TO TEST-6C  TEST-7A TO       OBNC24.2 743 740 759 761 771
   000703         070700         TEST-7B  TEST-8B TO PROCEED TO TEST-8C  TEST-9A TO       OBNC24.2 768 782 784 801
   000704         070800         TEST-9C  TEST-10A TO TEST-10C  TEST-11A TO TEST-11C      OBNC24.2 803 819 821 824 831
   000705         070900         TEST-12B TO PROCEED TO TEST-12C  TEST-13A TO TEST-13B.   OBNC24.2 843 845 857 859
   000706         071000     GO TO TEST-3A.                                               OBNC24.2 712
   000707         071100 ALTER-DELETE-3.                                                  OBNC24.2
   000708         071200     PERFORM DE-LETE.                                             OBNC24.2 489
   000709         071300     MOVE "ALTER-TEST-3 THRU 13" TO PAR-NAME.                     OBNC24.2 337
   000710         071400     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000711         071500     GO TO ALTER-EXIT.                                            OBNC24.2 864
   000712         071600 TEST-3A.                                                         OBNC24.2
   000713         071700     GO TO TEST-3B.                                               OBNC24.2 714
   000714         071800 TEST-3B.                                                         OBNC24.2
   000715         071900     MOVE "TEST-3C " TO CORRECT-A.                                OBNC24.2 362
   000716         072000     MOVE "TEST-3B " TO COMPUTED-A.                               OBNC24.2 348
   000717         072100     PERFORM FAIL.                                                OBNC24.2 488
   000718         072200     GO TO ALTER-WRITE-3.                                         OBNC24.2 721
   000719         072300 TEST-3C.                                                         OBNC24.2
   000720         072400     PERFORM PASS.                                                OBNC24.2 487
   000721         072500 ALTER-WRITE-3.                                                   OBNC24.2
   000722         072600     MOVE "ALTER-TEST-3 " TO PAR-NAME.                            OBNC24.2 337
   000723         072700     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000724         072800 ALTER-TEST-4.                                                    OBNC24.2
   000725         072900     GO TO TEST-4A.                                               OBNC24.2 726
   000726         073000 TEST-4A.                                                         OBNC24.2
   000727         073100     GO TO TEST-4B.                                               OBNC24.2 728
   000728         073200 TEST-4B.                                                         OBNC24.2
   000729         073300     MOVE "TEST-4B " TO COMPUTED-A.                               OBNC24.2 348
   000730         073400     MOVE "TEST-4C " TO CORRECT-A.                                OBNC24.2 362
   000731         073500     PERFORM FAIL.                                                OBNC24.2 488
   000732         073600     GO TO ALTER-WRITE-4.                                         OBNC24.2 735
   000733         073700 TEST-4C.                                                         OBNC24.2
   000734         073800     PERFORM PASS.                                                OBNC24.2 487
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000735         073900 ALTER-WRITE-4.                                                   OBNC24.2
   000736         074000     MOVE "ALTER-TEST-4 " TO PAR-NAME.                            OBNC24.2 337
   000737         074100     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000738         074200 ALTER-TEST-5.                                                    OBNC24.2
   000739         074300     GO TO TEST-5A.                                               OBNC24.2 743
   000740         074400 TEST-5B.                                                         OBNC24.2
   000741         074500     PERFORM PASS                                                 OBNC24.2 487
   000742         074600     GO TO ALTER-WRITE-5.                                         OBNC24.2 749
   000743         074700 TEST-5A.                                                         OBNC24.2
   000744         074800     GO TO TEST-5C.                                               OBNC24.2 745
   000745         074900 TEST-5C.                                                         OBNC24.2
   000746         075000     MOVE "TEST-5C " TO COMPUTED-A.                               OBNC24.2 348
   000747         075100     MOVE "TEST-5B " TO CORRECT-A.                                OBNC24.2 362
   000748         075200     PERFORM FAIL.                                                OBNC24.2 488
   000749         075300 ALTER-WRITE-5.                                                   OBNC24.2
   000750         075400     MOVE "ALTER-TEST-5 " TO PAR-NAME.                            OBNC24.2 337
   000751         075500     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000752         075600 ALTER-TEST-6.                                                    OBNC24.2
   000753         075700     GO TO TEST-6A.                                               OBNC24.2 759
   000754         075800 TEST-6B.                                                         OBNC24.2
   000755         075900     MOVE "TEST-6B " TO COMPUTED-A.                               OBNC24.2 348
   000756         076000     MOVE "TEST-6C " TO CORRECT-A.                                OBNC24.2 362
   000757         076100     PERFORM FAIL.                                                OBNC24.2 488
   000758         076200     GO TO ALTER-WRITE-6.                                         OBNC24.2 763
   000759         076300 TEST-6A.                                                         OBNC24.2
   000760         076400     GO TO TEST-6B.                                               OBNC24.2 754
   000761         076500 TEST-6C.                                                         OBNC24.2
   000762         076600     PERFORM PASS.                                                OBNC24.2 487
   000763         076700 ALTER-WRITE-6.                                                   OBNC24.2
   000764         076800     MOVE "ALTER-TEST-6 " TO PAR-NAME.                            OBNC24.2 337
   000765         076900     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000766         077000 ALTER-TEST-7.                                                    OBNC24.2
   000767         077100     GO TO TEST-7A.                                               OBNC24.2 771
   000768         077200 TEST-7B.                                                         OBNC24.2
   000769         077300     PERFORM PASS.                                                OBNC24.2 487
   000770         077400     GO TO ALTER-WRITE-7.                                         OBNC24.2 777
   000771         077500 TEST-7A.                                                         OBNC24.2
   000772         077600     GO TO TEST-7C.                                               OBNC24.2 773
   000773         077700 TEST-7C.                                                         OBNC24.2
   000774         077800     MOVE "TEST-7C " TO COMPUTED-A.                               OBNC24.2 348
   000775         077900     MOVE "TEST-7B " TO CORRECT-A.                                OBNC24.2 362
   000776         078000     PERFORM FAIL.                                                OBNC24.2 488
   000777         078100 ALTER-WRITE-7.                                                   OBNC24.2
   000778         078200     MOVE "ALTER-TEST-7 " TO PAR-NAME.                            OBNC24.2 337
   000779         078300     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000780         078400 ALTER-TEST-8.                                                    OBNC24.2
   000781         078500     GO TO TEST-8B.                                               OBNC24.2 782
   000782         078600 TEST-8B.                                                         OBNC24.2
   000783         078700     GO TO TEST-8A.                                               OBNC24.2 787
   000784         078800 TEST-8C.                                                         OBNC24.2
   000785         078900     PERFORM PASS.                                                OBNC24.2 487
   000786         079000     GO TO ALTER-WRITE-8.                                         OBNC24.2 791
   000787         079100 TEST-8A.                                                         OBNC24.2
   000788         079200     MOVE "TEST-8A " TO COMPUTED-A.                               OBNC24.2 348
   000789         079300     MOVE "TEST-8C " TO CORRECT-A.                                OBNC24.2 362
   000790         079400     PERFORM FAIL.                                                OBNC24.2 488
   000791         079500 ALTER-WRITE-8.                                                   OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000792         079600     MOVE "ALTER-TEST-8 " TO PAR-NAME.                            OBNC24.2 337
   000793         079700     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000794         079800 ALTER-TEST-9.                                                    OBNC24.2
   000795         079900     GO TO TEST-9A.                                               OBNC24.2 801
   000796         080000 TEST-9B.                                                         OBNC24.2
   000797         080100     MOVE "TEST-9B " TO COMPUTED-A.                               OBNC24.2 348
   000798         080200     MOVE "TEST-9C " TO CORRECT-A.                                OBNC24.2 362
   000799         080300     PERFORM FAIL.                                                OBNC24.2 488
   000800         080400     GO TO ALTER-WRITE-9.                                         OBNC24.2 805
   000801         080500 TEST-9A.                                                         OBNC24.2
   000802         080600     GO TO TEST-9B.                                               OBNC24.2 796
   000803         080700 TEST-9C.                                                         OBNC24.2
   000804         080800     PERFORM PASS.                                                OBNC24.2 487
   000805         080900 ALTER-WRITE-9.                                                   OBNC24.2
   000806         081000     MOVE "ALTER-TEST-9 " TO PAR-NAME.                            OBNC24.2 337
   000807         081100     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000808         081200 ALTER-TEST-10.                                                   OBNC24.2
   000809         081300     GO TO TEST-10A.                                              OBNC24.2 819
   000810         081400 TEST-10B.                                                        OBNC24.2
   000811         081500     MOVE "TEST-10B " TO COMPUTED-A.                              OBNC24.2 348
   000812         081600     MOVE "TEST-10C " TO CORRECT-A.                               OBNC24.2 362
   000813         081700     PERFORM FAIL.                                                OBNC24.2 488
   000814         081800 ALTER-WRITE-10.                                                  OBNC24.2
   000815         081900     MOVE "ALTER-TEST-10 " TO PAR-NAME.                           OBNC24.2 337
   000816         082000     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000817         082100 ALTER-TEST-11.                                                   OBNC24.2
   000818         082200     GO TO TEST-11A.                                              OBNC24.2 824
   000819         082300 TEST-10A.                                                        OBNC24.2
   000820         082400     GO TO TEST-10B.                                              OBNC24.2 810
   000821         082500 TEST-10C.                                                        OBNC24.2
   000822         082600     PERFORM PASS.                                                OBNC24.2 487
   000823         082700     GO TO ALTER-WRITE-10.                                        OBNC24.2 814
   000824         082800 TEST-11A.                                                        OBNC24.2
   000825         082900     GO TO TEST-11B.                                              OBNC24.2 826
   000826         083000 TEST-11B.                                                        OBNC24.2
   000827         083100     MOVE "TEST-11B " TO COMPUTED-A.                              OBNC24.2 348
   000828         083200     MOVE "TEST-11C " TO CORRECT-A.                               OBNC24.2 362
   000829         083300     PERFORM FAIL.                                                OBNC24.2 488
   000830         083400     GO TO ALTER-WRITE-11.                                        OBNC24.2 833
   000831         083500 TEST-11C.                                                        OBNC24.2
   000832         083600     PERFORM PASS.                                                OBNC24.2 487
   000833         083700 ALTER-WRITE-11.                                                  OBNC24.2
   000834         083800     MOVE "ALTER-TEST-11 " TO PAR-NAME.                           OBNC24.2 337
   000835         083900     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000836         084000 ALTER-TEST-12.                                                   OBNC24.2
   000837         084100     GO TO TEST-12B.                                              OBNC24.2 843
   000838         084200 TEST-12A.                                                        OBNC24.2
   000839         084300     MOVE "TEST-12A " TO COMPUTED-A.                              OBNC24.2 348
   000840         084400     MOVE "TEST-12C " TO CORRECT-A.                               OBNC24.2 362
   000841         084500     PERFORM FAIL.                                                OBNC24.2 488
   000842         084600     GO TO ALTER-WRITE-12.                                        OBNC24.2 847
   000843         084700 TEST-12B.                                                        OBNC24.2
   000844         084800     GO TO TEST-12A.                                              OBNC24.2 838
   000845         084900 TEST-12C.                                                        OBNC24.2
   000846         085000     PERFORM PASS.                                                OBNC24.2 487
   000847         085100 ALTER-WRITE-12.                                                  OBNC24.2
   000848         085200     MOVE "ALTER-TEST-12 " TO PAR-NAME.                           OBNC24.2 337
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000849         085300     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000850         085400 ALTER-TEST-13.                                                   OBNC24.2
   000851         085500     GO TO TEST-13A.                                              OBNC24.2 857
   000852         085600 TEST-13C.                                                        OBNC24.2
   000853         085700     MOVE "TEST-13C " TO COMPUTED-A.                              OBNC24.2 348
   000854         085800     MOVE "TEST-13B " TO CORRECT-A.                               OBNC24.2 362
   000855         085900     PERFORM FAIL.                                                OBNC24.2 488
   000856         086000     GO TO ALTER-WRITE-13.                                        OBNC24.2 861
   000857         086100 TEST-13A.                                                        OBNC24.2
   000858         086200     GO TO TEST-13C.                                              OBNC24.2 852
   000859         086300 TEST-13B.                                                        OBNC24.2
   000860         086400     PERFORM PASS.                                                OBNC24.2 487
   000861         086500 ALTER-WRITE-13.                                                  OBNC24.2
   000862         086600     MOVE "ALTER-TEST-13 " TO PAR-NAME.                           OBNC24.2 337
   000863         086700     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000864         086800 ALTER-EXIT.                                                      OBNC24.2
   000865         086900     EXIT.                                                        OBNC24.2
   000866         087000 DATE-TEST-1.                                                     OBNC24.2
   000867         087100     MOVE     "DATE-COMPILED" TO FEATURE, PAR-NAME.               OBNC24.2 333 337
   000868         087200     MOVE     "SEE SOURCE LISTING" TO COMPUTED-A.                 OBNC24.2 348
   000869         087300     MOVE     "COMMENT SHOULD BE DELETED" TO RE-MARK.             OBNC24.2 342
   000870         087400     PERFORM  PRINT-DETAIL.                                       OBNC24.2 491
   000871         087500 QUAL-SECTION-1 SECTION.                                          OBNC24.2
   000872         087600 PARA-TEST-5.                                                     OBNC24.2
   000873         087700     ALTER PARA-5A IN QUAL-SECTION-1 TO PROCEED TO PARA-5C OF     OBNC24.2 875 871 911
   000874         087800     QUAL-SECTION-2.                                              OBNC24.2 910
   000875         087900 PARA-5A.                                                         OBNC24.2
   000876         088000     GO TO PARA-5C OF QUAL-SECTION-1.                             OBNC24.2 880 871
   000877         088100 PARA-5B.                                                         OBNC24.2
   000878         088200     MOVE "FAIL" TO QT5.                                          OBNC24.2 65
   000879         088300     GO TO PARA-5D.                                               OBNC24.2 882
   000880         088400 PARA-5C.                                                         OBNC24.2
   000881         088500     MOVE "FAIL" TO QT5.                                          OBNC24.2 65
   000882         088600 PARA-5D.                                                         OBNC24.2
   000883         088700                   IF QT5 EQUAL TO "PASS"                         OBNC24.2 65
   000884      1  088800     PERFORM PASS ELSE                                            OBNC24.2 487
   000885      1  088900     PERFORM FAIL.                                                OBNC24.2 488
   000886         089000     MOVE "PARA-TEST-5" TO PAR-NAME.                              OBNC24.2 337
   000887         089100     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000888         089200 PARA-5-EXIT.                                                     OBNC24.2
   000889         089300     EXIT.                                                        OBNC24.2
   000890         089400 PARA-TEST-6.                                                     OBNC24.2
   000891         089500     ALTER PARA-6B IN QUAL-SECTION-2 TO PROCEED TO PARA-6C OF     OBNC24.2 914 910 898
   000892         089600     QUAL-SECTION-1.                                              OBNC24.2 871
   000893         089700 PARA-6A.                                                         OBNC24.2
   000894         089800     GO TO PARA-6B OF QUAL-SECTION-2.                             OBNC24.2 914 910
   000895         089900 PARA-6B.                                                         OBNC24.2
   000896         090000     PERFORM FAIL                                                 OBNC24.2 488
   000897         090100     GO TO PARA-6-EXIT.                                           OBNC24.2 903
   000898         090200 PARA-6C.                                                         OBNC24.2
   000899         090300     PERFORM PASS.                                                OBNC24.2 487
   000900         090400     GO TO   PARA-6-EXIT.                                         OBNC24.2 903
   000901         090500 PARA-6D.                                                         OBNC24.2
   000902         090600     PERFORM FAIL.                                                OBNC24.2 488
   000903         090700 PARA-6-EXIT.                                                     OBNC24.2
   000904         090800     EXIT.                                                        OBNC24.2
   000905         090900 PARA-6-LAST.                                                     OBNC24.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000906         091000     GO TO   CCVS-EXIT.                                           OBNC24.2 923
   000907         091100 PARA-TEST-FINISH.                                                OBNC24.2
   000908         091200     MOVE   "PARA-TEST-6" TO PAR-NAME.                            OBNC24.2 337
   000909         091300     PERFORM PRINT-DETAIL.                                        OBNC24.2 491
   000910         091400 QUAL-SECTION-2 SECTION.                                          OBNC24.2
   000911         091500 PARA-5C.                                                         OBNC24.2
   000912         091600     MOVE   "PASS" TO QT5.                                        OBNC24.2 65
   000913         091700     GO TO   PARA-5D.                                             OBNC24.2 882
   000914         091800 PARA-6B.                                                         OBNC24.2
   000915         091900     GO TO   PARA-6D OF QUAL-SECTION-2.                           OBNC24.2 919 910
   000916         092000 PARA-6C.                                                         OBNC24.2
   000917         092100     PERFORM FAIL.                                                OBNC24.2 488
   000918         092200     GO TO   PARA-6-EXIT.                                         OBNC24.2 903
   000919         092300 PARA-6D.                                                         OBNC24.2
   000920         092400     GO TO   PARA-6D IN QUAL-SECTION-1.                           OBNC24.2 901 871
   000921         092500 QUAL-EXIT.                                                       OBNC24.2
   000922         092600     EXIT.                                                        OBNC24.2
   000923         092700 CCVS-EXIT SECTION.                                               OBNC24.2
   000924         092800 CCVS-999999.                                                     OBNC24.2
   000925         092900     GO TO CLOSE-FILES.                                           OBNC24.2 480
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    20
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       93   A
      154   AA
      161   AAA
      162   AA1
      163   AA2
      327   ABC
      242   ALPHABET-AN-00026
      249   ALPHANUMERIC-XN-00049
       64   ALTERCOUNT . . . . . . . . . .  M620 M627 M632 637
      393   ANSI-REFERENCE . . . . . . . .  565 572 581
       56   ATWO-DS-01V00
       55   A01ONE-DS-P0801
       54   A02ONES-DS-02V00
       50   A02TWOS-DS-02V00
       52   A02TWOS-DS-03V02
      155   A1
      156   A2
      310   A80
      315   A86
       53   A990-DS-0201P
       94   B
      101   B
      105   B
      157   BB . . . . . . . . . . . . . .  160
      160   BB-2
      164   BBB
      165   BB1
      166   BB2
      158   B1
      159   B2
      311   B80
      316   B86
       95   C
      102   C
      108   CCON-1
      109   CCON-2
      110   CCON-3
      372   CCVS-C-1 . . . . . . . . . . .  509 551
      377   CCVS-C-2 . . . . . . . . . . .  510 552
      427   CCVS-E-1 . . . . . . . . . . .  515
      432   CCVS-E-2 . . . . . . . . . . .  524 531 538 543
      435   CCVS-E-2-2 . . . . . . . . . .  M523
      440   CCVS-E-3 . . . . . . . . . . .  544
      449   CCVS-E-4 . . . . . . . . . . .  523
      450   CCVS-E-4-1 . . . . . . . . . .  M521
      452   CCVS-E-4-2 . . . . . . . . . .  M522
      394   CCVS-H-1 . . . . . . . . . . .  504
      399   CCVS-H-2A. . . . . . . . . . .  505
      408   CCVS-H-2B. . . . . . . . . . .  506
      420   CCVS-H-3 . . . . . . . . . . .  507
      470   CCVS-PGM-ID. . . . . . . . . .  476 476
      297   CHARACTER-BREAKDOWN-R
      286   CHARACTER-BREAKDOWN-S
      354   CM-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    21
0 Defined   Cross-reference of data names   References

0     111   COMP-SGN1
      112   COMP-SGN2
      113   COMP-SGN3
      114   COMP-SGN4
      348   COMPUTED-A . . . . . . . . . .  349 351 352 353 354 577 580 M690 M716 M729 M746 M755 M774 M788 M797 M811 M827
                                            M839 M853 M868
      349   COMPUTED-N . . . . . . . . . .  M637
      347   COMPUTED-X . . . . . . . . . .  M499 563
      351   COMPUTED-0V18
      353   COMPUTED-14V4
      355   COMPUTED-18V0
      352   COMPUTED-4V14
      235   COND-1
      236   COND-2
      238   COND-3
      371   COR-ANSI-REFERENCE . . . . . .  M572 M574
      362   CORRECT-A. . . . . . . . . . .  363 364 365 366 367 578 580 M691 M715 M730 M747 M756 M775 M789 M798 M812 M828
                                            M840 M854
      363   CORRECT-N. . . . . . . . . . .  M638
      361   CORRECT-X. . . . . . . . . . .  M500 564
      364   CORRECT-0V18
      366   CORRECT-14V4
      368   CORRECT-18V0
      365   CORRECT-4V14
      367   CR-18V0
      312   C80
      317   C86
       96   D
      103   D
      318   DATANAME-86
      385   DELETE-COUNTER . . . . . . . .  M489 518 534 536
      246   DIGITS-DU-06V04-S
      245   DIGITS-DV-10V00. . . . . . . .  246
      319   DNAME-86
      340   DOTVALUE . . . . . . . . . . .  M494
      391   DUMMY-HOLD . . . . . . . . . .  M548 554
       39   DUMMY-RECORD . . . . . . . . .  M504 M505 M506 M507 M509 M510 M511 M513 M515 M524 M531 M538 M543 M544 548 M549
                                            550 M551 M552 M553 M554 558 M559 M567 M582
      131   D1
      137   D1
      144   D1
      148   D1
      151   D1
      132   D2
      138   D2
      145   D2
      149   D2
      152   D2
      133   D3
      139   D3
      146   D3
      134   D4
      140   D4
      135   D5
      141   D5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    22
0 Defined   Cross-reference of data names   References

0      97   E
      305   EIGHTH-20R
      294   EIGHTH-20S
      254   ELEM-FOR-2N058-A
      270   ELEM-FOR-2N058-A
      255   ELEM-FOR-2N058-B
      271   ELEM-FOR-2N058-B
      256   ELEM-FOR-2N058-C
      272   ELEM-FOR-2N058-C
      257   ELEM-FOR-2N058-D
      273   ELEM-FOR-2N058-D
      258   ELEM-FOR-2N058-E
      275   ELEM-FOR-2N058-E
      259   ELEM-FOR-2N058-F
      276   ELEM-FOR-2N058-F
      260   ELEM-FOR-2N058-G
      277   ELEM-FOR-2N058-G
      261   ELEM-FOR-2N058-H
      278   ELEM-FOR-2N058-H
      262   ELEM-FOR-2N058-I
      280   ELEM-FOR-2N058-I
      263   ELEM-FOR-2N058-J
      281   ELEM-FOR-2N058-J
      264   ELEM-FOR-2N058-K
      282   ELEM-FOR-2N058-K
      265   ELEM-FOR-2N058-L
      283   ELEM-FOR-2N058-L
      266   ELEM-FOR-2N058-M
      284   ELEM-FOR-2N058-M
      267   ELEM-FOR-2N058-N
      285   ELEM-FOR-2N058-N
      309   ELMT
      438   ENDER-DESC . . . . . . . . . .  M526 M537 M542
      386   ERROR-COUNTER. . . . . . . . .  M488 517 527 530
      390   ERROR-HOLD . . . . . . . . . .  M517 M518 M518 M519 522
      436   ERROR-TOTAL. . . . . . . . . .  M528 M530 M535 M536 M540 M541
       44   EVEN-SMALLER
       98   F
      333   FEATURE. . . . . . . . . . . .  M606 M642 M646 M867
      302   FIFTH-20R
      291   FIFTH-20S
      323   FIGCON-DATA
      214   FILLER-A
      216   FILLER-B
      218   FILLER-C
      298   FIRST-20R
      287   FIRST-20S
      301   FOURTH-20R
      290   FOURTH-20S
       99   G
      241   GRP-ALPHABETIC
      248   GRP-ALPHANUMERIC
      252   GRP-FOR-2N058
      233   GRP-FOR-88-LEVELS
      240   GRP-GROUP-MOVE-FROM
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    23
0 Defined   Cross-reference of data names   References

0     239   GRP-MOVE-CONSTANTS
      244   GRP-NUMERIC
      464   HYPHEN-LINE. . . . . . . . . .  511 513 553
      430   ID-AGAIN . . . . . . . . . . .  M476
       67   IF-D1
      130   IF-D10
       76   IF-D11
      136   IF-D12
       77   IF-D13
       78   IF-D14
       79   IF-D15
       80   IF-D16
       81   IF-D17
       82   IF-D18
       83   IF-D19
       68   IF-D2
      142   IF-D20
      147   IF-D21
      150   IF-D22
       84   IF-D23
       85   IF-D24
       86   IF-D25
       87   IF-D26
       88   IF-D27
       90   IF-D28
       69   IF-D3
       91   IF-D31
       92   IF-D32
      100   IF-D33
      104   IF-D34
      153   IF-D35
      167   IF-D36
      106   IF-D37
      107   IF-D38
       70   IF-D4
      170   IF-D40
      172   IF-D40A
      173   IF-D40B
      174   IF-D40C
       71   IF-D5
       72   IF-D6
       73   IF-D7
       74   IF-D8
       75   IF-D9
      125   IF-ELEM
      124   IF-TABLE
      116   INC-VALUE
      463   INF-ANSI-REFERENCE . . . . . .  M565 M568 M581 M583
      458   INFO-TEXT. . . . . . . . . . .  M566
      387   INSPECT-COUNTER. . . . . . . .  M486 517 539 541
      226   LITERAL-SPLITTER . . . . . . .  231
      231   LITERAL-TABLE
      326   LOW-VAL
       62   NINE
      306   NINTH-20R
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    24
0 Defined   Cross-reference of data names   References

0     295   NINTH-20S
      328   ONE23
      335   P-OR-F . . . . . . . . . . . .  M486 M487 M488 M489 496 M499
      337   PAR-NAME . . . . . . . . . . .  M501 M607 M643 M694 M709 M722 M736 M750 M764 M778 M792 M806 M815 M834 M848 M862
                                            M867 M886 M908
      339   PARDOT-X . . . . . . . . . . .  M493
      227   PART1
      228   PART2
      229   PART3
      230   PART4
      388   PASS-COUNTER . . . . . . . . .  M487 519 521
      193   PERFORM-KEY
      194   PERFORM-SEVEN-LEVEL-TABLE
      175   PERFORM1
      184   PERFORM10
      185   PERFORM11
      186   PERFORM12
      187   PERFORM13
      188   PERFORM14
      189   PERFORM15
      190   PERFORM16
      191   PERFORM17
      192   PERFORM18
      176   PERFORM2
      177   PERFORM3
      178   PERFORM4
      179   PERFORM5
      180   PERFORM6
      181   PERFORM7
      182   PERFORM8
      183   PERFORM9
      212   PFM-A
      213   PFM-B
      211   PFM-F4-24-TOT
      215   PFM-F4-25-A
      217   PFM-F4-25-B
      219   PFM-F4-25-C
      119   PFM-11-COUNTER
      121   PFM-12-ANS1
      122   PFM-12-ANS2
      120   PFM-12-COUNTER
      210   PFM-7-TOT
      195   PFM71
      196   PFM72
      197   PFM73
      198   PFM74
      199   PFM75
      200   PFM76
      201   PFM77
      202   PFM77-1
       37   PRINT-FILE . . . . . . . . . .  33 475 481
       38   PRINT-REC. . . . . . . . . . .  M495 M571 M573
       65   QT5. . . . . . . . . . . . . .  M878 M881 883 M912
      127   QU-1
      128   QU-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    25
0 Defined   Cross-reference of data names   References

0     129   QU-3
      126   QUOTE-DATA
      325   QUOTE-X
      342   RE-MARK. . . . . . . . . . . .  M490 M502 M869
      384   REC-CT . . . . . . . . . . . .  492 494 501
      383   REC-SKL-SUB
      220   RECEIVING-TABLE. . . . . . . .  M649
      392   RECORD-COUNT . . . . . . . . .  M546 547 M555
      299   SECOND-20R
      288   SECOND-20S
       61   SEVEN
      304   SEVENTH-20R
      293   SEVENTH-20S
      303   SIXTH-20R
      292   SIXTH-20S
       41   SMALL-VALU
       42   SMALLER-VALU
       43   SMALLEST-VALU
      324   SPACE-X
      115   START-POINT
      253   SUB-GRP-FOR-2N058-A
      268   SUB-GRP-FOR-2N058-B
      269   SUB-SUB-BA
      274   SUB-SUB-BB
      279   SUB-SUB-BC
      123   SUBSCRIPT-6. . . . . . . . . .  M648 M673 674
      117   SWITCH-PFM-1
      118   SWITCH-PFM-2
      203   S1
      204   S2
      205   S3
      206   S4
      207   S5
      208   S6
      209   S7
      308   TABLE-80
      314   TABLE-86
      221   TBL-ELEMEN-A
      222   TBL-ELEMEN-B . . . . . . . . .  M682 683 690
      223   TBL-ELEMEN-C
      224   TBL-ELEMEN-D . . . . . . . . .  682
      225   TBL-ELEMEN-E . . . . . . . . .  M674
       63   TEN
      307   TENTH-20R
      296   TENTH-20S
      343   TEST-COMPUTED. . . . . . . . .  571
      358   TEST-CORRECT . . . . . . . . .  573
      411   TEST-ID. . . . . . . . . . . .  M476
      331   TEST-RESULTS . . . . . . . . .  M477 495
       46   TEST-2NUC-COND-99
      300   THIRD-20R
      289   THIRD-20S
       60   THREE
      389   TOTAL-ERROR
       59   TWO
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    26
0 Defined   Cross-reference of data names   References

0      51   WRK-DS-01V00
       45   WRK-DS-02V00
      234   WRK-DS-02V00-COND
       47   WRK-DS-06V06 . . . . . . . . .  48
       48   WRK-DS-12V00-S
       57   WRK-XN-00001 . . . . . . . . .  M655 M658 M660 M665 M668 M670 674
       58   WRK-XN-00005
       66   XRAY
      460   XXCOMPUTED . . . . . . . . . .  M580
      462   XXCORRECT. . . . . . . . . . .  M580
      455   XXINFO . . . . . . . . . . . .  567 582
      329   ZERO-C
      330   ZERO-D
      232   80PARTS
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    27
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

      617   ALTER-A. . . . . . . . . . . .  A610 G613
      652   ALTER-A-2. . . . . . . . . . .  P676 A677 P680 P681
      619   ALTER-B. . . . . . . . . . . .  G618
      654   ALTER-B-2. . . . . . . . . . .  T677
      622   ALTER-C. . . . . . . . . . . .  T610
      657   ALTER-C-2. . . . . . . . . . .  G653
      624   ALTER-D. . . . . . . . . . . .  A611
      662   ALTER-D-2. . . . . . . . . . .  A679
      614   ALTER-DELETE-1
      686   ALTER-DELETE-2
      707   ALTER-DELETE-3
      626   ALTER-E. . . . . . . . . . . .  G625
      664   ALTER-E-2. . . . . . . . . . .  T679
      864   ALTER-EXIT . . . . . . . . . .  G711
      629   ALTER-F. . . . . . . . . . . .  T611 A612
      667   ALTER-F-2. . . . . . . . . . .  G663 E676 E680 E681
      636   ALTER-FAIL-1 . . . . . . . . .  G621 G628 G633
      689   ALTER-FAIL-2 . . . . . . . . .  G685
      631   ALTER-G. . . . . . . . . . . .  G630
      672   ALTER-G-2. . . . . . . . . . .  P656 P659 P661 P666 P669 P671
      634   ALTER-H. . . . . . . . . . . .  T612
      645   ALTER-INIT-B
      696   ALTER-INIT-3
      609   ALTER-TEST-1
      808   ALTER-TEST-10
      817   ALTER-TEST-11
      836   ALTER-TEST-12
      850   ALTER-TEST-13
      647   ALTER-TEST-2
      700   ALTER-TEST-3
      724   ALTER-TEST-4
      738   ALTER-TEST-5
      752   ALTER-TEST-6
      766   ALTER-TEST-7
      780   ALTER-TEST-8
      794   ALTER-TEST-9
      650   ALTER-TESTT-2. . . . . . . . .  A678 T678
      675   ALTER-TESTTT-2 . . . . . . . .  G651
      640   ALTER-WRITE-1. . . . . . . . .  G616 G635
      814   ALTER-WRITE-10 . . . . . . . .  G823
      833   ALTER-WRITE-11 . . . . . . . .  G830
      847   ALTER-WRITE-12 . . . . . . . .  G842
      861   ALTER-WRITE-13 . . . . . . . .  G856
      693   ALTER-WRITE-2. . . . . . . . .  G684 G688
      721   ALTER-WRITE-3. . . . . . . . .  G718
      735   ALTER-WRITE-4. . . . . . . . .  G732
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    28
0 Defined   Cross-reference of procedures   References

0     749   ALTER-WRITE-5. . . . . . . . .  G742
      763   ALTER-WRITE-6. . . . . . . . .  G758
      777   ALTER-WRITE-7. . . . . . . . .  G770
      791   ALTER-WRITE-8. . . . . . . . .  G786
      805   ALTER-WRITE-9. . . . . . . . .  G800
      576   BAIL-OUT . . . . . . . . . . .  P498
      584   BAIL-OUT-EX. . . . . . . . . .  E498 G578
      579   BAIL-OUT-WRITE . . . . . . . .  G577
      560   BLANK-LINE-PRINT
      923   CCVS-EXIT. . . . . . . . . . .  G906
      924   CCVS-999999
      473   CCVS1
      585   CCVS1-EXIT . . . . . . . . . .  G479
      480   CLOSE-FILES. . . . . . . . . .  G925
      508   COLUMN-NAMES-ROUTINE . . . . .  E478
      866   DATE-TEST-1
      489   DE-LETE. . . . . . . . . . . .  P595 P615 P687 P708
      512   END-ROUTINE. . . . . . . . . .  P481 P605 P641
      516   END-ROUTINE-1
      525   END-ROUTINE-12
      533   END-ROUTINE-13 . . . . . . . .  E481
      514   END-RTN-EXIT
      488   FAIL . . . . . . . . . . . . .  P600 P639 P692 P717 P731 P748 P757 P776 P790 P799 P813 P829 P841 P855 P885 P896
                                            P902 P917
      562   FAIL-ROUTINE . . . . . . . . .  P497
      575   FAIL-ROUTINE-EX. . . . . . . .  E497 G569
      570   FAIL-ROUTINE-WRITE . . . . . .  G563 G564
      597   GO--A. . . . . . . . . . . . .  A590 G593
      599   GO--B
      602   GO--C. . . . . . . . . . . . .  T590
      594   GO--DELETE-1
      589   GO--TEST-1
      604   GO--WRITE-1. . . . . . . . . .  G596 G601
      503   HEAD-ROUTINE . . . . . . . . .  P478
      486   INSPT
      474   OPEN-FILES
      907   PARA-TEST-FINISH
      872   PARA-TEST-5
      890   PARA-TEST-6
      888   PARA-5-EXIT
      875   PARA-5A. . . . . . . . . . . .  A873
      877   PARA-5B
      880   PARA-5C                         G876
      911   PARA-5C. . . . . . . . . . . .  T873
      882   PARA-5D. . . . . . . . . . . .  G879 G913
      903   PARA-6-EXIT. . . . . . . . . .  G897 G900 G918
      905   PARA-6-LAST
      893   PARA-6A
      895   PARA-6B
      914   PARA-6B. . . . . . . . . . . .  A891 G894
      898   PARA-6C                         T891
      916   PARA-6C
      901   PARA-6D                         G920
      919   PARA-6D. . . . . . . . . . . .  G915
      487   PASS . . . . . . . . . . . . .  P603 P623 P684 P720 P734 P741 P762 P769 P785 P804 P822 P832 P846 P860 P884 P899
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    29
0 Defined   Cross-reference of procedures   References

0     491   PRINT-DETAIL . . . . . . . . .  P608 P644 P695 P710 P723 P737 P751 P765 P779 P793 P807 P816 P835 P849 P863 P870
                                            P887 P909
      921   QUAL-EXIT
      871   QUAL-SECTION-1 . . . . . . . .  873 876 892 920
      910   QUAL-SECTION-2 . . . . . . . .  874 891 894 915
      587   SECT-OBNC2M-001
      484   TERMINATE-CALL
      482   TERMINATE-CCVS
      819   TEST-10A . . . . . . . . . . .  A704 G809
      810   TEST-10B . . . . . . . . . . .  G820
      821   TEST-10C . . . . . . . . . . .  T704
      824   TEST-11A . . . . . . . . . . .  A704 G818
      826   TEST-11B . . . . . . . . . . .  G825
      831   TEST-11C . . . . . . . . . . .  T704
      838   TEST-12A . . . . . . . . . . .  G844
      843   TEST-12B . . . . . . . . . . .  A705 G837
      845   TEST-12C . . . . . . . . . . .  T705
      857   TEST-13A . . . . . . . . . . .  A705 G851
      859   TEST-13B . . . . . . . . . . .  T705
      852   TEST-13C . . . . . . . . . . .  G858
      712   TEST-3A. . . . . . . . . . . .  A701 G706
      714   TEST-3B. . . . . . . . . . . .  G713
      719   TEST-3C. . . . . . . . . . . .  T701
      726   TEST-4A. . . . . . . . . . . .  A701 G725
      728   TEST-4B. . . . . . . . . . . .  G727
      733   TEST-4C. . . . . . . . . . . .  T701
      743   TEST-5A. . . . . . . . . . . .  A702 G739
      740   TEST-5B. . . . . . . . . . . .  T702
      745   TEST-5C. . . . . . . . . . . .  G744
      759   TEST-6A. . . . . . . . . . . .  A702 G753
      754   TEST-6B. . . . . . . . . . . .  G760
      761   TEST-6C. . . . . . . . . . . .  T702
      771   TEST-7A. . . . . . . . . . . .  A702 G767
      768   TEST-7B. . . . . . . . . . . .  T703
      773   TEST-7C. . . . . . . . . . . .  G772
      787   TEST-8A. . . . . . . . . . . .  G783
      782   TEST-8B. . . . . . . . . . . .  A703 G781
      784   TEST-8C. . . . . . . . . . . .  T703
      801   TEST-9A. . . . . . . . . . . .  A703 G795
      796   TEST-9B. . . . . . . . . . . .  G802
      803   TEST-9C. . . . . . . . . . . .  T704
      545   WRITE-LINE . . . . . . . . . .  P495 P496 P504 P505 P506 P507 P509 P510 P511 P513 P515 P524 P532 P538 P543 P544
                                            P567 P571 P573 P582
      557   WRT-LN . . . . . . . . . . . .  P551 P552 P553 P556 P561
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    30
0 Defined   Cross-reference of programs     References

        3   OBNC2M
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBNC2M    Date 06/04/2022  Time 11:59:55   Page    31
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    700  IGYPS2015-I   The paragraph or section prior to paragraph or section "ALTER-TEST-3" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program OBNC2M:
 *    Source records = 925
 *    Data Division statements = 338
 *    Procedure Division statements = 336
 *    Generated COBOL statements = 0
 *    Program complexity factor = 344
0End of compilation 1,  program OBNC2M,  highest severity 0.
0Return code 0
