1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:24   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:24   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2314.2
   000002         000200 PROGRAM-ID.                                                      NC2314.2
   000003         000300     NC231A.                                                      NC2314.2
   000004         000500*                                                              *  NC2314.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2314.2
   000006         000700*                                                              *  NC2314.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2314.2
   000008         000900*                                                              *  NC2314.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2314.2
   000010         001100*                                                              *  NC2314.2
   000011         001300*                                                              *  NC2314.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2314.2
   000013         001500*                                                              *  NC2314.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2314.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2314.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2314.2
   000017         001900*                                                              *  NC2314.2
   000018         002100*                                                              *  NC2314.2
   000019         002200*    PROGRAM NC231A USES FORMAT 1 OF THE "SEARCH" STATEMENT TO *  NC2314.2
   000020         002300*    ACCESS THREE AND SEVEN DIMENSIONAL TABLES.                *  NC2314.2
   000021         002400*    THE OPTIONAL "VARYING" PHRASE IS USED WITH AN IDENTIFIER. *  NC2314.2
   000022         002500*    THE SCOPE TERMINATOR "END-SEARCH" IS ALSO TESTED.         *  NC2314.2
   000023         002600*                                                              *  NC2314.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2314.2
   000025         002900 CONFIGURATION SECTION.                                           NC2314.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2314.2
   000027         003100     XXXXX082.                                                    NC2314.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2314.2
   000029         003300     XXXXX083.                                                    NC2314.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2314.2
   000031         003500 FILE-CONTROL.                                                    NC2314.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2314.2 36
   000033         003700     XXXXX055.                                                    NC2314.2
   000034         003800 DATA DIVISION.                                                   NC2314.2
   000035         003900 FILE SECTION.                                                    NC2314.2
   000036         004000 FD  PRINT-FILE.                                                  NC2314.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2314.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2314.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2314.2
   000040         004400 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC2314.2 IMP
   000041         004500 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC2314.2 IMP
   000042         004600 77  SUB-3              PICTURE 99   VALUE ZERO.                  NC2314.2 IMP
   000043         004700 77  CON-7              PICTURE 99   VALUE 07.                    NC2314.2
   000044         004800 77  CON-10             PICTURE 99   VALUE 10.                    NC2314.2
   000045         004900 77  GRP-HOLD-AREA                PICTURE X(5) VALUE SPACES.      NC2314.2 IMP
   000046         005000 77  CON-5              PICTURE 99  VALUE 05.                     NC2314.2
   000047         005100 77  SEC-HOLD-AREA                PICTURE X(11) VALUE SPACES.     NC2314.2 IMP
   000048         005200 77  CON-6              PICTURE 99  VALUE 06.                     NC2314.2
   000049         005300 77  ELEM-HOLD-AREA               PICTURE X(15)  VALUE SPACES.    NC2314.2 IMP
   000050         005400 77  L1-HOLD                     PIC XX.                          NC2314.2
   000051         005500 77  L2-HOLD                     PIC XX.                          NC2314.2
   000052         005600 77  L3-HOLD                     PIC XX.                          NC2314.2
   000053         005700 77  L4-HOLD                     PIC XX.                          NC2314.2
   000054         005800 77  L5-HOLD                     PIC XX.                          NC2314.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  L6-HOLD                     PIC XX.                          NC2314.2
   000056         006000 77  L7-HOLD                     PIC XX.                          NC2314.2
   000057         006100 77  N1                         PIC 99.                           NC2314.2
   000058         006200 77  N2                         PIC 99.                           NC2314.2
   000059         006300 77  N3                         PIC 99.                           NC2314.2
   000060         006400 77  N4                         PIC 99.                           NC2314.2
   000061         006500 77  N5                         PIC 99.                           NC2314.2
   000062         006600 77  N6                         PIC 99.                           NC2314.2
   000063         006700 77  N7                         PIC 99.                           NC2314.2
   000064         006800 01  GRP-NAME.                                                    NC2314.2
   000065         006900     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2314.2
   000066         007000     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2314.2
   000067         007100                                                                  NC2314.2
   000068         007200 01  SEC-NAME.                                                    NC2314.2
   000069         007300     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2314.2
   000070         007400     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2314.2
   000071         007500     02  FILLER              PICTURE X      VALUE ",".            NC2314.2
   000072         007600     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2314.2
   000073         007700     02  FILLER              PICTURE X      VALUE ")".            NC2314.2
   000074         007800                                                                  NC2314.2
   000075         007900 01  ELEM-NAME.                                                   NC2314.2
   000076         008000     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2314.2
   000077         008100     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2314.2
   000078         008200     02  FILLER              PICTURE X      VALUE ",".            NC2314.2
   000079         008300     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2314.2
   000080         008400     02  FILLER              PICTURE X      VALUE ",".            NC2314.2
   000081         008500     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2314.2
   000082         008600     02  FILLER              PICTURE X      VALUE ")".            NC2314.2
   000083         008700                                                                  NC2314.2
   000084         008800                                                                  NC2314.2
   000085         008900 01  3-DIMENSION-TBL.                                             NC2314.2
   000086         009000     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2314.2
   000087         009100         03  ENTRY-1         PICTURE X(5).                        NC2314.2
   000088         009200         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2314.2
   000089         009300             04  ENTRY-2     PICTURE X(11).                       NC2314.2
   000090         009400             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC2314.2
   000091         009500                 05  ENTRY-3 PICTURE X(15).                       NC2314.2
   000092         009600                                                                  NC2314.2
   000093         009700 01  7-DIMENSION-TBL.                                             NC2314.2
   000094         009800   02  GRP-7-1-ENTRY             OCCURS 2 INDEXED BY IX-1.        NC2314.2
   000095         009900     03  ENTRY-7-1               PIC XX.                          NC2314.2
   000096         010000     03  GRP-7-2-ENTRY           OCCURS 2 INDEXED BY IX-2.        NC2314.2
   000097         010100       04  ENTRY-7-2             PIC XX.                          NC2314.2
   000098         010200       04  GRP-7-3-ENTRY         OCCURS 2 INDEXED BY IX-3.        NC2314.2
   000099         010300         05  ENTRY-7-3           PIC XX.                          NC2314.2
   000100         010400         05  GRP-7-4-ENTRY       OCCURS 2 INDEXED BY IX-4.        NC2314.2
   000101         010500           06  ENTRY-7-4         PIC XX.                          NC2314.2
   000102         010600           06  GRP-7-5-ENTRY     OCCURS 2 INDEXED BY IX-5.        NC2314.2
   000103         010700             07  ENTRY-7-5       PIC XX.                          NC2314.2
   000104         010800             07  GRP-7-6-ENTRY   OCCURS 2 INDEXED BY IX-6.        NC2314.2
   000105         010900               08  ENTRY-7-6     PIC XX.                          NC2314.2
   000106         011000               08  GRP-7-7-ENTRY OCCURS 2 INDEXED BY IX-7.        NC2314.2
   000107         011100                 09  ENTRY-7-7   PIC XX.                          NC2314.2
   000108         011200                                                                  NC2314.2
   000109         011300 01  END-STMT.                                                    NC2314.2
   000110         011400     02  FILLER                   PICTURE X(7) VALUE "AT END ".   NC2314.2
   000111         011500     02  END-IDX                  PICTURE X(5) VALUE SPACES.      NC2314.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02  FILLER                   PICTURE XXX  VALUE " = ".       NC2314.2
   000113         011700     02  IDX-VALU                 PICTURE 99  VALUE 00.           NC2314.2
   000114         011800     02  FILLER                   PICTURE XXX  VALUE SPACES.      NC2314.2 IMP
   000115         011900                                                                  NC2314.2
   000116         012000 01  NOTE-1.                                                      NC2314.2
   000117         012100     02  FILLER                   PICTURE X(74)  VALUE            NC2314.2
   000118         012200     "NOTE 1 - CORRECT AND COMPUTED DATA ARE EQUAL BUT THE AT END NC2314.2
   000119         012300-     "PATH WAS TAKEN".                                           NC2314.2
   000120         012400     02  FILLER                   PICTURE X(46)  VALUE SPACE.     NC2314.2 IMP
   000121         012500                                                                  NC2314.2
   000122         012600 01  NOTE-2.                                                      NC2314.2
   000123         012700     02  FILLER                   PICTURE X(112)  VALUE           NC2314.2
   000124         012800     "NOTE 2 - CORRECT AND COMPUTED DATA ARE NOT EQUAL. THE COMPUTNC2314.2
   000125         012900-    "ED ENTRY WAS EXTRACTED FROM THE TABLE BY SUBSCRIPTS.".      NC2314.2
   000126         013000     02  FILLER                   PICTURE X(8)  VALUE SPACE.      NC2314.2 IMP
   000127         013100                                                                  NC2314.2
   000128         013200 01  TEST-RESULTS.                                                NC2314.2
   000129         013300     02 FILLER                   PIC X      VALUE SPACE.          NC2314.2 IMP
   000130         013400     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2314.2 IMP
   000131         013500     02 FILLER                   PIC X      VALUE SPACE.          NC2314.2 IMP
   000132         013600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2314.2 IMP
   000133         013700     02 FILLER                   PIC X      VALUE SPACE.          NC2314.2 IMP
   000134         013800     02  PAR-NAME.                                                NC2314.2
   000135         013900       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2314.2 IMP
   000136         014000       03  PARDOT-X              PIC X      VALUE SPACE.          NC2314.2 IMP
   000137         014100       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2314.2 IMP
   000138         014200     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2314.2 IMP
   000139         014300     02 RE-MARK                  PIC X(61).                       NC2314.2
   000140         014400 01  TEST-COMPUTED.                                               NC2314.2
   000141         014500     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2314.2 IMP
   000142         014600     02 FILLER                   PIC X(17)  VALUE                 NC2314.2
   000143         014700            "       COMPUTED=".                                   NC2314.2
   000144         014800     02 COMPUTED-X.                                               NC2314.2
   000145         014900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2314.2 IMP
   000146         015000     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2314.2 145
   000147         015100                                 PIC -9(9).9(9).                  NC2314.2
   000148         015200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2314.2 145
   000149         015300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2314.2 145
   000150         015400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2314.2 145
   000151         015500     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2314.2 145
   000152         015600         04 COMPUTED-18V0                    PIC -9(18).          NC2314.2
   000153         015700         04 FILLER                           PIC X.               NC2314.2
   000154         015800     03 FILLER PIC X(50) VALUE SPACE.                             NC2314.2 IMP
   000155         015900 01  TEST-CORRECT.                                                NC2314.2
   000156         016000     02 FILLER PIC X(30) VALUE SPACE.                             NC2314.2 IMP
   000157         016100     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2314.2
   000158         016200     02 CORRECT-X.                                                NC2314.2
   000159         016300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2314.2 IMP
   000160         016400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2314.2 159
   000161         016500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2314.2 159
   000162         016600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2314.2 159
   000163         016700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2314.2 159
   000164         016800     03      CR-18V0 REDEFINES CORRECT-A.                         NC2314.2 159
   000165         016900         04 CORRECT-18V0                     PIC -9(18).          NC2314.2
   000166         017000         04 FILLER                           PIC X.               NC2314.2
   000167         017100     03 FILLER PIC X(2) VALUE SPACE.                              NC2314.2 IMP
   000168         017200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2314.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  CCVS-C-1.                                                    NC2314.2
   000170         017400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2314.2
   000171         017500-    "SS  PARAGRAPH-NAME                                          NC2314.2
   000172         017600-    "       REMARKS".                                            NC2314.2
   000173         017700     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2314.2 IMP
   000174         017800 01  CCVS-C-2.                                                    NC2314.2
   000175         017900     02 FILLER                     PIC X        VALUE SPACE.      NC2314.2 IMP
   000176         018000     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2314.2
   000177         018100     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2314.2 IMP
   000178         018200     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2314.2
   000179         018300     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2314.2 IMP
   000180         018400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2314.2 IMP
   000181         018500 01  REC-CT                        PIC 99       VALUE ZERO.       NC2314.2 IMP
   000182         018600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2314.2 IMP
   000183         018700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2314.2 IMP
   000184         018800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2314.2 IMP
   000185         018900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2314.2 IMP
   000186         019000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2314.2 IMP
   000187         019100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2314.2 IMP
   000188         019200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2314.2 IMP
   000189         019300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2314.2 IMP
   000190         019400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2314.2 IMP
   000191         019500 01  CCVS-H-1.                                                    NC2314.2
   000192         019600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2314.2 IMP
   000193         019700     02  FILLER                    PIC X(42)    VALUE             NC2314.2
   000194         019800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2314.2
   000195         019900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2314.2 IMP
   000196         020000 01  CCVS-H-2A.                                                   NC2314.2
   000197         020100   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2314.2 IMP
   000198         020200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2314.2
   000199         020300   02  FILLER                        PIC XXXX   VALUE             NC2314.2
   000200         020400     "4.2 ".                                                      NC2314.2
   000201         020500   02  FILLER                        PIC X(28)  VALUE             NC2314.2
   000202         020600            " COPY - NOT FOR DISTRIBUTION".                       NC2314.2
   000203         020700   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2314.2 IMP
   000204         020800                                                                  NC2314.2
   000205         020900 01  CCVS-H-2B.                                                   NC2314.2
   000206         021000   02  FILLER                        PIC X(15)  VALUE             NC2314.2
   000207         021100            "TEST RESULT OF ".                                    NC2314.2
   000208         021200   02  TEST-ID                       PIC X(9).                    NC2314.2
   000209         021300   02  FILLER                        PIC X(4)   VALUE             NC2314.2
   000210         021400            " IN ".                                               NC2314.2
   000211         021500   02  FILLER                        PIC X(12)  VALUE             NC2314.2
   000212         021600     " HIGH       ".                                              NC2314.2
   000213         021700   02  FILLER                        PIC X(22)  VALUE             NC2314.2
   000214         021800            " LEVEL VALIDATION FOR ".                             NC2314.2
   000215         021900   02  FILLER                        PIC X(58)  VALUE             NC2314.2
   000216         022000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2314.2
   000217         022100 01  CCVS-H-3.                                                    NC2314.2
   000218         022200     02  FILLER                      PIC X(34)  VALUE             NC2314.2
   000219         022300            " FOR OFFICIAL USE ONLY    ".                         NC2314.2
   000220         022400     02  FILLER                      PIC X(58)  VALUE             NC2314.2
   000221         022500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2314.2
   000222         022600     02  FILLER                      PIC X(28)  VALUE             NC2314.2
   000223         022700            "  COPYRIGHT   1985 ".                                NC2314.2
   000224         022800 01  CCVS-E-1.                                                    NC2314.2
   000225         022900     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2314.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2314.2
   000227         023100     02 ID-AGAIN                     PIC X(9).                    NC2314.2
   000228         023200     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2314.2 IMP
   000229         023300 01  CCVS-E-2.                                                    NC2314.2
   000230         023400     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2314.2 IMP
   000231         023500     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2314.2 IMP
   000232         023600     02 CCVS-E-2-2.                                               NC2314.2
   000233         023700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2314.2 IMP
   000234         023800         03 FILLER                   PIC X      VALUE SPACE.      NC2314.2 IMP
   000235         023900         03 ENDER-DESC               PIC X(44)  VALUE             NC2314.2
   000236         024000            "ERRORS ENCOUNTERED".                                 NC2314.2
   000237         024100 01  CCVS-E-3.                                                    NC2314.2
   000238         024200     02  FILLER                      PIC X(22)  VALUE             NC2314.2
   000239         024300            " FOR OFFICIAL USE ONLY".                             NC2314.2
   000240         024400     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2314.2 IMP
   000241         024500     02  FILLER                      PIC X(58)  VALUE             NC2314.2
   000242         024600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2314.2
   000243         024700     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2314.2 IMP
   000244         024800     02 FILLER                       PIC X(15)  VALUE             NC2314.2
   000245         024900             " COPYRIGHT 1985".                                   NC2314.2
   000246         025000 01  CCVS-E-4.                                                    NC2314.2
   000247         025100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2314.2 IMP
   000248         025200     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2314.2
   000249         025300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2314.2 IMP
   000250         025400     02 FILLER                       PIC X(40)  VALUE             NC2314.2
   000251         025500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2314.2
   000252         025600 01  XXINFO.                                                      NC2314.2
   000253         025700     02 FILLER                       PIC X(19)  VALUE             NC2314.2
   000254         025800            "*** INFORMATION ***".                                NC2314.2
   000255         025900     02 INFO-TEXT.                                                NC2314.2
   000256         026000       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2314.2 IMP
   000257         026100       04 XXCOMPUTED                 PIC X(20).                   NC2314.2
   000258         026200       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2314.2 IMP
   000259         026300       04 XXCORRECT                  PIC X(20).                   NC2314.2
   000260         026400     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2314.2
   000261         026500 01  HYPHEN-LINE.                                                 NC2314.2
   000262         026600     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2314.2 IMP
   000263         026700     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2314.2
   000264         026800-    "*****************************************".                 NC2314.2
   000265         026900     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2314.2
   000266         027000-    "******************************".                            NC2314.2
   000267         027100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2314.2
   000268         027200     "NC231A".                                                    NC2314.2
   000269         027300 PROCEDURE DIVISION.                                              NC2314.2
   000270         027400 CCVS1 SECTION.                                                   NC2314.2
   000271         027500 OPEN-FILES.                                                      NC2314.2
   000272         027600     OPEN     OUTPUT PRINT-FILE.                                  NC2314.2 36
   000273         027700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2314.2 267 208 267 227
   000274         027800     MOVE    SPACE TO TEST-RESULTS.                               NC2314.2 IMP 128
   000275         027900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2314.2 300 305
   000276         028000     GO TO CCVS1-EXIT.                                            NC2314.2 382
   000277         028100 CLOSE-FILES.                                                     NC2314.2
   000278         028200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2314.2 309 330 36
   000279         028300 TERMINATE-CCVS.                                                  NC2314.2
   000280         028400     EXIT PROGRAM.                                                NC2314.2
   000281         028500 TERMINATE-CALL.                                                  NC2314.2
   000282         028600     STOP     RUN.                                                NC2314.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2314.2 132 184
   000284         028800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2314.2 132 185
   000285         028900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2314.2 132 183
   000286         029000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2314.2 132 182
   000287         029100     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2314.2 139
   000288         029200 PRINT-DETAIL.                                                    NC2314.2
   000289         029300     IF REC-CT NOT EQUAL TO ZERO                                  NC2314.2 181 IMP
   000290      1  029400             MOVE "." TO PARDOT-X                                 NC2314.2 136
   000291      1  029500             MOVE REC-CT TO DOTVALUE.                             NC2314.2 181 137
   000292         029600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2314.2 128 37 342
   000293         029700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2314.2 132 342
   000294      1  029800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2314.2 359 372
   000295      1  029900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2314.2 373 381
   000296         030000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2314.2 IMP 132 IMP 144
   000297         030100     MOVE SPACE TO CORRECT-X.                                     NC2314.2 IMP 158
   000298         030200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2314.2 181 IMP IMP 134
   000299         030300     MOVE     SPACE TO RE-MARK.                                   NC2314.2 IMP 139
   000300         030400 HEAD-ROUTINE.                                                    NC2314.2
   000301         030500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2314.2 191 38 342
   000302         030600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2314.2 196 38 342
   000303         030700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2314.2 205 38 342
   000304         030800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2314.2 217 38 342
   000305         030900 COLUMN-NAMES-ROUTINE.                                            NC2314.2
   000306         031000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2314.2 169 38 342
   000307         031100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2314.2 174 38 342
   000308         031200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2314.2 261 38 342
   000309         031300 END-ROUTINE.                                                     NC2314.2
   000310         031400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2314.2 261 38 342
   000311         031500 END-RTN-EXIT.                                                    NC2314.2
   000312         031600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2314.2 224 38 342
   000313         031700 END-ROUTINE-1.                                                   NC2314.2
   000314         031800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2314.2 183 187 184
   000315         031900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2314.2 187 182 187
   000316         032000      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2314.2 185 187
   000317         032100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2314.2
   000318         032200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2314.2 185 247
   000319         032300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2314.2 187 249
   000320         032400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2314.2 246 232
   000321         032500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2314.2 229 38 342
   000322         032600  END-ROUTINE-12.                                                 NC2314.2
   000323         032700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2314.2 235
   000324         032800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2314.2 183 IMP
   000325      1  032900         MOVE "NO " TO ERROR-TOTAL                                NC2314.2 233
   000326         033000         ELSE                                                     NC2314.2
   000327      1  033100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2314.2 183 233
   000328         033200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2314.2 229 38
   000329         033300     PERFORM WRITE-LINE.                                          NC2314.2 342
   000330         033400 END-ROUTINE-13.                                                  NC2314.2
   000331         033500     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2314.2 182 IMP
   000332      1  033600         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2314.2 233
   000333      1  033700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2314.2 182 233
   000334         033800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2314.2 235
   000335         033900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2314.2 229 38 342
   000336         034000      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2314.2 184 IMP
   000337      1  034100          MOVE "NO " TO ERROR-TOTAL                               NC2314.2 233
   000338      1  034200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2314.2 184 233
   000339         034300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2314.2 235
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2314.2 229 38 342
   000341         034500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2314.2 237 38 342
   000342         034600 WRITE-LINE.                                                      NC2314.2
   000343         034700     ADD 1 TO RECORD-COUNT.                                       NC2314.2 189
   000344         034800     IF RECORD-COUNT GREATER 50                                   NC2314.2 189
   000345      1  034900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2314.2 38 188
   000346      1  035000         MOVE SPACE TO DUMMY-RECORD                               NC2314.2 IMP 38
   000347      1  035100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2314.2 38
   000348      1  035200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2314.2 169 38 354
   000349      1  035300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2314.2 174 38 354
   000350      1  035400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2314.2 261 38 354
   000351      1  035500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2314.2 188 38
   000352      1  035600         MOVE ZERO TO RECORD-COUNT.                               NC2314.2 IMP 189
   000353         035700     PERFORM WRT-LN.                                              NC2314.2 354
   000354         035800 WRT-LN.                                                          NC2314.2
   000355         035900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2314.2 38
   000356         036000     MOVE SPACE TO DUMMY-RECORD.                                  NC2314.2 IMP 38
   000357         036100 BLANK-LINE-PRINT.                                                NC2314.2
   000358         036200     PERFORM WRT-LN.                                              NC2314.2 354
   000359         036300 FAIL-ROUTINE.                                                    NC2314.2
   000360         036400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2314.2 144 IMP 367
   000361         036500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2314.2 158 IMP 367
   000362         036600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2314.2 190 260
   000363         036700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2314.2 255
   000364         036800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2314.2 252 38 342
   000365         036900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2314.2 IMP 260
   000366         037000     GO TO  FAIL-ROUTINE-EX.                                      NC2314.2 372
   000367         037100 FAIL-ROUTINE-WRITE.                                              NC2314.2
   000368         037200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2314.2 140 37 342
   000369         037300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2314.2 190 168
   000370         037400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2314.2 155 37 342
   000371         037500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2314.2 IMP 168
   000372         037600 FAIL-ROUTINE-EX. EXIT.                                           NC2314.2
   000373         037700 BAIL-OUT.                                                        NC2314.2
   000374         037800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2314.2 145 IMP 376
   000375         037900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2314.2 159 IMP 381
   000376         038000 BAIL-OUT-WRITE.                                                  NC2314.2
   000377         038100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2314.2 159 259 145 257
   000378         038200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2314.2 190 260
   000379         038300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2314.2 252 38 342
   000380         038400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2314.2 IMP 260
   000381         038500 BAIL-OUT-EX. EXIT.                                               NC2314.2
   000382         038600 CCVS1-EXIT.                                                      NC2314.2
   000383         038700     EXIT.                                                        NC2314.2
   000384         038800 SECT-NC231A-001 SECTION.                                         NC2314.2
   000385         038900 TH-01-001.                                                       NC2314.2
   000386         039000     MOVE   "VI-2 1.3.4" TO ANSI-REFERENCE.                       NC2314.2 190
   000387         039100     PERFORM PARA-1 VARYING SUB-1 FROM 1 BY 1                     NC2314.2 393 40
   000388         039200         UNTIL SUB-1 EQUAL TO 11                                  NC2314.2 40
   000389         039300         AFTER SUB-2 FROM 1 BY 1 UNTIL SUB-2 EQUAL TO 11          NC2314.2 41 41
   000390         039400         AFTER SUB-3 FROM 1 BY 1 UNTIL SUB-3 EQUAL TO 11          NC2314.2 42 42
   000391         039500     GO TO CHECK-ENTRIES.                                         NC2314.2 404
   000392         039600                                                                  NC2314.2
   000393         039700 PARA-1.                                                          NC2314.2
   000394         039800     SET IDX-1 TO SUB-1.                                          NC2314.2 86 40
   000395         039900     SET IDX-2 TO SUB-2.                                          NC2314.2 88 41
   000396         040000     SET IDX-3 TO SUB-3.                                          NC2314.2 90 42
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     SET ADD-GRP, SEC-GRP, ELEM-GRP TO IDX-1.                     NC2314.2 66 70 77 86
   000398         040200     MOVE GRP-NAME TO ENTRY-1 (IDX-1).                            NC2314.2 64 87 86
   000399         040300     SET ADD-SEC, ELEM-SEC TO IDX-2.                              NC2314.2 72 79 88
   000400         040400     MOVE SEC-NAME TO ENTRY-2 (IDX-1, IDX-2).                     NC2314.2 68 89 86 88
   000401         040500     SET ADD-ELEM TO IDX-3.                                       NC2314.2 81 90
   000402         040600     MOVE ELEM-NAME TO ENTRY-3 (IDX-1, IDX-2, IDX-3).             NC2314.2 75 91 86 88 90
   000403         040700                                                                  NC2314.2
   000404         040800 CHECK-ENTRIES.                                                   NC2314.2
   000405         040900     MOVE "SEARCH VARYING LEV 1" TO FEATURE.                      NC2314.2 130
   000406         041000     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC2314.2 134
   000407         041100     MOVE "GRP02" TO GRP-HOLD-AREA.                               NC2314.2 45
   000408         041200     MOVE 02 TO SUB-2.                                            NC2314.2 41
   000409         041300     MOVE 01 TO CON-5.                                            NC2314.2 46
   000410         041400     SET IDX-1 TO 01.                                             NC2314.2 86
   000411         041500     SEARCH GRP-ENTRY VARYING CON-5 AT END                        NC2314.2 86 46
   000412      1  041600         PERFORM GRP-FAIL-PARGRAPH                                NC2314.2 419
   000413      1  041700         GO TO LEVEL-1-TEST-2                                     NC2314.2 430
   000414      1  041800         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.      NC2314.2 87 86 45
   000415         041900                                                                  NC2314.2
   000416         042000     PERFORM PASS-TH.                                             NC2314.2 1096
   000417         042100     GO TO LEVEL-1-TEST-2.                                        NC2314.2 430
   000418         042200                                                                  NC2314.2
   000419         042300 GRP-FAIL-PARGRAPH.                                               NC2314.2
   000420         042400     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2314.2 45 159
   000421         042500     IF ENTRY-1 (SUB-2) NOT EQUAL TO GRP-HOLD-AREA                NC2314.2 87 41 45
   000422      1  042600         MOVE ENTRY-1 (SUB-2) TO COMPUTED-A                       NC2314.2 87 41 145
   000423      1  042700         MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK  ELSE      NC2314.2 139
   000424      1  042800     MOVE "IDX-1" TO END-IDX                                      NC2314.2 111
   000425      1  042900     SET IDX-VALU TO IDX-1                                        NC2314.2 113 86
   000426      1  043000     MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK                NC2314.2 139
   000427      1  043100     MOVE END-STMT TO COMPUTED-A.                                 NC2314.2 109 145
   000428         043200                                                                  NC2314.2
   000429         043300     PERFORM FAIL-TH.                                             NC2314.2 1099
   000430         043400 LEVEL-1-TEST-2.                                                  NC2314.2
   000431         043500     MOVE "LEVEL-1-TEST-2      " TO PAR-NAME.                     NC2314.2 134
   000432         043600     MOVE "GRP01" TO GRP-HOLD-AREA.                               NC2314.2 45
   000433         043700     MOVE 01 TO SUB-2.                                            NC2314.2 41
   000434         043800     MOVE 01 TO CON-5.                                            NC2314.2 46
   000435         043900     SET IDX-1 TO 01.                                             NC2314.2 86
   000436         044000     SEARCH GRP-ENTRY VARYING CON-5 AT END                        NC2314.2 86 46
   000437      1  044100         PERFORM GRP-FAIL-PARGRAPH                                NC2314.2 419
   000438      1  044200         GO TO LEVEL-1-TEST-3                                     NC2314.2 442
   000439      1  044300         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.      NC2314.2 87 86 45
   000440         044400                                                                  NC2314.2
   000441         044500     PERFORM PASS-TH.                                             NC2314.2 1096
   000442         044600 LEVEL-1-TEST-3.                                                  NC2314.2
   000443         044700     MOVE "LEVEL-1-TEST-3      " TO PAR-NAME.                     NC2314.2 134
   000444         044800     MOVE "GRP10" TO GRP-HOLD-AREA.                               NC2314.2 45
   000445         044900     MOVE 10 TO SUB-2.                                            NC2314.2 41
   000446         045000     MOVE 01 TO CON-5.                                            NC2314.2 46
   000447         045100     SET IDX-1 TO 01.                                             NC2314.2 86
   000448         045200     SEARCH GRP-ENTRY VARYING CON-5 AT END                        NC2314.2 86 46
   000449      1  045300         PERFORM GRP-FAIL-PARGRAPH                                NC2314.2 419
   000450      1  045400         GO TO LEVEL-1-TEST-4                                     NC2314.2 454
   000451      1  045500         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.      NC2314.2 87 86 45
   000452         045600                                                                  NC2314.2
   000453         045700     PERFORM PASS-TH.                                             NC2314.2 1096
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800 LEVEL-1-TEST-4.                                                  NC2314.2
   000455         045900     MOVE "LEVEL-1-TEST-4      " TO PAR-NAME.                     NC2314.2 134
   000456         046000     MOVE "GRP05" TO GRP-HOLD-AREA.                               NC2314.2 45
   000457         046100     MOVE 05 TO SUB-2.                                            NC2314.2 41
   000458         046200     MOVE 05 TO CON-5.                                            NC2314.2 46
   000459         046300     SET IDX-1 TO 05.                                             NC2314.2 86
   000460         046400     SEARCH GRP-ENTRY VARYING CON-5 WHEN ENTRY-1 (CON-5)          NC2314.2 86 46 87 46
   000461      1  046500         EQUAL TO GRP-HOLD-AREA GO TO PASS-TH-TEST-4.             NC2314.2 45 464
   000462         046600     PERFORM GRP-FAIL-PARGRAPH.                                   NC2314.2 419
   000463         046700     GO TO LEVEL-2-TEST-1.                                        NC2314.2 468
   000464         046800 PASS-TH-TEST-4.                                                  NC2314.2
   000465         046900                                                                  NC2314.2
   000466         047000     PERFORM PASS-TH.                                             NC2314.2 1096
   000467         047100                                                                  NC2314.2
   000468         047200 LEVEL-2-TEST-1.                                                  NC2314.2
   000469         047300     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2314.2 130
   000470         047400     MOVE "LEVEL-2-TEST-1      " TO PAR-NAME.                     NC2314.2 134
   000471         047500     MOVE "SEC (01,01)" TO SEC-HOLD-AREA.                         NC2314.2 47
   000472         047600     MOVE  1 TO SUB-1  SUB-2.                                     NC2314.2 40 41
   000473         047700     SET IDX-1 IDX-2 TO 01.                                       NC2314.2 86 88
   000474         047800     MOVE 01 TO CON-6.                                            NC2314.2 48
   000475         047900     SEARCH GRP2-ENTRY VARYING CON-6 AT END                       NC2314.2 88 48
   000476      1  048000         PERFORM SEC-FAIL-PARGRAF                                 NC2314.2 531
   000477      1  048100         GO TO LEVEL-2-TEST-2                                     NC2314.2 483
   000478         048200         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2314.2 89 86 88 47
   000479      1  048300             NEXT SENTENCE.                                       NC2314.2
   000480         048400                                                                  NC2314.2
   000481         048500     PERFORM PASS-TH.                                             NC2314.2 1096
   000482         048600                                                                  NC2314.2
   000483         048700 LEVEL-2-TEST-2.                                                  NC2314.2
   000484         048800     MOVE "LEVEL-2-TEST-2      " TO PAR-NAME.                     NC2314.2 134
   000485         048900     MOVE "SEC (05,10)" TO SEC-HOLD-AREA.                         NC2314.2 47
   000486         049000     MOVE 05 TO SUB-1.                                            NC2314.2 40
   000487         049100     MOVE 10 TO SUB-2.                                            NC2314.2 41
   000488         049200     SET IDX-1 TO 5.                                              NC2314.2 86
   000489         049300     MOVE 01 TO CON-6.                                            NC2314.2 48
   000490         049400     SET IDX-2 TO 01.                                             NC2314.2 88
   000491         049500     SEARCH GRP2-ENTRY VARYING CON-6 AT END                       NC2314.2 88 48
   000492      1  049600         PERFORM SEC-FAIL-PARGRAF                                 NC2314.2 531
   000493      1  049700         GO TO LEVEL-2-TEST-3                                     NC2314.2 499
   000494         049800         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2314.2 89 86 88 47
   000495      1  049900             NEXT SENTENCE.                                       NC2314.2
   000496         050000                                                                  NC2314.2
   000497         050100     PERFORM PASS-TH.                                             NC2314.2 1096
   000498         050200                                                                  NC2314.2
   000499         050300 LEVEL-2-TEST-3.                                                  NC2314.2
   000500         050400     MOVE "LEVEL-2-TEST-3      " TO PAR-NAME.                     NC2314.2 134
   000501         050500     MOVE "SEC (10,10)" TO SEC-HOLD-AREA.                         NC2314.2 47
   000502         050600     SET IDX-1 TO 10.                                             NC2314.2 86
   000503         050700     MOVE 01 TO CON-6.                                            NC2314.2 48
   000504         050800     SET IDX-2 TO 01.                                             NC2314.2 88
   000505         050900     MOVE 10 TO SUB-1  SUB-2.                                     NC2314.2 40 41
   000506         051000     SEARCH GRP2-ENTRY VARYING CON-6 AT END                       NC2314.2 88 48
   000507      1  051100         PERFORM SEC-FAIL-PARGRAF                                 NC2314.2 531
   000508      1  051200         GO TO LEVEL-2-TEST-4                                     NC2314.2 513
   000509         051300         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2314.2 89 86 88 47
   000510      1  051400             NEXT SENTENCE.                                       NC2314.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500                                                                  NC2314.2
   000512         051600     PERFORM PASS-TH.                                             NC2314.2 1096
   000513         051700 LEVEL-2-TEST-4.                                                  NC2314.2
   000514         051800     MOVE "LEVEL-2-TEST-4      " TO PAR-NAME.                     NC2314.2 134
   000515         051900     MOVE "SEC (08,02)" TO SEC-HOLD-AREA.                         NC2314.2 47
   000516         052000     MOVE 08 TO SUB-1.                                            NC2314.2 40
   000517         052100     MOVE 02 TO SUB-2.                                            NC2314.2 41
   000518         052200     SET IDX-1 TO 08.                                             NC2314.2 86
   000519         052300     MOVE 01 TO CON-6.                                            NC2314.2 48
   000520         052400     SET IDX-2 TO 01.                                             NC2314.2 88
   000521         052500     SEARCH GRP2-ENTRY VARYING CON-6                              NC2314.2 88 48
   000522         052600         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2314.2 89 86 88 47
   000523      1  052700             GO TO PASS-TH-2-4.                                   NC2314.2 526
   000524         052800     PERFORM SEC-FAIL-PARGRAF.                                    NC2314.2 531
   000525         052900     GO TO LEVEL-3-TEST-1.                                        NC2314.2 543
   000526         053000 PASS-TH-2-4.                                                     NC2314.2
   000527         053100                                                                  NC2314.2
   000528         053200     PERFORM PASS-TH.                                             NC2314.2 1096
   000529         053300     GO TO LEVEL-3-TEST-1.                                        NC2314.2 543
   000530         053400                                                                  NC2314.2
   000531         053500 SEC-FAIL-PARGRAF.                                                NC2314.2
   000532         053600     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2314.2 47 159
   000533         053700     IF ENTRY-2 (SUB-1, SUB-2) = SEC-HOLD-AREA                    NC2314.2 89 40 41 47
   000534      1  053800         MOVE "IDX-2" TO END-IDX                                  NC2314.2 111
   000535      1  053900         SET IDX-VALU TO IDX-2                                    NC2314.2 113 88
   000536      1  054000         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000537      1  054100         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
   000538      1  054200     MOVE ENTRY-2 (SUB-1, SUB-2) TO COMPUTED-A                    NC2314.2 89 40 41 145
   000539      1  054300     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000540         054400                                                                  NC2314.2
   000541         054500     PERFORM FAIL-TH.                                             NC2314.2 1099
   000542         054600                                                                  NC2314.2
   000543         054700 LEVEL-3-TEST-1.                                                  NC2314.2
   000544         054800     MOVE "LEVEL-3-TEST-1      " TO PAR-NAME.                     NC2314.2 134
   000545         054900     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2314.2 130
   000546         055000     MOVE 1 TO SUB-1  SUB-2  SUB-3.                               NC2314.2 40 41 42
   000547         055100     MOVE "ELEM (01,01,01)" TO ELEM-HOLD-AREA.                    NC2314.2 49
   000548         055200     SET IDX-1 IDX-2 IDX-3 TO 01.                                 NC2314.2 86 88 90
   000549         055300     MOVE 01 TO CON-7.                                            NC2314.2 43
   000550         055400     SEARCH GRP3-ENTRY VARYING CON-7                              NC2314.2 90 43
   000551         055500         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2314.2 91 86 88 90 49
   000552      1  055600             GO TO PASS-TH-3-1.                                   NC2314.2 555
   000553         055700     PERFORM ELEM-FAIL-PARA.                                      NC2314.2 609
   000554         055800     GO TO LEVEL-3-TEST-2.                                        NC2314.2 559
   000555         055900 PASS-TH-3-1.                                                     NC2314.2
   000556         056000                                                                  NC2314.2
   000557         056100     PERFORM PASS-TH.                                             NC2314.2 1096
   000558         056200                                                                  NC2314.2
   000559         056300 LEVEL-3-TEST-2.                                                  NC2314.2
   000560         056400     MOVE "LEVEL-3-TEST-2      " TO PAR-NAME.                     NC2314.2 134
   000561         056500     MOVE 05 TO SUB-1.                                            NC2314.2 40
   000562         056600     MOVE 06 TO SUB-2.                                            NC2314.2 41
   000563         056700     MOVE 07 TO SUB-3.                                            NC2314.2 42
   000564         056800     SET IDX-1 TO 05.                                             NC2314.2 86
   000565         056900     SET IDX-2 TO 06.                                             NC2314.2 88
   000566         057000     MOVE 01 TO CON-7.                                            NC2314.2 43
   000567         057100     SET IDX-3 TO 01.                                             NC2314.2 90
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200     MOVE "ELEM (05,06,07)" TO ELEM-HOLD-AREA.                    NC2314.2 49
   000569         057300     SEARCH GRP3-ENTRY VARYING CON-7 AT END                       NC2314.2 90 43
   000570      1  057400         PERFORM ELEM-FAIL-PARA                                   NC2314.2 609
   000571      1  057500         GO TO LEVEL-3-TEST-3                                     NC2314.2 577
   000572         057600         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2314.2 91 86 88 90 49
   000573      1  057700             NEXT SENTENCE.                                       NC2314.2
   000574         057800                                                                  NC2314.2
   000575         057900     PERFORM PASS-TH.                                             NC2314.2 1096
   000576         058000                                                                  NC2314.2
   000577         058100 LEVEL-3-TEST-3.                                                  NC2314.2
   000578         058200     MOVE "LEVEL-3-TEST-3      " TO PAR-NAME.                     NC2314.2 134
   000579         058300     MOVE 10 TO SUB-1 SUB-2 SUB-3.                                NC2314.2 40 41 42
   000580         058400     SET IDX-1  IDX-2 TO 10.                                      NC2314.2 86 88
   000581         058500     SET IDX-3 TO 01.                                             NC2314.2 90
   000582         058600     MOVE 01 TO CON-7.                                            NC2314.2 43
   000583         058700     MOVE "ELEM (10,10,10)" TO ELEM-HOLD-AREA.                    NC2314.2 49
   000584         058800     SEARCH GRP3-ENTRY VARYING CON-7 AT END                       NC2314.2 90 43
   000585      1  058900         PERFORM ELEM-FAIL-PARA                                   NC2314.2 609
   000586      1  059000         GO TO LEVEL-3-TEST-4                                     NC2314.2 591
   000587         059100         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2314.2 91 86 88 90 49
   000588      1  059200             NEXT SENTENCE.                                       NC2314.2
   000589         059300                                                                  NC2314.2
   000590         059400     PERFORM PASS-TH.                                             NC2314.2 1096
   000591         059500 LEVEL-3-TEST-4.                                                  NC2314.2
   000592         059600     MOVE "LEVEL-3-TEST-4      " TO PAR-NAME.                     NC2314.2 134
   000593         059700     MOVE "ELEM (07,06,05)" TO ELEM-HOLD-AREA.                    NC2314.2 49
   000594         059800     MOVE 07 TO SUB-1.                                            NC2314.2 40
   000595         059900     MOVE 06 TO SUB-2.                                            NC2314.2 41
   000596         060000     MOVE 05 TO SUB-3.                                            NC2314.2 42
   000597         060100     SET IDX-1 TO 07.                                             NC2314.2 86
   000598         060200     SET IDX-2 TO 06.                                             NC2314.2 88
   000599         060300     SET IDX-3 TO 03.                                             NC2314.2 90
   000600         060400     MOVE 03 TO CON-7.                                            NC2314.2 43
   000601         060500     SEARCH GRP3-ENTRY VARYING CON-7 AT END                       NC2314.2 90 43
   000602      1  060600         PERFORM ELEM-FAIL-PARA                                   NC2314.2 609
   000603      1  060700         GO TO MULT-SEARCH-TEST-1                                 NC2314.2 621
   000604         060800         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2314.2 91 86 88 90 49
   000605      1  060900         NEXT SENTENCE.                                           NC2314.2
   000606         061000                                                                  NC2314.2
   000607         061100     PERFORM PASS-TH.                                             NC2314.2 1096
   000608         061200     GO TO MULT-SEARCH-TEST-1.                                    NC2314.2 621
   000609         061300 ELEM-FAIL-PARA.                                                  NC2314.2
   000610         061400     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2314.2 49 159
   000611         061500     IF ENTRY-3 (SUB-1, SUB-2, SUB-3) = ELEM-HOLD-AREA            NC2314.2 91 40 41 42 49
   000612      1  061600         MOVE "IDX-3" TO END-IDX                                  NC2314.2 111
   000613      1  061700         SET IDX-VALU TO IDX-3                                    NC2314.2 113 90
   000614      1  061800         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000615      1  061900         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
   000616      1  062000     MOVE ENTRY-3 (SUB-1, SUB-2, SUB-3) TO COMPUTED-A             NC2314.2 91 40 41 42 145
   000617      1  062100     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000618         062200                                                                  NC2314.2
   000619         062300     PERFORM FAIL-TH.                                             NC2314.2 1099
   000620         062400                                                                  NC2314.2
   000621         062500 MULT-SEARCH-TEST-1.                                              NC2314.2
   000622         062600     MOVE "MULT-SEARCH-TEST-1  " TO PAR-NAME.                     NC2314.2 134
   000623         062700     MOVE "MULTIPLE SEARCH STMT" TO FEATURE.                      NC2314.2 130
   000624         062800     MOVE "GRP08" TO GRP-HOLD-AREA.                               NC2314.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     MOVE "SEC (08,07)" TO SEC-HOLD-AREA.                         NC2314.2 47
   000626         063000     MOVE 01 TO CON-5 CON-6.                                      NC2314.2 46 48
   000627         063100     SET IDX-1 IDX-2 TO 01.                                       NC2314.2 86 88
   000628         063200     SEARCH GRP-ENTRY VARYING CON-5 AT END GO TO MULT-SEARCH-FAIL1NC2314.2 86 46 636
   000629      1  063300         WHEN ENTRY-1 (CON-5) = "GRP08" NEXT SENTENCE.            NC2314.2 87 46
   000630         063400     SEARCH GRP2-ENTRY VARYING CON-6 AT END GO TO MULT-SEARCH-FAILNC2314.2 88 48 648
   000631         063500         WHEN ENTRY-2 (CON-5, CON-6) = SEC-HOLD-AREA              NC2314.2 89 46 48 47
   000632      1  063600             NEXT SENTENCE.                                       NC2314.2
   000633         063700                                                                  NC2314.2
   000634         063800     PERFORM PASS-TH.                                             NC2314.2 1096
   000635         063900     GO TO MULT-SEARCH-TEST-2.                                    NC2314.2 660
   000636         064000 MULT-SEARCH-FAIL1.                                               NC2314.2
   000637         064100     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2314.2 45 159
   000638         064200     IF ENTRY-1 (08) = GRP-HOLD-AREA                              NC2314.2 87 45
   000639      1  064300         MOVE "IDX-1" TO END-IDX                                  NC2314.2 111
   000640      1  064400         SET IDX-VALU TO IDX-1                                    NC2314.2 113 86
   000641      1  064500         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000642      1  064600         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
   000643      1  064700     MOVE ENTRY-1 (08) TO COMPUTED-A                              NC2314.2 87 145
   000644      1  064800     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000645         064900                                                                  NC2314.2
   000646         065000     PERFORM FAIL-TH.                                             NC2314.2 1099
   000647         065100     GO TO MULT-SEARCH-TEST-2.                                    NC2314.2 660
   000648         065200 MULT-SEARCH-FAIL.                                                NC2314.2
   000649         065300     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2314.2 47 159
   000650         065400     IF ENTRY-2 (08, 07) = SEC-HOLD-AREA                          NC2314.2 89 47
   000651      1  065500         MOVE "IDX-2" TO END-IDX                                  NC2314.2 111
   000652      1  065600         SET IDX-VALU TO IDX-2                                    NC2314.2 113 88
   000653      1  065700         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000654      1  065800         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
   000655      1  065900     MOVE ENTRY-2 (08, 07) TO COMPUTED-A                          NC2314.2 89 145
   000656      1  066000     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000657         066100                                                                  NC2314.2
   000658         066200     PERFORM FAIL-TH.                                             NC2314.2 1099
   000659         066300                                                                  NC2314.2
   000660         066400 MULT-SEARCH-TEST-2.                                              NC2314.2
   000661         066500     MOVE "MULT-SEARCH-TEST-2  " TO PAR-NAME.                     NC2314.2 134
   000662         066600     MOVE "GRP04" TO GRP-HOLD-AREA.                               NC2314.2 45
   000663         066700     MOVE "SEC (04,04)" TO SEC-HOLD-AREA.                         NC2314.2 47
   000664         066800     MOVE "ELEM (04,04,04)" TO ELEM-HOLD-AREA.                    NC2314.2 49
   000665         066900     MOVE 01 TO CON-5 CON-6 CON-7.                                NC2314.2 46 48 43
   000666         067000     SET IDX-1  IDX-2  IDX-3 TO 01.                               NC2314.2 86 88 90
   000667         067100     SEARCH GRP-ENTRY VARYING CON-5 AT END                        NC2314.2 86 46
   000668      1  067200         GO TO MULT-SEARCH-2-FAIL WHEN ENTRY-1 (CON-5) =          NC2314.2 680 87 46
   000669      1  067300         GRP-HOLD-AREA  NEXT SENTENCE.                            NC2314.2 45
   000670         067400     SEARCH GRP2-ENTRY VARYING CON-6 AT END                       NC2314.2 88 48
   000671      1  067500         GO TO MULT-SEARCH-3-FAIL WHEN ENTRY-2 (CON-5, CON-6) =   NC2314.2 693 89 46 48
   000672      1  067600         SEC-HOLD-AREA  NEXT SENTENCE.                            NC2314.2 47
   000673         067700     SEARCH GRP3-ENTRY VARYING CON-7 AT END                       NC2314.2 90 43
   000674      1  067800         GO TO MULT-SEARCH-4-FAIL WHEN ENTRY-3                    NC2314.2 706 91
   000675      1  067900             (CON-5, CON-6, CON-7) = ELEM-HOLD-AREA NEXT SENTENCE.NC2314.2 46 48 43 49
   000676         068000                                                                  NC2314.2
   000677         068100     PERFORM PASS-TH.                                             NC2314.2 1096
   000678         068200     GO TO   MULT-SEARCH-7-INIT-3.                                NC2314.2 718
   000679         068300                                                                  NC2314.2
   000680         068400 MULT-SEARCH-2-FAIL.                                              NC2314.2
   000681         068500     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2314.2 45 159
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     IF ENTRY-1 (04) = GRP-HOLD-AREA                              NC2314.2 87 45
   000683      1  068700         MOVE "IDX-1" TO END-IDX                                  NC2314.2 111
   000684      1  068800         SET IDX-VALU TO IDX-1                                    NC2314.2 113 86
   000685      1  068900         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000686      1  069000         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
   000687      1  069100     MOVE ENTRY-1 (04) TO COMPUTED-A                              NC2314.2 87 145
   000688      1  069200     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000689         069300                                                                  NC2314.2
   000690         069400     PERFORM FAIL-TH.                                             NC2314.2 1099
   000691         069500     GO TO   MULT-SEARCH-7-INIT-3.                                NC2314.2 718
   000692         069600                                                                  NC2314.2
   000693         069700 MULT-SEARCH-3-FAIL.                                              NC2314.2
   000694         069800     MOVE  SEC-HOLD-AREA TO CORRECT-A.                            NC2314.2 47 159
   000695         069900     IF ENTRY-2 (04, 04) = SEC-HOLD-AREA                          NC2314.2 89 47
   000696      1  070000         MOVE "IDX-2" TO END-IDX                                  NC2314.2 111
   000697      1  070100         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000698      1  070200         SET IDX-VALU TO IDX-2                                    NC2314.2 113 88
   000699      1  070300         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
   000700      1  070400     MOVE ENTRY-2 (04, 04) TO COMPUTED-A                          NC2314.2 89 145
   000701      1  070500     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000702         070600                                                                  NC2314.2
   000703         070700     PERFORM FAIL-TH.                                             NC2314.2 1099
   000704         070800     GO TO   MULT-SEARCH-7-INIT-3.                                NC2314.2 718
   000705         070900                                                                  NC2314.2
   000706         071000 MULT-SEARCH-4-FAIL.                                              NC2314.2
   000707         071100     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2314.2 49 159
   000708         071200     IF ENTRY-3 (04, 04, 04) = ELEM-HOLD-AREA                     NC2314.2 91 49
   000709      1  071300         MOVE "IDX-3" TO END-IDX                                  NC2314.2 111
   000710      1  071400         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000711      1  071500         SET IDX-VALU TO IDX-3                                    NC2314.2 113 90
   000712      1  071600         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
   000713      1  071700     MOVE ENTRY-3 (04, 04, 04) TO COMPUTED-A                      NC2314.2 91 145
   000714      1  071800     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000715         071900                                                                  NC2314.2
   000716         072000     PERFORM FAIL-TH.                                             NC2314.2 1099
   000717         072100                                                                  NC2314.2
   000718         072200 MULT-SEARCH-7-INIT-3.                                            NC2314.2
   000719         072300     MOVE   "MULT-SEARCH-7-TEST-3" TO PAR-NAME.                   NC2314.2 134
   000720         072400     MOVE   "VI-122 6.21"          TO ANSI-REFERENCE.             NC2314.2 190
   000721         072500     MOVE    ALL "ABCDEFGHIJKLMNOPQRSTUVWXYZ" TO 7-DIMENSION-TBL. NC2314.2 93
   000722         072600     MOVE   "UV" TO L1-HOLD.                                      NC2314.2 50
   000723         072700     MOVE   "WX" TO L2-HOLD.                                      NC2314.2 51
   000724         072800     MOVE   "IJ" TO L3-HOLD.                                      NC2314.2 52
   000725         072900     MOVE   "KL" TO L4-HOLD.                                      NC2314.2 53
   000726         073000     MOVE   "AB" TO L5-HOLD.                                      NC2314.2 54
   000727         073100     MOVE   "CD" TO L6-HOLD.                                      NC2314.2 55
   000728         073200     MOVE   "GH" TO L7-HOLD.                                      NC2314.2 56
   000729         073300     SET     IX-1 IX-2 IX-3 IX-4 IX-5 IX-6 IX-7 TO 1.             NC2314.2 94 96 98 100 102 104 106
   000730         073400     MOVE    1 TO N1 N2 N3 N4 N5 N6 N7.                           NC2314.2 57 58 59 60 61 62 63
   000731         073500     GO TO   MULT-SEARCH-7-TEST-3.                                NC2314.2 736
   000732         073600 MULT-SEARCH-7-DELETE-3.                                          NC2314.2
   000733         073700     PERFORM DE-LETE.                                             NC2314.2 286
   000734         073800     PERFORM PRINT-DETAIL.                                        NC2314.2 288
   000735         073900     GO TO   SPECIAL-TEST-1.                                      NC2314.2 866
   000736         074000 MULT-SEARCH-7-TEST-3.                                            NC2314.2
   000737         074100     SEARCH  GRP-7-1-ENTRY VARYING N1                             NC2314.2 94 57
   000738      1  074200             AT END  GO TO MULT-SEARCH-7-FAIL-1                   NC2314.2 769
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300             WHEN    ENTRY-7-1 (N1) =  L1-HOLD                    NC2314.2 95 57 50
   000740      1  074400                     NEXT SENTENCE.                               NC2314.2
   000741         074500     SEARCH  GRP-7-2-ENTRY VARYING N2                             NC2314.2 96 58
   000742      1  074600             AT END  GO TO MULT-SEARCH-7-FAIL-2                   NC2314.2 783
   000743         074700             WHEN    ENTRY-7-2 (N1 N2) = L2-HOLD                  NC2314.2 97 57 58 51
   000744      1  074800                     NEXT SENTENCE.                               NC2314.2
   000745         074900     SEARCH  GRP-7-3-ENTRY VARYING N3                             NC2314.2 98 59
   000746      1  075000             AT END  GO TO MULT-SEARCH-7-FAIL-3                   NC2314.2 797
   000747         075100             WHEN    ENTRY-7-3 (N1 N2 N3) = L3-HOLD               NC2314.2 99 57 58 59 52
   000748      1  075200                     NEXT SENTENCE.                               NC2314.2
   000749         075300     SEARCH  GRP-7-4-ENTRY VARYING N4                             NC2314.2 100 60
   000750      1  075400             AT END  GO TO MULT-SEARCH-7-FAIL-4                   NC2314.2 811
   000751         075500             WHEN    ENTRY-7-4 (N1 N2 N3 N4) =  L4-HOLD           NC2314.2 101 57 58 59 60 53
   000752      1  075600                     NEXT SENTENCE.                               NC2314.2
   000753         075700     SEARCH  GRP-7-5-ENTRY VARYING N5                             NC2314.2 102 61
   000754      1  075800             AT END  GO TO MULT-SEARCH-7-FAIL-5                   NC2314.2 825
   000755         075900             WHEN    ENTRY-7-5 (N1 N2 N3 N4 N5) = L5-HOLD         NC2314.2 103 57 58 59 60 61 54
   000756      1  076000                     NEXT SENTENCE.                               NC2314.2
   000757         076100     SEARCH  GRP-7-6-ENTRY VARYING N6                             NC2314.2 104 62
   000758      1  076200             AT END  GO TO MULT-SEARCH-7-FAIL-6                   NC2314.2 839
   000759         076300             WHEN    ENTRY-7-6 (N1 N2 N3 N4 N5 N6) = L6-HOLD      NC2314.2 105 57 58 59 60 61 62 55
   000760      1  076400                     NEXT SENTENCE.                               NC2314.2
   000761         076500     SEARCH  GRP-7-7-ENTRY VARYING N7                             NC2314.2 106 63
   000762      1  076600             AT END  GO TO MULT-SEARCH-7-FAIL-7                   NC2314.2 853
   000763         076700             WHEN    ENTRY-7-7 (N1 N2 N3 N4 N5 N6 N7) = L7-HOLD   NC2314.2 107 57 58 59 60 61 62 63 56
   000764      1  076800                     NEXT SENTENCE.                               NC2314.2
   000765         076900                                                                  NC2314.2
   000766         077000     PERFORM PASS-TH.                                             NC2314.2 1096
   000767         077100     GO TO   SPECIAL-TEST-1.                                      NC2314.2 866
   000768         077200                                                                  NC2314.2
   000769         077300 MULT-SEARCH-7-FAIL-1.                                            NC2314.2
   000770         077400     MOVE    L1-HOLD TO CORRECT-A.                                NC2314.2 50 159
   000771         077500     IF      ENTRY-7-1 (2) = L1-HOLD                              NC2314.2 95 50
   000772      1  077600             MOVE   "IX-1" TO END-IDX                             NC2314.2 111
   000773      1  077700             SET     IDX-VALU TO IX-1                             NC2314.2 113 94
   000774      1  077800             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2314.2 139
   000775      1  077900             MOVE    END-STMT TO COMPUTED-A                       NC2314.2 109 145
   000776         078000     ELSE                                                         NC2314.2
   000777      1  078100             MOVE    ENTRY-7-1 (2) TO COMPUTED-A                  NC2314.2 95 145
   000778      1  078200             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2314.2 139
   000779         078300                                                                  NC2314.2
   000780         078400     PERFORM FAIL-TH.                                             NC2314.2 1099
   000781         078500     GO TO   SPECIAL-TEST-1.                                      NC2314.2 866
   000782         078600                                                                  NC2314.2
   000783         078700 MULT-SEARCH-7-FAIL-2.                                            NC2314.2
   000784         078800     MOVE    L2-HOLD TO CORRECT-A.                                NC2314.2 51 159
   000785         078900     IF      ENTRY-7-2 (2 1) = L1-HOLD                            NC2314.2 97 50
   000786      1  079000             MOVE   "IX-2" TO END-IDX                             NC2314.2 111
   000787      1  079100             SET     IDX-VALU TO IX-2                             NC2314.2 113 96
   000788      1  079200             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2314.2 139
   000789      1  079300             MOVE    END-STMT TO COMPUTED-A                       NC2314.2 109 145
   000790         079400     ELSE                                                         NC2314.2
   000791      1  079500             MOVE    ENTRY-7-2 (2 1) TO COMPUTED-A                NC2314.2 97 145
   000792      1  079600             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2314.2 139
   000793         079700                                                                  NC2314.2
   000794         079800     PERFORM FAIL-TH.                                             NC2314.2 1099
   000795         079900     GO TO   SPECIAL-TEST-1.                                      NC2314.2 866
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000                                                                  NC2314.2
   000797         080100 MULT-SEARCH-7-FAIL-3.                                            NC2314.2
   000798         080200     MOVE    L3-HOLD TO CORRECT-A.                                NC2314.2 52 159
   000799         080300     IF      ENTRY-7-3 (2 1 2) = L3-HOLD                          NC2314.2 99 52
   000800      1  080400             MOVE   "IX-3" TO END-IDX                             NC2314.2 111
   000801      1  080500             SET     IDX-VALU TO IX-3                             NC2314.2 113 98
   000802      1  080600             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2314.2 139
   000803      1  080700             MOVE    END-STMT TO COMPUTED-A                       NC2314.2 109 145
   000804         080800     ELSE                                                         NC2314.2
   000805      1  080900             MOVE    ENTRY-7-3 (2 1 2) TO COMPUTED-A              NC2314.2 99 145
   000806      1  081000             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2314.2 139
   000807         081100                                                                  NC2314.2
   000808         081200     PERFORM FAIL-TH.                                             NC2314.2 1099
   000809         081300     GO TO   SPECIAL-TEST-1.                                      NC2314.2 866
   000810         081400                                                                  NC2314.2
   000811         081500 MULT-SEARCH-7-FAIL-4.                                            NC2314.2
   000812         081600     MOVE    L4-HOLD TO CORRECT-A.                                NC2314.2 53 159
   000813         081700     IF      ENTRY-7-4 (2 1 2 1) = L4-HOLD                        NC2314.2 101 53
   000814      1  081800             MOVE   "IX-4" TO END-IDX                             NC2314.2 111
   000815      1  081900             SET     IDX-VALU TO IX-4                             NC2314.2 113 100
   000816      1  082000             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2314.2 139
   000817      1  082100             MOVE    END-STMT TO COMPUTED-A                       NC2314.2 109 145
   000818         082200     ELSE                                                         NC2314.2
   000819      1  082300             MOVE    ENTRY-7-4 (2 1 2 1) TO COMPUTED-A            NC2314.2 101 145
   000820      1  082400             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2314.2 139
   000821         082500                                                                  NC2314.2
   000822         082600     PERFORM FAIL-TH.                                             NC2314.2 1099
   000823         082700     GO TO   SPECIAL-TEST-1.                                      NC2314.2 866
   000824         082800                                                                  NC2314.2
   000825         082900 MULT-SEARCH-7-FAIL-5.                                            NC2314.2
   000826         083000     MOVE    L5-HOLD TO CORRECT-A.                                NC2314.2 54 159
   000827         083100     IF      ENTRY-7-5 (2 1 2 1 2) = L5-HOLD                      NC2314.2 103 54
   000828      1  083200             MOVE   "IX-5" TO END-IDX                             NC2314.2 111
   000829      1  083300             SET     IDX-VALU TO IX-5                             NC2314.2 113 102
   000830      1  083400             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2314.2 139
   000831      1  083500             MOVE    END-STMT TO COMPUTED-A                       NC2314.2 109 145
   000832         083600     ELSE                                                         NC2314.2
   000833      1  083700             MOVE    ENTRY-7-5 (2 1 2 1 2) TO COMPUTED-A          NC2314.2 103 145
   000834      1  083800             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2314.2 139
   000835         083900                                                                  NC2314.2
   000836         084000     PERFORM FAIL-TH.                                             NC2314.2 1099
   000837         084100     GO TO   SPECIAL-TEST-1.                                      NC2314.2 866
   000838         084200                                                                  NC2314.2
   000839         084300 MULT-SEARCH-7-FAIL-6.                                            NC2314.2
   000840         084400     MOVE    L6-HOLD TO CORRECT-A.                                NC2314.2 55 159
   000841         084500     IF      ENTRY-7-6 (2 1 2 1 2 1) = L6-HOLD                    NC2314.2 105 55
   000842      1  084600             MOVE   "IX-6" TO END-IDX                             NC2314.2 111
   000843      1  084700             SET     IDX-VALU TO IX-6                             NC2314.2 113 104
   000844      1  084800             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2314.2 139
   000845      1  084900             MOVE    END-STMT TO COMPUTED-A                       NC2314.2 109 145
   000846         085000     ELSE                                                         NC2314.2
   000847      1  085100             MOVE    ENTRY-7-6 (2 1 2 1 2 1) TO COMPUTED-A        NC2314.2 105 145
   000848      1  085200             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2314.2 139
   000849         085300                                                                  NC2314.2
   000850         085400     PERFORM FAIL-TH.                                             NC2314.2 1099
   000851         085500     GO TO   SPECIAL-TEST-1.                                      NC2314.2 866
   000852         085600                                                                  NC2314.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700 MULT-SEARCH-7-FAIL-7.                                            NC2314.2
   000854         085800     MOVE    L7-HOLD TO CORRECT-A.                                NC2314.2 56 159
   000855         085900     IF      ENTRY-7-7 (2 1 2 1 2 1 2) = L7-HOLD                  NC2314.2 107 56
   000856      1  086000             MOVE   "IX-7" TO END-IDX                             NC2314.2 111
   000857      1  086100             SET     IDX-VALU TO IX-7                             NC2314.2 113 106
   000858      1  086200             MOVE   "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK      NC2314.2 139
   000859      1  086300             MOVE    END-STMT TO COMPUTED-A                       NC2314.2 109 145
   000860         086400     ELSE                                                         NC2314.2
   000861      1  086500             MOVE    ENTRY-7-7 (2 1 2 1 2 1 2) TO COMPUTED-A      NC2314.2 107 145
   000862      1  086600             MOVE   "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.     NC2314.2 139
   000863         086700                                                                  NC2314.2
   000864         086800     PERFORM FAIL-TH.                                             NC2314.2 1099
   000865         086900                                                                  NC2314.2
   000866         087000 SPECIAL-TEST-1.                                                  NC2314.2
   000867         087100     MOVE "SPECIAL-TEST-1      " TO PAR-NAME.                     NC2314.2 134
   000868         087200     MOVE "IDX SET HI TO ENTRY " TO FEATURE.                      NC2314.2 130
   000869         087300     MOVE 04 TO CON-5.                                            NC2314.2 46
   000870         087400     SET IDX-1 TO 04.                                             NC2314.2 86
   000871         087500     SEARCH GRP-ENTRY VARYING CON-5 AT END                        NC2314.2 86 46
   000872      1  087600     GO TO SPEC-PASS-PARAGRAPH-1 WHEN ENTRY-1 (CON-5) = "GRP03"   NC2314.2 887 87 46
   000873      1  087700         GO TO SPEC-FAIL-PARAGRAPH-1.                             NC2314.2 892
   000874         087800 SPECIAL-2-LEVEL-SEARCH.                                          NC2314.2
   000875         087900     MOVE "SPECIAL-2-LEVEL-SEAR" TO PAR-NAME.                     NC2314.2 134
   000876         088000     MOVE 04 TO CON-5.                                            NC2314.2 46
   000877         088100     MOVE 05 TO CON-6.                                            NC2314.2 48
   000878         088200     SET IDX-1 TO 04.                                             NC2314.2 86
   000879         088300     SET IDX-2 TO 05.                                             NC2314.2 88
   000880         088400     SEARCH GRP-ENTRY VARYING IDX-1 AT END                        NC2314.2 86 86
   000881      1  088500         GO TO SPEC-FAIL-PARAGRAPH-2                              NC2314.2 900
   000882      1  088600         WHEN ENTRY-1 (CON-5) = "GRP04" NEXT SENTENCE.            NC2314.2 87 46
   000883         088700     SEARCH GRP2-ENTRY VARYING CON-6 AT END                       NC2314.2 88 48
   000884      1  088800         GO TO SPEC-PASS-PARAGRAPH-2                              NC2314.2 916
   000885         088900         WHEN ENTRY-2 (CON-5, CON-6) = "SEC (04,04)"              NC2314.2 89 46 48
   000886      1  089000         GO TO SPEC-FAIL-PARAGRAPH-3.                             NC2314.2 908
   000887         089100 SPEC-PASS-PARAGRAPH-1.                                           NC2314.2
   000888         089200                                                                  NC2314.2
   000889         089300     PERFORM PASS-TH.                                             NC2314.2 1096
   000890         089400     GO TO SPECIAL-2-LEVEL-SEARCH.                                NC2314.2 874
   000891         089500                                                                  NC2314.2
   000892         089600 SPEC-FAIL-PARAGRAPH-1.                                           NC2314.2
   000893         089700     MOVE "ENTRY SHOULD NOT BE FOUND  " TO RE-MARK.               NC2314.2 139
   000894         089800     MOVE "GRP03" TO COMPUTED-A.                                  NC2314.2 145
   000895         089900                                                                  NC2314.2
   000896         090000     MOVE SPACES TO CORRECT-A.                                    NC2314.2 IMP 159
   000897         090100     PERFORM FAIL-TH.                                             NC2314.2 1099
   000898         090200     GO TO SPECIAL-2-LEVEL-SEARCH.                                NC2314.2 874
   000899         090300                                                                  NC2314.2
   000900         090400 SPEC-FAIL-PARAGRAPH-2.                                           NC2314.2
   000901         090500     MOVE "GRP04" TO CORRECT-A.                                   NC2314.2 159
   000902         090600     MOVE ENTRY-1 (04) TO COMPUTED-A.                             NC2314.2 87 145
   000903         090700                                                                  NC2314.2
   000904         090800     MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000905         090900     PERFORM FAIL-TH.                                             NC2314.2 1099
   000906         091000     GO TO SPECIAL-3-LEVEL-SEARCH.                                NC2314.2 921
   000907         091100                                                                  NC2314.2
   000908         091200 SPEC-FAIL-PARAGRAPH-3.                                           NC2314.2
   000909         091300     MOVE ENTRY-2 (04, 04) TO COMPUTED-A.                         NC2314.2 89 145
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400     MOVE SPACE TO CORRECT-A.                                     NC2314.2 IMP 159
   000911         091500     MOVE "ENTRY SHOULD NOT BE FOUND  " TO RE-MARK.               NC2314.2 139
   000912         091600                                                                  NC2314.2
   000913         091700     PERFORM FAIL-TH.                                             NC2314.2 1099
   000914         091800     GO TO SPECIAL-3-LEVEL-SEARCH.                                NC2314.2 921
   000915         091900                                                                  NC2314.2
   000916         092000 SPEC-PASS-PARAGRAPH-2.                                           NC2314.2
   000917         092100                                                                  NC2314.2
   000918         092200     PERFORM PASS-TH.                                             NC2314.2 1096
   000919         092300     GO TO SPECIAL-3-LEVEL-SEARCH.                                NC2314.2 921
   000920         092400                                                                  NC2314.2
   000921         092500 SPECIAL-3-LEVEL-SEARCH.                                          NC2314.2
   000922         092600     MOVE "SPECIAL-3-LEVEL-SEAR" TO PAR-NAME.                     NC2314.2 134
   000923         092700     SET IDX-1 TO 02.                                             NC2314.2 86
   000924         092800     MOVE 02 TO CON-5.                                            NC2314.2 46
   000925         092900     SEARCH GRP-ENTRY VARYING CON-5 AT END                        NC2314.2 86 46
   000926      1  093000         GO TO SPEC-FAIL-PARAGRAPH-4 WHEN ENTRY-1 (CON-5)         NC2314.2 949 87 46
   000927      1  093100         EQUAL TO "GRP02" NEXT SENTENCE.                          NC2314.2
   000928         093200     MOVE 01 TO CON-6.                                            NC2314.2 48
   000929         093300     SET IDX-2 TO 01.                                             NC2314.2 88
   000930         093400     SEARCH GRP2-ENTRY VARYING CON-6 AT END                       NC2314.2 88 48
   000931      1  093500         GO TO SPEC-FAIL-PARAGRAPH-5                              NC2314.2 961
   000932      1  093600     WHEN ENTRY-2 (CON-5, CON-6) = "SEC (02,03)" NEXT SENTENCE.   NC2314.2 89 46 48
   000933         093700     MOVE 05 TO CON-7.                                            NC2314.2 43
   000934         093800     SET IDX-3 TO 05.                                             NC2314.2 90
   000935         093900     SEARCH GRP3-ENTRY VARYING CON-7 AT END                       NC2314.2 90 43
   000936      1  094000         GO TO SPEC-PASS-PARAGRAPH-3                              NC2314.2 944
   000937         094100     WHEN ENTRY-3 (CON-5, CON-6, CON-7) = "ELEM (02,03,04)"       NC2314.2 91 46 48 43
   000938         094200                                                                  NC2314.2
   000939      1  094300     MOVE "INDEX SET HIGHER THAN ENTRY" TO RE-MARK                NC2314.2 139
   000940      1  094400         MOVE SPACES TO CORRECT-A                                 NC2314.2 IMP 159
   000941      1  094500         MOVE "ELEM (02,03,04)" TO COMPUTED-A                     NC2314.2 145
   000942      1  094600         PERFORM FAIL-TH                                          NC2314.2 1099
   000943      1  094700         GO TO SEARCH-INIT-1.                                     NC2314.2 974
   000944         094800 SPEC-PASS-PARAGRAPH-3.                                           NC2314.2
   000945         094900                                                                  NC2314.2
   000946         095000     PERFORM PASS-TH.                                             NC2314.2 1096
   000947         095100     GO TO SEARCH-INIT-1.                                         NC2314.2 974
   000948         095200                                                                  NC2314.2
   000949         095300 SPEC-FAIL-PARAGRAPH-4.                                           NC2314.2
   000950         095400     IF ENTRY-1 (02) = "GRP02"                                    NC2314.2 87
   000951      1  095500         MOVE "IDX-1" TO END-IDX                                  NC2314.2 111
   000952      1  095600         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000953      1  095700         SET IDX-VALU TO IDX-1                                    NC2314.2 113 86
   000954      1  095800         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
   000955      1  095900     MOVE ENTRY-1 (02) TO COMPUTED-A                              NC2314.2 87 145
   000956      1  096000     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000957         096100                                                                  NC2314.2
   000958         096200     MOVE "GRP02" TO CORRECT-A.                                   NC2314.2 159
   000959         096300     PERFORM FAIL-TH.                                             NC2314.2 1099
   000960         096400     GO TO SEARCH-INIT-1.                                         NC2314.2 974
   000961         096500 SPEC-FAIL-PARAGRAPH-5.                                           NC2314.2
   000962         096600     IF ENTRY-2 (02, 03) = "SEC (02,03)"                          NC2314.2 89
   000963      1  096700         MOVE "IDX-2" TO END-IDX                                  NC2314.2 111
   000964      1  096800         SET IDX-VALU TO IDX-2                                    NC2314.2 113 88
   000965      1  096900         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2314.2 139
   000966      1  097000         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2314.2 109 145
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097100     MOVE ENTRY-2 (02, 03) TO COMPUTED-A                          NC2314.2 89 145
   000968      1  097200     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2314.2 139
   000969         097300                                                                  NC2314.2
   000970         097400     MOVE "SEC (02, 03)" TO CORRECT-A.                            NC2314.2 159
   000971         097500     PERFORM FAIL-TH.                                             NC2314.2 1099
   000972         097600                                                                  NC2314.2
   000973         097700                                                                  NC2314.2
   000974         097800 SEARCH-INIT-1.                                                   NC2314.2
   000975         097900     MOVE   "SEARCH-TEST-1" TO PAR-NAME.                          NC2314.2 134
   000976         098000     MOVE   "IV-41 6.4.3"   TO ANSI-REFERENCE.                    NC2314.2 190
   000977         098100     MOVE   "EXP.SCOPE TERMINATOR" TO FEATURE.                    NC2314.2 130
   000978         098200     MOVE   "CD"   TO L1-HOLD.                                    NC2314.2 50
   000979         098300     MOVE   "CD"   TO ENTRY-7-1 (2).                              NC2314.2 95
   000980         098400     MOVE    SPACE TO L2-HOLD.                                    NC2314.2 IMP 51
   000981         098500     MOVE    SPACE TO L3-HOLD.                                    NC2314.2 IMP 52
   000982         098600     MOVE    SPACE TO L4-HOLD.                                    NC2314.2 IMP 53
   000983         098700     MOVE    1 TO REC-CT.                                         NC2314.2 181
   000984         098800     MOVE    1 TO N1.                                             NC2314.2 57
   000985         098900     SET     IX-1 IX-2 IX-3 IX-4 IX-5 IX-6 IX-7 TO 1.             NC2314.2 94 96 98 100 102 104 106
   000986         099000     GO TO   SEARCH-TEST-1-0.                                     NC2314.2 991
   000987         099100 SEARCH-DELETE-1.                                                 NC2314.2
   000988         099200     PERFORM DE-LETE.                                             NC2314.2 286
   000989         099300     PERFORM PRINT-DETAIL.                                        NC2314.2 288
   000990         099400     GO TO   SEARCH-INIT-2.                                       NC2314.2 1035
   000991         099500 SEARCH-TEST-1-0.                                                 NC2314.2
   000992         099600     SEARCH  GRP-7-1-ENTRY VARYING N1                             NC2314.2 94 57
   000993         099700             WHEN    ENTRY-7-1 (N1) =  L1-HOLD                    NC2314.2 95 57 50
   000994      1  099800                     MOVE   "AA" TO L2-HOLD                       NC2314.2 51
   000995      1  099900                     MOVE   "BB" TO L3-HOLD                       NC2314.2 52
   000996         100000     END-SEARCH                                                   NC2314.2
   000997         100100     MOVE   "CC" TO L4-HOLD.                                      NC2314.2 53
   000998         100200 SEARCH-TEST-1-1.                                                 NC2314.2
   000999         100300     MOVE   "SEARCH-TEST-1-1" TO PAR-NAME.                        NC2314.2 134
   001000         100400     IF      L2-HOLD = "AA"                                       NC2314.2 51
   001001      1  100500             PERFORM PASS                                         NC2314.2 284
   001002      1  100600             PERFORM PRINT-DETAIL                                 NC2314.2 288
   001003         100700     ELSE                                                         NC2314.2
   001004      1  100800             MOVE   "'WHEN' PHRASE SHOULD BE TRUE" TO RE-MARK     NC2314.2 139
   001005      1  100900             MOVE   "AA"  TO CORRECT-X                            NC2314.2 158
   001006      1  101000             MOVE    L2-HOLD TO COMPUTED-X                        NC2314.2 51 144
   001007      1  101100             PERFORM FAIL                                         NC2314.2 285
   001008      1  101200             PERFORM PRINT-DETAIL.                                NC2314.2 288
   001009         101300     ADD     1 TO REC-CT.                                         NC2314.2 181
   001010         101400 SEARCH-TEST-1-2.                                                 NC2314.2
   001011         101500     MOVE   "SEARCH-TEST-1-2" TO PAR-NAME.                        NC2314.2 134
   001012         101600     IF      L3-HOLD = "BB"                                       NC2314.2 52
   001013      1  101700             PERFORM PASS                                         NC2314.2 284
   001014      1  101800             PERFORM PRINT-DETAIL                                 NC2314.2 288
   001015         101900     ELSE                                                         NC2314.2
   001016      1  102000             MOVE   "'WHEN' PHRASE SHOULD BE TRUE" TO RE-MARK     NC2314.2 139
   001017      1  102100             MOVE   "BB"  TO CORRECT-X                            NC2314.2 158
   001018      1  102200             MOVE    L3-HOLD TO COMPUTED-X                        NC2314.2 52 144
   001019      1  102300             PERFORM FAIL                                         NC2314.2 285
   001020      1  102400             PERFORM PRINT-DETAIL.                                NC2314.2 288
   001021         102500     ADD     1 TO REC-CT.                                         NC2314.2 181
   001022         102600 SEARCH-TEST-1-3.                                                 NC2314.2
   001023         102700     MOVE   "SEARCH-TEST-1-3" TO PAR-NAME.                        NC2314.2 134
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102800     IF      L4-HOLD = "CC"                                       NC2314.2 53
   001025      1  102900             PERFORM PASS                                         NC2314.2 284
   001026      1  103000             PERFORM PRINT-DETAIL                                 NC2314.2 288
   001027         103100     ELSE                                                         NC2314.2
   001028      1  103200             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC2314.2 139
   001029      1  103300             MOVE   "CC"  TO CORRECT-X                            NC2314.2 158
   001030      1  103400             MOVE    L4-HOLD TO COMPUTED-X                        NC2314.2 53 144
   001031      1  103500             PERFORM FAIL                                         NC2314.2 285
   001032      1  103600             PERFORM PRINT-DETAIL.                                NC2314.2 288
   001033         103700                                                                  NC2314.2
   001034         103800                                                                  NC2314.2
   001035         103900 SEARCH-INIT-2.                                                   NC2314.2
   001036         104000     MOVE   "SEARCH-TEST-2" TO PAR-NAME.                          NC2314.2 134
   001037         104100     MOVE   "IV-41 6.4.3"   TO ANSI-REFERENCE.                    NC2314.2 190
   001038         104200     MOVE   "CD"   TO L1-HOLD.                                    NC2314.2 50
   001039         104300     MOVE   "ZZ"   TO ENTRY-7-1 (2).                              NC2314.2 95
   001040         104400     MOVE    SPACE TO L2-HOLD.                                    NC2314.2 IMP 51
   001041         104500     MOVE    SPACE TO L3-HOLD.                                    NC2314.2 IMP 52
   001042         104600     MOVE    SPACE TO L4-HOLD.                                    NC2314.2 IMP 53
   001043         104700     MOVE    1 TO REC-CT.                                         NC2314.2 181
   001044         104800     MOVE    1 TO N1.                                             NC2314.2 57
   001045         104900     SET     IX-1 IX-2 IX-3 IX-4 IX-5 IX-6 IX-7 TO 1.             NC2314.2 94 96 98 100 102 104 106
   001046         105000     GO TO   SEARCH-TEST-2-0.                                     NC2314.2 1051
   001047         105100 SEARCH-DELETE-2.                                                 NC2314.2
   001048         105200     PERFORM DE-LETE.                                             NC2314.2 286
   001049         105300     PERFORM PRINT-DETAIL.                                        NC2314.2 288
   001050         105400     GO TO   END-SEARCH-TEST.                                     NC2314.2 1102
   001051         105500 SEARCH-TEST-2-0.                                                 NC2314.2
   001052         105600     SEARCH  GRP-7-1-ENTRY VARYING N1                             NC2314.2 94 57
   001053         105700             WHEN    ENTRY-7-1 (N1) =  L1-HOLD                    NC2314.2 95 57 50
   001054      1  105800                     MOVE   "AA" TO L2-HOLD                       NC2314.2 51
   001055      1  105900                     MOVE   "BB" TO L3-HOLD                       NC2314.2 52
   001056         106000     END-SEARCH                                                   NC2314.2
   001057         106100     MOVE   "CC" TO L4-HOLD.                                      NC2314.2 53
   001058         106200 SEARCH-TEST-2-1.                                                 NC2314.2
   001059         106300     MOVE   "SEARCH-TEST-2-1" TO PAR-NAME.                        NC2314.2 134
   001060         106400     IF      L2-HOLD = SPACE                                      NC2314.2 51 IMP
   001061      1  106500             PERFORM PASS                                         NC2314.2 284
   001062      1  106600             PERFORM PRINT-DETAIL                                 NC2314.2 288
   001063         106700     ELSE                                                         NC2314.2
   001064      1  106800             MOVE   "'WHEN' PHRASE SHOULD BE FALSE" TO RE-MARK    NC2314.2 139
   001065      1  106900             MOVE    SPACE TO CORRECT-X                           NC2314.2 IMP 158
   001066      1  107000             MOVE    L2-HOLD TO COMPUTED-X                        NC2314.2 51 144
   001067      1  107100             PERFORM FAIL                                         NC2314.2 285
   001068      1  107200             PERFORM PRINT-DETAIL.                                NC2314.2 288
   001069         107300     ADD     1 TO REC-CT.                                         NC2314.2 181
   001070         107400 SEARCH-TEST-2-2.                                                 NC2314.2
   001071         107500     MOVE   "SEARCH-TEST-2-2" TO PAR-NAME.                        NC2314.2 134
   001072         107600     IF      L3-HOLD = SPACE                                      NC2314.2 52 IMP
   001073      1  107700             PERFORM PASS                                         NC2314.2 284
   001074      1  107800             PERFORM PRINT-DETAIL                                 NC2314.2 288
   001075         107900     ELSE                                                         NC2314.2
   001076      1  108000             MOVE   "'WHEN' PHRASE SHOULD BE FALSE" TO RE-MARK    NC2314.2 139
   001077      1  108100             MOVE    SPACE TO CORRECT-X                           NC2314.2 IMP 158
   001078      1  108200             MOVE    L3-HOLD TO COMPUTED-X                        NC2314.2 52 144
   001079      1  108300             PERFORM FAIL                                         NC2314.2 285
   001080      1  108400             PERFORM PRINT-DETAIL.                                NC2314.2 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108500     ADD     1 TO REC-CT.                                         NC2314.2 181
   001082         108600 SEARCH-TEST-2-3.                                                 NC2314.2
   001083         108700     MOVE   "SEARCH-TEST-2-3" TO PAR-NAME.                        NC2314.2 134
   001084         108800     IF      L4-HOLD = "CC"                                       NC2314.2 53
   001085      1  108900             PERFORM PASS                                         NC2314.2 284
   001086      1  109000             PERFORM PRINT-DETAIL                                 NC2314.2 288
   001087         109100     ELSE                                                         NC2314.2
   001088      1  109200             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC2314.2 139
   001089      1  109300             MOVE   "CC"  TO CORRECT-X                            NC2314.2 158
   001090      1  109400             MOVE    L4-HOLD TO COMPUTED-X                        NC2314.2 53 144
   001091      1  109500             PERFORM FAIL                                         NC2314.2 285
   001092      1  109600             PERFORM PRINT-DETAIL.                                NC2314.2 288
   001093         109700                                                                  NC2314.2
   001094         109800     GO TO END-SEARCH-TEST.                                       NC2314.2 1102
   001095         109900                                                                  NC2314.2
   001096         110000 PASS-TH.                                                         NC2314.2
   001097         110100     PERFORM PASS.                                                NC2314.2 284
   001098         110200     PERFORM PRINT-DETAIL.                                        NC2314.2 288
   001099         110300 FAIL-TH.                                                         NC2314.2
   001100         110400     PERFORM FAIL.                                                NC2314.2 285
   001101         110500     PERFORM  PRINT-DETAIL.                                       NC2314.2 288
   001102         110600 END-SEARCH-TEST.                                                 NC2314.2
   001103         110700     EXIT.                                                        NC2314.2
   001104         110800 CCVS-EXIT SECTION.                                               NC2314.2
   001105         110900 CCVS-999999.                                                     NC2314.2
   001106         111000     GO TO CLOSE-FILES.                                           NC2314.2 277
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    23
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       81   ADD-ELEM . . . . . . . . . . .  M401
       66   ADD-GRP. . . . . . . . . . . .  M397
       72   ADD-SEC. . . . . . . . . . . .  M399
      190   ANSI-REFERENCE . . . . . . . .  362 369 378 M386 M720 M976 M1037
      169   CCVS-C-1 . . . . . . . . . . .  306 348
      174   CCVS-C-2 . . . . . . . . . . .  307 349
      224   CCVS-E-1 . . . . . . . . . . .  312
      229   CCVS-E-2 . . . . . . . . . . .  321 328 335 340
      232   CCVS-E-2-2 . . . . . . . . . .  M320
      237   CCVS-E-3 . . . . . . . . . . .  341
      246   CCVS-E-4 . . . . . . . . . . .  320
      247   CCVS-E-4-1 . . . . . . . . . .  M318
      249   CCVS-E-4-2 . . . . . . . . . .  M319
      191   CCVS-H-1 . . . . . . . . . . .  301
      196   CCVS-H-2A. . . . . . . . . . .  302
      205   CCVS-H-2B. . . . . . . . . . .  303
      217   CCVS-H-3 . . . . . . . . . . .  304
      267   CCVS-PGM-ID. . . . . . . . . .  273 273
      151   CM-18V0
      145   COMPUTED-A . . . . . . . . . .  146 148 149 150 151 374 377 M422 M427 M537 M538 M615 M616 M642 M643 M654 M655
                                            M686 M687 M699 M700 M712 M713 M775 M777 M789 M791 M803 M805 M817 M819 M831 M833
                                            M845 M847 M859 M861 M894 M902 M909 M941 M954 M955 M966 M967
      146   COMPUTED-N
      144   COMPUTED-X . . . . . . . . . .  M296 360 M1006 M1018 M1030 M1066 M1078 M1090
      148   COMPUTED-0V18
      150   COMPUTED-14V4
      152   COMPUTED-18V0
      149   COMPUTED-4V14
       44   CON-10
       46   CON-5. . . . . . . . . . . . .  M409 M411 M434 M436 M446 M448 M458 M460 460 M626 M628 629 631 M665 M667 668 671
                                            675 M869 M871 872 M876 882 885 M924 M925 926 932 937
       48   CON-6. . . . . . . . . . . . .  M474 M475 M489 M491 M503 M506 M519 M521 M626 M630 631 M665 M670 671 675 M877
                                            M883 885 M928 M930 932 937
       43   CON-7. . . . . . . . . . . . .  M549 M550 M566 M569 M582 M584 M600 M601 M665 M673 675 M933 M935 937
      168   COR-ANSI-REFERENCE . . . . . .  M369 M371
      159   CORRECT-A. . . . . . . . . . .  160 161 162 163 164 375 377 M420 M532 M610 M637 M649 M681 M694 M707 M770 M784
                                            M798 M812 M826 M840 M854 M896 M901 M910 M940 M958 M970
      160   CORRECT-N
      158   CORRECT-X. . . . . . . . . . .  M297 361 M1005 M1017 M1029 M1065 M1077 M1089
      161   CORRECT-0V18
      163   CORRECT-14V4
      165   CORRECT-18V0
      162   CORRECT-4V14
      164   CR-18V0
      182   DELETE-COUNTER . . . . . . . .  M286 315 331 333
      137   DOTVALUE . . . . . . . . . . .  M291
      188   DUMMY-HOLD . . . . . . . . . .  M345 351
       38   DUMMY-RECORD . . . . . . . . .  M301 M302 M303 M304 M306 M307 M308 M310 M312 M321 M328 M335 M340 M341 345 M346
                                            347 M348 M349 M350 M351 355 M356 M364 M379
       77   ELEM-GRP . . . . . . . . . . .  M397
       49   ELEM-HOLD-AREA . . . . . . . .  M547 551 M568 572 M583 587 M593 604 610 611 M664 675 707 708
       75   ELEM-NAME. . . . . . . . . . .  402
       79   ELEM-SEC . . . . . . . . . . .  M399
      111   END-IDX. . . . . . . . . . . .  M424 M534 M612 M639 M651 M683 M696 M709 M772 M786 M800 M814 M828 M842 M856 M951
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    24
0 Defined   Cross-reference of data names   References

