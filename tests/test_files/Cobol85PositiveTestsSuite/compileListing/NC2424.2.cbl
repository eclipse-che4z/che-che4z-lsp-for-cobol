1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:34   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:34   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2424.2
   000002         000200 PROGRAM-ID.                                                      NC2424.2
   000003         000300     NC242A.                                                      NC2424.2
   000004         000400                                                                  NC2424.2
   000005         000600*                                                              *  NC2424.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2424.2
   000007         000800*                                                              *  NC2424.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2424.2
   000009         001000*                                                              *  NC2424.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2424.2
   000011         001200*                                                              *  NC2424.2
   000012         001400*                                                              *  NC2424.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2424.2
   000014         001600*                                                              *  NC2424.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2424.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2424.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2424.2
   000018         002000*                                                              *  NC2424.2
   000019         002200*                                                              *  NC2424.2
   000020         002300*    PROGRAM NC242A TESTS THE CONSTRUCTION AND ACCESS OF       *  NC2424.2
   000021         002400*    THREE AND SEVEN-DIMENSIONAL TABLES.                       *  NC2424.2
   000022         002500*    THE CONSTRUCTION IS BY MEANS OF A FORMAT 4 "PERFORM"      *  NC2424.2
   000023         002600*    STATEMENT UTILIZING SUBSCRIPTS WHICH ARE CONVERTED TO     *  NC2424.2
   000024         002700*    INDICES BY "SET".   ACCESS IS VIA "IF" STATEMENTS USING   *  NC2424.2
   000025         002800*    SUBSCRIPTS OF NUMERIC LITERALS AND CONSTANTS.             *  NC2424.2
   000026         002900*                                                              *  NC2424.2
   000027         003100 ENVIRONMENT DIVISION.                                            NC2424.2
   000028         003200 CONFIGURATION SECTION.                                           NC2424.2
   000029         003300 SOURCE-COMPUTER.                                                 NC2424.2
   000030         003400     XXXXX082.                                                    NC2424.2
   000031         003500 OBJECT-COMPUTER.                                                 NC2424.2
   000032         003600     XXXXX083.                                                    NC2424.2
   000033         003700 INPUT-OUTPUT SECTION.                                            NC2424.2
   000034         003800 FILE-CONTROL.                                                    NC2424.2
   000035         003900     SELECT PRINT-FILE ASSIGN TO                                  NC2424.2 39
   000036         004000     XXXXX055.                                                    NC2424.2
   000037         004100 DATA DIVISION.                                                   NC2424.2
   000038         004200 FILE SECTION.                                                    NC2424.2
   000039         004300 FD  PRINT-FILE.                                                  NC2424.2

 ==000039==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000040         004400 01  PRINT-REC PICTURE X(120).                                    NC2424.2
   000041         004500 01  DUMMY-RECORD PICTURE X(120).                                 NC2424.2
   000042         004600 WORKING-STORAGE SECTION.                                         NC2424.2
   000043         004700 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC2424.2 IMP
   000044         004800 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC2424.2 IMP
   000045         004900 77  SUB-3              PICTURE 99   VALUE ZERO.                  NC2424.2 IMP
   000046         005000 77  CON-7              PICTURE 99   VALUE 07.                    NC2424.2
   000047         005100 77  CON-10             PICTURE 99  VALUE 10.                     NC2424.2
   000048         005200 77  CON-5              PICTURE 99  VALUE 05.                     NC2424.2
   000049         005300 77  CON-6              PICTURE 99  VALUE 06.                     NC2424.2
   000050         005400 77  N1                 PICTURE 99  VALUE ZERO.                   NC2424.2 IMP
   000051         005500 77  N2                 PICTURE 99  VALUE ZERO.                   NC2424.2 IMP
   000052         005600 77  N3                 PICTURE 99  VALUE ZERO.                   NC2424.2 IMP
   000053         005700 77  N4                 PICTURE 99  VALUE ZERO.                   NC2424.2 IMP
   000054         005800 77  N5                 PICTURE 99  VALUE ZERO.                   NC2424.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  N6                 PICTURE 99  VALUE ZERO.                   NC2424.2 IMP
   000056         006000 77  N7                 PICTURE 99  VALUE ZERO.                   NC2424.2 IMP
   000057         006100                                                                  NC2424.2
   000058         006200                                                                  NC2424.2
   000059         006300                                                                  NC2424.2
   000060         006400 01  GRP-NAME.                                                    NC2424.2
   000061         006500     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2424.2
   000062         006600     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2424.2
   000063         006700                                                                  NC2424.2
   000064         006800 01  SEC-NAME.                                                    NC2424.2
   000065         006900     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2424.2
   000066         007000     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2424.2
   000067         007100     02  FILLER              PICTURE X      VALUE ",".            NC2424.2
   000068         007200     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2424.2
   000069         007300     02  FILLER              PICTURE X      VALUE ")".            NC2424.2
   000070         007400                                                                  NC2424.2
   000071         007500 01  ELEM-NAME.                                                   NC2424.2
   000072         007600     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2424.2
   000073         007700     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2424.2
   000074         007800     02  FILLER              PICTURE X      VALUE ",".            NC2424.2
   000075         007900     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2424.2
   000076         008000     02  FILLER              PICTURE X      VALUE ",".            NC2424.2
   000077         008100     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2424.2
   000078         008200     02  FILLER              PICTURE X      VALUE ")".            NC2424.2
   000079         008300                                                                  NC2424.2
   000080         008400 01  3-DIMENSION-TBL.                                             NC2424.2
   000081         008500     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2424.2
   000082         008600         03  ENTRY-1         PICTURE X(5).                        NC2424.2
   000083         008700         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2424.2
   000084         008800             04  ENTRY-2     PICTURE X(11).                       NC2424.2
   000085         008900             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC2424.2
   000086         009000                 05  ENTRY-3 PICTURE X(15).                       NC2424.2
   000087         009100                                                                  NC2424.2
   000088         009200 01  7-DIMENSION-TBL.                                             NC2424.2
   000089         009300   02  GRP-7-1-ENTRY             OCCURS 2 INDEXED BY IX-1.        NC2424.2
   000090         009400     03  ENTRY-7-1               PIC XX.                          NC2424.2
   000091         009500     03  GRP-7-2-ENTRY           OCCURS 2 INDEXED BY IX-2.        NC2424.2
   000092         009600       04  ENTRY-7-2             PIC XX.                          NC2424.2
   000093         009700       04  GRP-7-3-ENTRY         OCCURS 2 INDEXED BY IX-3.        NC2424.2
   000094         009800         05  ENTRY-7-3           PIC XX.                          NC2424.2
   000095         009900         05  GRP-7-4-ENTRY       OCCURS 2 INDEXED BY IX-4.        NC2424.2
   000096         010000           06  ENTRY-7-4         PIC XX.                          NC2424.2
   000097         010100           06  GRP-7-5-ENTRY     OCCURS 2 INDEXED BY IX-5.        NC2424.2
   000098         010200             07  ENTRY-7-5       PIC XX.                          NC2424.2
   000099         010300             07  GRP-7-6-ENTRY   OCCURS 2 INDEXED BY IX-6.        NC2424.2
   000100         010400               08  ENTRY-7-6     PIC XX.                          NC2424.2
   000101         010500               08  GRP-7-7-ENTRY OCCURS 2 INDEXED BY IX-7.        NC2424.2
   000102         010600                 09  ENTRY-7-7   PIC XX.                          NC2424.2
   000103         010700                                                                  NC2424.2
   000104         010800 77  L1-HOLD                     PIC XX.                          NC2424.2
   000105         010900 77  L2-HOLD                     PIC XX.                          NC2424.2
   000106         011000 77  L3-HOLD                     PIC XX.                          NC2424.2
   000107         011100 77  L4-HOLD                     PIC XX.                          NC2424.2
   000108         011200 77  L5-HOLD                     PIC XX.                          NC2424.2
   000109         011300 77  L6-HOLD                     PIC XX.                          NC2424.2
   000110         011400 77  L7-HOLD                     PIC XX.                          NC2424.2
   000111         011500 01  TEST-RESULTS.                                                NC2424.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER                   PIC X      VALUE SPACE.          NC2424.2 IMP
   000113         011700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2424.2 IMP
   000114         011800     02 FILLER                   PIC X      VALUE SPACE.          NC2424.2 IMP
   000115         011900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2424.2 IMP
   000116         012000     02 FILLER                   PIC X      VALUE SPACE.          NC2424.2 IMP
   000117         012100     02  PAR-NAME.                                                NC2424.2
   000118         012200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2424.2 IMP
   000119         012300       03  PARDOT-X              PIC X      VALUE SPACE.          NC2424.2 IMP
   000120         012400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2424.2 IMP
   000121         012500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2424.2 IMP
   000122         012600     02 RE-MARK                  PIC X(61).                       NC2424.2
   000123         012700 01  TEST-COMPUTED.                                               NC2424.2
   000124         012800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2424.2 IMP
   000125         012900     02 FILLER                   PIC X(17)  VALUE                 NC2424.2
   000126         013000            "       COMPUTED=".                                   NC2424.2
   000127         013100     02 COMPUTED-X.                                               NC2424.2
   000128         013200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2424.2 IMP
   000129         013300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2424.2 128
   000130         013400                                 PIC -9(9).9(9).                  NC2424.2
   000131         013500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2424.2 128
   000132         013600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2424.2 128
   000133         013700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2424.2 128
   000134         013800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2424.2 128
   000135         013900         04 COMPUTED-18V0                    PIC -9(18).          NC2424.2
   000136         014000         04 FILLER                           PIC X.               NC2424.2
   000137         014100     03 FILLER PIC X(50) VALUE SPACE.                             NC2424.2 IMP
   000138         014200 01  TEST-CORRECT.                                                NC2424.2
   000139         014300     02 FILLER PIC X(30) VALUE SPACE.                             NC2424.2 IMP
   000140         014400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2424.2
   000141         014500     02 CORRECT-X.                                                NC2424.2
   000142         014600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2424.2 IMP
   000143         014700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2424.2 142
   000144         014800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2424.2 142
   000145         014900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2424.2 142
   000146         015000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2424.2 142
   000147         015100     03      CR-18V0 REDEFINES CORRECT-A.                         NC2424.2 142
   000148         015200         04 CORRECT-18V0                     PIC -9(18).          NC2424.2
   000149         015300         04 FILLER                           PIC X.               NC2424.2
   000150         015400     03 FILLER PIC X(2) VALUE SPACE.                              NC2424.2 IMP
   000151         015500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2424.2 IMP
   000152         015600 01  CCVS-C-1.                                                    NC2424.2
   000153         015700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2424.2
   000154         015800-    "SS  PARAGRAPH-NAME                                          NC2424.2
   000155         015900-    "       REMARKS".                                            NC2424.2
   000156         016000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2424.2 IMP
   000157         016100 01  CCVS-C-2.                                                    NC2424.2
   000158         016200     02 FILLER                     PIC X        VALUE SPACE.      NC2424.2 IMP
   000159         016300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2424.2
   000160         016400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2424.2 IMP
   000161         016500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2424.2
   000162         016600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2424.2 IMP
   000163         016700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2424.2 IMP
   000164         016800 01  REC-CT                        PIC 99       VALUE ZERO.       NC2424.2 IMP
   000165         016900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2424.2 IMP
   000166         017000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2424.2 IMP
   000167         017100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2424.2 IMP
   000168         017200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2424.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2424.2 IMP
   000170         017400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2424.2 IMP
   000171         017500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2424.2 IMP
   000172         017600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2424.2 IMP
   000173         017700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2424.2 IMP
   000174         017800 01  CCVS-H-1.                                                    NC2424.2
   000175         017900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2424.2 IMP
   000176         018000     02  FILLER                    PIC X(42)    VALUE             NC2424.2
   000177         018100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2424.2
   000178         018200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2424.2 IMP
   000179         018300 01  CCVS-H-2A.                                                   NC2424.2
   000180         018400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2424.2 IMP
   000181         018500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2424.2
   000182         018600   02  FILLER                        PIC XXXX   VALUE             NC2424.2
   000183         018700     "4.2 ".                                                      NC2424.2
   000184         018800   02  FILLER                        PIC X(28)  VALUE             NC2424.2
   000185         018900            " COPY - NOT FOR DISTRIBUTION".                       NC2424.2
   000186         019000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2424.2 IMP
   000187         019100                                                                  NC2424.2
   000188         019200 01  CCVS-H-2B.                                                   NC2424.2
   000189         019300   02  FILLER                        PIC X(15)  VALUE             NC2424.2
   000190         019400            "TEST RESULT OF ".                                    NC2424.2
   000191         019500   02  TEST-ID                       PIC X(9).                    NC2424.2
   000192         019600   02  FILLER                        PIC X(4)   VALUE             NC2424.2
   000193         019700            " IN ".                                               NC2424.2
   000194         019800   02  FILLER                        PIC X(12)  VALUE             NC2424.2
   000195         019900     " HIGH       ".                                              NC2424.2
   000196         020000   02  FILLER                        PIC X(22)  VALUE             NC2424.2
   000197         020100            " LEVEL VALIDATION FOR ".                             NC2424.2
   000198         020200   02  FILLER                        PIC X(58)  VALUE             NC2424.2
   000199         020300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2424.2
   000200         020400 01  CCVS-H-3.                                                    NC2424.2
   000201         020500     02  FILLER                      PIC X(34)  VALUE             NC2424.2
   000202         020600            " FOR OFFICIAL USE ONLY    ".                         NC2424.2
   000203         020700     02  FILLER                      PIC X(58)  VALUE             NC2424.2
   000204         020800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2424.2
   000205         020900     02  FILLER                      PIC X(28)  VALUE             NC2424.2
   000206         021000            "  COPYRIGHT   1985 ".                                NC2424.2
   000207         021100 01  CCVS-E-1.                                                    NC2424.2
   000208         021200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2424.2 IMP
   000209         021300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2424.2
   000210         021400     02 ID-AGAIN                     PIC X(9).                    NC2424.2
   000211         021500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2424.2 IMP
   000212         021600 01  CCVS-E-2.                                                    NC2424.2
   000213         021700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2424.2 IMP
   000214         021800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2424.2 IMP
   000215         021900     02 CCVS-E-2-2.                                               NC2424.2
   000216         022000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2424.2 IMP
   000217         022100         03 FILLER                   PIC X      VALUE SPACE.      NC2424.2 IMP
   000218         022200         03 ENDER-DESC               PIC X(44)  VALUE             NC2424.2
   000219         022300            "ERRORS ENCOUNTERED".                                 NC2424.2
   000220         022400 01  CCVS-E-3.                                                    NC2424.2
   000221         022500     02  FILLER                      PIC X(22)  VALUE             NC2424.2
   000222         022600            " FOR OFFICIAL USE ONLY".                             NC2424.2
   000223         022700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2424.2 IMP
   000224         022800     02  FILLER                      PIC X(58)  VALUE             NC2424.2
   000225         022900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2424.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2424.2 IMP
   000227         023100     02 FILLER                       PIC X(15)  VALUE             NC2424.2
   000228         023200             " COPYRIGHT 1985".                                   NC2424.2
   000229         023300 01  CCVS-E-4.                                                    NC2424.2
   000230         023400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2424.2 IMP
   000231         023500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2424.2
   000232         023600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2424.2 IMP
   000233         023700     02 FILLER                       PIC X(40)  VALUE             NC2424.2
   000234         023800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2424.2
   000235         023900 01  XXINFO.                                                      NC2424.2
   000236         024000     02 FILLER                       PIC X(19)  VALUE             NC2424.2
   000237         024100            "*** INFORMATION ***".                                NC2424.2
   000238         024200     02 INFO-TEXT.                                                NC2424.2
   000239         024300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2424.2 IMP
   000240         024400       04 XXCOMPUTED                 PIC X(20).                   NC2424.2
   000241         024500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2424.2 IMP
   000242         024600       04 XXCORRECT                  PIC X(20).                   NC2424.2
   000243         024700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2424.2
   000244         024800 01  HYPHEN-LINE.                                                 NC2424.2
   000245         024900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2424.2 IMP
   000246         025000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2424.2
   000247         025100-    "*****************************************".                 NC2424.2
   000248         025200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2424.2
   000249         025300-    "******************************".                            NC2424.2
   000250         025400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2424.2
   000251         025500     "NC242A".                                                    NC2424.2
   000252         025600 PROCEDURE DIVISION.                                              NC2424.2
   000253         025700 CCVS1 SECTION.                                                   NC2424.2
   000254         025800 OPEN-FILES.                                                      NC2424.2
   000255         025900     OPEN     OUTPUT PRINT-FILE.                                  NC2424.2 39
   000256         026000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2424.2 250 191 250 210
   000257         026100     MOVE    SPACE TO TEST-RESULTS.                               NC2424.2 IMP 111
   000258         026200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2424.2 283 288
   000259         026300     GO TO CCVS1-EXIT.                                            NC2424.2 365
   000260         026400 CLOSE-FILES.                                                     NC2424.2
   000261         026500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2424.2 292 313 39
   000262         026600 TERMINATE-CCVS.                                                  NC2424.2
   000263         026700     EXIT PROGRAM.                                                NC2424.2
   000264         026800 TERMINATE-CALL.                                                  NC2424.2
   000265         026900     STOP     RUN.                                                NC2424.2
   000266         027000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2424.2 115 167
   000267         027100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2424.2 115 168
   000268         027200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2424.2 115 166
   000269         027300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2424.2 115 165
   000270         027400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2424.2 122
   000271         027500 PRINT-DETAIL.                                                    NC2424.2
   000272         027600     IF REC-CT NOT EQUAL TO ZERO                                  NC2424.2 164 IMP
   000273      1  027700             MOVE "." TO PARDOT-X                                 NC2424.2 119
   000274      1  027800             MOVE REC-CT TO DOTVALUE.                             NC2424.2 164 120
   000275         027900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2424.2 111 40 325
   000276         028000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2424.2 115 325
   000277      1  028100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2424.2 342 355
   000278      1  028200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2424.2 356 364
   000279         028300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2424.2 IMP 115 IMP 127
   000280         028400     MOVE SPACE TO CORRECT-X.                                     NC2424.2 IMP 141
   000281         028500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2424.2 164 IMP IMP 117
   000282         028600     MOVE     SPACE TO RE-MARK.                                   NC2424.2 IMP 122
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 HEAD-ROUTINE.                                                    NC2424.2
   000284         028800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2424.2 174 41 325
   000285         028900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2424.2 179 41 325
   000286         029000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2424.2 188 41 325
   000287         029100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2424.2 200 41 325
   000288         029200 COLUMN-NAMES-ROUTINE.                                            NC2424.2
   000289         029300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2424.2 152 41 325
   000290         029400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2424.2 157 41 325
   000291         029500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2424.2 244 41 325
   000292         029600 END-ROUTINE.                                                     NC2424.2
   000293         029700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2424.2 244 41 325
   000294         029800 END-RTN-EXIT.                                                    NC2424.2
   000295         029900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2424.2 207 41 325
   000296         030000 END-ROUTINE-1.                                                   NC2424.2
   000297         030100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2424.2 166 170 167
   000298         030200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2424.2 170 165 170
   000299         030300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2424.2 168 170
   000300         030400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2424.2
   000301         030500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2424.2 168 230
   000302         030600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2424.2 170 232
   000303         030700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2424.2 229 215
   000304         030800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2424.2 212 41 325
   000305         030900  END-ROUTINE-12.                                                 NC2424.2
   000306         031000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2424.2 218
   000307         031100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2424.2 166 IMP
   000308      1  031200         MOVE "NO " TO ERROR-TOTAL                                NC2424.2 216
   000309         031300         ELSE                                                     NC2424.2
   000310      1  031400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2424.2 166 216
   000311         031500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2424.2 212 41
   000312         031600     PERFORM WRITE-LINE.                                          NC2424.2 325
   000313         031700 END-ROUTINE-13.                                                  NC2424.2
   000314         031800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2424.2 165 IMP
   000315      1  031900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2424.2 216
   000316      1  032000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2424.2 165 216
   000317         032100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2424.2 218
   000318         032200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2424.2 212 41 325
   000319         032300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2424.2 167 IMP
   000320      1  032400          MOVE "NO " TO ERROR-TOTAL                               NC2424.2 216
   000321      1  032500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2424.2 167 216
   000322         032600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2424.2 218
   000323         032700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2424.2 212 41 325
   000324         032800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2424.2 220 41 325
   000325         032900 WRITE-LINE.                                                      NC2424.2
   000326         033000     ADD 1 TO RECORD-COUNT.                                       NC2424.2 172
   000327         033100     IF RECORD-COUNT GREATER 50                                   NC2424.2 172
   000328      1  033200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2424.2 41 171
   000329      1  033300         MOVE SPACE TO DUMMY-RECORD                               NC2424.2 IMP 41
   000330      1  033400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2424.2 41
   000331      1  033500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2424.2 152 41 337
   000332      1  033600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2424.2 157 41 337
   000333      1  033700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2424.2 244 41 337
   000334      1  033800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2424.2 171 41
   000335      1  033900         MOVE ZERO TO RECORD-COUNT.                               NC2424.2 IMP 172
   000336         034000     PERFORM WRT-LN.                                              NC2424.2 337
   000337         034100 WRT-LN.                                                          NC2424.2
   000338         034200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2424.2 41
   000339         034300     MOVE SPACE TO DUMMY-RECORD.                                  NC2424.2 IMP 41
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 BLANK-LINE-PRINT.                                                NC2424.2
   000341         034500     PERFORM WRT-LN.                                              NC2424.2 337
   000342         034600 FAIL-ROUTINE.                                                    NC2424.2
   000343         034700     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2424.2 127 IMP 350
   000344         034800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2424.2 141 IMP 350
   000345         034900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2424.2 173 243
   000346         035000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2424.2 238
   000347         035100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2424.2 235 41 325
   000348         035200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2424.2 IMP 243
   000349         035300     GO TO  FAIL-ROUTINE-EX.                                      NC2424.2 355
   000350         035400 FAIL-ROUTINE-WRITE.                                              NC2424.2
   000351         035500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2424.2 123 40 325
   000352         035600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2424.2 173 151
   000353         035700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2424.2 138 40 325
   000354         035800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2424.2 IMP 151
   000355         035900 FAIL-ROUTINE-EX. EXIT.                                           NC2424.2
   000356         036000 BAIL-OUT.                                                        NC2424.2
   000357         036100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2424.2 128 IMP 359
   000358         036200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2424.2 142 IMP 364
   000359         036300 BAIL-OUT-WRITE.                                                  NC2424.2
   000360         036400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2424.2 142 242 128 240
   000361         036500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2424.2 173 243
   000362         036600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2424.2 235 41 325
   000363         036700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2424.2 IMP 243
   000364         036800 BAIL-OUT-EX. EXIT.                                               NC2424.2
   000365         036900 CCVS1-EXIT.                                                      NC2424.2
   000366         037000     EXIT.                                                        NC2424.2
   000367         037100 SECT-NC242A-001 SECTION.                                         NC2424.2
   000368         037200 TH-16-001.                                                       NC2424.2
   000369         037300     PERFORM PARA-1 VARYING SUB-1 FROM 1 BY 1                     NC2424.2 375 43
   000370         037400         UNTIL SUB-1 EQUAL TO 11                                  NC2424.2 43
   000371         037500         AFTER SUB-2 FROM 1 BY 1 UNTIL SUB-2 EQUAL TO 11          NC2424.2 44 44
   000372         037600         AFTER SUB-3 FROM 1 BY 1 UNTIL SUB-3 EQUAL TO 11          NC2424.2 45 45
   000373         037700     GO TO CHECK-ENTRIES.                                         NC2424.2 386
   000374         037800                                                                  NC2424.2
   000375         037900 PARA-1.                                                          NC2424.2
   000376         038000     SET IDX-1 TO SUB-1.                                          NC2424.2 81 43
   000377         038100     SET IDX-2 TO SUB-2.                                          NC2424.2 83 44
   000378         038200     SET IDX-3 TO SUB-3.                                          NC2424.2 85 45
   000379         038300     SET ADD-GRP, SEC-GRP, ELEM-GRP TO IDX-1.                     NC2424.2 62 66 73 81
   000380         038400     MOVE GRP-NAME TO ENTRY-1 (IDX-1).                            NC2424.2 60 82 81
   000381         038500     SET ADD-SEC, ELEM-SEC TO IDX-2.                              NC2424.2 68 75 83
   000382         038600     MOVE SEC-NAME TO ENTRY-2 (IDX-1, IDX-2).                     NC2424.2 64 84 81 83
   000383         038700     SET ADD-ELEM TO IDX-3.                                       NC2424.2 77 85
   000384         038800     MOVE ELEM-NAME TO ENTRY-3 (IDX-1, IDX-2, IDX-3).             NC2424.2 71 86 81 83 85
   000385         038900                                                                  NC2424.2
   000386         039000 CHECK-ENTRIES.                                                   NC2424.2
   000387         039100     MOVE "LEVEL 1 TBL SUBSCRPT" TO FEATURE.                      NC2424.2 113
   000388         039200     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC2424.2 117
   000389         039300     IF ENTRY-1 (5) IS NOT EQUAL TO "GRP05"                       NC2424.2 82
   000390      1  039400         MOVE "GRP05" TO CORRECT-A                                NC2424.2 142
   000391      1  039500         MOVE ENTRY-1 (5) TO COMPUTED-A                           NC2424.2 82 128
   000392         039600                                                                  NC2424.2
   000393      1  039700         MOVE "NUMERIC LITERAL SUBSCRIPT  " TO RE-MARK            NC2424.2 122
   000394      1  039800         PERFORM FAIL                                             NC2424.2 268
   000395      1  039900         GO TO TEST-1-WRITE.                                      NC2424.2 398
   000396         040000                                                                  NC2424.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     PERFORM PASS.                                                NC2424.2 267
   000398         040200 TEST-1-WRITE.                                                    NC2424.2
   000399         040300     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000400         040400                                                                  NC2424.2
   000401         040500 TEST-1-2.                                                        NC2424.2
   000402         040600     MOVE "TEST-1-2" TO PAR-NAME.                                 NC2424.2 117
   000403         040700     IF ENTRY-1 (CON-5) IS NOT EQUAL TO "GRP05"                   NC2424.2 82 48
   000404      1  040800         MOVE "GRP05" TO CORRECT-A                                NC2424.2 142
   000405      1  040900         MOVE ENTRY-1 (CON-5) TO COMPUTED-A                       NC2424.2 82 48 128
   000406         041000                                                                  NC2424.2
   000407      1  041100         MOVE "NUMERIC CONSTANT SUBSCRIPT " TO RE-MARK            NC2424.2 122
   000408      1  041200         PERFORM FAIL                                             NC2424.2 268
   000409      1  041300          GO TO TEST-1-2-WRITE.                                   NC2424.2 412
   000410         041400                                                                  NC2424.2
   000411         041500     PERFORM PASS.                                                NC2424.2 267
   000412         041600 TEST-1-2-WRITE.                                                  NC2424.2
   000413         041700     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000414         041800                                                                  NC2424.2
   000415         041900 TEST-2.                                                          NC2424.2
   000416         042000     MOVE "LEVEL 2 TBL SUBSCRPT" TO FEATURE.                      NC2424.2 113
   000417         042100     MOVE "TEST-2              " TO PAR-NAME.                     NC2424.2 117
   000418         042200     IF ENTRY-2 (5, 6) IS NOT EQUAL TO "SEC (05,06)"              NC2424.2 84
   000419      1  042300         MOVE "SEC (05,06)" TO CORRECT-A                          NC2424.2 142
   000420      1  042400         MOVE ENTRY-2 (5, 6) TO COMPUTED-A                        NC2424.2 84 128
   000421         042500                                                                  NC2424.2
   000422      1  042600         MOVE "NUMERIC LITERAL SUBSCRIPT  " TO RE-MARK            NC2424.2 122
   000423      1  042700         PERFORM FAIL                                             NC2424.2 268
   000424      1  042800         GO TO TEST-2-WRITE.                                      NC2424.2 427
   000425         042900                                                                  NC2424.2
   000426         043000     PERFORM PASS.                                                NC2424.2 267
   000427         043100 TEST-2-WRITE.                                                    NC2424.2
   000428         043200     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000429         043300                                                                  NC2424.2
   000430         043400 TEST-2-2.                                                        NC2424.2
   000431         043500     MOVE "TEST-2-2            " TO PAR-NAME.                     NC2424.2 117
   000432         043600     IF ENTRY-2 (05, CON-6) IS NOT EQUAL TO "SEC (05,06)"         NC2424.2 84 49
   000433      1  043700         MOVE "SEC (05,06)" TO CORRECT-A                          NC2424.2 142
   000434      1  043800         MOVE ENTRY-2 (05, CON-6) TO COMPUTED-A                   NC2424.2 84 49 128
   000435         043900                                                                  NC2424.2
   000436      1  044000         MOVE "NUM LITRL/CONSTANT SUBSCRPT" TO RE-MARK            NC2424.2 122
   000437      1  044100         PERFORM FAIL                                             NC2424.2 268
   000438      1  044200         GO TO TEST-2-2-WRITE.                                    NC2424.2 441
   000439         044300                                                                  NC2424.2
   000440         044400     PERFORM PASS.                                                NC2424.2 267
   000441         044500 TEST-2-2-WRITE.                                                  NC2424.2
   000442         044600     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000443         044700                                                                  NC2424.2
   000444         044800 TEST-2-3.                                                        NC2424.2
   000445         044900     MOVE "TEST-2-3            " TO PAR-NAME.                     NC2424.2 117
   000446         045000     IF ENTRY-2 (CON-5, CON-6) IS NOT EQUAL TO "SEC (05,06)"      NC2424.2 84 48 49
   000447      1  045100         MOVE "SEC (05,06)" TO CORRECT-A                          NC2424.2 142
   000448      1  045200         MOVE ENTRY-2 (CON-5, CON-6) TO COMPUTED-A                NC2424.2 84 48 49 128
   000449         045300                                                                  NC2424.2
   000450      1  045400         MOVE "2 NUMERIC CONSTANT SUBSCRPT" TO RE-MARK            NC2424.2 122
   000451      1  045500         PERFORM FAIL                                             NC2424.2 268
   000452      1  045600         GO TO TEST-2-3-WRITE.                                    NC2424.2 455
   000453         045700                                                                  NC2424.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     PERFORM PASS.                                                NC2424.2 267
   000455         045900 TEST-2-3-WRITE.                                                  NC2424.2
   000456         046000     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000457         046100                                                                  NC2424.2
   000458         046200 TEST-3.                                                          NC2424.2
   000459         046300     MOVE "LEVEL 3 TBL SUBSCRPT" TO FEATURE.                      NC2424.2 113
   000460         046400     MOVE "TEST-3              " TO PAR-NAME.                     NC2424.2 117
   000461         046500     IF ENTRY-3 (10, 05, 06) IS NOT EQUAL TO "ELEM (10,05,06)"    NC2424.2 86
   000462      1  046600         MOVE "ELEM (10,05,06)" TO CORRECT-A                      NC2424.2 142
   000463      1  046700         MOVE ENTRY-3 (10, 05, 06) TO COMPUTED-A                  NC2424.2 86 128
   000464         046800                                                                  NC2424.2
   000465      1  046900         MOVE "3 NUMERIC LITERAL SUBSCRPTS" TO RE-MARK            NC2424.2 122
   000466      1  047000         PERFORM FAIL                                             NC2424.2 268
   000467      1  047100         GO TO TEST-3-WRITE.                                      NC2424.2 470
   000468         047200                                                                  NC2424.2
   000469         047300     PERFORM PASS.                                                NC2424.2 267
   000470         047400 TEST-3-WRITE.                                                    NC2424.2
   000471         047500     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000472         047600                                                                  NC2424.2
   000473         047700 TEST-3-2.                                                        NC2424.2
   000474         047800     MOVE "TEST-3-2            " TO PAR-NAME.                     NC2424.2 117
   000475         047900     IF ENTRY-3 (10, CON-5, CON-6) IS NOT EQUAL TO                NC2424.2 86 48 49
   000476         048000         "ELEM (10,05,06)"                                        NC2424.2
   000477      1  048100         MOVE "ELEM (10,05,06)" TO CORRECT-A                      NC2424.2 142
   000478      1  048200         MOVE ENTRY-3 (10, CON-5, CON-6) TO COMPUTED-A            NC2424.2 86 48 49 128
   000479         048300                                                                  NC2424.2
   000480      1  048400         MOVE "1 NUM LTRL/2 CONSTANT SUBS " TO RE-MARK            NC2424.2 122
   000481      1  048500         PERFORM FAIL                                             NC2424.2 268
   000482      1  048600         GO TO TEST-3-2-WRITE.                                    NC2424.2 485
   000483         048700                                                                  NC2424.2
   000484         048800     PERFORM PASS.                                                NC2424.2 267
   000485         048900 TEST-3-2-WRITE.                                                  NC2424.2
   000486         049000     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000487         049100                                                                  NC2424.2
   000488         049200 TEST-3-3.                                                        NC2424.2
   000489         049300     MOVE "TEST-3-3            " TO PAR-NAME.                     NC2424.2 117
   000490         049400     IF ENTRY-3 (CON-10, CON-5, CON-6) IS NOT EQUAL TO            NC2424.2 86 47 48 49
   000491      1  049500         "ELEM (10,05,06)" MOVE "ELEM (10,05,06)" TO CORRECT-A    NC2424.2 142
   000492      1  049600         MOVE ENTRY-3 (CON-10, CON-5, CON-6) TO COMPUTED-A        NC2424.2 86 47 48 49 128
   000493         049700                                                                  NC2424.2
   000494      1  049800         MOVE "3 NUMERIC CONSTANT SUBSCRPT" TO RE-MARK            NC2424.2 122
   000495      1  049900         PERFORM FAIL                                             NC2424.2 268
   000496      1  050000         GO TO END-3LEVEL-SUBSCRPT-TEST.                          NC2424.2 501
   000497         050100                                                                  NC2424.2
   000498         050200     PERFORM PASS.                                                NC2424.2 267
   000499         050300     GO TO END-3LEVEL-SUBSCRPT-TEST.                              NC2424.2 501
   000500         050400                                                                  NC2424.2
   000501         050500 END-3LEVEL-SUBSCRPT-TEST.                                        NC2424.2
   000502         050600     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000503         050700*                                                                 NC2424.2
   000504         050800 TH7-INIT.                                                        NC2424.2
   000505         050900     MOVE   "TH7-TEST"   TO PAR-NAME.                             NC2424.2 117
   000506         051000     MOVE   "VI-2 1.3.4" TO ANSI-REFERENCE.                       NC2424.2 173
   000507         051100     MOVE    ALL "ABCDEFGHIJKLMNOPQRSTUVWXYZ" TO 7-DIMENSION-TBL. NC2424.2 88
   000508         051200     MOVE   "KL" TO L4-HOLD.                                      NC2424.2 107
   000509         051300     MOVE   "AB" TO L5-HOLD.                                      NC2424.2 108
   000510         051400     MOVE   "CD" TO L6-HOLD.                                      NC2424.2 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     MOVE   "GH" TO L7-HOLD.                                      NC2424.2 110
   000512         051600     MOVE    1 TO REC-CT.                                         NC2424.2 164
   000513         051700     SET     IX-1 IX-2 IX-3 IX-4 IX-5 IX-6 IX-7 TO 1.             NC2424.2 89 91 93 95 97 99 101
   000514         051800     MOVE    2 TO N1 N3 N5 N7.                                    NC2424.2 50 52 54 56
   000515         051900     GO TO   TH7-TEST-1.                                          NC2424.2 520
   000516         052000 TH7-DELETE-1.                                                    NC2424.2
   000517         052100     PERFORM DE-LETE.                                             NC2424.2 269
   000518         052200     PERFORM PRINT-DETAIL.                                        NC2424.2 271
   000519         052300     GO TO   CCVS-999999.                                         NC2424.2 570
   000520         052400 TH7-TEST-1.                                                      NC2424.2
   000521         052500     MOVE   "TH7-TEST-1" TO PAR-NAME.                             NC2424.2 117
   000522         052600     IF      ENTRY-7-4 (N1 1 N3 1) = L4-HOLD                      NC2424.2 96 50 52 107
   000523      1  052700             PERFORM PASS                                         NC2424.2 267
   000524      1  052800             PERFORM PRINT-DETAIL                                 NC2424.2 271
   000525         052900     ELSE                                                         NC2424.2
   000526      1  053000             MOVE    ENTRY-7-4 (N1 1 N3 1) TO COMPUTED-A          NC2424.2 96 50 52 128
   000527      1  053100             MOVE    L4-HOLD TO CORRECT-A                         NC2424.2 107 142
   000528      1  053200             MOVE   "TABLE INCORRECT" TO RE-MARK                  NC2424.2 122
   000529      1  053300             PERFORM FAIL                                         NC2424.2 268
   000530      1  053400             PERFORM PRINT-DETAIL.                                NC2424.2 271
   000531         053500     ADD     1 TO REC-CT.                                         NC2424.2 164
   000532         053600 TH7-TEST-2.                                                      NC2424.2
   000533         053700     MOVE   "TH7-TEST-2" TO PAR-NAME.                             NC2424.2 117
   000534         053800     IF      ENTRY-7-5 (N1 1 N3 1 N5) = L5-HOLD                   NC2424.2 98 50 52 54 108
   000535      1  053900             PERFORM PASS                                         NC2424.2 267
   000536      1  054000             PERFORM PRINT-DETAIL                                 NC2424.2 271
   000537         054100     ELSE                                                         NC2424.2
   000538      1  054200             MOVE    ENTRY-7-5 (N1 1 N3 1 N5) TO COMPUTED-A       NC2424.2 98 50 52 54 128
   000539      1  054300             MOVE    L5-HOLD TO CORRECT-A                         NC2424.2 108 142
   000540      1  054400             MOVE   "TABLE INCORRECT" TO RE-MARK                  NC2424.2 122
   000541      1  054500             PERFORM FAIL                                         NC2424.2 268
   000542      1  054600             PERFORM PRINT-DETAIL.                                NC2424.2 271
   000543         054700     ADD     1 TO REC-CT.                                         NC2424.2 164
   000544         054800 TH7-TEST-3.                                                      NC2424.2
   000545         054900     MOVE   "TH7-TEST-3" TO PAR-NAME.                             NC2424.2 117
   000546         055000     IF      ENTRY-7-6 (N1 1 N3 1 N5 1) = L6-HOLD                 NC2424.2 100 50 52 54 109
   000547      1  055100             PERFORM PASS                                         NC2424.2 267
   000548      1  055200             PERFORM PRINT-DETAIL                                 NC2424.2 271
   000549         055300     ELSE                                                         NC2424.2
   000550      1  055400             MOVE    ENTRY-7-6 (N1 1 N3 1 N5 1) TO COMPUTED-A     NC2424.2 100 50 52 54 128
   000551      1  055500             MOVE    L6-HOLD TO CORRECT-A                         NC2424.2 109 142
   000552      1  055600             MOVE   "TABLE INCORRECT" TO RE-MARK                  NC2424.2 122
   000553      1  055700             PERFORM FAIL                                         NC2424.2 268
   000554      1  055800             PERFORM PRINT-DETAIL.                                NC2424.2 271
   000555         055900     ADD     1 TO REC-CT.                                         NC2424.2 164
   000556         056000 TH7-TEST-4.                                                      NC2424.2
   000557         056100     MOVE   "TH7-TEST-4" TO PAR-NAME.                             NC2424.2 117
   000558         056200     IF      ENTRY-7-7 (N1 1 N3 1 N5 1 N7) = L7-HOLD              NC2424.2 102 50 52 54 56 110
   000559      1  056300             PERFORM PASS                                         NC2424.2 267
   000560      1  056400             PERFORM PRINT-DETAIL                                 NC2424.2 271
   000561         056500     ELSE                                                         NC2424.2
   000562      1  056600             MOVE    ENTRY-7-7 (N1 1 N3 1 N5 1 N7) TO COMPUTED-A  NC2424.2 102 50 52 54 56 128
   000563      1  056700             MOVE    L7-HOLD TO CORRECT-A                         NC2424.2 110 142
   000564      1  056800             MOVE   "TABLE INCORRECT" TO RE-MARK                  NC2424.2 122
   000565      1  056900             PERFORM FAIL                                         NC2424.2 268
   000566      1  057000             PERFORM PRINT-DETAIL.                                NC2424.2 271
   000567         057100                                                                  NC2424.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200*                                                                 NC2424.2
   000569         057300 CCVS-EXIT SECTION.                                               NC2424.2
   000570         057400 CCVS-999999.                                                     NC2424.2
   000571         057500     GO TO CLOSE-FILES.                                           NC2424.2 260
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       77   ADD-ELEM . . . . . . . . . . .  M383
       62   ADD-GRP. . . . . . . . . . . .  M379
       68   ADD-SEC. . . . . . . . . . . .  M381
      173   ANSI-REFERENCE . . . . . . . .  345 352 361 M506
      152   CCVS-C-1 . . . . . . . . . . .  289 331
      157   CCVS-C-2 . . . . . . . . . . .  290 332
      207   CCVS-E-1 . . . . . . . . . . .  295
      212   CCVS-E-2 . . . . . . . . . . .  304 311 318 323
      215   CCVS-E-2-2 . . . . . . . . . .  M303
      220   CCVS-E-3 . . . . . . . . . . .  324
      229   CCVS-E-4 . . . . . . . . . . .  303
      230   CCVS-E-4-1 . . . . . . . . . .  M301
      232   CCVS-E-4-2 . . . . . . . . . .  M302
      174   CCVS-H-1 . . . . . . . . . . .  284
      179   CCVS-H-2A. . . . . . . . . . .  285
      188   CCVS-H-2B. . . . . . . . . . .  286
      200   CCVS-H-3 . . . . . . . . . . .  287
      250   CCVS-PGM-ID. . . . . . . . . .  256 256
      134   CM-18V0
      128   COMPUTED-A . . . . . . . . . .  129 131 132 133 134 357 360 M391 M405 M420 M434 M448 M463 M478 M492 M526 M538
                                            M550 M562
      129   COMPUTED-N
      127   COMPUTED-X . . . . . . . . . .  M279 343
      131   COMPUTED-0V18
      133   COMPUTED-14V4
      135   COMPUTED-18V0
      132   COMPUTED-4V14
       47   CON-10 . . . . . . . . . . . .  490 492
       48   CON-5. . . . . . . . . . . . .  403 405 446 448 475 478 490 492
       49   CON-6. . . . . . . . . . . . .  432 434 446 448 475 478 490 492
       46   CON-7
      151   COR-ANSI-REFERENCE . . . . . .  M352 M354
      142   CORRECT-A. . . . . . . . . . .  143 144 145 146 147 358 360 M390 M404 M419 M433 M447 M462 M477 M491 M527 M539
                                            M551 M563
      143   CORRECT-N
      141   CORRECT-X. . . . . . . . . . .  M280 344
      144   CORRECT-0V18
      146   CORRECT-14V4
      148   CORRECT-18V0
      145   CORRECT-4V14
      147   CR-18V0
      165   DELETE-COUNTER . . . . . . . .  M269 298 314 316
      120   DOTVALUE . . . . . . . . . . .  M274
      171   DUMMY-HOLD . . . . . . . . . .  M328 334
       41   DUMMY-RECORD . . . . . . . . .  M284 M285 M286 M287 M289 M290 M291 M293 M295 M304 M311 M318 M323 M324 328 M329
                                            330 M331 M332 M333 M334 338 M339 M347 M362
       73   ELEM-GRP . . . . . . . . . . .  M379
       71   ELEM-NAME. . . . . . . . . . .  384
       75   ELEM-SEC . . . . . . . . . . .  M381
      218   ENDER-DESC . . . . . . . . . .  M306 M317 M322
       82   ENTRY-1. . . . . . . . . . . .  M380 389 391 403 405
       84   ENTRY-2. . . . . . . . . . . .  M382 418 420 432 434 446 448
       86   ENTRY-3. . . . . . . . . . . .  M384 461 463 475 478 490 492
       90   ENTRY-7-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    15
