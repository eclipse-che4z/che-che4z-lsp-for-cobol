1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:51   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:51   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2404.2
   000002         000200 PROGRAM-ID.                                                      NC2404.2
   000003         000300     NC240A.                                                      NC2404.2
   000004         000400                                                                  NC2404.2
   000005         000600*                                                              *  NC2404.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2404.2
   000007         000800*                                                              *  NC2404.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2404.2
   000009         001000*                                                              *  NC2404.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2404.2
   000011         001200*                                                              *  NC2404.2
   000012         001400*                                                              *  NC2404.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2404.2
   000014         001600*                                                              *  NC2404.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2404.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2404.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2404.2
   000018         002000*                                                              *  NC2404.2
   000019         002200*                                                              *  NC2404.2
   000020         002300*    PROGRAM NC240A TESTS THE CONSTRUCTION AND ACCESS OF A     *  NC2404.2
   000021         002400*    THREE-DIMENSIONAL TABLE USING SUBSCRIPTS.  THE CONTENT OF *  NC2404.2
   000022         002500*    TABLE ELEMENTS IS VERIFIED BY USE OF THE FORMAT 4         *  NC2404.2
   000023         002600*    "PERFORM" STATEMENT.                                      *  NC2404.2
   000024         002700*                                                              *  NC2404.2
   000025         002900                                                                  NC2404.2
   000026         003000 ENVIRONMENT DIVISION.                                            NC2404.2
   000027         003100 CONFIGURATION SECTION.                                           NC2404.2
   000028         003200 SOURCE-COMPUTER.                                                 NC2404.2
   000029         003300     XXXXX082.                                                    NC2404.2
   000030         003400 OBJECT-COMPUTER.                                                 NC2404.2
   000031         003500     XXXXX083.                                                    NC2404.2
   000032         003600 INPUT-OUTPUT SECTION.                                            NC2404.2
   000033         003700 FILE-CONTROL.                                                    NC2404.2
   000034         003800     SELECT PRINT-FILE ASSIGN TO                                  NC2404.2 38
   000035         003900     XXXXX055.                                                    NC2404.2
   000036         004000 DATA DIVISION.                                                   NC2404.2
   000037         004100 FILE SECTION.                                                    NC2404.2
   000038         004200 FD  PRINT-FILE.                                                  NC2404.2

 ==000038==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000039         004300 01  PRINT-REC PICTURE X(120).                                    NC2404.2
   000040         004400 01  DUMMY-RECORD PICTURE X(120).                                 NC2404.2
   000041         004500 WORKING-STORAGE SECTION.                                         NC2404.2
   000042         004600 77  SUB-1              PICTURE S99   VALUE ZERO.                 NC2404.2 IMP
   000043         004700 77  SUB-2              PICTURE 99    VALUE ZERO.                 NC2404.2 IMP
   000044         004800 77  SUB-3              PICTURE 99    VALUE ZERO.                 NC2404.2 IMP
   000045         004900 77   TEST-CHECK PIC X(4) VALUE SPACE.                            NC2404.2 IMP
   000046         005000 77  CON-10             PICTURE 99  VALUE 10.                     NC2404.2
   000047         005100 77  CON-7              PICTURE 99  VALUE 07.                     NC2404.2
   000048         005200 77  ELEM-HOLD-AREA               PICTURE X(15) VALUE SPACES.     NC2404.2 IMP
   000049         005300 77  CON-5              PICTURE 99  VALUE 05.                     NC2404.2
   000050         005400 77  SEC-HOLD-AREA                PICTURE X(11)  VALUE SPACES.    NC2404.2 IMP
   000051         005500 77  CON-6              PICTURE 99  VALUE 06.                     NC2404.2
   000052         005600 77  GRP-HOLD-AREA                PICTURE X(5)  VALUE SPACES.     NC2404.2 IMP
   000053         005700 01  GRP-NAME.                                                    NC2404.2
   000054         005800     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2404.2
   000056         006000                                                                  NC2404.2
   000057         006100 01  SEC-NAME.                                                    NC2404.2
   000058         006200     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2404.2
   000059         006300     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2404.2
   000060         006400     02  FILLER              PICTURE X      VALUE ",".            NC2404.2
   000061         006500     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2404.2
   000062         006600     02  FILLER              PICTURE X      VALUE ")".            NC2404.2
   000063         006700                                                                  NC2404.2
   000064         006800 01  ELEM-NAME.                                                   NC2404.2
   000065         006900     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2404.2
   000066         007000     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2404.2
   000067         007100     02  FILLER              PICTURE X      VALUE ",".            NC2404.2
   000068         007200     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2404.2
   000069         007300     02  FILLER              PICTURE X      VALUE ",".            NC2404.2
   000070         007400     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2404.2
   000071         007500     02  FILLER              PICTURE X      VALUE ")".            NC2404.2
   000072         007600                                                                  NC2404.2
   000073         007700 01  3-DIMENSION-TBL.                                             NC2404.2
   000074         007800     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2404.2
   000075         007900         03  ENTRY-1         PICTURE X(5).                        NC2404.2
   000076         008000         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2404.2
   000077         008100             04  ENTRY-2     PICTURE X(11).                       NC2404.2
   000078         008200             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC2404.2
   000079         008300                 05  ENTRY-3 PICTURE X(15).                       NC2404.2
   000080         008400 01  TEST-RESULTS.                                                NC2404.2
   000081         008500     02 FILLER                   PIC X      VALUE SPACE.          NC2404.2 IMP
   000082         008600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2404.2 IMP
   000083         008700     02 FILLER                   PIC X      VALUE SPACE.          NC2404.2 IMP
   000084         008800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2404.2 IMP
   000085         008900     02 FILLER                   PIC X      VALUE SPACE.          NC2404.2 IMP
   000086         009000     02  PAR-NAME.                                                NC2404.2
   000087         009100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2404.2 IMP
   000088         009200       03  PARDOT-X              PIC X      VALUE SPACE.          NC2404.2 IMP
   000089         009300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2404.2 IMP
   000090         009400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2404.2 IMP
   000091         009500     02 RE-MARK                  PIC X(61).                       NC2404.2
   000092         009600 01  TEST-COMPUTED.                                               NC2404.2
   000093         009700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2404.2 IMP
   000094         009800     02 FILLER                   PIC X(17)  VALUE                 NC2404.2
   000095         009900            "       COMPUTED=".                                   NC2404.2
   000096         010000     02 COMPUTED-X.                                               NC2404.2
   000097         010100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2404.2 IMP
   000098         010200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2404.2 97
   000099         010300                                 PIC -9(9).9(9).                  NC2404.2
   000100         010400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2404.2 97
   000101         010500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2404.2 97
   000102         010600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2404.2 97
   000103         010700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2404.2 97
   000104         010800         04 COMPUTED-18V0                    PIC -9(18).          NC2404.2
   000105         010900         04 FILLER                           PIC X.               NC2404.2
   000106         011000     03 FILLER PIC X(50) VALUE SPACE.                             NC2404.2 IMP
   000107         011100 01  TEST-CORRECT.                                                NC2404.2
   000108         011200     02 FILLER PIC X(30) VALUE SPACE.                             NC2404.2 IMP
   000109         011300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2404.2
   000110         011400     02 CORRECT-X.                                                NC2404.2
   000111         011500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2404.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2404.2 111
   000113         011700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2404.2 111
   000114         011800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2404.2 111
   000115         011900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2404.2 111
   000116         012000     03      CR-18V0 REDEFINES CORRECT-A.                         NC2404.2 111
   000117         012100         04 CORRECT-18V0                     PIC -9(18).          NC2404.2
   000118         012200         04 FILLER                           PIC X.               NC2404.2
   000119         012300     03 FILLER PIC X(2) VALUE SPACE.                              NC2404.2 IMP
   000120         012400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2404.2 IMP
   000121         012500 01  CCVS-C-1.                                                    NC2404.2
   000122         012600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2404.2
   000123         012700-    "SS  PARAGRAPH-NAME                                          NC2404.2
   000124         012800-    "       REMARKS".                                            NC2404.2
   000125         012900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2404.2 IMP
   000126         013000 01  CCVS-C-2.                                                    NC2404.2
   000127         013100     02 FILLER                     PIC X        VALUE SPACE.      NC2404.2 IMP
   000128         013200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2404.2
   000129         013300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2404.2 IMP
   000130         013400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2404.2
   000131         013500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2404.2 IMP
   000132         013600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2404.2 IMP
   000133         013700 01  REC-CT                        PIC 99       VALUE ZERO.       NC2404.2 IMP
   000134         013800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2404.2 IMP
   000135         013900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2404.2 IMP
   000136         014000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2404.2 IMP
   000137         014100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2404.2 IMP
   000138         014200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2404.2 IMP
   000139         014300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2404.2 IMP
   000140         014400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2404.2 IMP
   000141         014500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2404.2 IMP
   000142         014600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2404.2 IMP
   000143         014700 01  CCVS-H-1.                                                    NC2404.2
   000144         014800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2404.2 IMP
   000145         014900     02  FILLER                    PIC X(42)    VALUE             NC2404.2
   000146         015000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2404.2
   000147         015100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2404.2 IMP
   000148         015200 01  CCVS-H-2A.                                                   NC2404.2
   000149         015300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2404.2 IMP
   000150         015400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2404.2
   000151         015500   02  FILLER                        PIC XXXX   VALUE             NC2404.2
   000152         015600     "4.2 ".                                                      NC2404.2
   000153         015700   02  FILLER                        PIC X(28)  VALUE             NC2404.2
   000154         015800            " COPY - NOT FOR DISTRIBUTION".                       NC2404.2
   000155         015900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2404.2 IMP
   000156         016000                                                                  NC2404.2
   000157         016100 01  CCVS-H-2B.                                                   NC2404.2
   000158         016200   02  FILLER                        PIC X(15)  VALUE             NC2404.2
   000159         016300            "TEST RESULT OF ".                                    NC2404.2
   000160         016400   02  TEST-ID                       PIC X(9).                    NC2404.2
   000161         016500   02  FILLER                        PIC X(4)   VALUE             NC2404.2
   000162         016600            " IN ".                                               NC2404.2
   000163         016700   02  FILLER                        PIC X(12)  VALUE             NC2404.2
   000164         016800     " HIGH       ".                                              NC2404.2
   000165         016900   02  FILLER                        PIC X(22)  VALUE             NC2404.2
   000166         017000            " LEVEL VALIDATION FOR ".                             NC2404.2
   000167         017100   02  FILLER                        PIC X(58)  VALUE             NC2404.2
   000168         017200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  CCVS-H-3.                                                    NC2404.2
   000170         017400     02  FILLER                      PIC X(34)  VALUE             NC2404.2
   000171         017500            " FOR OFFICIAL USE ONLY    ".                         NC2404.2
   000172         017600     02  FILLER                      PIC X(58)  VALUE             NC2404.2
   000173         017700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2404.2
   000174         017800     02  FILLER                      PIC X(28)  VALUE             NC2404.2
   000175         017900            "  COPYRIGHT   1985 ".                                NC2404.2
   000176         018000 01  CCVS-E-1.                                                    NC2404.2
   000177         018100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2404.2 IMP
   000178         018200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2404.2
   000179         018300     02 ID-AGAIN                     PIC X(9).                    NC2404.2
   000180         018400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2404.2 IMP
   000181         018500 01  CCVS-E-2.                                                    NC2404.2
   000182         018600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2404.2 IMP
   000183         018700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2404.2 IMP
   000184         018800     02 CCVS-E-2-2.                                               NC2404.2
   000185         018900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2404.2 IMP
   000186         019000         03 FILLER                   PIC X      VALUE SPACE.      NC2404.2 IMP
   000187         019100         03 ENDER-DESC               PIC X(44)  VALUE             NC2404.2
   000188         019200            "ERRORS ENCOUNTERED".                                 NC2404.2
   000189         019300 01  CCVS-E-3.                                                    NC2404.2
   000190         019400     02  FILLER                      PIC X(22)  VALUE             NC2404.2
   000191         019500            " FOR OFFICIAL USE ONLY".                             NC2404.2
   000192         019600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2404.2 IMP
   000193         019700     02  FILLER                      PIC X(58)  VALUE             NC2404.2
   000194         019800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2404.2
   000195         019900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2404.2 IMP
   000196         020000     02 FILLER                       PIC X(15)  VALUE             NC2404.2
   000197         020100             " COPYRIGHT 1985".                                   NC2404.2
   000198         020200 01  CCVS-E-4.                                                    NC2404.2
   000199         020300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2404.2 IMP
   000200         020400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2404.2
   000201         020500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2404.2 IMP
   000202         020600     02 FILLER                       PIC X(40)  VALUE             NC2404.2
   000203         020700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2404.2
   000204         020800 01  XXINFO.                                                      NC2404.2
   000205         020900     02 FILLER                       PIC X(19)  VALUE             NC2404.2
   000206         021000            "*** INFORMATION ***".                                NC2404.2
   000207         021100     02 INFO-TEXT.                                                NC2404.2
   000208         021200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2404.2 IMP
   000209         021300       04 XXCOMPUTED                 PIC X(20).                   NC2404.2
   000210         021400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2404.2 IMP
   000211         021500       04 XXCORRECT                  PIC X(20).                   NC2404.2
   000212         021600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2404.2
   000213         021700 01  HYPHEN-LINE.                                                 NC2404.2
   000214         021800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2404.2 IMP
   000215         021900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2404.2
   000216         022000-    "*****************************************".                 NC2404.2
   000217         022100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2404.2
   000218         022200-    "******************************".                            NC2404.2
   000219         022300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2404.2
   000220         022400     "NC240A".                                                    NC2404.2
   000221         022500 PROCEDURE DIVISION.                                              NC2404.2
   000222         022600 CCVS1 SECTION.                                                   NC2404.2
   000223         022700 OPEN-FILES.                                                      NC2404.2
   000224         022800     OPEN     OUTPUT PRINT-FILE.                                  NC2404.2 38
   000225         022900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2404.2 219 160 219 179
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE    SPACE TO TEST-RESULTS.                               NC2404.2 IMP 80
   000227         023100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2404.2 252 257
   000228         023200     GO TO CCVS1-EXIT.                                            NC2404.2 334
   000229         023300 CLOSE-FILES.                                                     NC2404.2
   000230         023400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2404.2 261 282 38
   000231         023500 TERMINATE-CCVS.                                                  NC2404.2
   000232         023600     EXIT PROGRAM.                                                NC2404.2
   000233         023700 TERMINATE-CALL.                                                  NC2404.2
   000234         023800     STOP     RUN.                                                NC2404.2
   000235         023900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2404.2 84 136
   000236         024000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2404.2 84 137
   000237         024100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2404.2 84 135
   000238         024200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2404.2 84 134
   000239         024300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2404.2 91
   000240         024400 PRINT-DETAIL.                                                    NC2404.2
   000241         024500     IF REC-CT NOT EQUAL TO ZERO                                  NC2404.2 133 IMP
   000242      1  024600             MOVE "." TO PARDOT-X                                 NC2404.2 88
   000243      1  024700             MOVE REC-CT TO DOTVALUE.                             NC2404.2 133 89
   000244         024800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2404.2 80 39 294
   000245         024900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2404.2 84 294
   000246      1  025000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2404.2 311 324
   000247      1  025100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2404.2 325 333
   000248         025200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2404.2 IMP 84 IMP 96
   000249         025300     MOVE SPACE TO CORRECT-X.                                     NC2404.2 IMP 110
   000250         025400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2404.2 133 IMP IMP 86
   000251         025500     MOVE     SPACE TO RE-MARK.                                   NC2404.2 IMP 91
   000252         025600 HEAD-ROUTINE.                                                    NC2404.2
   000253         025700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2404.2 143 40 294
   000254         025800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2404.2 148 40 294
   000255         025900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2404.2 157 40 294
   000256         026000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2404.2 169 40 294
   000257         026100 COLUMN-NAMES-ROUTINE.                                            NC2404.2
   000258         026200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2404.2 121 40 294
   000259         026300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2404.2 126 40 294
   000260         026400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2404.2 213 40 294
   000261         026500 END-ROUTINE.                                                     NC2404.2
   000262         026600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2404.2 213 40 294
   000263         026700 END-RTN-EXIT.                                                    NC2404.2
   000264         026800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2404.2 176 40 294
   000265         026900 END-ROUTINE-1.                                                   NC2404.2
   000266         027000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2404.2 135 139 136
   000267         027100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2404.2 139 134 139
   000268         027200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2404.2 137 139
   000269         027300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2404.2
   000270         027400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2404.2 137 199
   000271         027500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2404.2 139 201
   000272         027600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2404.2 198 184
   000273         027700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2404.2 181 40 294
   000274         027800  END-ROUTINE-12.                                                 NC2404.2
   000275         027900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2404.2 187
   000276         028000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2404.2 135 IMP
   000277      1  028100         MOVE "NO " TO ERROR-TOTAL                                NC2404.2 185
   000278         028200         ELSE                                                     NC2404.2
   000279      1  028300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2404.2 135 185
   000280         028400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2404.2 181 40
   000281         028500     PERFORM WRITE-LINE.                                          NC2404.2 294
   000282         028600 END-ROUTINE-13.                                                  NC2404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2404.2 134 IMP
   000284      1  028800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2404.2 185
   000285      1  028900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2404.2 134 185
   000286         029000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2404.2 187
   000287         029100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2404.2 181 40 294
   000288         029200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2404.2 136 IMP
   000289      1  029300          MOVE "NO " TO ERROR-TOTAL                               NC2404.2 185
   000290      1  029400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2404.2 136 185
   000291         029500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2404.2 187
   000292         029600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2404.2 181 40 294
   000293         029700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2404.2 189 40 294
   000294         029800 WRITE-LINE.                                                      NC2404.2
   000295         029900     ADD 1 TO RECORD-COUNT.                                       NC2404.2 141
   000296         030000     IF RECORD-COUNT GREATER 50                                   NC2404.2 141
   000297      1  030100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2404.2 40 140
   000298      1  030200         MOVE SPACE TO DUMMY-RECORD                               NC2404.2 IMP 40
   000299      1  030300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2404.2 40
   000300      1  030400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2404.2 121 40 306
   000301      1  030500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2404.2 126 40 306
   000302      1  030600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2404.2 213 40 306
   000303      1  030700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2404.2 140 40
   000304      1  030800         MOVE ZERO TO RECORD-COUNT.                               NC2404.2 IMP 141
   000305         030900     PERFORM WRT-LN.                                              NC2404.2 306
   000306         031000 WRT-LN.                                                          NC2404.2
   000307         031100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2404.2 40
   000308         031200     MOVE SPACE TO DUMMY-RECORD.                                  NC2404.2 IMP 40
   000309         031300 BLANK-LINE-PRINT.                                                NC2404.2
   000310         031400     PERFORM WRT-LN.                                              NC2404.2 306
   000311         031500 FAIL-ROUTINE.                                                    NC2404.2
   000312         031600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2404.2 96 IMP 319
   000313         031700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2404.2 110 IMP 319
   000314         031800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2404.2 142 212
   000315         031900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2404.2 207
   000316         032000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2404.2 204 40 294
   000317         032100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2404.2 IMP 212
   000318         032200     GO TO  FAIL-ROUTINE-EX.                                      NC2404.2 324
   000319         032300 FAIL-ROUTINE-WRITE.                                              NC2404.2
   000320         032400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2404.2 92 39 294
   000321         032500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2404.2 142 120
   000322         032600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2404.2 107 39 294
   000323         032700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2404.2 IMP 120
   000324         032800 FAIL-ROUTINE-EX. EXIT.                                           NC2404.2
   000325         032900 BAIL-OUT.                                                        NC2404.2
   000326         033000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2404.2 97 IMP 328
   000327         033100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2404.2 111 IMP 333
   000328         033200 BAIL-OUT-WRITE.                                                  NC2404.2
   000329         033300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2404.2 111 211 97 209
   000330         033400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2404.2 142 212
   000331         033500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2404.2 204 40 294
   000332         033600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2404.2 IMP 212
   000333         033700 BAIL-OUT-EX. EXIT.                                               NC2404.2
   000334         033800 CCVS1-EXIT.                                                      NC2404.2
   000335         033900     EXIT.                                                        NC2404.2
   000336         034000 SECT-NC24A-0001 SECTION.                                         NC2404.2
   000337         034100 TH-13-001.                                                       NC2404.2
   000338         034200 BUILD-LEVEL-1.                                                   NC2404.2

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0==000338==> IGYPS2015-I The paragraph or section prior to paragraph or section "BUILD-LEVEL-1"
                         did not contain any statements.

   000339         034300     ADD 1 TO SUB-1.                                              NC2404.2 42
   000340         034400     IF SUB-1 = 11 GO TO CHECK-ENTRIES.                           NC2404.2 42 366
   000341         034500     MOVE GRP-NAME TO ENTRY-1 (SUB-1).                            NC2404.2 53 75 42
   000342         034600     ADD 1 TO ADD-GRP.                                            NC2404.2 55
   000343         034700                                                                  NC2404.2
   000344         034800 BUILD-LEVEL-2.                                                   NC2404.2
   000345         034900     ADD 1 TO SUB-2.                                              NC2404.2 43
   000346         035000     IF SUB-2 = 11                                                NC2404.2 43
   000347      1  035100         MOVE ZERO TO SUB-2                                       NC2404.2 IMP 43
   000348      1  035200         MOVE 01 TO ADD-SEC                                       NC2404.2 61
   000349      1  035300         GO TO BUILD-LEVEL-1.                                     NC2404.2 338
   000350         035400     MOVE SUB-1 TO SEC-GRP.                                       NC2404.2 42 59
   000351         035500     MOVE SEC-NAME TO ENTRY-2 (SUB-1, SUB-2).                     NC2404.2 57 77 42 43
   000352         035600     ADD 1 TO ADD-SEC.                                            NC2404.2 61
   000353         035700                                                                  NC2404.2
   000354         035800 BUILD-LEVEL-3.                                                   NC2404.2
   000355         035900     ADD 1 TO SUB-3.                                              NC2404.2 44
   000356         036000     IF SUB-3 = 11                                                NC2404.2 44
   000357      1  036100         MOVE ZERO TO SUB-3                                       NC2404.2 IMP 44
   000358      1  036200              MOVE 01 TO ADD-ELEM                                 NC2404.2 70
   000359      1  036300              GO TO BUILD-LEVEL-2.                                NC2404.2 344
   000360         036400     MOVE SUB-1 TO ELEM-GRP.                                      NC2404.2 42 66
   000361         036500     MOVE SUB-2 TO ELEM-SEC.                                      NC2404.2 43 68
   000362         036600     MOVE ELEM-NAME TO ENTRY-3 (SUB-1, SUB-2, SUB-3).             NC2404.2 64 79 42 43 44
   000363         036700     ADD 1 TO ADD-ELEM.                                           NC2404.2 70
   000364         036800     GO TO BUILD-LEVEL-3.                                         NC2404.2 354
   000365         036900                                                                  NC2404.2
   000366         037000 CHECK-ENTRIES.                                                   NC2404.2
   000367         037100     MOVE "PERFORM VARYING LEV1" TO FEATURE.                      NC2404.2 82
   000368         037200     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC2404.2 86
   000369         037300     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000370         037400     MOVE "GRP05" TO GRP-HOLD-AREA.                               NC2404.2 52
   000371         037500     PERFORM FIND-LEVEL-1-ENTRY VARYING CON-5 FROM 1 BY 1         NC2404.2 456 49
   000372         037600         UNTIL CON-5 = 11.                                        NC2404.2 49
   000373         037700     IF TEST-CHECK = "PASS" GO TO TH1-INIT-GF-2.                  NC2404.2 45 381
   000374         037800     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2404.2 52 111
   000375         037900     MOVE ENTRY-1 (05) TO COMPUTED-A.                             NC2404.2 75 97
   000376         038000                                                                  NC2404.2
   000377         038100     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000378         038200     PERFORM FAIL.                                                NC2404.2 237
   000379         038300     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000380         038400*                                                                 NC2404.2
   000381         038500 TH1-INIT-GF-2.                                                   NC2404.2
   000382         038600     MOVE "GRP10" TO GRP-HOLD-AREA.                               NC2404.2 52
   000383         038700     MOVE "TH1-TEST-GF-2      " TO PAR-NAME.                      NC2404.2 86
   000384         038800     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000385         038900     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000386         039000 TH1-TEST-GF-2.                                                   NC2404.2
   000387         039100     PERFORM FIND-LEVEL-1-ENTRY                                   NC2404.2 456
   000388         039200             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11.          NC2404.2 49 49
   000389         039300     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000390      1  039400         PERFORM PASS                                             NC2404.2 236
   000391      1  039500         GO TO TH1-WRITE-GF-2                                     NC2404.2 403
   000392         039600     ELSE                                                         NC2404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393      1  039700         GO TO TH1-FAIL-GF-2.                                     NC2404.2 397
   000394         039800 TH1-DELETE-GF-2.                                                 NC2404.2
   000395         039900     PERFORM DE-LETE.                                             NC2404.2 238
   000396         040000     GO TO TH1-WRITE-GF-2.                                        NC2404.2 403
   000397         040100 TH1-FAIL-GF-2.                                                   NC2404.2
   000398         040200     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2404.2 52 111
   000399         040300     MOVE ENTRY-1 (10) TO COMPUTED-A.                             NC2404.2 75 97
   000400         040400                                                                  NC2404.2
   000401         040500     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000402         040600     PERFORM FAIL.                                                NC2404.2 237
   000403         040700 TH1-WRITE-GF-2.                                                  NC2404.2
   000404         040800     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000405         040900                                                                  NC2404.2
   000406         041000 TH1-INIT-GF-3.                                                   NC2404.2
   000407         041100     MOVE "GRP07" TO GRP-HOLD-AREA.                               NC2404.2 52
   000408         041200     MOVE "TH1-TEST-GF-3      " TO PAR-NAME.                      NC2404.2 86
   000409         041300     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000410         041400     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000411         041500 TH1-TEST-GF-3.                                                   NC2404.2
   000412         041600     PERFORM FIND-LEVEL-1-ENTRY                                   NC2404.2 456
   000413         041700             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11.          NC2404.2 49 49
   000414         041800     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000415      1  041900         PERFORM PASS                                             NC2404.2 236
   000416      1  042000         GO TO TH1-WRITE-GF-3                                     NC2404.2 428
   000417         042100     ELSE                                                         NC2404.2
   000418      1  042200         GO TO TH1-FAIL-GF-3.                                     NC2404.2 422
   000419         042300 TH1-DELETE-GF-3.                                                 NC2404.2
   000420         042400     PERFORM DE-LETE.                                             NC2404.2 238
   000421         042500     GO TO TH1-WRITE-GF-3.                                        NC2404.2 428
   000422         042600 TH1-FAIL-GF-3.                                                   NC2404.2
   000423         042700     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2404.2 52 111
   000424         042800     MOVE ENTRY-1 (07) TO COMPUTED-A.                             NC2404.2 75 97
   000425         042900                                                                  NC2404.2
   000426         043000     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000427         043100     PERFORM FAIL.                                                NC2404.2 237
   000428         043200 TH1-WRITE-GF-3.                                                  NC2404.2
   000429         043300     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000430         043400*                                                                 NC2404.2
   000431         043500 TH1-INIT-GF-4.                                                   NC2404.2
   000432         043600     MOVE "TH1-TEST-GF-4      " TO PAR-NAME.                      NC2404.2 86
   000433         043700     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000434         043800     MOVE "GRP01" TO GRP-HOLD-AREA.                               NC2404.2 52
   000435         043900 TH1-TEST-GF-4.                                                   NC2404.2
   000436         044000     PERFORM FIND-LEVEL-1-ENTRY                                   NC2404.2 456
   000437         044100             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11.          NC2404.2 49 49
   000438         044200     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000439      1  044300         PERFORM PASS                                             NC2404.2 236
   000440      1  044400         GO TO TH1-WRITE-GF-4                                     NC2404.2 452
   000441         044500     ELSE                                                         NC2404.2
   000442      1  044600         GO TO TH1-FAIL-GF-4.                                     NC2404.2 446
   000443         044700 TH1-DELETE-GF-4.                                                 NC2404.2
   000444         044800     PERFORM DE-LETE.                                             NC2404.2 238
   000445         044900     GO TO TH1-WRITE-GF-4.                                        NC2404.2 452
   000446         045000 TH1-FAIL-GF-4.                                                   NC2404.2
   000447         045100     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2404.2 52 111
   000448         045200     MOVE ENTRY-1 (01) TO COMPUTED-A.                             NC2404.2 75 97
   000449         045300                                                                  NC2404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045400     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000451         045500     PERFORM FAIL.                                                NC2404.2 237
   000452         045600 TH1-WRITE-GF-4.                                                  NC2404.2
   000453         045700     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000454         045800     GO TO TH2-INIT-GF-1.                                         NC2404.2 460
   000455         045900                                                                  NC2404.2
   000456         046000 FIND-LEVEL-1-ENTRY.                                              NC2404.2
   000457         046100     IF ENTRY-1 (CON-5) = GRP-HOLD-AREA                           NC2404.2 75 49 52
   000458      1  046200         MOVE "PASS" TO TEST-CHECK.                               NC2404.2 45
   000459         046300                                                                  NC2404.2
   000460         046400 TH2-INIT-GF-1.                                                   NC2404.2
   000461         046500     MOVE "TH2-TEST-GF-1      " TO PAR-NAME.                      NC2404.2 86
   000462         046600     MOVE "PERFORM VARYING LEV2" TO FEATURE.                      NC2404.2 82
   000463         046700     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000464         046800     MOVE "SEC (03,05)" TO SEC-HOLD-AREA.                         NC2404.2 50
   000465         046900     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000466         047000 TH2-TEST-GF-1.                                                   NC2404.2
   000467         047100     PERFORM FIND-LEVEL-2-ENTRY                                   NC2404.2 567
   000468         047200             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2 49 49
   000469         047300             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10.          NC2404.2 51 51
   000470         047400     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000471      1  047500         PERFORM PASS                                             NC2404.2 236
   000472      1  047600         GO TO TH2-WRITE-GF-1                                     NC2404.2 484
   000473         047700     ELSE                                                         NC2404.2
   000474      1  047800         GO TO TH2-FAIL-GF-1.                                     NC2404.2 478
   000475         047900 TH2-DELETE-GF-1.                                                 NC2404.2
   000476         048000     PERFORM DE-LETE.                                             NC2404.2 238
   000477         048100     GO TO TH2-WRITE-GF-1.                                        NC2404.2 484
   000478         048200 TH2-FAIL-GF-1.                                                   NC2404.2
   000479         048300     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2404.2 50 111
   000480         048400     MOVE ENTRY-2 (03, 05) TO COMPUTED-A.                         NC2404.2 77 97
   000481         048500                                                                  NC2404.2
   000482         048600     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000483         048700     PERFORM FAIL.                                                NC2404.2 237
   000484         048800 TH2-WRITE-GF-1.                                                  NC2404.2
   000485         048900     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000486         049000                                                                  NC2404.2
   000487         049100 TH2-INIT-GF-2.                                                   NC2404.2
   000488         049200     MOVE "TH2-TEST-GF-2      " TO PAR-NAME.                      NC2404.2 86
   000489         049300     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000490         049400     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000491         049500     MOVE "SEC (01,01)" TO SEC-HOLD-AREA.                         NC2404.2 50
   000492         049600 TH2-TEST-GF-2.                                                   NC2404.2
   000493         049700     PERFORM FIND-LEVEL-2-ENTRY                                   NC2404.2 567
   000494         049800             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2 49 49
   000495         049900             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10.          NC2404.2 51 51
   000496         050000     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000497      1  050100         PERFORM PASS                                             NC2404.2 236
   000498      1  050200         GO TO TH2-WRITE-GF-2                                     NC2404.2 510
   000499         050300     ELSE                                                         NC2404.2
   000500      1  050400         GO TO TH2-FAIL-GF-2.                                     NC2404.2 504
   000501         050500 TH2-DELETE-GF-2.                                                 NC2404.2
   000502         050600     PERFORM DE-LETE.                                             NC2404.2 238
   000503         050700     GO TO TH2-WRITE-GF-2.                                        NC2404.2 510
   000504         050800 TH2-FAIL-GF-2.                                                   NC2404.2
   000505         050900     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2404.2 50 111
   000506         051000     MOVE ENTRY-2 (01, 01) TO COMPUTED-A.                         NC2404.2 77 97
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100                                                                  NC2404.2
   000508         051200     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000509         051300     PERFORM FAIL.                                                NC2404.2 237
   000510         051400 TH2-WRITE-GF-2.                                                  NC2404.2
   000511         051500     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000512         051600                                                                  NC2404.2
   000513         051700 TH2-INIT-GF-3.                                                   NC2404.2
   000514         051800     MOVE "TH2-TEST-GF-3      " TO PAR-NAME.                      NC2404.2 86
   000515         051900     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000516         052000     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000517         052100     MOVE "SEC (10,01)" TO SEC-HOLD-AREA.                         NC2404.2 50
   000518         052200 TH2-TEST-GF-3.                                                   NC2404.2
   000519         052300     PERFORM FIND-LEVEL-2-ENTRY                                   NC2404.2 567
   000520         052400             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2 49 49
   000521         052500             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10.          NC2404.2 51 51
   000522         052600     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000523      1  052700         PERFORM PASS                                             NC2404.2 236
   000524      1  052800         GO TO TH2-WRITE-GF-3                                     NC2404.2 536
   000525         052900     ELSE                                                         NC2404.2
   000526      1  053000         GO TO TH2-FAIL-GF-3.                                     NC2404.2 530
   000527         053100 TH2-DELETE-GF-3.                                                 NC2404.2
   000528         053200     PERFORM DE-LETE.                                             NC2404.2 238
   000529         053300     GO TO TH2-WRITE-GF-3.                                        NC2404.2 536
   000530         053400 TH2-FAIL-GF-3.                                                   NC2404.2
   000531         053500     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2404.2 50 111
   000532         053600     MOVE ENTRY-2 (10, 01) TO COMPUTED-A.                         NC2404.2 77 97
   000533         053700                                                                  NC2404.2
   000534         053800     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000535         053900     PERFORM FAIL.                                                NC2404.2 237
   000536         054000 TH2-WRITE-GF-3.                                                  NC2404.2
   000537         054100     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000538         054200*                                                                 NC2404.2
   000539         054300 TH2-INIT-GF-4.                                                   NC2404.2
   000540         054400     MOVE "TH2-TEST-GF-4      " TO PAR-NAME.                      NC2404.2 86
   000541         054500     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000542         054600     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000543         054700     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000544         054800     MOVE "SEC (10,10)" TO SEC-HOLD-AREA.                         NC2404.2 50
   000545         054900 TH2-TEST-GF-4.                                                   NC2404.2
   000546         055000     PERFORM FIND-LEVEL-2-ENTRY                                   NC2404.2 567
   000547         055100             VARYING CON-5 FROM 2 BY 2 UNTIL CON-5 = 12           NC2404.2 49 49
   000548         055200             AFTER   CON-6 FROM 2 BY 2 UNTIL CON-6 = 12.          NC2404.2 51 51
   000549         055300     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000550      1  055400         PERFORM PASS                                             NC2404.2 236
   000551      1  055500         GO TO TH2-WRITE-GF-4                                     NC2404.2 563
   000552         055600     ELSE                                                         NC2404.2
   000553      1  055700         GO TO TH2-FAIL-GF-4.                                     NC2404.2 557
   000554         055800 TH2-DELETE-GF-4.                                                 NC2404.2
   000555         055900     PERFORM DE-LETE.                                             NC2404.2 238
   000556         056000     GO TO TH2-WRITE-GF-4.                                        NC2404.2 563
   000557         056100 TH2-FAIL-GF-4.                                                   NC2404.2
   000558         056200     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2404.2 50 111
   000559         056300     MOVE ENTRY-2 (10, 10) TO COMPUTED-A.                         NC2404.2 77 97
   000560         056400                                                                  NC2404.2
   000561         056500     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000562         056600     PERFORM FAIL.                                                NC2404.2 237
   000563         056700 TH2-WRITE-GF-4.                                                  NC2404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000565         056900     GO TO TH3-INIT-GF-1.                                         NC2404.2 571
   000566         057000*                                                                 NC2404.2
   000567         057100 FIND-LEVEL-2-ENTRY.                                              NC2404.2
   000568         057200     IF ENTRY-2 (CON-5, CON-6) = SEC-HOLD-AREA                    NC2404.2 77 49 51 50
   000569      1  057300         MOVE "PASS" TO TEST-CHECK.                               NC2404.2 45
   000570         057400*                                                                 NC2404.2
   000571         057500 TH3-INIT-GF-1.                                                   NC2404.2
   000572         057600     MOVE "PERFORM VARYING LEV3" TO FEATURE.                      NC2404.2 82
   000573         057700     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000574         057800     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000575         057900     MOVE "TH3-TEST-GF-1      " TO PAR-NAME.                      NC2404.2 86
   000576         058000     MOVE "ELEM (01,02,03)" TO ELEM-HOLD-AREA.                    NC2404.2 48
   000577         058100 TH3-TEST-GF-1.                                                   NC2404.2
   000578         058200     PERFORM FIND-LEVEL-3-ENTRY                                   NC2404.2 681
   000579         058300             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2 49 49
   000580         058400             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10           NC2404.2 51 51
   000581         058500             AFTER   CON-7 FROM 1 BY 1 UNTIL CON-7 = 10.          NC2404.2 47 47
   000582         058600     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000583      1  058700         PERFORM PASS                                             NC2404.2 236
   000584      1  058800         GO TO TH3-WRITE-GF-1                                     NC2404.2 596
   000585         058900     ELSE                                                         NC2404.2
   000586      1  059000         GO TO TH3-FAIL-GF-1.                                     NC2404.2 590
   000587         059100 TH3-DELETE-GF-1.                                                 NC2404.2
   000588         059200     PERFORM DE-LETE.                                             NC2404.2 238
   000589         059300     GO TO TH3-WRITE-GF-1.                                        NC2404.2 596
   000590         059400 TH3-FAIL-GF-1.                                                   NC2404.2
   000591         059500     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2404.2 48 111
   000592         059600     MOVE ENTRY-3 (01, 02, 03) TO COMPUTED-A.                     NC2404.2 79 97
   000593         059700                                                                  NC2404.2
   000594         059800     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000595         059900     PERFORM FAIL.                                                NC2404.2 237
   000596         060000 TH3-WRITE-GF-1.                                                  NC2404.2
   000597         060100     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000598         060200                                                                  NC2404.2
   000599         060300 TH3-INIT-GF-2.                                                   NC2404.2
   000600         060400     MOVE "TH3-TEST-GF-2      " TO PAR-NAME.                      NC2404.2 86
   000601         060500     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000602         060600     MOVE "ELEM (10,10,10)" TO ELEM-HOLD-AREA.                    NC2404.2 48
   000603         060700     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000604         060800 TH3-TEST-GF-2.                                                   NC2404.2
   000605         060900     PERFORM FIND-LEVEL-3-ENTRY                                   NC2404.2 681
   000606         061000             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2 49 49
   000607         061100             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 11           NC2404.2 51 51
   000608         061200             AFTER   CON-7 FROM 1 BY 1 UNTIL CON-7 = 11.          NC2404.2 47 47
   000609         061300     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000610      1  061400         PERFORM PASS                                             NC2404.2 236
   000611      1  061500         GO TO TH3-WRITE-GF-2                                     NC2404.2 623
   000612         061600     ELSE                                                         NC2404.2
   000613      1  061700         GO TO TH3-FAIL-GF-2.                                     NC2404.2 617
   000614         061800 TH3-DELETE-GF-2.                                                 NC2404.2
   000615         061900     PERFORM DE-LETE.                                             NC2404.2 238
   000616         062000     GO TO TH3-WRITE-GF-2.                                        NC2404.2 623
   000617         062100 TH3-FAIL-GF-2.                                                   NC2404.2
   000618         062200     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2404.2 48 111
   000619         062300     MOVE ENTRY-3 (10, 10, 10) TO COMPUTED-A.                     NC2404.2 79 97
   000620         062400                                                                  NC2404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621         062500     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000622         062600     PERFORM FAIL.                                                NC2404.2 237
   000623         062700 TH3-WRITE-GF-2.                                                  NC2404.2
   000624         062800     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000625         062900                                                                  NC2404.2
   000626         063000 TH3-INIT-GF-3.                                                   NC2404.2
   000627         063100     MOVE "TH3-TEST-GF-3      " TO PAR-NAME.                      NC2404.2 86
   000628         063200     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000629         063300     MOVE "ELEM (08,07,06)" TO ELEM-HOLD-AREA.                    NC2404.2 48
   000630         063400     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000631         063500 TH3-TEST-GF-3.                                                   NC2404.2
   000632         063600     PERFORM FIND-LEVEL-3-ENTRY                                   NC2404.2 681
   000633         063700             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2 49 49
   000634         063800             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10           NC2404.2 51 51
   000635         063900             AFTER   CON-7 FROM 1 BY 1 UNTIL CON-7 = 10.          NC2404.2 47 47
   000636         064000     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000637      1  064100         PERFORM PASS                                             NC2404.2 236
   000638      1  064200         GO TO TH3-WRITE-GF-3                                     NC2404.2 650
   000639         064300     ELSE                                                         NC2404.2
   000640      1  064400         GO TO TH3-FAIL-GF-3.                                     NC2404.2 644
   000641         064500 TH3-DELETE-GF-3.                                                 NC2404.2
   000642         064600     PERFORM DE-LETE.                                             NC2404.2 238
   000643         064700     GO TO TH3-WRITE-GF-3.                                        NC2404.2 650
   000644         064800 TH3-FAIL-GF-3.                                                   NC2404.2
   000645         064900     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2404.2 48 111
   000646         065000     MOVE ENTRY-3 (08, 07, 06) TO COMPUTED-A.                     NC2404.2 79 97
   000647         065100                                                                  NC2404.2
   000648         065200     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000649         065300     PERFORM FAIL.                                                NC2404.2 237
   000650         065400 TH3-WRITE-GF-3.                                                  NC2404.2
   000651         065500     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000652         065600*                                                                 NC2404.2
   000653         065700 TH3-INIT-GF-4.                                                   NC2404.2
   000654         065800     MOVE "TH3-TEST-GF-4      " TO PAR-NAME.                      NC2404.2 86
   000655         065900     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2 142
   000656         066000     MOVE SPACES TO TEST-CHECK.                                   NC2404.2 IMP 45
   000657         066100     MOVE "ELEM (06,04,08)" TO ELEM-HOLD-AREA.                    NC2404.2 48
   000658         066200 TH3-TEST-GF-4.                                                   NC2404.2
   000659         066300     PERFORM FIND-LEVEL-3-ENTRY                                   NC2404.2 681
   000660         066400             VARYING CON-5 FROM 3 BY 3 UNTIL CON-5 = 12           NC2404.2 49 49
   000661         066500             AFTER   CON-6 FROM 2 BY 2 UNTIL CON-6 = 12           NC2404.2 51 51
   000662         066600             AFTER   CON-7 FROM 8 BY 8 UNTIL CON-7 = 16.          NC2404.2 47 47
   000663         066700     IF TEST-CHECK = "PASS"                                       NC2404.2 45
   000664      1  066800         PERFORM PASS                                             NC2404.2 236
   000665      1  066900         GO TO TH3-WRITE-GF-4                                     NC2404.2 677
   000666         067000     ELSE                                                         NC2404.2
   000667      1  067100         GO TO TH3-FAIL-GF-4.                                     NC2404.2 671
   000668         067200 TH3-DELETE-GF-4.                                                 NC2404.2
   000669         067300     PERFORM DE-LETE.                                             NC2404.2 238
   000670         067400     GO TO TH3-WRITE-GF-4.                                        NC2404.2 677
   000671         067500 TH3-FAIL-GF-4.                                                   NC2404.2
   000672         067600     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2404.2 48 111
   000673         067700     MOVE ENTRY-3 (06, 04, 08) TO COMPUTED-A.                     NC2404.2 79 97
   000674         067800                                                                  NC2404.2
   000675         067900     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2 91
   000676         068000     PERFORM FAIL.                                                NC2404.2 237
   000677         068100 TH3-WRITE-GF-4.                                                  NC2404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000678         068200     PERFORM PRINT-DETAIL.                                        NC2404.2 240
   000679         068300     GO TO END-3LEVEL-TEST.                                       NC2404.2 685
   000680         068400                                                                  NC2404.2
   000681         068500 FIND-LEVEL-3-ENTRY.                                              NC2404.2
   000682         068600     IF ENTRY-3 (CON-5, CON-6, CON-7) = ELEM-HOLD-AREA            NC2404.2 79 49 51 47 48
   000683      1  068700         MOVE "PASS" TO TEST-CHECK.                               NC2404.2 45
   000684         068800                                                                  NC2404.2
   000685         068900 END-3LEVEL-TEST.                                                 NC2404.2
   000686         069000     EXIT.                                                        NC2404.2
   000687         069100 CCVS-EXIT SECTION.                                               NC2404.2
   000688         069200 CCVS-999999.                                                     NC2404.2
   000689         069300     GO TO CLOSE-FILES.                                           NC2404.2 229
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       70   ADD-ELEM . . . . . . . . . . .  M358 M363
       55   ADD-GRP. . . . . . . . . . . .  M342
       61   ADD-SEC. . . . . . . . . . . .  M348 M352
      142   ANSI-REFERENCE . . . . . . . .  314 321 330 M384 M409 M433 M463 M489 M516 M541 M573 M601 M628 M655
      121   CCVS-C-1 . . . . . . . . . . .  258 300
      126   CCVS-C-2 . . . . . . . . . . .  259 301
      176   CCVS-E-1 . . . . . . . . . . .  264
      181   CCVS-E-2 . . . . . . . . . . .  273 280 287 292
      184   CCVS-E-2-2 . . . . . . . . . .  M272
      189   CCVS-E-3 . . . . . . . . . . .  293
      198   CCVS-E-4 . . . . . . . . . . .  272
      199   CCVS-E-4-1 . . . . . . . . . .  M270
      201   CCVS-E-4-2 . . . . . . . . . .  M271
      143   CCVS-H-1 . . . . . . . . . . .  253
      148   CCVS-H-2A. . . . . . . . . . .  254
      157   CCVS-H-2B. . . . . . . . . . .  255
      169   CCVS-H-3 . . . . . . . . . . .  256
      219   CCVS-PGM-ID. . . . . . . . . .  225 225
      103   CM-18V0
       97   COMPUTED-A . . . . . . . . . .  98 100 101 102 103 326 329 M375 M399 M424 M448 M480 M506 M532 M559 M592 M619
                                            M646 M673
       98   COMPUTED-N
       96   COMPUTED-X . . . . . . . . . .  M248 312
      100   COMPUTED-0V18
      102   COMPUTED-14V4
      104   COMPUTED-18V0
      101   COMPUTED-4V14
       46   CON-10
       49   CON-5. . . . . . . . . . . . .  M371 372 M388 388 M413 413 M437 437 457 M468 468 M494 494 M520 520 M547 547 568
                                            M579 579 M606 606 M633 633 M660 660 682
       51   CON-6. . . . . . . . . . . . .  M469 469 M495 495 M521 521 M548 548 568 M580 580 M607 607 M634 634 M661 661 682
       47   CON-7. . . . . . . . . . . . .  M581 581 M608 608 M635 635 M662 662 682
      120   COR-ANSI-REFERENCE . . . . . .  M321 M323
      111   CORRECT-A. . . . . . . . . . .  112 113 114 115 116 327 329 M374 M398 M423 M447 M479 M505 M531 M558 M591 M618
                                            M645 M672
      112   CORRECT-N
      110   CORRECT-X. . . . . . . . . . .  M249 313
      113   CORRECT-0V18
      115   CORRECT-14V4
      117   CORRECT-18V0
      114   CORRECT-4V14
      116   CR-18V0
      134   DELETE-COUNTER . . . . . . . .  M238 267 283 285
       89   DOTVALUE . . . . . . . . . . .  M243
      140   DUMMY-HOLD . . . . . . . . . .  M297 303
       40   DUMMY-RECORD . . . . . . . . .  M253 M254 M255 M256 M258 M259 M260 M262 M264 M273 M280 M287 M292 M293 297 M298
                                            299 M300 M301 M302 M303 307 M308 M316 M331
       66   ELEM-GRP . . . . . . . . . . .  M360
       48   ELEM-HOLD-AREA . . . . . . . .  M576 591 M602 618 M629 645 M657 672 682
       64   ELEM-NAME. . . . . . . . . . .  362
       68   ELEM-SEC . . . . . . . . . . .  M361
      187   ENDER-DESC . . . . . . . . . .  M275 M286 M291
       75   ENTRY-1. . . . . . . . . . . .  M341 375 399 424 448 457
       77   ENTRY-2. . . . . . . . . . . .  M351 480 506 532 559 568
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    17
0 Defined   Cross-reference of data names   References

