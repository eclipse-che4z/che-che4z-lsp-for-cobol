1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:37   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:37   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1174.2
   000002         000200 PROGRAM-ID.                                                      NC1174.2
   000003         000300     NC117A.                                                      NC1174.2
   000004         000500*                                                              *  NC1174.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1174.2
   000006         000700*                                                              *  NC1174.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1174.2
   000008         000900*                                                              *  NC1174.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1174.2
   000010         001100*                                                              *  NC1174.2
   000011         001300*                                                              *  NC1174.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1174.2
   000013         001500*                                                              *  NC1174.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1174.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1174.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1174.2
   000017         001900*                                                              *  NC1174.2
   000018         002100*                                                                 NC1174.2
   000019         002200*      PROGRAM NC117A TESTS THE USE OF THE "SIGN" CLAUSE USING    NC1174.2
   000020         002300*      THE "DIVIDE" STATEMENT.  ALL COMBINATIONS OF THE "SIGN"    NC1174.2
   000021         002400*      CLAUSE PHRASES ARE TESTED USING DATA ITEMS OF              NC1174.2
   000022         002500*      LENGTHS.                                                   NC1174.2
   000023         002600*                                                                 NC1174.2
   000024         002700*                                                                 NC1174.2
   000025         002800                                                                  NC1174.2
   000026         002900                                                                  NC1174.2
   000027         003000 ENVIRONMENT DIVISION.                                            NC1174.2
   000028         003100 CONFIGURATION SECTION.                                           NC1174.2
   000029         003200 SOURCE-COMPUTER.                                                 NC1174.2
   000030         003300     XXXXX082.                                                    NC1174.2
   000031         003400 OBJECT-COMPUTER.                                                 NC1174.2
   000032         003500     XXXXX083.                                                    NC1174.2
   000033         003600 INPUT-OUTPUT SECTION.                                            NC1174.2
   000034         003700 FILE-CONTROL.                                                    NC1174.2
   000035         003800     SELECT PRINT-FILE ASSIGN TO                                  NC1174.2 39
   000036         003900     XXXXX055.                                                    NC1174.2
   000037         004000 DATA DIVISION.                                                   NC1174.2
   000038         004100 FILE SECTION.                                                    NC1174.2
   000039         004200 FD  PRINT-FILE.                                                  NC1174.2

 ==000039==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000040         004300 01  PRINT-REC PICTURE X(120).                                    NC1174.2
   000041         004400 01  DUMMY-RECORD PICTURE X(120).                                 NC1174.2
   000042         004500 WORKING-STORAGE SECTION.                                         NC1174.2
   000043         004600 77  WRK-DS-LS-18V00                PICTURE S9(18)                NC1174.2
   000044         004700           SIGN IS LEADING SEPARATE CHARACTER.                    NC1174.2
   000045         004800 77  A06THREES-DS-LS-03V03          PICTURE S999V999 VALUE 333.333NC1174.2
   000046         004900           SIGN IS LEADING.                                       NC1174.2
   000047         005000 77  WRK-DS-TS-06V06                PICTURE S9(6)V9(6)            NC1174.2
   000048         005100           SIGN IS TRAILING SEPARATE CHARACTER.                   NC1174.2
   000049         005200 77  WRK-DS-TS-12V00-S-S REDEFINES WRK-DS-TS-06V06 PICTURE S9(12) NC1174.2 47
   000050         005300           SIGN TRAILING SEPARATE.                                NC1174.2
   000051         005400 77  A08TWOS-DS-02V06            PICTURE S99V9(6) VALUE 22.222222.NC1174.2
   000052         005500 77  WRK-DS-10V00                PICTURE S9(10).                  NC1174.2
   000053         005600 77  WRK-XN-00001                PICTURE X.                       NC1174.2
   000054         005700 77  A10ONES-DS-T-10V00            PICTURE S9(10)                 NC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800         SIGN IS TRAILING                                         NC1174.2
   000056         005900                                 VALUE 1111111111.                NC1174.2
   000057         006000 77  A12THREES-DS-LS-06V06          PICTURE S9(6)V9(6)            NC1174.2
   000058         006100             SIGN IS LEADING SEPARATE                             NC1174.2
   000059         006200                                 VALUE 333333.333333.             NC1174.2
   000060         006300 77  WRK-DS-02V00                PICTURE S99.                     NC1174.2
   000061         006400 77  AZERO-DS-LS-05V05              PICTURE S9(5)V9(5) VALUE ZERO NC1174.2 IMP
   000062         006500           SIGN IS LEADING SEPARATE CHARACTER.                    NC1174.2
   000063         006600 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1174.2
   000064         006700 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC1174.2 63
   000065         006800 77  A05ONES-DS-LS-00V05            PICTURE SV9(5) VALUE .11111   NC1174.2
   000066         006900           SIGN IS LEADING SEPARATE CHARACTER.                    NC1174.2
   000067         007000 77  A12ONES-DS-12V00            PICTURE S9(12)                   NC1174.2
   000068         007100                                 VALUE 111111111111.              NC1174.2
   000069         007200 77  A01ONE-DS-TS-P0801            PICTURE SP(8)9 VALUE .000000001NC1174.2
   000070         007300            SIGN IS TRAILING SEPARATE.                            NC1174.2
   000071         007400 77  WRK-DS-T-09V08                PICTURE S9(9)V9(8)             NC1174.2
   000072         007500           SIGN IS TRAILING.                                      NC1174.2
   000073         007600 77  WKR-DS-T-17V00-S REDEFINES WRK-DS-T-09V08 PICTURE S9(17)     NC1174.2 71
   000074         007700         SIGN TRAILING.                                           NC1174.2
   000075         007800 77  A18ONES-DS-18V00            PICTURE S9(18)                   NC1174.2
   000076         007900                                 VALUE 111111111111111111.        NC1174.2
   000077         008000 77  WRK-DS-LS-0201P                PICTURE S99P                  NC1174.2
   000078         008100            SIGN IS LEADING SEPARATE.                             NC1174.2
   000079         008200 77  WRK-CS-18V00                PICTURE S9(18) COMPUTATIONAL.    NC1174.2
   000080         008300 77  WRK-DU-18V00                PICTURE 9(18).                   NC1174.2
   000081         008400 77  A99-CS-02V00                PICTURE S99 COMPUTATIONAL        NC1174.2
   000082         008500                                 VALUE 99.                        NC1174.2
   000083         008600 77  A01ONE-CS-00V01             PICTURE SV9 COMPUTATIONAL        NC1174.2
   000084         008700                                 VALUE .1.                        NC1174.2
   000085         008800 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC1174.2
   000086         008900 77  WRK-DS-TS-12V00-S           PICTURE S9(12)                   NC1174.2
   000087         009000             SIGN IS TRAILING SEPARATE CHARACTER.                 NC1174.2
   000088         009100 77  WRK-DS-LS-01V00             PICTURE S9 LEADING SEPARATE.     NC1174.2
   000089         009200 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC1174.2
   000090         009300 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC1174.2
   000091         009400             LEADING SEPARATE                                     NC1174.2
   000092         009500                                 VALUE 111111111.111111111.       NC1174.2
   000093         009600 77  A02TWOS-DU-02V00            PICTURE 99  VALUE 22.            NC1174.2
   000094         009700 77  WRK-DS-05V00                PICTURE S9(5).                   NC1174.2
   000095         009800 77  A02TWOS-DS-03V02            PICTURE S999V99 VALUE +022.00.   NC1174.2
   000096         009900 77  WRK-CS-02V02                PICTURE S99V99  COMPUTATIONAL.   NC1174.2
   000097         010000 77  A990-DS-0201P               PICTURE S99P   VALUE +990.       NC1174.2
   000098         010100 77  XRAY                        PICTURE X.                       NC1174.2
   000099         010200 77  A01ONES-CS-18V00   PICTURE S9(18) COMPUTATIONAL              NC1174.2
   000100         010300             VALUE +000000000000000001.                           NC1174.2
   000101         010400 77  A02THREES-CS-18V00 PICTURE S9(18) COMPUTATIONAL              NC1174.2
   000102         010500             VALUE -000000000000000033.                           NC1174.2
   000103         010600 77  A18SIXES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1174.2
   000104         010700             VALUE 666666666666666666.                            NC1174.2
   000105         010800 77  A16NINES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1174.2
   000106         010900             VALUE 009999999999999999.                            NC1174.2
   000107         011000 77  A14TWOS-CU-18V00   PICTURE 9(18) COMPUTATIONAL               NC1174.2
   000108         011100             VALUE 000022222222222222.                            NC1174.2
   000109         011200 01  MULTIPLY-DATA LEADING SEPARATE.                              NC1174.2
   000110         011300     02 MULT1                           PICTURE IS 999V99         NC1174.2
   000111         011400     VALUE IS 80.12.                                              NC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 MULT2                           PICTURE IS 999V999.       NC1174.2
   000113         011600     02 MULT3                           PICTURE IS $$99.99.       NC1174.2
   000114         011700     02 MULT4                           PICTURE IS S99            NC1174.2
   000115         011800     VALUE IS -56.                                                NC1174.2
   000116         011900     02 MULT5                           PICTURE IS 9 VALUE IS 4.  NC1174.2
   000117         012000     02 MULT6                           PICTURE IS 99 VALUE IS    NC1174.2
   000118         012100     20.                                                          NC1174.2
   000119         012200 01  DIVIDE-DATA TRAILING SEPARATE.                               NC1174.2
   000120         012300     02 DIV1                            PICTURE IS 9(4)V99        NC1174.2
   000121         012400     VALUE IS 1620.36.                                            NC1174.2
   000122         012500     02 DIV2                            PICTURE IS 99V9           NC1174.2
   000123         012600     VALUE IS 44.1.                                               NC1174.2
   000124         012700     02 DIV3                            PICTURE IS 9(4)V9         NC1174.2
   000125         012800     VALUE IS 1661.7.                                             NC1174.2
   000126         012900     02 DIV4                            PICTURE IS S9V999         NC1174.2
   000127         013000     VALUE IS -9.642.                                             NC1174.2
   000128         013100     02 SIG-02LEVEL-1.                                            NC1174.2
   000129         013200     03 DIV5                            PICTURE IS V99            NC1174.2
   000130         013300     VALUE IS .82.                                                NC1174.2
   000131         013400     03 DIV6                            PICTURE IS 9 VALUE IS 0.  NC1174.2
   000132         013500     03 DIV7                            PICTURE IS 9V9            NC1174.2
   000133         013600     VALUE IS 9.6.                                                NC1174.2
   000134         013700 01  SIG-DATA-2.                                                  NC1174.2
   000135         013800     02 DIV8                            PICTURE IS 99V9.          NC1174.2
   000136         013900     02 DIV9                            PICTURE IS ZZ,ZZZ.9.      NC1174.2
   000137         014000     02 DIV10                           PICTURE IS V999.          NC1174.2
   000138         014100 01  TEST-RESULTS.                                                NC1174.2
   000139         014200     02 FILLER                   PIC X      VALUE SPACE.          NC1174.2 IMP
   000140         014300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1174.2 IMP
   000141         014400     02 FILLER                   PIC X      VALUE SPACE.          NC1174.2 IMP
   000142         014500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1174.2 IMP
   000143         014600     02 FILLER                   PIC X      VALUE SPACE.          NC1174.2 IMP
   000144         014700     02  PAR-NAME.                                                NC1174.2
   000145         014800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1174.2 IMP
   000146         014900       03  PARDOT-X              PIC X      VALUE SPACE.          NC1174.2 IMP
   000147         015000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1174.2 IMP
   000148         015100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1174.2 IMP
   000149         015200     02 RE-MARK                  PIC X(61).                       NC1174.2
   000150         015300 01  TEST-COMPUTED.                                               NC1174.2
   000151         015400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1174.2 IMP
   000152         015500     02 FILLER                   PIC X(17)  VALUE                 NC1174.2
   000153         015600            "       COMPUTED=".                                   NC1174.2
   000154         015700     02 COMPUTED-X.                                               NC1174.2
   000155         015800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1174.2 IMP
   000156         015900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1174.2 155
   000157         016000                                 PIC -9(9).9(9).                  NC1174.2
   000158         016100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1174.2 155
   000159         016200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1174.2 155
   000160         016300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1174.2 155
   000161         016400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1174.2 155
   000162         016500         04 COMPUTED-18V0                    PIC -9(18).          NC1174.2
   000163         016600         04 FILLER                           PIC X.               NC1174.2
   000164         016700     03 FILLER PIC X(50) VALUE SPACE.                             NC1174.2 IMP
   000165         016800 01  TEST-CORRECT.                                                NC1174.2
   000166         016900     02 FILLER PIC X(30) VALUE SPACE.                             NC1174.2 IMP
   000167         017000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1174.2
   000168         017100     02 CORRECT-X.                                                NC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1174.2 IMP
   000170         017300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1174.2 169
   000171         017400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1174.2 169
   000172         017500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1174.2 169
   000173         017600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1174.2 169
   000174         017700     03      CR-18V0 REDEFINES CORRECT-A.                         NC1174.2 169
   000175         017800         04 CORRECT-18V0                     PIC -9(18).          NC1174.2
   000176         017900         04 FILLER                           PIC X.               NC1174.2
   000177         018000     03 FILLER PIC X(2) VALUE SPACE.                              NC1174.2 IMP
   000178         018100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1174.2 IMP
   000179         018200 01  CCVS-C-1.                                                    NC1174.2
   000180         018300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1174.2
   000181         018400-    "SS  PARAGRAPH-NAME                                          NC1174.2
   000182         018500-    "       REMARKS".                                            NC1174.2
   000183         018600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1174.2 IMP
   000184         018700 01  CCVS-C-2.                                                    NC1174.2
   000185         018800     02 FILLER                     PIC X        VALUE SPACE.      NC1174.2 IMP
   000186         018900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1174.2
   000187         019000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1174.2 IMP
   000188         019100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1174.2
   000189         019200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1174.2 IMP
   000190         019300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1174.2 IMP
   000191         019400 01  REC-CT                        PIC 99       VALUE ZERO.       NC1174.2 IMP
   000192         019500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1174.2 IMP
   000193         019600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1174.2 IMP
   000194         019700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1174.2 IMP
   000195         019800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1174.2 IMP
   000196         019900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1174.2 IMP
   000197         020000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1174.2 IMP
   000198         020100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1174.2 IMP
   000199         020200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1174.2 IMP
   000200         020300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1174.2 IMP
   000201         020400 01  CCVS-H-1.                                                    NC1174.2
   000202         020500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1174.2 IMP
   000203         020600     02  FILLER                    PIC X(42)    VALUE             NC1174.2
   000204         020700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1174.2
   000205         020800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1174.2 IMP
   000206         020900 01  CCVS-H-2A.                                                   NC1174.2
   000207         021000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1174.2 IMP
   000208         021100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1174.2
   000209         021200   02  FILLER                        PIC XXXX   VALUE             NC1174.2
   000210         021300     "4.2 ".                                                      NC1174.2
   000211         021400   02  FILLER                        PIC X(28)  VALUE             NC1174.2
   000212         021500            " COPY - NOT FOR DISTRIBUTION".                       NC1174.2
   000213         021600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1174.2 IMP
   000214         021700                                                                  NC1174.2
   000215         021800 01  CCVS-H-2B.                                                   NC1174.2
   000216         021900   02  FILLER                        PIC X(15)  VALUE             NC1174.2
   000217         022000            "TEST RESULT OF ".                                    NC1174.2
   000218         022100   02  TEST-ID                       PIC X(9).                    NC1174.2
   000219         022200   02  FILLER                        PIC X(4)   VALUE             NC1174.2
   000220         022300            " IN ".                                               NC1174.2
   000221         022400   02  FILLER                        PIC X(12)  VALUE             NC1174.2
   000222         022500     " HIGH       ".                                              NC1174.2
   000223         022600   02  FILLER                        PIC X(22)  VALUE             NC1174.2
   000224         022700            " LEVEL VALIDATION FOR ".                             NC1174.2
   000225         022800   02  FILLER                        PIC X(58)  VALUE             NC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1174.2
   000227         023000 01  CCVS-H-3.                                                    NC1174.2
   000228         023100     02  FILLER                      PIC X(34)  VALUE             NC1174.2
   000229         023200            " FOR OFFICIAL USE ONLY    ".                         NC1174.2
   000230         023300     02  FILLER                      PIC X(58)  VALUE             NC1174.2
   000231         023400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1174.2
   000232         023500     02  FILLER                      PIC X(28)  VALUE             NC1174.2
   000233         023600            "  COPYRIGHT   1985 ".                                NC1174.2
   000234         023700 01  CCVS-E-1.                                                    NC1174.2
   000235         023800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1174.2 IMP
   000236         023900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1174.2
   000237         024000     02 ID-AGAIN                     PIC X(9).                    NC1174.2
   000238         024100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1174.2 IMP
   000239         024200 01  CCVS-E-2.                                                    NC1174.2
   000240         024300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1174.2 IMP
   000241         024400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1174.2 IMP
   000242         024500     02 CCVS-E-2-2.                                               NC1174.2
   000243         024600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1174.2 IMP
   000244         024700         03 FILLER                   PIC X      VALUE SPACE.      NC1174.2 IMP
   000245         024800         03 ENDER-DESC               PIC X(44)  VALUE             NC1174.2
   000246         024900            "ERRORS ENCOUNTERED".                                 NC1174.2
   000247         025000 01  CCVS-E-3.                                                    NC1174.2
   000248         025100     02  FILLER                      PIC X(22)  VALUE             NC1174.2
   000249         025200            " FOR OFFICIAL USE ONLY".                             NC1174.2
   000250         025300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1174.2 IMP
   000251         025400     02  FILLER                      PIC X(58)  VALUE             NC1174.2
   000252         025500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1174.2
   000253         025600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1174.2 IMP
   000254         025700     02 FILLER                       PIC X(15)  VALUE             NC1174.2
   000255         025800             " COPYRIGHT 1985".                                   NC1174.2
   000256         025900 01  CCVS-E-4.                                                    NC1174.2
   000257         026000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1174.2 IMP
   000258         026100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1174.2
   000259         026200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1174.2 IMP
   000260         026300     02 FILLER                       PIC X(40)  VALUE             NC1174.2
   000261         026400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1174.2
   000262         026500 01  XXINFO.                                                      NC1174.2
   000263         026600     02 FILLER                       PIC X(19)  VALUE             NC1174.2
   000264         026700            "*** INFORMATION ***".                                NC1174.2
   000265         026800     02 INFO-TEXT.                                                NC1174.2
   000266         026900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1174.2 IMP
   000267         027000       04 XXCOMPUTED                 PIC X(20).                   NC1174.2
   000268         027100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1174.2 IMP
   000269         027200       04 XXCORRECT                  PIC X(20).                   NC1174.2
   000270         027300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1174.2
   000271         027400 01  HYPHEN-LINE.                                                 NC1174.2
   000272         027500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1174.2 IMP
   000273         027600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1174.2
   000274         027700-    "*****************************************".                 NC1174.2
   000275         027800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1174.2
   000276         027900-    "******************************".                            NC1174.2
   000277         028000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1174.2
   000278         028100     "NC117A".                                                    NC1174.2
   000279         028200 PROCEDURE DIVISION.                                              NC1174.2
   000280         028300 CCVS1 SECTION.                                                   NC1174.2
   000281         028400 OPEN-FILES.                                                      NC1174.2
   000282         028500     OPEN     OUTPUT PRINT-FILE.                                  NC1174.2 39
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1174.2 277 218 277 237
   000284         028700     MOVE    SPACE TO TEST-RESULTS.                               NC1174.2 IMP 138
   000285         028800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1174.2 310 315
   000286         028900     GO TO CCVS1-EXIT.                                            NC1174.2 397
   000287         029000 CLOSE-FILES.                                                     NC1174.2
   000288         029100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1174.2 319 340 39
   000289         029200 TERMINATE-CCVS.                                                  NC1174.2
   000290         029300     EXIT PROGRAM.                                                NC1174.2
   000291         029400 TERMINATE-CALL.                                                  NC1174.2
   000292         029500     STOP     RUN.                                                NC1174.2
   000293         029600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1174.2 142 194
   000294         029700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1174.2 142 195
   000295         029800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1174.2 142 193
   000296         029900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1174.2 142 192
   000297         030000     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1174.2 149
   000298         030100 PRINT-DETAIL.                                                    NC1174.2
   000299         030200     IF REC-CT NOT EQUAL TO ZERO                                  NC1174.2 191 IMP
   000300      1  030300             MOVE "." TO PARDOT-X                                 NC1174.2 146
   000301      1  030400             MOVE REC-CT TO DOTVALUE.                             NC1174.2 191 147
   000302         030500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1174.2 138 40 352
   000303         030600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1174.2 142 352
   000304      1  030700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1174.2 373 387
   000305      1  030800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1174.2 388 396
   000306         030900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1174.2 IMP 142 IMP 154
   000307         031000     MOVE SPACE TO CORRECT-X.                                     NC1174.2 IMP 168
   000308         031100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1174.2 191 IMP IMP 144
   000309         031200     MOVE     SPACE TO RE-MARK.                                   NC1174.2 IMP 149
   000310         031300 HEAD-ROUTINE.                                                    NC1174.2
   000311         031400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1174.2 201 41 352
   000312         031500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1174.2 206 41 352
   000313         031600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1174.2 215 41 352
   000314         031700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1174.2 227 41 352
   000315         031800 COLUMN-NAMES-ROUTINE.                                            NC1174.2
   000316         031900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1174.2 179 41 352
   000317         032000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1174.2 184 41 352
   000318         032100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1174.2 271 41 352
   000319         032200 END-ROUTINE.                                                     NC1174.2
   000320         032300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1174.2 271 41 352
   000321         032400 END-RTN-EXIT.                                                    NC1174.2
   000322         032500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1174.2 234 41 352
   000323         032600 END-ROUTINE-1.                                                   NC1174.2
   000324         032700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1174.2 193 197 194
   000325         032800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1174.2 197 192 197
   000326         032900      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1174.2 195 197
   000327         033000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1174.2
   000328         033100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1174.2 195 257
   000329         033200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1174.2 197 259
   000330         033300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1174.2 256 242
   000331         033400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1174.2 239 41 352
   000332         033500  END-ROUTINE-12.                                                 NC1174.2
   000333         033600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1174.2 245
   000334         033700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1174.2 193 IMP
   000335      1  033800         MOVE "NO " TO ERROR-TOTAL                                NC1174.2 243
   000336         033900         ELSE                                                     NC1174.2
   000337      1  034000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1174.2 193 243
   000338         034100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1174.2 239 41
   000339         034200     PERFORM WRITE-LINE.                                          NC1174.2 352
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300 END-ROUTINE-13.                                                  NC1174.2
   000341         034400     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1174.2 192 IMP
   000342      1  034500         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1174.2 243
   000343      1  034600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1174.2 192 243
   000344         034700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1174.2 245
   000345         034800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1174.2 239 41 352
   000346         034900      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1174.2 194 IMP
   000347      1  035000          MOVE "NO " TO ERROR-TOTAL                               NC1174.2 243
   000348      1  035100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1174.2 194 243
   000349         035200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1174.2 245
   000350         035300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1174.2 239 41 352
   000351         035400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1174.2 247 41 352
   000352         035500 WRITE-LINE.                                                      NC1174.2
   000353         035600     ADD 1 TO RECORD-COUNT.                                       NC1174.2 199
   000354         035700     IF RECORD-COUNT GREATER 42                                   NC1174.2 199
   000355      1  035800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1174.2 41 198
   000356      1  035900         MOVE SPACE TO DUMMY-RECORD                               NC1174.2 IMP 41
   000357      1  036000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1174.2 41
   000358      1  036100         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1174.2 201 41 368
   000359      1  036200         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1174.2 206 41 368
   000360      1  036300         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1174.2 215 41 368
   000361      1  036400         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1174.2 227 41 368
   000362      1  036500         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1174.2 179 41 368
   000363      1  036600         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1174.2 184 41 368
   000364      1  036700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1174.2 271 41 368
   000365      1  036800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1174.2 198 41
   000366      1  036900         MOVE ZERO TO RECORD-COUNT.                               NC1174.2 IMP 199
   000367         037000     PERFORM WRT-LN.                                              NC1174.2 368
   000368         037100 WRT-LN.                                                          NC1174.2
   000369         037200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1174.2 41
   000370         037300     MOVE SPACE TO DUMMY-RECORD.                                  NC1174.2 IMP 41
   000371         037400 BLANK-LINE-PRINT.                                                NC1174.2
   000372         037500     PERFORM WRT-LN.                                              NC1174.2 368
   000373         037600 FAIL-ROUTINE.                                                    NC1174.2
   000374         037700     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1174.2 154 IMP
   000375      1  037800            GO TO FAIL-ROUTINE-WRITE.                             NC1174.2 382
   000376         037900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1174.2 168 IMP 382
   000377         038000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1174.2 200 270
   000378         038100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1174.2 265
   000379         038200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1174.2 262 41 352
   000380         038300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1174.2 IMP 270
   000381         038400     GO TO  FAIL-ROUTINE-EX.                                      NC1174.2 387
   000382         038500 FAIL-ROUTINE-WRITE.                                              NC1174.2
   000383         038600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1174.2 150 40 352
   000384         038700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1174.2 200 178
   000385         038800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1174.2 165 40 352
   000386         038900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1174.2 IMP 178
   000387         039000 FAIL-ROUTINE-EX. EXIT.                                           NC1174.2
   000388         039100 BAIL-OUT.                                                        NC1174.2
   000389         039200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1174.2 155 IMP 391
   000390         039300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1174.2 169 IMP 396
   000391         039400 BAIL-OUT-WRITE.                                                  NC1174.2
   000392         039500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1174.2 169 269 155 267
   000393         039600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1174.2 200 270
   000394         039700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1174.2 262 41 352
   000395         039800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1174.2 IMP 270
   000396         039900 BAIL-OUT-EX. EXIT.                                               NC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 CCVS1-EXIT.                                                      NC1174.2
   000398         040100     EXIT.                                                        NC1174.2
   000399         040200 SECT-NC117A-001 SECTION.                                         NC1174.2
   000400         040300 SIG-INIT-GF-1.                                                   NC1174.2
   000401         040400     MOVE   "DIVIDE INTO"  TO FEATURE.                            NC1174.2 140
   000402         040500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000403         040600     MOVE    1620.36 TO DIV1.                                     NC1174.2 120
   000404         040700 SIG-TEST-GF-1-0.                                                 NC1174.2
   000405         040800     DIVIDE   64.3 INTO DIV1.                                     NC1174.2 120
   000406         040900 SIG-TEST-GF-1-1.                                                 NC1174.2
   000407         041000     IF       DIV1 EQUAL TO 25.2                                  NC1174.2 120
   000408      1  041100              PERFORM PASS                                        NC1174.2 294
   000409         041200              ELSE                                                NC1174.2
   000410      1  041300              GO TO SIG-FAIL-GF-1.                                NC1174.2 415
   000411         041400     GO TO    SIG-WRITE-GF-1.                                     NC1174.2 419
   000412         041500 SIG-DELETE-GF-1.                                                 NC1174.2
   000413         041600     PERFORM  DE-LETE.                                            NC1174.2 296
   000414         041700     GO TO    SIG-WRITE-GF-1.                                     NC1174.2 419
   000415         041800 SIG-FAIL-GF-1.                                                   NC1174.2
   000416         041900     PERFORM  FAIL.                                               NC1174.2 295
   000417         042000     MOVE     DIV1 TO COMPUTED-N.                                 NC1174.2 120 156
   000418         042100     MOVE     +25.2 TO CORRECT-N.                                 NC1174.2 170
   000419         042200 SIG-WRITE-GF-1.                                                  NC1174.2
   000420         042300     MOVE "SIG-TEST-GF-1" TO PAR-NAME.                            NC1174.2 144
   000421         042400     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000422         042500 SIG-INIT-GF-2.                                                   NC1174.2
   000423         042600     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000424         042700     MOVE    44.1 TO DIV2.                                        NC1174.2 122
   000425         042800     MOVE  1661.7 TO DIV3.                                        NC1174.2 124
   000426         042900 SIG-TEST-GF-2.                                                   NC1174.2
   000427         043000     DIVIDE   DIV2 INTO DIV3 ROUNDED.                             NC1174.2 122 124
   000428         043100     IF       DIV3 EQUAL TO 37.7                                  NC1174.2 124
   000429      1  043200              PERFORM PASS                                        NC1174.2 294
   000430         043300              ELSE                                                NC1174.2
   000431      1  043400              GO TO SIG-FAIL-GF-2.                                NC1174.2 436
   000432         043500     GO TO    SIG-WRITE-GF-2.                                     NC1174.2 440
   000433         043600 SIG-DELETE-GF-2.                                                 NC1174.2
   000434         043700     PERFORM  DE-LETE.                                            NC1174.2 296
   000435         043800     GO TO    SIG-WRITE-GF-2.                                     NC1174.2 440
   000436         043900 SIG-FAIL-GF-2.                                                   NC1174.2
   000437         044000     PERFORM  FAIL.                                               NC1174.2 295
   000438         044100     MOVE     DIV3 TO COMPUTED-N.                                 NC1174.2 124 156
   000439         044200     MOVE     +37.7 TO CORRECT-N.                                 NC1174.2 170
   000440         044300 SIG-WRITE-GF-2.                                                  NC1174.2
   000441         044400     MOVE "SIG-TEST-GF-2 " TO PAR-NAME.                           NC1174.2 144
   000442         044500     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000443         044600 SIG-INIT-GF-3.                                                   NC1174.2
   000444         044700     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000445         044800     MOVE -9.642  TO DIV4.                                        NC1174.2 126
   000446         044900     MOVE    .82  TO DIV5.                                        NC1174.2 129
   000447         045000     MOVE     "A" TO XRAY.                                        NC1174.2 98
   000448         045100 SIG-TEST-GF-3-0.                                                 NC1174.2
   000449         045200     DIVIDE   DIV5 INTO DIV4 ON SIZE ERROR                        NC1174.2 129 126
   000450      1  045300              MOVE "M" TO XRAY.                                   NC1174.2 98
   000451         045400 SIG-TEST-GF-3-1.                                                 NC1174.2
   000452         045500     IF       XRAY EQUAL TO "M"                                   NC1174.2 98
   000453      1  045600              PERFORM PASS                                        NC1174.2 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700              ELSE                                                NC1174.2
   000455      1  045800              GO TO SIG-FAIL-GF-3.                                NC1174.2 460
   000456         045900     GO TO    SIG-WRITE-GF-3.                                     NC1174.2 464
   000457         046000 SIG-DELETE-GF-3-1.                                               NC1174.2
   000458         046100     PERFORM  DE-LETE.                                            NC1174.2 296
   000459         046200     GO TO    SIG-WRITE-GF-3.                                     NC1174.2 464
   000460         046300 SIG-FAIL-GF-3.                                                   NC1174.2
   000461         046400     MOVE     DIV4 TO COMPUTED-N.                                 NC1174.2 126 156
   000462         046500     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1174.2 149
   000463         046600     PERFORM  FAIL.                                               NC1174.2 295
   000464         046700 SIG-WRITE-GF-3.                                                  NC1174.2
   000465         046800     MOVE "SIG-TEST-GF-3-1" TO PAR-NAME.                          NC1174.2 144
   000466         046900     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000467         047000 SIG-TEST-GF-3-2.                                                 NC1174.2
   000468         047100     IF       DIV4 EQUAL TO -9.642                                NC1174.2 126
   000469      1  047200              PERFORM PASS                                        NC1174.2 294
   000470         047300              ELSE                                                NC1174.2
   000471      1  047400              GO TO SIG-FAIL-GF-3-2.                              NC1174.2 476
   000472         047500     GO TO    SIG-WRITE-GF-3-2.                                   NC1174.2 481
   000473         047600 SIG-DELETE-GF-3-2.                                               NC1174.2
   000474         047700     PERFORM  DE-LETE.                                            NC1174.2 296
   000475         047800     GO TO    SIG-WRITE-GF-3-2.                                   NC1174.2 481
   000476         047900 SIG-FAIL-GF-3-2.                                                 NC1174.2
   000477         048000     PERFORM  FAIL.                                               NC1174.2 295
   000478         048100     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1174.2 149
   000479         048200     MOVE     DIV4 TO COMPUTED-N.                                 NC1174.2 126 156
   000480         048300     MOVE     -9.642 TO CORRECT-N.                                NC1174.2 170
   000481         048400 SIG-WRITE-GF-3-2.                                                NC1174.2
   000482         048500     MOVE "SIG-TEST-GF-3-2 " TO PAR-NAME.                         NC1174.2 144
   000483         048600     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000484         048700 SIG-INIT-GF-4.                                                   NC1174.2
   000485         048800     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000486         048900     MOVE   44.1  TO DIV2.                                        NC1174.2 122
   000487         049000     MOVE      0  TO DIV6.                                        NC1174.2 131
   000488         049100     MOVE     "A" TO XRAY.                                        NC1174.2 98
   000489         049200 SIG-TEST-GF-4-1-0.                                               NC1174.2
   000490         049300     DIVIDE   DIV6 INTO DIV2 ON SIZE ERROR                        NC1174.2 131 122
   000491      1  049400              MOVE "N" TO XRAY.                                   NC1174.2 98
   000492         049500 SIG-TEST-GF-4-1-1.                                               NC1174.2
   000493         049600     IF       XRAY EQUAL TO "N"                                   NC1174.2 98
   000494      1  049700              PERFORM PASS                                        NC1174.2 294
   000495         049800              ELSE                                                NC1174.2
   000496      1  049900              GO TO SIG-FAIL-GF-4-1.                              NC1174.2 501
   000497         050000     GO TO    SIG-WRITE-GF-4-1.                                   NC1174.2 505
   000498         050100 SIG-DELETE-GF-4-1.                                               NC1174.2
   000499         050200     PERFORM  DE-LETE.                                            NC1174.2 296
   000500         050300     GO TO    SIG-WRITE-GF-4-1.                                   NC1174.2 505
   000501         050400 SIG-FAIL-GF-4-1.                                                 NC1174.2
   000502         050500     MOVE     DIV2 TO COMPUTED-N.                                 NC1174.2 122 156
   000503         050600     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1174.2 149
   000504         050700     PERFORM  FAIL.                                               NC1174.2 295
   000505         050800 SIG-WRITE-GF-4-1.                                                NC1174.2
   000506         050900     MOVE "SIG-TEST-GF-4-1 " TO PAR-NAME.                         NC1174.2 144
   000507         051000     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000508         051100 SIG-TEST-GF-4-2.                                                 NC1174.2
   000509         051200     IF       DIV2 EQUAL TO 44.1                                  NC1174.2 122
   000510      1  051300              PERFORM PASS                                        NC1174.2 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400              ELSE                                                NC1174.2
   000512      1  051500              GO TO SIG-FAIL-GF-4-2.                              NC1174.2 517
   000513         051600     GO TO    SIG-WRITE-GF-4-2.                                   NC1174.2 522
   000514         051700 SIG-DELETE-GF-4-2.                                               NC1174.2
   000515         051800     PERFORM  DE-LETE.                                            NC1174.2 296
   000516         051900     GO TO    SIG-WRITE-GF-4-2.                                   NC1174.2 522
   000517         052000 SIG-FAIL-GF-4-2.                                                 NC1174.2
   000518         052100     PERFORM  FAIL.                                               NC1174.2 295
   000519         052200     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1174.2 149
   000520         052300     MOVE     DIV2 TO COMPUTED-N.                                 NC1174.2 122 156
   000521         052400     MOVE     +44.1000 TO CORRECT-N.                              NC1174.2 170
   000522         052500 SIG-WRITE-GF-4-2.                                                NC1174.2
   000523         052600     MOVE "SIG-TEST-GF-4-2 " TO PAR-NAME.                         NC1174.2 144
   000524         052700     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000525         052800 SIG-INIT-GF-5.                                                   NC1174.2
   000526         052900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000527         053000     MOVE    9.6  TO DIV7.                                        NC1174.2 132
   000528         053100     MOVE     "A" TO XRAY.                                        NC1174.2 98
   000529         053200 SIG-TEST-GF-5-0.                                                 NC1174.2
   000530         053300     DIVIDE   0.097 INTO DIV7 ROUNDED ON SIZE ERROR               NC1174.2 132
   000531      1  053400              MOVE "N" TO XRAY.                                   NC1174.2 98
   000532         053500 SIG-TEST-GF-5-1.                                                 NC1174.2
   000533         053600     IF       XRAY EQUAL TO "N"                                   NC1174.2 98
   000534      1  053700              PERFORM PASS                                        NC1174.2 294
   000535         053800              ELSE                                                NC1174.2
   000536      1  053900              GO TO SIG-FAIL-GF-5-1.                              NC1174.2 541
   000537         054000     GO TO    SIG-WRITE-GF-5-1.                                   NC1174.2 545
   000538         054100 SIG-DELETE-GF-5-1.                                               NC1174.2
   000539         054200     PERFORM  DE-LETE.                                            NC1174.2 296
   000540         054300     GO TO    SIG-WRITE-GF-5-1.                                   NC1174.2 545
   000541         054400 SIG-FAIL-GF-5-1.                                                 NC1174.2
   000542         054500     MOVE     DIV7 TO COMPUTED-N.                                 NC1174.2 132 156
   000543         054600     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1174.2 149
   000544         054700     PERFORM  FAIL.                                               NC1174.2 295
   000545         054800 SIG-WRITE-GF-5-1.                                                NC1174.2
   000546         054900     MOVE "SIG-TEST-GF-5-1 " TO PAR-NAME.                         NC1174.2 144
   000547         055000     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000548         055100 SIG-TEST-GF-5-2.                                                 NC1174.2
   000549         055200     IF       DIV7 NOT EQUAL TO 9.6                               NC1174.2 132
   000550      1  055300              GO TO SIG-FAIL-GF-5-2.                              NC1174.2 556
   000551         055400     PERFORM  PASS.                                               NC1174.2 294
   000552         055500     GO TO    SIG-WRITE-GF-5-2.                                   NC1174.2 561
   000553         055600 SIG-DELETE-GF-5-2.                                               NC1174.2
   000554         055700     PERFORM  DE-LETE.                                            NC1174.2 296
   000555         055800     GO TO    SIG-WRITE-GF-5-2.                                   NC1174.2 561
   000556         055900 SIG-FAIL-GF-5-2.                                                 NC1174.2
   000557         056000     PERFORM  FAIL.                                               NC1174.2 295
   000558         056100     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1174.2 149
   000559         056200     MOVE     DIV7 TO COMPUTED-N.                                 NC1174.2 132 156
   000560         056300     MOVE     +9.6 TO CORRECT-N.                                  NC1174.2 170
   000561         056400 SIG-WRITE-GF-5-2.                                                NC1174.2
   000562         056500     MOVE "SIG-TEST-GF-5-2 " TO PAR-NAME.                         NC1174.2 144
   000563         056600     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000564         056700 SIG-INIT-GF-11.                                                  NC1174.2
   000565         056800     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000566         056900     MOVE "DIVIDE INTO GIVING" TO FEATURE.                        NC1174.2 140
   000567         057000     MOVE     44.1 TO DIV2.                                       NC1174.2 122
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE     ZERO TO DIV8.                                       NC1174.2 IMP 135
   000569         057200 SIG-TEST-GF-11-0.                                                NC1174.2
   000570         057300     DIVIDE   DIV2 INTO 864.36 GIVING DIV8.                       NC1174.2 122 135
   000571         057400 SIG-TEST-GF-11-1.                                                NC1174.2
   000572         057500     IF       DIV8 EQUAL TO 19.6                                  NC1174.2 135
   000573      1  057600              PERFORM PASS                                        NC1174.2 294
   000574         057700              ELSE                                                NC1174.2
   000575      1  057800              GO TO SIG-FAIL-GF-11.                               NC1174.2 580
   000576         057900     GO TO    SIG-WRITE-GF-11.                                    NC1174.2 584
   000577         058000 SIG-DELETE-GF-11.                                                NC1174.2
   000578         058100     PERFORM  DE-LETE.                                            NC1174.2 296
   000579         058200     GO TO    SIG-WRITE-GF-11.                                    NC1174.2 584
   000580         058300 SIG-FAIL-GF-11.                                                  NC1174.2
   000581         058400     PERFORM  FAIL.                                               NC1174.2 295
   000582         058500     MOVE     DIV8 TO COMPUTED-N.                                 NC1174.2 135 156
   000583         058600     MOVE     +19.6 TO CORRECT-N.                                 NC1174.2 170
   000584         058700 SIG-WRITE-GF-11.                                                 NC1174.2
   000585         058800     MOVE "SIG-TEST-GF-11 " TO PAR-NAME.                          NC1174.2 144
   000586         058900     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000587         059000 SIG-INIT-GF-12.                                                  NC1174.2
   000588         059100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000589         059200     MOVE    1620.36 TO DIV1.                                     NC1174.2 120
   000590         059300     MOVE    ZERO TO DIV9.                                        NC1174.2 IMP 136
   000591         059400 SIG-TEST-GF-12-0.                                                NC1174.2
   000592         059500     DIVIDE   0.533 INTO DIV1 GIVING DIV9 ROUNDED.                NC1174.2 120 136
   000593         059600 SIG-TEST-GF-12-1.                                                NC1174.2
   000594         059700     IF       DIV9 EQUAL TO " 3,040.1"                            NC1174.2 136
   000595      1  059800              PERFORM PASS                                        NC1174.2 294
   000596         059900              ELSE                                                NC1174.2
   000597      1  060000              GO TO SIG-FAIL-GF-12.                               NC1174.2 602
   000598         060100     GO TO    SIG-WRITE-GF-12.                                    NC1174.2 606
   000599         060200 SIG-DELETE-GF-12.                                                NC1174.2
   000600         060300     PERFORM  DE-LETE.                                            NC1174.2 296
   000601         060400     GO TO    SIG-WRITE-GF-12.                                    NC1174.2 606
   000602         060500 SIG-FAIL-GF-12.                                                  NC1174.2
   000603         060600     PERFORM  FAIL.                                               NC1174.2 295
   000604         060700     MOVE     DIV9 TO COMPUTED-A.                                 NC1174.2 136 155
   000605         060800     MOVE " 3,040.1" TO CORRECT-A.                                NC1174.2 169
   000606         060900 SIG-WRITE-GF-12.                                                 NC1174.2
   000607         061000     MOVE "SIG-TEST-GF-12" TO PAR-NAME.                           NC1174.2 144
   000608         061100     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000609         061200 SIG-INIT-GF-13.                                                  NC1174.2
   000610         061300     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000611         061400     MOVE     -9.642 TO DIV4.                                     NC1174.2 126
   000612         061500     MOVE     ZERO TO DIV10.                                      NC1174.2 IMP 137
   000613         061600     MOVE     44.1 TO DIV2.                                       NC1174.2 122
   000614         061700     MOVE     "A"  TO XRAY.                                       NC1174.2 98
   000615         061800 SIG-TEST-GF-13-0.                                                NC1174.2
   000616         061900     DIVIDE   DIV4 INTO DIV2 GIVING DIV10 ON SIZE ERROR           NC1174.2 126 122 137
   000617      1  062000              MOVE "P" TO XRAY.                                   NC1174.2 98
   000618         062100 SIG-TEST-GF-13-1.                                                NC1174.2
   000619         062200     IF       XRAY EQUAL TO "P"                                   NC1174.2 98
   000620      1  062300              PERFORM PASS                                        NC1174.2 294
   000621         062400              ELSE                                                NC1174.2
   000622      1  062500              GO TO SIG-FAIL-GF-13-1.                             NC1174.2 627
   000623         062600     GO TO    SIG-WRITE-GF-13-1.                                  NC1174.2 631
   000624         062700 SIG-DELETE-GF-13-1.                                              NC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     PERFORM  DE-LETE.                                            NC1174.2 296
   000626         062900     GO TO    SIG-WRITE-GF-13-1.                                  NC1174.2 631
   000627         063000 SIG-FAIL-GF-13-1.                                                NC1174.2
   000628         063100     MOVE     DIV10 TO COMPUTED-N.                                NC1174.2 137 156
   000629         063200     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1174.2 149
   000630         063300     PERFORM  FAIL.                                               NC1174.2 295
   000631         063400 SIG-WRITE-GF-13-1.                                               NC1174.2
   000632         063500     MOVE "SIG-TEST-GF-13-1" TO PAR-NAME.                         NC1174.2 144
   000633         063600     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000634         063700 SIG-TEST-GF-13-2.                                                NC1174.2
   000635         063800     IF       DIV10 NOT EQUAL TO ZERO                             NC1174.2 137 IMP
   000636      1  063900              GO TO SIG-FAIL-GF-13-2.                             NC1174.2 642
   000637         064000     PERFORM  PASS.                                               NC1174.2 294
   000638         064100     GO TO    SIG-WRITE-GF-13-2.                                  NC1174.2 647
   000639         064200 SIG-DELETE-GF-13-2.                                              NC1174.2
   000640         064300     PERFORM  DE-LETE.                                            NC1174.2 296
   000641         064400     GO TO    SIG-WRITE-GF-13-2.                                  NC1174.2 647
   000642         064500 SIG-FAIL-GF-13-2.                                                NC1174.2
   000643         064600     PERFORM FAIL.                                                NC1174.2 295
   000644         064700     MOVE    DIV10 TO COMPUTED-N.                                 NC1174.2 137 156
   000645         064800     MOVE    ZERO TO CORRECT-N.                                   NC1174.2 IMP 170
   000646         064900     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1174.2 149
   000647         065000 SIG-WRITE-GF-13-2.                                               NC1174.2
   000648         065100     MOVE "SIG-TEST-GF-13-2" TO PAR-NAME.                         NC1174.2 144
   000649         065200     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000650         065300 SIG-INIT-GF-19.                                                  NC1174.2
   000651         065400     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000652         065500     MOVE     ZERO TO DIV8.                                       NC1174.2 IMP 135
   000653         065600     MOVE     44.1 TO DIV2.                                       NC1174.2 122
   000654         065700     MOVE "DIVIDE BY" TO FEATURE.                                 NC1174.2 140
   000655         065800 SIG-TEST-GF-19.                                                  NC1174.2
   000656         065900     DIVIDE   864.36 BY DIV2 GIVING DIV8.                         NC1174.2 122 135
   000657         066000     IF       DIV8 EQUAL TO 19.6                                  NC1174.2 135
   000658      1  066100              PERFORM PASS                                        NC1174.2 294
   000659         066200              ELSE                                                NC1174.2
   000660      1  066300              GO TO SIG-FAIL-GF-19.                               NC1174.2 665
   000661         066400     GO TO    SIG-WRITE-GF-19.                                    NC1174.2 669
   000662         066500 SIG-DELETE-GF-19.                                                NC1174.2
   000663         066600     PERFORM  DE-LETE.                                            NC1174.2 296
   000664         066700     GO TO    SIG-WRITE-GF-19.                                    NC1174.2 669
   000665         066800 SIG-FAIL-GF-19.                                                  NC1174.2
   000666         066900     PERFORM  FAIL.                                               NC1174.2 295
   000667         067000     MOVE     DIV8 TO COMPUTED-N.                                 NC1174.2 135 156
   000668         067100     MOVE     19.6 TO CORRECT-N.                                  NC1174.2 170
   000669         067200 SIG-WRITE-GF-19.                                                 NC1174.2
   000670         067300     MOVE "SIG-TEST-GF-19" TO PAR-NAME.                           NC1174.2 144
   000671         067400     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000672         067500 SIG-INIT-GF-20.                                                  NC1174.2
   000673         067600     MOVE "DIVIDE BY GIVING" TO FEATURE.                          NC1174.2 140
   000674         067700     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000675         067800     MOVE  1620.36 TO DIV1.                                       NC1174.2 120
   000676         067900     MOVE     ZERO TO DIV9.                                       NC1174.2 IMP 136
   000677         068000 SIG-TEST-GF-20-0.                                                NC1174.2
   000678         068100     DIVIDE   DIV1 BY 0.533 GIVING DIV9 ROUNDED.                  NC1174.2 120 136
   000679         068200 SIG-TEST-GF-20-1.                                                NC1174.2
   000680         068300     IF       DIV9 EQUAL TO " 3,040.1"                            NC1174.2 136
   000681      1  068400              PERFORM PASS                                        NC1174.2 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500              ELSE                                                NC1174.2
   000683      1  068600              GO TO SIG-FAIL-GF-20.                               NC1174.2 688
   000684         068700     GO TO    SIG-WRITE-GF-20.                                    NC1174.2 692
   000685         068800 SIG-DELETE-GF-20.                                                NC1174.2
   000686         068900     PERFORM  DE-LETE.                                            NC1174.2 296
   000687         069000     GO TO    SIG-WRITE-GF-20.                                    NC1174.2 692
   000688         069100 SIG-FAIL-GF-20.                                                  NC1174.2
   000689         069200     PERFORM  FAIL.                                               NC1174.2 295
   000690         069300     MOVE     DIV9 TO COMPUTED-A.                                 NC1174.2 136 155
   000691         069400     MOVE " 3,040.1" TO CORRECT-A.                                NC1174.2 169
   000692         069500 SIG-WRITE-GF-20.                                                 NC1174.2
   000693         069600     MOVE "SIG-TEST-GF-20" TO PAR-NAME.                           NC1174.2 144
   000694         069700     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000695         069800 SIG-INIT-GF-21.                                                  NC1174.2
   000696         069900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000697         070000     MOVE     -9.642 TO DIV4.                                     NC1174.2 126
   000698         070100     MOVE     ZERO TO DIV10.                                      NC1174.2 IMP 137
   000699         070200     MOVE     44.1 TO DIV2.                                       NC1174.2 122
   000700         070300     MOVE     "A"  TO XRAY.                                       NC1174.2 98
   000701         070400 SIG-TEST-GF-21-0.                                                NC1174.2
   000702         070500     DIVIDE   DIV2 BY DIV4 GIVING DIV10 ON SIZE ERROR             NC1174.2 122 126 137
   000703      1  070600              MOVE "P" TO XRAY.                                   NC1174.2 98
   000704         070700 SIG-TEST-GF-21-1.                                                NC1174.2
   000705         070800     IF       XRAY EQUAL TO "P"                                   NC1174.2 98
   000706      1  070900              PERFORM PASS                                        NC1174.2 294
   000707         071000              ELSE                                                NC1174.2
   000708      1  071100              GO TO SIG-FAIL-GF-21-1.                             NC1174.2 713
   000709         071200     GO TO    SIG-WRITE-GF-21-1.                                  NC1174.2 717
   000710         071300 SIG-DELETE-GF-21-1.                                              NC1174.2
   000711         071400     PERFORM  DE-LETE.                                            NC1174.2 296
   000712         071500     GO TO    SIG-WRITE-GF-21-1.                                  NC1174.2 717
   000713         071600 SIG-FAIL-GF-21-1.                                                NC1174.2
   000714         071700     MOVE     DIV10 TO COMPUTED-N.                                NC1174.2 137 156
   000715         071800     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1174.2 149
   000716         071900     PERFORM  FAIL.                                               NC1174.2 295
   000717         072000 SIG-WRITE-GF-21-1.                                               NC1174.2
   000718         072100     MOVE "SIG-TEST-GF-21-1" TO PAR-NAME.                         NC1174.2 144
   000719         072200     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000720         072300 SIG-TEST-GF-21-2.                                                NC1174.2
   000721         072400     IF       DIV10 = 0                                           NC1174.2 137
   000722      1  072500              PERFORM PASS                                        NC1174.2 294
   000723         072600              ELSE                                                NC1174.2
   000724      1  072700              GO TO SIG-FAIL-GF-21-2.                             NC1174.2 729
   000725         072800     GO TO    SIG-WRITE-GF-21-2.                                  NC1174.2 734
   000726         072900 SIG-DELETE-GF-21-2.                                              NC1174.2
   000727         073000     PERFORM  DE-LETE.                                            NC1174.2 296
   000728         073100     GO TO    SIG-WRITE-GF-21-2.                                  NC1174.2 734
   000729         073200 SIG-FAIL-GF-21-2.                                                NC1174.2
   000730         073300     MOVE     DIV10 TO COMPUTED-N.                                NC1174.2 137 156
   000731         073400     MOVE     0     TO CORRECT-N.                                 NC1174.2 170
   000732         073500     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1174.2 149
   000733         073600     PERFORM FAIL.                                                NC1174.2 295
   000734         073700 SIG-WRITE-GF-21-2.                                               NC1174.2
   000735         073800     MOVE "SIG-TEST-GF-21-2" TO PAR-NAME.                         NC1174.2 144
   000736         073900     PERFORM  PRINT-DETAIL.                                       NC1174.2 298
   000737         074000 SIG-INIT-GF-6.                                                   NC1174.2
   000738         074100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     MOVE "DIVIDE INTO         " TO FEATURE.                      NC1174.2 140
   000740         074300     MOVE 99 TO WRK-DS-LS-18V00.                                  NC1174.2 43
   000741         074400 SIG-TEST-GF-6-0.                                                 NC1174.2
   000742         074500     DIVIDE A99-DS-02V00 INTO WRK-DS-LS-18V00.                    NC1174.2 85 43
   000743         074600 SIG-TEST-GF-6-1.                                                 NC1174.2
   000744         074700     IF WRK-DS-LS-18V00 EQUAL TO 000000000000000001               NC1174.2 43
   000745      1  074800         PERFORM PASS                                             NC1174.2 294
   000746      1  074900         GO TO SIG-WRITE-GF-6.                                    NC1174.2 755
   000747         075000     GO TO SIG-FAIL-GF-6.                                         NC1174.2 751
   000748         075100 SIG-DELETE-GF-6.                                                 NC1174.2
   000749         075200     PERFORM DE-LETE.                                             NC1174.2 296
   000750         075300     GO TO SIG-WRITE-GF-6.                                        NC1174.2 755
   000751         075400 SIG-FAIL-GF-6.                                                   NC1174.2
   000752         075500     MOVE  000000000000000001 TO CORRECT-18V0.                    NC1174.2 175
   000753         075600     MOVE  WRK-DS-LS-18V00       TO COMPUTED-18V0.                NC1174.2 43 162
   000754         075700     PERFORM FAIL.                                                NC1174.2 295
   000755         075800 SIG-WRITE-GF-6.                                                  NC1174.2
   000756         075900     MOVE "SIG-TEST-GF-6         " TO PAR-NAME.                   NC1174.2 144
   000757         076000     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000758         076100 SIG-INIT-GF-7.                                                   NC1174.2
   000759         076200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000760         076300     MOVE 2 TO WRK-DS-TS-12V00-S.                                 NC1174.2 86
   000761         076400 SIG-TEST-GF-7-0.                                                 NC1174.2
   000762         076500     DIVIDE 4 INTO WRK-DS-TS-12V00-S ROUNDED.                     NC1174.2 86
   000763         076600 SIG-TEST-GF-7-1.                                                 NC1174.2
   000764         076700     IF WRK-DS-TS-12V00-S EQUAL TO 000000000001                   NC1174.2 86
   000765      1  076800         PERFORM PASS                                             NC1174.2 294
   000766      1  076900         GO TO SIG-WRITE-GF-7.                                    NC1174.2 775
   000767         077000     GO TO SIG-FAIL-GF-7.                                         NC1174.2 771
   000768         077100 SIG-DELETE-GF-7.                                                 NC1174.2
   000769         077200     PERFORM DE-LETE.                                             NC1174.2 296
   000770         077300     GO TO SIG-WRITE-GF-7.                                        NC1174.2 775
   000771         077400 SIG-FAIL-GF-7.                                                   NC1174.2
   000772         077500     MOVE  WRK-DS-TS-12V00-S       TO COMPUTED-18V0.              NC1174.2 86 162
   000773         077600     MOVE  000000000001       TO CORRECT-18V0.                    NC1174.2 175
   000774         077700     PERFORM FAIL.                                                NC1174.2 295
   000775         077800 SIG-WRITE-GF-7.                                                  NC1174.2
   000776         077900     MOVE "SIG-TEST-GF-7         " TO PAR-NAME.                   NC1174.2 144
   000777         078000     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000778         078100 SIG-INIT-GF-8.                                                   NC1174.2
   000779         078200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000780         078300     MOVE 1 TO WRK-DS-LS-01V00.                                   NC1174.2 88
   000781         078400     MOVE "0" TO WRK-XN-00001.                                    NC1174.2 53
   000782         078500 SIG-TEST-GF-8-0.                                                 NC1174.2
   000783         078600     DIVIDE 0.1 INTO WRK-DS-LS-01V00 ON SIZE ERROR                NC1174.2 88
   000784      1  078700         MOVE "1" TO WRK-XN-00001.                                NC1174.2 53
   000785         078800 SIG-TEST-GF-8-1.                                                 NC1174.2
   000786         078900     IF WRK-DS-LS-01V00 EQUAL TO 1                                NC1174.2 88
   000787      1  079000         PERFORM PASS                                             NC1174.2 294
   000788      1  079100         GO TO SIG-WRITE-GF-8-1.                                  NC1174.2 798
   000789         079200     GO TO SIG-FAIL-GF-8-1.                                       NC1174.2 793
   000790         079300 SIG-DELETE-GF-8-1.                                               NC1174.2
   000791         079400     PERFORM DE-LETE.                                             NC1174.2 296
   000792         079500     GO TO SIG-WRITE-GF-8-1.                                      NC1174.2 798
   000793         079600 SIG-FAIL-GF-8-1.                                                 NC1174.2
   000794         079700     MOVE  1                  TO CORRECT-N.                       NC1174.2 170
   000795         079800     MOVE  WRK-DS-LS-01V00       TO COMPUTED-N.                   NC1174.2 88 156
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     MOVE  "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.           NC1174.2 149
   000797         080000     PERFORM FAIL.                                                NC1174.2 295
   000798         080100 SIG-WRITE-GF-8-1.                                                NC1174.2
   000799         080200     MOVE "SIG-TEST-GF-8-1         " TO PAR-NAME.                 NC1174.2 144
   000800         080300     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000801         080400 SIG-TEST-GF-8-2.                                                 NC1174.2
   000802         080500     IF WRK-XN-00001 EQUAL TO "1"                                 NC1174.2 53
   000803      1  080600         PERFORM PASS                                             NC1174.2 294
   000804      1  080700         GO TO SIG-WRITE-GF-8-2.                                  NC1174.2 812
   000805         080800     MOVE "1" TO CORRECT-A.                                       NC1174.2 169
   000806         080900     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1174.2 53 155
   000807         081000     MOVE "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.          NC1174.2 149
   000808         081100     PERFORM FAIL.                                                NC1174.2 295
   000809         081200     GO TO SIG-WRITE-GF-8-2.                                      NC1174.2 812
   000810         081300 SIG-DELETE-GF-8-2.                                               NC1174.2
   000811         081400     PERFORM DE-LETE.                                             NC1174.2 296
   000812         081500 SIG-WRITE-GF-8-2.                                                NC1174.2
   000813         081600     MOVE "SIG-TEST-GF-8-2         " TO PAR-NAME.                 NC1174.2 144
   000814         081700     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000815         081800 SIG-INIT-GF-9.                                                   NC1174.2
   000816         081900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000817         082000     MOVE -.000000001 TO WRK-DS-09V09.                            NC1174.2 63
   000818         082100     MOVE "1" TO WRK-XN-00001.                                    NC1174.2 53
   000819         082200 SIG-TEST-GF-9-0.                                                 NC1174.2
   000820         082300     DIVIDE A01ONE-DS-TS-P0801 INTO WRK-DS-09V09 ON SIZE ERROR    NC1174.2 69 63
   000821      1  082400         MOVE "0" TO WRK-XN-00001.                                NC1174.2 53
   000822         082500 SIG-TEST-GF-9-1.                                                 NC1174.2
   000823         082600     IF WRK-DS-18V00-S EQUAL TO -000000001000000000               NC1174.2 64
   000824      1  082700         PERFORM PASS                                             NC1174.2 294
   000825      1  082800         GO TO SIG-WRITE-GF-9-1.                                  NC1174.2 834
   000826         082900     GO TO SIG-FAIL-GF-9-1.                                       NC1174.2 830
   000827         083000 SIG-DELETE-GF-9-1.                                               NC1174.2
   000828         083100     PERFORM DE-LETE.                                             NC1174.2 296
   000829         083200     GO TO SIG-WRITE-GF-9-1.                                      NC1174.2 834
   000830         083300 SIG-FAIL-GF-9-1.                                                 NC1174.2
   000831         083400     MOVE -000000001000000000 TO CORRECT-18V0.                    NC1174.2 175
   000832         083500     MOVE WRK-DS-18V00-S TO COMPUTED-18V0.                        NC1174.2 64 162
   000833         083600     PERFORM FAIL.                                                NC1174.2 295
   000834         083700 SIG-WRITE-GF-9-1.                                                NC1174.2
   000835         083800     MOVE "SIG-TEST-GF-9-1         " TO PAR-NAME.                 NC1174.2 144
   000836         083900     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000837         084000 SIG-TEST-GF-9-2.                                                 NC1174.2
   000838         084100     IF WRK-XN-00001 EQUAL TO "0"                                 NC1174.2 53
   000839      1  084200         MOVE "1" TO CORRECT-A                                    NC1174.2 169
   000840      1  084300         MOVE "0" TO COMPUTED-A                                   NC1174.2 155
   000841      1  084400         MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK   NC1174.2 149
   000842      1  084500         PERFORM FAIL                                             NC1174.2 295
   000843      1  084600         GO TO SIG-WRITE-GF-9-2.                                  NC1174.2 848
   000844         084700     PERFORM PASS.                                                NC1174.2 294
   000845         084800     GO TO SIG-WRITE-GF-9-2.                                      NC1174.2 848
   000846         084900 SIG-DELETE-GF-9-2.                                               NC1174.2
   000847         085000     PERFORM DE-LETE.                                             NC1174.2 296
   000848         085100 SIG-WRITE-GF-9-2.                                                NC1174.2
   000849         085200     MOVE "SIG-TEST-GF-9-2         " TO PAR-NAME.                 NC1174.2 144
   000850         085300     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000851         085400 SIG-INIT-GF-10.                                                  NC1174.2
   000852         085500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     MOVE ZERO TO WRK-DS-LS-01V00  AZERO-DS-LS-05V05.             NC1174.2 IMP 88 61
   000854         085700     MOVE "0" TO WRK-XN-00001.                                    NC1174.2 53
   000855         085800 SIG-TEST-GF-10-0.                                                NC1174.2
   000856         085900     DIVIDE AZERO-DS-LS-05V05 INTO WRK-DS-LS-01V00 ROUNDED        NC1174.2 61 88
   000857      1  086000         ON SIZE ERROR  MOVE "1" TO WRK-XN-00001.                 NC1174.2 53
   000858         086100 SIG-TEST-GF-10-1.                                                NC1174.2
   000859         086200     IF WRK-DS-LS-01V00 EQUAL TO 0                                NC1174.2 88
   000860      1  086300         PERFORM PASS                                             NC1174.2 294
   000861      1  086400         GO TO SIG-WRITE-GF-10-1.                                 NC1174.2 871
   000862         086500     GO TO SIG-FAIL-GF-10-1.                                      NC1174.2 866
   000863         086600 SIG-DELETE-GF-10-1.                                              NC1174.2
   000864         086700     PERFORM DE-LETE.                                             NC1174.2 296
   000865         086800     GO TO SIG-WRITE-GF-10-1.                                     NC1174.2 871
   000866         086900 SIG-FAIL-GF-10-1.                                                NC1174.2
   000867         087000     MOVE  0                  TO CORRECT-N.                       NC1174.2 170
   000868         087100     MOVE  WRK-DS-LS-01V00       TO COMPUTED-N.                   NC1174.2 88 156
   000869         087200     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1174.2 149
   000870         087300     PERFORM FAIL.                                                NC1174.2 295
   000871         087400 SIG-WRITE-GF-10-1.                                               NC1174.2
   000872         087500     MOVE "SIG-TEST-GF-10-1         " TO PAR-NAME.                NC1174.2 144
   000873         087600     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000874         087700 SIG-TEST-GF-10-2.                                                NC1174.2
   000875         087800     IF WRK-XN-00001 EQUAL TO "1"                                 NC1174.2 53
   000876      1  087900         PERFORM PASS                                             NC1174.2 294
   000877      1  088000         GO TO SIG-WRITE-GF-10-2.                                 NC1174.2 885
   000878         088100     MOVE "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.          NC1174.2 149
   000879         088200     MOVE "1" TO CORRECT-A.                                       NC1174.2 169
   000880         088300     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1174.2 53 155
   000881         088400     PERFORM FAIL.                                                NC1174.2 295
   000882         088500     GO TO SIG-WRITE-GF-10-2.                                     NC1174.2 885
   000883         088600 SIG-DELETE-GF-10-2.                                              NC1174.2
   000884         088700     PERFORM DE-LETE.                                             NC1174.2 296
   000885         088800 SIG-WRITE-GF-10-2.                                               NC1174.2
   000886         088900     MOVE "SIG-TEST-GF-10-2         " TO PAR-NAME.                NC1174.2 144
   000887         089000     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000888         089100 SIG-INIT-GF-14.                                                  NC1174.2
   000889         089200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000890         089300     MOVE "DIVIDE INTO GIVING  " TO FEATURE.                      NC1174.2 140
   000891         089400     MOVE ZERO TO WRK-DS-LS-01V00.                                NC1174.2 IMP 88
   000892         089500     MOVE 22 TO A02TWOS-DU-02V00.                                 NC1174.2 93
   000893         089600 SIG-TEST-GF-14-0.                                                NC1174.2
   000894         089700     DIVIDE -10.9 INTO A02TWOS-DU-02V00 GIVING WRK-DS-LS-01V00.   NC1174.2 93 88
   000895         089800 SIG-TEST-GF-14-1.                                                NC1174.2
   000896         089900     IF WRK-DS-LS-01V00 EQUAL TO -2                               NC1174.2 88
   000897      1  090000         PERFORM PASS                                             NC1174.2 294
   000898      1  090100         GO TO SIG-WRITE-GF-14.                                   NC1174.2 907
   000899         090200     GO TO SIG-FAIL-GF-14.                                        NC1174.2 903
   000900         090300 SIG-DELETE-GF-14.                                                NC1174.2
   000901         090400     PERFORM DE-LETE.                                             NC1174.2 296
   000902         090500     GO TO SIG-WRITE-GF-14.                                       NC1174.2 907
   000903         090600 SIG-FAIL-GF-14.                                                  NC1174.2
   000904         090700     MOVE  -2                 TO CORRECT-N.                       NC1174.2 170
   000905         090800     MOVE  WRK-DS-LS-01V00       TO COMPUTED-N.                   NC1174.2 88 156
   000906         090900     PERFORM FAIL.                                                NC1174.2 295
   000907         091000 SIG-WRITE-GF-14.                                                 NC1174.2
   000908         091100     MOVE "SIG-TEST-GF-14         " TO PAR-NAME.                  NC1174.2 144
   000909         091200     PERFORM PRINT-DETAIL.                                        NC1174.2 298
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300 SIG-INIT-GF-15.                                                  NC1174.2
   000911         091400     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000912         091500     MOVE 0.0000000001 TO WRK-DS-03V10.                           NC1174.2 89
   000913         091600     MOVE ZERO TO WRK-DS-LS-18V00.                                NC1174.2 IMP 43
   000914         091700     MOVE .000000001 TO A01ONE-DS-TS-P0801.                       NC1174.2 69
   000915         091800 SIG-TEST-GF-15-0.                                                NC1174.2
   000916         091900     DIVIDE WRK-DS-03V10 INTO A01ONE-DS-TS-P0801                  NC1174.2 89 69
   000917         092000         GIVING WRK-DS-LS-18V00 ROUNDED.                          NC1174.2 43
   000918         092100 SIG-TEST-GF-15-1.                                                NC1174.2
   000919         092200     IF WRK-DS-LS-18V00 EQUAL TO 000000000000000010               NC1174.2 43
   000920      1  092300         PERFORM PASS                                             NC1174.2 294
   000921      1  092400         GO TO SIG-WRITE-GF-15.                                   NC1174.2 930
   000922         092500     GO TO SIG-FAIL-GF-15.                                        NC1174.2 926
   000923         092600 SIG-DELETE-GF-15.                                                NC1174.2
   000924         092700     PERFORM DE-LETE.                                             NC1174.2 296
   000925         092800     GO TO SIG-WRITE-GF-15.                                       NC1174.2 930
   000926         092900 SIG-FAIL-GF-15.                                                  NC1174.2
   000927         093000     MOVE  000000000000000010 TO CORRECT-18V0.                    NC1174.2 175
   000928         093100     MOVE  WRK-DS-LS-18V00       TO COMPUTED-18V0.                NC1174.2 43 162
   000929         093200     PERFORM FAIL.                                                NC1174.2 295
   000930         093300 SIG-WRITE-GF-15.                                                 NC1174.2
   000931         093400     MOVE "SIG-TEST-GF-15         " TO PAR-NAME.                  NC1174.2 144
   000932         093500     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000933         093600 SIG-INIT-GF-16.                                                  NC1174.2
   000934         093700     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000935         093800     MOVE ZERO TO WRK-DS-LS-18V00  AZERO-DS-LS-05V05.             NC1174.2 IMP 43 61
   000936         093900     MOVE "0" TO WRK-XN-00001.                                    NC1174.2 53
   000937         094000 SIG-TEST-GF-16-0.                                                NC1174.2
   000938         094100     DIVIDE AZERO-DS-LS-05V05 INTO A99-DS-02V00                   NC1174.2 61 85
   000939         094200         GIVING WRK-DS-LS-18V00 ON SIZE ERROR                     NC1174.2 43
   000940      1  094300         MOVE "1" TO WRK-XN-00001.                                NC1174.2 53
   000941         094400 SIG-TEST-GF-16-1.                                                NC1174.2
   000942         094500     IF WRK-DS-LS-18V00 EQUAL TO 000000000000000000               NC1174.2 43
   000943      1  094600         PERFORM PASS                                             NC1174.2 294
   000944      1  094700         GO TO SIG-WRITE-GF-16-1.                                 NC1174.2 954
   000945         094800     GO TO SIG-FAIL-GF-16-1.                                      NC1174.2 949
   000946         094900 SIG-DELETE-GF-16-1.                                              NC1174.2
   000947         095000     PERFORM DE-LETE.                                             NC1174.2 296
   000948         095100     GO TO SIG-WRITE-GF-16-1.                                     NC1174.2 954
   000949         095200 SIG-FAIL-GF-16-1.                                                NC1174.2
   000950         095300     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1174.2 149
   000951         095400     MOVE  000000000000000000 TO CORRECT-18V0.                    NC1174.2 175
   000952         095500     MOVE  WRK-DS-LS-18V00       TO COMPUTED-18V0.                NC1174.2 43 162
   000953         095600     PERFORM FAIL.                                                NC1174.2 295
   000954         095700 SIG-WRITE-GF-16-1.                                               NC1174.2
   000955         095800     MOVE "SIG-TEST-GF-16-1         " TO PAR-NAME.                NC1174.2 144
   000956         095900     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000957         096000 SIG-TEST-GF-16-2.                                                NC1174.2
   000958         096100     IF WRK-XN-00001 EQUAL TO "1"                                 NC1174.2 53
   000959      1  096200         PERFORM PASS                                             NC1174.2 294
   000960      1  096300         GO TO SIG-WRITE-GF-16-2.                                 NC1174.2 968
   000961         096400     MOVE "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.          NC1174.2 149
   000962         096500     MOVE "1" TO CORRECT-A.                                       NC1174.2 169
   000963         096600     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1174.2 53 155
   000964         096700     PERFORM FAIL.                                                NC1174.2 295
   000965         096800     GO TO SIG-WRITE-GF-16-2.                                     NC1174.2 968
   000966         096900 SIG-DELETE-GF-16-2.                                              NC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     PERFORM DE-LETE.                                             NC1174.2 296
   000968         097100 SIG-WRITE-GF-16-2.                                               NC1174.2
   000969         097200     MOVE "SIG-TEST-32         " TO PAR-NAME.                     NC1174.2 144
   000970         097300     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000971         097400 SIG-INIT-GF-17.                                                  NC1174.2
   000972         097500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   000973         097600     MOVE ZERO TO WRK-DS-LS-0201P.                                NC1174.2 IMP 77
   000974         097700     MOVE -0.005 TO WRK-DS-09V09.                                 NC1174.2 63
   000975         097800     MOVE "0" TO WRK-XN-00001.                                    NC1174.2 53
   000976         097900 SIG-TEST-GF-17-0.                                                NC1174.2
   000977         098000     DIVIDE WRK-DS-09V09 INTO A05ONES-DS-LS-00V05 GIVING          NC1174.2 63 65
   000978         098100         WRK-DS-LS-0201P ROUNDED ON SIZE ERROR                    NC1174.2 77
   000979      1  098200         MOVE "1" TO WRK-XN-00001.                                NC1174.2 53
   000980         098300 SIG-TEST-GF-17-1.                                                NC1174.2
   000981         098400     MOVE WRK-DS-LS-0201P TO WRK-DS-05V00.                        NC1174.2 77 94
   000982         098500     IF WRK-DS-05V00 EQUAL TO  -00020                             NC1174.2 94
   000983      1  098600         PERFORM PASS                                             NC1174.2 294
   000984      1  098700         GO TO SIG-WRITE-GF-17-1.                                 NC1174.2 993
   000985         098800     GO TO SIG-FAIL-GF-17-1.                                      NC1174.2 989
   000986         098900 SIG-DELETE-GF-17-1.                                              NC1174.2
   000987         099000     PERFORM DE-LETE.                                             NC1174.2 296
   000988         099100     GO TO SIG-WRITE-GF-17-1.                                     NC1174.2 993
   000989         099200 SIG-FAIL-GF-17-1.                                                NC1174.2
   000990         099300     MOVE -00020 TO CORRECT-N.                                    NC1174.2 170
   000991         099400     MOVE WRK-DS-05V00 TO COMPUTED-N.                             NC1174.2 94 156
   000992         099500     PERFORM FAIL.                                                NC1174.2 295
   000993         099600 SIG-WRITE-GF-17-1.                                               NC1174.2
   000994         099700     MOVE "SIG-TEST-GF-17-1         " TO PAR-NAME.                NC1174.2 144
   000995         099800     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   000996         099900 SIG-TEST-GF-17-2.                                                NC1174.2
   000997         100000     IF WRK-XN-00001 EQUAL TO "0"                                 NC1174.2 53
   000998      1  100100         PERFORM PASS                                             NC1174.2 294
   000999      1  100200         GO TO SIG-WRITE-GF-17-2.                                 NC1174.2 1007
   001000         100300     MOVE "0" TO CORRECT-A.                                       NC1174.2 169
   001001         100400     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1174.2 53 155
   001002         100500     MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.      NC1174.2 149
   001003         100600     PERFORM FAIL.                                                NC1174.2 295
   001004         100700     GO TO SIG-WRITE-GF-17-2.                                     NC1174.2 1007
   001005         100800 SIG-DELETE-GF-17-2.                                              NC1174.2
   001006         100900     PERFORM DE-LETE.                                             NC1174.2 296
   001007         101000 SIG-WRITE-GF-17-2.                                               NC1174.2
   001008         101100     MOVE "SIG-TEST-GF-17-2         " TO PAR-NAME.                NC1174.2 144
   001009         101200     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001010         101300 SIG-INIT-GF-18.                                                  NC1174.2
   001011         101400     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   001012         101500     MOVE "1" TO WRK-XN-00001.                                    NC1174.2 53
   001013         101600     MOVE ZERO TO WRK-DS-LS-01V00.                                NC1174.2 IMP 88
   001014         101700     MOVE 22 TO A02TWOS-DU-02V00  A02TWOS-DS-03V02.               NC1174.2 93 95
   001015         101800 SIG-TEST-GF-18-0.                                                NC1174.2
   001016         101900     DIVIDE A02TWOS-DU-02V00 INTO A02TWOS-DS-03V02  GIVING        NC1174.2 93 95
   001017         102000         WRK-DS-LS-01V00 ROUNDED ON SIZE ERROR                    NC1174.2 88
   001018      1  102100         MOVE "0" TO WRK-XN-00001.                                NC1174.2 53
   001019         102200 SIG-TEST-GF-18-1.                                                NC1174.2
   001020         102300     IF WRK-DS-LS-01V00 EQUAL TO +1                               NC1174.2 88
   001021      1  102400         PERFORM PASS                                             NC1174.2 294
   001022      1  102500         GO TO SIG-WRITE-GF-18-1.                                 NC1174.2 1031
   001023         102600     GO TO SIG-FAIL-GF-18-1.                                      NC1174.2 1027
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700 SIG-DELETE-GF-18-1.                                              NC1174.2
   001025         102800     PERFORM DE-LETE.                                             NC1174.2 296
   001026         102900     GO TO SIG-WRITE-GF-18-1.                                     NC1174.2 1031
   001027         103000 SIG-FAIL-GF-18-1.                                                NC1174.2
   001028         103100     MOVE  +1                 TO CORRECT-N.                       NC1174.2 170
   001029         103200     MOVE  WRK-DS-LS-01V00       TO COMPUTED-N.                   NC1174.2 88 156
   001030         103300     PERFORM FAIL.                                                NC1174.2 295
   001031         103400 SIG-WRITE-GF-18-1.                                               NC1174.2
   001032         103500     MOVE "SIG-TEST-GF-18-1         " TO PAR-NAME.                NC1174.2 144
   001033         103600     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001034         103700 SIG-TEST-GF-18-2.                                                NC1174.2
   001035         103800     IF WRK-XN-00001 EQUAL TO "1"                                 NC1174.2 53
   001036      1  103900         PERFORM PASS                                             NC1174.2 294
   001037      1  104000         GO TO SIG-WRITE-GF-18-2.                                 NC1174.2 1045
   001038         104100     MOVE "1" TO CORRECT-A.                                       NC1174.2 169
   001039         104200     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1174.2 53 155
   001040         104300     MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.      NC1174.2 149
   001041         104400     PERFORM FAIL.                                                NC1174.2 295
   001042         104500     GO TO SIG-WRITE-GF-18-2.                                     NC1174.2 1045
   001043         104600 SIG-DELETE-GF-18-2.                                              NC1174.2
   001044         104700     PERFORM DE-LETE.                                             NC1174.2 296
   001045         104800 SIG-WRITE-GF-18-2.                                               NC1174.2
   001046         104900     MOVE "SIG-TEST-GF-18-2         " TO PAR-NAME.                NC1174.2 144
   001047         105000     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001048         105100 SIG-INIT-GF-22.                                                  NC1174.2
   001049         105200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   001050         105300     MOVE "DIVIDE BY GIVING    " TO FEATURE.                      NC1174.2 140
   001051         105400     MOVE ZERO TO WRK-DS-LS-01V00.                                NC1174.2 IMP 88
   001052         105500 SIG-TEST-GF-22-0.                                                NC1174.2
   001053         105600     DIVIDE A02TWOS-DU-02V00 BY -10.9 GIVING WRK-DS-LS-01V00.     NC1174.2 93 88
   001054         105700 SIG-TEST-GF-22-1.                                                NC1174.2
   001055         105800     IF WRK-DS-LS-01V00 EQUAL TO -2                               NC1174.2 88
   001056      1  105900         PERFORM PASS                                             NC1174.2 294
   001057      1  106000         GO TO SIG-WRITE-GF-22.                                   NC1174.2 1066
   001058         106100     GO TO SIG-FAIL-GF-22.                                        NC1174.2 1062
   001059         106200 SIG-DELETE-GF-22.                                                NC1174.2
   001060         106300     PERFORM DE-LETE.                                             NC1174.2 296
   001061         106400     GO TO SIG-WRITE-GF-22.                                       NC1174.2 1066
   001062         106500 SIG-FAIL-GF-22.                                                  NC1174.2
   001063         106600     MOVE  -2                 TO CORRECT-N.                       NC1174.2 170
   001064         106700     MOVE  WRK-DS-LS-01V00       TO COMPUTED-N.                   NC1174.2 88 156
   001065         106800     PERFORM FAIL.                                                NC1174.2 295
   001066         106900 SIG-WRITE-GF-22.                                                 NC1174.2
   001067         107000     MOVE "SIG-TEST-GF-22         " TO PAR-NAME.                  NC1174.2 144
   001068         107100     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001069         107200 SIG-INIT-GF-23.                                                  NC1174.2
   001070         107300     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   001071         107400     MOVE 0.0000000001 TO WRK-DS-03V10.                           NC1174.2 89
   001072         107500     MOVE ZERO TO WRK-DS-LS-18V00.                                NC1174.2 IMP 43
   001073         107600     MOVE .000000001 TO A01ONE-DS-TS-P0801.                       NC1174.2 69
   001074         107700 SIG-TEST-GF-23-0.                                                NC1174.2
   001075         107800     DIVIDE A01ONE-DS-TS-P0801 BY WRK-DS-03V10 GIVING             NC1174.2 69 89
   001076         107900         WRK-DS-LS-18V00 ROUNDED.                                 NC1174.2 43
   001077         108000 SIG-TEST-GF-23-1.                                                NC1174.2
   001078         108100     IF WRK-DS-LS-18V00 EQUAL TO 000000000000000010               NC1174.2 43
   001079      1  108200         PERFORM PASS                                             NC1174.2 294
   001080      1  108300         GO TO SIG-WRITE-GF-23.                                   NC1174.2 1089
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400     GO TO SIG-FAIL-GF-23.                                        NC1174.2 1085
   001082         108500 SIG-DELETE-GF-23.                                                NC1174.2
   001083         108600     PERFORM DE-LETE.                                             NC1174.2 296
   001084         108700     GO TO SIG-WRITE-GF-23.                                       NC1174.2 1089
   001085         108800 SIG-FAIL-GF-23.                                                  NC1174.2
   001086         108900     MOVE  000000000000000010 TO CORRECT-18V0.                    NC1174.2 175
   001087         109000     MOVE  WRK-DS-LS-18V00       TO COMPUTED-18V0.                NC1174.2 43 162
   001088         109100     PERFORM FAIL.                                                NC1174.2 295
   001089         109200 SIG-WRITE-GF-23.                                                 NC1174.2
   001090         109300     MOVE "SIG-TEST-GF-23         " TO PAR-NAME.                  NC1174.2 144
   001091         109400     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001092         109500 SIG-INIT-GF-24.                                                  NC1174.2
   001093         109600     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   001094         109700     MOVE ZERO TO WRK-DS-LS-18V00 AZERO-DS-LS-05V05.              NC1174.2 IMP 43 61
   001095         109800     MOVE "0" TO WRK-XN-00001.                                    NC1174.2 53
   001096         109900     MOVE 99 TO A99-DS-02V00.                                     NC1174.2 85
   001097         110000 SIG-TEST-GF-24-0.                                                NC1174.2
   001098         110100     DIVIDE A99-DS-02V00 BY AZERO-DS-LS-05V05 GIVING              NC1174.2 85 61
   001099      1  110200         WRK-DS-LS-18V00 ON SIZE ERROR MOVE "1" TO WRK-XN-00001.  NC1174.2 43 53
   001100         110300 SIG-TEST-GF-24-1.                                                NC1174.2
   001101         110400     IF WRK-DS-LS-18V00 EQUAL TO 000000000000000000               NC1174.2 43
   001102      1  110500         PERFORM PASS                                             NC1174.2 294
   001103      1  110600         GO TO SIG-WRITE-GF-24-1.                                 NC1174.2 1111
   001104         110700     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1174.2 149
   001105         110800     MOVE  000000000000000000 TO CORRECT-18V0.                    NC1174.2 175
   001106         110900     MOVE  WRK-DS-LS-18V00       TO COMPUTED-18V0.                NC1174.2 43 162
   001107         111000     PERFORM FAIL.                                                NC1174.2 295
   001108         111100     GO TO SIG-WRITE-GF-24-1.                                     NC1174.2 1111
   001109         111200 SIG-DELETE-GF-24-1.                                              NC1174.2
   001110         111300     PERFORM DE-LETE.                                             NC1174.2 296
   001111         111400 SIG-WRITE-GF-24-1.                                               NC1174.2
   001112         111500     MOVE "SIG-TEST-GF-24-1         " TO PAR-NAME.                NC1174.2 144
   001113         111600     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001114         111700 SIG-TEST-GF-24-2.                                                NC1174.2
   001115         111800     IF WRK-XN-00001 EQUAL TO "1"                                 NC1174.2 53
   001116      1  111900         PERFORM PASS                                             NC1174.2 294
   001117      1  112000         GO TO SIG-WRITE-GF-24-2.                                 NC1174.2 1125
   001118         112100     MOVE "1" TO CORRECT-A.                                       NC1174.2 169
   001119         112200     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1174.2 53 155
   001120         112300     MOVE "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.          NC1174.2 149
   001121         112400     PERFORM FAIL.                                                NC1174.2 295
   001122         112500     GO TO SIG-WRITE-GF-24-2.                                     NC1174.2 1125
   001123         112600 SIG-DELETE-GF-24-2.                                              NC1174.2
   001124         112700     PERFORM DE-LETE.                                             NC1174.2 296
   001125         112800 SIG-WRITE-GF-24-2.                                               NC1174.2
   001126         112900     MOVE "SIG-TEST-GF-24-2         " TO PAR-NAME.                NC1174.2 144
   001127         113000     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001128         113100 SIG-INIT-GF-25.                                                  NC1174.2
   001129         113200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   001130         113300     MOVE .11111 TO A05ONES-DS-LS-00V05.                          NC1174.2 65
   001131         113400     MOVE ZERO TO WRK-DS-LS-0201P.                                NC1174.2 IMP 77
   001132         113500     MOVE -0.005 TO WRK-DS-09V09.                                 NC1174.2 63
   001133         113600     MOVE "0" TO WRK-XN-00001.                                    NC1174.2 53
   001134         113700 SIG-TEST-GF-25-0.                                                NC1174.2
   001135         113800     DIVIDE A05ONES-DS-LS-00V05 BY WRK-DS-09V09 GIVING            NC1174.2 65 63
   001136         113900         WRK-DS-LS-0201P ROUNDED ON SIZE ERROR                    NC1174.2 77
   001137      1  114000         MOVE "1" TO WRK-XN-00001.                                NC1174.2 53
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100 SIG-TEST-GF-25-1.                                                NC1174.2
   001139         114200     MOVE WRK-DS-LS-0201P TO WRK-DS-05V00.                        NC1174.2 77 94
   001140         114300     IF  WRK-DS-05V00 EQUAL TO -00020                             NC1174.2 94
   001141      1  114400         PERFORM PASS                                             NC1174.2 294
   001142      1  114500         GO TO SIG-WRITE-GF-25-1.                                 NC1174.2 1149
   001143         114600     MOVE  -00020             TO CORRECT-N.                       NC1174.2 170
   001144         114700     MOVE  WRK-DS-05V00       TO COMPUTED-N.                      NC1174.2 94 156
   001145         114800     PERFORM FAIL.                                                NC1174.2 295
   001146         114900     GO TO SIG-WRITE-GF-25-1.                                     NC1174.2 1149
   001147         115000 SIG-DELETE-GF-25-1.                                              NC1174.2
   001148         115100     PERFORM DE-LETE.                                             NC1174.2 296
   001149         115200 SIG-WRITE-GF-25-1.                                               NC1174.2
   001150         115300     MOVE "SIG-TEST-GF-25-1         " TO PAR-NAME.                NC1174.2 144
   001151         115400     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001152         115500 SIG-TEST-GF-25-2.                                                NC1174.2
   001153         115600     IF WRK-XN-00001 EQUAL TO "0"                                 NC1174.2 53
   001154      1  115700         PERFORM PASS                                             NC1174.2 294
   001155      1  115800         GO TO SIG-WRITE-GF-25-2.                                 NC1174.2 1163
   001156         115900     MOVE "0" TO CORRECT-A.                                       NC1174.2 169
   001157         116000     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1174.2 53 155
   001158         116100     MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.      NC1174.2 149
   001159         116200     PERFORM FAIL.                                                NC1174.2 295
   001160         116300     GO TO SIG-WRITE-GF-25-2.                                     NC1174.2 1163
   001161         116400 SIG-DELETE-GF-25-2.                                              NC1174.2
   001162         116500     PERFORM DE-LETE.                                             NC1174.2 296
   001163         116600 SIG-WRITE-GF-25-2.                                               NC1174.2
   001164         116700     MOVE "SIG-TEST-GF-25-2         " TO PAR-NAME.                NC1174.2 144
   001165         116800     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001166         116900 SIG-INIT-GF-26.                                                  NC1174.2
   001167         117000     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1174.2 200
   001168         117100     MOVE 22 TO A02TWOS-DU-02V00  A02TWOS-DS-03V02.               NC1174.2 93 95
   001169         117200     MOVE "1" TO WRK-XN-00001.                                    NC1174.2 53
   001170         117300     MOVE ZERO TO WRK-DS-LS-01V00.                                NC1174.2 IMP 88
   001171         117400 SIG-TEST-GF-26-0.                                                NC1174.2
   001172         117500     DIVIDE A02TWOS-DS-03V02 BY A02TWOS-DU-02V00 GIVING           NC1174.2 95 93
   001173         117600         WRK-DS-LS-01V00 ROUNDED ON SIZE ERROR                    NC1174.2 88
   001174      1  117700         MOVE "0" TO WRK-XN-00001.                                NC1174.2 53
   001175         117800 SIG-TEST-GF-26-1.                                                NC1174.2
   001176         117900     IF WRK-DS-LS-01V00 EQUAL TO +1                               NC1174.2 88
   001177      1  118000         PERFORM PASS                                             NC1174.2 294
   001178      1  118100         GO TO SIG-WRITE-GF-26-1.                                 NC1174.2 1185
   001179         118200     MOVE  +1                 TO CORRECT-N.                       NC1174.2 170
   001180         118300     MOVE  WRK-DS-LS-01V00       TO COMPUTED-N.                   NC1174.2 88 156
   001181         118400     PERFORM FAIL.                                                NC1174.2 295
   001182         118500     GO TO SIG-WRITE-GF-26-1.                                     NC1174.2 1185
   001183         118600 SIG-DELETE-GF-26-1.                                              NC1174.2
   001184         118700     PERFORM DE-LETE.                                             NC1174.2 296
   001185         118800 SIG-WRITE-GF-26-1.                                               NC1174.2
   001186         118900     MOVE "SIG-TEST-GF-26-1         " TO PAR-NAME.                NC1174.2 144
   001187         119000     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001188         119100 SIG-TEST-GF-26-2.                                                NC1174.2
   001189         119200     IF WRK-XN-00001 EQUAL TO "0"                                 NC1174.2 53
   001190      1  119300         MOVE "0" TO COMPUTED-A                                   NC1174.2 155
   001191      1  119400         MOVE "1" TO CORRECT-A                                    NC1174.2 169
   001192      1  119500         MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK   NC1174.2 149
   001193      1  119600         PERFORM FAIL                                             NC1174.2 295
   001194      1  119700        GO TO SIG-WRITE-GF-26-2.                                  NC1174.2 1199
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800     PERFORM PASS.                                                NC1174.2 294
   001196         119900     GO TO SIG-WRITE-GF-26-2.                                     NC1174.2 1199
   001197         120000 SIG-DELETE-GF-26-2.                                              NC1174.2
   001198         120100     PERFORM DE-LETE.                                             NC1174.2 296
   001199         120200 SIG-WRITE-GF-26-2.                                               NC1174.2
   001200         120300     MOVE "SIG-TEST-GF-26-2         " TO PAR-NAME.                NC1174.2 144
   001201         120400     PERFORM PRINT-DETAIL.                                        NC1174.2 298
   001202         120500*                                                                 NC1174.2
   001203         120600 CCVS-EXIT SECTION.                                               NC1174.2
   001204         120700 CCVS-999999.                                                     NC1174.2
   001205         120800     GO TO CLOSE-FILES.                                           NC1174.2 287
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    25
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      200   ANSI-REFERENCE . . . . . . . .  377 384 393 M402 M423 M444 M485 M526 M565 M588 M610 M651 M674 M696 M738 M759
                                            M779 M816 M852 M889 M911 M934 M972 M1011 M1049 M1070 M1093 M1129 M1167
       61   AZERO-DS-LS-05V05. . . . . . .  M853 856 M935 938 M1094 1098
       83   A01ONE-CS-00V01
       69   A01ONE-DS-TS-P0801 . . . . . .  820 M914 916 M1073 1075
       99   A01ONES-CS-18V00
      101   A02THREES-CS-18V00
       95   A02TWOS-DS-03V02 . . . . . . .  M1014 1016 M1168 1172
       93   A02TWOS-DU-02V00 . . . . . . .  M892 894 M1014 1016 1053 M1168 1172
       65   A05ONES-DS-LS-00V05. . . . . .  977 M1130 1135
       45   A06THREES-DS-LS-03V03
       51   A08TWOS-DS-02V06
       54   A10ONES-DS-T-10V00
       67   A12ONES-DS-12V00
       57   A12THREES-DS-LS-06V06
      107   A14TWOS-CU-18V00
      105   A16NINES-CU-18V00
       90   A18ONES-DS-09V09
       75   A18ONES-DS-18V00
      103   A18SIXES-CU-18V00
       81   A99-CS-02V00
       85   A99-DS-02V00 . . . . . . . . .  742 938 M1096 1098
       97   A990-DS-0201P
      179   CCVS-C-1 . . . . . . . . . . .  316 362
      184   CCVS-C-2 . . . . . . . . . . .  317 363
      234   CCVS-E-1 . . . . . . . . . . .  322
      239   CCVS-E-2 . . . . . . . . . . .  331 338 345 350
      242   CCVS-E-2-2 . . . . . . . . . .  M330
      247   CCVS-E-3 . . . . . . . . . . .  351
      256   CCVS-E-4 . . . . . . . . . . .  330
      257   CCVS-E-4-1 . . . . . . . . . .  M328
      259   CCVS-E-4-2 . . . . . . . . . .  M329
      201   CCVS-H-1 . . . . . . . . . . .  311 358
      206   CCVS-H-2A. . . . . . . . . . .  312 359
      215   CCVS-H-2B. . . . . . . . . . .  313 360
      227   CCVS-H-3 . . . . . . . . . . .  314 361
      277   CCVS-PGM-ID. . . . . . . . . .  283 283
      161   CM-18V0
      155   COMPUTED-A . . . . . . . . . .  156 158 159 160 161 389 392 M604 M690 M806 M840 M880 M963 M1001 M1039 M1119 M1157
                                            M1190
      156   COMPUTED-N . . . . . . . . . .  M417 M438 M461 M479 M502 M520 M542 M559 M582 M628 M644 M667 M714 M730 M795 M868
                                            M905 M991 M1029 M1064 M1144 M1180
      154   COMPUTED-X . . . . . . . . . .  M306 374
      158   COMPUTED-0V18
      160   COMPUTED-14V4
      162   COMPUTED-18V0. . . . . . . . .  M753 M772 M832 M928 M952 M1087 M1106
      159   COMPUTED-4V14
      178   COR-ANSI-REFERENCE . . . . . .  M384 M386
      169   CORRECT-A. . . . . . . . . . .  170 171 172 173 174 390 392 M605 M691 M805 M839 M879 M962 M1000 M1038 M1118 M1156
                                            M1191
      170   CORRECT-N. . . . . . . . . . .  M418 M439 M480 M521 M560 M583 M645 M668 M731 M794 M867 M904 M990 M1028 M1063
                                            M1143 M1179
      168   CORRECT-X. . . . . . . . . . .  M307 376
      171   CORRECT-0V18
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    26
0 Defined   Cross-reference of data names   References

