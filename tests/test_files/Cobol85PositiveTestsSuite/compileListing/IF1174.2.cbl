1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:35   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:35   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1174.2
   000002         000200 PROGRAM-ID.                                                      IF1174.2
   000003         000300     IF117A.                                                      IF1174.2
   000004         000400                                                                  IF1174.2
   000005         000600*                                                         *       IF1174.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1174.2
   000007         000800* It contains tests for the Intrinsic Function LOG10.     *       IF1174.2
   000008         000900*                                                         *       IF1174.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1174.2
   000010         001200 CONFIGURATION SECTION.                                           IF1174.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1174.2
   000012         001400     XXXXX082.                                                    IF1174.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1174.2
   000014         001600     XXXXX083.                                                    IF1174.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1174.2
   000016         001800 FILE-CONTROL.                                                    IF1174.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1174.2 21
   000018         002000     XXXXX055.                                                    IF1174.2
   000019         002100 DATA DIVISION.                                                   IF1174.2
   000020         002200 FILE SECTION.                                                    IF1174.2
   000021         002300 FD  PRINT-FILE.                                                  IF1174.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1174.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1174.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1174.2
   000025         002800* Variables specific to the Intrinsic Function Test IF117A*       IF1174.2
   000026         003000 01  A                   PIC S9(10)          VALUE 600000.        IF1174.2
   000027         003100 01  B                   PIC S9(10)          VALUE 7.             IF1174.2
   000028         003200 01  C                   PIC S9(10)          VALUE -4.            IF1174.2
   000029         003300 01  D                   PIC S9(10)          VALUE 10.            IF1174.2
   000030         003400 01  E                   PIC S9(1)V9(9)      VALUE 2.718281828.   IF1174.2
   000031         003500 01  F                   PIC S9(5)V9(5)      VALUE 32000.8.       IF1174.2
   000032         003600 01  G                   PIC S9(5)V9(5)      VALUE .00002.        IF1174.2
   000033         003700 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1174.2
   000034         003800 01  ARG1                PIC S9(5)V9(5)      VALUE 10.00.         IF1174.2
   000035         003900 01  ARR                                     VALUE "40537".       IF1174.2
   000036         004000     02  IND OCCURS 5 TIMES PIC 9.                                IF1174.2
   000037         004100 01  TEMP                PIC S9(10).                              IF1174.2
   000038         004200 01  WS-NUM              PIC S9(5)V9(6).                          IF1174.2
   000039         004300 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1174.2
   000040         004400 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1174.2
   000041         004500*                                                                 IF1174.2
   000042         004700*                                                                 IF1174.2
   000043         004800 01  TEST-RESULTS.                                                IF1174.2
   000044         004900     02 FILLER                   PIC X      VALUE SPACE.          IF1174.2 IMP
   000045         005000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1174.2 IMP
   000046         005100     02 FILLER                   PIC X      VALUE SPACE.          IF1174.2 IMP
   000047         005200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1174.2 IMP
   000048         005300     02 FILLER                   PIC X      VALUE SPACE.          IF1174.2 IMP
   000049         005400     02  PAR-NAME.                                                IF1174.2
   000050         005500       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1174.2 IMP
   000051         005600       03  PARDOT-X              PIC X      VALUE SPACE.          IF1174.2 IMP
   000052         005700       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1174.2 IMP
   000053         005800     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1174.2 IMP
   000054         005900     02 RE-MARK                  PIC X(61).                       IF1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000 01  TEST-COMPUTED.                                               IF1174.2
   000056         006100     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1174.2 IMP
   000057         006200     02 FILLER                   PIC X(17)  VALUE                 IF1174.2
   000058         006300            "       COMPUTED=".                                   IF1174.2
   000059         006400     02 COMPUTED-X.                                               IF1174.2
   000060         006500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1174.2 IMP
   000061         006600     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1174.2 60
   000062         006700                                 PIC -9(9).9(9).                  IF1174.2
   000063         006800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1174.2 60
   000064         006900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1174.2 60
   000065         007000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1174.2 60
   000066         007100     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1174.2 60
   000067         007200         04 COMPUTED-18V0                    PIC -9(18).          IF1174.2
   000068         007300         04 FILLER                           PIC X.               IF1174.2
   000069         007400     03 FILLER PIC X(50) VALUE SPACE.                             IF1174.2 IMP
   000070         007500 01  TEST-CORRECT.                                                IF1174.2
   000071         007600     02 FILLER PIC X(30) VALUE SPACE.                             IF1174.2 IMP
   000072         007700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1174.2
   000073         007800     02 CORRECT-X.                                                IF1174.2
   000074         007900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1174.2 IMP
   000075         008000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1174.2 74
   000076         008100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1174.2 74
   000077         008200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1174.2 74
   000078         008300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1174.2 74
   000079         008400     03      CR-18V0 REDEFINES CORRECT-A.                         IF1174.2 74
   000080         008500         04 CORRECT-18V0                     PIC -9(18).          IF1174.2
   000081         008600         04 FILLER                           PIC X.               IF1174.2
   000082         008700     03 FILLER PIC X(2) VALUE SPACE.                              IF1174.2 IMP
   000083         008800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1174.2 IMP
   000084         008900 01  TEST-CORRECT-MIN.                                            IF1174.2
   000085         009000     02 FILLER PIC X(30) VALUE SPACE.                             IF1174.2 IMP
   000086         009100     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1174.2
   000087         009200     02 CORRECTMI-X.                                              IF1174.2
   000088         009300     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1174.2 IMP
   000089         009400     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1174.2 88
   000090         009500     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1174.2 88
   000091         009600     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1174.2 88
   000092         009700     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1174.2 88
   000093         009800     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1174.2 88
   000094         009900         04 CORRECTMI-18V0                     PIC -9(18).        IF1174.2
   000095         010000         04 FILLER                           PIC X.               IF1174.2
   000096         010100     03 FILLER PIC X(2) VALUE SPACE.                              IF1174.2 IMP
   000097         010200     03 FILLER                           PIC X(48) VALUE SPACE.   IF1174.2 IMP
   000098         010300 01  TEST-CORRECT-MAX.                                            IF1174.2
   000099         010400     02 FILLER PIC X(30) VALUE SPACE.                             IF1174.2 IMP
   000100         010500     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1174.2
   000101         010600     02 CORRECTMA-X.                                              IF1174.2
   000102         010700     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1174.2 IMP
   000103         010800     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1174.2 102
   000104         010900     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1174.2 102
   000105         011000     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1174.2 102
   000106         011100     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1174.2 102
   000107         011200     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1174.2 102
   000108         011300         04 CORRECTMA-18V0                     PIC -9(18).        IF1174.2
   000109         011400         04 FILLER                           PIC X.               IF1174.2
   000110         011500     03 FILLER PIC X(2) VALUE SPACE.                              IF1174.2 IMP
   000111         011600     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1174.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700 01  CCVS-C-1.                                                    IF1174.2
   000113         011800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1174.2
   000114         011900-    "SS  PARAGRAPH-NAME                                          IF1174.2
   000115         012000-    "       REMARKS".                                            IF1174.2
   000116         012100     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1174.2 IMP
   000117         012200 01  CCVS-C-2.                                                    IF1174.2
   000118         012300     02 FILLER                     PIC X        VALUE SPACE.      IF1174.2 IMP
   000119         012400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1174.2
   000120         012500     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1174.2 IMP
   000121         012600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1174.2
   000122         012700     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1174.2 IMP
   000123         012800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1174.2 IMP
   000124         012900 01  REC-CT                        PIC 99       VALUE ZERO.       IF1174.2 IMP
   000125         013000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1174.2 IMP
   000126         013100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1174.2 IMP
   000127         013200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1174.2 IMP
   000128         013300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1174.2 IMP
   000129         013400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1174.2 IMP
   000130         013500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1174.2 IMP
   000131         013600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1174.2 IMP
   000132         013700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1174.2 IMP
   000133         013800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1174.2 IMP
   000134         013900 01  CCVS-H-1.                                                    IF1174.2
   000135         014000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1174.2 IMP
   000136         014100     02  FILLER                    PIC X(42)    VALUE             IF1174.2
   000137         014200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1174.2
   000138         014300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1174.2 IMP
   000139         014400 01  CCVS-H-2A.                                                   IF1174.2
   000140         014500   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1174.2 IMP
   000141         014600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1174.2
   000142         014700   02  FILLER                        PIC XXXX   VALUE             IF1174.2
   000143         014800     "4.2 ".                                                      IF1174.2
   000144         014900   02  FILLER                        PIC X(28)  VALUE             IF1174.2
   000145         015000            " COPY - NOT FOR DISTRIBUTION".                       IF1174.2
   000146         015100   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1174.2 IMP
   000147         015200                                                                  IF1174.2
   000148         015300 01  CCVS-H-2B.                                                   IF1174.2
   000149         015400   02  FILLER                        PIC X(15)  VALUE             IF1174.2
   000150         015500            "TEST RESULT OF ".                                    IF1174.2
   000151         015600   02  TEST-ID                       PIC X(9).                    IF1174.2
   000152         015700   02  FILLER                        PIC X(4)   VALUE             IF1174.2
   000153         015800            " IN ".                                               IF1174.2
   000154         015900   02  FILLER                        PIC X(12)  VALUE             IF1174.2
   000155         016000     " HIGH       ".                                              IF1174.2
   000156         016100   02  FILLER                        PIC X(22)  VALUE             IF1174.2
   000157         016200            " LEVEL VALIDATION FOR ".                             IF1174.2
   000158         016300   02  FILLER                        PIC X(58)  VALUE             IF1174.2
   000159         016400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1174.2
   000160         016500 01  CCVS-H-3.                                                    IF1174.2
   000161         016600     02  FILLER                      PIC X(34)  VALUE             IF1174.2
   000162         016700            " FOR OFFICIAL USE ONLY    ".                         IF1174.2
   000163         016800     02  FILLER                      PIC X(58)  VALUE             IF1174.2
   000164         016900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1174.2
   000165         017000     02  FILLER                      PIC X(28)  VALUE             IF1174.2
   000166         017100            "  COPYRIGHT   1985 ".                                IF1174.2
   000167         017200 01  CCVS-E-1.                                                    IF1174.2
   000168         017300     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1174.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1174.2
   000170         017500     02 ID-AGAIN                     PIC X(9).                    IF1174.2
   000171         017600     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1174.2 IMP
   000172         017700 01  CCVS-E-2.                                                    IF1174.2
   000173         017800     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1174.2 IMP
   000174         017900     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1174.2 IMP
   000175         018000     02 CCVS-E-2-2.                                               IF1174.2
   000176         018100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1174.2 IMP
   000177         018200         03 FILLER                   PIC X      VALUE SPACE.      IF1174.2 IMP
   000178         018300         03 ENDER-DESC               PIC X(44)  VALUE             IF1174.2
   000179         018400            "ERRORS ENCOUNTERED".                                 IF1174.2
   000180         018500 01  CCVS-E-3.                                                    IF1174.2
   000181         018600     02  FILLER                      PIC X(22)  VALUE             IF1174.2
   000182         018700            " FOR OFFICIAL USE ONLY".                             IF1174.2
   000183         018800     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1174.2 IMP
   000184         018900     02  FILLER                      PIC X(58)  VALUE             IF1174.2
   000185         019000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1174.2
   000186         019100     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1174.2 IMP
   000187         019200     02 FILLER                       PIC X(15)  VALUE             IF1174.2
   000188         019300             " COPYRIGHT 1985".                                   IF1174.2
   000189         019400 01  CCVS-E-4.                                                    IF1174.2
   000190         019500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1174.2 IMP
   000191         019600     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1174.2
   000192         019700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1174.2 IMP
   000193         019800     02 FILLER                       PIC X(40)  VALUE             IF1174.2
   000194         019900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1174.2
   000195         020000 01  XXINFO.                                                      IF1174.2
   000196         020100     02 FILLER                       PIC X(19)  VALUE             IF1174.2
   000197         020200            "*** INFORMATION ***".                                IF1174.2
   000198         020300     02 INFO-TEXT.                                                IF1174.2
   000199         020400       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1174.2 IMP
   000200         020500       04 XXCOMPUTED                 PIC X(20).                   IF1174.2
   000201         020600       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1174.2 IMP
   000202         020700       04 XXCORRECT                  PIC X(20).                   IF1174.2
   000203         020800     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1174.2
   000204         020900 01  HYPHEN-LINE.                                                 IF1174.2
   000205         021000     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1174.2 IMP
   000206         021100     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1174.2
   000207         021200-    "*****************************************".                 IF1174.2
   000208         021300     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1174.2
   000209         021400-    "******************************".                            IF1174.2
   000210         021500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1174.2
   000211         021600     "IF117A".                                                    IF1174.2
   000212         021700 PROCEDURE DIVISION.                                              IF1174.2
   000213         021800 CCVS1 SECTION.                                                   IF1174.2
   000214         021900 OPEN-FILES.                                                      IF1174.2
   000215         022000     OPEN     OUTPUT PRINT-FILE.                                  IF1174.2 21
   000216         022100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1174.2 210 151 210 170
   000217         022200     MOVE    SPACE TO TEST-RESULTS.                               IF1174.2 IMP 43
   000218         022300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1174.2 241 246
   000219         022400     GO TO CCVS1-EXIT.                                            IF1174.2 334
   000220         022500 CLOSE-FILES.                                                     IF1174.2
   000221         022600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1174.2 250 270 21
   000222         022700 TERMINATE-CCVS.                                                  IF1174.2
   000223         022800     STOP     RUN.                                                IF1174.2
   000224         022900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1174.2 47 127
   000225         023000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1174.2 47 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1174.2 47 126
   000227         023200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1174.2 47 125
   000228         023300     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1174.2 54
   000229         023400 PRINT-DETAIL.                                                    IF1174.2
   000230         023500     IF REC-CT NOT EQUAL TO ZERO                                  IF1174.2 124 IMP
   000231      1  023600             MOVE "." TO PARDOT-X                                 IF1174.2 51
   000232      1  023700             MOVE REC-CT TO DOTVALUE.                             IF1174.2 124 52
   000233         023800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1174.2 43 22 282
   000234         023900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1174.2 47 282
   000235      1  024000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1174.2 303 323
   000236      1  024100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1174.2 324 333
   000237         024200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1174.2 IMP 47 IMP 59
   000238         024300     MOVE SPACE TO CORRECT-X.                                     IF1174.2 IMP 73
   000239         024400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1174.2 124 IMP IMP 49
   000240         024500     MOVE     SPACE TO RE-MARK.                                   IF1174.2 IMP 54
   000241         024600 HEAD-ROUTINE.                                                    IF1174.2
   000242         024700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1174.2 134 23 282
   000243         024800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1174.2 139 23 282
   000244         024900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1174.2 148 23 282
   000245         025000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1174.2 160 23 282
   000246         025100 COLUMN-NAMES-ROUTINE.                                            IF1174.2
   000247         025200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1174.2 112 23 282
   000248         025300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1174.2 117 23 282
   000249         025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1174.2 204 23 282
   000250         025500 END-ROUTINE.                                                     IF1174.2
   000251         025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1174.2 204 23 282
   000252         025700 END-RTN-EXIT.                                                    IF1174.2
   000253         025800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1174.2 167 23 282
   000254         025900 END-ROUTINE-1.                                                   IF1174.2
   000255         026000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1174.2 126 130 127
   000256         026100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1174.2 130 125 130
   000257         026200      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1174.2 128 130
   000258         026300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1174.2 128 190
   000259         026400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1174.2 130 192
   000260         026500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1174.2 189 175
   000261         026600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1174.2 172 23 282
   000262         026700  END-ROUTINE-12.                                                 IF1174.2
   000263         026800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1174.2 178
   000264         026900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1174.2 126 IMP
   000265      1  027000         MOVE "NO " TO ERROR-TOTAL                                IF1174.2 176
   000266         027100         ELSE                                                     IF1174.2
   000267      1  027200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1174.2 126 176
   000268         027300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1174.2 172 23
   000269         027400     PERFORM WRITE-LINE.                                          IF1174.2 282
   000270         027500 END-ROUTINE-13.                                                  IF1174.2
   000271         027600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1174.2 125 IMP
   000272      1  027700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1174.2 176
   000273      1  027800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1174.2 125 176
   000274         027900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1174.2 178
   000275         028000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1174.2 172 23 282
   000276         028100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1174.2 127 IMP
   000277      1  028200          MOVE "NO " TO ERROR-TOTAL                               IF1174.2 176
   000278      1  028300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1174.2 127 176
   000279         028400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1174.2 178
   000280         028500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1174.2 172 23 282
   000281         028600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1174.2 180 23 282
   000282         028700 WRITE-LINE.                                                      IF1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     ADD 1 TO RECORD-COUNT.                                       IF1174.2 132
   000284         028900     IF RECORD-COUNT GREATER 42                                   IF1174.2 132
   000285      1  029000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1174.2 23 131
   000286      1  029100         MOVE SPACE TO DUMMY-RECORD                               IF1174.2 IMP 23
   000287      1  029200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1174.2 23
   000288      1  029300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1174.2 134 23 298
   000289      1  029400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1174.2 139 23 298
   000290      1  029500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1174.2 148 23 298
   000291      1  029600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1174.2 160 23 298
   000292      1  029700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1174.2 112 23 298
   000293      1  029800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1174.2 117 23 298
   000294      1  029900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1174.2 204 23 298
   000295      1  030000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1174.2 131 23
   000296      1  030100         MOVE ZERO TO RECORD-COUNT.                               IF1174.2 IMP 132
   000297         030200     PERFORM WRT-LN.                                              IF1174.2 298
   000298         030300 WRT-LN.                                                          IF1174.2
   000299         030400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1174.2 23
   000300         030500     MOVE SPACE TO DUMMY-RECORD.                                  IF1174.2 IMP 23
   000301         030600 BLANK-LINE-PRINT.                                                IF1174.2
   000302         030700     PERFORM WRT-LN.                                              IF1174.2 298
   000303         030800 FAIL-ROUTINE.                                                    IF1174.2
   000304         030900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1174.2 59 IMP
   000305      1  031000            GO TO FAIL-ROUTINE-WRITE.                             IF1174.2 312
   000306         031100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1174.2 73 IMP 312
   000307         031200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1174.2 133 203
   000308         031300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1174.2 198
   000309         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1174.2 195 23 282
   000310         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1174.2 IMP 203
   000311         031600     GO TO  FAIL-ROUTINE-EX.                                      IF1174.2 323
   000312         031700 FAIL-ROUTINE-WRITE.                                              IF1174.2
   000313         031800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1174.2 55 22 282
   000314         031900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1174.2 133 83
   000315         032000                              CORMA-ANSI-REFERENCE.               IF1174.2 111
   000316         032100     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1174.2 89 IMP
   000317      1  032200           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1174.2 84 22 282
   000318      1  032300           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1174.2 98 22 282
   000319         032400     ELSE                                                         IF1174.2
   000320      1  032500           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1174.2 70 22 282
   000321         032600     PERFORM WRITE-LINE.                                          IF1174.2 282
   000322         032700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1174.2 IMP 83
   000323         032800 FAIL-ROUTINE-EX. EXIT.                                           IF1174.2
   000324         032900 BAIL-OUT.                                                        IF1174.2
   000325         033000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1174.2 60 IMP 327
   000326         033100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1174.2 74 IMP 333
   000327         033200 BAIL-OUT-WRITE.                                                  IF1174.2
   000328         033300     MOVE CORRECT-A TO XXCORRECT.                                 IF1174.2 74 202
   000329         033400     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1174.2 60 200
   000330         033500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1174.2 133 203
   000331         033600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1174.2 195 23 282
   000332         033700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1174.2 IMP 203
   000333         033800 BAIL-OUT-EX. EXIT.                                               IF1174.2
   000334         033900 CCVS1-EXIT.                                                      IF1174.2
   000335         034000     EXIT.                                                        IF1174.2
   000336         034200*                                                      *          IF1174.2
   000337         034300*    Intrinsic Function Tests         IF117A - LOG10   *          IF1174.2
   000338         034400*                                                      *          IF1174.2
   000339         034600 SECT-IF117A SECTION.                                             IF1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034700 F-LOG10-INFO.                                                    IF1174.2
   000341         034800     MOVE     "See ref. A-49 2.21" TO ANSI-REFERENCE.             IF1174.2 133
   000342         034900     MOVE     "LOG10 Function" TO FEATURE.                        IF1174.2 45
   000343         035100 F-LOG10-01.                                                      IF1174.2
   000344         035200     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000345         035300     MOVE -0.000020 TO MIN-RANGE.                                 IF1174.2 39
   000346         035400     MOVE  0.000020 TO MAX-RANGE.                                 IF1174.2 40
   000347         035500 F-LOG10-TEST-01.                                                 IF1174.2
   000348         035600     COMPUTE WS-NUM = FUNCTION LOG10(1).                          IF1174.2 38 IFN
   000349         035700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000350         035800        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000351      1  035900                    PERFORM PASS                                  IF1174.2 225
   000352         036000     ELSE                                                         IF1174.2
   000353      1  036100                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000354      1  036200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000355      1  036300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000356      1  036400                    PERFORM FAIL.                                 IF1174.2 226
   000357         036500     GO TO F-LOG10-WRITE-01.                                      IF1174.2 361
   000358         036600 F-LOG10-DELETE-01.                                               IF1174.2
   000359         036700     PERFORM  DE-LETE.                                            IF1174.2 227
   000360         036800     GO TO    F-LOG10-WRITE-01.                                   IF1174.2 361
   000361         036900 F-LOG10-WRITE-01.                                                IF1174.2
   000362         037000     MOVE "F-LOG10-01" TO PAR-NAME.                               IF1174.2 49
   000363         037100     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000364         037300 F-LOG10-02.                                                      IF1174.2
   000365         037400     EVALUATE FUNCTION LOG10(10)                                  IF1174.2 IFN
   000366         037500     WHEN 0.999980 THRU 1.000020                                  IF1174.2
   000367      1  037600                    PERFORM PASS                                  IF1174.2 225
   000368         037700     WHEN OTHER                                                   IF1174.2
   000369      1  037800                    PERFORM FAIL.                                 IF1174.2 226
   000370         037900     GO TO F-LOG10-WRITE-02.                                      IF1174.2 374
   000371         038000 F-LOG10-DELETE-02.                                               IF1174.2
   000372         038100     PERFORM  DE-LETE.                                            IF1174.2 227
   000373         038200     GO TO    F-LOG10-WRITE-02.                                   IF1174.2 374
   000374         038300 F-LOG10-WRITE-02.                                                IF1174.2
   000375         038400     MOVE "F-LOG10-02" TO PAR-NAME.                               IF1174.2 49
   000376         038500     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000377         038700 F-LOG10-03.                                                      IF1174.2
   000378         038800     MOVE -2.00004 TO MIN-RANGE.                                  IF1174.2 39
   000379         038900     MOVE -1.99996 TO MAX-RANGE.                                  IF1174.2 40
   000380         039000 F-LOG10-TEST-03.                                                 IF1174.2
   000381         039100     IF (FUNCTION LOG10(.01) >= MIN-RANGE) AND                    IF1174.2 IFN 39
   000382         039200        (FUNCTION LOG10(.01) <= MAX-RANGE) THEN                   IF1174.2 IFN 40
   000383      1  039300                    PERFORM PASS                                  IF1174.2 225
   000384         039400     ELSE                                                         IF1174.2
   000385      1  039500                    PERFORM FAIL.                                 IF1174.2 226
   000386         039600     GO TO F-LOG10-WRITE-03.                                      IF1174.2 390
   000387         039700 F-LOG10-DELETE-03.                                               IF1174.2
   000388         039800     PERFORM  DE-LETE.                                            IF1174.2 227
   000389         039900     GO TO    F-LOG10-WRITE-03.                                   IF1174.2 390
   000390         040000 F-LOG10-WRITE-03.                                                IF1174.2
   000391         040100     MOVE "F-LOG10-03" TO PAR-NAME.                               IF1174.2 49
   000392         040200     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000393         040400 F-LOG10-04.                                                      IF1174.2
   000394         040500     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000395         040600     MOVE -3.00006 TO MIN-RANGE.                                  IF1174.2 39
   000396         040700     MOVE -2.99994 TO MAX-RANGE.                                  IF1174.2 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800 F-LOG10-TEST-04.                                                 IF1174.2
   000398         040900     COMPUTE WS-NUM = FUNCTION LOG10(.001).                       IF1174.2 38 IFN
   000399         041000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000400         041100        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000401      1  041200                    PERFORM PASS                                  IF1174.2 225
   000402         041300     ELSE                                                         IF1174.2
   000403      1  041400                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000404      1  041500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000405      1  041600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000406      1  041700                    PERFORM FAIL.                                 IF1174.2 226
   000407         041800     GO TO F-LOG10-WRITE-04.                                      IF1174.2 411
   000408         041900 F-LOG10-DELETE-04.                                               IF1174.2
   000409         042000     PERFORM  DE-LETE.                                            IF1174.2 227
   000410         042100     GO TO    F-LOG10-WRITE-04.                                   IF1174.2 411
   000411         042200 F-LOG10-WRITE-04.                                                IF1174.2
   000412         042300     MOVE "F-LOG10-04" TO PAR-NAME.                               IF1174.2 49
   000413         042400     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000414         042600 F-LOG10-05.                                                      IF1174.2
   000415         042700     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000416         042800     MOVE  1.99996 TO MIN-RANGE.                                  IF1174.2 39
   000417         042900     MOVE  2.00004 TO MAX-RANGE.                                  IF1174.2 40
   000418         043000 F-LOG10-TEST-05.                                                 IF1174.2
   000419         043100     COMPUTE WS-NUM = FUNCTION LOG10(100).                        IF1174.2 38 IFN
   000420         043200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000421         043300        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000422      1  043400                    PERFORM PASS                                  IF1174.2 225
   000423         043500     ELSE                                                         IF1174.2
   000424      1  043600                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000425      1  043700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000426      1  043800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000427      1  043900                    PERFORM FAIL.                                 IF1174.2 226
   000428         044000     GO TO F-LOG10-WRITE-05.                                      IF1174.2 432
   000429         044100 F-LOG10-DELETE-05.                                               IF1174.2
   000430         044200     PERFORM  DE-LETE.                                            IF1174.2 227
   000431         044300     GO TO    F-LOG10-WRITE-05.                                   IF1174.2 432
   000432         044400 F-LOG10-WRITE-05.                                                IF1174.2
   000433         044500     MOVE "F-LOG10-05" TO PAR-NAME.                               IF1174.2 49
   000434         044600     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000435         044800 F-LOG10-06.                                                      IF1174.2
   000436         044900     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000437         045000     MOVE  0.999936 TO MIN-RANGE.                                 IF1174.2 39
   000438         045100     MOVE  0.999976 TO MAX-RANGE.                                 IF1174.2 40
   000439         045200 F-LOG10-TEST-06.                                                 IF1174.2
   000440         045300     COMPUTE WS-NUM = FUNCTION LOG10(9.999).                      IF1174.2 38 IFN
   000441         045400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000442         045500        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000443      1  045600                    PERFORM PASS                                  IF1174.2 225
   000444         045700     ELSE                                                         IF1174.2
   000445      1  045800                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000446      1  045900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000447      1  046000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000448      1  046100                    PERFORM FAIL.                                 IF1174.2 226
   000449         046200     GO TO F-LOG10-WRITE-06.                                      IF1174.2 453
   000450         046300 F-LOG10-DELETE-06.                                               IF1174.2
   000451         046400     PERFORM  DE-LETE.                                            IF1174.2 227
   000452         046500     GO TO    F-LOG10-WRITE-06.                                   IF1174.2 453
   000453         046600 F-LOG10-WRITE-06.                                                IF1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046700     MOVE "F-LOG10-06" TO PAR-NAME.                               IF1174.2 49
   000455         046800     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000456         047000 F-LOG10-08.                                                      IF1174.2
   000457         047100     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000458         047200     MOVE -2.04579 TO MIN-RANGE.                                  IF1174.2 39
   000459         047300     MOVE -2.04571 TO MAX-RANGE.                                  IF1174.2 40
   000460         047400 F-LOG10-TEST-08.                                                 IF1174.2
   000461         047500     COMPUTE WS-NUM = FUNCTION LOG10(.009).                       IF1174.2 38 IFN
   000462         047600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000463         047700        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000464      1  047800                    PERFORM PASS                                  IF1174.2 225
   000465         047900     ELSE                                                         IF1174.2
   000466      1  048000                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000467      1  048100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000468      1  048200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000469      1  048300                    PERFORM FAIL.                                 IF1174.2 226
   000470         048400     GO TO F-LOG10-WRITE-08.                                      IF1174.2 474
   000471         048500 F-LOG10-DELETE-08.                                               IF1174.2
   000472         048600     PERFORM  DE-LETE.                                            IF1174.2 227
   000473         048700     GO TO    F-LOG10-WRITE-08.                                   IF1174.2 474
   000474         048800 F-LOG10-WRITE-08.                                                IF1174.2
   000475         048900     MOVE "F-LOG10-08" TO PAR-NAME.                               IF1174.2 49
   000476         049000     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000477         049200 F-LOG10-09.                                                      IF1174.2
   000478         049300     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000479         049400     MOVE  2.00039 TO MIN-RANGE.                                  IF1174.2 39
   000480         049500     MOVE  2.00047 TO MAX-RANGE.                                  IF1174.2 40
   000481         049600 F-LOG10-TEST-09.                                                 IF1174.2
   000482         049700     COMPUTE WS-NUM = FUNCTION LOG10(100.1).                      IF1174.2 38 IFN
   000483         049800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000484         049900        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000485      1  050000                    PERFORM PASS                                  IF1174.2 225
   000486         050100     ELSE                                                         IF1174.2
   000487      1  050200                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000488      1  050300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000489      1  050400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000490      1  050500                    PERFORM FAIL.                                 IF1174.2 226
   000491         050600     GO TO F-LOG10-WRITE-09.                                      IF1174.2 495
   000492         050700 F-LOG10-DELETE-09.                                               IF1174.2
   000493         050800     PERFORM  DE-LETE.                                            IF1174.2 227
   000494         050900     GO TO    F-LOG10-WRITE-09.                                   IF1174.2 495
   000495         051000 F-LOG10-WRITE-09.                                                IF1174.2
   000496         051100     MOVE "F-LOG10-09" TO PAR-NAME.                               IF1174.2 49
   000497         051200     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000498         051400 F-LOG10-10.                                                      IF1174.2
   000499         051500     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000500         051600     MOVE  3.99992 TO MIN-RANGE.                                  IF1174.2 39
   000501         051700     MOVE  4.00008 TO MAX-RANGE.                                  IF1174.2 40
   000502         051800 F-LOG10-TEST-10.                                                 IF1174.2
   000503         051900     COMPUTE WS-NUM = FUNCTION LOG10(10000).                      IF1174.2 38 IFN
   000504         052000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000505         052100        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000506      1  052200                    PERFORM PASS                                  IF1174.2 225
   000507         052300     ELSE                                                         IF1174.2
   000508      1  052400                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000509      1  052500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000510      1  052600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  052700                    PERFORM FAIL.                                 IF1174.2 226
   000512         052800     GO TO F-LOG10-WRITE-10.                                      IF1174.2 516
   000513         052900 F-LOG10-DELETE-10.                                               IF1174.2
   000514         053000     PERFORM  DE-LETE.                                            IF1174.2 227
   000515         053100     GO TO    F-LOG10-WRITE-10.                                   IF1174.2 516
   000516         053200 F-LOG10-WRITE-10.                                                IF1174.2
   000517         053300     MOVE "F-LOG10-10" TO PAR-NAME.                               IF1174.2 49
   000518         053400     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000519         053600 F-LOG10-11.                                                      IF1174.2
   000520         053700     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000521         053800     MOVE  3.48129 TO MIN-RANGE.                                  IF1174.2 39
   000522         053900     MOVE  3.48143 TO MAX-RANGE.                                  IF1174.2 40
   000523         054000 F-LOG10-TEST-11.                                                 IF1174.2
   000524         054100     COMPUTE WS-NUM = FUNCTION LOG10(3029.48).                    IF1174.2 38 IFN
   000525         054200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000526         054300        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000527      1  054400                    PERFORM PASS                                  IF1174.2 225
   000528         054500     ELSE                                                         IF1174.2
   000529      1  054600                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000530      1  054700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000531      1  054800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000532      1  054900                    PERFORM FAIL.                                 IF1174.2 226
   000533         055000     GO TO F-LOG10-WRITE-11.                                      IF1174.2 537
   000534         055100 F-LOG10-DELETE-11.                                               IF1174.2
   000535         055200     PERFORM  DE-LETE.                                            IF1174.2 227
   000536         055300     GO TO    F-LOG10-WRITE-11.                                   IF1174.2 537
   000537         055400 F-LOG10-WRITE-11.                                                IF1174.2
   000538         055500     MOVE "F-LOG10-11" TO PAR-NAME.                               IF1174.2 49
   000539         055600     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000540         055800 F-LOG10-12.                                                      IF1174.2
   000541         055900     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000542         056000     MOVE -4.30111 TO MIN-RANGE.                                  IF1174.2 39
   000543         056100     MOVE -4.30093 TO MAX-RANGE.                                  IF1174.2 40
   000544         056200 F-LOG10-TEST-12.                                                 IF1174.2
   000545         056300     COMPUTE WS-NUM = FUNCTION LOG10(.00005).                     IF1174.2 38 IFN
   000546         056400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000547         056500        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000548      1  056600                    PERFORM PASS                                  IF1174.2 225
   000549         056700     ELSE                                                         IF1174.2
   000550      1  056800                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000551      1  056900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000552      1  057000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000553      1  057100                    PERFORM FAIL.                                 IF1174.2 226
   000554         057200     GO TO F-LOG10-WRITE-12.                                      IF1174.2 558
   000555         057300 F-LOG10-DELETE-12.                                               IF1174.2
   000556         057400     PERFORM  DE-LETE.                                            IF1174.2 227
   000557         057500     GO TO    F-LOG10-WRITE-12.                                   IF1174.2 558
   000558         057600 F-LOG10-WRITE-12.                                                IF1174.2
   000559         057700     MOVE "F-LOG10-12" TO PAR-NAME.                               IF1174.2 49
   000560         057800     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000561         058000 F-LOG10-13.                                                      IF1174.2
   000562         058100     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000563         058200     MOVE  5.77803 TO MIN-RANGE.                                  IF1174.2 39
   000564         058300     MOVE  5.77826 TO MAX-RANGE.                                  IF1174.2 40
   000565         058400 F-LOG10-TEST-13.                                                 IF1174.2
   000566         058500     COMPUTE WS-NUM = FUNCTION LOG10(A).                          IF1174.2 38 IFN 26
   000567         058600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058700        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000569      1  058800                    PERFORM PASS                                  IF1174.2 225
   000570         058900     ELSE                                                         IF1174.2
   000571      1  059000                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000572      1  059100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000573      1  059200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000574      1  059300                    PERFORM FAIL.                                 IF1174.2 226
   000575         059400     GO TO F-LOG10-WRITE-13.                                      IF1174.2 579
   000576         059500 F-LOG10-DELETE-13.                                               IF1174.2
   000577         059600     PERFORM  DE-LETE.                                            IF1174.2 227
   000578         059700     GO TO    F-LOG10-WRITE-13.                                   IF1174.2 579
   000579         059800 F-LOG10-WRITE-13.                                                IF1174.2
   000580         059900     MOVE "F-LOG10-13" TO PAR-NAME.                               IF1174.2 49
   000581         060000     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000582         060200 F-LOG10-14.                                                      IF1174.2
   000583         060300     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000584         060400     MOVE  4.50507 TO MIN-RANGE.                                  IF1174.2 39
   000585         060500     MOVE  4.50525 TO MAX-RANGE.                                  IF1174.2 40
   000586         060600 F-LOG10-TEST-14.                                                 IF1174.2
   000587         060700     COMPUTE WS-NUM = FUNCTION LOG10(F).                          IF1174.2 38 IFN 31
   000588         060800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000589         060900        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000590      1  061000                    PERFORM PASS                                  IF1174.2 225
   000591         061100     ELSE                                                         IF1174.2
   000592      1  061200                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000593      1  061300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000594      1  061400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000595      1  061500                    PERFORM FAIL.                                 IF1174.2 226
   000596         061600     GO TO F-LOG10-WRITE-14.                                      IF1174.2 600
   000597         061700 F-LOG10-DELETE-14.                                               IF1174.2
   000598         061800     PERFORM  DE-LETE.                                            IF1174.2 227
   000599         061900     GO TO    F-LOG10-WRITE-14.                                   IF1174.2 600
   000600         062000 F-LOG10-WRITE-14.                                                IF1174.2
   000601         062100     MOVE "F-LOG10-14" TO PAR-NAME.                               IF1174.2 49
   000602         062200     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000603         062400 F-LOG10-15.                                                      IF1174.2
   000604         062500     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000605         062600     MOVE -4.69906 TO MIN-RANGE.                                  IF1174.2 39
   000606         062700     MOVE -4.69888 TO MAX-RANGE.                                  IF1174.2 40
   000607         062800 F-LOG10-TEST-15.                                                 IF1174.2
   000608         062900     COMPUTE WS-NUM = FUNCTION LOG10(G).                          IF1174.2 38 IFN 32
   000609         063000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000610         063100        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000611      1  063200                    PERFORM PASS                                  IF1174.2 225
   000612         063300     ELSE                                                         IF1174.2
   000613      1  063400                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000614      1  063500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000615      1  063600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000616      1  063700                    PERFORM FAIL.                                 IF1174.2 226
   000617         063800     GO TO F-LOG10-WRITE-15.                                      IF1174.2 621
   000618         063900 F-LOG10-DELETE-15.                                               IF1174.2
   000619         064000     PERFORM  DE-LETE.                                            IF1174.2 227
   000620         064100     GO TO    F-LOG10-WRITE-15.                                   IF1174.2 621
   000621         064200 F-LOG10-WRITE-15.                                                IF1174.2
   000622         064300     MOVE "F-LOG10-15" TO PAR-NAME.                               IF1174.2 49
   000623         064400     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000624         064600 F-LOG10-16.                                                      IF1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064700     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000626         064800     MOVE  0.477111 TO MIN-RANGE.                                 IF1174.2 39
   000627         064900     MOVE  0.477131 TO MAX-RANGE.                                 IF1174.2 40
   000628         065000 F-LOG10-TEST-16.                                                 IF1174.2
   000629         065100     COMPUTE WS-NUM = FUNCTION LOG10(IND(4)).                     IF1174.2 38 IFN 36
   000630         065200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000631         065300        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000632      1  065400                    PERFORM PASS                                  IF1174.2 225
   000633         065500     ELSE                                                         IF1174.2
   000634      1  065600                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000635      1  065700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000636      1  065800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000637      1  065900                    PERFORM FAIL.                                 IF1174.2 226
   000638         066000     GO TO F-LOG10-WRITE-16.                                      IF1174.2 642
   000639         066100 F-LOG10-DELETE-16.                                               IF1174.2
   000640         066200     PERFORM  DE-LETE.                                            IF1174.2 227
   000641         066300     GO TO    F-LOG10-WRITE-16.                                   IF1174.2 642
   000642         066400 F-LOG10-WRITE-16.                                                IF1174.2
   000643         066500     MOVE "F-LOG10-16" TO PAR-NAME.                               IF1174.2 49
   000644         066600     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000645         066800 F-LOG10-17.                                                      IF1174.2
   000646         066900     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000647         067000     MOVE  0.434437 TO MIN-RANGE.                                 IF1174.2 39
   000648         067100     MOVE  0.434471 TO MAX-RANGE.                                 IF1174.2 40
   000649         067200 F-LOG10-TEST-17.                                                 IF1174.2
   000650         067300     COMPUTE WS-NUM = FUNCTION LOG10(E + .001).                   IF1174.2 38 IFN 30
   000651         067400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000652         067500        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000653      1  067600                    PERFORM PASS                                  IF1174.2 225
   000654         067700     ELSE                                                         IF1174.2
   000655      1  067800                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000656      1  067900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000657      1  068000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000658      1  068100                    PERFORM FAIL.                                 IF1174.2 226
   000659         068200     GO TO F-LOG10-WRITE-17.                                      IF1174.2 663
   000660         068300 F-LOG10-DELETE-17.                                               IF1174.2
   000661         068400     PERFORM  DE-LETE.                                            IF1174.2 227
   000662         068500     GO TO    F-LOG10-WRITE-17.                                   IF1174.2 663
   000663         068600 F-LOG10-WRITE-17.                                                IF1174.2
   000664         068700     MOVE "F-LOG10-17" TO PAR-NAME.                               IF1174.2 49
   000665         068800     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000666         069000 F-LOG10-18.                                                      IF1174.2
   000667         069100     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000668         069200     MOVE -1.00004 TO MIN-RANGE.                                  IF1174.2 39
   000669         069300     MOVE -0.999960 TO MAX-RANGE.                                 IF1174.2 40
   000670         069400 F-LOG10-TEST-18.                                                 IF1174.2
   000671         069500     COMPUTE WS-NUM = FUNCTION LOG10(1 / 10).                     IF1174.2 38 IFN
   000672         069600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000673         069700        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000674      1  069800                    PERFORM PASS                                  IF1174.2 225
   000675         069900     ELSE                                                         IF1174.2
   000676      1  070000                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000677      1  070100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000678      1  070200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000679      1  070300                    PERFORM FAIL.                                 IF1174.2 226
   000680         070400     GO TO F-LOG10-WRITE-18.                                      IF1174.2 684
   000681         070500 F-LOG10-DELETE-18.                                               IF1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         070600     PERFORM  DE-LETE.                                            IF1174.2 227
   000683         070700     GO TO    F-LOG10-WRITE-18.                                   IF1174.2 684
   000684         070800 F-LOG10-WRITE-18.                                                IF1174.2
   000685         070900     MOVE "F-LOG10-18" TO PAR-NAME.                               IF1174.2 49
   000686         071000     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000687         071200 F-LOG10-19.                                                      IF1174.2
   000688         071300     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000689         071400     MOVE  0.417999 TO MIN-RANGE.                                 IF1174.2 39
   000690         071500     MOVE  0.418033 TO MAX-RANGE.                                 IF1174.2 40
   000691         071600 F-LOG10-TEST-19.                                                 IF1174.2
   000692         071700     COMPUTE WS-NUM = FUNCTION LOG10(E - .1).                     IF1174.2 38 IFN 30
   000693         071800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000694         071900        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000695      1  072000                    PERFORM PASS                                  IF1174.2 225
   000696         072100     ELSE                                                         IF1174.2
   000697      1  072200                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000698      1  072300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000699      1  072400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000700      1  072500                    PERFORM FAIL.                                 IF1174.2 226
   000701         072600     GO TO F-LOG10-WRITE-19.                                      IF1174.2 705
   000702         072700 F-LOG10-DELETE-19.                                               IF1174.2
   000703         072800     PERFORM  DE-LETE.                                            IF1174.2 227
   000704         072900     GO TO    F-LOG10-WRITE-19.                                   IF1174.2 705
   000705         073000 F-LOG10-WRITE-19.                                                IF1174.2
   000706         073100     MOVE "F-LOG10-19" TO PAR-NAME.                               IF1174.2 49
   000707         073200     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000708         073400 F-LOG10-20.                                                      IF1174.2
   000709         073500     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000710         073600     MOVE -0.045759  TO MIN-RANGE.                                IF1174.2 39
   000711         073700     MOVE -0.045755 TO MAX-RANGE.                                 IF1174.2 40
   000712         073800 F-LOG10-TEST-20.                                                 IF1174.2
   000713         073900     COMPUTE WS-NUM = FUNCTION LOG10(1 - .1).                     IF1174.2 38 IFN
   000714         074000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000715         074100        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000716      1  074200                    PERFORM PASS                                  IF1174.2 225
   000717         074300     ELSE                                                         IF1174.2
   000718      1  074400                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000719      1  074500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000720      1  074600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000721      1  074700                    PERFORM FAIL.                                 IF1174.2 226
   000722         074800     GO TO F-LOG10-WRITE-20.                                      IF1174.2 726
   000723         074900 F-LOG10-DELETE-20.                                               IF1174.2
   000724         075000     PERFORM  DE-LETE.                                            IF1174.2 227
   000725         075100     GO TO    F-LOG10-WRITE-20.                                   IF1174.2 726
   000726         075200 F-LOG10-WRITE-20.                                                IF1174.2
   000727         075300     MOVE "F-LOG10-20" TO PAR-NAME.                               IF1174.2 49
   000728         075400     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000729         075600 F-LOG10-21.                                                      IF1174.2
   000730         075700     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000731         075800     MOVE  1.04135 TO MIN-RANGE.                                  IF1174.2 39
   000732         075900     MOVE  1.04143 TO MAX-RANGE.                                  IF1174.2 40
   000733         076000 F-LOG10-TEST-21.                                                 IF1174.2
   000734         076100     COMPUTE WS-NUM = FUNCTION LOG10(10 * 1.1).                   IF1174.2 38 IFN
   000735         076200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000736         076300        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000737      1  076400                    PERFORM PASS                                  IF1174.2 225
   000738         076500     ELSE                                                         IF1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739      1  076600                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000740      1  076700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000741      1  076800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000742      1  076900                    PERFORM FAIL.                                 IF1174.2 226
   000743         077000     GO TO F-LOG10-WRITE-21.                                      IF1174.2 747
   000744         077100 F-LOG10-DELETE-21.                                               IF1174.2
   000745         077200     PERFORM  DE-LETE.                                            IF1174.2 227
   000746         077300     GO TO    F-LOG10-WRITE-21.                                   IF1174.2 747
   000747         077400 F-LOG10-WRITE-21.                                                IF1174.2
   000748         077500     MOVE "F-LOG10-21" TO PAR-NAME.                               IF1174.2 49
   000749         077600     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000750         077800 F-LOG10-22.                                                      IF1174.2
   000751         077900     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000752         078000     MOVE -1.92090 TO MIN-RANGE.                                  IF1174.2 39
   000753         078100     MOVE -1.92074 TO MAX-RANGE.                                  IF1174.2 40
   000754         078200 F-LOG10-TEST-22.                                                 IF1174.2
   000755         078300     COMPUTE WS-NUM = FUNCTION LOG10((A * G)/ 1000).              IF1174.2 38 IFN 26 32
   000756         078400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000757         078500        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000758      1  078600                    PERFORM PASS                                  IF1174.2 225
   000759         078700     ELSE                                                         IF1174.2
   000760      1  078800                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000761      1  078900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000762      1  079000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000763      1  079100                    PERFORM FAIL.                                 IF1174.2 226
   000764         079200     GO TO F-LOG10-WRITE-22.                                      IF1174.2 768
   000765         079300 F-LOG10-DELETE-22.                                               IF1174.2
   000766         079400     PERFORM  DE-LETE.                                            IF1174.2 227
   000767         079500     GO TO    F-LOG10-WRITE-22.                                   IF1174.2 768
   000768         079600 F-LOG10-WRITE-22.                                                IF1174.2
   000769         079700     MOVE "F-LOG10-22" TO PAR-NAME.                               IF1174.2 49
   000770         079800     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000771         080000 F-LOG10-23.                                                      IF1174.2
   000772         080100     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000773         080200     MOVE  0.845064 TO MIN-RANGE.                                 IF1174.2 39
   000774         080300     MOVE  0.845132 TO MAX-RANGE.                                 IF1174.2 40
   000775         080400 F-LOG10-TEST-23.                                                 IF1174.2
   000776         080500     COMPUTE WS-NUM = FUNCTION LOG10(IND(D - 5)).                 IF1174.2 38 IFN 36 29
   000777         080600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000778         080700        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000779      1  080800                    PERFORM PASS                                  IF1174.2 225
   000780         080900     ELSE                                                         IF1174.2
   000781      1  081000                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000782      1  081100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000783      1  081200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000784      1  081300                    PERFORM FAIL.                                 IF1174.2 226
   000785         081400     GO TO F-LOG10-WRITE-23.                                      IF1174.2 789
   000786         081500 F-LOG10-DELETE-23.                                               IF1174.2
   000787         081600     PERFORM  DE-LETE.                                            IF1174.2 227
   000788         081700     GO TO    F-LOG10-WRITE-23.                                   IF1174.2 789
   000789         081800 F-LOG10-WRITE-23.                                                IF1174.2
   000790         081900     MOVE "F-LOG10-23" TO PAR-NAME.                               IF1174.2 49
   000791         082000     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000792         082200 F-LOG10-24.                                                      IF1174.2
   000793         082300     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000794         082400     MOVE  1.30097 TO MIN-RANGE.                                  IF1174.2 39
   000795         082500     MOVE  1.30107 TO MAX-RANGE.                                  IF1174.2 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         082600 F-LOG10-TEST-24.                                                 IF1174.2
   000797         082700     COMPUTE WS-NUM = FUNCTION LOG10(2 * 10).                     IF1174.2 38 IFN
   000798         082800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000799         082900        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000800      1  083000                    PERFORM PASS                                  IF1174.2 225
   000801         083100     ELSE                                                         IF1174.2
   000802      1  083200                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000803      1  083300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000804      1  083400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000805      1  083500                    PERFORM FAIL.                                 IF1174.2 226
   000806         083600     GO TO F-LOG10-WRITE-24.                                      IF1174.2 810
   000807         083700 F-LOG10-DELETE-24.                                               IF1174.2
   000808         083800     PERFORM  DE-LETE.                                            IF1174.2 227
   000809         083900     GO TO    F-LOG10-WRITE-24.                                   IF1174.2 810
   000810         084000 F-LOG10-WRITE-24.                                                IF1174.2
   000811         084100     MOVE "F-LOG10-24" TO PAR-NAME.                               IF1174.2 49
   000812         084200     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000813         084400 F-LOG10-25.                                                      IF1174.2
   000814         084500     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000815         084600     MOVE  0.477102 TO MIN-RANGE.                                 IF1174.2 39
   000816         084700     MOVE  0.477140 TO MAX-RANGE.                                 IF1174.2 40
   000817         084800 F-LOG10-TEST-25.                                                 IF1174.2
   000818         084900     COMPUTE WS-NUM = FUNCTION LOG10(B + C).                      IF1174.2 38 IFN 27 28
   000819         085000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000820         085100        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000821      1  085200                    PERFORM PASS                                  IF1174.2 225
   000822         085300     ELSE                                                         IF1174.2
   000823      1  085400                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000824      1  085500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000825      1  085600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000826      1  085700                    PERFORM FAIL.                                 IF1174.2 226
   000827         085800     GO TO F-LOG10-WRITE-25.                                      IF1174.2 831
   000828         085900 F-LOG10-DELETE-25.                                               IF1174.2
   000829         086000     PERFORM  DE-LETE.                                            IF1174.2 227
   000830         086100     GO TO    F-LOG10-WRITE-25.                                   IF1174.2 831
   000831         086200 F-LOG10-WRITE-25.                                                IF1174.2
   000832         086300     MOVE "F-LOG10-25" TO PAR-NAME.                               IF1174.2 49
   000833         086400     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000834         086600 F-LOG10-26.                                                      IF1174.2
   000835         086700     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000836         086800     MOVE  0.274690 TO MIN-RANGE.                                 IF1174.2 39
   000837         086900     MOVE  0.274712 TO MAX-RANGE.                                 IF1174.2 40
   000838         087000 F-LOG10-TEST-26.                                                 IF1174.2
   000839         087100     COMPUTE WS-NUM = FUNCTION LOG10(3.2 / 1.7).                  IF1174.2 38 IFN
   000840         087200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000841         087300        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000842      1  087400                    PERFORM PASS                                  IF1174.2 225
   000843         087500     ELSE                                                         IF1174.2
   000844      1  087600                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000845      1  087700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000846      1  087800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000847      1  087900                    PERFORM FAIL.                                 IF1174.2 226
   000848         088000     GO TO F-LOG10-WRITE-26.                                      IF1174.2 852
   000849         088100 F-LOG10-DELETE-26.                                               IF1174.2
   000850         088200     PERFORM  DE-LETE.                                            IF1174.2 227
   000851         088300     GO TO    F-LOG10-WRITE-26.                                   IF1174.2 852
   000852         088400 F-LOG10-WRITE-26.                                                IF1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         088500     MOVE "F-LOG10-26" TO PAR-NAME.                               IF1174.2 49
   000854         088600     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000855         088800 F-LOG10-27.                                                      IF1174.2
   000856         088900     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000857         089000     MOVE  0.904045 TO MIN-RANGE.                                 IF1174.2 39
   000858         089100     MOVE  0.904117 TO MAX-RANGE.                                 IF1174.2 40
   000859         089200 F-LOG10-TEST-27.                                                 IF1174.2
   000860         089300     COMPUTE WS-NUM = FUNCTION LOG10(E - H).                      IF1174.2 38 IFN 30 33
   000861         089400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000862         089500        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000863      1  089600                    PERFORM PASS                                  IF1174.2 225
   000864         089700     ELSE                                                         IF1174.2
   000865      1  089800                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000866      1  089900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000867      1  090000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000868      1  090100                    PERFORM FAIL.                                 IF1174.2 226
   000869         090200     GO TO F-LOG10-WRITE-27.                                      IF1174.2 873
   000870         090300 F-LOG10-DELETE-27.                                               IF1174.2
   000871         090400     PERFORM  DE-LETE.                                            IF1174.2 227
   000872         090500     GO TO    F-LOG10-WRITE-27.                                   IF1174.2 873
   000873         090600 F-LOG10-WRITE-27.                                                IF1174.2
   000874         090700     MOVE "F-LOG10-27" TO PAR-NAME.                               IF1174.2 49
   000875         090800     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000876         091000 F-LOG10-28.                                                      IF1174.2
   000877         091100     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000878         091200     MOVE  0.698942 TO MIN-RANGE.                                 IF1174.2 39
   000879         091300     MOVE  0.698998 TO MAX-RANGE.                                 IF1174.2 40
   000880         091400 F-LOG10-TEST-28.                                                 IF1174.2
   000881         091500     COMPUTE WS-NUM = FUNCTION LOG10(B - 2).                      IF1174.2 38 IFN 27
   000882         091600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000883         091700        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000884      1  091800                    PERFORM PASS                                  IF1174.2 225
   000885         091900     ELSE                                                         IF1174.2
   000886      1  092000                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000887      1  092100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000888      1  092200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000889      1  092300                    PERFORM FAIL.                                 IF1174.2 226
   000890         092400     GO TO F-LOG10-WRITE-28.                                      IF1174.2 894
   000891         092500 F-LOG10-DELETE-28.                                               IF1174.2
   000892         092600     PERFORM  DE-LETE.                                            IF1174.2 227
   000893         092700     GO TO    F-LOG10-WRITE-28.                                   IF1174.2 894
   000894         092800 F-LOG10-WRITE-28.                                                IF1174.2
   000895         092900     MOVE "F-LOG10-28" TO PAR-NAME.                               IF1174.2 49
   000896         093000     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000897         093200 F-LOG10-29.                                                      IF1174.2
   000898         093300     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000899         093400     MOVE  0.645227 TO MIN-RANGE.                                 IF1174.2 39
   000900         093500     MOVE  0.645279 TO MAX-RANGE.                                 IF1174.2 40
   000901         093600 F-LOG10-TEST-29.                                                 IF1174.2
   000902         093700     COMPUTE WS-NUM = FUNCTION LOG10(E + 1.7).                    IF1174.2 38 IFN 30
   000903         093800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000904         093900        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000905      1  094000                    PERFORM PASS                                  IF1174.2 225
   000906         094100     ELSE                                                         IF1174.2
   000907      1  094200                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000908      1  094300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000909      1  094400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910      1  094500                    PERFORM FAIL.                                 IF1174.2 226
   000911         094600     GO TO F-LOG10-WRITE-29.                                      IF1174.2 915
   000912         094700 F-LOG10-DELETE-29.                                               IF1174.2
   000913         094800     PERFORM  DE-LETE.                                            IF1174.2 227
   000914         094900     GO TO    F-LOG10-WRITE-29.                                   IF1174.2 915
   000915         095000 F-LOG10-WRITE-29.                                                IF1174.2
   000916         095100     MOVE "F-LOG10-29" TO PAR-NAME.                               IF1174.2 49
   000917         095200     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000918         095400 F-LOG10-30.                                                      IF1174.2
   000919         095500     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000920         095600     MOVE 4.84490 TO MIN-RANGE.                                   IF1174.2 39
   000921         095700     MOVE 4.84529 TO MAX-RANGE.                                   IF1174.2 40
   000922         095800 F-LOG10-TEST-30.                                                 IF1174.2
   000923         095900     COMPUTE WS-NUM = FUNCTION LOG10(B) + 4.                      IF1174.2 38 IFN 27
   000924         096000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000925         096100        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000926      1  096200                    PERFORM PASS                                  IF1174.2 225
   000927         096300     ELSE                                                         IF1174.2
   000928      1  096400                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000929      1  096500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000930      1  096600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000931      1  096700                    PERFORM FAIL.                                 IF1174.2 226
   000932         096800     GO TO F-LOG10-WRITE-30.                                      IF1174.2 936
   000933         096900 F-LOG10-DELETE-30.                                               IF1174.2
   000934         097000     PERFORM  DE-LETE.                                            IF1174.2 227
   000935         097100     GO TO    F-LOG10-WRITE-30.                                   IF1174.2 936
   000936         097200 F-LOG10-WRITE-30.                                                IF1174.2
   000937         097300     MOVE "F-LOG10-30" TO PAR-NAME.                               IF1174.2 49
   000938         097400     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000939         097600 F-LOG10-31.                                                      IF1174.2
   000940         097700     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000941         097800     MOVE -0.521411 TO MIN-RANGE.                                 IF1174.2 39
   000942         097900     MOVE -0.521369 TO MAX-RANGE.                                 IF1174.2 40
   000943         098000 F-LOG10-TEST-31.                                                 IF1174.2
   000944         098100     COMPUTE WS-NUM = FUNCTION LOG10(FUNCTION LOG10(2)).          IF1174.2 38 IFN IFN
   000945         098200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000946         098300        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000947      1  098400                    PERFORM PASS                                  IF1174.2 225
   000948         098500     ELSE                                                         IF1174.2
   000949      1  098600                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000950      1  098700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000951      1  098800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000952      1  098900                    PERFORM FAIL.                                 IF1174.2 226
   000953         099000     GO TO F-LOG10-WRITE-31.                                      IF1174.2 957
   000954         099100 F-LOG10-DELETE-31.                                               IF1174.2
   000955         099200     PERFORM  DE-LETE.                                            IF1174.2 227
   000956         099300     GO TO    F-LOG10-WRITE-31.                                   IF1174.2 957
   000957         099400 F-LOG10-WRITE-31.                                                IF1174.2
   000958         099500     MOVE "F-LOG10-31" TO PAR-NAME.                               IF1174.2 49
   000959         099600     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000960         099800 F-LOG10-32.                                                      IF1174.2
   000961         099900     MOVE ZERO TO WS-NUM.                                         IF1174.2 IMP 38
   000962         100000     MOVE -0.000040 TO MIN-RANGE.                                 IF1174.2 39
   000963         100100     MOVE  0.000040 TO MAX-RANGE.                                 IF1174.2 40
   000964         100200 F-LOG10-TEST-32.                                                 IF1174.2
   000965         100300     COMPUTE WS-NUM = FUNCTION LOG10(1) +                         IF1174.2 38 IFN
   000966         100400                      FUNCTION LOG10(1).                          IF1174.2 IFN
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         100500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1174.2 38 39
   000968         100600        (WS-NUM <= MAX-RANGE) THEN                                IF1174.2 38 40
   000969      1  100700                    PERFORM PASS                                  IF1174.2 225
   000970         100800     ELSE                                                         IF1174.2
   000971      1  100900                    MOVE WS-NUM TO COMPUTED-N                     IF1174.2 38 61
   000972      1  101000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1174.2 39 89
   000973      1  101100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1174.2 40 103
   000974      1  101200                    PERFORM FAIL.                                 IF1174.2 226
   000975         101300     GO TO F-LOG10-WRITE-32.                                      IF1174.2 979
   000976         101400 F-LOG10-DELETE-32.                                               IF1174.2
   000977         101500     PERFORM  DE-LETE.                                            IF1174.2 227
   000978         101600     GO TO    F-LOG10-WRITE-32.                                   IF1174.2 979
   000979         101700 F-LOG10-WRITE-32.                                                IF1174.2
   000980         101800     MOVE "F-LOG10-32" TO PAR-NAME.                               IF1174.2 49
   000981         101900     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000982         102100 F-LOG10-33.                                                      IF1174.2
   000983         102200     PERFORM F-LOG10-TEST-33                                      IF1174.2 987
   000984         102300       UNTIL FUNCTION LOG10(ARG1) < 0.30.                         IF1174.2 IFN 34
   000985         102400     PERFORM PASS.                                                IF1174.2 225
   000986         102500     GO TO F-LOG10-WRITE-33.                                      IF1174.2 992
   000987         102600 F-LOG10-TEST-33.                                                 IF1174.2
   000988         102700     COMPUTE ARG1 = ARG1 - 1.00.                                  IF1174.2 34 34
   000989         102800 F-LOG10-DELETE-33.                                               IF1174.2
   000990         102900     PERFORM  DE-LETE.                                            IF1174.2 227
   000991         103000     GO TO    F-LOG10-WRITE-33.                                   IF1174.2 992
   000992         103100 F-LOG10-WRITE-33.                                                IF1174.2
   000993         103200     MOVE "F-LOG10-33" TO PAR-NAME.                               IF1174.2 49
   000994         103300     PERFORM  PRINT-DETAIL.                                       IF1174.2 229
   000995         103500 CCVS-EXIT SECTION.                                               IF1174.2
   000996         103600 CCVS-999999.                                                     IF1174.2
   000997         103700     GO TO CLOSE-FILES.                                           IF1174.2 220
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    21
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  566 755
      133   ANSI-REFERENCE . . . . . . . .  307 314 330 M341
       34   ARG1 . . . . . . . . . . . . .  984 M988 988
       35   ARR
       27   B. . . . . . . . . . . . . . .  818 881 923
       28   C. . . . . . . . . . . . . . .  818
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
       61   COMPUTED-N . . . . . . . . . .  M353 M403 M424 M445 M466 M487 M508 M529 M550 M571 M592 M613 M634 M655 M676 M697
                                            M718 M739 M760 M781 M802 M823 M844 M865 M886 M907 M928 M949 M971
       59   COMPUTED-X . . . . . . . . . .  M237 304
       63   COMPUTED-0V18
       65   COMPUTED-14V4
       67   COMPUTED-18V0
       64   COMPUTED-4V14
       83   COR-ANSI-REFERENCE . . . . . .  M314 M322
      111   CORMA-ANSI-REFERENCE . . . . .  M315
       74   CORRECT-A. . . . . . . . . . .  75 76 77 78 79 326 328
      103   CORRECT-MAX. . . . . . . . . .  M355 M405 M426 M447 M468 M489 M510 M531 M552 M573 M594 M615 M636 M657 M678 M699
                                            M720 M741 M762 M783 M804 M825 M846 M867 M888 M909 M930 M951 M973
       89   CORRECT-MIN. . . . . . . . . .  316 M354 M404 M425 M446 M467 M488 M509 M530 M551 M572 M593 M614 M635 M656 M677
                                            M698 M719 M740 M761 M782 M803 M824 M845 M866 M887 M908 M929 M950 M972
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    22
0 Defined   Cross-reference of data names   References

