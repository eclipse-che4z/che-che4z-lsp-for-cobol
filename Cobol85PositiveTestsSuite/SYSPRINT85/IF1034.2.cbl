1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:32   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:32   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1034.2
   000002         000200 PROGRAM-ID.                                                      IF1034.2
   000003         000300     IF103A.                                                      IF1034.2
   000004         000400                                                                  IF1034.2
   000005         000600*                                                         *       IF1034.2
   000006         000700*   This program is intended to form part of the CCVS85   *       IF1034.2
   000007         000800*   COBOL Test Suite. It contains tests for the           *       IF1034.2
   000008         000900*   Intrinsic Function ASIN.                              *       IF1034.2
   000009         001000*                                                         *       IF1034.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1034.2
   000011         001300 CONFIGURATION SECTION.                                           IF1034.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1034.2
   000013         001500     XXXXX082.                                                    IF1034.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1034.2
   000015         001700     XXXXX083.                                                    IF1034.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1034.2
   000017         001900 FILE-CONTROL.                                                    IF1034.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1034.2 22
   000019         002100     XXXXX055.                                                    IF1034.2
   000020         002200 DATA DIVISION.                                                   IF1034.2
   000021         002300 FILE SECTION.                                                    IF1034.2
   000022         002400 FD  PRINT-FILE.                                                  IF1034.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1034.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1034.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1034.2
   000026         002900* Variables specific to the Intrinsic Function Test IF103A*       IF1034.2
   000027         003100 01  A                   PIC S9(5)V9(5)      VALUE -0.00004.      IF1034.2
   000028         003200 01  B                   PIC S9(10)          VALUE 2.             IF1034.2
   000029         003300 01  C                   PIC S9(10)          VALUE 100000.        IF1034.2
   000030         003400 01  D                   PIC S9(10)          VALUE 1000.          IF1034.2
   000031         003500 01  PI                  PIC S9V9(17)        VALUE 3.141592654.   IF1034.2
   000032         003600 01  ARG1                PIC S9V9(17)        VALUE 1.             IF1034.2
   000033         003700 01  SQRT2               PIC S9V9(17)        VALUE 1.414213562.   IF1034.2
   000034         003800 01  SQRT3D2             PIC S9V9(17)        VALUE 0.866025403.   IF1034.2
   000035         003900 01  ARR                                     VALUE "40537".       IF1034.2
   000036         004000     02  IND OCCURS 5 TIMES PIC 9.                                IF1034.2
   000037         004100 01  TEMP                PIC S9(5)V9(5).                          IF1034.2
   000038         004200 01  WS-NUM              PIC S9(5)V9(6).                          IF1034.2
   000039         004300 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1034.2
   000040         004400 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1034.2
   000041         004500*                                                                 IF1034.2
   000042         004700*                                                                 IF1034.2
   000043         004800 01  TEST-RESULTS.                                                IF1034.2
   000044         004900     02 FILLER                   PIC X      VALUE SPACE.          IF1034.2 IMP
   000045         005000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1034.2 IMP
   000046         005100     02 FILLER                   PIC X      VALUE SPACE.          IF1034.2 IMP
   000047         005200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1034.2 IMP
   000048         005300     02 FILLER                   PIC X      VALUE SPACE.          IF1034.2 IMP
   000049         005400     02  PAR-NAME.                                                IF1034.2
   000050         005500       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1034.2 IMP
   000051         005600       03  PARDOT-X              PIC X      VALUE SPACE.          IF1034.2 IMP
   000052         005700       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1034.2 IMP
   000053         005800     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1034.2 IMP
   000054         005900     02 RE-MARK                  PIC X(61).                       IF1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000 01  TEST-COMPUTED.                                               IF1034.2
   000056         006100     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1034.2 IMP
   000057         006200     02 FILLER                   PIC X(17)  VALUE                 IF1034.2
   000058         006300            "       COMPUTED=".                                   IF1034.2
   000059         006400     02 COMPUTED-X.                                               IF1034.2
   000060         006500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1034.2 IMP
   000061         006600     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1034.2 60
   000062         006700                                 PIC -9(9).9(9).                  IF1034.2
   000063         006800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1034.2 60
   000064         006900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1034.2 60
   000065         007000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1034.2 60
   000066         007100     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1034.2 60
   000067         007200         04 COMPUTED-18V0                    PIC -9(18).          IF1034.2
   000068         007300         04 FILLER                           PIC X.               IF1034.2
   000069         007400     03 FILLER PIC X(50) VALUE SPACE.                             IF1034.2 IMP
   000070         007500 01  TEST-CORRECT.                                                IF1034.2
   000071         007600     02 FILLER PIC X(30) VALUE SPACE.                             IF1034.2 IMP
   000072         007700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1034.2
   000073         007800     02 CORRECT-X.                                                IF1034.2
   000074         007900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1034.2 IMP
   000075         008000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1034.2 74
   000076         008100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1034.2 74
   000077         008200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1034.2 74
   000078         008300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1034.2 74
   000079         008400     03      CR-18V0 REDEFINES CORRECT-A.                         IF1034.2 74
   000080         008500         04 CORRECT-18V0                     PIC -9(18).          IF1034.2
   000081         008600         04 FILLER                           PIC X.               IF1034.2
   000082         008700     03 FILLER PIC X(2) VALUE SPACE.                              IF1034.2 IMP
   000083         008800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1034.2 IMP
   000084         008900 01  TEST-CORRECT-MIN.                                            IF1034.2
   000085         009000     02 FILLER PIC X(30) VALUE SPACE.                             IF1034.2 IMP
   000086         009100     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1034.2
   000087         009200     02 CORRECTMI-X.                                              IF1034.2
   000088         009300     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1034.2 IMP
   000089         009400     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1034.2 88
   000090         009500     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1034.2 88
   000091         009600     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1034.2 88
   000092         009700     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1034.2 88
   000093         009800     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1034.2 88
   000094         009900         04 CORRECTMI-18V0                     PIC -9(18).        IF1034.2
   000095         010000         04 FILLER                           PIC X.               IF1034.2
   000096         010100     03 FILLER PIC X(2) VALUE SPACE.                              IF1034.2 IMP
   000097         010200     03 FILLER                           PIC X(48) VALUE SPACE.   IF1034.2 IMP
   000098         010300 01  TEST-CORRECT-MAX.                                            IF1034.2
   000099         010400     02 FILLER PIC X(30) VALUE SPACE.                             IF1034.2 IMP
   000100         010500     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1034.2
   000101         010600     02 CORRECTMA-X.                                              IF1034.2
   000102         010700     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1034.2 IMP
   000103         010800     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1034.2 102
   000104         010900     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1034.2 102
   000105         011000     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1034.2 102
   000106         011100     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1034.2 102
   000107         011200     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1034.2 102
   000108         011300         04 CORRECTMA-18V0                     PIC -9(18).        IF1034.2
   000109         011400         04 FILLER                           PIC X.               IF1034.2
   000110         011500     03 FILLER PIC X(2) VALUE SPACE.                              IF1034.2 IMP
   000111         011600     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700 01  CCVS-C-1.                                                    IF1034.2
   000113         011800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1034.2
   000114         011900-    "SS  PARAGRAPH-NAME                                          IF1034.2
   000115         012000-    "       REMARKS".                                            IF1034.2
   000116         012100     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1034.2 IMP
   000117         012200 01  CCVS-C-2.                                                    IF1034.2
   000118         012300     02 FILLER                     PIC X        VALUE SPACE.      IF1034.2 IMP
   000119         012400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1034.2
   000120         012500     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1034.2 IMP
   000121         012600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1034.2
   000122         012700     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1034.2 IMP
   000123         012800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1034.2 IMP
   000124         012900 01  REC-CT                        PIC 99       VALUE ZERO.       IF1034.2 IMP
   000125         013000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1034.2 IMP
   000126         013100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1034.2 IMP
   000127         013200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1034.2 IMP
   000128         013300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1034.2 IMP
   000129         013400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1034.2 IMP
   000130         013500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1034.2 IMP
   000131         013600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1034.2 IMP
   000132         013700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1034.2 IMP
   000133         013800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1034.2 IMP
   000134         013900 01  CCVS-H-1.                                                    IF1034.2
   000135         014000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1034.2 IMP
   000136         014100     02  FILLER                    PIC X(42)    VALUE             IF1034.2
   000137         014200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1034.2
   000138         014300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1034.2 IMP
   000139         014400 01  CCVS-H-2A.                                                   IF1034.2
   000140         014500   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1034.2 IMP
   000141         014600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1034.2
   000142         014700   02  FILLER                        PIC XXXX   VALUE             IF1034.2
   000143         014800     "4.2 ".                                                      IF1034.2
   000144         014900   02  FILLER                        PIC X(28)  VALUE             IF1034.2
   000145         015000            " COPY - NOT FOR DISTRIBUTION".                       IF1034.2
   000146         015100   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1034.2 IMP
   000147         015200                                                                  IF1034.2
   000148         015300 01  CCVS-H-2B.                                                   IF1034.2
   000149         015400   02  FILLER                        PIC X(15)  VALUE             IF1034.2
   000150         015500            "TEST RESULT OF ".                                    IF1034.2
   000151         015600   02  TEST-ID                       PIC X(9).                    IF1034.2
   000152         015700   02  FILLER                        PIC X(4)   VALUE             IF1034.2
   000153         015800            " IN ".                                               IF1034.2
   000154         015900   02  FILLER                        PIC X(12)  VALUE             IF1034.2
   000155         016000     " HIGH       ".                                              IF1034.2
   000156         016100   02  FILLER                        PIC X(22)  VALUE             IF1034.2
   000157         016200            " LEVEL VALIDATION FOR ".                             IF1034.2
   000158         016300   02  FILLER                        PIC X(58)  VALUE             IF1034.2
   000159         016400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1034.2
   000160         016500 01  CCVS-H-3.                                                    IF1034.2
   000161         016600     02  FILLER                      PIC X(34)  VALUE             IF1034.2
   000162         016700            " FOR OFFICIAL USE ONLY    ".                         IF1034.2
   000163         016800     02  FILLER                      PIC X(58)  VALUE             IF1034.2
   000164         016900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1034.2
   000165         017000     02  FILLER                      PIC X(28)  VALUE             IF1034.2
   000166         017100            "  COPYRIGHT   1985 ".                                IF1034.2
   000167         017200 01  CCVS-E-1.                                                    IF1034.2
   000168         017300     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1034.2
   000170         017500     02 ID-AGAIN                     PIC X(9).                    IF1034.2
   000171         017600     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1034.2 IMP
   000172         017700 01  CCVS-E-2.                                                    IF1034.2
   000173         017800     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1034.2 IMP
   000174         017900     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1034.2 IMP
   000175         018000     02 CCVS-E-2-2.                                               IF1034.2
   000176         018100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1034.2 IMP
   000177         018200         03 FILLER                   PIC X      VALUE SPACE.      IF1034.2 IMP
   000178         018300         03 ENDER-DESC               PIC X(44)  VALUE             IF1034.2
   000179         018400            "ERRORS ENCOUNTERED".                                 IF1034.2
   000180         018500 01  CCVS-E-3.                                                    IF1034.2
   000181         018600     02  FILLER                      PIC X(22)  VALUE             IF1034.2
   000182         018700            " FOR OFFICIAL USE ONLY".                             IF1034.2
   000183         018800     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1034.2 IMP
   000184         018900     02  FILLER                      PIC X(58)  VALUE             IF1034.2
   000185         019000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1034.2
   000186         019100     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1034.2 IMP
   000187         019200     02 FILLER                       PIC X(15)  VALUE             IF1034.2
   000188         019300             " COPYRIGHT 1985".                                   IF1034.2
   000189         019400 01  CCVS-E-4.                                                    IF1034.2
   000190         019500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1034.2 IMP
   000191         019600     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1034.2
   000192         019700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1034.2 IMP
   000193         019800     02 FILLER                       PIC X(40)  VALUE             IF1034.2
   000194         019900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1034.2
   000195         020000 01  XXINFO.                                                      IF1034.2
   000196         020100     02 FILLER                       PIC X(19)  VALUE             IF1034.2
   000197         020200            "*** INFORMATION ***".                                IF1034.2
   000198         020300     02 INFO-TEXT.                                                IF1034.2
   000199         020400       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1034.2 IMP
   000200         020500       04 XXCOMPUTED                 PIC X(20).                   IF1034.2
   000201         020600       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1034.2 IMP
   000202         020700       04 XXCORRECT                  PIC X(20).                   IF1034.2
   000203         020800     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1034.2
   000204         020900 01  HYPHEN-LINE.                                                 IF1034.2
   000205         021000     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1034.2 IMP
   000206         021100     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1034.2
   000207         021200-    "*****************************************".                 IF1034.2
   000208         021300     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1034.2
   000209         021400-    "******************************".                            IF1034.2
   000210         021500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1034.2
   000211         021600     "IF103A".                                                    IF1034.2
   000212         021700 PROCEDURE DIVISION.                                              IF1034.2
   000213         021800 CCVS1 SECTION.                                                   IF1034.2
   000214         021900 OPEN-FILES.                                                      IF1034.2
   000215         022000     OPEN     OUTPUT PRINT-FILE.                                  IF1034.2 22
   000216         022100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1034.2 210 151 210 170
   000217         022200     MOVE    SPACE TO TEST-RESULTS.                               IF1034.2 IMP 43
   000218         022300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1034.2 241 246
   000219         022400     GO TO CCVS1-EXIT.                                            IF1034.2 334
   000220         022500 CLOSE-FILES.                                                     IF1034.2
   000221         022600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1034.2 250 270 22
   000222         022700 TERMINATE-CCVS.                                                  IF1034.2
   000223         022800     STOP     RUN.                                                IF1034.2
   000224         022900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1034.2 47 127
   000225         023000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1034.2 47 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1034.2 47 126
   000227         023200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1034.2 47 125
   000228         023300     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1034.2 54
   000229         023400 PRINT-DETAIL.                                                    IF1034.2
   000230         023500     IF REC-CT NOT EQUAL TO ZERO                                  IF1034.2 124 IMP
   000231      1  023600             MOVE "." TO PARDOT-X                                 IF1034.2 51
   000232      1  023700             MOVE REC-CT TO DOTVALUE.                             IF1034.2 124 52
   000233         023800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1034.2 43 23 282
   000234         023900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1034.2 47 282
   000235      1  024000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1034.2 303 323
   000236      1  024100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1034.2 324 333
   000237         024200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1034.2 IMP 47 IMP 59
   000238         024300     MOVE SPACE TO CORRECT-X.                                     IF1034.2 IMP 73
   000239         024400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1034.2 124 IMP IMP 49
   000240         024500     MOVE     SPACE TO RE-MARK.                                   IF1034.2 IMP 54
   000241         024600 HEAD-ROUTINE.                                                    IF1034.2
   000242         024700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1034.2 134 24 282
   000243         024800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1034.2 139 24 282
   000244         024900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1034.2 148 24 282
   000245         025000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1034.2 160 24 282
   000246         025100 COLUMN-NAMES-ROUTINE.                                            IF1034.2
   000247         025200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1034.2 112 24 282
   000248         025300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1034.2 117 24 282
   000249         025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1034.2 204 24 282
   000250         025500 END-ROUTINE.                                                     IF1034.2
   000251         025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1034.2 204 24 282
   000252         025700 END-RTN-EXIT.                                                    IF1034.2
   000253         025800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1034.2 167 24 282
   000254         025900 END-ROUTINE-1.                                                   IF1034.2
   000255         026000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1034.2 126 130 127
   000256         026100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1034.2 130 125 130
   000257         026200      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1034.2 128 130
   000258         026300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1034.2 128 190
   000259         026400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1034.2 130 192
   000260         026500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1034.2 189 175
   000261         026600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1034.2 172 24 282
   000262         026700  END-ROUTINE-12.                                                 IF1034.2
   000263         026800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1034.2 178
   000264         026900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1034.2 126 IMP
   000265      1  027000         MOVE "NO " TO ERROR-TOTAL                                IF1034.2 176
   000266         027100         ELSE                                                     IF1034.2
   000267      1  027200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1034.2 126 176
   000268         027300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1034.2 172 24
   000269         027400     PERFORM WRITE-LINE.                                          IF1034.2 282
   000270         027500 END-ROUTINE-13.                                                  IF1034.2
   000271         027600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1034.2 125 IMP
   000272      1  027700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1034.2 176
   000273      1  027800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1034.2 125 176
   000274         027900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1034.2 178
   000275         028000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1034.2 172 24 282
   000276         028100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1034.2 127 IMP
   000277      1  028200          MOVE "NO " TO ERROR-TOTAL                               IF1034.2 176
   000278      1  028300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1034.2 127 176
   000279         028400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1034.2 178
   000280         028500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1034.2 172 24 282
   000281         028600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1034.2 180 24 282
   000282         028700 WRITE-LINE.                                                      IF1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     ADD 1 TO RECORD-COUNT.                                       IF1034.2 132
   000284         028900     IF RECORD-COUNT GREATER 42                                   IF1034.2 132
   000285      1  029000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1034.2 24 131
   000286      1  029100         MOVE SPACE TO DUMMY-RECORD                               IF1034.2 IMP 24
   000287      1  029200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1034.2 24
   000288      1  029300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1034.2 134 24 298
   000289      1  029400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1034.2 139 24 298
   000290      1  029500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1034.2 148 24 298
   000291      1  029600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1034.2 160 24 298
   000292      1  029700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1034.2 112 24 298
   000293      1  029800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1034.2 117 24 298
   000294      1  029900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1034.2 204 24 298
   000295      1  030000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1034.2 131 24
   000296      1  030100         MOVE ZERO TO RECORD-COUNT.                               IF1034.2 IMP 132
   000297         030200     PERFORM WRT-LN.                                              IF1034.2 298
   000298         030300 WRT-LN.                                                          IF1034.2
   000299         030400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1034.2 24
   000300         030500     MOVE SPACE TO DUMMY-RECORD.                                  IF1034.2 IMP 24
   000301         030600 BLANK-LINE-PRINT.                                                IF1034.2
   000302         030700     PERFORM WRT-LN.                                              IF1034.2 298
   000303         030800 FAIL-ROUTINE.                                                    IF1034.2
   000304         030900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1034.2 59 IMP
   000305      1  031000            GO TO FAIL-ROUTINE-WRITE.                             IF1034.2 312
   000306         031100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1034.2 73 IMP 312
   000307         031200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1034.2 133 203
   000308         031300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1034.2 198
   000309         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1034.2 195 24 282
   000310         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1034.2 IMP 203
   000311         031600     GO TO  FAIL-ROUTINE-EX.                                      IF1034.2 323
   000312         031700 FAIL-ROUTINE-WRITE.                                              IF1034.2
   000313         031800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1034.2 55 23 282
   000314         031900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1034.2 133 83
   000315         032000                              CORMA-ANSI-REFERENCE.               IF1034.2 111
   000316         032100     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1034.2 89 IMP
   000317      1  032200           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1034.2 84 23 282
   000318      1  032300           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1034.2 98 23 282
   000319         032400     ELSE                                                         IF1034.2
   000320      1  032500           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1034.2 70 23 282
   000321         032600     PERFORM WRITE-LINE.                                          IF1034.2 282
   000322         032700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1034.2 IMP 83
   000323         032800 FAIL-ROUTINE-EX. EXIT.                                           IF1034.2
   000324         032900 BAIL-OUT.                                                        IF1034.2
   000325         033000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1034.2 60 IMP 327
   000326         033100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1034.2 74 IMP 333
   000327         033200 BAIL-OUT-WRITE.                                                  IF1034.2
   000328         033300     MOVE CORRECT-A TO XXCORRECT.                                 IF1034.2 74 202
   000329         033400     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1034.2 60 200
   000330         033500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1034.2 133 203
   000331         033600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1034.2 195 24 282
   000332         033700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1034.2 IMP 203
   000333         033800 BAIL-OUT-EX. EXIT.                                               IF1034.2
   000334         033900 CCVS1-EXIT.                                                      IF1034.2
   000335         034000     EXIT.                                                        IF1034.2
   000336         034200*                                                      *          IF1034.2
   000337         034300*    Intrinsic Function Tests         IF103A - ASIN    *          IF1034.2
   000338         034400*                                                      *          IF1034.2
   000339         034600 SECT-IF103A SECTION.                                             IF1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034700 F-ASIN-INFO.                                                     IF1034.2
   000341         034800     MOVE     "See ref. A-35 2.7" TO ANSI-REFERENCE.              IF1034.2 133
   000342         034900     MOVE     "ASIN Function" TO FEATURE.                         IF1034.2 45
   000343         035100 F-ASIN-01.                                                       IF1034.2
   000344         035200     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000345         035300     MOVE  1.57076 TO MIN-RANGE.                                  IF1034.2 39
   000346         035400     MOVE  1.57080 TO MAX-RANGE.                                  IF1034.2 40
   000347         035500 F-ASIN-TEST-01.                                                  IF1034.2
   000348         035600     COMPUTE WS-NUM = FUNCTION ASIN(1.0).                         IF1034.2 38 IFN
   000349         035700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000350         035800        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000351      1  035900                    PERFORM PASS                                  IF1034.2 225
   000352         036000     ELSE                                                         IF1034.2
   000353      1  036100                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000354      1  036200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000355      1  036300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000356      1  036400                    PERFORM FAIL.                                 IF1034.2 226
   000357         036500     GO TO F-ASIN-WRITE-01.                                       IF1034.2 361
   000358         036600 F-ASIN-DELETE-01.                                                IF1034.2
   000359         036700     PERFORM  DE-LETE.                                            IF1034.2 227
   000360         036800     GO TO    F-ASIN-WRITE-01.                                    IF1034.2 361
   000361         036900 F-ASIN-WRITE-01.                                                 IF1034.2
   000362         037000     MOVE "F-ASIN-01" TO PAR-NAME.                                IF1034.2 49
   000363         037100     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000364         037300 F-ASIN-02.                                                       IF1034.2
   000365         037400     EVALUATE FUNCTION ASIN(0.5)                                  IF1034.2 IFN
   000366         037500     WHEN  0.523588 THRU 0.523609                                 IF1034.2
   000367      1  037600               PERFORM PASS                                       IF1034.2 225
   000368         037700     WHEN OTHER                                                   IF1034.2
   000369      1  037800               PERFORM FAIL.                                      IF1034.2 226
   000370         037900     GO TO F-ASIN-WRITE-02.                                       IF1034.2 374
   000371         038000 F-ASIN-DELETE-02.                                                IF1034.2
   000372         038100     PERFORM  DE-LETE.                                            IF1034.2 227
   000373         038200     GO TO    F-ASIN-WRITE-02.                                    IF1034.2 374
   000374         038300 F-ASIN-WRITE-02.                                                 IF1034.2
   000375         038400     MOVE "F-ASIN-02" TO PAR-NAME.                                IF1034.2 49
   000376         038500     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000377         038700 F-ASIN-03.                                                       IF1034.2
   000378         038800     MOVE -0.000020 TO MIN-RANGE.                                 IF1034.2 39
   000379         038900     MOVE  0.000020 TO MAX-RANGE.                                 IF1034.2 40
   000380         039000 F-ASIN-TEST-03.                                                  IF1034.2
   000381         039100     IF (FUNCTION ASIN(0) >= MIN-RANGE) AND                       IF1034.2 IFN 39
   000382         039200        (FUNCTION ASIN(0) <= MAX-RANGE) THEN                      IF1034.2 IFN 40
   000383      1  039300                    PERFORM PASS                                  IF1034.2 225
   000384         039400     ELSE                                                         IF1034.2
   000385      1  039500                    PERFORM FAIL.                                 IF1034.2 226
   000386         039600     GO TO F-ASIN-WRITE-03.                                       IF1034.2 390
   000387         039700 F-ASIN-DELETE-03.                                                IF1034.2
   000388         039800     PERFORM  DE-LETE.                                            IF1034.2 227
   000389         039900     GO TO    F-ASIN-WRITE-03.                                    IF1034.2 390
   000390         040000 F-ASIN-WRITE-03.                                                 IF1034.2
   000391         040100     MOVE "F-ASIN-03" TO PAR-NAME.                                IF1034.2 49
   000392         040200     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000393         040400 F-ASIN-04.                                                       IF1034.2
   000394         040500     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000395         040600     MOVE -1.57080 TO MIN-RANGE.                                  IF1034.2 39
   000396         040700     MOVE -1.57076 TO MAX-RANGE.                                  IF1034.2 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800 F-ASIN-TEST-04.                                                  IF1034.2
   000398         040900     COMPUTE WS-NUM = FUNCTION ASIN(-1).                          IF1034.2 38 IFN
   000399         041000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000400         041100        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000401      1  041200                    PERFORM PASS                                  IF1034.2 225
   000402         041300     ELSE                                                         IF1034.2
   000403      1  041400                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000404      1  041500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000405      1  041600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000406      1  041700                    PERFORM FAIL.                                 IF1034.2 226
   000407         041800     GO TO F-ASIN-WRITE-04.                                       IF1034.2 411
   000408         041900 F-ASIN-DELETE-04.                                                IF1034.2
   000409         042000     PERFORM  DE-LETE.                                            IF1034.2 227
   000410         042100     GO TO    F-ASIN-WRITE-04.                                    IF1034.2 411
   000411         042200 F-ASIN-WRITE-04.                                                 IF1034.2
   000412         042300     MOVE "F-ASIN-04" TO PAR-NAME.                                IF1034.2 49
   000413         042400     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000414         042600 F-ASIN-05.                                                       IF1034.2
   000415         042700     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000416         042800     MOVE  1.52604 TO MIN-RANGE.                                  IF1034.2 39
   000417         042900     MOVE  1.52610 TO MAX-RANGE.                                  IF1034.2 40
   000418         043000 F-ASIN-TEST-05.                                                  IF1034.2
   000419         043100     COMPUTE WS-NUM = FUNCTION ASIN(.999).                        IF1034.2 38 IFN
   000420         043200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000421         043300        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000422      1  043400                    PERFORM PASS                                  IF1034.2 225
   000423         043500     ELSE                                                         IF1034.2
   000424      1  043600                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000425      1  043700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000426      1  043800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000427      1  043900                    PERFORM FAIL.                                 IF1034.2 226
   000428         044000     GO TO F-ASIN-WRITE-05.                                       IF1034.2 432
   000429         044100 F-ASIN-DELETE-05.                                                IF1034.2
   000430         044200     PERFORM  DE-LETE.                                            IF1034.2 227
   000431         044300     GO TO    F-ASIN-WRITE-05.                                    IF1034.2 432
   000432         044400 F-ASIN-WRITE-05.                                                 IF1034.2
   000433         044500     MOVE "F-ASIN-05" TO PAR-NAME.                                IF1034.2 49
   000434         044600     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000435         044800 F-ASIN-06.                                                       IF1034.2
   000436         044900     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000437         045000     MOVE  0.512079 TO MIN-RANGE.                                 IF1034.2 39
   000438         045100     MOVE  0.512099 TO MAX-RANGE.                                 IF1034.2 40
   000439         045200 F-ASIN-TEST-06.                                                  IF1034.2
   000440         045300     COMPUTE WS-NUM = FUNCTION ASIN(.49).                         IF1034.2 38 IFN
   000441         045400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000442         045500        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000443      1  045600                    PERFORM PASS                                  IF1034.2 225
   000444         045700     ELSE                                                         IF1034.2
   000445      1  045800                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000446      1  045900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000447      1  046000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000448      1  046100                    PERFORM FAIL.                                 IF1034.2 226
   000449         046200     GO TO F-ASIN-WRITE-06.                                       IF1034.2 453
   000450         046300 F-ASIN-DELETE-06.                                                IF1034.2
   000451         046400     PERFORM  DE-LETE.                                            IF1034.2 227
   000452         046500     GO TO    F-ASIN-WRITE-06.                                    IF1034.2 453
   000453         046600 F-ASIN-WRITE-06.                                                 IF1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046700     MOVE "F-ASIN-06" TO PAR-NAME.                                IF1034.2 49
   000455         046800     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000456         047000 F-ASIN-08.                                                       IF1034.2
   000457         047100     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000458         047200     MOVE -1.52610 TO MIN-RANGE.                                  IF1034.2 39
   000459         047300     MOVE -1.52604 TO MAX-RANGE.                                  IF1034.2 40
   000460         047400 F-ASIN-TEST-08.                                                  IF1034.2
   000461         047500     COMPUTE WS-NUM = FUNCTION ASIN(-.999).                       IF1034.2 38 IFN
   000462         047600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000463         047700        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000464      1  047800                    PERFORM PASS                                  IF1034.2 225
   000465         047900     ELSE                                                         IF1034.2
   000466      1  048000                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000467      1  048100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000468      1  048200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000469      1  048300                    PERFORM FAIL.                                 IF1034.2 226
   000470         048400     GO TO F-ASIN-WRITE-08.                                       IF1034.2 474
   000471         048500 F-ASIN-DELETE-08.                                                IF1034.2
   000472         048600     PERFORM  DE-LETE.                                            IF1034.2 227
   000473         048700     GO TO    F-ASIN-WRITE-08.                                    IF1034.2 474
   000474         048800 F-ASIN-WRITE-08.                                                 IF1034.2
   000475         048900     MOVE "F-ASIN-08" TO PAR-NAME.                                IF1034.2 49
   000476         049000     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000477         049200 F-ASIN-11.                                                       IF1034.2
   000478         049300     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000479         049400     MOVE -0.000020 TO MIN-RANGE.                                 IF1034.2 39
   000480         049500     MOVE  0.000020 TO MAX-RANGE.                                 IF1034.2 40
   000481         049600 F-ASIN-TEST-11.                                                  IF1034.2
   000482         049700     COMPUTE WS-NUM = FUNCTION ASIN(IND(B)).                      IF1034.2 38 IFN 36 28
   000483         049800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000484         049900        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000485      1  050000                    PERFORM PASS                                  IF1034.2 225
   000486         050100     ELSE                                                         IF1034.2
   000487      1  050200                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000488      1  050300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000489      1  050400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000490      1  050500                    PERFORM FAIL.                                 IF1034.2 226
   000491         050600     GO TO F-ASIN-WRITE-11.                                       IF1034.2 495
   000492         050700 F-ASIN-DELETE-11.                                                IF1034.2
   000493         050800     PERFORM  DE-LETE.                                            IF1034.2 227
   000494         050900     GO TO    F-ASIN-WRITE-11.                                    IF1034.2 495
   000495         051000 F-ASIN-WRITE-11.                                                 IF1034.2
   000496         051100     MOVE "F-ASIN-11" TO PAR-NAME.                                IF1034.2 49
   000497         051200     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000498         051400 F-ASIN-12.                                                       IF1034.2
   000499         051500     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000500         051600     MOVE  0.785367 TO MIN-RANGE.                                 IF1034.2 39
   000501         051700     MOVE  0.785429 TO MAX-RANGE.                                 IF1034.2 40
   000502         051800 F-ASIN-TEST-12.                                                  IF1034.2
   000503         051900     COMPUTE WS-NUM = FUNCTION ASIN(1 / SQRT2).                   IF1034.2 38 IFN 33
   000504         052000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000505         052100        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000506      1  052200                    PERFORM PASS                                  IF1034.2 225
   000507         052300     ELSE                                                         IF1034.2
   000508      1  052400                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000509      1  052500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000510      1  052600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  052700                    PERFORM FAIL.                                 IF1034.2 226
   000512         052800     GO TO F-ASIN-WRITE-12.                                       IF1034.2 516
   000513         052900 F-ASIN-DELETE-12.                                                IF1034.2
   000514         053000     PERFORM  DE-LETE.                                            IF1034.2 227
   000515         053100     GO TO    F-ASIN-WRITE-12.                                    IF1034.2 516
   000516         053200 F-ASIN-WRITE-12.                                                 IF1034.2
   000517         053300     MOVE "F-ASIN-12" TO PAR-NAME.                                IF1034.2 49
   000518         053400     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000519         053600 F-ASIN-13.                                                       IF1034.2
   000520         053700     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000521         053800     MOVE  1.04715 TO MIN-RANGE.                                  IF1034.2 39
   000522         053900     MOVE  1.04723 TO MAX-RANGE.                                  IF1034.2 40
   000523         054000 F-ASIN-TEST-13.                                                  IF1034.2
   000524         054100     COMPUTE WS-NUM = FUNCTION ASIN(SQRT3D2).                     IF1034.2 38 IFN 34
   000525         054200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000526         054300        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000527      1  054400                    PERFORM PASS                                  IF1034.2 225
   000528         054500     ELSE                                                         IF1034.2
   000529      1  054600                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000530      1  054700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000531      1  054800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000532      1  054900                    PERFORM FAIL.                                 IF1034.2 226
   000533         055000     GO TO F-ASIN-WRITE-13.                                       IF1034.2 537
   000534         055100 F-ASIN-DELETE-13.                                                IF1034.2
   000535         055200     PERFORM  DE-LETE.                                            IF1034.2 227
   000536         055300     GO TO    F-ASIN-WRITE-13.                                    IF1034.2 537
   000537         055400 F-ASIN-WRITE-13.                                                 IF1034.2
   000538         055500     MOVE "F-ASIN-13" TO PAR-NAME.                                IF1034.2 49
   000539         055600     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000540         055800 F-ASIN-15.                                                       IF1034.2
   000541         055900     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000542         056000     MOVE  1.42919 TO MIN-RANGE.                                  IF1034.2 39
   000543         056100     MOVE  1.42931 TO MAX-RANGE.                                  IF1034.2 40
   000544         056200 F-ASIN-TEST-15.                                                  IF1034.2
   000545         056300     COMPUTE WS-NUM = FUNCTION ASIN(1.98 / 2).                    IF1034.2 38 IFN
   000546         056400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000547         056500        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000548      1  056600                    PERFORM PASS                                  IF1034.2 225
   000549         056700     ELSE                                                         IF1034.2
   000550      1  056800                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000551      1  056900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000552      1  057000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000553      1  057100                    PERFORM FAIL.                                 IF1034.2 226
   000554         057200     GO TO F-ASIN-WRITE-15.                                       IF1034.2 558
   000555         057300 F-ASIN-DELETE-15.                                                IF1034.2
   000556         057400     PERFORM  DE-LETE.                                            IF1034.2 227
   000557         057500     GO TO    F-ASIN-WRITE-15.                                    IF1034.2 558
   000558         057600 F-ASIN-WRITE-15.                                                 IF1034.2
   000559         057700     MOVE "F-ASIN-15" TO PAR-NAME.                                IF1034.2 49
   000560         057800     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000561         058000 F-ASIN-16.                                                       IF1034.2
   000562         058100     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000563         058200     MOVE  0.512069  TO MIN-RANGE.                                IF1034.2 39
   000564         058300     MOVE  0.512110 TO MAX-RANGE.                                 IF1034.2 40
   000565         058400 F-ASIN-TEST-16.                                                  IF1034.2
   000566         058500     COMPUTE WS-NUM = FUNCTION ASIN(0.2 + 0.29).                  IF1034.2 38 IFN
   000567         058600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058700        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000569      1  058800                    PERFORM PASS                                  IF1034.2 225
   000570         058900     ELSE                                                         IF1034.2
   000571      1  059000                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000572      1  059100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000573      1  059200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000574      1  059300                    PERFORM FAIL.                                 IF1034.2 226
   000575         059400     GO TO F-ASIN-WRITE-16.                                       IF1034.2 579
   000576         059500 F-ASIN-DELETE-16.                                                IF1034.2
   000577         059600     PERFORM  DE-LETE.                                            IF1034.2 227
   000578         059700     GO TO    F-ASIN-WRITE-16.                                    IF1034.2 579
   000579         059800 F-ASIN-WRITE-16.                                                 IF1034.2
   000580         059900     MOVE "F-ASIN-16" TO PAR-NAME.                                IF1034.2 49
   000581         060000     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000582         060200 F-ASIN-17.                                                       IF1034.2
   000583         060300     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000584         060400     MOVE -1.42931 TO MIN-RANGE.                                  IF1034.2 39
   000585         060500     MOVE -1.42919 TO MAX-RANGE.                                  IF1034.2 40
   000586         060600 F-ASIN-TEST-17.                                                  IF1034.2
   000587         060700     COMPUTE WS-NUM = FUNCTION ASIN(0.99 * -1).                   IF1034.2 38 IFN
   000588         060800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000589         060900        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000590      1  061000                    PERFORM PASS                                  IF1034.2 225
   000591         061100     ELSE                                                         IF1034.2
   000592      1  061200                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000593      1  061300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000594      1  061400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000595      1  061500                    PERFORM FAIL.                                 IF1034.2 226
   000596         061600     GO TO F-ASIN-WRITE-17.                                       IF1034.2 600
   000597         061700 F-ASIN-DELETE-17.                                                IF1034.2
   000598         061800     PERFORM  DE-LETE.                                            IF1034.2 227
   000599         061900     GO TO    F-ASIN-WRITE-17.                                    IF1034.2 600
   000600         062000 F-ASIN-WRITE-17.                                                 IF1034.2
   000601         062100     MOVE "F-ASIN-17" TO PAR-NAME.                                IF1034.2 49
   000602         062200     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000603         062400 F-ASIN-18.                                                       IF1034.2
   000604         062500     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000605         062600     MOVE  0.675104  TO MIN-RANGE.                                IF1034.2 39
   000606         062700     MOVE  0.675158 TO MAX-RANGE.                                 IF1034.2 40
   000607         062800 F-ASIN-TEST-18.                                                  IF1034.2
   000608         062900     COMPUTE WS-NUM = FUNCTION ASIN(IND(3) / 8).                  IF1034.2 38 IFN 36
   000609         063000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000610         063100        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000611      1  063200                    PERFORM PASS                                  IF1034.2 225
   000612         063300     ELSE                                                         IF1034.2
   000613      1  063400                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000614      1  063500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000615      1  063600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000616      1  063700                    PERFORM FAIL.                                 IF1034.2 226
   000617         063800     GO TO F-ASIN-WRITE-18.                                       IF1034.2 621
   000618         063900 F-ASIN-DELETE-18.                                                IF1034.2
   000619         064000     PERFORM  DE-LETE.                                            IF1034.2 227
   000620         064100     GO TO    F-ASIN-WRITE-18.                                    IF1034.2 621
   000621         064200 F-ASIN-WRITE-18.                                                 IF1034.2
   000622         064300     MOVE "F-ASIN-18" TO PAR-NAME.                                IF1034.2 49
   000623         064400     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000624         064600 F-ASIN-19.                                                       IF1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064700     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000626         064800     MOVE  1.57073 TO MIN-RANGE.                                  IF1034.2 39
   000627         064900     MOVE  1.57080 TO MAX-RANGE.                                  IF1034.2 40
   000628         065000 F-ASIN-TEST-19.                                                  IF1034.2
   000629         065100     COMPUTE WS-NUM = FUNCTION ASIN(4 - 3).                       IF1034.2 38 IFN
   000630         065200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000631         065300        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000632      1  065400                    PERFORM PASS                                  IF1034.2 225
   000633         065500     ELSE                                                         IF1034.2
   000634      1  065600                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000635      1  065700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000636      1  065800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000637      1  065900                    PERFORM FAIL.                                 IF1034.2 226
   000638         066000     GO TO F-ASIN-WRITE-19.                                       IF1034.2 642
   000639         066100 F-ASIN-DELETE-19.                                                IF1034.2
   000640         066200     PERFORM  DE-LETE.                                            IF1034.2 227
   000641         066300     GO TO    F-ASIN-WRITE-19.                                    IF1034.2 642
   000642         066400 F-ASIN-WRITE-19.                                                 IF1034.2
   000643         066500     MOVE "F-ASIN-19" TO PAR-NAME.                                IF1034.2 49
   000644         066600     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000645         066800 F-ASIN-20.                                                       IF1034.2
   000646         066900     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000647         067000     MOVE -0.000040 TO MIN-RANGE.                                 IF1034.2 39
   000648         067100     MOVE  0.000040 TO MAX-RANGE.                                 IF1034.2 40
   000649         067200 F-ASIN-TEST-20.                                                  IF1034.2
   000650         067300     COMPUTE WS-NUM = FUNCTION ASIN(C - C).                       IF1034.2 38 IFN 29 29
   000651         067400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000652         067500        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000653      1  067600                    PERFORM PASS                                  IF1034.2 225
   000654         067700     ELSE                                                         IF1034.2
   000655      1  067800                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000656      1  067900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000657      1  068000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000658      1  068100                    PERFORM FAIL.                                 IF1034.2 226
   000659         068200     GO TO F-ASIN-WRITE-20.                                       IF1034.2 663
   000660         068300 F-ASIN-DELETE-20.                                                IF1034.2
   000661         068400     PERFORM  DE-LETE.                                            IF1034.2 227
   000662         068500     GO TO    F-ASIN-WRITE-20.                                    IF1034.2 663
   000663         068600 F-ASIN-WRITE-20.                                                 IF1034.2
   000664         068700     MOVE "F-ASIN-20" TO PAR-NAME.                                IF1034.2 49
   000665         068800     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000666         069000 F-ASIN-21.                                                       IF1034.2
   000667         069100     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000668         069200     MOVE  0.252670 TO MIN-RANGE.                                 IF1034.2 39
   000669         069300     MOVE  0.252690 TO MAX-RANGE.                                 IF1034.2 40
   000670         069400 F-ASIN-TEST-21.                                                  IF1034.2
   000671         069500     COMPUTE WS-NUM = FUNCTION ASIN(0.25 * 1).                    IF1034.2 38 IFN
   000672         069600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000673         069700        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000674      1  069800                    PERFORM PASS                                  IF1034.2 225
   000675         069900     ELSE                                                         IF1034.2
   000676      1  070000                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000677      1  070100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000678      1  070200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000679      1  070300                    PERFORM FAIL.                                 IF1034.2 226
   000680         070400     GO TO F-ASIN-WRITE-21.                                       IF1034.2 684
   000681         070500 F-ASIN-DELETE-21.                                                IF1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         070600     PERFORM  DE-LETE.                                            IF1034.2 227
   000683         070700     GO TO    F-ASIN-WRITE-21.                                    IF1034.2 684
   000684         070800 F-ASIN-WRITE-21.                                                 IF1034.2
   000685         070900     MOVE "F-ASIN-21" TO PAR-NAME.                                IF1034.2 49
   000686         071000     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000687         071200 F-ASIN-22.                                                       IF1034.2
   000688         071300     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000689         071400     MOVE  0.323933 TO MIN-RANGE.                                 IF1034.2 39
   000690         071500     MOVE  0.323959 TO MAX-RANGE.                                 IF1034.2 40
   000691         071600 F-ASIN-TEST-22.                                                  IF1034.2
   000692         071700     COMPUTE WS-NUM = FUNCTION ASIN(1 / PI).                      IF1034.2 38 IFN 31
   000693         071800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000694         071900        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000695      1  072000                    PERFORM PASS                                  IF1034.2 225
   000696         072100     ELSE                                                         IF1034.2
   000697      1  072200                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000698      1  072300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000699      1  072400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000700      1  072500                    PERFORM FAIL.                                 IF1034.2 226
   000701         072600     GO TO F-ASIN-WRITE-22.                                       IF1034.2 705
   000702         072700 F-ASIN-DELETE-22.                                                IF1034.2
   000703         072800     PERFORM  DE-LETE.                                            IF1034.2 227
   000704         072900     GO TO    F-ASIN-WRITE-22.                                    IF1034.2 705
   000705         073000 F-ASIN-WRITE-22.                                                 IF1034.2
   000706         073100     MOVE "F-ASIN-22" TO PAR-NAME.                                IF1034.2 49
   000707         073200     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000708         073400 F-ASIN-23.                                                       IF1034.2
   000709         073500     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000710         073600     MOVE -0.000040 TO MIN-RANGE.                                 IF1034.2 39
   000711         073700     MOVE  0.000040 TO MAX-RANGE.                                 IF1034.2 40
   000712         073800 F-ASIN-TEST-23.                                                  IF1034.2
   000713         073900     COMPUTE WS-NUM = FUNCTION ASIN((D / D) - 1).                 IF1034.2 38 IFN 30 30
   000714         074000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000715         074100        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000716      1  074200                    PERFORM PASS                                  IF1034.2 225
   000717         074300     ELSE                                                         IF1034.2
   000718      1  074400                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000719      1  074500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000720      1  074600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000721      1  074700                    PERFORM FAIL.                                 IF1034.2 226
   000722         074800     GO TO F-ASIN-WRITE-23.                                       IF1034.2 726
   000723         074900 F-ASIN-DELETE-23.                                                IF1034.2
   000724         075000     PERFORM  DE-LETE.                                            IF1034.2 227
   000725         075100     GO TO    F-ASIN-WRITE-23.                                    IF1034.2 726
   000726         075200 F-ASIN-WRITE-23.                                                 IF1034.2
   000727         075300     MOVE "F-ASIN-23" TO PAR-NAME.                                IF1034.2 49
   000728         075400     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000729         075600 F-ASIN-24.                                                       IF1034.2
   000730         075700     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000731         075800     MOVE -1.03219 TO MIN-RANGE.                                  IF1034.2 39
   000732         075900     MOVE -1.03211 TO MAX-RANGE.                                  IF1034.2 40
   000733         076000 F-ASIN-TEST-24.                                                  IF1034.2
   000734         076100     COMPUTE WS-NUM = FUNCTION ASIN(PI - 4).                      IF1034.2 38 IFN 31
   000735         076200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000736         076300        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000737      1  076400                    PERFORM PASS                                  IF1034.2 225
   000738         076500     ELSE                                                         IF1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739      1  076600                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000740      1  076700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000741      1  076800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000742      1  076900                    PERFORM FAIL.                                 IF1034.2 226
   000743         077000     GO TO F-ASIN-WRITE-24.                                       IF1034.2 747
   000744         077100 F-ASIN-DELETE-24.                                                IF1034.2
   000745         077200     PERFORM  DE-LETE.                                            IF1034.2 227
   000746         077300     GO TO    F-ASIN-WRITE-24.                                    IF1034.2 747
   000747         077400 F-ASIN-WRITE-24.                                                 IF1034.2
   000748         077500     MOVE "F-ASIN-24" TO PAR-NAME.                                IF1034.2 49
   000749         077600     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000750         077800 F-ASIN-25.                                                       IF1034.2
   000751         077900     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000752         078000     MOVE 0.142546 TO MIN-RANGE.                                  IF1034.2 39
   000753         078100     MOVE 0.142558 TO MAX-RANGE.                                  IF1034.2 40
   000754         078200 F-ASIN-TEST-25.                                                  IF1034.2
   000755         078300     COMPUTE WS-NUM = FUNCTION ASIN(FUNCTION ASIN(PI - 3)).       IF1034.2 38 IFN IFN 31
   000756         078400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000757         078500        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000758      1  078600                    PERFORM PASS                                  IF1034.2 225
   000759         078700     ELSE                                                         IF1034.2
   000760      1  078800                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000761      1  078900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000762      1  079000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000763      1  079100                    PERFORM FAIL.                                 IF1034.2 226
   000764         079200     GO TO F-ASIN-WRITE-25.                                       IF1034.2 768
   000765         079300 F-ASIN-DELETE-25.                                                IF1034.2
   000766         079400     PERFORM  DE-LETE.                                            IF1034.2 227
   000767         079500     GO TO    F-ASIN-WRITE-25.                                    IF1034.2 768
   000768         079600 F-ASIN-WRITE-25.                                                 IF1034.2
   000769         079700     MOVE "F-ASIN-25" TO PAR-NAME.                                IF1034.2 49
   000770         079800     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000771         080000 F-ASIN-26.                                                       IF1034.2
   000772         080100     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000773         080200     MOVE 1.28695 TO MIN-RANGE.                                   IF1034.2 39
   000774         080300     MOVE 1.28705 TO MAX-RANGE.                                   IF1034.2 40
   000775         080400 F-ASIN-TEST-26.                                                  IF1034.2
   000776         080500     COMPUTE WS-NUM = FUNCTION ASIN(0.6) +                        IF1034.2 38 IFN
   000777         080600                      FUNCTION ASIN(0.6).                         IF1034.2 IFN
   000778         080700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1034.2 38 39
   000779         080800        (WS-NUM <= MAX-RANGE) THEN                                IF1034.2 38 40
   000780      1  080900                    PERFORM PASS                                  IF1034.2 225
   000781         081000     ELSE                                                         IF1034.2
   000782      1  081100                    MOVE WS-NUM TO COMPUTED-N                     IF1034.2 38 61
   000783      1  081200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1034.2 39 89
   000784      1  081300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1034.2 40 103
   000785      1  081400                    PERFORM FAIL.                                 IF1034.2 226
   000786         081500     GO TO F-ASIN-WRITE-26.                                       IF1034.2 790
   000787         081600 F-ASIN-DELETE-26.                                                IF1034.2
   000788         081700     PERFORM  DE-LETE.                                            IF1034.2 227
   000789         081800     GO TO    F-ASIN-WRITE-26.                                    IF1034.2 790
   000790         081900 F-ASIN-WRITE-26.                                                 IF1034.2
   000791         082000     MOVE "F-ASIN-26" TO PAR-NAME.                                IF1034.2 49
   000792         082100     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000793         082300 F-ASIN-27.                                                       IF1034.2
   000794         082400     MOVE ZERO TO WS-NUM.                                         IF1034.2 IMP 38
   000795         082500     PERFORM F-ASIN-TEST-27                                       IF1034.2 799
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         082600       UNTIL FUNCTION ASIN(ARG1) < 0.                             IF1034.2 IFN 32
   000797         082700     PERFORM PASS.                                                IF1034.2 225
   000798         082800     GO TO F-ASIN-WRITE-27.                                       IF1034.2 804
   000799         082900 F-ASIN-TEST-27.                                                  IF1034.2
   000800         083000     COMPUTE ARG1 = ARG1 - 0.25.                                  IF1034.2 32 32
   000801         083100 F-ASIN-DELETE-27.                                                IF1034.2
   000802         083200     PERFORM  DE-LETE.                                            IF1034.2 227
   000803         083300     GO TO    F-ASIN-WRITE-27.                                    IF1034.2 804
   000804         083400 F-ASIN-WRITE-27.                                                 IF1034.2
   000805         083500     MOVE "F-ASIN-27" TO PAR-NAME.                                IF1034.2 49
   000806         083600     PERFORM  PRINT-DETAIL.                                       IF1034.2 229
   000807         083800 CCVS-EXIT SECTION.                                               IF1034.2
   000808         083900 CCVS-999999.                                                     IF1034.2
   000809         084000     GO TO CLOSE-FILES.                                           IF1034.2 220
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    18
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A
      133   ANSI-REFERENCE . . . . . . . .  307 314 330 M341
       32   ARG1 . . . . . . . . . . . . .  796 M800 800
       35   ARR
       28   B. . . . . . . . . . . . . . .  482
       29   C. . . . . . . . . . . . . . .  650 650
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
                                            M718 M739 M760 M782
       59   COMPUTED-X . . . . . . . . . .  M237 304
       63   COMPUTED-0V18
       65   COMPUTED-14V4
       67   COMPUTED-18V0
       64   COMPUTED-4V14
       83   COR-ANSI-REFERENCE . . . . . .  M314 M322
      111   CORMA-ANSI-REFERENCE . . . . .  M315
       74   CORRECT-A. . . . . . . . . . .  75 76 77 78 79 326 328
      103   CORRECT-MAX. . . . . . . . . .  M355 M405 M426 M447 M468 M489 M510 M531 M552 M573 M594 M615 M636 M657 M678 M699
                                            M720 M741 M762 M784
       89   CORRECT-MIN. . . . . . . . . .  316 M354 M404 M425 M446 M467 M488 M509 M530 M551 M572 M593 M614 M635 M656 M677
                                            M698 M719 M740 M761 M783
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    19
0 Defined   Cross-reference of data names   References

