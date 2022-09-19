1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:49   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:49   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1204.2
   000002         000200 PROGRAM-ID.                                                      NC1204.2
   000003         000300     NC120A.                                                      NC1204.2
   000004         000500*                                                              *  NC1204.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1204.2
   000006         000700*                                                              *  NC1204.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1204.2
   000008         000900*                                                              *  NC1204.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1204.2
   000010         001100*                                                              *  NC1204.2
   000011         001300*                                                              *  NC1204.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1204.2
   000013         001500*                                                              *  NC1204.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1204.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1204.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1204.2
   000017         001900*                                                              *  NC1204.2
   000018         002100*                                                                 NC1204.2
   000019         002200*    PROGRAM NC120A TESTS THE USE OF THE "SIGN" CLAUSE WITH       NC1204.2
   000020         002300*    FORMATS 1 AND 2 OF THE MULTIPLY STATEMENT.                   NC1204.2
   000021         002400*    ALL COMBINATIONS OF THE SIGN CLAUSE ARE USED WITH            NC1204.2
   000022         002500*    DATA ITEMS OF VARIOUS LENGTHS.                               NC1204.2
   000023         002600*                                                                 NC1204.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1204.2
   000025         002800 CONFIGURATION SECTION.                                           NC1204.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1204.2
   000027         003000     XXXXX082.                                                    NC1204.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1204.2
   000029         003200     XXXXX083.                                                    NC1204.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1204.2
   000031         003400 FILE-CONTROL.                                                    NC1204.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1204.2 36
   000033         003600     XXXXX055.                                                    NC1204.2
   000034         003700 DATA DIVISION.                                                   NC1204.2
   000035         003800 FILE SECTION.                                                    NC1204.2
   000036         003900 FD  PRINT-FILE.                                                  NC1204.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1204.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1204.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1204.2
   000040         004300 77  WRK-DS-LS-18V00                PICTURE S9(18)                NC1204.2
   000041         004400           SIGN IS LEADING SEPARATE CHARACTER.                    NC1204.2
   000042         004500 77  A06THREES-DS-LS-03V03          PICTURE S999V999 VALUE 333.333NC1204.2
   000043         004600           SIGN IS LEADING.                                       NC1204.2
   000044         004700 77  WRK-DS-TS-06V06                PICTURE S9(6)V9(6)            NC1204.2
   000045         004800           SIGN IS TRAILING SEPARATE CHARACTER.                   NC1204.2
   000046         004900 77  WRK-DS-TS-12V00-S-S REDEFINES WRK-DS-TS-06V06 PICTURE S9(12) NC1204.2 44
   000047         005000           SIGN TRAILING SEPARATE.                                NC1204.2
   000048         005100 77  A08TWOS-DS-02V06            PICTURE S99V9(6) VALUE 22.222222.NC1204.2
   000049         005200 77  WRK-DS-10V00                PICTURE S9(10).                  NC1204.2
   000050         005300 77  WRK-XN-00001                PICTURE X.                       NC1204.2
   000051         005400 77  A10ONES-DS-T-10V00            PICTURE S9(10)                 NC1204.2
   000052         005500         SIGN IS TRAILING                                         NC1204.2
   000053         005600                                 VALUE 1111111111.                NC1204.2
   000054         005700 77  A12THREES-DS-LS-06V06          PICTURE S9(6)V9(6)            NC1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800             SIGN IS LEADING SEPARATE                             NC1204.2
   000056         005900                                 VALUE 333333.333333.             NC1204.2
   000057         006000 77  WRK-DS-02V00                PICTURE S99.                     NC1204.2
   000058         006100 77  AZERO-DS-LS-05V05              PICTURE S9(5)V9(5) VALUE ZERO NC1204.2 IMP
   000059         006200           SIGN IS LEADING SEPARATE CHARACTER.                    NC1204.2
   000060         006300 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1204.2
   000061         006400 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC1204.2 60
   000062         006500 77  A05ONES-DS-LS-00V05            PICTURE SV9(5) VALUE .11111   NC1204.2
   000063         006600           SIGN IS LEADING SEPARATE CHARACTER.                    NC1204.2
   000064         006700 77  A12ONES-DS-12V00            PICTURE S9(12)                   NC1204.2
   000065         006800                                 VALUE 111111111111.              NC1204.2
   000066         006900 77  A01ONE-DS-TS-P0801            PICTURE SP(8)9 VALUE .000000001NC1204.2
   000067         007000            SIGN IS TRAILING SEPARATE.                            NC1204.2
   000068         007100 77  WRK-DS-T-09V08                PICTURE S9(9)V9(8)             NC1204.2
   000069         007200           SIGN IS TRAILING.                                      NC1204.2
   000070         007300 77  WKR-DS-T-17V00-S REDEFINES WRK-DS-T-09V08 PICTURE S9(17)     NC1204.2 68
   000071         007400         SIGN TRAILING.                                           NC1204.2
   000072         007500 77  A18ONES-DS-18V00            PICTURE S9(18)                   NC1204.2
   000073         007600                                 VALUE 111111111111111111.        NC1204.2
   000074         007700 77  WRK-DS-LS-0201P                PICTURE S99P                  NC1204.2
   000075         007800            SIGN IS LEADING SEPARATE.                             NC1204.2
   000076         007900 77  WRK-CS-18V00                PICTURE S9(18) COMPUTATIONAL.    NC1204.2
   000077         008000 77  WRK-DU-18V00                PICTURE 9(18).                   NC1204.2
   000078         008100 77  A99-CS-02V00                PICTURE S99 COMPUTATIONAL        NC1204.2
   000079         008200                                 VALUE 99.                        NC1204.2
   000080         008300 77  A01ONE-CS-00V01             PICTURE SV9 COMPUTATIONAL        NC1204.2
   000081         008400                                 VALUE .1.                        NC1204.2
   000082         008500 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC1204.2
   000083         008600 77  WRK-DS-TS-12V00-S                PICTURE S9(12).             NC1204.2
   000084         008700 77  WRK-DS-LS-01V00             PICTURE S9 LEADING SEPARATE.     NC1204.2
   000085         008800 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC1204.2
   000086         008900 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC1204.2
   000087         009000                                 VALUE 111111111.111111111.       NC1204.2
   000088         009100 77  A02TWOS-DU-02V00            PICTURE 99  VALUE 22.            NC1204.2
   000089         009200 77  WRK-DS-05V00                PICTURE S9(5).                   NC1204.2
   000090         009300 77  A02TWOS-DS-03V02            PICTURE S999V99 VALUE +022.00.   NC1204.2
   000091         009400 77  WRK-CS-02V02                PICTURE S99V99  COMPUTATIONAL.   NC1204.2
   000092         009500 77  A990-DS-0201P               PICTURE S99P   VALUE +990.       NC1204.2
   000093         009600 77  XRAY                        PICTURE X.                       NC1204.2
   000094         009700 77  A01ONES-CS-18V00   PICTURE S9(18) COMPUTATIONAL              NC1204.2
   000095         009800             VALUE +000000000000000001.                           NC1204.2
   000096         009900 77  A02THREES-CS-18V00 PICTURE S9(18) COMPUTATIONAL              NC1204.2
   000097         010000             VALUE -000000000000000033.                           NC1204.2
   000098         010100 77  A18SIXES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1204.2
   000099         010200             VALUE 666666666666666666.                            NC1204.2
   000100         010300 77  A16NINES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1204.2
   000101         010400             VALUE 009999999999999999.                            NC1204.2
   000102         010500 77  A14TWOS-CU-18V00   PICTURE 9(18) COMPUTATIONAL               NC1204.2
   000103         010600             VALUE 000022222222222222.                            NC1204.2
   000104         010700 01  MULTIPLY-DATA LEADING SEPARATE.                              NC1204.2
   000105         010800     02 MULT1                           PICTURE IS 999V99         NC1204.2
   000106         010900     VALUE IS 80.12.                                              NC1204.2
   000107         011000     02 MULT2                           PICTURE IS 999V999.       NC1204.2
   000108         011100     02 MULT3                           PICTURE IS $$99.99.       NC1204.2
   000109         011200     02 MULT4                           PICTURE IS S99            NC1204.2
   000110         011300     VALUE IS -56.                                                NC1204.2
   000111         011400     02 MULT5                           PICTURE IS 9 VALUE IS 4.  NC1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 MULT6                           PICTURE IS 99 VALUE IS    NC1204.2
   000113         011600     20.                                                          NC1204.2
   000114         011700 01  DIVIDE-DATA TRAILING SEPARATE.                               NC1204.2
   000115         011800     02 DIV1                            PICTURE IS 9(4)V99        NC1204.2
   000116         011900     VALUE IS 1620.36.                                            NC1204.2
   000117         012000     02 DIV2                            PICTURE IS 99V9           NC1204.2
   000118         012100     VALUE IS 44.1.                                               NC1204.2
   000119         012200     02 DIV3                            PICTURE IS 9(4)V9         NC1204.2
   000120         012300     VALUE IS 1661.7.                                             NC1204.2
   000121         012400     02 DIV4                            PICTURE IS S9V999         NC1204.2
   000122         012500     VALUE IS -9.642.                                             NC1204.2
   000123         012600     02 DIV-02LEVEL-1.                                            NC1204.2
   000124         012700     03 DIV5                            PICTURE IS V99            NC1204.2
   000125         012800     VALUE IS .82.                                                NC1204.2
   000126         012900     03 DIV6                            PICTURE IS 9 VALUE IS 0.  NC1204.2
   000127         013000     03 DIV7                            PICTURE IS 9V9            NC1204.2
   000128         013100     VALUE IS 9.6.                                                NC1204.2
   000129         013200 01  DIV-DATA-2.                                                  NC1204.2
   000130         013300     02 DIV8                            PICTURE IS 99V9.          NC1204.2
   000131         013400     02 DIV9                            PICTURE IS ZZ,ZZZ.9.      NC1204.2
   000132         013500     02 DIV10                           PICTURE IS V999.          NC1204.2
   000133         013600 01  TEST-RESULTS.                                                NC1204.2
   000134         013700     02 FILLER                   PIC X      VALUE SPACE.          NC1204.2 IMP
   000135         013800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1204.2 IMP
   000136         013900     02 FILLER                   PIC X      VALUE SPACE.          NC1204.2 IMP
   000137         014000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1204.2 IMP
   000138         014100     02 FILLER                   PIC X      VALUE SPACE.          NC1204.2 IMP
   000139         014200     02  PAR-NAME.                                                NC1204.2
   000140         014300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1204.2 IMP
   000141         014400       03  PARDOT-X              PIC X      VALUE SPACE.          NC1204.2 IMP
   000142         014500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1204.2 IMP
   000143         014600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1204.2 IMP
   000144         014700     02 RE-MARK                  PIC X(61).                       NC1204.2
   000145         014800 01  TEST-COMPUTED.                                               NC1204.2
   000146         014900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1204.2 IMP
   000147         015000     02 FILLER                   PIC X(17)  VALUE                 NC1204.2
   000148         015100            "       COMPUTED=".                                   NC1204.2
   000149         015200     02 COMPUTED-X.                                               NC1204.2
   000150         015300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1204.2 IMP
   000151         015400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1204.2 150
   000152         015500                                 PIC -9(9).9(9).                  NC1204.2
   000153         015600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1204.2 150
   000154         015700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1204.2 150
   000155         015800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1204.2 150
   000156         015900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1204.2 150
   000157         016000         04 COMPUTED-18V0                    PIC -9(18).          NC1204.2
   000158         016100         04 FILLER                           PIC X.               NC1204.2
   000159         016200     03 FILLER PIC X(50) VALUE SPACE.                             NC1204.2 IMP
   000160         016300 01  TEST-CORRECT.                                                NC1204.2
   000161         016400     02 FILLER PIC X(30) VALUE SPACE.                             NC1204.2 IMP
   000162         016500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1204.2
   000163         016600     02 CORRECT-X.                                                NC1204.2
   000164         016700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1204.2 IMP
   000165         016800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1204.2 164
   000166         016900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1204.2 164
   000167         017000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1204.2 164
   000168         017100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1204.2 164
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     03      CR-18V0 REDEFINES CORRECT-A.                         NC1204.2 164
   000170         017300         04 CORRECT-18V0                     PIC -9(18).          NC1204.2
   000171         017400         04 FILLER                           PIC X.               NC1204.2
   000172         017500     03 FILLER PIC X(2) VALUE SPACE.                              NC1204.2 IMP
   000173         017600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1204.2 IMP
   000174         017700 01  CCVS-C-1.                                                    NC1204.2
   000175         017800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1204.2
   000176         017900-    "SS  PARAGRAPH-NAME                                          NC1204.2
   000177         018000-    "       REMARKS".                                            NC1204.2
   000178         018100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1204.2 IMP
   000179         018200 01  CCVS-C-2.                                                    NC1204.2
   000180         018300     02 FILLER                     PIC X        VALUE SPACE.      NC1204.2 IMP
   000181         018400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1204.2
   000182         018500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1204.2 IMP
   000183         018600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1204.2
   000184         018700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1204.2 IMP
   000185         018800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1204.2 IMP
   000186         018900 01  REC-CT                        PIC 99       VALUE ZERO.       NC1204.2 IMP
   000187         019000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1204.2 IMP
   000188         019100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1204.2 IMP
   000189         019200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1204.2 IMP
   000190         019300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1204.2 IMP
   000191         019400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1204.2 IMP
   000192         019500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1204.2 IMP
   000193         019600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1204.2 IMP
   000194         019700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1204.2 IMP
   000195         019800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1204.2 IMP
   000196         019900 01  CCVS-H-1.                                                    NC1204.2
   000197         020000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1204.2 IMP
   000198         020100     02  FILLER                    PIC X(42)    VALUE             NC1204.2
   000199         020200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1204.2
   000200         020300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1204.2 IMP
   000201         020400 01  CCVS-H-2A.                                                   NC1204.2
   000202         020500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1204.2 IMP
   000203         020600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1204.2
   000204         020700   02  FILLER                        PIC XXXX   VALUE             NC1204.2
   000205         020800     "4.2 ".                                                      NC1204.2
   000206         020900   02  FILLER                        PIC X(28)  VALUE             NC1204.2
   000207         021000            " COPY - NOT FOR DISTRIBUTION".                       NC1204.2
   000208         021100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1204.2 IMP
   000209         021200                                                                  NC1204.2
   000210         021300 01  CCVS-H-2B.                                                   NC1204.2
   000211         021400   02  FILLER                        PIC X(15)  VALUE             NC1204.2
   000212         021500            "TEST RESULT OF ".                                    NC1204.2
   000213         021600   02  TEST-ID                       PIC X(9).                    NC1204.2
   000214         021700   02  FILLER                        PIC X(4)   VALUE             NC1204.2
   000215         021800            " IN ".                                               NC1204.2
   000216         021900   02  FILLER                        PIC X(12)  VALUE             NC1204.2
   000217         022000     " HIGH       ".                                              NC1204.2
   000218         022100   02  FILLER                        PIC X(22)  VALUE             NC1204.2
   000219         022200            " LEVEL VALIDATION FOR ".                             NC1204.2
   000220         022300   02  FILLER                        PIC X(58)  VALUE             NC1204.2
   000221         022400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1204.2
   000222         022500 01  CCVS-H-3.                                                    NC1204.2
   000223         022600     02  FILLER                      PIC X(34)  VALUE             NC1204.2
   000224         022700            " FOR OFFICIAL USE ONLY    ".                         NC1204.2
   000225         022800     02  FILLER                      PIC X(58)  VALUE             NC1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1204.2
   000227         023000     02  FILLER                      PIC X(28)  VALUE             NC1204.2
   000228         023100            "  COPYRIGHT   1985 ".                                NC1204.2
   000229         023200 01  CCVS-E-1.                                                    NC1204.2
   000230         023300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1204.2 IMP
   000231         023400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1204.2
   000232         023500     02 ID-AGAIN                     PIC X(9).                    NC1204.2
   000233         023600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1204.2 IMP
   000234         023700 01  CCVS-E-2.                                                    NC1204.2
   000235         023800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1204.2 IMP
   000236         023900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1204.2 IMP
   000237         024000     02 CCVS-E-2-2.                                               NC1204.2
   000238         024100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1204.2 IMP
   000239         024200         03 FILLER                   PIC X      VALUE SPACE.      NC1204.2 IMP
   000240         024300         03 ENDER-DESC               PIC X(44)  VALUE             NC1204.2
   000241         024400            "ERRORS ENCOUNTERED".                                 NC1204.2
   000242         024500 01  CCVS-E-3.                                                    NC1204.2
   000243         024600     02  FILLER                      PIC X(22)  VALUE             NC1204.2
   000244         024700            " FOR OFFICIAL USE ONLY".                             NC1204.2
   000245         024800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1204.2 IMP
   000246         024900     02  FILLER                      PIC X(58)  VALUE             NC1204.2
   000247         025000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1204.2
   000248         025100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1204.2 IMP
   000249         025200     02 FILLER                       PIC X(15)  VALUE             NC1204.2
   000250         025300             " COPYRIGHT 1985".                                   NC1204.2
   000251         025400 01  CCVS-E-4.                                                    NC1204.2
   000252         025500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1204.2 IMP
   000253         025600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1204.2
   000254         025700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1204.2 IMP
   000255         025800     02 FILLER                       PIC X(40)  VALUE             NC1204.2
   000256         025900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1204.2
   000257         026000 01  XXINFO.                                                      NC1204.2
   000258         026100     02 FILLER                       PIC X(19)  VALUE             NC1204.2
   000259         026200            "*** INFORMATION ***".                                NC1204.2
   000260         026300     02 INFO-TEXT.                                                NC1204.2
   000261         026400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1204.2 IMP
   000262         026500       04 XXCOMPUTED                 PIC X(20).                   NC1204.2
   000263         026600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1204.2 IMP
   000264         026700       04 XXCORRECT                  PIC X(20).                   NC1204.2
   000265         026800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1204.2
   000266         026900 01  HYPHEN-LINE.                                                 NC1204.2
   000267         027000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1204.2 IMP
   000268         027100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1204.2
   000269         027200-    "*****************************************".                 NC1204.2
   000270         027300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1204.2
   000271         027400-    "******************************".                            NC1204.2
   000272         027500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1204.2
   000273         027600     "NC120A".                                                    NC1204.2
   000274         027700 PROCEDURE DIVISION.                                              NC1204.2
   000275         027800 CCVS1 SECTION.                                                   NC1204.2
   000276         027900 OPEN-FILES.                                                      NC1204.2
   000277         028000     OPEN     OUTPUT PRINT-FILE.                                  NC1204.2 36
   000278         028100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1204.2 272 213 272 232
   000279         028200     MOVE    SPACE TO TEST-RESULTS.                               NC1204.2 IMP 133
   000280         028300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1204.2 305 310
   000281         028400     GO TO CCVS1-EXIT.                                            NC1204.2 392
   000282         028500 CLOSE-FILES.                                                     NC1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1204.2 314 335 36
   000284         028700 TERMINATE-CCVS.                                                  NC1204.2
   000285         028800     EXIT PROGRAM.                                                NC1204.2
   000286         028900 TERMINATE-CALL.                                                  NC1204.2
   000287         029000     STOP     RUN.                                                NC1204.2
   000288         029100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1204.2 137 189
   000289         029200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1204.2 137 190
   000290         029300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1204.2 137 188
   000291         029400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1204.2 137 187
   000292         029500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1204.2 144
   000293         029600 PRINT-DETAIL.                                                    NC1204.2
   000294         029700     IF REC-CT NOT EQUAL TO ZERO                                  NC1204.2 186 IMP
   000295      1  029800             MOVE "." TO PARDOT-X                                 NC1204.2 141
   000296      1  029900             MOVE REC-CT TO DOTVALUE.                             NC1204.2 186 142
   000297         030000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1204.2 133 37 347
   000298         030100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1204.2 137 347
   000299      1  030200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1204.2 368 382
   000300      1  030300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1204.2 383 391
   000301         030400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1204.2 IMP 137 IMP 149
   000302         030500     MOVE SPACE TO CORRECT-X.                                     NC1204.2 IMP 163
   000303         030600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1204.2 186 IMP IMP 139
   000304         030700     MOVE     SPACE TO RE-MARK.                                   NC1204.2 IMP 144
   000305         030800 HEAD-ROUTINE.                                                    NC1204.2
   000306         030900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1204.2 196 38 347
   000307         031000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1204.2 201 38 347
   000308         031100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1204.2 210 38 347
   000309         031200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1204.2 222 38 347
   000310         031300 COLUMN-NAMES-ROUTINE.                                            NC1204.2
   000311         031400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1204.2 174 38 347
   000312         031500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1204.2 179 38 347
   000313         031600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1204.2 266 38 347
   000314         031700 END-ROUTINE.                                                     NC1204.2
   000315         031800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1204.2 266 38 347
   000316         031900 END-RTN-EXIT.                                                    NC1204.2
   000317         032000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1204.2 229 38 347
   000318         032100 END-ROUTINE-1.                                                   NC1204.2
   000319         032200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1204.2 188 192 189
   000320         032300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1204.2 192 187 192
   000321         032400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1204.2 190 192
   000322         032500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1204.2
   000323         032600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1204.2 190 252
   000324         032700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1204.2 192 254
   000325         032800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1204.2 251 237
   000326         032900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1204.2 234 38 347
   000327         033000  END-ROUTINE-12.                                                 NC1204.2
   000328         033100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1204.2 240
   000329         033200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1204.2 188 IMP
   000330      1  033300         MOVE "NO " TO ERROR-TOTAL                                NC1204.2 238
   000331         033400         ELSE                                                     NC1204.2
   000332      1  033500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1204.2 188 238
   000333         033600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1204.2 234 38
   000334         033700     PERFORM WRITE-LINE.                                          NC1204.2 347
   000335         033800 END-ROUTINE-13.                                                  NC1204.2
   000336         033900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1204.2 187 IMP
   000337      1  034000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1204.2 238
   000338      1  034100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1204.2 187 238
   000339         034200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1204.2 240
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1204.2 234 38 347
   000341         034400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1204.2 189 IMP
   000342      1  034500          MOVE "NO " TO ERROR-TOTAL                               NC1204.2 238
   000343      1  034600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1204.2 189 238
   000344         034700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1204.2 240
   000345         034800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1204.2 234 38 347
   000346         034900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1204.2 242 38 347
   000347         035000 WRITE-LINE.                                                      NC1204.2
   000348         035100     ADD 1 TO RECORD-COUNT.                                       NC1204.2 194
   000349         035200     IF RECORD-COUNT GREATER 42                                   NC1204.2 194
   000350      1  035300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1204.2 38 193
   000351      1  035400         MOVE SPACE TO DUMMY-RECORD                               NC1204.2 IMP 38
   000352      1  035500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1204.2 38
   000353      1  035600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1204.2 196 38 363
   000354      1  035700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1204.2 201 38 363
   000355      1  035800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1204.2 210 38 363
   000356      1  035900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1204.2 222 38 363
   000357      1  036000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1204.2 174 38 363
   000358      1  036100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1204.2 179 38 363
   000359      1  036200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1204.2 266 38 363
   000360      1  036300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1204.2 193 38
   000361      1  036400         MOVE ZERO TO RECORD-COUNT.                               NC1204.2 IMP 194
   000362         036500     PERFORM WRT-LN.                                              NC1204.2 363
   000363         036600 WRT-LN.                                                          NC1204.2
   000364         036700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1204.2 38
   000365         036800     MOVE SPACE TO DUMMY-RECORD.                                  NC1204.2 IMP 38
   000366         036900 BLANK-LINE-PRINT.                                                NC1204.2
   000367         037000     PERFORM WRT-LN.                                              NC1204.2 363
   000368         037100 FAIL-ROUTINE.                                                    NC1204.2
   000369         037200     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1204.2 149 IMP
   000370      1  037300            GO TO FAIL-ROUTINE-WRITE.                             NC1204.2 377
   000371         037400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1204.2 163 IMP 377
   000372         037500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1204.2 195 265
   000373         037600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1204.2 260
   000374         037700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1204.2 257 38 347
   000375         037800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1204.2 IMP 265
   000376         037900     GO TO  FAIL-ROUTINE-EX.                                      NC1204.2 382
   000377         038000 FAIL-ROUTINE-WRITE.                                              NC1204.2
   000378         038100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1204.2 145 37 347
   000379         038200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1204.2 195 173
   000380         038300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1204.2 160 37 347
   000381         038400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1204.2 IMP 173
   000382         038500 FAIL-ROUTINE-EX. EXIT.                                           NC1204.2
   000383         038600 BAIL-OUT.                                                        NC1204.2
   000384         038700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1204.2 150 IMP 386
   000385         038800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1204.2 164 IMP 391
   000386         038900 BAIL-OUT-WRITE.                                                  NC1204.2
   000387         039000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1204.2 164 264 150 262
   000388         039100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1204.2 195 265
   000389         039200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1204.2 257 38 347
   000390         039300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1204.2 IMP 265
   000391         039400 BAIL-OUT-EX. EXIT.                                               NC1204.2
   000392         039500 CCVS1-EXIT.                                                      NC1204.2
   000393         039600     EXIT.                                                        NC1204.2
   000394         039700 SECTION-NC120A-001 SECTION.                                      NC1204.2
   000395         039800 SIG-INIT-GF-14.                                                  NC1204.2
   000396         039900     MOVE  "MULTIPLY BY GIVING" TO FEATURE.                       NC1204.2 135
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000398         040100     MOVE   80.12  TO MULT1.                                      NC1204.2 105
   000399         040200     MOVE    0     TO MULT2.                                      NC1204.2 107
   000400         040300 SIG-TEST-GF-14-0.                                                NC1204.2
   000401         040400     MULTIPLY MULT1 BY 4.3 GIVING MULT2.                          NC1204.2 105 107
   000402         040500 SIG-TEST-GF-14-1.                                                NC1204.2
   000403         040600     IF       MULT2 NOT EQUAL TO 344.516                          NC1204.2 107
   000404      1  040700              GO TO SIG-FAIL-GF-14.                               NC1204.2 410
   000405         040800     PERFORM  PASS                                                NC1204.2 289
   000406         040900              GO TO SIG-WRITE-GF-14.                              NC1204.2 414
   000407         041000 SIG-DELETE-GF-14.                                                NC1204.2
   000408         041100     PERFORM  DE-LETE.                                            NC1204.2 291
   000409         041200     GO TO    SIG-WRITE-GF-14.                                    NC1204.2 414
   000410         041300 SIG-FAIL-GF-14.                                                  NC1204.2
   000411         041400     PERFORM  FAIL.                                               NC1204.2 290
   000412         041500     MOVE     MULT2 TO COMPUTED-N.                                NC1204.2 107 151
   000413         041600     MOVE     +344.516 TO CORRECT-N.                              NC1204.2 165
   000414         041700 SIG-WRITE-GF-14.                                                 NC1204.2
   000415         041800     MOVE "SIG-TEST-GF-14" TO PAR-NAME.                           NC1204.2 139
   000416         041900     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000417         042000 SIG-INIT-GF-15.                                                  NC1204.2
   000418         042100     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000419         042200     MOVE   80.12  TO MULT1.                                      NC1204.2 105
   000420         042300     MOVE     0    TO MULT3.                                      NC1204.2 108
   000421         042400 SIG-TEST-GF-15-0.                                                NC1204.2
   000422         042500     MULTIPLY .9 BY MULT1 GIVING MULT3 ROUNDED.                   NC1204.2 105 108
   000423         042600 SIG-TEST-GF-15-1.                                                NC1204.2
   000424         042700     IF       MULT3 NOT EQUAL TO " $72.11"                        NC1204.2 108
   000425      1  042800              GO TO SIG-FAIL-GF-15.                               NC1204.2 431
   000426         042900     PERFORM  PASS.                                               NC1204.2 289
   000427         043000     GO TO    SIG-WRITE-GF-15.                                    NC1204.2 435
   000428         043100 SIG-DELETE-GF-15.                                                NC1204.2
   000429         043200     PERFORM  DE-LETE.                                            NC1204.2 291
   000430         043300     GO TO    SIG-WRITE-GF-15.                                    NC1204.2 435
   000431         043400 SIG-FAIL-GF-15.                                                  NC1204.2
   000432         043500     PERFORM  FAIL.                                               NC1204.2 290
   000433         043600     MOVE     MULT3 TO COMPUTED-A.                                NC1204.2 108 150
   000434         043700     MOVE " l72.11" TO CORRECT-A.                                 NC1204.2 164
   000435         043800 SIG-WRITE-GF-15.                                                 NC1204.2
   000436         043900     MOVE "SIG-TEST-GF-15 " TO PAR-NAME.                          NC1204.2 139
   000437         044000     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000438         044100 SIG-INIT-GF-16.                                                  NC1204.2
   000439         044200     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000440         044300     MOVE   -56    TO MULT4.                                      NC1204.2 109
   000441         044400     MOVE    80.12 TO MULT1.                                      NC1204.2 105
   000442         044500     MOVE     4    TO MULT5.                                      NC1204.2 111
   000443         044600 SIG-TEST-GF-16-0.                                                NC1204.2
   000444         044700     MULTIPLY MULT4 BY MULT1 GIVING MULT5 ON SIZE ERROR           NC1204.2 109 105 111
   000445      1  044800              MOVE "H" TO XRAY.                                   NC1204.2 93
   000446         044900 SIG-TEST-GF-16-1.                                                NC1204.2
   000447         045000     IF       XRAY EQUAL TO "H"                                   NC1204.2 93
   000448      1  045100              PERFORM PASS                                        NC1204.2 289
   000449         045200              ELSE                                                NC1204.2
   000450      1  045300              GO TO SIG-FAIL-GF-16-1.                             NC1204.2 455
   000451         045400     GO TO    SIG-WRITE-GF-16-1.                                  NC1204.2 459
   000452         045500 SIG-DELETE-GF-16-1.                                              NC1204.2
   000453         045600     PERFORM  DE-LETE.                                            NC1204.2 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     GO TO    SIG-WRITE-GF-16-1.                                  NC1204.2 459
   000455         045800 SIG-FAIL-GF-16-1.                                                NC1204.2
   000456         045900     MOVE     MULT5 TO COMPUTED-N.                                NC1204.2 111 151
   000457         046000     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1204.2 144
   000458         046100     PERFORM  FAIL.                                               NC1204.2 290
   000459         046200 SIG-WRITE-GF-16-1.                                               NC1204.2
   000460         046300     MOVE "SIG-TEST-GF-16-1 " TO PAR-NAME.                        NC1204.2 139
   000461         046400     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000462         046500 SIG-TEST-GF-16-2.                                                NC1204.2
   000463         046600     IF       MULT5 NOT EQUAL TO 4                                NC1204.2 111
   000464      1  046700              GO TO SIG-FAIL-GF-16-2.                             NC1204.2 470
   000465         046800     PERFORM  PASS.                                               NC1204.2 289
   000466         046900     GO TO    SIG-WRITE-GF-16-2.                                  NC1204.2 475
   000467         047000 SIG-DELETE-GF-16-2.                                              NC1204.2
   000468         047100     PERFORM  DE-LETE.                                            NC1204.2 291
   000469         047200     GO TO    SIG-WRITE-GF-16-2.                                  NC1204.2 475
   000470         047300 SIG-FAIL-GF-16-2.                                                NC1204.2
   000471         047400     PERFORM  FAIL.                                               NC1204.2 290
   000472         047500     MOVE     MULT5 TO COMPUTED-N.                                NC1204.2 111 151
   000473         047600     MOVE     +4 TO CORRECT-N.                                    NC1204.2 165
   000474         047700     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1204.2 144
   000475         047800 SIG-WRITE-GF-16-2.                                               NC1204.2
   000476         047900     MOVE "SIG-TEST-GF-16-2 " TO PAR-NAME.                        NC1204.2 139
   000477         048000     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000478         048100 SIG-INIT-GF-1.                                                   NC1204.2
   000479         048200     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000480         048300     MOVE     4 TO MULT5.                                         NC1204.2 111
   000481         048400     MOVE   "A" TO XRAY.                                          NC1204.2 93
   000482         048500 SIG-TEST-GF-1-0.                                                 NC1204.2
   000483         048600     MULTIPLY 3.3 BY -3 GIVING MULT5 ROUNDED ON SIZE ERROR        NC1204.2 111
   000484      1  048700              MOVE "J" TO XRAY.                                   NC1204.2 93
   000485         048800 SIG-TEST-GF-1-1.                                                 NC1204.2
   000486         048900     IF       XRAY NOT EQUAL TO "J"                               NC1204.2 93
   000487      1  049000              GO TO SIG-FAIL-GF-1-1                               NC1204.2 494
   000488         049100              ELSE                                                NC1204.2
   000489      1  049200              PERFORM PASS.                                       NC1204.2 289
   000490         049300     GO TO    SIG-WRITE-GF-1-1.                                   NC1204.2 498
   000491         049400 SIG-DELETE-GF-1-1.                                               NC1204.2
   000492         049500     PERFORM  DE-LETE.                                            NC1204.2 291
   000493         049600     GO TO    SIG-WRITE-GF-1-1.                                   NC1204.2 498
   000494         049700 SIG-FAIL-GF-1-1.                                                 NC1204.2
   000495         049800     MOVE     MULT5 TO COMPUTED-N.                                NC1204.2 111 151
   000496         049900     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1204.2 144
   000497         050000     PERFORM  FAIL.                                               NC1204.2 290
   000498         050100 SIG-WRITE-GF-1-1.                                                NC1204.2
   000499         050200     MOVE "SIG-TEST-GF-1-1 " TO PAR-NAME.                         NC1204.2 139
   000500         050300     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000501         050400 SIG-TEST-GF-1-2.                                                 NC1204.2
   000502         050500     IF       MULT5 EQUAL TO 4                                    NC1204.2 111
   000503      1  050600              PERFORM PASS                                        NC1204.2 289
   000504         050700              ELSE                                                NC1204.2
   000505      1  050800              GO TO SIG-FAIL-GF-1-2.                              NC1204.2 510
   000506         050900     GO TO    SIG-WRITE-GF-1-2.                                   NC1204.2 516
   000507         051000 SIG-DELETE-GF-1-2.                                               NC1204.2
   000508         051100     PERFORM  DE-LETE.                                            NC1204.2 291
   000509         051200     GO TO    SIG-WRITE-GF-1-2.                                   NC1204.2 516
   000510         051300 SIG-FAIL-GF-1-2.                                                 NC1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     PERFORM  FAIL.                                               NC1204.2 290
   000512         051500     MOVE     MULT5 TO COMPUTED-N.                                NC1204.2 111 151
   000513         051600     MOVE     +4 TO CORRECT-N.                                    NC1204.2 165
   000514         051700     MOVE     4 TO MULT5.                                         NC1204.2 111
   000515         051800     MOVE     "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.        NC1204.2 144
   000516         051900 SIG-WRITE-GF-1-2.                                                NC1204.2
   000517         052000     MOVE "SIG-TEST-GF-1-2 " TO PAR-NAME.                         NC1204.2 139
   000518         052100     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000519         052200 SIG-INIT-GF-2.                                                   NC1204.2
   000520         052300     MOVE "MULTIPLY BY" TO FEATURE.                               NC1204.2 135
   000521         052400     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000522         052500     MOVE     4 TO MULT5.                                         NC1204.2 111
   000523         052600 SIG-TEST-GF-2-0.                                                 NC1204.2
   000524         052700     MULTIPLY MULT5 BY MULT1.                                     NC1204.2 111 105
   000525         052800 SIG-TEST-GF-2-1.                                                 NC1204.2
   000526         052900     IF       MULT1 EQUAL TO 320.48                               NC1204.2 105
   000527      1  053000              PERFORM PASS                                        NC1204.2 289
   000528         053100              ELSE                                                NC1204.2
   000529      1  053200              GO TO SIG-FAIL-GF-2.                                NC1204.2 534
   000530         053300     GO TO    SIG-WRITE-GF-2.                                     NC1204.2 538
   000531         053400 SIG-DELETE-GF-2.                                                 NC1204.2
   000532         053500     PERFORM  DE-LETE.                                            NC1204.2 291
   000533         053600     GO TO    SIG-WRITE-GF-2.                                     NC1204.2 538
   000534         053700 SIG-FAIL-GF-2.                                                   NC1204.2
   000535         053800     PERFORM  FAIL.                                               NC1204.2 290
   000536         053900     MOVE     MULT1 TO COMPUTED-N.                                NC1204.2 105 151
   000537         054000     MOVE     +320.48 TO CORRECT-N.                               NC1204.2 165
   000538         054100 SIG-WRITE-GF-2.                                                  NC1204.2
   000539         054200     MOVE "SIG-TEST-GF-2 " TO PAR-NAME.                           NC1204.2 139
   000540         054300     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000541         054400 SIG-INIT-GF-3.                                                   NC1204.2
   000542         054500     MOVE "MULTIPLY BY" TO FEATURE.                               NC1204.2 135
   000543         054600     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000544         054700     MOVE   -56 TO MULT4.                                         NC1204.2 109
   000545         054800 SIG-TEST-GF-3-0.                                                 NC1204.2
   000546         054900     MULTIPLY -1.3 BY MULT4 ROUNDED.                              NC1204.2 109
   000547         055000 SIG-TEST-GF-3-1.                                                 NC1204.2
   000548         055100     IF       MULT4 EQUAL TO 73                                   NC1204.2 109
   000549      1  055200              PERFORM PASS                                        NC1204.2 289
   000550         055300              ELSE                                                NC1204.2
   000551      1  055400              GO TO SIG-FAIL-GF-3.                                NC1204.2 556
   000552         055500     GO TO    SIG-WRITE-GF-3.                                     NC1204.2 560
   000553         055600 SIG-DELETE-GF-3.                                                 NC1204.2
   000554         055700     PERFORM  DE-LETE.                                            NC1204.2 291
   000555         055800     GO TO    SIG-WRITE-GF-3.                                     NC1204.2 560
   000556         055900 SIG-FAIL-GF-3.                                                   NC1204.2
   000557         056000     PERFORM  FAIL.                                               NC1204.2 290
   000558         056100     MOVE     MULT4 TO COMPUTED-N.                                NC1204.2 109 151
   000559         056200     MOVE     +73 TO CORRECT-N.                                   NC1204.2 165
   000560         056300 SIG-WRITE-GF-3.                                                  NC1204.2
   000561         056400     MOVE "SIG-TEST-GF-3 " TO PAR-NAME.                           NC1204.2 139
   000562         056500     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000563         056600 SIG-INIT-GF-4.                                                   NC1204.2
   000564         056700     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000565         056800     MOVE     4 TO MULT5.                                         NC1204.2 111
   000566         056900     MOVE   "B" TO XRAY.                                          NC1204.2 93
   000567         057000 SIG-TEST-GF-4-0.                                                 NC1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MULTIPLY MULT5 BY MULT5 ON SIZE ERROR                        NC1204.2 111 111
   000569      1  057200              MOVE "K" TO XRAY.                                   NC1204.2 93
   000570         057300 SIG-TEST-GF-4-1.                                                 NC1204.2
   000571         057400     IF       XRAY EQUAL TO "K"                                   NC1204.2 93
   000572      1  057500              PERFORM PASS                                        NC1204.2 289
   000573         057600              ELSE                                                NC1204.2
   000574      1  057700              GO TO SIG-FAIL-GF-4-1.                              NC1204.2 579
   000575         057800     GO TO    SIG-WRITE-GF-4-1.                                   NC1204.2 583
   000576         057900 SIG-DELETE-GF-4-1.                                               NC1204.2
   000577         058000     PERFORM  DE-LETE.                                            NC1204.2 291
   000578         058100     GO TO    SIG-WRITE-GF-4-1.                                   NC1204.2 583
   000579         058200 SIG-FAIL-GF-4-1.                                                 NC1204.2
   000580         058300     MOVE     MULT5 TO COMPUTED-N.                                NC1204.2 111 151
   000581         058400     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1204.2 144
   000582         058500     PERFORM  FAIL.                                               NC1204.2 290
   000583         058600 SIG-WRITE-GF-4-1.                                                NC1204.2
   000584         058700     MOVE "SIG-TEST-GF-4-1 " TO PAR-NAME.                         NC1204.2 139
   000585         058800     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000586         058900 SIG-TEST-GF-4-2.                                                 NC1204.2
   000587         059000     IF       MULT5 EQUAL TO 4                                    NC1204.2 111
   000588      1  059100              PERFORM PASS                                        NC1204.2 289
   000589         059200              ELSE                                                NC1204.2
   000590      1  059300              GO TO SIG-FAIL-GF-4-2.                              NC1204.2 595
   000591         059400     GO TO    SIG-WRITE-GF-4-2.                                   NC1204.2 600
   000592         059500 SIG-DELETE-GF-4-2.                                               NC1204.2
   000593         059600     PERFORM  DE-LETE.                                            NC1204.2 291
   000594         059700     GO TO    SIG-WRITE-GF-4-2.                                   NC1204.2 600
   000595         059800 SIG-FAIL-GF-4-2.                                                 NC1204.2
   000596         059900     PERFORM  FAIL.                                               NC1204.2 290
   000597         060000     MOVE     MULT5 TO COMPUTED-N.                                NC1204.2 111 151
   000598         060100     MOVE     +4 TO CORRECT-N.                                    NC1204.2 165
   000599         060200     MOVE "NOT AFFECTED BY SIZE ERROR" TO RE-MARK.                NC1204.2 144
   000600         060300 SIG-WRITE-GF-4-2.                                                NC1204.2
   000601         060400     MOVE "SIG-TEST-GF-4-2" TO PAR-NAME.                          NC1204.2 139
   000602         060500     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000603         060600 SIG-INIT-GF-5.                                                   NC1204.2
   000604         060700     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000605         060800     MOVE    20 TO MULT6.                                         NC1204.2 112
   000606         060900     MOVE   "C" TO XRAY.                                          NC1204.2 93
   000607         061000 SIG-TEST-GF-5-0.                                                 NC1204.2
   000608         061100     MULTIPLY 4.99 BY MULT6 ROUNDED ON SIZE ERROR                 NC1204.2 112
   000609      1  061200              MOVE "L" TO XRAY.                                   NC1204.2 93
   000610         061300 SIG-TEST-GF-5-1.                                                 NC1204.2
   000611         061400     IF       XRAY EQUAL TO "L"                                   NC1204.2 93
   000612      1  061500              PERFORM PASS                                        NC1204.2 289
   000613         061600              ELSE                                                NC1204.2
   000614      1  061700              GO TO SIG-FAIL-GF-5-1.                              NC1204.2 619
   000615         061800     GO TO    SIG-WRITE-GF-5-1.                                   NC1204.2 623
   000616         061900 SIG-DELETE-GF-5-1.                                               NC1204.2
   000617         062000     PERFORM  DE-LETE.                                            NC1204.2 291
   000618         062100     GO TO    SIG-WRITE-GF-5-1.                                   NC1204.2 623
   000619         062200 SIG-FAIL-GF-5-1.                                                 NC1204.2
   000620         062300     MOVE     MULT6 TO COMPUTED-N.                                NC1204.2 112 151
   000621         062400     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1204.2 144
   000622         062500     PERFORM  FAIL.                                               NC1204.2 290
   000623         062600 SIG-WRITE-GF-5-1.                                                NC1204.2
   000624         062700     MOVE "SIG-TEST-GF-5-1" TO PAR-NAME.                          NC1204.2 139
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000626         062900 SIG-TEST-GF-5-2.                                                 NC1204.2
   000627         063000     IF       MULT6 EQUAL TO 20                                   NC1204.2 112
   000628      1  063100              PERFORM PASS                                        NC1204.2 289
   000629         063200              ELSE                                                NC1204.2
   000630      1  063300              GO TO SIG-FAIL-GF-5-2.                              NC1204.2 635
   000631         063400     GO TO    SIG-WRITE-GF-5-2.                                   NC1204.2 640
   000632         063500 SIG-DELETE-GF-5-2.                                               NC1204.2
   000633         063600     PERFORM  DE-LETE.                                            NC1204.2 291
   000634         063700     GO TO    SIG-WRITE-GF-5-2.                                   NC1204.2 640
   000635         063800 SIG-FAIL-GF-5-2.                                                 NC1204.2
   000636         063900     PERFORM  FAIL.                                               NC1204.2 290
   000637         064000     MOVE     MULT6 TO COMPUTED-N.                                NC1204.2 112 151
   000638         064100     MOVE     +20 TO CORRECT-N.                                   NC1204.2 165
   000639         064200     MOVE "NOT AFFECTED BY SIZE ERROR" TO RE-MARK.                NC1204.2 144
   000640         064300 SIG-WRITE-GF-5-2.                                                NC1204.2
   000641         064400     MOVE "SIG-TEST-GF-5-2" TO PAR-NAME.                          NC1204.2 139
   000642         064500     PERFORM  PRINT-DETAIL.                                       NC1204.2 293
   000643         064600 SIG-INIT-GF-6.                                                   NC1204.2
   000644         064700     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000645         064800     MOVE 222222222222 TO WRK-DS-LS-18V00.                        NC1204.2 40
   000646         064900 SIG-TEST-GF-6-0.                                                 NC1204.2
   000647         065000     MULTIPLY A06THREES-DS-LS-03V03 BY WRK-DS-LS-18V00.           NC1204.2 42 40
   000648         065100 SIG-TEST-GF-6-1.                                                 NC1204.2
   000649         065200     IF WRK-DS-LS-18V00 EQUAL TO 000074073999999925               NC1204.2 40
   000650      1  065300         PERFORM PASS                                             NC1204.2 289
   000651      1  065400         GO TO SIG-WRITE-GF-6.                                    NC1204.2 660
   000652         065500     GO TO SIG-FAIL-GF-6.                                         NC1204.2 656
   000653         065600 SIG-DELETE-GF-6.                                                 NC1204.2
   000654         065700     PERFORM DE-LETE.                                             NC1204.2 291
   000655         065800     GO TO SIG-WRITE-GF-6.                                        NC1204.2 660
   000656         065900 SIG-FAIL-GF-6.                                                   NC1204.2
   000657         066000     MOVE  000074073999999925 TO CORRECT-18V0.                    NC1204.2 170
   000658         066100     MOVE  WRK-DS-LS-18V00       TO COMPUTED-18V0.                NC1204.2 40 157
   000659         066200     PERFORM FAIL.                                                NC1204.2 290
   000660         066300 SIG-WRITE-GF-6.                                                  NC1204.2
   000661         066400     MOVE "SIG-TEST-GF-6         " TO PAR-NAME.                   NC1204.2 139
   000662         066500     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000663         066600 SIG-INIT-GF-7.                                                   NC1204.2
   000664         066700     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000665         066800     MOVE A08TWOS-DS-02V06 TO WRK-DS-TS-06V06.                    NC1204.2 48 44
   000666         066900 SIG-TEST-GF-7-0.                                                 NC1204.2
   000667         067000     MULTIPLY 0.4 BY WRK-DS-TS-06V06 ROUNDED.                     NC1204.2 44
   000668         067100 SIG-TEST-GF-7-1.                                                 NC1204.2
   000669         067200     IF WRK-DS-TS-12V00-S-S EQUAL TO 000008888889                 NC1204.2 46
   000670      1  067300         PERFORM PASS                                             NC1204.2 289
   000671      1  067400         GO TO SIG-WRITE-GF-7.                                    NC1204.2 680
   000672         067500     GO TO SIG-FAIL-GF-7.                                         NC1204.2 676
   000673         067600 SIG-DELETE-GF-7.                                                 NC1204.2
   000674         067700     PERFORM DE-LETE.                                             NC1204.2 291
   000675         067800     GO TO SIG-WRITE-GF-7.                                        NC1204.2 680
   000676         067900 SIG-FAIL-GF-7.                                                   NC1204.2
   000677         068000     MOVE  WRK-DS-TS-12V00-S-S     TO COMPUTED-18V0.              NC1204.2 46 157
   000678         068100     MOVE  000008888889       TO CORRECT-18V0.                    NC1204.2 170
   000679         068200     PERFORM FAIL.                                                NC1204.2 290
   000680         068300 SIG-WRITE-GF-7.                                                  NC1204.2
   000681         068400     MOVE "SIG-TEST-GF-7         " TO PAR-NAME.                   NC1204.2 139
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000683         068600 SIG-INIT-GF-8.                                                   NC1204.2
   000684         068700     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000685         068800     MOVE "0" TO WRK-XN-00001.                                    NC1204.2 50
   000686         068900     MOVE A10ONES-DS-T-10V00 TO WRK-DS-10V00.                     NC1204.2 51 49
   000687         069000 SIG-TEST-GF-8-0.                                                 NC1204.2
   000688         069100     MULTIPLY A12THREES-DS-LS-06V06 BY WRK-DS-10V00               NC1204.2 54 49
   000689      1  069200         ON SIZE ERROR MOVE "1" TO WRK-XN-00001.                  NC1204.2 50
   000690         069300 SIG-TEST-GF-8-1.                                                 NC1204.2
   000691         069400     IF WRK-DS-10V00 EQUAL TO 1111111111                          NC1204.2 49
   000692      1  069500         PERFORM PASS                                             NC1204.2 289
   000693      1  069600         GO TO SIG-WRITE-GF-8-1.                                  NC1204.2 702
   000694         069700     GO TO SIG-FAIL-GF-8-1.                                       NC1204.2 698
   000695         069800 SIG-DELETE-GF-8-1.                                               NC1204.2
   000696         069900     PERFORM DE-LETE.                                             NC1204.2 291
   000697         070000     GO TO SIG-WRITE-GF-8-1.                                      NC1204.2 702
   000698         070100 SIG-FAIL-GF-8-1.                                                 NC1204.2
   000699         070200     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1204.2 49 157
   000700         070300     MOVE  1111111111         TO CORRECT-18V0.                    NC1204.2 170
   000701         070400     PERFORM FAIL.                                                NC1204.2 290
   000702         070500 SIG-WRITE-GF-8-1.                                                NC1204.2
   000703         070600     MOVE "SIG-TEST-GF-8-1         " TO PAR-NAME.                 NC1204.2 139
   000704         070700     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000705         070800 SIG-TEST-GF-8-2.                                                 NC1204.2
   000706         070900     IF WRK-XN-00001 EQUAL TO "1"                                 NC1204.2 50
   000707      1  071000         PERFORM PASS                                             NC1204.2 289
   000708      1  071100         GO TO SIG-WRITE-GF-8-2.                                  NC1204.2 715
   000709         071200     MOVE "1" TO CORRECT-A.                                       NC1204.2 164
   000710         071300     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1204.2 50 150
   000711         071400     PERFORM FAIL.                                                NC1204.2 290
   000712         071500     GO TO SIG-WRITE-GF-8-2.                                      NC1204.2 715
   000713         071600 SIG-DELETE-GF-8-2.                                               NC1204.2
   000714         071700     PERFORM DE-LETE.                                             NC1204.2 291
   000715         071800 SIG-WRITE-GF-8-2.                                                NC1204.2
   000716         071900     MOVE "SIG-TEST-GF-8-2         " TO PAR-NAME.                 NC1204.2 139
   000717         072000     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000718         072100 SIG-INIT-GF-9.                                                   NC1204.2
   000719         072200     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000720         072300     MOVE "1" TO WRK-XN-00001.                                    NC1204.2 50
   000721         072400     MOVE -99 TO WRK-DS-02V00.                                    NC1204.2 57
   000722         072500 SIG-TEST-GF-9-0.                                                 NC1204.2
   000723         072600     MULTIPLY AZERO-DS-LS-05V05 BY WRK-DS-02V00                   NC1204.2 58 57
   000724      1  072700         ON SIZE ERROR MOVE "0" TO WRK-XN-00001.                  NC1204.2 50
   000725         072800 SIG-TEST-GF-9-1.                                                 NC1204.2
   000726         072900     IF WRK-DS-02V00 EQUAL TO 00                                  NC1204.2 57
   000727      1  073000         PERFORM PASS                                             NC1204.2 289
   000728      1  073100         GO TO SIG-WRITE-GF-9-1.                                  NC1204.2 737
   000729         073200     GO TO SIG-FAIL-GF-9-1.                                       NC1204.2 733
   000730         073300 SIG-DELETE-GF-9-1.                                               NC1204.2
   000731         073400     PERFORM DE-LETE.                                             NC1204.2 291
   000732         073500     GO TO SIG-WRITE-GF-9-1.                                      NC1204.2 737
   000733         073600 SIG-FAIL-GF-9-1.                                                 NC1204.2
   000734         073700     MOVE  WRK-DS-02V00       TO COMPUTED-N.                      NC1204.2 57 151
   000735         073800     MOVE  00                 TO CORRECT-N.                       NC1204.2 165
   000736         073900     PERFORM FAIL.                                                NC1204.2 290
   000737         074000 SIG-WRITE-GF-9-1.                                                NC1204.2
   000738         074100     MOVE "SIG-TEST-GF-9-1         " TO PAR-NAME.                 NC1204.2 139
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000740         074300 SIG-TEST-GF-9-2.                                                 NC1204.2
   000741         074400     IF WRK-XN-00001 EQUAL TO "1"                                 NC1204.2 50
   000742      1  074500         PERFORM PASS                                             NC1204.2 289
   000743      1  074600         GO TO SIG-WRITE-GF-9-2.                                  NC1204.2 750
   000744         074700     MOVE "1" TO CORRECT-A.                                       NC1204.2 164
   000745         074800     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1204.2 50 150
   000746         074900     PERFORM FAIL.                                                NC1204.2 290
   000747         075000     GO TO SIG-WRITE-GF-9-2.                                      NC1204.2 750
   000748         075100 SIG-DELETE-GF-9-2.                                               NC1204.2
   000749         075200     PERFORM DE-LETE.                                             NC1204.2 291
   000750         075300 SIG-WRITE-GF-9-2.                                                NC1204.2
   000751         075400     MOVE "SIG-TEST-GF-9-2         " TO PAR-NAME.                 NC1204.2 139
   000752         075500     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000753         075600 SIG-INIT-GF-10.                                                  NC1204.2
   000754         075700     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000755         075800     MOVE "0" TO WRK-XN-00001.                                    NC1204.2 50
   000756         075900     MOVE -01 TO WRK-DS-02V00.                                    NC1204.2 57
   000757         076000 SIG-TEST-GF-10-0.                                                NC1204.2
   000758         076100     MULTIPLY 99.5 BY WRK-DS-02V00 ROUNDED                        NC1204.2 57
   000759      1  076200         ON SIZE ERROR MOVE "1" TO WRK-XN-00001.                  NC1204.2 50
   000760         076300 SIG-TEST-GF-10-1.                                                NC1204.2
   000761         076400     IF WRK-DS-02V00 EQUAL TO -01                                 NC1204.2 57
   000762      1  076500         PERFORM PASS                                             NC1204.2 289
   000763      1  076600         GO TO SIG-WRITE-GF-10-1.                                 NC1204.2 772
   000764         076700     GO TO SIG-FAIL-GF-10-1.                                      NC1204.2 768
   000765         076800 SIG-DELETE-GF-10-1.                                              NC1204.2
   000766         076900     PERFORM DE-LETE.                                             NC1204.2 291
   000767         077000     GO TO SIG-WRITE-GF-10-1.                                     NC1204.2 772
   000768         077100 SIG-FAIL-GF-10-1.                                                NC1204.2
   000769         077200     MOVE  WRK-DS-02V00       TO COMPUTED-N.                      NC1204.2 57 151
   000770         077300     MOVE  -01                TO CORRECT-N.                       NC1204.2 165
   000771         077400     PERFORM FAIL.                                                NC1204.2 290
   000772         077500 SIG-WRITE-GF-10-1.                                               NC1204.2
   000773         077600     MOVE "SIG-TEST-GF-10-1         " TO PAR-NAME.                NC1204.2 139
   000774         077700     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000775         077800 SIG-TEST-GF-10-2.                                                NC1204.2
   000776         077900     IF WRK-XN-00001 EQUAL TO "1"                                 NC1204.2 50
   000777      1  078000         PERFORM PASS                                             NC1204.2 289
   000778      1  078100         GO TO SIG-WRITE-GF-10-2.                                 NC1204.2 785
   000779         078200     MOVE "1" TO CORRECT-A.                                       NC1204.2 164
   000780         078300     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1204.2 50 150
   000781         078400     PERFORM FAIL.                                                NC1204.2 290
   000782         078500     GO TO SIG-WRITE-GF-10-2.                                     NC1204.2 785
   000783         078600 SIG-DELETE-GF-10-2.                                              NC1204.2
   000784         078700     PERFORM DE-LETE.                                             NC1204.2 291
   000785         078800 SIG-WRITE-GF-10-2.                                               NC1204.2
   000786         078900     MOVE "SIG-TEST-GF-10-2         " TO PAR-NAME.                NC1204.2 139
   000787         079000     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000788         079100 SIG-INIT-GF-11.                                                  NC1204.2
   000789         079200     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000790         079300     MOVE "1" TO WRK-XN-00001.                                    NC1204.2 50
   000791         079400     MOVE -01 TO WRK-DS-02V00.                                    NC1204.2 57
   000792         079500 SIG-TEST-GF-11-0.                                                NC1204.2
   000793         079600     MULTIPLY 99.4 BY WRK-DS-02V00 ROUNDED                        NC1204.2 57
   000794      1  079700         ON SIZE ERROR MOVE "0" TO WRK-XN-00001.                  NC1204.2 50
   000795         079800 SIG-TEST-GF-11-1.                                                NC1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     IF WRK-DS-02V00 EQUAL TO -99                                 NC1204.2 57
   000797      1  080000         PERFORM PASS                                             NC1204.2 289
   000798      1  080100         GO TO SIG-WRITE-GF-11-1.                                 NC1204.2 807
   000799         080200     GO TO SIG-FAIL-GF-11-1.                                      NC1204.2 803
   000800         080300 SIG-DELETE-GF-11-1.                                              NC1204.2
   000801         080400     PERFORM DE-LETE.                                             NC1204.2 291
   000802         080500     GO TO SIG-WRITE-GF-11-1.                                     NC1204.2 807
   000803         080600 SIG-FAIL-GF-11-1.                                                NC1204.2
   000804         080700     MOVE  WRK-DS-02V00       TO COMPUTED-N.                      NC1204.2 57 151
   000805         080800     MOVE  -99                TO CORRECT-N.                       NC1204.2 165
   000806         080900     PERFORM FAIL.                                                NC1204.2 290
   000807         081000 SIG-WRITE-GF-11-1.                                               NC1204.2
   000808         081100     MOVE "SIG-TEST-GF-11-1         " TO PAR-NAME.                NC1204.2 139
   000809         081200     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000810         081300 SIG-TEST-GF-11-2.                                                NC1204.2
   000811         081400     IF WRK-XN-00001 EQUAL TO "1"                                 NC1204.2 50
   000812      1  081500         PERFORM PASS                                             NC1204.2 289
   000813      1  081600         GO TO SIG-WRITE-GF-11-2.                                 NC1204.2 820
   000814         081700     MOVE "1" TO CORRECT-A.                                       NC1204.2 164
   000815         081800     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1204.2 50 150
   000816         081900     PERFORM FAIL.                                                NC1204.2 290
   000817         082000     GO TO SIG-WRITE-GF-11-2.                                     NC1204.2 820
   000818         082100 SIG-DELETE-GF-11-2.                                              NC1204.2
   000819         082200     PERFORM DE-LETE.                                             NC1204.2 291
   000820         082300 SIG-WRITE-GF-11-2.                                               NC1204.2
   000821         082400     MOVE "SIG-TEST-GF-11-2         " TO PAR-NAME.                NC1204.2 139
   000822         082500     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000823         082600 SIG-INIT-GF-17.                                                  NC1204.2
   000824         082700     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000825         082800     MOVE "MULTIPLY BY GIVING  " TO FEATURE.                      NC1204.2 135
   000826         082900     MOVE ZERO TO WRK-DS-09V09.                                   NC1204.2 IMP 60
   000827         083000 SIG-TEST-GF-17-0.                                                NC1204.2
   000828         083100     MULTIPLY A06THREES-DS-LS-03V03 BY A12THREES-DS-LS-06V06      NC1204.2 42 54
   000829         083200         GIVING WRK-DS-09V09.                                     NC1204.2 60
   000830         083300 SIG-TEST-GF-17-1.                                                NC1204.2
   000831         083400     IF WRK-DS-18V00-S EQUAL TO 111110999999888889                NC1204.2 61
   000832      1  083500         PERFORM PASS                                             NC1204.2 289
   000833      1  083600         GO TO SIG-WRITE-GF-17.                                   NC1204.2 842
   000834         083700     GO TO SIG-FAIL-GF-17.                                        NC1204.2 838
   000835         083800 SIG-DELETE-GF-17.                                                NC1204.2
   000836         083900     PERFORM DE-LETE.                                             NC1204.2 291
   000837         084000     GO TO SIG-WRITE-GF-17.                                       NC1204.2 842
   000838         084100 SIG-FAIL-GF-17.                                                  NC1204.2
   000839         084200     MOVE  111110999999888889 TO CORRECT-18V0.                    NC1204.2 170
   000840         084300     MOVE  WRK-DS-18V00-S     TO COMPUTED-18V0.                   NC1204.2 61 157
   000841         084400     PERFORM FAIL.                                                NC1204.2 290
   000842         084500 SIG-WRITE-GF-17.                                                 NC1204.2
   000843         084600     MOVE "SIG-TEST-GF-17         " TO PAR-NAME.                  NC1204.2 139
   000844         084700     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000845         084800 SIG-INIT-GF-18.                                                  NC1204.2
   000846         084900     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000847         085000     MOVE ZERO TO WRK-DS-10V00.                                   NC1204.2 IMP 49
   000848         085100 SIG-TEST-GF-18-0.                                                NC1204.2
   000849         085200     MULTIPLY A06THREES-DS-LS-03V03 BY A06THREES-DS-LS-03V03      NC1204.2 42 42
   000850         085300         GIVING WRK-DS-10V00 ROUNDED.                             NC1204.2 49
   000851         085400 SIG-TEST-GF-18-1.                                                NC1204.2
   000852         085500     IF WRK-DS-10V00 EQUAL TO 0000111111                          NC1204.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853      1  085600         PERFORM PASS                                             NC1204.2 289
   000854      1  085700         GO TO SIG-WRITE-GF-18.                                   NC1204.2 863
   000855         085800     GO TO SIG-FAIL-GF-18.                                        NC1204.2 859
   000856         085900 SIG-DELETE-GF-18.                                                NC1204.2
   000857         086000     PERFORM DE-LETE.                                             NC1204.2 291
   000858         086100     GO TO SIG-WRITE-GF-18.                                       NC1204.2 863
   000859         086200 SIG-FAIL-GF-18.                                                  NC1204.2
   000860         086300     MOVE  0000111111         TO CORRECT-18V0.                    NC1204.2 170
   000861         086400     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1204.2 49 157
   000862         086500     PERFORM FAIL.                                                NC1204.2 290
   000863         086600 SIG-WRITE-GF-18.                                                 NC1204.2
   000864         086700     MOVE "SIG-TEST-GF-18         " TO PAR-NAME.                  NC1204.2 139
   000865         086800     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000866         086900 SIG-INIT-GF-19.                                                  NC1204.2
   000867         087000     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000868         087100     MOVE "0" TO WRK-XN-00001.                                    NC1204.2 50
   000869         087200     MOVE ZERO TO WRK-DS-10V00.                                   NC1204.2 IMP 49
   000870         087300 SIG-TEST-GF-19-0.                                                NC1204.2
   000871         087400     MULTIPLY A05ONES-DS-LS-00V05 BY A12ONES-DS-12V00             NC1204.2 62 64
   000872         087500         GIVING WRK-DS-10V00 ON SIZE ERROR                        NC1204.2 49
   000873      1  087600         MOVE "1" TO WRK-XN-00001.                                NC1204.2 50
   000874         087700 SIG-TEST-GF-19-1.                                                NC1204.2
   000875         087800     IF WRK-DS-10V00 EQUAL TO 0000000000                          NC1204.2 49
   000876      1  087900         PERFORM PASS                                             NC1204.2 289
   000877      1  088000         GO TO SIG-WRITE-GF-19-1.                                 NC1204.2 886
   000878         088100     GO TO SIG-FAIL-GF-19-1.                                      NC1204.2 882
   000879         088200 SIG-DELETE-GF-19-1.                                              NC1204.2
   000880         088300     PERFORM DE-LETE.                                             NC1204.2 291
   000881         088400     GO TO SIG-WRITE-GF-19-1.                                     NC1204.2 886
   000882         088500 SIG-FAIL-GF-19-1.                                                NC1204.2
   000883         088600     MOVE  0000000000         TO CORRECT-18V0.                    NC1204.2 170
   000884         088700     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1204.2 49 157
   000885         088800     PERFORM FAIL.                                                NC1204.2 290
   000886         088900 SIG-WRITE-GF-19-1.                                               NC1204.2
   000887         089000     MOVE "SIG-TEST-GF-19-1         " TO PAR-NAME.                NC1204.2 139
   000888         089100     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000889         089200 SIG-TEST-GF-19-2.                                                NC1204.2
   000890         089300     IF WRK-XN-00001 EQUAL TO "1"                                 NC1204.2 50
   000891      1  089400         PERFORM PASS                                             NC1204.2 289
   000892      1  089500         GO TO SIG-WRITE-GF-19-2.                                 NC1204.2 899
   000893         089600     MOVE "1" TO CORRECT-A.                                       NC1204.2 164
   000894         089700     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1204.2 50 150
   000895         089800     PERFORM FAIL.                                                NC1204.2 290
   000896         089900     GO TO SIG-WRITE-GF-19-2.                                     NC1204.2 899
   000897         090000 SIG-DELETE-GF-19-2.                                              NC1204.2
   000898         090100     PERFORM DE-LETE.                                             NC1204.2 291
   000899         090200 SIG-WRITE-GF-19-2.                                               NC1204.2
   000900         090300     MOVE "SIG-TEST-GF-19-2         " TO PAR-NAME.                NC1204.2 139
   000901         090400     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000902         090500 SIG-INIT-GF-20.                                                  NC1204.2
   000903         090600     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000904         090700     MOVE "1" TO WRK-XN-00001.                                    NC1204.2 50
   000905         090800     MOVE ZERO TO WRK-DS-10V00.                                   NC1204.2 IMP 49
   000906         090900 SIG-TEST-GF-20-0.                                                NC1204.2
   000907         091000     MULTIPLY A01ONE-DS-TS-P0801 BY A12ONES-DS-12V00              NC1204.2 66 64
   000908         091100         GIVING WRK-DS-10V00 ON SIZE ERROR                        NC1204.2 49
   000909      1  091200         MOVE "0" TO WRK-XN-00001.                                NC1204.2 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300 SIG-TEST-GF-20-1.                                                NC1204.2
   000911         091400     IF WRK-DS-10V00 EQUAL TO 0000000111                          NC1204.2 49
   000912      1  091500         PERFORM PASS                                             NC1204.2 289
   000913      1  091600         GO TO SIG-WRITE-GF-20-1.                                 NC1204.2 922
   000914         091700     GO TO SIG-FAIL-GF-20-1.                                      NC1204.2 918
   000915         091800 SIG-DELETE-GF-20-1.                                              NC1204.2
   000916         091900     PERFORM DE-LETE.                                             NC1204.2 291
   000917         092000     GO TO SIG-WRITE-GF-20-1.                                     NC1204.2 922
   000918         092100 SIG-FAIL-GF-20-1.                                                NC1204.2
   000919         092200     MOVE  0000000111         TO CORRECT-18V0.                    NC1204.2 170
   000920         092300     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1204.2 49 157
   000921         092400     PERFORM FAIL.                                                NC1204.2 290
   000922         092500 SIG-WRITE-GF-20-1.                                               NC1204.2
   000923         092600     MOVE "SIG-TEST-GF-20-1         " TO PAR-NAME.                NC1204.2 139
   000924         092700     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000925         092800 SIG-TEST-GF-20-2.                                                NC1204.2
   000926         092900     IF WRK-XN-00001 EQUAL TO "1"                                 NC1204.2 50
   000927      1  093000         PERFORM PASS                                             NC1204.2 289
   000928      1  093100         GO TO SIG-WRITE-GF-20-2.                                 NC1204.2 935
   000929         093200     MOVE "1" TO CORRECT-A.                                       NC1204.2 164
   000930         093300     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1204.2 50 150
   000931         093400     PERFORM FAIL.                                                NC1204.2 290
   000932         093500     GO TO SIG-WRITE-GF-20-2.                                     NC1204.2 935
   000933         093600 SIG-DELETE-GF-20-2.                                              NC1204.2
   000934         093700     PERFORM DE-LETE.                                             NC1204.2 291
   000935         093800 SIG-WRITE-GF-20-2.                                               NC1204.2
   000936         093900     MOVE "SIG-TEST-GF-20-2         " TO PAR-NAME.                NC1204.2 139
   000937         094000     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000938         094100 SIG-INIT-GF-21.                                                  NC1204.2
   000939         094200     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000940         094300     MOVE "0" TO WRK-XN-00001.                                    NC1204.2 50
   000941         094400     MOVE ZERO TO WRK-DS-10V00.                                   NC1204.2 IMP 49
   000942         094500 SIG-TEST-GF-21-0.                                                NC1204.2
   000943         094600     MULTIPLY 9.5 BY A10ONES-DS-T-10V00                           NC1204.2 51
   000944         094700         GIVING WRK-DS-10V00 ROUNDED ON SIZE ERROR                NC1204.2 49
   000945      1  094800         MOVE "1" TO WRK-XN-00001.                                NC1204.2 50
   000946         094900 SIG-TEST-GF-21-1.                                                NC1204.2
   000947         095000     IF WRK-DS-10V00 EQUAL TO 0000000000                          NC1204.2 49
   000948      1  095100         PERFORM PASS                                             NC1204.2 289
   000949      1  095200         GO TO SIG-WRITE-GF-21-1.                                 NC1204.2 956
   000950         095300     MOVE  0000000000         TO CORRECT-18V0.                    NC1204.2 170
   000951         095400     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1204.2 49 157
   000952         095500     PERFORM FAIL.                                                NC1204.2 290
   000953         095600     GO TO SIG-WRITE-GF-21-1.                                     NC1204.2 956
   000954         095700 SIG-DELETE-GF-21-1.                                              NC1204.2
   000955         095800     PERFORM DE-LETE.                                             NC1204.2 291
   000956         095900 SIG-WRITE-GF-21-1.                                               NC1204.2
   000957         096000     MOVE "SIG-TEST-GF-21-1         " TO PAR-NAME.                NC1204.2 139
   000958         096100     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000959         096200 SIG-TEST-GF-21-2.                                                NC1204.2
   000960         096300     IF WRK-XN-00001 EQUAL TO "1"                                 NC1204.2 50
   000961      1  096400         PERFORM PASS                                             NC1204.2 289
   000962      1  096500         GO TO SIG-WRITE-GF-21-2.                                 NC1204.2 969
   000963         096600     MOVE "1" TO CORRECT-A.                                       NC1204.2 164
   000964         096700     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1204.2 50 150
   000965         096800     PERFORM FAIL.                                                NC1204.2 290
   000966         096900     GO TO SIG-WRITE-GF-21-2.                                     NC1204.2 969
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000 SIG-DELETE-GF-21-2.                                              NC1204.2
   000968         097100     PERFORM DE-LETE.                                             NC1204.2 291
   000969         097200 SIG-WRITE-GF-21-2.                                               NC1204.2
   000970         097300     MOVE "SIG-TEST-GF-21-2         " TO PAR-NAME.                NC1204.2 139
   000971         097400     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000972         097500 SIG-INIT-GF-22.                                                  NC1204.2
   000973         097600     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   000974         097700     MOVE "1" TO WRK-XN-00001.                                    NC1204.2 50
   000975         097800     MOVE ZERO TO WRK-DS-T-09V08.                                 NC1204.2 IMP 68
   000976         097900 SIG-TEST-GF-22-0.                                                NC1204.2
   000977         098000     MULTIPLY A01ONE-DS-TS-P0801 BY A18ONES-DS-18V00              NC1204.2 66 72
   000978         098100         GIVING WRK-DS-T-09V08 ROUNDED ON SIZE ERROR              NC1204.2 68
   000979      1  098200         MOVE "0" TO WRK-XN-00001.                                NC1204.2 50
   000980         098300 SIG-TEST-GF-22-1.                                                NC1204.2
   000981         098400     IF WKR-DS-T-17V00-S EQUAL TO 11111111111111111               NC1204.2 70
   000982      1  098500         PERFORM PASS                                             NC1204.2 289
   000983      1  098600         GO TO SIG-WRITE-GF-22-1.                                 NC1204.2 990
   000984         098700     MOVE  11111111111111111  TO CORRECT-18V0.                    NC1204.2 170
   000985         098800     MOVE  WKR-DS-T-17V00-S     TO COMPUTED-18V0.                 NC1204.2 70 157
   000986         098900     PERFORM FAIL.                                                NC1204.2 290
   000987         099000     GO TO SIG-WRITE-GF-22-1.                                     NC1204.2 990
   000988         099100 SIG-DELETE-GF-22-1.                                              NC1204.2
   000989         099200     PERFORM DE-LETE.                                             NC1204.2 291
   000990         099300 SIG-WRITE-GF-22-1.                                               NC1204.2
   000991         099400     MOVE "SIG-TEST-GF-22-1         " TO PAR-NAME.                NC1204.2 139
   000992         099500     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   000993         099600 SIG-TEST-GF-22-2.                                                NC1204.2
   000994         099700     IF WRK-XN-00001 EQUAL TO "1"                                 NC1204.2 50
   000995      1  099800         PERFORM PASS                                             NC1204.2 289
   000996      1  099900         GO TO SIG-WRITE-GF-22-2.                                 NC1204.2 1003
   000997         100000     MOVE "1" TO CORRECT-A.                                       NC1204.2 164
   000998         100100     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1204.2 50 150
   000999         100200     PERFORM FAIL.                                                NC1204.2 290
   001000         100300     GO TO SIG-WRITE-GF-22-2.                                     NC1204.2 1003
   001001         100400 SIG-DELETE-GF-22-2.                                              NC1204.2
   001002         100500     PERFORM DE-LETE.                                             NC1204.2 291
   001003         100600 SIG-WRITE-GF-22-2.                                               NC1204.2
   001004         100700     MOVE "SIG-TEST-GF-22-2         " TO PAR-NAME.                NC1204.2 139
   001005         100800     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   001006         100900 SIG-INIT-GF-12.                                                  NC1204.2
   001007         101000     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   001008         101100     MOVE "MULTIPLY BY         " TO FEATURE.                      NC1204.2 135
   001009         101200     MOVE -990 TO WRK-DS-LS-0201P.                                NC1204.2 74
   001010         101300 SIG-TEST-GF-12-0.                                                NC1204.2
   001011         101400     MULTIPLY A01ONE-CS-00V01 BY WRK-DS-LS-0201P.                 NC1204.2 80 74
   001012         101500 SIG-TEST-GF-12-1.                                                NC1204.2
   001013         101600     MOVE WRK-DS-LS-0201P TO WRK-DS-05V00.                        NC1204.2 74 89
   001014         101700     IF WRK-DS-05V00 EQUAL TO -00090                              NC1204.2 89
   001015      1  101800         PERFORM PASS                                             NC1204.2 289
   001016      1  101900         GO TO SIG-WRITE-GF-12.                                   NC1204.2 1023
   001017         102000     MOVE -00090 TO CORRECT-N.                                    NC1204.2 165
   001018         102100     MOVE  WRK-DS-05V00       TO COMPUTED-N.                      NC1204.2 89 151
   001019         102200     PERFORM FAIL.                                                NC1204.2 290
   001020         102300     GO TO SIG-WRITE-GF-12.                                       NC1204.2 1023
   001021         102400 SIG-DELETE-GF-12.                                                NC1204.2
   001022         102500     PERFORM DE-LETE.                                             NC1204.2 291
   001023         102600 SIG-WRITE-GF-12.                                                 NC1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     MOVE "SIG-TEST-GF-12         " TO PAR-NAME.                  NC1204.2 139
   001025         102800     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   001026         102900 SIG-INIT-GF-13.                                                  NC1204.2
   001027         103000     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   001028         103100     MOVE A18ONES-DS-18V00 TO WRK-CS-18V00.                       NC1204.2 72 76
   001029         103200 SIG-TEST-GF-13-0.                                                NC1204.2
   001030         103300     MULTIPLY A01ONE-DS-TS-P0801 BY WRK-CS-18V00.                 NC1204.2 66 76
   001031         103400 SIG-TEST-GF-13-1.                                                NC1204.2
   001032         103500     MOVE WRK-CS-18V00 TO WRK-DU-18V00.                           NC1204.2 76 77
   001033         103600     IF WRK-DU-18V00 EQUAL TO 000000000111111111                  NC1204.2 77
   001034      1  103700         PERFORM PASS                                             NC1204.2 289
   001035      1  103800         GO TO SIG-WRITE-GF-13.                                   NC1204.2 1042
   001036         103900     MOVE  000000000111111111 TO CORRECT-18V0.                    NC1204.2 170
   001037         104000     MOVE WRK-DU-18V00     TO COMPUTED-18V0.                      NC1204.2 77 157
   001038         104100     PERFORM FAIL.                                                NC1204.2 290
   001039         104200     GO TO SIG-WRITE-GF-13.                                       NC1204.2 1042
   001040         104300 SIG-DELETE-GF-13.                                                NC1204.2
   001041         104400     PERFORM DE-LETE.                                             NC1204.2 291
   001042         104500 SIG-WRITE-GF-13.                                                 NC1204.2
   001043         104600     MOVE "SIG-TEST-GF-13         " TO PAR-NAME.                  NC1204.2 139
   001044         104700     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   001045         104800 SIG-INIT-GF-23.                                                  NC1204.2
   001046         104900     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   001047         105000     MOVE ZERO TO WRK-CS-02V02.                                   NC1204.2 IMP 91
   001048         105100 SIG-TEST-GF-23-0.                                                NC1204.2
   001049         105200     MULTIPLY A99-CS-02V00 BY A01ONE-CS-00V01 GIVING WRK-CS-02V02.NC1204.2 78 80 91
   001050         105300 SIG-TEST-GF-23-1.                                                NC1204.2
   001051         105400     MOVE WRK-CS-02V02 TO WRK-DS-TS-06V06.                        NC1204.2 91 44
   001052         105500     IF WRK-DS-TS-12V00-S-S EQUAL TO 000009900000                 NC1204.2 46
   001053      1  105600         PERFORM PASS                                             NC1204.2 289
   001054      1  105700         GO TO SIG-WRITE-GF-23.                                   NC1204.2 1061
   001055         105800     MOVE  000009900000       TO CORRECT-18V0.                    NC1204.2 170
   001056         105900     MOVE  WRK-DS-TS-12V00-S-S     TO COMPUTED-18V0.              NC1204.2 46 157
   001057         106000     PERFORM FAIL.                                                NC1204.2 290
   001058         106100     GO TO SIG-WRITE-GF-23.                                       NC1204.2 1061
   001059         106200 SIG-DELETE-GF-23.                                                NC1204.2
   001060         106300     PERFORM DE-LETE.                                             NC1204.2 291
   001061         106400 SIG-WRITE-GF-23.                                                 NC1204.2
   001062         106500     MOVE "MULTIPLY BY GIVING  " TO FEATURE.                      NC1204.2 135
   001063         106600     MOVE "SIG-TEST-GF-23         " TO PAR-NAME.                  NC1204.2 139
   001064         106700     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   001065         106800 SIG-INIT-GF-24.                                                  NC1204.2
   001066         106900     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   001067         107000     MOVE ZERO TO WRK-CS-18V00.                                   NC1204.2 IMP 76
   001068         107100 SIG-TEST-GF-24-0.                                                NC1204.2
   001069         107200     MULTIPLY A01ONES-CS-18V00 BY A02THREES-CS-18V00              NC1204.2 94 96
   001070         107300             GIVING WRK-CS-18V00.                                 NC1204.2 76
   001071         107400 SIG-TEST-GF-24-1.                                                NC1204.2
   001072         107500     IF WRK-CS-18V00 EQUAL TO -000000000000000033                 NC1204.2 76
   001073      1  107600         PERFORM PASS                                             NC1204.2 289
   001074      1  107700         GO TO SIG-WRITE-GF-24.                                   NC1204.2 1081
   001075         107800     MOVE -000000000000000033 TO CORRECT-18V0.                    NC1204.2 170
   001076         107900     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1204.2 76 157
   001077         108000     PERFORM FAIL.                                                NC1204.2 290
   001078         108100     GO TO SIG-WRITE-GF-24.                                       NC1204.2 1081
   001079         108200 SIG-DELETE-GF-24.                                                NC1204.2
   001080         108300     PERFORM DE-LETE.                                             NC1204.2 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400 SIG-WRITE-GF-24.                                                 NC1204.2
   001082         108500     MOVE "SIG-TEST-GF-24 " TO PAR-NAME.                          NC1204.2 139
   001083         108600     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   001084         108700 SIG-INIT-GF-25.                                                  NC1204.2
   001085         108800     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   001086         108900     MOVE ZERO TO WRK-DU-18V00.                                   NC1204.2 IMP 77
   001087         109000 SIG-TEST-GF-25-0.                                                NC1204.2
   001088         109100     MULTIPLY A02THREES-CS-18V00 BY A14TWOS-CU-18V00              NC1204.2 96 102
   001089         109200             GIVING WRK-DU-18V00.                                 NC1204.2 77
   001090         109300 SIG-TEST-GF-25-1.                                                NC1204.2
   001091         109400     IF WRK-DU-18V00 EQUAL TO 000733333333333326                  NC1204.2 77
   001092      1  109500         PERFORM PASS                                             NC1204.2 289
   001093      1  109600         GO TO SIG-WRITE-GF-25.                                   NC1204.2 1100
   001094         109700     MOVE 000733333333333326 TO CORRECT-18V0.                     NC1204.2 170
   001095         109800     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1204.2 77 157
   001096         109900     PERFORM FAIL.                                                NC1204.2 290
   001097         110000     GO TO SIG-WRITE-GF-25.                                       NC1204.2 1100
   001098         110100 SIG-DELETE-GF-25.                                                NC1204.2
   001099         110200     PERFORM DE-LETE.                                             NC1204.2 291
   001100         110300 SIG-WRITE-GF-25.                                                 NC1204.2
   001101         110400     MOVE "SIG-TEST-GF-25 " TO PAR-NAME.                          NC1204.2 139
   001102         110500     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   001103         110600 SIG-INIT-GF-26.                                                  NC1204.2
   001104         110700     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   001105         110800     MOVE ZERO TO WRK-CS-18V00.                                   NC1204.2 IMP 76
   001106         110900 SIG-TEST-GF-26-0.                                                NC1204.2
   001107         111000     MULTIPLY A02THREES-CS-18V00 BY A16NINES-CU-18V00             NC1204.2 96 100
   001108         111100             GIVING WRK-CS-18V00.                                 NC1204.2 76
   001109         111200 SIG-TEST-GF-26-1.                                                NC1204.2
   001110         111300     IF WRK-CS-18V00 EQUAL TO -329999999999999967                 NC1204.2 76
   001111      1  111400         PERFORM PASS                                             NC1204.2 289
   001112      1  111500         GO TO SIG-WRITE-GF-26.                                   NC1204.2 1119
   001113         111600     MOVE -329999999999999967 TO CORRECT-18V0.                    NC1204.2 170
   001114         111700     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1204.2 76 157
   001115         111800     PERFORM FAIL.                                                NC1204.2 290
   001116         111900     GO TO SIG-WRITE-GF-26.                                       NC1204.2 1119
   001117         112000 SIG-DELETE-GF-26.                                                NC1204.2
   001118         112100     PERFORM DE-LETE.                                             NC1204.2 291
   001119         112200 SIG-WRITE-GF-26.                                                 NC1204.2
   001120         112300     MOVE "SIG-TEST-GF-26 " TO PAR-NAME.                          NC1204.2 139
   001121         112400     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   001122         112500 SIG-INIT-GF-27.                                                  NC1204.2
   001123         112600     MOVE   "VI-42 5.12.4"      TO ANSI-REFERENCE.                NC1204.2 195
   001124         112700     MOVE ZERO TO WRK-DU-18V00.                                   NC1204.2 IMP 77
   001125         112800 SIG-TEST-GF-27-0.                                                NC1204.2
   001126         112900     MULTIPLY A01ONES-CS-18V00 BY A18SIXES-CU-18V00               NC1204.2 94 98
   001127         113000         GIVING WRK-DU-18V00.                                     NC1204.2 77
   001128         113100 SIG-TEST-GF-27-1.                                                NC1204.2
   001129         113200     IF WRK-DU-18V00 EQUAL TO 666666666666666666                  NC1204.2 77
   001130      1  113300         PERFORM PASS                                             NC1204.2 289
   001131      1  113400         GO TO SIG-WRITE-GF-27.                                   NC1204.2 1138
   001132         113500     MOVE 666666666666666666 TO CORRECT-18V0.                     NC1204.2 170
   001133         113600     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1204.2 77 157
   001134         113700     PERFORM FAIL.                                                NC1204.2 290
   001135         113800     GO TO SIG-WRITE-GF-27.                                       NC1204.2 1138
   001136         113900 SIG-DELETE-GF-27.                                                NC1204.2
   001137         114000     PERFORM DE-LETE.                                             NC1204.2 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100 SIG-WRITE-GF-27.                                                 NC1204.2
   001139         114200     MOVE "SIG-TEST-GF-27 " TO PAR-NAME.                          NC1204.2 139
   001140         114300     PERFORM PRINT-DETAIL.                                        NC1204.2 293
   001141         114400     PERFORM END-ROUTINE.                                         NC1204.2 314
   001142         114500 CCVS-EXIT SECTION.                                               NC1204.2
   001143         114600 CCVS-999999.                                                     NC1204.2
   001144         114700     GO TO CLOSE-FILES.                                           NC1204.2 282
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    24
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      195   ANSI-REFERENCE . . . . . . . .  372 379 388 M397 M418 M439 M479 M521 M543 M564 M604 M644 M664 M684 M719 M754
                                            M789 M824 M846 M867 M903 M939 M973 M1007 M1027 M1046 M1066 M1085 M1104 M1123
       58   AZERO-DS-LS-05V05. . . . . . .  723
       80   A01ONE-CS-00V01. . . . . . . .  1011 1049
       66   A01ONE-DS-TS-P0801 . . . . . .  907 977 1030
       94   A01ONES-CS-18V00 . . . . . . .  1069 1126
       96   A02THREES-CS-18V00 . . . . . .  1069 1088 1107
       90   A02TWOS-DS-03V02
       88   A02TWOS-DU-02V00
       62   A05ONES-DS-LS-00V05. . . . . .  871
       42   A06THREES-DS-LS-03V03. . . . .  647 828 849 849
       48   A08TWOS-DS-02V06 . . . . . . .  665
       51   A10ONES-DS-T-10V00 . . . . . .  686 943
       64   A12ONES-DS-12V00 . . . . . . .  871 907
       54   A12THREES-DS-LS-06V06. . . . .  688 828
      102   A14TWOS-CU-18V00 . . . . . . .  1088
      100   A16NINES-CU-18V00. . . . . . .  1107
       86   A18ONES-DS-09V09
       72   A18ONES-DS-18V00 . . . . . . .  977 1028
       98   A18SIXES-CU-18V00. . . . . . .  1126
       78   A99-CS-02V00 . . . . . . . . .  1049
       82   A99-DS-02V00
       92   A990-DS-0201P
      174   CCVS-C-1 . . . . . . . . . . .  311 357
      179   CCVS-C-2 . . . . . . . . . . .  312 358
      229   CCVS-E-1 . . . . . . . . . . .  317
      234   CCVS-E-2 . . . . . . . . . . .  326 333 340 345
      237   CCVS-E-2-2 . . . . . . . . . .  M325
      242   CCVS-E-3 . . . . . . . . . . .  346
      251   CCVS-E-4 . . . . . . . . . . .  325
      252   CCVS-E-4-1 . . . . . . . . . .  M323
      254   CCVS-E-4-2 . . . . . . . . . .  M324
      196   CCVS-H-1 . . . . . . . . . . .  306 353
      201   CCVS-H-2A. . . . . . . . . . .  307 354
      210   CCVS-H-2B. . . . . . . . . . .  308 355
      222   CCVS-H-3 . . . . . . . . . . .  309 356
      272   CCVS-PGM-ID. . . . . . . . . .  278 278
      156   CM-18V0
      150   COMPUTED-A . . . . . . . . . .  151 153 154 155 156 384 387 M433 M710 M745 M780 M815 M894 M930 M964 M998
      151   COMPUTED-N . . . . . . . . . .  M412 M456 M472 M495 M512 M536 M558 M580 M597 M620 M637 M734 M769 M804 M1018
      149   COMPUTED-X . . . . . . . . . .  M301 369
      153   COMPUTED-0V18
      155   COMPUTED-14V4
      157   COMPUTED-18V0. . . . . . . . .  M658 M677 M699 M840 M861 M884 M920 M951 M985 M1037 M1056 M1076 M1095 M1114 M1133
      154   COMPUTED-4V14
      173   COR-ANSI-REFERENCE . . . . . .  M379 M381
      164   CORRECT-A. . . . . . . . . . .  165 166 167 168 169 385 387 M434 M709 M744 M779 M814 M893 M929 M963 M997
      165   CORRECT-N. . . . . . . . . . .  M413 M473 M513 M537 M559 M598 M638 M735 M770 M805 M1017
      163   CORRECT-X. . . . . . . . . . .  M302 371
      166   CORRECT-0V18
      168   CORRECT-14V4
      170   CORRECT-18V0 . . . . . . . . .  M657 M678 M700 M839 M860 M883 M919 M950 M984 M1036 M1055 M1075 M1094 M1113 M1132
      167   CORRECT-4V14
      169   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    25
