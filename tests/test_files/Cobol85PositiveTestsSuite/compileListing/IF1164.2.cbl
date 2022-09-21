1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:52   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:52   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1164.2
   000002         000200 PROGRAM-ID.                                                      IF1164.2
   000003         000300     IF116A.                                                      IF1164.2
   000004         000400                                                                  IF1164.2
   000005         000600*                                                         *       IF1164.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1164.2
   000007         000800* It contains tests for the Intrinsic Function LOG.       *       IF1164.2
   000008         000900*                                                         *       IF1164.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1164.2
   000010         001200 CONFIGURATION SECTION.                                           IF1164.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1164.2
   000012         001400     XXXXX082.                                                    IF1164.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1164.2
   000014         001600     XXXXX083.                                                    IF1164.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1164.2
   000016         001800 FILE-CONTROL.                                                    IF1164.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1164.2 21
   000018         002000     XXXXX055.                                                    IF1164.2
   000019         002100 DATA DIVISION.                                                   IF1164.2
   000020         002200 FILE SECTION.                                                    IF1164.2
   000021         002300 FD  PRINT-FILE.                                                  IF1164.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1164.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1164.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1164.2
   000025         002800* Variables specific to the Intrinsic Function Test IF116A*       IF1164.2
   000026         003000 01  A                   PIC S9(10)          VALUE 600000.        IF1164.2
   000027         003100 01  B                   PIC S9(10)          VALUE 7.             IF1164.2
   000028         003200 01  C                   PIC S9(10)          VALUE -4.            IF1164.2
   000029         003300 01  D                   PIC S9(10)          VALUE 10.            IF1164.2
   000030         003400 01  E                   PIC S9(1)V9(9)      VALUE 2.718281828.   IF1164.2
   000031         003500 01  F                   PIC S9(5)V9(5)      VALUE 32000.8.       IF1164.2
   000032         003600 01  G                   PIC S9(5)V9(5)      VALUE .00002.        IF1164.2
   000033         003700 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1164.2
   000034         003800 01  ARG1                PIC S9(5)V9(5)      VALUE 1.00.          IF1164.2
   000035         003900 01  ARR                                     VALUE "40537".       IF1164.2
   000036         004000     02  IND OCCURS 5 TIMES PIC 9.                                IF1164.2
   000037         004100 01  TEMP                PIC S9(10).                              IF1164.2
   000038         004200 01  WS-NUM              PIC S9(5)V9(6).                          IF1164.2
   000039         004300 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1164.2
   000040         004400 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1164.2
   000041         004500*                                                                 IF1164.2
   000042         004700*                                                                 IF1164.2
   000043         004800 01  TEST-RESULTS.                                                IF1164.2
   000044         004900     02 FILLER                   PIC X      VALUE SPACE.          IF1164.2 IMP
   000045         005000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1164.2 IMP
   000046         005100     02 FILLER                   PIC X      VALUE SPACE.          IF1164.2 IMP
   000047         005200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1164.2 IMP
   000048         005300     02 FILLER                   PIC X      VALUE SPACE.          IF1164.2 IMP
   000049         005400     02  PAR-NAME.                                                IF1164.2
   000050         005500       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1164.2 IMP
   000051         005600       03  PARDOT-X              PIC X      VALUE SPACE.          IF1164.2 IMP
   000052         005700       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1164.2 IMP
   000053         005800     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1164.2 IMP
   000054         005900     02 RE-MARK                  PIC X(61).                       IF1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000 01  TEST-COMPUTED.                                               IF1164.2
   000056         006100     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1164.2 IMP
   000057         006200     02 FILLER                   PIC X(17)  VALUE                 IF1164.2
   000058         006300            "       COMPUTED=".                                   IF1164.2
   000059         006400     02 COMPUTED-X.                                               IF1164.2
   000060         006500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1164.2 IMP
   000061         006600     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1164.2 60
   000062         006700                                 PIC -9(9).9(9).                  IF1164.2
   000063         006800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1164.2 60
   000064         006900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1164.2 60
   000065         007000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1164.2 60
   000066         007100     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1164.2 60
   000067         007200         04 COMPUTED-18V0                    PIC -9(18).          IF1164.2
   000068         007300         04 FILLER                           PIC X.               IF1164.2
   000069         007400     03 FILLER PIC X(50) VALUE SPACE.                             IF1164.2 IMP
   000070         007500 01  TEST-CORRECT.                                                IF1164.2
   000071         007600     02 FILLER PIC X(30) VALUE SPACE.                             IF1164.2 IMP
   000072         007700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1164.2
   000073         007800     02 CORRECT-X.                                                IF1164.2
   000074         007900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1164.2 IMP
   000075         008000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1164.2 74
   000076         008100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1164.2 74
   000077         008200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1164.2 74
   000078         008300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1164.2 74
   000079         008400     03      CR-18V0 REDEFINES CORRECT-A.                         IF1164.2 74
   000080         008500         04 CORRECT-18V0                     PIC -9(18).          IF1164.2
   000081         008600         04 FILLER                           PIC X.               IF1164.2
   000082         008700     03 FILLER PIC X(2) VALUE SPACE.                              IF1164.2 IMP
   000083         008800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1164.2 IMP
   000084         008900 01  TEST-CORRECT-MIN.                                            IF1164.2
   000085         009000     02 FILLER PIC X(30) VALUE SPACE.                             IF1164.2 IMP
   000086         009100     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1164.2
   000087         009200     02 CORRECTMI-X.                                              IF1164.2
   000088         009300     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1164.2 IMP
   000089         009400     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1164.2 88
   000090         009500     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1164.2 88
   000091         009600     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1164.2 88
   000092         009700     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1164.2 88
   000093         009800     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1164.2 88
   000094         009900         04 CORRECTMI-18V0                     PIC -9(18).        IF1164.2
   000095         010000         04 FILLER                           PIC X.               IF1164.2
   000096         010100     03 FILLER PIC X(2) VALUE SPACE.                              IF1164.2 IMP
   000097         010200     03 FILLER                           PIC X(48) VALUE SPACE.   IF1164.2 IMP
   000098         010300 01  TEST-CORRECT-MAX.                                            IF1164.2
   000099         010400     02 FILLER PIC X(30) VALUE SPACE.                             IF1164.2 IMP
   000100         010500     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1164.2
   000101         010600     02 CORRECTMA-X.                                              IF1164.2
   000102         010700     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1164.2 IMP
   000103         010800     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1164.2 102
   000104         010900     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1164.2 102
   000105         011000     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1164.2 102
   000106         011100     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1164.2 102
   000107         011200     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1164.2 102
   000108         011300         04 CORRECTMA-18V0                     PIC -9(18).        IF1164.2
   000109         011400         04 FILLER                           PIC X.               IF1164.2
   000110         011500     03 FILLER PIC X(2) VALUE SPACE.                              IF1164.2 IMP
   000111         011600     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700 01  CCVS-C-1.                                                    IF1164.2
   000113         011800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1164.2
   000114         011900-    "SS  PARAGRAPH-NAME                                          IF1164.2
   000115         012000-    "       REMARKS".                                            IF1164.2
   000116         012100     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1164.2 IMP
   000117         012200 01  CCVS-C-2.                                                    IF1164.2
   000118         012300     02 FILLER                     PIC X        VALUE SPACE.      IF1164.2 IMP
   000119         012400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1164.2
   000120         012500     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1164.2 IMP
   000121         012600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1164.2
   000122         012700     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1164.2 IMP
   000123         012800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1164.2 IMP
   000124         012900 01  REC-CT                        PIC 99       VALUE ZERO.       IF1164.2 IMP
   000125         013000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1164.2 IMP
   000126         013100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1164.2 IMP
   000127         013200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1164.2 IMP
   000128         013300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1164.2 IMP
   000129         013400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1164.2 IMP
   000130         013500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1164.2 IMP
   000131         013600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1164.2 IMP
   000132         013700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1164.2 IMP
   000133         013800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1164.2 IMP
   000134         013900 01  CCVS-H-1.                                                    IF1164.2
   000135         014000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1164.2 IMP
   000136         014100     02  FILLER                    PIC X(42)    VALUE             IF1164.2
   000137         014200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1164.2
   000138         014300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1164.2 IMP
   000139         014400 01  CCVS-H-2A.                                                   IF1164.2
   000140         014500   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1164.2 IMP
   000141         014600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1164.2
   000142         014700   02  FILLER                        PIC XXXX   VALUE             IF1164.2
   000143         014800     "4.2 ".                                                      IF1164.2
   000144         014900   02  FILLER                        PIC X(28)  VALUE             IF1164.2
   000145         015000            " COPY - NOT FOR DISTRIBUTION".                       IF1164.2
   000146         015100   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1164.2 IMP
   000147         015200                                                                  IF1164.2
   000148         015300 01  CCVS-H-2B.                                                   IF1164.2
   000149         015400   02  FILLER                        PIC X(15)  VALUE             IF1164.2
   000150         015500            "TEST RESULT OF ".                                    IF1164.2
   000151         015600   02  TEST-ID                       PIC X(9).                    IF1164.2
   000152         015700   02  FILLER                        PIC X(4)   VALUE             IF1164.2
   000153         015800            " IN ".                                               IF1164.2
   000154         015900   02  FILLER                        PIC X(12)  VALUE             IF1164.2
   000155         016000     " HIGH       ".                                              IF1164.2
   000156         016100   02  FILLER                        PIC X(22)  VALUE             IF1164.2
   000157         016200            " LEVEL VALIDATION FOR ".                             IF1164.2
   000158         016300   02  FILLER                        PIC X(58)  VALUE             IF1164.2
   000159         016400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1164.2
   000160         016500 01  CCVS-H-3.                                                    IF1164.2
   000161         016600     02  FILLER                      PIC X(34)  VALUE             IF1164.2
   000162         016700            " FOR OFFICIAL USE ONLY    ".                         IF1164.2
   000163         016800     02  FILLER                      PIC X(58)  VALUE             IF1164.2
   000164         016900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1164.2
   000165         017000     02  FILLER                      PIC X(28)  VALUE             IF1164.2
   000166         017100            "  COPYRIGHT   1985 ".                                IF1164.2
   000167         017200 01  CCVS-E-1.                                                    IF1164.2
   000168         017300     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1164.2
   000170         017500     02 ID-AGAIN                     PIC X(9).                    IF1164.2
   000171         017600     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1164.2 IMP
   000172         017700 01  CCVS-E-2.                                                    IF1164.2
   000173         017800     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1164.2 IMP
   000174         017900     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1164.2 IMP
   000175         018000     02 CCVS-E-2-2.                                               IF1164.2
   000176         018100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1164.2 IMP
   000177         018200         03 FILLER                   PIC X      VALUE SPACE.      IF1164.2 IMP
   000178         018300         03 ENDER-DESC               PIC X(44)  VALUE             IF1164.2
   000179         018400            "ERRORS ENCOUNTERED".                                 IF1164.2
   000180         018500 01  CCVS-E-3.                                                    IF1164.2
   000181         018600     02  FILLER                      PIC X(22)  VALUE             IF1164.2
   000182         018700            " FOR OFFICIAL USE ONLY".                             IF1164.2
   000183         018800     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1164.2 IMP
   000184         018900     02  FILLER                      PIC X(58)  VALUE             IF1164.2
   000185         019000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1164.2
   000186         019100     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1164.2 IMP
   000187         019200     02 FILLER                       PIC X(15)  VALUE             IF1164.2
   000188         019300             " COPYRIGHT 1985".                                   IF1164.2
   000189         019400 01  CCVS-E-4.                                                    IF1164.2
   000190         019500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1164.2 IMP
   000191         019600     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1164.2
   000192         019700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1164.2 IMP
   000193         019800     02 FILLER                       PIC X(40)  VALUE             IF1164.2
   000194         019900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1164.2
   000195         020000 01  XXINFO.                                                      IF1164.2
   000196         020100     02 FILLER                       PIC X(19)  VALUE             IF1164.2
   000197         020200            "*** INFORMATION ***".                                IF1164.2
   000198         020300     02 INFO-TEXT.                                                IF1164.2
   000199         020400       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1164.2 IMP
   000200         020500       04 XXCOMPUTED                 PIC X(20).                   IF1164.2
   000201         020600       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1164.2 IMP
   000202         020700       04 XXCORRECT                  PIC X(20).                   IF1164.2
   000203         020800     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1164.2
   000204         020900 01  HYPHEN-LINE.                                                 IF1164.2
   000205         021000     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1164.2 IMP
   000206         021100     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1164.2
   000207         021200-    "*****************************************".                 IF1164.2
   000208         021300     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1164.2
   000209         021400-    "******************************".                            IF1164.2
   000210         021500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1164.2
   000211         021600     "IF116A".                                                    IF1164.2
   000212         021700 PROCEDURE DIVISION.                                              IF1164.2
   000213         021800 CCVS1 SECTION.                                                   IF1164.2
   000214         021900 OPEN-FILES.                                                      IF1164.2
   000215         022000     OPEN     OUTPUT PRINT-FILE.                                  IF1164.2 21
   000216         022100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1164.2 210 151 210 170
   000217         022200     MOVE    SPACE TO TEST-RESULTS.                               IF1164.2 IMP 43
   000218         022300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1164.2 241 246
   000219         022400     GO TO CCVS1-EXIT.                                            IF1164.2 334
   000220         022500 CLOSE-FILES.                                                     IF1164.2
   000221         022600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1164.2 250 270 21
   000222         022700 TERMINATE-CCVS.                                                  IF1164.2
   000223         022800     STOP     RUN.                                                IF1164.2
   000224         022900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1164.2 47 127
   000225         023000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1164.2 47 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1164.2 47 126
   000227         023200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1164.2 47 125
   000228         023300     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1164.2 54
   000229         023400 PRINT-DETAIL.                                                    IF1164.2
   000230         023500     IF REC-CT NOT EQUAL TO ZERO                                  IF1164.2 124 IMP
   000231      1  023600             MOVE "." TO PARDOT-X                                 IF1164.2 51
   000232      1  023700             MOVE REC-CT TO DOTVALUE.                             IF1164.2 124 52
   000233         023800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1164.2 43 22 282
   000234         023900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1164.2 47 282
   000235      1  024000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1164.2 303 323
   000236      1  024100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1164.2 324 333
   000237         024200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1164.2 IMP 47 IMP 59
   000238         024300     MOVE SPACE TO CORRECT-X.                                     IF1164.2 IMP 73
   000239         024400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1164.2 124 IMP IMP 49
   000240         024500     MOVE     SPACE TO RE-MARK.                                   IF1164.2 IMP 54
   000241         024600 HEAD-ROUTINE.                                                    IF1164.2
   000242         024700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1164.2 134 23 282
   000243         024800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1164.2 139 23 282
   000244         024900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1164.2 148 23 282
   000245         025000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1164.2 160 23 282
   000246         025100 COLUMN-NAMES-ROUTINE.                                            IF1164.2
   000247         025200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1164.2 112 23 282
   000248         025300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1164.2 117 23 282
   000249         025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1164.2 204 23 282
   000250         025500 END-ROUTINE.                                                     IF1164.2
   000251         025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1164.2 204 23 282
   000252         025700 END-RTN-EXIT.                                                    IF1164.2
   000253         025800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1164.2 167 23 282
   000254         025900 END-ROUTINE-1.                                                   IF1164.2
   000255         026000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1164.2 126 130 127
   000256         026100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1164.2 130 125 130
   000257         026200      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1164.2 128 130
   000258         026300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1164.2 128 190
   000259         026400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1164.2 130 192
   000260         026500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1164.2 189 175
   000261         026600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1164.2 172 23 282
   000262         026700  END-ROUTINE-12.                                                 IF1164.2
   000263         026800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1164.2 178
   000264         026900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1164.2 126 IMP
   000265      1  027000         MOVE "NO " TO ERROR-TOTAL                                IF1164.2 176
   000266         027100         ELSE                                                     IF1164.2
   000267      1  027200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1164.2 126 176
   000268         027300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1164.2 172 23
   000269         027400     PERFORM WRITE-LINE.                                          IF1164.2 282
   000270         027500 END-ROUTINE-13.                                                  IF1164.2
   000271         027600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1164.2 125 IMP
   000272      1  027700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1164.2 176
   000273      1  027800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1164.2 125 176
   000274         027900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1164.2 178
   000275         028000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1164.2 172 23 282
   000276         028100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1164.2 127 IMP
   000277      1  028200          MOVE "NO " TO ERROR-TOTAL                               IF1164.2 176
   000278      1  028300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1164.2 127 176
   000279         028400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1164.2 178
   000280         028500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1164.2 172 23 282
   000281         028600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1164.2 180 23 282
   000282         028700 WRITE-LINE.                                                      IF1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     ADD 1 TO RECORD-COUNT.                                       IF1164.2 132
   000284         028900     IF RECORD-COUNT GREATER 42                                   IF1164.2 132
   000285      1  029000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1164.2 23 131
   000286      1  029100         MOVE SPACE TO DUMMY-RECORD                               IF1164.2 IMP 23
   000287      1  029200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1164.2 23
   000288      1  029300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1164.2 134 23 298
   000289      1  029400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1164.2 139 23 298
   000290      1  029500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1164.2 148 23 298
   000291      1  029600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1164.2 160 23 298
   000292      1  029700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1164.2 112 23 298
   000293      1  029800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1164.2 117 23 298
   000294      1  029900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1164.2 204 23 298
   000295      1  030000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1164.2 131 23
   000296      1  030100         MOVE ZERO TO RECORD-COUNT.                               IF1164.2 IMP 132
   000297         030200     PERFORM WRT-LN.                                              IF1164.2 298
   000298         030300 WRT-LN.                                                          IF1164.2
   000299         030400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1164.2 23
   000300         030500     MOVE SPACE TO DUMMY-RECORD.                                  IF1164.2 IMP 23
   000301         030600 BLANK-LINE-PRINT.                                                IF1164.2
   000302         030700     PERFORM WRT-LN.                                              IF1164.2 298
   000303         030800 FAIL-ROUTINE.                                                    IF1164.2
   000304         030900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1164.2 59 IMP
   000305      1  031000            GO TO FAIL-ROUTINE-WRITE.                             IF1164.2 312
   000306         031100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1164.2 73 IMP 312
   000307         031200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1164.2 133 203
   000308         031300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1164.2 198
   000309         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1164.2 195 23 282
   000310         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1164.2 IMP 203
   000311         031600     GO TO  FAIL-ROUTINE-EX.                                      IF1164.2 323
   000312         031700 FAIL-ROUTINE-WRITE.                                              IF1164.2
   000313         031800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1164.2 55 22 282
   000314         031900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1164.2 133 83
   000315         032000                              CORMA-ANSI-REFERENCE.               IF1164.2 111
   000316         032100     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1164.2 89 IMP
   000317      1  032200           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1164.2 84 22 282
   000318      1  032300           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1164.2 98 22 282
   000319         032400     ELSE                                                         IF1164.2
   000320      1  032500           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1164.2 70 22 282
   000321         032600     PERFORM WRITE-LINE.                                          IF1164.2 282
   000322         032700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1164.2 IMP 83
   000323         032800 FAIL-ROUTINE-EX. EXIT.                                           IF1164.2
   000324         032900 BAIL-OUT.                                                        IF1164.2
   000325         033000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1164.2 60 IMP 327
   000326         033100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1164.2 74 IMP 333
   000327         033200 BAIL-OUT-WRITE.                                                  IF1164.2
   000328         033300     MOVE CORRECT-A TO XXCORRECT.                                 IF1164.2 74 202
   000329         033400     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1164.2 60 200
   000330         033500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1164.2 133 203
   000331         033600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1164.2 195 23 282
   000332         033700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1164.2 IMP 203
   000333         033800 BAIL-OUT-EX. EXIT.                                               IF1164.2
   000334         033900 CCVS1-EXIT.                                                      IF1164.2
   000335         034000     EXIT.                                                        IF1164.2
   000336         034200*                                                      *          IF1164.2
   000337         034300*    Intrinsic Function Tests         IF116A - LOG     *          IF1164.2
   000338         034400*                                                      *          IF1164.2
   000339         034600 SECT-IF116A SECTION.                                             IF1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034700 F-LOG-INFO.                                                      IF1164.2
   000341         034800     MOVE     "See ref. A-49 2.20" TO ANSI-REFERENCE.             IF1164.2 133
   000342         034900     MOVE     "LOG Function" TO FEATURE.                          IF1164.2 45
   000343         035100 F-LOG-01.                                                        IF1164.2
   000344         035200     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000345         035300     MOVE  0.999980 TO MIN-RANGE.                                 IF1164.2 39
   000346         035400     MOVE  1.00002 TO MAX-RANGE.                                  IF1164.2 40
   000347         035500 F-LOG-TEST-01.                                                   IF1164.2
   000348         035600     COMPUTE WS-NUM = FUNCTION LOG(E).                            IF1164.2 38 IFN 30
   000349         035700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000350         035800        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000351      1  035900                    PERFORM PASS                                  IF1164.2 225
   000352         036000     ELSE                                                         IF1164.2
   000353      1  036100                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000354      1  036200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000355      1  036300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000356      1  036400                    PERFORM FAIL.                                 IF1164.2 226
   000357         036500     GO TO F-LOG-WRITE-01.                                        IF1164.2 361
   000358         036600 F-LOG-DELETE-01.                                                 IF1164.2
   000359         036700     PERFORM  DE-LETE.                                            IF1164.2 227
   000360         036800     GO TO    F-LOG-WRITE-01.                                     IF1164.2 361
   000361         036900 F-LOG-WRITE-01.                                                  IF1164.2
   000362         037000     MOVE "F-LOG-01" TO PAR-NAME.                                 IF1164.2 49
   000363         037100     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000364         037300 F-LOG-02.                                                        IF1164.2
   000365         037400     EVALUATE FUNCTION LOG(1)                                     IF1164.2 IFN
   000366         037500     WHEN -0.000020 THRU 0.000020                                 IF1164.2
   000367      1  037600                 PERFORM PASS                                     IF1164.2 225
   000368         037700     WHEN OTHER                                                   IF1164.2
   000369      1  037800                 PERFORM FAIL.                                    IF1164.2 226
   000370         037900     GO TO F-LOG-WRITE-02.                                        IF1164.2 374
   000371         038000 F-LOG-DELETE-02.                                                 IF1164.2
   000372         038100     PERFORM  DE-LETE.                                            IF1164.2 227
   000373         038200     GO TO    F-LOG-WRITE-02.                                     IF1164.2 374
   000374         038300 F-LOG-WRITE-02.                                                  IF1164.2
   000375         038400     MOVE "F-LOG-02" TO PAR-NAME.                                 IF1164.2 49
   000376         038500     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000377         038700 F-LOG-04.                                                        IF1164.2
   000378         038800     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000379         038900     MOVE -6.90789  TO MIN-RANGE.                                 IF1164.2 39
   000380         039000     MOVE -6.90761  TO MAX-RANGE.                                 IF1164.2 40
   000381         039100 F-LOG-TEST-04.                                                   IF1164.2
   000382         039200     COMPUTE WS-NUM = FUNCTION LOG(.001).                         IF1164.2 38 IFN
   000383         039300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000384         039400        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000385      1  039500                    PERFORM PASS                                  IF1164.2 225
   000386         039600     ELSE                                                         IF1164.2
   000387      1  039700                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000388      1  039800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000389      1  039900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000390      1  040000                    PERFORM FAIL.                                 IF1164.2 226
   000391         040100     GO TO F-LOG-WRITE-04.                                        IF1164.2 395
   000392         040200 F-LOG-DELETE-04.                                                 IF1164.2
   000393         040300     PERFORM  DE-LETE.                                            IF1164.2 227
   000394         040400     GO TO    F-LOG-WRITE-04.                                     IF1164.2 395
   000395         040500 F-LOG-WRITE-04.                                                  IF1164.2
   000396         040600     MOVE "F-LOG-04" TO PAR-NAME.                                 IF1164.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040700     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000398         040900 F-LOG-05.                                                        IF1164.2
   000399         041000     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000400         041100     MOVE  9.21015 TO MIN-RANGE.                                  IF1164.2 39
   000401         041200     MOVE  9.21524 TO MAX-RANGE.                                  IF1164.2 40
   000402         041300 F-LOG-TEST-05.                                                   IF1164.2
   000403         041400     COMPUTE WS-NUM = FUNCTION LOG(10000).                        IF1164.2 38 IFN
   000404         041500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000405         041600        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000406      1  041700                    PERFORM PASS                                  IF1164.2 225
   000407         041800     ELSE                                                         IF1164.2
   000408      1  041900                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000409      1  042000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000410      1  042100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000411      1  042200                    PERFORM FAIL.                                 IF1164.2 226
   000412         042300     GO TO F-LOG-WRITE-05.                                        IF1164.2 416
   000413         042400 F-LOG-DELETE-05.                                                 IF1164.2
   000414         042500     PERFORM  DE-LETE.                                            IF1164.2 227
   000415         042600     GO TO    F-LOG-WRITE-05.                                     IF1164.2 416
   000416         042700 F-LOG-WRITE-05.                                                  IF1164.2
   000417         042800     MOVE "F-LOG-05" TO PAR-NAME.                                 IF1164.2 49
   000418         042900     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000419         043100 F-LOG-06.                                                        IF1164.2
   000420         043200     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000421         043300     MOVE  8.01598 TO MIN-RANGE.                                  IF1164.2 39
   000422         043400     MOVE  8.01630 TO MAX-RANGE.                                  IF1164.2 40
   000423         043500 F-LOG-TEST-06.                                                   IF1164.2
   000424         043600     COMPUTE WS-NUM = FUNCTION LOG(3029.48).                      IF1164.2 38 IFN
   000425         043700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000426         043800        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000427      1  043900                    PERFORM PASS                                  IF1164.2 225
   000428         044000     ELSE                                                         IF1164.2
   000429      1  044100                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000430      1  044200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000431      1  044300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000432      1  044400                    PERFORM FAIL.                                 IF1164.2 226
   000433         044500     GO TO F-LOG-WRITE-06.                                        IF1164.2 437
   000434         044600 F-LOG-DELETE-06.                                                 IF1164.2
   000435         044700     PERFORM  DE-LETE.                                            IF1164.2 227
   000436         044800     GO TO    F-LOG-WRITE-06.                                     IF1164.2 437
   000437         044900 F-LOG-WRITE-06.                                                  IF1164.2
   000438         045000     MOVE "F-LOG-06" TO PAR-NAME.                                 IF1164.2 49
   000439         045100     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000440         045300 F-LOG-07.                                                        IF1164.2
   000441         045400     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000442         045500     MOVE -9.90368 TO MIN-RANGE.                                  IF1164.2 39
   000443         045600     MOVE -9.90328 TO MAX-RANGE.                                  IF1164.2 40
   000444         045700 F-LOG-TEST-07.                                                   IF1164.2
   000445         045800     COMPUTE WS-NUM = FUNCTION LOG(.00005).                       IF1164.2 38 IFN
   000446         045900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000447         046000        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000448      1  046100                    PERFORM PASS                                  IF1164.2 225
   000449         046200     ELSE                                                         IF1164.2
   000450      1  046300                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000451      1  046400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000452      1  046500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000453      1  046600                    PERFORM FAIL.                                 IF1164.2 226
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046700     GO TO F-LOG-WRITE-07.                                        IF1164.2 458
   000455         046800 F-LOG-DELETE-07.                                                 IF1164.2
   000456         046900     PERFORM  DE-LETE.                                            IF1164.2 227
   000457         047000     GO TO    F-LOG-WRITE-07.                                     IF1164.2 458
   000458         047100 F-LOG-WRITE-07.                                                  IF1164.2
   000459         047200     MOVE "F-LOG-07" TO PAR-NAME.                                 IF1164.2 49
   000460         047300     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000461         047500 F-LOG-08.                                                        IF1164.2
   000462         047600     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000463         047700     MOVE  13.3044 TO MIN-RANGE.                                  IF1164.2 39
   000464         047800     MOVE  13.3050 TO MAX-RANGE.                                  IF1164.2 40
   000465         047900 F-LOG-TEST-08.                                                   IF1164.2
   000466         048000     COMPUTE WS-NUM = FUNCTION LOG(A).                            IF1164.2 38 IFN 26
   000467         048100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000468         048200        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000469      1  048300                    PERFORM PASS                                  IF1164.2 225
   000470         048400     ELSE                                                         IF1164.2
   000471      1  048500                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000472      1  048600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000473      1  048700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000474      1  048800                    PERFORM FAIL.                                 IF1164.2 226
   000475         048900     GO TO F-LOG-WRITE-08.                                        IF1164.2 479
   000476         049000 F-LOG-DELETE-08.                                                 IF1164.2
   000477         049100     PERFORM  DE-LETE.                                            IF1164.2 227
   000478         049200     GO TO    F-LOG-WRITE-08.                                     IF1164.2 479
   000479         049300 F-LOG-WRITE-08.                                                  IF1164.2
   000480         049400     MOVE "F-LOG-08" TO PAR-NAME.                                 IF1164.2 49
   000481         049500     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000482         049700 F-LOG-09.                                                        IF1164.2
   000483         049800     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000484         049900     MOVE  10.3733 TO MIN-RANGE.                                  IF1164.2 39
   000485         050000     MOVE  10.3737 TO MAX-RANGE.                                  IF1164.2 40
   000486         050100 F-LOG-TEST-09.                                                   IF1164.2
   000487         050200     COMPUTE WS-NUM = FUNCTION LOG(F).                            IF1164.2 38 IFN 31
   000488         050300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000489         050400        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000490      1  050500                    PERFORM PASS                                  IF1164.2 225
   000491         050600     ELSE                                                         IF1164.2
   000492      1  050700                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000493      1  050800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000494      1  050900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000495      1  051000                    PERFORM FAIL.                                 IF1164.2 226
   000496         051100     GO TO F-LOG-WRITE-09.                                        IF1164.2 500
   000497         051200 F-LOG-DELETE-09.                                                 IF1164.2
   000498         051300     PERFORM  DE-LETE.                                            IF1164.2 227
   000499         051400     GO TO    F-LOG-WRITE-09.                                     IF1164.2 500
   000500         051500 F-LOG-WRITE-09.                                                  IF1164.2
   000501         051600     MOVE "F-LOG-09" TO PAR-NAME.                                 IF1164.2 49
   000502         051700     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000503         051900 F-LOG-10.                                                        IF1164.2
   000504         052000     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000505         052100     MOVE -10.8199 TO MIN-RANGE.                                  IF1164.2 39
   000506         052200     MOVE -10.8195 TO MAX-RANGE.                                  IF1164.2 40
   000507         052300 F-LOG-TEST-10.                                                   IF1164.2
   000508         052400     COMPUTE WS-NUM = FUNCTION LOG(G).                            IF1164.2 38 IFN 32
   000509         052500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000510         052600        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  052700                    PERFORM PASS                                  IF1164.2 225
   000512         052800     ELSE                                                         IF1164.2
   000513      1  052900                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000514      1  053000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000515      1  053100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000516      1  053200                    PERFORM FAIL.                                 IF1164.2 226
   000517         053300     GO TO F-LOG-WRITE-10.                                        IF1164.2 521
   000518         053400 F-LOG-DELETE-10.                                                 IF1164.2
   000519         053500     PERFORM  DE-LETE.                                            IF1164.2 227
   000520         053600     GO TO    F-LOG-WRITE-10.                                     IF1164.2 521
   000521         053700 F-LOG-WRITE-10.                                                  IF1164.2
   000522         053800     MOVE "F-LOG-10" TO PAR-NAME.                                 IF1164.2 49
   000523         053900     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000524         054100 F-LOG-11.                                                        IF1164.2
   000525         054200     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000526         054300     MOVE  1.09859 TO MIN-RANGE.                                  IF1164.2 39
   000527         054400     MOVE  1.09863 TO MAX-RANGE.                                  IF1164.2 40
   000528         054500 F-LOG-TEST-11.                                                   IF1164.2
   000529         054600     COMPUTE WS-NUM = FUNCTION LOG(IND(4)).                       IF1164.2 38 IFN 36
   000530         054700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000531         054800        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000532      1  054900                    PERFORM PASS                                  IF1164.2 225
   000533         055000     ELSE                                                         IF1164.2
   000534      1  055100                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000535      1  055200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000536      1  055300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000537      1  055400                    PERFORM FAIL.                                 IF1164.2 226
   000538         055500     GO TO F-LOG-WRITE-11.                                        IF1164.2 542
   000539         055600 F-LOG-DELETE-11.                                                 IF1164.2
   000540         055700     PERFORM  DE-LETE.                                            IF1164.2 227
   000541         055800     GO TO    F-LOG-WRITE-11.                                     IF1164.2 542
   000542         055900 F-LOG-WRITE-11.                                                  IF1164.2
   000543         056000     MOVE "F-LOG-11" TO PAR-NAME.                                 IF1164.2 49
   000544         056100     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000545         056300 F-LOG-12.                                                        IF1164.2
   000546         056400     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000547         056500     MOVE  1.00032 TO MIN-RANGE.                                  IF1164.2 39
   000548         056600     MOVE  1.00040 TO MAX-RANGE.                                  IF1164.2 40
   000549         056700 F-LOG-TEST-12.                                                   IF1164.2
   000550         056800     COMPUTE WS-NUM = FUNCTION LOG(E + .001).                     IF1164.2 38 IFN 30
   000551         056900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000552         057000        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000553      1  057100                    PERFORM PASS                                  IF1164.2 225
   000554         057200     ELSE                                                         IF1164.2
   000555      1  057300                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000556      1  057400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000557      1  057500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000558      1  057600                    PERFORM FAIL.                                 IF1164.2 226
   000559         057700     GO TO F-LOG-WRITE-12.                                        IF1164.2 563
   000560         057800 F-LOG-DELETE-12.                                                 IF1164.2
   000561         057900     PERFORM  DE-LETE.                                            IF1164.2 227
   000562         058000     GO TO    F-LOG-WRITE-12.                                     IF1164.2 563
   000563         058100 F-LOG-WRITE-12.                                                  IF1164.2
   000564         058200     MOVE "F-LOG-12" TO PAR-NAME.                                 IF1164.2 49
   000565         058300     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000566         058500 F-LOG-13.                                                        IF1164.2
   000567         058600     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058700     MOVE -2.30267 TO MIN-RANGE.                                  IF1164.2 39
   000569         058800     MOVE -2.30249 TO MAX-RANGE.                                  IF1164.2 40
   000570         058900 F-LOG-TEST-13.                                                   IF1164.2
   000571         059000     COMPUTE WS-NUM = FUNCTION LOG(1 / 10).                       IF1164.2 38 IFN
   000572         059100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000573         059200        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000574      1  059300                    PERFORM PASS                                  IF1164.2 225
   000575         059400     ELSE                                                         IF1164.2
   000576      1  059500                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000577      1  059600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000578      1  059700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000579      1  059800                    PERFORM FAIL.                                 IF1164.2 226
   000580         059900     GO TO F-LOG-WRITE-13.                                        IF1164.2 584
   000581         060000 F-LOG-DELETE-13.                                                 IF1164.2
   000582         060100     PERFORM  DE-LETE.                                            IF1164.2 227
   000583         060200     GO TO    F-LOG-WRITE-13.                                     IF1164.2 584
   000584         060300 F-LOG-WRITE-13.                                                  IF1164.2
   000585         060400     MOVE "F-LOG-13" TO PAR-NAME.                                 IF1164.2 49
   000586         060500     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000587         060700 F-LOG-14.                                                        IF1164.2
   000588         060800     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000589         060900     MOVE  0.962479 TO MIN-RANGE.                                 IF1164.2 39
   000590         061000     MOVE  0.962556 TO MAX-RANGE.                                 IF1164.2 40
   000591         061100 F-LOG-TEST-14.                                                   IF1164.2
   000592         061200     COMPUTE WS-NUM = FUNCTION LOG(E - .1).                       IF1164.2 38 IFN 30
   000593         061300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000594         061400        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000595      1  061500                    PERFORM PASS                                  IF1164.2 225
   000596         061600     ELSE                                                         IF1164.2
   000597      1  061700                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000598      1  061800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000599      1  061900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000600      1  062000                    PERFORM FAIL.                                 IF1164.2 226
   000601         062100     GO TO F-LOG-WRITE-14.                                        IF1164.2 605
   000602         062200 F-LOG-DELETE-14.                                                 IF1164.2
   000603         062300     PERFORM  DE-LETE.                                            IF1164.2 227
   000604         062400     GO TO    F-LOG-WRITE-14.                                     IF1164.2 605
   000605         062500 F-LOG-WRITE-14.                                                  IF1164.2
   000606         062600     MOVE "F-LOG-14" TO PAR-NAME.                                 IF1164.2 49
   000607         062700     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000608         062900 F-LOG-15.                                                        IF1164.2
   000609         063000     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000610         063100     MOVE -0.105364 TO MIN-RANGE.                                 IF1164.2 39
   000611         063200     MOVE -0.105356 TO MAX-RANGE.                                 IF1164.2 40
   000612         063300 F-LOG-TEST-15.                                                   IF1164.2
   000613         063400     COMPUTE WS-NUM = FUNCTION LOG(1 - .1).                       IF1164.2 38 IFN
   000614         063500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000615         063600        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000616      1  063700                    PERFORM PASS                                  IF1164.2 225
   000617         063800     ELSE                                                         IF1164.2
   000618      1  063900                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000619      1  064000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000620      1  064100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000621      1  064200                    PERFORM FAIL.                                 IF1164.2 226
   000622         064300     GO TO F-LOG-WRITE-15.                                        IF1164.2 626
   000623         064400 F-LOG-DELETE-15.                                                 IF1164.2
   000624         064500     PERFORM  DE-LETE.                                            IF1164.2 227
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064600     GO TO    F-LOG-WRITE-15.                                     IF1164.2 626
   000626         064700 F-LOG-WRITE-15.                                                  IF1164.2
   000627         064800     MOVE "F-LOG-15" TO PAR-NAME.                                 IF1164.2 49
   000628         064900     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000629         065100 F-LOG-16.                                                        IF1164.2
   000630         065200     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000631         065300     MOVE  1.94583 TO MIN-RANGE.                                  IF1164.2 39
   000632         065400     MOVE  1.94599 TO MAX-RANGE.                                  IF1164.2 40
   000633         065500 F-LOG-TEST-16.                                                   IF1164.2
   000634         065600     COMPUTE WS-NUM = FUNCTION LOG(IND(D - 5)).                   IF1164.2 38 IFN 36 29
   000635         065700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000636         065800        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000637      1  065900                    PERFORM PASS                                  IF1164.2 225
   000638         066000     ELSE                                                         IF1164.2
   000639      1  066100                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000640      1  066200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000641      1  066300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000642      1  066400                    PERFORM FAIL.                                 IF1164.2 226
   000643         066500     GO TO F-LOG-WRITE-16.                                        IF1164.2 647
   000644         066600 F-LOG-DELETE-16.                                                 IF1164.2
   000645         066700     PERFORM  DE-LETE.                                            IF1164.2 227
   000646         066800     GO TO    F-LOG-WRITE-16.                                     IF1164.2 647
   000647         066900 F-LOG-WRITE-16.                                                  IF1164.2
   000648         067000     MOVE "F-LOG-16" TO PAR-NAME.                                 IF1164.2 49
   000649         067100     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000650         067300 F-LOG-17.                                                        IF1164.2
   000651         067400     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000652         067500     MOVE  2.99561 TO MIN-RANGE.                                  IF1164.2 39
   000653         067600     MOVE  2.99585 TO MAX-RANGE.                                  IF1164.2 40
   000654         067700 F-LOG-TEST-17.                                                   IF1164.2
   000655         067800     COMPUTE WS-NUM = FUNCTION LOG(2 * 10).                       IF1164.2 38 IFN
   000656         067900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000657         068000        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000658      1  068100                    PERFORM PASS                                  IF1164.2 225
   000659         068200     ELSE                                                         IF1164.2
   000660      1  068300                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000661      1  068400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000662      1  068500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000663      1  068600                    PERFORM FAIL.                                 IF1164.2 226
   000664         068700     GO TO F-LOG-WRITE-17.                                        IF1164.2 668
   000665         068800 F-LOG-DELETE-17.                                                 IF1164.2
   000666         068900     PERFORM  DE-LETE.                                            IF1164.2 227
   000667         069000     GO TO    F-LOG-WRITE-17.                                     IF1164.2 668
   000668         069100 F-LOG-WRITE-17.                                                  IF1164.2
   000669         069200     MOVE "F-LOG-17" TO PAR-NAME.                                 IF1164.2 49
   000670         069300     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000671         069500 F-LOG-18.                                                        IF1164.2
   000672         069600     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000673         069700     MOVE  1.09857 TO MIN-RANGE.                                  IF1164.2 39
   000674         069800     MOVE  1.09865 TO MAX-RANGE.                                  IF1164.2 40
   000675         069900 F-LOG-TEST-18.                                                   IF1164.2
   000676         070000     COMPUTE WS-NUM = FUNCTION LOG(B + C).                        IF1164.2 38 IFN 27 28
   000677         070100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000678         070200        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000679      1  070300                    PERFORM PASS                                  IF1164.2 225
   000680         070400     ELSE                                                         IF1164.2
   000681      1  070500                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682      1  070600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000683      1  070700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000684      1  070800                    PERFORM FAIL.                                 IF1164.2 226
   000685         070900     GO TO F-LOG-WRITE-18.                                        IF1164.2 689
   000686         071000 F-LOG-DELETE-18.                                                 IF1164.2
   000687         071100     PERFORM  DE-LETE.                                            IF1164.2 227
   000688         071200     GO TO    F-LOG-WRITE-18.                                     IF1164.2 689
   000689         071300 F-LOG-WRITE-18.                                                  IF1164.2
   000690         071400     MOVE "F-LOG-18" TO PAR-NAME.                                 IF1164.2 49
   000691         071500     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000692         071700 F-LOG-19.                                                        IF1164.2
   000693         071800     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000694         071900     MOVE  0.632497 TO MIN-RANGE.                                 IF1164.2 39
   000695         072000     MOVE  0.632547 TO MAX-RANGE.                                 IF1164.2 40
   000696         072100 F-LOG-TEST-19.                                                   IF1164.2
   000697         072200     COMPUTE WS-NUM = FUNCTION LOG(3.2 / 1.7).                    IF1164.2 38 IFN
   000698         072300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000699         072400        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000700      1  072500                    PERFORM PASS                                  IF1164.2 225
   000701         072600     ELSE                                                         IF1164.2
   000702      1  072700                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000703      1  072800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000704      1  072900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000705      1  073000                    PERFORM FAIL.                                 IF1164.2 226
   000706         073100     GO TO F-LOG-WRITE-19.                                        IF1164.2 710
   000707         073200 F-LOG-DELETE-19.                                                 IF1164.2
   000708         073300     PERFORM  DE-LETE.                                            IF1164.2 227
   000709         073400     GO TO    F-LOG-WRITE-19.                                     IF1164.2 710
   000710         073500 F-LOG-WRITE-19.                                                  IF1164.2
   000711         073600     MOVE "F-LOG-19" TO PAR-NAME.                                 IF1164.2 49
   000712         073700     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000713         073900 F-LOG-20.                                                        IF1164.2
   000714         074000     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000715         074100     MOVE  2.08164 TO MIN-RANGE.                                  IF1164.2 39
   000716         074200     MOVE  2.08180 TO MAX-RANGE.                                  IF1164.2 40
   000717         074300 F-LOG-TEST-20.                                                   IF1164.2
   000718         074400     COMPUTE WS-NUM = FUNCTION LOG(E - H).                        IF1164.2 38 IFN 30 33
   000719         074500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000720         074600        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000721      1  074700                    PERFORM PASS                                  IF1164.2 225
   000722         074800     ELSE                                                         IF1164.2
   000723      1  074900                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000724      1  075000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000725      1  075100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000726      1  075200                    PERFORM FAIL.                                 IF1164.2 226
   000727         075300     GO TO F-LOG-WRITE-20.                                        IF1164.2 731
   000728         075400 F-LOG-DELETE-20.                                                 IF1164.2
   000729         075500     PERFORM  DE-LETE.                                            IF1164.2 227
   000730         075600     GO TO    F-LOG-WRITE-20.                                     IF1164.2 731
   000731         075700 F-LOG-WRITE-20.                                                  IF1164.2
   000732         075800     MOVE "F-LOG-20" TO PAR-NAME.                                 IF1164.2 49
   000733         075900     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000734         076100 F-LOG-21.                                                        IF1164.2
   000735         076200     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000736         076300     MOVE  1.60937 TO MIN-RANGE.                                  IF1164.2 39
   000737         076400     MOVE  1.60949 TO MAX-RANGE.                                  IF1164.2 40
   000738         076500 F-LOG-TEST-21.                                                   IF1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         076600     COMPUTE WS-NUM = FUNCTION LOG(B - 2).                        IF1164.2 38 IFN 27
   000740         076700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000741         076800        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000742      1  076900                    PERFORM PASS                                  IF1164.2 225
   000743         077000     ELSE                                                         IF1164.2
   000744      1  077100                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000745      1  077200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000746      1  077300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000747      1  077400                    PERFORM FAIL.                                 IF1164.2 226
   000748         077500     GO TO F-LOG-WRITE-21.                                        IF1164.2 752
   000749         077600 F-LOG-DELETE-21.                                                 IF1164.2
   000750         077700     PERFORM  DE-LETE.                                            IF1164.2 227
   000751         077800     GO TO    F-LOG-WRITE-21.                                     IF1164.2 752
   000752         077900 F-LOG-WRITE-21.                                                  IF1164.2
   000753         078000     MOVE "F-LOG-21" TO PAR-NAME.                                 IF1164.2 49
   000754         078100     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000755         078300 F-LOG-22.                                                        IF1164.2
   000756         078400     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000757         078500     MOVE  1.48569 TO MIN-RANGE.                                  IF1164.2 39
   000758         078600     MOVE  1.48581 TO MAX-RANGE.                                  IF1164.2 40
   000759         078700 F-LOG-TEST-22.                                                   IF1164.2
   000760         078800     COMPUTE WS-NUM = FUNCTION LOG(E + 1.7).                      IF1164.2 38 IFN 30
   000761         078900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000762         079000        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000763      1  079100                    PERFORM PASS                                  IF1164.2 225
   000764         079200     ELSE                                                         IF1164.2
   000765      1  079300                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000766      1  079400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000767      1  079500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000768      1  079600                    PERFORM FAIL.                                 IF1164.2 226
   000769         079700     GO TO F-LOG-WRITE-22.                                        IF1164.2 773
   000770         079800 F-LOG-DELETE-22.                                                 IF1164.2
   000771         079900     PERFORM  DE-LETE.                                            IF1164.2 227
   000772         080000     GO TO    F-LOG-WRITE-22.                                     IF1164.2 773
   000773         080100 F-LOG-WRITE-22.                                                  IF1164.2
   000774         080200     MOVE "F-LOG-22" TO PAR-NAME.                                 IF1164.2 49
   000775         080300     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000776         080500 F-LOG-23.                                                        IF1164.2
   000777         080600     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000778         080700     MOVE 4.99980 TO MIN-RANGE.                                   IF1164.2 39
   000779         080800     MOVE 5.00002 TO MAX-RANGE.                                   IF1164.2 40
   000780         080900 F-LOG-TEST-23.                                                   IF1164.2
   000781         081000     COMPUTE WS-NUM = FUNCTION LOG(E) + 4.                        IF1164.2 38 IFN 30
   000782         081100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000783         081200        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000784      1  081300                    PERFORM PASS                                  IF1164.2 225
   000785         081400     ELSE                                                         IF1164.2
   000786      1  081500                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000787      1  081600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000788      1  081700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000789      1  081800                    PERFORM FAIL.                                 IF1164.2 226
   000790         081900     GO TO F-LOG-WRITE-23.                                        IF1164.2 794
   000791         082000 F-LOG-DELETE-23.                                                 IF1164.2
   000792         082100     PERFORM  DE-LETE.                                            IF1164.2 227
   000793         082200     GO TO    F-LOG-WRITE-23.                                     IF1164.2 794
   000794         082300 F-LOG-WRITE-23.                                                  IF1164.2
   000795         082400     MOVE "F-LOG-23" TO PAR-NAME.                                 IF1164.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         082500     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000797         082700 F-LOG-24.                                                        IF1164.2
   000798         082800     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000799         082900     MOVE 0.665702 TO MIN-RANGE.                                  IF1164.2 39
   000800         083000     MOVE 0.665756 TO MAX-RANGE.                                  IF1164.2 40
   000801         083100 F-LOG-TEST-24.                                                   IF1164.2
   000802         083200     COMPUTE WS-NUM = FUNCTION LOG(FUNCTION LOG(B)).              IF1164.2 38 IFN IFN 27
   000803         083300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000804         083400        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000805      1  083500                    PERFORM PASS                                  IF1164.2 225
   000806         083600     ELSE                                                         IF1164.2
   000807      1  083700                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000808      1  083800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000809      1  083900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000810      1  084000                    PERFORM FAIL.                                 IF1164.2 226
   000811         084100     GO TO F-LOG-WRITE-24.                                        IF1164.2 815
   000812         084200 F-LOG-DELETE-24.                                                 IF1164.2
   000813         084300     PERFORM  DE-LETE.                                            IF1164.2 227
   000814         084400     GO TO    F-LOG-WRITE-24.                                     IF1164.2 815
   000815         084500 F-LOG-WRITE-24.                                                  IF1164.2
   000816         084600     MOVE "F-LOG-24" TO PAR-NAME.                                 IF1164.2 49
   000817         084700     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000818         084900 F-LOG-25.                                                        IF1164.2
   000819         085000     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000820         085100     MOVE 1.69307 TO MIN-RANGE.                                   IF1164.2 39
   000821         085200     MOVE 1.69321 TO MAX-RANGE.                                   IF1164.2 40
   000822         085300 F-LOG-TEST-25.                                                   IF1164.2
   000823         085400     COMPUTE WS-NUM = FUNCTION LOG(E) +                           IF1164.2 38 IFN 30
   000824         085500                      FUNCTION LOG(2).                            IF1164.2 IFN
   000825         085600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1164.2 38 39
   000826         085700        (WS-NUM <= MAX-RANGE) THEN                                IF1164.2 38 40
   000827      1  085800                    PERFORM PASS                                  IF1164.2 225
   000828         085900     ELSE                                                         IF1164.2
   000829      1  086000                    MOVE WS-NUM TO COMPUTED-N                     IF1164.2 38 61
   000830      1  086100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1164.2 39 89
   000831      1  086200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1164.2 40 103
   000832      1  086300                    PERFORM FAIL.                                 IF1164.2 226
   000833         086400     GO TO F-LOG-WRITE-25.                                        IF1164.2 837
   000834         086500 F-LOG-DELETE-25.                                                 IF1164.2
   000835         086600     PERFORM  DE-LETE.                                            IF1164.2 227
   000836         086700     GO TO    F-LOG-WRITE-25.                                     IF1164.2 837
   000837         086800 F-LOG-WRITE-25.                                                  IF1164.2
   000838         086900     MOVE "F-LOG-25" TO PAR-NAME.                                 IF1164.2 49
   000839         087000     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000840         087200 F-LOG-26.                                                        IF1164.2
   000841         087300     MOVE ZERO TO WS-NUM.                                         IF1164.2 IMP 38
   000842         087400     PERFORM F-LOG-TEST-26                                        IF1164.2 846
   000843         087500       UNTIL FUNCTION LOG(ARG1) > 1.                              IF1164.2 IFN 34
   000844         087600     PERFORM PASS.                                                IF1164.2 225
   000845         087700     GO TO F-LOG-WRITE-26.                                        IF1164.2 851
   000846         087800 F-LOG-TEST-26.                                                   IF1164.2
   000847         087900     COMPUTE ARG1 = ARG1 + 0.2.                                   IF1164.2 34 34
   000848         088000 F-LOG-DELETE-26.                                                 IF1164.2
   000849         088100     PERFORM  DE-LETE.                                            IF1164.2 227
   000850         088200     GO TO    F-LOG-WRITE-26.                                     IF1164.2 851
   000851         088300 F-LOG-WRITE-26.                                                  IF1164.2
   000852         088400     MOVE "F-LOG-26" TO PAR-NAME.                                 IF1164.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         088500     PERFORM  PRINT-DETAIL.                                       IF1164.2 229
   000854         088700 CCVS-EXIT SECTION.                                               IF1164.2
   000855         088800 CCVS-999999.                                                     IF1164.2
   000856         088900     GO TO CLOSE-FILES.                                           IF1164.2 220
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    19
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  466
      133   ANSI-REFERENCE . . . . . . . .  307 314 330 M341
       34   ARG1 . . . . . . . . . . . . .  843 M847 847
       35   ARR
       27   B. . . . . . . . . . . . . . .  676 739 802
       28   C. . . . . . . . . . . . . . .  676
      112   CCVS-C-1 . . . . . . . . . . .  247 292
      117   CCVS-C-2 . . . . . . . . . . .  248 293
      167   CCVS-E-1 . . . . . . . . . . .  253
      172   CCVS-E-2 . . . . . . . . . . .  261 268 275 280
      175   CCVS-E-2-2 . . . . . . . . . .  M260
      180   CCVS-E-3 . . . . . . . . . . .  281
      189   CCVS-E-4 . . . . . . . . . . .  260
      190   CCVS-E-4-1 . . . . . . . . . .  M258
      192   CCVS-E-4-2 . . . . . . . . . .  M259
      134   CCVS-H-1 . . . . . . . . . . .  242 288
      139   CCVS-H-2A. . . . . . . . . . .  243 289
      148   CCVS-H-2B. . . . . . . . . . .  244 290
      160   CCVS-H-3 . . . . . . . . . . .  245 291
      210   CCVS-PGM-ID. . . . . . . . . .  216 216
       66   CM-18V0
       60   COMPUTED-A . . . . . . . . . .  61 63 64 65 66 325 329
       61   COMPUTED-N . . . . . . . . . .  M353 M387 M408 M429 M450 M471 M492 M513 M534 M555 M576 M597 M618 M639 M660 M681
                                            M702 M723 M744 M765 M786 M807 M829
       59   COMPUTED-X . . . . . . . . . .  M237 304
       63   COMPUTED-0V18
       65   COMPUTED-14V4
       67   COMPUTED-18V0
       64   COMPUTED-4V14
       83   COR-ANSI-REFERENCE . . . . . .  M314 M322
      111   CORMA-ANSI-REFERENCE . . . . .  M315
       74   CORRECT-A. . . . . . . . . . .  75 76 77 78 79 326 328
      103   CORRECT-MAX. . . . . . . . . .  M355 M389 M410 M431 M452 M473 M494 M515 M536 M557 M578 M599 M620 M641 M662 M683
                                            M704 M725 M746 M767 M788 M809 M831
       89   CORRECT-MIN. . . . . . . . . .  316 M354 M388 M409 M430 M451 M472 M493 M514 M535 M556 M577 M598 M619 M640 M661
                                            M682 M703 M724 M745 M766 M787 M808 M830
       75   CORRECT-N
       73   CORRECT-X. . . . . . . . . . .  M238 306
       76   CORRECT-0V18
       78   CORRECT-14V4
       80   CORRECT-18V0
       77   CORRECT-4V14
      102   CORRECTMA-A. . . . . . . . . .  103 104 105 106 107
      101   CORRECTMA-X
      104   CORRECTMA-0V18
      106   CORRECTMA-14V4
      108   CORRECTMA-18V0
      105   CORRECTMA-4V14
       88   CORRECTMI-A. . . . . . . . . .  89 90 91 92 93
       87   CORRECTMI-X
       90   CORRECTMI-0V18
       92   CORRECTMI-14V4
       94   CORRECTMI-18V0
       91   CORRECTMI-4V14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    20