0      79   CR-18V0
       93   CR-18V0
      107   CR-18V0
       30   D. . . . . . . . . . . . . . .  713 713
      125   DELETE-COUNTER . . . . . . . .  M227 256 271 273
       52   DOTVALUE . . . . . . . . . . .  M232
      131   DUMMY-HOLD . . . . . . . . . .  M285 295
       24   DUMMY-RECORD . . . . . . . . .  M242 M243 M244 M245 M247 M248 M249 M251 M253 M261 M268 M275 M280 M281 285 M286
                                            287 M288 M289 M290 M291 M292 M293 M294 M295 299 M300 M309 M331
      178   ENDER-DESC . . . . . . . . . .  M263 M274 M279
      126   ERROR-COUNTER. . . . . . . . .  M226 255 264 267
      130   ERROR-HOLD . . . . . . . . . .  M255 M256 M256 M257 259
      176   ERROR-TOTAL. . . . . . . . . .  M265 M267 M272 M273 M277 M278
       45   FEATURE. . . . . . . . . . . .  M342
      204   HYPHEN-LINE. . . . . . . . . .  249 251 294
      170   ID-AGAIN . . . . . . . . . . .  M216
       36   IND. . . . . . . . . . . . . .  482 608
      203   INF-ANSI-REFERENCE . . . . . .  M307 M310 M330 M332
      198   INFO-TEXT. . . . . . . . . . .  M308
      127   INSPECT-COUNTER. . . . . . . .  M224 255 276 278
       40   MAX-RANGE. . . . . . . . . . .  M346 350 355 M379 382 M396 400 405 M417 421 426 M438 442 447 M459 463 468 M480
                                            484 489 M501 505 510 M522 526 531 M543 547 552 M564 568 573 M585 589 594 M606
                                            610 615 M627 631 636 M648 652 657 M669 673 678 M690 694 699 M711 715 720 M732
                                            736 741 M753 757 762 M774 779 784
       39   MIN-RANGE. . . . . . . . . . .  M345 349 354 M378 381 M395 399 404 M416 420 425 M437 441 446 M458 462 467 M479
                                            483 488 M500 504 509 M521 525 530 M542 546 551 M563 567 572 M584 588 593 M605
                                            609 614 M626 630 635 M647 651 656 M668 672 677 M689 693 698 M710 714 719 M731
                                            735 740 M752 756 761 M773 778 783
       47   P-OR-F . . . . . . . . . . . .  M224 M225 M226 M227 234 M237
       49   PAR-NAME . . . . . . . . . . .  M239 M362 M375 M391 M412 M433 M454 M475 M496 M517 M538 M559 M580 M601 M622 M643
                                            M664 M685 M706 M727 M748 M769 M791 M805
       51   PARDOT-X . . . . . . . . . . .  M231
      128   PASS-COUNTER . . . . . . . . .  M225 257 258
       31   PI . . . . . . . . . . . . . .  692 734 755
       22   PRINT-FILE . . . . . . . . . .  18 215 221
       23   PRINT-REC. . . . . . . . . . .  M233 M313 M317 M318 M320
       54   RE-MARK. . . . . . . . . . . .  M228 M240
      124   REC-CT . . . . . . . . . . . .  230 232 239
      123   REC-SKL-SUB
      132   RECORD-COUNT . . . . . . . . .  M283 284 M296
       33   SQRT2. . . . . . . . . . . . .  503
       34   SQRT3D2. . . . . . . . . . . .  524
       37   TEMP
       55   TEST-COMPUTED. . . . . . . . .  313
       70   TEST-CORRECT . . . . . . . . .  320
       98   TEST-CORRECT-MAX . . . . . . .  318
       84   TEST-CORRECT-MIN . . . . . . .  317
      151   TEST-ID. . . . . . . . . . . .  M216
       43   TEST-RESULTS . . . . . . . . .  M217 233
      129   TOTAL-ERROR
       38   WS-NUM . . . . . . . . . . . .  M344 M348 349 350 353 M394 M398 399 400 403 M415 M419 420 421 424 M436 M440 441
                                            442 445 M457 M461 462 463 466 M478 M482 483 484 487 M499 M503 504 505 508 M520
                                            M524 525 526 529 M541 M545 546 547 550 M562 M566 567 568 571 M583 M587 588 589
                                            592 M604 M608 609 610 613 M625 M629 630 631 634 M646 M650 651 652 655 M667 M671
                                            672 673 676 M688 M692 693 694 697 M709 M713 714 715 718 M730 M734 735 736 739
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    20
0 Defined   Cross-reference of data names   References

