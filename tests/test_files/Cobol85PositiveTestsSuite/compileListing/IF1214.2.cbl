1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:27   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:27   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1214.2
   000002         000200 PROGRAM-ID.                                                      IF1214.2
   000003         000300     IF121A.                                                      IF1214.2
   000004         000400                                                                  IF1214.2
   000005         000600*                                                         *       IF1214.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1214.2
   000007         000800* It contains tests for the Intrinsic Function MEDIAN.    *       IF1214.2
   000008         000900*                                                         *       IF1214.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1214.2
   000010         001200 CONFIGURATION SECTION.                                           IF1214.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1214.2
   000012         001400     XXXXX082.                                                    IF1214.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1214.2
   000014         001600     XXXXX083.                                                    IF1214.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1214.2
   000016         001800 FILE-CONTROL.                                                    IF1214.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1214.2 21
   000018         002000     XXXXX055.                                                    IF1214.2
   000019         002100 DATA DIVISION.                                                   IF1214.2
   000020         002200 FILE SECTION.                                                    IF1214.2
   000021         002300 FD  PRINT-FILE.                                                  IF1214.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1214.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1214.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1214.2
   000025         002800* Variables specific to the Intrinsic Function Test IF121A*       IF1214.2
   000026         003000 01  A                   PIC S9(10)          VALUE 5.             IF1214.2
   000027         003100 01  B                   PIC S9(10)          VALUE 7.             IF1214.2
   000028         003200 01  C                   PIC S9(10)          VALUE -4.            IF1214.2
   000029         003300 01  D                   PIC S9(10)          VALUE 10.            IF1214.2
   000030         003400 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1214.2
   000031         003500 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1214.2
   000032         003600 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1214.2
   000033         003700 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1214.2
   000034         003800 01  M                   PIC S9(10)          VALUE 320000.        IF1214.2
   000035         003900 01  N                   PIC S9(10)          VALUE 650000.        IF1214.2
   000036         004000 01  O                   PIC S9(10)          VALUE -430000.       IF1214.2
   000037         004100 01  P                   PIC S9(10)          VALUE 1.             IF1214.2
   000038         004200 01  Q                   PIC S9(10)          VALUE 3.             IF1214.2
   000039         004300 01  R                   PIC S9(10)          VALUE 5.             IF1214.2
   000040         004400 01  ARG1                PIC S9(10)          VALUE 2.             IF1214.2
   000041         004500 01  ARG2                PIC S9(10)          VALUE 2.             IF1214.2
   000042         004600 01  ARR                                     VALUE "40537".       IF1214.2
   000043         004700     02  IND OCCURS 5 TIMES PIC 9.                                IF1214.2
   000044         004800 01  TEMP                PIC S9(10)V9(5).                         IF1214.2
   000045         004900 01  WS-NUM              PIC S9(6)V9(7).                          IF1214.2
   000046         005000 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1214.2
   000047         005100 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1214.2
   000048         005200*                                                                 IF1214.2
   000049         005400*                                                                 IF1214.2
   000050         005500 01  TEST-RESULTS.                                                IF1214.2
   000051         005600     02 FILLER                   PIC X      VALUE SPACE.          IF1214.2 IMP
   000052         005700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1214.2 IMP
   000053         005800     02 FILLER                   PIC X      VALUE SPACE.          IF1214.2 IMP
   000054         005900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1214.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 FILLER                   PIC X      VALUE SPACE.          IF1214.2 IMP
   000056         006100     02  PAR-NAME.                                                IF1214.2
   000057         006200       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1214.2 IMP
   000058         006300       03  PARDOT-X              PIC X      VALUE SPACE.          IF1214.2 IMP
   000059         006400       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1214.2 IMP
   000060         006500     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1214.2 IMP
   000061         006600     02 RE-MARK                  PIC X(61).                       IF1214.2
   000062         006700 01  TEST-COMPUTED.                                               IF1214.2
   000063         006800     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1214.2 IMP
   000064         006900     02 FILLER                   PIC X(17)  VALUE                 IF1214.2
   000065         007000            "       COMPUTED=".                                   IF1214.2
   000066         007100     02 COMPUTED-X.                                               IF1214.2
   000067         007200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1214.2 IMP
   000068         007300     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1214.2 67
   000069         007400                                 PIC -9(9).9(9).                  IF1214.2
   000070         007500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1214.2 67
   000071         007600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1214.2 67
   000072         007700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1214.2 67
   000073         007800     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1214.2 67
   000074         007900         04 COMPUTED-18V0                    PIC -9(18).          IF1214.2
   000075         008000         04 FILLER                           PIC X.               IF1214.2
   000076         008100     03 FILLER PIC X(50) VALUE SPACE.                             IF1214.2 IMP
   000077         008200 01  TEST-CORRECT.                                                IF1214.2
   000078         008300     02 FILLER PIC X(30) VALUE SPACE.                             IF1214.2 IMP
   000079         008400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1214.2
   000080         008500     02 CORRECT-X.                                                IF1214.2
   000081         008600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1214.2 IMP
   000082         008700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1214.2 81
   000083         008800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1214.2 81
   000084         008900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1214.2 81
   000085         009000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1214.2 81
   000086         009100     03      CR-18V0 REDEFINES CORRECT-A.                         IF1214.2 81
   000087         009200         04 CORRECT-18V0                     PIC -9(18).          IF1214.2
   000088         009300         04 FILLER                           PIC X.               IF1214.2
   000089         009400     03 FILLER PIC X(2) VALUE SPACE.                              IF1214.2 IMP
   000090         009500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1214.2 IMP
   000091         009600 01  TEST-CORRECT-MIN.                                            IF1214.2
   000092         009700     02 FILLER PIC X(30) VALUE SPACE.                             IF1214.2 IMP
   000093         009800     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1214.2
   000094         009900     02 CORRECTMI-X.                                              IF1214.2
   000095         010000     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1214.2 IMP
   000096         010100     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1214.2 95
   000097         010200     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1214.2 95
   000098         010300     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1214.2 95
   000099         010400     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1214.2 95
   000100         010500     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1214.2 95
   000101         010600         04 CORRECTMI-18V0                     PIC -9(18).        IF1214.2
   000102         010700         04 FILLER                           PIC X.               IF1214.2
   000103         010800     03 FILLER PIC X(2) VALUE SPACE.                              IF1214.2 IMP
   000104         010900     03 FILLER                           PIC X(48) VALUE SPACE.   IF1214.2 IMP
   000105         011000 01  TEST-CORRECT-MAX.                                            IF1214.2
   000106         011100     02 FILLER PIC X(30) VALUE SPACE.                             IF1214.2 IMP
   000107         011200     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1214.2
   000108         011300     02 CORRECTMA-X.                                              IF1214.2
   000109         011400     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1214.2 IMP
   000110         011500     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1214.2 109
   000111         011600     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1214.2 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1214.2 109
   000113         011800     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1214.2 109
   000114         011900     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1214.2 109
   000115         012000         04 CORRECTMA-18V0                     PIC -9(18).        IF1214.2
   000116         012100         04 FILLER                           PIC X.               IF1214.2
   000117         012200     03 FILLER PIC X(2) VALUE SPACE.                              IF1214.2 IMP
   000118         012300     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1214.2 IMP
   000119         012400 01  CCVS-C-1.                                                    IF1214.2
   000120         012500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1214.2
   000121         012600-    "SS  PARAGRAPH-NAME                                          IF1214.2
   000122         012700-    "       REMARKS".                                            IF1214.2
   000123         012800     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1214.2 IMP
   000124         012900 01  CCVS-C-2.                                                    IF1214.2
   000125         013000     02 FILLER                     PIC X        VALUE SPACE.      IF1214.2 IMP
   000126         013100     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1214.2
   000127         013200     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1214.2 IMP
   000128         013300     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1214.2
   000129         013400     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1214.2 IMP
   000130         013500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1214.2 IMP
   000131         013600 01  REC-CT                        PIC 99       VALUE ZERO.       IF1214.2 IMP
   000132         013700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1214.2 IMP
   000133         013800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1214.2 IMP
   000134         013900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1214.2 IMP
   000135         014000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1214.2 IMP
   000136         014100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1214.2 IMP
   000137         014200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1214.2 IMP
   000138         014300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1214.2 IMP
   000139         014400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1214.2 IMP
   000140         014500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1214.2 IMP
   000141         014600 01  CCVS-H-1.                                                    IF1214.2
   000142         014700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1214.2 IMP
   000143         014800     02  FILLER                    PIC X(42)    VALUE             IF1214.2
   000144         014900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1214.2
   000145         015000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1214.2 IMP
   000146         015100 01  CCVS-H-2A.                                                   IF1214.2
   000147         015200   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1214.2 IMP
   000148         015300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1214.2
   000149         015400   02  FILLER                        PIC XXXX   VALUE             IF1214.2
   000150         015500     "4.2 ".                                                      IF1214.2
   000151         015600   02  FILLER                        PIC X(28)  VALUE             IF1214.2
   000152         015700            " COPY - NOT FOR DISTRIBUTION".                       IF1214.2
   000153         015800   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1214.2 IMP
   000154         015900                                                                  IF1214.2
   000155         016000 01  CCVS-H-2B.                                                   IF1214.2
   000156         016100   02  FILLER                        PIC X(15)  VALUE             IF1214.2
   000157         016200            "TEST RESULT OF ".                                    IF1214.2
   000158         016300   02  TEST-ID                       PIC X(9).                    IF1214.2
   000159         016400   02  FILLER                        PIC X(4)   VALUE             IF1214.2
   000160         016500            " IN ".                                               IF1214.2
   000161         016600   02  FILLER                        PIC X(12)  VALUE             IF1214.2
   000162         016700     " HIGH       ".                                              IF1214.2
   000163         016800   02  FILLER                        PIC X(22)  VALUE             IF1214.2
   000164         016900            " LEVEL VALIDATION FOR ".                             IF1214.2
   000165         017000   02  FILLER                        PIC X(58)  VALUE             IF1214.2
   000166         017100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1214.2
   000167         017200 01  CCVS-H-3.                                                    IF1214.2
   000168         017300     02  FILLER                      PIC X(34)  VALUE             IF1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400            " FOR OFFICIAL USE ONLY    ".                         IF1214.2
   000170         017500     02  FILLER                      PIC X(58)  VALUE             IF1214.2
   000171         017600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1214.2
   000172         017700     02  FILLER                      PIC X(28)  VALUE             IF1214.2
   000173         017800            "  COPYRIGHT   1985 ".                                IF1214.2
   000174         017900 01  CCVS-E-1.                                                    IF1214.2
   000175         018000     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1214.2 IMP
   000176         018100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1214.2
   000177         018200     02 ID-AGAIN                     PIC X(9).                    IF1214.2
   000178         018300     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1214.2 IMP
   000179         018400 01  CCVS-E-2.                                                    IF1214.2
   000180         018500     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1214.2 IMP
   000181         018600     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1214.2 IMP
   000182         018700     02 CCVS-E-2-2.                                               IF1214.2
   000183         018800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1214.2 IMP
   000184         018900         03 FILLER                   PIC X      VALUE SPACE.      IF1214.2 IMP
   000185         019000         03 ENDER-DESC               PIC X(44)  VALUE             IF1214.2
   000186         019100            "ERRORS ENCOUNTERED".                                 IF1214.2
   000187         019200 01  CCVS-E-3.                                                    IF1214.2
   000188         019300     02  FILLER                      PIC X(22)  VALUE             IF1214.2
   000189         019400            " FOR OFFICIAL USE ONLY".                             IF1214.2
   000190         019500     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1214.2 IMP
   000191         019600     02  FILLER                      PIC X(58)  VALUE             IF1214.2
   000192         019700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1214.2
   000193         019800     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1214.2 IMP
   000194         019900     02 FILLER                       PIC X(15)  VALUE             IF1214.2
   000195         020000             " COPYRIGHT 1985".                                   IF1214.2
   000196         020100 01  CCVS-E-4.                                                    IF1214.2
   000197         020200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1214.2 IMP
   000198         020300     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1214.2
   000199         020400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1214.2 IMP
   000200         020500     02 FILLER                       PIC X(40)  VALUE             IF1214.2
   000201         020600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1214.2
   000202         020700 01  XXINFO.                                                      IF1214.2
   000203         020800     02 FILLER                       PIC X(19)  VALUE             IF1214.2
   000204         020900            "*** INFORMATION ***".                                IF1214.2
   000205         021000     02 INFO-TEXT.                                                IF1214.2
   000206         021100       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1214.2 IMP
   000207         021200       04 XXCOMPUTED                 PIC X(20).                   IF1214.2
   000208         021300       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1214.2 IMP
   000209         021400       04 XXCORRECT                  PIC X(20).                   IF1214.2
   000210         021500     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1214.2
   000211         021600 01  HYPHEN-LINE.                                                 IF1214.2
   000212         021700     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1214.2 IMP
   000213         021800     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1214.2
   000214         021900-    "*****************************************".                 IF1214.2
   000215         022000     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1214.2
   000216         022100-    "******************************".                            IF1214.2
   000217         022200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1214.2
   000218         022300     "IF121A".                                                    IF1214.2
   000219         022400 PROCEDURE DIVISION.                                              IF1214.2
   000220         022500 CCVS1 SECTION.                                                   IF1214.2
   000221         022600 OPEN-FILES.                                                      IF1214.2
   000222         022700     OPEN     OUTPUT PRINT-FILE.                                  IF1214.2 21
   000223         022800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1214.2 217 158 217 177
   000224         022900     MOVE    SPACE TO TEST-RESULTS.                               IF1214.2 IMP 50
   000225         023000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1214.2 248 253
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100     GO TO CCVS1-EXIT.                                            IF1214.2 341
   000227         023200 CLOSE-FILES.                                                     IF1214.2
   000228         023300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1214.2 257 277 21
   000229         023400 TERMINATE-CCVS.                                                  IF1214.2
   000230         023500     STOP     RUN.                                                IF1214.2
   000231         023600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1214.2 54 134
   000232         023700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1214.2 54 135
   000233         023800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1214.2 54 133
   000234         023900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1214.2 54 132
   000235         024000     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1214.2 61
   000236         024100 PRINT-DETAIL.                                                    IF1214.2
   000237         024200     IF REC-CT NOT EQUAL TO ZERO                                  IF1214.2 131 IMP
   000238      1  024300             MOVE "." TO PARDOT-X                                 IF1214.2 58
   000239      1  024400             MOVE REC-CT TO DOTVALUE.                             IF1214.2 131 59
   000240         024500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1214.2 50 22 289
   000241         024600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1214.2 54 289
   000242      1  024700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1214.2 310 330
   000243      1  024800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1214.2 331 340
   000244         024900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1214.2 IMP 54 IMP 66
   000245         025000     MOVE SPACE TO CORRECT-X.                                     IF1214.2 IMP 80
   000246         025100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1214.2 131 IMP IMP 56
   000247         025200     MOVE     SPACE TO RE-MARK.                                   IF1214.2 IMP 61
   000248         025300 HEAD-ROUTINE.                                                    IF1214.2
   000249         025400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1214.2 141 23 289
   000250         025500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1214.2 146 23 289
   000251         025600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1214.2 155 23 289
   000252         025700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1214.2 167 23 289
   000253         025800 COLUMN-NAMES-ROUTINE.                                            IF1214.2
   000254         025900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1214.2 119 23 289
   000255         026000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1214.2 124 23 289
   000256         026100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1214.2 211 23 289
   000257         026200 END-ROUTINE.                                                     IF1214.2
   000258         026300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1214.2 211 23 289
   000259         026400 END-RTN-EXIT.                                                    IF1214.2
   000260         026500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1214.2 174 23 289
   000261         026600 END-ROUTINE-1.                                                   IF1214.2
   000262         026700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1214.2 133 137 134
   000263         026800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1214.2 137 132 137
   000264         026900      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1214.2 135 137
   000265         027000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1214.2 135 197
   000266         027100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1214.2 137 199
   000267         027200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1214.2 196 182
   000268         027300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1214.2 179 23 289
   000269         027400  END-ROUTINE-12.                                                 IF1214.2
   000270         027500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1214.2 185
   000271         027600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1214.2 133 IMP
   000272      1  027700         MOVE "NO " TO ERROR-TOTAL                                IF1214.2 183
   000273         027800         ELSE                                                     IF1214.2
   000274      1  027900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1214.2 133 183
   000275         028000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1214.2 179 23
   000276         028100     PERFORM WRITE-LINE.                                          IF1214.2 289
   000277         028200 END-ROUTINE-13.                                                  IF1214.2
   000278         028300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1214.2 132 IMP
   000279      1  028400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1214.2 183
   000280      1  028500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1214.2 132 183
   000281         028600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1214.2 185
   000282         028700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1214.2 179 23 289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1214.2 134 IMP
   000284      1  028900          MOVE "NO " TO ERROR-TOTAL                               IF1214.2 183
   000285      1  029000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1214.2 134 183
   000286         029100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1214.2 185
   000287         029200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1214.2 179 23 289
   000288         029300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1214.2 187 23 289
   000289         029400 WRITE-LINE.                                                      IF1214.2
   000290         029500     ADD 1 TO RECORD-COUNT.                                       IF1214.2 139
   000291         029600     IF RECORD-COUNT GREATER 42                                   IF1214.2 139
   000292      1  029700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1214.2 23 138
   000293      1  029800         MOVE SPACE TO DUMMY-RECORD                               IF1214.2 IMP 23
   000294      1  029900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1214.2 23
   000295      1  030000         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1214.2 141 23 305
   000296      1  030100         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1214.2 146 23 305
   000297      1  030200         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1214.2 155 23 305
   000298      1  030300         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1214.2 167 23 305
   000299      1  030400         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1214.2 119 23 305
   000300      1  030500         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1214.2 124 23 305
   000301      1  030600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1214.2 211 23 305
   000302      1  030700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1214.2 138 23
   000303      1  030800         MOVE ZERO TO RECORD-COUNT.                               IF1214.2 IMP 139
   000304         030900     PERFORM WRT-LN.                                              IF1214.2 305
   000305         031000 WRT-LN.                                                          IF1214.2
   000306         031100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1214.2 23
   000307         031200     MOVE SPACE TO DUMMY-RECORD.                                  IF1214.2 IMP 23
   000308         031300 BLANK-LINE-PRINT.                                                IF1214.2
   000309         031400     PERFORM WRT-LN.                                              IF1214.2 305
   000310         031500 FAIL-ROUTINE.                                                    IF1214.2
   000311         031600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1214.2 66 IMP
   000312      1  031700            GO TO FAIL-ROUTINE-WRITE.                             IF1214.2 319
   000313         031800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1214.2 80 IMP 319
   000314         031900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1214.2 140 210
   000315         032000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1214.2 205
   000316         032100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1214.2 202 23 289
   000317         032200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1214.2 IMP 210
   000318         032300     GO TO  FAIL-ROUTINE-EX.                                      IF1214.2 330
   000319         032400 FAIL-ROUTINE-WRITE.                                              IF1214.2
   000320         032500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1214.2 62 22 289
   000321         032600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1214.2 140 90
   000322         032700                              CORMA-ANSI-REFERENCE.               IF1214.2 118
   000323         032800     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1214.2 96 IMP
   000324      1  032900           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1214.2 91 22 289
   000325      1  033000           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1214.2 105 22 289
   000326         033100     ELSE                                                         IF1214.2
   000327      1  033200           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1214.2 77 22 289
   000328         033300     PERFORM WRITE-LINE.                                          IF1214.2 289
   000329         033400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1214.2 IMP 90
   000330         033500 FAIL-ROUTINE-EX. EXIT.                                           IF1214.2
   000331         033600 BAIL-OUT.                                                        IF1214.2
   000332         033700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1214.2 67 IMP 334
   000333         033800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1214.2 81 IMP 340
   000334         033900 BAIL-OUT-WRITE.                                                  IF1214.2
   000335         034000     MOVE CORRECT-A TO XXCORRECT.                                 IF1214.2 81 209
   000336         034100     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1214.2 67 207
   000337         034200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1214.2 140 210
   000338         034300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1214.2 202 23 289
   000339         034400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1214.2 IMP 210
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034500 BAIL-OUT-EX. EXIT.                                               IF1214.2
   000341         034600 CCVS1-EXIT.                                                      IF1214.2
   000342         034700     EXIT.                                                        IF1214.2
   000343         034900*                                                      *          IF1214.2
   000344         035000*    Intrinsic Function Tests         IF121A - MEDIAN  *          IF1214.2
   000345         035100*                                                      *          IF1214.2
   000346         035300 SECT-IF121A SECTION.                                             IF1214.2
   000347         035400 F-MEDIAN-INFO.                                                   IF1214.2
   000348         035500     MOVE     "See ref. A-54 2.25" TO ANSI-REFERENCE.             IF1214.2 140
   000349         035600     MOVE     "MEDIAN Function" TO FEATURE.                       IF1214.2 52
   000350         035800 F-MEDIAN-01.                                                     IF1214.2
   000351         035900     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000352         036000 F-MEDIAN-TEST-01.                                                IF1214.2
   000353         036100     COMPUTE WS-NUM = FUNCTION MEDIAN(5, -2, -14, 0).             IF1214.2 45 IFN
   000354         036200     IF WS-NUM = -1 THEN                                          IF1214.2 45
   000355      1  036300                    PERFORM PASS                                  IF1214.2 232
   000356         036400     ELSE                                                         IF1214.2
   000357      1  036500                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000358      1  036600                    MOVE -1 TO CORRECT-N                          IF1214.2 82
   000359      1  036700                    PERFORM FAIL.                                 IF1214.2 233
   000360         036800     GO TO F-MEDIAN-WRITE-01.                                     IF1214.2 364
   000361         036900 F-MEDIAN-DELETE-01.                                              IF1214.2
   000362         037000     PERFORM  DE-LETE.                                            IF1214.2 234
   000363         037100     GO TO    F-MEDIAN-WRITE-01.                                  IF1214.2 364
   000364         037200 F-MEDIAN-WRITE-01.                                               IF1214.2
   000365         037300     MOVE "F-MEDIAN-01" TO PAR-NAME.                              IF1214.2 56
   000366         037400     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000367         037600 F-MEDIAN-02.                                                     IF1214.2
   000368         037700     EVALUATE FUNCTION MEDIAN(3.9, -0.3, 8.7, 100.2)              IF1214.2 IFN
   000369         037800     WHEN 6.29987 THRU 6.30013                                    IF1214.2
   000370      1  037900                    PERFORM PASS                                  IF1214.2 232
   000371         038000     WHEN OTHER                                                   IF1214.2
   000372      1  038100                    PERFORM FAIL.                                 IF1214.2 233
   000373         038200     GO TO F-MEDIAN-WRITE-02.                                     IF1214.2 377
   000374         038300 F-MEDIAN-DELETE-02.                                              IF1214.2
   000375         038400     PERFORM  DE-LETE.                                            IF1214.2 234
   000376         038500     GO TO    F-MEDIAN-WRITE-02.                                  IF1214.2 377
   000377         038600 F-MEDIAN-WRITE-02.                                               IF1214.2
   000378         038700     MOVE "F-MEDIAN-02" TO PAR-NAME.                              IF1214.2 56
   000379         038800     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000380         039000 F-MEDIAN-03.                                                     IF1214.2
   000381         039100     IF FUNCTION MEDIAN(A, B, C, D) = 6    THEN                   IF1214.2 IFN 26 27 28 29
   000382      1  039200                    PERFORM PASS                                  IF1214.2 232
   000383         039300     ELSE                                                         IF1214.2
   000384      1  039400                    PERFORM FAIL.                                 IF1214.2 233
   000385         039500     GO TO F-MEDIAN-WRITE-03.                                     IF1214.2 389
   000386         039600 F-MEDIAN-DELETE-03.                                              IF1214.2
   000387         039700     PERFORM  DE-LETE.                                            IF1214.2 234
   000388         039800     GO TO    F-MEDIAN-WRITE-03.                                  IF1214.2 389
   000389         039900 F-MEDIAN-WRITE-03.                                               IF1214.2
   000390         040000     MOVE "F-MEDIAN-03" TO PAR-NAME.                              IF1214.2 56
   000391         040100     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000392         040300 F-MEDIAN-04.                                                     IF1214.2
   000393         040400     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000394         040500 F-MEDIAN-TEST-04.                                                IF1214.2
   000395         040600     COMPUTE WS-NUM = FUNCTION MEDIAN(E, F, G).                   IF1214.2 45 IFN 30 31 32
   000396         040700     IF (WS-NUM >= 4.07992) AND                                   IF1214.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800        (WS-NUM <= 4.08008)                                       IF1214.2 45
   000398      1  040900                    PERFORM PASS                                  IF1214.2 232
   000399         041000     ELSE                                                         IF1214.2
   000400      1  041100                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000401      1  041200                    MOVE 4.08 TO CORRECT-N                        IF1214.2 82
   000402      1  041300                    PERFORM FAIL.                                 IF1214.2 233
   000403         041400     GO TO F-MEDIAN-WRITE-04.                                     IF1214.2 407
   000404         041500 F-MEDIAN-DELETE-04.                                              IF1214.2
   000405         041600     PERFORM  DE-LETE.                                            IF1214.2 234
   000406         041700     GO TO    F-MEDIAN-WRITE-04.                                  IF1214.2 407
   000407         041800 F-MEDIAN-WRITE-04.                                               IF1214.2
   000408         041900     MOVE "F-MEDIAN-04" TO PAR-NAME.                              IF1214.2 56
   000409         042000     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000410         042200 F-MEDIAN-05.                                                     IF1214.2
   000411         042300     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000412         042400 F-MEDIAN-TEST-05.                                                IF1214.2
   000413         042500     COMPUTE WS-NUM = FUNCTION MEDIAN(10.2, -0.2, 5.6, -15.6).    IF1214.2 45 IFN
   000414         042600     IF (WS-NUM >= 2.69995) AND                                   IF1214.2 45
   000415         042700        (WS-NUM <= 2.70005)                                       IF1214.2 45
   000416      1  042800                    PERFORM PASS                                  IF1214.2 232
   000417         042900     ELSE                                                         IF1214.2
   000418      1  043000                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000419      1  043100                    MOVE 2.7 TO CORRECT-N                         IF1214.2 82
   000420      1  043200                    PERFORM FAIL.                                 IF1214.2 233
   000421         043300     GO TO F-MEDIAN-WRITE-05.                                     IF1214.2 425
   000422         043400 F-MEDIAN-DELETE-05.                                              IF1214.2
   000423         043500     PERFORM  DE-LETE.                                            IF1214.2 234
   000424         043600     GO TO    F-MEDIAN-WRITE-05.                                  IF1214.2 425
   000425         043700 F-MEDIAN-WRITE-05.                                               IF1214.2
   000426         043800     MOVE "F-MEDIAN-05" TO PAR-NAME.                              IF1214.2 56
   000427         043900     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000428         044100 F-MEDIAN-06.                                                     IF1214.2
   000429         044200     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000430         044300 F-MEDIAN-TEST-06.                                                IF1214.2
   000431         044400     COMPUTE WS-NUM = FUNCTION MEDIAN(A, B, C, D, E, F, G).       IF1214.2 45 IFN 26 27 28 29 30 31 32
   000432         044500     IF (WS-NUM >= 4.99990) AND                                   IF1214.2 45
   000433         044600        (WS-NUM <= 5.00010)                                       IF1214.2 45
   000434      1  044700                    PERFORM PASS                                  IF1214.2 232
   000435         044800     ELSE                                                         IF1214.2
   000436      1  044900                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000437      1  045000                    MOVE 5 TO CORRECT-N                           IF1214.2 82
   000438      1  045100                    PERFORM FAIL.                                 IF1214.2 233
   000439         045200     GO TO F-MEDIAN-WRITE-06.                                     IF1214.2 443
   000440         045300 F-MEDIAN-DELETE-06.                                              IF1214.2
   000441         045400     PERFORM  DE-LETE.                                            IF1214.2 234
   000442         045500     GO TO    F-MEDIAN-WRITE-06.                                  IF1214.2 443
   000443         045600 F-MEDIAN-WRITE-06.                                               IF1214.2
   000444         045700     MOVE "F-MEDIAN-06" TO PAR-NAME.                              IF1214.2 56
   000445         045800     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000446         046000 F-MEDIAN-07.                                                     IF1214.2
   000447         046100     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000448         046200 F-MEDIAN-TEST-07.                                                IF1214.2
   000449         046300     COMPUTE WS-NUM = FUNCTION MEDIAN(IND(1), IND(2), IND(3)).    IF1214.2 45 IFN 43 43 43
   000450         046400     IF WS-NUM = 4 THEN                                           IF1214.2 45
   000451      1  046500                    PERFORM PASS                                  IF1214.2 232
   000452         046600     ELSE                                                         IF1214.2
   000453      1  046700                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  046800                    MOVE 4 TO CORRECT-N                           IF1214.2 82
   000455      1  046900                    PERFORM FAIL.                                 IF1214.2 233
   000456         047000     GO TO F-MEDIAN-WRITE-07.                                     IF1214.2 460
   000457         047100 F-MEDIAN-DELETE-07.                                              IF1214.2
   000458         047200     PERFORM  DE-LETE.                                            IF1214.2 234
   000459         047300     GO TO    F-MEDIAN-WRITE-07.                                  IF1214.2 460
   000460         047400 F-MEDIAN-WRITE-07.                                               IF1214.2
   000461         047500     MOVE "F-MEDIAN-07" TO PAR-NAME.                              IF1214.2 56
   000462         047600     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000463         047800 F-MEDIAN-08.                                                     IF1214.2
   000464         047900     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000465         048000 F-MEDIAN-TEST-08.                                                IF1214.2
   000466         048100     COMPUTE WS-NUM = FUNCTION MEDIAN(IND(P), IND(Q), IND(R)).    IF1214.2 45 IFN 43 37 43 38 43 39
   000467         048200                                                                  IF1214.2
   000468         048300     IF WS-NUM = 5 THEN                                           IF1214.2 45
   000469      1  048400                    PERFORM PASS                                  IF1214.2 232
   000470         048500     ELSE                                                         IF1214.2
   000471      1  048600                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000472      1  048700                    MOVE 5 TO CORRECT-N                           IF1214.2 82
   000473      1  048800                    PERFORM FAIL.                                 IF1214.2 233
   000474         048900     GO TO F-MEDIAN-WRITE-08.                                     IF1214.2 478
   000475         049000 F-MEDIAN-DELETE-08.                                              IF1214.2
   000476         049100     PERFORM  DE-LETE.                                            IF1214.2 234
   000477         049200     GO TO    F-MEDIAN-WRITE-08.                                  IF1214.2 478
   000478         049300 F-MEDIAN-WRITE-08.                                               IF1214.2
   000479         049400     MOVE "F-MEDIAN-08" TO PAR-NAME.                              IF1214.2 56
   000480         049500     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000481         049700 F-MEDIAN-09.                                                     IF1214.2
   000482         049800     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000483         049900 F-MEDIAN-TEST-09.                                                IF1214.2
   000484         050000     COMPUTE WS-NUM = FUNCTION MEDIAN(IND(ALL)).                  IF1214.2 45 IFN 43
   000485         050100     IF WS-NUM = 4 THEN                                           IF1214.2 45
   000486      1  050200                    PERFORM PASS                                  IF1214.2 232
   000487         050300     ELSE                                                         IF1214.2
   000488      1  050400                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000489      1  050500                    MOVE 4 TO CORRECT-N                           IF1214.2 82
   000490      1  050600                    PERFORM FAIL.                                 IF1214.2 233
   000491         050700     GO TO F-MEDIAN-WRITE-09.                                     IF1214.2 495
   000492         050800 F-MEDIAN-DELETE-09.                                              IF1214.2
   000493         050900     PERFORM  DE-LETE.                                            IF1214.2 234
   000494         051000     GO TO    F-MEDIAN-WRITE-09.                                  IF1214.2 495
   000495         051100 F-MEDIAN-WRITE-09.                                               IF1214.2
   000496         051200     MOVE "F-MEDIAN-09" TO PAR-NAME.                              IF1214.2 56
   000497         051300     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000498         051500 F-MEDIAN-11.                                                     IF1214.2
   000499         051600     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000500         051700 F-MEDIAN-TEST-11.                                                IF1214.2
   000501         051800     COMPUTE WS-NUM = FUNCTION MEDIAN(M, N, O).                   IF1214.2 45 IFN 34 35 36
   000502         051900     IF WS-NUM = 320000 THEN                                      IF1214.2 45
   000503      1  052000                    PERFORM PASS                                  IF1214.2 232
   000504         052100     ELSE                                                         IF1214.2
   000505      1  052200                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000506      1  052300                    MOVE 320000 TO CORRECT-N                      IF1214.2 82
   000507      1  052400                    PERFORM FAIL.                                 IF1214.2 233
   000508         052500     GO TO F-MEDIAN-WRITE-11.                                     IF1214.2 512
   000509         052600 F-MEDIAN-DELETE-11.                                              IF1214.2
   000510         052700     PERFORM  DE-LETE.                                            IF1214.2 234
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052800     GO TO    F-MEDIAN-WRITE-11.                                  IF1214.2 512
   000512         052900 F-MEDIAN-WRITE-11.                                               IF1214.2
   000513         053000     MOVE "F-MEDIAN-11" TO PAR-NAME.                              IF1214.2 56
   000514         053100     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000515         053300 F-MEDIAN-12.                                                     IF1214.2
   000516         053400     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000517         053500 F-MEDIAN-TEST-12.                                                IF1214.2
   000518         053600     COMPUTE WS-NUM = FUNCTION MEDIAN(A, 5, A).                   IF1214.2 45 IFN 26 26
   000519         053700     IF WS-NUM = 5 THEN                                           IF1214.2 45
   000520      1  053800                    PERFORM PASS                                  IF1214.2 232
   000521         053900     ELSE                                                         IF1214.2
   000522      1  054000                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000523      1  054100                    MOVE 5 TO CORRECT-N                           IF1214.2 82
   000524      1  054200                    PERFORM FAIL.                                 IF1214.2 233
   000525         054300     GO TO F-MEDIAN-WRITE-12.                                     IF1214.2 529
   000526         054400 F-MEDIAN-DELETE-12.                                              IF1214.2
   000527         054500     PERFORM  DE-LETE.                                            IF1214.2 234
   000528         054600     GO TO    F-MEDIAN-WRITE-12.                                  IF1214.2 529
   000529         054700 F-MEDIAN-WRITE-12.                                               IF1214.2
   000530         054800     MOVE "F-MEDIAN-12" TO PAR-NAME.                              IF1214.2 56
   000531         054900     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000532         055100 F-MEDIAN-13.                                                     IF1214.2
   000533         055200     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000534         055300     MOVE  20.7996 TO MIN-RANGE.                                  IF1214.2 46
   000535         055400     MOVE  20.8004 TO MAX-RANGE.                                  IF1214.2 47
   000536         055500 F-MEDIAN-TEST-13.                                                IF1214.2
   000537         055600     COMPUTE WS-NUM = FUNCTION MEDIAN(2.6 + 30, 4.5 * 2).         IF1214.2 45 IFN
   000538         055700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2 45 46
   000539         055800        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2 45 47
   000540      1  055900                    PERFORM PASS                                  IF1214.2 232
   000541         056000     ELSE                                                         IF1214.2
   000542      1  056100                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000543      1  056200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2 46 96
   000544      1  056300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2 47 110
   000545      1  056400                    PERFORM FAIL.                                 IF1214.2 233
   000546         056500     GO TO F-MEDIAN-WRITE-13.                                     IF1214.2 550
   000547         056600 F-MEDIAN-DELETE-13.                                              IF1214.2
   000548         056700     PERFORM  DE-LETE.                                            IF1214.2 234
   000549         056800     GO TO    F-MEDIAN-WRITE-13.                                  IF1214.2 550
   000550         056900 F-MEDIAN-WRITE-13.                                               IF1214.2
   000551         057000     MOVE "F-MEDIAN-13" TO PAR-NAME.                              IF1214.2 56
   000552         057100     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000553         057300 F-MEDIAN-14.                                                     IF1214.2
   000554         057400     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000555         057500     MOVE  34.2593 TO MIN-RANGE.                                  IF1214.2 46
   000556         057600     MOVE  34.2607 TO MAX-RANGE.                                  IF1214.2 47
   000557         057700 F-MEDIAN-TEST-14.                                                IF1214.2
   000558         057800     COMPUTE WS-NUM = FUNCTION MEDIAN(E, 9 * A, B / 2).           IF1214.2 45 IFN 30 26 27
   000559         057900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2 45 46
   000560         058000        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2 45 47
   000561      1  058100                    PERFORM PASS                                  IF1214.2 232
   000562         058200     ELSE                                                         IF1214.2
   000563      1  058300                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000564      1  058400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2 46 96
   000565      1  058500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2 47 110
   000566      1  058600                    PERFORM FAIL.                                 IF1214.2 233
   000567         058700     GO TO F-MEDIAN-WRITE-14.                                     IF1214.2 571
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058800 F-MEDIAN-DELETE-14.                                              IF1214.2
   000569         058900     PERFORM  DE-LETE.                                            IF1214.2 234
   000570         059000     GO TO    F-MEDIAN-WRITE-14.                                  IF1214.2 571
   000571         059100 F-MEDIAN-WRITE-14.                                               IF1214.2
   000572         059200     MOVE "F-MEDIAN-14" TO PAR-NAME.                              IF1214.2 56
   000573         059300     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000574         059500 F-MEDIAN-15.                                                     IF1214.2
   000575         059600     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000576         059700     MOVE 83.9983 TO MIN-RANGE.                                   IF1214.2 46
   000577         059800     MOVE 84.0017 TO MAX-RANGE.                                   IF1214.2 47
   000578         059900 F-MEDIAN-TEST-15.                                                IF1214.2
   000579         060000     COMPUTE WS-NUM = FUNCTION MEDIAN(A, B) + 78.                 IF1214.2 45 IFN 26 27
   000580         060100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2 45 46
   000581         060200        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2 45 47
   000582      1  060300                    PERFORM PASS                                  IF1214.2 232
   000583         060400     ELSE                                                         IF1214.2
   000584      1  060500                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000585      1  060600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2 46 96
   000586      1  060700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2 47 110
   000587      1  060800                    PERFORM FAIL.                                 IF1214.2 233
   000588         060900     GO TO F-MEDIAN-WRITE-15.                                     IF1214.2 592
   000589         061000 F-MEDIAN-DELETE-15.                                              IF1214.2
   000590         061100     PERFORM  DE-LETE.                                            IF1214.2 234
   000591         061200     GO TO    F-MEDIAN-WRITE-15.                                  IF1214.2 592
   000592         061300 F-MEDIAN-WRITE-15.                                               IF1214.2
   000593         061400     MOVE "F-MEDIAN-15" TO PAR-NAME.                              IF1214.2 56
   000594         061500     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000595         061700 F-MEDIAN-16.                                                     IF1214.2
   000596         061800     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000597         061900     MOVE 3.39932 TO MIN-RANGE.                                   IF1214.2 46
   000598         062000     MOVE 3.40007 TO MAX-RANGE.                                   IF1214.2 47
   000599         062100 F-MEDIAN-TEST-16.                                                IF1214.2
   000600         062200     COMPUTE WS-NUM = FUNCTION MEDIAN(A, B) +                     IF1214.2 45 IFN 26 27
   000601         062300                      FUNCTION MEDIAN(-2.6, -4.4, 1).             IF1214.2 IFN
   000602         062400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2 45 46
   000603         062500        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2 45 47
   000604      1  062600                    PERFORM PASS                                  IF1214.2 232
   000605         062700     ELSE                                                         IF1214.2
   000606      1  062800                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000607      1  062900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2 46 96
   000608      1  063000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2 47 110
   000609      1  063100                    PERFORM FAIL.                                 IF1214.2 233
   000610         063200     GO TO F-MEDIAN-WRITE-16.                                     IF1214.2 614
   000611         063300 F-MEDIAN-DELETE-16.                                              IF1214.2
   000612         063400     PERFORM  DE-LETE.                                            IF1214.2 234
   000613         063500     GO TO    F-MEDIAN-WRITE-16.                                  IF1214.2 614
   000614         063600 F-MEDIAN-WRITE-16.                                               IF1214.2
   000615         063700     MOVE "F-MEDIAN-16" TO PAR-NAME.                              IF1214.2 56
   000616         063800     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000617         064000 F-MEDIAN-17.                                                     IF1214.2
   000618         064100     MOVE ZERO TO WS-NUM.                                         IF1214.2 IMP 45
   000619         064200     MOVE 2.24995 TO MIN-RANGE.                                   IF1214.2 46
   000620         064300     MOVE 2.25004 TO MAX-RANGE.                                   IF1214.2 47
   000621         064400 F-MEDIAN-TEST-17.                                                IF1214.2
   000622         064500     COMPUTE WS-NUM =                                             IF1214.2 45
   000623         064600                 FUNCTION MEDIAN(FUNCTION MEDIAN(1, 2), 3).       IF1214.2 IFN IFN
   000624         064700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2 45 46
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064800        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2 45 47
   000626      1  064900                    PERFORM PASS                                  IF1214.2 232
   000627         065000     ELSE                                                         IF1214.2
   000628      1  065100                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2 45 68
   000629      1  065200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2 46 96
   000630      1  065300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2 47 110
   000631      1  065400                    PERFORM FAIL.                                 IF1214.2 233
   000632         065500     GO TO F-MEDIAN-WRITE-17.                                     IF1214.2 636
   000633         065600 F-MEDIAN-DELETE-17.                                              IF1214.2
   000634         065700     PERFORM  DE-LETE.                                            IF1214.2 234
   000635         065800     GO TO    F-MEDIAN-WRITE-17.                                  IF1214.2 636
   000636         065900 F-MEDIAN-WRITE-17.                                               IF1214.2
   000637         066000     MOVE "F-MEDIAN-17" TO PAR-NAME.                              IF1214.2 56
   000638         066100     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000639         066300 F-MEDIAN-18.                                                     IF1214.2
   000640         066400     PERFORM F-MEDIAN-TEST-18                                     IF1214.2 644
   000641         066500       UNTIL FUNCTION MEDIAN(1, ARG1, ARG2, 20) > 10.             IF1214.2 IFN 40 41
   000642         066600     PERFORM PASS.                                                IF1214.2 232
   000643         066700     GO TO F-MEDIAN-WRITE-18.                                     IF1214.2 650
   000644         066800 F-MEDIAN-TEST-18.                                                IF1214.2
   000645         066900     COMPUTE ARG1 = ARG1 + 1.                                     IF1214.2 40 40
   000646         067000     COMPUTE ARG2 = ARG2 + 1.                                     IF1214.2 41 41
   000647         067100 F-MEDIAN-DELETE-18.                                              IF1214.2
   000648         067200     PERFORM  DE-LETE.                                            IF1214.2 234
   000649         067300     GO TO    F-MEDIAN-WRITE-18.                                  IF1214.2 650
   000650         067400 F-MEDIAN-WRITE-18.                                               IF1214.2
   000651         067500     MOVE "F-MEDIAN-18" TO PAR-NAME.                              IF1214.2 56
   000652         067600     PERFORM  PRINT-DETAIL.                                       IF1214.2 236
   000653         067800 CCVS-EXIT SECTION.                                               IF1214.2
   000654         067900 CCVS-999999.                                                     IF1214.2
   000655         068000     GO TO CLOSE-FILES.                                           IF1214.2 227
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  381 431 518 518 558 579 600
      140   ANSI-REFERENCE . . . . . . . .  314 321 337 M348
       40   ARG1 . . . . . . . . . . . . .  641 M645 645
       41   ARG2 . . . . . . . . . . . . .  641 M646 646
       42   ARR
       27   B. . . . . . . . . . . . . . .  381 431 558 579 600
       28   C. . . . . . . . . . . . . . .  381 431
      119   CCVS-C-1 . . . . . . . . . . .  254 299
      124   CCVS-C-2 . . . . . . . . . . .  255 300
      174   CCVS-E-1 . . . . . . . . . . .  260
      179   CCVS-E-2 . . . . . . . . . . .  268 275 282 287
      182   CCVS-E-2-2 . . . . . . . . . .  M267
      187   CCVS-E-3 . . . . . . . . . . .  288
      196   CCVS-E-4 . . . . . . . . . . .  267
      197   CCVS-E-4-1 . . . . . . . . . .  M265
      199   CCVS-E-4-2 . . . . . . . . . .  M266
      141   CCVS-H-1 . . . . . . . . . . .  249 295
      146   CCVS-H-2A. . . . . . . . . . .  250 296
      155   CCVS-H-2B. . . . . . . . . . .  251 297
      167   CCVS-H-3 . . . . . . . . . . .  252 298
      217   CCVS-PGM-ID. . . . . . . . . .  223 223
       73   CM-18V0
       67   COMPUTED-A . . . . . . . . . .  68 70 71 72 73 332 336
       68   COMPUTED-N . . . . . . . . . .  M357 M400 M418 M436 M453 M471 M488 M505 M522 M542 M563 M584 M606 M628
       66   COMPUTED-X . . . . . . . . . .  M244 311
       70   COMPUTED-0V18
       72   COMPUTED-14V4
       74   COMPUTED-18V0
       71   COMPUTED-4V14
       90   COR-ANSI-REFERENCE . . . . . .  M321 M329
      118   CORMA-ANSI-REFERENCE . . . . .  M322
       81   CORRECT-A. . . . . . . . . . .  82 83 84 85 86 333 335
      110   CORRECT-MAX. . . . . . . . . .  M544 M565 M586 M608 M630
       96   CORRECT-MIN. . . . . . . . . .  323 M543 M564 M585 M607 M629
       82   CORRECT-N. . . . . . . . . . .  M358 M401 M419 M437 M454 M472 M489 M506 M523
       80   CORRECT-X. . . . . . . . . . .  M245 313
       83   CORRECT-0V18
       85   CORRECT-14V4
       87   CORRECT-18V0
       84   CORRECT-4V14
      109   CORRECTMA-A. . . . . . . . . .  110 111 112 113 114
      108   CORRECTMA-X
      111   CORRECTMA-0V18
      113   CORRECTMA-14V4
      115   CORRECTMA-18V0
      112   CORRECTMA-4V14
       95   CORRECTMI-A. . . . . . . . . .  96 97 98 99 100
       94   CORRECTMI-X
       97   CORRECTMI-0V18
       99   CORRECTMI-14V4
      101   CORRECTMI-18V0
       98   CORRECTMI-4V14
       86   CR-18V0
      100   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    16