0      79   CR-18V0
       93   CR-18V0
      107   CR-18V0
       29   D. . . . . . . . . . . . . . .  776
      125   DELETE-COUNTER . . . . . . . .  M227 256 271 273
       52   DOTVALUE . . . . . . . . . . .  M232
      131   DUMMY-HOLD . . . . . . . . . .  M285 295
       23   DUMMY-RECORD . . . . . . . . .  M242 M243 M244 M245 M247 M248 M249 M251 M253 M261 M268 M275 M280 M281 285 M286
                                            287 M288 M289 M290 M291 M292 M293 M294 M295 299 M300 M309 M331
       30   E. . . . . . . . . . . . . . .  650 692 860 902
      178   ENDER-DESC . . . . . . . . . .  M263 M274 M279
      126   ERROR-COUNTER. . . . . . . . .  M226 255 264 267
      130   ERROR-HOLD . . . . . . . . . .  M255 M256 M256 M257 259
      176   ERROR-TOTAL. . . . . . . . . .  M265 M267 M272 M273 M277 M278
       31   F. . . . . . . . . . . . . . .  587
       45   FEATURE. . . . . . . . . . . .  M342
       32   G. . . . . . . . . . . . . . .  608 755
       33   H. . . . . . . . . . . . . . .  860
      204   HYPHEN-LINE. . . . . . . . . .  249 251 294
      170   ID-AGAIN . . . . . . . . . . .  M216
       36   IND. . . . . . . . . . . . . .  629 776
      203   INF-ANSI-REFERENCE . . . . . .  M307 M310 M330 M332
      198   INFO-TEXT. . . . . . . . . . .  M308
      127   INSPECT-COUNTER. . . . . . . .  M224 255 276 278
       40   MAX-RANGE. . . . . . . . . . .  M346 350 355 M379 382 M396 400 405 M417 421 426 M438 442 447 M459 463 468 M480
                                            484 489 M501 505 510 M522 526 531 M543 547 552 M564 568 573 M585 589 594 M606
                                            610 615 M627 631 636 M648 652 657 M669 673 678 M690 694 699 M711 715 720 M732
                                            736 741 M753 757 762 M774 778 783 M795 799 804 M816 820 825 M837 841 846 M858
                                            862 867 M879 883 888 M900 904 909 M921 925 930 M942 946 951 M963 968 973
       39   MIN-RANGE. . . . . . . . . . .  M345 349 354 M378 381 M395 399 404 M416 420 425 M437 441 446 M458 462 467 M479
                                            483 488 M500 504 509 M521 525 530 M542 546 551 M563 567 572 M584 588 593 M605
                                            609 614 M626 630 635 M647 651 656 M668 672 677 M689 693 698 M710 714 719 M731
                                            735 740 M752 756 761 M773 777 782 M794 798 803 M815 819 824 M836 840 845 M857
                                            861 866 M878 882 887 M899 903 908 M920 924 929 M941 945 950 M962 967 972
       47   P-OR-F . . . . . . . . . . . .  M224 M225 M226 M227 234 M237
       49   PAR-NAME . . . . . . . . . . .  M239 M362 M375 M391 M412 M433 M454 M475 M496 M517 M538 M559 M580 M601 M622 M643
                                            M664 M685 M706 M727 M748 M769 M790 M811 M832 M853 M874 M895 M916 M937 M958 M980
                                            M993
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
       38   WS-NUM . . . . . . . . . . . .  M344 M348 349 350 353 M394 M398 399 400 403 M415 M419 420 421 424 M436 M440 441
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    23
0 Defined   Cross-reference of data names   References