0                                           M963
      109   END-STMT . . . . . . . . . . .  427 537 615 642 654 686 699 712 775 789 803 817 831 845 859 954 966
      235   ENDER-DESC . . . . . . . . . .  M323 M334 M339
       87   ENTRY-1. . . . . . . . . . . .  M398 414 421 422 439 451 460 629 638 643 668 682 687 872 882 902 926 950 955
       89   ENTRY-2. . . . . . . . . . . .  M400 478 494 509 522 533 538 631 650 655 671 695 700 885 909 932 962 967
       91   ENTRY-3. . . . . . . . . . . .  M402 551 572 587 604 611 616 674 708 713 937
       95   ENTRY-7-1. . . . . . . . . . .  739 771 777 M979 993 M1039 1053
       97   ENTRY-7-2. . . . . . . . . . .  743 785 791
       99   ENTRY-7-3. . . . . . . . . . .  747 799 805
      101   ENTRY-7-4. . . . . . . . . . .  751 813 819
      103   ENTRY-7-5. . . . . . . . . . .  755 827 833
      105   ENTRY-7-6. . . . . . . . . . .  759 841 847
      107   ENTRY-7-7. . . . . . . . . . .  763 855 861
      183   ERROR-COUNTER. . . . . . . . .  M285 314 324 327
      187   ERROR-HOLD . . . . . . . . . .  M314 M315 M315 M316 319
      233   ERROR-TOTAL. . . . . . . . . .  M325 M327 M332 M333 M337 M338
      130   FEATURE. . . . . . . . . . . .  M405 M469 M545 M623 M868 M977
       86   GRP-ENTRY. . . . . . . . . . .  411 436 448 460 628 667 871 880 925
       45   GRP-HOLD-AREA. . . . . . . . .  M407 414 420 421 M432 439 M444 451 M456 461 M624 637 638 M662 669 681 682
       64   GRP-NAME . . . . . . . . . . .  398
       94   GRP-7-1-ENTRY. . . . . . . . .  737 992 1052
       96   GRP-7-2-ENTRY. . . . . . . . .  741
       98   GRP-7-3-ENTRY. . . . . . . . .  745
      100   GRP-7-4-ENTRY. . . . . . . . .  749
      102   GRP-7-5-ENTRY. . . . . . . . .  753
      104   GRP-7-6-ENTRY. . . . . . . . .  757
      106   GRP-7-7-ENTRY. . . . . . . . .  761
       88   GRP2-ENTRY . . . . . . . . . .  475 491 506 521 630 670 883 930
       90   GRP3-ENTRY . . . . . . . . . .  550 569 584 601 673 935
      261   HYPHEN-LINE. . . . . . . . . .  308 310 350
      227   ID-AGAIN . . . . . . . . . . .  M273
      113   IDX-VALU . . . . . . . . . . .  M425 M535 M613 M640 M652 M684 M698 M711 M773 M787 M801 M815 M829 M843 M857 M953
                                            M964
       86   IDX-1. . . . . . . . . . . . .  M394 397 398 400 402 M410 414 425 M435 439 M447 451 M459 M473 478 M488 494 M502
                                            509 M518 522 M548 551 M564 572 M580 587 M597 604 M627 640 M666 684 M870 M878
                                            M880 M923 953
       88   IDX-2. . . . . . . . . . . . .  M395 399 400 402 M473 478 M490 494 M504 509 M520 522 535 M548 551 M565 572 M580
                                            587 M598 604 M627 652 M666 698 M879 M929 964
       90   IDX-3. . . . . . . . . . . . .  M396 401 402 M548 551 M567 572 M581 587 M599 604 613 M666 711 M934
      260   INF-ANSI-REFERENCE . . . . . .  M362 M365 M378 M380
      255   INFO-TEXT. . . . . . . . . . .  M363
      184   INSPECT-COUNTER. . . . . . . .  M283 314 336 338
       94   IX-1 . . . . . . . . . . . . .  M729 773 M985 M1045
       96   IX-2 . . . . . . . . . . . . .  M729 787 M985 M1045
       98   IX-3 . . . . . . . . . . . . .  M729 801 M985 M1045
      100   IX-4 . . . . . . . . . . . . .  M729 815 M985 M1045
      102   IX-5 . . . . . . . . . . . . .  M729 829 M985 M1045
      104   IX-6 . . . . . . . . . . . . .  M729 843 M985 M1045
      106   IX-7 . . . . . . . . . . . . .  M729 857 M985 M1045
       50   L1-HOLD. . . . . . . . . . . .  M722 739 770 771 785 M978 993 M1038 1053
       51   L2-HOLD. . . . . . . . . . . .  M723 743 784 M980 M994 1000 1006 M1040 M1054 1060 1066
       52   L3-HOLD. . . . . . . . . . . .  M724 747 798 799 M981 M995 1012 1018 M1041 M1055 1072 1078
       53   L4-HOLD. . . . . . . . . . . .  M725 751 812 813 M982 M997 1024 1030 M1042 M1057 1084 1090
       54   L5-HOLD. . . . . . . . . . . .  M726 755 826 827
       55   L6-HOLD. . . . . . . . . . . .  M727 759 840 841
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    25
0 Defined   Cross-reference of data names   References

