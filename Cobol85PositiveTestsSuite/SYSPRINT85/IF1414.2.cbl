1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:13   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:13   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1414.2
   000002         000200 PROGRAM-ID.                                                      IF1414.2
   000003         000300     IF141A.                                                      IF1414.2
   000004         000500*                                                         *       IF1414.2
   000005         000600* This program forms part of the CCVS85 COBOL Test Suite. *       IF1414.2
   000006         000700* It contains tests for the Intrinsic Function VARIANCE   *       IF1414.2
   000007         000800*                                                         *       IF1414.2
   000008         001000 ENVIRONMENT DIVISION.                                            IF1414.2
   000009         001100 CONFIGURATION SECTION.                                           IF1414.2
   000010         001200 SOURCE-COMPUTER.                                                 IF1414.2
   000011         001300     XXXXX082.                                                    IF1414.2
   000012         001400 OBJECT-COMPUTER.                                                 IF1414.2
   000013         001500     XXXXX083.                                                    IF1414.2
   000014         001600 INPUT-OUTPUT SECTION.                                            IF1414.2
   000015         001700 FILE-CONTROL.                                                    IF1414.2
   000016         001800     SELECT PRINT-FILE ASSIGN TO                                  IF1414.2 20
   000017         001900     XXXXX055.                                                    IF1414.2
   000018         002000 DATA DIVISION.                                                   IF1414.2
   000019         002100 FILE SECTION.                                                    IF1414.2
   000020         002200 FD  PRINT-FILE.                                                  IF1414.2

 ==000020==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000021         002300 01  PRINT-REC PICTURE X(120).                                    IF1414.2
   000022         002400 01  DUMMY-RECORD PICTURE X(120).                                 IF1414.2
   000023         002500 WORKING-STORAGE SECTION.                                         IF1414.2
   000024         002700* Variables specific to the Intrinsic Function Test IF141A*       IF1414.2
   000025         002900 01  A                   PIC S9(10)          VALUE 5.             IF1414.2
   000026         003000 01  B                   PIC S9(10)          VALUE 7.             IF1414.2
   000027         003100 01  C                   PIC S9(10)          VALUE -4.            IF1414.2
   000028         003200 01  D                   PIC S9(10)          VALUE 10.            IF1414.2
   000029         003300 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1414.2
   000030         003400 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1414.2
   000031         003500 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1414.2
   000032         003600 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1414.2
   000033         003700 01  P                   PIC S9(10)          VALUE 4.             IF1414.2
   000034         003800 01  Q                   PIC S9(10)          VALUE 3.             IF1414.2
   000035         003900 01  R                   PIC S9(10)          VALUE 5.             IF1414.2
   000036         004000 01  ARG3                PIC S9(10)          VALUE 2.             IF1414.2
   000037         004100 01  ARR                                     VALUE "40537".       IF1414.2
   000038         004200     02  IND OCCURS 5 TIMES PIC 9.                                IF1414.2
   000039         004300 01  TEMP                PIC S9(10).                              IF1414.2
   000040         004400 01  WS-NUM              PIC S9(5)V9(6).                          IF1414.2
   000041         004500 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1414.2
   000042         004600 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1414.2
   000043         004700*                                                                 IF1414.2
   000044         004900*                                                                 IF1414.2
   000045         005000 01  TEST-RESULTS.                                                IF1414.2
   000046         005100     02 FILLER                   PIC X      VALUE SPACE.          IF1414.2 IMP
   000047         005200     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1414.2 IMP
   000048         005300     02 FILLER                   PIC X      VALUE SPACE.          IF1414.2 IMP
   000049         005400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1414.2 IMP
   000050         005500     02 FILLER                   PIC X      VALUE SPACE.          IF1414.2 IMP
   000051         005600     02  PAR-NAME.                                                IF1414.2
   000052         005700       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1414.2 IMP
   000053         005800       03  PARDOT-X              PIC X      VALUE SPACE.          IF1414.2 IMP
   000054         005900       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1414.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1414.2 IMP
   000056         006100     02 RE-MARK                  PIC X(61).                       IF1414.2
   000057         006200 01  TEST-COMPUTED.                                               IF1414.2
   000058         006300     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1414.2 IMP
   000059         006400     02 FILLER                   PIC X(17)  VALUE                 IF1414.2
   000060         006500            "       COMPUTED=".                                   IF1414.2
   000061         006600     02 COMPUTED-X.                                               IF1414.2
   000062         006700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1414.2 IMP
   000063         006800     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1414.2 62
   000064         006900                                 PIC -9(9).9(9).                  IF1414.2
   000065         007000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1414.2 62
   000066         007100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1414.2 62
   000067         007200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1414.2 62
   000068         007300     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1414.2 62
   000069         007400         04 COMPUTED-18V0                    PIC -9(18).          IF1414.2
   000070         007500         04 FILLER                           PIC X.               IF1414.2
   000071         007600     03 FILLER PIC X(50) VALUE SPACE.                             IF1414.2 IMP
   000072         007700 01  TEST-CORRECT.                                                IF1414.2
   000073         007800     02 FILLER PIC X(30) VALUE SPACE.                             IF1414.2 IMP
   000074         007900     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1414.2
   000075         008000     02 CORRECT-X.                                                IF1414.2
   000076         008100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1414.2 IMP
   000077         008200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1414.2 76
   000078         008300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1414.2 76
   000079         008400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1414.2 76
   000080         008500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1414.2 76
   000081         008600     03      CR-18V0 REDEFINES CORRECT-A.                         IF1414.2 76
   000082         008700         04 CORRECT-18V0                     PIC -9(18).          IF1414.2
   000083         008800         04 FILLER                           PIC X.               IF1414.2
   000084         008900     03 FILLER PIC X(2) VALUE SPACE.                              IF1414.2 IMP
   000085         009000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1414.2 IMP
   000086         009100 01  TEST-CORRECT-MIN.                                            IF1414.2
   000087         009200     02 FILLER PIC X(30) VALUE SPACE.                             IF1414.2 IMP
   000088         009300     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1414.2
   000089         009400     02 CORRECTMI-X.                                              IF1414.2
   000090         009500     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1414.2 IMP
   000091         009600     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1414.2 90
   000092         009700     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1414.2 90
   000093         009800     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1414.2 90
   000094         009900     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1414.2 90
   000095         010000     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1414.2 90
   000096         010100         04 CORRECTMI-18V0                     PIC -9(18).        IF1414.2
   000097         010200         04 FILLER                           PIC X.               IF1414.2
   000098         010300     03 FILLER PIC X(2) VALUE SPACE.                              IF1414.2 IMP
   000099         010400     03 FILLER                           PIC X(48) VALUE SPACE.   IF1414.2 IMP
   000100         010500 01  TEST-CORRECT-MAX.                                            IF1414.2
   000101         010600     02 FILLER PIC X(30) VALUE SPACE.                             IF1414.2 IMP
   000102         010700     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1414.2
   000103         010800     02 CORRECTMA-X.                                              IF1414.2
   000104         010900     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1414.2 IMP
   000105         011000     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1414.2 104
   000106         011100     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1414.2 104
   000107         011200     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1414.2 104
   000108         011300     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1414.2 104
   000109         011400     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1414.2 104
   000110         011500         04 CORRECTMA-18V0                     PIC -9(18).        IF1414.2
   000111         011600         04 FILLER                           PIC X.               IF1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     03 FILLER PIC X(2) VALUE SPACE.                              IF1414.2 IMP
   000113         011800     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1414.2 IMP
   000114         011900 01  CCVS-C-1.                                                    IF1414.2
   000115         012000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1414.2
   000116         012100-    "SS  PARAGRAPH-NAME                                          IF1414.2
   000117         012200-    "       REMARKS".                                            IF1414.2
   000118         012300     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1414.2 IMP
   000119         012400 01  CCVS-C-2.                                                    IF1414.2
   000120         012500     02 FILLER                     PIC X        VALUE SPACE.      IF1414.2 IMP
   000121         012600     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1414.2
   000122         012700     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1414.2 IMP
   000123         012800     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1414.2
   000124         012900     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1414.2 IMP
   000125         013000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1414.2 IMP
   000126         013100 01  REC-CT                        PIC 99       VALUE ZERO.       IF1414.2 IMP
   000127         013200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1414.2 IMP
   000128         013300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1414.2 IMP
   000129         013400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1414.2 IMP
   000130         013500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1414.2 IMP
   000131         013600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1414.2 IMP
   000132         013700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1414.2 IMP
   000133         013800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1414.2 IMP
   000134         013900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1414.2 IMP
   000135         014000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1414.2 IMP
   000136         014100 01  CCVS-H-1.                                                    IF1414.2
   000137         014200     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1414.2 IMP
   000138         014300     02  FILLER                    PIC X(42)    VALUE             IF1414.2
   000139         014400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1414.2
   000140         014500     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1414.2 IMP
   000141         014600 01  CCVS-H-2A.                                                   IF1414.2
   000142         014700   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1414.2 IMP
   000143         014800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1414.2
   000144         014900   02  FILLER                        PIC XXXX   VALUE             IF1414.2
   000145         015000     "4.2 ".                                                      IF1414.2
   000146         015100   02  FILLER                        PIC X(28)  VALUE             IF1414.2
   000147         015200            " COPY - NOT FOR DISTRIBUTION".                       IF1414.2
   000148         015300   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1414.2 IMP
   000149         015400                                                                  IF1414.2
   000150         015500 01  CCVS-H-2B.                                                   IF1414.2
   000151         015600   02  FILLER                        PIC X(15)  VALUE             IF1414.2
   000152         015700            "TEST RESULT OF ".                                    IF1414.2
   000153         015800   02  TEST-ID                       PIC X(9).                    IF1414.2
   000154         015900   02  FILLER                        PIC X(4)   VALUE             IF1414.2
   000155         016000            " IN ".                                               IF1414.2
   000156         016100   02  FILLER                        PIC X(12)  VALUE             IF1414.2
   000157         016200     " HIGH       ".                                              IF1414.2
   000158         016300   02  FILLER                        PIC X(22)  VALUE             IF1414.2
   000159         016400            " LEVEL VALIDATION FOR ".                             IF1414.2
   000160         016500   02  FILLER                        PIC X(58)  VALUE             IF1414.2
   000161         016600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1414.2
   000162         016700 01  CCVS-H-3.                                                    IF1414.2
   000163         016800     02  FILLER                      PIC X(34)  VALUE             IF1414.2
   000164         016900            " FOR OFFICIAL USE ONLY    ".                         IF1414.2
   000165         017000     02  FILLER                      PIC X(58)  VALUE             IF1414.2
   000166         017100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1414.2
   000167         017200     02  FILLER                      PIC X(28)  VALUE             IF1414.2
   000168         017300            "  COPYRIGHT   1985 ".                                IF1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400 01  CCVS-E-1.                                                    IF1414.2
   000170         017500     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1414.2 IMP
   000171         017600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1414.2
   000172         017700     02 ID-AGAIN                     PIC X(9).                    IF1414.2
   000173         017800     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1414.2 IMP
   000174         017900 01  CCVS-E-2.                                                    IF1414.2
   000175         018000     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1414.2 IMP
   000176         018100     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1414.2 IMP
   000177         018200     02 CCVS-E-2-2.                                               IF1414.2
   000178         018300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1414.2 IMP
   000179         018400         03 FILLER                   PIC X      VALUE SPACE.      IF1414.2 IMP
   000180         018500         03 ENDER-DESC               PIC X(44)  VALUE             IF1414.2
   000181         018600            "ERRORS ENCOUNTERED".                                 IF1414.2
   000182         018700 01  CCVS-E-3.                                                    IF1414.2
   000183         018800     02  FILLER                      PIC X(22)  VALUE             IF1414.2
   000184         018900            " FOR OFFICIAL USE ONLY".                             IF1414.2
   000185         019000     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1414.2 IMP
   000186         019100     02  FILLER                      PIC X(58)  VALUE             IF1414.2
   000187         019200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1414.2
   000188         019300     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1414.2 IMP
   000189         019400     02 FILLER                       PIC X(15)  VALUE             IF1414.2
   000190         019500             " COPYRIGHT 1985".                                   IF1414.2
   000191         019600 01  CCVS-E-4.                                                    IF1414.2
   000192         019700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1414.2 IMP
   000193         019800     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1414.2
   000194         019900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1414.2 IMP
   000195         020000     02 FILLER                       PIC X(40)  VALUE             IF1414.2
   000196         020100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1414.2
   000197         020200 01  XXINFO.                                                      IF1414.2
   000198         020300     02 FILLER                       PIC X(19)  VALUE             IF1414.2
   000199         020400            "*** INFORMATION ***".                                IF1414.2
   000200         020500     02 INFO-TEXT.                                                IF1414.2
   000201         020600       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1414.2 IMP
   000202         020700       04 XXCOMPUTED                 PIC X(20).                   IF1414.2
   000203         020800       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1414.2 IMP
   000204         020900       04 XXCORRECT                  PIC X(20).                   IF1414.2
   000205         021000     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1414.2
   000206         021100 01  HYPHEN-LINE.                                                 IF1414.2
   000207         021200     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1414.2 IMP
   000208         021300     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1414.2
   000209         021400-    "*****************************************".                 IF1414.2
   000210         021500     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1414.2
   000211         021600-    "******************************".                            IF1414.2
   000212         021700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1414.2
   000213         021800     "IF141A".                                                    IF1414.2
   000214         021900 PROCEDURE DIVISION.                                              IF1414.2
   000215         022000 CCVS1 SECTION.                                                   IF1414.2
   000216         022100 OPEN-FILES.                                                      IF1414.2
   000217         022200     OPEN     OUTPUT PRINT-FILE.                                  IF1414.2 20
   000218         022300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1414.2 212 153 212 172
   000219         022400     MOVE    SPACE TO TEST-RESULTS.                               IF1414.2 IMP 45
   000220         022500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1414.2 243 248
   000221         022600     GO TO CCVS1-EXIT.                                            IF1414.2 336
   000222         022700 CLOSE-FILES.                                                     IF1414.2
   000223         022800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1414.2 252 272 20
   000224         022900 TERMINATE-CCVS.                                                  IF1414.2
   000225         023000     STOP     RUN.                                                IF1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1414.2 49 129
   000227         023200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1414.2 49 130
   000228         023300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1414.2 49 128
   000229         023400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1414.2 49 127
   000230         023500     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1414.2 56
   000231         023600 PRINT-DETAIL.                                                    IF1414.2
   000232         023700     IF REC-CT NOT EQUAL TO ZERO                                  IF1414.2 126 IMP
   000233      1  023800             MOVE "." TO PARDOT-X                                 IF1414.2 53
   000234      1  023900             MOVE REC-CT TO DOTVALUE.                             IF1414.2 126 54
   000235         024000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1414.2 45 21 284
   000236         024100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1414.2 49 284
   000237      1  024200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1414.2 305 325
   000238      1  024300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1414.2 326 335
   000239         024400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1414.2 IMP 49 IMP 61
   000240         024500     MOVE SPACE TO CORRECT-X.                                     IF1414.2 IMP 75
   000241         024600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1414.2 126 IMP IMP 51
   000242         024700     MOVE     SPACE TO RE-MARK.                                   IF1414.2 IMP 56
   000243         024800 HEAD-ROUTINE.                                                    IF1414.2
   000244         024900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1414.2 136 22 284
   000245         025000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1414.2 141 22 284
   000246         025100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1414.2 150 22 284
   000247         025200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1414.2 162 22 284
   000248         025300 COLUMN-NAMES-ROUTINE.                                            IF1414.2
   000249         025400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1414.2 114 22 284
   000250         025500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1414.2 119 22 284
   000251         025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1414.2 206 22 284
   000252         025700 END-ROUTINE.                                                     IF1414.2
   000253         025800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1414.2 206 22 284
   000254         025900 END-RTN-EXIT.                                                    IF1414.2
   000255         026000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1414.2 169 22 284
   000256         026100 END-ROUTINE-1.                                                   IF1414.2
   000257         026200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1414.2 128 132 129
   000258         026300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1414.2 132 127 132
   000259         026400      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1414.2 130 132
   000260         026500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1414.2 130 192
   000261         026600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1414.2 132 194
   000262         026700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1414.2 191 177
   000263         026800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1414.2 174 22 284
   000264         026900  END-ROUTINE-12.                                                 IF1414.2
   000265         027000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1414.2 180
   000266         027100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1414.2 128 IMP
   000267      1  027200         MOVE "NO " TO ERROR-TOTAL                                IF1414.2 178
   000268         027300         ELSE                                                     IF1414.2
   000269      1  027400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1414.2 128 178
   000270         027500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1414.2 174 22
   000271         027600     PERFORM WRITE-LINE.                                          IF1414.2 284
   000272         027700 END-ROUTINE-13.                                                  IF1414.2
   000273         027800     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1414.2 127 IMP
   000274      1  027900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1414.2 178
   000275      1  028000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1414.2 127 178
   000276         028100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1414.2 180
   000277         028200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1414.2 174 22 284
   000278         028300      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1414.2 129 IMP
   000279      1  028400          MOVE "NO " TO ERROR-TOTAL                               IF1414.2 178
   000280      1  028500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1414.2 129 178
   000281         028600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1414.2 180
   000282         028700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1414.2 174 22 284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1414.2 182 22 284
   000284         028900 WRITE-LINE.                                                      IF1414.2
   000285         029000     ADD 1 TO RECORD-COUNT.                                       IF1414.2 134
   000286         029100     IF RECORD-COUNT GREATER 42                                   IF1414.2 134
   000287      1  029200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1414.2 22 133
   000288      1  029300         MOVE SPACE TO DUMMY-RECORD                               IF1414.2 IMP 22
   000289      1  029400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1414.2 22
   000290      1  029500         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1414.2 136 22 300
   000291      1  029600         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1414.2 141 22 300
   000292      1  029700         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1414.2 150 22 300
   000293      1  029800         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1414.2 162 22 300
   000294      1  029900         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1414.2 114 22 300
   000295      1  030000         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1414.2 119 22 300
   000296      1  030100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1414.2 206 22 300
   000297      1  030200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1414.2 133 22
   000298      1  030300         MOVE ZERO TO RECORD-COUNT.                               IF1414.2 IMP 134
   000299         030400     PERFORM WRT-LN.                                              IF1414.2 300
   000300         030500 WRT-LN.                                                          IF1414.2
   000301         030600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1414.2 22
   000302         030700     MOVE SPACE TO DUMMY-RECORD.                                  IF1414.2 IMP 22
   000303         030800 BLANK-LINE-PRINT.                                                IF1414.2
   000304         030900     PERFORM WRT-LN.                                              IF1414.2 300
   000305         031000 FAIL-ROUTINE.                                                    IF1414.2
   000306         031100     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1414.2 61 IMP
   000307      1  031200            GO TO FAIL-ROUTINE-WRITE.                             IF1414.2 314
   000308         031300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1414.2 75 IMP 314
   000309         031400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1414.2 135 205
   000310         031500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1414.2 200
   000311         031600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1414.2 197 22 284
   000312         031700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1414.2 IMP 205
   000313         031800     GO TO  FAIL-ROUTINE-EX.                                      IF1414.2 325
   000314         031900 FAIL-ROUTINE-WRITE.                                              IF1414.2
   000315         032000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1414.2 57 21 284
   000316         032100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1414.2 135 85
   000317         032200                              CORMA-ANSI-REFERENCE.               IF1414.2 113
   000318         032300     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1414.2 91 IMP
   000319      1  032400           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1414.2 86 21 284
   000320      1  032500           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1414.2 100 21 284
   000321         032600     ELSE                                                         IF1414.2
   000322      1  032700           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1414.2 72 21 284
   000323         032800     PERFORM WRITE-LINE.                                          IF1414.2 284
   000324         032900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1414.2 IMP 85
   000325         033000 FAIL-ROUTINE-EX. EXIT.                                           IF1414.2
   000326         033100 BAIL-OUT.                                                        IF1414.2
   000327         033200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1414.2 62 IMP 329
   000328         033300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1414.2 76 IMP 335
   000329         033400 BAIL-OUT-WRITE.                                                  IF1414.2
   000330         033500     MOVE CORRECT-A TO XXCORRECT.                                 IF1414.2 76 204
   000331         033600     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1414.2 62 202
   000332         033700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1414.2 135 205
   000333         033800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1414.2 197 22 284
   000334         033900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1414.2 IMP 205
   000335         034000 BAIL-OUT-EX. EXIT.                                               IF1414.2
   000336         034100 CCVS1-EXIT.                                                      IF1414.2
   000337         034200     EXIT.                                                        IF1414.2
   000338         034400*                                                      *          IF1414.2
   000339         034500*    Intrinsic Function Tests     IF141A - VARIANCE    *          IF1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034600*                                                      *          IF1414.2
   000341         034800 SECT-IF141A SECTION.                                             IF1414.2
   000342         034900 F-VARIANCE-INFO.                                                 IF1414.2
   000343         035000     MOVE     "See ref. A-74 2.45" TO ANSI-REFERENCE.             IF1414.2 135
   000344         035100     MOVE     "VARIANCE Function"     TO FEATURE.                 IF1414.2 47
   000345         035300 F-VARIANCE-01.                                                   IF1414.2
   000346         035400     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000347         035500     MOVE  48.6865 TO MIN-RANGE.                                  IF1414.2 41
   000348         035600     MOVE  48.6885 TO MAX-RANGE.                                  IF1414.2 42
   000349         035700 F-VARIANCE-TEST-01.                                              IF1414.2
   000350         035800     COMPUTE WS-NUM = FUNCTION VARIANCE(5, -2, -14, 0).           IF1414.2 40 IFN
   000351         035900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000352         036000        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000353      1  036100                    PERFORM PASS                                  IF1414.2 227
   000354         036200     ELSE                                                         IF1414.2
   000355      1  036300                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000356      1  036400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000357      1  036500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000358      1  036600                    PERFORM FAIL.                                 IF1414.2 228
   000359         036700     GO TO F-VARIANCE-WRITE-01.                                   IF1414.2 363
   000360         036800 F-VARIANCE-DELETE-01.                                            IF1414.2
   000361         036900     PERFORM  DE-LETE.                                            IF1414.2 229
   000362         037000     GO TO    F-VARIANCE-WRITE-01.                                IF1414.2 363
   000363         037100 F-VARIANCE-WRITE-01.                                             IF1414.2
   000364         037200     MOVE "F-VARIANCE-01" TO PAR-NAME.                            IF1414.2 51
   000365         037300     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000366         037500 F-VARIANCE-02.                                                   IF1414.2
   000367         037600     EVALUATE FUNCTION VARIANCE(3.9, -0.3, 8.7, 100.2)            IF1414.2 IFN
   000368         037700     WHEN  1741.70 THRU  1741.77                                  IF1414.2
   000369      1  037800                    PERFORM PASS                                  IF1414.2 227
   000370         037900     WHEN OTHER                                                   IF1414.2
   000371      1  038000                    PERFORM FAIL.                                 IF1414.2 228
   000372         038100     GO TO F-VARIANCE-WRITE-02.                                   IF1414.2 376
   000373         038200 F-VARIANCE-DELETE-02.                                            IF1414.2
   000374         038300     PERFORM  DE-LETE.                                            IF1414.2 229
   000375         038400     GO TO    F-VARIANCE-WRITE-02.                                IF1414.2 376
   000376         038500 F-VARIANCE-WRITE-02.                                             IF1414.2
   000377         038600     MOVE "F-VARIANCE-02" TO PAR-NAME.                            IF1414.2 51
   000378         038700     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000379         038900 F-VARIANCE-03.                                                   IF1414.2
   000380         039000     MOVE  27.2494 TO MIN-RANGE.                                  IF1414.2 41
   000381         039100     MOVE  27.2505 TO MAX-RANGE.                                  IF1414.2 42
   000382         039200 F-VARIANCE-TEST-03.                                              IF1414.2
   000383         039300     IF (FUNCTION VARIANCE(A, B, C, D) >= MIN-RANGE) AND          IF1414.2 IFN 25 26 27 28 41
   000384         039400        (FUNCTION VARIANCE(A, B, C, D) <= MAX-RANGE) THEN         IF1414.2 IFN 25 26 27 28 42
   000385      1  039500                    PERFORM PASS                                  IF1414.2 227
   000386         039600     ELSE                                                         IF1414.2
   000387      1  039700                    PERFORM FAIL.                                 IF1414.2 228
   000388         039800     GO TO F-VARIANCE-WRITE-03.                                   IF1414.2 392
   000389         039900 F-VARIANCE-DELETE-03.                                            IF1414.2
   000390         040000     PERFORM  DE-LETE.                                            IF1414.2 229
   000391         040100     GO TO    F-VARIANCE-WRITE-03.                                IF1414.2 392
   000392         040200 F-VARIANCE-WRITE-03.                                             IF1414.2
   000393         040300     MOVE "F-VARIANCE-03" TO PAR-NAME.                            IF1414.2 51
   000394         040400     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000395         040600 F-VARIANCE-04.                                                   IF1414.2
   000396         040700     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800     MOVE  283.728 TO MIN-RANGE.                                  IF1414.2 41
   000398         040900     MOVE  283.740 TO MAX-RANGE.                                  IF1414.2 42
   000399         041000 F-VARIANCE-TEST-04.                                              IF1414.2
   000400         041100     COMPUTE WS-NUM = FUNCTION VARIANCE(E, F, G, H).              IF1414.2 40 IFN 29 30 31 32
   000401         041200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000402         041300        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000403      1  041400                    PERFORM PASS                                  IF1414.2 227
   000404         041500     ELSE                                                         IF1414.2
   000405      1  041600                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000406      1  041700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000407      1  041800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000408      1  041900                    PERFORM FAIL.                                 IF1414.2 228
   000409         042000     GO TO F-VARIANCE-WRITE-04.                                   IF1414.2 413
   000410         042100 F-VARIANCE-DELETE-04.                                            IF1414.2
   000411         042200     PERFORM  DE-LETE.                                            IF1414.2 229
   000412         042300     GO TO    F-VARIANCE-WRITE-04.                                IF1414.2 413
   000413         042400 F-VARIANCE-WRITE-04.                                             IF1414.2
   000414         042500     MOVE "F-VARIANCE-04" TO PAR-NAME.                            IF1414.2 51
   000415         042600     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000416         042800 F-VARIANCE-05.                                                   IF1414.2
   000417         042900     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000418         043000     MOVE  94.6981 TO MIN-RANGE.                                  IF1414.2 41
   000419         043100     MOVE  94.7019 TO MAX-RANGE.                                  IF1414.2 42
   000420         043200 F-VARIANCE-TEST-05.                                              IF1414.2
   000421         043300     COMPUTE WS-NUM =                                             IF1414.2 40
   000422         043400          FUNCTION VARIANCE(10.2, -0.2, 5.6, -15.6).              IF1414.2 IFN
   000423         043500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000424         043600        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000425      1  043700                    PERFORM PASS                                  IF1414.2 227
   000426         043800     ELSE                                                         IF1414.2
   000427      1  043900                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000428      1  044000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000429      1  044100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000430      1  044200                    PERFORM FAIL.                                 IF1414.2 228
   000431         044300     GO TO F-VARIANCE-WRITE-05.                                   IF1414.2 435
   000432         044400 F-VARIANCE-DELETE-05.                                            IF1414.2
   000433         044500     PERFORM  DE-LETE.                                            IF1414.2 229
   000434         044600     GO TO    F-VARIANCE-WRITE-05.                                IF1414.2 435
   000435         044700 F-VARIANCE-WRITE-05.                                             IF1414.2
   000436         044800     MOVE "F-VARIANCE-05" TO PAR-NAME.                            IF1414.2 51
   000437         044900     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000438         045100 F-VARIANCE-06.                                                   IF1414.2
   000439         045200     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000440         045300     MOVE  156.194 TO MIN-RANGE.                                  IF1414.2 41
   000441         045400     MOVE  156.200 TO MAX-RANGE.                                  IF1414.2 42
   000442         045500 F-VARIANCE-TEST-06.                                              IF1414.2
   000443         045600     COMPUTE WS-NUM =                                             IF1414.2 40
   000444         045700            FUNCTION VARIANCE(A, B, C, D, E, F, G, H).            IF1414.2 IFN 25 26 27 28 29 30 31 32
   000445         045800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000446         045900        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000447      1  046000                    PERFORM PASS                                  IF1414.2 227
   000448         046100     ELSE                                                         IF1414.2
   000449      1  046200                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000450      1  046300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000451      1  046400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000452      1  046500                    PERFORM FAIL.                                 IF1414.2 228
   000453         046600     GO TO F-VARIANCE-WRITE-06.                                   IF1414.2 457
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046700 F-VARIANCE-DELETE-06.                                            IF1414.2
   000455         046800     PERFORM  DE-LETE.                                            IF1414.2 229
   000456         046900     GO TO    F-VARIANCE-WRITE-06.                                IF1414.2 457
   000457         047000 F-VARIANCE-WRITE-06.                                             IF1414.2
   000458         047100     MOVE "F-VARIANCE-06" TO PAR-NAME.                            IF1414.2 51
   000459         047200     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000460         047400 F-VARIANCE-07.                                                   IF1414.2
   000461         047500     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000462         047600     MOVE  4.66657 TO MIN-RANGE.                                  IF1414.2 41
   000463         047700     MOVE  4.66675 TO MAX-RANGE.                                  IF1414.2 42
   000464         047800 F-VARIANCE-TEST-07.                                              IF1414.2
   000465         047900     COMPUTE WS-NUM =                                             IF1414.2 40
   000466         048000           FUNCTION VARIANCE(IND(1), IND(2), IND(3)).             IF1414.2 IFN 38 38 38
   000467         048100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000468         048200        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000469      1  048300                    PERFORM PASS                                  IF1414.2 227
   000470         048400     ELSE                                                         IF1414.2
   000471      1  048500                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000472      1  048600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000473      1  048700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000474      1  048800                    PERFORM FAIL.                                 IF1414.2 228
   000475         048900     GO TO F-VARIANCE-WRITE-07.                                   IF1414.2 479
   000476         049000 F-VARIANCE-DELETE-07.                                            IF1414.2
   000477         049100     PERFORM  DE-LETE.                                            IF1414.2 229
   000478         049200     GO TO    F-VARIANCE-WRITE-07.                                IF1414.2 479
   000479         049300 F-VARIANCE-WRITE-07.                                             IF1414.2
   000480         049400     MOVE "F-VARIANCE-07" TO PAR-NAME.                            IF1414.2 51
   000481         049500     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000482         049700 F-VARIANCE-08.                                                   IF1414.2
   000483         049800     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000484         049900     MOVE  2.66661 TO MIN-RANGE.                                  IF1414.2 41
   000485         050000     MOVE  2.66671 TO MAX-RANGE.                                  IF1414.2 42
   000486         050100 F-VARIANCE-TEST-08.                                              IF1414.2
   000487         050200     COMPUTE WS-NUM =                                             IF1414.2 40
   000488         050300            FUNCTION VARIANCE(IND(P), IND(Q), IND(R)).            IF1414.2 IFN 38 33 38 34 38 35
   000489         050400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000490         050500        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000491      1  050600                    PERFORM PASS                                  IF1414.2 227
   000492         050700     ELSE                                                         IF1414.2
   000493      1  050800                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000494      1  050900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000495      1  051000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000496      1  051100                    PERFORM FAIL.                                 IF1414.2 228
   000497         051200     GO TO F-VARIANCE-WRITE-08.                                   IF1414.2 501
   000498         051300 F-VARIANCE-DELETE-08.                                            IF1414.2
   000499         051400     PERFORM  DE-LETE.                                            IF1414.2 229
   000500         051500     GO TO    F-VARIANCE-WRITE-08.                                IF1414.2 501
   000501         051600 F-VARIANCE-WRITE-08.                                             IF1414.2
   000502         051700     MOVE "F-VARIANCE-08" TO PAR-NAME.                            IF1414.2 51
   000503         051800     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000504         052000 F-VARIANCE-09.                                                   IF1414.2
   000505         052100     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000506         052200     MOVE 5.35989 TO MIN-RANGE.                                   IF1414.2 41
   000507         052300     MOVE 5.36011 TO MAX-RANGE.                                   IF1414.2 42
   000508         052400 F-VARIANCE-TEST-09.                                              IF1414.2
   000509         052500     COMPUTE WS-NUM = FUNCTION VARIANCE(IND(ALL)).                IF1414.2 40 IFN 38
   000510         052600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052700        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000512      1  052800                    PERFORM PASS                                  IF1414.2 227
   000513         052900     ELSE                                                         IF1414.2
   000514      1  053000                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000515      1  053100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000516      1  053200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000517      1  053300                    PERFORM FAIL.                                 IF1414.2 228
   000518         053400     GO TO F-VARIANCE-WRITE-09.                                   IF1414.2 522
   000519         053500 F-VARIANCE-DELETE-09.                                            IF1414.2
   000520         053600     PERFORM  DE-LETE.                                            IF1414.2 229
   000521         053700     GO TO    F-VARIANCE-WRITE-09.                                IF1414.2 522
   000522         053800 F-VARIANCE-WRITE-09.                                             IF1414.2
   000523         053900     MOVE "F-VARIANCE-09" TO PAR-NAME.                            IF1414.2 51
   000524         054000     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000525         054200 F-VARIANCE-11.                                                   IF1414.2
   000526         054300     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000527         054400     MOVE -0.000020 TO MIN-RANGE.                                 IF1414.2 41
   000528         054500     MOVE  0.000020 TO MAX-RANGE.                                 IF1414.2 42
   000529         054600 F-VARIANCE-TEST-11.                                              IF1414.2
   000530         054700     COMPUTE WS-NUM = FUNCTION VARIANCE(A, 5, A).                 IF1414.2 40 IFN 25 25
   000531         054800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000532         054900        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000533      1  055000                    PERFORM PASS                                  IF1414.2 227
   000534         055100     ELSE                                                         IF1414.2
   000535      1  055200                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000536      1  055300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000537      1  055400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000538      1  055500                    PERFORM FAIL.                                 IF1414.2 228
   000539         055600     GO TO F-VARIANCE-WRITE-11.                                   IF1414.2 543
   000540         055700 F-VARIANCE-DELETE-11.                                            IF1414.2
   000541         055800     PERFORM  DE-LETE.                                            IF1414.2 229
   000542         055900     GO TO    F-VARIANCE-WRITE-11.                                IF1414.2 543
   000543         056000 F-VARIANCE-WRITE-11.                                             IF1414.2
   000544         056100     MOVE "F-VARIANCE-11" TO PAR-NAME.                            IF1414.2 51
   000545         056200     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000546         056400 F-VARIANCE-12.                                                   IF1414.2
   000547         056500     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000548         056600     MOVE 78.9968 TO MIN-RANGE.                                   IF1414.2 41
   000549         056700     MOVE 79.0031 TO MAX-RANGE.                                   IF1414.2 42
   000550         056800 F-VARIANCE-TEST-12.                                              IF1414.2
   000551         056900     COMPUTE WS-NUM = FUNCTION VARIANCE(A, B) + 78.               IF1414.2 40 IFN 25 26
   000552         057000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000553         057100        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000554      1  057200                    PERFORM PASS                                  IF1414.2 227
   000555         057300     ELSE                                                         IF1414.2
   000556      1  057400                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000557      1  057500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000558      1  057600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000559      1  057700                    PERFORM FAIL.                                 IF1414.2 228
   000560         057800     GO TO F-VARIANCE-WRITE-12.                                   IF1414.2 564
   000561         057900 F-VARIANCE-DELETE-12.                                            IF1414.2
   000562         058000     PERFORM  DE-LETE.                                            IF1414.2 229
   000563         058100     GO TO    F-VARIANCE-WRITE-12.                                IF1414.2 564
   000564         058200 F-VARIANCE-WRITE-12.                                             IF1414.2
   000565         058300     MOVE "F-VARIANCE-12" TO PAR-NAME.                            IF1414.2 51
   000566         058400     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000567         058600 F-VARIANCE-13.                                                   IF1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058700     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000569         058800     MOVE  139.234 TO MIN-RANGE.                                  IF1414.2 41
   000570         058900     MOVE  139.245 TO MAX-RANGE.                                  IF1414.2 42
   000571         059000 F-VARIANCE-TEST-13.                                              IF1414.2
   000572         059100     COMPUTE WS-NUM = FUNCTION VARIANCE(2.6 + 30, 4.5 * 2).       IF1414.2 40 IFN
   000573         059200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000574         059300        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000575      1  059400                    PERFORM PASS                                  IF1414.2 227
   000576         059500     ELSE                                                         IF1414.2
   000577      1  059600                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000578      1  059700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000579      1  059800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000580      1  059900                    PERFORM FAIL.                                 IF1414.2 228
   000581         060000     GO TO F-VARIANCE-WRITE-13.                                   IF1414.2 585
   000582         060100 F-VARIANCE-DELETE-13.                                            IF1414.2
   000583         060200     PERFORM  DE-LETE.                                            IF1414.2 229
   000584         060300     GO TO    F-VARIANCE-WRITE-13.                                IF1414.2 585
   000585         060400 F-VARIANCE-WRITE-13.                                             IF1414.2
   000586         060500     MOVE "F-VARIANCE-13" TO PAR-NAME.                            IF1414.2 51
   000587         060600     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000588         060800 F-VARIANCE-14.                                                   IF1414.2
   000589         060900     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000590         061000     MOVE  374.658 TO MIN-RANGE.                                  IF1414.2 41
   000591         061100     MOVE  374.688 TO MAX-RANGE.                                  IF1414.2 42
   000592         061200 F-VARIANCE-TEST-14.                                              IF1414.2
   000593         061300     COMPUTE WS-NUM = FUNCTION VARIANCE(E, 9 * A, 0, B / 2).      IF1414.2 40 IFN 29 25 26
   000594         061400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000595         061500        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000596      1  061600                    PERFORM PASS                                  IF1414.2 227
   000597         061700     ELSE                                                         IF1414.2
   000598      1  061800                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000599      1  061900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000600      1  062000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000601      1  062100                    PERFORM FAIL.                                 IF1414.2 228
   000602         062200     GO TO F-VARIANCE-WRITE-14.                                   IF1414.2 606
   000603         062300 F-VARIANCE-DELETE-14.                                            IF1414.2
   000604         062400     PERFORM  DE-LETE.                                            IF1414.2 229
   000605         062500     GO TO    F-VARIANCE-WRITE-14.                                IF1414.2 606
   000606         062600 F-VARIANCE-WRITE-14.                                             IF1414.2
   000607         062700     MOVE "F-VARIANCE-14" TO PAR-NAME.                            IF1414.2 51
   000608         062800     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000609         063000 F-VARIANCE-15.                                                   IF1414.2
   000610         063100     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000611         063200     MOVE 0.999960 TO MIN-RANGE.                                  IF1414.2 41
   000612         063300     MOVE 1.00004 TO MAX-RANGE.                                   IF1414.2 42
   000613         063400 F-VARIANCE-TEST-15.                                              IF1414.2
   000614         063500     COMPUTE WS-NUM = FUNCTION VARIANCE(A, B) +                   IF1414.2 40 IFN 25 26
   000615         063600                      FUNCTION VARIANCE(1, 1).                    IF1414.2 IFN
   000616         063700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000617         063800        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000618      1  063900                    PERFORM PASS                                  IF1414.2 227
   000619         064000     ELSE                                                         IF1414.2
   000620      1  064100                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000621      1  064200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000622      1  064300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000623      1  064400                    PERFORM FAIL.                                 IF1414.2 228
   000624         064500     GO TO F-VARIANCE-WRITE-15.                                   IF1414.2 628
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064600 F-VARIANCE-DELETE-15.                                            IF1414.2
   000626         064700     PERFORM  DE-LETE.                                            IF1414.2 229
   000627         064800     GO TO    F-VARIANCE-WRITE-15.                                IF1414.2 628
   000628         064900 F-VARIANCE-WRITE-15.                                             IF1414.2
   000629         065000     MOVE "F-VARIANCE-15" TO PAR-NAME.                            IF1414.2 51
   000630         065100     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000631         065300 F-VARIANCE-16.                                                   IF1414.2
   000632         065400     MOVE ZERO TO WS-NUM.                                         IF1414.2 IMP 40
   000633         065500     MOVE -0.000040 TO MIN-RANGE.                                 IF1414.2 41
   000634         065600     MOVE 0.000040 TO MAX-RANGE.                                  IF1414.2 42
   000635         065700 F-VARIANCE-TEST-16.                                              IF1414.2
   000636         065800     COMPUTE WS-NUM = FUNCTION VARIANCE(                          IF1414.2 40 IFN
   000637         065900                      FUNCTION VARIANCE(0), 0).                   IF1414.2 IFN
   000638         066000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1414.2 40 41
   000639         066100        (WS-NUM <= MAX-RANGE) THEN                                IF1414.2 40 42
   000640      1  066200                    PERFORM PASS                                  IF1414.2 227
   000641         066300     ELSE                                                         IF1414.2
   000642      1  066400                    MOVE WS-NUM TO COMPUTED-N                     IF1414.2 40 63
   000643      1  066500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1414.2 41 91
   000644      1  066600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1414.2 42 105
   000645      1  066700                    PERFORM FAIL.                                 IF1414.2 228
   000646         066800     GO TO F-VARIANCE-WRITE-16.                                   IF1414.2 650
   000647         066900 F-VARIANCE-DELETE-16.                                            IF1414.2
   000648         067000     PERFORM  DE-LETE.                                            IF1414.2 229
   000649         067100     GO TO    F-VARIANCE-WRITE-16.                                IF1414.2 650
   000650         067200 F-VARIANCE-WRITE-16.                                             IF1414.2
   000651         067300     MOVE "F-VARIANCE-16" TO PAR-NAME.                            IF1414.2 51
   000652         067400     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000653         067600 F-VARIANCE-17.                                                   IF1414.2
   000654         067700     PERFORM F-VARIANCE-TEST-17                                   IF1414.2 658
   000655         067800       UNTIL FUNCTION VARIANCE(1, 1, ARG3) > 3.                   IF1414.2 IFN 36
   000656         067900     PERFORM PASS.                                                IF1414.2 227
   000657         068000     GO TO F-VARIANCE-WRITE-17.                                   IF1414.2 663
   000658         068100 F-VARIANCE-TEST-17.                                              IF1414.2
   000659         068200     COMPUTE ARG3 = ARG3 + 1.                                     IF1414.2 36 36
   000660         068300 F-VARIANCE-DELETE-17.                                            IF1414.2
   000661         068400     PERFORM  DE-LETE.                                            IF1414.2 229
   000662         068500     GO TO    F-VARIANCE-WRITE-17.                                IF1414.2 663
   000663         068600 F-VARIANCE-WRITE-17.                                             IF1414.2
   000664         068700     MOVE "F-VARIANCE-17" TO PAR-NAME.                            IF1414.2 51
   000665         068800     PERFORM  PRINT-DETAIL.                                       IF1414.2 231
   000666         069000 CCVS-EXIT SECTION.                                               IF1414.2
   000667         069100 CCVS-999999.                                                     IF1414.2
   000668         069200     GO TO CLOSE-FILES.                                           IF1414.2 222
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       25   A. . . . . . . . . . . . . . .  383 384 444 530 530 551 593 614
      135   ANSI-REFERENCE . . . . . . . .  309 316 332 M343
       36   ARG3 . . . . . . . . . . . . .  655 M659 659
       37   ARR
       26   B. . . . . . . . . . . . . . .  383 384 444 551 593 614
       27   C. . . . . . . . . . . . . . .  383 384 444
      114   CCVS-C-1 . . . . . . . . . . .  249 294
      119   CCVS-C-2 . . . . . . . . . . .  250 295
      169   CCVS-E-1 . . . . . . . . . . .  255
      174   CCVS-E-2 . . . . . . . . . . .  263 270 277 282
      177   CCVS-E-2-2 . . . . . . . . . .  M262
      182   CCVS-E-3 . . . . . . . . . . .  283
      191   CCVS-E-4 . . . . . . . . . . .  262
      192   CCVS-E-4-1 . . . . . . . . . .  M260
      194   CCVS-E-4-2 . . . . . . . . . .  M261
      136   CCVS-H-1 . . . . . . . . . . .  244 290
      141   CCVS-H-2A. . . . . . . . . . .  245 291
      150   CCVS-H-2B. . . . . . . . . . .  246 292
      162   CCVS-H-3 . . . . . . . . . . .  247 293
      212   CCVS-PGM-ID. . . . . . . . . .  218 218
       68   CM-18V0
       62   COMPUTED-A . . . . . . . . . .  63 65 66 67 68 327 331
       63   COMPUTED-N . . . . . . . . . .  M355 M405 M427 M449 M471 M493 M514 M535 M556 M577 M598 M620 M642
       61   COMPUTED-X . . . . . . . . . .  M239 306
       65   COMPUTED-0V18
       67   COMPUTED-14V4
       69   COMPUTED-18V0
       66   COMPUTED-4V14
       85   COR-ANSI-REFERENCE . . . . . .  M316 M324
      113   CORMA-ANSI-REFERENCE . . . . .  M317
       76   CORRECT-A. . . . . . . . . . .  77 78 79 80 81 328 330
      105   CORRECT-MAX. . . . . . . . . .  M357 M407 M429 M451 M473 M495 M516 M537 M558 M579 M600 M622 M644
       91   CORRECT-MIN. . . . . . . . . .  318 M356 M406 M428 M450 M472 M494 M515 M536 M557 M578 M599 M621 M643
       77   CORRECT-N
       75   CORRECT-X. . . . . . . . . . .  M240 308
       78   CORRECT-0V18
       80   CORRECT-14V4
       82   CORRECT-18V0
       79   CORRECT-4V14
      104   CORRECTMA-A. . . . . . . . . .  105 106 107 108 109
      103   CORRECTMA-X
      106   CORRECTMA-0V18
      108   CORRECTMA-14V4
      110   CORRECTMA-18V0
      107   CORRECTMA-4V14
       90   CORRECTMI-A. . . . . . . . . .  91 92 93 94 95
       89   CORRECTMI-X
       92   CORRECTMI-0V18
       94   CORRECTMI-14V4
       96   CORRECTMI-18V0
       93   CORRECTMI-4V14
       81   CR-18V0
       95   CR-18V0
      109   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    16
