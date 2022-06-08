1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:37   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:37   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2374.2
   000002         000200 PROGRAM-ID.                                                      NC2374.2
   000003         000300     NC237A.                                                      NC2374.2
   000004         000500*                                                              *  NC2374.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2374.2
   000006         000700*                                                              *  NC2374.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2374.2
   000008         000900*                                                              *  NC2374.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2374.2
   000010         001100*                                                              *  NC2374.2
   000011         001300*                                                              *  NC2374.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2374.2
   000013         001500*                                                              *  NC2374.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2374.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2374.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2374.2
   000017         001900*                                                              *  NC2374.2
   000018         002100                                                                  NC2374.2
   000019         002200*                                                                 NC2374.2
   000020         002300*    PROGRAM NC237A TESTS FORMAT 2 OF THE "SEARCH" STATEMENT   *  NC2374.2
   000021         002400*    WITH A THREE-DIMENSIONAL TABLE CONTAINING ASCENDING AND   *  NC2374.2
   000022         002500*    DESCENDING KEYS.                                          *  NC2374.2
   000023         002600*                                                              *  NC2374.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2374.2
   000025         002900 CONFIGURATION SECTION.                                           NC2374.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2374.2
   000027         003100     XXXXX082.                                                    NC2374.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2374.2
   000029         003300     XXXXX083.                                                    NC2374.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2374.2
   000031         003500 FILE-CONTROL.                                                    NC2374.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2374.2 36
   000033         003700     XXXXX055.                                                    NC2374.2
   000034         003800 DATA DIVISION.                                                   NC2374.2
   000035         003900 FILE SECTION.                                                    NC2374.2
   000036         004000 FD  PRINT-FILE.                                                  NC2374.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2374.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2374.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2374.2
   000040         004400 77  IDENT-1  PICTURE S9(18) VALUE ZERO  COMPUTATIONAL.           NC2374.2 IMP
   000041         004500 77  IDENT-2  PICTURE S9(18) VALUE ZERO  COMPUTATIONAL.           NC2374.2 IMP
   000042         004600 77  IDENT-3  PICTURE S9(18) VALUE ZERO  COMPUTATIONAL.           NC2374.2 IMP
   000043         004700 77  IDENT-4  PICTURE 9  VALUE ZERO COMPUTATIONAL.                NC2374.2 IMP
   000044         004800 77  IDENT-5  PICTURE 9  VALUE ZERO COMPUTATIONAL.                NC2374.2 IMP
   000045         004900 77  IDENT-6  PICTURE 9(18) VALUE 3.                              NC2374.2
   000046         005000 77  IDENT-7  PICTURE 9(18) VALUE 1.                              NC2374.2
   000047         005100 77  IDENT-8  PICTURE 9   VALUE 6.                                NC2374.2
   000048         005200 77  IDENT-9  PICTURE 9   VALUE 5.                                NC2374.2
   000049         005300 01  TABLE-TH310.                                                 NC2374.2
   000050         005400     02  ENTRY-310 OCCURS 9 TIMES ASCENDING GRP                   NC2374.2 53
   000051         005500         INDEXED BY IDX-1.                                        NC2374.2
   000052         005600         03  ENTRY-1.                                             NC2374.2
   000053         005700             04  GRP    PIC 99.                                   NC2374.2
   000054         005800         03  ENTRY-310-2 OCCURS 9 ASCENDING KEY GRP-1             NC2374.2 57
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900             DESCENDING KEY IS SEC INDEXED BY IDX-2.              NC2374.2 58
   000056         006000             04  ENTRY-2.                                         NC2374.2
   000057         006100                 05  GRP-1  PIC 99.                               NC2374.2
   000058         006200                 05  SEC    PIC 99.                               NC2374.2
   000059         006300             04  ENTRY-310-3 OCCURS 9 TIMES ASCENDING IS GRP-2    NC2374.2 62
   000060         006400             DESCENDING KEY SEC-1 ASCENDING ELEM INDEXED IDX-3.   NC2374.2 63 64
   000061         006500                 05  ENTRY-3.                                     NC2374.2
   000062         006600                     06  GRP-2   PICTURE 99.                      NC2374.2
   000063         006700                     06  SEC-1   PICTURE 99.                      NC2374.2
   000064         006800                     06  ELEM    PICTURE 99.                      NC2374.2
   000065         006900 01  ENTRIES-X.                                                   NC2374.2
   000066         007000     02  ONE-99  PICTURE 99 VALUE 01.                             NC2374.2
   000067         007100     02  TWO-99  PICTURE 99  VALUE 09.                            NC2374.2
   000068         007200     02  THREE-99  PICTURE 99  VALUE 01.                          NC2374.2
   000069         007300 01  CT  PICTURE 999  VALUE 111.                                  NC2374.2
   000070         007400 01  SU REDEFINES CT.                                             NC2374.2 69
   000071         007500     02  S1  PICTURE 9.                                           NC2374.2
   000072         007600     02  S2  PICTURE 9.                                           NC2374.2
   000073         007700     02  S3  PICTURE 9.                                           NC2374.2
   000074         007800 01  TEST-RESULTS.                                                NC2374.2
   000075         007900     02 FILLER                   PIC X      VALUE SPACE.          NC2374.2 IMP
   000076         008000     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2374.2 IMP
   000077         008100     02 FILLER                   PIC X      VALUE SPACE.          NC2374.2 IMP
   000078         008200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2374.2 IMP
   000079         008300     02 FILLER                   PIC X      VALUE SPACE.          NC2374.2 IMP
   000080         008400     02  PAR-NAME.                                                NC2374.2
   000081         008500       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2374.2 IMP
   000082         008600       03  PARDOT-X              PIC X      VALUE SPACE.          NC2374.2 IMP
   000083         008700       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2374.2 IMP
   000084         008800     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2374.2 IMP
   000085         008900     02 RE-MARK                  PIC X(61).                       NC2374.2
   000086         009000 01  TEST-COMPUTED.                                               NC2374.2
   000087         009100     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2374.2 IMP
   000088         009200     02 FILLER                   PIC X(17)  VALUE                 NC2374.2
   000089         009300            "       COMPUTED=".                                   NC2374.2
   000090         009400     02 COMPUTED-X.                                               NC2374.2
   000091         009500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2374.2 IMP
   000092         009600     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2374.2 91
   000093         009700                                 PIC -9(9).9(9).                  NC2374.2
   000094         009800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2374.2 91
   000095         009900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2374.2 91
   000096         010000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2374.2 91
   000097         010100     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2374.2 91
   000098         010200         04 COMPUTED-18V0                    PIC -9(18).          NC2374.2
   000099         010300         04 FILLER                           PIC X.               NC2374.2
   000100         010400     03 FILLER PIC X(50) VALUE SPACE.                             NC2374.2 IMP
   000101         010500 01  TEST-CORRECT.                                                NC2374.2
   000102         010600     02 FILLER PIC X(30) VALUE SPACE.                             NC2374.2 IMP
   000103         010700     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2374.2
   000104         010800     02 CORRECT-X.                                                NC2374.2
   000105         010900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2374.2 IMP
   000106         011000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2374.2 105
   000107         011100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2374.2 105
   000108         011200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2374.2 105
   000109         011300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2374.2 105
   000110         011400     03      CR-18V0 REDEFINES CORRECT-A.                         NC2374.2 105
   000111         011500         04 CORRECT-18V0                     PIC -9(18).          NC2374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600         04 FILLER                           PIC X.               NC2374.2
   000113         011700     03 FILLER PIC X(2) VALUE SPACE.                              NC2374.2 IMP
   000114         011800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2374.2 IMP
   000115         011900 01  CCVS-C-1.                                                    NC2374.2
   000116         012000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2374.2
   000117         012100-    "SS  PARAGRAPH-NAME                                          NC2374.2
   000118         012200-    "       REMARKS".                                            NC2374.2
   000119         012300     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2374.2 IMP
   000120         012400 01  CCVS-C-2.                                                    NC2374.2
   000121         012500     02 FILLER                     PIC X        VALUE SPACE.      NC2374.2 IMP
   000122         012600     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2374.2
   000123         012700     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2374.2 IMP
   000124         012800     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2374.2
   000125         012900     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2374.2 IMP
   000126         013000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2374.2 IMP
   000127         013100 01  REC-CT                        PIC 99       VALUE ZERO.       NC2374.2 IMP
   000128         013200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2374.2 IMP
   000129         013300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2374.2 IMP
   000130         013400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2374.2 IMP
   000131         013500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2374.2 IMP
   000132         013600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2374.2 IMP
   000133         013700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2374.2 IMP
   000134         013800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2374.2 IMP
   000135         013900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2374.2 IMP
   000136         014000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2374.2 IMP
   000137         014100 01  CCVS-H-1.                                                    NC2374.2
   000138         014200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2374.2 IMP
   000139         014300     02  FILLER                    PIC X(42)    VALUE             NC2374.2
   000140         014400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2374.2
   000141         014500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2374.2 IMP
   000142         014600 01  CCVS-H-2A.                                                   NC2374.2
   000143         014700   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2374.2 IMP
   000144         014800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2374.2
   000145         014900   02  FILLER                        PIC XXXX   VALUE             NC2374.2
   000146         015000     "4.2 ".                                                      NC2374.2
   000147         015100   02  FILLER                        PIC X(28)  VALUE             NC2374.2
   000148         015200            " COPY - NOT FOR DISTRIBUTION".                       NC2374.2
   000149         015300   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2374.2 IMP
   000150         015400                                                                  NC2374.2
   000151         015500 01  CCVS-H-2B.                                                   NC2374.2
   000152         015600   02  FILLER                        PIC X(15)  VALUE             NC2374.2
   000153         015700            "TEST RESULT OF ".                                    NC2374.2
   000154         015800   02  TEST-ID                       PIC X(9).                    NC2374.2
   000155         015900   02  FILLER                        PIC X(4)   VALUE             NC2374.2
   000156         016000            " IN ".                                               NC2374.2
   000157         016100   02  FILLER                        PIC X(12)  VALUE             NC2374.2
   000158         016200     " HIGH       ".                                              NC2374.2
   000159         016300   02  FILLER                        PIC X(22)  VALUE             NC2374.2
   000160         016400            " LEVEL VALIDATION FOR ".                             NC2374.2
   000161         016500   02  FILLER                        PIC X(58)  VALUE             NC2374.2
   000162         016600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2374.2
   000163         016700 01  CCVS-H-3.                                                    NC2374.2
   000164         016800     02  FILLER                      PIC X(34)  VALUE             NC2374.2
   000165         016900            " FOR OFFICIAL USE ONLY    ".                         NC2374.2
   000166         017000     02  FILLER                      PIC X(58)  VALUE             NC2374.2
   000167         017100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2374.2
   000168         017200     02  FILLER                      PIC X(28)  VALUE             NC2374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300            "  COPYRIGHT   1985 ".                                NC2374.2
   000170         017400 01  CCVS-E-1.                                                    NC2374.2
   000171         017500     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2374.2 IMP
   000172         017600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2374.2
   000173         017700     02 ID-AGAIN                     PIC X(9).                    NC2374.2
   000174         017800     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2374.2 IMP
   000175         017900 01  CCVS-E-2.                                                    NC2374.2
   000176         018000     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2374.2 IMP
   000177         018100     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2374.2 IMP
   000178         018200     02 CCVS-E-2-2.                                               NC2374.2
   000179         018300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2374.2 IMP
   000180         018400         03 FILLER                   PIC X      VALUE SPACE.      NC2374.2 IMP
   000181         018500         03 ENDER-DESC               PIC X(44)  VALUE             NC2374.2
   000182         018600            "ERRORS ENCOUNTERED".                                 NC2374.2
   000183         018700 01  CCVS-E-3.                                                    NC2374.2
   000184         018800     02  FILLER                      PIC X(22)  VALUE             NC2374.2
   000185         018900            " FOR OFFICIAL USE ONLY".                             NC2374.2
   000186         019000     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2374.2 IMP
   000187         019100     02  FILLER                      PIC X(58)  VALUE             NC2374.2
   000188         019200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2374.2
   000189         019300     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2374.2 IMP
   000190         019400     02 FILLER                       PIC X(15)  VALUE             NC2374.2
   000191         019500             " COPYRIGHT 1985".                                   NC2374.2
   000192         019600 01  CCVS-E-4.                                                    NC2374.2
   000193         019700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2374.2 IMP
   000194         019800     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2374.2
   000195         019900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2374.2 IMP
   000196         020000     02 FILLER                       PIC X(40)  VALUE             NC2374.2
   000197         020100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2374.2
   000198         020200 01  XXINFO.                                                      NC2374.2
   000199         020300     02 FILLER                       PIC X(19)  VALUE             NC2374.2
   000200         020400            "*** INFORMATION ***".                                NC2374.2
   000201         020500     02 INFO-TEXT.                                                NC2374.2
   000202         020600       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2374.2 IMP
   000203         020700       04 XXCOMPUTED                 PIC X(20).                   NC2374.2
   000204         020800       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2374.2 IMP
   000205         020900       04 XXCORRECT                  PIC X(20).                   NC2374.2
   000206         021000     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2374.2
   000207         021100 01  HYPHEN-LINE.                                                 NC2374.2
   000208         021200     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2374.2 IMP
   000209         021300     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2374.2
   000210         021400-    "*****************************************".                 NC2374.2
   000211         021500     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2374.2
   000212         021600-    "******************************".                            NC2374.2
   000213         021700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2374.2
   000214         021800     "NC237A".                                                    NC2374.2
   000215         021900 PROCEDURE DIVISION.                                              NC2374.2
   000216         022000 CCVS1 SECTION.                                                   NC2374.2
   000217         022100 OPEN-FILES.                                                      NC2374.2
   000218         022200     OPEN     OUTPUT PRINT-FILE.                                  NC2374.2 36
   000219         022300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2374.2 213 154 213 173
   000220         022400     MOVE    SPACE TO TEST-RESULTS.                               NC2374.2 IMP 74
   000221         022500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2374.2 246 251
   000222         022600     GO TO CCVS1-EXIT.                                            NC2374.2 328
   000223         022700 CLOSE-FILES.                                                     NC2374.2
   000224         022800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2374.2 255 276 36
   000225         022900 TERMINATE-CCVS.                                                  NC2374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     EXIT PROGRAM.                                                NC2374.2
   000227         023100 TERMINATE-CALL.                                                  NC2374.2
   000228         023200     STOP     RUN.                                                NC2374.2
   000229         023300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2374.2 78 130
   000230         023400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2374.2 78 131
   000231         023500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2374.2 78 129
   000232         023600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2374.2 78 128
   000233         023700     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2374.2 85
   000234         023800 PRINT-DETAIL.                                                    NC2374.2
   000235         023900     IF REC-CT NOT EQUAL TO ZERO                                  NC2374.2 127 IMP
   000236      1  024000             MOVE "." TO PARDOT-X                                 NC2374.2 82
   000237      1  024100             MOVE REC-CT TO DOTVALUE.                             NC2374.2 127 83
   000238         024200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2374.2 74 37 288
   000239         024300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2374.2 78 288
   000240      1  024400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2374.2 305 318
   000241      1  024500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2374.2 319 327
   000242         024600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2374.2 IMP 78 IMP 90
   000243         024700     MOVE SPACE TO CORRECT-X.                                     NC2374.2 IMP 104
   000244         024800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2374.2 127 IMP IMP 80
   000245         024900     MOVE     SPACE TO RE-MARK.                                   NC2374.2 IMP 85
   000246         025000 HEAD-ROUTINE.                                                    NC2374.2
   000247         025100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2374.2 137 38 288
   000248         025200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2374.2 142 38 288
   000249         025300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2374.2 151 38 288
   000250         025400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2374.2 163 38 288
   000251         025500 COLUMN-NAMES-ROUTINE.                                            NC2374.2
   000252         025600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2374.2 115 38 288
   000253         025700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2374.2 120 38 288
   000254         025800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2374.2 207 38 288
   000255         025900 END-ROUTINE.                                                     NC2374.2
   000256         026000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2374.2 207 38 288
   000257         026100 END-RTN-EXIT.                                                    NC2374.2
   000258         026200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2374.2 170 38 288
   000259         026300 END-ROUTINE-1.                                                   NC2374.2
   000260         026400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2374.2 129 133 130
   000261         026500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2374.2 133 128 133
   000262         026600      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2374.2 131 133
   000263         026700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2374.2
   000264         026800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2374.2 131 193
   000265         026900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2374.2 133 195
   000266         027000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2374.2 192 178
   000267         027100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2374.2 175 38 288
   000268         027200  END-ROUTINE-12.                                                 NC2374.2
   000269         027300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2374.2 181
   000270         027400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2374.2 129 IMP
   000271      1  027500         MOVE "NO " TO ERROR-TOTAL                                NC2374.2 179
   000272         027600         ELSE                                                     NC2374.2
   000273      1  027700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2374.2 129 179
   000274         027800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2374.2 175 38
   000275         027900     PERFORM WRITE-LINE.                                          NC2374.2 288
   000276         028000 END-ROUTINE-13.                                                  NC2374.2
   000277         028100     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2374.2 128 IMP
   000278      1  028200         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2374.2 179
   000279      1  028300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2374.2 128 179
   000280         028400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2374.2 181
   000281         028500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2374.2 175 38 288
   000282         028600      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2374.2 130 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700          MOVE "NO " TO ERROR-TOTAL                               NC2374.2 179
   000284      1  028800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2374.2 130 179
   000285         028900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2374.2 181
   000286         029000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2374.2 175 38 288
   000287         029100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2374.2 183 38 288
   000288         029200 WRITE-LINE.                                                      NC2374.2
   000289         029300     ADD 1 TO RECORD-COUNT.                                       NC2374.2 135
   000290         029400     IF RECORD-COUNT GREATER 50                                   NC2374.2 135
   000291      1  029500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2374.2 38 134
   000292      1  029600         MOVE SPACE TO DUMMY-RECORD                               NC2374.2 IMP 38
   000293      1  029700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2374.2 38
   000294      1  029800         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2374.2 115 38 300
   000295      1  029900         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2374.2 120 38 300
   000296      1  030000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2374.2 207 38 300
   000297      1  030100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2374.2 134 38
   000298      1  030200         MOVE ZERO TO RECORD-COUNT.                               NC2374.2 IMP 135
   000299         030300     PERFORM WRT-LN.                                              NC2374.2 300
   000300         030400 WRT-LN.                                                          NC2374.2
   000301         030500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2374.2 38
   000302         030600     MOVE SPACE TO DUMMY-RECORD.                                  NC2374.2 IMP 38
   000303         030700 BLANK-LINE-PRINT.                                                NC2374.2
   000304         030800     PERFORM WRT-LN.                                              NC2374.2 300
   000305         030900 FAIL-ROUTINE.                                                    NC2374.2
   000306         031000     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2374.2 90 IMP 313
   000307         031100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2374.2 104 IMP 313
   000308         031200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2374.2 136 206
   000309         031300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2374.2 201
   000310         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2374.2 198 38 288
   000311         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2374.2 IMP 206
   000312         031600     GO TO  FAIL-ROUTINE-EX.                                      NC2374.2 318
   000313         031700 FAIL-ROUTINE-WRITE.                                              NC2374.2
   000314         031800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2374.2 86 37 288
   000315         031900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2374.2 136 114
   000316         032000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2374.2 101 37 288
   000317         032100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2374.2 IMP 114
   000318         032200 FAIL-ROUTINE-EX. EXIT.                                           NC2374.2
   000319         032300 BAIL-OUT.                                                        NC2374.2
   000320         032400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2374.2 91 IMP 322
   000321         032500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2374.2 105 IMP 327
   000322         032600 BAIL-OUT-WRITE.                                                  NC2374.2
   000323         032700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2374.2 105 205 91 203
   000324         032800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2374.2 136 206
   000325         032900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2374.2 198 38 288
   000326         033000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2374.2 IMP 206
   000327         033100 BAIL-OUT-EX. EXIT.                                               NC2374.2
   000328         033200 CCVS1-EXIT.                                                      NC2374.2
   000329         033300     EXIT.                                                        NC2374.2
   000330         033400 SECT-NC237A-001 SECTION.                                         NC2374.2
   000331         033500 TH-10-001.                                                       NC2374.2
   000332         033600*                                                                 NC2374.2
   000333         033700 BUILD-3DEM-TABLE.                                                NC2374.2

 ==000333==> IGYPS2015-I The paragraph or section prior to paragraph or section "BUILD-3DEM-TABLE"
                         did not contain any statements.

   000334         033800     MOVE "PERFORM VARYING" TO FEATURE.                           NC2374.2 76
   000335         033900     SET IDX-1, IDX-2, IDX-3 TO 1.                                NC2374.2 51 55 60
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000336         034000     PERFORM BUILD-TABLE THRU BUILD-EXIT VARYING ONE-99 FROM 1    NC2374.2 342 357 66
   000337         034100         BY 1 UNTIL ONE-99 EQUAL TO 10 AFTER TWO-99 FROM 9 BY -1  NC2374.2 66 67
   000338         034200         UNTIL TWO-99 EQUAL TO 0 AFTER THREE-99 FROM 1 BY 1       NC2374.2 67 68
   000339         034300         UNTIL THREE-99 EQUAL TO 10.                              NC2374.2 68
   000340         034400     GO TO IDX-INIT-GF-1.                                         NC2374.2 360
   000341         034500*                                                                 NC2374.2
   000342         034600 BUILD-TABLE.                                                     NC2374.2
   000343         034700     MOVE ONE-99 TO GRP (IDX-1), GRP-1 (IDX-1, IDX-2),            NC2374.2 66 53 51 57 51 55
   000344         034800         GRP-2 (IDX-1, IDX-2, IDX-3).                             NC2374.2 62 51 55 60
   000345         034900     MOVE TWO-99 TO SEC (IDX-1, IDX-2) SEC-1 (IDX-1, IDX-2, IDX-3)NC2374.2 67 58 51 55 63 51 55 60
   000346         035000     MOVE THREE-99 TO ELEM (IDX-1, IDX-2, IDX-3).                 NC2374.2 68 64 51 55 60
   000347         035100     IF CT = 999                                                  NC2374.2 69
   000348      1  035200          MOVE 0 TO CT                                            NC2374.2 69
   000349         035300     ELSE                                                         NC2374.2
   000350      1  035400          ADD 1 TO CT.                                            NC2374.2 69
   000351         035500     IF S3 EQUAL TO 0 ADD 1 TO S3.                                NC2374.2 73 73
   000352         035600     IF S2 EQUAL TO 0 ADD 1 TO S2.                                NC2374.2 72 72
   000353         035700     IF S1 EQUAL TO 0 ADD 1 TO S1.                                NC2374.2 71 71
   000354         035800     SET IDX-1 TO S1.                                             NC2374.2 51 71
   000355         035900     SET IDX-2 TO S2.                                             NC2374.2 55 72
   000356         036000     SET IDX-3 TO S3.                                             NC2374.2 60 73
   000357         036100 BUILD-EXIT.                                                      NC2374.2
   000358         036200     EXIT.                                                        NC2374.2
   000359         036300*                                                                 NC2374.2
   000360         036400 IDX-INIT-GF-1.                                                   NC2374.2
   000361         036500     MOVE "IDX-TEST-GF-1" TO PAR-NAME.                            NC2374.2 80
   000362         036600     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000363         036700     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000364         036800 IDX-TEST-GF-1.                                                   NC2374.2
   000365         036900     IF ENTRY-3 (9, 9, 9) EQUAL TO 090109                         NC2374.2 61
   000366      1  037000         PERFORM PASS                                             NC2374.2 230
   000367      1  037100         MOVE "TABLE BUILT CORRECTLY" TO RE-MARK                  NC2374.2 85
   000368      1  037200         GO TO IDX-WRITE-GF-1.                                    NC2374.2 376
   000369         037300     GO TO IDX-FAIL-GF-1.                                         NC2374.2 373
   000370         037400 IDX-DELETE-GF-1.                                                 NC2374.2
   000371         037500     PERFORM DE-LETE.                                             NC2374.2 232
   000372         037600     GO TO IDX-WRITE-GF-1.                                        NC2374.2 376
   000373         037700 IDX-FAIL-GF-1.                                                   NC2374.2
   000374         037800     MOVE "TABLE CREATED INCORRECTLY" TO RE-MARK.                 NC2374.2 85
   000375         037900     PERFORM FAIL.                                                NC2374.2 231
   000376         038000 IDX-WRITE-GF-1.                                                  NC2374.2
   000377         038100     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000378         038200*                                                                 NC2374.2
   000379         038300 IDX-INIT-GF-2.                                                   NC2374.2
   000380         038400     MOVE "IDX-TEST-GF-2 " TO PAR-NAME.                           NC2374.2 80
   000381         038500     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000382         038600     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000383         038700     MOVE 7 TO IDENT-1.                                           NC2374.2 40
   000384         038800     SET IDX-1  IDX-2  IDX-3 TO IDENT-1.                          NC2374.2 51 55 60 40
   000385         038900     SET IDX-1  IDX-3 DOWN BY IDENT-6.                            NC2374.2 51 60 45
   000386         039000 IDX-TEST-GF-2.                                                   NC2374.2
   000387         039100     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) EQUAL TO 040304             NC2374.2 61 51 55 60
   000388      1  039200         PERFORM PASS                                             NC2374.2 230
   000389      1  039300         GO TO IDX-WRITE-GF-2.                                    NC2374.2 398
   000390         039400     GO TO IDX-FAIL-GF-2.                                         NC2374.2 394
   000391         039500 IDX-DELETE-GF-2.                                                 NC2374.2
   000392         039600     PERFORM DE-LETE.                                             NC2374.2 232
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039700     GO TO IDX-WRITE-GF-2.                                        NC2374.2 398
   000394         039800 IDX-FAIL-GF-2.                                                   NC2374.2
   000395         039900     MOVE "040304" TO CORRECT-A.                                  NC2374.2 105
   000396         040000     MOVE ENTRY-3 (IDX-1, IDX-2, IDX-3) TO COMPUTED-A.            NC2374.2 61 51 55 60 91
   000397         040100     PERFORM FAIL.                                                NC2374.2 231
   000398         040200 IDX-WRITE-GF-2.                                                  NC2374.2
   000399         040300     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000400         040400*                                                                 NC2374.2
   000401         040500 IDX-INIT-GF-3.                                                   NC2374.2
   000402         040600     MOVE "IDX-TEST-GF-3" TO PAR-NAME.                            NC2374.2 80
   000403         040700     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000404         040800     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000405         040900     MOVE 4 TO IDENT-1.                                           NC2374.2 40
   000406         041000     SET IDX-1 TO IDENT-7.                                        NC2374.2 51 46
   000407         041100     SET IDX-1 UP BY IDENT-1.                                     NC2374.2 51 40
   000408         041200 IDX-TEST-GF-3.                                                   NC2374.2
   000409         041300     IF ENTRY-1 (IDX-1) EQUAL TO "05"                             NC2374.2 52 51
   000410      1  041400         PERFORM PASS                                             NC2374.2 230
   000411      1  041500         GO TO IDX-WRITE-GF-3.                                    NC2374.2 420
   000412         041600     GO TO IDX-FAIL-GF-3.                                         NC2374.2 416
   000413         041700 IDX-DELETE-GF-3.                                                 NC2374.2
   000414         041800     PERFORM DE-LETE.                                             NC2374.2 232
   000415         041900     GO TO IDX-WRITE-GF-3.                                        NC2374.2 420
   000416         042000 IDX-FAIL-GF-3.                                                   NC2374.2
   000417         042100     MOVE ENTRY-1 (IDX-1) TO COMPUTED-A.                          NC2374.2 52 51 91
   000418         042200     MOVE "05" TO CORRECT-A.                                      NC2374.2 105
   000419         042300     PERFORM FAIL.                                                NC2374.2 231
   000420         042400 IDX-WRITE-GF-3.                                                  NC2374.2
   000421         042500     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000422         042600*                                                                 NC2374.2
   000423         042700 IDX-INIT-GF-4.                                                   NC2374.2
   000424         042800     MOVE "IDX-TEST-GF-4" TO PAR-NAME.                            NC2374.2 80
   000425         042900     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000426         043000     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000427         043100     MOVE 1 TO IDENT-1.                                           NC2374.2 40
   000428         043200     SET IDX-1  IDX-2 TO IDENT-1.                                 NC2374.2 51 55 40
   000429         043300     SET IDX-2 UP BY IDENT-9.                                     NC2374.2 55 48
   000430         043400     SET IDX-2 UP BY IDENT-6.                                     NC2374.2 55 45
   000431         043500 IDX-TEST-GF-4.                                                   NC2374.2
   000432         043600     IF ENTRY-2 (IDX-1, IDX-2) EQUAL TO "0101"                    NC2374.2 56 51 55
   000433      1  043700         PERFORM PASS                                             NC2374.2 230
   000434      1  043800         GO TO IDX-WRITE-GF-4.                                    NC2374.2 443
   000435         043900     GO TO IDX-FAIL-GF-4.                                         NC2374.2 439
   000436         044000 IDX-DELETE-GF-4.                                                 NC2374.2
   000437         044100     PERFORM DE-LETE.                                             NC2374.2 232
   000438         044200     GO TO IDX-WRITE-GF-4.                                        NC2374.2 443
   000439         044300 IDX-FAIL-GF-4.                                                   NC2374.2
   000440         044400     MOVE "0101" TO CORRECT-A.                                    NC2374.2 105
   000441         044500     MOVE ENTRY-2 (IDX-1, IDX-2) TO COMPUTED-A.                   NC2374.2 56 51 55 91
   000442         044600     PERFORM FAIL.                                                NC2374.2 231
   000443         044700 IDX-WRITE-GF-4.                                                  NC2374.2
   000444         044800     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000445         044900*                                                                 NC2374.2
   000446         045000 IDX-INIT-GF-5.                                                   NC2374.2
   000447         045100     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000448         045200     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000449         045300     MOVE "IDX-TEST-GF-5" TO PAR-NAME.                            NC2374.2 80
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045400     MOVE 1 TO IDENT-1.                                           NC2374.2 40
   000451         045500     SET IDX-1 TO IDENT-6.                                        NC2374.2 51 45
   000452         045600     SET IDX-1 UP BY IDENT-1.                                     NC2374.2 51 40
   000453         045700 IDX-TEST-GF-5.                                                   NC2374.2
   000454         045800     IF ENTRY-1 (IDX-1) EQUAL TO 04                               NC2374.2 52 51
   000455      1  045900         PERFORM PASS                                             NC2374.2 230
   000456      1  046000         GO TO IDX-WRITE-GF-5.                                    NC2374.2 465
   000457         046100     GO TO IDX-FAIL-GF-5.                                         NC2374.2 461
   000458         046200 IDX-DELETE-GF-5.                                                 NC2374.2
   000459         046300     PERFORM DE-LETE.                                             NC2374.2 232
   000460         046400     GO TO IDX-WRITE-GF-5.                                        NC2374.2 465
   000461         046500 IDX-FAIL-GF-5.                                                   NC2374.2
   000462         046600     MOVE "04" TO CORRECT-A.                                      NC2374.2 105
   000463         046700     MOVE ENTRY-1 (IDX-1) TO COMPUTED-A.                          NC2374.2 52 51 91
   000464         046800     PERFORM FAIL.                                                NC2374.2 231
   000465         046900 IDX-WRITE-GF-5.                                                  NC2374.2
   000466         047000     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000467         047100*                                                                 NC2374.2
   000468         047200 IDX-INIT-GF-6.                                                   NC2374.2
   000469         047300     MOVE "IDX-TEST-GF-6" TO PAR-NAME.                            NC2374.2 80
   000470         047400     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000471         047500     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000472         047600     SET IDX-3 TO 4.                                              NC2374.2 60
   000473         047700     SET IDX-1  IDX-2 TO IDX-3.                                   NC2374.2 51 55 60
   000474         047800     SET IDX-1  IDX-2  IDX-3 DOWN BY IDENT-7.                     NC2374.2 51 55 60 46
   000475         047900     MOVE 4 TO IDENT-1.                                           NC2374.2 40
   000476         048000     SET IDX-1  IDX-2  IDX-3 UP BY IDENT-1.                       NC2374.2 51 55 60 40
   000477         048100 IDX-TEST-GF-6.                                                   NC2374.2
   000478         048200     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) EQUAL TO "070307"           NC2374.2 61 51 55 60
   000479      1  048300         PERFORM PASS                                             NC2374.2 230
   000480      1  048400         GO TO IDX-WRITE-GF-6.                                    NC2374.2 489
   000481         048500     GO TO IDX-FAIL-GF-6.                                         NC2374.2 485
   000482         048600 IDX-DELETE-GF-6.                                                 NC2374.2
   000483         048700     PERFORM DE-LETE.                                             NC2374.2 232
   000484         048800     GO TO IDX-WRITE-GF-6.                                        NC2374.2 489
   000485         048900 IDX-FAIL-GF-6.                                                   NC2374.2
   000486         049000     MOVE ENTRY-3 (IDX-1, IDX-2, IDX-3) TO COMPUTED-A.            NC2374.2 61 51 55 60 91
   000487         049100     MOVE "070307" TO CORRECT-A.                                  NC2374.2 105
   000488         049200     PERFORM FAIL.                                                NC2374.2 231
   000489         049300 IDX-WRITE-GF-6.                                                  NC2374.2
   000490         049400     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000491         049500*                                                                 NC2374.2
   000492         049600 IDX-INIT-GF-7.                                                   NC2374.2
   000493         049700     MOVE "IDX-TEST-GF-7" TO PAR-NAME.                            NC2374.2 80
   000494         049800     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000495         049900     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000496         050000     MOVE 3 TO IDENT-1  IDENT-2  IDENT-4.                         NC2374.2 40 41 43
   000497         050100     SET IDX-1 TO IDENT-1.                                        NC2374.2 51 40
   000498         050200     SET IDX-2 TO IDENT-2.                                        NC2374.2 55 41
   000499         050300     SET IDX-3 TO IDENT-4.                                        NC2374.2 60 43
   000500         050400     SET IDX-1  IDX-2  IDX-3 UP BY IDENT-7.                       NC2374.2 51 55 60 46
   000501         050500 IDX-TEST-GF-7.                                                   NC2374.2
   000502         050600     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) EQUAL TO "040604"           NC2374.2 61 51 55 60
   000503      1  050700         PERFORM PASS                                             NC2374.2 230
   000504      1  050800         GO TO IDX-WRITE-GF-7.                                    NC2374.2 513
   000505         050900     GO TO IDX-FAIL-GF-7.                                         NC2374.2 509
   000506         051000 IDX-DELETE-GF-7.                                                 NC2374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     PERFORM DE-LETE.                                             NC2374.2 232
   000508         051200     GO TO IDX-WRITE-GF-7.                                        NC2374.2 513
   000509         051300 IDX-FAIL-GF-7.                                                   NC2374.2
   000510         051400     MOVE "040604" TO CORRECT-A.                                  NC2374.2 105
   000511         051500     MOVE ENTRY-3 (IDX-1, IDX-2, IDX-3) TO COMPUTED-A.            NC2374.2 61 51 55 60 91
   000512         051600     PERFORM FAIL.                                                NC2374.2 231
   000513         051700 IDX-WRITE-GF-7.                                                  NC2374.2
   000514         051800     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000515         051900*                                                                 NC2374.2
   000516         052000 IDX-INIT-GF-8.                                                   NC2374.2
   000517         052100     MOVE "IDX-TEST-GF-8" TO PAR-NAME.                            NC2374.2 80
   000518         052200     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000519         052300     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000520         052400     MOVE 9 TO IDENT-1.                                           NC2374.2 40
   000521         052500     SET IDX-1, IDX-2, IDX-3 TO IDENT-1.                          NC2374.2 51 55 60 40
   000522         052600     SET IDX-1, IDX-2, IDX-3 DOWN BY 5.                           NC2374.2 51 55 60
   000523         052700 IDX-TEST-GF-8.                                                   NC2374.2
   000524         052800     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) EQUAL TO "040604"           NC2374.2 61 51 55 60
   000525      1  052900         PERFORM PASS                                             NC2374.2 230
   000526      1  053000         GO TO IDX-WRITE-GF-8.                                    NC2374.2 535
   000527         053100     GO TO IDX-FAIL-GF-8.                                         NC2374.2 531
   000528         053200 IDX-DELETE-GF-8.                                                 NC2374.2
   000529         053300     PERFORM DE-LETE.                                             NC2374.2 232
   000530         053400     GO TO IDX-WRITE-GF-8.                                        NC2374.2 535
   000531         053500 IDX-FAIL-GF-8.                                                   NC2374.2
   000532         053600     MOVE "040604" TO CORRECT-A.                                  NC2374.2 105
   000533         053700     MOVE ENTRY-3 (IDX-1, IDX-2, IDX-3) TO COMPUTED-A.            NC2374.2 61 51 55 60 91
   000534         053800     PERFORM FAIL.                                                NC2374.2 231
   000535         053900 IDX-WRITE-GF-8.                                                  NC2374.2
   000536         054000     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000537         054100*                                                                 NC2374.2
   000538         054200 IDX-INIT-F2-9.                                                   NC2374.2
   000539         054300     MOVE "IDX-TEST-F2-9" TO PAR-NAME.                            NC2374.2 80
   000540         054400     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000541         054500     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000542         054600     SET IDX-1 TO 05.                                             NC2374.2 51
   000543         054700 IDX-TEST-F2-9.                                                   NC2374.2
   000544         054800     SEARCH ALL ENTRY-310-2 END                                   NC2374.2 54
   000545      1  054900         GO TO IDX-FAIL-F2-9                                      NC2374.2 553
   000546         055000     WHEN GRP-1 (IDX-1, IDX-2) EQUAL TO "05" AND                  NC2374.2 57 51 55
   000547         055100         SEC (IDX-1, IDX-2) EQUAL TO "07"                         NC2374.2 58 51 55
   000548      1  055200         PERFORM PASS                                             NC2374.2 230
   000549      1  055300         GO TO IDX-WRITE-F2-9.                                    NC2374.2 558
   000550         055400 IDX-DELETE-F2-9.                                                 NC2374.2
   000551         055500     PERFORM DE-LETE.                                             NC2374.2 232
   000552         055600     GO TO IDX-WRITE-F2-9.                                        NC2374.2 558
   000553         055700 IDX-FAIL-F2-9.                                                   NC2374.2
   000554         055800     MOVE ENTRY-2 (05, 03) TO COMPUTED-A                          NC2374.2 56 91
   000555         055900     MOVE "0507" TO CORRECT-A                                     NC2374.2 105
   000556         056000     MOVE "SUBSCRIPT USED FOR COMPUTED" TO RE-MARK                NC2374.2 85
   000557         056100     PERFORM FAIL.                                                NC2374.2 231
   000558         056200 IDX-WRITE-F2-9.                                                  NC2374.2
   000559         056300     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000560         056400*                                                                 NC2374.2
   000561         056500 IDX-INIT-F2-10.                                                  NC2374.2
   000562         056600     MOVE "IDX-TEST-F2-10" TO PAR-NAME.                           NC2374.2 80
   000563         056700     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000565         056900     SET     IDX-1  IDX-2 TO 9.                                   NC2374.2 51 55
   000566         057000 IDX-TEST-F2-10.                                                  NC2374.2
   000567         057100     SEARCH  ALL ENTRY-310-3 END                                  NC2374.2 59
   000568      1  057200             PERFORM PASS                                         NC2374.2 230
   000569      1  057300             GO TO   IDX-WRITE-F2-10                              NC2374.2 581
   000570         057400             WHEN    GRP-2 (IDX-1, IDX-2, IDX-3) EQUAL "09"       NC2374.2 62 51 55 60
   000571         057500                 AND SEC-1 (IDX-1, IDX-2, IDX-3) EQUAL "01"       NC2374.2 63 51 55 60
   000572         057600                 AND ELEM  (IDX-1, IDX-2, IDX-3) EQUAL "10"       NC2374.2 64 51 55 60
   000573      1  057700                     GO TO   IDX-FAIL-F2-10.                      NC2374.2 577
   000574         057800 IDX-DELETE-F2-10.                                                NC2374.2
   000575         057900     PERFORM DE-LETE.                                             NC2374.2 232
   000576         058000     GO TO IDX-WRITE-F2-10.                                       NC2374.2 581
   000577         058100 IDX-FAIL-F2-10.                                                  NC2374.2
   000578         058200     MOVE  "090110" TO COMPUTED-A                                 NC2374.2 91
   000579         058300     MOVE  "ENTRY SHOULD NOT BE FOUND" TO RE-MARK                 NC2374.2 85
   000580         058400     PERFORM FAIL.                                                NC2374.2 231
   000581         058500 IDX-WRITE-F2-10.                                                 NC2374.2
   000582         058600     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000583         058700*                                                                 NC2374.2
   000584         058800 IDX-INIT-F2-11.                                                  NC2374.2
   000585         058900     MOVE "IDX-TEST-F2-11" TO PAR-NAME.                           NC2374.2 80
   000586         059000     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000587         059100     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000588         059200     SET IDX-1 TO 09.                                             NC2374.2 51
   000589         059300 IDX-TEST-F2-11.                                                  NC2374.2
   000590         059400     SEARCH ALL ENTRY-310                                      ENDNC2374.2 50
   000591      1  059500         GO TO IDX-FAIL-F2-11                                     NC2374.2 598
   000592         059600     WHEN GRP (IDX-1) EQUAL TO "07"                               NC2374.2 53 51
   000593      1  059700         PERFORM PASS                                             NC2374.2 230
   000594      1  059800         GO TO IDX-WRITE-F2-11.                                   NC2374.2 603
   000595         059900 IDX-DELETE-F2-11.                                                NC2374.2
   000596         060000     PERFORM DE-LETE.                                             NC2374.2 232
   000597         060100     GO TO IDX-WRITE-F2-11.                                       NC2374.2 603
   000598         060200 IDX-FAIL-F2-11.                                                  NC2374.2
   000599         060300     MOVE ENTRY-1 (07) TO COMPUTED-A                              NC2374.2 52 91
   000600         060400     MOVE "07" TO CORRECT-A                                       NC2374.2 105
   000601         060500     PERFORM FAIL                                                 NC2374.2 231
   000602         060600     MOVE "SUBSCRIPT USED FOR COMPUTED" TO RE-MARK.               NC2374.2 85
   000603         060700 IDX-WRITE-F2-11.                                                 NC2374.2
   000604         060800     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000605         060900*                                                                 NC2374.2
   000606         061000 IDX-INIT-F2-12.                                                  NC2374.2
   000607         061100     MOVE "IDX-TEST-F2-12" TO PAR-NAME.                           NC2374.2 80
   000608         061200     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000609         061300     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000610         061400     MOVE 04 TO IDENT-1.                                          NC2374.2 40
   000611         061500     SET IDX-1, IDX-2, IDX-3 TO IDENT-1.                          NC2374.2 51 55 60 40
   000612         061600     SET IDX-1 UP BY 1.                                           NC2374.2 51
   000613         061700 IDX-TEST-F2-12.                                                  NC2374.2
   000614         061800     SEARCH ALL ENTRY-310-3 AT END                                NC2374.2 59
   000615      1  061900         GO TO IDX-FAIL-F2-12                                     NC2374.2 624
   000616         062000     WHEN GRP-2 (IDX-1, IDX-2, IDX-3) EQUAL TO "05" AND           NC2374.2 62 51 55 60
   000617         062100         SEC-1 (IDX-1, IDX-2, IDX-3) EQUAL TO "06" AND            NC2374.2 63 51 55 60
   000618         062200             ELEM (IDX-1, IDX-2, IDX-3) EQUAL TO "03"             NC2374.2 64 51 55 60
   000619      1  062300         PERFORM PASS                                             NC2374.2 230
   000620      1  062400         GO TO IDX-WRITE-F2-12.                                   NC2374.2 629
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621         062500 IDX-DELETE-F2-12.                                                NC2374.2
   000622         062600     PERFORM DE-LETE.                                             NC2374.2 232
   000623         062700     GO TO IDX-WRITE-F2-12.                                       NC2374.2 629
   000624         062800 IDX-FAIL-F2-12.                                                  NC2374.2
   000625         062900     MOVE ENTRY-3 (05, 04, 03) TO COMPUTED-A                      NC2374.2 61 91
   000626         063000     MOVE "SUBSCRIPT USED FOR COMPUTED" TO RE-MARK                NC2374.2 85
   000627         063100     MOVE "050603" TO CORRECT-A                                   NC2374.2 105
   000628         063200     PERFORM FAIL.                                                NC2374.2 231
   000629         063300 IDX-WRITE-F2-12.                                                 NC2374.2
   000630         063400     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000631         063500*                                                                 NC2374.2
   000632         063600 IDX-INIT-F2-13.                                                  NC2374.2
   000633         063700     MOVE "IDX-TEST-F2-13" TO PAR-NAME.                           NC2374.2 80
   000634         063800     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2374.2 136
   000635         063900     MOVE "SET AND SEARCH-ALL" TO FEATURE.                        NC2374.2 76
   000636         064000     SET IDX-1 TO 9.                                              NC2374.2 51
   000637         064100 IDX-TEST-F2-13.                                                  NC2374.2
   000638         064200     SEARCH ALL ENTRY-310-2 AT END                                NC2374.2 54
   000639      1  064300         GO TO IDX-FAIL-F2-13                                     NC2374.2 647
   000640         064400     WHEN GRP-1 (IDX-1, IDX-2) EQUAL TO "09" AND SEC              NC2374.2 57 51 55 58
   000641         064500         (IDX-1, IDX-2) EQUAL TO "01"                             NC2374.2 51 55
   000642      1  064600         PERFORM PASS                                             NC2374.2 230
   000643      1  064700         GO TO IDX-WRITE-F2-13.                                   NC2374.2 652
   000644         064800 IDX-DELETE-F2-13.                                                NC2374.2
   000645         064900     PERFORM DE-LETE.                                             NC2374.2 232
   000646         065000     GO TO IDX-WRITE-F2-13.                                       NC2374.2 652
   000647         065100 IDX-FAIL-F2-13.                                                  NC2374.2
   000648         065200     MOVE ENTRY-2 (09, 09) TO COMPUTED-A                          NC2374.2 56 91
   000649         065300     MOVE "SUBSCRIPT USED FOR COMPUTED" TO RE-MARK                NC2374.2 85
   000650         065400     MOVE "0901" TO CORRECT-A                                     NC2374.2 105
   000651         065500     PERFORM FAIL.                                                NC2374.2 231
   000652         065600 IDX-WRITE-F2-13.                                                 NC2374.2
   000653         065700     PERFORM PRINT-DETAIL.                                        NC2374.2 234
   000654         065800*                                                                 NC2374.2
   000655         065900 CCVS-EXIT SECTION.                                               NC2374.2
   000656         066000 CCVS-999999.                                                     NC2374.2
   000657         066100     GO TO CLOSE-FILES.                                           NC2374.2 223
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      136   ANSI-REFERENCE . . . . . . . .  308 315 324 M362 M381 M403 M425 M447 M470 M494 M518 M540 M563 M586 M608 M634
      115   CCVS-C-1 . . . . . . . . . . .  252 294
      120   CCVS-C-2 . . . . . . . . . . .  253 295
      170   CCVS-E-1 . . . . . . . . . . .  258
      175   CCVS-E-2 . . . . . . . . . . .  267 274 281 286
      178   CCVS-E-2-2 . . . . . . . . . .  M266
      183   CCVS-E-3 . . . . . . . . . . .  287
      192   CCVS-E-4 . . . . . . . . . . .  266
      193   CCVS-E-4-1 . . . . . . . . . .  M264
      195   CCVS-E-4-2 . . . . . . . . . .  M265
      137   CCVS-H-1 . . . . . . . . . . .  247
      142   CCVS-H-2A. . . . . . . . . . .  248
      151   CCVS-H-2B. . . . . . . . . . .  249
      163   CCVS-H-3 . . . . . . . . . . .  250
      213   CCVS-PGM-ID. . . . . . . . . .  219 219
       97   CM-18V0
       91   COMPUTED-A . . . . . . . . . .  92 94 95 96 97 320 323 M396 M417 M441 M463 M486 M511 M533 M554 M578 M599 M625
                                            M648
       92   COMPUTED-N
       90   COMPUTED-X . . . . . . . . . .  M242 306
       94   COMPUTED-0V18
       96   COMPUTED-14V4
       98   COMPUTED-18V0
       95   COMPUTED-4V14
      114   COR-ANSI-REFERENCE . . . . . .  M315 M317
      105   CORRECT-A. . . . . . . . . . .  106 107 108 109 110 321 323 M395 M418 M440 M462 M487 M510 M532 M555 M600 M627
                                            M650
      106   CORRECT-N
      104   CORRECT-X. . . . . . . . . . .  M243 307
      107   CORRECT-0V18
      109   CORRECT-14V4
      111   CORRECT-18V0
      108   CORRECT-4V14
      110   CR-18V0
       69   CT . . . . . . . . . . . . . .  70 347 M348 M350
      128   DELETE-COUNTER . . . . . . . .  M232 261 277 279
       83   DOTVALUE . . . . . . . . . . .  M237
      134   DUMMY-HOLD . . . . . . . . . .  M291 297
       38   DUMMY-RECORD . . . . . . . . .  M247 M248 M249 M250 M252 M253 M254 M256 M258 M267 M274 M281 M286 M287 291 M292
                                            293 M294 M295 M296 M297 301 M302 M310 M325
       64   ELEM . . . . . . . . . . . . .  60 M346 572 618
      181   ENDER-DESC . . . . . . . . . .  M269 M280 M285
       65   ENTRIES-X
       52   ENTRY-1. . . . . . . . . . . .  409 417 454 463 599
       56   ENTRY-2. . . . . . . . . . . .  432 441 554 648
       61   ENTRY-3. . . . . . . . . . . .  365 387 396 478 486 502 511 524 533 625
       50   ENTRY-310. . . . . . . . . . .  590
       54   ENTRY-310-2. . . . . . . . . .  544 638
       59   ENTRY-310-3. . . . . . . . . .  567 614
      129   ERROR-COUNTER. . . . . . . . .  M231 260 270 273
      133   ERROR-HOLD . . . . . . . . . .  M260 M261 M261 M262 265
      179   ERROR-TOTAL. . . . . . . . . .  M271 M273 M278 M279 M283 M284
       76   FEATURE. . . . . . . . . . . .  M334 M363 M382 M404 M426 M448 M471 M495 M519 M541 M564 M587 M609 M635
       53   GRP. . . . . . . . . . . . . .  50 M343 592
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    16
0 Defined   Cross-reference of data names   References

