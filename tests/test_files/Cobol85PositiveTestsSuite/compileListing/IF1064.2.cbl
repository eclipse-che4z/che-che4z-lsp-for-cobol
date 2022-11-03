1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:13   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:13   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1064.2
   000002         000200 PROGRAM-ID.                                                      IF1064.2
   000003         000300     IF106A.                                                      IF1064.2
   000004         000400                                                                  IF1064.2
   000005         000600*                                                         *       IF1064.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1064.2
   000007         000800* It contains tests for the Intrinsic Function COS.       *       IF1064.2
   000008         000900*                                                         *       IF1064.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1064.2
   000010         001200 CONFIGURATION SECTION.                                           IF1064.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1064.2
   000012         001400     XXXXX082.                                                    IF1064.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1064.2
   000014         001600     XXXXX083.                                                    IF1064.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1064.2
   000016         001800 FILE-CONTROL.                                                    IF1064.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1064.2 21
   000018         002000     XXXXX055.                                                    IF1064.2
   000019         002100 DATA DIVISION.                                                   IF1064.2
   000020         002200 FILE SECTION.                                                    IF1064.2
   000021         002300 FD  PRINT-FILE.                                                  IF1064.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1064.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1064.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1064.2
   000025         002800* Variables specific to the Intrinsic Function Test IF106A*       IF1064.2
   000026         003000 01  A                   PIC S9(5)V9(5)      VALUE -0.00004.      IF1064.2
   000027         003100 01  B                   PIC S9(5)V9(5)      VALUE 14000.105.     IF1064.2
   000028         003200 01  C                   PIC S9(10)          VALUE 100000.        IF1064.2
   000029         003300 01  D                   PIC S9(10)          VALUE 1000.          IF1064.2
   000030         003400 01  E                   PIC S9(10)          VALUE 3.             IF1064.2
   000031         003500 01  PI                  PIC S9V9(17)        VALUE 3.141592654.   IF1064.2
   000032         003600 01  MINUSPI             PIC S9V9(17)        VALUE -3.141592654.  IF1064.2
   000033         003700 01  ARG1                PIC S9V9(17)        VALUE 1.00.          IF1064.2
   000034         003800 01  ARR                                     VALUE "40537".       IF1064.2
   000035         003900     02  IND OCCURS 5 TIMES PIC 9.                                IF1064.2
   000036         004000 01  TEMP                PIC S9(5)V9(5).                          IF1064.2
   000037         004100 01  WS-NUM              PIC S9(5)V9(6).                          IF1064.2
   000038         004200 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1064.2
   000039         004300 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1064.2
   000040         004400*                                                                 IF1064.2
   000041         004600*                                                                 IF1064.2
   000042         004700 01  TEST-RESULTS.                                                IF1064.2
   000043         004800     02 FILLER                   PIC X      VALUE SPACE.          IF1064.2 IMP
   000044         004900     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1064.2 IMP
   000045         005000     02 FILLER                   PIC X      VALUE SPACE.          IF1064.2 IMP
   000046         005100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1064.2 IMP
   000047         005200     02 FILLER                   PIC X      VALUE SPACE.          IF1064.2 IMP
   000048         005300     02  PAR-NAME.                                                IF1064.2
   000049         005400       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1064.2 IMP
   000050         005500       03  PARDOT-X              PIC X      VALUE SPACE.          IF1064.2 IMP
   000051         005600       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1064.2 IMP
   000052         005700     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1064.2 IMP
   000053         005800     02 RE-MARK                  PIC X(61).                       IF1064.2
   000054         005900 01  TEST-COMPUTED.                                               IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1064.2 IMP
   000056         006100     02 FILLER                   PIC X(17)  VALUE                 IF1064.2
   000057         006200            "       COMPUTED=".                                   IF1064.2
   000058         006300     02 COMPUTED-X.                                               IF1064.2
   000059         006400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1064.2 IMP
   000060         006500     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1064.2 59
   000061         006600                                 PIC -9(9).9(9).                  IF1064.2
   000062         006700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1064.2 59
   000063         006800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1064.2 59
   000064         006900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1064.2 59
   000065         007000     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1064.2 59
   000066         007100         04 COMPUTED-18V0                    PIC -9(18).          IF1064.2
   000067         007200         04 FILLER                           PIC X.               IF1064.2
   000068         007300     03 FILLER PIC X(50) VALUE SPACE.                             IF1064.2 IMP
   000069         007400 01  TEST-CORRECT.                                                IF1064.2
   000070         007500     02 FILLER PIC X(30) VALUE SPACE.                             IF1064.2 IMP
   000071         007600     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1064.2
   000072         007700     02 CORRECT-X.                                                IF1064.2
   000073         007800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1064.2 IMP
   000074         007900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1064.2 73
   000075         008000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1064.2 73
   000076         008100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1064.2 73
   000077         008200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1064.2 73
   000078         008300     03      CR-18V0 REDEFINES CORRECT-A.                         IF1064.2 73
   000079         008400         04 CORRECT-18V0                     PIC -9(18).          IF1064.2
   000080         008500         04 FILLER                           PIC X.               IF1064.2
   000081         008600     03 FILLER PIC X(2) VALUE SPACE.                              IF1064.2 IMP
   000082         008700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1064.2 IMP
   000083         008800 01  TEST-CORRECT-MIN.                                            IF1064.2
   000084         008900     02 FILLER PIC X(30) VALUE SPACE.                             IF1064.2 IMP
   000085         009000     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1064.2
   000086         009100     02 CORRECTMI-X.                                              IF1064.2
   000087         009200     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1064.2 IMP
   000088         009300     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1064.2 87
   000089         009400     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1064.2 87
   000090         009500     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1064.2 87
   000091         009600     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1064.2 87
   000092         009700     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1064.2 87
   000093         009800         04 CORRECTMI-18V0                     PIC -9(18).        IF1064.2
   000094         009900         04 FILLER                           PIC X.               IF1064.2
   000095         010000     03 FILLER PIC X(2) VALUE SPACE.                              IF1064.2 IMP
   000096         010100     03 FILLER                           PIC X(48) VALUE SPACE.   IF1064.2 IMP
   000097         010200 01  TEST-CORRECT-MAX.                                            IF1064.2
   000098         010300     02 FILLER PIC X(30) VALUE SPACE.                             IF1064.2 IMP
   000099         010400     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1064.2
   000100         010500     02 CORRECTMA-X.                                              IF1064.2
   000101         010600     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1064.2 IMP
   000102         010700     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1064.2 101
   000103         010800     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1064.2 101
   000104         010900     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1064.2 101
   000105         011000     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1064.2 101
   000106         011100     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1064.2 101
   000107         011200         04 CORRECTMA-18V0                     PIC -9(18).        IF1064.2
   000108         011300         04 FILLER                           PIC X.               IF1064.2
   000109         011400     03 FILLER PIC X(2) VALUE SPACE.                              IF1064.2 IMP
   000110         011500     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1064.2 IMP
   000111         011600 01  CCVS-C-1.                                                    IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1064.2
   000113         011800-    "SS  PARAGRAPH-NAME                                          IF1064.2
   000114         011900-    "       REMARKS".                                            IF1064.2
   000115         012000     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1064.2 IMP
   000116         012100 01  CCVS-C-2.                                                    IF1064.2
   000117         012200     02 FILLER                     PIC X        VALUE SPACE.      IF1064.2 IMP
   000118         012300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1064.2
   000119         012400     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1064.2 IMP
   000120         012500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1064.2
   000121         012600     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1064.2 IMP
   000122         012700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1064.2 IMP
   000123         012800 01  REC-CT                        PIC 99       VALUE ZERO.       IF1064.2 IMP
   000124         012900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1064.2 IMP
   000125         013000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1064.2 IMP
   000126         013100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1064.2 IMP
   000127         013200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1064.2 IMP
   000128         013300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1064.2 IMP
   000129         013400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1064.2 IMP
   000130         013500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1064.2 IMP
   000131         013600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1064.2 IMP
   000132         013700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1064.2 IMP
   000133         013800 01  CCVS-H-1.                                                    IF1064.2
   000134         013900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1064.2 IMP
   000135         014000     02  FILLER                    PIC X(42)    VALUE             IF1064.2
   000136         014100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1064.2
   000137         014200     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1064.2 IMP
   000138         014300 01  CCVS-H-2A.                                                   IF1064.2
   000139         014400   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1064.2 IMP
   000140         014500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1064.2
   000141         014600   02  FILLER                        PIC XXXX   VALUE             IF1064.2
   000142         014700     "4.2 ".                                                      IF1064.2
   000143         014800   02  FILLER                        PIC X(28)  VALUE             IF1064.2
   000144         014900            " COPY - NOT FOR DISTRIBUTION".                       IF1064.2
   000145         015000   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1064.2 IMP
   000146         015100                                                                  IF1064.2
   000147         015200 01  CCVS-H-2B.                                                   IF1064.2
   000148         015300   02  FILLER                        PIC X(15)  VALUE             IF1064.2
   000149         015400            "TEST RESULT OF ".                                    IF1064.2
   000150         015500   02  TEST-ID                       PIC X(9).                    IF1064.2
   000151         015600   02  FILLER                        PIC X(4)   VALUE             IF1064.2
   000152         015700            " IN ".                                               IF1064.2
   000153         015800   02  FILLER                        PIC X(12)  VALUE             IF1064.2
   000154         015900     " HIGH       ".                                              IF1064.2
   000155         016000   02  FILLER                        PIC X(22)  VALUE             IF1064.2
   000156         016100            " LEVEL VALIDATION FOR ".                             IF1064.2
   000157         016200   02  FILLER                        PIC X(58)  VALUE             IF1064.2
   000158         016300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1064.2
   000159         016400 01  CCVS-H-3.                                                    IF1064.2
   000160         016500     02  FILLER                      PIC X(34)  VALUE             IF1064.2
   000161         016600            " FOR OFFICIAL USE ONLY    ".                         IF1064.2
   000162         016700     02  FILLER                      PIC X(58)  VALUE             IF1064.2
   000163         016800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1064.2
   000164         016900     02  FILLER                      PIC X(28)  VALUE             IF1064.2
   000165         017000            "  COPYRIGHT   1985 ".                                IF1064.2
   000166         017100 01  CCVS-E-1.                                                    IF1064.2
   000167         017200     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1064.2 IMP
   000168         017300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 ID-AGAIN                     PIC X(9).                    IF1064.2
   000170         017500     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1064.2 IMP
   000171         017600 01  CCVS-E-2.                                                    IF1064.2
   000172         017700     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1064.2 IMP
   000173         017800     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1064.2 IMP
   000174         017900     02 CCVS-E-2-2.                                               IF1064.2
   000175         018000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1064.2 IMP
   000176         018100         03 FILLER                   PIC X      VALUE SPACE.      IF1064.2 IMP
   000177         018200         03 ENDER-DESC               PIC X(44)  VALUE             IF1064.2
   000178         018300            "ERRORS ENCOUNTERED".                                 IF1064.2
   000179         018400 01  CCVS-E-3.                                                    IF1064.2
   000180         018500     02  FILLER                      PIC X(22)  VALUE             IF1064.2
   000181         018600            " FOR OFFICIAL USE ONLY".                             IF1064.2
   000182         018700     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1064.2 IMP
   000183         018800     02  FILLER                      PIC X(58)  VALUE             IF1064.2
   000184         018900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1064.2
   000185         019000     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1064.2 IMP
   000186         019100     02 FILLER                       PIC X(15)  VALUE             IF1064.2
   000187         019200             " COPYRIGHT 1985".                                   IF1064.2
   000188         019300 01  CCVS-E-4.                                                    IF1064.2
   000189         019400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1064.2 IMP
   000190         019500     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1064.2
   000191         019600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1064.2 IMP
   000192         019700     02 FILLER                       PIC X(40)  VALUE             IF1064.2
   000193         019800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1064.2
   000194         019900 01  XXINFO.                                                      IF1064.2
   000195         020000     02 FILLER                       PIC X(19)  VALUE             IF1064.2
   000196         020100            "*** INFORMATION ***".                                IF1064.2
   000197         020200     02 INFO-TEXT.                                                IF1064.2
   000198         020300       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1064.2 IMP
   000199         020400       04 XXCOMPUTED                 PIC X(20).                   IF1064.2
   000200         020500       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1064.2 IMP
   000201         020600       04 XXCORRECT                  PIC X(20).                   IF1064.2
   000202         020700     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1064.2
   000203         020800 01  HYPHEN-LINE.                                                 IF1064.2
   000204         020900     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1064.2 IMP
   000205         021000     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1064.2
   000206         021100-    "*****************************************".                 IF1064.2
   000207         021200     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1064.2
   000208         021300-    "******************************".                            IF1064.2
   000209         021400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1064.2
   000210         021500     "IF106A".                                                    IF1064.2
   000211         021600 PROCEDURE DIVISION.                                              IF1064.2
   000212         021700 CCVS1 SECTION.                                                   IF1064.2
   000213         021800 OPEN-FILES.                                                      IF1064.2
   000214         021900     OPEN     OUTPUT PRINT-FILE.                                  IF1064.2 21
   000215         022000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1064.2 209 150 209 169
   000216         022100     MOVE    SPACE TO TEST-RESULTS.                               IF1064.2 IMP 42
   000217         022200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1064.2 240 245
   000218         022300     GO TO CCVS1-EXIT.                                            IF1064.2 333
   000219         022400 CLOSE-FILES.                                                     IF1064.2
   000220         022500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1064.2 249 269 21
   000221         022600 TERMINATE-CCVS.                                                  IF1064.2
   000222         022700     STOP     RUN.                                                IF1064.2
   000223         022800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1064.2 46 126
   000224         022900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1064.2 46 127
   000225         023000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1064.2 46 125
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1064.2 46 124
   000227         023200     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1064.2 53
   000228         023300 PRINT-DETAIL.                                                    IF1064.2
   000229         023400     IF REC-CT NOT EQUAL TO ZERO                                  IF1064.2 123 IMP
   000230      1  023500             MOVE "." TO PARDOT-X                                 IF1064.2 50
   000231      1  023600             MOVE REC-CT TO DOTVALUE.                             IF1064.2 123 51
   000232         023700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1064.2 42 22 281
   000233         023800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1064.2 46 281
   000234      1  023900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1064.2 302 322
   000235      1  024000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1064.2 323 332
   000236         024100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1064.2 IMP 46 IMP 58
   000237         024200     MOVE SPACE TO CORRECT-X.                                     IF1064.2 IMP 72
   000238         024300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1064.2 123 IMP IMP 48
   000239         024400     MOVE     SPACE TO RE-MARK.                                   IF1064.2 IMP 53
   000240         024500 HEAD-ROUTINE.                                                    IF1064.2
   000241         024600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1064.2 133 23 281
   000242         024700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1064.2 138 23 281
   000243         024800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1064.2 147 23 281
   000244         024900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1064.2 159 23 281
   000245         025000 COLUMN-NAMES-ROUTINE.                                            IF1064.2
   000246         025100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1064.2 111 23 281
   000247         025200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1064.2 116 23 281
   000248         025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1064.2 203 23 281
   000249         025400 END-ROUTINE.                                                     IF1064.2
   000250         025500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1064.2 203 23 281
   000251         025600 END-RTN-EXIT.                                                    IF1064.2
   000252         025700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1064.2 166 23 281
   000253         025800 END-ROUTINE-1.                                                   IF1064.2
   000254         025900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1064.2 125 129 126
   000255         026000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1064.2 129 124 129
   000256         026100      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1064.2 127 129
   000257         026200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1064.2 127 189
   000258         026300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1064.2 129 191
   000259         026400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1064.2 188 174
   000260         026500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1064.2 171 23 281
   000261         026600  END-ROUTINE-12.                                                 IF1064.2
   000262         026700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1064.2 177
   000263         026800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1064.2 125 IMP
   000264      1  026900         MOVE "NO " TO ERROR-TOTAL                                IF1064.2 175
   000265         027000         ELSE                                                     IF1064.2
   000266      1  027100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1064.2 125 175
   000267         027200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1064.2 171 23
   000268         027300     PERFORM WRITE-LINE.                                          IF1064.2 281
   000269         027400 END-ROUTINE-13.                                                  IF1064.2
   000270         027500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1064.2 124 IMP
   000271      1  027600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1064.2 175
   000272      1  027700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1064.2 124 175
   000273         027800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1064.2 177
   000274         027900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1064.2 171 23 281
   000275         028000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1064.2 126 IMP
   000276      1  028100          MOVE "NO " TO ERROR-TOTAL                               IF1064.2 175
   000277      1  028200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1064.2 126 175
   000278         028300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1064.2 177
   000279         028400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1064.2 171 23 281
   000280         028500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1064.2 179 23 281
   000281         028600 WRITE-LINE.                                                      IF1064.2
   000282         028700     ADD 1 TO RECORD-COUNT.                                       IF1064.2 131
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     IF RECORD-COUNT GREATER 42                                   IF1064.2 131
   000284      1  028900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1064.2 23 130
   000285      1  029000         MOVE SPACE TO DUMMY-RECORD                               IF1064.2 IMP 23
   000286      1  029100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1064.2 23
   000287      1  029200         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1064.2 133 23 297
   000288      1  029300         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1064.2 138 23 297
   000289      1  029400         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1064.2 147 23 297
   000290      1  029500         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1064.2 159 23 297
   000291      1  029600         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1064.2 111 23 297
   000292      1  029700         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1064.2 116 23 297
   000293      1  029800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1064.2 203 23 297
   000294      1  029900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1064.2 130 23
   000295      1  030000         MOVE ZERO TO RECORD-COUNT.                               IF1064.2 IMP 131
   000296         030100     PERFORM WRT-LN.                                              IF1064.2 297
   000297         030200 WRT-LN.                                                          IF1064.2
   000298         030300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1064.2 23
   000299         030400     MOVE SPACE TO DUMMY-RECORD.                                  IF1064.2 IMP 23
   000300         030500 BLANK-LINE-PRINT.                                                IF1064.2
   000301         030600     PERFORM WRT-LN.                                              IF1064.2 297
   000302         030700 FAIL-ROUTINE.                                                    IF1064.2
   000303         030800     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1064.2 58 IMP
   000304      1  030900            GO TO FAIL-ROUTINE-WRITE.                             IF1064.2 311
   000305         031000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1064.2 72 IMP 311
   000306         031100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1064.2 132 202
   000307         031200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1064.2 197
   000308         031300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1064.2 194 23 281
   000309         031400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1064.2 IMP 202
   000310         031500     GO TO  FAIL-ROUTINE-EX.                                      IF1064.2 322
   000311         031600 FAIL-ROUTINE-WRITE.                                              IF1064.2
   000312         031700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1064.2 54 22 281
   000313         031800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1064.2 132 82
   000314         031900                              CORMA-ANSI-REFERENCE.               IF1064.2 110
   000315         032000     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1064.2 88 IMP
   000316      1  032100           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1064.2 83 22 281
   000317      1  032200           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1064.2 97 22 281
   000318         032300     ELSE                                                         IF1064.2
   000319      1  032400           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1064.2 69 22 281
   000320         032500     PERFORM WRITE-LINE.                                          IF1064.2 281
   000321         032600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1064.2 IMP 82
   000322         032700 FAIL-ROUTINE-EX. EXIT.                                           IF1064.2
   000323         032800 BAIL-OUT.                                                        IF1064.2
   000324         032900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1064.2 59 IMP 326
   000325         033000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1064.2 73 IMP 332
   000326         033100 BAIL-OUT-WRITE.                                                  IF1064.2
   000327         033200     MOVE CORRECT-A TO XXCORRECT.                                 IF1064.2 73 201
   000328         033300     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1064.2 59 199
   000329         033400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1064.2 132 202
   000330         033500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1064.2 194 23 281
   000331         033600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1064.2 IMP 202
   000332         033700 BAIL-OUT-EX. EXIT.                                               IF1064.2
   000333         033800 CCVS1-EXIT.                                                      IF1064.2
   000334         033900     EXIT.                                                        IF1064.2
   000335         034100*                                                      *          IF1064.2
   000336         034200*    Intrinsic Function Tests         IF106A - COS     *          IF1064.2
   000337         034300*                                                      *          IF1064.2
   000338         034500 SECT-IF106A SECTION.                                             IF1064.2
   000339         034600 F-COS-INFO.                                                      IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034700     MOVE     "See ref. A-38 2.8" TO ANSI-REFERENCE.              IF1064.2 132
   000341         034800     MOVE     "COS Function" TO FEATURE.                          IF1064.2 44
   000342         035000 F-COS-01.                                                        IF1064.2
   000343         035100     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000344         035200     MOVE  0.999980 TO MIN-RANGE.                                 IF1064.2 38
   000345         035300     MOVE  1.00000 TO MAX-RANGE.                                  IF1064.2 39
   000346         035400 F-COS-TEST-01.                                                   IF1064.2
   000347         035500     COMPUTE WS-NUM = FUNCTION COS(0).                            IF1064.2 37 IFN
   000348         035600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000349         035700        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000350      1  035800                    PERFORM PASS                                  IF1064.2 224
   000351         035900     ELSE                                                         IF1064.2
   000352      1  036000                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000353      1  036100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000354      1  036200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000355      1  036300                    PERFORM FAIL.                                 IF1064.2 225
   000356         036400     GO TO F-COS-WRITE-01.                                        IF1064.2 360
   000357         036500 F-COS-DELETE-01.                                                 IF1064.2
   000358         036600     PERFORM  DE-LETE.                                            IF1064.2 226
   000359         036700     GO TO    F-COS-WRITE-01.                                     IF1064.2 360
   000360         036800 F-COS-WRITE-01.                                                  IF1064.2
   000361         036900     MOVE "F-COS-01" TO PAR-NAME.                                 IF1064.2 48
   000362         037000     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000363         037200 F-COS-02.                                                        IF1064.2
   000364         037300     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000365         037400     MOVE -1.00000   TO MIN-RANGE.                                IF1064.2 38
   000366         037500     MOVE -0.999980 TO MAX-RANGE.                                 IF1064.2 39
   000367         037600 F-COS-TEST-02.                                                   IF1064.2
   000368         037700     COMPUTE WS-NUM = FUNCTION COS(PI).                           IF1064.2 37 IFN 31
   000369         037800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000370         037900        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000371      1  038000                    PERFORM PASS                                  IF1064.2 224
   000372         038100     ELSE                                                         IF1064.2
   000373      1  038200                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000374      1  038300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000375      1  038400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000376      1  038500                    PERFORM FAIL.                                 IF1064.2 225
   000377         038600     GO TO F-COS-WRITE-02.                                        IF1064.2 381
   000378         038700 F-COS-DELETE-02.                                                 IF1064.2
   000379         038800     PERFORM  DE-LETE.                                            IF1064.2 226
   000380         038900     GO TO    F-COS-WRITE-02.                                     IF1064.2 381
   000381         039000 F-COS-WRITE-02.                                                  IF1064.2
   000382         039100     MOVE "F-COS-02" TO PAR-NAME.                                 IF1064.2 48
   000383         039200     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000384         039400 F-COS-03.                                                        IF1064.2
   000385         039500     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000386         039600     MOVE -1.00000 TO MIN-RANGE.                                  IF1064.2 38
   000387         039700     MOVE -0.999980 TO MAX-RANGE.                                 IF1064.2 39
   000388         039800 F-COS-TEST-03.                                                   IF1064.2
   000389         039900     COMPUTE WS-NUM = FUNCTION COS(MINUSPI).                      IF1064.2 37 IFN 32
   000390         040000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000391         040100        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000392      1  040200                    PERFORM PASS                                  IF1064.2 224
   000393         040300     ELSE                                                         IF1064.2
   000394      1  040400                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000395      1  040500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000396      1  040600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040700                    PERFORM FAIL.                                 IF1064.2 225
   000398         040800     GO TO F-COS-WRITE-03.                                        IF1064.2 402
   000399         040900 F-COS-DELETE-03.                                                 IF1064.2
   000400         041000     PERFORM  DE-LETE.                                            IF1064.2 226
   000401         041100     GO TO    F-COS-WRITE-03.                                     IF1064.2 402
   000402         041200 F-COS-WRITE-03.                                                  IF1064.2
   000403         041300     MOVE "F-COS-03" TO PAR-NAME.                                 IF1064.2 48
   000404         041400     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000405         041600 F-COS-04.                                                        IF1064.2
   000406         041700     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000407         041800     MOVE  0.999980 TO MIN-RANGE.                                 IF1064.2 38
   000408         041900     MOVE  1.000000 TO MAX-RANGE.                                 IF1064.2 39
   000409         042000 F-COS-TEST-04.                                                   IF1064.2
   000410         042100     COMPUTE WS-NUM = FUNCTION COS(0.001).                        IF1064.2 37 IFN
   000411         042200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000412         042300        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000413      1  042400                    PERFORM PASS                                  IF1064.2 224
   000414         042500     ELSE                                                         IF1064.2
   000415      1  042600                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000416      1  042700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000417      1  042800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000418      1  042900                    PERFORM FAIL.                                 IF1064.2 225
   000419         043000     GO TO F-COS-WRITE-04.                                        IF1064.2 423
   000420         043100 F-COS-DELETE-04.                                                 IF1064.2
   000421         043200     PERFORM  DE-LETE.                                            IF1064.2 226
   000422         043300     GO TO    F-COS-WRITE-04.                                     IF1064.2 423
   000423         043400 F-COS-WRITE-04.                                                  IF1064.2
   000424         043500     MOVE "F-COS-04" TO PAR-NAME.                                 IF1064.2 48
   000425         043600     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000426         043800 F-COS-05.                                                        IF1064.2
   000427         043900     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000428         044000     MOVE  0.999980 TO MIN-RANGE.                                 IF1064.2 38
   000429         044100     MOVE  1.000000 TO MAX-RANGE.                                 IF1064.2 39
   000430         044200 F-COS-TEST-05.                                                   IF1064.2
   000431         044300     COMPUTE WS-NUM = FUNCTION COS(.00009).                       IF1064.2 37 IFN
   000432         044400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000433         044500        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000434      1  044600                    PERFORM PASS                                  IF1064.2 224
   000435         044700     ELSE                                                         IF1064.2
   000436      1  044800                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000437      1  044900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000438      1  045000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000439      1  045100                    PERFORM FAIL.                                 IF1064.2 225
   000440         045200     GO TO F-COS-WRITE-05.                                        IF1064.2 444
   000441         045300 F-COS-DELETE-05.                                                 IF1064.2
   000442         045400     PERFORM  DE-LETE.                                            IF1064.2 226
   000443         045500     GO TO    F-COS-WRITE-05.                                     IF1064.2 444
   000444         045600 F-COS-WRITE-05.                                                  IF1064.2
   000445         045700     MOVE "F-COS-05" TO PAR-NAME.                                 IF1064.2 48
   000446         045800     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000447         046000 F-COS-06.                                                        IF1064.2
   000448         046100     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000449         046200     MOVE  0.99998  TO MIN-RANGE.                                 IF1064.2 38
   000450         046300     MOVE  1.000000 TO MAX-RANGE.                                 IF1064.2 39
   000451         046400 F-COS-TEST-06.                                                   IF1064.2
   000452         046500     COMPUTE WS-NUM = FUNCTION COS(A).                            IF1064.2 37 IFN 26
   000453         046600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046700        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000455      1  046800                    PERFORM PASS                                  IF1064.2 224
   000456         046900     ELSE                                                         IF1064.2
   000457      1  047000                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000458      1  047100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000459      1  047200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000460      1  047300                    PERFORM FAIL.                                 IF1064.2 225
   000461         047400     GO TO F-COS-WRITE-06.                                        IF1064.2 465
   000462         047500 F-COS-DELETE-06.                                                 IF1064.2
   000463         047600     PERFORM  DE-LETE.                                            IF1064.2 226
   000464         047700     GO TO    F-COS-WRITE-06.                                     IF1064.2 465
   000465         047800 F-COS-WRITE-06.                                                  IF1064.2
   000466         047900     MOVE "F-COS-06" TO PAR-NAME.                                 IF1064.2 48
   000467         048000     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000468         048200 F-COS-07.                                                        IF1064.2
   000469         048300     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000470         048400     MOVE  0.283656 TO MIN-RANGE.                                 IF1064.2 38
   000471         048500     MOVE  0.283668 TO MAX-RANGE.                                 IF1064.2 39
   000472         048600 F-COS-TEST-07.                                                   IF1064.2
   000473         048700     COMPUTE WS-NUM = FUNCTION COS(IND(E)).                       IF1064.2 37 IFN 35 30
   000474         048800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000475         048900        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000476      1  049000                    PERFORM PASS                                  IF1064.2 224
   000477         049100     ELSE                                                         IF1064.2
   000478      1  049200                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000479      1  049300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000480      1  049400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000481      1  049500                    PERFORM FAIL.                                 IF1064.2 225
   000482         049600     GO TO F-COS-WRITE-07.                                        IF1064.2 486
   000483         049700 F-COS-DELETE-07.                                                 IF1064.2
   000484         049800     PERFORM  DE-LETE.                                            IF1064.2 226
   000485         049900     GO TO    F-COS-WRITE-07.                                     IF1064.2 486
   000486         050000 F-COS-WRITE-07.                                                  IF1064.2
   000487         050100     MOVE "F-COS-07" TO PAR-NAME.                                 IF1064.2 48
   000488         050200     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000489         050400 F-COS-08.                                                        IF1064.2
   000490         050500     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000491         050600     MOVE  0.753887 TO MIN-RANGE.                                 IF1064.2 38
   000492         050700     MOVE  0.753917 TO MAX-RANGE.                                 IF1064.2 39
   000493         050800 F-COS-TEST-08.                                                   IF1064.2
   000494         050900     COMPUTE WS-NUM = FUNCTION COS(IND(5)).                       IF1064.2 37 IFN 35
   000495         051000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000496         051100        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000497      1  051200                    PERFORM PASS                                  IF1064.2 224
   000498         051300     ELSE                                                         IF1064.2
   000499      1  051400                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000500      1  051500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000501      1  051600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000502      1  051700                    PERFORM FAIL.                                 IF1064.2 225
   000503         051800     GO TO F-COS-WRITE-08.                                        IF1064.2 507
   000504         051900 F-COS-DELETE-08.                                                 IF1064.2
   000505         052000     PERFORM  DE-LETE.                                            IF1064.2 226
   000506         052100     GO TO    F-COS-WRITE-08.                                     IF1064.2 507
   000507         052200 F-COS-WRITE-08.                                                  IF1064.2
   000508         052300     MOVE "F-COS-08" TO PAR-NAME.                                 IF1064.2 48
   000509         052400     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000510         052600 F-COS-09.                                                        IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052700     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000512         052800     MOVE  0.499980 TO MIN-RANGE.                                 IF1064.2 38
   000513         052900     MOVE  0.500020 TO MAX-RANGE.                                 IF1064.2 39
   000514         053000 F-COS-TEST-09.                                                   IF1064.2
   000515         053100     COMPUTE WS-NUM = FUNCTION COS(PI / 3).                       IF1064.2 37 IFN 31
   000516         053200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000517         053300        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000518      1  053400                    PERFORM PASS                                  IF1064.2 224
   000519         053500     ELSE                                                         IF1064.2
   000520      1  053600                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000521      1  053700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000522      1  053800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000523      1  053900                    PERFORM FAIL.                                 IF1064.2 225
   000524         054000     GO TO F-COS-WRITE-09.                                        IF1064.2 528
   000525         054100 F-COS-DELETE-09.                                                 IF1064.2
   000526         054200     PERFORM  DE-LETE.                                            IF1064.2 226
   000527         054300     GO TO    F-COS-WRITE-09.                                     IF1064.2 528
   000528         054400 F-COS-WRITE-09.                                                  IF1064.2
   000529         054500     MOVE "F-COS-09" TO PAR-NAME.                                 IF1064.2 48
   000530         054600     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000531         054800 F-COS-10.                                                        IF1064.2
   000532         054900     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000533         055000     MOVE -0.000040 TO MIN-RANGE.                                 IF1064.2 38
   000534         055100     MOVE  0.000040 TO MAX-RANGE.                                 IF1064.2 39
   000535         055200 F-COS-TEST-10.                                                   IF1064.2
   000536         055300     COMPUTE WS-NUM = FUNCTION COS(PI / 2).                       IF1064.2 37 IFN 31
   000537         055400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000538         055500        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000539      1  055600                    PERFORM PASS                                  IF1064.2 224
   000540         055700     ELSE                                                         IF1064.2
   000541      1  055800                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000542      1  055900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000543      1  056000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000544      1  056100                    PERFORM FAIL.                                 IF1064.2 225
   000545         056200     GO TO F-COS-WRITE-10.                                        IF1064.2 549
   000546         056300 F-COS-DELETE-10.                                                 IF1064.2
   000547         056400     PERFORM  DE-LETE.                                            IF1064.2 226
   000548         056500     GO TO    F-COS-WRITE-10.                                     IF1064.2 549
   000549         056600 F-COS-WRITE-10.                                                  IF1064.2
   000550         056700     MOVE "F-COS-10" TO PAR-NAME.                                 IF1064.2 48
   000551         056800     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000552         057000 F-COS-11.                                                        IF1064.2
   000553         057100     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000554         057200     MOVE -0.000040 TO MIN-RANGE.                                 IF1064.2 38
   000555         057300     MOVE  0.000040 TO MAX-RANGE.                                 IF1064.2 39
   000556         057400 F-COS-TEST-11.                                                   IF1064.2
   000557         057500     COMPUTE WS-NUM = FUNCTION COS((3 * PI) / 2).                 IF1064.2 37 IFN 31
   000558         057600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000559         057700        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000560      1  057800                    PERFORM PASS                                  IF1064.2 224
   000561         057900     ELSE                                                         IF1064.2
   000562      1  058000                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000563      1  058100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000564      1  058200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000565      1  058300                    PERFORM FAIL.                                 IF1064.2 225
   000566         058400     GO TO F-COS-WRITE-11.                                        IF1064.2 570
   000567         058500 F-COS-DELETE-11.                                                 IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058600     PERFORM  DE-LETE.                                            IF1064.2 226
   000569         058700     GO TO    F-COS-WRITE-11.                                     IF1064.2 570
   000570         058800 F-COS-WRITE-11.                                                  IF1064.2
   000571         058900     MOVE "F-COS-11" TO PAR-NAME.                                 IF1064.2 48
   000572         059000     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000573         059200 F-COS-12.                                                        IF1064.2
   000574         059300     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000575         059400     MOVE  0.499980 TO MIN-RANGE.                                 IF1064.2 38
   000576         059500     MOVE  0.500002 TO MAX-RANGE.                                 IF1064.2 39
   000577         059600 F-COS-TEST-12.                                                   IF1064.2
   000578         059700     COMPUTE WS-NUM = FUNCTION COS(MINUSPI / 3).                  IF1064.2 37 IFN 32
   000579         059800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000580         059900        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000581      1  060000                    PERFORM PASS                                  IF1064.2 224
   000582         060100     ELSE                                                         IF1064.2
   000583      1  060200                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000584      1  060300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000585      1  060400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000586      1  060500                    PERFORM FAIL.                                 IF1064.2 225
   000587         060600     GO TO F-COS-WRITE-12.                                        IF1064.2 591
   000588         060700 F-COS-DELETE-12.                                                 IF1064.2
   000589         060800     PERFORM  DE-LETE.                                            IF1064.2 226
   000590         060900     GO TO    F-COS-WRITE-12.                                     IF1064.2 591
   000591         061000 F-COS-WRITE-12.                                                  IF1064.2
   000592         061100     MOVE "F-COS-12" TO PAR-NAME.                                 IF1064.2 48
   000593         061200     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000594         061400 F-COS-13.                                                        IF1064.2
   000595         061500     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000596         061600     MOVE -0.000040 TO MIN-RANGE.                                 IF1064.2 38
   000597         061700     MOVE  0.000040 TO MAX-RANGE.                                 IF1064.2 39
   000598         061800 F-COS-TEST-13.                                                   IF1064.2
   000599         061900     COMPUTE WS-NUM = FUNCTION COS(MINUSPI / 2).                  IF1064.2 37 IFN 32
   000600         062000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000601         062100        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000602      1  062200                    PERFORM PASS                                  IF1064.2 224
   000603         062300     ELSE                                                         IF1064.2
   000604      1  062400                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000605      1  062500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000606      1  062600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000607      1  062700                    PERFORM FAIL.                                 IF1064.2 225
   000608         062800     GO TO F-COS-WRITE-13.                                        IF1064.2 612
   000609         062900 F-COS-DELETE-13.                                                 IF1064.2
   000610         063000     PERFORM  DE-LETE.                                            IF1064.2 226
   000611         063100     GO TO    F-COS-WRITE-13.                                     IF1064.2 612
   000612         063200 F-COS-WRITE-13.                                                  IF1064.2
   000613         063300     MOVE "F-COS-13" TO PAR-NAME.                                 IF1064.2 48
   000614         063400     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000615         063600 F-COS-14.                                                        IF1064.2
   000616         063700     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000617         063800     MOVE -0.000040 TO MIN-RANGE.                                 IF1064.2 38
   000618         063900     MOVE  0.000040 TO MAX-RANGE.                                 IF1064.2 39
   000619         064000 F-COS-TEST-14.                                                   IF1064.2
   000620         064100     COMPUTE WS-NUM = FUNCTION COS((3 * MINUSPI) / 2).            IF1064.2 37 IFN 32
   000621         064200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000622         064300        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000623      1  064400                    PERFORM PASS                                  IF1064.2 224
   000624         064500     ELSE                                                         IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  064600                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000626      1  064700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000627      1  064800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000628      1  064900                    PERFORM FAIL.                                 IF1064.2 225
   000629         065000     GO TO F-COS-WRITE-14.                                        IF1064.2 633
   000630         065100 F-COS-DELETE-14.                                                 IF1064.2
   000631         065200     PERFORM  DE-LETE.                                            IF1064.2 226
   000632         065300     GO TO    F-COS-WRITE-14.                                     IF1064.2 633
   000633         065400 F-COS-WRITE-14.                                                  IF1064.2
   000634         065500     MOVE "F-COS-14" TO PAR-NAME.                                 IF1064.2 48
   000635         065600     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000636         065800 F-COS-16.                                                        IF1064.2
   000637         065900     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000638         066000     MOVE  0.499113 TO MIN-RANGE.                                 IF1064.2 38
   000639         066100     MOVE  0.499153 TO MAX-RANGE.                                 IF1064.2 39
   000640         066200 F-COS-TEST-16.                                                   IF1064.2
   000641         066300     COMPUTE WS-NUM = FUNCTION COS((PI / 3) + 0.001).             IF1064.2 37 IFN 31
   000642         066400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000643         066500        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000644      1  066600                    PERFORM PASS                                  IF1064.2 224
   000645         066700     ELSE                                                         IF1064.2
   000646      1  066800                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000647      1  066900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000648      1  067000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000649      1  067100                    PERFORM FAIL.                                 IF1064.2 225
   000650         067200     GO TO F-COS-WRITE-16.                                        IF1064.2 654
   000651         067300 F-COS-DELETE-16.                                                 IF1064.2
   000652         067400     PERFORM  DE-LETE.                                            IF1064.2 226
   000653         067500     GO TO    F-COS-WRITE-16.                                     IF1064.2 654
   000654         067600 F-COS-WRITE-16.                                                  IF1064.2
   000655         067700     MOVE "F-COS-16" TO PAR-NAME.                                 IF1064.2 48
   000656         067800     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000657         068000 F-COS-18.                                                        IF1064.2
   000658         068100     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000659         068200     MOVE  0.999350 TO MIN-RANGE.                                 IF1064.2 38
   000660         068300     MOVE  0.999430 TO MAX-RANGE.                                 IF1064.2 39
   000661         068400 F-COS-TEST-18.                                                   IF1064.2
   000662         068500     COMPUTE WS-NUM = FUNCTION COS(PI * (4 - 2) / 180).           IF1064.2 37 IFN 31
   000663         068600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000664         068700        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000665      1  068800                    PERFORM PASS                                  IF1064.2 224
   000666         068900     ELSE                                                         IF1064.2
   000667      1  069000                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000668      1  069100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000669      1  069200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000670      1  069300                    PERFORM FAIL.                                 IF1064.2 225
   000671         069400     GO TO F-COS-WRITE-18.                                        IF1064.2 675
   000672         069500 F-COS-DELETE-18.                                                 IF1064.2
   000673         069600     PERFORM  DE-LETE.                                            IF1064.2 226
   000674         069700     GO TO    F-COS-WRITE-18.                                     IF1064.2 675
   000675         069800 F-COS-WRITE-18.                                                  IF1064.2
   000676         069900     MOVE "F-COS-18" TO PAR-NAME.                                 IF1064.2 48
   000677         070000     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000678         070200 F-COS-19.                                                        IF1064.2
   000679         070300     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000680         070400     MOVE  0.017451 TO MIN-RANGE.                                 IF1064.2 38
   000681         070500     MOVE  0.017453 TO MAX-RANGE.                                 IF1064.2 39
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         070600 F-COS-TEST-19.                                                   IF1064.2
   000683         070700     COMPUTE WS-NUM = FUNCTION COS((PI / 2) - (PI / 180)).        IF1064.2 37 IFN 31 31
   000684         070800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000685         070900        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000686      1  071000                    PERFORM PASS                                  IF1064.2 224
   000687         071100     ELSE                                                         IF1064.2
   000688      1  071200                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000689      1  071300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000690      1  071400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000691      1  071500                    PERFORM FAIL.                                 IF1064.2 225
   000692         071600     GO TO F-COS-WRITE-19.                                        IF1064.2 696
   000693         071700 F-COS-DELETE-19.                                                 IF1064.2
   000694         071800     PERFORM  DE-LETE.                                            IF1064.2 226
   000695         071900     GO TO    F-COS-WRITE-19.                                     IF1064.2 696
   000696         072000 F-COS-WRITE-19.                                                  IF1064.2
   000697         072100     MOVE "F-COS-19" TO PAR-NAME.                                 IF1064.2 48
   000698         072200     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000699         072400 F-COS-20.                                                        IF1064.2
   000700         072500     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000701         072600     MOVE  0.515017  TO MIN-RANGE.                                IF1064.2 38
   000702         072700     MOVE  0.515059 TO MAX-RANGE.                                 IF1064.2 39
   000703         072800 F-COS-TEST-20.                                                   IF1064.2
   000704         072900     COMPUTE WS-NUM = FUNCTION COS((PI / 3) - (PI / 180)).        IF1064.2 37 IFN 31 31
   000705         073000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000706         073100        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000707      1  073200                    PERFORM PASS                                  IF1064.2 224
   000708         073300     ELSE                                                         IF1064.2
   000709      1  073400                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000710      1  073500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000711      1  073600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000712      1  073700                    PERFORM FAIL.                                 IF1064.2 225
   000713         073800     GO TO F-COS-WRITE-20.                                        IF1064.2 717
   000714         073900 F-COS-DELETE-20.                                                 IF1064.2
   000715         074000     PERFORM  DE-LETE.                                            IF1064.2 226
   000716         074100     GO TO    F-COS-WRITE-20.                                     IF1064.2 717
   000717         074200 F-COS-WRITE-20.                                                  IF1064.2
   000718         074300     MOVE "F-COS-20" TO PAR-NAME.                                 IF1064.2 48
   000719         074400     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000720         074600 F-COS-21.                                                        IF1064.2
   000721         074700     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000722         074800     MOVE -0.999887 TO MIN-RANGE.                                 IF1064.2 38
   000723         074900     MOVE -0.999807 TO MAX-RANGE.                                 IF1064.2 39
   000724         075000 F-COS-TEST-21.                                                   IF1064.2
   000725         075100     COMPUTE WS-NUM = FUNCTION COS(PI + (PI / 180)).              IF1064.2 37 IFN 31 31
   000726         075200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000727         075300        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000728      1  075400                    PERFORM PASS                                  IF1064.2 224
   000729         075500     ELSE                                                         IF1064.2
   000730      1  075600                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000731      1  075700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000732      1  075800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000733      1  075900                    PERFORM FAIL.                                 IF1064.2 225
   000734         076000     GO TO F-COS-WRITE-21.                                        IF1064.2 738
   000735         076100 F-COS-DELETE-21.                                                 IF1064.2
   000736         076200     PERFORM  DE-LETE.                                            IF1064.2 226
   000737         076300     GO TO    F-COS-WRITE-21.                                     IF1064.2 738
   000738         076400 F-COS-WRITE-21.                                                  IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         076500     MOVE "F-COS-21" TO PAR-NAME.                                 IF1064.2 48
   000740         076600     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000741         076800 F-COS-22.                                                        IF1064.2
   000742         076900     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000743         077000     MOVE  0.034898 TO MIN-RANGE.                                 IF1064.2 38
   000744         077100     MOVE  0.034900 TO MAX-RANGE.                                 IF1064.2 39
   000745         077200 F-COS-TEST-22.                                                   IF1064.2
   000746         077300     COMPUTE WS-NUM = FUNCTION COS(( PI * 272) / 180).            IF1064.2 37 IFN 31
   000747         077400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000748         077500        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000749      1  077600                    PERFORM PASS                                  IF1064.2 224
   000750         077700     ELSE                                                         IF1064.2
   000751      1  077800                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000752      1  077900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000753      1  078000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000754      1  078100                    PERFORM FAIL.                                 IF1064.2 225
   000755         078200     GO TO F-COS-WRITE-22.                                        IF1064.2 759
   000756         078300 F-COS-DELETE-22.                                                 IF1064.2
   000757         078400     PERFORM  DE-LETE.                                            IF1064.2 226
   000758         078500     GO TO    F-COS-WRITE-22.                                     IF1064.2 759
   000759         078600 F-COS-WRITE-22.                                                  IF1064.2
   000760         078700     MOVE "F-COS-22" TO PAR-NAME.                                 IF1064.2 48
   000761         078800     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000762         079000 F-COS-23.                                                        IF1064.2
   000763         079100     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000764         079200     MOVE -0.416163  TO MIN-RANGE.                                IF1064.2 38
   000765         079300     MOVE -0.416129 TO MAX-RANGE.                                 IF1064.2 39
   000766         079400 F-COS-TEST-23.                                                   IF1064.2
   000767         079500     COMPUTE WS-NUM = FUNCTION COS(4 / 2).                        IF1064.2 37 IFN
   000768         079600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000769         079700        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000770      1  079800                    PERFORM PASS                                  IF1064.2 224
   000771         079900     ELSE                                                         IF1064.2
   000772      1  080000                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000773      1  080100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000774      1  080200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000775      1  080300                    PERFORM FAIL.                                 IF1064.2 225
   000776         080400     GO TO F-COS-WRITE-23.                                        IF1064.2 780
   000777         080500 F-COS-DELETE-23.                                                 IF1064.2
   000778         080600     PERFORM  DE-LETE.                                            IF1064.2 226
   000779         080700     GO TO    F-COS-WRITE-23.                                     IF1064.2 780
   000780         080800 F-COS-WRITE-23.                                                  IF1064.2
   000781         080900     MOVE "F-COS-23" TO PAR-NAME.                                 IF1064.2 48
   000782         081000     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000783         081200 F-COS-24.                                                        IF1064.2
   000784         081300     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000785         081400     MOVE  0.070734 TO MIN-RANGE.                                 IF1064.2 38
   000786         081500     MOVE  0.070740 TO MAX-RANGE.                                 IF1064.2 39
   000787         081600 F-COS-TEST-24.                                                   IF1064.2
   000788         081700     COMPUTE WS-NUM = FUNCTION COS(3 / 2).                        IF1064.2 37 IFN
   000789         081800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000790         081900        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000791      1  082000                    PERFORM PASS                                  IF1064.2 224
   000792         082100     ELSE                                                         IF1064.2
   000793      1  082200                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000794      1  082300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000795      1  082400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796      1  082500                    PERFORM FAIL.                                 IF1064.2 225
   000797         082600     GO TO F-COS-WRITE-24.                                        IF1064.2 801
   000798         082700 F-COS-DELETE-24.                                                 IF1064.2
   000799         082800     PERFORM  DE-LETE.                                            IF1064.2 226
   000800         082900     GO TO    F-COS-WRITE-24.                                     IF1064.2 801
   000801         083000 F-COS-WRITE-24.                                                  IF1064.2
   000802         083100     MOVE "F-COS-24" TO PAR-NAME.                                 IF1064.2 48
   000803         083200     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000804         083400 F-COS-25.                                                        IF1064.2
   000805         083500     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000806         083600     MOVE -1.000000 TO MIN-RANGE.                                 IF1064.2 38
   000807         083700     MOVE -0.999960 TO MAX-RANGE.                                 IF1064.2 39
   000808         083800 F-COS-TEST-25.                                                   IF1064.2
   000809         083900     COMPUTE WS-NUM = FUNCTION COS(PI - A).                       IF1064.2 37 IFN 31 26
   000810         084000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000811         084100        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000812      1  084200                    PERFORM PASS                                  IF1064.2 224
   000813         084300     ELSE                                                         IF1064.2
   000814      1  084400                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000815      1  084500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000816      1  084600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000817      1  084700                    PERFORM FAIL.                                 IF1064.2 225
   000818         084800     GO TO F-COS-WRITE-25.                                        IF1064.2 822
   000819         084900 F-COS-DELETE-25.                                                 IF1064.2
   000820         085000     PERFORM  DE-LETE.                                            IF1064.2 226
   000821         085100     GO TO    F-COS-WRITE-25.                                     IF1064.2 822
   000822         085200 F-COS-WRITE-25.                                                  IF1064.2
   000823         085300     MOVE "F-COS-25" TO PAR-NAME.                                 IF1064.2 48
   000824         085400     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000825         085600 F-COS-26.                                                        IF1064.2
   000826         085700     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000827         085800     MOVE -0.839105 TO MIN-RANGE.                                 IF1064.2 38
   000828         085900     MOVE -0.839037 TO MAX-RANGE.                                 IF1064.2 39
   000829         086000 F-COS-TEST-26.                                                   IF1064.2
   000830         086100     COMPUTE WS-NUM = FUNCTION COS(D / 100).                      IF1064.2 37 IFN 29
   000831         086200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000832         086300        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000833      1  086400                    PERFORM PASS                                  IF1064.2 224
   000834         086500     ELSE                                                         IF1064.2
   000835      1  086600                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000836      1  086700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000837      1  086800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000838      1  086900                    PERFORM FAIL.                                 IF1064.2 225
   000839         087000     GO TO F-COS-WRITE-26.                                        IF1064.2 843
   000840         087100 F-COS-DELETE-26.                                                 IF1064.2
   000841         087200     PERFORM  DE-LETE.                                            IF1064.2 226
   000842         087300     GO TO    F-COS-WRITE-26.                                     IF1064.2 843
   000843         087400 F-COS-WRITE-26.                                                  IF1064.2
   000844         087500     MOVE "F-COS-26" TO PAR-NAME.                                 IF1064.2 48
   000845         087600     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000846         087800 F-COS-27.                                                        IF1064.2
   000847         087900     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000848         088000     MOVE  0.999807  TO MIN-RANGE.                                IF1064.2 38
   000849         088100     MOVE  0.999887 TO MAX-RANGE.                                 IF1064.2 39
   000850         088200 F-COS-TEST-27.                                                   IF1064.2
   000851         088300     COMPUTE WS-NUM = FUNCTION COS(PI / 180).                     IF1064.2 37 IFN 31
   000852         088400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         088500        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000854      1  088600                    PERFORM PASS                                  IF1064.2 224
   000855         088700     ELSE                                                         IF1064.2
   000856      1  088800                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000857      1  088900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000858      1  089000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000859      1  089100                    PERFORM FAIL.                                 IF1064.2 225
   000860         089200     GO TO F-COS-WRITE-27.                                        IF1064.2 864
   000861         089300 F-COS-DELETE-27.                                                 IF1064.2
   000862         089400     PERFORM  DE-LETE.                                            IF1064.2 226
   000863         089500     GO TO    F-COS-WRITE-27.                                     IF1064.2 864
   000864         089600 F-COS-WRITE-27.                                                  IF1064.2
   000865         089700     MOVE "F-COS-27" TO PAR-NAME.                                 IF1064.2 48
   000866         089800     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000867         090000 F-COS-28.                                                        IF1064.2
   000868         090100     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000869         090200     MOVE -1.000000 TO MIN-RANGE.                                 IF1064.2 38
   000870         090300     MOVE -0.999960 TO MAX-RANGE.                                 IF1064.2 39
   000871         090400 F-COS-TEST-28.                                                   IF1064.2
   000872         090500     COMPUTE WS-NUM = FUNCTION COS(PI - 0.001).                   IF1064.2 37 IFN 31
   000873         090600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000874         090700        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000875      1  090800                    PERFORM PASS                                  IF1064.2 224
   000876         090900     ELSE                                                         IF1064.2
   000877      1  091000                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000878      1  091100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000879      1  091200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000880      1  091300                    PERFORM FAIL.                                 IF1064.2 225
   000881         091400     GO TO F-COS-WRITE-28.                                        IF1064.2 885
   000882         091500 F-COS-DELETE-28.                                                 IF1064.2
   000883         091600     PERFORM  DE-LETE.                                            IF1064.2 226
   000884         091700     GO TO    F-COS-WRITE-28.                                     IF1064.2 885
   000885         091800 F-COS-WRITE-28.                                                  IF1064.2
   000886         091900     MOVE "F-COS-28" TO PAR-NAME.                                 IF1064.2 48
   000887         092000     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000888         092200 F-COS-29.                                                        IF1064.2
   000889         092300     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000890         092400     MOVE -0.000040 TO MIN-RANGE.                                 IF1064.2 38
   000891         092500     MOVE  0.000040 TO MAX-RANGE.                                 IF1064.2 39
   000892         092600 F-COS-TEST-29.                                                   IF1064.2
   000893         092700     COMPUTE WS-NUM = FUNCTION COS(PI) + 1.                       IF1064.2 37 IFN 31
   000894         092800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000895         092900        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000896      1  093000                    PERFORM PASS                                  IF1064.2 224
   000897         093100     ELSE                                                         IF1064.2
   000898      1  093200                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000899      1  093300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000900      1  093400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000901      1  093500                    PERFORM FAIL.                                 IF1064.2 225
   000902         093600     GO TO F-COS-WRITE-29.                                        IF1064.2 906
   000903         093700 F-COS-DELETE-29.                                                 IF1064.2
   000904         093800     PERFORM  DE-LETE.                                            IF1064.2 226
   000905         093900     GO TO    F-COS-WRITE-29.                                     IF1064.2 906
   000906         094000 F-COS-WRITE-29.                                                  IF1064.2
   000907         094100     MOVE "F-COS-29" TO PAR-NAME.                                 IF1064.2 48
   000908         094200     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000909         094400 F-COS-30.                                                        IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         094500     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000911         094600     MOVE 0.914616 TO MIN-RANGE.                                  IF1064.2 38
   000912         094700     MOVE 0.914690 TO MAX-RANGE.                                  IF1064.2 39
   000913         094800 F-COS-TEST-30.                                                   IF1064.2
   000914         094900     COMPUTE WS-NUM = FUNCTION COS(FUNCTION COS(2)).              IF1064.2 37 IFN IFN
   000915         095000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000916         095100        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000917      1  095200                    PERFORM PASS                                  IF1064.2 224
   000918         095300     ELSE                                                         IF1064.2
   000919      1  095400                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000920      1  095500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000921      1  095600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000922      1  095700                    PERFORM FAIL.                                 IF1064.2 225
   000923         095800     GO TO F-COS-WRITE-30.                                        IF1064.2 927
   000924         095900 F-COS-DELETE-30.                                                 IF1064.2
   000925         096000     PERFORM  DE-LETE.                                            IF1064.2 226
   000926         096100     GO TO    F-COS-WRITE-30.                                     IF1064.2 927
   000927         096200 F-COS-WRITE-30.                                                  IF1064.2
   000928         096300     MOVE "F-COS-30" TO PAR-NAME.                                 IF1064.2 48
   000929         096400     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000930         096600 F-COS-31.                                                        IF1064.2
   000931         096700     MOVE ZERO TO WS-NUM.                                         IF1064.2 IMP 37
   000932         096800     MOVE -2.00008 TO MIN-RANGE.                                  IF1064.2 38
   000933         096900     MOVE -1.99992 TO MAX-RANGE.                                  IF1064.2 39
   000934         097000 F-COS-TEST-31.                                                   IF1064.2
   000935         097100     COMPUTE WS-NUM = FUNCTION COS(PI) +                          IF1064.2 37 IFN 31
   000936         097200                              FUNCTION COS(PI).                   IF1064.2 IFN 31
   000937         097300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1064.2 37 38
   000938         097400        (WS-NUM <= MAX-RANGE) THEN                                IF1064.2 37 39
   000939      1  097500                    PERFORM PASS                                  IF1064.2 224
   000940         097600     ELSE                                                         IF1064.2
   000941      1  097700                    MOVE WS-NUM TO COMPUTED-N                     IF1064.2 37 60
   000942      1  097800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1064.2 38 88
   000943      1  097900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1064.2 39 102
   000944      1  098000                    PERFORM FAIL.                                 IF1064.2 225
   000945         098100     GO TO F-COS-WRITE-31.                                        IF1064.2 949
   000946         098200 F-COS-DELETE-31.                                                 IF1064.2
   000947         098300     PERFORM  DE-LETE.                                            IF1064.2 226
   000948         098400     GO TO    F-COS-WRITE-31.                                     IF1064.2 949
   000949         098500 F-COS-WRITE-31.                                                  IF1064.2
   000950         098600     MOVE "F-COS-31" TO PAR-NAME.                                 IF1064.2 48
   000951         098700     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000952         098900 F-COS-32.                                                        IF1064.2
   000953         099000     PERFORM F-COS-TEST-32                                        IF1064.2 957
   000954         099100       UNTIL FUNCTION COS(ARG1) < 0.                              IF1064.2 IFN 33
   000955         099200     PERFORM PASS.                                                IF1064.2 224
   000956         099300     GO TO F-COS-WRITE-32.                                        IF1064.2 962
   000957         099400 F-COS-TEST-32.                                                   IF1064.2
   000958         099500     COMPUTE ARG1 = ARG1 - 0.25.                                  IF1064.2 33 33
   000959         099600 F-COS-DELETE-32.                                                 IF1064.2
   000960         099700     PERFORM  DE-LETE.                                            IF1064.2 226
   000961         099800     GO TO    F-COS-WRITE-32.                                     IF1064.2 962
   000962         099900 F-COS-WRITE-32.                                                  IF1064.2
   000963         100000     MOVE "F-COS-32" TO PAR-NAME.                                 IF1064.2 48
   000964         100100     PERFORM  PRINT-DETAIL.                                       IF1064.2 228
   000965         100300 CCVS-EXIT SECTION.                                               IF1064.2
   000966         100400 CCVS-999999.                                                     IF1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         100500     GO TO CLOSE-FILES.                                           IF1064.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    21
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  452 809
      132   ANSI-REFERENCE . . . . . . . .  306 313 329 M340
       33   ARG1 . . . . . . . . . . . . .  954 M958 958
       34   ARR
       27   B
       28   C
      111   CCVS-C-1 . . . . . . . . . . .  246 291
      116   CCVS-C-2 . . . . . . . . . . .  247 292
      166   CCVS-E-1 . . . . . . . . . . .  252
      171   CCVS-E-2 . . . . . . . . . . .  260 267 274 279
      174   CCVS-E-2-2 . . . . . . . . . .  M259
      179   CCVS-E-3 . . . . . . . . . . .  280
      188   CCVS-E-4 . . . . . . . . . . .  259
      189   CCVS-E-4-1 . . . . . . . . . .  M257
      191   CCVS-E-4-2 . . . . . . . . . .  M258
      133   CCVS-H-1 . . . . . . . . . . .  241 287
      138   CCVS-H-2A. . . . . . . . . . .  242 288
      147   CCVS-H-2B. . . . . . . . . . .  243 289
      159   CCVS-H-3 . . . . . . . . . . .  244 290
      209   CCVS-PGM-ID. . . . . . . . . .  215 215
       65   CM-18V0
       59   COMPUTED-A . . . . . . . . . .  60 62 63 64 65 324 328
       60   COMPUTED-N . . . . . . . . . .  M352 M373 M394 M415 M436 M457 M478 M499 M520 M541 M562 M583 M604 M625 M646 M667
                                            M688 M709 M730 M751 M772 M793 M814 M835 M856 M877 M898 M919 M941
       58   COMPUTED-X . . . . . . . . . .  M236 303
       62   COMPUTED-0V18
       64   COMPUTED-14V4
       66   COMPUTED-18V0
       63   COMPUTED-4V14
       82   COR-ANSI-REFERENCE . . . . . .  M313 M321
      110   CORMA-ANSI-REFERENCE . . . . .  M314
       73   CORRECT-A. . . . . . . . . . .  74 75 76 77 78 325 327
      102   CORRECT-MAX. . . . . . . . . .  M354 M375 M396 M417 M438 M459 M480 M501 M522 M543 M564 M585 M606 M627 M648 M669
                                            M690 M711 M732 M753 M774 M795 M816 M837 M858 M879 M900 M921 M943
       88   CORRECT-MIN. . . . . . . . . .  315 M353 M374 M395 M416 M437 M458 M479 M500 M521 M542 M563 M584 M605 M626 M647
                                            M668 M689 M710 M731 M752 M773 M794 M815 M836 M857 M878 M899 M920 M942
       74   CORRECT-N
       72   CORRECT-X. . . . . . . . . . .  M237 305
       75   CORRECT-0V18
       77   CORRECT-14V4
       79   CORRECT-18V0
       76   CORRECT-4V14
      101   CORRECTMA-A. . . . . . . . . .  102 103 104 105 106
      100   CORRECTMA-X
      103   CORRECTMA-0V18
      105   CORRECTMA-14V4
      107   CORRECTMA-18V0
      104   CORRECTMA-4V14
       87   CORRECTMI-A. . . . . . . . . .  88 89 90 91 92
       86   CORRECTMI-X
       89   CORRECTMI-0V18
       91   CORRECTMI-14V4
       93   CORRECTMI-18V0
       90   CORRECTMI-4V14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    22