0 Defined   Cross-reference of data names   References

0      79   CR-18V0
       93   CR-18V0
      107   CR-18V0
       29   D. . . . . . . . . . . . . . .  634
      125   DELETE-COUNTER . . . . . . . .  M227 256 271 273
       52   DOTVALUE . . . . . . . . . . .  M232
      131   DUMMY-HOLD . . . . . . . . . .  M285 295
       23   DUMMY-RECORD . . . . . . . . .  M242 M243 M244 M245 M247 M248 M249 M251 M253 M261 M268 M275 M280 M281 285 M286
                                            287 M288 M289 M290 M291 M292 M293 M294 M295 299 M300 M309 M331
       30   E. . . . . . . . . . . . . . .  348 550 592 718 760 781 823
      178   ENDER-DESC . . . . . . . . . .  M263 M274 M279
      126   ERROR-COUNTER. . . . . . . . .  M226 255 264 267
      130   ERROR-HOLD . . . . . . . . . .  M255 M256 M256 M257 259
      176   ERROR-TOTAL. . . . . . . . . .  M265 M267 M272 M273 M277 M278
       31   F. . . . . . . . . . . . . . .  487
       45   FEATURE. . . . . . . . . . . .  M342
       32   G. . . . . . . . . . . . . . .  508
       33   H. . . . . . . . . . . . . . .  718
      204   HYPHEN-LINE. . . . . . . . . .  249 251 294
      170   ID-AGAIN . . . . . . . . . . .  M216
       36   IND. . . . . . . . . . . . . .  529 634
      203   INF-ANSI-REFERENCE . . . . . .  M307 M310 M330 M332
      198   INFO-TEXT. . . . . . . . . . .  M308
      127   INSPECT-COUNTER. . . . . . . .  M224 255 276 278
       40   MAX-RANGE. . . . . . . . . . .  M346 350 355 M380 384 389 M401 405 410 M422 426 431 M443 447 452 M464 468 473
                                            M485 489 494 M506 510 515 M527 531 536 M548 552 557 M569 573 578 M590 594 599
                                            M611 615 620 M632 636 641 M653 657 662 M674 678 683 M695 699 704 M716 720 725
                                            M737 741 746 M758 762 767 M779 783 788 M800 804 809 M821 826 831
       39   MIN-RANGE. . . . . . . . . . .  M345 349 354 M379 383 388 M400 404 409 M421 425 430 M442 446 451 M463 467 472
                                            M484 488 493 M505 509 514 M526 530 535 M547 551 556 M568 572 577 M589 593 598
                                            M610 614 619 M631 635 640 M652 656 661 M673 677 682 M694 698 703 M715 719 724
                                            M736 740 745 M757 761 766 M778 782 787 M799 803 808 M820 825 830
       47   P-OR-F . . . . . . . . . . . .  M224 M225 M226 M227 234 M237
       49   PAR-NAME . . . . . . . . . . .  M239 M362 M375 M396 M417 M438 M459 M480 M501 M522 M543 M564 M585 M606 M627 M648
                                            M669 M690 M711 M732 M753 M774 M795 M816 M838 M852
       51   PARDOT-X . . . . . . . . . . .  M231
      128   PASS-COUNTER . . . . . . . . .  M225 257 258
       21   PRINT-FILE . . . . . . . . . .  17 215 221
       22   PRINT-REC. . . . . . . . . . .  M233 M313 M317 M318 M320
       54   RE-MARK. . . . . . . . . . . .  M228 M240
      124   REC-CT . . . . . . . . . . . .  230 232 239
      123   REC-SKL-SUB
      132   RECORD-COUNT . . . . . . . . .  M283 284 M296
       37   TEMP
       55   TEST-COMPUTED. . . . . . . . .  313
       70   TEST-CORRECT . . . . . . . . .  320
       98   TEST-CORRECT-MAX . . . . . . .  318
       84   TEST-CORRECT-MIN . . . . . . .  317
      151   TEST-ID. . . . . . . . . . . .  M216
       43   TEST-RESULTS . . . . . . . . .  M217 233
      129   TOTAL-ERROR
       38   WS-NUM . . . . . . . . . . . .  M344 M348 349 350 353 M378 M382 383 384 387 M399 M403 404 405 408 M420 M424 425
                                            426 429 M441 M445 446 447 450 M462 M466 467 468 471 M483 M487 488 489 492 M504
                                            M508 509 510 513 M525 M529 530 531 534 M546 M550 551 552 555 M567 M571 572 573
                                            576 M588 M592 593 594 597 M609 M613 614 615 618 M630 M634 635 636 639 M651 M655
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    21
0 Defined   Cross-reference of data names   References