0 Defined   Cross-reference of data names   References

0      92   ENTRY-7-2
       94   ENTRY-7-3
       96   ENTRY-7-4. . . . . . . . . . .  522 526
       98   ENTRY-7-5. . . . . . . . . . .  534 538
      100   ENTRY-7-6. . . . . . . . . . .  546 550
      102   ENTRY-7-7. . . . . . . . . . .  558 562
      166   ERROR-COUNTER. . . . . . . . .  M268 297 307 310
      170   ERROR-HOLD . . . . . . . . . .  M297 M298 M298 M299 302
      216   ERROR-TOTAL. . . . . . . . . .  M308 M310 M315 M316 M320 M321
      113   FEATURE. . . . . . . . . . . .  M387 M416 M459
       81   GRP-ENTRY
       60   GRP-NAME . . . . . . . . . . .  380
       89   GRP-7-1-ENTRY
       91   GRP-7-2-ENTRY
       93   GRP-7-3-ENTRY
       95   GRP-7-4-ENTRY
       97   GRP-7-5-ENTRY
       99   GRP-7-6-ENTRY
      101   GRP-7-7-ENTRY
       83   GRP2-ENTRY
       85   GRP3-ENTRY
      244   HYPHEN-LINE. . . . . . . . . .  291 293 333
      210   ID-AGAIN . . . . . . . . . . .  M256
       81   IDX-1. . . . . . . . . . . . .  M376 379 380 382 384
       83   IDX-2. . . . . . . . . . . . .  M377 381 382 384
       85   IDX-3. . . . . . . . . . . . .  M378 383 384
      243   INF-ANSI-REFERENCE . . . . . .  M345 M348 M361 M363
      238   INFO-TEXT. . . . . . . . . . .  M346
      167   INSPECT-COUNTER. . . . . . . .  M266 297 319 321
       89   IX-1 . . . . . . . . . . . . .  M513
       91   IX-2 . . . . . . . . . . . . .  M513
       93   IX-3 . . . . . . . . . . . . .  M513
       95   IX-4 . . . . . . . . . . . . .  M513
       97   IX-5 . . . . . . . . . . . . .  M513
       99   IX-6 . . . . . . . . . . . . .  M513
      101   IX-7 . . . . . . . . . . . . .  M513
      104   L1-HOLD
      105   L2-HOLD
      106   L3-HOLD
      107   L4-HOLD. . . . . . . . . . . .  M508 522 527
      108   L5-HOLD. . . . . . . . . . . .  M509 534 539
      109   L6-HOLD. . . . . . . . . . . .  M510 546 551
      110   L7-HOLD. . . . . . . . . . . .  M511 558 563
       50   N1 . . . . . . . . . . . . . .  M514 522 526 534 538 546 550 558 562
       51   N2
       52   N3 . . . . . . . . . . . . . .  M514 522 526 534 538 546 550 558 562
       53   N4
       54   N5 . . . . . . . . . . . . . .  M514 534 538 546 550 558 562
       55   N6
       56   N7 . . . . . . . . . . . . . .  M514 558 562
      115   P-OR-F . . . . . . . . . . . .  M266 M267 M268 M269 276 M279
      117   PAR-NAME . . . . . . . . . . .  M281 M388 M402 M417 M431 M445 M460 M474 M489 M505 M521 M533 M545 M557
      119   PARDOT-X . . . . . . . . . . .  M273
      168   PASS-COUNTER . . . . . . . . .  M267 299 301
       39   PRINT-FILE . . . . . . . . . .  35 255 261
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    16
0 Defined   Cross-reference of data names   References