0                                           M751 M755 756 757 760 M772 M776 778 779 782 M794
      200   XXCOMPUTED . . . . . . . . . .  M329
      202   XXCORRECT. . . . . . . . . . .  M328
      195   XXINFO . . . . . . . . . . . .  309 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    21
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
      807   CCVS-EXIT
      808   CCVS-999999
      213   CCVS1
      334   CCVS1-EXIT . . . . . . . . . .  G219
      220   CLOSE-FILES. . . . . . . . . .  G809
      246   COLUMN-NAMES-ROUTINE . . . . .  E218
      227   DE-LETE. . . . . . . . . . . .  P359 P372 P388 P409 P430 P451 P472 P493 P514 P535 P556 P577 P598 P619 P640 P661
                                            P682 P703 P724 P745 P766 P788 P802
      250   END-ROUTINE. . . . . . . . . .  P221
      254   END-ROUTINE-1
      262   END-ROUTINE-12
      270   END-ROUTINE-13 . . . . . . . .  E221
      252   END-RTN-EXIT
      358   F-ASIN-DELETE-01
      371   F-ASIN-DELETE-02
      387   F-ASIN-DELETE-03
      408   F-ASIN-DELETE-04
      429   F-ASIN-DELETE-05
      450   F-ASIN-DELETE-06
      471   F-ASIN-DELETE-08
      492   F-ASIN-DELETE-11
      513   F-ASIN-DELETE-12
      534   F-ASIN-DELETE-13
      555   F-ASIN-DELETE-15
      576   F-ASIN-DELETE-16
      597   F-ASIN-DELETE-17
      618   F-ASIN-DELETE-18
      639   F-ASIN-DELETE-19
      660   F-ASIN-DELETE-20
      681   F-ASIN-DELETE-21
      702   F-ASIN-DELETE-22
      723   F-ASIN-DELETE-23
      744   F-ASIN-DELETE-24
      765   F-ASIN-DELETE-25
      787   F-ASIN-DELETE-26
      801   F-ASIN-DELETE-27
      340   F-ASIN-INFO
      347   F-ASIN-TEST-01
      380   F-ASIN-TEST-03
      397   F-ASIN-TEST-04
      418   F-ASIN-TEST-05
      439   F-ASIN-TEST-06
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    22
0 Defined   Cross-reference of procedures   References