0 Defined   Cross-reference of data names   References

0      78   CR-18V0
       92   CR-18V0
      106   CR-18V0
       29   D. . . . . . . . . . . . . . .  830
      124   DELETE-COUNTER . . . . . . . .  M226 255 270 272
       51   DOTVALUE . . . . . . . . . . .  M231
      130   DUMMY-HOLD . . . . . . . . . .  M284 294
       23   DUMMY-RECORD . . . . . . . . .  M241 M242 M243 M244 M246 M247 M248 M250 M252 M260 M267 M274 M279 M280 284 M285
                                            286 M287 M288 M289 M290 M291 M292 M293 M294 298 M299 M308 M330
       30   E. . . . . . . . . . . . . . .  473
      177   ENDER-DESC . . . . . . . . . .  M262 M273 M278
      125   ERROR-COUNTER. . . . . . . . .  M225 254 263 266
      129   ERROR-HOLD . . . . . . . . . .  M254 M255 M255 M256 258
      175   ERROR-TOTAL. . . . . . . . . .  M264 M266 M271 M272 M276 M277
       44   FEATURE. . . . . . . . . . . .  M341
      203   HYPHEN-LINE. . . . . . . . . .  248 250 293
      169   ID-AGAIN . . . . . . . . . . .  M215
       35   IND. . . . . . . . . . . . . .  473 494
      202   INF-ANSI-REFERENCE . . . . . .  M306 M309 M329 M331
      197   INFO-TEXT. . . . . . . . . . .  M307
      126   INSPECT-COUNTER. . . . . . . .  M223 254 275 277
       39   MAX-RANGE. . . . . . . . . . .  M345 349 354 M366 370 375 M387 391 396 M408 412 417 M429 433 438 M450 454 459
                                            M471 475 480 M492 496 501 M513 517 522 M534 538 543 M555 559 564 M576 580 585
                                            M597 601 606 M618 622 627 M639 643 648 M660 664 669 M681 685 690 M702 706 711
                                            M723 727 732 M744 748 753 M765 769 774 M786 790 795 M807 811 816 M828 832 837
                                            M849 853 858 M870 874 879 M891 895 900 M912 916 921 M933 938 943
       38   MIN-RANGE. . . . . . . . . . .  M344 348 353 M365 369 374 M386 390 395 M407 411 416 M428 432 437 M449 453 458
                                            M470 474 479 M491 495 500 M512 516 521 M533 537 542 M554 558 563 M575 579 584
                                            M596 600 605 M617 621 626 M638 642 647 M659 663 668 M680 684 689 M701 705 710
                                            M722 726 731 M743 747 752 M764 768 773 M785 789 794 M806 810 815 M827 831 836
                                            M848 852 857 M869 873 878 M890 894 899 M911 915 920 M932 937 942
       32   MINUSPI. . . . . . . . . . . .  389 578 599 620
       46   P-OR-F . . . . . . . . . . . .  M223 M224 M225 M226 233 M236
       48   PAR-NAME . . . . . . . . . . .  M238 M361 M382 M403 M424 M445 M466 M487 M508 M529 M550 M571 M592 M613 M634 M655
                                            M676 M697 M718 M739 M760 M781 M802 M823 M844 M865 M886 M907 M928 M950 M963
       50   PARDOT-X . . . . . . . . . . .  M230
      127   PASS-COUNTER . . . . . . . . .  M224 256 257
       31   PI . . . . . . . . . . . . . .  368 515 536 557 641 662 683 683 704 704 725 725 746 809 851 872 893 935 936
       21   PRINT-FILE . . . . . . . . . .  17 214 220
       22   PRINT-REC. . . . . . . . . . .  M232 M312 M316 M317 M319
       53   RE-MARK. . . . . . . . . . . .  M227 M239
      123   REC-CT . . . . . . . . . . . .  229 231 238
      122   REC-SKL-SUB
      131   RECORD-COUNT . . . . . . . . .  M282 283 M295
       36   TEMP
       54   TEST-COMPUTED. . . . . . . . .  312
       69   TEST-CORRECT . . . . . . . . .  319
       97   TEST-CORRECT-MAX . . . . . . .  317
       83   TEST-CORRECT-MIN . . . . . . .  316
      150   TEST-ID. . . . . . . . . . . .  M215
       42   TEST-RESULTS . . . . . . . . .  M216 232
      128   TOTAL-ERROR
       37   WS-NUM . . . . . . . . . . . .  M343 M347 348 349 352 M364 M368 369 370 373 M385 M389 390 391 394 M406 M410 411
                                            412 415 M427 M431 432 433 436 M448 M452 453 454 457 M469 M473 474 475 478 M490
                                            M494 495 496 499 M511 M515 516 517 520 M532 M536 537 538 541 M553 M557 558 559
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    23
0 Defined   Cross-reference of data names   References