0     173   CORRECT-14V4
      175   CORRECT-18V0 . . . . . . . . .  M752 M773 M831 M927 M951 M1086 M1105
      172   CORRECT-4V14
      174   CR-18V0
      192   DELETE-COUNTER . . . . . . . .  M296 325 341 343
      119   DIVIDE-DATA
      120   DIV1 . . . . . . . . . . . . .  M403 M405 407 417 M589 592 M675 678
      137   DIV10. . . . . . . . . . . . .  M612 M616 628 635 644 M698 M702 714 721 730
      122   DIV2 . . . . . . . . . . . . .  M424 427 M486 M490 502 509 520 M567 570 M613 616 M653 656 M699 702
      124   DIV3 . . . . . . . . . . . . .  M425 M427 428 438
      126   DIV4 . . . . . . . . . . . . .  M445 M449 461 468 479 M611 616 M697 702
      129   DIV5 . . . . . . . . . . . . .  M446 449
      131   DIV6 . . . . . . . . . . . . .  M487 490
      132   DIV7 . . . . . . . . . . . . .  M527 M530 542 549 559
      135   DIV8 . . . . . . . . . . . . .  M568 M570 572 582 M652 M656 657 667
      136   DIV9 . . . . . . . . . . . . .  M590 M592 594 604 M676 M678 680 690
      147   DOTVALUE . . . . . . . . . . .  M301
      198   DUMMY-HOLD . . . . . . . . . .  M355 365
       41   DUMMY-RECORD . . . . . . . . .  M311 M312 M313 M314 M316 M317 M318 M320 M322 M331 M338 M345 M350 M351 355 M356
                                            357 M358 M359 M360 M361 M362 M363 M364 M365 369 M370 M379 M394
      245   ENDER-DESC . . . . . . . . . .  M333 M344 M349
      193   ERROR-COUNTER. . . . . . . . .  M295 324 334 337
      197   ERROR-HOLD . . . . . . . . . .  M324 M325 M325 M326 329
      243   ERROR-TOTAL. . . . . . . . . .  M335 M337 M342 M343 M347 M348
      140   FEATURE. . . . . . . . . . . .  M401 M566 M654 M673 M739 M890 M1050
      271   HYPHEN-LINE. . . . . . . . . .  318 320 364
      237   ID-AGAIN . . . . . . . . . . .  M283
      270   INF-ANSI-REFERENCE . . . . . .  M377 M380 M393 M395
      265   INFO-TEXT. . . . . . . . . . .  M378
      194   INSPECT-COUNTER. . . . . . . .  M293 324 346 348
      109   MULTIPLY-DATA
      110   MULT1
      112   MULT2
      113   MULT3
      114   MULT4
      116   MULT5
      117   MULT6
      142   P-OR-F . . . . . . . . . . . .  M293 M294 M295 M296 303 M306
      144   PAR-NAME . . . . . . . . . . .  M308 M420 M441 M465 M482 M506 M523 M546 M562 M585 M607 M632 M648 M670 M693 M718
                                            M735 M756 M776 M799 M813 M835 M849 M872 M886 M908 M931 M955 M969 M994 M1008 M1032
                                            M1046 M1067 M1090 M1112 M1126 M1150 M1164 M1186 M1200
      146   PARDOT-X . . . . . . . . . . .  M300
      195   PASS-COUNTER . . . . . . . . .  M294 326 328
       39   PRINT-FILE . . . . . . . . . .  35 282 288
       40   PRINT-REC. . . . . . . . . . .  M302 M383 M385
      149   RE-MARK. . . . . . . . . . . .  M297 M309 M462 M478 M503 M519 M543 M558 M629 M646 M715 M732 M796 M807 M841 M869
                                            M878 M950 M961 M1002 M1040 M1104 M1120 M1158 M1192
      191   REC-CT . . . . . . . . . . . .  299 301 308
      190   REC-SKL-SUB
      199   RECORD-COUNT . . . . . . . . .  M353 354 M366
      134   SIG-DATA-2
      128   SIG-02LEVEL-1
      150   TEST-COMPUTED. . . . . . . . .  383
      165   TEST-CORRECT . . . . . . . . .  385
      218   TEST-ID. . . . . . . . . . . .  M283
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    27
0 Defined   Cross-reference of data names   References

