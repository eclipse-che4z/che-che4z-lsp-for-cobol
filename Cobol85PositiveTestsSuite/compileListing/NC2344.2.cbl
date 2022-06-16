1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:50   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:50   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2344.2
   000002         000200 PROGRAM-ID.                                                      NC2344.2
   000003         000300     NC234A.                                                      NC2344.2
   000004         000400                                                                  NC2344.2
   000005         000600*                                                              *  NC2344.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2344.2
   000007         000800*                                                              *  NC2344.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2344.2
   000009         001000*                                                              *  NC2344.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2344.2
   000011         001200*                                                              *  NC2344.2
   000012         001400*                                                              *  NC2344.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2344.2
   000014         001600*                                                              *  NC2344.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2344.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2344.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2344.2
   000018         002000*                                                              *  NC2344.2
   000019         002200*                                                                 NC2344.2
   000020         002300*    PROGRAM NC234A TESTS THE ACCESSING OF A "REDEFINED" THREE *  NC2344.2
   000021         002400*    -DIMENSIONAL TABLE USING FORMAT 1 OF THE "SEARCH"         *  NC2344.2
   000022         002500*    STATEMENT.  THE "VARYING" AND "AT END" PHRASES ARE USED.  *  NC2344.2
   000023         002600*                                                              *  NC2344.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2344.2
   000025         002900 CONFIGURATION SECTION.                                           NC2344.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2344.2
   000027         003100     XXXXX082.                                                    NC2344.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2344.2
   000029         003300     XXXXX083.                                                    NC2344.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2344.2
   000031         003500 FILE-CONTROL.                                                    NC2344.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2344.2 36
   000033         003700     XXXXX055.                                                    NC2344.2
   000034         003800 DATA DIVISION.                                                   NC2344.2
   000035         003900 FILE SECTION.                                                    NC2344.2
   000036         004000 FD  PRINT-FILE.                                                  NC2344.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2344.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2344.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2344.2
   000040         004400 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC2344.2 IMP
   000041         004500 77  SUB-2              PICTURE 99  VALUE ZERO.                   NC2344.2 IMP
   000042         004600 77  SUB-3              PICTURE 99  VALUE ZERO.                   NC2344.2 IMP
   000043         004700 77  CON-5              PICTURE 99  VALUE 05.                     NC2344.2
   000044         004800 77  CON-6              PICTURE 99  VALUE 06.                     NC2344.2
   000045         004900 77  CON-7              PICTURE 99  VALUE 07.                     NC2344.2
   000046         005000 77  CON-10             PICTURE 99  VALUE 10.                     NC2344.2
   000047         005100 77  GRP-HOLD-AREA      PICTURE X(5) VALUE SPACES.                NC2344.2 IMP
   000048         005200 77  SEC-HOLD-AREA      PICTURE X(11) VALUE SPACES.               NC2344.2 IMP
   000049         005300 77  ELEM-HOLD-AREA     PICTURE X(15) VALUE SPACES.               NC2344.2 IMP
   000050         005400 01  GRP-NAME.                                                    NC2344.2
   000051         005500     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2344.2
   000052         005600     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2344.2
   000053         005700                                                                  NC2344.2
   000054         005800 01  SEC-NAME.                                                    NC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2344.2
   000056         006000     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2344.2
   000057         006100     02  FILLER              PICTURE X      VALUE ",".            NC2344.2
   000058         006200     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2344.2
   000059         006300     02  FILLER              PICTURE X      VALUE ")".            NC2344.2
   000060         006400                                                                  NC2344.2
   000061         006500 01  ELEM-NAME.                                                   NC2344.2
   000062         006600     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2344.2
   000063         006700     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2344.2
   000064         006800     02  FILLER              PICTURE X      VALUE ",".            NC2344.2
   000065         006900     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2344.2
   000066         007000     02  FILLER              PICTURE X      VALUE ",".            NC2344.2
   000067         007100     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2344.2
   000068         007200     02  FILLER              PICTURE X      VALUE ")".            NC2344.2
   000069         007300                                                                  NC2344.2
   000070         007400 01  3-DIMENSION-TBL.                                             NC2344.2
   000071         007500     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2344.2
   000072         007600         03  ENTRY-1         PICTURE X(5).                        NC2344.2
   000073         007700         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2344.2
   000074         007800             04  ENTRY-2     PICTURE X(11).                       NC2344.2
   000075         007900             04  3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.        NC2344.2
   000076         008000                 05  ENTRY-3 PICTURE X(15).                       NC2344.2
   000077         008100 01  3-DEM-TBL REDEFINES 3-DIMENSION-TBL.                         NC2344.2 70
   000078         008200     02  GRP-ENTRY-1 OCCURS 10 TIMES INDEXED BY IDX-1-1.          NC2344.2
   000079         008300         03  ENTRY-1-1           PIC X(5).                        NC2344.2
   000080         008400         03  GRP2-ENTRY-1 OCCURS 10 TIMES INDEXED BY IDX-2-1.     NC2344.2
   000081         008500             04  ENTRY-2-1       PIC X(11).                       NC2344.2
   000082         008600             04  GRP3-ENTRY-1 OCCURS 10 TIMES INDEXED BY IDX-3-1. NC2344.2
   000083         008700                 05  ENTRY-3-1   PIC X(15).                       NC2344.2
   000084         008800                                                                  NC2344.2
   000085         008900 01  END-STMT.                                                    NC2344.2
   000086         009000     02  FILLER              PICTURE X(7)  VALUE "AT END ".       NC2344.2
   000087         009100     02  END-IDX             PICTURE X(7)  VALUE SPACES.          NC2344.2 IMP
   000088         009200     02  FILLER              PICTURE XXX   VALUE " = ".           NC2344.2
   000089         009300     02  IDX-VALU            PICTURE 99    VALUE 00.              NC2344.2
   000090         009400     02  FILLER              PICTURE XXX   VALUE SPACES.          NC2344.2 IMP
   000091         009500 01  NOTE-1.                                                      NC2344.2
   000092         009600     02  FILLER                   PICTURE X(74)  VALUE            NC2344.2
   000093         009700     "NOTE 1 - CORRECT AND COMPUTED DATA ARE EQUAL BUT THE AT END NC2344.2
   000094         009800-    "PATH WAS TAKEN".                                            NC2344.2
   000095         009900     02  FILLER                   PICTURE X(46)  VALUE SPACES.    NC2344.2 IMP
   000096         010000 01  NOTE-2.                                                      NC2344.2
   000097         010100     02  FILLER                   PICTURE X(112)  VALUE           NC2344.2
   000098         010200     "NOTE 2 - CORRECT AND COMPUTED DATA ARE NOT EQUAL. THE COMPUTNC2344.2
   000099         010300-    "ED ENTRY WAS EXTRACTED FROM THE TABLE BY SUBSCRIPTS.".      NC2344.2
   000100         010400     02  FILLER                   PICTURE X(8)   VALUE SPACES.    NC2344.2 IMP
   000101         010500 01  TEST-RESULTS.                                                NC2344.2
   000102         010600     02 FILLER                   PIC X      VALUE SPACE.          NC2344.2 IMP
   000103         010700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2344.2 IMP
   000104         010800     02 FILLER                   PIC X      VALUE SPACE.          NC2344.2 IMP
   000105         010900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2344.2 IMP
   000106         011000     02 FILLER                   PIC X      VALUE SPACE.          NC2344.2 IMP
   000107         011100     02  PAR-NAME.                                                NC2344.2
   000108         011200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2344.2 IMP
   000109         011300       03  PARDOT-X              PIC X      VALUE SPACE.          NC2344.2 IMP
   000110         011400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2344.2 IMP
   000111         011500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2344.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 RE-MARK                  PIC X(61).                       NC2344.2
   000113         011700 01  TEST-COMPUTED.                                               NC2344.2
   000114         011800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2344.2 IMP
   000115         011900     02 FILLER                   PIC X(17)  VALUE                 NC2344.2
   000116         012000            "       COMPUTED=".                                   NC2344.2
   000117         012100     02 COMPUTED-X.                                               NC2344.2
   000118         012200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2344.2 IMP
   000119         012300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2344.2 118
   000120         012400                                 PIC -9(9).9(9).                  NC2344.2
   000121         012500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2344.2 118
   000122         012600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2344.2 118
   000123         012700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2344.2 118
   000124         012800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2344.2 118
   000125         012900         04 COMPUTED-18V0                    PIC -9(18).          NC2344.2
   000126         013000         04 FILLER                           PIC X.               NC2344.2
   000127         013100     03 FILLER PIC X(50) VALUE SPACE.                             NC2344.2 IMP
   000128         013200 01  TEST-CORRECT.                                                NC2344.2
   000129         013300     02 FILLER PIC X(30) VALUE SPACE.                             NC2344.2 IMP
   000130         013400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2344.2
   000131         013500     02 CORRECT-X.                                                NC2344.2
   000132         013600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2344.2 IMP
   000133         013700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2344.2 132
   000134         013800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2344.2 132
   000135         013900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2344.2 132
   000136         014000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2344.2 132
   000137         014100     03      CR-18V0 REDEFINES CORRECT-A.                         NC2344.2 132
   000138         014200         04 CORRECT-18V0                     PIC -9(18).          NC2344.2
   000139         014300         04 FILLER                           PIC X.               NC2344.2
   000140         014400     03 FILLER PIC X(2) VALUE SPACE.                              NC2344.2 IMP
   000141         014500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2344.2 IMP
   000142         014600 01  CCVS-C-1.                                                    NC2344.2
   000143         014700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2344.2
   000144         014800-    "SS  PARAGRAPH-NAME                                          NC2344.2
   000145         014900-    "       REMARKS".                                            NC2344.2
   000146         015000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2344.2 IMP
   000147         015100 01  CCVS-C-2.                                                    NC2344.2
   000148         015200     02 FILLER                     PIC X        VALUE SPACE.      NC2344.2 IMP
   000149         015300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2344.2
   000150         015400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2344.2 IMP
   000151         015500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2344.2
   000152         015600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2344.2 IMP
   000153         015700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2344.2 IMP
   000154         015800 01  REC-CT                        PIC 99       VALUE ZERO.       NC2344.2 IMP
   000155         015900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2344.2 IMP
   000156         016000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2344.2 IMP
   000157         016100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2344.2 IMP
   000158         016200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2344.2 IMP
   000159         016300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2344.2 IMP
   000160         016400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2344.2 IMP
   000161         016500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2344.2 IMP
   000162         016600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2344.2 IMP
   000163         016700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2344.2 IMP
   000164         016800 01  CCVS-H-1.                                                    NC2344.2
   000165         016900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2344.2 IMP
   000166         017000     02  FILLER                    PIC X(42)    VALUE             NC2344.2
   000167         017100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2344.2
   000168         017200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2344.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  CCVS-H-2A.                                                   NC2344.2
   000170         017400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2344.2 IMP
   000171         017500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2344.2
   000172         017600   02  FILLER                        PIC XXXX   VALUE             NC2344.2
   000173         017700     "4.2 ".                                                      NC2344.2
   000174         017800   02  FILLER                        PIC X(28)  VALUE             NC2344.2
   000175         017900            " COPY - NOT FOR DISTRIBUTION".                       NC2344.2
   000176         018000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2344.2 IMP
   000177         018100                                                                  NC2344.2
   000178         018200 01  CCVS-H-2B.                                                   NC2344.2
   000179         018300   02  FILLER                        PIC X(15)  VALUE             NC2344.2
   000180         018400            "TEST RESULT OF ".                                    NC2344.2
   000181         018500   02  TEST-ID                       PIC X(9).                    NC2344.2
   000182         018600   02  FILLER                        PIC X(4)   VALUE             NC2344.2
   000183         018700            " IN ".                                               NC2344.2
   000184         018800   02  FILLER                        PIC X(12)  VALUE             NC2344.2
   000185         018900     " HIGH       ".                                              NC2344.2
   000186         019000   02  FILLER                        PIC X(22)  VALUE             NC2344.2
   000187         019100            " LEVEL VALIDATION FOR ".                             NC2344.2
   000188         019200   02  FILLER                        PIC X(58)  VALUE             NC2344.2
   000189         019300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2344.2
   000190         019400 01  CCVS-H-3.                                                    NC2344.2
   000191         019500     02  FILLER                      PIC X(34)  VALUE             NC2344.2
   000192         019600            " FOR OFFICIAL USE ONLY    ".                         NC2344.2
   000193         019700     02  FILLER                      PIC X(58)  VALUE             NC2344.2
   000194         019800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2344.2
   000195         019900     02  FILLER                      PIC X(28)  VALUE             NC2344.2
   000196         020000            "  COPYRIGHT   1985 ".                                NC2344.2
   000197         020100 01  CCVS-E-1.                                                    NC2344.2
   000198         020200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2344.2 IMP
   000199         020300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2344.2
   000200         020400     02 ID-AGAIN                     PIC X(9).                    NC2344.2
   000201         020500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2344.2 IMP
   000202         020600 01  CCVS-E-2.                                                    NC2344.2
   000203         020700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2344.2 IMP
   000204         020800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2344.2 IMP
   000205         020900     02 CCVS-E-2-2.                                               NC2344.2
   000206         021000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2344.2 IMP
   000207         021100         03 FILLER                   PIC X      VALUE SPACE.      NC2344.2 IMP
   000208         021200         03 ENDER-DESC               PIC X(44)  VALUE             NC2344.2
   000209         021300            "ERRORS ENCOUNTERED".                                 NC2344.2
   000210         021400 01  CCVS-E-3.                                                    NC2344.2
   000211         021500     02  FILLER                      PIC X(22)  VALUE             NC2344.2
   000212         021600            " FOR OFFICIAL USE ONLY".                             NC2344.2
   000213         021700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2344.2 IMP
   000214         021800     02  FILLER                      PIC X(58)  VALUE             NC2344.2
   000215         021900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2344.2
   000216         022000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2344.2 IMP
   000217         022100     02 FILLER                       PIC X(15)  VALUE             NC2344.2
   000218         022200             " COPYRIGHT 1985".                                   NC2344.2
   000219         022300 01  CCVS-E-4.                                                    NC2344.2
   000220         022400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2344.2 IMP
   000221         022500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2344.2
   000222         022600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2344.2 IMP
   000223         022700     02 FILLER                       PIC X(40)  VALUE             NC2344.2
   000224         022800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2344.2
   000225         022900 01  XXINFO.                                                      NC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02 FILLER                       PIC X(19)  VALUE             NC2344.2
   000227         023100            "*** INFORMATION ***".                                NC2344.2
   000228         023200     02 INFO-TEXT.                                                NC2344.2
   000229         023300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2344.2 IMP
   000230         023400       04 XXCOMPUTED                 PIC X(20).                   NC2344.2
   000231         023500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2344.2 IMP
   000232         023600       04 XXCORRECT                  PIC X(20).                   NC2344.2
   000233         023700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2344.2
   000234         023800 01  HYPHEN-LINE.                                                 NC2344.2
   000235         023900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2344.2 IMP
   000236         024000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2344.2
   000237         024100-    "*****************************************".                 NC2344.2
   000238         024200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2344.2
   000239         024300-    "******************************".                            NC2344.2
   000240         024400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2344.2
   000241         024500     "NC234A".                                                    NC2344.2
   000242         024600 PROCEDURE DIVISION.                                              NC2344.2
   000243         024700 CCVS1 SECTION.                                                   NC2344.2
   000244         024800 OPEN-FILES.                                                      NC2344.2
   000245         024900     OPEN     OUTPUT PRINT-FILE.                                  NC2344.2 36
   000246         025000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2344.2 240 181 240 200
   000247         025100     MOVE    SPACE TO TEST-RESULTS.                               NC2344.2 IMP 101
   000248         025200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2344.2 273 278
   000249         025300     GO TO CCVS1-EXIT.                                            NC2344.2 356
   000250         025400 CLOSE-FILES.                                                     NC2344.2
   000251         025500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2344.2 282 303 36
   000252         025600 TERMINATE-CCVS.                                                  NC2344.2
   000253         025700     EXIT PROGRAM.                                                NC2344.2
   000254         025800 TERMINATE-CALL.                                                  NC2344.2
   000255         025900     STOP     RUN.                                                NC2344.2
   000256         026000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2344.2 105 157
   000257         026100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2344.2 105 158
   000258         026200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2344.2 105 156
   000259         026300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2344.2 105 155
   000260         026400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2344.2 112
   000261         026500 PRINT-DETAIL.                                                    NC2344.2
   000262         026600     IF REC-CT NOT EQUAL TO ZERO                                  NC2344.2 154 IMP
   000263      1  026700             MOVE "." TO PARDOT-X                                 NC2344.2 109
   000264      1  026800             MOVE REC-CT TO DOTVALUE.                             NC2344.2 154 110
   000265         026900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2344.2 101 37 315
   000266         027000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2344.2 105 315
   000267      1  027100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2344.2 332 346
   000268      1  027200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2344.2 347 355
   000269         027300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2344.2 IMP 105 IMP 117
   000270         027400     MOVE SPACE TO CORRECT-X.                                     NC2344.2 IMP 131
   000271         027500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2344.2 154 IMP IMP 107
   000272         027600     MOVE     SPACE TO RE-MARK.                                   NC2344.2 IMP 112
   000273         027700 HEAD-ROUTINE.                                                    NC2344.2
   000274         027800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2344.2 164 38 315
   000275         027900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2344.2 169 38 315
   000276         028000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2344.2 178 38 315
   000277         028100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2344.2 190 38 315
   000278         028200 COLUMN-NAMES-ROUTINE.                                            NC2344.2
   000279         028300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2344.2 142 38 315
   000280         028400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2344.2 147 38 315
   000281         028500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2344.2 234 38 315
   000282         028600 END-ROUTINE.                                                     NC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2344.2 234 38 315
   000284         028800 END-RTN-EXIT.                                                    NC2344.2
   000285         028900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2344.2 197 38 315
   000286         029000 END-ROUTINE-1.                                                   NC2344.2
   000287         029100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2344.2 156 160 157
   000288         029200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2344.2 160 155 160
   000289         029300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2344.2 158 160
   000290         029400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2344.2
   000291         029500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2344.2 158 220
   000292         029600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2344.2 160 222
   000293         029700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2344.2 219 205
   000294         029800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2344.2 202 38 315
   000295         029900  END-ROUTINE-12.                                                 NC2344.2
   000296         030000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2344.2 208
   000297         030100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2344.2 156 IMP
   000298      1  030200         MOVE "NO " TO ERROR-TOTAL                                NC2344.2 206
   000299         030300         ELSE                                                     NC2344.2
   000300      1  030400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2344.2 156 206
   000301         030500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2344.2 202 38
   000302         030600     PERFORM WRITE-LINE.                                          NC2344.2 315
   000303         030700 END-ROUTINE-13.                                                  NC2344.2
   000304         030800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2344.2 155 IMP
   000305      1  030900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2344.2 206
   000306      1  031000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2344.2 155 206
   000307         031100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2344.2 208
   000308         031200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2344.2 202 38 315
   000309         031300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2344.2 157 IMP
   000310      1  031400          MOVE "NO " TO ERROR-TOTAL                               NC2344.2 206
   000311      1  031500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2344.2 157 206
   000312         031600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2344.2 208
   000313         031700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2344.2 202 38 315
   000314         031800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2344.2 210 38 315
   000315         031900 WRITE-LINE.                                                      NC2344.2
   000316         032000     ADD 1 TO RECORD-COUNT.                                       NC2344.2 162
   000317         032100     IF RECORD-COUNT GREATER 50                                   NC2344.2 162
   000318      1  032200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2344.2 38 161
   000319      1  032300         MOVE SPACE TO DUMMY-RECORD                               NC2344.2 IMP 38
   000320      1  032400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2344.2 38
   000321      1  032500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2344.2 142 38 327
   000322      1  032600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2344.2 147 38 327
   000323      1  032700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2344.2 234 38 327
   000324      1  032800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2344.2 161 38
   000325      1  032900         MOVE ZERO TO RECORD-COUNT.                               NC2344.2 IMP 162
   000326         033000     PERFORM WRT-LN.                                              NC2344.2 327
   000327         033100 WRT-LN.                                                          NC2344.2
   000328         033200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2344.2 38
   000329         033300     MOVE SPACE TO DUMMY-RECORD.                                  NC2344.2 IMP 38
   000330         033400 BLANK-LINE-PRINT.                                                NC2344.2
   000331         033500     PERFORM WRT-LN.                                              NC2344.2 327
   000332         033600 FAIL-ROUTINE.                                                    NC2344.2
   000333         033700     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC2344.2 117 IMP
   000334      1  033800            GO TO    FAIL-ROUTINE-WRITE.                          NC2344.2 341
   000335         033900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2344.2 131 IMP 341
   000336         034000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2344.2 163 233
   000337         034100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2344.2 228
   000338         034200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2344.2 225 38 315
   000339         034300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2344.2 IMP 233
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     GO TO  FAIL-ROUTINE-EX.                                      NC2344.2 346
   000341         034500 FAIL-ROUTINE-WRITE.                                              NC2344.2
   000342         034600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2344.2 113 37 315
   000343         034700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2344.2 163 141
   000344         034800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2344.2 128 37 315
   000345         034900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2344.2 IMP 141
   000346         035000 FAIL-ROUTINE-EX. EXIT.                                           NC2344.2
   000347         035100 BAIL-OUT.                                                        NC2344.2
   000348         035200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2344.2 118 IMP 350
   000349         035300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2344.2 132 IMP 355
   000350         035400 BAIL-OUT-WRITE.                                                  NC2344.2
   000351         035500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2344.2 132 232 118 230
   000352         035600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2344.2 163 233
   000353         035700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2344.2 225 38 315
   000354         035800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2344.2 IMP 233
   000355         035900 BAIL-OUT-EX. EXIT.                                               NC2344.2
   000356         036000 CCVS1-EXIT.                                                      NC2344.2
   000357         036100     EXIT.                                                        NC2344.2
   000358         036200 SECT-NC234A-001 SECTION.                                         NC2344.2
   000359         036300 TH-07-001.                                                       NC2344.2
   000360         036400 INITIALISE-TABLE.                                                NC2344.2

 ==000360==> IGYPS2015-I The paragraph or section prior to paragraph or section "INITIALISE-TABLE"
                         did not contain any statements.

   000361         036500     PERFORM BUILD-TABLE VARYING SUB-1 FROM 1 BY 1                NC2344.2 367 40
   000362         036600         UNTIL SUB-1 EQUAL TO 11                                  NC2344.2 40
   000363         036700         AFTER SUB-2 FROM 1 BY 1 UNTIL SUB-2 EQUAL TO 11          NC2344.2 41 41
   000364         036800         AFTER SUB-3 FROM 1 BY 1 UNTIL SUB-3 EQUAL TO 11          NC2344.2 42 42
   000365         036900     GO TO CHECK-ENTRIES.                                         NC2344.2 378
   000366         037000                                                                  NC2344.2
   000367         037100 BUILD-TABLE.                                                     NC2344.2
   000368         037200     SET IDX-1 TO SUB-1.                                          NC2344.2 71 40
   000369         037300     SET IDX-2 TO SUB-2.                                          NC2344.2 73 41
   000370         037400     SET IDX-3 TO SUB-3.                                          NC2344.2 75 42
   000371         037500     SET ADD-GRP, SEC-GRP, ELEM-GRP TO IDX-1.                     NC2344.2 52 56 63 71
   000372         037600     MOVE GRP-NAME TO ENTRY-1 (IDX-1).                            NC2344.2 50 72 71
   000373         037700     SET ADD-SEC, ELEM-SEC TO IDX-2.                              NC2344.2 58 65 73
   000374         037800     MOVE SEC-NAME TO ENTRY-2 (IDX-1, IDX-2).                     NC2344.2 54 74 71 73
   000375         037900     SET ADD-ELEM TO IDX-3.                                       NC2344.2 67 75
   000376         038000     MOVE ELEM-NAME TO ENTRY-3 (IDX-1, IDX-2, IDX-3).             NC2344.2 61 76 71 73 75
   000377         038100*                                                                 NC2344.2
   000378         038200 CHECK-ENTRIES.                                                   NC2344.2
   000379         038300     MOVE "SEARCH VARYING LEV 1" TO FEATURE.                      NC2344.2 103
   000380         038400     MOVE "CHECK-ENTRIES" TO PAR-NAME.                            NC2344.2 107
   000381         038500     MOVE "GRP02" TO GRP-HOLD-AREA.                               NC2344.2 47
   000382         038600     MOVE 02 TO SUB-2.                                            NC2344.2 41
   000383         038700     SET IDX-1 TO 1.                                              NC2344.2 71
   000384         038800     SEARCH GRP-ENTRY VARYING IDX-1                               NC2344.2 71 71
   000385         038900         AT END                                                   NC2344.2
   000386      1  039000                GO TO CHECK-FAIL                                  NC2344.2 393
   000387         039100         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA                     NC2344.2 72 71 47
   000388      1  039200                PERFORM PASS                                      NC2344.2 257
   000389      1  039300                GO TO CHECK-WRITE.                                NC2344.2 403
   000390         039400 CHECK-DELETE.                                                    NC2344.2
   000391         039500     PERFORM DE-LETE.                                             NC2344.2 259
   000392         039600     GO TO CHECK-WRITE.                                           NC2344.2 403
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039700 CHECK-FAIL.                                                      NC2344.2
   000394         039800     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2344.2 47 132
   000395         039900     IF ENTRY-1 (SUB-2) EQUAL TO GRP-HOLD-AREA                    NC2344.2 72 41 47
   000396      1  040000         MOVE "IDX-1" TO END-IDX                                  NC2344.2 87
   000397      1  040100         SET IDX-VALU TO IDX-1                                    NC2344.2 89 71
   000398      1  040200         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000399      1  040300         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000400      1  040400     MOVE ENTRY-1 (SUB-2) TO COMPUTED-A                           NC2344.2 72 41 118
   000401      1  040500     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000402         040600     PERFORM FAIL.                                                NC2344.2 258
   000403         040700 CHECK-WRITE.                                                     NC2344.2
   000404         040800     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000405         040900*                                                                 NC2344.2
   000406         041000 TH1-INIT-F1-2.                                                   NC2344.2
   000407         041100     MOVE "TH1-TEST-F1-2" TO PAR-NAME.                            NC2344.2 107
   000408         041200     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000409         041300     MOVE "SEARCH VARYING LEV 1" TO FEATURE.                      NC2344.2 103
   000410         041400     MOVE "GRP01" TO GRP-HOLD-AREA.                               NC2344.2 47
   000411         041500     MOVE 01 TO SUB-2.                                            NC2344.2 41
   000412         041600     SET IDX-1-1 TO 1.                                            NC2344.2 78
   000413         041700 TH1-TEST-F1-2.                                                   NC2344.2
   000414         041800     SEARCH GRP-ENTRY-1 VARYING IDX-1                             NC2344.2 78 71
   000415      1  041900         AT END GO TO TH1-FAIL-F1-2                               NC2344.2 422
   000416      1  042000         WHEN ENTRY-1-1 (IDX-1-1) = GRP-HOLD-AREA NEXT SENTENCE.  NC2344.2 79 78 47
   000417         042100     PERFORM PASS                                                 NC2344.2 257
   000418         042200     GO TO TH1-WRITE-F1-2.                                        NC2344.2 424
   000419         042300 TH1-DELETE-F1-2.                                                 NC2344.2
   000420         042400     PERFORM DE-LETE.                                             NC2344.2 259
   000421         042500     GO TO TH1-WRITE-F1-2.                                        NC2344.2 424
   000422         042600 TH1-FAIL-F1-2.                                                   NC2344.2
   000423         042700     PERFORM CHECK-FAIL.                                          NC2344.2 393
   000424         042800 TH1-WRITE-F1-2.                                                  NC2344.2
   000425         042900     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000426         043000*                                                                 NC2344.2
   000427         043100 TH1-INIT-F1-3.                                                   NC2344.2
   000428         043200     MOVE "TH1-TEST-F1-3" TO PAR-NAME.                            NC2344.2 107
   000429         043300     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000430         043400     MOVE "SEARCH VARYING LEV 1" TO FEATURE.                      NC2344.2 103
   000431         043500     MOVE "GRP10" TO GRP-HOLD-AREA.                               NC2344.2 47
   000432         043600     MOVE 10 TO SUB-2.                                            NC2344.2 41
   000433         043700     SET IDX-1-1 TO 1.                                            NC2344.2 78
   000434         043800 TH1-TEST-F1-3.                                                   NC2344.2
   000435         043900     SEARCH GRP-ENTRY-1 VARYING IDX-1-1                           NC2344.2 78 78
   000436      1  044000         AT END GO TO TH1-FAIL-F1-3                               NC2344.2 444
   000437      1  044100         WHEN ENTRY-1-1 (IDX-1-1) = GRP-HOLD-AREA NEXT SENTENCE.  NC2344.2 79 78 47
   000438         044200     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2344.2 103
   000439         044300     PERFORM PASS                                                 NC2344.2 257
   000440         044400     GO TO TH1-WRITE-F1-3.                                        NC2344.2 446
   000441         044500 TH1-DELETE-F1-3.                                                 NC2344.2
   000442         044600     PERFORM DE-LETE.                                             NC2344.2 259
   000443         044700     GO TO TH1-WRITE-F1-3.                                        NC2344.2 446
   000444         044800 TH1-FAIL-F1-3.                                                   NC2344.2
   000445         044900     PERFORM CHECK-FAIL.                                          NC2344.2 393
   000446         045000 TH1-WRITE-F1-3.                                                  NC2344.2
   000447         045100     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000448         045200*                                                                 NC2344.2
   000449         045300 TH1-INIT-F1-4.                                                   NC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045400     MOVE "TH1-TEST-F1-4" TO PAR-NAME.                            NC2344.2 107
   000451         045500     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000452         045600     MOVE "SEARCH VARYING LEV 1" TO FEATURE.                      NC2344.2 103
   000453         045700     MOVE "GRP05" TO GRP-HOLD-AREA.                               NC2344.2 47
   000454         045800     MOVE 05 TO SUB-2.                                            NC2344.2 41
   000455         045900     SET IDX-1-1 TO 05.                                           NC2344.2 78
   000456         046000 TH1-TEST-F1-4.                                                   NC2344.2
   000457         046100     SEARCH GRP-ENTRY-1 VARYING IDX-1-1                           NC2344.2 78 78
   000458         046200         WHEN ENTRY-1-1 (IDX-1-1) = GRP-HOLD-AREA                 NC2344.2 79 78 47
   000459      1  046300             PERFORM PASS                                         NC2344.2 257
   000460      1  046400             GO TO TH1-WRITE-F1-4.                                NC2344.2 467
   000461         046500     GO TO TH1-FAIL-F1-4.                                         NC2344.2 465
   000462         046600 TH1-DELETE-F1-4.                                                 NC2344.2
   000463         046700     PERFORM DE-LETE.                                             NC2344.2 259
   000464         046800     GO TO TH1-WRITE-F1-4.                                        NC2344.2 467
   000465         046900 TH1-FAIL-F1-4.                                                   NC2344.2
   000466         047000     PERFORM CHECK-FAIL.                                          NC2344.2 393
   000467         047100 TH1-WRITE-F1-4.                                                  NC2344.2
   000468         047200     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000469         047300*                                                                 NC2344.2
   000470         047400 TH2-INIT-F1-1.                                                   NC2344.2
   000471         047500     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2344.2 103
   000472         047600     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000473         047700     MOVE "TH2-TEST-F1-1" TO PAR-NAME.                            NC2344.2 107
   000474         047800     MOVE "SEC (01,01)" TO SEC-HOLD-AREA.                         NC2344.2 48
   000475         047900     MOVE  1 TO SUB-1  SUB-2.                                     NC2344.2 40 41
   000476         048000     SET IDX-1-1 IDX-2-1 TO 1.                                    NC2344.2 78 80
   000477         048100 TH2-TEST-F1-1.                                                   NC2344.2
   000478         048200     SEARCH GRP2-ENTRY-1 VARYING IDX-2-1 AT END                   NC2344.2 80 80
   000479      1  048300         GO TO TH2-FAIL-F1-1                                      NC2344.2 487
   000480         048400         WHEN ENTRY-2-1 (IDX-1-1, IDX-2-1) = SEC-HOLD-AREA        NC2344.2 81 78 80 48
   000481      1  048500             NEXT SENTENCE.                                       NC2344.2
   000482         048600     PERFORM PASS                                                 NC2344.2 257
   000483         048700     GO TO TH2-WRITE-F1-1.                                        NC2344.2 489
   000484         048800 TH2-DELETE-F1-1.                                                 NC2344.2
   000485         048900     PERFORM DE-LETE.                                             NC2344.2 259
   000486         049000     GO TO TH2-WRITE-F1-1.                                        NC2344.2 489
   000487         049100 TH2-FAIL-F1-1.                                                   NC2344.2
   000488         049200     PERFORM CHECK-FAIL2.                                         NC2344.2 564
   000489         049300 TH2-WRITE-F1-1.                                                  NC2344.2
   000490         049400     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000491         049500                                                                  NC2344.2
   000492         049600*                                                                 NC2344.2
   000493         049700 TH2-INIT-F1-2.                                                   NC2344.2
   000494         049800     MOVE "TH2-TEST-F1-2" TO PAR-NAME.                            NC2344.2 107
   000495         049900     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000496         050000     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2344.2 103
   000497         050100     MOVE "SEC (05,10)" TO SEC-HOLD-AREA.                         NC2344.2 48
   000498         050200     MOVE 05 TO SUB-1.                                            NC2344.2 40
   000499         050300     MOVE 10 TO SUB-2.                                            NC2344.2 41
   000500         050400     SET IDX-1-1 TO 5.                                            NC2344.2 78
   000501         050500     SET IDX-2-1 TO 1.                                            NC2344.2 80
   000502         050600 TH2-TEST-F1-2.                                                   NC2344.2
   000503         050700     SEARCH GRP2-ENTRY-1 VARYING IDX-2-1 AT END                   NC2344.2 80 80
   000504      1  050800         GO TO TH2-FAIL-F1-2                                      NC2344.2 512
   000505         050900         WHEN ENTRY-2-1 (IDX-1-1, IDX-2-1) = SEC-HOLD-AREA        NC2344.2 81 78 80 48
   000506      1  051000             NEXT SENTENCE.                                       NC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     PERFORM PASS                                                 NC2344.2 257
   000508         051200     GO TO TH2-WRITE-F1-2.                                        NC2344.2 514
   000509         051300 TH2-DELETE-F1-2.                                                 NC2344.2
   000510         051400     PERFORM DE-LETE.                                             NC2344.2 259
   000511         051500     GO TO TH2-WRITE-F1-2.                                        NC2344.2 514
   000512         051600 TH2-FAIL-F1-2.                                                   NC2344.2
   000513         051700     PERFORM CHECK-FAIL2.                                         NC2344.2 564
   000514         051800 TH2-WRITE-F1-2.                                                  NC2344.2
   000515         051900     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000516         052000*                                                                 NC2344.2
   000517         052100 TH2-INIT-F1-3.                                                   NC2344.2
   000518         052200     MOVE "TH2-TEST-F1-3" TO PAR-NAME.                            NC2344.2 107
   000519         052300     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000520         052400     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2344.2 103
   000521         052500     MOVE "SEC (10,10)" TO SEC-HOLD-AREA.                         NC2344.2 48
   000522         052600     SET IDX-1-1 TO 10.                                           NC2344.2 78
   000523         052700     SET IDX-2-1 TO 1.                                            NC2344.2 80
   000524         052800     MOVE 10 TO SUB-1  SUB-2.                                     NC2344.2 40 41
   000525         052900 TH2-TEST-F1-3.                                                   NC2344.2
   000526         053000     SEARCH GRP2-ENTRY-1 VARYING IDX-2-1 AT END                   NC2344.2 80 80
   000527      1  053100         GO TO TH2-FAIL-F1-3                                      NC2344.2 535
   000528         053200         WHEN ENTRY-2-1 (IDX-1-1, IDX-2-1) = SEC-HOLD-AREA        NC2344.2 81 78 80 48
   000529      1  053300             NEXT SENTENCE.                                       NC2344.2
   000530         053400     PERFORM PASS                                                 NC2344.2 257
   000531         053500     GO TO TH2-WRITE-F1-3.                                        NC2344.2 537
   000532         053600 TH2-DELETE-F1-3.                                                 NC2344.2
   000533         053700     PERFORM DE-LETE.                                             NC2344.2 259
   000534         053800     GO TO TH2-WRITE-F1-3.                                        NC2344.2 537
   000535         053900 TH2-FAIL-F1-3.                                                   NC2344.2
   000536         054000     PERFORM CHECK-FAIL2.                                         NC2344.2 564
   000537         054100 TH2-WRITE-F1-3.                                                  NC2344.2
   000538         054200     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000539         054300*                                                                 NC2344.2
   000540         054400 TH2-INIT-F1-4.                                                   NC2344.2
   000541         054500     MOVE "TH2-TEST-F1-4" TO PAR-NAME.                            NC2344.2 107
   000542         054600     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000543         054700     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2344.2 103
   000544         054800     MOVE "SEC (08,02)" TO SEC-HOLD-AREA.                         NC2344.2 48
   000545         054900     MOVE 08 TO SUB-1.                                            NC2344.2 40
   000546         055000     MOVE 02 TO SUB-2.                                            NC2344.2 41
   000547         055100     SET IDX-1-1 TO 08.                                           NC2344.2 78
   000548         055200     SET IDX-2-1 TO 01.                                           NC2344.2 80
   000549         055300 TH2-TEST-F1-4.                                                   NC2344.2
   000550         055400     SEARCH GRP2-ENTRY-1 VARYING IDX-2-1                          NC2344.2 80 80
   000551         055500         WHEN ENTRY-2-1 (IDX-1-1, IDX-2-1) = SEC-HOLD-AREA        NC2344.2 81 78 80 48
   000552      1  055600              PERFORM PASS                                        NC2344.2 257
   000553      1  055700              GO TO TH2-WRITE-F1-4.                               NC2344.2 560
   000554         055800     GO TO TH2-FAIL-F1-4.                                         NC2344.2 558
   000555         055900 TH2-DELETE-F1-4.                                                 NC2344.2
   000556         056000     PERFORM DE-LETE.                                             NC2344.2 259
   000557         056100     GO TO TH2-WRITE-F1-4.                                        NC2344.2 560
   000558         056200 TH2-FAIL-F1-4.                                                   NC2344.2
   000559         056300     PERFORM CHECK-FAIL2.                                         NC2344.2 564
   000560         056400 TH2-WRITE-F1-4.                                                  NC2344.2
   000561         056500     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000562         056600     GO TO TH3-INIT-F1-1.                                         NC2344.2 575
   000563         056700                                                                  NC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800 CHECK-FAIL2.                                                     NC2344.2
   000565         056900     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2344.2 48 132
   000566         057000     IF ENTRY-2-1 (SUB-1, SUB-2) EQUAL TO SEC-HOLD-AREA           NC2344.2 81 40 41 48
   000567      1  057100         MOVE "IDX-2" TO END-IDX                                  NC2344.2 87
   000568      1  057200         SET IDX-VALU TO IDX-2                                    NC2344.2 89 73
   000569      1  057300         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000570      1  057400         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2344.2 85 118
   000571      1  057500     MOVE ENTRY-2-1 (SUB-1, SUB-2) TO COMPUTED-A                  NC2344.2 81 40 41 118
   000572      1  057600     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000573         057700     PERFORM FAIL.                                                NC2344.2 258
   000574         057800*                                                                 NC2344.2
   000575         057900 TH3-INIT-F1-1.                                                   NC2344.2
   000576         058000     MOVE "TH3-TEST-F1-1" TO PAR-NAME.                            NC2344.2 107
   000577         058100     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000578         058200     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2344.2 103
   000579         058300     MOVE 1 TO SUB-1  SUB-2  SUB-3.                               NC2344.2 40 41 42
   000580         058400     MOVE "ELEM (01,01,01)" TO ELEM-HOLD-AREA.                    NC2344.2 49
   000581         058500     SET IDX-1-1 IDX-2-1 IDX-3-1 TO 1.                            NC2344.2 78 80 82
   000582         058600 TH3-TEST-F1-1.                                                   NC2344.2
   000583         058700     SEARCH GRP3-ENTRY-1 VARYING IDX-3                            NC2344.2 82 75
   000584         058800         WHEN ENTRY-3-1 (IDX-1-1, IDX-2-1, IDX-3-1)               NC2344.2 83 78 80 82
   000585         058900              = ELEM-HOLD-AREA                                    NC2344.2 49
   000586      1  059000              PERFORM PASS                                        NC2344.2 257
   000587      1  059100              GO TO TH3-WRITE-F1-1.                               NC2344.2 594
   000588         059200     GO TO TH3-FAIL-F1-1.                                         NC2344.2 592
   000589         059300 TH3-DELETE-F1-1.                                                 NC2344.2
   000590         059400     PERFORM DE-LETE.                                             NC2344.2 259
   000591         059500     GO TO TH3-WRITE-F1-1.                                        NC2344.2 594
   000592         059600 TH3-FAIL-F1-1.                                                   NC2344.2
   000593         059700     PERFORM CHECK-FAIL3.                                         NC2344.2 676
   000594         059800 TH3-WRITE-F1-1.                                                  NC2344.2
   000595         059900     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000596         060000*                                                                 NC2344.2
   000597         060100 TH3-INIT-F1-2.                                                   NC2344.2
   000598         060200     MOVE "TH3-TEST-F1-2" TO PAR-NAME.                            NC2344.2 107
   000599         060300     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000600         060400     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2344.2 103
   000601         060500     MOVE 05 TO SUB-1.                                            NC2344.2 40
   000602         060600     MOVE 06 TO SUB-2.                                            NC2344.2 41
   000603         060700     MOVE 07 TO SUB-3.                                            NC2344.2 42
   000604         060800     SET IDX-1-1 TO 05.                                           NC2344.2 78
   000605         060900     SET IDX-2-1 TO 06.                                           NC2344.2 80
   000606         061000     SET IDX-3-1 TO 1.                                            NC2344.2 82
   000607         061100     MOVE "ELEM (05,06,07)" TO ELEM-HOLD-AREA.                    NC2344.2 49
   000608         061200 TH3-TEST-F1-2.                                                   NC2344.2
   000609         061300     SEARCH GRP3-ENTRY-1 VARYING IDX-3-1 AT END                   NC2344.2 82 82
   000610      1  061400         GO TO TH3-FAIL-F1-2                                      NC2344.2 619
   000611         061500         WHEN ENTRY-3-1 (IDX-1-1, IDX-2-1, IDX-3-1)               NC2344.2 83 78 80 82
   000612         061600             = ELEM-HOLD-AREA                                     NC2344.2 49
   000613      1  061700             NEXT SENTENCE.                                       NC2344.2
   000614         061800     PERFORM PASS                                                 NC2344.2 257
   000615         061900     GO TO TH3-WRITE-F1-2.                                        NC2344.2 621
   000616         062000 TH3-DELETE-F1-2.                                                 NC2344.2
   000617         062100     PERFORM DE-LETE.                                             NC2344.2 259
   000618         062200     GO TO TH3-WRITE-F1-2.                                        NC2344.2 621
   000619         062300 TH3-FAIL-F1-2.                                                   NC2344.2
   000620         062400     PERFORM CHECK-FAIL3.                                         NC2344.2 676
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621         062500 TH3-WRITE-F1-2.                                                  NC2344.2
   000622         062600     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000623         062700*                                                                 NC2344.2
   000624         062800 TH3-INIT-F1-3.                                                   NC2344.2
   000625         062900     MOVE "TH3-TEST-F1-3" TO PAR-NAME.                            NC2344.2 107
   000626         063000     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000627         063100     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2344.2 103
   000628         063200     MOVE 10 TO SUB-1 SUB-2 SUB-3.                                NC2344.2 40 41 42
   000629         063300     SET IDX-1-1 IDX-2-1 TO 10.                                   NC2344.2 78 80
   000630         063400     SET IDX-3-1 TO 1.                                            NC2344.2 82
   000631         063500     MOVE "ELEM (10,10,10)" TO ELEM-HOLD-AREA.                    NC2344.2 49
   000632         063600 TH3-TEST-F1-3.                                                   NC2344.2
   000633         063700     SEARCH GRP3-ENTRY-1 VARYING IDX-3-1 AT END                   NC2344.2 82 82
   000634      1  063800         GO TO TH3-FAIL-F1-3                                      NC2344.2 643
   000635         063900         WHEN ENTRY-3-1 (IDX-1-1, IDX-2-1, IDX-3-1)               NC2344.2 83 78 80 82
   000636         064000             = ELEM-HOLD-AREA                                     NC2344.2 49
   000637      1  064100             NEXT SENTENCE.                                       NC2344.2
   000638         064200     PERFORM PASS                                                 NC2344.2 257
   000639         064300     GO TO TH3-WRITE-F1-3.                                        NC2344.2 645
   000640         064400 TH3-DELETE-F1-3.                                                 NC2344.2
   000641         064500     PERFORM DE-LETE.                                             NC2344.2 259
   000642         064600     GO TO TH3-WRITE-F1-3.                                        NC2344.2 645
   000643         064700 TH3-FAIL-F1-3.                                                   NC2344.2
   000644         064800     PERFORM CHECK-FAIL3.                                         NC2344.2 676
   000645         064900 TH3-WRITE-F1-3.                                                  NC2344.2
   000646         065000     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000647         065100*                                                                 NC2344.2
   000648         065200 TH3-INIT-F1-4.                                                   NC2344.2
   000649         065300     MOVE "TH3-TEST-F1-4" TO PAR-NAME.                            NC2344.2 107
   000650         065400     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000651         065500     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2344.2 103
   000652         065600     MOVE "ELEM (07,06,05)" TO ELEM-HOLD-AREA.                    NC2344.2 49
   000653         065700     MOVE 07 TO SUB-1.                                            NC2344.2 40
   000654         065800     MOVE 06 TO SUB-2.                                            NC2344.2 41
   000655         065900     MOVE 05 TO SUB-3.                                            NC2344.2 42
   000656         066000     SET IDX-1-1 TO 07.                                           NC2344.2 78
   000657         066100     SET IDX-2-1 TO 06.                                           NC2344.2 80
   000658         066200     SET IDX-3-1 TO 03.                                           NC2344.2 82
   000659         066300 TH3-TEST-F1-4.                                                   NC2344.2
   000660         066400     SEARCH GRP3-ENTRY-1 VARYING IDX-3-1 AT END                   NC2344.2 82 82
   000661      1  066500         GO TO TH3-FAIL-F1-4                                      NC2344.2 670
   000662         066600         WHEN ENTRY-3-1 (IDX-1-1, IDX-2-1, IDX-3-1)               NC2344.2 83 78 80 82
   000663         066700         = ELEM-HOLD-AREA                                         NC2344.2 49
   000664      1  066800         NEXT SENTENCE.                                           NC2344.2
   000665         066900     PERFORM PASS                                                 NC2344.2 257
   000666         067000     GO TO TH3-WRITE-F1-4.                                        NC2344.2 672
   000667         067100 TH3-DELETE-F1-4.                                                 NC2344.2
   000668         067200     PERFORM DE-LETE.                                             NC2344.2 259
   000669         067300     GO TO TH3-WRITE-F1-4.                                        NC2344.2 672
   000670         067400 TH3-FAIL-F1-4.                                                   NC2344.2
   000671         067500     PERFORM CHECK-FAIL3.                                         NC2344.2 676
   000672         067600 TH3-WRITE-F1-4.                                                  NC2344.2
   000673         067700     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000674         067800     GO TO MLT-INIT-F1-1.                                         NC2344.2 687
   000675         067900*                                                                 NC2344.2
   000676         068000 CHECK-FAIL3.                                                     NC2344.2
   000677         068100     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2344.2 49 132
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000678         068200     IF ENTRY-3-1 (SUB-1, SUB-2, SUB-3) EQUAL TO ELEM-HOLD-AREA   NC2344.2 83 40 41 42 49
   000679      1  068300         MOVE "IDX-3-1" TO END-IDX                                NC2344.2 87
   000680      1  068400         SET IDX-VALU TO IDX-3-1                                  NC2344.2 89 82
   000681      1  068500         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000682      1  068600         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000683      1  068700     MOVE ENTRY-3-1 (SUB-1, SUB-2, SUB-3) TO COMPUTED-A           NC2344.2 83 40 41 42 118
   000684      1  068800     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000685         068900     PERFORM FAIL.                                                NC2344.2 258
   000686         069000*                                                                 NC2344.2
   000687         069100 MLT-INIT-F1-1.                                                   NC2344.2
   000688         069200     MOVE "MLT-TEST-F1-1  " TO PAR-NAME.                          NC2344.2 107
   000689         069300     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000690         069400     MOVE "MULTIPLE SEARCH STMT" TO FEATURE.                      NC2344.2 103
   000691         069500     MOVE "GRP08" TO GRP-HOLD-AREA.                               NC2344.2 47
   000692         069600     MOVE "SEC (08,07)" TO SEC-HOLD-AREA.                         NC2344.2 48
   000693         069700     SET IDX-1-1 IDX-2-1 TO 1.                                    NC2344.2 78 80
   000694         069800 MLT-TEST-F1-1.                                                   NC2344.2
   000695         069900     SEARCH GRP-ENTRY-1 VARYING IDX-1-1                           NC2344.2 78 78
   000696      1  070000            AT END GO TO MLT-FAIL-F1-1-A                          NC2344.2 708
   000697      1  070100            WHEN ENTRY-1-1 (IDX-1-1) = "GRP08" NEXT SENTENCE.     NC2344.2 79 78
   000698         070200     SEARCH GRP2-ENTRY-1 VARYING IDX-2-1                          NC2344.2 80 80
   000699      1  070300            AT END GO TO MLT-FAIL-F1-1-B                          NC2344.2 720
   000700         070400            WHEN ENTRY-2-1 (IDX-1-1, IDX-2-1) = SEC-HOLD-AREA     NC2344.2 81 78 80 48
   000701      1  070500                 NEXT SENTENCE.                                   NC2344.2
   000702         070600     PERFORM PASS                                                 NC2344.2 257
   000703         070700     GO TO MLT-WRITE-F1-1.                                        NC2344.2 730
   000704         070800 MLT-DELETE-F1-1.                                                 NC2344.2
   000705         070900     PERFORM DE-LETE.                                             NC2344.2 259
   000706         071000     GO TO MLT-WRITE-F1-1.                                        NC2344.2 730
   000707         071100*                                                                 NC2344.2
   000708         071200 MLT-FAIL-F1-1-A.                                                 NC2344.2
   000709         071300     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2344.2 47 132
   000710         071400     IF ENTRY-1-1 (08) EQUAL TO GRP-HOLD-AREA                     NC2344.2 79 47
   000711      1  071500         MOVE "IDX-1-1" TO END-IDX                                NC2344.2 87
   000712      1  071600         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000713      1  071700         SET IDX-VALU TO IDX-1-1                                  NC2344.2 89 78
   000714      1  071800         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000715      1  071900     MOVE ENTRY-1-1 (08) TO COMPUTED-A                            NC2344.2 79 118
   000716      1  072000     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000717         072100     PERFORM FAIL                                                 NC2344.2 258
   000718         072200     GO TO MLT-WRITE-F1-1.                                        NC2344.2 730
   000719         072300*                                                                 NC2344.2
   000720         072400 MLT-FAIL-F1-1-B.                                                 NC2344.2
   000721         072500     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2344.2 48 132
   000722         072600     IF ENTRY-2-1 (08, 07) EQUAL TO SEC-HOLD-AREA                 NC2344.2 81 48
   000723      1  072700         MOVE "IDX-2-1" TO END-IDX                                NC2344.2 87
   000724      1  072800         SET IDX-VALU TO IDX-2-1                                  NC2344.2 89 80
   000725      1  072900         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000726      1  073000         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000727      1  073100     MOVE ENTRY-2-1 (08, 07) TO COMPUTED-A                        NC2344.2 81 118
   000728      1  073200     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000729         073300     PERFORM FAIL.                                                NC2344.2 258
   000730         073400 MLT-WRITE-F1-1.                                                  NC2344.2
   000731         073500     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000732         073600*                                                                 NC2344.2
   000733         073700 MLT-INIT-F1-2.                                                   NC2344.2
   000734         073800     MOVE "MLT-TEST-F1-2  " TO PAR-NAME.                          NC2344.2 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000735         073900     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000736         074000     MOVE "MULTIPLE SEARCH STMT" TO FEATURE.                      NC2344.2 103
   000737         074100     MOVE "GRP04" TO GRP-HOLD-AREA.                               NC2344.2 47
   000738         074200     MOVE "SEC (04,04)" TO SEC-HOLD-AREA.                         NC2344.2 48
   000739         074300     MOVE "ELEM (04,04,04)" TO ELEM-HOLD-AREA.                    NC2344.2 49
   000740         074400     SET IDX-1-1 IDX-2-1 IDX-3-1 TO 1.                            NC2344.2 78 80 82
   000741         074500 MLT-TEST-F1-2.                                                   NC2344.2
   000742         074600     SEARCH GRP-ENTRY-1  VARYING IDX-1-1 AT END                   NC2344.2 78 78
   000743      1  074700         GO TO MLT-FAIL-F1-2-A WHEN ENTRY-1-1 (IDX-1-1) =         NC2344.2 757 79 78
   000744      1  074800         GRP-HOLD-AREA  NEXT SENTENCE.                            NC2344.2 47
   000745         074900     SEARCH GRP2-ENTRY-1 VARYING IDX-2-1 AT END                   NC2344.2 80 80
   000746      1  075000         GO TO MLT-FAIL-F1-2-B WHEN ENTRY-2-1 (IDX-1-1, IDX-2-1) =NC2344.2 769 81 78 80
   000747      1  075100         SEC-HOLD-AREA  NEXT SENTENCE.                            NC2344.2 48
   000748         075200     SEARCH GRP3-ENTRY-1 VARYING IDX-3-1 AT END                   NC2344.2 82 82
   000749      1  075300         GO TO MLT-FAIL-F1-2-C WHEN ENTRY-3-1                     NC2344.2 781 83
   000750      1  075400             (IDX-1-1, IDX-2-1, IDX-3-1)                          NC2344.2 78 80 82
   000751      1  075500             = ELEM-HOLD-AREA NEXT SENTENCE.                      NC2344.2 49
   000752         075600     PERFORM PASS                                                 NC2344.2 257
   000753         075700     GO TO MLT-WRITE-F1-2.                                        NC2344.2 791
   000754         075800 MLT-DELETE-F1-2.                                                 NC2344.2
   000755         075900     PERFORM DE-LETE                                              NC2344.2 259
   000756         076000     GO TO MLT-WRITE-F1-2.                                        NC2344.2 791
   000757         076100 MLT-FAIL-F1-2-A.                                                 NC2344.2
   000758         076200     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2344.2 47 132
   000759         076300     IF ENTRY-1-1 (04) EQUAL TO GRP-HOLD-AREA                     NC2344.2 79 47
   000760      1  076400         MOVE "IDX-1-1" TO END-IDX                                NC2344.2 87
   000761      1  076500         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000762      1  076600         SET IDX-VALU TO IDX-1-1                                  NC2344.2 89 78
   000763      1  076700         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000764      1  076800     MOVE ENTRY-1-1 (04) TO COMPUTED-A                            NC2344.2 79 118
   000765      1  076900     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000766         077000     PERFORM FAIL.                                                NC2344.2 258
   000767         077100     GO TO MLT-WRITE-F1-2.                                        NC2344.2 791
   000768         077200                                                                  NC2344.2
   000769         077300 MLT-FAIL-F1-2-B.                                                 NC2344.2
   000770         077400     MOVE  SEC-HOLD-AREA TO CORRECT-A.                            NC2344.2 48 132
   000771         077500     IF ENTRY-2-1 (04, 04) EQUAL TO SEC-HOLD-AREA                 NC2344.2 81 48
   000772      1  077600         MOVE "IDX-2-1" TO END-IDX                                NC2344.2 87
   000773      1  077700         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000774      1  077800         SET IDX-VALU TO IDX-2-1                                  NC2344.2 89 80
   000775      1  077900         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000776      1  078000     MOVE ENTRY-2-1 (04, 04) TO COMPUTED-A                        NC2344.2 81 118
   000777      1  078100     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000778         078200     PERFORM FAIL                                                 NC2344.2 258
   000779         078300     GO TO MLT-WRITE-F1-2.                                        NC2344.2 791
   000780         078400                                                                  NC2344.2
   000781         078500 MLT-FAIL-F1-2-C.                                                 NC2344.2
   000782         078600     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2344.2 49 132
   000783         078700     IF ENTRY-3-1 (04, 04, 04) EQUAL TO ELEM-HOLD-AREA            NC2344.2 83 49
   000784      1  078800         MOVE "IDX-3-1" TO END-IDX                                NC2344.2 87
   000785      1  078900         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000786      1  079000         SET IDX-VALU TO IDX-3-1                                  NC2344.2 89 82
   000787      1  079100         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000788      1  079200     MOVE ENTRY-3-1 (04, 04, 04) TO COMPUTED-A                    NC2344.2 83 118
   000789      1  079300     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000790         079400     PERFORM FAIL.                                                NC2344.2 258
   000791         079500 MLT-WRITE-F1-2.                                                  NC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000792         079600     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000793         079700*                                                                 NC2344.2
   000794         079800 SPC-INIT-F1-1.                                                   NC2344.2
   000795         079900     MOVE "SPC-TEST-F1-1" TO PAR-NAME.                            NC2344.2 107
   000796         080000     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000797         080100     MOVE "SEARCH WITH HI INDEX" TO FEATURE.                      NC2344.2 103
   000798         080200     SET IDX-1-1 TO 4.                                            NC2344.2 78
   000799         080300 SPC-TEST-F1-1.                                                   NC2344.2
   000800         080400     SEARCH GRP-ENTRY-1 VARYING IDX-1-1                           NC2344.2 78 78
   000801      1  080500          AT END PERFORM PASS                                     NC2344.2 257
   000802      1  080600                 GO TO SPC-WRITE-F1-1                             NC2344.2 813
   000803         080700          WHEN ENTRY-1-1 (IDX-1-1) = "GRP03"                      NC2344.2 79 78
   000804      1  080800                 GO TO SPC-FAIL-F1-1.                             NC2344.2 808
   000805         080900 SPC-DELETE-F1-1.                                                 NC2344.2
   000806         081000     PERFORM DE-LETE.                                             NC2344.2 259
   000807         081100     GO TO SPC-WRITE-F1-1.                                        NC2344.2 813
   000808         081200 SPC-FAIL-F1-1.                                                   NC2344.2
   000809         081300     MOVE SPACES TO CORRECT-A.                                    NC2344.2 IMP 132
   000810         081400     MOVE ENTRY-1-1 (03) TO COMPUTED-A.                           NC2344.2 79 118
   000811         081500     MOVE SPACES TO RE-MARK.                                      NC2344.2 IMP 112
   000812         081600     PERFORM FAIL.                                                NC2344.2 258
   000813         081700 SPC-WRITE-F1-1.                                                  NC2344.2
   000814         081800     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000815         081900*                                                                 NC2344.2
   000816         082000 SP2-INIT-F1-1.                                                   NC2344.2
   000817         082100     MOVE "SP2-TEST-F1-1" TO PAR-NAME.                            NC2344.2 107
   000818         082200     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000819         082300     MOVE "SEARCH WITH HI INDEX" TO FEATURE.                      NC2344.2 103
   000820         082400     SET IDX-1-1 TO 4.                                            NC2344.2 78
   000821         082500     SET IDX-2-1 TO 5.                                            NC2344.2 80
   000822         082600 SP2-TEST-F1-1.                                                   NC2344.2
   000823         082700     SEARCH GRP-ENTRY-1 VARYING IDX-1-1 AT END                    NC2344.2 78 78
   000824      1  082800         GO TO SP2-FAIL-F1-1-A                                    NC2344.2 835
   000825      1  082900     WHEN ENTRY-1-1 (IDX-1-1) = "GRP04" NEXT SENTENCE.            NC2344.2 79 78
   000826         083000     SET IDX-1-1 TO 4.                                            NC2344.2 78
   000827         083100     SEARCH GRP2-ENTRY-1 VARYING IDX-2-1                          NC2344.2 80 80
   000828      1  083200         AT END PERFORM PASS                                      NC2344.2 257
   000829      1  083300                GO TO SP2-WRITE-F1-1                              NC2344.2 851
   000830         083400     WHEN ENTRY-2-1 (IDX-1-1, IDX-2-1) = "SEC (04,04)"            NC2344.2 81 78 80
   000831      1  083500         GO TO SP2-FAIL-F1-1-B.                                   NC2344.2 847
   000832         083600 SP2-DELETE-F1-1.                                                 NC2344.2
   000833         083700     PERFORM DE-LETE.                                             NC2344.2 259
   000834         083800     GO TO SP2-WRITE-F1-1.                                        NC2344.2 851
   000835         083900 SP2-FAIL-F1-1-A.                                                 NC2344.2
   000836         084000     MOVE "GRP04" TO CORRECT-A.                                   NC2344.2 132
   000837         084100     IF ENTRY-1-1 (04) EQUAL TO "GRP04"                           NC2344.2 79
   000838      1  084200         MOVE "IDX-2-1" TO END-IDX                                NC2344.2 87
   000839      1  084300         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000840      1  084400         SET IDX-VALU TO IDX-2-1                                  NC2344.2 89 80
   000841      1  084500         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000842      1  084600     MOVE ENTRY-1-1 (04) TO COMPUTED-A                            NC2344.2 79 118
   000843      1  084700     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000844         084800     PERFORM FAIL.                                                NC2344.2 258
   000845         084900     GO TO SP2-WRITE-F1-1.                                        NC2344.2 851
   000846         085000*                                                                 NC2344.2
   000847         085100 SP2-FAIL-F1-1-B.                                                 NC2344.2
   000848         085200     MOVE ENTRY-2-1 (04, 04) TO COMPUTED-A.                       NC2344.2 81 118
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000849         085300     MOVE SPACES TO CORRECT-A.                                    NC2344.2 IMP 132
   000850         085400     PERFORM FAIL.                                                NC2344.2 258
   000851         085500 SP2-WRITE-F1-1.                                                  NC2344.2
   000852         085600     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000853         085700*                                                                 NC2344.2
   000854         085800 SP3-INIT-F1-1.                                                   NC2344.2
   000855         085900     MOVE "SP3-TEST-F1-1" TO PAR-NAME.                            NC2344.2 107
   000856         086000     MOVE "VI-122 6.21" TO ANSI-REFERENCE.                        NC2344.2 163
   000857         086100     MOVE "SEARCH WITH HI INDEX" TO FEATURE.                      NC2344.2 103
   000858         086200     SET IDX-1-1 TO 02.                                           NC2344.2 78
   000859         086300 SP3-TEST-F1-1.                                                   NC2344.2
   000860         086400     SEARCH GRP-ENTRY-1 VARYING IDX-1-1                           NC2344.2 78 78
   000861         086500         AT END                                                   NC2344.2
   000862      1  086600                GO TO SP3-FAIL-F1-1-A                             NC2344.2 884
   000863         086700         WHEN ENTRY-1-1 (IDX-1-1) EQUAL TO "GRP02"                NC2344.2 79 78
   000864      1  086800                NEXT SENTENCE.                                    NC2344.2
   000865         086900     SET IDX-1-1 TO 02.                                           NC2344.2 78
   000866         087000     SET IDX-2-1 TO 01.                                           NC2344.2 80
   000867         087100     SEARCH GRP2-ENTRY-1 VARYING IDX-2-1                          NC2344.2 80 80
   000868         087200         AT END                                                   NC2344.2
   000869      1  087300                GO TO SP3-FAIL-F1-1-B                             NC2344.2 896
   000870         087400         WHEN ENTRY-2-1 (IDX-1-1, IDX-2-1) = "SEC (02,03)"        NC2344.2 81 78 80
   000871      1  087500                NEXT SENTENCE.                                    NC2344.2
   000872         087600     SET IDX-1-1 TO 02.                                           NC2344.2 78
   000873         087700     SET IDX-2-1 TO 03.                                           NC2344.2 80
   000874         087800     SET IDX-3-1 TO 05.                                           NC2344.2 82
   000875         087900     SEARCH GRP3-ENTRY-1 VARYING IDX-3-1                          NC2344.2 82 82
   000876      1  088000         AT END PERFORM PASS                                      NC2344.2 257
   000877      1  088100                GO TO SP3-WRITE-F1-1                              NC2344.2 913
   000878         088200         WHEN ENTRY-3-1 (IDX-1-1, IDX-2-1, IDX-3-1)               NC2344.2 83 78 80 82
   000879         088300              = "ELEM (02,03,04)"                                 NC2344.2
   000880      1  088400                GO TO SP3-FAIL-F1-1-C.                            NC2344.2 908
   000881         088500 SP3-DELETE-F1-1.                                                 NC2344.2
   000882         088600     PERFORM DE-LETE.                                             NC2344.2 259
   000883         088700     GO TO SP3-WRITE-F1-1.                                        NC2344.2 913
   000884         088800 SP3-FAIL-F1-1-A.                                                 NC2344.2
   000885         088900     MOVE "GRP02" TO CORRECT-A.                                   NC2344.2 132
   000886         089000     IF ENTRY-1-1 (02) EQUAL TO "GRP02"                           NC2344.2 79
   000887      1  089100         MOVE "IDX-1-1" TO END-IDX                                NC2344.2 87
   000888      1  089200         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000889      1  089300         SET IDX-VALU TO IDX-1-1                                  NC2344.2 89 78
   000890      1  089400         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000891      1  089500     MOVE ENTRY-1-1 (02) TO COMPUTED-A                            NC2344.2 79 118
   000892      1  089600     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000893         089700     PERFORM FAIL.                                                NC2344.2 258
   000894         089800     GO TO SP3-WRITE-F1-1.                                        NC2344.2 913
   000895         089900*                                                                 NC2344.2
   000896         090000 SP3-FAIL-F1-1-B.                                                 NC2344.2
   000897         090100     MOVE "SEC (02,03)" TO CORRECT-A.                             NC2344.2 132
   000898         090200     IF ENTRY-2-1 (02, 03) EQUAL TO "SEC (02,03)"                 NC2344.2 81
   000899      1  090300         MOVE "IDX-2-1"  TO END-IDX                               NC2344.2 87
   000900      1  090400         MOVE "SEE NOTE 1 FOR DIAGNOSTIC " TO RE-MARK             NC2344.2 112
   000901      1  090500         SET IDX-VALU TO IDX-2-1                                  NC2344.2 89 80
   000902      1  090600         MOVE END-STMT TO COMPUTED-A ELSE                         NC2344.2 85 118
   000903      1  090700     MOVE ENTRY-2-1 (02, 03) TO COMPUTED-A                        NC2344.2 81 118
   000904      1  090800     MOVE "SEE NOTE 2 FOR DIAGNOSTIC " TO RE-MARK.                NC2344.2 112
   000905         090900     PERFORM FAIL.                                                NC2344.2 258
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000906         091000     GO TO SP3-WRITE-F1-1.                                        NC2344.2 913
   000907         091100*                                                                 NC2344.2
   000908         091200 SP3-FAIL-F1-1-C.                                                 NC2344.2
   000909         091300     MOVE "INDEX SET HIGHER THAN ENTRY" TO RE-MARK                NC2344.2 112
   000910         091400     MOVE SPACES TO CORRECT-A                                     NC2344.2 IMP 132
   000911         091500     MOVE "ELEM (02,03,04)" TO COMPUTED-A                         NC2344.2 118
   000912         091600     PERFORM FAIL.                                                NC2344.2 258
   000913         091700 SP3-WRITE-F1-1.                                                  NC2344.2
   000914         091800     PERFORM PRINT-DETAIL.                                        NC2344.2 261
   000915         091900*                                                                 NC2344.2
   000916         092000 CCVS-EXIT SECTION.                                               NC2344.2
   000917         092100 CCVS-999999.                                                     NC2344.2
   000918         092200     GO TO CLOSE-FILES.                                           NC2344.2 250
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    20
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       67   ADD-ELEM . . . . . . . . . . .  M375
       52   ADD-GRP. . . . . . . . . . . .  M371
       58   ADD-SEC. . . . . . . . . . . .  M373
      163   ANSI-REFERENCE . . . . . . . .  336 343 352 M408 M429 M451 M472 M495 M519 M542 M577 M599 M626 M650 M689 M735
                                            M796 M818 M856
      142   CCVS-C-1 . . . . . . . . . . .  279 321
      147   CCVS-C-2 . . . . . . . . . . .  280 322
      197   CCVS-E-1 . . . . . . . . . . .  285
      202   CCVS-E-2 . . . . . . . . . . .  294 301 308 313
      205   CCVS-E-2-2 . . . . . . . . . .  M293
      210   CCVS-E-3 . . . . . . . . . . .  314
      219   CCVS-E-4 . . . . . . . . . . .  293
      220   CCVS-E-4-1 . . . . . . . . . .  M291
      222   CCVS-E-4-2 . . . . . . . . . .  M292
      164   CCVS-H-1 . . . . . . . . . . .  274
      169   CCVS-H-2A. . . . . . . . . . .  275
      178   CCVS-H-2B. . . . . . . . . . .  276
      190   CCVS-H-3 . . . . . . . . . . .  277
      240   CCVS-PGM-ID. . . . . . . . . .  246 246
      124   CM-18V0
      118   COMPUTED-A . . . . . . . . . .  119 121 122 123 124 348 351 M399 M400 M570 M571 M682 M683 M714 M715 M726 M727
                                            M763 M764 M775 M776 M787 M788 M810 M841 M842 M848 M890 M891 M902 M903 M911
      119   COMPUTED-N
      117   COMPUTED-X . . . . . . . . . .  M269 333
      121   COMPUTED-0V18
      123   COMPUTED-14V4
      125   COMPUTED-18V0
      122   COMPUTED-4V14
       46   CON-10
       43   CON-5
       44   CON-6
       45   CON-7
      141   COR-ANSI-REFERENCE . . . . . .  M343 M345
      132   CORRECT-A. . . . . . . . . . .  133 134 135 136 137 349 351 M394 M565 M677 M709 M721 M758 M770 M782 M809 M836
                                            M849 M885 M897 M910
      133   CORRECT-N
      131   CORRECT-X. . . . . . . . . . .  M270 335
      134   CORRECT-0V18
      136   CORRECT-14V4
      138   CORRECT-18V0
      135   CORRECT-4V14
      137   CR-18V0
      155   DELETE-COUNTER . . . . . . . .  M259 288 304 306
      110   DOTVALUE . . . . . . . . . . .  M264
      161   DUMMY-HOLD . . . . . . . . . .  M318 324
       38   DUMMY-RECORD . . . . . . . . .  M274 M275 M276 M277 M279 M280 M281 M283 M285 M294 M301 M308 M313 M314 318 M319
                                            320 M321 M322 M323 M324 328 M329 M338 M353
       63   ELEM-GRP . . . . . . . . . . .  M371
       49   ELEM-HOLD-AREA . . . . . . . .  M580 585 M607 612 M631 636 M652 663 677 678 M739 751 782 783
       61   ELEM-NAME. . . . . . . . . . .  376
       65   ELEM-SEC . . . . . . . . . . .  M373
       87   END-IDX. . . . . . . . . . . .  M396 M567 M679 M711 M723 M760 M772 M784 M838 M887 M899
       85   END-STMT . . . . . . . . . . .  399 570 682 714 726 763 775 787 841 890 902
      208   ENDER-DESC . . . . . . . . . .  M296 M307 M312
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    21
0 Defined   Cross-reference of data names   References

