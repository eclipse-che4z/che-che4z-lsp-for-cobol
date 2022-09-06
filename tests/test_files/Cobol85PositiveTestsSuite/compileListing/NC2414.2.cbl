1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:20   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:20   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2414.2
   000002         000200 PROGRAM-ID.                                                      NC2414.2
   000003         000300     NC241A.                                                      NC2414.2
   000004         000500*                                                              *  NC2414.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2414.2
   000006         000700*                                                              *  NC2414.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2414.2
   000008         000900*                                                              *  NC2414.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2414.2
   000010         001100*                                                              *  NC2414.2
   000011         001300*                                                              *  NC2414.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2414.2
   000013         001500*                                                              *  NC2414.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2414.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2414.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2414.2
   000017         001900*                                                              *  NC2414.2
   000018         002100*                                                                 NC2414.2
   000019         002200*    PROGRAM NC241A TESTS THE CONSTRUCTION AND ACCESS OF A     *  NC2414.2
   000020         002300*    THREE-DIMENSIONAL TABLE USING INDICES.  THE CONTENT OF    *  NC2414.2
   000021         002400*    TABLE ELEMENTS IS VERIFIED BY USE OF THE FORMAT 4         *  NC2414.2
   000022         002500*    "PERFORM" STATEMENT.                                      *  NC2414.2
   000023         002600*                                                              *  NC2414.2
   000024         002800                                                                  NC2414.2
   000025         002900 ENVIRONMENT DIVISION.                                            NC2414.2
   000026         003000 CONFIGURATION SECTION.                                           NC2414.2
   000027         003100 SOURCE-COMPUTER.                                                 NC2414.2
   000028         003200     XXXXX082.                                                    NC2414.2
   000029         003300 OBJECT-COMPUTER.                                                 NC2414.2
   000030         003400     XXXXX083.                                                    NC2414.2
   000031         003500 INPUT-OUTPUT SECTION.                                            NC2414.2
   000032         003600 FILE-CONTROL.                                                    NC2414.2
   000033         003700     SELECT PRINT-FILE ASSIGN TO                                  NC2414.2 37
   000034         003800     XXXXX055.                                                    NC2414.2
   000035         003900 DATA DIVISION.                                                   NC2414.2
   000036         004000 FILE SECTION.                                                    NC2414.2
   000037         004100 FD  PRINT-FILE.                                                  NC2414.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004200 01  PRINT-REC PICTURE X(120).                                    NC2414.2
   000039         004300 01  DUMMY-RECORD PICTURE X(120).                                 NC2414.2
   000040         004400 WORKING-STORAGE SECTION.                                         NC2414.2
   000041         004500 77  SUB-1              PICTURE S99   VALUE ZERO.                 NC2414.2 IMP
   000042         004600 77  SUB-2              PICTURE 99    VALUE ZERO.                 NC2414.2 IMP
   000043         004700 77  SUB-3              PICTURE 99    VALUE ZERO.                 NC2414.2 IMP
   000044         004800 77   TEST-CHECK PIC X(4) VALUE SPACE.                            NC2414.2 IMP
   000045         004900 77  CON-7              PICTURE 99  VALUE 07.                     NC2414.2
   000046         005000 77  CON-10             PICTURE 99  VALUE 10.                     NC2414.2
   000047         005100 77  GRP-HOLD-AREA                PICTURE X(5)  VALUE SPACES.     NC2414.2 IMP
   000048         005200 77  CON-5              PICTURE 99  VALUE 05.                     NC2414.2
   000049         005300 77  SEC-HOLD-AREA                PICTURE X(11)  VALUE SPACES.    NC2414.2 IMP
   000050         005400 77  CON-6              PICTURE 99  VALUE 06.                     NC2414.2
   000051         005500 77  ELEM-HOLD-AREA               PICTURE X(15)  VALUE SPACES.    NC2414.2 IMP
   000052         005600 01  GRP-NAME.                                                    NC2414.2
   000053         005700     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2414.2
   000054         005800     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900                                                                  NC2414.2
   000056         006000 01  SEC-NAME.                                                    NC2414.2
   000057         006100     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2414.2
   000058         006200     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2414.2
   000059         006300     02  FILLER              PICTURE X      VALUE ",".            NC2414.2
   000060         006400     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2414.2
   000061         006500     02  FILLER              PICTURE X      VALUE ")".            NC2414.2
   000062         006600                                                                  NC2414.2
   000063         006700 01  ELEM-NAME.                                                   NC2414.2
   000064         006800     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2414.2
   000065         006900     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2414.2
   000066         007000     02  FILLER              PICTURE X      VALUE ",".            NC2414.2
   000067         007100     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2414.2
   000068         007200     02  FILLER              PICTURE X      VALUE ",".            NC2414.2
   000069         007300     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2414.2
   000070         007400     02  FILLER              PICTURE X      VALUE ")".            NC2414.2
   000071         007500                                                                  NC2414.2
   000072         007600 01  3-DIMENSION-TBL.                                             NC2414.2
   000073         007700     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2414.2
   000074         007800         03  ENTRY-1         PICTURE X(5).                        NC2414.2
   000075         007900         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2414.2
   000076         008000             04  ENTRY-2     PICTURE X(11).                       NC2414.2
   000077         008100             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC2414.2
   000078         008200                 05  ENTRY-3 PICTURE X(15).                       NC2414.2
   000079         008300                                                                  NC2414.2
   000080         008400 01  TEST-RESULTS.                                                NC2414.2
   000081         008500     02 FILLER                   PIC X      VALUE SPACE.          NC2414.2 IMP
   000082         008600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2414.2 IMP
   000083         008700     02 FILLER                   PIC X      VALUE SPACE.          NC2414.2 IMP
   000084         008800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2414.2 IMP
   000085         008900     02 FILLER                   PIC X      VALUE SPACE.          NC2414.2 IMP
   000086         009000     02  PAR-NAME.                                                NC2414.2
   000087         009100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2414.2 IMP
   000088         009200       03  PARDOT-X              PIC X      VALUE SPACE.          NC2414.2 IMP
   000089         009300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2414.2 IMP
   000090         009400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2414.2 IMP
   000091         009500     02 RE-MARK                  PIC X(61).                       NC2414.2
   000092         009600 01  TEST-COMPUTED.                                               NC2414.2
   000093         009700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2414.2 IMP
   000094         009800     02 FILLER                   PIC X(17)  VALUE                 NC2414.2
   000095         009900            "       COMPUTED=".                                   NC2414.2
   000096         010000     02 COMPUTED-X.                                               NC2414.2
   000097         010100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2414.2 IMP
   000098         010200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2414.2 97
   000099         010300                                 PIC -9(9).9(9).                  NC2414.2
   000100         010400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2414.2 97
   000101         010500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2414.2 97
   000102         010600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2414.2 97
   000103         010700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2414.2 97
   000104         010800         04 COMPUTED-18V0                    PIC -9(18).          NC2414.2
   000105         010900         04 FILLER                           PIC X.               NC2414.2
   000106         011000     03 FILLER PIC X(50) VALUE SPACE.                             NC2414.2 IMP
   000107         011100 01  TEST-CORRECT.                                                NC2414.2
   000108         011200     02 FILLER PIC X(30) VALUE SPACE.                             NC2414.2 IMP
   000109         011300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2414.2
   000110         011400     02 CORRECT-X.                                                NC2414.2
   000111         011500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2414.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2414.2 111
   000113         011700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2414.2 111
   000114         011800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2414.2 111
   000115         011900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2414.2 111
   000116         012000     03      CR-18V0 REDEFINES CORRECT-A.                         NC2414.2 111
   000117         012100         04 CORRECT-18V0                     PIC -9(18).          NC2414.2
   000118         012200         04 FILLER                           PIC X.               NC2414.2
   000119         012300     03 FILLER PIC X(2) VALUE SPACE.                              NC2414.2 IMP
   000120         012400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2414.2 IMP
   000121         012500 01  CCVS-C-1.                                                    NC2414.2
   000122         012600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2414.2
   000123         012700-    "SS  PARAGRAPH-NAME                                          NC2414.2
   000124         012800-    "       REMARKS".                                            NC2414.2
   000125         012900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2414.2 IMP
   000126         013000 01  CCVS-C-2.                                                    NC2414.2
   000127         013100     02 FILLER                     PIC X        VALUE SPACE.      NC2414.2 IMP
   000128         013200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2414.2
   000129         013300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2414.2 IMP
   000130         013400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2414.2
   000131         013500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2414.2 IMP
   000132         013600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2414.2 IMP
   000133         013700 01  REC-CT                        PIC 99       VALUE ZERO.       NC2414.2 IMP
   000134         013800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2414.2 IMP
   000135         013900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2414.2 IMP
   000136         014000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2414.2 IMP
   000137         014100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2414.2 IMP
   000138         014200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2414.2 IMP
   000139         014300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2414.2 IMP
   000140         014400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2414.2 IMP
   000141         014500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2414.2 IMP
   000142         014600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2414.2 IMP
   000143         014700 01  CCVS-H-1.                                                    NC2414.2
   000144         014800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2414.2 IMP
   000145         014900     02  FILLER                    PIC X(42)    VALUE             NC2414.2
   000146         015000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2414.2
   000147         015100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2414.2 IMP
   000148         015200 01  CCVS-H-2A.                                                   NC2414.2
   000149         015300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2414.2 IMP
   000150         015400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2414.2
   000151         015500   02  FILLER                        PIC XXXX   VALUE             NC2414.2
   000152         015600     "4.2 ".                                                      NC2414.2
   000153         015700   02  FILLER                        PIC X(28)  VALUE             NC2414.2
   000154         015800            " COPY - NOT FOR DISTRIBUTION".                       NC2414.2
   000155         015900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2414.2 IMP
   000156         016000                                                                  NC2414.2
   000157         016100 01  CCVS-H-2B.                                                   NC2414.2
   000158         016200   02  FILLER                        PIC X(15)  VALUE             NC2414.2
   000159         016300            "TEST RESULT OF ".                                    NC2414.2
   000160         016400   02  TEST-ID                       PIC X(9).                    NC2414.2
   000161         016500   02  FILLER                        PIC X(4)   VALUE             NC2414.2
   000162         016600            " IN ".                                               NC2414.2
   000163         016700   02  FILLER                        PIC X(12)  VALUE             NC2414.2
   000164         016800     " HIGH       ".                                              NC2414.2
   000165         016900   02  FILLER                        PIC X(22)  VALUE             NC2414.2
   000166         017000            " LEVEL VALIDATION FOR ".                             NC2414.2
   000167         017100   02  FILLER                        PIC X(58)  VALUE             NC2414.2
   000168         017200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  CCVS-H-3.                                                    NC2414.2
   000170         017400     02  FILLER                      PIC X(34)  VALUE             NC2414.2
   000171         017500            " FOR OFFICIAL USE ONLY    ".                         NC2414.2
   000172         017600     02  FILLER                      PIC X(58)  VALUE             NC2414.2
   000173         017700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2414.2
   000174         017800     02  FILLER                      PIC X(28)  VALUE             NC2414.2
   000175         017900            "  COPYRIGHT   1985 ".                                NC2414.2
   000176         018000 01  CCVS-E-1.                                                    NC2414.2
   000177         018100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2414.2 IMP
   000178         018200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2414.2
   000179         018300     02 ID-AGAIN                     PIC X(9).                    NC2414.2
   000180         018400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2414.2 IMP
   000181         018500 01  CCVS-E-2.                                                    NC2414.2
   000182         018600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2414.2 IMP
   000183         018700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2414.2 IMP
   000184         018800     02 CCVS-E-2-2.                                               NC2414.2
   000185         018900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2414.2 IMP
   000186         019000         03 FILLER                   PIC X      VALUE SPACE.      NC2414.2 IMP
   000187         019100         03 ENDER-DESC               PIC X(44)  VALUE             NC2414.2
   000188         019200            "ERRORS ENCOUNTERED".                                 NC2414.2
   000189         019300 01  CCVS-E-3.                                                    NC2414.2
   000190         019400     02  FILLER                      PIC X(22)  VALUE             NC2414.2
   000191         019500            " FOR OFFICIAL USE ONLY".                             NC2414.2
   000192         019600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2414.2 IMP
   000193         019700     02  FILLER                      PIC X(58)  VALUE             NC2414.2
   000194         019800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2414.2
   000195         019900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2414.2 IMP
   000196         020000     02 FILLER                       PIC X(15)  VALUE             NC2414.2
   000197         020100             " COPYRIGHT 1985".                                   NC2414.2
   000198         020200 01  CCVS-E-4.                                                    NC2414.2
   000199         020300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2414.2 IMP
   000200         020400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2414.2
   000201         020500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2414.2 IMP
   000202         020600     02 FILLER                       PIC X(40)  VALUE             NC2414.2
   000203         020700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2414.2
   000204         020800 01  XXINFO.                                                      NC2414.2
   000205         020900     02 FILLER                       PIC X(19)  VALUE             NC2414.2
   000206         021000            "*** INFORMATION ***".                                NC2414.2
   000207         021100     02 INFO-TEXT.                                                NC2414.2
   000208         021200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2414.2 IMP
   000209         021300       04 XXCOMPUTED                 PIC X(20).                   NC2414.2
   000210         021400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2414.2 IMP
   000211         021500       04 XXCORRECT                  PIC X(20).                   NC2414.2
   000212         021600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2414.2
   000213         021700 01  HYPHEN-LINE.                                                 NC2414.2
   000214         021800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2414.2 IMP
   000215         021900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2414.2
   000216         022000-    "*****************************************".                 NC2414.2
   000217         022100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2414.2
   000218         022200-    "******************************".                            NC2414.2
   000219         022300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2414.2
   000220         022400     "NC241A".                                                    NC2414.2
   000221         022500 PROCEDURE DIVISION.                                              NC2414.2
   000222         022600 CCVS1 SECTION.                                                   NC2414.2
   000223         022700 OPEN-FILES.                                                      NC2414.2
   000224         022800     OPEN     OUTPUT PRINT-FILE.                                  NC2414.2 37
   000225         022900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2414.2 219 160 219 179
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE    SPACE TO TEST-RESULTS.                               NC2414.2 IMP 80
   000227         023100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2414.2 252 257
   000228         023200     GO TO CCVS1-EXIT.                                            NC2414.2 334
   000229         023300 CLOSE-FILES.                                                     NC2414.2
   000230         023400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2414.2 261 282 37
   000231         023500 TERMINATE-CCVS.                                                  NC2414.2
   000232         023600     EXIT PROGRAM.                                                NC2414.2
   000233         023700 TERMINATE-CALL.                                                  NC2414.2
   000234         023800     STOP     RUN.                                                NC2414.2
   000235         023900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2414.2 84 136
   000236         024000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2414.2 84 137
   000237         024100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2414.2 84 135
   000238         024200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2414.2 84 134
   000239         024300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2414.2 91
   000240         024400 PRINT-DETAIL.                                                    NC2414.2
   000241         024500     IF REC-CT NOT EQUAL TO ZERO                                  NC2414.2 133 IMP
   000242      1  024600             MOVE "." TO PARDOT-X                                 NC2414.2 88
   000243      1  024700             MOVE REC-CT TO DOTVALUE.                             NC2414.2 133 89
   000244         024800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2414.2 80 38 294
   000245         024900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2414.2 84 294
   000246      1  025000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2414.2 311 324
   000247      1  025100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2414.2 325 333
   000248         025200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2414.2 IMP 84 IMP 96
   000249         025300     MOVE SPACE TO CORRECT-X.                                     NC2414.2 IMP 110
   000250         025400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2414.2 133 IMP IMP 86
   000251         025500     MOVE     SPACE TO RE-MARK.                                   NC2414.2 IMP 91
   000252         025600 HEAD-ROUTINE.                                                    NC2414.2
   000253         025700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2414.2 143 39 294
   000254         025800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2414.2 148 39 294
   000255         025900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2414.2 157 39 294
   000256         026000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2414.2 169 39 294
   000257         026100 COLUMN-NAMES-ROUTINE.                                            NC2414.2
   000258         026200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2414.2 121 39 294
   000259         026300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2414.2 126 39 294
   000260         026400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2414.2 213 39 294
   000261         026500 END-ROUTINE.                                                     NC2414.2
   000262         026600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2414.2 213 39 294
   000263         026700 END-RTN-EXIT.                                                    NC2414.2
   000264         026800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2414.2 176 39 294
   000265         026900 END-ROUTINE-1.                                                   NC2414.2
   000266         027000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2414.2 135 139 136
   000267         027100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2414.2 139 134 139
   000268         027200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2414.2 137 139
   000269         027300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2414.2
   000270         027400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2414.2 137 199
   000271         027500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2414.2 139 201
   000272         027600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2414.2 198 184
   000273         027700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2414.2 181 39 294
   000274         027800  END-ROUTINE-12.                                                 NC2414.2
   000275         027900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2414.2 187
   000276         028000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2414.2 135 IMP
   000277      1  028100         MOVE "NO " TO ERROR-TOTAL                                NC2414.2 185
   000278         028200         ELSE                                                     NC2414.2
   000279      1  028300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2414.2 135 185
   000280         028400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2414.2 181 39
   000281         028500     PERFORM WRITE-LINE.                                          NC2414.2 294
   000282         028600 END-ROUTINE-13.                                                  NC2414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2414.2 134 IMP
   000284      1  028800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2414.2 185
   000285      1  028900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2414.2 134 185
   000286         029000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2414.2 187
   000287         029100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2414.2 181 39 294
   000288         029200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2414.2 136 IMP
   000289      1  029300          MOVE "NO " TO ERROR-TOTAL                               NC2414.2 185
   000290      1  029400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2414.2 136 185
   000291         029500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2414.2 187
   000292         029600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2414.2 181 39 294
   000293         029700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2414.2 189 39 294
   000294         029800 WRITE-LINE.                                                      NC2414.2
   000295         029900     ADD 1 TO RECORD-COUNT.                                       NC2414.2 141
   000296         030000     IF RECORD-COUNT GREATER 50                                   NC2414.2 141
   000297      1  030100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2414.2 39 140
   000298      1  030200         MOVE SPACE TO DUMMY-RECORD                               NC2414.2 IMP 39
   000299      1  030300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2414.2 39
   000300      1  030400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2414.2 121 39 306
   000301      1  030500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2414.2 126 39 306
   000302      1  030600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2414.2 213 39 306
   000303      1  030700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2414.2 140 39
   000304      1  030800         MOVE ZERO TO RECORD-COUNT.                               NC2414.2 IMP 141
   000305         030900     PERFORM WRT-LN.                                              NC2414.2 306
   000306         031000 WRT-LN.                                                          NC2414.2
   000307         031100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2414.2 39
   000308         031200     MOVE SPACE TO DUMMY-RECORD.                                  NC2414.2 IMP 39
   000309         031300 BLANK-LINE-PRINT.                                                NC2414.2
   000310         031400     PERFORM WRT-LN.                                              NC2414.2 306
   000311         031500 FAIL-ROUTINE.                                                    NC2414.2
   000312         031600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2414.2 96 IMP 319
   000313         031700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2414.2 110 IMP 319
   000314         031800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2414.2 142 212
   000315         031900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2414.2 207
   000316         032000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2414.2 204 39 294
   000317         032100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2414.2 IMP 212
   000318         032200     GO TO  FAIL-ROUTINE-EX.                                      NC2414.2 324
   000319         032300 FAIL-ROUTINE-WRITE.                                              NC2414.2
   000320         032400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2414.2 92 38 294
   000321         032500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2414.2 142 120
   000322         032600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2414.2 107 38 294
   000323         032700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2414.2 IMP 120
   000324         032800 FAIL-ROUTINE-EX. EXIT.                                           NC2414.2
   000325         032900 BAIL-OUT.                                                        NC2414.2
   000326         033000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2414.2 97 IMP 328
   000327         033100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2414.2 111 IMP 333
   000328         033200 BAIL-OUT-WRITE.                                                  NC2414.2
   000329         033300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2414.2 111 211 97 209
   000330         033400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2414.2 142 212
   000331         033500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2414.2 204 39 294
   000332         033600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2414.2 IMP 212
   000333         033700 BAIL-OUT-EX. EXIT.                                               NC2414.2
   000334         033800 CCVS1-EXIT.                                                      NC2414.2
   000335         033900     EXIT.                                                        NC2414.2
   000336         034000 SECT-NC241A-001 SECTION.                                         NC2414.2
   000337         034100 TH-15-001.                                                       NC2414.2
   000338         034200     PERFORM PARA-1 VARYING SUB-1 FROM 1 BY 1                     NC2414.2 344 41
   000339         034300         UNTIL SUB-1 EQUAL TO 11                                  NC2414.2 41
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400         AFTER SUB-2 FROM 1 BY 1 UNTIL SUB-2 EQUAL TO 11          NC2414.2 42 42
   000341         034500         AFTER SUB-3 FROM 1 BY 1 UNTIL SUB-3 EQUAL TO 11          NC2414.2 43 43
   000342         034600     GO TO CHECK-ENTRIES.                                         NC2414.2 355
   000343         034700                                                                  NC2414.2
   000344         034800 PARA-1.                                                          NC2414.2
   000345         034900     SET IDX-1 TO SUB-1.                                          NC2414.2 73 41
   000346         035000     SET IDX-2 TO SUB-2.                                          NC2414.2 75 42
   000347         035100     SET IDX-3 TO SUB-3.                                          NC2414.2 77 43
   000348         035200     SET ADD-GRP, SEC-GRP, ELEM-GRP TO IDX-1.                     NC2414.2 54 58 65 73
   000349         035300     MOVE GRP-NAME TO ENTRY-1 (IDX-1).                            NC2414.2 52 74 73
   000350         035400     SET ADD-SEC, ELEM-SEC TO IDX-2.                              NC2414.2 60 67 75
   000351         035500     MOVE SEC-NAME TO ENTRY-2 (IDX-1, IDX-2).                     NC2414.2 56 76 73 75
   000352         035600     SET ADD-ELEM TO IDX-3.                                       NC2414.2 69 77
   000353         035700     MOVE ELEM-NAME TO ENTRY-3 (IDX-1, IDX-2, IDX-3).             NC2414.2 63 78 73 75 77
   000354         035800                                                                  NC2414.2
   000355         035900 CHECK-ENTRIES.                                                   NC2414.2
   000356         036000     MOVE "PERFORM VARYING LEV1" TO FEATURE.                      NC2414.2 82
   000357         036100     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC2414.2 86
   000358         036200     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000359         036300     MOVE "GRP05" TO GRP-HOLD-AREA.                               NC2414.2 47
   000360         036400     PERFORM FIND-LEVEL-1-ENTRY VARYING IDX-1 FROM 1 BY 1         NC2414.2 442 73
   000361         036500         UNTIL IDX-1 = 11.                                        NC2414.2 73
   000362         036600     IF TEST-CHECK = "PASS" GO TO TH1-INIT-GF-2.                  NC2414.2 44 370
   000363         036700     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2414.2 47 111
   000364         036800     MOVE ENTRY-1 (05) TO COMPUTED-A.                             NC2414.2 74 97
   000365         036900                                                                  NC2414.2
   000366         037000     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000367         037100     PERFORM FAIL.                                                NC2414.2 237
   000368         037200     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000369         037300*                                                                 NC2414.2
   000370         037400 TH1-INIT-GF-2.                                                   NC2414.2
   000371         037500     MOVE "GRP10" TO GRP-HOLD-AREA.                               NC2414.2 47
   000372         037600     MOVE "TH1-TEST-GF-2      " TO PAR-NAME.                      NC2414.2 86
   000373         037700     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000374         037800 TH1-TEST-GF-2.                                                   NC2414.2
   000375         037900     PERFORM FIND-LEVEL-1-ENTRY                                   NC2414.2 442
   000376         038000             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 = 11.          NC2414.2 73 73
   000377         038100     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000378      1  038200         PERFORM PASS                                             NC2414.2 236
   000379      1  038300         GO TO TH1-WRITE-GF-2                                     NC2414.2 391
   000380         038400     ELSE                                                         NC2414.2
   000381      1  038500         GO TO TH1-FAIL-GF-2.                                     NC2414.2 385
   000382         038600 TH1-DELETE-GF-2.                                                 NC2414.2
   000383         038700     PERFORM DE-LETE.                                             NC2414.2 238
   000384         038800     GO TO TH1-WRITE-GF-2.                                        NC2414.2 391
   000385         038900 TH1-FAIL-GF-2.                                                   NC2414.2
   000386         039000     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2414.2 47 111
   000387         039100     MOVE ENTRY-1 (10) TO COMPUTED-A.                             NC2414.2 74 97
   000388         039200                                                                  NC2414.2
   000389         039300     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000390         039400     PERFORM FAIL.                                                NC2414.2 237
   000391         039500 TH1-WRITE-GF-2.                                                  NC2414.2
   000392         039600     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000393         039700*                                                                 NC2414.2
   000394         039800 TH1-INIT-GF-3.                                                   NC2414.2
   000395         039900     MOVE "GRP07" TO GRP-HOLD-AREA.                               NC2414.2 47
   000396         040000     MOVE "TH1-TEST-GF-3      " TO PAR-NAME.                      NC2414.2 86
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000398         040200 TH1-TEST-GF-3.                                                   NC2414.2
   000399         040300     PERFORM FIND-LEVEL-1-ENTRY                                   NC2414.2 442
   000400         040400             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 = 11.          NC2414.2 73 73
   000401         040500     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000402      1  040600         PERFORM PASS                                             NC2414.2 236
   000403      1  040700         GO TO TH1-WRITE-GF-3                                     NC2414.2 415
   000404         040800     ELSE                                                         NC2414.2
   000405      1  040900         GO TO TH1-FAIL-GF-3.                                     NC2414.2 409
   000406         041000 TH1-DELETE-GF-3.                                                 NC2414.2
   000407         041100     PERFORM DE-LETE.                                             NC2414.2 238
   000408         041200     GO TO TH1-WRITE-GF-3.                                        NC2414.2 415
   000409         041300 TH1-FAIL-GF-3.                                                   NC2414.2
   000410         041400     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2414.2 47 111
   000411         041500     MOVE ENTRY-1 (07) TO COMPUTED-A.                             NC2414.2 74 97
   000412         041600                                                                  NC2414.2
   000413         041700     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000414         041800     PERFORM FAIL.                                                NC2414.2 237
   000415         041900 TH1-WRITE-GF-3.                                                  NC2414.2
   000416         042000     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000417         042100*                                                                 NC2414.2
   000418         042200 TH1-INIT-GF-4.                                                   NC2414.2
   000419         042300     MOVE "TH1-TEST-GF-4      " TO PAR-NAME.                      NC2414.2 86
   000420         042400     MOVE "GRP01" TO GRP-HOLD-AREA.                               NC2414.2 47
   000421         042500 TH1-TEST-GF-4.                                                   NC2414.2
   000422         042600     PERFORM FIND-LEVEL-1-ENTRY                                   NC2414.2 442
   000423         042700             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 = 11.          NC2414.2 73 73
   000424         042800     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000425      1  042900         PERFORM PASS                                             NC2414.2 236
   000426      1  043000         GO TO TH1-WRITE-GF-4                                     NC2414.2 438
   000427         043100     ELSE                                                         NC2414.2
   000428      1  043200         GO TO TH1-FAIL-GF-4.                                     NC2414.2 432
   000429         043300 TH1-DELETE-GF-4.                                                 NC2414.2
   000430         043400     PERFORM DE-LETE.                                             NC2414.2 238
   000431         043500     GO TO TH1-WRITE-GF-4.                                        NC2414.2 438
   000432         043600 TH1-FAIL-GF-4.                                                   NC2414.2
   000433         043700     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2414.2 47 111
   000434         043800     MOVE ENTRY-1 (01) TO COMPUTED-A.                             NC2414.2 74 97
   000435         043900                                                                  NC2414.2
   000436         044000     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000437         044100     PERFORM FAIL.                                                NC2414.2 237
   000438         044200 TH1-WRITE-GF-4.                                                  NC2414.2
   000439         044300     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000440         044400     GO TO TH2-INIT-GF-1.                                         NC2414.2 446
   000441         044500*                                                                 NC2414.2
   000442         044600 FIND-LEVEL-1-ENTRY.                                              NC2414.2
   000443         044700     IF ENTRY-1 (IDX-1) = GRP-HOLD-AREA                           NC2414.2 74 73 47
   000444      1  044800         MOVE "PASS" TO TEST-CHECK.                               NC2414.2 44
   000445         044900*                                                                 NC2414.2
   000446         045000 TH2-INIT-GF-1.                                                   NC2414.2
   000447         045100     MOVE "TH2-TEST-GF-1      " TO PAR-NAME.                      NC2414.2 86
   000448         045200     MOVE "PERFORM VARYING LEV2" TO FEATURE.                      NC2414.2 82
   000449         045300     MOVE "SEC (03,05)" TO SEC-HOLD-AREA.                         NC2414.2 49
   000450         045400     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000451         045500 TH2-TEST-GF-1.                                                   NC2414.2
   000452         045600     PERFORM FIND-LEVEL-2-ENTRY                                   NC2414.2 549
   000453         045700             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 GREATER 10     NC2414.2 73 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800             AFTER   IDX-2 FROM 1 BY 1 UNTIL IDX-2 = 10.          NC2414.2 75 75
   000455         045900     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000456      1  046000         PERFORM PASS                                             NC2414.2 236
   000457      1  046100         GO TO TH2-WRITE-GF-1                                     NC2414.2 469
   000458         046200     ELSE                                                         NC2414.2
   000459      1  046300         GO TO TH2-FAIL-GF-1.                                     NC2414.2 463
   000460         046400 TH2-DELETE-GF-1.                                                 NC2414.2
   000461         046500     PERFORM DE-LETE.                                             NC2414.2 238
   000462         046600     GO TO TH2-WRITE-GF-1.                                        NC2414.2 469
   000463         046700 TH2-FAIL-GF-1.                                                   NC2414.2
   000464         046800     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2414.2 49 111
   000465         046900     MOVE ENTRY-2 (03, 05) TO COMPUTED-A.                         NC2414.2 76 97
   000466         047000                                                                  NC2414.2
   000467         047100     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000468         047200     PERFORM FAIL.                                                NC2414.2 237
   000469         047300 TH2-WRITE-GF-1.                                                  NC2414.2
   000470         047400     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000471         047500*                                                                 NC2414.2
   000472         047600 TH2-INIT-GF-2.                                                   NC2414.2
   000473         047700     MOVE "TH2-TEST-GF-2      " TO PAR-NAME.                      NC2414.2 86
   000474         047800     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000475         047900     MOVE "SEC (01,01)" TO SEC-HOLD-AREA.                         NC2414.2 49
   000476         048000 TH2-TEST-GF-2.                                                   NC2414.2
   000477         048100     PERFORM FIND-LEVEL-2-ENTRY                                   NC2414.2 549
   000478         048200             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 GREATER 10     NC2414.2 73 73
   000479         048300             AFTER IDX-2 FROM 1 BY 1 UNTIL IDX-2 = 10.            NC2414.2 75 75
   000480         048400     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000481      1  048500         PERFORM PASS                                             NC2414.2 236
   000482      1  048600         GO TO TH2-WRITE-GF-2                                     NC2414.2 494
   000483         048700     ELSE                                                         NC2414.2
   000484      1  048800         GO TO TH2-FAIL-GF-2.                                     NC2414.2 488
   000485         048900 TH2-DELETE-GF-2.                                                 NC2414.2
   000486         049000     PERFORM DE-LETE.                                             NC2414.2 238
   000487         049100     GO TO TH2-WRITE-GF-2.                                        NC2414.2 494
   000488         049200 TH2-FAIL-GF-2.                                                   NC2414.2
   000489         049300     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2414.2 49 111
   000490         049400     MOVE ENTRY-2 (01, 01) TO COMPUTED-A.                         NC2414.2 76 97
   000491         049500                                                                  NC2414.2
   000492         049600     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000493         049700     PERFORM FAIL.                                                NC2414.2 237
   000494         049800 TH2-WRITE-GF-2.                                                  NC2414.2
   000495         049900     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000496         050000*                                                                 NC2414.2
   000497         050100 TH2-INIT-GF-3.                                                   NC2414.2
   000498         050200     MOVE "TH2-TEST-GF-3      " TO PAR-NAME.                      NC2414.2 86
   000499         050300     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000500         050400     MOVE "SEC (10,01)" TO SEC-HOLD-AREA.                         NC2414.2 49
   000501         050500 TH2-TEST-GF-3.                                                   NC2414.2
   000502         050600     PERFORM FIND-LEVEL-2-ENTRY                                   NC2414.2 549
   000503         050700             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 GREATER 10     NC2414.2 73 73
   000504         050800             AFTER   IDX-2 FROM 1 BY 1 UNTIL IDX-2 = 10.          NC2414.2 75 75
   000505         050900     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000506      1  051000         PERFORM PASS                                             NC2414.2 236
   000507      1  051100         GO TO TH2-WRITE-GF-3                                     NC2414.2 519
   000508         051200     ELSE                                                         NC2414.2
   000509      1  051300         GO TO TH2-FAIL-GF-3.                                     NC2414.2 513
   000510         051400 TH2-DELETE-GF-3.                                                 NC2414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     PERFORM DE-LETE.                                             NC2414.2 238
   000512         051600     GO TO TH2-WRITE-GF-3.                                        NC2414.2 519
   000513         051700 TH2-FAIL-GF-3.                                                   NC2414.2
   000514         051800     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2414.2 49 111
   000515         051900     MOVE ENTRY-2 (10, 01) TO COMPUTED-A.                         NC2414.2 76 97
   000516         052000                                                                  NC2414.2
   000517         052100     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000518         052200     PERFORM FAIL.                                                NC2414.2 237
   000519         052300 TH2-WRITE-GF-3.                                                  NC2414.2
   000520         052400     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000521         052500*                                                                 NC2414.2
   000522         052600 TH2-INIT-GF-4.                                                   NC2414.2
   000523         052700     MOVE "TH2-TEST-GF-4      " TO PAR-NAME.                      NC2414.2 86
   000524         052800     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000525         052900     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000526         053000     MOVE "SEC (10,10)" TO SEC-HOLD-AREA.                         NC2414.2 49
   000527         053100 TH2-TEST-GF-4.                                                   NC2414.2
   000528         053200     PERFORM FIND-LEVEL-2-ENTRY                                   NC2414.2 549
   000529         053300             VARYING IDX-1 FROM 2 BY 2 UNTIL IDX-1 GREATER 10     NC2414.2 73 73
   000530         053400             AFTER   IDX-2 FROM 2 BY 2 UNTIL IDX-2 GREATER 10.    NC2414.2 75 75
   000531         053500     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000532      1  053600         PERFORM PASS                                             NC2414.2 236
   000533      1  053700         GO TO TH2-WRITE-GF-4                                     NC2414.2 545
   000534         053800     ELSE                                                         NC2414.2
   000535      1  053900         GO TO TH2-FAIL-GF-4.                                     NC2414.2 539
   000536         054000 TH2-DELETE-GF-4.                                                 NC2414.2
   000537         054100     PERFORM DE-LETE.                                             NC2414.2 238
   000538         054200     GO TO TH2-WRITE-GF-4.                                        NC2414.2 545
   000539         054300 TH2-FAIL-GF-4.                                                   NC2414.2
   000540         054400     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2414.2 49 111
   000541         054500     MOVE ENTRY-2 (10, 10) TO COMPUTED-A.                         NC2414.2 76 97
   000542         054600                                                                  NC2414.2
   000543         054700     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000544         054800     PERFORM FAIL.                                                NC2414.2 237
   000545         054900 TH2-WRITE-GF-4.                                                  NC2414.2
   000546         055000     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000547         055100     GO TO TH3-INIT-GF-1.                                         NC2414.2 553
   000548         055200*                                                                 NC2414.2
   000549         055300 FIND-LEVEL-2-ENTRY.                                              NC2414.2
   000550         055400     IF ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA                    NC2414.2 76 73 75 49
   000551      1  055500         MOVE "PASS" TO TEST-CHECK.                               NC2414.2 44
   000552         055600*                                                                 NC2414.2
   000553         055700 TH3-INIT-GF-1.                                                   NC2414.2
   000554         055800     MOVE "PERFORM VARYING LEV3" TO FEATURE.                      NC2414.2 82
   000555         055900     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000556         056000     MOVE "TH3-TEST-GF-1      " TO PAR-NAME.                      NC2414.2 86
   000557         056100     MOVE "ELEM (01,02,03)" TO ELEM-HOLD-AREA.                    NC2414.2 51
   000558         056200 TH3-TEST-GF-1.                                                   NC2414.2
   000559         056300     PERFORM FIND-LEVEL-3-ENTRY                                   NC2414.2 659
   000560         056400             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 GREATER 10     NC2414.2 73 73
   000561         056500             AFTER IDX-2 FROM 1 BY 1 UNTIL IDX-2 = 10             NC2414.2 75 75
   000562         056600             AFTER IDX-3 FROM 1 BY 1 UNTIL IDX-3 = 10.            NC2414.2 77 77
   000563         056700     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000564      1  056800         PERFORM PASS                                             NC2414.2 236
   000565      1  056900         GO TO TH3-WRITE-GF-1                                     NC2414.2 577
   000566         057000     ELSE                                                         NC2414.2
   000567      1  057100         GO TO TH3-FAIL-GF-1.                                     NC2414.2 571
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200 TH3-DELETE-GF-1.                                                 NC2414.2
   000569         057300     PERFORM DE-LETE.                                             NC2414.2 238
   000570         057400     GO TO TH3-WRITE-GF-1.                                        NC2414.2 577
   000571         057500 TH3-FAIL-GF-1.                                                   NC2414.2
   000572         057600     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2414.2 51 111
   000573         057700     MOVE ENTRY-3 (01, 02, 03) TO COMPUTED-A.                     NC2414.2 78 97
   000574         057800                                                                  NC2414.2
   000575         057900     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000576         058000     PERFORM FAIL.                                                NC2414.2 237
   000577         058100 TH3-WRITE-GF-1.                                                  NC2414.2
   000578         058200     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000579         058300*                                                                 NC2414.2
   000580         058400 TH3-INIT-GF-2.                                                   NC2414.2
   000581         058500     MOVE "TH3-TEST-GF-2      " TO PAR-NAME.                      NC2414.2 86
   000582         058600     MOVE "ELEM (10,10,10)" TO ELEM-HOLD-AREA.                    NC2414.2 51
   000583         058700     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000584         058800 TH3-TEST-GF-2.                                                   NC2414.2
   000585         058900     PERFORM FIND-LEVEL-3-ENTRY                                   NC2414.2 659
   000586         059000             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 GREATER 10     NC2414.2 73 73
   000587         059100             AFTER   IDX-2 FROM 1 BY 1 UNTIL IDX-2 GREATER 10     NC2414.2 75 75
   000588         059200             AFTER   IDX-3 FROM 1 BY 1 UNTIL IDX-3 GREATER 10.    NC2414.2 77 77
   000589         059300     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000590      1  059400         PERFORM PASS                                             NC2414.2 236
   000591      1  059500         GO TO TH3-WRITE-GF-2                                     NC2414.2 603
   000592         059600     ELSE                                                         NC2414.2
   000593      1  059700         GO TO TH3-FAIL-GF-2.                                     NC2414.2 597
   000594         059800 TH3-DELETE-GF-2.                                                 NC2414.2
   000595         059900     PERFORM DE-LETE.                                             NC2414.2 238
   000596         060000     GO TO TH3-WRITE-GF-2.                                        NC2414.2 603
   000597         060100 TH3-FAIL-GF-2.                                                   NC2414.2
   000598         060200     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2414.2 51 111
   000599         060300     MOVE ENTRY-3 (10, 10, 10) TO COMPUTED-A.                     NC2414.2 78 97
   000600         060400                                                                  NC2414.2
   000601         060500     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000602         060600     PERFORM FAIL.                                                NC2414.2 237
   000603         060700 TH3-WRITE-GF-2.                                                  NC2414.2
   000604         060800     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000605         060900*                                                                 NC2414.2
   000606         061000 TH3-INIT-GF-3.                                                   NC2414.2
   000607         061100     MOVE "TH3-TEST-GF-3      " TO PAR-NAME.                      NC2414.2 86
   000608         061200     MOVE "ELEM (08,07,06)" TO ELEM-HOLD-AREA.                    NC2414.2 51
   000609         061300     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000610         061400 TH3-TEST-GF-3.                                                   NC2414.2
   000611         061500     PERFORM FIND-LEVEL-3-ENTRY                                   NC2414.2 659
   000612         061600             VARYING IDX-1 FROM 1 BY 1 UNTIL IDX-1 GREATER 10     NC2414.2 73 73
   000613         061700             AFTER   IDX-2 FROM 1 BY 1 UNTIL IDX-2 = 10           NC2414.2 75 75
   000614         061800             AFTER   IDX-3 FROM 1 BY 1 UNTIL IDX-3 = 10.          NC2414.2 77 77
   000615         061900     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000616      1  062000         PERFORM PASS                                             NC2414.2 236
   000617      1  062100         GO TO TH3-WRITE-GF-3                                     NC2414.2 629
   000618         062200     ELSE                                                         NC2414.2
   000619      1  062300         GO TO TH3-FAIL-GF-3.                                     NC2414.2 623
   000620         062400 TH3-DELETE-GF-3.                                                 NC2414.2
   000621         062500     PERFORM DE-LETE.                                             NC2414.2 238
   000622         062600     GO TO TH3-WRITE-GF-3.                                        NC2414.2 629
   000623         062700 TH3-FAIL-GF-3.                                                   NC2414.2
   000624         062800     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2414.2 51 111
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     MOVE ENTRY-3 (08, 07, 06) TO COMPUTED-A.                     NC2414.2 78 97
   000626         063000                                                                  NC2414.2
   000627         063100     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000628         063200     PERFORM FAIL.                                                NC2414.2 237
   000629         063300 TH3-WRITE-GF-3.                                                  NC2414.2
   000630         063400     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000631         063500*                                                                 NC2414.2
   000632         063600 TH3-INIT-GF-4.                                                   NC2414.2
   000633         063700     MOVE "TH3-TEST-GF-4      " TO PAR-NAME.                      NC2414.2 86
   000634         063800     MOVE SPACES TO TEST-CHECK.                                   NC2414.2 IMP 44
   000635         063900     MOVE "ELEM (06,04,08)" TO ELEM-HOLD-AREA.                    NC2414.2 51
   000636         064000 TH3-TEST-GF-4.                                                   NC2414.2
   000637         064100     PERFORM FIND-LEVEL-3-ENTRY                                   NC2414.2 659
   000638         064200             VARYING IDX-1 FROM 3 BY 3 UNTIL IDX-1 GREATER 10     NC2414.2 73 73
   000639         064300             AFTER   IDX-2 FROM 2 BY 2 UNTIL IDX-2 GREATER 10     NC2414.2 75 75
   000640         064400             AFTER   IDX-3 FROM 8 BY 8 UNTIL IDX-3 GREATER 10.    NC2414.2 77 77
   000641         064500     IF TEST-CHECK = "PASS"                                       NC2414.2 44
   000642      1  064600         PERFORM PASS                                             NC2414.2 236
   000643      1  064700         GO TO TH3-WRITE-GF-4                                     NC2414.2 655
   000644         064800     ELSE                                                         NC2414.2
   000645      1  064900         GO TO TH3-FAIL-GF-4.                                     NC2414.2 649
   000646         065000 TH3-DELETE-GF-4.                                                 NC2414.2
   000647         065100     PERFORM DE-LETE.                                             NC2414.2 238
   000648         065200     GO TO TH3-WRITE-GF-4.                                        NC2414.2 655
   000649         065300 TH3-FAIL-GF-4.                                                   NC2414.2
   000650         065400     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2414.2 51 111
   000651         065500     MOVE ENTRY-3 (06, 04, 08) TO COMPUTED-A.                     NC2414.2 78 97
   000652         065600                                                                  NC2414.2
   000653         065700     MOVE "PERFORM VARYING USING INDEX" TO RE-MARK.               NC2414.2 91
   000654         065800     PERFORM FAIL.                                                NC2414.2 237
   000655         065900 TH3-WRITE-GF-4.                                                  NC2414.2
   000656         066000     PERFORM PRINT-DETAIL.                                        NC2414.2 240
   000657         066100     GO TO END-3LEVEL-TEST.                                       NC2414.2 663
   000658         066200*                                                                 NC2414.2
   000659         066300 FIND-LEVEL-3-ENTRY.                                              NC2414.2
   000660         066400     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA            NC2414.2 78 73 75 77 51
   000661      1  066500         MOVE "PASS" TO TEST-CHECK.                               NC2414.2 44
   000662         066600*                                                                 NC2414.2
   000663         066700 END-3LEVEL-TEST.                                                 NC2414.2
   000664         066800     EXIT.                                                        NC2414.2
   000665         066900 CCVS-EXIT SECTION.                                               NC2414.2
   000666         067000 CCVS-999999.                                                     NC2414.2
   000667         067100     GO TO CLOSE-FILES.                                           NC2414.2 229
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       69   ADD-ELEM . . . . . . . . . . .  M352
       54   ADD-GRP. . . . . . . . . . . .  M348
       60   ADD-SEC. . . . . . . . . . . .  M350
      142   ANSI-REFERENCE . . . . . . . .  314 321 330
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
       97   COMPUTED-A . . . . . . . . . .  98 100 101 102 103 326 329 M364 M387 M411 M434 M465 M490 M515 M541 M573 M599
                                            M625 M651
       98   COMPUTED-N
       96   COMPUTED-X . . . . . . . . . .  M248 312
      100   COMPUTED-0V18
      102   COMPUTED-14V4
      104   COMPUTED-18V0
      101   COMPUTED-4V14
       46   CON-10
       48   CON-5
       50   CON-6
       45   CON-7
      120   COR-ANSI-REFERENCE . . . . . .  M321 M323
      111   CORRECT-A. . . . . . . . . . .  112 113 114 115 116 327 329 M363 M386 M410 M433 M464 M489 M514 M540 M572 M598
                                            M624 M650
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
       39   DUMMY-RECORD . . . . . . . . .  M253 M254 M255 M256 M258 M259 M260 M262 M264 M273 M280 M287 M292 M293 297 M298
                                            299 M300 M301 M302 M303 307 M308 M316 M331
       65   ELEM-GRP . . . . . . . . . . .  M348
       51   ELEM-HOLD-AREA . . . . . . . .  M557 572 M582 598 M608 624 M635 650 660
       63   ELEM-NAME. . . . . . . . . . .  353
       67   ELEM-SEC . . . . . . . . . . .  M350
      187   ENDER-DESC . . . . . . . . . .  M275 M286 M291
       74   ENTRY-1. . . . . . . . . . . .  M349 364 387 411 434 443
       76   ENTRY-2. . . . . . . . . . . .  M351 465 490 515 541 550
       78   ENTRY-3. . . . . . . . . . . .  M353 573 599 625 651 660
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    16
0 Defined   Cross-reference of data names   References