0     138   TEST-RESULTS . . . . . . . . .  M284 302
      196   TOTAL-ERROR
       73   WKR-DS-T-17V00-S
       96   WRK-CS-02V02
       79   WRK-CS-18V00
       88   WRK-DS-LS-01V00. . . . . . . .  M780 M783 786 795 M853 M856 859 868 M891 M894 896 905 M1013 M1017 1020 1029 M1051
                                            M1053 1055 1064 M1170 M1173 1176 1180
       77   WRK-DS-LS-0201P. . . . . . . .  M973 M978 981 M1131 M1136 1139
       43   WRK-DS-LS-18V00. . . . . . . .  M740 M742 744 753 M913 M917 919 928 M935 M939 942 952 M1072 M1076 1078 1087 M1094
                                            M1099 1101 1106
       71   WRK-DS-T-09V08 . . . . . . . .  73
       47   WRK-DS-TS-06V06. . . . . . . .  49
       86   WRK-DS-TS-12V00-S. . . . . . .  M760 M762 764 772
       49   WRK-DS-TS-12V00-S-S
       60   WRK-DS-02V00
       89   WRK-DS-03V10 . . . . . . . . .  M912 916 M1071 1075
       94   WRK-DS-05V00 . . . . . . . . .  M981 982 991 M1139 1140 1144
       63   WRK-DS-09V09 . . . . . . . . .  64 M817 M820 M974 977 M1132 1135
       52   WRK-DS-10V00
       64   WRK-DS-18V00-S . . . . . . . .  823 832
       80   WRK-DU-18V00
       53   WRK-XN-00001 . . . . . . . . .  M781 M784 802 806 M818 M821 838 M854 M857 875 880 M936 M940 958 963 M975 M979
                                            997 1001 M1012 M1018 1035 1039 M1095 M1099 1115 1119 M1133 M1137 1153 1157 M1169
                                            M1174 1189
       98   XRAY . . . . . . . . . . . . .  M447 M450 452 M488 M491 493 M528 M531 533 M614 M617 619 M700 M703 705
      267   XXCOMPUTED . . . . . . . . . .  M392
      269   XXCORRECT. . . . . . . . . . .  M392
      262   XXINFO . . . . . . . . . . . .  379 394
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    28
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

      388   BAIL-OUT . . . . . . . . . . .  P305
      396   BAIL-OUT-EX. . . . . . . . . .  E305 G390
      391   BAIL-OUT-WRITE . . . . . . . .  G389
      371   BLANK-LINE-PRINT
     1203   CCVS-EXIT
     1204   CCVS-999999
      280   CCVS1
      397   CCVS1-EXIT . . . . . . . . . .  G286
      287   CLOSE-FILES. . . . . . . . . .  G1205
      315   COLUMN-NAMES-ROUTINE . . . . .  E285
      296   DE-LETE. . . . . . . . . . . .  P413 P434 P458 P474 P499 P515 P539 P554 P578 P600 P625 P640 P663 P686 P711 P727
                                            P749 P769 P791 P811 P828 P847 P864 P884 P901 P924 P947 P967 P987 P1006 P1025
                                            P1044 P1060 P1083 P1110 P1124 P1148 P1162 P1184 P1198
      319   END-ROUTINE. . . . . . . . . .  P288
      323   END-ROUTINE-1
      332   END-ROUTINE-12
      340   END-ROUTINE-13 . . . . . . . .  E288
      321   END-RTN-EXIT
      295   FAIL . . . . . . . . . . . . .  P416 P437 P463 P477 P504 P518 P544 P557 P581 P603 P630 P643 P666 P689 P716 P733
                                            P754 P774 P797 P808 P833 P842 P870 P881 P906 P929 P953 P964 P992 P1003 P1030
                                            P1041 P1065 P1088 P1107 P1121 P1145 P1159 P1181 P1193
      373   FAIL-ROUTINE . . . . . . . . .  P304
      387   FAIL-ROUTINE-EX. . . . . . . .  E304 G381
      382   FAIL-ROUTINE-WRITE . . . . . .  G375 G376
      310   HEAD-ROUTINE . . . . . . . . .  P285
      293   INSPT
      281   OPEN-FILES
      294   PASS . . . . . . . . . . . . .  P408 P429 P453 P469 P494 P510 P534 P551 P573 P595 P620 P637 P658 P681 P706 P722
                                            P745 P765 P787 P803 P824 P844 P860 P876 P897 P920 P943 P959 P983 P998 P1021 P1036
                                            P1056 P1079 P1102 P1116 P1141 P1154 P1177 P1195
      298   PRINT-DETAIL . . . . . . . . .  P421 P442 P466 P483 P507 P524 P547 P563 P586 P608 P633 P649 P671 P694 P719 P736
                                            P757 P777 P800 P814 P836 P850 P873 P887 P909 P932 P956 P970 P995 P1009 P1033
                                            P1047 P1068 P1091 P1113 P1127 P1151 P1165 P1187 P1201
      399   SECT-NC117A-001
      412   SIG-DELETE-GF-1
      863   SIG-DELETE-GF-10-1
      883   SIG-DELETE-GF-10-2
      577   SIG-DELETE-GF-11
      599   SIG-DELETE-GF-12
      624   SIG-DELETE-GF-13-1
      639   SIG-DELETE-GF-13-2
      900   SIG-DELETE-GF-14
      923   SIG-DELETE-GF-15
      946   SIG-DELETE-GF-16-1
      966   SIG-DELETE-GF-16-2
      986   SIG-DELETE-GF-17-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    29