0      57   GRP-1. . . . . . . . . . . . .  54 M343 546 640
       62   GRP-2. . . . . . . . . . . . .  59 M344 570 616
      207   HYPHEN-LINE. . . . . . . . . .  254 256 296
      173   ID-AGAIN . . . . . . . . . . .  M219
       40   IDENT-1. . . . . . . . . . . .  M383 384 M405 407 M427 428 M450 452 M475 476 M496 497 M520 521 M610 611
       41   IDENT-2. . . . . . . . . . . .  M496 498
       42   IDENT-3
       43   IDENT-4. . . . . . . . . . . .  M496 499
       44   IDENT-5
       45   IDENT-6. . . . . . . . . . . .  385 430 451
       46   IDENT-7. . . . . . . . . . . .  406 474 500
       47   IDENT-8
       48   IDENT-9. . . . . . . . . . . .  429
       51   IDX-1. . . . . . . . . . . . .  M335 343 343 344 345 345 346 M354 M384 M385 387 396 M406 M407 409 417 M428 432
                                            441 M451 M452 454 463 M473 M474 M476 478 486 M497 M500 502 511 M521 M522 524
                                            533 M542 546 547 M565 570 571 572 M588 592 M611 M612 616 617 618 M636 640 641
       55   IDX-2. . . . . . . . . . . . .  M335 343 344 345 345 346 M355 M384 387 396 M428 M429 M430 432 441 M473 M474 M476
                                            478 486 M498 M500 502 511 M521 M522 524 533 546 547 M565 570 571 572 M611 616
                                            617 618 640 641
       60   IDX-3. . . . . . . . . . . . .  M335 344 345 346 M356 M384 M385 387 396 M472 473 M474 M476 478 486 M499 M500
                                            502 511 M521 M522 524 533 570 571 572 M611 616 617 618
      206   INF-ANSI-REFERENCE . . . . . .  M308 M311 M324 M326
      201   INFO-TEXT. . . . . . . . . . .  M309
      130   INSPECT-COUNTER. . . . . . . .  M229 260 282 284
       66   ONE-99 . . . . . . . . . . . .  M336 337 343
       78   P-OR-F . . . . . . . . . . . .  M229 M230 M231 M232 239 M242
       80   PAR-NAME . . . . . . . . . . .  M244 M361 M380 M402 M424 M449 M469 M493 M517 M539 M562 M585 M607 M633
       82   PARDOT-X . . . . . . . . . . .  M236
      131   PASS-COUNTER . . . . . . . . .  M230 262 264
       36   PRINT-FILE . . . . . . . . . .  32 218 224
       37   PRINT-REC. . . . . . . . . . .  M238 M314 M316
       85   RE-MARK. . . . . . . . . . . .  M233 M245 M367 M374 M556 M579 M602 M626 M649
      127   REC-CT . . . . . . . . . . . .  235 237 244
      126   REC-SKL-SUB
      135   RECORD-COUNT . . . . . . . . .  M289 290 M298
       58   SEC. . . . . . . . . . . . . .  55 M345 547 640
       63   SEC-1. . . . . . . . . . . . .  60 M345 571 617
       70   SU
       71   S1 . . . . . . . . . . . . . .  353 M353 354
       72   S2 . . . . . . . . . . . . . .  352 M352 355
       73   S3 . . . . . . . . . . . . . .  351 M351 356
       49   TABLE-TH310
       86   TEST-COMPUTED. . . . . . . . .  314
      101   TEST-CORRECT . . . . . . . . .  316
      154   TEST-ID. . . . . . . . . . . .  M219
       74   TEST-RESULTS . . . . . . . . .  M220 238
       68   THREE-99 . . . . . . . . . . .  M338 339 346
      132   TOTAL-ERROR
       67   TWO-99 . . . . . . . . . . . .  M337 338 345
      203   XXCOMPUTED . . . . . . . . . .  M323
      205   XXCORRECT. . . . . . . . . . .  M323
      198   XXINFO . . . . . . . . . . . .  310 325
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    17
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

      319   BAIL-OUT . . . . . . . . . . .  P241
      327   BAIL-OUT-EX. . . . . . . . . .  E241 G321
      322   BAIL-OUT-WRITE . . . . . . . .  G320
      303   BLANK-LINE-PRINT
      357   BUILD-EXIT . . . . . . . . . .  E336
      342   BUILD-TABLE. . . . . . . . . .  P336
      333   BUILD-3DEM-TABLE
      655   CCVS-EXIT
      656   CCVS-999999
      216   CCVS1
      328   CCVS1-EXIT . . . . . . . . . .  G222
      223   CLOSE-FILES. . . . . . . . . .  G657
      251   COLUMN-NAMES-ROUTINE . . . . .  E221
      232   DE-LETE. . . . . . . . . . . .  P371 P392 P414 P437 P459 P483 P507 P529 P551 P575 P596 P622 P645
      255   END-ROUTINE. . . . . . . . . .  P224
      259   END-ROUTINE-1
      268   END-ROUTINE-12
      276   END-ROUTINE-13 . . . . . . . .  E224
      257   END-RTN-EXIT
      231   FAIL . . . . . . . . . . . . .  P375 P397 P419 P442 P464 P488 P512 P534 P557 P580 P601 P628 P651
      305   FAIL-ROUTINE . . . . . . . . .  P240
      318   FAIL-ROUTINE-EX. . . . . . . .  E240 G312
      313   FAIL-ROUTINE-WRITE . . . . . .  G306 G307
      246   HEAD-ROUTINE . . . . . . . . .  P221
      574   IDX-DELETE-F2-10
      595   IDX-DELETE-F2-11
      621   IDX-DELETE-F2-12
      644   IDX-DELETE-F2-13
      550   IDX-DELETE-F2-9
      370   IDX-DELETE-GF-1
      391   IDX-DELETE-GF-2
      413   IDX-DELETE-GF-3
      436   IDX-DELETE-GF-4
      458   IDX-DELETE-GF-5
      482   IDX-DELETE-GF-6
      506   IDX-DELETE-GF-7
      528   IDX-DELETE-GF-8
      577   IDX-FAIL-F2-10 . . . . . . . .  G573
      598   IDX-FAIL-F2-11 . . . . . . . .  G591
      624   IDX-FAIL-F2-12 . . . . . . . .  G615
      647   IDX-FAIL-F2-13 . . . . . . . .  G639
      553   IDX-FAIL-F2-9. . . . . . . . .  G545
      373   IDX-FAIL-GF-1. . . . . . . . .  G369
      394   IDX-FAIL-GF-2. . . . . . . . .  G390
      416   IDX-FAIL-GF-3. . . . . . . . .  G412
      439   IDX-FAIL-GF-4. . . . . . . . .  G435
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    18
0 Defined   Cross-reference of procedures   References