0 Defined   Cross-reference of data names   References

0     187   DELETE-COUNTER . . . . . . . .  M291 320 336 338
      129   DIV-DATA-2
      123   DIV-02LEVEL-1
      114   DIVIDE-DATA
      115   DIV1
      132   DIV10
      117   DIV2
      119   DIV3
      121   DIV4
      124   DIV5
      126   DIV6
      127   DIV7
      130   DIV8
      131   DIV9
      142   DOTVALUE . . . . . . . . . . .  M296
      193   DUMMY-HOLD . . . . . . . . . .  M350 360
       38   DUMMY-RECORD . . . . . . . . .  M306 M307 M308 M309 M311 M312 M313 M315 M317 M326 M333 M340 M345 M346 350 M351
                                            352 M353 M354 M355 M356 M357 M358 M359 M360 364 M365 M374 M389
      240   ENDER-DESC . . . . . . . . . .  M328 M339 M344
      188   ERROR-COUNTER. . . . . . . . .  M290 319 329 332
      192   ERROR-HOLD . . . . . . . . . .  M319 M320 M320 M321 324
      238   ERROR-TOTAL. . . . . . . . . .  M330 M332 M337 M338 M342 M343
      135   FEATURE. . . . . . . . . . . .  M396 M520 M542 M825 M1008 M1062
      266   HYPHEN-LINE. . . . . . . . . .  313 315 359
      232   ID-AGAIN . . . . . . . . . . .  M278
      265   INF-ANSI-REFERENCE . . . . . .  M372 M375 M388 M390
      260   INFO-TEXT. . . . . . . . . . .  M373
      189   INSPECT-COUNTER. . . . . . . .  M288 319 341 343
      104   MULTIPLY-DATA
      105   MULT1. . . . . . . . . . . . .  M398 401 M419 422 M441 444 M524 526 536
      107   MULT2. . . . . . . . . . . . .  M399 M401 403 412
      108   MULT3. . . . . . . . . . . . .  M420 M422 424 433
      109   MULT4. . . . . . . . . . . . .  M440 444 M544 M546 548 558
      111   MULT5. . . . . . . . . . . . .  M442 M444 456 463 472 M480 M483 495 502 512 M514 M522 524 M565 568 M568 580 587
                                            597
      112   MULT6. . . . . . . . . . . . .  M605 M608 620 627 637
      137   P-OR-F . . . . . . . . . . . .  M288 M289 M290 M291 298 M301
      139   PAR-NAME . . . . . . . . . . .  M303 M415 M436 M460 M476 M499 M517 M539 M561 M584 M601 M624 M641 M661 M681 M703
                                            M716 M738 M751 M773 M786 M808 M821 M843 M864 M887 M900 M923 M936 M957 M970 M991
                                            M1004 M1024 M1043 M1063 M1082 M1101 M1120 M1139
      141   PARDOT-X . . . . . . . . . . .  M295
      190   PASS-COUNTER . . . . . . . . .  M289 321 323
       36   PRINT-FILE . . . . . . . . . .  32 277 283
       37   PRINT-REC. . . . . . . . . . .  M297 M378 M380
      144   RE-MARK. . . . . . . . . . . .  M292 M304 M457 M474 M496 M515 M581 M599 M621 M639
      186   REC-CT . . . . . . . . . . . .  294 296 303
      185   REC-SKL-SUB
      194   RECORD-COUNT . . . . . . . . .  M348 349 M361
      145   TEST-COMPUTED. . . . . . . . .  378
      160   TEST-CORRECT . . . . . . . . .  380
      213   TEST-ID. . . . . . . . . . . .  M278
      133   TEST-RESULTS . . . . . . . . .  M279 297
      191   TOTAL-ERROR
       70   WKR-DS-T-17V00-S . . . . . . .  981 985
       91   WRK-CS-02V02 . . . . . . . . .  M1047 M1049 1051
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    26
0 Defined   Cross-reference of data names   References