0 Defined   Cross-reference of procedures   References

0    1005   SIG-DELETE-GF-17-2
     1024   SIG-DELETE-GF-18-1
     1043   SIG-DELETE-GF-18-2
      662   SIG-DELETE-GF-19
      433   SIG-DELETE-GF-2
      685   SIG-DELETE-GF-20
      710   SIG-DELETE-GF-21-1
      726   SIG-DELETE-GF-21-2
     1059   SIG-DELETE-GF-22
     1082   SIG-DELETE-GF-23
     1109   SIG-DELETE-GF-24-1
     1123   SIG-DELETE-GF-24-2
     1147   SIG-DELETE-GF-25-1
     1161   SIG-DELETE-GF-25-2
     1183   SIG-DELETE-GF-26-1
     1197   SIG-DELETE-GF-26-2
      457   SIG-DELETE-GF-3-1
      473   SIG-DELETE-GF-3-2
      498   SIG-DELETE-GF-4-1
      514   SIG-DELETE-GF-4-2
      538   SIG-DELETE-GF-5-1
      553   SIG-DELETE-GF-5-2
      748   SIG-DELETE-GF-6
      768   SIG-DELETE-GF-7
      790   SIG-DELETE-GF-8-1
      810   SIG-DELETE-GF-8-2
      827   SIG-DELETE-GF-9-1
      846   SIG-DELETE-GF-9-2
      415   SIG-FAIL-GF-1. . . . . . . . .  G410
      866   SIG-FAIL-GF-10-1 . . . . . . .  G862
      580   SIG-FAIL-GF-11 . . . . . . . .  G575
      602   SIG-FAIL-GF-12 . . . . . . . .  G597
      627   SIG-FAIL-GF-13-1 . . . . . . .  G622
      642   SIG-FAIL-GF-13-2 . . . . . . .  G636
      903   SIG-FAIL-GF-14 . . . . . . . .  G899
      926   SIG-FAIL-GF-15 . . . . . . . .  G922
      949   SIG-FAIL-GF-16-1 . . . . . . .  G945
      989   SIG-FAIL-GF-17-1 . . . . . . .  G985
     1027   SIG-FAIL-GF-18-1 . . . . . . .  G1023
      665   SIG-FAIL-GF-19 . . . . . . . .  G660
      436   SIG-FAIL-GF-2. . . . . . . . .  G431
      688   SIG-FAIL-GF-20 . . . . . . . .  G683
      713   SIG-FAIL-GF-21-1 . . . . . . .  G708
      729   SIG-FAIL-GF-21-2 . . . . . . .  G724
     1062   SIG-FAIL-GF-22 . . . . . . . .  G1058
     1085   SIG-FAIL-GF-23 . . . . . . . .  G1081
      460   SIG-FAIL-GF-3. . . . . . . . .  G455
      476   SIG-FAIL-GF-3-2. . . . . . . .  G471
      501   SIG-FAIL-GF-4-1. . . . . . . .  G496
      517   SIG-FAIL-GF-4-2. . . . . . . .  G512
      541   SIG-FAIL-GF-5-1. . . . . . . .  G536
      556   SIG-FAIL-GF-5-2. . . . . . . .  G550
      751   SIG-FAIL-GF-6. . . . . . . . .  G747
      771   SIG-FAIL-GF-7. . . . . . . . .  G767
      793   SIG-FAIL-GF-8-1. . . . . . . .  G789
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    30
0 Defined   Cross-reference of procedures   References