0                                           442 445 M457 M461 462 463 466 M478 M482 483 484 487 M499 M503 504 505 508 M520
                                            M524 525 526 529 M541 M545 546 547 550 M562 M566 567 568 571 M583 M587 588 589
                                            592 M604 M608 609 610 613 M625 M629 630 631 634 M646 M650 651 652 655 M667 M671
                                            672 673 676 M688 M692 693 694 697 M709 M713 714 715 718 M730 M734 735 736 739
                                            M751 M755 756 757 760 M772 M776 777 778 781 M793 M797 798 799 802 M814 M818 819
                                            820 823 M835 M839 840 841 844 M856 M860 861 862 865 M877 M881 882 883 886 M898
                                            M902 903 904 907 M919 M923 924 925 928 M940 M944 945 946 949 M961 M965 967 968
                                            971
      200   XXCOMPUTED . . . . . . . . . .  M329
      202   XXCORRECT. . . . . . . . . . .  M328
      195   XXINFO . . . . . . . . . . . .  309 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    24
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
      995   CCVS-EXIT
      996   CCVS-999999
      213   CCVS1
      334   CCVS1-EXIT . . . . . . . . . .  G219
      220   CLOSE-FILES. . . . . . . . . .  G997
      246   COLUMN-NAMES-ROUTINE . . . . .  E218
      227   DE-LETE. . . . . . . . . . . .  P359 P372 P388 P409 P430 P451 P472 P493 P514 P535 P556 P577 P598 P619 P640 P661
                                            P682 P703 P724 P745 P766 P787 P808 P829 P850 P871 P892 P913 P934 P955 P977 P990
      250   END-ROUTINE. . . . . . . . . .  P221
      254   END-ROUTINE-1
      262   END-ROUTINE-12
      270   END-ROUTINE-13 . . . . . . . .  E221
      252   END-RTN-EXIT
      358   F-LOG10-DELETE-01
      371   F-LOG10-DELETE-02
      387   F-LOG10-DELETE-03
      408   F-LOG10-DELETE-04
      429   F-LOG10-DELETE-05
      450   F-LOG10-DELETE-06
      471   F-LOG10-DELETE-08
      492   F-LOG10-DELETE-09
      513   F-LOG10-DELETE-10
      534   F-LOG10-DELETE-11
      555   F-LOG10-DELETE-12
      576   F-LOG10-DELETE-13
      597   F-LOG10-DELETE-14
      618   F-LOG10-DELETE-15
      639   F-LOG10-DELETE-16
      660   F-LOG10-DELETE-17
      681   F-LOG10-DELETE-18
      702   F-LOG10-DELETE-19
      723   F-LOG10-DELETE-20
      744   F-LOG10-DELETE-21
      765   F-LOG10-DELETE-22
      786   F-LOG10-DELETE-23
      807   F-LOG10-DELETE-24
      828   F-LOG10-DELETE-25
      849   F-LOG10-DELETE-26
      870   F-LOG10-DELETE-27
      891   F-LOG10-DELETE-28
      912   F-LOG10-DELETE-29
      933   F-LOG10-DELETE-30
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    25
0 Defined   Cross-reference of procedures   References