0 Defined   Cross-reference of data names   References

0      28   D. . . . . . . . . . . . . . .  383 384 444
      127   DELETE-COUNTER . . . . . . . .  M229 258 273 275
       54   DOTVALUE . . . . . . . . . . .  M234
      133   DUMMY-HOLD . . . . . . . . . .  M287 297
       22   DUMMY-RECORD . . . . . . . . .  M244 M245 M246 M247 M249 M250 M251 M253 M255 M263 M270 M277 M282 M283 287 M288
                                            289 M290 M291 M292 M293 M294 M295 M296 M297 301 M302 M311 M333
       29   E. . . . . . . . . . . . . . .  400 444 593
      180   ENDER-DESC . . . . . . . . . .  M265 M276 M281
      128   ERROR-COUNTER. . . . . . . . .  M228 257 266 269
      132   ERROR-HOLD . . . . . . . . . .  M257 M258 M258 M259 261
      178   ERROR-TOTAL. . . . . . . . . .  M267 M269 M274 M275 M279 M280
       30   F. . . . . . . . . . . . . . .  400 444
       47   FEATURE. . . . . . . . . . . .  M344
       31   G. . . . . . . . . . . . . . .  400 444
       32   H. . . . . . . . . . . . . . .  400 444
      206   HYPHEN-LINE. . . . . . . . . .  251 253 296
      172   ID-AGAIN . . . . . . . . . . .  M218
       38   IND. . . . . . . . . . . . . .  466 466 466 488 488 488 509
      205   INF-ANSI-REFERENCE . . . . . .  M309 M312 M332 M334
      200   INFO-TEXT. . . . . . . . . . .  M310
      129   INSPECT-COUNTER. . . . . . . .  M226 257 278 280
       42   MAX-RANGE. . . . . . . . . . .  M348 352 357 M381 384 M398 402 407 M419 424 429 M441 446 451 M463 468 473 M485
                                            490 495 M507 511 516 M528 532 537 M549 553 558 M570 574 579 M591 595 600 M612
                                            617 622 M634 639 644
       41   MIN-RANGE. . . . . . . . . . .  M347 351 356 M380 383 M397 401 406 M418 423 428 M440 445 450 M462 467 472 M484
                                            489 494 M506 510 515 M527 531 536 M548 552 557 M569 573 578 M590 594 599 M611
                                            616 621 M633 638 643
       33   P. . . . . . . . . . . . . . .  488
       49   P-OR-F . . . . . . . . . . . .  M226 M227 M228 M229 236 M239
       51   PAR-NAME . . . . . . . . . . .  M241 M364 M377 M393 M414 M436 M458 M480 M502 M523 M544 M565 M586 M607 M629 M651
                                            M664
       53   PARDOT-X . . . . . . . . . . .  M233
      130   PASS-COUNTER . . . . . . . . .  M227 259 260
       20   PRINT-FILE . . . . . . . . . .  16 217 223
       21   PRINT-REC. . . . . . . . . . .  M235 M315 M319 M320 M322
       34   Q. . . . . . . . . . . . . . .  488
       35   R. . . . . . . . . . . . . . .  488
       56   RE-MARK. . . . . . . . . . . .  M230 M242
      126   REC-CT . . . . . . . . . . . .  232 234 241
      125   REC-SKL-SUB
      134   RECORD-COUNT . . . . . . . . .  M285 286 M298
       39   TEMP
       57   TEST-COMPUTED. . . . . . . . .  315
       72   TEST-CORRECT . . . . . . . . .  322
      100   TEST-CORRECT-MAX . . . . . . .  320
       86   TEST-CORRECT-MIN . . . . . . .  319
      153   TEST-ID. . . . . . . . . . . .  M218
       45   TEST-RESULTS . . . . . . . . .  M219 235
      131   TOTAL-ERROR
       40   WS-NUM . . . . . . . . . . . .  M346 M350 351 352 355 M396 M400 401 402 405 M417 M421 423 424 427 M439 M443 445
                                            446 449 M461 M465 467 468 471 M483 M487 489 490 493 M505 M509 510 511 514 M526
                                            M530 531 532 535 M547 M551 552 553 556 M568 M572 573 574 577 M589 M593 594 595
                                            598 M610 M614 616 617 620 M632 M636 638 639 642
      202   XXCOMPUTED . . . . . . . . . .  M331
      204   XXCORRECT. . . . . . . . . . .  M330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    17