0      72   ENTRY-1. . . . . . . . . . . .  M372 387 395 400
       79   ENTRY-1-1. . . . . . . . . . .  416 437 458 697 710 715 743 759 764 803 810 825 837 842 863 886 891
       74   ENTRY-2. . . . . . . . . . . .  M374
       81   ENTRY-2-1. . . . . . . . . . .  480 505 528 551 566 571 700 722 727 746 771 776 830 848 870 898 903
       76   ENTRY-3. . . . . . . . . . . .  M376
       83   ENTRY-3-1. . . . . . . . . . .  584 611 635 662 678 683 749 783 788 878
      156   ERROR-COUNTER. . . . . . . . .  M258 287 297 300
      160   ERROR-HOLD . . . . . . . . . .  M287 M288 M288 M289 292
      206   ERROR-TOTAL. . . . . . . . . .  M298 M300 M305 M306 M310 M311
      103   FEATURE. . . . . . . . . . . .  M379 M409 M430 M438 M452 M471 M496 M520 M543 M578 M600 M627 M651 M690 M736 M797
                                            M819 M857
       71   GRP-ENTRY. . . . . . . . . . .  384
       78   GRP-ENTRY-1. . . . . . . . . .  414 435 457 695 742 800 823 860
       47   GRP-HOLD-AREA. . . . . . . . .  M381 387 394 395 M410 416 M431 437 M453 458 M691 709 710 M737 744 758 759
       50   GRP-NAME . . . . . . . . . . .  372
       73   GRP2-ENTRY
       80   GRP2-ENTRY-1 . . . . . . . . .  478 503 526 550 698 745 827 867
       82   GRP3-ENTRY-1 . . . . . . . . .  583 609 633 660 748 875
      234   HYPHEN-LINE. . . . . . . . . .  281 283 323
      200   ID-AGAIN . . . . . . . . . . .  M246
       89   IDX-VALU . . . . . . . . . . .  M397 M568 M680 M713 M724 M762 M774 M786 M840 M889 M901
       71   IDX-1. . . . . . . . . . . . .  M368 371 372 374 376 M383 M384 387 397 M414
       78   IDX-1-1. . . . . . . . . . . .  M412 416 M433 M435 437 M455 M457 458 M476 480 M500 505 M522 528 M547 551 M581
                                            584 M604 611 M629 635 M656 662 M693 M695 697 700 713 M740 M742 743 746 750 762
                                            M798 M800 803 M820 M823 825 M826 830 M858 M860 863 M865 870 M872 878 889
       73   IDX-2. . . . . . . . . . . . .  M369 373 374 376 568
       80   IDX-2-1. . . . . . . . . . . .  M476 M478 480 M501 M503 505 M523 M526 528 M548 M550 551 M581 584 M605 611 M629
                                            635 M657 662 M693 M698 700 724 M740 M745 746 750 774 M821 M827 830 840 M866 M867
                                            870 M873 878 901
       75   IDX-3. . . . . . . . . . . . .  M370 375 376 M583
       82   IDX-3-1. . . . . . . . . . . .  M581 584 M606 M609 611 M630 M633 635 M658 M660 662 680 M740 M748 750 786 M874
                                            M875 878
      233   INF-ANSI-REFERENCE . . . . . .  M336 M339 M352 M354
      228   INFO-TEXT. . . . . . . . . . .  M337
      157   INSPECT-COUNTER. . . . . . . .  M256 287 309 311
       91   NOTE-1
       96   NOTE-2
      105   P-OR-F . . . . . . . . . . . .  M256 M257 M258 M259 266 M269
      107   PAR-NAME . . . . . . . . . . .  M271 M380 M407 M428 M450 M473 M494 M518 M541 M576 M598 M625 M649 M688 M734 M795
                                            M817 M855
      109   PARDOT-X . . . . . . . . . . .  M263
      158   PASS-COUNTER . . . . . . . . .  M257 289 291
       36   PRINT-FILE . . . . . . . . . .  32 245 251
       37   PRINT-REC. . . . . . . . . . .  M265 M342 M344
      112   RE-MARK. . . . . . . . . . . .  M260 M272 M398 M401 M569 M572 M681 M684 M712 M716 M725 M728 M761 M765 M773 M777
                                            M785 M789 M811 M839 M843 M888 M892 M900 M904 M909
      154   REC-CT . . . . . . . . . . . .  262 264 271
      153   REC-SKL-SUB
      162   RECORD-COUNT . . . . . . . . .  M316 317 M325
       56   SEC-GRP. . . . . . . . . . . .  M371
       48   SEC-HOLD-AREA. . . . . . . . .  M474 480 M497 505 M521 528 M544 551 565 566 M692 700 721 722 M738 747 770 771
       54   SEC-NAME . . . . . . . . . . .  374
       40   SUB-1. . . . . . . . . . . . .  M361 362 368 M475 M498 M524 M545 566 571 M579 M601 M628 M653 678 683
       41   SUB-2. . . . . . . . . . . . .  M363 363 369 M382 395 400 M411 M432 M454 M475 M499 M524 M546 566 571 M579 M602
                                            M628 M654 678 683
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    22
0 Defined   Cross-reference of data names   References