0      40   PRINT-REC. . . . . . . . . . .  M275 M351 M353
      122   RE-MARK. . . . . . . . . . . .  M270 M282 M393 M407 M422 M436 M450 M465 M480 M494 M528 M540 M552 M564
      164   REC-CT . . . . . . . . . . . .  272 274 281 M512 M531 M543 M555
      163   REC-SKL-SUB
      172   RECORD-COUNT . . . . . . . . .  M326 327 M335
       66   SEC-GRP. . . . . . . . . . . .  M379
       64   SEC-NAME . . . . . . . . . . .  382
       43   SUB-1. . . . . . . . . . . . .  M369 370 376
       44   SUB-2. . . . . . . . . . . . .  M371 371 377
       45   SUB-3. . . . . . . . . . . . .  M372 372 378
      123   TEST-COMPUTED. . . . . . . . .  351
      138   TEST-CORRECT . . . . . . . . .  353
      191   TEST-ID. . . . . . . . . . . .  M256
      111   TEST-RESULTS . . . . . . . . .  M257 275
      169   TOTAL-ERROR
      240   XXCOMPUTED . . . . . . . . . .  M360
      242   XXCORRECT. . . . . . . . . . .  M360
      235   XXINFO . . . . . . . . . . . .  347 362
       80   3-DIMENSION-TBL
       88   7-DIMENSION-TBL. . . . . . . .  M507
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    17
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

      356   BAIL-OUT . . . . . . . . . . .  P278
      364   BAIL-OUT-EX. . . . . . . . . .  E278 G358
      359   BAIL-OUT-WRITE . . . . . . . .  G357
      340   BLANK-LINE-PRINT
      569   CCVS-EXIT
      570   CCVS-999999. . . . . . . . . .  G519
      253   CCVS1
      365   CCVS1-EXIT . . . . . . . . . .  G259
      386   CHECK-ENTRIES. . . . . . . . .  G373
      260   CLOSE-FILES. . . . . . . . . .  G571
      288   COLUMN-NAMES-ROUTINE . . . . .  E258
      269   DE-LETE. . . . . . . . . . . .  P517
      292   END-ROUTINE. . . . . . . . . .  P261
      296   END-ROUTINE-1
      305   END-ROUTINE-12
      313   END-ROUTINE-13 . . . . . . . .  E261
      294   END-RTN-EXIT
      501   END-3LEVEL-SUBSCRPT-TEST . . .  G496 G499
      268   FAIL . . . . . . . . . . . . .  P394 P408 P423 P437 P451 P466 P481 P495 P529 P541 P553 P565
      342   FAIL-ROUTINE . . . . . . . . .  P277
      355   FAIL-ROUTINE-EX. . . . . . . .  E277 G349
      350   FAIL-ROUTINE-WRITE . . . . . .  G343 G344
      283   HEAD-ROUTINE . . . . . . . . .  P258
      266   INSPT
      254   OPEN-FILES
      375   PARA-1 . . . . . . . . . . . .  P369
      267   PASS . . . . . . . . . . . . .  P397 P411 P426 P440 P454 P469 P484 P498 P523 P535 P547 P559
      271   PRINT-DETAIL . . . . . . . . .  P399 P413 P428 P442 P456 P471 P486 P502 P518 P524 P530 P536 P542 P548 P554 P560
                                            P566
      367   SECT-NC242A-001
      264   TERMINATE-CALL
      262   TERMINATE-CCVS
      398   TEST-1-WRITE . . . . . . . . .  G395
      401   TEST-1-2
      412   TEST-1-2-WRITE . . . . . . . .  G409
      415   TEST-2
      427   TEST-2-WRITE . . . . . . . . .  G424
      430   TEST-2-2
      441   TEST-2-2-WRITE . . . . . . . .  G438
      444   TEST-2-3
      455   TEST-2-3-WRITE . . . . . . . .  G452
      458   TEST-3
      470   TEST-3-WRITE . . . . . . . . .  G467
      473   TEST-3-2
      485   TEST-3-2-WRITE . . . . . . . .  G482
      488   TEST-3-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    18
0 Defined   Cross-reference of procedures   References

0     368   TH-16-001
      516   TH7-DELETE-1
      504   TH7-INIT
      520   TH7-TEST-1 . . . . . . . . . .  G515
      532   TH7-TEST-2
      544   TH7-TEST-3
      556   TH7-TEST-4
      325   WRITE-LINE . . . . . . . . . .  P275 P276 P284 P285 P286 P287 P289 P290 P291 P293 P295 P304 P312 P318 P323 P324
                                            P347 P351 P353 P362
      337   WRT-LN . . . . . . . . . . . .  P331 P332 P333 P336 P341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    19
0 Defined   Cross-reference of programs     References

        3   NC242A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC242A    Date 06/04/2022  Time 11:57:34   Page    20
0LineID  Message code  Message text

     39  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC242A:
 *    Source records = 571
 *    Data Division statements = 115
 *    Procedure Division statements = 268
 *    Generated COBOL statements = 0
 *    Program complexity factor = 280
0End of compilation 1,  program NC242A,  highest severity 0.
0Return code 0