0 Defined   Cross-reference of data names   References

0     197   XXINFO . . . . . . . . . . . .  311 333
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    18
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

      326   BAIL-OUT . . . . . . . . . . .  P238
      335   BAIL-OUT-EX. . . . . . . . . .  E238 G328
      329   BAIL-OUT-WRITE . . . . . . . .  G327
      303   BLANK-LINE-PRINT
      666   CCVS-EXIT
      667   CCVS-999999
      215   CCVS1
      336   CCVS1-EXIT . . . . . . . . . .  G221
      222   CLOSE-FILES. . . . . . . . . .  G668
      248   COLUMN-NAMES-ROUTINE . . . . .  E220
      229   DE-LETE. . . . . . . . . . . .  P361 P374 P390 P411 P433 P455 P477 P499 P520 P541 P562 P583 P604 P626 P648 P661
      252   END-ROUTINE. . . . . . . . . .  P223
      256   END-ROUTINE-1
      264   END-ROUTINE-12
      272   END-ROUTINE-13 . . . . . . . .  E223
      254   END-RTN-EXIT
      360   F-VARIANCE-DELETE-01
      373   F-VARIANCE-DELETE-02
      389   F-VARIANCE-DELETE-03
      410   F-VARIANCE-DELETE-04
      432   F-VARIANCE-DELETE-05
      454   F-VARIANCE-DELETE-06
      476   F-VARIANCE-DELETE-07
      498   F-VARIANCE-DELETE-08
      519   F-VARIANCE-DELETE-09
      540   F-VARIANCE-DELETE-11
      561   F-VARIANCE-DELETE-12
      582   F-VARIANCE-DELETE-13
      603   F-VARIANCE-DELETE-14
      625   F-VARIANCE-DELETE-15
      647   F-VARIANCE-DELETE-16
      660   F-VARIANCE-DELETE-17
      342   F-VARIANCE-INFO
      349   F-VARIANCE-TEST-01
      382   F-VARIANCE-TEST-03
      399   F-VARIANCE-TEST-04
      420   F-VARIANCE-TEST-05
      442   F-VARIANCE-TEST-06
      464   F-VARIANCE-TEST-07
      486   F-VARIANCE-TEST-08
      508   F-VARIANCE-TEST-09
      529   F-VARIANCE-TEST-11
      550   F-VARIANCE-TEST-12
      571   F-VARIANCE-TEST-13
      592   F-VARIANCE-TEST-14
      613   F-VARIANCE-TEST-15
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    19
0 Defined   Cross-reference of procedures   References