0     135   ERROR-COUNTER. . . . . . . . .  M237 266 276 279
      139   ERROR-HOLD . . . . . . . . . .  M266 M267 M267 M268 271
      185   ERROR-TOTAL. . . . . . . . . .  M277 M279 M284 M285 M289 M290
       82   FEATURE. . . . . . . . . . . .  M356 M448 M554
       73   GRP-ENTRY
       47   GRP-HOLD-AREA. . . . . . . . .  M359 363 M371 386 M395 410 M420 433 443
       52   GRP-NAME . . . . . . . . . . .  349
       75   GRP2-ENTRY
       77   GRP3-ENTRY
      213   HYPHEN-LINE. . . . . . . . . .  260 262 302
      179   ID-AGAIN . . . . . . . . . . .  M225
       73   IDX-1. . . . . . . . . . . . .  M345 348 349 351 353 M360 361 M376 376 M400 400 M423 423 443 M453 453 M478 478
                                            M503 503 M529 529 550 M560 560 M586 586 M612 612 M638 638 660
       75   IDX-2. . . . . . . . . . . . .  M346 350 351 353 M454 454 M479 479 M504 504 M530 530 550 M561 561 M587 587 M613
                                            613 M639 639 660
       77   IDX-3. . . . . . . . . . . . .  M347 352 353 M562 562 M588 588 M614 614 M640 640 660
      212   INF-ANSI-REFERENCE . . . . . .  M314 M317 M330 M332
      207   INFO-TEXT. . . . . . . . . . .  M315
      136   INSPECT-COUNTER. . . . . . . .  M235 266 288 290
       84   P-OR-F . . . . . . . . . . . .  M235 M236 M237 M238 245 M248
       86   PAR-NAME . . . . . . . . . . .  M250 M357 M372 M396 M419 M447 M473 M498 M523 M556 M581 M607 M633
       88   PARDOT-X . . . . . . . . . . .  M242
      137   PASS-COUNTER . . . . . . . . .  M236 268 270
       37   PRINT-FILE . . . . . . . . . .  33 224 230
       38   PRINT-REC. . . . . . . . . . .  M244 M320 M322
       91   RE-MARK. . . . . . . . . . . .  M239 M251 M366 M389 M413 M436 M467 M492 M517 M543 M575 M601 M627 M653
      133   REC-CT . . . . . . . . . . . .  241 243 250
      132   REC-SKL-SUB
      141   RECORD-COUNT . . . . . . . . .  M295 296 M304
       58   SEC-GRP. . . . . . . . . . . .  M348
       49   SEC-HOLD-AREA. . . . . . . . .  M449 464 M475 489 M500 514 M526 540 550
       56   SEC-NAME . . . . . . . . . . .  351
       41   SUB-1. . . . . . . . . . . . .  M338 339 345
       42   SUB-2. . . . . . . . . . . . .  M340 340 346
       43   SUB-3. . . . . . . . . . . . .  M341 341 347
       44   TEST-CHECK . . . . . . . . . .  M358 362 M373 377 M397 401 424 M444 M450 455 M474 480 M499 505 M524 M525 531
                                            M551 M555 563 M583 589 M609 615 M634 641 M661
       92   TEST-COMPUTED. . . . . . . . .  320
      107   TEST-CORRECT . . . . . . . . .  322
      160   TEST-ID. . . . . . . . . . . .  M225
       80   TEST-RESULTS . . . . . . . . .  M226 244
      138   TOTAL-ERROR
      209   XXCOMPUTED . . . . . . . . . .  M329
      211   XXCORRECT. . . . . . . . . . .  M329
      204   XXINFO . . . . . . . . . . . .  316 331
       72   3-DIMENSION-TBL
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    17
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
      665   CCVS-EXIT
      666   CCVS-999999
      222   CCVS1
      334   CCVS1-EXIT . . . . . . . . . .  G228
      355   CHECK-ENTRIES. . . . . . . . .  G342
      229   CLOSE-FILES. . . . . . . . . .  G667
      257   COLUMN-NAMES-ROUTINE . . . . .  E227
      238   DE-LETE. . . . . . . . . . . .  P383 P407 P430 P461 P486 P511 P537 P569 P595 P621 P647
      261   END-ROUTINE. . . . . . . . . .  P230
      265   END-ROUTINE-1
      274   END-ROUTINE-12
      282   END-ROUTINE-13 . . . . . . . .  E230
      263   END-RTN-EXIT
      663   END-3LEVEL-TEST. . . . . . . .  G657
      237   FAIL . . . . . . . . . . . . .  P367 P390 P414 P437 P468 P493 P518 P544 P576 P602 P628 P654
      311   FAIL-ROUTINE . . . . . . . . .  P246
      324   FAIL-ROUTINE-EX. . . . . . . .  E246 G318
      319   FAIL-ROUTINE-WRITE . . . . . .  G312 G313
      442   FIND-LEVEL-1-ENTRY . . . . . .  P360 P375 P399 P422
      549   FIND-LEVEL-2-ENTRY . . . . . .  P452 P477 P502 P528
      659   FIND-LEVEL-3-ENTRY . . . . . .  P559 P585 P611 P637
      252   HEAD-ROUTINE . . . . . . . . .  P227
      235   INSPT
      223   OPEN-FILES
      344   PARA-1 . . . . . . . . . . . .  P338
      236   PASS . . . . . . . . . . . . .  P378 P402 P425 P456 P481 P506 P532 P564 P590 P616 P642
      240   PRINT-DETAIL . . . . . . . . .  P368 P392 P416 P439 P470 P495 P520 P546 P578 P604 P630 P656
      336   SECT-NC241A-001
      233   TERMINATE-CALL
      231   TERMINATE-CCVS
      337   TH-15-001
      382   TH1-DELETE-GF-2
      406   TH1-DELETE-GF-3
      429   TH1-DELETE-GF-4
      385   TH1-FAIL-GF-2. . . . . . . . .  G381
      409   TH1-FAIL-GF-3. . . . . . . . .  G405
      432   TH1-FAIL-GF-4. . . . . . . . .  G428
      370   TH1-INIT-GF-2. . . . . . . . .  G362
      394   TH1-INIT-GF-3
      418   TH1-INIT-GF-4
      374   TH1-TEST-GF-2
      398   TH1-TEST-GF-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    18
