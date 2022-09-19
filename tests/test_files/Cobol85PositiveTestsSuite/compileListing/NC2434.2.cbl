1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:02   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:02   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2434.2
   000002         000200 PROGRAM-ID.                                                      NC2434.2
   000003         000300     NC243A.                                                      NC2434.2
   000004         000400                                                                  NC2434.2
   000005         000600*                                                              *  NC2434.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2434.2
   000007         000800*                                                              *  NC2434.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2434.2
   000009         001000*                                                              *  NC2434.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2434.2
   000011         001200*                                                              *  NC2434.2
   000012         001400*                                                              *  NC2434.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2434.2
   000014         001600*                                                              *  NC2434.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2434.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2434.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2434.2
   000018         002000*                                                              *  NC2434.2
   000019         002200*                                                              *  NC2434.2
   000020         002300*    PROGRAM NC243A TESTS THE CONSTRUCTION AND ACCES OF A      *  NC2434.2
   000021         002400*    SEVEN-DIMENSIONAL TABLE.   THE CONSTRUCTION IS VIA        *  NC2434.2
   000022         002500*    SUBSCRIPTED LOOPS AND ACCESS IS BY FORMAT 4 "PERFORM"     *  NC2434.2
   000023         002600*    STATEMENTS USING INDICES.                                 *  NC2434.2
   000024         002700*                                                              *  NC2434.2
   000025         002900 ENVIRONMENT DIVISION.                                            NC2434.2
   000026         003000 CONFIGURATION SECTION.                                           NC2434.2
   000027         003100 SOURCE-COMPUTER.                                                 NC2434.2
   000028         003200     XXXXX082.                                                    NC2434.2
   000029         003300 OBJECT-COMPUTER.                                                 NC2434.2
   000030         003400     XXXXX083.                                                    NC2434.2
   000031         003500 INPUT-OUTPUT SECTION.                                            NC2434.2
   000032         003600 FILE-CONTROL.                                                    NC2434.2
   000033         003700     SELECT PRINT-FILE ASSIGN TO                                  NC2434.2 37
   000034         003800     XXXXX055.                                                    NC2434.2
   000035         003900 DATA DIVISION.                                                   NC2434.2
   000036         004000 FILE SECTION.                                                    NC2434.2
   000037         004100 FD  PRINT-FILE.                                                  NC2434.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004200 01  PRINT-REC PICTURE X(120).                                    NC2434.2
   000039         004300 01  DUMMY-RECORD PICTURE X(120).                                 NC2434.2
   000040         004400 WORKING-STORAGE SECTION.                                         NC2434.2
   000041         004500 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC2434.2 IMP
   000042         004600 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC2434.2 IMP
   000043         004700 77  SUB-3              PICTURE 99   VALUE ZERO.                  NC2434.2 IMP
   000044         004800 77   TEST-CHECK PIC X(4) VALUE SPACE.                            NC2434.2 IMP
   000045         004900 77  CON-7              PICTURE 99  VALUE 07.                     NC2434.2
   000046         005000 77  CON-10             PICTURE 99  VALUE 10.                     NC2434.2
   000047         005100 77  ELEM-HOLD-AREA               PICTURE X(15)  VALUE SPACES.    NC2434.2 IMP
   000048         005200 77  CON-5              PICTURE 99  VALUE 05.                     NC2434.2
   000049         005300 77  SEC-HOLD-AREA                PICTURE X(11)  VALUE SPACES.    NC2434.2 IMP
   000050         005400 77  CON-6              PICTURE 99  VALUE 06.                     NC2434.2
   000051         005500 77  GRP-HOLD-AREA                PICTURE X(5)  VALUE SPACES.     NC2434.2 IMP
   000052         005600 77  N1                 PIC 9.                                    NC2434.2
   000053         005700 77  N2                 PIC 9.                                    NC2434.2
   000054         005800 77  N3                 PIC 9.                                    NC2434.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  N4                 PIC 9.                                    NC2434.2
   000056         006000 77  N5                 PIC 9.                                    NC2434.2
   000057         006100 77  N6                 PIC 9.                                    NC2434.2
   000058         006200 77  N7                 PIC 9.                                    NC2434.2
   000059         006300 01  GRP-NAME.                                                    NC2434.2
   000060         006400     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2434.2
   000061         006500     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2434.2
   000062         006600                                                                  NC2434.2
   000063         006700 01  SEC-NAME.                                                    NC2434.2
   000064         006800     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2434.2
   000065         006900     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2434.2
   000066         007000     02  FILLER              PICTURE X      VALUE ",".            NC2434.2
   000067         007100     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2434.2
   000068         007200     02  FILLER              PICTURE X      VALUE ")".            NC2434.2
   000069         007300                                                                  NC2434.2
   000070         007400 01  ELEM-NAME.                                                   NC2434.2
   000071         007500     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2434.2
   000072         007600     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2434.2
   000073         007700     02  FILLER              PICTURE X      VALUE ",".            NC2434.2
   000074         007800     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2434.2
   000075         007900     02  FILLER              PICTURE X      VALUE ",".            NC2434.2
   000076         008000     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2434.2
   000077         008100     02  FILLER              PICTURE X      VALUE ")".            NC2434.2
   000078         008200                                                                  NC2434.2
   000079         008300 01  3-DIMENSION-TBL.                                             NC2434.2
   000080         008400     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2434.2
   000081         008500         03  ENTRY-1         PICTURE X(5).                        NC2434.2
   000082         008600         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2434.2
   000083         008700             04  ENTRY-2     PICTURE X(11).                       NC2434.2
   000084         008800             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC2434.2
   000085         008900                 05  ENTRY-3 PICTURE X(15).                       NC2434.2
   000086         009000                                                                  NC2434.2
   000087         009100 01  7-DIMENSION-TBL.                                             NC2434.2
   000088         009200   02  GRP-7-1-ENTRY             OCCURS 2 INDEXED BY X1.          NC2434.2
   000089         009300     03  ENTRY-7-1               PIC XX.                          NC2434.2
   000090         009400     03  GRP-7-2-ENTRY           OCCURS 2 INDEXED BY X2.          NC2434.2
   000091         009500       04  ENTRY-7-2             PIC XX.                          NC2434.2
   000092         009600       04  GRP-7-3-ENTRY         OCCURS 2 INDEXED BY X3.          NC2434.2
   000093         009700         05  ENTRY-7-3           PIC XX.                          NC2434.2
   000094         009800         05  GRP-7-4-ENTRY       OCCURS 2 INDEXED BY X4.          NC2434.2
   000095         009900           06  ENTRY-7-4         PIC XX.                          NC2434.2
   000096         010000           06  GRP-7-5-ENTRY     OCCURS 2 INDEXED BY X5.          NC2434.2
   000097         010100             07  ENTRY-7-5       PIC XX.                          NC2434.2
   000098         010200             07  GRP-7-6-ENTRY   OCCURS 2 INDEXED BY X6.          NC2434.2
   000099         010300               08  ENTRY-7-6     PIC XX.                          NC2434.2
   000100         010400               08  GRP-7-7-ENTRY OCCURS 2 INDEXED BY X7.          NC2434.2
   000101         010500                 09  ENTRY-7-7   PIC XX.                          NC2434.2
   000102         010600                                                                  NC2434.2
   000103         010700 01  WS-FLAG                     PIC X(5).                        NC2434.2
   000104         010800 01  TEST-RESULTS.                                                NC2434.2
   000105         010900     02 FILLER                   PIC X      VALUE SPACE.          NC2434.2 IMP
   000106         011000     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2434.2 IMP
   000107         011100     02 FILLER                   PIC X      VALUE SPACE.          NC2434.2 IMP
   000108         011200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2434.2 IMP
   000109         011300     02 FILLER                   PIC X      VALUE SPACE.          NC2434.2 IMP
   000110         011400     02  PAR-NAME.                                                NC2434.2
   000111         011500       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2434.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600       03  PARDOT-X              PIC X      VALUE SPACE.          NC2434.2 IMP
   000113         011700       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2434.2 IMP
   000114         011800     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2434.2 IMP
   000115         011900     02 RE-MARK                  PIC X(61).                       NC2434.2
   000116         012000 01  TEST-COMPUTED.                                               NC2434.2
   000117         012100     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2434.2 IMP
   000118         012200     02 FILLER                   PIC X(17)  VALUE                 NC2434.2
   000119         012300            "       COMPUTED=".                                   NC2434.2
   000120         012400     02 COMPUTED-X.                                               NC2434.2
   000121         012500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2434.2 IMP
   000122         012600     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2434.2 121
   000123         012700                                 PIC -9(9).9(9).                  NC2434.2
   000124         012800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2434.2 121
   000125         012900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2434.2 121
   000126         013000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2434.2 121
   000127         013100     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2434.2 121
   000128         013200         04 COMPUTED-18V0                    PIC -9(18).          NC2434.2
   000129         013300         04 FILLER                           PIC X.               NC2434.2
   000130         013400     03 FILLER PIC X(50) VALUE SPACE.                             NC2434.2 IMP
   000131         013500 01  TEST-CORRECT.                                                NC2434.2
   000132         013600     02 FILLER PIC X(30) VALUE SPACE.                             NC2434.2 IMP
   000133         013700     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2434.2
   000134         013800     02 CORRECT-X.                                                NC2434.2
   000135         013900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2434.2 IMP
   000136         014000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2434.2 135
   000137         014100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2434.2 135
   000138         014200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2434.2 135
   000139         014300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2434.2 135
   000140         014400     03      CR-18V0 REDEFINES CORRECT-A.                         NC2434.2 135
   000141         014500         04 CORRECT-18V0                     PIC -9(18).          NC2434.2
   000142         014600         04 FILLER                           PIC X.               NC2434.2
   000143         014700     03 FILLER PIC X(2) VALUE SPACE.                              NC2434.2 IMP
   000144         014800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2434.2 IMP
   000145         014900 01  CCVS-C-1.                                                    NC2434.2
   000146         015000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2434.2
   000147         015100-    "SS  PARAGRAPH-NAME                                          NC2434.2
   000148         015200-    "       REMARKS".                                            NC2434.2
   000149         015300     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2434.2 IMP
   000150         015400 01  CCVS-C-2.                                                    NC2434.2
   000151         015500     02 FILLER                     PIC X        VALUE SPACE.      NC2434.2 IMP
   000152         015600     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2434.2
   000153         015700     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2434.2 IMP
   000154         015800     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2434.2
   000155         015900     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2434.2 IMP
   000156         016000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2434.2 IMP
   000157         016100 01  REC-CT                        PIC 99       VALUE ZERO.       NC2434.2 IMP
   000158         016200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2434.2 IMP
   000159         016300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2434.2 IMP
   000160         016400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2434.2 IMP
   000161         016500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2434.2 IMP
   000162         016600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2434.2 IMP
   000163         016700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2434.2 IMP
   000164         016800 01  L4-HOLD                       PIC XX       VALUE SPACE.      NC2434.2 IMP
   000165         016900 01  L5-HOLD                       PIC XX       VALUE SPACE.      NC2434.2 IMP
   000166         017000 01  L6-HOLD                       PIC XX       VALUE SPACE.      NC2434.2 IMP
   000167         017100 01  L7-HOLD                       PIC XX       VALUE SPACE.      NC2434.2 IMP
   000168         017200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2434.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2434.2 IMP
   000170         017400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2434.2 IMP
   000171         017500 01  CCVS-H-1.                                                    NC2434.2
   000172         017600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2434.2 IMP
   000173         017700     02  FILLER                    PIC X(42)    VALUE             NC2434.2
   000174         017800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2434.2
   000175         017900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2434.2 IMP
   000176         018000 01  CCVS-H-2A.                                                   NC2434.2
   000177         018100   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2434.2 IMP
   000178         018200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2434.2
   000179         018300   02  FILLER                        PIC XXXX   VALUE             NC2434.2
   000180         018400     "4.2 ".                                                      NC2434.2
   000181         018500   02  FILLER                        PIC X(28)  VALUE             NC2434.2
   000182         018600            " COPY - NOT FOR DISTRIBUTION".                       NC2434.2
   000183         018700   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2434.2 IMP
   000184         018800                                                                  NC2434.2
   000185         018900 01  CCVS-H-2B.                                                   NC2434.2
   000186         019000   02  FILLER                        PIC X(15)  VALUE             NC2434.2
   000187         019100            "TEST RESULT OF ".                                    NC2434.2
   000188         019200   02  TEST-ID                       PIC X(9).                    NC2434.2
   000189         019300   02  FILLER                        PIC X(4)   VALUE             NC2434.2
   000190         019400            " IN ".                                               NC2434.2
   000191         019500   02  FILLER                        PIC X(12)  VALUE             NC2434.2
   000192         019600     " HIGH       ".                                              NC2434.2
   000193         019700   02  FILLER                        PIC X(22)  VALUE             NC2434.2
   000194         019800            " LEVEL VALIDATION FOR ".                             NC2434.2
   000195         019900   02  FILLER                        PIC X(58)  VALUE             NC2434.2
   000196         020000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2434.2
   000197         020100 01  CCVS-H-3.                                                    NC2434.2
   000198         020200     02  FILLER                      PIC X(34)  VALUE             NC2434.2
   000199         020300            " FOR OFFICIAL USE ONLY    ".                         NC2434.2
   000200         020400     02  FILLER                      PIC X(58)  VALUE             NC2434.2
   000201         020500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2434.2
   000202         020600     02  FILLER                      PIC X(28)  VALUE             NC2434.2
   000203         020700            "  COPYRIGHT   1985 ".                                NC2434.2
   000204         020800 01  CCVS-E-1.                                                    NC2434.2
   000205         020900     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2434.2 IMP
   000206         021000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2434.2
   000207         021100     02 ID-AGAIN                     PIC X(9).                    NC2434.2
   000208         021200     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2434.2 IMP
   000209         021300 01  CCVS-E-2.                                                    NC2434.2
   000210         021400     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2434.2 IMP
   000211         021500     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2434.2 IMP
   000212         021600     02 CCVS-E-2-2.                                               NC2434.2
   000213         021700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2434.2 IMP
   000214         021800         03 FILLER                   PIC X      VALUE SPACE.      NC2434.2 IMP
   000215         021900         03 ENDER-DESC               PIC X(44)  VALUE             NC2434.2
   000216         022000            "ERRORS ENCOUNTERED".                                 NC2434.2
   000217         022100 01  CCVS-E-3.                                                    NC2434.2
   000218         022200     02  FILLER                      PIC X(22)  VALUE             NC2434.2
   000219         022300            " FOR OFFICIAL USE ONLY".                             NC2434.2
   000220         022400     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2434.2 IMP
   000221         022500     02  FILLER                      PIC X(58)  VALUE             NC2434.2
   000222         022600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2434.2
   000223         022700     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2434.2 IMP
   000224         022800     02 FILLER                       PIC X(15)  VALUE             NC2434.2
   000225         022900             " COPYRIGHT 1985".                                   NC2434.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 01  CCVS-E-4.                                                    NC2434.2
   000227         023100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2434.2 IMP
   000228         023200     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2434.2
   000229         023300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2434.2 IMP
   000230         023400     02 FILLER                       PIC X(40)  VALUE             NC2434.2
   000231         023500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2434.2
   000232         023600 01  XXINFO.                                                      NC2434.2
   000233         023700     02 FILLER                       PIC X(19)  VALUE             NC2434.2
   000234         023800            "*** INFORMATION ***".                                NC2434.2
   000235         023900     02 INFO-TEXT.                                                NC2434.2
   000236         024000       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2434.2 IMP
   000237         024100       04 XXCOMPUTED                 PIC X(20).                   NC2434.2
   000238         024200       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2434.2 IMP
   000239         024300       04 XXCORRECT                  PIC X(20).                   NC2434.2
   000240         024400     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2434.2
   000241         024500 01  HYPHEN-LINE.                                                 NC2434.2
   000242         024600     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2434.2 IMP
   000243         024700     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2434.2
   000244         024800-    "*****************************************".                 NC2434.2
   000245         024900     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2434.2
   000246         025000-    "******************************".                            NC2434.2
   000247         025100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2434.2
   000248         025200     "NC243A".                                                    NC2434.2
   000249         025300 PROCEDURE DIVISION.                                              NC2434.2
   000250         025400 CCVS1 SECTION.                                                   NC2434.2
   000251         025500 OPEN-FILES.                                                      NC2434.2
   000252         025600     OPEN     OUTPUT PRINT-FILE.                                  NC2434.2 37
   000253         025700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2434.2 247 188 247 207
   000254         025800     MOVE    SPACE TO TEST-RESULTS.                               NC2434.2 IMP 104
   000255         025900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2434.2 280 285
   000256         026000     GO TO CCVS1-EXIT.                                            NC2434.2 362
   000257         026100 CLOSE-FILES.                                                     NC2434.2
   000258         026200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2434.2 289 310 37
   000259         026300 TERMINATE-CCVS.                                                  NC2434.2
   000260         026400     EXIT PROGRAM.                                                NC2434.2
   000261         026500 TERMINATE-CALL.                                                  NC2434.2
   000262         026600     STOP     RUN.                                                NC2434.2
   000263         026700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2434.2 108 160
   000264         026800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2434.2 108 161
   000265         026900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2434.2 108 159
   000266         027000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2434.2 108 158
   000267         027100     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2434.2 115
   000268         027200 PRINT-DETAIL.                                                    NC2434.2
   000269         027300     IF REC-CT NOT EQUAL TO ZERO                                  NC2434.2 157 IMP
   000270      1  027400             MOVE "." TO PARDOT-X                                 NC2434.2 112
   000271      1  027500             MOVE REC-CT TO DOTVALUE.                             NC2434.2 157 113
   000272         027600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2434.2 104 38 322
   000273         027700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2434.2 108 322
   000274      1  027800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2434.2 339 352
   000275      1  027900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2434.2 353 361
   000276         028000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2434.2 IMP 108 IMP 120
   000277         028100     MOVE SPACE TO CORRECT-X.                                     NC2434.2 IMP 134
   000278         028200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2434.2 157 IMP IMP 110
   000279         028300     MOVE     SPACE TO RE-MARK.                                   NC2434.2 IMP 115
   000280         028400 HEAD-ROUTINE.                                                    NC2434.2
   000281         028500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2434.2 171 39 322
   000282         028600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2434.2 176 39 322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2434.2 185 39 322
   000284         028800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2434.2 197 39 322
   000285         028900 COLUMN-NAMES-ROUTINE.                                            NC2434.2
   000286         029000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2434.2 145 39 322
   000287         029100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2434.2 150 39 322
   000288         029200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2434.2 241 39 322
   000289         029300 END-ROUTINE.                                                     NC2434.2
   000290         029400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2434.2 241 39 322
   000291         029500 END-RTN-EXIT.                                                    NC2434.2
   000292         029600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2434.2 204 39 322
   000293         029700 END-ROUTINE-1.                                                   NC2434.2
   000294         029800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2434.2 159 163 160
   000295         029900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2434.2 163 158 163
   000296         030000      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2434.2 161 163
   000297         030100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2434.2
   000298         030200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2434.2 161 227
   000299         030300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2434.2 163 229
   000300         030400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2434.2 226 212
   000301         030500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2434.2 209 39 322
   000302         030600  END-ROUTINE-12.                                                 NC2434.2
   000303         030700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2434.2 215
   000304         030800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2434.2 159 IMP
   000305      1  030900         MOVE "NO " TO ERROR-TOTAL                                NC2434.2 213
   000306         031000         ELSE                                                     NC2434.2
   000307      1  031100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2434.2 159 213
   000308         031200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2434.2 209 39
   000309         031300     PERFORM WRITE-LINE.                                          NC2434.2 322
   000310         031400 END-ROUTINE-13.                                                  NC2434.2
   000311         031500     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2434.2 158 IMP
   000312      1  031600         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2434.2 213
   000313      1  031700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2434.2 158 213
   000314         031800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2434.2 215
   000315         031900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2434.2 209 39 322
   000316         032000      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2434.2 160 IMP
   000317      1  032100          MOVE "NO " TO ERROR-TOTAL                               NC2434.2 213
   000318      1  032200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2434.2 160 213
   000319         032300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2434.2 215
   000320         032400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2434.2 209 39 322
   000321         032500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2434.2 217 39 322
   000322         032600 WRITE-LINE.                                                      NC2434.2
   000323         032700     ADD 1 TO RECORD-COUNT.                                       NC2434.2 169
   000324         032800     IF RECORD-COUNT GREATER 50                                   NC2434.2 169
   000325      1  032900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2434.2 39 168
   000326      1  033000         MOVE SPACE TO DUMMY-RECORD                               NC2434.2 IMP 39
   000327      1  033100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2434.2 39
   000328      1  033200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2434.2 145 39 334
   000329      1  033300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2434.2 150 39 334
   000330      1  033400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2434.2 241 39 334
   000331      1  033500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2434.2 168 39
   000332      1  033600         MOVE ZERO TO RECORD-COUNT.                               NC2434.2 IMP 169
   000333         033700     PERFORM WRT-LN.                                              NC2434.2 334
   000334         033800 WRT-LN.                                                          NC2434.2
   000335         033900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2434.2 39
   000336         034000     MOVE SPACE TO DUMMY-RECORD.                                  NC2434.2 IMP 39
   000337         034100 BLANK-LINE-PRINT.                                                NC2434.2
   000338         034200     PERFORM WRT-LN.                                              NC2434.2 334
   000339         034300 FAIL-ROUTINE.                                                    NC2434.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2434.2 120 IMP 347
   000341         034500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2434.2 134 IMP 347
   000342         034600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2434.2 170 240
   000343         034700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2434.2 235
   000344         034800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2434.2 232 39 322
   000345         034900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2434.2 IMP 240
   000346         035000     GO TO  FAIL-ROUTINE-EX.                                      NC2434.2 352
   000347         035100 FAIL-ROUTINE-WRITE.                                              NC2434.2
   000348         035200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2434.2 116 38 322
   000349         035300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2434.2 170 144
   000350         035400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2434.2 131 38 322
   000351         035500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2434.2 IMP 144
   000352         035600 FAIL-ROUTINE-EX. EXIT.                                           NC2434.2
   000353         035700 BAIL-OUT.                                                        NC2434.2
   000354         035800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2434.2 121 IMP 356
   000355         035900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2434.2 135 IMP 361
   000356         036000 BAIL-OUT-WRITE.                                                  NC2434.2
   000357         036100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2434.2 135 239 121 237
   000358         036200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2434.2 170 240
   000359         036300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2434.2 232 39 322
   000360         036400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2434.2 IMP 240
   000361         036500 BAIL-OUT-EX. EXIT.                                               NC2434.2
   000362         036600 CCVS1-EXIT.                                                      NC2434.2
   000363         036700     EXIT.                                                        NC2434.2
   000364         036800 SECT-NC243A-001 SECTION.                                         NC2434.2
   000365         036900 TH-17-001.                                                       NC2434.2
   000366         037000                                                                  NC2434.2
   000367         037100 BUILD-LEVEL-1.                                                   NC2434.2

 ==000367==> IGYPS2015-I The paragraph or section prior to paragraph or section "BUILD-LEVEL-1"
                         did not contain any statements.

   000368         037200     ADD 1 TO SUB-1.                                              NC2434.2 41
   000369         037300     IF SUB-1 = 11 GO TO CHECK-ENTRIES.                           NC2434.2 41 395
   000370         037400     MOVE GRP-NAME TO ENTRY-1 (SUB-1).                            NC2434.2 59 81 41
   000371         037500     ADD 1 TO ADD-GRP.                                            NC2434.2 61
   000372         037600                                                                  NC2434.2
   000373         037700 BUILD-LEVEL-2.                                                   NC2434.2
   000374         037800     ADD 1 TO SUB-2.                                              NC2434.2 42
   000375         037900     IF SUB-2 = 11                                                NC2434.2 42
   000376      1  038000         MOVE ZERO TO SUB-2                                       NC2434.2 IMP 42
   000377      1  038100         MOVE 01 TO ADD-SEC                                       NC2434.2 67
   000378      1  038200         GO TO BUILD-LEVEL-1.                                     NC2434.2 367
   000379         038300     MOVE SUB-1 TO SEC-GRP.                                       NC2434.2 41 65
   000380         038400     MOVE SEC-NAME TO ENTRY-2 (SUB-1, SUB-2).                     NC2434.2 63 83 41 42
   000381         038500     ADD 1 TO ADD-SEC.                                            NC2434.2 67
   000382         038600                                                                  NC2434.2
   000383         038700 BUILD-LEVEL-3.                                                   NC2434.2
   000384         038800     ADD 1 TO SUB-3.                                              NC2434.2 43
   000385         038900     IF SUB-3 = 11                                                NC2434.2 43
   000386      1  039000         MOVE ZERO TO SUB-3                                       NC2434.2 IMP 43
   000387      1  039100              MOVE 01 TO ADD-ELEM                                 NC2434.2 76
   000388      1  039200              GO TO BUILD-LEVEL-2.                                NC2434.2 373
   000389         039300     MOVE SUB-1 TO ELEM-GRP.                                      NC2434.2 41 72
   000390         039400     MOVE SUB-2 TO ELEM-SEC.                                      NC2434.2 42 74
   000391         039500     MOVE ELEM-NAME TO ENTRY-3 (SUB-1, SUB-2, SUB-3).             NC2434.2 70 85 41 42 43
   000392         039600     ADD 1 TO ADD-ELEM.                                           NC2434.2 76
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039700     GO TO BUILD-LEVEL-3.                                         NC2434.2 383
   000394         039800                                                                  NC2434.2
   000395         039900 CHECK-ENTRIES.                                                   NC2434.2
   000396         040000     MOVE "PERFORM VARYING LEV1" TO FEATURE.                      NC2434.2 106
   000397         040100     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC2434.2 110
   000398         040200     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000399         040300     MOVE "GRP05" TO GRP-HOLD-AREA.                               NC2434.2 51
   000400         040400     PERFORM FIND-LEVEL-1-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 447 80
   000401         040500         UNTIL IDX-1 GREATER 10.                                  NC2434.2 80
   000402         040600     IF TEST-CHECK = "PASS" GO TO LEVEL-1-TEST-2.                 NC2434.2 44 409
   000403         040700     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2434.2 51 135
   000404         040800     MOVE ENTRY-1 (05) TO COMPUTED-A.                             NC2434.2 81 121
   000405         040900                                                                  NC2434.2
   000406         041000     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000407         041100     PERFORM FAIL-TH.                                             NC2434.2 582
   000408         041200                                                                  NC2434.2
   000409         041300 LEVEL-1-TEST-2.                                                  NC2434.2
   000410         041400     MOVE "GRP10" TO GRP-HOLD-AREA.                               NC2434.2 51
   000411         041500     MOVE "LEVEL-1-TEST-2      " TO PAR-NAME.                     NC2434.2 110
   000412         041600     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000413         041700     PERFORM FIND-LEVEL-1-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 447 80
   000414         041800         UNTIL IDX-1 GREATER 10.                                  NC2434.2 80
   000415         041900     IF TEST-CHECK = "PASS" GO TO LEVEL-1-TEST-3.                 NC2434.2 44 422
   000416         042000     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2434.2 51 135
   000417         042100     MOVE ENTRY-1 (10) TO COMPUTED-A.                             NC2434.2 81 121
   000418         042200                                                                  NC2434.2
   000419         042300     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000420         042400     PERFORM FAIL-TH.                                             NC2434.2 582
   000421         042500                                                                  NC2434.2
   000422         042600 LEVEL-1-TEST-3.                                                  NC2434.2
   000423         042700     MOVE "GRP07" TO GRP-HOLD-AREA.                               NC2434.2 51
   000424         042800     MOVE "LEVEL-1-TEST-3      " TO PAR-NAME.                     NC2434.2 110
   000425         042900     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000426         043000     PERFORM FIND-LEVEL-1-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 447 80
   000427         043100         UNTIL IDX-1 GREATER 10.                                  NC2434.2 80
   000428         043200     IF TEST-CHECK = "PASS" GO TO LEVEL-1-TEST-4.                 NC2434.2 44 434
   000429         043300     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2434.2 51 135
   000430         043400     MOVE ENTRY-1 (07) TO COMPUTED-A.                             NC2434.2 81 121
   000431         043500                                                                  NC2434.2
   000432         043600     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000433         043700     PERFORM FAIL-TH.                                             NC2434.2 582
   000434         043800 LEVEL-1-TEST-4.                                                  NC2434.2
   000435         043900     MOVE "LEVEL-1-TEST-4      " TO PAR-NAME.                     NC2434.2 110
   000436         044000     MOVE "GRP01" TO GRP-HOLD-AREA.                               NC2434.2 51
   000437         044100     PERFORM FIND-LEVEL-1-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 447 80
   000438         044200         UNTIL IDX-1 GREATER 10.                                  NC2434.2 80
   000439         044300     IF TEST-CHECK = "PASS" GO TO LEVEL-2-TEST-1.                 NC2434.2 44 452
   000440         044400     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2434.2 51 135
   000441         044500     MOVE ENTRY-1 (01) TO COMPUTED-A.                             NC2434.2 81 121
   000442         044600                                                                  NC2434.2
   000443         044700     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000444         044800     PERFORM FAIL-TH.                                             NC2434.2 582
   000445         044900     GO TO LEVEL-2-TEST-1.                                        NC2434.2 452
   000446         045000                                                                  NC2434.2
   000447         045100 FIND-LEVEL-1-ENTRY.                                              NC2434.2
   000448         045200     IF ENTRY-1 (IDX-1) = GRP-HOLD-AREA                           NC2434.2 81 80 51
   000449      1  045300         MOVE "PASS" TO TEST-CHECK                                NC2434.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450      1  045400         PERFORM PASS-TH.                                         NC2434.2 579
   000451         045500                                                                  NC2434.2
   000452         045600 LEVEL-2-TEST-1.                                                  NC2434.2
   000453         045700     MOVE "LEVEL-2-TEST-1      " TO PAR-NAME.                     NC2434.2 110
   000454         045800     MOVE "PERFORM VARYING LEV2" TO FEATURE.                      NC2434.2 106
   000455         045900     MOVE "SEC (03,05)" TO SEC-HOLD-AREA.                         NC2434.2 49
   000456         046000     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000457         046100     PERFORM FIND-LEVEL-2-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 509 80
   000458         046200         UNTIL IDX-1 GREATER 10 AFTER IDX-2 FROM 1 BY 1 UNTIL     NC2434.2 80 82
   000459         046300         IDX-2 = 10.                                              NC2434.2 82
   000460         046400     IF TEST-CHECK = "PASS" GO TO LEVEL-2-TEST-2.                 NC2434.2 44 467
   000461         046500     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2434.2 49 135
   000462         046600     MOVE ENTRY-2 (03, 05) TO COMPUTED-A.                         NC2434.2 83 121
   000463         046700                                                                  NC2434.2
   000464         046800     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000465         046900     PERFORM FAIL-TH.                                             NC2434.2 582
   000466         047000                                                                  NC2434.2
   000467         047100 LEVEL-2-TEST-2.                                                  NC2434.2
   000468         047200     MOVE "LEVEL-2-TEST-2      " TO PAR-NAME.                     NC2434.2 110
   000469         047300     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000470         047400     MOVE "SEC (01,01)" TO SEC-HOLD-AREA.                         NC2434.2 49
   000471         047500     PERFORM FIND-LEVEL-2-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 509 80
   000472         047600         UNTIL IDX-1 GREATER 10 AFTER IDX-2 FROM 1 BY 1           NC2434.2 80 82
   000473         047700             UNTIL IDX-2 = 10.                                    NC2434.2 82
   000474         047800     IF TEST-CHECK = "PASS" GO TO LEVEL-2-TEST-3.                 NC2434.2 44 481
   000475         047900     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2434.2 49 135
   000476         048000     MOVE ENTRY-2 (01, 01) TO COMPUTED-A.                         NC2434.2 83 121
   000477         048100                                                                  NC2434.2
   000478         048200     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000479         048300     PERFORM FAIL-TH.                                             NC2434.2 582
   000480         048400                                                                  NC2434.2
   000481         048500 LEVEL-2-TEST-3.                                                  NC2434.2
   000482         048600     MOVE "LEVEL-2-TEST-3      " TO PAR-NAME.                     NC2434.2 110
   000483         048700     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000484         048800     MOVE "SEC (10,01)" TO SEC-HOLD-AREA.                         NC2434.2 49
   000485         048900     PERFORM FIND-LEVEL-2-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 509 80
   000486         049000         UNTIL IDX-1 GREATER 10 AFTER IDX-2 FROM 1 BY 1           NC2434.2 80 82
   000487         049100             UNTIL IDX-2 = 10.                                    NC2434.2 82
   000488         049200     IF TEST-CHECK = "PASS" GO TO LEVEL-2-TEST-4.                 NC2434.2 44 494
   000489         049300     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2434.2 49 135
   000490         049400     MOVE ENTRY-2 (10, 01) TO COMPUTED-A.                         NC2434.2 83 121
   000491         049500                                                                  NC2434.2
   000492         049600     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000493         049700     PERFORM FAIL-TH.                                             NC2434.2 582
   000494         049800 LEVEL-2-TEST-4.                                                  NC2434.2
   000495         049900     MOVE "LEVEL-2-TEST-4      " TO PAR-NAME.                     NC2434.2 110
   000496         050000     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000497         050100     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000498         050200     MOVE "SEC (10,10)" TO SEC-HOLD-AREA.                         NC2434.2 49
   000499         050300     PERFORM FIND-LEVEL-2-ENTRY VARYING IDX-1 FROM 2 BY 2         NC2434.2 509 80
   000500         050400         UNTIL IDX-1 GREATER 10 AFTER IDX-2 FROM 2 BY 2           NC2434.2 80 82
   000501         050500             UNTIL IDX-2 GREATER 10.                              NC2434.2 82
   000502         050600     IF TEST-CHECK = "PASS" GO TO LEVEL-3-TEST-1.                 NC2434.2 44 513
   000503         050700     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2434.2 49 135
   000504         050800     MOVE ENTRY-2 (10, 10) TO COMPUTED-A.                         NC2434.2 83 121
   000505         050900                                                                  NC2434.2
   000506         051000     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     PERFORM FAIL-TH.                                             NC2434.2 582
   000508         051200     GO TO LEVEL-3-TEST-1.                                        NC2434.2 513
   000509         051300 FIND-LEVEL-2-ENTRY.                                              NC2434.2
   000510         051400     IF ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA                    NC2434.2 83 80 82 49
   000511      1  051500         MOVE "PASS" TO TEST-CHECK                                NC2434.2 44
   000512      1  051600         PERFORM PASS-TH.                                         NC2434.2 579
   000513         051700 LEVEL-3-TEST-1.                                                  NC2434.2
   000514         051800     MOVE "PERFORM VARYING LEV3" TO FEATURE.                      NC2434.2 106
   000515         051900     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000516         052000     MOVE "LEVEL-3-TEST-1      " TO PAR-NAME.                     NC2434.2 110
   000517         052100     MOVE "ELEM (01,02,03)" TO ELEM-HOLD-AREA.                    NC2434.2 47
   000518         052200     PERFORM FIND-LEVEL-3-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 574 80
   000519         052300         UNTIL IDX-1 GREATER 10 AFTER IDX-2 FROM 1 BY 1 UNTIL     NC2434.2 80 82
   000520         052400             IDX-2 = 10 AFTER IDX-3 FROM 1 BY 1 UNTIL             NC2434.2 82 84
   000521         052500             IDX-3 = 10.                                          NC2434.2 84
   000522         052600     IF TEST-CHECK = "PASS" GO TO LEVEL-3-TEST-2.                 NC2434.2 44 529
   000523         052700     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2434.2 47 135
   000524         052800     MOVE ENTRY-3 (01, 02, 03) TO COMPUTED-A.                     NC2434.2 85 121
   000525         052900                                                                  NC2434.2
   000526         053000     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000527         053100     PERFORM FAIL-TH.                                             NC2434.2 582
   000528         053200                                                                  NC2434.2
   000529         053300 LEVEL-3-TEST-2.                                                  NC2434.2
   000530         053400     MOVE "LEVEL-3-TEST-2      " TO PAR-NAME.                     NC2434.2 110
   000531         053500     MOVE "ELEM (10,10,10)" TO ELEM-HOLD-AREA.                    NC2434.2 47
   000532         053600     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000533         053700     PERFORM FIND-LEVEL-3-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 574 80
   000534         053800         UNTIL IDX-1 GREATER 10 AFTER IDX-2 FROM 1 BY 1 UNTIL     NC2434.2 80 82
   000535         053900         IDX-2 GREATER 10 AFTER IDX-3 FROM 1 BY 1 UNTIL           NC2434.2 82 84
   000536         054000             IDX-3 GREATER 10.                                    NC2434.2 84
   000537         054100     IF TEST-CHECK = "PASS" GO TO LEVEL-3-TEST-3.                 NC2434.2 44 544
   000538         054200     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2434.2 47 135
   000539         054300     MOVE ENTRY-3 (10, 10, 10) TO COMPUTED-A.                     NC2434.2 85 121
   000540         054400                                                                  NC2434.2
   000541         054500     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000542         054600     PERFORM FAIL-TH.                                             NC2434.2 582
   000543         054700                                                                  NC2434.2
   000544         054800 LEVEL-3-TEST-3.                                                  NC2434.2
   000545         054900     MOVE "LEVEL-3-TEST-3      " TO PAR-NAME.                     NC2434.2 110
   000546         055000     MOVE "ELEM (08,07,06)" TO ELEM-HOLD-AREA.                    NC2434.2 47
   000547         055100     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000548         055200     PERFORM FIND-LEVEL-3-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2434.2 574 80
   000549         055300         UNTIL IDX-1 GREATER 10 AFTER IDX-2 FROM 1 BY 1 UNTIL     NC2434.2 80 82
   000550         055400             IDX-2 = 10 AFTER IDX-3 FROM 1 BY 1 UNTIL             NC2434.2 82 84
   000551         055500             IDX-3 = 10.                                          NC2434.2 84
   000552         055600     IF TEST-CHECK = "PASS" GO TO LEVEL-3-TEST-4.                 NC2434.2 44 558
   000553         055700     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2434.2 47 135
   000554         055800     MOVE ENTRY-3 (08, 07, 06) TO COMPUTED-A.                     NC2434.2 85 121
   000555         055900                                                                  NC2434.2
   000556         056000     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000557         056100     PERFORM FAIL-TH.                                             NC2434.2 582
   000558         056200 LEVEL-3-TEST-4.                                                  NC2434.2
   000559         056300     MOVE "LEVEL-3-TEST-4      " TO PAR-NAME.                     NC2434.2 110
   000560         056400     MOVE SPACES TO TEST-CHECK.                                   NC2434.2 IMP 44
   000561         056500     MOVE "ELEM (06,04,08)" TO ELEM-HOLD-AREA.                    NC2434.2 47
   000562         056600     PERFORM FIND-LEVEL-3-ENTRY VARYING IDX-1 FROM 3 BY 3         NC2434.2 574 80
   000563         056700         UNTIL IDX-1 GREATER 10 AFTER IDX-2 FROM 2 BY 2 UNTIL     NC2434.2 80 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800             IDX-2 GREATER 10 AFTER IDX-3 FROM 8 BY 8 UNTIL       NC2434.2 82 84
   000565         056900             IDX-3 GREATER 10.                                    NC2434.2 84
   000566         057000     IF TEST-CHECK = "PASS" GO TO END-3LEVEL-TEST.                NC2434.2 44 585
   000567         057100     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2434.2 47 135
   000568         057200     MOVE ENTRY-3 (06, 04, 08) TO COMPUTED-A.                     NC2434.2 85 121
   000569         057300                                                                  NC2434.2
   000570         057400     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2434.2 115
   000571         057500     PERFORM FAIL-TH.                                             NC2434.2 582
   000572         057600     GO TO END-3LEVEL-TEST.                                       NC2434.2 585
   000573         057700                                                                  NC2434.2
   000574         057800 FIND-LEVEL-3-ENTRY.                                              NC2434.2
   000575         057900     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA            NC2434.2 85 80 82 84 47
   000576      1  058000         MOVE "PASS" TO TEST-CHECK                                NC2434.2 44
   000577      1  058100         PERFORM PASS-TH.                                         NC2434.2 579
   000578         058200                                                                  NC2434.2
   000579         058300 PASS-TH.                                                         NC2434.2
   000580         058400     PERFORM PASS.                                                NC2434.2 264
   000581         058500     PERFORM PRINT-DETAIL.                                        NC2434.2 268
   000582         058600 FAIL-TH.                                                         NC2434.2
   000583         058700     PERFORM FAIL.                                                NC2434.2 265
   000584         058800     PERFORM  PRINT-DETAIL.                                       NC2434.2 268
   000585         058900 END-3LEVEL-TEST.                                                 NC2434.2
   000586         059000     EXIT.                                                        NC2434.2
   000587         059100*                                                                 NC2434.2
   000588         059200 TH7-INIT-1.                                                      NC2434.2
   000589         059300     MOVE   "TH7-TEST"   TO PAR-NAME.                             NC2434.2 110
   000590         059400     MOVE   "VI-2 1.3.4" TO ANSI-REFERENCE.                       NC2434.2 170
   000591         059500     MOVE    ALL "ABCDEFGHIJKLMNOPQRSTUVWXYZ" TO 7-DIMENSION-TBL. NC2434.2 87
   000592         059600     MOVE   "KL" TO L4-HOLD.                                      NC2434.2 164
   000593         059700     MOVE   "AB" TO L5-HOLD.                                      NC2434.2 165
   000594         059800     MOVE   "CD" TO L6-HOLD.                                      NC2434.2 166
   000595         059900     MOVE   "GH" TO L7-HOLD.                                      NC2434.2 167
   000596         060000     MOVE    SPACES TO WS-FLAG.                                   NC2434.2 IMP 103
   000597         060100     MOVE    1 TO REC-CT.                                         NC2434.2 157
   000598         060200     GO TO   TH7-TEST-1-0.                                        NC2434.2 603
   000599         060300 TH7-DELETE-1.                                                    NC2434.2
   000600         060400     PERFORM DE-LETE.                                             NC2434.2 266
   000601         060500     PERFORM PRINT-DETAIL.                                        NC2434.2 268
   000602         060600     GO TO   CCVS-EXIT.                                           NC2434.2 696
   000603         060700 TH7-TEST-1-0.                                                    NC2434.2
   000604         060800     PERFORM TH7-FIND-LEVEL-4-ENTRY                               NC2434.2 610
   000605         060900             VARYING X1 FROM 1 BY 1 UNTIL X1 > 2                  NC2434.2 88 88
   000606         061000               AFTER X2 FROM 1 BY 1 UNTIL X2 > 2                  NC2434.2 90 90
   000607         061100               AFTER X3 FROM 1 BY 1 UNTIL X3 > 2                  NC2434.2 92 92
   000608         061200               AFTER X4 FROM 1 BY 1 UNTIL X4 > 2.                 NC2434.2 94 94
   000609         061300     GO TO   TH7-TEST-1-1.                                        NC2434.2 613
   000610         061400 TH7-FIND-LEVEL-4-ENTRY.                                          NC2434.2
   000611         061500     IF      ENTRY-7-4 (X1 X2 X3 X4) = L4-HOLD                    NC2434.2 95 88 90 92 94 164
   000612      1  061600             MOVE   "FOUND" TO WS-FLAG.                           NC2434.2 103
   000613         061700 TH7-TEST-1-1.                                                    NC2434.2
   000614         061800     IF      WS-FLAG = "FOUND"                                    NC2434.2 103
   000615      1  061900             PERFORM PASS                                         NC2434.2 264
   000616      1  062000             PERFORM PRINT-DETAIL                                 NC2434.2 268
   000617         062100     ELSE                                                         NC2434.2
   000618      1  062200             MOVE   "TABLE NOT CORRECT AT 4TH LEVEL" TO RE-MARK   NC2434.2 115
   000619      1  062300             MOVE    ENTRY-7-4 (X1 X2 X3 X4) TO COMPUTED-X        NC2434.2 95 88 90 92 94 120
   000620      1  062400             MOVE    L4-HOLD TO CORRECT-X                         NC2434.2 164 134
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621      1  062500             PERFORM FAIL                                         NC2434.2 265
   000622      1  062600             PERFORM PRINT-DETAIL.                                NC2434.2 268
   000623         062700     MOVE    SPACES TO WS-FLAG.                                   NC2434.2 IMP 103
   000624         062800     ADD     1 TO REC-CT.                                         NC2434.2 157
   000625         062900 TH7-TEST-2-0.                                                    NC2434.2
   000626         063000     PERFORM TH7-FIND-LEVEL-5-ENTRY                               NC2434.2 633
   000627         063100             VARYING X1 FROM 1 BY 1 UNTIL X1 > 2                  NC2434.2 88 88
   000628         063200               AFTER X2 FROM 1 BY 1 UNTIL X2 > 2                  NC2434.2 90 90
   000629         063300               AFTER X3 FROM 1 BY 1 UNTIL X3 > 2                  NC2434.2 92 92
   000630         063400               AFTER X4 FROM 1 BY 1 UNTIL X4 > 2                  NC2434.2 94 94
   000631         063500               AFTER X5 FROM 1 BY 1 UNTIL X5 > 2.                 NC2434.2 96 96
   000632         063600     GO TO   TH7-TEST-2-1.                                        NC2434.2 636
   000633         063700 TH7-FIND-LEVEL-5-ENTRY.                                          NC2434.2
   000634         063800     IF      ENTRY-7-5 (X1 X2 X3 X4 X5) = L5-HOLD                 NC2434.2 97 88 90 92 94 96 165
   000635      1  063900             MOVE   "FOUND" TO WS-FLAG.                           NC2434.2 103
   000636         064000 TH7-TEST-2-1.                                                    NC2434.2
   000637         064100     IF      WS-FLAG = "FOUND"                                    NC2434.2 103
   000638      1  064200             PERFORM PASS                                         NC2434.2 264
   000639      1  064300             PERFORM PRINT-DETAIL                                 NC2434.2 268
   000640         064400     ELSE                                                         NC2434.2
   000641      1  064500             MOVE   "TABLE NOT CORRECT AT 5TH LEVEL" TO RE-MARK   NC2434.2 115
   000642      1  064600             MOVE    ENTRY-7-5 (X1 X2 X3 X4 X5) TO COMPUTED-X     NC2434.2 97 88 90 92 94 96 120
   000643      1  064700             MOVE    L5-HOLD TO CORRECT-X                         NC2434.2 165 134
   000644      1  064800             PERFORM FAIL                                         NC2434.2 265
   000645      1  064900             PERFORM PRINT-DETAIL.                                NC2434.2 268
   000646         065000     MOVE    SPACES TO WS-FLAG.                                   NC2434.2 IMP 103
   000647         065100     ADD     1 TO REC-CT.                                         NC2434.2 157
   000648         065200 TH7-TEST-3-0.                                                    NC2434.2
   000649         065300     PERFORM TH7-FIND-LEVEL-6-ENTRY                               NC2434.2 657
   000650         065400             VARYING X1 FROM 1 BY 1 UNTIL X1 > 2                  NC2434.2 88 88
   000651         065500               AFTER X2 FROM 1 BY 1 UNTIL X2 > 2                  NC2434.2 90 90
   000652         065600               AFTER X3 FROM 1 BY 1 UNTIL X3 > 2                  NC2434.2 92 92
   000653         065700               AFTER X4 FROM 1 BY 1 UNTIL X4 > 2                  NC2434.2 94 94
   000654         065800               AFTER X5 FROM 1 BY 1 UNTIL X5 > 2                  NC2434.2 96 96
   000655         065900               AFTER X6 FROM 1 BY 1 UNTIL X6 > 2.                 NC2434.2 98 98
   000656         066000     GO TO   TH7-TEST-3-1.                                        NC2434.2 660
   000657         066100 TH7-FIND-LEVEL-6-ENTRY.                                          NC2434.2
   000658         066200     IF      ENTRY-7-6 (X1 X2 X3 X4 X5 X6) = L6-HOLD              NC2434.2 99 88 90 92 94 96 98 166
   000659      1  066300             MOVE   "FOUND" TO WS-FLAG.                           NC2434.2 103
   000660         066400 TH7-TEST-3-1.                                                    NC2434.2
   000661         066500     IF      WS-FLAG = "FOUND"                                    NC2434.2 103
   000662      1  066600             PERFORM PASS                                         NC2434.2 264
   000663      1  066700             PERFORM PRINT-DETAIL                                 NC2434.2 268
   000664         066800     ELSE                                                         NC2434.2
   000665      1  066900             MOVE   "TABLE NOT CORRECT AT 6TH LEVEL" TO RE-MARK   NC2434.2 115
   000666      1  067000             MOVE    ENTRY-7-6 (X1 X2 X3 X4 X5 X6) TO COMPUTED-X  NC2434.2 99 88 90 92 94 96 98 120
   000667      1  067100             MOVE    L6-HOLD TO CORRECT-X                         NC2434.2 166 134
   000668      1  067200             PERFORM FAIL                                         NC2434.2 265
   000669      1  067300             PERFORM PRINT-DETAIL.                                NC2434.2 268
   000670         067400     MOVE    SPACES TO WS-FLAG.                                   NC2434.2 IMP 103
   000671         067500     ADD     1 TO REC-CT.                                         NC2434.2 157
   000672         067600 TH7-TEST-4-0.                                                    NC2434.2
   000673         067700     PERFORM TH7-FIND-LEVEL-7-ENTRY                               NC2434.2 682
   000674         067800             VARYING X1 FROM 1 BY 1 UNTIL X1 > 2                  NC2434.2 88 88
   000675         067900               AFTER X2 FROM 1 BY 1 UNTIL X2 > 2                  NC2434.2 90 90
   000676         068000               AFTER X3 FROM 1 BY 1 UNTIL X3 > 2                  NC2434.2 92 92
   000677         068100               AFTER X4 FROM 1 BY 1 UNTIL X4 > 2                  NC2434.2 94 94
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000678         068200               AFTER X5 FROM 1 BY 1 UNTIL X5 > 2                  NC2434.2 96 96
   000679         068300               AFTER X6 FROM 1 BY 1 UNTIL X6 > 2                  NC2434.2 98 98
   000680         068400               AFTER X7 FROM 1 BY 1 UNTIL X7 > 2.                 NC2434.2 100 100
   000681         068500     GO TO   TH7-TEST-4-1.                                        NC2434.2 685
   000682         068600 TH7-FIND-LEVEL-7-ENTRY.                                          NC2434.2
   000683         068700     IF      ENTRY-7-7 (X1 X2 X3 X4 X5 X6 X7) = L7-HOLD           NC2434.2 101 88 90 92 94 96 98 100 167
   000684      1  068800             MOVE   "FOUND" TO WS-FLAG.                           NC2434.2 103
   000685         068900 TH7-TEST-4-1.                                                    NC2434.2
   000686         069000     IF      WS-FLAG = "FOUND"                                    NC2434.2 103
   000687      1  069100             PERFORM PASS                                         NC2434.2 264
   000688      1  069200             PERFORM PRINT-DETAIL                                 NC2434.2 268
   000689         069300     ELSE                                                         NC2434.2
   000690      1  069400             MOVE   "TABLE NOT CORRECT AT 6TH LEVEL" TO RE-MARK   NC2434.2 115
   000691      1  069500             MOVE  ENTRY-7-7 (X1 X2 X3 X4 X5 X6 X7) TO COMPUTED-X NC2434.2 101 88 90 92 94 96 98 100 120
   000692      1  069600             MOVE    L7-HOLD TO CORRECT-X                         NC2434.2 167 134
   000693      1  069700             PERFORM FAIL                                         NC2434.2 265
   000694      1  069800             PERFORM PRINT-DETAIL.                                NC2434.2 268
   000695         069900*                                                                 NC2434.2
   000696         070000 CCVS-EXIT SECTION.                                               NC2434.2
   000697         070100 CCVS-999999.                                                     NC2434.2
   000698         070200     GO TO CLOSE-FILES.                                           NC2434.2 257
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       76   ADD-ELEM . . . . . . . . . . .  M387 M392
       61   ADD-GRP. . . . . . . . . . . .  M371
       67   ADD-SEC. . . . . . . . . . . .  M377 M381
      170   ANSI-REFERENCE . . . . . . . .  342 349 358 M590
      145   CCVS-C-1 . . . . . . . . . . .  286 328
      150   CCVS-C-2 . . . . . . . . . . .  287 329
      204   CCVS-E-1 . . . . . . . . . . .  292
      209   CCVS-E-2 . . . . . . . . . . .  301 308 315 320
      212   CCVS-E-2-2 . . . . . . . . . .  M300
      217   CCVS-E-3 . . . . . . . . . . .  321
      226   CCVS-E-4 . . . . . . . . . . .  300
      227   CCVS-E-4-1 . . . . . . . . . .  M298
      229   CCVS-E-4-2 . . . . . . . . . .  M299
      171   CCVS-H-1 . . . . . . . . . . .  281
      176   CCVS-H-2A. . . . . . . . . . .  282
      185   CCVS-H-2B. . . . . . . . . . .  283
      197   CCVS-H-3 . . . . . . . . . . .  284
      247   CCVS-PGM-ID. . . . . . . . . .  253 253
      127   CM-18V0
      121   COMPUTED-A . . . . . . . . . .  122 124 125 126 127 354 357 M404 M417 M430 M441 M462 M476 M490 M504 M524 M539
                                            M554 M568
      122   COMPUTED-N
      120   COMPUTED-X . . . . . . . . . .  M276 340 M619 M642 M666 M691
      124   COMPUTED-0V18
      126   COMPUTED-14V4
      128   COMPUTED-18V0
      125   COMPUTED-4V14
       46   CON-10
       48   CON-5
       50   CON-6
       45   CON-7
      144   COR-ANSI-REFERENCE . . . . . .  M349 M351
      135   CORRECT-A. . . . . . . . . . .  136 137 138 139 140 355 357 M403 M416 M429 M440 M461 M475 M489 M503 M523 M538
                                            M553 M567
      136   CORRECT-N
      134   CORRECT-X. . . . . . . . . . .  M277 341 M620 M643 M667 M692
      137   CORRECT-0V18
      139   CORRECT-14V4
      141   CORRECT-18V0
      138   CORRECT-4V14
      140   CR-18V0
      158   DELETE-COUNTER . . . . . . . .  M266 295 311 313
      113   DOTVALUE . . . . . . . . . . .  M271
      168   DUMMY-HOLD . . . . . . . . . .  M325 331
       39   DUMMY-RECORD . . . . . . . . .  M281 M282 M283 M284 M286 M287 M288 M290 M292 M301 M308 M315 M320 M321 325 M326
                                            327 M328 M329 M330 M331 335 M336 M344 M359
       72   ELEM-GRP . . . . . . . . . . .  M389
       47   ELEM-HOLD-AREA . . . . . . . .  M517 523 M531 538 M546 553 M561 567 575
       70   ELEM-NAME. . . . . . . . . . .  391
       74   ELEM-SEC . . . . . . . . . . .  M390
      215   ENDER-DESC . . . . . . . . . .  M303 M314 M319
       81   ENTRY-1. . . . . . . . . . . .  M370 404 417 430 441 448
       83   ENTRY-2. . . . . . . . . . . .  M380 462 476 490 504 510
       85   ENTRY-3. . . . . . . . . . . .  M391 524 539 554 568 575
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    17
0 Defined   Cross-reference of data names   References