0     635   F-VARIANCE-TEST-16
      658   F-VARIANCE-TEST-17 . . . . . .  P654
      363   F-VARIANCE-WRITE-01. . . . . .  G359 G362
      376   F-VARIANCE-WRITE-02. . . . . .  G372 G375
      392   F-VARIANCE-WRITE-03. . . . . .  G388 G391
      413   F-VARIANCE-WRITE-04. . . . . .  G409 G412
      435   F-VARIANCE-WRITE-05. . . . . .  G431 G434
      457   F-VARIANCE-WRITE-06. . . . . .  G453 G456
      479   F-VARIANCE-WRITE-07. . . . . .  G475 G478
      501   F-VARIANCE-WRITE-08. . . . . .  G497 G500
      522   F-VARIANCE-WRITE-09. . . . . .  G518 G521
      543   F-VARIANCE-WRITE-11. . . . . .  G539 G542
      564   F-VARIANCE-WRITE-12. . . . . .  G560 G563
      585   F-VARIANCE-WRITE-13. . . . . .  G581 G584
      606   F-VARIANCE-WRITE-14. . . . . .  G602 G605
      628   F-VARIANCE-WRITE-15. . . . . .  G624 G627
      650   F-VARIANCE-WRITE-16. . . . . .  G646 G649
      663   F-VARIANCE-WRITE-17. . . . . .  G657 G662
      345   F-VARIANCE-01
      366   F-VARIANCE-02
      379   F-VARIANCE-03
      395   F-VARIANCE-04
      416   F-VARIANCE-05
      438   F-VARIANCE-06
      460   F-VARIANCE-07
      482   F-VARIANCE-08
      504   F-VARIANCE-09
      525   F-VARIANCE-11
      546   F-VARIANCE-12
      567   F-VARIANCE-13
      588   F-VARIANCE-14
      609   F-VARIANCE-15
      631   F-VARIANCE-16
      653   F-VARIANCE-17
      228   FAIL . . . . . . . . . . . . .  P358 P371 P387 P408 P430 P452 P474 P496 P517 P538 P559 P580 P601 P623 P645
      305   FAIL-ROUTINE . . . . . . . . .  P237
      325   FAIL-ROUTINE-EX. . . . . . . .  E237 G313
      314   FAIL-ROUTINE-WRITE . . . . . .  G307 G308
      243   HEAD-ROUTINE . . . . . . . . .  P220
      226   INSPT
      216   OPEN-FILES
      227   PASS . . . . . . . . . . . . .  P353 P369 P385 P403 P425 P447 P469 P491 P512 P533 P554 P575 P596 P618 P640 P656
      231   PRINT-DETAIL . . . . . . . . .  P365 P378 P394 P415 P437 P459 P481 P503 P524 P545 P566 P587 P608 P630 P652 P665
      341   SECT-IF141A
      224   TERMINATE-CCVS
      284   WRITE-LINE . . . . . . . . . .  P235 P236 P244 P245 P246 P247 P249 P250 P251 P253 P255 P263 P271 P277 P282 P283
                                            P311 P315 P319 P320 P322 P323 P333
      300   WRT-LN . . . . . . . . . . . .  P290 P291 P292 P293 P294 P295 P296 P299 P304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    20
0 Defined   Cross-reference of programs     References

        3   IF141A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF141A    Date 06/04/2022  Time 11:58:13   Page    21
0LineID  Message code  Message text

     20  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF141A:
 *    Source records = 668
 *    Data Division statements = 100
 *    Procedure Division statements = 364
 *    Generated COBOL statements = 0
 *    Program complexity factor = 375
0End of compilation 1,  program IF141A,  highest severity 0.
0Return code 0