0 Defined   Cross-reference of data names   References

0     114   CR-18V0
       29   D. . . . . . . . . . . . . . .  381 431
      132   DELETE-COUNTER . . . . . . . .  M234 263 278 280
       59   DOTVALUE . . . . . . . . . . .  M239
      138   DUMMY-HOLD . . . . . . . . . .  M292 302
       23   DUMMY-RECORD . . . . . . . . .  M249 M250 M251 M252 M254 M255 M256 M258 M260 M268 M275 M282 M287 M288 292 M293
                                            294 M295 M296 M297 M298 M299 M300 M301 M302 306 M307 M316 M338
       30   E. . . . . . . . . . . . . . .  395 431 558
      185   ENDER-DESC . . . . . . . . . .  M270 M281 M286
      133   ERROR-COUNTER. . . . . . . . .  M233 262 271 274
      137   ERROR-HOLD . . . . . . . . . .  M262 M263 M263 M264 266
      183   ERROR-TOTAL. . . . . . . . . .  M272 M274 M279 M280 M284 M285
       31   F. . . . . . . . . . . . . . .  395 431
       52   FEATURE. . . . . . . . . . . .  M349
       32   G. . . . . . . . . . . . . . .  395 431
       33   H
      211   HYPHEN-LINE. . . . . . . . . .  256 258 301
      177   ID-AGAIN . . . . . . . . . . .  M223
       43   IND. . . . . . . . . . . . . .  449 449 449 466 466 466 484
      210   INF-ANSI-REFERENCE . . . . . .  M314 M317 M337 M339
      205   INFO-TEXT. . . . . . . . . . .  M315
      134   INSPECT-COUNTER. . . . . . . .  M231 262 283 285
       34   M. . . . . . . . . . . . . . .  501
       47   MAX-RANGE. . . . . . . . . . .  M535 539 544 M556 560 565 M577 581 586 M598 603 608 M620 625 630
       46   MIN-RANGE. . . . . . . . . . .  M534 538 543 M555 559 564 M576 580 585 M597 602 607 M619 624 629
       35   N. . . . . . . . . . . . . . .  501
       36   O. . . . . . . . . . . . . . .  501
       37   P. . . . . . . . . . . . . . .  466
       54   P-OR-F . . . . . . . . . . . .  M231 M232 M233 M234 241 M244
       56   PAR-NAME . . . . . . . . . . .  M246 M365 M378 M390 M408 M426 M444 M461 M479 M496 M513 M530 M551 M572 M593 M615
                                            M637 M651
       58   PARDOT-X . . . . . . . . . . .  M238
      135   PASS-COUNTER . . . . . . . . .  M232 264 265
       21   PRINT-FILE . . . . . . . . . .  17 222 228
       22   PRINT-REC. . . . . . . . . . .  M240 M320 M324 M325 M327
       38   Q. . . . . . . . . . . . . . .  466
       39   R. . . . . . . . . . . . . . .  466
       61   RE-MARK. . . . . . . . . . . .  M235 M247
      131   REC-CT . . . . . . . . . . . .  237 239 246
      130   REC-SKL-SUB
      139   RECORD-COUNT . . . . . . . . .  M290 291 M303
       44   TEMP
       62   TEST-COMPUTED. . . . . . . . .  320
       77   TEST-CORRECT . . . . . . . . .  327
      105   TEST-CORRECT-MAX . . . . . . .  325
       91   TEST-CORRECT-MIN . . . . . . .  324
      158   TEST-ID. . . . . . . . . . . .  M223
       50   TEST-RESULTS . . . . . . . . .  M224 240
      136   TOTAL-ERROR
       45   WS-NUM . . . . . . . . . . . .  M351 M353 354 357 M393 M395 396 397 400 M411 M413 414 415 418 M429 M431 432 433
                                            436 M447 M449 450 453 M464 M466 468 471 M482 M484 485 488 M499 M501 502 505 M516
                                            M518 519 522 M533 M537 538 539 542 M554 M558 559 560 563 M575 M579 580 581 584
                                            M596 M600 602 603 606 M618 M622 624 625 628
      207   XXCOMPUTED . . . . . . . . . .  M336
      209   XXCORRECT. . . . . . . . . . .  M335
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    17
0 Defined   Cross-reference of data names   References