0      89   ENTRY-7-1
       91   ENTRY-7-2
       93   ENTRY-7-3
       95   ENTRY-7-4. . . . . . . . . . .  611 619
       97   ENTRY-7-5. . . . . . . . . . .  634 642
       99   ENTRY-7-6. . . . . . . . . . .  658 666
      101   ENTRY-7-7. . . . . . . . . . .  683 691
      159   ERROR-COUNTER. . . . . . . . .  M265 294 304 307
      163   ERROR-HOLD . . . . . . . . . .  M294 M295 M295 M296 299
      213   ERROR-TOTAL. . . . . . . . . .  M305 M307 M312 M313 M317 M318
      106   FEATURE. . . . . . . . . . . .  M396 M454 M514
       80   GRP-ENTRY
       51   GRP-HOLD-AREA. . . . . . . . .  M399 403 M410 416 M423 429 M436 440 448
       59   GRP-NAME . . . . . . . . . . .  370
       88   GRP-7-1-ENTRY
       90   GRP-7-2-ENTRY
       92   GRP-7-3-ENTRY
       94   GRP-7-4-ENTRY
       96   GRP-7-5-ENTRY
       98   GRP-7-6-ENTRY
      100   GRP-7-7-ENTRY
       82   GRP2-ENTRY
       84   GRP3-ENTRY
      241   HYPHEN-LINE. . . . . . . . . .  288 290 330
      207   ID-AGAIN . . . . . . . . . . .  M253
       80   IDX-1. . . . . . . . . . . . .  M400 401 M413 414 M426 427 M437 438 448 M457 458 M471 472 M485 486 M499 500 510
                                            M518 519 M533 534 M548 549 M562 563 575
       82   IDX-2. . . . . . . . . . . . .  M458 459 M472 473 M486 487 M500 501 510 M519 520 M534 535 M549 550 M563 564 575
       84   IDX-3. . . . . . . . . . . . .  M520 521 M535 536 M550 551 M564 565 575
      240   INF-ANSI-REFERENCE . . . . . .  M342 M345 M358 M360
      235   INFO-TEXT. . . . . . . . . . .  M343
      160   INSPECT-COUNTER. . . . . . . .  M263 294 316 318
      164   L4-HOLD. . . . . . . . . . . .  M592 611 620
      165   L5-HOLD. . . . . . . . . . . .  M593 634 643
      166   L6-HOLD. . . . . . . . . . . .  M594 658 667
      167   L7-HOLD. . . . . . . . . . . .  M595 683 692
       52   N1
       53   N2
       54   N3
       55   N4
       56   N5
       57   N6
       58   N7
      108   P-OR-F . . . . . . . . . . . .  M263 M264 M265 M266 273 M276
      110   PAR-NAME . . . . . . . . . . .  M278 M397 M411 M424 M435 M453 M468 M482 M495 M516 M530 M545 M559 M589
      112   PARDOT-X . . . . . . . . . . .  M270
      161   PASS-COUNTER . . . . . . . . .  M264 296 298
       37   PRINT-FILE . . . . . . . . . .  33 252 258
       38   PRINT-REC. . . . . . . . . . .  M272 M348 M350
      115   RE-MARK. . . . . . . . . . . .  M267 M279 M406 M419 M432 M443 M464 M478 M492 M506 M526 M541 M556 M570 M618 M641
                                            M665 M690
      157   REC-CT . . . . . . . . . . . .  269 271 278 M597 M624 M647 M671
      156   REC-SKL-SUB
      169   RECORD-COUNT . . . . . . . . .  M323 324 M332
       65   SEC-GRP. . . . . . . . . . . .  M379
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    18
0 Defined   Cross-reference of data names   References