0     830   SIG-FAIL-GF-9-1. . . . . . . .  G826
      400   SIG-INIT-GF-1
      851   SIG-INIT-GF-10
      564   SIG-INIT-GF-11
      587   SIG-INIT-GF-12
      609   SIG-INIT-GF-13
      888   SIG-INIT-GF-14
      910   SIG-INIT-GF-15
      933   SIG-INIT-GF-16
      971   SIG-INIT-GF-17
     1010   SIG-INIT-GF-18
      650   SIG-INIT-GF-19
      422   SIG-INIT-GF-2
      672   SIG-INIT-GF-20
      695   SIG-INIT-GF-21
     1048   SIG-INIT-GF-22
     1069   SIG-INIT-GF-23
     1092   SIG-INIT-GF-24
     1128   SIG-INIT-GF-25
     1166   SIG-INIT-GF-26
      443   SIG-INIT-GF-3
      484   SIG-INIT-GF-4
      525   SIG-INIT-GF-5
      737   SIG-INIT-GF-6
      758   SIG-INIT-GF-7
      778   SIG-INIT-GF-8
      815   SIG-INIT-GF-9
      404   SIG-TEST-GF-1-0
      406   SIG-TEST-GF-1-1
      855   SIG-TEST-GF-10-0
      858   SIG-TEST-GF-10-1
      874   SIG-TEST-GF-10-2
      569   SIG-TEST-GF-11-0
      571   SIG-TEST-GF-11-1
      591   SIG-TEST-GF-12-0
      593   SIG-TEST-GF-12-1
      615   SIG-TEST-GF-13-0
      618   SIG-TEST-GF-13-1
      634   SIG-TEST-GF-13-2
      893   SIG-TEST-GF-14-0
      895   SIG-TEST-GF-14-1
      915   SIG-TEST-GF-15-0
      918   SIG-TEST-GF-15-1
      937   SIG-TEST-GF-16-0
      941   SIG-TEST-GF-16-1
      957   SIG-TEST-GF-16-2
      976   SIG-TEST-GF-17-0
      980   SIG-TEST-GF-17-1
      996   SIG-TEST-GF-17-2
     1015   SIG-TEST-GF-18-0
     1019   SIG-TEST-GF-18-1
     1034   SIG-TEST-GF-18-2
      655   SIG-TEST-GF-19
      426   SIG-TEST-GF-2
      677   SIG-TEST-GF-20-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    31