0     954   F-LOG10-DELETE-31
      976   F-LOG10-DELETE-32
      989   F-LOG10-DELETE-33
      340   F-LOG10-INFO
      347   F-LOG10-TEST-01
      380   F-LOG10-TEST-03
      397   F-LOG10-TEST-04
      418   F-LOG10-TEST-05
      439   F-LOG10-TEST-06
      460   F-LOG10-TEST-08
      481   F-LOG10-TEST-09
      502   F-LOG10-TEST-10
      523   F-LOG10-TEST-11
      544   F-LOG10-TEST-12
      565   F-LOG10-TEST-13
      586   F-LOG10-TEST-14
      607   F-LOG10-TEST-15
      628   F-LOG10-TEST-16
      649   F-LOG10-TEST-17
      670   F-LOG10-TEST-18
      691   F-LOG10-TEST-19
      712   F-LOG10-TEST-20
      733   F-LOG10-TEST-21
      754   F-LOG10-TEST-22
      775   F-LOG10-TEST-23
      796   F-LOG10-TEST-24
      817   F-LOG10-TEST-25
      838   F-LOG10-TEST-26
      859   F-LOG10-TEST-27
      880   F-LOG10-TEST-28
      901   F-LOG10-TEST-29
      922   F-LOG10-TEST-30
      943   F-LOG10-TEST-31
      964   F-LOG10-TEST-32
      987   F-LOG10-TEST-33. . . . . . . .  P983
      361   F-LOG10-WRITE-01 . . . . . . .  G357 G360
      374   F-LOG10-WRITE-02 . . . . . . .  G370 G373
      390   F-LOG10-WRITE-03 . . . . . . .  G386 G389
      411   F-LOG10-WRITE-04 . . . . . . .  G407 G410
      432   F-LOG10-WRITE-05 . . . . . . .  G428 G431
      453   F-LOG10-WRITE-06 . . . . . . .  G449 G452
      474   F-LOG10-WRITE-08 . . . . . . .  G470 G473
      495   F-LOG10-WRITE-09 . . . . . . .  G491 G494
      516   F-LOG10-WRITE-10 . . . . . . .  G512 G515
      537   F-LOG10-WRITE-11 . . . . . . .  G533 G536
      558   F-LOG10-WRITE-12 . . . . . . .  G554 G557
      579   F-LOG10-WRITE-13 . . . . . . .  G575 G578
      600   F-LOG10-WRITE-14 . . . . . . .  G596 G599
      621   F-LOG10-WRITE-15 . . . . . . .  G617 G620
      642   F-LOG10-WRITE-16 . . . . . . .  G638 G641
      663   F-LOG10-WRITE-17 . . . . . . .  G659 G662
      684   F-LOG10-WRITE-18 . . . . . . .  G680 G683
      705   F-LOG10-WRITE-19 . . . . . . .  G701 G704
      726   F-LOG10-WRITE-20 . . . . . . .  G722 G725
      747   F-LOG10-WRITE-21 . . . . . . .  G743 G746
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    26
0 Defined   Cross-reference of procedures   References