0      76   WRK-CS-18V00 . . . . . . . . .  M1028 M1030 1032 M1067 M1070 1072 1076 M1105 M1108 1110 1114
       84   WRK-DS-LS-01V00
       74   WRK-DS-LS-0201P. . . . . . . .  M1009 M1011 1013
       40   WRK-DS-LS-18V00. . . . . . . .  M645 M647 649 658
       68   WRK-DS-T-09V08 . . . . . . . .  70 M975 M978
       44   WRK-DS-TS-06V06. . . . . . . .  46 M665 M667 M1051
       83   WRK-DS-TS-12V00-S
       46   WRK-DS-TS-12V00-S-S. . . . . .  669 677 1052 1056
       57   WRK-DS-02V00 . . . . . . . . .  M721 M723 726 734 M756 M758 761 769 M791 M793 796 804
       85   WRK-DS-03V10
       89   WRK-DS-05V00 . . . . . . . . .  M1013 1014 1018
       60   WRK-DS-09V09 . . . . . . . . .  61 M826 M829
       49   WRK-DS-10V00 . . . . . . . . .  M686 M688 691 699 M847 M850 852 861 M869 M872 875 884 M905 M908 911 920 M941
                                            M944 947 951
       61   WRK-DS-18V00-S . . . . . . . .  831 840
       77   WRK-DU-18V00 . . . . . . . . .  M1032 1033 1037 M1086 M1089 1091 1095 M1124 M1127 1129 1133
       50   WRK-XN-00001 . . . . . . . . .  M685 M689 706 710 M720 M724 741 745 M755 M759 776 780 M790 M794 811 815 M868
                                            M873 890 894 M904 M909 926 930 M940 M945 960 964 M974 M979 994 998
       93   XRAY . . . . . . . . . . . . .  M445 447 M481 M484 486 M566 M569 571 M606 M609 611
      262   XXCOMPUTED . . . . . . . . . .  M387
      264   XXCORRECT. . . . . . . . . . .  M387
      257   XXINFO . . . . . . . . . . . .  374 389
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    27
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

      383   BAIL-OUT . . . . . . . . . . .  P300
      391   BAIL-OUT-EX. . . . . . . . . .  E300 G385
      386   BAIL-OUT-WRITE . . . . . . . .  G384
      366   BLANK-LINE-PRINT
     1142   CCVS-EXIT
     1143   CCVS-999999
      275   CCVS1
      392   CCVS1-EXIT . . . . . . . . . .  G281
      282   CLOSE-FILES. . . . . . . . . .  G1144
      310   COLUMN-NAMES-ROUTINE . . . . .  E280
      291   DE-LETE. . . . . . . . . . . .  P408 P429 P453 P468 P492 P508 P532 P554 P577 P593 P617 P633 P654 P674 P696 P714
                                            P731 P749 P766 P784 P801 P819 P836 P857 P880 P898 P916 P934 P955 P968 P989 P1002
                                            P1022 P1041 P1060 P1080 P1099 P1118 P1137
      314   END-ROUTINE. . . . . . . . . .  P283 P1141
      318   END-ROUTINE-1
      327   END-ROUTINE-12
      335   END-ROUTINE-13 . . . . . . . .  E283
      316   END-RTN-EXIT
      290   FAIL . . . . . . . . . . . . .  P411 P432 P458 P471 P497 P511 P535 P557 P582 P596 P622 P636 P659 P679 P701 P711
                                            P736 P746 P771 P781 P806 P816 P841 P862 P885 P895 P921 P931 P952 P965 P986 P999
                                            P1019 P1038 P1057 P1077 P1096 P1115 P1134
      368   FAIL-ROUTINE . . . . . . . . .  P299
      382   FAIL-ROUTINE-EX. . . . . . . .  E299 G376
      377   FAIL-ROUTINE-WRITE . . . . . .  G370 G371
      305   HEAD-ROUTINE . . . . . . . . .  P280
      288   INSPT
      276   OPEN-FILES
      289   PASS . . . . . . . . . . . . .  P405 P426 P448 P465 P489 P503 P527 P549 P572 P588 P612 P628 P650 P670 P692 P707
                                            P727 P742 P762 P777 P797 P812 P832 P853 P876 P891 P912 P927 P948 P961 P982 P995
                                            P1015 P1034 P1053 P1073 P1092 P1111 P1130
      293   PRINT-DETAIL . . . . . . . . .  P416 P437 P461 P477 P500 P518 P540 P562 P585 P602 P625 P642 P662 P682 P704 P717
                                            P739 P752 P774 P787 P809 P822 P844 P865 P888 P901 P924 P937 P958 P971 P992 P1005
                                            P1025 P1044 P1064 P1083 P1102 P1121 P1140
      394   SECTION-NC120A-001
      491   SIG-DELETE-GF-1-1
      507   SIG-DELETE-GF-1-2
      765   SIG-DELETE-GF-10-1
      783   SIG-DELETE-GF-10-2
      800   SIG-DELETE-GF-11-1
      818   SIG-DELETE-GF-11-2
     1021   SIG-DELETE-GF-12
     1040   SIG-DELETE-GF-13
      407   SIG-DELETE-GF-14
      428   SIG-DELETE-GF-15
      452   SIG-DELETE-GF-16-1
      467   SIG-DELETE-GF-16-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    28