0                                           656 657 660 M672 M676 677 678 681 M693 M697 698 699 702 M714 M718 719 720 723
                                            M735 M739 740 741 744 M756 M760 761 762 765 M777 M781 782 783 786 M798 M802 803
                                            804 807 M819 M823 825 826 829 M841
      200   XXCOMPUTED . . . . . . . . . .  M329
      202   XXCORRECT. . . . . . . . . . .  M328
      195   XXINFO . . . . . . . . . . . .  309 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    22
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

      324   BAIL-OUT . . . . . . . . . . .  P236
      333   BAIL-OUT-EX. . . . . . . . . .  E236 G326
      327   BAIL-OUT-WRITE . . . . . . . .  G325
      301   BLANK-LINE-PRINT
      854   CCVS-EXIT
      855   CCVS-999999
      213   CCVS1
      334   CCVS1-EXIT . . . . . . . . . .  G219
      220   CLOSE-FILES. . . . . . . . . .  G856
      246   COLUMN-NAMES-ROUTINE . . . . .  E218
      227   DE-LETE. . . . . . . . . . . .  P359 P372 P393 P414 P435 P456 P477 P498 P519 P540 P561 P582 P603 P624 P645 P666
                                            P687 P708 P729 P750 P771 P792 P813 P835 P849
      250   END-ROUTINE. . . . . . . . . .  P221
      254   END-ROUTINE-1
      262   END-ROUTINE-12
      270   END-ROUTINE-13 . . . . . . . .  E221
      252   END-RTN-EXIT
      358   F-LOG-DELETE-01
      371   F-LOG-DELETE-02
      392   F-LOG-DELETE-04
      413   F-LOG-DELETE-05
      434   F-LOG-DELETE-06
      455   F-LOG-DELETE-07
      476   F-LOG-DELETE-08
      497   F-LOG-DELETE-09
      518   F-LOG-DELETE-10
      539   F-LOG-DELETE-11
      560   F-LOG-DELETE-12
      581   F-LOG-DELETE-13
      602   F-LOG-DELETE-14
      623   F-LOG-DELETE-15
      644   F-LOG-DELETE-16
      665   F-LOG-DELETE-17
      686   F-LOG-DELETE-18
      707   F-LOG-DELETE-19
      728   F-LOG-DELETE-20
      749   F-LOG-DELETE-21
      770   F-LOG-DELETE-22
      791   F-LOG-DELETE-23
      812   F-LOG-DELETE-24
      834   F-LOG-DELETE-25
      848   F-LOG-DELETE-26
      340   F-LOG-INFO
      347   F-LOG-TEST-01
      381   F-LOG-TEST-04
      402   F-LOG-TEST-05
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    23
0 Defined   Cross-reference of procedures   References