0     202   XXINFO . . . . . . . . . . . .  316 338
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    18
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

      331   BAIL-OUT . . . . . . . . . . .  P243
      340   BAIL-OUT-EX. . . . . . . . . .  E243 G333
      334   BAIL-OUT-WRITE . . . . . . . .  G332
      308   BLANK-LINE-PRINT
      653   CCVS-EXIT
      654   CCVS-999999
      220   CCVS1
      341   CCVS1-EXIT . . . . . . . . . .  G226
      227   CLOSE-FILES. . . . . . . . . .  G655
      253   COLUMN-NAMES-ROUTINE . . . . .  E225
      234   DE-LETE. . . . . . . . . . . .  P362 P375 P387 P405 P423 P441 P458 P476 P493 P510 P527 P548 P569 P590 P612 P634
                                            P648
      257   END-ROUTINE. . . . . . . . . .  P228
      261   END-ROUTINE-1
      269   END-ROUTINE-12
      277   END-ROUTINE-13 . . . . . . . .  E228
      259   END-RTN-EXIT
      361   F-MEDIAN-DELETE-01
      374   F-MEDIAN-DELETE-02
      386   F-MEDIAN-DELETE-03
      404   F-MEDIAN-DELETE-04
      422   F-MEDIAN-DELETE-05
      440   F-MEDIAN-DELETE-06
      457   F-MEDIAN-DELETE-07
      475   F-MEDIAN-DELETE-08
      492   F-MEDIAN-DELETE-09
      509   F-MEDIAN-DELETE-11
      526   F-MEDIAN-DELETE-12
      547   F-MEDIAN-DELETE-13
      568   F-MEDIAN-DELETE-14
      589   F-MEDIAN-DELETE-15
      611   F-MEDIAN-DELETE-16
      633   F-MEDIAN-DELETE-17
      647   F-MEDIAN-DELETE-18
      347   F-MEDIAN-INFO
      352   F-MEDIAN-TEST-01
      394   F-MEDIAN-TEST-04
      412   F-MEDIAN-TEST-05
      430   F-MEDIAN-TEST-06
      448   F-MEDIAN-TEST-07
      465   F-MEDIAN-TEST-08
      483   F-MEDIAN-TEST-09
      500   F-MEDIAN-TEST-11
      517   F-MEDIAN-TEST-12
      536   F-MEDIAN-TEST-13
      557   F-MEDIAN-TEST-14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    19