0 Defined   Cross-reference of procedures   References

0     835   SIG-DELETE-GF-17
      856   SIG-DELETE-GF-18
      879   SIG-DELETE-GF-19-1
      897   SIG-DELETE-GF-19-2
      531   SIG-DELETE-GF-2
      915   SIG-DELETE-GF-20-1
      933   SIG-DELETE-GF-20-2
      954   SIG-DELETE-GF-21-1
      967   SIG-DELETE-GF-21-2
      988   SIG-DELETE-GF-22-1
     1001   SIG-DELETE-GF-22-2
     1059   SIG-DELETE-GF-23
     1079   SIG-DELETE-GF-24
     1098   SIG-DELETE-GF-25
     1117   SIG-DELETE-GF-26
     1136   SIG-DELETE-GF-27
      553   SIG-DELETE-GF-3
      576   SIG-DELETE-GF-4-1
      592   SIG-DELETE-GF-4-2
      616   SIG-DELETE-GF-5-1
      632   SIG-DELETE-GF-5-2
      653   SIG-DELETE-GF-6
      673   SIG-DELETE-GF-7
      695   SIG-DELETE-GF-8-1
      713   SIG-DELETE-GF-8-2
      730   SIG-DELETE-GF-9-1
      748   SIG-DELETE-GF-9-2
      494   SIG-FAIL-GF-1-1. . . . . . . .  G487
      510   SIG-FAIL-GF-1-2. . . . . . . .  G505
      768   SIG-FAIL-GF-10-1 . . . . . . .  G764
      803   SIG-FAIL-GF-11-1 . . . . . . .  G799
      410   SIG-FAIL-GF-14 . . . . . . . .  G404
      431   SIG-FAIL-GF-15 . . . . . . . .  G425
      455   SIG-FAIL-GF-16-1 . . . . . . .  G450
      470   SIG-FAIL-GF-16-2 . . . . . . .  G464
      838   SIG-FAIL-GF-17 . . . . . . . .  G834
      859   SIG-FAIL-GF-18 . . . . . . . .  G855
      882   SIG-FAIL-GF-19-1 . . . . . . .  G878
      534   SIG-FAIL-GF-2. . . . . . . . .  G529
      918   SIG-FAIL-GF-20-1 . . . . . . .  G914
      556   SIG-FAIL-GF-3. . . . . . . . .  G551
      579   SIG-FAIL-GF-4-1. . . . . . . .  G574
      595   SIG-FAIL-GF-4-2. . . . . . . .  G590
      619   SIG-FAIL-GF-5-1. . . . . . . .  G614
      635   SIG-FAIL-GF-5-2. . . . . . . .  G630
      656   SIG-FAIL-GF-6. . . . . . . . .  G652
      676   SIG-FAIL-GF-7. . . . . . . . .  G672
      698   SIG-FAIL-GF-8-1. . . . . . . .  G694
      733   SIG-FAIL-GF-9-1. . . . . . . .  G729
      478   SIG-INIT-GF-1
      753   SIG-INIT-GF-10
      788   SIG-INIT-GF-11
     1006   SIG-INIT-GF-12
     1026   SIG-INIT-GF-13
      395   SIG-INIT-GF-14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    29