0     423   F-LOG-TEST-06
      444   F-LOG-TEST-07
      465   F-LOG-TEST-08
      486   F-LOG-TEST-09
      507   F-LOG-TEST-10
      528   F-LOG-TEST-11
      549   F-LOG-TEST-12
      570   F-LOG-TEST-13
      591   F-LOG-TEST-14
      612   F-LOG-TEST-15
      633   F-LOG-TEST-16
      654   F-LOG-TEST-17
      675   F-LOG-TEST-18
      696   F-LOG-TEST-19
      717   F-LOG-TEST-20
      738   F-LOG-TEST-21
      759   F-LOG-TEST-22
      780   F-LOG-TEST-23
      801   F-LOG-TEST-24
      822   F-LOG-TEST-25
      846   F-LOG-TEST-26. . . . . . . . .  P842
      361   F-LOG-WRITE-01 . . . . . . . .  G357 G360
      374   F-LOG-WRITE-02 . . . . . . . .  G370 G373
      395   F-LOG-WRITE-04 . . . . . . . .  G391 G394
      416   F-LOG-WRITE-05 . . . . . . . .  G412 G415
      437   F-LOG-WRITE-06 . . . . . . . .  G433 G436
      458   F-LOG-WRITE-07 . . . . . . . .  G454 G457
      479   F-LOG-WRITE-08 . . . . . . . .  G475 G478
      500   F-LOG-WRITE-09 . . . . . . . .  G496 G499
      521   F-LOG-WRITE-10 . . . . . . . .  G517 G520
      542   F-LOG-WRITE-11 . . . . . . . .  G538 G541
      563   F-LOG-WRITE-12 . . . . . . . .  G559 G562
      584   F-LOG-WRITE-13 . . . . . . . .  G580 G583
      605   F-LOG-WRITE-14 . . . . . . . .  G601 G604
      626   F-LOG-WRITE-15 . . . . . . . .  G622 G625
      647   F-LOG-WRITE-16 . . . . . . . .  G643 G646
      668   F-LOG-WRITE-17 . . . . . . . .  G664 G667
      689   F-LOG-WRITE-18 . . . . . . . .  G685 G688
      710   F-LOG-WRITE-19 . . . . . . . .  G706 G709
      731   F-LOG-WRITE-20 . . . . . . . .  G727 G730
      752   F-LOG-WRITE-21 . . . . . . . .  G748 G751
      773   F-LOG-WRITE-22 . . . . . . . .  G769 G772
      794   F-LOG-WRITE-23 . . . . . . . .  G790 G793
      815   F-LOG-WRITE-24 . . . . . . . .  G811 G814
      837   F-LOG-WRITE-25 . . . . . . . .  G833 G836
      851   F-LOG-WRITE-26 . . . . . . . .  G845 G850
      343   F-LOG-01
      364   F-LOG-02
      377   F-LOG-04
      398   F-LOG-05
      419   F-LOG-06
      440   F-LOG-07
      461   F-LOG-08
      482   F-LOG-09
      503   F-LOG-10
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    24
0 Defined   Cross-reference of procedures   References

