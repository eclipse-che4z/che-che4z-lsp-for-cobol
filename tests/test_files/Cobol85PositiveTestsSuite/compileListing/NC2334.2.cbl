1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:01   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:01   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2334.2
   000002         000200 PROGRAM-ID.                                                      NC2334.2
   000003         000300     NC233A.                                                      NC2334.2
   000004         000500*                                                              *  NC2334.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2334.2
   000006         000700*                                                              *  NC2334.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2334.2
   000008         000900*                                                              *  NC2334.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2334.2
   000010         001100*                                                              *  NC2334.2
   000011         001300*                                                              *  NC2334.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2334.2
   000013         001500*                                                              *  NC2334.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2334.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2334.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2334.2
   000017         001900*                                                              *  NC2334.2
   000018         002100                                                                  NC2334.2
   000019         002200*                                                              *  NC2334.2
   000020         002300*    PROGRAM NC233A USES FORMAT 2 OF THE "SEARCH" STATEMENT    *  NC2334.2
   000021         002400*    TO ACCESS THRE AND SEVEN-DIMENSIONAL TABLES.              *  NC2334.2
   000022         002500*    THE SCOPE TERMINATOR "END-SEARCH" IS ALSO TESTED.         *  NC2334.2
   000023         002600*                                                              *  NC2334.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2334.2
   000025         002900 CONFIGURATION SECTION.                                           NC2334.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2334.2
   000027         003100     XXXXX082.                                                    NC2334.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2334.2
   000029         003300     XXXXX083.                                                    NC2334.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2334.2
   000031         003500 FILE-CONTROL.                                                    NC2334.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2334.2 36
   000033         003700     XXXXX055.                                                    NC2334.2
   000034         003800 DATA DIVISION.                                                   NC2334.2
   000035         003900 FILE SECTION.                                                    NC2334.2
   000036         004000 FD  PRINT-FILE.                                                  NC2334.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2334.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2334.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2334.2
   000040         004400 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC2334.2 IMP
   000041         004500 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC2334.2 IMP
   000042         004600 77  SUB-3              PICTURE 99   VALUE ZERO.                  NC2334.2 IMP
   000043         004700 77  CON-7              PICTURE 99  VALUE 07.                     NC2334.2
   000044         004800 77  CON-10             PICTURE 99  VALUE 10.                     NC2334.2
   000045         004900 77  GRP-HOLD-AREA                PICTURE X(5)  VALUE SPACES.     NC2334.2 IMP
   000046         005000 77  CON-5              PICTURE 99  VALUE 05.                     NC2334.2
   000047         005100 77  SEC-HOLD-AREA                PICTURE X(11)  VALUE SPACES.    NC2334.2 IMP
   000048         005200 77  CON-6              PICTURE 99  VALUE 06.                     NC2334.2
   000049         005300 77  ELEM-HOLD-AREA               PICTURE X(15)  VALUE SPACES.    NC2334.2 IMP
   000050         005400 77  L1-HOLD                     PIC XX.                          NC2334.2
   000051         005500 77  L2-HOLD                     PIC XX.                          NC2334.2
   000052         005600 77  L3-HOLD                     PIC XX.                          NC2334.2
   000053         005700 77  L4-HOLD                     PIC XX.                          NC2334.2
   000054         005800 77  L5-HOLD                     PIC XX.                          NC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  L6-HOLD                     PIC XX.                          NC2334.2
   000056         006000 77  L7-HOLD                     PIC XX.                          NC2334.2
   000057         006100 77  N1                         PIC 99.                           NC2334.2
   000058         006200 77  N2                         PIC 99.                           NC2334.2
   000059         006300 77  N3                         PIC 99.                           NC2334.2
   000060         006400 77  N4                         PIC 99.                           NC2334.2
   000061         006500 77  N5                         PIC 99.                           NC2334.2
   000062         006600 77  N6                         PIC 99.                           NC2334.2
   000063         006700 77  N7                         PIC 99.                           NC2334.2
   000064         006800 01  GRP-NAME.                                                    NC2334.2
   000065         006900     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2334.2
   000066         007000     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2334.2
   000067         007100                                                                  NC2334.2
   000068         007200 01  SEC-NAME.                                                    NC2334.2
   000069         007300     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2334.2
   000070         007400     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2334.2
   000071         007500     02  FILLER              PICTURE X      VALUE ",".            NC2334.2
   000072         007600     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2334.2
   000073         007700     02  FILLER              PICTURE X      VALUE ")".            NC2334.2
   000074         007800                                                                  NC2334.2
   000075         007900 01  ELEM-NAME.                                                   NC2334.2
   000076         008000     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2334.2
   000077         008100     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2334.2
   000078         008200     02  FILLER              PICTURE X      VALUE ",".            NC2334.2
   000079         008300     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2334.2
   000080         008400     02  FILLER              PICTURE X      VALUE ",".            NC2334.2
   000081         008500     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2334.2
   000082         008600     02  FILLER              PICTURE X      VALUE ")".            NC2334.2
   000083         008700                                                                  NC2334.2
   000084         008800 01  3-DIMENSION-TBL.                                             NC2334.2
   000085         008900     02  GRP-ENTRY OCCURS 10 TIMES ASCENDING KEY IS GRP           NC2334.2 88
   000086         009000         INDEXED BY IDX-1.                                        NC2334.2
   000087         009100         03  ENTRY-1.                                             NC2334.2
   000088         009200             05  GRP         PICTURE X(5).                        NC2334.2
   000089         009300         03  GRP2-ENTRY OCCURS 10 TIMES ASCENDING KEY IS SEC      NC2334.2 93
   000090         009400             INDEXED BY IDX-2.                                    NC2334.2
   000091         009500             04  ENTRY-2.                                         NC2334.2
   000092         009600                 05  FILLER  PICTURE X(4).                        NC2334.2
   000093         009700                 05  SEC     PICTURE X(7).                        NC2334.2
   000094         009800             04  GRP3-ENTRY OCCURS 10 TIMES ASCENDING KEY IS ELEM NC2334.2 98
   000095         009900                 INDEXED BY IDX-3.                                NC2334.2
   000096         010000                 05  ENTRY-3.                                     NC2334.2
   000097         010100                 07  FILLER  PICTURE X(8).                        NC2334.2
   000098         010200                 07  ELEM    PICTURE X(7).                        NC2334.2
   000099         010300                                                                  NC2334.2
   000100         010400                                                                  NC2334.2
   000101         010500 01  7-DIMENSION-TBL.                                             NC2334.2
   000102         010600   02  GRP-7-1-ENTRY             OCCURS 2                         NC2334.2
   000103         010700                                 ASCENDING KEY IS ENTRY-7-1G      NC2334.2 105
   000104         010800                                 INDEXED BY X1.                   NC2334.2
   000105         010900     03  ENTRY-7-1G.                                              NC2334.2
   000106         011000       04  CHARS-7-1               PIC X.                         NC2334.2
   000107         011100       04  ENTRY-7-1               PIC 9.                         NC2334.2
   000108         011200     03  GRP-7-2-ENTRY           OCCURS 2                         NC2334.2
   000109         011300                                 ASCENDING KEY IS ENTRY-7-2G      NC2334.2 111
   000110         011400                                 INDEXED BY X2.                   NC2334.2
   000111         011500       04  ENTRY-7-2G.                                            NC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600         05  CHARS-7-2             PIC X.                         NC2334.2
   000113         011700         05  ENTRY-7-2             PIC 9.                         NC2334.2
   000114         011800       04  GRP-7-3-ENTRY         OCCURS 2                         NC2334.2
   000115         011900                                 ASCENDING KEY IS ENTRY-7-3G      NC2334.2 117
   000116         012000                                 INDEXED BY X3.                   NC2334.2
   000117         012100         05  ENTRY-7-3G.                                          NC2334.2
   000118         012200           06  CHARS-7-3           PIC X.                         NC2334.2
   000119         012300           06  ENTRY-7-3           PIC 9.                         NC2334.2
   000120         012400         05  GRP-7-4-ENTRY       OCCURS 2                         NC2334.2
   000121         012500                                 ASCENDING KEY IS ENTRY-7-4G      NC2334.2 123
   000122         012600                                 INDEXED BY X4.                   NC2334.2
   000123         012700           06  ENTRY-7-4G.                                        NC2334.2
   000124         012800             07  CHARS-7-4       PIC X.                           NC2334.2
   000125         012900             07  ENTRY-7-4       PIC 9.                           NC2334.2
   000126         013000           06  GRP-7-5-ENTRY     OCCURS 2                         NC2334.2
   000127         013100                                 ASCENDING KEY IS ENTRY-7-5G      NC2334.2 129
   000128         013200                                 INDEXED BY X5.                   NC2334.2
   000129         013300             07  ENTRY-7-5G.                                      NC2334.2
   000130         013400               08  CHARS-7-5     PIC X.                           NC2334.2
   000131         013500               08  ENTRY-7-5     PIC 9.                           NC2334.2
   000132         013600             07  GRP-7-6-ENTRY   OCCURS 2                         NC2334.2
   000133         013700                                 ASCENDING KEY IS ENTRY-7-6G      NC2334.2 135
   000134         013800                                 INDEXED BY X6.                   NC2334.2
   000135         013900               08  ENTRY-7-6G.                                    NC2334.2
   000136         014000                 09  CHARS-7-6   PIC X.                           NC2334.2
   000137         014100                 09  ENTRY-7-6   PIC 9.                           NC2334.2
   000138         014200               08  GRP-7-7-ENTRY OCCURS 2                         NC2334.2
   000139         014300                                 ASCENDING KEY IS ENTRY-7-7G      NC2334.2 141
   000140         014400                                 INDEXED BY X7.                   NC2334.2
   000141         014500                 09  ENTRY-7-7G.                                  NC2334.2
   000142         014600                   10  CHARS-7-7 PIC X.                           NC2334.2
   000143         014700                   10  ENTRY-7-7 PIC 9.                           NC2334.2
   000144         014800                                                                  NC2334.2
   000145         014900 01  NOTE-1.                                                      NC2334.2
   000146         015000     02  FILLER                   PICTURE X(74)  VALUE            NC2334.2
   000147         015100     "NOTE 1 - CORRECT AND COMPUTED DATA ARE EQUAL BUT THE AT END NC2334.2
   000148         015200-    "PATH WAS TAKEN".                                            NC2334.2
   000149         015300     02  FILLER                   PICTURE X(46)  VALUE SPACES.    NC2334.2 IMP
   000150         015400 01  NOTE-2.                                                      NC2334.2
   000151         015500     02  FILLER                   PICTURE X(112)  VALUE           NC2334.2
   000152         015600     "NOTE 2 - CORRECT AND COMPUTED DATA ARE NOT EQUAL. THE COMPUTNC2334.2
   000153         015700-    "ED ENTRY WAS EXTRACTED FROM THE TABLE BY SUBSCRIPTS.".      NC2334.2
   000154         015800     02  FILLER                   PICTURE X(8)  VALUE SPACES.     NC2334.2 IMP
   000155         015900                                                                  NC2334.2
   000156         016000 01  END-STMT.                                                    NC2334.2
   000157         016100     02  FILLER         PICTURE X(7)  VALUE "AT END ".            NC2334.2
   000158         016200     02  END-IDX                  PICTURE X(5)  VALUE SPACES.     NC2334.2 IMP
   000159         016300     02  FILLER                   PICTURE XXX  VALUE " = ".       NC2334.2
   000160         016400     02  IDX-VALU                 PICTURE 99  VALUE 00.           NC2334.2
   000161         016500     02  FILLER                   PICTURE XXX  VALUE SPACES.      NC2334.2 IMP
   000162         016600 01  TEST-RESULTS.                                                NC2334.2
   000163         016700     02 FILLER                   PIC X      VALUE SPACE.          NC2334.2 IMP
   000164         016800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2334.2 IMP
   000165         016900     02 FILLER                   PIC X      VALUE SPACE.          NC2334.2 IMP
   000166         017000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2334.2 IMP
   000167         017100     02 FILLER                   PIC X      VALUE SPACE.          NC2334.2 IMP
   000168         017200     02  PAR-NAME.                                                NC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2334.2 IMP
   000170         017400       03  PARDOT-X              PIC X      VALUE SPACE.          NC2334.2 IMP
   000171         017500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2334.2 IMP
   000172         017600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2334.2 IMP
   000173         017700     02 RE-MARK                  PIC X(61).                       NC2334.2
   000174         017800 01  TEST-COMPUTED.                                               NC2334.2
   000175         017900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2334.2 IMP
   000176         018000     02 FILLER                   PIC X(17)  VALUE                 NC2334.2
   000177         018100            "       COMPUTED=".                                   NC2334.2
   000178         018200     02 COMPUTED-X.                                               NC2334.2
   000179         018300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2334.2 IMP
   000180         018400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2334.2 179
   000181         018500                                 PIC -9(9).9(9).                  NC2334.2
   000182         018600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2334.2 179
   000183         018700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2334.2 179
   000184         018800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2334.2 179
   000185         018900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2334.2 179
   000186         019000         04 COMPUTED-18V0                    PIC -9(18).          NC2334.2
   000187         019100         04 FILLER                           PIC X.               NC2334.2
   000188         019200     03 FILLER PIC X(50) VALUE SPACE.                             NC2334.2 IMP
   000189         019300 01  TEST-CORRECT.                                                NC2334.2
   000190         019400     02 FILLER PIC X(30) VALUE SPACE.                             NC2334.2 IMP
   000191         019500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2334.2
   000192         019600     02 CORRECT-X.                                                NC2334.2
   000193         019700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2334.2 IMP
   000194         019800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2334.2 193
   000195         019900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2334.2 193
   000196         020000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2334.2 193
   000197         020100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2334.2 193
   000198         020200     03      CR-18V0 REDEFINES CORRECT-A.                         NC2334.2 193
   000199         020300         04 CORRECT-18V0                     PIC -9(18).          NC2334.2
   000200         020400         04 FILLER                           PIC X.               NC2334.2
   000201         020500     03 FILLER PIC X(2) VALUE SPACE.                              NC2334.2 IMP
   000202         020600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2334.2 IMP
   000203         020700 01  CCVS-C-1.                                                    NC2334.2
   000204         020800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2334.2
   000205         020900-    "SS  PARAGRAPH-NAME                                          NC2334.2
   000206         021000-    "       REMARKS".                                            NC2334.2
   000207         021100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2334.2 IMP
   000208         021200 01  CCVS-C-2.                                                    NC2334.2
   000209         021300     02 FILLER                     PIC X        VALUE SPACE.      NC2334.2 IMP
   000210         021400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2334.2
   000211         021500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2334.2 IMP
   000212         021600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2334.2
   000213         021700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2334.2 IMP
   000214         021800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2334.2 IMP
   000215         021900 01  REC-CT                        PIC 99       VALUE ZERO.       NC2334.2 IMP
   000216         022000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2334.2 IMP
   000217         022100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2334.2 IMP
   000218         022200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2334.2 IMP
   000219         022300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2334.2 IMP
   000220         022400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2334.2 IMP
   000221         022500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2334.2 IMP
   000222         022600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2334.2 IMP
   000223         022700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2334.2 IMP
   000224         022800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2334.2 IMP
   000225         022900 01  CCVS-H-1.                                                    NC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2334.2 IMP
   000227         023100     02  FILLER                    PIC X(42)    VALUE             NC2334.2
   000228         023200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2334.2
   000229         023300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2334.2 IMP
   000230         023400 01  CCVS-H-2A.                                                   NC2334.2
   000231         023500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2334.2 IMP
   000232         023600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2334.2
   000233         023700   02  FILLER                        PIC XXXX   VALUE             NC2334.2
   000234         023800     "4.2 ".                                                      NC2334.2
   000235         023900   02  FILLER                        PIC X(28)  VALUE             NC2334.2
   000236         024000            " COPY - NOT FOR DISTRIBUTION".                       NC2334.2
   000237         024100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2334.2 IMP
   000238         024200                                                                  NC2334.2
   000239         024300 01  CCVS-H-2B.                                                   NC2334.2
   000240         024400   02  FILLER                        PIC X(15)  VALUE             NC2334.2
   000241         024500            "TEST RESULT OF ".                                    NC2334.2
   000242         024600   02  TEST-ID                       PIC X(9).                    NC2334.2
   000243         024700   02  FILLER                        PIC X(4)   VALUE             NC2334.2
   000244         024800            " IN ".                                               NC2334.2
   000245         024900   02  FILLER                        PIC X(12)  VALUE             NC2334.2
   000246         025000     " HIGH       ".                                              NC2334.2
   000247         025100   02  FILLER                        PIC X(22)  VALUE             NC2334.2
   000248         025200            " LEVEL VALIDATION FOR ".                             NC2334.2
   000249         025300   02  FILLER                        PIC X(58)  VALUE             NC2334.2
   000250         025400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2334.2
   000251         025500 01  CCVS-H-3.                                                    NC2334.2
   000252         025600     02  FILLER                      PIC X(34)  VALUE             NC2334.2
   000253         025700            " FOR OFFICIAL USE ONLY    ".                         NC2334.2
   000254         025800     02  FILLER                      PIC X(58)  VALUE             NC2334.2
   000255         025900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2334.2
   000256         026000     02  FILLER                      PIC X(28)  VALUE             NC2334.2
   000257         026100            "  COPYRIGHT   1985 ".                                NC2334.2
   000258         026200 01  CCVS-E-1.                                                    NC2334.2
   000259         026300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2334.2 IMP
   000260         026400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2334.2
   000261         026500     02 ID-AGAIN                     PIC X(9).                    NC2334.2
   000262         026600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2334.2 IMP
   000263         026700 01  CCVS-E-2.                                                    NC2334.2
   000264         026800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2334.2 IMP
   000265         026900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2334.2 IMP
   000266         027000     02 CCVS-E-2-2.                                               NC2334.2
   000267         027100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2334.2 IMP
   000268         027200         03 FILLER                   PIC X      VALUE SPACE.      NC2334.2 IMP
   000269         027300         03 ENDER-DESC               PIC X(44)  VALUE             NC2334.2
   000270         027400            "ERRORS ENCOUNTERED".                                 NC2334.2
   000271         027500 01  CCVS-E-3.                                                    NC2334.2
   000272         027600     02  FILLER                      PIC X(22)  VALUE             NC2334.2
   000273         027700            " FOR OFFICIAL USE ONLY".                             NC2334.2
   000274         027800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2334.2 IMP
   000275         027900     02  FILLER                      PIC X(58)  VALUE             NC2334.2
   000276         028000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2334.2
   000277         028100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2334.2 IMP
   000278         028200     02 FILLER                       PIC X(15)  VALUE             NC2334.2
   000279         028300             " COPYRIGHT 1985".                                   NC2334.2
   000280         028400 01  CCVS-E-4.                                                    NC2334.2
   000281         028500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2334.2 IMP
   000282         028600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2334.2 IMP
   000284         028800     02 FILLER                       PIC X(40)  VALUE             NC2334.2
   000285         028900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2334.2
   000286         029000 01  XXINFO.                                                      NC2334.2
   000287         029100     02 FILLER                       PIC X(19)  VALUE             NC2334.2
   000288         029200            "*** INFORMATION ***".                                NC2334.2
   000289         029300     02 INFO-TEXT.                                                NC2334.2
   000290         029400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2334.2 IMP
   000291         029500       04 XXCOMPUTED                 PIC X(20).                   NC2334.2
   000292         029600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2334.2 IMP
   000293         029700       04 XXCORRECT                  PIC X(20).                   NC2334.2
   000294         029800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2334.2
   000295         029900 01  HYPHEN-LINE.                                                 NC2334.2
   000296         030000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2334.2 IMP
   000297         030100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2334.2
   000298         030200-    "*****************************************".                 NC2334.2
   000299         030300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2334.2
   000300         030400-    "******************************".                            NC2334.2
   000301         030500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2334.2
   000302         030600     "NC233A".                                                    NC2334.2
   000303         030700 PROCEDURE DIVISION.                                              NC2334.2
   000304         030800 CCVS1 SECTION.                                                   NC2334.2
   000305         030900 OPEN-FILES.                                                      NC2334.2
   000306         031000     OPEN     OUTPUT PRINT-FILE.                                  NC2334.2 36
   000307         031100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2334.2 301 242 301 261
   000308         031200     MOVE    SPACE TO TEST-RESULTS.                               NC2334.2 IMP 162
   000309         031300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2334.2 334 339
   000310         031400     GO TO CCVS1-EXIT.                                            NC2334.2 416
   000311         031500 CLOSE-FILES.                                                     NC2334.2
   000312         031600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2334.2 343 364 36
   000313         031700 TERMINATE-CCVS.                                                  NC2334.2
   000314         031800     EXIT PROGRAM.                                                NC2334.2
   000315         031900 TERMINATE-CALL.                                                  NC2334.2
   000316         032000     STOP     RUN.                                                NC2334.2
   000317         032100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2334.2 166 218
   000318         032200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2334.2 166 219
   000319         032300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2334.2 166 217
   000320         032400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2334.2 166 216
   000321         032500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2334.2 173
   000322         032600 PRINT-DETAIL.                                                    NC2334.2
   000323         032700     IF REC-CT NOT EQUAL TO ZERO                                  NC2334.2 215 IMP
   000324      1  032800             MOVE "." TO PARDOT-X                                 NC2334.2 170
   000325      1  032900             MOVE REC-CT TO DOTVALUE.                             NC2334.2 215 171
   000326         033000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2334.2 162 37 376
   000327         033100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2334.2 166 376
   000328      1  033200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2334.2 393 406
   000329      1  033300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2334.2 407 415
   000330         033400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2334.2 IMP 166 IMP 178
   000331         033500     MOVE SPACE TO CORRECT-X.                                     NC2334.2 IMP 192
   000332         033600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2334.2 215 IMP IMP 168
   000333         033700     MOVE     SPACE TO RE-MARK.                                   NC2334.2 IMP 173
   000334         033800 HEAD-ROUTINE.                                                    NC2334.2
   000335         033900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2334.2 225 38 376
   000336         034000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2334.2 230 38 376
   000337         034100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2334.2 239 38 376
   000338         034200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2334.2 251 38 376
   000339         034300 COLUMN-NAMES-ROUTINE.                                            NC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2334.2 203 38 376
   000341         034500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2334.2 208 38 376
   000342         034600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2334.2 295 38 376
   000343         034700 END-ROUTINE.                                                     NC2334.2
   000344         034800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2334.2 295 38 376
   000345         034900 END-RTN-EXIT.                                                    NC2334.2
   000346         035000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2334.2 258 38 376
   000347         035100 END-ROUTINE-1.                                                   NC2334.2
   000348         035200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2334.2 217 221 218
   000349         035300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2334.2 221 216 221
   000350         035400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2334.2 219 221
   000351         035500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2334.2
   000352         035600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2334.2 219 281
   000353         035700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2334.2 221 283
   000354         035800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2334.2 280 266
   000355         035900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2334.2 263 38 376
   000356         036000  END-ROUTINE-12.                                                 NC2334.2
   000357         036100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2334.2 269
   000358         036200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2334.2 217 IMP
   000359      1  036300         MOVE "NO " TO ERROR-TOTAL                                NC2334.2 267
   000360         036400         ELSE                                                     NC2334.2
   000361      1  036500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2334.2 217 267
   000362         036600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2334.2 263 38
   000363         036700     PERFORM WRITE-LINE.                                          NC2334.2 376
   000364         036800 END-ROUTINE-13.                                                  NC2334.2
   000365         036900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2334.2 216 IMP
   000366      1  037000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2334.2 267
   000367      1  037100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2334.2 216 267
   000368         037200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2334.2 269
   000369         037300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2334.2 263 38 376
   000370         037400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2334.2 218 IMP
   000371      1  037500          MOVE "NO " TO ERROR-TOTAL                               NC2334.2 267
   000372      1  037600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2334.2 218 267
   000373         037700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2334.2 269
   000374         037800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2334.2 263 38 376
   000375         037900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2334.2 271 38 376
   000376         038000 WRITE-LINE.                                                      NC2334.2
   000377         038100     ADD 1 TO RECORD-COUNT.                                       NC2334.2 223
   000378         038200     IF RECORD-COUNT GREATER 50                                   NC2334.2 223
   000379      1  038300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2334.2 38 222
   000380      1  038400         MOVE SPACE TO DUMMY-RECORD                               NC2334.2 IMP 38
   000381      1  038500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2334.2 38
   000382      1  038600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2334.2 203 38 388
   000383      1  038700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2334.2 208 38 388
   000384      1  038800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2334.2 295 38 388
   000385      1  038900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2334.2 222 38
   000386      1  039000         MOVE ZERO TO RECORD-COUNT.                               NC2334.2 IMP 223
   000387         039100     PERFORM WRT-LN.                                              NC2334.2 388
   000388         039200 WRT-LN.                                                          NC2334.2
   000389         039300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2334.2 38
   000390         039400     MOVE SPACE TO DUMMY-RECORD.                                  NC2334.2 IMP 38
   000391         039500 BLANK-LINE-PRINT.                                                NC2334.2
   000392         039600     PERFORM WRT-LN.                                              NC2334.2 388
   000393         039700 FAIL-ROUTINE.                                                    NC2334.2
   000394         039800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2334.2 178 IMP 401
   000395         039900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2334.2 192 IMP 401
   000396         040000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2334.2 224 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2334.2 289
   000398         040200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2334.2 286 38 376
   000399         040300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2334.2 IMP 294
   000400         040400     GO TO  FAIL-ROUTINE-EX.                                      NC2334.2 406
   000401         040500 FAIL-ROUTINE-WRITE.                                              NC2334.2
   000402         040600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2334.2 174 37 376
   000403         040700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2334.2 224 202
   000404         040800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2334.2 189 37 376
   000405         040900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2334.2 IMP 202
   000406         041000 FAIL-ROUTINE-EX. EXIT.                                           NC2334.2
   000407         041100 BAIL-OUT.                                                        NC2334.2
   000408         041200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2334.2 179 IMP 410
   000409         041300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2334.2 193 IMP 415
   000410         041400 BAIL-OUT-WRITE.                                                  NC2334.2
   000411         041500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2334.2 193 293 179 291
   000412         041600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2334.2 224 294
   000413         041700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2334.2 286 38 376
   000414         041800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2334.2 IMP 294
   000415         041900 BAIL-OUT-EX. EXIT.                                               NC2334.2
   000416         042000 CCVS1-EXIT.                                                      NC2334.2
   000417         042100     EXIT.                                                        NC2334.2
   000418         042200 SECT-NC233A-001 SECTION.                                         NC2334.2
   000419         042300 TH-05-001.                                                       NC2334.2
   000420         042400 BUILD-LEVEL-1.                                                   NC2334.2

 ==000420==> IGYPS2015-I The paragraph or section prior to paragraph or section "BUILD-LEVEL-1"
                         did not contain any statements.

   000421         042500     ADD 1 TO SUB-1.                                              NC2334.2 40
   000422         042600     IF SUB-1 = 11 GO TO CHECK-ENTRIES.                           NC2334.2 40 446
   000423         042700     MOVE GRP-NAME TO ENTRY-1 (SUB-1).                            NC2334.2 64 87 40
   000424         042800     ADD 1 TO ADD-GRP.                                            NC2334.2 66
   000425         042900 BUILD-LEVEL-2.                                                   NC2334.2
   000426         043000     ADD 1 TO SUB-2.                                              NC2334.2 41
   000427         043100     IF SUB-2 = 11                                                NC2334.2 41
   000428      1  043200         MOVE ZERO TO SUB-2                                       NC2334.2 IMP 41
   000429      1  043300         MOVE 01 TO ADD-SEC                                       NC2334.2 72
   000430      1  043400         GO TO BUILD-LEVEL-1.                                     NC2334.2 420
   000431         043500     MOVE SUB-1 TO SEC-GRP.                                       NC2334.2 40 70
   000432         043600     MOVE SEC-NAME TO ENTRY-2 (SUB-1, SUB-2).                     NC2334.2 68 91 40 41
   000433         043700     ADD 1 TO ADD-SEC.                                            NC2334.2 72
   000434         043800 BUILD-LEVEL-3.                                                   NC2334.2
   000435         043900     ADD 1 TO SUB-3.                                              NC2334.2 42
   000436         044000     IF SUB-3 = 11                                                NC2334.2 42
   000437      1  044100         MOVE ZERO TO SUB-3                                       NC2334.2 IMP 42
   000438      1  044200              MOVE 01 TO ADD-ELEM                                 NC2334.2 81
   000439      1  044300              GO TO BUILD-LEVEL-2.                                NC2334.2 425
   000440         044400     MOVE SUB-1 TO ELEM-GRP.                                      NC2334.2 40 77
   000441         044500     MOVE SUB-2 TO ELEM-SEC.                                      NC2334.2 41 79
   000442         044600     MOVE ELEM-NAME TO ENTRY-3 (SUB-1, SUB-2, SUB-3).             NC2334.2 75 96 40 41 42
   000443         044700     ADD 1 TO ADD-ELEM.                                           NC2334.2 81
   000444         044800     GO TO BUILD-LEVEL-3.                                         NC2334.2 434
   000445         044900                                                                  NC2334.2
   000446         045000 CHECK-ENTRIES.                                                   NC2334.2
   000447         045100     MOVE "SEARCH ALL-FIRST LEV" TO FEATURE.                      NC2334.2 164
   000448         045200     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC2334.2 168
   000449         045300     MOVE "GRP02" TO GRP-HOLD-AREA.                               NC2334.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045400     MOVE 02 TO SUB-2.                                            NC2334.2 41
   000451         045500     SET IDX-1 TO 1.                                              NC2334.2 86
   000452         045600     SEARCH ALL GRP-ENTRY AT END                                  NC2334.2 85
   000453      1  045700         PERFORM GRP-FAIL-PARGRAPH                                NC2334.2 460
   000454      1  045800         GO TO LEVEL-1-TEST-2                                     NC2334.2 471
   000455      1  045900         WHEN GRP (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.          NC2334.2 88 86 45
   000456         046000                                                                  NC2334.2
   000457         046100     PERFORM PASS-TH.                                             NC2334.2 867
   000458         046200     GO TO LEVEL-1-TEST-2.                                        NC2334.2 471
   000459         046300                                                                  NC2334.2
   000460         046400 GRP-FAIL-PARGRAPH.                                               NC2334.2
   000461         046500     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2334.2 45 193
   000462         046600     IF ENTRY-1 (SUB-2) EQUAL TO GRP-HOLD-AREA                    NC2334.2 87 41 45
   000463      1  046700         MOVE "IDX-1" TO END-IDX                                  NC2334.2 158
   000464      1  046800         SET IDX-VALU TO IDX-1                                    NC2334.2 160 86
   000465      1  046900         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2334.2 173
   000466      1  047000         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2334.2 156 179
   000467      1  047100     MOVE ENTRY-1 (SUB-2) TO COMPUTED-A                           NC2334.2 87 41 179
   000468      1  047200     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2334.2 173
   000469         047300                                                                  NC2334.2
   000470         047400     PERFORM FAIL-TH.                                             NC2334.2 870
   000471         047500 LEVEL-1-TEST-2.                                                  NC2334.2
   000472         047600     MOVE "LEVEL-1-TEST-2      " TO PAR-NAME.                     NC2334.2 168
   000473         047700     MOVE "GRP01" TO GRP-HOLD-AREA.                               NC2334.2 45
   000474         047800     MOVE 01 TO SUB-2.                                            NC2334.2 41
   000475         047900     SET IDX-1 TO 1.                                              NC2334.2 86
   000476         048000     SEARCH ALL GRP-ENTRY AT END                                  NC2334.2 85
   000477      1  048100         PERFORM GRP-FAIL-PARGRAPH                                NC2334.2 460
   000478      1  048200         GO TO LEVEL-1-TEST-3                                     NC2334.2 482
   000479      1  048300         WHEN GRP (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.          NC2334.2 88 86 45
   000480         048400                                                                  NC2334.2
   000481         048500     PERFORM PASS-TH.                                             NC2334.2 867
   000482         048600 LEVEL-1-TEST-3.                                                  NC2334.2
   000483         048700     MOVE "LEVEL-1-TEST-3      " TO PAR-NAME.                     NC2334.2 168
   000484         048800     MOVE "GRP10" TO GRP-HOLD-AREA.                               NC2334.2 45
   000485         048900     MOVE 10 TO SUB-2.                                            NC2334.2 41
   000486         049000     SET IDX-1 TO 1.                                              NC2334.2 86
   000487         049100     SEARCH ALL GRP-ENTRY AT END                                  NC2334.2 85
   000488      1  049200         PERFORM GRP-FAIL-PARGRAPH                                NC2334.2 460
   000489      1  049300         GO TO LEVEL-1-TEST-4                                     NC2334.2 493
   000490      1  049400         WHEN GRP (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.          NC2334.2 88 86 45
   000491         049500                                                                  NC2334.2
   000492         049600     PERFORM PASS-TH.                                             NC2334.2 867
   000493         049700 LEVEL-1-TEST-4.                                                  NC2334.2
   000494         049800     MOVE "LEVEL-1-TEST-4      " TO PAR-NAME.                     NC2334.2 168
   000495         049900     MOVE "GRP05" TO GRP-HOLD-AREA.                               NC2334.2 45
   000496         050000     MOVE 05 TO SUB-2.                                            NC2334.2 41
   000497         050100     SET IDX-1 TO 05.                                             NC2334.2 86
   000498         050200     SEARCH ALL GRP-ENTRY                                         NC2334.2 85
   000499      1  050300         WHEN GRP (IDX-1) = GRP-HOLD-AREA GO TO PASS-TH-TEST-4.   NC2334.2 88 86 45 502
   000500         050400     PERFORM GRP-FAIL-PARGRAPH.                                   NC2334.2 460
   000501         050500     GO TO LEVEL-2-TEST-1.                                        NC2334.2 506
   000502         050600 PASS-TH-TEST-4.                                                  NC2334.2
   000503         050700                                                                  NC2334.2
   000504         050800     PERFORM PASS-TH.                                             NC2334.2 867
   000505         050900                                                                  NC2334.2
   000506         051000 LEVEL-2-TEST-1.                                                  NC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     MOVE "SEARCH ALL-SEC LEVEL" TO FEATURE.                      NC2334.2 164
   000508         051200     MOVE "LEVEL-2-TEST-1      " TO PAR-NAME.                     NC2334.2 168
   000509         051300     MOVE "SEC (01,01)" TO SEC-HOLD-AREA.                         NC2334.2 47
   000510         051400     MOVE 1 TO SUB-1   SUB-2.                                     NC2334.2 40 41
   000511         051500     SET IDX-1 IDX-2 TO 1.                                        NC2334.2 86 90
   000512         051600     SEARCH ALL GRP2-ENTRY AT END                                 NC2334.2 89
   000513      1  051700         PERFORM SEC-FAIL-PARGRAF                                 NC2334.2 561
   000514      1  051800         GO TO LEVEL-2-TEST-2                                     NC2334.2 519
   000515      1  051900         WHEN SEC (IDX-1, IDX-2) = "(01,01)" NEXT SENTENCE.       NC2334.2 93 86 90
   000516         052000                                                                  NC2334.2
   000517         052100     PERFORM PASS-TH.                                             NC2334.2 867
   000518         052200                                                                  NC2334.2
   000519         052300 LEVEL-2-TEST-2.                                                  NC2334.2
   000520         052400     MOVE "LEVEL-2-TEST-2      " TO PAR-NAME.                     NC2334.2 168
   000521         052500     MOVE "SEC (05,10)" TO SEC-HOLD-AREA.                         NC2334.2 47
   000522         052600     MOVE 05 TO SUB-1.                                            NC2334.2 40
   000523         052700     MOVE 10 TO SUB-2.                                            NC2334.2 41
   000524         052800     SET IDX-1 TO 5.                                              NC2334.2 86
   000525         052900     SET IDX-2 TO 1.                                              NC2334.2 90
   000526         053000     SEARCH ALL GRP2-ENTRY AT END                                 NC2334.2 89
   000527      1  053100         PERFORM SEC-FAIL-PARGRAF                                 NC2334.2 561
   000528      1  053200         GO TO LEVEL-2-TEST-3                                     NC2334.2 533
   000529      1  053300         WHEN SEC (IDX-1, IDX-2) = "(05,10)" NEXT SENTENCE.       NC2334.2 93 86 90
   000530         053400                                                                  NC2334.2
   000531         053500     PERFORM PASS-TH.                                             NC2334.2 867
   000532         053600                                                                  NC2334.2
   000533         053700 LEVEL-2-TEST-3.                                                  NC2334.2
   000534         053800     MOVE "LEVEL-2-TEST-3      " TO PAR-NAME.                     NC2334.2 168
   000535         053900     MOVE "SEC (10,10)" TO SEC-HOLD-AREA.                         NC2334.2 47
   000536         054000     SET IDX-1 TO 10.                                             NC2334.2 86
   000537         054100     SET IDX-2 TO 1.                                              NC2334.2 90
   000538         054200     MOVE 10 TO SUB-1  SUB-2.                                     NC2334.2 40 41
   000539         054300     SEARCH ALL GRP2-ENTRY AT END                                 NC2334.2 89
   000540      1  054400         PERFORM SEC-FAIL-PARGRAF                                 NC2334.2 561
   000541      1  054500         GO TO LEVEL-2-TEST-4                                     NC2334.2 545
   000542      1  054600         WHEN SEC (IDX-1, IDX-2) = "(10,10)" NEXT SENTENCE.       NC2334.2 93 86 90
   000543         054700                                                                  NC2334.2
   000544         054800     PERFORM PASS-TH.                                             NC2334.2 867
   000545         054900 LEVEL-2-TEST-4.                                                  NC2334.2
   000546         055000     MOVE "LEVEL-2-TEST-4      " TO PAR-NAME.                     NC2334.2 168
   000547         055100     MOVE "SEC (08,02)" TO SEC-HOLD-AREA.                         NC2334.2 47
   000548         055200     MOVE 08 TO SUB-1.                                            NC2334.2 40
   000549         055300     MOVE 02 TO SUB-2.                                            NC2334.2 41
   000550         055400     SET IDX-1 TO 08.                                             NC2334.2 86
   000551         055500     SET IDX-2 TO 01.                                             NC2334.2 90
   000552         055600     SEARCH ALL GRP2-ENTRY                                        NC2334.2 89
   000553      1  055700         WHEN SEC (IDX-1, IDX-2) = "(08,02)" GO TO PASS-TH-2-4.   NC2334.2 93 86 90 556
   000554         055800     PERFORM SEC-FAIL-PARGRAF.                                    NC2334.2 561
   000555         055900     GO TO LEVEL-3-TEST-1.                                        NC2334.2 573
   000556         056000 PASS-TH-2-4.                                                     NC2334.2
   000557         056100                                                                  NC2334.2
   000558         056200     PERFORM PASS-TH.                                             NC2334.2 867
   000559         056300     GO TO LEVEL-3-TEST-1.                                        NC2334.2 573
   000560         056400                                                                  NC2334.2
   000561         056500 SEC-FAIL-PARGRAF.                                                NC2334.2
   000562         056600     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2334.2 47 193
   000563         056700     IF ENTRY-2 (SUB-1, SUB-2) EQUAL TO SEC-HOLD-AREA             NC2334.2 91 40 41 47
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564      1  056800         MOVE "IDX-2" TO END-IDX                                  NC2334.2 158
   000565      1  056900         SET IDX-VALU TO IDX-2                                    NC2334.2 160 90
   000566      1  057000         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2334.2 173
   000567      1  057100         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2334.2 156 179
   000568      1  057200     MOVE ENTRY-2 (SUB-1, SUB-2) TO COMPUTED-A                    NC2334.2 91 40 41 179
   000569      1  057300     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2334.2 173
   000570         057400                                                                  NC2334.2
   000571         057500     PERFORM FAIL-TH.                                             NC2334.2 870
   000572         057600                                                                  NC2334.2
   000573         057700 LEVEL-3-TEST-1.                                                  NC2334.2
   000574         057800     MOVE "LEVEL-3-TEST-1      " TO PAR-NAME.                     NC2334.2 168
   000575         057900     MOVE "SEARCH ALL THIRD LEV" TO FEATURE.                      NC2334.2 164
   000576         058000     MOVE 1 TO SUB-1  SUB-2  SUB-3.                               NC2334.2 40 41 42
   000577         058100     MOVE "ELEM (01,01,01)" TO ELEM-HOLD-AREA.                    NC2334.2 49
   000578         058200     SET IDX-1 IDX-2 IDX-3 TO 1.                                  NC2334.2 86 90 95
   000579         058300     SEARCH ALL GRP3-ENTRY                                        NC2334.2 94
   000580         058400         WHEN ELEM (IDX-1, IDX-2, IDX-3) = ",01,01)"              NC2334.2 98 86 90 95
   000581      1  058500             GO TO PASS-TH-3-1.                                   NC2334.2 584
   000582         058600     PERFORM ELEM-FAIL-PARA.                                      NC2334.2 635
   000583         058700     GO TO LEVEL-3-TEST-2.                                        NC2334.2 588
   000584         058800 PASS-TH-3-1.                                                     NC2334.2
   000585         058900                                                                  NC2334.2
   000586         059000     PERFORM PASS-TH.                                             NC2334.2 867
   000587         059100                                                                  NC2334.2
   000588         059200 LEVEL-3-TEST-2.                                                  NC2334.2
   000589         059300     MOVE "LEVEL-3-TEST-2      " TO PAR-NAME.                     NC2334.2 168
   000590         059400     MOVE 05 TO SUB-1.                                            NC2334.2 40
   000591         059500     MOVE 06 TO SUB-2.                                            NC2334.2 41
   000592         059600     MOVE 07 TO SUB-3.                                            NC2334.2 42
   000593         059700     SET IDX-1 TO 05.                                             NC2334.2 86
   000594         059800     SET IDX-2 TO 06.                                             NC2334.2 90
   000595         059900     SET IDX-3 TO 1.                                              NC2334.2 95
   000596         060000     MOVE "ELEM (05,06,07)" TO ELEM-HOLD-AREA.                    NC2334.2 49
   000597         060100     SEARCH ALL GRP3-ENTRY AT END                                 NC2334.2 94
   000598      1  060200         PERFORM ELEM-FAIL-PARA                                   NC2334.2 635
   000599      1  060300         GO TO LEVEL-3-TEST-3                                     NC2334.2 605
   000600         060400         WHEN ELEM (IDX-1, IDX-2, IDX-3) = ",06,07)"              NC2334.2 98 86 90 95
   000601      1  060500             NEXT SENTENCE.                                       NC2334.2
   000602         060600                                                                  NC2334.2
   000603         060700     PERFORM PASS-TH.                                             NC2334.2 867
   000604         060800                                                                  NC2334.2
   000605         060900 LEVEL-3-TEST-3.                                                  NC2334.2
   000606         061000     MOVE "LEVEL-3-TEST-3      " TO PAR-NAME.                     NC2334.2 168
   000607         061100     MOVE 10 TO SUB-1 SUB-2 SUB-3.                                NC2334.2 40 41 42
   000608         061200     SET IDX-1 IDX-2 TO 10.                                       NC2334.2 86 90
   000609         061300     SET IDX-3 TO 1.                                              NC2334.2 95
   000610         061400     MOVE "ELEM (10,10,10)" TO ELEM-HOLD-AREA.                    NC2334.2 49
   000611         061500     SEARCH ALL GRP3-ENTRY AT END                                 NC2334.2 94
   000612      1  061600         PERFORM ELEM-FAIL-PARA                                   NC2334.2 635
   000613      1  061700         GO TO LEVEL-3-TEST-4                                     NC2334.2 618
   000614         061800         WHEN ELEM (IDX-1, IDX-2, IDX-3) = ",10,10)"              NC2334.2 98 86 90 95
   000615      1  061900             NEXT SENTENCE.                                       NC2334.2
   000616         062000                                                                  NC2334.2
   000617         062100     PERFORM PASS-TH.                                             NC2334.2 867
   000618         062200 LEVEL-3-TEST-4.                                                  NC2334.2
   000619         062300     MOVE "LEVEL-3-TEST-4      " TO PAR-NAME.                     NC2334.2 168
   000620         062400     MOVE "ELEM (07,06,05)" TO ELEM-HOLD-AREA.                    NC2334.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621         062500     MOVE 07 TO SUB-1.                                            NC2334.2 40
   000622         062600     MOVE 06 TO SUB-2.                                            NC2334.2 41
   000623         062700     MOVE 05 TO SUB-3.                                            NC2334.2 42
   000624         062800     SET IDX-1 TO 07.                                             NC2334.2 86
   000625         062900     SET IDX-2 TO 06.                                             NC2334.2 90
   000626         063000     SET IDX-3 TO 03.                                             NC2334.2 95
   000627         063100     SEARCH ALL GRP3-ENTRY AT END                                 NC2334.2 94
   000628      1  063200         PERFORM ELEM-FAIL-PARA                                   NC2334.2 635
   000629      1  063300         GO TO MULT-SEARCH-TEST-1                                 NC2334.2 647
   000630         063400         WHEN ELEM (IDX-1, IDX-2, IDX-3) = ",06,05)"              NC2334.2 98 86 90 95
   000631      1  063500             NEXT SENTENCE.                                       NC2334.2
   000632         063600                                                                  NC2334.2
   000633         063700     PERFORM PASS-TH.                                             NC2334.2 867
   000634         063800     GO TO MULT-SEARCH-TEST-1.                                    NC2334.2 647
   000635         063900 ELEM-FAIL-PARA.                                                  NC2334.2
   000636         064000     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2334.2 49 193
   000637         064100     IF ENTRY-3 (SUB-1, SUB-2, SUB-3) EQUAL TO ELEM-HOLD-AREA     NC2334.2 96 40 41 42 49
   000638      1  064200         MOVE "IDX-3" TO END-IDX                                  NC2334.2 158
   000639      1  064300         SET IDX-VALU TO IDX-3                                    NC2334.2 160 95
   000640      1  064400         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2334.2 173
   000641      1  064500         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2334.2 156 179
   000642      1  064600     MOVE ENTRY-3 (SUB-1, SUB-2, SUB-3) TO COMPUTED-A             NC2334.2 96 40 41 42 179
   000643      1  064700     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2334.2 173
   000644         064800                                                                  NC2334.2
   000645         064900     PERFORM FAIL-TH.                                             NC2334.2 870
   000646         065000                                                                  NC2334.2
   000647         065100 MULT-SEARCH-TEST-1.                                              NC2334.2
   000648         065200     MOVE "MULT-SEARCH-TEST-1  " TO PAR-NAME.                     NC2334.2 168
   000649         065300     MOVE "MULTIPLE SEARCH STMT" TO FEATURE.                      NC2334.2 164
   000650         065400     MOVE "GRP08" TO GRP-HOLD-AREA.                               NC2334.2 45
   000651         065500     MOVE "SEC (08,07)" TO SEC-HOLD-AREA.                         NC2334.2 47
   000652         065600     SET IDX-1 IDX-2 TO 1.                                        NC2334.2 86 90
   000653         065700     SEARCH ALL GRP-ENTRY AT END GO TO MULT-SEARCH-FAIL1          NC2334.2 85 660
   000654      1  065800         WHEN GRP (IDX-1) = "GRP08" NEXT SENTENCE.                NC2334.2 88 86
   000655         065900     SEARCH ALL GRP2-ENTRY AT END GO TO MULT-SEARCH-FAIL          NC2334.2 89 672
   000656      1  066000         WHEN SEC (IDX-1, IDX-2) = "(08,07)" NEXT SENTENCE.       NC2334.2 93 86 90
   000657         066100                                                                  NC2334.2
   000658         066200     PERFORM PASS-TH.                                             NC2334.2 867
   000659         066300     GO TO MULT-SEARCH-7-INIT-3.                                  NC2334.2 684
   000660         066400 MULT-SEARCH-FAIL1.                                               NC2334.2
   000661         066500     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2334.2 45 193
   000662         066600     IF ENTRY-1 (08) EQUAL TO GRP-HOLD-AREA                       NC2334.2 87 45
   000663      1  066700         MOVE "IDX-1" TO END-IDX                                  NC2334.2 158
   000664      1  066800         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2334.2 173
   000665      1  066900         SET IDX-VALU TO IDX-1                                    NC2334.2 160 86
   000666      1  067000         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2334.2 156 179
   000667      1  067100     MOVE ENTRY-1 (08) TO COMPUTED-A                              NC2334.2 87 179
   000668      1  067200     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2334.2 173
   000669         067300                                                                  NC2334.2
   000670         067400     PERFORM FAIL-TH.                                             NC2334.2 870
   000671         067500     GO TO MULT-SEARCH-7-INIT-3.                                  NC2334.2 684
   000672         067600 MULT-SEARCH-FAIL.                                                NC2334.2
   000673         067700     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2334.2 47 193
   000674         067800     IF ENTRY-2 (08, 07) EQUAL TO SEC-HOLD-AREA                   NC2334.2 91 47
   000675      1  067900         MOVE "IDX-2" TO END-IDX                                  NC2334.2 158
   000676      1  068000         SET IDX-VALU TO IDX-2                                    NC2334.2 160 90
   000677      1  068100         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2334.2 173
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000678      1  068200         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2334.2 156 179
   000679      1  068300     MOVE ENTRY-2 (08, 07) TO COMPUTED-A                          NC2334.2 91 179
   000680      1  068400     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2334.2 173
   000681         068500                                                                  NC2334.2
   000682         068600     PERFORM FAIL-TH.                                             NC2334.2 870
   000683         068700                                                                  NC2334.2
   000684         068800 MULT-SEARCH-7-INIT-3.                                            NC2334.2
   000685         068900     MOVE   "MULT-SEARCH-7-TEST-3" TO PAR-NAME.                   NC2334.2 168
   000686         069000     MOVE   "VI-122 6.21"          TO ANSI-REFERENCE.             NC2334.2 224
   000687         069100     MOVE   "A2" TO L1-HOLD.                                      NC2334.2 50
   000688         069200     MOVE   "B1" TO L2-HOLD.                                      NC2334.2 51
   000689         069300     MOVE   "C2" TO L3-HOLD.                                      NC2334.2 52
   000690         069400     MOVE   "D1" TO L4-HOLD.                                      NC2334.2 53
   000691         069500     MOVE   "E2" TO L5-HOLD.                                      NC2334.2 54
   000692         069600     MOVE   "F1" TO L6-HOLD.                                      NC2334.2 55
   000693         069700     MOVE   "G2" TO L7-HOLD.                                      NC2334.2 56
   000694         069800     SET     X1 X2 X3 X4 X5 X6 X7 TO 1.                           NC2334.2 104 110 116 122 128 134 140
   000695         069900     PERFORM MULT-SEARCH-7-INIT-3-A                               NC2334.2 704
   000696         070000             VARYING N1 FROM 1 BY 1 UNTIL N1 > 2                  NC2334.2 57 57
   000697         070100               AFTER N2 FROM 1 BY 1 UNTIL N2 > 2                  NC2334.2 58 58
   000698         070200               AFTER N3 FROM 1 BY 1 UNTIL N3 > 2                  NC2334.2 59 59
   000699         070300               AFTER N4 FROM 1 BY 1 UNTIL N4 > 2                  NC2334.2 60 60
   000700         070400               AFTER N5 FROM 1 BY 1 UNTIL N5 > 2                  NC2334.2 61 61
   000701         070500               AFTER N6 FROM 1 BY 1 UNTIL N6 > 2                  NC2334.2 62 62
   000702         070600               AFTER N7 FROM 1 BY 1 UNTIL N7 > 2.                 NC2334.2 63 63
   000703         070700     GO TO   MULT-SEARCH-7-TEST-3.                                NC2334.2 724
   000704         070800 MULT-SEARCH-7-INIT-3-A.                                          NC2334.2
   000705         070900                                                                  NC2334.2
   000706         071000     MOVE    N1 TO ENTRY-7-1 (N1).                                NC2334.2 57 107 57
   000707         071100     MOVE   "A" TO CHARS-7-1 (N1).                                NC2334.2 106 57
   000708         071200     MOVE    N2 TO ENTRY-7-2 (N1 N2).                             NC2334.2 58 113 57 58
   000709         071300     MOVE   "B" TO CHARS-7-2 (N1 N2).                             NC2334.2 112 57 58
   000710         071400     MOVE    N3 TO ENTRY-7-3 (N1 N2 N3).                          NC2334.2 59 119 57 58 59
   000711         071500     MOVE   "C" TO CHARS-7-3 (N1 N2 N3).                          NC2334.2 118 57 58 59
   000712         071600     MOVE    N4 TO ENTRY-7-4 (N1 N2 N3 N4).                       NC2334.2 60 125 57 58 59 60
   000713         071700     MOVE   "D" TO CHARS-7-4 (N1 N2 N3 N4).                       NC2334.2 124 57 58 59 60
   000714         071800     MOVE    N5 TO ENTRY-7-5 (N1 N2 N3 N4 N5).                    NC2334.2 61 131 57 58 59 60 61
   000715         071900     MOVE   "E" TO CHARS-7-5 (N1 N2 N3 N4 N5).                    NC2334.2 130 57 58 59 60 61
   000716         072000     MOVE    N6 TO ENTRY-7-6 (N1 N2 N3 N4 N5 N6).                 NC2334.2 62 137 57 58 59 60 61 62
   000717         072100     MOVE   "F" TO CHARS-7-6 (N1 N2 N3 N4 N5 N6).                 NC2334.2 136 57 58 59 60 61 62
   000718         072200     MOVE    N7 TO ENTRY-7-7 (N1 N2 N3 N4 N5 N6 N7).              NC2334.2 63 143 57 58 59 60 61 62 63
   000719         072300     MOVE   "G" TO CHARS-7-7 (N1 N2 N3 N4 N5 N6 N7).              NC2334.2 142 57 58 59 60 61 62 63
   000720         072400 MULT-SEARCH-7-DELETE-3.                                          NC2334.2
   000721         072500     PERFORM DE-LETE.                                             NC2334.2 320
   000722         072600     PERFORM PRINT-DETAIL.                                        NC2334.2 322
   000723         072700     GO TO   END-SEARCH-TEST.                                     NC2334.2 873
   000724         072800 MULT-SEARCH-7-TEST-3.                                            NC2334.2
   000725         072900     SEARCH  ALL GRP-7-1-ENTRY                                    NC2334.2 102
   000726      1  073000             AT END  GO TO MULT-SEARCH-7-FAIL-1                   NC2334.2 768
   000727         073100             WHEN    ENTRY-7-1G (X1) =  L1-HOLD                   NC2334.2 105 104 50
   000728      1  073200                     NEXT SENTENCE.                               NC2334.2
   000729         073300     SET     X1 TO 1.                                             NC2334.2 104
   000730         073400     SEARCH  ALL GRP-7-2-ENTRY                                    NC2334.2 108
   000731      1  073500             AT END  GO TO MULT-SEARCH-7-FAIL-2                   NC2334.2 782
   000732         073600             WHEN    ENTRY-7-2G (X1 X2) = L2-HOLD                 NC2334.2 111 104 110 51
   000733      1  073700                     NEXT SENTENCE.                               NC2334.2
   000734         073800     SET     X1 TO 2.                                             NC2334.2 104
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000735         073900     SET     X2 TO 1.                                             NC2334.2 110
   000736         074000     SEARCH  ALL GRP-7-3-ENTRY                                    NC2334.2 114
   000737      1  074100             AT END  GO TO MULT-SEARCH-7-FAIL-3                   NC2334.2 796
   000738         074200             WHEN    ENTRY-7-3G (X1 X2 X3) = L3-HOLD              NC2334.2 117 104 110 116 52
   000739      1  074300                     NEXT SENTENCE.                               NC2334.2
   000740         074400     SET     X1 TO 1.                                             NC2334.2 104
   000741         074500     SET     X2, X3 TO 1.                                         NC2334.2 110 116
   000742         074600     SEARCH  ALL GRP-7-4-ENTRY                                    NC2334.2 120
   000743      1  074700             AT END  GO TO MULT-SEARCH-7-FAIL-4                   NC2334.2 810
   000744         074800             WHEN    ENTRY-7-4G (X1 X2 X3 X4) =  L4-HOLD          NC2334.2 123 104 110 116 122 53
   000745      1  074900                     NEXT SENTENCE.                               NC2334.2
   000746         075000     SET     X1 TO 2.                                             NC2334.2 104
   000747         075100     SET     X2, X3, X4 TO 1.                                     NC2334.2 110 116 122
   000748         075200     SEARCH  ALL GRP-7-5-ENTRY                                    NC2334.2 126
   000749      1  075300             AT END  GO TO MULT-SEARCH-7-FAIL-5                   NC2334.2 824
   000750         075400             WHEN    ENTRY-7-5G (X1 X2 X3 X4 X5) = L5-HOLD        NC2334.2 129 104 110 116 122 128 54
   000751      1  075500                     NEXT SENTENCE.                               NC2334.2
   000752         075600     SET     X1 TO 1.                                             NC2334.2 104
   000753         075700     SET     X2, X3, X4, X5 TO 1.                                 NC2334.2 110 116 122 128
   000754         075800     SEARCH  ALL GRP-7-6-ENTRY                                    NC2334.2 132
   000755      1  075900             AT END  GO TO MULT-SEARCH-7-FAIL-6                   NC2334.2 838
   000756         076000             WHEN ENTRY-7-6G (X1 X2 X3 X4 X5 X6) = L6-HOLD        NC2334.2 135 104 110 116 122 128 134 55
   000757      1  076100                     NEXT SENTENCE.                               NC2334.2
   000758         076200     SET     X1 TO 2.                                             NC2334.2 104
   000759         076300     SET     X2, X3, X4, X6 TO 1.                                 NC2334.2 110 116 122 134
   000760         076400     SEARCH  ALL GRP-7-7-ENTRY                                    NC2334.2 138
   000761      1  076500             AT END  GO TO MULT-SEARCH-7-FAIL-7                   NC2334.2 852
   000762         076600             WHEN ENTRY-7-7G (X1 X2 X3 X4 X5 X6 X7) = L7-HOLD     NC2334.2 141 104 110 116 122 128 134 140 56
   000763      1  076700                     NEXT SENTENCE.                               NC2334.2
   000764         076800                                                                  NC2334.2
   000765         076900     PERFORM PASS-TH.                                             NC2334.2 867
   000766         077000     GO TO   END-SEARCH-TEST.                                     NC2334.2 873
   000767         077100                                                                  NC2334.2
   000768         077200 MULT-SEARCH-7-FAIL-1.                                            NC2334.2
   000769         077300     MOVE    L1-HOLD TO CORRECT-A.                                NC2334.2 50 193
   000770         077400     IF      ENTRY-7-1 (2) = L1-HOLD                              NC2334.2 107 50
   000771      1  077500             MOVE   "IX-1" TO END-IDX                             NC2334.2 158
   000772      1  077600             SET     IDX-VALU TO X1                               NC2334.2 160 104
   000773      1  077700             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2334.2 173
   000774      1  077800             MOVE    END-STMT TO COMPUTED-A                       NC2334.2 156 179
   000775         077900     ELSE                                                         NC2334.2
   000776      1  078000             MOVE    ENTRY-7-1 (2) TO COMPUTED-A                  NC2334.2 107 179
   000777      1  078100             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2334.2 173
   000778         078200                                                                  NC2334.2
   000779         078300     PERFORM FAIL-TH.                                             NC2334.2 870
   000780         078400     GO TO   END-SEARCH-TEST.                                     NC2334.2 873
   000781         078500                                                                  NC2334.2
   000782         078600 MULT-SEARCH-7-FAIL-2.                                            NC2334.2
   000783         078700     MOVE    L2-HOLD TO CORRECT-A.                                NC2334.2 51 193
   000784         078800     IF      ENTRY-7-2 (2 1) = L1-HOLD                            NC2334.2 113 50
   000785      1  078900             MOVE   "X2" TO END-IDX                               NC2334.2 158
   000786      1  079000             SET     IDX-VALU TO X2                               NC2334.2 160 110
   000787      1  079100             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2334.2 173
   000788      1  079200             MOVE    END-STMT TO COMPUTED-A                       NC2334.2 156 179
   000789         079300     ELSE                                                         NC2334.2
   000790      1  079400             MOVE    ENTRY-7-2 (2 1) TO COMPUTED-A                NC2334.2 113 179
   000791      1  079500             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2334.2 173
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000792         079600                                                                  NC2334.2
   000793         079700     PERFORM FAIL-TH.                                             NC2334.2 870
   000794         079800     GO TO   END-SEARCH-TEST.                                     NC2334.2 873
   000795         079900                                                                  NC2334.2
   000796         080000 MULT-SEARCH-7-FAIL-3.                                            NC2334.2
   000797         080100     MOVE    L3-HOLD TO CORRECT-A.                                NC2334.2 52 193
   000798         080200     IF      ENTRY-7-3 (2 1 2) = L3-HOLD                          NC2334.2 119 52
   000799      1  080300             MOVE   "X3" TO END-IDX                               NC2334.2 158
   000800      1  080400             SET     IDX-VALU TO X3                               NC2334.2 160 116
   000801      1  080500             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2334.2 173
   000802      1  080600             MOVE    END-STMT TO COMPUTED-A                       NC2334.2 156 179
   000803         080700     ELSE                                                         NC2334.2
   000804      1  080800             MOVE    ENTRY-7-3 (2 1 2) TO COMPUTED-A              NC2334.2 119 179
   000805      1  080900             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2334.2 173
   000806         081000                                                                  NC2334.2
   000807         081100     PERFORM FAIL-TH.                                             NC2334.2 870
   000808         081200     GO TO   END-SEARCH-TEST.                                     NC2334.2 873
   000809         081300                                                                  NC2334.2
   000810         081400 MULT-SEARCH-7-FAIL-4.                                            NC2334.2
   000811         081500     MOVE    L4-HOLD TO CORRECT-A.                                NC2334.2 53 193
   000812         081600     IF      ENTRY-7-4 (2 1 2 1) = L4-HOLD                        NC2334.2 125 53
   000813      1  081700             MOVE   "X4" TO END-IDX                               NC2334.2 158
   000814      1  081800             SET     IDX-VALU TO X4                               NC2334.2 160 122
   000815      1  081900             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2334.2 173
   000816      1  082000             MOVE    END-STMT TO COMPUTED-A                       NC2334.2 156 179
   000817         082100     ELSE                                                         NC2334.2
   000818      1  082200             MOVE    ENTRY-7-4 (2 1 2 1) TO COMPUTED-A            NC2334.2 125 179
   000819      1  082300             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2334.2 173
   000820         082400                                                                  NC2334.2
   000821         082500     PERFORM FAIL-TH.                                             NC2334.2 870
   000822         082600     GO TO   END-SEARCH-TEST.                                     NC2334.2 873
   000823         082700                                                                  NC2334.2
   000824         082800 MULT-SEARCH-7-FAIL-5.                                            NC2334.2
   000825         082900     MOVE    L5-HOLD TO CORRECT-A.                                NC2334.2 54 193
   000826         083000     IF      ENTRY-7-5 (2 1 2 1 2) = L5-HOLD                      NC2334.2 131 54
   000827      1  083100             MOVE   "X5" TO END-IDX                               NC2334.2 158
   000828      1  083200             SET     IDX-VALU TO X5                               NC2334.2 160 128
   000829      1  083300             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2334.2 173
   000830      1  083400             MOVE    END-STMT TO COMPUTED-A                       NC2334.2 156 179
   000831         083500     ELSE                                                         NC2334.2
   000832      1  083600             MOVE    ENTRY-7-5 (2 1 2 1 2) TO COMPUTED-A          NC2334.2 131 179
   000833      1  083700             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2334.2 173
   000834         083800                                                                  NC2334.2
   000835         083900     PERFORM FAIL-TH.                                             NC2334.2 870
   000836         084000     GO TO   END-SEARCH-TEST.                                     NC2334.2 873
   000837         084100                                                                  NC2334.2
   000838         084200 MULT-SEARCH-7-FAIL-6.                                            NC2334.2
   000839         084300     MOVE    L6-HOLD TO CORRECT-A.                                NC2334.2 55 193
   000840         084400     IF      ENTRY-7-6 (2 1 2 1 2 1) = L6-HOLD                    NC2334.2 137 55
   000841      1  084500             MOVE   "X6" TO END-IDX                               NC2334.2 158
   000842      1  084600             SET     IDX-VALU TO X6                               NC2334.2 160 134
   000843      1  084700             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2334.2 173
   000844      1  084800             MOVE    END-STMT TO COMPUTED-A                       NC2334.2 156 179
   000845         084900     ELSE                                                         NC2334.2
   000846      1  085000             MOVE    ENTRY-7-6 (2 1 2 1 2 1) TO COMPUTED-A        NC2334.2 137 179
   000847      1  085100             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2334.2 173
   000848         085200                                                                  NC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000849         085300     PERFORM FAIL-TH.                                             NC2334.2 870
   000850         085400     GO TO   END-SEARCH-TEST.                                     NC2334.2 873
   000851         085500                                                                  NC2334.2
   000852         085600 MULT-SEARCH-7-FAIL-7.                                            NC2334.2
   000853         085700     MOVE    L7-HOLD TO CORRECT-A.                                NC2334.2 56 193
   000854         085800     IF      ENTRY-7-7 (2 1 2 1 2 1 2) = L6-HOLD                  NC2334.2 143 55
   000855      1  085900             MOVE   "X7" TO END-IDX                               NC2334.2 158
   000856      1  086000             SET     IDX-VALU TO X7                               NC2334.2 160 140
   000857      1  086100             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2334.2 173
   000858      1  086200             MOVE    END-STMT TO COMPUTED-A                       NC2334.2 156 179
   000859         086300     ELSE                                                         NC2334.2
   000860      1  086400             MOVE    ENTRY-7-7 (2 1 2 1 2 1 2) TO COMPUTED-A      NC2334.2 143 179
   000861      1  086500             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2334.2 173
   000862         086600                                                                  NC2334.2
   000863         086700     PERFORM FAIL-TH.                                             NC2334.2 870
   000864         086800                                                                  NC2334.2
   000865         086900     GO TO END-SEARCH-TEST.                                       NC2334.2 873
   000866         087000                                                                  NC2334.2
   000867         087100 PASS-TH.                                                         NC2334.2
   000868         087200     PERFORM PASS.                                                NC2334.2 318
   000869         087300     PERFORM PRINT-DETAIL.                                        NC2334.2 322
   000870         087400 FAIL-TH.                                                         NC2334.2
   000871         087500     PERFORM FAIL.                                                NC2334.2 319
   000872         087600     PERFORM  PRINT-DETAIL.                                       NC2334.2 322
   000873         087700 END-SEARCH-TEST.                                                 NC2334.2
   000874         087800     EXIT.                                                        NC2334.2
   000875         087900 CCVS-EXIT SECTION.                                               NC2334.2
   000876         088000 CCVS-999999.                                                     NC2334.2
   000877         088100     GO TO CLOSE-FILES.                                           NC2334.2 311
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    19
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       81   ADD-ELEM . . . . . . . . . . .  M438 M443
       66   ADD-GRP. . . . . . . . . . . .  M424
       72   ADD-SEC. . . . . . . . . . . .  M429 M433
      224   ANSI-REFERENCE . . . . . . . .  396 403 412 M686
      203   CCVS-C-1 . . . . . . . . . . .  340 382
      208   CCVS-C-2 . . . . . . . . . . .  341 383
      258   CCVS-E-1 . . . . . . . . . . .  346
      263   CCVS-E-2 . . . . . . . . . . .  355 362 369 374
      266   CCVS-E-2-2 . . . . . . . . . .  M354
      271   CCVS-E-3 . . . . . . . . . . .  375
      280   CCVS-E-4 . . . . . . . . . . .  354
      281   CCVS-E-4-1 . . . . . . . . . .  M352
      283   CCVS-E-4-2 . . . . . . . . . .  M353
      225   CCVS-H-1 . . . . . . . . . . .  335
      230   CCVS-H-2A. . . . . . . . . . .  336
      239   CCVS-H-2B. . . . . . . . . . .  337
      251   CCVS-H-3 . . . . . . . . . . .  338
      301   CCVS-PGM-ID. . . . . . . . . .  307 307
      106   CHARS-7-1. . . . . . . . . . .  M707
      112   CHARS-7-2. . . . . . . . . . .  M709
      118   CHARS-7-3. . . . . . . . . . .  M711
      124   CHARS-7-4. . . . . . . . . . .  M713
      130   CHARS-7-5. . . . . . . . . . .  M715
      136   CHARS-7-6. . . . . . . . . . .  M717
      142   CHARS-7-7. . . . . . . . . . .  M719
      185   CM-18V0
      179   COMPUTED-A . . . . . . . . . .  180 182 183 184 185 408 411 M466 M467 M567 M568 M641 M642 M666 M667 M678 M679
                                            M774 M776 M788 M790 M802 M804 M816 M818 M830 M832 M844 M846 M858 M860
      180   COMPUTED-N
      178   COMPUTED-X . . . . . . . . . .  M330 394
      182   COMPUTED-0V18
      184   COMPUTED-14V4
      186   COMPUTED-18V0
      183   COMPUTED-4V14
       44   CON-10
       46   CON-5
       48   CON-6
       43   CON-7
      202   COR-ANSI-REFERENCE . . . . . .  M403 M405
      193   CORRECT-A. . . . . . . . . . .  194 195 196 197 198 409 411 M461 M562 M636 M661 M673 M769 M783 M797 M811 M825
                                            M839 M853
      194   CORRECT-N
      192   CORRECT-X. . . . . . . . . . .  M331 395
      195   CORRECT-0V18
      197   CORRECT-14V4
      199   CORRECT-18V0
      196   CORRECT-4V14
      198   CR-18V0
      216   DELETE-COUNTER . . . . . . . .  M320 349 365 367
      171   DOTVALUE . . . . . . . . . . .  M325
      222   DUMMY-HOLD . . . . . . . . . .  M379 385
       38   DUMMY-RECORD . . . . . . . . .  M335 M336 M337 M338 M340 M341 M342 M344 M346 M355 M362 M369 M374 M375 379 M380
                                            381 M382 M383 M384 M385 389 M390 M398 M413
       98   ELEM . . . . . . . . . . . . .  94 580 600 614 630
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    20
0 Defined   Cross-reference of data names   References

0      77   ELEM-GRP . . . . . . . . . . .  M440
       49   ELEM-HOLD-AREA . . . . . . . .  M577 M596 M610 M620 636 637
       75   ELEM-NAME. . . . . . . . . . .  442
       79   ELEM-SEC . . . . . . . . . . .  M441
      158   END-IDX. . . . . . . . . . . .  M463 M564 M638 M663 M675 M771 M785 M799 M813 M827 M841 M855
      156   END-STMT . . . . . . . . . . .  466 567 641 666 678 774 788 802 816 830 844 858
      269   ENDER-DESC . . . . . . . . . .  M357 M368 M373
       87   ENTRY-1. . . . . . . . . . . .  M423 462 467 662 667
       91   ENTRY-2. . . . . . . . . . . .  M432 563 568 674 679
       96   ENTRY-3. . . . . . . . . . . .  M442 637 642
      107   ENTRY-7-1. . . . . . . . . . .  M706 770 776
      105   ENTRY-7-1G . . . . . . . . . .  103 727
      113   ENTRY-7-2. . . . . . . . . . .  M708 784 790
      111   ENTRY-7-2G . . . . . . . . . .  109 732
      119   ENTRY-7-3. . . . . . . . . . .  M710 798 804
      117   ENTRY-7-3G . . . . . . . . . .  115 738
      125   ENTRY-7-4. . . . . . . . . . .  M712 812 818
      123   ENTRY-7-4G . . . . . . . . . .  121 744
      131   ENTRY-7-5. . . . . . . . . . .  M714 826 832
      129   ENTRY-7-5G . . . . . . . . . .  127 750
      137   ENTRY-7-6. . . . . . . . . . .  M716 840 846
      135   ENTRY-7-6G . . . . . . . . . .  133 756
      143   ENTRY-7-7. . . . . . . . . . .  M718 854 860
      141   ENTRY-7-7G . . . . . . . . . .  139 762
      217   ERROR-COUNTER. . . . . . . . .  M319 348 358 361
      221   ERROR-HOLD . . . . . . . . . .  M348 M349 M349 M350 353
      267   ERROR-TOTAL. . . . . . . . . .  M359 M361 M366 M367 M371 M372
      164   FEATURE. . . . . . . . . . . .  M447 M507 M575 M649
       88   GRP. . . . . . . . . . . . . .  85 455 479 490 499 654
       85   GRP-ENTRY. . . . . . . . . . .  452 476 487 498 653
       45   GRP-HOLD-AREA. . . . . . . . .  M449 455 461 462 M473 479 M484 490 M495 499 M650 661 662
       64   GRP-NAME . . . . . . . . . . .  423
      102   GRP-7-1-ENTRY. . . . . . . . .  725
      108   GRP-7-2-ENTRY. . . . . . . . .  730
      114   GRP-7-3-ENTRY. . . . . . . . .  736
      120   GRP-7-4-ENTRY. . . . . . . . .  742
      126   GRP-7-5-ENTRY. . . . . . . . .  748
      132   GRP-7-6-ENTRY. . . . . . . . .  754
      138   GRP-7-7-ENTRY. . . . . . . . .  760
       89   GRP2-ENTRY . . . . . . . . . .  512 526 539 552 655
       94   GRP3-ENTRY . . . . . . . . . .  579 597 611 627
      295   HYPHEN-LINE. . . . . . . . . .  342 344 384
      261   ID-AGAIN . . . . . . . . . . .  M307
      160   IDX-VALU . . . . . . . . . . .  M464 M565 M639 M665 M676 M772 M786 M800 M814 M828 M842 M856
       86   IDX-1. . . . . . . . . . . . .  M451 455 464 M475 479 M486 490 M497 499 M511 515 M524 529 M536 542 M550 553 M578
                                            580 M593 600 M608 614 M624 630 M652 654 656 665
       90   IDX-2. . . . . . . . . . . . .  M511 515 M525 529 M537 542 M551 553 565 M578 580 M594 600 M608 614 M625 630 M652
                                            656 676
       95   IDX-3. . . . . . . . . . . . .  M578 580 M595 600 M609 614 M626 630 639
      294   INF-ANSI-REFERENCE . . . . . .  M396 M399 M412 M414
      289   INFO-TEXT. . . . . . . . . . .  M397
      218   INSPECT-COUNTER. . . . . . . .  M317 348 370 372
       50   L1-HOLD. . . . . . . . . . . .  M687 727 769 770 784
       51   L2-HOLD. . . . . . . . . . . .  M688 732 783
       52   L3-HOLD. . . . . . . . . . . .  M689 738 797 798
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    21
0 Defined   Cross-reference of data names   References

0      53   L4-HOLD. . . . . . . . . . . .  M690 744 811 812
       54   L5-HOLD. . . . . . . . . . . .  M691 750 825 826
       55   L6-HOLD. . . . . . . . . . . .  M692 756 839 840 854
       56   L7-HOLD. . . . . . . . . . . .  M693 762 853
      145   NOTE-1
      150   NOTE-2
       57   N1 . . . . . . . . . . . . . .  M696 696 706 706 707 708 709 710 711 712 713 714 715 716 717 718 719
       58   N2 . . . . . . . . . . . . . .  M697 697 708 708 709 710 711 712 713 714 715 716 717 718 719
       59   N3 . . . . . . . . . . . . . .  M698 698 710 710 711 712 713 714 715 716 717 718 719
       60   N4 . . . . . . . . . . . . . .  M699 699 712 712 713 714 715 716 717 718 719
       61   N5 . . . . . . . . . . . . . .  M700 700 714 714 715 716 717 718 719
       62   N6 . . . . . . . . . . . . . .  M701 701 716 716 717 718 719
       63   N7 . . . . . . . . . . . . . .  M702 702 718 718 719
      166   P-OR-F . . . . . . . . . . . .  M317 M318 M319 M320 327 M330
      168   PAR-NAME . . . . . . . . . . .  M332 M448 M472 M483 M494 M508 M520 M534 M546 M574 M589 M606 M619 M648 M685
      170   PARDOT-X . . . . . . . . . . .  M324
      219   PASS-COUNTER . . . . . . . . .  M318 350 352
       36   PRINT-FILE . . . . . . . . . .  32 306 312
       37   PRINT-REC. . . . . . . . . . .  M326 M402 M404
      173   RE-MARK. . . . . . . . . . . .  M321 M333 M465 M468 M566 M569 M640 M643 M664 M668 M677 M680 M773 M777 M787 M791
                                            M801 M805 M815 M819 M829 M833 M843 M847 M857 M861
      215   REC-CT . . . . . . . . . . . .  323 325 332
      214   REC-SKL-SUB
      223   RECORD-COUNT . . . . . . . . .  M377 378 M386
       93   SEC. . . . . . . . . . . . . .  89 515 529 542 553 656
       70   SEC-GRP. . . . . . . . . . . .  M431
       47   SEC-HOLD-AREA. . . . . . . . .  M509 M521 M535 M547 562 563 M651 673 674
       68   SEC-NAME . . . . . . . . . . .  432
       40   SUB-1. . . . . . . . . . . . .  M421 422 423 431 432 440 442 M510 M522 M538 M548 563 568 M576 M590 M607 M621
                                            637 642
       41   SUB-2. . . . . . . . . . . . .  M426 427 M428 432 441 442 M450 462 467 M474 M485 M496 M510 M523 M538 M549 563
                                            568 M576 M591 M607 M622 637 642
       42   SUB-3. . . . . . . . . . . . .  M435 436 M437 442 M576 M592 M607 M623 637 642
      174   TEST-COMPUTED. . . . . . . . .  402
      189   TEST-CORRECT . . . . . . . . .  404
      242   TEST-ID. . . . . . . . . . . .  M307
      162   TEST-RESULTS . . . . . . . . .  M308 326
      220   TOTAL-ERROR
      291   XXCOMPUTED . . . . . . . . . .  M411
      293   XXCORRECT. . . . . . . . . . .  M411
      286   XXINFO . . . . . . . . . . . .  398 413
      104   X1 . . . . . . . . . . . . . .  M694 727 M729 732 M734 738 M740 744 M746 750 M752 756 M758 762 772
      110   X2 . . . . . . . . . . . . . .  M694 732 M735 738 M741 744 M747 750 M753 756 M759 762 786
      116   X3 . . . . . . . . . . . . . .  M694 738 M741 744 M747 750 M753 756 M759 762 800
      122   X4 . . . . . . . . . . . . . .  M694 744 M747 750 M753 756 M759 762 814
      128   X5 . . . . . . . . . . . . . .  M694 750 M753 756 762 828
      134   X6 . . . . . . . . . . . . . .  M694 756 M759 762 842
      140   X7 . . . . . . . . . . . . . .  M694 762 856
       84   3-DIMENSION-TBL
      101   7-DIMENSION-TBL
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    22
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

      407   BAIL-OUT . . . . . . . . . . .  P329
      415   BAIL-OUT-EX. . . . . . . . . .  E329 G409
      410   BAIL-OUT-WRITE . . . . . . . .  G408
      391   BLANK-LINE-PRINT
      420   BUILD-LEVEL-1. . . . . . . . .  G430
      425   BUILD-LEVEL-2. . . . . . . . .  G439
      434   BUILD-LEVEL-3. . . . . . . . .  G444
      875   CCVS-EXIT
      876   CCVS-999999
      304   CCVS1
      416   CCVS1-EXIT . . . . . . . . . .  G310
      446   CHECK-ENTRIES. . . . . . . . .  G422
      311   CLOSE-FILES. . . . . . . . . .  G877
      339   COLUMN-NAMES-ROUTINE . . . . .  E309
      320   DE-LETE. . . . . . . . . . . .  P721
      635   ELEM-FAIL-PARA . . . . . . . .  P582 P598 P612 P628
      343   END-ROUTINE. . . . . . . . . .  P312
      347   END-ROUTINE-1
      356   END-ROUTINE-12
      364   END-ROUTINE-13 . . . . . . . .  E312
      345   END-RTN-EXIT
      873   END-SEARCH-TEST. . . . . . . .  G723 G766 G780 G794 G808 G822 G836 G850 G865
      319   FAIL . . . . . . . . . . . . .  P871
      393   FAIL-ROUTINE . . . . . . . . .  P328
      406   FAIL-ROUTINE-EX. . . . . . . .  E328 G400
      401   FAIL-ROUTINE-WRITE . . . . . .  G394 G395
      870   FAIL-TH. . . . . . . . . . . .  P470 P571 P645 P670 P682 P779 P793 P807 P821 P835 P849 P863
      460   GRP-FAIL-PARGRAPH. . . . . . .  P453 P477 P488 P500
      334   HEAD-ROUTINE . . . . . . . . .  P309
      317   INSPT
      471   LEVEL-1-TEST-2 . . . . . . . .  G454 G458
      482   LEVEL-1-TEST-3 . . . . . . . .  G478
      493   LEVEL-1-TEST-4 . . . . . . . .  G489
      506   LEVEL-2-TEST-1 . . . . . . . .  G501
      519   LEVEL-2-TEST-2 . . . . . . . .  G514
      533   LEVEL-2-TEST-3 . . . . . . . .  G528
      545   LEVEL-2-TEST-4 . . . . . . . .  G541
      573   LEVEL-3-TEST-1 . . . . . . . .  G555 G559
      588   LEVEL-3-TEST-2 . . . . . . . .  G583
      605   LEVEL-3-TEST-3 . . . . . . . .  G599
      618   LEVEL-3-TEST-4 . . . . . . . .  G613
      672   MULT-SEARCH-FAIL . . . . . . .  G655
      660   MULT-SEARCH-FAIL1. . . . . . .  G653
      647   MULT-SEARCH-TEST-1 . . . . . .  G629 G634
      720   MULT-SEARCH-7-DELETE-3
      768   MULT-SEARCH-7-FAIL-1 . . . . .  G726
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    23
0 Defined   Cross-reference of procedures   References

0     782   MULT-SEARCH-7-FAIL-2 . . . . .  G731
      796   MULT-SEARCH-7-FAIL-3 . . . . .  G737
      810   MULT-SEARCH-7-FAIL-4 . . . . .  G743
      824   MULT-SEARCH-7-FAIL-5 . . . . .  G749
      838   MULT-SEARCH-7-FAIL-6 . . . . .  G755
      852   MULT-SEARCH-7-FAIL-7 . . . . .  G761
      684   MULT-SEARCH-7-INIT-3 . . . . .  G659 G671
      704   MULT-SEARCH-7-INIT-3-A . . . .  P695
      724   MULT-SEARCH-7-TEST-3 . . . . .  G703
      305   OPEN-FILES
      318   PASS . . . . . . . . . . . . .  P868
      867   PASS-TH. . . . . . . . . . . .  P457 P481 P492 P504 P517 P531 P544 P558 P586 P603 P617 P633 P658 P765
      502   PASS-TH-TEST-4 . . . . . . . .  G499
      556   PASS-TH-2-4. . . . . . . . . .  G553
      584   PASS-TH-3-1. . . . . . . . . .  G581
      322   PRINT-DETAIL . . . . . . . . .  P722 P869 P872
      561   SEC-FAIL-PARGRAF . . . . . . .  P513 P527 P540 P554
      418   SECT-NC233A-001
      315   TERMINATE-CALL
      313   TERMINATE-CCVS
      419   TH-05-001
      376   WRITE-LINE . . . . . . . . . .  P326 P327 P335 P336 P337 P338 P340 P341 P342 P344 P346 P355 P363 P369 P374 P375
                                            P398 P402 P404 P413
      388   WRT-LN . . . . . . . . . . . .  P382 P383 P384 P387 P392
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    24
0 Defined   Cross-reference of programs     References

        3   NC233A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC233A    Date 06/04/2022  Time 12:00:01   Page    25
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    420  IGYPS2015-I   The paragraph or section prior to paragraph or section "BUILD-LEVEL-1" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC233A:
 *    Source records = 877
 *    Data Division statements = 140
 *    Procedure Division statements = 458
 *    Generated COBOL statements = 0
 *    Program complexity factor = 469
0End of compilation 1,  program NC233A,  highest severity 0.
0Return code 0