0      56   L7-HOLD. . . . . . . . . . . .  M728 763 854 855
      116   NOTE-1
      122   NOTE-2
       57   N1 . . . . . . . . . . . . . .  M730 M737 739 743 747 751 755 759 763 M984 M992 993 M1044 M1052 1053
       58   N2 . . . . . . . . . . . . . .  M730 M741 743 747 751 755 759 763
       59   N3 . . . . . . . . . . . . . .  M730 M745 747 751 755 759 763
       60   N4 . . . . . . . . . . . . . .  M730 M749 751 755 759 763
       61   N5 . . . . . . . . . . . . . .  M730 M753 755 759 763
       62   N6 . . . . . . . . . . . . . .  M730 M757 759 763
       63   N7 . . . . . . . . . . . . . .  M730 M761 763
      132   P-OR-F . . . . . . . . . . . .  M283 M284 M285 M286 293 M296
      134   PAR-NAME . . . . . . . . . . .  M298 M406 M431 M443 M455 M470 M484 M500 M514 M544 M560 M578 M592 M622 M661 M719
                                            M867 M875 M922 M975 M999 M1011 M1023 M1036 M1059 M1071 M1083
      136   PARDOT-X . . . . . . . . . . .  M290
      185   PASS-COUNTER . . . . . . . . .  M284 316 318
       36   PRINT-FILE . . . . . . . . . .  32 272 278
       37   PRINT-REC. . . . . . . . . . .  M292 M368 M370
      139   RE-MARK. . . . . . . . . . . .  M287 M299 M423 M426 M536 M539 M614 M617 M641 M644 M653 M656 M685 M688 M697 M701
                                            M710 M714 M774 M778 M788 M792 M802 M806 M816 M820 M830 M834 M844 M848 M858 M862
                                            M893 M904 M911 M939 M952 M956 M965 M968 M1004 M1016 M1028 M1064 M1076 M1088
      181   REC-CT . . . . . . . . . . . .  289 291 298 M983 M1009 M1021 M1043 M1069 M1081
      180   REC-SKL-SUB
      189   RECORD-COUNT . . . . . . . . .  M343 344 M352
       70   SEC-GRP. . . . . . . . . . . .  M397
       47   SEC-HOLD-AREA. . . . . . . . .  M471 478 M485 494 M501 509 M515 522 532 533 M625 631 649 650 M663 672 694 695
       68   SEC-NAME . . . . . . . . . . .  400
       40   SUB-1. . . . . . . . . . . . .  M387 388 394 M472 M486 M505 M516 533 538 M546 M561 M579 M594 611 616
       41   SUB-2. . . . . . . . . . . . .  M389 389 395 M408 421 422 M433 M445 M457 M472 M487 M505 M517 533 538 M546 M562
                                            M579 M595 611 616
       42   SUB-3. . . . . . . . . . . . .  M390 390 396 M546 M563 M579 M596 611 616
      140   TEST-COMPUTED. . . . . . . . .  368
      155   TEST-CORRECT . . . . . . . . .  370
      208   TEST-ID. . . . . . . . . . . .  M273
      128   TEST-RESULTS . . . . . . . . .  M274 292
      186   TOTAL-ERROR
      257   XXCOMPUTED . . . . . . . . . .  M377
      259   XXCORRECT. . . . . . . . . . .  M377
      252   XXINFO . . . . . . . . . . . .  364 379
       85   3-DIMENSION-TBL
       93   7-DIMENSION-TBL. . . . . . . .  M721
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    26
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

      373   BAIL-OUT . . . . . . . . . . .  P295
      381   BAIL-OUT-EX. . . . . . . . . .  E295 G375
      376   BAIL-OUT-WRITE . . . . . . . .  G374
      357   BLANK-LINE-PRINT
     1104   CCVS-EXIT
     1105   CCVS-999999
      270   CCVS1
      382   CCVS1-EXIT . . . . . . . . . .  G276
      404   CHECK-ENTRIES. . . . . . . . .  G391
      277   CLOSE-FILES. . . . . . . . . .  G1106
      305   COLUMN-NAMES-ROUTINE . . . . .  E275
      286   DE-LETE. . . . . . . . . . . .  P733 P988 P1048
      609   ELEM-FAIL-PARA . . . . . . . .  P553 P570 P585 P602
      309   END-ROUTINE. . . . . . . . . .  P278
      313   END-ROUTINE-1
      322   END-ROUTINE-12
      330   END-ROUTINE-13 . . . . . . . .  E278
      311   END-RTN-EXIT
     1102   END-SEARCH-TEST. . . . . . . .  G1050 G1094
      285   FAIL . . . . . . . . . . . . .  P1007 P1019 P1031 P1067 P1079 P1091 P1100
      359   FAIL-ROUTINE . . . . . . . . .  P294
      372   FAIL-ROUTINE-EX. . . . . . . .  E294 G366
      367   FAIL-ROUTINE-WRITE . . . . . .  G360 G361
     1099   FAIL-TH. . . . . . . . . . . .  P429 P541 P619 P646 P658 P690 P703 P716 P780 P794 P808 P822 P836 P850 P864 P897
                                            P905 P913 P942 P959 P971
      419   GRP-FAIL-PARGRAPH. . . . . . .  P412 P437 P449 P462
      300   HEAD-ROUTINE . . . . . . . . .  P275
      283   INSPT
      430   LEVEL-1-TEST-2 . . . . . . . .  G413 G417
      442   LEVEL-1-TEST-3 . . . . . . . .  G438
      454   LEVEL-1-TEST-4 . . . . . . . .  G450
      468   LEVEL-2-TEST-1 . . . . . . . .  G463
      483   LEVEL-2-TEST-2 . . . . . . . .  G477
      499   LEVEL-2-TEST-3 . . . . . . . .  G493
      513   LEVEL-2-TEST-4 . . . . . . . .  G508
      543   LEVEL-3-TEST-1 . . . . . . . .  G525 G529
      559   LEVEL-3-TEST-2 . . . . . . . .  G554
      577   LEVEL-3-TEST-3 . . . . . . . .  G571
      591   LEVEL-3-TEST-4 . . . . . . . .  G586
      648   MULT-SEARCH-FAIL . . . . . . .  G630
      636   MULT-SEARCH-FAIL1. . . . . . .  G628
      621   MULT-SEARCH-TEST-1 . . . . . .  G603 G608
      660   MULT-SEARCH-TEST-2 . . . . . .  G635 G647
      680   MULT-SEARCH-2-FAIL . . . . . .  G668
      693   MULT-SEARCH-3-FAIL . . . . . .  G671
      706   MULT-SEARCH-4-FAIL . . . . . .  G674
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    27
0 Defined   Cross-reference of procedures   References