0     524   F-LOG-11
      545   F-LOG-12
      566   F-LOG-13
      587   F-LOG-14
      608   F-LOG-15
      629   F-LOG-16
      650   F-LOG-17
      671   F-LOG-18
      692   F-LOG-19
      713   F-LOG-20
      734   F-LOG-21
      755   F-LOG-22
      776   F-LOG-23
      797   F-LOG-24
      818   F-LOG-25
      840   F-LOG-26
      226   FAIL . . . . . . . . . . . . .  P356 P369 P390 P411 P432 P453 P474 P495 P516 P537 P558 P579 P600 P621 P642 P663
                                            P684 P705 P726 P747 P768 P789 P810 P832
      303   FAIL-ROUTINE . . . . . . . . .  P235
      323   FAIL-ROUTINE-EX. . . . . . . .  E235 G311
      312   FAIL-ROUTINE-WRITE . . . . . .  G305 G306
      241   HEAD-ROUTINE . . . . . . . . .  P218
      224   INSPT
      214   OPEN-FILES
      225   PASS . . . . . . . . . . . . .  P351 P367 P385 P406 P427 P448 P469 P490 P511 P532 P553 P574 P595 P616 P637 P658
                                            P679 P700 P721 P742 P763 P784 P805 P827 P844
      229   PRINT-DETAIL . . . . . . . . .  P363 P376 P397 P418 P439 P460 P481 P502 P523 P544 P565 P586 P607 P628 P649 P670
                                            P691 P712 P733 P754 P775 P796 P817 P839 P853
      339   SECT-IF116A
      222   TERMINATE-CCVS
      282   WRITE-LINE . . . . . . . . . .  P233 P234 P242 P243 P244 P245 P247 P248 P249 P251 P253 P261 P269 P275 P280 P281
                                            P309 P313 P317 P318 P320 P321 P331
      298   WRT-LN . . . . . . . . . . . .  P288 P289 P290 P291 P292 P293 P294 P297 P302
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    25
0 Defined   Cross-reference of programs     References

        3   IF116A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF116A    Date 06/04/2022  Time 11:56:52   Page    26
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF116A:
 *    Source records = 856
 *    Data Division statements = 97
 *    Procedure Division statements = 505
 *    Generated COBOL statements = 0
 *    Program complexity factor = 515
0End of compilation 1,  program IF116A,  highest severity 0.
0Return code 0