0                                           562 M574 M578 579 580 583 M595 M599 600 601 604 M616 M620 621 622 625 M637 M641
                                            642 643 646 M658 M662 663 664 667 M679 M683 684 685 688 M700 M704 705 706 709
                                            M721 M725 726 727 730 M742 M746 747 748 751 M763 M767 768 769 772 M784 M788 789
                                            790 793 M805 M809 810 811 814 M826 M830 831 832 835 M847 M851 852 853 856 M868
                                            M872 873 874 877 M889 M893 894 895 898 M910 M914 915 916 919 M931 M935 937 938
                                            941
      199   XXCOMPUTED . . . . . . . . . .  M328
      201   XXCORRECT. . . . . . . . . . .  M327
      194   XXINFO . . . . . . . . . . . .  308 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    24
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

      323   BAIL-OUT . . . . . . . . . . .  P235
      332   BAIL-OUT-EX. . . . . . . . . .  E235 G325
      326   BAIL-OUT-WRITE . . . . . . . .  G324
      300   BLANK-LINE-PRINT
      965   CCVS-EXIT
      966   CCVS-999999
      212   CCVS1
      333   CCVS1-EXIT . . . . . . . . . .  G218
      219   CLOSE-FILES. . . . . . . . . .  G967
      245   COLUMN-NAMES-ROUTINE . . . . .  E217
      226   DE-LETE. . . . . . . . . . . .  P358 P379 P400 P421 P442 P463 P484 P505 P526 P547 P568 P589 P610 P631 P652 P673
                                            P694 P715 P736 P757 P778 P799 P820 P841 P862 P883 P904 P925 P947 P960
      249   END-ROUTINE. . . . . . . . . .  P220
      253   END-ROUTINE-1
      261   END-ROUTINE-12
      269   END-ROUTINE-13 . . . . . . . .  E220
      251   END-RTN-EXIT
      357   F-COS-DELETE-01
      378   F-COS-DELETE-02
      399   F-COS-DELETE-03
      420   F-COS-DELETE-04
      441   F-COS-DELETE-05
      462   F-COS-DELETE-06
      483   F-COS-DELETE-07
      504   F-COS-DELETE-08
      525   F-COS-DELETE-09
      546   F-COS-DELETE-10
      567   F-COS-DELETE-11
      588   F-COS-DELETE-12
      609   F-COS-DELETE-13
      630   F-COS-DELETE-14
      651   F-COS-DELETE-16
      672   F-COS-DELETE-18
      693   F-COS-DELETE-19
      714   F-COS-DELETE-20
      735   F-COS-DELETE-21
      756   F-COS-DELETE-22
      777   F-COS-DELETE-23
      798   F-COS-DELETE-24
      819   F-COS-DELETE-25
      840   F-COS-DELETE-26
      861   F-COS-DELETE-27
      882   F-COS-DELETE-28
      903   F-COS-DELETE-29
      924   F-COS-DELETE-30
      946   F-COS-DELETE-31
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    25
0 Defined   Cross-reference of procedures   References