0 Defined   Cross-reference of procedures   References

0     421   TH1-TEST-GF-4
      391   TH1-WRITE-GF-2 . . . . . . . .  G379 G384
      415   TH1-WRITE-GF-3 . . . . . . . .  G403 G408
      438   TH1-WRITE-GF-4 . . . . . . . .  G426 G431
      460   TH2-DELETE-GF-1
      485   TH2-DELETE-GF-2
      510   TH2-DELETE-GF-3
      536   TH2-DELETE-GF-4
      463   TH2-FAIL-GF-1. . . . . . . . .  G459
      488   TH2-FAIL-GF-2. . . . . . . . .  G484
      513   TH2-FAIL-GF-3. . . . . . . . .  G509
      539   TH2-FAIL-GF-4. . . . . . . . .  G535
      446   TH2-INIT-GF-1. . . . . . . . .  G440
      472   TH2-INIT-GF-2
      497   TH2-INIT-GF-3
      522   TH2-INIT-GF-4
      451   TH2-TEST-GF-1
      476   TH2-TEST-GF-2
      501   TH2-TEST-GF-3
      527   TH2-TEST-GF-4
      469   TH2-WRITE-GF-1 . . . . . . . .  G457 G462
      494   TH2-WRITE-GF-2 . . . . . . . .  G482 G487
      519   TH2-WRITE-GF-3 . . . . . . . .  G507 G512
      545   TH2-WRITE-GF-4 . . . . . . . .  G533 G538
      568   TH3-DELETE-GF-1
      594   TH3-DELETE-GF-2
      620   TH3-DELETE-GF-3
      646   TH3-DELETE-GF-4
      571   TH3-FAIL-GF-1. . . . . . . . .  G567
      597   TH3-FAIL-GF-2. . . . . . . . .  G593
      623   TH3-FAIL-GF-3. . . . . . . . .  G619
      649   TH3-FAIL-GF-4. . . . . . . . .  G645
      553   TH3-INIT-GF-1. . . . . . . . .  G547
      580   TH3-INIT-GF-2
      606   TH3-INIT-GF-3
      632   TH3-INIT-GF-4
      558   TH3-TEST-GF-1
      584   TH3-TEST-GF-2
      610   TH3-TEST-GF-3
      636   TH3-TEST-GF-4
      577   TH3-WRITE-GF-1 . . . . . . . .  G565 G570
      603   TH3-WRITE-GF-2 . . . . . . . .  G591 G596
      629   TH3-WRITE-GF-3 . . . . . . . .  G617 G622
      655   TH3-WRITE-GF-4 . . . . . . . .  G643 G648
      294   WRITE-LINE . . . . . . . . . .  P244 P245 P253 P254 P255 P256 P258 P259 P260 P262 P264 P273 P281 P287 P292 P293
                                            P316 P320 P322 P331
      306   WRT-LN . . . . . . . . . . . .  P300 P301 P302 P305 P310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    19
0 Defined   Cross-reference of programs     References

        3   NC241A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC241A    Date 06/04/2022  Time 11:59:20   Page    20
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC241A:
 *    Source records = 667
 *    Data Division statements = 90
 *    Procedure Division statements = 328
 *    Generated COBOL statements = 0
 *    Program complexity factor = 339
0End of compilation 1,  program NC241A,  highest severity 0.
0Return code 0