0     732   MULT-SEARCH-7-DELETE-3
      769   MULT-SEARCH-7-FAIL-1 . . . . .  G738
      783   MULT-SEARCH-7-FAIL-2 . . . . .  G742
      797   MULT-SEARCH-7-FAIL-3 . . . . .  G746
      811   MULT-SEARCH-7-FAIL-4 . . . . .  G750
      825   MULT-SEARCH-7-FAIL-5 . . . . .  G754
      839   MULT-SEARCH-7-FAIL-6 . . . . .  G758
      853   MULT-SEARCH-7-FAIL-7 . . . . .  G762
      718   MULT-SEARCH-7-INIT-3 . . . . .  G678 G691 G704
      736   MULT-SEARCH-7-TEST-3 . . . . .  G731
      271   OPEN-FILES
      393   PARA-1 . . . . . . . . . . . .  P387
      284   PASS . . . . . . . . . . . . .  P1001 P1013 P1025 P1061 P1073 P1085 P1097
     1096   PASS-TH. . . . . . . . . . . .  P416 P441 P453 P466 P481 P497 P512 P528 P557 P575 P590 P607 P634 P677 P766 P889
                                            P918 P946
      464   PASS-TH-TEST-4 . . . . . . . .  G461
      526   PASS-TH-2-4. . . . . . . . . .  G523
      555   PASS-TH-3-1. . . . . . . . . .  G552
      288   PRINT-DETAIL . . . . . . . . .  P734 P989 P1002 P1008 P1014 P1020 P1026 P1032 P1049 P1062 P1068 P1074 P1080 P1086
                                            P1092 P1098 P1101
      987   SEARCH-DELETE-1
     1047   SEARCH-DELETE-2
      974   SEARCH-INIT-1. . . . . . . . .  G943 G947 G960
     1035   SEARCH-INIT-2. . . . . . . . .  G990
      991   SEARCH-TEST-1-0. . . . . . . .  G986
      998   SEARCH-TEST-1-1
     1010   SEARCH-TEST-1-2
     1022   SEARCH-TEST-1-3
     1051   SEARCH-TEST-2-0. . . . . . . .  G1046
     1058   SEARCH-TEST-2-1
     1070   SEARCH-TEST-2-2
     1082   SEARCH-TEST-2-3
      531   SEC-FAIL-PARGRAF . . . . . . .  P476 P492 P507 P524
      384   SECT-NC231A-001
      892   SPEC-FAIL-PARAGRAPH-1. . . . .  G873
      900   SPEC-FAIL-PARAGRAPH-2. . . . .  G881
      908   SPEC-FAIL-PARAGRAPH-3. . . . .  G886
      949   SPEC-FAIL-PARAGRAPH-4. . . . .  G926
      961   SPEC-FAIL-PARAGRAPH-5. . . . .  G931
      887   SPEC-PASS-PARAGRAPH-1. . . . .  G872
      916   SPEC-PASS-PARAGRAPH-2. . . . .  G884
      944   SPEC-PASS-PARAGRAPH-3. . . . .  G936
      866   SPECIAL-TEST-1 . . . . . . . .  G735 G767 G781 G795 G809 G823 G837 G851
      874   SPECIAL-2-LEVEL-SEARCH . . . .  G890 G898
      921   SPECIAL-3-LEVEL-SEARCH . . . .  G906 G914 G919
      281   TERMINATE-CALL
      279   TERMINATE-CCVS
      385   TH-01-001
      342   WRITE-LINE . . . . . . . . . .  P292 P293 P301 P302 P303 P304 P306 P307 P308 P310 P312 P321 P329 P335 P340 P341
                                            P364 P368 P370 P379
      354   WRT-LN . . . . . . . . . . . .  P348 P349 P350 P353 P358
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    28
0 Defined   Cross-reference of programs     References

        3   NC231A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC231A    Date 06/04/2022  Time 11:59:24   Page    29
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC231A:
 *    Source records = 1106
 *    Data Division statements = 123
 *    Procedure Division statements = 649
 *    Generated COBOL statements = 0
 *    Program complexity factor = 661
0End of compilation 1,  program NC231A,  highest severity 0.
0Return code 0