0     460   F-ASIN-TEST-08
      481   F-ASIN-TEST-11
      502   F-ASIN-TEST-12
      523   F-ASIN-TEST-13
      544   F-ASIN-TEST-15
      565   F-ASIN-TEST-16
      586   F-ASIN-TEST-17
      607   F-ASIN-TEST-18
      628   F-ASIN-TEST-19
      649   F-ASIN-TEST-20
      670   F-ASIN-TEST-21
      691   F-ASIN-TEST-22
      712   F-ASIN-TEST-23
      733   F-ASIN-TEST-24
      754   F-ASIN-TEST-25
      775   F-ASIN-TEST-26
      799   F-ASIN-TEST-27 . . . . . . . .  P795
      361   F-ASIN-WRITE-01. . . . . . . .  G357 G360
      374   F-ASIN-WRITE-02. . . . . . . .  G370 G373
      390   F-ASIN-WRITE-03. . . . . . . .  G386 G389
      411   F-ASIN-WRITE-04. . . . . . . .  G407 G410
      432   F-ASIN-WRITE-05. . . . . . . .  G428 G431
      453   F-ASIN-WRITE-06. . . . . . . .  G449 G452
      474   F-ASIN-WRITE-08. . . . . . . .  G470 G473
      495   F-ASIN-WRITE-11. . . . . . . .  G491 G494
      516   F-ASIN-WRITE-12. . . . . . . .  G512 G515
      537   F-ASIN-WRITE-13. . . . . . . .  G533 G536
      558   F-ASIN-WRITE-15. . . . . . . .  G554 G557
      579   F-ASIN-WRITE-16. . . . . . . .  G575 G578
      600   F-ASIN-WRITE-17. . . . . . . .  G596 G599
      621   F-ASIN-WRITE-18. . . . . . . .  G617 G620
      642   F-ASIN-WRITE-19. . . . . . . .  G638 G641
      663   F-ASIN-WRITE-20. . . . . . . .  G659 G662
      684   F-ASIN-WRITE-21. . . . . . . .  G680 G683
      705   F-ASIN-WRITE-22. . . . . . . .  G701 G704
      726   F-ASIN-WRITE-23. . . . . . . .  G722 G725
      747   F-ASIN-WRITE-24. . . . . . . .  G743 G746
      768   F-ASIN-WRITE-25. . . . . . . .  G764 G767
      790   F-ASIN-WRITE-26. . . . . . . .  G786 G789
      804   F-ASIN-WRITE-27. . . . . . . .  G798 G803
      343   F-ASIN-01
      364   F-ASIN-02
      377   F-ASIN-03
      393   F-ASIN-04
      414   F-ASIN-05
      435   F-ASIN-06
      456   F-ASIN-08
      477   F-ASIN-11
      498   F-ASIN-12
      519   F-ASIN-13
      540   F-ASIN-15
      561   F-ASIN-16
      582   F-ASIN-17
      603   F-ASIN-18
      624   F-ASIN-19
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    23
0 Defined   Cross-reference of procedures   References