0      49   SEC-HOLD-AREA. . . . . . . . .  M455 461 M470 475 M484 489 M498 503 510
       63   SEC-NAME . . . . . . . . . . .  380
       41   SUB-1. . . . . . . . . . . . .  M368 369 370 379 380 389 391
       42   SUB-2. . . . . . . . . . . . .  M374 375 M376 380 390 391
       43   SUB-3. . . . . . . . . . . . .  M384 385 M386 391
       44   TEST-CHECK . . . . . . . . . .  M398 402 M412 415 M425 428 439 M449 M456 460 M469 474 M483 488 M496 M497 502
                                            M511 M515 522 M532 537 M547 552 M560 566 M576
      116   TEST-COMPUTED. . . . . . . . .  348
      131   TEST-CORRECT . . . . . . . . .  350
      188   TEST-ID. . . . . . . . . . . .  M253
      104   TEST-RESULTS . . . . . . . . .  M254 272
      162   TOTAL-ERROR
      103   WS-FLAG. . . . . . . . . . . .  M596 M612 614 M623 M635 637 M646 M659 661 M670 M684 686
      237   XXCOMPUTED . . . . . . . . . .  M357
      239   XXCORRECT. . . . . . . . . . .  M357
      232   XXINFO . . . . . . . . . . . .  344 359
       88   X1 . . . . . . . . . . . . . .  M605 605 611 619 M627 627 634 642 M650 650 658 666 M674 674 683 691
       90   X2 . . . . . . . . . . . . . .  M606 606 611 619 M628 628 634 642 M651 651 658 666 M675 675 683 691
       92   X3 . . . . . . . . . . . . . .  M607 607 611 619 M629 629 634 642 M652 652 658 666 M676 676 683 691
       94   X4 . . . . . . . . . . . . . .  M608 608 611 619 M630 630 634 642 M653 653 658 666 M677 677 683 691
       96   X5 . . . . . . . . . . . . . .  M631 631 634 642 M654 654 658 666 M678 678 683 691
       98   X6 . . . . . . . . . . . . . .  M655 655 658 666 M679 679 683 691
      100   X7 . . . . . . . . . . . . . .  M680 680 683 691
       79   3-DIMENSION-TBL
       87   7-DIMENSION-TBL. . . . . . . .  M591
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    19
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

      353   BAIL-OUT . . . . . . . . . . .  P275
      361   BAIL-OUT-EX. . . . . . . . . .  E275 G355
      356   BAIL-OUT-WRITE . . . . . . . .  G354
      337   BLANK-LINE-PRINT
      367   BUILD-LEVEL-1. . . . . . . . .  G378
      373   BUILD-LEVEL-2. . . . . . . . .  G388
      383   BUILD-LEVEL-3. . . . . . . . .  G393
      696   CCVS-EXIT. . . . . . . . . . .  G602
      697   CCVS-999999
      250   CCVS1
      362   CCVS1-EXIT . . . . . . . . . .  G256
      395   CHECK-ENTRIES. . . . . . . . .  G369
      257   CLOSE-FILES. . . . . . . . . .  G698
      285   COLUMN-NAMES-ROUTINE . . . . .  E255
      266   DE-LETE. . . . . . . . . . . .  P600
      289   END-ROUTINE. . . . . . . . . .  P258
      293   END-ROUTINE-1
      302   END-ROUTINE-12
      310   END-ROUTINE-13 . . . . . . . .  E258
      291   END-RTN-EXIT
      585   END-3LEVEL-TEST. . . . . . . .  G566 G572
      265   FAIL . . . . . . . . . . . . .  P583 P621 P644 P668 P693
      339   FAIL-ROUTINE . . . . . . . . .  P274
      352   FAIL-ROUTINE-EX. . . . . . . .  E274 G346
      347   FAIL-ROUTINE-WRITE . . . . . .  G340 G341
      582   FAIL-TH. . . . . . . . . . . .  P407 P420 P433 P444 P465 P479 P493 P507 P527 P542 P557 P571
      447   FIND-LEVEL-1-ENTRY . . . . . .  P400 P413 P426 P437
      509   FIND-LEVEL-2-ENTRY . . . . . .  P457 P471 P485 P499
      574   FIND-LEVEL-3-ENTRY . . . . . .  P518 P533 P548 P562
      280   HEAD-ROUTINE . . . . . . . . .  P255
      263   INSPT
      409   LEVEL-1-TEST-2 . . . . . . . .  G402
      422   LEVEL-1-TEST-3 . . . . . . . .  G415
      434   LEVEL-1-TEST-4 . . . . . . . .  G428
      452   LEVEL-2-TEST-1 . . . . . . . .  G439 G445
      467   LEVEL-2-TEST-2 . . . . . . . .  G460
      481   LEVEL-2-TEST-3 . . . . . . . .  G474
      494   LEVEL-2-TEST-4 . . . . . . . .  G488
      513   LEVEL-3-TEST-1 . . . . . . . .  G502 G508
      529   LEVEL-3-TEST-2 . . . . . . . .  G522
      544   LEVEL-3-TEST-3 . . . . . . . .  G537
      558   LEVEL-3-TEST-4 . . . . . . . .  G552
      251   OPEN-FILES
      264   PASS . . . . . . . . . . . . .  P580 P615 P638 P662 P687
      579   PASS-TH. . . . . . . . . . . .  P450 P512 P577
      268   PRINT-DETAIL . . . . . . . . .  P581 P584 P601 P616 P622 P639 P645 P663 P669 P688 P694
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    20
0 Defined   Cross-reference of procedures   References

