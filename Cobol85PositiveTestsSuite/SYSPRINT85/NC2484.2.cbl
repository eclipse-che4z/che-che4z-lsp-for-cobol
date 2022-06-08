1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:18   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:18   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2484.2
   000002         000200 PROGRAM-ID.                                                      NC2484.2
   000003         000300     NC248A.                                                      NC2484.2
   000004         000500*                                                              *  NC2484.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2484.2
   000006         000700*                                                              *  NC2484.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2484.2
   000008         000900*                                                              *  NC2484.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2484.2
   000010         001100*                                                              *  NC2484.2
   000011         001300*                                                              *  NC2484.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2484.2
   000013         001500*                                                              *  NC2484.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2484.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2484.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2484.2
   000017         001900*                                                              *  NC2484.2
   000018         002100*                                                                 NC2484.2
   000019         002200*    PROGRAM NC248A TESTS FORMATS 1 AND 2 OF THE "SET"         *  NC2484.2
   000020         002300*    STATEMENT USING QUALIFICATION WITH INDEXED AND            *  NC2484.2
   000021         002400*    RELATIVE-INDEXED IDENTIFIERS.                             *  NC2484.2
   000022         002500*    FORMAT 4 OF THE "SET" STATEMENT IS ALSO TESTED.           *  NC2484.2
   000023         002600*                                                              *  NC2484.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2484.2
   000025         002900 CONFIGURATION SECTION.                                           NC2484.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2484.2
   000027         003100     XXXXX082.                                                    NC2484.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2484.2
   000029         003300     XXXXX083.                                                    NC2484.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2484.2
   000031         003500 FILE-CONTROL.                                                    NC2484.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2484.2 36
   000033         003700     XXXXX055.                                                    NC2484.2
   000034         003800 DATA DIVISION.                                                   NC2484.2
   000035         003900 FILE SECTION.                                                    NC2484.2
   000036         004000 FD  PRINT-FILE.                                                  NC2484.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2484.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2484.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2484.2
   000040         004400 01  TEST-7-DATA.                                                 NC2484.2
   000041         004500   03  TEST-7-1                  PIC X.                           NC2484.2
   000042         004600               88 TEST-7-1-TRUE  VALUE "%".                       NC2484.2
   000043         004700 01  TEST-8-DATA.                                                 NC2484.2
   000044         004800   03  TEST-8-1                  PIC X.                           NC2484.2
   000045         004900               88 TEST-8-1-1-TRUE  VALUE "J".                     NC2484.2
   000046         005000               88 TEST-8-1-2-TRUE  VALUE "A".                     NC2484.2
   000047         005100               88 TEST-8-1-3-TRUE  VALUE "N".                     NC2484.2
   000048         005200 01  TEST-9-DATA.                                                 NC2484.2
   000049         005300   03  TEST-9-1                  PIC X.                           NC2484.2
   000050         005400               88 TEST-9-1-1-TRUE  VALUE "6".                     NC2484.2
   000051         005500               88 TEST-9-1-2-TRUE  VALUE "2".                     NC2484.2
   000052         005600   03  TEST-9-2                  PIC X.                           NC2484.2
   000053         005700               88 TEST-9-2-1-TRUE  VALUE "B".                     NC2484.2
   000054         005800               88 TEST-9-2-2-TRUE  VALUE "C".                     NC2484.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900   03  TEST-9-3                  PIC X.                           NC2484.2
   000056         006000               88 TEST-9-3-1-TRUE VALUE "*".                      NC2484.2
   000057         006100               88 TEST-9-3-2-TRUE VALUE "+".                      NC2484.2
   000058         006200                                                                  NC2484.2
   000059         006300 01  TABLE1.                                                      NC2484.2
   000060         006400     02  TABLE1-REC              PICTURE 99                       NC2484.2
   000061         006500                                 OCCURS 100 TIMES                 NC2484.2
   000062         006600                                 INDEXED BY INDEX1.               NC2484.2
   000063         006700 01  TABLE2.                                                      NC2484.2
   000064         006800     02  TABLE2-REC              PICTURE 99                       NC2484.2
   000065         006900                                 OCCURS 12 TIMES                  NC2484.2
   000066         007000                                 INDEXED BY INDEX2.               NC2484.2
   000067         007100 01  INDEX-ID                    PIC 999         VALUE ZEROS.     NC2484.2 IMP
   000068         007200 01  TEST-RESULTS.                                                NC2484.2
   000069         007300     02 FILLER                   PIC X      VALUE SPACE.          NC2484.2 IMP
   000070         007400     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2484.2 IMP
   000071         007500     02 FILLER                   PIC X      VALUE SPACE.          NC2484.2 IMP
   000072         007600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2484.2 IMP
   000073         007700     02 FILLER                   PIC X      VALUE SPACE.          NC2484.2 IMP
   000074         007800     02  PAR-NAME.                                                NC2484.2
   000075         007900       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2484.2 IMP
   000076         008000       03  PARDOT-X              PIC X      VALUE SPACE.          NC2484.2 IMP
   000077         008100       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2484.2 IMP
   000078         008200     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2484.2 IMP
   000079         008300     02 RE-MARK                  PIC X(61).                       NC2484.2
   000080         008400 01  TEST-COMPUTED.                                               NC2484.2
   000081         008500     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2484.2 IMP
   000082         008600     02 FILLER                   PIC X(17)  VALUE                 NC2484.2
   000083         008700            "       COMPUTED=".                                   NC2484.2
   000084         008800     02 COMPUTED-X.                                               NC2484.2
   000085         008900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2484.2 IMP
   000086         009000     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2484.2 85
   000087         009100                                 PIC -9(9).9(9).                  NC2484.2
   000088         009200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2484.2 85
   000089         009300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2484.2 85
   000090         009400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2484.2 85
   000091         009500     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2484.2 85
   000092         009600         04 COMPUTED-18V0                    PIC -9(18).          NC2484.2
   000093         009700         04 FILLER                           PIC X.               NC2484.2
   000094         009800     03 FILLER PIC X(50) VALUE SPACE.                             NC2484.2 IMP
   000095         009900 01  TEST-CORRECT.                                                NC2484.2
   000096         010000     02 FILLER PIC X(30) VALUE SPACE.                             NC2484.2 IMP
   000097         010100     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2484.2
   000098         010200     02 CORRECT-X.                                                NC2484.2
   000099         010300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2484.2 IMP
   000100         010400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2484.2 99
   000101         010500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2484.2 99
   000102         010600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2484.2 99
   000103         010700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2484.2 99
   000104         010800     03      CR-18V0 REDEFINES CORRECT-A.                         NC2484.2 99
   000105         010900         04 CORRECT-18V0                     PIC -9(18).          NC2484.2
   000106         011000         04 FILLER                           PIC X.               NC2484.2
   000107         011100     03 FILLER PIC X(2) VALUE SPACE.                              NC2484.2 IMP
   000108         011200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2484.2 IMP
   000109         011300 01  CCVS-C-1.                                                    NC2484.2
   000110         011400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2484.2
   000111         011500-    "SS  PARAGRAPH-NAME                                          NC2484.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600-    "       REMARKS".                                            NC2484.2
   000113         011700     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2484.2 IMP
   000114         011800 01  CCVS-C-2.                                                    NC2484.2
   000115         011900     02 FILLER                     PIC X        VALUE SPACE.      NC2484.2 IMP
   000116         012000     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2484.2
   000117         012100     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2484.2 IMP
   000118         012200     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2484.2
   000119         012300     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2484.2 IMP
   000120         012400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2484.2 IMP
   000121         012500 01  REC-CT                        PIC 99       VALUE ZERO.       NC2484.2 IMP
   000122         012600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2484.2 IMP
   000123         012700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2484.2 IMP
   000124         012800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2484.2 IMP
   000125         012900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2484.2 IMP
   000126         013000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2484.2 IMP
   000127         013100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2484.2 IMP
   000128         013200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2484.2 IMP
   000129         013300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2484.2 IMP
   000130         013400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2484.2 IMP
   000131         013500 01  CCVS-H-1.                                                    NC2484.2
   000132         013600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2484.2 IMP
   000133         013700     02  FILLER                    PIC X(42)    VALUE             NC2484.2
   000134         013800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2484.2
   000135         013900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2484.2 IMP
   000136         014000 01  CCVS-H-2A.                                                   NC2484.2
   000137         014100   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2484.2 IMP
   000138         014200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2484.2
   000139         014300   02  FILLER                        PIC XXXX   VALUE             NC2484.2
   000140         014400     "4.2 ".                                                      NC2484.2
   000141         014500   02  FILLER                        PIC X(28)  VALUE             NC2484.2
   000142         014600            " COPY - NOT FOR DISTRIBUTION".                       NC2484.2
   000143         014700   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2484.2 IMP
   000144         014800                                                                  NC2484.2
   000145         014900 01  CCVS-H-2B.                                                   NC2484.2
   000146         015000   02  FILLER                        PIC X(15)  VALUE             NC2484.2
   000147         015100            "TEST RESULT OF ".                                    NC2484.2
   000148         015200   02  TEST-ID                       PIC X(9).                    NC2484.2
   000149         015300   02  FILLER                        PIC X(4)   VALUE             NC2484.2
   000150         015400            " IN ".                                               NC2484.2
   000151         015500   02  FILLER                        PIC X(12)  VALUE             NC2484.2
   000152         015600     " HIGH       ".                                              NC2484.2
   000153         015700   02  FILLER                        PIC X(22)  VALUE             NC2484.2
   000154         015800            " LEVEL VALIDATION FOR ".                             NC2484.2
   000155         015900   02  FILLER                        PIC X(58)  VALUE             NC2484.2
   000156         016000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2484.2
   000157         016100 01  CCVS-H-3.                                                    NC2484.2
   000158         016200     02  FILLER                      PIC X(34)  VALUE             NC2484.2
   000159         016300            " FOR OFFICIAL USE ONLY    ".                         NC2484.2
   000160         016400     02  FILLER                      PIC X(58)  VALUE             NC2484.2
   000161         016500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2484.2
   000162         016600     02  FILLER                      PIC X(28)  VALUE             NC2484.2
   000163         016700            "  COPYRIGHT   1985 ".                                NC2484.2
   000164         016800 01  CCVS-E-1.                                                    NC2484.2
   000165         016900     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2484.2 IMP
   000166         017000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2484.2
   000167         017100     02 ID-AGAIN                     PIC X(9).                    NC2484.2
   000168         017200     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2484.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  CCVS-E-2.                                                    NC2484.2
   000170         017400     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2484.2 IMP
   000171         017500     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2484.2 IMP
   000172         017600     02 CCVS-E-2-2.                                               NC2484.2
   000173         017700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2484.2 IMP
   000174         017800         03 FILLER                   PIC X      VALUE SPACE.      NC2484.2 IMP
   000175         017900         03 ENDER-DESC               PIC X(44)  VALUE             NC2484.2
   000176         018000            "ERRORS ENCOUNTERED".                                 NC2484.2
   000177         018100 01  CCVS-E-3.                                                    NC2484.2
   000178         018200     02  FILLER                      PIC X(22)  VALUE             NC2484.2
   000179         018300            " FOR OFFICIAL USE ONLY".                             NC2484.2
   000180         018400     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2484.2 IMP
   000181         018500     02  FILLER                      PIC X(58)  VALUE             NC2484.2
   000182         018600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2484.2
   000183         018700     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2484.2 IMP
   000184         018800     02 FILLER                       PIC X(15)  VALUE             NC2484.2
   000185         018900             " COPYRIGHT 1985".                                   NC2484.2
   000186         019000 01  CCVS-E-4.                                                    NC2484.2
   000187         019100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2484.2 IMP
   000188         019200     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2484.2
   000189         019300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2484.2 IMP
   000190         019400     02 FILLER                       PIC X(40)  VALUE             NC2484.2
   000191         019500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2484.2
   000192         019600 01  XXINFO.                                                      NC2484.2
   000193         019700     02 FILLER                       PIC X(19)  VALUE             NC2484.2
   000194         019800            "*** INFORMATION ***".                                NC2484.2
   000195         019900     02 INFO-TEXT.                                                NC2484.2
   000196         020000       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2484.2 IMP
   000197         020100       04 XXCOMPUTED                 PIC X(20).                   NC2484.2
   000198         020200       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2484.2 IMP
   000199         020300       04 XXCORRECT                  PIC X(20).                   NC2484.2
   000200         020400     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2484.2
   000201         020500 01  HYPHEN-LINE.                                                 NC2484.2
   000202         020600     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2484.2 IMP
   000203         020700     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2484.2
   000204         020800-    "*****************************************".                 NC2484.2
   000205         020900     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2484.2
   000206         021000-    "******************************".                            NC2484.2
   000207         021100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2484.2
   000208         021200     "NC248A".                                                    NC2484.2
   000209         021300 PROCEDURE DIVISION.                                              NC2484.2
   000210         021400 CCVS1 SECTION.                                                   NC2484.2
   000211         021500 OPEN-FILES.                                                      NC2484.2
   000212         021600     OPEN     OUTPUT PRINT-FILE.                                  NC2484.2 36
   000213         021700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2484.2 207 148 207 167
   000214         021800     MOVE    SPACE TO TEST-RESULTS.                               NC2484.2 IMP 68
   000215         021900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2484.2 240 245
   000216         022000     GO TO CCVS1-EXIT.                                            NC2484.2 322
   000217         022100 CLOSE-FILES.                                                     NC2484.2
   000218         022200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2484.2 249 270 36
   000219         022300 TERMINATE-CCVS.                                                  NC2484.2
   000220         022400     EXIT PROGRAM.                                                NC2484.2
   000221         022500 TERMINATE-CALL.                                                  NC2484.2
   000222         022600     STOP     RUN.                                                NC2484.2
   000223         022700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2484.2 72 124
   000224         022800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2484.2 72 125
   000225         022900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2484.2 72 123
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2484.2 72 122
   000227         023100     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2484.2 79
   000228         023200 PRINT-DETAIL.                                                    NC2484.2
   000229         023300     IF REC-CT NOT EQUAL TO ZERO                                  NC2484.2 121 IMP
   000230      1  023400             MOVE "." TO PARDOT-X                                 NC2484.2 76
   000231      1  023500             MOVE REC-CT TO DOTVALUE.                             NC2484.2 121 77
   000232         023600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2484.2 68 37 282
   000233         023700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2484.2 72 282
   000234      1  023800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2484.2 299 312
   000235      1  023900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2484.2 313 321
   000236         024000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2484.2 IMP 72 IMP 84
   000237         024100     MOVE SPACE TO CORRECT-X.                                     NC2484.2 IMP 98
   000238         024200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2484.2 121 IMP IMP 74
   000239         024300     MOVE     SPACE TO RE-MARK.                                   NC2484.2 IMP 79
   000240         024400 HEAD-ROUTINE.                                                    NC2484.2
   000241         024500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2484.2 131 38 282
   000242         024600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2484.2 136 38 282
   000243         024700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2484.2 145 38 282
   000244         024800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2484.2 157 38 282
   000245         024900 COLUMN-NAMES-ROUTINE.                                            NC2484.2
   000246         025000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2484.2 109 38 282
   000247         025100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2484.2 114 38 282
   000248         025200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2484.2 201 38 282
   000249         025300 END-ROUTINE.                                                     NC2484.2
   000250         025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2484.2 201 38 282
   000251         025500 END-RTN-EXIT.                                                    NC2484.2
   000252         025600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2484.2 164 38 282
   000253         025700 END-ROUTINE-1.                                                   NC2484.2
   000254         025800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2484.2 123 127 124
   000255         025900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2484.2 127 122 127
   000256         026000      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2484.2 125 127
   000257         026100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2484.2
   000258         026200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2484.2 125 187
   000259         026300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2484.2 127 189
   000260         026400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2484.2 186 172
   000261         026500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2484.2 169 38 282
   000262         026600  END-ROUTINE-12.                                                 NC2484.2
   000263         026700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2484.2 175
   000264         026800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2484.2 123 IMP
   000265      1  026900         MOVE "NO " TO ERROR-TOTAL                                NC2484.2 173
   000266         027000         ELSE                                                     NC2484.2
   000267      1  027100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2484.2 123 173
   000268         027200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2484.2 169 38
   000269         027300     PERFORM WRITE-LINE.                                          NC2484.2 282
   000270         027400 END-ROUTINE-13.                                                  NC2484.2
   000271         027500     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2484.2 122 IMP
   000272      1  027600         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2484.2 173
   000273      1  027700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2484.2 122 173
   000274         027800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2484.2 175
   000275         027900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2484.2 169 38 282
   000276         028000      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2484.2 124 IMP
   000277      1  028100          MOVE "NO " TO ERROR-TOTAL                               NC2484.2 173
   000278      1  028200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2484.2 124 173
   000279         028300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2484.2 175
   000280         028400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2484.2 169 38 282
   000281         028500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2484.2 177 38 282
   000282         028600 WRITE-LINE.                                                      NC2484.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     ADD 1 TO RECORD-COUNT.                                       NC2484.2 129
   000284         028800     IF RECORD-COUNT GREATER 50                                   NC2484.2 129
   000285      1  028900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2484.2 38 128
   000286      1  029000         MOVE SPACE TO DUMMY-RECORD                               NC2484.2 IMP 38
   000287      1  029100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2484.2 38
   000288      1  029200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2484.2 109 38 294
   000289      1  029300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2484.2 114 38 294
   000290      1  029400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2484.2 201 38 294
   000291      1  029500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2484.2 128 38
   000292      1  029600         MOVE ZERO TO RECORD-COUNT.                               NC2484.2 IMP 129
   000293         029700     PERFORM WRT-LN.                                              NC2484.2 294
   000294         029800 WRT-LN.                                                          NC2484.2
   000295         029900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2484.2 38
   000296         030000     MOVE SPACE TO DUMMY-RECORD.                                  NC2484.2 IMP 38
   000297         030100 BLANK-LINE-PRINT.                                                NC2484.2
   000298         030200     PERFORM WRT-LN.                                              NC2484.2 294
   000299         030300 FAIL-ROUTINE.                                                    NC2484.2
   000300         030400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2484.2 84 IMP 307
   000301         030500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2484.2 98 IMP 307
   000302         030600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2484.2 130 200
   000303         030700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2484.2 195
   000304         030800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2484.2 192 38 282
   000305         030900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2484.2 IMP 200
   000306         031000     GO TO  FAIL-ROUTINE-EX.                                      NC2484.2 312
   000307         031100 FAIL-ROUTINE-WRITE.                                              NC2484.2
   000308         031200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2484.2 80 37 282
   000309         031300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2484.2 130 108
   000310         031400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2484.2 95 37 282
   000311         031500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2484.2 IMP 108
   000312         031600 FAIL-ROUTINE-EX. EXIT.                                           NC2484.2
   000313         031700 BAIL-OUT.                                                        NC2484.2
   000314         031800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2484.2 85 IMP 316
   000315         031900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2484.2 99 IMP 321
   000316         032000 BAIL-OUT-WRITE.                                                  NC2484.2
   000317         032100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2484.2 99 199 85 197
   000318         032200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2484.2 130 200
   000319         032300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2484.2 192 38 282
   000320         032400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2484.2 IMP 200
   000321         032500 BAIL-OUT-EX. EXIT.                                               NC2484.2
   000322         032600 CCVS1-EXIT.                                                      NC2484.2
   000323         032700     EXIT.                                                        NC2484.2
   000324         032800 BUILD-TABLE2.                                                    NC2484.2
   000325         032900     MOVE 21 TO TABLE2-REC (1).                                   NC2484.2 64
   000326         033000     MOVE 02 TO TABLE2-REC (2).                                   NC2484.2 64
   000327         033100     MOVE 03 TO TABLE2-REC (3).                                   NC2484.2 64
   000328         033200     MOVE 11 TO TABLE2-REC (4).                                   NC2484.2 64
   000329         033300     MOVE 05 TO TABLE2-REC (5).                                   NC2484.2 64
   000330         033400     MOVE 10 TO TABLE2-REC (6).                                   NC2484.2 64
   000331         033500     MOVE 26 TO TABLE2-REC (7).                                   NC2484.2 64
   000332         033600     MOVE 02 TO TABLE2-REC (8).                                   NC2484.2 64
   000333         033700     MOVE 16 TO TABLE2-REC (9).                                   NC2484.2 64
   000334         033800     MOVE 62 TO TABLE2-REC (10).                                  NC2484.2 64
   000335         033900     MOVE 10 TO TABLE2-REC (11).                                  NC2484.2 64
   000336         034000     MOVE 04 TO TABLE2-REC (12).                                  NC2484.2 64
   000337         034100*                                                                 NC2484.2
   000338         034200 SET-INIT-F1-1.                                                   NC2484.2
   000339         034300     MOVE "SET-TEST-F1-1" TO PAR-NAME.                            NC2484.2 74
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2484.2 130
   000341         034500     MOVE "SET ... TO" TO FEATURE.                                NC2484.2 70
   000342         034600 SET-TEST-F1-1.                                                   NC2484.2
   000343         034700     SET INDEX1 TO 1.                                             NC2484.2 62
   000344         034800     SET INDEX2 TO 4.                                             NC2484.2 66
   000345         034900     SET INDEX1 TO TABLE2-REC OF TABLE2 (INDEX2).                 NC2484.2 62 64 63 66
   000346         035000     IF INDEX1 EQUAL TO 11                                        NC2484.2 62
   000347      1  035100        PERFORM PASS                                              NC2484.2 224
   000348      1  035200        GO TO SET-WRITE-F1-1                                      NC2484.2 359
   000349         035300     ELSE                                                         NC2484.2
   000350      1  035400        GO TO SET-FAIL-F1-1.                                      NC2484.2 354
   000351         035500 SET-DELETE-F1-1.                                                 NC2484.2
   000352         035600     PERFORM DE-LETE.                                             NC2484.2 226
   000353         035700     GO TO SET-WRITE-F1-1.                                        NC2484.2 359
   000354         035800 SET-FAIL-F1-1.                                                   NC2484.2
   000355         035900     PERFORM FAIL.                                                NC2484.2 225
   000356         036000     SET INDEX-ID TO INDEX1.                                      NC2484.2 67 62
   000357         036100     MOVE INDEX-ID TO COMPUTED-18V0.                              NC2484.2 67 92
   000358         036200     MOVE 11 TO CORRECT-18V0.                                     NC2484.2 105
   000359         036300 SET-WRITE-F1-1.                                                  NC2484.2
   000360         036400     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000361         036500*                                                                 NC2484.2
   000362         036600 SET-INIT-F2-2.                                                   NC2484.2
   000363         036700     MOVE "SET-TEST-F2-2" TO PAR-NAME.                            NC2484.2 74
   000364         036800     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2484.2 130
   000365         036900     MOVE "SET ... UP BY" TO FEATURE.                             NC2484.2 70
   000366         037000     PERFORM BUILD-TABLE2.                                        NC2484.2 324
   000367         037100 SET-TEST-F2-2.                                                   NC2484.2
   000368         037200     SET INDEX1 TO 11.                                            NC2484.2 62
   000369         037300     SET INDEX2 TO 5.                                             NC2484.2 66
   000370         037400     SET INDEX1 UP BY TABLE2-REC OF TABLE2 (INDEX2).              NC2484.2 62 64 63 66
   000371         037500     IF INDEX1 EQUAL TO 16                                        NC2484.2 62
   000372      1  037600        PERFORM PASS                                              NC2484.2 224
   000373      1  037700        GO TO SET-WRITE-F2-2                                      NC2484.2 384
   000374         037800     ELSE                                                         NC2484.2
   000375      1  037900        GO TO SET-FAIL-F2-2.                                      NC2484.2 379
   000376         038000 SET-DELETE-F2-2.                                                 NC2484.2
   000377         038100     PERFORM DE-LETE.                                             NC2484.2 226
   000378         038200     GO TO SET-WRITE-F2-2.                                        NC2484.2 384
   000379         038300 SET-FAIL-F2-2.                                                   NC2484.2
   000380         038400     PERFORM FAIL.                                                NC2484.2 225
   000381         038500     SET INDEX-ID TO INDEX1.                                      NC2484.2 67 62
   000382         038600     MOVE INDEX-ID TO COMPUTED-18V0.                              NC2484.2 67 92
   000383         038700     MOVE 16 TO CORRECT-18V0.                                     NC2484.2 105
   000384         038800 SET-WRITE-F2-2.                                                  NC2484.2
   000385         038900     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000386         039000*                                                                 NC2484.2
   000387         039100 SET-INIT-F2-3.                                                   NC2484.2
   000388         039200     MOVE "SET-TEST-F2-3" TO PAR-NAME.                            NC2484.2 74
   000389         039300     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2484.2 130
   000390         039400     MOVE "SET ... DOWN BY" TO FEATURE.                           NC2484.2 70
   000391         039500     PERFORM BUILD-TABLE2.                                        NC2484.2 324
   000392         039600 SET-TEST-F2-3.                                                   NC2484.2
   000393         039700     SET INDEX1 TO 16.                                            NC2484.2 62
   000394         039800     SET INDEX2 TO 6.                                             NC2484.2 66
   000395         039900     SET INDEX1 DOWN BY TABLE2-REC OF TABLE2 (INDEX2).            NC2484.2 62 64 63 66
   000396         040000     IF INDEX1 EQUAL TO 06                                        NC2484.2 62
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040100        PERFORM PASS                                              NC2484.2 224
   000398      1  040200        GO TO SET-WRITE-F2-3                                      NC2484.2 409
   000399         040300     ELSE                                                         NC2484.2
   000400      1  040400        GO TO SET-FAIL-F2-3.                                      NC2484.2 404
   000401         040500 SET-DELETE-F2-3.                                                 NC2484.2
   000402         040600     PERFORM DE-LETE.                                             NC2484.2 226
   000403         040700     GO TO SET-WRITE-F2-3.                                        NC2484.2 409
   000404         040800 SET-FAIL-F2-3.                                                   NC2484.2
   000405         040900     PERFORM FAIL.                                                NC2484.2 225
   000406         041000     SET INDEX-ID TO INDEX1.                                      NC2484.2 67 62
   000407         041100     MOVE INDEX-ID TO COMPUTED-18V0.                              NC2484.2 67 92
   000408         041200     MOVE 06 TO CORRECT-18V0.                                     NC2484.2 105
   000409         041300 SET-WRITE-F2-3.                                                  NC2484.2
   000410         041400     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000411         041500*                                                                 NC2484.2
   000412         041600 SET-INIT-F1-4.                                                   NC2484.2
   000413         041700     MOVE "SET-TEST-F1-4" TO PAR-NAME.                            NC2484.2 74
   000414         041800     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2484.2 130
   000415         041900     MOVE "SET ... TO" TO FEATURE.                                NC2484.2 70
   000416         042000     PERFORM BUILD-TABLE2.                                        NC2484.2 324
   000417         042100 SET-TEST-F1-4.                                                   NC2484.2
   000418         042200     SET INDEX1 TO 1.                                             NC2484.2 62
   000419         042300     SET INDEX2 TO 11.                                            NC2484.2 66
   000420         042400     SET INDEX1 TO TABLE2-REC OF TABLE2 (INDEX2 + 1).             NC2484.2 62 64 63 66
   000421         042500     IF INDEX1 EQUAL TO 4                                         NC2484.2 62
   000422      1  042600        PERFORM PASS                                              NC2484.2 224
   000423      1  042700        GO TO SET-WRITE-F1-4                                      NC2484.2 434
   000424         042800     ELSE                                                         NC2484.2
   000425      1  042900        GO TO SET-FAIL-F1-4.                                      NC2484.2 429
   000426         043000 SET-DELETE-F1-4.                                                 NC2484.2
   000427         043100     PERFORM DE-LETE.                                             NC2484.2 226
   000428         043200     GO TO SET-WRITE-F1-4.                                        NC2484.2 434
   000429         043300 SET-FAIL-F1-4.                                                   NC2484.2
   000430         043400     PERFORM FAIL.                                                NC2484.2 225
   000431         043500     SET INDEX-ID TO INDEX1.                                      NC2484.2 67 62
   000432         043600     MOVE INDEX-ID TO COMPUTED-18V0.                              NC2484.2 67 92
   000433         043700     MOVE 4 TO CORRECT-18V0.                                      NC2484.2 105
   000434         043800 SET-WRITE-F1-4.                                                  NC2484.2
   000435         043900     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000436         044000*                                                                 NC2484.2
   000437         044100 SET-INIT-F2-5.                                                   NC2484.2
   000438         044200     MOVE "SET-TEST-F2-5" TO PAR-NAME.                            NC2484.2 74
   000439         044300     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2484.2 130
   000440         044400     MOVE "SET ... UP BY" TO FEATURE.                             NC2484.2 70
   000441         044500     PERFORM BUILD-TABLE2.                                        NC2484.2 324
   000442         044600 SET-TEST-F2-5.                                                   NC2484.2
   000443         044700     SET INDEX1 TO 1.                                             NC2484.2 62
   000444         044800     SET INDEX2 TO 3.                                             NC2484.2 66
   000445         044900     SET INDEX1 UP BY TABLE2-REC OF TABLE2 (INDEX2 - 2).          NC2484.2 62 64 63 66
   000446         045000     IF INDEX1 EQUAL TO 22                                        NC2484.2 62
   000447      1  045100        PERFORM PASS                                              NC2484.2 224
   000448      1  045200        GO TO SET-WRITE-F2-5                                      NC2484.2 459
   000449         045300     ELSE                                                         NC2484.2
   000450      1  045400        GO TO SET-FAIL-F2-5.                                      NC2484.2 454
   000451         045500 SET-DELETE-F2-5.                                                 NC2484.2
   000452         045600     PERFORM DE-LETE.                                             NC2484.2 226
   000453         045700     GO TO SET-WRITE-F2-5.                                        NC2484.2 459
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800 SET-FAIL-F2-5.                                                   NC2484.2
   000455         045900     PERFORM FAIL.                                                NC2484.2 225
   000456         046000     SET INDEX-ID TO INDEX1.                                      NC2484.2 67 62
   000457         046100     MOVE INDEX-ID TO COMPUTED-18V0.                              NC2484.2 67 92
   000458         046200     MOVE 22 TO CORRECT-18V0.                                     NC2484.2 105
   000459         046300 SET-WRITE-F2-5.                                                  NC2484.2
   000460         046400     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000461         046500*                                                                 NC2484.2
   000462         046600 SET-INIT-F2-6.                                                   NC2484.2
   000463         046700     MOVE "SET-TEST-F2-6" TO PAR-NAME.                            NC2484.2 74
   000464         046800     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2484.2 130
   000465         046900     MOVE "SET ... DOWN BY" TO FEATURE.                           NC2484.2 70
   000466         047000     PERFORM BUILD-TABLE2.                                        NC2484.2 324
   000467         047100 SET-TEST-F2-6.                                                   NC2484.2
   000468         047200     SET INDEX1 TO 16.                                            NC2484.2 62
   000469         047300     SET INDEX2 TO 12.                                            NC2484.2 66
   000470         047400     SET INDEX1 DOWN BY TABLE2-REC OF TABLE2 (INDEX2 - 6).        NC2484.2 62 64 63 66
   000471         047500     IF INDEX1 EQUAL TO 06                                        NC2484.2 62
   000472      1  047600        PERFORM PASS                                              NC2484.2 224
   000473      1  047700        GO TO SET-WRITE-F2-6                                      NC2484.2 484
   000474         047800     ELSE                                                         NC2484.2
   000475      1  047900        GO TO SET-FAIL-F2-6.                                      NC2484.2 479
   000476         048000 SET-DELETE-F2-6.                                                 NC2484.2
   000477         048100     PERFORM DE-LETE.                                             NC2484.2 226
   000478         048200     GO TO SET-WRITE-F2-6.                                        NC2484.2 484
   000479         048300 SET-FAIL-F2-6.                                                   NC2484.2
   000480         048400     PERFORM FAIL.                                                NC2484.2 225
   000481         048500     SET INDEX-ID TO INDEX1.                                      NC2484.2 67 62
   000482         048600     MOVE INDEX-ID TO COMPUTED-18V0.                              NC2484.2 67 92
   000483         048700     MOVE 06 TO CORRECT-18V0.                                     NC2484.2 105
   000484         048800 SET-WRITE-F2-6.                                                  NC2484.2
   000485         048900     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000486         049000*                                                                 NC2484.2
   000487         049100 SET-INIT-F2-7.                                                   NC2484.2
   000488         049200     MOVE   "SET-TEST-F2-7" TO PAR-NAME.                          NC2484.2 74
   000489         049300     MOVE   "VI-128 6.22.4 GR7" TO ANSI-REFERENCE.                NC2484.2 130
   000490         049400     MOVE    SPACE TO TEST-7-1.                                   NC2484.2 IMP 41
   000491         049500 SET-TEST-F2-7-0.                                                 NC2484.2
   000492         049600     SET     TEST-7-1-TRUE TO TRUE.                               NC2484.2 42
   000493         049700     GO TO   SET-TEST-F2-7-1.                                     NC2484.2 498
   000494         049800 SET-DELETE-F2-7.                                                 NC2484.2
   000495         049900     PERFORM DE-LETE.                                             NC2484.2 226
   000496         050000     GO TO   SET-WRITE-F2-7-1.                                    NC2484.2 513
   000497         050100*                                                                 NC2484.2
   000498         050200 SET-TEST-F2-7-1.                                                 NC2484.2
   000499         050300     IF      TEST-7-1 = "%"                                       NC2484.2 41
   000500      1  050400             PERFORM PASS                                         NC2484.2 224
   000501      1  050500             GO TO   SET-WRITE-F2-7-1                             NC2484.2 513
   000502         050600     ELSE                                                         NC2484.2
   000503      1  050700             GO TO   SET-FAIL-F2-7-1.                             NC2484.2 507
   000504         050800 SET-DELETE-F2-7-1.                                               NC2484.2
   000505         050900     PERFORM DE-LETE.                                             NC2484.2 226
   000506         051000     GO TO SET-WRITE-F2-7-1.                                      NC2484.2 513
   000507         051100 SET-FAIL-F2-7-1.                                                 NC2484.2
   000508         051200     PERFORM FAIL.                                                NC2484.2 225
   000509         051300     MOVE   "CONDITION VARIABLE NOT SET TO TRUE VALUE"            NC2484.2
   000510         051400          TO RE-MARK.                                             NC2484.2 79
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     MOVE    TEST-7-1 TO COMPUTED-X.                              NC2484.2 41 84
   000512         051600     MOVE   "%"       TO CORRECT-X.                               NC2484.2 98
   000513         051700 SET-WRITE-F2-7-1.                                                NC2484.2
   000514         051800     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000515         051900*                                                                 NC2484.2
   000516         052000 SET-INIT-F2-8.                                                   NC2484.2
   000517         052100     MOVE   "SET-TEST-F2-8" TO PAR-NAME.                          NC2484.2 74
   000518         052200     MOVE   "VI-128 6.22.4 GR7" TO ANSI-REFERENCE.                NC2484.2 130
   000519         052300     MOVE    SPACE TO TEST-8-1.                                   NC2484.2 IMP 44
   000520         052400 SET-TEST-F2-8-0.                                                 NC2484.2
   000521         052500     SET     TEST-8-1-1-TRUE TO TRUE.                             NC2484.2 45
   000522         052600     GO TO   SET-TEST-F2-8-1.                                     NC2484.2 527
   000523         052700 SET-DELETE-F2-8.                                                 NC2484.2
   000524         052800     PERFORM DE-LETE.                                             NC2484.2 226
   000525         052900     GO TO   SET-WRITE-F2-8-1.                                    NC2484.2 542
   000526         053000*                                                                 NC2484.2
   000527         053100 SET-TEST-F2-8-1.                                                 NC2484.2
   000528         053200     IF      TEST-8-1 = "J"                                       NC2484.2 44
   000529      1  053300             PERFORM PASS                                         NC2484.2 224
   000530      1  053400             GO TO   SET-WRITE-F2-8-1                             NC2484.2 542
   000531         053500     ELSE                                                         NC2484.2
   000532      1  053600             GO TO   SET-FAIL-F2-8-1.                             NC2484.2 536
   000533         053700 SET-DELETE-F2-8-1.                                               NC2484.2
   000534         053800     PERFORM DE-LETE.                                             NC2484.2 226
   000535         053900     GO TO SET-WRITE-F2-8-1.                                      NC2484.2 542
   000536         054000 SET-FAIL-F2-8-1.                                                 NC2484.2
   000537         054100     PERFORM FAIL.                                                NC2484.2 225
   000538         054200     MOVE   "CONDITION VARIABLE NOT SET TO FIRST TRUE VALUE"      NC2484.2
   000539         054300          TO RE-MARK.                                             NC2484.2 79
   000540         054400     MOVE    TEST-8-1 TO COMPUTED-X.                              NC2484.2 44 84
   000541         054500     MOVE   "J"       TO CORRECT-X.                               NC2484.2 98
   000542         054600 SET-WRITE-F2-8-1.                                                NC2484.2
   000543         054700     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000544         054800*                                                                 NC2484.2
   000545         054900 SET-INIT-F2-9.                                                   NC2484.2
   000546         055000     MOVE   "SET-TEST-F2-9" TO PAR-NAME.                          NC2484.2 74
   000547         055100     MOVE   "VI-128 6.22.4 GR7" TO ANSI-REFERENCE.                NC2484.2 130
   000548         055200     MOVE    SPACE TO TEST-8-1.                                   NC2484.2 IMP 44
   000549         055300     MOVE    1 TO REC-CT.                                         NC2484.2 121
   000550         055400 SET-TEST-F2-9-0.                                                 NC2484.2
   000551         055500     SET     TEST-9-1-1-TRUE                                      NC2484.2 50
   000552         055600             TEST-9-2-1-TRUE                                      NC2484.2 53
   000553         055700             TEST-9-3-1-TRUE TO TRUE.                             NC2484.2 56
   000554         055800     GO TO   SET-TEST-F2-9-1.                                     NC2484.2 559
   000555         055900 SET-DELETE-F2-9.                                                 NC2484.2
   000556         056000     PERFORM DE-LETE.                                             NC2484.2 226
   000557         056100     GO TO   SET-WRITE-F2-9-3.                                    NC2484.2 612
   000558         056200*                                                                 NC2484.2
   000559         056300 SET-TEST-F2-9-1.                                                 NC2484.2
   000560         056400     IF      TEST-9-1 = "6"                                       NC2484.2 49
   000561      1  056500             PERFORM PASS                                         NC2484.2 224
   000562      1  056600             GO TO   SET-WRITE-F2-9-1                             NC2484.2 574
   000563         056700     ELSE                                                         NC2484.2
   000564      1  056800             GO TO   SET-FAIL-F2-9-1.                             NC2484.2 568
   000565         056900 SET-DELETE-F2-9-1.                                               NC2484.2
   000566         057000     PERFORM DE-LETE.                                             NC2484.2 226
   000567         057100     GO TO SET-WRITE-F2-9-1.                                      NC2484.2 574
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200 SET-FAIL-F2-9-1.                                                 NC2484.2
   000569         057300     PERFORM FAIL.                                                NC2484.2 225
   000570         057400     MOVE   "CONDITION VARIABLE NOT SET TO FIRST TRUE VALUE"      NC2484.2
   000571         057500          TO RE-MARK.                                             NC2484.2 79
   000572         057600     MOVE    TEST-9-1 TO COMPUTED-X.                              NC2484.2 49 84
   000573         057700     MOVE   "6"       TO CORRECT-X.                               NC2484.2 98
   000574         057800 SET-WRITE-F2-9-1.                                                NC2484.2
   000575         057900     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000576         058000*                                                                 NC2484.2
   000577         058100 SET-TEST-F2-9-2.                                                 NC2484.2
   000578         058200     ADD     1 TO REC-CT.                                         NC2484.2 121
   000579         058300     IF      TEST-9-2 = "B"                                       NC2484.2 52
   000580      1  058400             PERFORM PASS                                         NC2484.2 224
   000581      1  058500             GO TO   SET-WRITE-F2-9-2                             NC2484.2 593
   000582         058600     ELSE                                                         NC2484.2
   000583      1  058700             GO TO   SET-FAIL-F2-9-2.                             NC2484.2 587
   000584         058800 SET-DELETE-F2-9-2.                                               NC2484.2
   000585         058900     PERFORM DE-LETE.                                             NC2484.2 226
   000586         059000     GO TO SET-WRITE-F2-9-2.                                      NC2484.2 593
   000587         059100 SET-FAIL-F2-9-2.                                                 NC2484.2
   000588         059200     PERFORM FAIL.                                                NC2484.2 225
   000589         059300     MOVE   "CONDITION VARIABLE NOT SET TO FIRST TRUE VALUE"      NC2484.2
   000590         059400          TO RE-MARK.                                             NC2484.2 79
   000591         059500     MOVE    TEST-9-2 TO COMPUTED-X.                              NC2484.2 52 84
   000592         059600     MOVE   "6"       TO CORRECT-X.                               NC2484.2 98
   000593         059700 SET-WRITE-F2-9-2.                                                NC2484.2
   000594         059800     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000595         059900*                                                                 NC2484.2
   000596         060000 SET-TEST-F2-9-3.                                                 NC2484.2
   000597         060100     ADD     1 TO REC-CT.                                         NC2484.2 121
   000598         060200     IF      TEST-9-3 = "*"                                       NC2484.2 55
   000599      1  060300             PERFORM PASS                                         NC2484.2 224
   000600      1  060400             GO TO   SET-WRITE-F2-9-3                             NC2484.2 612
   000601         060500     ELSE                                                         NC2484.2
   000602      1  060600             GO TO   SET-FAIL-F2-9-3.                             NC2484.2 606
   000603         060700 SET-DELETE-F2-9-3.                                               NC2484.2
   000604         060800     PERFORM DE-LETE.                                             NC2484.2 226
   000605         060900     GO TO SET-WRITE-F2-9-3.                                      NC2484.2 612
   000606         061000 SET-FAIL-F2-9-3.                                                 NC2484.2
   000607         061100     PERFORM FAIL.                                                NC2484.2 225
   000608         061200     MOVE   "CONDITION VARIABLE NOT SET TO FIRST TRUE VALUE"      NC2484.2
   000609         061300          TO RE-MARK.                                             NC2484.2 79
   000610         061400     MOVE    TEST-9-3 TO COMPUTED-X.                              NC2484.2 55 84
   000611         061500     MOVE   "*"       TO CORRECT-X.                               NC2484.2 98
   000612         061600 SET-WRITE-F2-9-3.                                                NC2484.2
   000613         061700     PERFORM PRINT-DETAIL.                                        NC2484.2 228
   000614         061800*                                                                 NC2484.2
   000615         061900 CCVS-EXIT SECTION.                                               NC2484.2
   000616         062000 CCVS-999999.                                                     NC2484.2
   000617         062100     GO TO CLOSE-FILES.                                           NC2484.2 217
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      130   ANSI-REFERENCE . . . . . . . .  302 309 318 M340 M364 M389 M414 M439 M464 M489 M518 M547
      109   CCVS-C-1 . . . . . . . . . . .  246 288
      114   CCVS-C-2 . . . . . . . . . . .  247 289
      164   CCVS-E-1 . . . . . . . . . . .  252
      169   CCVS-E-2 . . . . . . . . . . .  261 268 275 280
      172   CCVS-E-2-2 . . . . . . . . . .  M260
      177   CCVS-E-3 . . . . . . . . . . .  281
      186   CCVS-E-4 . . . . . . . . . . .  260
      187   CCVS-E-4-1 . . . . . . . . . .  M258
      189   CCVS-E-4-2 . . . . . . . . . .  M259
      131   CCVS-H-1 . . . . . . . . . . .  241
      136   CCVS-H-2A. . . . . . . . . . .  242
      145   CCVS-H-2B. . . . . . . . . . .  243
      157   CCVS-H-3 . . . . . . . . . . .  244
      207   CCVS-PGM-ID. . . . . . . . . .  213 213
       91   CM-18V0
       85   COMPUTED-A . . . . . . . . . .  86 88 89 90 91 314 317
       86   COMPUTED-N
       84   COMPUTED-X . . . . . . . . . .  M236 300 M511 M540 M572 M591 M610
       88   COMPUTED-0V18
       90   COMPUTED-14V4
       92   COMPUTED-18V0. . . . . . . . .  M357 M382 M407 M432 M457 M482
       89   COMPUTED-4V14
      108   COR-ANSI-REFERENCE . . . . . .  M309 M311
       99   CORRECT-A. . . . . . . . . . .  100 101 102 103 104 315 317
      100   CORRECT-N
       98   CORRECT-X. . . . . . . . . . .  M237 301 M512 M541 M573 M592 M611
      101   CORRECT-0V18
      103   CORRECT-14V4
      105   CORRECT-18V0 . . . . . . . . .  M358 M383 M408 M433 M458 M483
      102   CORRECT-4V14
      104   CR-18V0
      122   DELETE-COUNTER . . . . . . . .  M226 255 271 273
       77   DOTVALUE . . . . . . . . . . .  M231
      128   DUMMY-HOLD . . . . . . . . . .  M285 291
       38   DUMMY-RECORD . . . . . . . . .  M241 M242 M243 M244 M246 M247 M248 M250 M252 M261 M268 M275 M280 M281 285 M286
                                            287 M288 M289 M290 M291 295 M296 M304 M319
      175   ENDER-DESC . . . . . . . . . .  M263 M274 M279
      123   ERROR-COUNTER. . . . . . . . .  M225 254 264 267
      127   ERROR-HOLD . . . . . . . . . .  M254 M255 M255 M256 259
      173   ERROR-TOTAL. . . . . . . . . .  M265 M267 M272 M273 M277 M278
       70   FEATURE. . . . . . . . . . . .  M341 M365 M390 M415 M440 M465
      201   HYPHEN-LINE. . . . . . . . . .  248 250 290
      167   ID-AGAIN . . . . . . . . . . .  M213
       67   INDEX-ID . . . . . . . . . . .  M356 357 M381 382 M406 407 M431 432 M456 457 M481 482
       62   INDEX1 . . . . . . . . . . . .  M343 M345 346 356 M368 M370 371 381 M393 M395 396 406 M418 M420 421 431 M443
                                            M445 446 456 M468 M470 471 481
       66   INDEX2 . . . . . . . . . . . .  M344 345 M369 370 M394 395 M419 420 M444 445 M469 470
      200   INF-ANSI-REFERENCE . . . . . .  M302 M305 M318 M320
      195   INFO-TEXT. . . . . . . . . . .  M303
      124   INSPECT-COUNTER. . . . . . . .  M223 254 276 278
       72   P-OR-F . . . . . . . . . . . .  M223 M224 M225 M226 233 M236
       74   PAR-NAME . . . . . . . . . . .  M238 M339 M363 M388 M413 M438 M463 M488 M517 M546
       76   PARDOT-X . . . . . . . . . . .  M230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    15