0 Defined   Cross-reference of procedures   References

0     417   SIG-INIT-GF-15
      438   SIG-INIT-GF-16
      823   SIG-INIT-GF-17
      845   SIG-INIT-GF-18
      866   SIG-INIT-GF-19
      519   SIG-INIT-GF-2
      902   SIG-INIT-GF-20
      938   SIG-INIT-GF-21
      972   SIG-INIT-GF-22
     1045   SIG-INIT-GF-23
     1065   SIG-INIT-GF-24
     1084   SIG-INIT-GF-25
     1103   SIG-INIT-GF-26
     1122   SIG-INIT-GF-27
      541   SIG-INIT-GF-3
      563   SIG-INIT-GF-4
      603   SIG-INIT-GF-5
      643   SIG-INIT-GF-6
      663   SIG-INIT-GF-7
      683   SIG-INIT-GF-8
      718   SIG-INIT-GF-9
      482   SIG-TEST-GF-1-0
      485   SIG-TEST-GF-1-1
      501   SIG-TEST-GF-1-2
      757   SIG-TEST-GF-10-0
      760   SIG-TEST-GF-10-1
      775   SIG-TEST-GF-10-2
      792   SIG-TEST-GF-11-0
      795   SIG-TEST-GF-11-1
      810   SIG-TEST-GF-11-2
     1010   SIG-TEST-GF-12-0
     1012   SIG-TEST-GF-12-1
     1029   SIG-TEST-GF-13-0
     1031   SIG-TEST-GF-13-1
      400   SIG-TEST-GF-14-0
      402   SIG-TEST-GF-14-1
      421   SIG-TEST-GF-15-0
      423   SIG-TEST-GF-15-1
      443   SIG-TEST-GF-16-0
      446   SIG-TEST-GF-16-1
      462   SIG-TEST-GF-16-2
      827   SIG-TEST-GF-17-0
      830   SIG-TEST-GF-17-1
      848   SIG-TEST-GF-18-0
      851   SIG-TEST-GF-18-1
      870   SIG-TEST-GF-19-0
      874   SIG-TEST-GF-19-1
      889   SIG-TEST-GF-19-2
      523   SIG-TEST-GF-2-0
      525   SIG-TEST-GF-2-1
      906   SIG-TEST-GF-20-0
      910   SIG-TEST-GF-20-1
      925   SIG-TEST-GF-20-2
      942   SIG-TEST-GF-21-0
      946   SIG-TEST-GF-21-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    30