0      42   SUB-3. . . . . . . . . . . . .  M364 364 370 M579 M603 M628 M655 678 683
      113   TEST-COMPUTED. . . . . . . . .  342
      128   TEST-CORRECT . . . . . . . . .  344
      181   TEST-ID. . . . . . . . . . . .  M246
      101   TEST-RESULTS . . . . . . . . .  M247 265
      159   TOTAL-ERROR
      230   XXCOMPUTED . . . . . . . . . .  M351
      232   XXCORRECT. . . . . . . . . . .  M351
      225   XXINFO . . . . . . . . . . . .  338 353
       77   3-DEM-TBL
       70   3-DIMENSION-TBL. . . . . . . .  77
       75   3-ENTRY
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    23
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

      347   BAIL-OUT . . . . . . . . . . .  P268
      355   BAIL-OUT-EX. . . . . . . . . .  E268 G349
      350   BAIL-OUT-WRITE . . . . . . . .  G348
      330   BLANK-LINE-PRINT
      367   BUILD-TABLE. . . . . . . . . .  P361
      916   CCVS-EXIT
      917   CCVS-999999
      243   CCVS1
      356   CCVS1-EXIT . . . . . . . . . .  G249
      390   CHECK-DELETE
      378   CHECK-ENTRIES. . . . . . . . .  G365
      393   CHECK-FAIL . . . . . . . . . .  G386 P423 P445 P466
      564   CHECK-FAIL2. . . . . . . . . .  P488 P513 P536 P559
      676   CHECK-FAIL3. . . . . . . . . .  P593 P620 P644 P671
      403   CHECK-WRITE. . . . . . . . . .  G389 G392
      250   CLOSE-FILES. . . . . . . . . .  G918
      278   COLUMN-NAMES-ROUTINE . . . . .  E248
      259   DE-LETE. . . . . . . . . . . .  P391 P420 P442 P463 P485 P510 P533 P556 P590 P617 P641 P668 P705 P755 P806 P833
                                            P882
      282   END-ROUTINE. . . . . . . . . .  P251
      286   END-ROUTINE-1
      295   END-ROUTINE-12
      303   END-ROUTINE-13 . . . . . . . .  E251
      284   END-RTN-EXIT
      258   FAIL . . . . . . . . . . . . .  P402 P573 P685 P717 P729 P766 P778 P790 P812 P844 P850 P893 P905 P912
      332   FAIL-ROUTINE . . . . . . . . .  P267
      346   FAIL-ROUTINE-EX. . . . . . . .  E267 G340
      341   FAIL-ROUTINE-WRITE . . . . . .  G334 G335
      273   HEAD-ROUTINE . . . . . . . . .  P248
      360   INITIALISE-TABLE
      256   INSPT
      704   MLT-DELETE-F1-1
      754   MLT-DELETE-F1-2
      708   MLT-FAIL-F1-1-A. . . . . . . .  G696
      720   MLT-FAIL-F1-1-B. . . . . . . .  G699
      757   MLT-FAIL-F1-2-A. . . . . . . .  G743
      769   MLT-FAIL-F1-2-B. . . . . . . .  G746
      781   MLT-FAIL-F1-2-C. . . . . . . .  G749
      687   MLT-INIT-F1-1. . . . . . . . .  G674
      733   MLT-INIT-F1-2
      694   MLT-TEST-F1-1
      741   MLT-TEST-F1-2
      730   MLT-WRITE-F1-1 . . . . . . . .  G703 G706 G718
      791   MLT-WRITE-F1-2 . . . . . . . .  G753 G756 G767 G779
      244   OPEN-FILES
      257   PASS . . . . . . . . . . . . .  P388 P417 P439 P459 P482 P507 P530 P552 P586 P614 P638 P665 P702 P752 P801 P828
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    24
0 Defined   Cross-reference of procedures   References