0 Defined   Cross-reference of data names   References

0     125   PASS-COUNTER . . . . . . . . .  M224 256 258
       36   PRINT-FILE . . . . . . . . . .  32 212 218
       37   PRINT-REC. . . . . . . . . . .  M232 M308 M310
       79   RE-MARK. . . . . . . . . . . .  M227 M239 M510 M539 M571 M590 M609
      121   REC-CT . . . . . . . . . . . .  229 231 238 M549 M578 M597
      120   REC-SKL-SUB
      129   RECORD-COUNT . . . . . . . . .  M283 284 M292
       59   TABLE1
       60   TABLE1-REC
       63   TABLE2 . . . . . . . . . . . .  345 370 395 420 445 470
       64   TABLE2-REC . . . . . . . . . .  M325 M326 M327 M328 M329 M330 M331 M332 M333 M334 M335 M336 345 370 395 420 445
                                            470
       80   TEST-COMPUTED. . . . . . . . .  308
       95   TEST-CORRECT . . . . . . . . .  310
      148   TEST-ID. . . . . . . . . . . .  M213
       68   TEST-RESULTS . . . . . . . . .  M214 232
       40   TEST-7-DATA
       41   TEST-7-1 . . . . . . . . . . .  M490 499 511
       42   TEST-7-1-TRUE. . . . . . . . .  M492
       43   TEST-8-DATA
       44   TEST-8-1 . . . . . . . . . . .  M519 528 540 M548
       45   TEST-8-1-1-TRUE. . . . . . . .  M521
       46   TEST-8-1-2-TRUE
       47   TEST-8-1-3-TRUE
       48   TEST-9-DATA
       49   TEST-9-1 . . . . . . . . . . .  560 572
       50   TEST-9-1-1-TRUE. . . . . . . .  M551
       51   TEST-9-1-2-TRUE
       52   TEST-9-2 . . . . . . . . . . .  579 591
       53   TEST-9-2-1-TRUE. . . . . . . .  M552
       54   TEST-9-2-2-TRUE
       55   TEST-9-3 . . . . . . . . . . .  598 610
       56   TEST-9-3-1-TRUE. . . . . . . .  M553
       57   TEST-9-3-2-TRUE
      126   TOTAL-ERROR
      197   XXCOMPUTED . . . . . . . . . .  M317
      199   XXCORRECT. . . . . . . . . . .  M317
      192   XXINFO . . . . . . . . . . . .  304 319
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    16
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

      313   BAIL-OUT . . . . . . . . . . .  P235
      321   BAIL-OUT-EX. . . . . . . . . .  E235 G315
      316   BAIL-OUT-WRITE . . . . . . . .  G314
      297   BLANK-LINE-PRINT
      324   BUILD-TABLE2 . . . . . . . . .  P366 P391 P416 P441 P466
      615   CCVS-EXIT
      616   CCVS-999999
      210   CCVS1
      322   CCVS1-EXIT . . . . . . . . . .  G216
      217   CLOSE-FILES. . . . . . . . . .  G617
      245   COLUMN-NAMES-ROUTINE . . . . .  E215
      226   DE-LETE. . . . . . . . . . . .  P352 P377 P402 P427 P452 P477 P495 P505 P524 P534 P556 P566 P585 P604
      249   END-ROUTINE. . . . . . . . . .  P218
      253   END-ROUTINE-1
      262   END-ROUTINE-12
      270   END-ROUTINE-13 . . . . . . . .  E218
      251   END-RTN-EXIT
      225   FAIL . . . . . . . . . . . . .  P355 P380 P405 P430 P455 P480 P508 P537 P569 P588 P607
      299   FAIL-ROUTINE . . . . . . . . .  P234
      312   FAIL-ROUTINE-EX. . . . . . . .  E234 G306
      307   FAIL-ROUTINE-WRITE . . . . . .  G300 G301
      240   HEAD-ROUTINE . . . . . . . . .  P215
      223   INSPT
      211   OPEN-FILES
      224   PASS . . . . . . . . . . . . .  P347 P372 P397 P422 P447 P472 P500 P529 P561 P580 P599
      228   PRINT-DETAIL . . . . . . . . .  P360 P385 P410 P435 P460 P485 P514 P543 P575 P594 P613
      351   SET-DELETE-F1-1
      426   SET-DELETE-F1-4
      376   SET-DELETE-F2-2
      401   SET-DELETE-F2-3
      451   SET-DELETE-F2-5
      476   SET-DELETE-F2-6
      494   SET-DELETE-F2-7
      504   SET-DELETE-F2-7-1
      523   SET-DELETE-F2-8
      533   SET-DELETE-F2-8-1
      555   SET-DELETE-F2-9
      565   SET-DELETE-F2-9-1
      584   SET-DELETE-F2-9-2
      603   SET-DELETE-F2-9-3
      354   SET-FAIL-F1-1. . . . . . . . .  G350
      429   SET-FAIL-F1-4. . . . . . . . .  G425
      379   SET-FAIL-F2-2. . . . . . . . .  G375
      404   SET-FAIL-F2-3. . . . . . . . .  G400
      454   SET-FAIL-F2-5. . . . . . . . .  G450
      479   SET-FAIL-F2-6. . . . . . . . .  G475
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    17
0 Defined   Cross-reference of procedures   References