0      79   ENTRY-3. . . . . . . . . . . .  M362 592 619 646 673 682
      135   ERROR-COUNTER. . . . . . . . .  M237 266 276 279
      139   ERROR-HOLD . . . . . . . . . .  M266 M267 M267 M268 271
      185   ERROR-TOTAL. . . . . . . . . .  M277 M279 M284 M285 M289 M290
       82   FEATURE. . . . . . . . . . . .  M367 M462 M572
       74   GRP-ENTRY
       52   GRP-HOLD-AREA. . . . . . . . .  M370 374 M382 398 M407 423 M434 447 457
       53   GRP-NAME . . . . . . . . . . .  341
       76   GRP2-ENTRY
       78   GRP3-ENTRY
      213   HYPHEN-LINE. . . . . . . . . .  260 262 302
      179   ID-AGAIN . . . . . . . . . . .  M225
       74   IDX-1
       76   IDX-2
       78   IDX-3
      212   INF-ANSI-REFERENCE . . . . . .  M314 M317 M330 M332
      207   INFO-TEXT. . . . . . . . . . .  M315
      136   INSPECT-COUNTER. . . . . . . .  M235 266 288 290
       84   P-OR-F . . . . . . . . . . . .  M235 M236 M237 M238 245 M248
       86   PAR-NAME . . . . . . . . . . .  M250 M368 M383 M408 M432 M461 M488 M514 M540 M575 M600 M627 M654
       88   PARDOT-X . . . . . . . . . . .  M242
      137   PASS-COUNTER . . . . . . . . .  M236 268 270
       38   PRINT-FILE . . . . . . . . . .  34 224 230
       39   PRINT-REC. . . . . . . . . . .  M244 M320 M322
       91   RE-MARK. . . . . . . . . . . .  M239 M251 M377 M401 M426 M450 M482 M508 M534 M561 M594 M621 M648 M675
      133   REC-CT . . . . . . . . . . . .  241 243 250
      132   REC-SKL-SUB
      141   RECORD-COUNT . . . . . . . . .  M295 296 M304
       59   SEC-GRP. . . . . . . . . . . .  M350
       50   SEC-HOLD-AREA. . . . . . . . .  M464 479 M491 505 M517 531 M544 558 568
       57   SEC-NAME . . . . . . . . . . .  351
       42   SUB-1. . . . . . . . . . . . .  M339 340 341 350 351 360 362
       43   SUB-2. . . . . . . . . . . . .  M345 346 M347 351 361 362
       44   SUB-3. . . . . . . . . . . . .  M355 356 M357 362
       45   TEST-CHECK . . . . . . . . . .  M369 373 M385 389 M410 414 438 M458 M465 470 M490 496 M515 522 M542 M543 549
                                            M569 M574 582 M603 609 M630 636 M656 663 M683
       92   TEST-COMPUTED. . . . . . . . .  320
      107   TEST-CORRECT . . . . . . . . .  322
      160   TEST-ID. . . . . . . . . . . .  M225
       80   TEST-RESULTS . . . . . . . . .  M226 244
      138   TOTAL-ERROR
      209   XXCOMPUTED . . . . . . . . . .  M329
      211   XXCORRECT. . . . . . . . . . .  M329
      204   XXINFO . . . . . . . . . . . .  316 331
       73   3-DIMENSION-TBL
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    18
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

      325   BAIL-OUT . . . . . . . . . . .  P247
      333   BAIL-OUT-EX. . . . . . . . . .  E247 G327
      328   BAIL-OUT-WRITE . . . . . . . .  G326
      309   BLANK-LINE-PRINT
      338   BUILD-LEVEL-1. . . . . . . . .  G349
      344   BUILD-LEVEL-2. . . . . . . . .  G359
      354   BUILD-LEVEL-3. . . . . . . . .  G364
      687   CCVS-EXIT
      688   CCVS-999999
      222   CCVS1
      334   CCVS1-EXIT . . . . . . . . . .  G228
      366   CHECK-ENTRIES. . . . . . . . .  G340
      229   CLOSE-FILES. . . . . . . . . .  G689
      257   COLUMN-NAMES-ROUTINE . . . . .  E227
      238   DE-LETE. . . . . . . . . . . .  P395 P420 P444 P476 P502 P528 P555 P588 P615 P642 P669
      261   END-ROUTINE. . . . . . . . . .  P230
      265   END-ROUTINE-1
      274   END-ROUTINE-12
      282   END-ROUTINE-13 . . . . . . . .  E230
      263   END-RTN-EXIT
      685   END-3LEVEL-TEST. . . . . . . .  G679
      237   FAIL . . . . . . . . . . . . .  P378 P402 P427 P451 P483 P509 P535 P562 P595 P622 P649 P676
      311   FAIL-ROUTINE . . . . . . . . .  P246
      324   FAIL-ROUTINE-EX. . . . . . . .  E246 G318
      319   FAIL-ROUTINE-WRITE . . . . . .  G312 G313
      456   FIND-LEVEL-1-ENTRY . . . . . .  P371 P387 P412 P436
      567   FIND-LEVEL-2-ENTRY . . . . . .  P467 P493 P519 P546
      681   FIND-LEVEL-3-ENTRY . . . . . .  P578 P605 P632 P659
      252   HEAD-ROUTINE . . . . . . . . .  P227
      235   INSPT
      223   OPEN-FILES
      236   PASS . . . . . . . . . . . . .  P390 P415 P439 P471 P497 P523 P550 P583 P610 P637 P664
      240   PRINT-DETAIL . . . . . . . . .  P379 P404 P429 P453 P485 P511 P537 P564 P597 P624 P651 P678
      336   SECT-NC24A-0001
      233   TERMINATE-CALL
      231   TERMINATE-CCVS
      337   TH-13-001
      394   TH1-DELETE-GF-2
      419   TH1-DELETE-GF-3
      443   TH1-DELETE-GF-4
      397   TH1-FAIL-GF-2. . . . . . . . .  G393
      422   TH1-FAIL-GF-3. . . . . . . . .  G418
      446   TH1-FAIL-GF-4. . . . . . . . .  G442
      381   TH1-INIT-GF-2. . . . . . . . .  G373
      406   TH1-INIT-GF-3
      431   TH1-INIT-GF-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    19