0                                           P876
      261   PRINT-DETAIL . . . . . . . . .  P404 P425 P447 P468 P490 P515 P538 P561 P595 P622 P646 P673 P731 P792 P814 P852
                                            P914
      358   SECT-NC234A-001
      805   SPC-DELETE-F1-1
      808   SPC-FAIL-F1-1. . . . . . . . .  G804
      794   SPC-INIT-F1-1
      799   SPC-TEST-F1-1
      813   SPC-WRITE-F1-1 . . . . . . . .  G802 G807
      832   SP2-DELETE-F1-1
      835   SP2-FAIL-F1-1-A. . . . . . . .  G824
      847   SP2-FAIL-F1-1-B. . . . . . . .  G831
      816   SP2-INIT-F1-1
      822   SP2-TEST-F1-1
      851   SP2-WRITE-F1-1 . . . . . . . .  G829 G834 G845
      881   SP3-DELETE-F1-1
      884   SP3-FAIL-F1-1-A. . . . . . . .  G862
      896   SP3-FAIL-F1-1-B. . . . . . . .  G869
      908   SP3-FAIL-F1-1-C. . . . . . . .  G880
      854   SP3-INIT-F1-1
      859   SP3-TEST-F1-1
      913   SP3-WRITE-F1-1 . . . . . . . .  G877 G883 G894 G906
      254   TERMINATE-CALL
      252   TERMINATE-CCVS
      359   TH-07-001
      419   TH1-DELETE-F1-2
      441   TH1-DELETE-F1-3
      462   TH1-DELETE-F1-4
      422   TH1-FAIL-F1-2. . . . . . . . .  G415
      444   TH1-FAIL-F1-3. . . . . . . . .  G436
      465   TH1-FAIL-F1-4. . . . . . . . .  G461
      406   TH1-INIT-F1-2
      427   TH1-INIT-F1-3
      449   TH1-INIT-F1-4
      413   TH1-TEST-F1-2
      434   TH1-TEST-F1-3
      456   TH1-TEST-F1-4
      424   TH1-WRITE-F1-2 . . . . . . . .  G418 G421
      446   TH1-WRITE-F1-3 . . . . . . . .  G440 G443
      467   TH1-WRITE-F1-4 . . . . . . . .  G460 G464
      484   TH2-DELETE-F1-1
      509   TH2-DELETE-F1-2
      532   TH2-DELETE-F1-3
      555   TH2-DELETE-F1-4
      487   TH2-FAIL-F1-1. . . . . . . . .  G479
      512   TH2-FAIL-F1-2. . . . . . . . .  G504
      535   TH2-FAIL-F1-3. . . . . . . . .  G527
      558   TH2-FAIL-F1-4. . . . . . . . .  G554
      470   TH2-INIT-F1-1
      493   TH2-INIT-F1-2
      517   TH2-INIT-F1-3
      540   TH2-INIT-F1-4
      477   TH2-TEST-F1-1
      502   TH2-TEST-F1-2
      525   TH2-TEST-F1-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    25