0     507   SET-FAIL-F2-7-1. . . . . . . .  G503
      536   SET-FAIL-F2-8-1. . . . . . . .  G532
      568   SET-FAIL-F2-9-1. . . . . . . .  G564
      587   SET-FAIL-F2-9-2. . . . . . . .  G583
      606   SET-FAIL-F2-9-3. . . . . . . .  G602
      338   SET-INIT-F1-1
      412   SET-INIT-F1-4
      362   SET-INIT-F2-2
      387   SET-INIT-F2-3
      437   SET-INIT-F2-5
      462   SET-INIT-F2-6
      487   SET-INIT-F2-7
      516   SET-INIT-F2-8
      545   SET-INIT-F2-9
      342   SET-TEST-F1-1
      417   SET-TEST-F1-4
      367   SET-TEST-F2-2
      392   SET-TEST-F2-3
      442   SET-TEST-F2-5
      467   SET-TEST-F2-6
      491   SET-TEST-F2-7-0
      498   SET-TEST-F2-7-1. . . . . . . .  G493
      520   SET-TEST-F2-8-0
      527   SET-TEST-F2-8-1. . . . . . . .  G522
      550   SET-TEST-F2-9-0
      559   SET-TEST-F2-9-1. . . . . . . .  G554
      577   SET-TEST-F2-9-2
      596   SET-TEST-F2-9-3
      359   SET-WRITE-F1-1 . . . . . . . .  G348 G353
      434   SET-WRITE-F1-4 . . . . . . . .  G423 G428
      384   SET-WRITE-F2-2 . . . . . . . .  G373 G378
      409   SET-WRITE-F2-3 . . . . . . . .  G398 G403
      459   SET-WRITE-F2-5 . . . . . . . .  G448 G453
      484   SET-WRITE-F2-6 . . . . . . . .  G473 G478
      513   SET-WRITE-F2-7-1 . . . . . . .  G496 G501 G506
      542   SET-WRITE-F2-8-1 . . . . . . .  G525 G530 G535
      574   SET-WRITE-F2-9-1 . . . . . . .  G562 G567
      593   SET-WRITE-F2-9-2 . . . . . . .  G581 G586
      612   SET-WRITE-F2-9-3 . . . . . . .  G557 G600 G605
      221   TERMINATE-CALL
      219   TERMINATE-CCVS
      282   WRITE-LINE . . . . . . . . . .  P232 P233 P241 P242 P243 P244 P246 P247 P248 P250 P252 P261 P269 P275 P280 P281
                                            P304 P308 P310 P319
      294   WRT-LN . . . . . . . . . . . .  P288 P289 P290 P293 P298
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    18
0 Defined   Cross-reference of programs     References

        3   NC248A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC248A    Date 06/04/2022  Time 11:57:18   Page    19
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC248A:
 *    Source records = 617
 *    Data Division statements = 86
 *    Procedure Division statements = 326
 *    Generated COBOL statements = 0
 *    Program complexity factor = 333
0End of compilation 1,  program NC248A,  highest severity 0.
0Return code 0