0     959   F-COS-DELETE-32
      339   F-COS-INFO
      346   F-COS-TEST-01
      367   F-COS-TEST-02
      388   F-COS-TEST-03
      409   F-COS-TEST-04
      430   F-COS-TEST-05
      451   F-COS-TEST-06
      472   F-COS-TEST-07
      493   F-COS-TEST-08
      514   F-COS-TEST-09
      535   F-COS-TEST-10
      556   F-COS-TEST-11
      577   F-COS-TEST-12
      598   F-COS-TEST-13
      619   F-COS-TEST-14
      640   F-COS-TEST-16
      661   F-COS-TEST-18
      682   F-COS-TEST-19
      703   F-COS-TEST-20
      724   F-COS-TEST-21
      745   F-COS-TEST-22
      766   F-COS-TEST-23
      787   F-COS-TEST-24
      808   F-COS-TEST-25
      829   F-COS-TEST-26
      850   F-COS-TEST-27
      871   F-COS-TEST-28
      892   F-COS-TEST-29
      913   F-COS-TEST-30
      934   F-COS-TEST-31
      957   F-COS-TEST-32. . . . . . . . .  P953
      360   F-COS-WRITE-01 . . . . . . . .  G356 G359
      381   F-COS-WRITE-02 . . . . . . . .  G377 G380
      402   F-COS-WRITE-03 . . . . . . . .  G398 G401
      423   F-COS-WRITE-04 . . . . . . . .  G419 G422
      444   F-COS-WRITE-05 . . . . . . . .  G440 G443
      465   F-COS-WRITE-06 . . . . . . . .  G461 G464
      486   F-COS-WRITE-07 . . . . . . . .  G482 G485
      507   F-COS-WRITE-08 . . . . . . . .  G503 G506
      528   F-COS-WRITE-09 . . . . . . . .  G524 G527
      549   F-COS-WRITE-10 . . . . . . . .  G545 G548
      570   F-COS-WRITE-11 . . . . . . . .  G566 G569
      591   F-COS-WRITE-12 . . . . . . . .  G587 G590
      612   F-COS-WRITE-13 . . . . . . . .  G608 G611
      633   F-COS-WRITE-14 . . . . . . . .  G629 G632
      654   F-COS-WRITE-16 . . . . . . . .  G650 G653
      675   F-COS-WRITE-18 . . . . . . . .  G671 G674
      696   F-COS-WRITE-19 . . . . . . . .  G692 G695
      717   F-COS-WRITE-20 . . . . . . . .  G713 G716
      738   F-COS-WRITE-21 . . . . . . . .  G734 G737
      759   F-COS-WRITE-22 . . . . . . . .  G755 G758
      780   F-COS-WRITE-23 . . . . . . . .  G776 G779
      801   F-COS-WRITE-24 . . . . . . . .  G797 G800
      822   F-COS-WRITE-25 . . . . . . . .  G818 G821
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    26
0 Defined   Cross-reference of procedures   References