0 Defined   Cross-reference of procedures   References

0     549   TH2-TEST-F1-4
      489   TH2-WRITE-F1-1 . . . . . . . .  G483 G486
      514   TH2-WRITE-F1-2 . . . . . . . .  G508 G511
      537   TH2-WRITE-F1-3 . . . . . . . .  G531 G534
      560   TH2-WRITE-F1-4 . . . . . . . .  G553 G557
      589   TH3-DELETE-F1-1
      616   TH3-DELETE-F1-2
      640   TH3-DELETE-F1-3
      667   TH3-DELETE-F1-4
      592   TH3-FAIL-F1-1. . . . . . . . .  G588
      619   TH3-FAIL-F1-2. . . . . . . . .  G610
      643   TH3-FAIL-F1-3. . . . . . . . .  G634
      670   TH3-FAIL-F1-4. . . . . . . . .  G661
      575   TH3-INIT-F1-1. . . . . . . . .  G562
      597   TH3-INIT-F1-2
      624   TH3-INIT-F1-3
      648   TH3-INIT-F1-4
      582   TH3-TEST-F1-1
      608   TH3-TEST-F1-2
      632   TH3-TEST-F1-3
      659   TH3-TEST-F1-4
      594   TH3-WRITE-F1-1 . . . . . . . .  G587 G591
      621   TH3-WRITE-F1-2 . . . . . . . .  G615 G618
      645   TH3-WRITE-F1-3 . . . . . . . .  G639 G642
      672   TH3-WRITE-F1-4 . . . . . . . .  G666 G669
      315   WRITE-LINE . . . . . . . . . .  P265 P266 P274 P275 P276 P277 P279 P280 P281 P283 P285 P294 P302 P308 P313 P314
                                            P338 P342 P344 P353
      327   WRT-LN . . . . . . . . . . . .  P321 P322 P323 P326 P331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    26
0 Defined   Cross-reference of programs     References

        3   NC234A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC234A    Date 06/04/2022  Time 11:58:50   Page    27
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    360  IGYPS2015-I   The paragraph or section prior to paragraph or section "INITIALISE-TABLE" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC234A:
 *    Source records = 918
 *    Data Division statements = 101
 *    Procedure Division statements = 517
 *    Generated COBOL statements = 0
 *    Program complexity factor = 528
0End of compilation 1,  program NC234A,  highest severity 0.
0Return code 0