0 Defined   Cross-reference of procedures   References

0     959   SIG-TEST-GF-21-2
      976   SIG-TEST-GF-22-0
      980   SIG-TEST-GF-22-1
      993   SIG-TEST-GF-22-2
     1048   SIG-TEST-GF-23-0
     1050   SIG-TEST-GF-23-1
     1068   SIG-TEST-GF-24-0
     1071   SIG-TEST-GF-24-1
     1087   SIG-TEST-GF-25-0
     1090   SIG-TEST-GF-25-1
     1106   SIG-TEST-GF-26-0
     1109   SIG-TEST-GF-26-1
     1125   SIG-TEST-GF-27-0
     1128   SIG-TEST-GF-27-1
      545   SIG-TEST-GF-3-0
      547   SIG-TEST-GF-3-1
      567   SIG-TEST-GF-4-0
      570   SIG-TEST-GF-4-1
      586   SIG-TEST-GF-4-2
      607   SIG-TEST-GF-5-0
      610   SIG-TEST-GF-5-1
      626   SIG-TEST-GF-5-2
      646   SIG-TEST-GF-6-0
      648   SIG-TEST-GF-6-1
      666   SIG-TEST-GF-7-0
      668   SIG-TEST-GF-7-1
      687   SIG-TEST-GF-8-0
      690   SIG-TEST-GF-8-1
      705   SIG-TEST-GF-8-2
      722   SIG-TEST-GF-9-0
      725   SIG-TEST-GF-9-1
      740   SIG-TEST-GF-9-2
      498   SIG-WRITE-GF-1-1 . . . . . . .  G490 G493
      516   SIG-WRITE-GF-1-2 . . . . . . .  G506 G509
      772   SIG-WRITE-GF-10-1. . . . . . .  G763 G767
      785   SIG-WRITE-GF-10-2. . . . . . .  G778 G782
      807   SIG-WRITE-GF-11-1. . . . . . .  G798 G802
      820   SIG-WRITE-GF-11-2. . . . . . .  G813 G817
     1023   SIG-WRITE-GF-12. . . . . . . .  G1016 G1020
     1042   SIG-WRITE-GF-13. . . . . . . .  G1035 G1039
      414   SIG-WRITE-GF-14. . . . . . . .  G406 G409
      435   SIG-WRITE-GF-15. . . . . . . .  G427 G430
      459   SIG-WRITE-GF-16-1. . . . . . .  G451 G454
      475   SIG-WRITE-GF-16-2. . . . . . .  G466 G469
      842   SIG-WRITE-GF-17. . . . . . . .  G833 G837
      863   SIG-WRITE-GF-18. . . . . . . .  G854 G858
      886   SIG-WRITE-GF-19-1. . . . . . .  G877 G881
      899   SIG-WRITE-GF-19-2. . . . . . .  G892 G896
      538   SIG-WRITE-GF-2 . . . . . . . .  G530 G533
      922   SIG-WRITE-GF-20-1. . . . . . .  G913 G917
      935   SIG-WRITE-GF-20-2. . . . . . .  G928 G932
      956   SIG-WRITE-GF-21-1. . . . . . .  G949 G953
      969   SIG-WRITE-GF-21-2. . . . . . .  G962 G966
      990   SIG-WRITE-GF-22-1. . . . . . .  G983 G987
     1003   SIG-WRITE-GF-22-2. . . . . . .  G996 G1000
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    31
0 Defined   Cross-reference of procedures   References