0 Defined   Cross-reference of procedures   References

0     386   TH1-TEST-GF-2
      411   TH1-TEST-GF-3
      435   TH1-TEST-GF-4
      403   TH1-WRITE-GF-2 . . . . . . . .  G391 G396
      428   TH1-WRITE-GF-3 . . . . . . . .  G416 G421
      452   TH1-WRITE-GF-4 . . . . . . . .  G440 G445
      475   TH2-DELETE-GF-1
      501   TH2-DELETE-GF-2
      527   TH2-DELETE-GF-3
      554   TH2-DELETE-GF-4
      478   TH2-FAIL-GF-1. . . . . . . . .  G474
      504   TH2-FAIL-GF-2. . . . . . . . .  G500
      530   TH2-FAIL-GF-3. . . . . . . . .  G526
      557   TH2-FAIL-GF-4. . . . . . . . .  G553
      460   TH2-INIT-GF-1. . . . . . . . .  G454
      487   TH2-INIT-GF-2
      513   TH2-INIT-GF-3
      539   TH2-INIT-GF-4
      466   TH2-TEST-GF-1
      492   TH2-TEST-GF-2
      518   TH2-TEST-GF-3
      545   TH2-TEST-GF-4
      484   TH2-WRITE-GF-1 . . . . . . . .  G472 G477
      510   TH2-WRITE-GF-2 . . . . . . . .  G498 G503
      536   TH2-WRITE-GF-3 . . . . . . . .  G524 G529
      563   TH2-WRITE-GF-4 . . . . . . . .  G551 G556
      587   TH3-DELETE-GF-1
      614   TH3-DELETE-GF-2
      641   TH3-DELETE-GF-3
      668   TH3-DELETE-GF-4
      590   TH3-FAIL-GF-1. . . . . . . . .  G586
      617   TH3-FAIL-GF-2. . . . . . . . .  G613
      644   TH3-FAIL-GF-3. . . . . . . . .  G640
      671   TH3-FAIL-GF-4. . . . . . . . .  G667
      571   TH3-INIT-GF-1. . . . . . . . .  G565
      599   TH3-INIT-GF-2
      626   TH3-INIT-GF-3
      653   TH3-INIT-GF-4
      577   TH3-TEST-GF-1
      604   TH3-TEST-GF-2
      631   TH3-TEST-GF-3
      658   TH3-TEST-GF-4
      596   TH3-WRITE-GF-1 . . . . . . . .  G584 G589
      623   TH3-WRITE-GF-2 . . . . . . . .  G611 G616
      650   TH3-WRITE-GF-3 . . . . . . . .  G638 G643
      677   TH3-WRITE-GF-4 . . . . . . . .  G665 G670
      294   WRITE-LINE . . . . . . . . . .  P244 P245 P253 P254 P255 P256 P258 P259 P260 P262 P264 P273 P281 P287 P292 P293
                                            P316 P320 P322 P331
      306   WRT-LN . . . . . . . . . . . .  P300 P301 P302 P305 P310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    20
0 Defined   Cross-reference of programs     References

        3   NC240A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC240A    Date 06/04/2022  Time 11:58:51   Page    21
0LineID  Message code  Message text

     38  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    338  IGYPS2015-I   The paragraph or section prior to paragraph or section "BUILD-LEVEL-1" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC240A:
 *    Source records = 689
 *    Data Division statements = 90
 *    Procedure Division statements = 351
 *    Generated COBOL statements = 0
 *    Program complexity factor = 363
0End of compilation 1,  program NC240A,  highest severity 0.
0Return code 0