0     645   F-ASIN-20
      666   F-ASIN-21
      687   F-ASIN-22
      708   F-ASIN-23
      729   F-ASIN-24
      750   F-ASIN-25
      771   F-ASIN-26
      793   F-ASIN-27
      226   FAIL . . . . . . . . . . . . .  P356 P369 P385 P406 P427 P448 P469 P490 P511 P532 P553 P574 P595 P616 P637 P658
                                            P679 P700 P721 P742 P763 P785
      303   FAIL-ROUTINE . . . . . . . . .  P235
      323   FAIL-ROUTINE-EX. . . . . . . .  E235 G311
      312   FAIL-ROUTINE-WRITE . . . . . .  G305 G306
      241   HEAD-ROUTINE . . . . . . . . .  P218
      224   INSPT
      214   OPEN-FILES
      225   PASS . . . . . . . . . . . . .  P351 P367 P383 P401 P422 P443 P464 P485 P506 P527 P548 P569 P590 P611 P632 P653
                                            P674 P695 P716 P737 P758 P780 P797
      229   PRINT-DETAIL . . . . . . . . .  P363 P376 P392 P413 P434 P455 P476 P497 P518 P539 P560 P581 P602 P623 P644 P665
                                            P686 P707 P728 P749 P770 P792 P806
      339   SECT-IF103A
      222   TERMINATE-CCVS
      282   WRITE-LINE . . . . . . . . . .  P233 P234 P242 P243 P244 P245 P247 P248 P249 P251 P253 P261 P269 P275 P280 P281
                                            P309 P313 P317 P318 P320 P321 P331
      298   WRT-LN . . . . . . . . . . . .  P288 P289 P290 P291 P292 P293 P294 P297 P302
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    24
0 Defined   Cross-reference of programs     References

        3   IF103A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF103A    Date 06/04/2022  Time 11:59:32   Page    25
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF103A:
 *    Source records = 809
 *    Data Division statements = 96
 *    Procedure Division statements = 470
 *    Generated COBOL statements = 0
 *    Program complexity factor = 479
0End of compilation 1,  program IF103A,  highest severity 0.
0Return code 0