0    1061   SIG-WRITE-GF-23. . . . . . . .  G1054 G1058
     1081   SIG-WRITE-GF-24. . . . . . . .  G1074 G1078
     1100   SIG-WRITE-GF-25. . . . . . . .  G1093 G1097
     1119   SIG-WRITE-GF-26. . . . . . . .  G1112 G1116
     1138   SIG-WRITE-GF-27. . . . . . . .  G1131 G1135
      560   SIG-WRITE-GF-3 . . . . . . . .  G552 G555
      583   SIG-WRITE-GF-4-1 . . . . . . .  G575 G578
      600   SIG-WRITE-GF-4-2 . . . . . . .  G591 G594
      623   SIG-WRITE-GF-5-1 . . . . . . .  G615 G618
      640   SIG-WRITE-GF-5-2 . . . . . . .  G631 G634
      660   SIG-WRITE-GF-6 . . . . . . . .  G651 G655
      680   SIG-WRITE-GF-7 . . . . . . . .  G671 G675
      702   SIG-WRITE-GF-8-1 . . . . . . .  G693 G697
      715   SIG-WRITE-GF-8-2 . . . . . . .  G708 G712
      737   SIG-WRITE-GF-9-1 . . . . . . .  G728 G732
      750   SIG-WRITE-GF-9-2 . . . . . . .  G743 G747
      286   TERMINATE-CALL
      284   TERMINATE-CCVS
      347   WRITE-LINE . . . . . . . . . .  P297 P298 P306 P307 P308 P309 P311 P312 P313 P315 P317 P326 P334 P340 P345 P346
                                            P374 P378 P380 P389
      363   WRT-LN . . . . . . . . . . . .  P353 P354 P355 P356 P357 P358 P359 P362 P367
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    32
0 Defined   Cross-reference of programs     References

        3   NC120A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC120A    Date 06/04/2022  Time 11:59:49   Page    33
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC120A:
 *    Source records = 1144
 *    Data Division statements = 123
 *    Procedure Division statements = 671
 *    Generated COBOL statements = 0
 *    Program complexity factor = 684
0End of compilation 1,  program NC120A,  highest severity 0.
0Return code 0