0 Defined   Cross-reference of procedures   References

0     578   F-MEDIAN-TEST-15
      599   F-MEDIAN-TEST-16
      621   F-MEDIAN-TEST-17
      644   F-MEDIAN-TEST-18 . . . . . . .  P640
      364   F-MEDIAN-WRITE-01. . . . . . .  G360 G363
      377   F-MEDIAN-WRITE-02. . . . . . .  G373 G376
      389   F-MEDIAN-WRITE-03. . . . . . .  G385 G388
      407   F-MEDIAN-WRITE-04. . . . . . .  G403 G406
      425   F-MEDIAN-WRITE-05. . . . . . .  G421 G424
      443   F-MEDIAN-WRITE-06. . . . . . .  G439 G442
      460   F-MEDIAN-WRITE-07. . . . . . .  G456 G459
      478   F-MEDIAN-WRITE-08. . . . . . .  G474 G477
      495   F-MEDIAN-WRITE-09. . . . . . .  G491 G494
      512   F-MEDIAN-WRITE-11. . . . . . .  G508 G511
      529   F-MEDIAN-WRITE-12. . . . . . .  G525 G528
      550   F-MEDIAN-WRITE-13. . . . . . .  G546 G549
      571   F-MEDIAN-WRITE-14. . . . . . .  G567 G570
      592   F-MEDIAN-WRITE-15. . . . . . .  G588 G591
      614   F-MEDIAN-WRITE-16. . . . . . .  G610 G613
      636   F-MEDIAN-WRITE-17. . . . . . .  G632 G635
      650   F-MEDIAN-WRITE-18. . . . . . .  G643 G649
      350   F-MEDIAN-01
      367   F-MEDIAN-02
      380   F-MEDIAN-03
      392   F-MEDIAN-04
      410   F-MEDIAN-05
      428   F-MEDIAN-06
      446   F-MEDIAN-07
      463   F-MEDIAN-08
      481   F-MEDIAN-09
      498   F-MEDIAN-11
      515   F-MEDIAN-12
      532   F-MEDIAN-13
      553   F-MEDIAN-14
      574   F-MEDIAN-15
      595   F-MEDIAN-16
      617   F-MEDIAN-17
      639   F-MEDIAN-18
      233   FAIL . . . . . . . . . . . . .  P359 P372 P384 P402 P420 P438 P455 P473 P490 P507 P524 P545 P566 P587 P609 P631
      310   FAIL-ROUTINE . . . . . . . . .  P242
      330   FAIL-ROUTINE-EX. . . . . . . .  E242 G318
      319   FAIL-ROUTINE-WRITE . . . . . .  G312 G313
      248   HEAD-ROUTINE . . . . . . . . .  P225
      231   INSPT
      221   OPEN-FILES
      232   PASS . . . . . . . . . . . . .  P355 P370 P382 P398 P416 P434 P451 P469 P486 P503 P520 P540 P561 P582 P604 P626
                                            P642
      236   PRINT-DETAIL . . . . . . . . .  P366 P379 P391 P409 P427 P445 P462 P480 P497 P514 P531 P552 P573 P594 P616 P638
                                            P652
      346   SECT-IF121A
      229   TERMINATE-CCVS
      289   WRITE-LINE . . . . . . . . . .  P240 P241 P249 P250 P251 P252 P254 P255 P256 P258 P260 P268 P276 P282 P287 P288
                                            P316 P320 P324 P325 P327 P328 P338
      305   WRT-LN . . . . . . . . . . . .  P295 P296 P297 P298 P299 P300 P301 P304 P309
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    20
0 Defined   Cross-reference of programs     References

        3   IF121A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF121A    Date 06/04/2022  Time 11:57:27   Page    21
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF121A:
 *    Source records = 655
 *    Data Division statements = 104
 *    Procedure Division statements = 351
 *    Generated COBOL statements = 0
 *    Program complexity factor = 363
0End of compilation 1,  program IF121A,  highest severity 0.
0Return code 0