0     461   IDX-FAIL-GF-5. . . . . . . . .  G457
      485   IDX-FAIL-GF-6. . . . . . . . .  G481
      509   IDX-FAIL-GF-7. . . . . . . . .  G505
      531   IDX-FAIL-GF-8. . . . . . . . .  G527
      561   IDX-INIT-F2-10
      584   IDX-INIT-F2-11
      606   IDX-INIT-F2-12
      632   IDX-INIT-F2-13
      538   IDX-INIT-F2-9
      360   IDX-INIT-GF-1. . . . . . . . .  G340
      379   IDX-INIT-GF-2
      401   IDX-INIT-GF-3
      423   IDX-INIT-GF-4
      446   IDX-INIT-GF-5
      468   IDX-INIT-GF-6
      492   IDX-INIT-GF-7
      516   IDX-INIT-GF-8
      566   IDX-TEST-F2-10
      589   IDX-TEST-F2-11
      613   IDX-TEST-F2-12
      637   IDX-TEST-F2-13
      543   IDX-TEST-F2-9
      364   IDX-TEST-GF-1
      386   IDX-TEST-GF-2
      408   IDX-TEST-GF-3
      431   IDX-TEST-GF-4
      453   IDX-TEST-GF-5
      477   IDX-TEST-GF-6
      501   IDX-TEST-GF-7
      523   IDX-TEST-GF-8
      581   IDX-WRITE-F2-10. . . . . . . .  G569 G576
      603   IDX-WRITE-F2-11. . . . . . . .  G594 G597
      629   IDX-WRITE-F2-12. . . . . . . .  G620 G623
      652   IDX-WRITE-F2-13. . . . . . . .  G643 G646
      558   IDX-WRITE-F2-9 . . . . . . . .  G549 G552
      376   IDX-WRITE-GF-1 . . . . . . . .  G368 G372
      398   IDX-WRITE-GF-2 . . . . . . . .  G389 G393
      420   IDX-WRITE-GF-3 . . . . . . . .  G411 G415
      443   IDX-WRITE-GF-4 . . . . . . . .  G434 G438
      465   IDX-WRITE-GF-5 . . . . . . . .  G456 G460
      489   IDX-WRITE-GF-6 . . . . . . . .  G480 G484
      513   IDX-WRITE-GF-7 . . . . . . . .  G504 G508
      535   IDX-WRITE-GF-8 . . . . . . . .  G526 G530
      229   INSPT
      217   OPEN-FILES
      230   PASS . . . . . . . . . . . . .  P366 P388 P410 P433 P455 P479 P503 P525 P548 P568 P593 P619 P642
      234   PRINT-DETAIL . . . . . . . . .  P377 P399 P421 P444 P466 P490 P514 P536 P559 P582 P604 P630 P653
      330   SECT-NC237A-001
      227   TERMINATE-CALL
      225   TERMINATE-CCVS
      331   TH-10-001
      288   WRITE-LINE . . . . . . . . . .  P238 P239 P247 P248 P249 P250 P252 P253 P254 P256 P258 P267 P275 P281 P286 P287
                                            P310 P314 P316 P325
      300   WRT-LN . . . . . . . . . . . .  P294 P295 P296 P299 P304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    19
0 Defined   Cross-reference of programs     References

        3   NC237A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC237A    Date 06/04/2022  Time 11:56:37   Page    20
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    333  IGYPS2015-I   The paragraph or section prior to paragraph or section "BUILD-3DEM-TABLE" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC237A:
 *    Source records = 657
 *    Data Division statements = 94
 *    Procedure Division statements = 354
 *    Generated COBOL statements = 0
 *    Program complexity factor = 364
0End of compilation 1,  program NC237A,  highest severity 0.
0Return code 0