0 Defined   Cross-reference of procedures   References

0     679   SIG-TEST-GF-20-1
      701   SIG-TEST-GF-21-0
      704   SIG-TEST-GF-21-1
      720   SIG-TEST-GF-21-2
     1052   SIG-TEST-GF-22-0
     1054   SIG-TEST-GF-22-1
     1074   SIG-TEST-GF-23-0
     1077   SIG-TEST-GF-23-1
     1097   SIG-TEST-GF-24-0
     1100   SIG-TEST-GF-24-1
     1114   SIG-TEST-GF-24-2
     1134   SIG-TEST-GF-25-0
     1138   SIG-TEST-GF-25-1
     1152   SIG-TEST-GF-25-2
     1171   SIG-TEST-GF-26-0
     1175   SIG-TEST-GF-26-1
     1188   SIG-TEST-GF-26-2
      448   SIG-TEST-GF-3-0
      451   SIG-TEST-GF-3-1
      467   SIG-TEST-GF-3-2
      489   SIG-TEST-GF-4-1-0
      492   SIG-TEST-GF-4-1-1
      508   SIG-TEST-GF-4-2
      529   SIG-TEST-GF-5-0
      532   SIG-TEST-GF-5-1
      548   SIG-TEST-GF-5-2
      741   SIG-TEST-GF-6-0
      743   SIG-TEST-GF-6-1
      761   SIG-TEST-GF-7-0
      763   SIG-TEST-GF-7-1
      782   SIG-TEST-GF-8-0
      785   SIG-TEST-GF-8-1
      801   SIG-TEST-GF-8-2
      819   SIG-TEST-GF-9-0
      822   SIG-TEST-GF-9-1
      837   SIG-TEST-GF-9-2
      419   SIG-WRITE-GF-1 . . . . . . . .  G411 G414
      871   SIG-WRITE-GF-10-1. . . . . . .  G861 G865
      885   SIG-WRITE-GF-10-2. . . . . . .  G877 G882
      584   SIG-WRITE-GF-11. . . . . . . .  G576 G579
      606   SIG-WRITE-GF-12. . . . . . . .  G598 G601
      631   SIG-WRITE-GF-13-1. . . . . . .  G623 G626
      647   SIG-WRITE-GF-13-2. . . . . . .  G638 G641
      907   SIG-WRITE-GF-14. . . . . . . .  G898 G902
      930   SIG-WRITE-GF-15. . . . . . . .  G921 G925
      954   SIG-WRITE-GF-16-1. . . . . . .  G944 G948
      968   SIG-WRITE-GF-16-2. . . . . . .  G960 G965
      993   SIG-WRITE-GF-17-1. . . . . . .  G984 G988
     1007   SIG-WRITE-GF-17-2. . . . . . .  G999 G1004
     1031   SIG-WRITE-GF-18-1. . . . . . .  G1022 G1026
     1045   SIG-WRITE-GF-18-2. . . . . . .  G1037 G1042
      669   SIG-WRITE-GF-19. . . . . . . .  G661 G664
      440   SIG-WRITE-GF-2 . . . . . . . .  G432 G435
      692   SIG-WRITE-GF-20. . . . . . . .  G684 G687
      717   SIG-WRITE-GF-21-1. . . . . . .  G709 G712
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    32
0 Defined   Cross-reference of procedures   References