0     364   SECT-NC243A-001
      261   TERMINATE-CALL
      259   TERMINATE-CCVS
      365   TH-17-001
      599   TH7-DELETE-1
      610   TH7-FIND-LEVEL-4-ENTRY . . . .  P604
      633   TH7-FIND-LEVEL-5-ENTRY . . . .  P626
      657   TH7-FIND-LEVEL-6-ENTRY . . . .  P649
      682   TH7-FIND-LEVEL-7-ENTRY . . . .  P673
      588   TH7-INIT-1
      603   TH7-TEST-1-0 . . . . . . . . .  G598
      613   TH7-TEST-1-1 . . . . . . . . .  G609
      625   TH7-TEST-2-0
      636   TH7-TEST-2-1 . . . . . . . . .  G632
      648   TH7-TEST-3-0
      660   TH7-TEST-3-1 . . . . . . . . .  G656
      672   TH7-TEST-4-0
      685   TH7-TEST-4-1 . . . . . . . . .  G681
      322   WRITE-LINE . . . . . . . . . .  P272 P273 P281 P282 P283 P284 P286 P287 P288 P290 P292 P301 P309 P315 P320 P321
                                            P344 P348 P350 P359
      334   WRT-LN . . . . . . . . . . . .  P328 P329 P330 P333 P338
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    21
0 Defined   Cross-reference of programs     References

        3   NC243A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC243A    Date 06/04/2022  Time 11:59:02   Page    22
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    367  IGYPS2015-I   The paragraph or section prior to paragraph or section "BUILD-LEVEL-1" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC243A:
 *    Source records = 698
 *    Data Division statements = 117
 *    Procedure Division statements = 358
 *    Generated COBOL statements = 0
 *    Program complexity factor = 370
0End of compilation 1,  program NC243A,  highest severity 0.
0Return code 0