0     843   F-COS-WRITE-26 . . . . . . . .  G839 G842
      864   F-COS-WRITE-27 . . . . . . . .  G860 G863
      885   F-COS-WRITE-28 . . . . . . . .  G881 G884
      906   F-COS-WRITE-29 . . . . . . . .  G902 G905
      927   F-COS-WRITE-30 . . . . . . . .  G923 G926
      949   F-COS-WRITE-31 . . . . . . . .  G945 G948
      962   F-COS-WRITE-32 . . . . . . . .  G956 G961
      342   F-COS-01
      363   F-COS-02
      384   F-COS-03
      405   F-COS-04
      426   F-COS-05
      447   F-COS-06
      468   F-COS-07
      489   F-COS-08
      510   F-COS-09
      531   F-COS-10
      552   F-COS-11
      573   F-COS-12
      594   F-COS-13
      615   F-COS-14
      636   F-COS-16
      657   F-COS-18
      678   F-COS-19
      699   F-COS-20
      720   F-COS-21
      741   F-COS-22
      762   F-COS-23
      783   F-COS-24
      804   F-COS-25
      825   F-COS-26
      846   F-COS-27
      867   F-COS-28
      888   F-COS-29
      909   F-COS-30
      930   F-COS-31
      952   F-COS-32
      225   FAIL . . . . . . . . . . . . .  P355 P376 P397 P418 P439 P460 P481 P502 P523 P544 P565 P586 P607 P628 P649 P670
                                            P691 P712 P733 P754 P775 P796 P817 P838 P859 P880 P901 P922 P944
      302   FAIL-ROUTINE . . . . . . . . .  P234
      322   FAIL-ROUTINE-EX. . . . . . . .  E234 G310
      311   FAIL-ROUTINE-WRITE . . . . . .  G304 G305
      240   HEAD-ROUTINE . . . . . . . . .  P217
      223   INSPT
      213   OPEN-FILES
      224   PASS . . . . . . . . . . . . .  P350 P371 P392 P413 P434 P455 P476 P497 P518 P539 P560 P581 P602 P623 P644 P665
                                            P686 P707 P728 P749 P770 P791 P812 P833 P854 P875 P896 P917 P939 P955
      228   PRINT-DETAIL . . . . . . . . .  P362 P383 P404 P425 P446 P467 P488 P509 P530 P551 P572 P593 P614 P635 P656 P677
                                            P698 P719 P740 P761 P782 P803 P824 P845 P866 P887 P908 P929 P951 P964
      338   SECT-IF106A
      221   TERMINATE-CCVS
      281   WRITE-LINE . . . . . . . . . .  P232 P233 P241 P242 P243 P244 P246 P247 P248 P250 P252 P260 P268 P274 P279 P280
                                            P308 P312 P316 P317 P319 P320 P330
      297   WRT-LN . . . . . . . . . . . .  P287 P288 P289 P290 P291 P292 P293 P296 P301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    27
0 Defined   Cross-reference of programs     References

        3   IF106A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF106A    Date 06/04/2022  Time 11:59:13   Page    28
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF106A:
 *    Source records = 967
 *    Data Division statements = 96
 *    Procedure Division statements = 586
 *    Generated COBOL statements = 0
 *    Program complexity factor = 595
0End of compilation 1,  program IF106A,  highest severity 0.
0Return code 0