0     734   SIG-WRITE-GF-21-2. . . . . . .  G725 G728
     1066   SIG-WRITE-GF-22. . . . . . . .  G1057 G1061
     1089   SIG-WRITE-GF-23. . . . . . . .  G1080 G1084
     1111   SIG-WRITE-GF-24-1. . . . . . .  G1103 G1108
     1125   SIG-WRITE-GF-24-2. . . . . . .  G1117 G1122
     1149   SIG-WRITE-GF-25-1. . . . . . .  G1142 G1146
     1163   SIG-WRITE-GF-25-2. . . . . . .  G1155 G1160
     1185   SIG-WRITE-GF-26-1. . . . . . .  G1178 G1182
     1199   SIG-WRITE-GF-26-2. . . . . . .  G1194 G1196
      464   SIG-WRITE-GF-3 . . . . . . . .  G456 G459
      481   SIG-WRITE-GF-3-2 . . . . . . .  G472 G475
      505   SIG-WRITE-GF-4-1 . . . . . . .  G497 G500
      522   SIG-WRITE-GF-4-2 . . . . . . .  G513 G516
      545   SIG-WRITE-GF-5-1 . . . . . . .  G537 G540
      561   SIG-WRITE-GF-5-2 . . . . . . .  G552 G555
      755   SIG-WRITE-GF-6 . . . . . . . .  G746 G750
      775   SIG-WRITE-GF-7 . . . . . . . .  G766 G770
      798   SIG-WRITE-GF-8-1 . . . . . . .  G788 G792
      812   SIG-WRITE-GF-8-2 . . . . . . .  G804 G809
      834   SIG-WRITE-GF-9-1 . . . . . . .  G825 G829
      848   SIG-WRITE-GF-9-2 . . . . . . .  G843 G845
      291   TERMINATE-CALL
      289   TERMINATE-CCVS
      352   WRITE-LINE . . . . . . . . . .  P302 P303 P311 P312 P313 P314 P316 P317 P318 P320 P322 P331 P339 P345 P350 P351
                                            P379 P383 P385 P394
      368   WRT-LN . . . . . . . . . . . .  P358 P359 P360 P361 P362 P363 P364 P367 P372
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    33
0 Defined   Cross-reference of programs     References

        3   NC117A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC117A    Date 06/04/2022  Time 11:59:37   Page    34
0LineID  Message code  Message text

     39  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC117A:
 *    Source records = 1205
 *    Data Division statements = 123
 *    Procedure Division statements = 719
 *    Generated COBOL statements = 0
 *    Program complexity factor = 730
0End of compilation 1,  program NC117A,  highest severity 0.
0Return code 0