0     768   F-LOG10-WRITE-22 . . . . . . .  G764 G767
      789   F-LOG10-WRITE-23 . . . . . . .  G785 G788
      810   F-LOG10-WRITE-24 . . . . . . .  G806 G809
      831   F-LOG10-WRITE-25 . . . . . . .  G827 G830
      852   F-LOG10-WRITE-26 . . . . . . .  G848 G851
      873   F-LOG10-WRITE-27 . . . . . . .  G869 G872
      894   F-LOG10-WRITE-28 . . . . . . .  G890 G893
      915   F-LOG10-WRITE-29 . . . . . . .  G911 G914
      936   F-LOG10-WRITE-30 . . . . . . .  G932 G935
      957   F-LOG10-WRITE-31 . . . . . . .  G953 G956
      979   F-LOG10-WRITE-32 . . . . . . .  G975 G978
      992   F-LOG10-WRITE-33 . . . . . . .  G986 G991
      343   F-LOG10-01
      364   F-LOG10-02
      377   F-LOG10-03
      393   F-LOG10-04
      414   F-LOG10-05
      435   F-LOG10-06
      456   F-LOG10-08
      477   F-LOG10-09
      498   F-LOG10-10
      519   F-LOG10-11
      540   F-LOG10-12
      561   F-LOG10-13
      582   F-LOG10-14
      603   F-LOG10-15
      624   F-LOG10-16
      645   F-LOG10-17
      666   F-LOG10-18
      687   F-LOG10-19
      708   F-LOG10-20
      729   F-LOG10-21
      750   F-LOG10-22
      771   F-LOG10-23
      792   F-LOG10-24
      813   F-LOG10-25
      834   F-LOG10-26
      855   F-LOG10-27
      876   F-LOG10-28
      897   F-LOG10-29
      918   F-LOG10-30
      939   F-LOG10-31
      960   F-LOG10-32
      982   F-LOG10-33
      226   FAIL . . . . . . . . . . . . .  P356 P369 P385 P406 P427 P448 P469 P490 P511 P532 P553 P574 P595 P616 P637 P658
                                            P679 P700 P721 P742 P763 P784 P805 P826 P847 P868 P889 P910 P931 P952 P974
      303   FAIL-ROUTINE . . . . . . . . .  P235
      323   FAIL-ROUTINE-EX. . . . . . . .  E235 G311
      312   FAIL-ROUTINE-WRITE . . . . . .  G305 G306
      241   HEAD-ROUTINE . . . . . . . . .  P218
      224   INSPT
      214   OPEN-FILES
      225   PASS . . . . . . . . . . . . .  P351 P367 P383 P401 P422 P443 P464 P485 P506 P527 P548 P569 P590 P611 P632 P653
                                            P674 P695 P716 P737 P758 P779 P800 P821 P842 P863 P884 P905 P926 P947 P969 P985
      229   PRINT-DETAIL . . . . . . . . .  P363 P376 P392 P413 P434 P455 P476 P497 P518 P539 P560 P581 P602 P623 P644 P665
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    27
0 Defined   Cross-reference of procedures   References

0                                           P686 P707 P728 P749 P770 P791 P812 P833 P854 P875 P896 P917 P938 P959 P981 P994
      339   SECT-IF117A
      222   TERMINATE-CCVS
      282   WRITE-LINE . . . . . . . . . .  P233 P234 P242 P243 P244 P245 P247 P248 P249 P251 P253 P261 P269 P275 P280 P281
                                            P309 P313 P317 P318 P320 P321 P331
      298   WRT-LN . . . . . . . . . . . .  P288 P289 P290 P291 P292 P293 P294 P297 P302
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    28
0 Defined   Cross-reference of programs     References

        3   IF117A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF117A    Date 06/04/2022  Time 11:59:35   Page    29
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF117A:
 *    Source records = 997
 *    Data Division statements = 97
 *    Procedure Division statements = 604
 *    Generated COBOL statements = 0
 *    Program complexity factor = 614
0End of compilation 1,  program IF117A,  highest severity 0.
0Return code 0
