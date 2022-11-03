1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:42   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:42   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1204.2
   000002         000200 PROGRAM-ID.                                                      IF1204.2
   000003         000300     IF120A.                                                      IF1204.2
   000004         000400                                                                  IF1204.2
   000005         000600*                                                         *       IF1204.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1204.2
   000007         000800* It contains tests for the Intrinsic Function MEAN.      *       IF1204.2
   000008         000900*                                                         *       IF1204.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1204.2
   000010         001200 CONFIGURATION SECTION.                                           IF1204.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1204.2
   000012         001400     XXXXX082.                                                    IF1204.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1204.2
   000014         001600     XXXXX083.                                                    IF1204.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1204.2
   000016         001800 FILE-CONTROL.                                                    IF1204.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1204.2 21
   000018         002000     XXXXX055.                                                    IF1204.2
   000019         002100 DATA DIVISION.                                                   IF1204.2
   000020         002200 FILE SECTION.                                                    IF1204.2
   000021         002300 FD  PRINT-FILE.                                                  IF1204.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1204.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1204.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1204.2
   000025         002800* Variables specific to the Intrinsic Function Test IF120A*       IF1204.2
   000026         003000 01  A                   PIC S9(10)          VALUE 5.             IF1204.2
   000027         003100 01  B                   PIC S9(10)          VALUE 7.             IF1204.2
   000028         003200 01  C                   PIC S9(10)          VALUE -4.            IF1204.2
   000029         003300 01  D                   PIC S9(10)          VALUE 10.            IF1204.2
   000030         003400 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1204.2
   000031         003500 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1204.2
   000032         003600 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1204.2
   000033         003700 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1204.2
   000034         003800 01  M                   PIC S9(10)          VALUE 320000.        IF1204.2
   000035         003900 01  N                   PIC S9(10)          VALUE 650000.        IF1204.2
   000036         004000 01  O                   PIC S9(10)          VALUE -430000.       IF1204.2
   000037         004100 01  P                   PIC S9(10)          VALUE 1.             IF1204.2
   000038         004200 01  Q                   PIC S9(10)          VALUE 3.             IF1204.2
   000039         004300 01  R                   PIC S9(10)          VALUE 5.             IF1204.2
   000040         004400 01  ARG1                PIC S9(10)          VALUE 1.             IF1204.2
   000041         004500 01  ARG2                PIC S9(10)          VALUE 1.             IF1204.2
   000042         004600 01  ARR                                     VALUE "40537".       IF1204.2
   000043         004700     02  IND OCCURS 5 TIMES PIC 9.                                IF1204.2
   000044         004800 01  TEMP                PIC S9(10)V9(5).                         IF1204.2
   000045         004900 01  WS-NUM              PIC S9(6)V9(6).                          IF1204.2
   000046         005000 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1204.2
   000047         005100 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1204.2
   000048         005200*                                                                 IF1204.2
   000049         005400*                                                                 IF1204.2
   000050         005500 01  TEST-RESULTS.                                                IF1204.2
   000051         005600     02 FILLER                   PIC X      VALUE SPACE.          IF1204.2 IMP
   000052         005700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1204.2 IMP
   000053         005800     02 FILLER                   PIC X      VALUE SPACE.          IF1204.2 IMP
   000054         005900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1204.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 FILLER                   PIC X      VALUE SPACE.          IF1204.2 IMP
   000056         006100     02  PAR-NAME.                                                IF1204.2
   000057         006200       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1204.2 IMP
   000058         006300       03  PARDOT-X              PIC X      VALUE SPACE.          IF1204.2 IMP
   000059         006400       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1204.2 IMP
   000060         006500     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1204.2 IMP
   000061         006600     02 RE-MARK                  PIC X(61).                       IF1204.2
   000062         006700 01  TEST-COMPUTED.                                               IF1204.2
   000063         006800     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1204.2 IMP
   000064         006900     02 FILLER                   PIC X(17)  VALUE                 IF1204.2
   000065         007000            "       COMPUTED=".                                   IF1204.2
   000066         007100     02 COMPUTED-X.                                               IF1204.2
   000067         007200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1204.2 IMP
   000068         007300     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1204.2 67
   000069         007400                                 PIC -9(9).9(9).                  IF1204.2
   000070         007500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1204.2 67
   000071         007600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1204.2 67
   000072         007700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1204.2 67
   000073         007800     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1204.2 67
   000074         007900         04 COMPUTED-18V0                    PIC -9(18).          IF1204.2
   000075         008000         04 FILLER                           PIC X.               IF1204.2
   000076         008100     03 FILLER PIC X(50) VALUE SPACE.                             IF1204.2 IMP
   000077         008200 01  TEST-CORRECT.                                                IF1204.2
   000078         008300     02 FILLER PIC X(30) VALUE SPACE.                             IF1204.2 IMP
   000079         008400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1204.2
   000080         008500     02 CORRECT-X.                                                IF1204.2
   000081         008600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1204.2 IMP
   000082         008700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1204.2 81
   000083         008800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1204.2 81
   000084         008900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1204.2 81
   000085         009000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1204.2 81
   000086         009100     03      CR-18V0 REDEFINES CORRECT-A.                         IF1204.2 81
   000087         009200         04 CORRECT-18V0                     PIC -9(18).          IF1204.2
   000088         009300         04 FILLER                           PIC X.               IF1204.2
   000089         009400     03 FILLER PIC X(2) VALUE SPACE.                              IF1204.2 IMP
   000090         009500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1204.2 IMP
   000091         009600 01  TEST-CORRECT-MIN.                                            IF1204.2
   000092         009700     02 FILLER PIC X(30) VALUE SPACE.                             IF1204.2 IMP
   000093         009800     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1204.2
   000094         009900     02 CORRECTMI-X.                                              IF1204.2
   000095         010000     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1204.2 IMP
   000096         010100     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1204.2 95
   000097         010200     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1204.2 95
   000098         010300     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1204.2 95
   000099         010400     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1204.2 95
   000100         010500     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1204.2 95
   000101         010600         04 CORRECTMI-18V0                     PIC -9(18).        IF1204.2
   000102         010700         04 FILLER                           PIC X.               IF1204.2
   000103         010800     03 FILLER PIC X(2) VALUE SPACE.                              IF1204.2 IMP
   000104         010900     03 FILLER                           PIC X(48) VALUE SPACE.   IF1204.2 IMP
   000105         011000 01  TEST-CORRECT-MAX.                                            IF1204.2
   000106         011100     02 FILLER PIC X(30) VALUE SPACE.                             IF1204.2 IMP
   000107         011200     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1204.2
   000108         011300     02 CORRECTMA-X.                                              IF1204.2
   000109         011400     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1204.2 IMP
   000110         011500     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1204.2 109
   000111         011600     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1204.2 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1204.2 109
   000113         011800     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1204.2 109
   000114         011900     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1204.2 109
   000115         012000         04 CORRECTMA-18V0                     PIC -9(18).        IF1204.2
   000116         012100         04 FILLER                           PIC X.               IF1204.2
   000117         012200     03 FILLER PIC X(2) VALUE SPACE.                              IF1204.2 IMP
   000118         012300     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1204.2 IMP
   000119         012400 01  CCVS-C-1.                                                    IF1204.2
   000120         012500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1204.2
   000121         012600-    "SS  PARAGRAPH-NAME                                          IF1204.2
   000122         012700-    "       REMARKS".                                            IF1204.2
   000123         012800     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1204.2 IMP
   000124         012900 01  CCVS-C-2.                                                    IF1204.2
   000125         013000     02 FILLER                     PIC X        VALUE SPACE.      IF1204.2 IMP
   000126         013100     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1204.2
   000127         013200     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1204.2 IMP
   000128         013300     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1204.2
   000129         013400     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1204.2 IMP
   000130         013500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1204.2 IMP
   000131         013600 01  REC-CT                        PIC 99       VALUE ZERO.       IF1204.2 IMP
   000132         013700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1204.2 IMP
   000133         013800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1204.2 IMP
   000134         013900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1204.2 IMP
   000135         014000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1204.2 IMP
   000136         014100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1204.2 IMP
   000137         014200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1204.2 IMP
   000138         014300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1204.2 IMP
   000139         014400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1204.2 IMP
   000140         014500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1204.2 IMP
   000141         014600 01  CCVS-H-1.                                                    IF1204.2
   000142         014700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1204.2 IMP
   000143         014800     02  FILLER                    PIC X(42)    VALUE             IF1204.2
   000144         014900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1204.2
   000145         015000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1204.2 IMP
   000146         015100 01  CCVS-H-2A.                                                   IF1204.2
   000147         015200   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1204.2 IMP
   000148         015300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1204.2
   000149         015400   02  FILLER                        PIC XXXX   VALUE             IF1204.2
   000150         015500     "4.2 ".                                                      IF1204.2
   000151         015600   02  FILLER                        PIC X(28)  VALUE             IF1204.2
   000152         015700            " COPY - NOT FOR DISTRIBUTION".                       IF1204.2
   000153         015800   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1204.2 IMP
   000154         015900                                                                  IF1204.2
   000155         016000 01  CCVS-H-2B.                                                   IF1204.2
   000156         016100   02  FILLER                        PIC X(15)  VALUE             IF1204.2
   000157         016200            "TEST RESULT OF ".                                    IF1204.2
   000158         016300   02  TEST-ID                       PIC X(9).                    IF1204.2
   000159         016400   02  FILLER                        PIC X(4)   VALUE             IF1204.2
   000160         016500            " IN ".                                               IF1204.2
   000161         016600   02  FILLER                        PIC X(12)  VALUE             IF1204.2
   000162         016700     " HIGH       ".                                              IF1204.2
   000163         016800   02  FILLER                        PIC X(22)  VALUE             IF1204.2
   000164         016900            " LEVEL VALIDATION FOR ".                             IF1204.2
   000165         017000   02  FILLER                        PIC X(58)  VALUE             IF1204.2
   000166         017100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1204.2
   000167         017200 01  CCVS-H-3.                                                    IF1204.2
   000168         017300     02  FILLER                      PIC X(34)  VALUE             IF1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400            " FOR OFFICIAL USE ONLY    ".                         IF1204.2
   000170         017500     02  FILLER                      PIC X(58)  VALUE             IF1204.2
   000171         017600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1204.2
   000172         017700     02  FILLER                      PIC X(28)  VALUE             IF1204.2
   000173         017800            "  COPYRIGHT   1985 ".                                IF1204.2
   000174         017900 01  CCVS-E-1.                                                    IF1204.2
   000175         018000     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1204.2 IMP
   000176         018100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1204.2
   000177         018200     02 ID-AGAIN                     PIC X(9).                    IF1204.2
   000178         018300     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1204.2 IMP
   000179         018400 01  CCVS-E-2.                                                    IF1204.2
   000180         018500     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1204.2 IMP
   000181         018600     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1204.2 IMP
   000182         018700     02 CCVS-E-2-2.                                               IF1204.2
   000183         018800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1204.2 IMP
   000184         018900         03 FILLER                   PIC X      VALUE SPACE.      IF1204.2 IMP
   000185         019000         03 ENDER-DESC               PIC X(44)  VALUE             IF1204.2
   000186         019100            "ERRORS ENCOUNTERED".                                 IF1204.2
   000187         019200 01  CCVS-E-3.                                                    IF1204.2
   000188         019300     02  FILLER                      PIC X(22)  VALUE             IF1204.2
   000189         019400            " FOR OFFICIAL USE ONLY".                             IF1204.2
   000190         019500     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1204.2 IMP
   000191         019600     02  FILLER                      PIC X(58)  VALUE             IF1204.2
   000192         019700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1204.2
   000193         019800     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1204.2 IMP
   000194         019900     02 FILLER                       PIC X(15)  VALUE             IF1204.2
   000195         020000             " COPYRIGHT 1985".                                   IF1204.2
   000196         020100 01  CCVS-E-4.                                                    IF1204.2
   000197         020200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1204.2 IMP
   000198         020300     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1204.2
   000199         020400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1204.2 IMP
   000200         020500     02 FILLER                       PIC X(40)  VALUE             IF1204.2
   000201         020600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1204.2
   000202         020700 01  XXINFO.                                                      IF1204.2
   000203         020800     02 FILLER                       PIC X(19)  VALUE             IF1204.2
   000204         020900            "*** INFORMATION ***".                                IF1204.2
   000205         021000     02 INFO-TEXT.                                                IF1204.2
   000206         021100       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1204.2 IMP
   000207         021200       04 XXCOMPUTED                 PIC X(20).                   IF1204.2
   000208         021300       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1204.2 IMP
   000209         021400       04 XXCORRECT                  PIC X(20).                   IF1204.2
   000210         021500     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1204.2
   000211         021600 01  HYPHEN-LINE.                                                 IF1204.2
   000212         021700     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1204.2 IMP
   000213         021800     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1204.2
   000214         021900-    "*****************************************".                 IF1204.2
   000215         022000     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1204.2
   000216         022100-    "******************************".                            IF1204.2
   000217         022200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1204.2
   000218         022300     "IF120A".                                                    IF1204.2
   000219         022400 PROCEDURE DIVISION.                                              IF1204.2
   000220         022500 CCVS1 SECTION.                                                   IF1204.2
   000221         022600 OPEN-FILES.                                                      IF1204.2
   000222         022700     OPEN     OUTPUT PRINT-FILE.                                  IF1204.2 21
   000223         022800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1204.2 217 158 217 177
   000224         022900     MOVE    SPACE TO TEST-RESULTS.                               IF1204.2 IMP 50
   000225         023000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1204.2 248 253
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100     GO TO CCVS1-EXIT.                                            IF1204.2 341
   000227         023200 CLOSE-FILES.                                                     IF1204.2
   000228         023300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1204.2 257 277 21
   000229         023400 TERMINATE-CCVS.                                                  IF1204.2
   000230         023500     STOP     RUN.                                                IF1204.2
   000231         023600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1204.2 54 134
   000232         023700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1204.2 54 135
   000233         023800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1204.2 54 133
   000234         023900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1204.2 54 132
   000235         024000     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1204.2 61
   000236         024100 PRINT-DETAIL.                                                    IF1204.2
   000237         024200     IF REC-CT NOT EQUAL TO ZERO                                  IF1204.2 131 IMP
   000238      1  024300             MOVE "." TO PARDOT-X                                 IF1204.2 58
   000239      1  024400             MOVE REC-CT TO DOTVALUE.                             IF1204.2 131 59
   000240         024500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1204.2 50 22 289
   000241         024600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1204.2 54 289
   000242      1  024700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1204.2 310 330
   000243      1  024800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1204.2 331 340
   000244         024900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1204.2 IMP 54 IMP 66
   000245         025000     MOVE SPACE TO CORRECT-X.                                     IF1204.2 IMP 80
   000246         025100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1204.2 131 IMP IMP 56
   000247         025200     MOVE     SPACE TO RE-MARK.                                   IF1204.2 IMP 61
   000248         025300 HEAD-ROUTINE.                                                    IF1204.2
   000249         025400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1204.2 141 23 289
   000250         025500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1204.2 146 23 289
   000251         025600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1204.2 155 23 289
   000252         025700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1204.2 167 23 289
   000253         025800 COLUMN-NAMES-ROUTINE.                                            IF1204.2
   000254         025900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1204.2 119 23 289
   000255         026000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1204.2 124 23 289
   000256         026100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1204.2 211 23 289
   000257         026200 END-ROUTINE.                                                     IF1204.2
   000258         026300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1204.2 211 23 289
   000259         026400 END-RTN-EXIT.                                                    IF1204.2
   000260         026500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1204.2 174 23 289
   000261         026600 END-ROUTINE-1.                                                   IF1204.2
   000262         026700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1204.2 133 137 134
   000263         026800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1204.2 137 132 137
   000264         026900      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1204.2 135 137
   000265         027000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1204.2 135 197
   000266         027100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1204.2 137 199
   000267         027200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1204.2 196 182
   000268         027300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1204.2 179 23 289
   000269         027400  END-ROUTINE-12.                                                 IF1204.2
   000270         027500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1204.2 185
   000271         027600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1204.2 133 IMP
   000272      1  027700         MOVE "NO " TO ERROR-TOTAL                                IF1204.2 183
   000273         027800         ELSE                                                     IF1204.2
   000274      1  027900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1204.2 133 183
   000275         028000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1204.2 179 23
   000276         028100     PERFORM WRITE-LINE.                                          IF1204.2 289
   000277         028200 END-ROUTINE-13.                                                  IF1204.2
   000278         028300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1204.2 132 IMP
   000279      1  028400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1204.2 183
   000280      1  028500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1204.2 132 183
   000281         028600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1204.2 185
   000282         028700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1204.2 179 23 289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1204.2 134 IMP
   000284      1  028900          MOVE "NO " TO ERROR-TOTAL                               IF1204.2 183
   000285      1  029000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1204.2 134 183
   000286         029100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1204.2 185
   000287         029200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1204.2 179 23 289
   000288         029300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1204.2 187 23 289
   000289         029400 WRITE-LINE.                                                      IF1204.2
   000290         029500     ADD 1 TO RECORD-COUNT.                                       IF1204.2 139
   000291         029600     IF RECORD-COUNT GREATER 42                                   IF1204.2 139
   000292      1  029700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1204.2 23 138
   000293      1  029800         MOVE SPACE TO DUMMY-RECORD                               IF1204.2 IMP 23
   000294      1  029900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1204.2 23
   000295      1  030000         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1204.2 141 23 305
   000296      1  030100         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1204.2 146 23 305
   000297      1  030200         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1204.2 155 23 305
   000298      1  030300         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1204.2 167 23 305
   000299      1  030400         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1204.2 119 23 305
   000300      1  030500         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1204.2 124 23 305
   000301      1  030600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1204.2 211 23 305
   000302      1  030700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1204.2 138 23
   000303      1  030800         MOVE ZERO TO RECORD-COUNT.                               IF1204.2 IMP 139
   000304         030900     PERFORM WRT-LN.                                              IF1204.2 305
   000305         031000 WRT-LN.                                                          IF1204.2
   000306         031100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1204.2 23
   000307         031200     MOVE SPACE TO DUMMY-RECORD.                                  IF1204.2 IMP 23
   000308         031300 BLANK-LINE-PRINT.                                                IF1204.2
   000309         031400     PERFORM WRT-LN.                                              IF1204.2 305
   000310         031500 FAIL-ROUTINE.                                                    IF1204.2
   000311         031600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1204.2 66 IMP
   000312      1  031700            GO TO FAIL-ROUTINE-WRITE.                             IF1204.2 319
   000313         031800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1204.2 80 IMP 319
   000314         031900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1204.2 140 210
   000315         032000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1204.2 205
   000316         032100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1204.2 202 23 289
   000317         032200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1204.2 IMP 210
   000318         032300     GO TO  FAIL-ROUTINE-EX.                                      IF1204.2 330
   000319         032400 FAIL-ROUTINE-WRITE.                                              IF1204.2
   000320         032500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1204.2 62 22 289
   000321         032600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1204.2 140 90
   000322         032700                              CORMA-ANSI-REFERENCE.               IF1204.2 118
   000323         032800     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1204.2 96 IMP
   000324      1  032900           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1204.2 91 22 289
   000325      1  033000           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1204.2 105 22 289
   000326         033100     ELSE                                                         IF1204.2
   000327      1  033200           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1204.2 77 22 289
   000328         033300     PERFORM WRITE-LINE.                                          IF1204.2 289
   000329         033400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1204.2 IMP 90
   000330         033500 FAIL-ROUTINE-EX. EXIT.                                           IF1204.2
   000331         033600 BAIL-OUT.                                                        IF1204.2
   000332         033700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1204.2 67 IMP 334
   000333         033800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1204.2 81 IMP 340
   000334         033900 BAIL-OUT-WRITE.                                                  IF1204.2
   000335         034000     MOVE CORRECT-A TO XXCORRECT.                                 IF1204.2 81 209
   000336         034100     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1204.2 67 207
   000337         034200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1204.2 140 210
   000338         034300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1204.2 202 23 289
   000339         034400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1204.2 IMP 210
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034500 BAIL-OUT-EX. EXIT.                                               IF1204.2
   000341         034600 CCVS1-EXIT.                                                      IF1204.2
   000342         034700     EXIT.                                                        IF1204.2
   000343         034900*                                                      *          IF1204.2
   000344         035000*    Intrinsic Function Tests         IF120A - MEAN    *          IF1204.2
   000345         035100*                                                      *          IF1204.2
   000346         035300 SECT-IF120A SECTION.                                             IF1204.2
   000347         035400 F-MEAN-TEST-INFO.                                                IF1204.2
   000348         035500     MOVE     "See ref. A-53 2.24" TO ANSI-REFERENCE.             IF1204.2 140
   000349         035600     MOVE     "MEAN Function" TO FEATURE.                         IF1204.2 52
   000350         035800 F-MEAN-01.                                                       IF1204.2
   000351         035900     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000352         036000 F-MEAN-TEST-01.                                                  IF1204.2
   000353         036100     COMPUTE WS-NUM = FUNCTION MEAN(5, -2, -14, 0).               IF1204.2 45 IFN
   000354         036200     IF (WS-NUM >= -2.75006) AND                                  IF1204.2 45
   000355         036300        (WS-NUM <= -2.74995)                                      IF1204.2 45
   000356      1  036400                    PERFORM PASS                                  IF1204.2 232
   000357         036500     ELSE                                                         IF1204.2
   000358      1  036600                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000359      1  036700                    MOVE -2.75 TO CORRECT-N                       IF1204.2 82
   000360      1  036800                    PERFORM FAIL.                                 IF1204.2 233
   000361         036900     GO TO F-MEAN-WRITE-01.                                       IF1204.2 365
   000362         037000 F-MEAN-DELETE-01.                                                IF1204.2
   000363         037100     PERFORM  DE-LETE.                                            IF1204.2 234
   000364         037200     GO TO    F-MEAN-WRITE-01.                                    IF1204.2 365
   000365         037300 F-MEAN-WRITE-01.                                                 IF1204.2
   000366         037400     MOVE "F-MEAN-01" TO PAR-NAME.                                IF1204.2 56
   000367         037500     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000368         037700 F-MEAN-02.                                                       IF1204.2
   000369         037800     EVALUATE FUNCTION MEAN(3.9, -0.3, 8.7, 100.2)                IF1204.2 IFN
   000370         037900     WHEN 28.1244 THRU 28.1256                                    IF1204.2
   000371      1  038000                    PERFORM PASS                                  IF1204.2 232
   000372         038100     WHEN OTHER                                                   IF1204.2
   000373      1  038200                    PERFORM FAIL.                                 IF1204.2 233
   000374         038300     GO TO F-MEAN-WRITE-02.                                       IF1204.2 378
   000375         038400 F-MEAN-DELETE-02.                                                IF1204.2
   000376         038500     PERFORM  DE-LETE.                                            IF1204.2 234
   000377         038600     GO TO    F-MEAN-WRITE-02.                                    IF1204.2 378
   000378         038700 F-MEAN-WRITE-02.                                                 IF1204.2
   000379         038800     MOVE "F-MEAN-02" TO PAR-NAME.                                IF1204.2 56
   000380         038900     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000381         039100 F-MEAN-03.                                                       IF1204.2
   000382         039200     IF (FUNCTION MEAN(A, B, C, D) >= 4.49991) AND                IF1204.2 IFN 26 27 28 29
   000383         039300        (FUNCTION MEAN(A, B, C, D) <= 4.50009)                    IF1204.2 IFN 26 27 28 29
   000384      1  039400                    PERFORM PASS                                  IF1204.2 232
   000385         039500     ELSE                                                         IF1204.2
   000386      1  039600                    PERFORM FAIL.                                 IF1204.2 233
   000387         039700     GO TO F-MEAN-WRITE-03.                                       IF1204.2 391
   000388         039800 F-MEAN-DELETE-03.                                                IF1204.2
   000389         039900     PERFORM  DE-LETE.                                            IF1204.2 234
   000390         040000     GO TO    F-MEAN-WRITE-03.                                    IF1204.2 391
   000391         040100 F-MEAN-WRITE-03.                                                 IF1204.2
   000392         040200     MOVE "F-MEAN-03" TO PAR-NAME.                                IF1204.2 56
   000393         040300     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000394         040500 F-MEAN-04.                                                       IF1204.2
   000395         040600     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000396         040700 F-MEAN-TEST-04.                                                  IF1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800     COMPUTE WS-NUM = FUNCTION MEAN(E, F, G, H).                  IF1204.2 45 IFN 30 31 32 33
   000398         040900     IF (WS-NUM >= 6.17988) AND                                   IF1204.2 45
   000399         041000        (WS-NUM <= 6.18012)                                       IF1204.2 45
   000400      1  041100                    PERFORM PASS                                  IF1204.2 232
   000401         041200     ELSE                                                         IF1204.2
   000402      1  041300                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000403      1  041400                    MOVE 6.18 TO CORRECT-N                        IF1204.2 82
   000404      1  041500                    PERFORM FAIL.                                 IF1204.2 233
   000405         041600     GO TO F-MEAN-WRITE-04.                                       IF1204.2 409
   000406         041700 F-MEAN-DELETE-04.                                                IF1204.2
   000407         041800     PERFORM  DE-LETE.                                            IF1204.2 234
   000408         041900     GO TO    F-MEAN-WRITE-04.                                    IF1204.2 409
   000409         042000 F-MEAN-WRITE-04.                                                 IF1204.2
   000410         042100     MOVE "F-MEAN-04" TO PAR-NAME.                                IF1204.2 56
   000411         042200     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000412         042400 F-MEAN-05.                                                       IF1204.2
   000413         042500     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000414         042600 F-MEAN-TEST-05.                                                  IF1204.2
   000415         042700     COMPUTE WS-NUM = FUNCTION MEAN(10.2, -0.2, 5.6, -15.6).      IF1204.2 45 IFN
   000416         042800     IF (WS-NUM >= -0.000020) AND                                 IF1204.2 45
   000417         042900        (WS-NUM <= 0.000020)                                      IF1204.2 45
   000418      1  043000                    PERFORM PASS                                  IF1204.2 232
   000419         043100     ELSE                                                         IF1204.2
   000420      1  043200                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000421      1  043300                    MOVE 0.0 TO CORRECT-N                         IF1204.2 82
   000422      1  043400                    PERFORM FAIL.                                 IF1204.2 233
   000423         043500     GO TO F-MEAN-WRITE-05.                                       IF1204.2 427
   000424         043600 F-MEAN-DELETE-05.                                                IF1204.2
   000425         043700     PERFORM  DE-LETE.                                            IF1204.2 234
   000426         043800     GO TO    F-MEAN-WRITE-05.                                    IF1204.2 427
   000427         043900 F-MEAN-WRITE-05.                                                 IF1204.2
   000428         044000     MOVE "F-MEAN-05" TO PAR-NAME.                                IF1204.2 56
   000429         044100     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000430         044300 F-MEAN-06.                                                       IF1204.2
   000431         044400     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000432         044500 F-MEAN-TEST-06.                                                  IF1204.2
   000433         044600     COMPUTE WS-NUM = FUNCTION MEAN(A, B, C, D, E, F, G, H).      IF1204.2 45 IFN 26 27 28 29 30 31 32 33
   000434         044700     IF (WS-NUM >= 5.33989) AND                                   IF1204.2 45
   000435         044800        (WS-NUM <= 5.34011)                                       IF1204.2 45
   000436      1  044900                    PERFORM PASS                                  IF1204.2 232
   000437         045000     ELSE                                                         IF1204.2
   000438      1  045100                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000439      1  045200                    MOVE 5.34 TO CORRECT-N                        IF1204.2 82
   000440      1  045300                    PERFORM FAIL.                                 IF1204.2 233
   000441         045400     GO TO F-MEAN-WRITE-06.                                       IF1204.2 445
   000442         045500 F-MEAN-DELETE-06.                                                IF1204.2
   000443         045600     PERFORM  DE-LETE.                                            IF1204.2 234
   000444         045700     GO TO    F-MEAN-WRITE-06.                                    IF1204.2 445
   000445         045800 F-MEAN-WRITE-06.                                                 IF1204.2
   000446         045900     MOVE "F-MEAN-06" TO PAR-NAME.                                IF1204.2 56
   000447         046000     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000448         046200 F-MEAN-07.                                                       IF1204.2
   000449         046300     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000450         046400 F-MEAN-TEST-07.                                                  IF1204.2
   000451         046500     COMPUTE WS-NUM = FUNCTION MEAN(IND(2), IND(1), IND(3)).      IF1204.2 45 IFN 43 43 43
   000452         046600     IF (WS-NUM >= 2.99994) AND                                   IF1204.2 45
   000453         046700        (WS-NUM <= 3.00006)                                       IF1204.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  046800                    PERFORM PASS                                  IF1204.2 232
   000455         046900     ELSE                                                         IF1204.2
   000456      1  047000                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000457      1  047100                    MOVE 3.0 TO CORRECT-N                         IF1204.2 82
   000458      1  047200                    PERFORM FAIL.                                 IF1204.2 233
   000459         047300     GO TO F-MEAN-WRITE-07.                                       IF1204.2 463
   000460         047400 F-MEAN-DELETE-07.                                                IF1204.2
   000461         047500     PERFORM  DE-LETE.                                            IF1204.2 234
   000462         047600     GO TO    F-MEAN-WRITE-07.                                    IF1204.2 463
   000463         047700 F-MEAN-WRITE-07.                                                 IF1204.2
   000464         047800     MOVE "F-MEAN-07" TO PAR-NAME.                                IF1204.2 56
   000465         047900     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000466         048100 F-MEAN-08.                                                       IF1204.2
   000467         048200     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000468         048300 F-MEAN-TEST-08.                                                  IF1204.2
   000469         048400     COMPUTE WS-NUM = FUNCTION MEAN(IND(P), IND(Q), IND(R)).      IF1204.2 45 IFN 43 37 43 38 43 39
   000470         048500     IF (WS-NUM >= 5.33323) AND                                   IF1204.2 45
   000471         048600        (WS-NUM <= 5.33344)                                       IF1204.2 45
   000472      1  048700                    PERFORM PASS                                  IF1204.2 232
   000473         048800     ELSE                                                         IF1204.2
   000474      1  048900                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000475      1  049000                    MOVE 5.333 TO CORRECT-N                       IF1204.2 82
   000476      1  049100                    PERFORM FAIL.                                 IF1204.2 233
   000477         049200     GO TO F-MEAN-WRITE-08.                                       IF1204.2 481
   000478         049300 F-MEAN-DELETE-08.                                                IF1204.2
   000479         049400     PERFORM  DE-LETE.                                            IF1204.2 234
   000480         049500     GO TO    F-MEAN-WRITE-08.                                    IF1204.2 481
   000481         049600 F-MEAN-WRITE-08.                                                 IF1204.2
   000482         049700     MOVE "F-MEAN-08" TO PAR-NAME.                                IF1204.2 56
   000483         049800     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000484         050000 F-MEAN-09.                                                       IF1204.2
   000485         050100     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000486         050200 F-MEAN-TEST-09.                                                  IF1204.2
   000487         050300     COMPUTE WS-NUM = FUNCTION MEAN(IND(ALL)).                    IF1204.2 45 IFN 43
   000488         050400     IF (WS-NUM >= 3.79992) AND                                   IF1204.2 45
   000489         050500        (WS-NUM <= 3.80008)                                       IF1204.2 45
   000490      1  050600                    PERFORM PASS                                  IF1204.2 232
   000491         050700     ELSE                                                         IF1204.2
   000492      1  050800                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000493      1  050900                    MOVE 3.8 TO CORRECT-N                         IF1204.2 82
   000494      1  051000                    PERFORM FAIL.                                 IF1204.2 233
   000495         051100     GO TO F-MEAN-WRITE-09.                                       IF1204.2 499
   000496         051200 F-MEAN-DELETE-09.                                                IF1204.2
   000497         051300     PERFORM  DE-LETE.                                            IF1204.2 234
   000498         051400     GO TO    F-MEAN-WRITE-09.                                    IF1204.2 499
   000499         051500 F-MEAN-WRITE-09.                                                 IF1204.2
   000500         051600     MOVE "F-MEAN-09" TO PAR-NAME.                                IF1204.2 56
   000501         051700     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000502         051900 F-MEAN-11.                                                       IF1204.2
   000503         052000     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000504         052100 F-MEAN-TEST-11.                                                  IF1204.2
   000505         052200     COMPUTE WS-NUM = FUNCTION MEAN(M, N, O).                     IF1204.2 45 IFN 34 35 36
   000506         052300     IF WS-NUM = 180000  THEN                                     IF1204.2 45
   000507      1  052400                    PERFORM PASS                                  IF1204.2 232
   000508         052500     ELSE                                                         IF1204.2
   000509      1  052600                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000510      1  052700                    MOVE 180000  TO CORRECT-N                     IF1204.2 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  052800                    PERFORM FAIL.                                 IF1204.2 233
   000512         052900     GO TO F-MEAN-WRITE-11.                                       IF1204.2 516
   000513         053000 F-MEAN-DELETE-11.                                                IF1204.2
   000514         053100     PERFORM  DE-LETE.                                            IF1204.2 234
   000515         053200     GO TO    F-MEAN-WRITE-11.                                    IF1204.2 516
   000516         053300 F-MEAN-WRITE-11.                                                 IF1204.2
   000517         053400     MOVE "F-MEAN-11" TO PAR-NAME.                                IF1204.2 56
   000518         053500     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000519         053700 F-MEAN-12.                                                       IF1204.2
   000520         053800     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000521         053900 F-MEAN-TEST-12.                                                  IF1204.2
   000522         054000     COMPUTE WS-NUM = FUNCTION MEAN(A, 5, A).                     IF1204.2 45 IFN 26 26
   000523         054100     IF WS-NUM = 5    THEN                                        IF1204.2 45
   000524      1  054200                    PERFORM PASS                                  IF1204.2 232
   000525         054300     ELSE                                                         IF1204.2
   000526      1  054400                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000527      1  054500                    MOVE 5    TO CORRECT-N                        IF1204.2 82
   000528      1  054600                    PERFORM FAIL.                                 IF1204.2 233
   000529         054700     GO TO F-MEAN-WRITE-12.                                       IF1204.2 533
   000530         054800 F-MEAN-DELETE-12.                                                IF1204.2
   000531         054900     PERFORM  DE-LETE.                                            IF1204.2 234
   000532         055000     GO TO    F-MEAN-WRITE-12.                                    IF1204.2 533
   000533         055100 F-MEAN-WRITE-12.                                                 IF1204.2
   000534         055200     MOVE "F-MEAN-12" TO PAR-NAME.                                IF1204.2 56
   000535         055300     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000536         055500 F-MEAN-13.                                                       IF1204.2
   000537         055600     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000538         055700     MOVE  20.6896 TO MIN-RANGE.                                  IF1204.2 46
   000539         055800     MOVE  20.6904 TO MAX-RANGE.                                  IF1204.2 47
   000540         055900 F-MEAN-TEST-13.                                                  IF1204.2
   000541         056000     COMPUTE WS-NUM = FUNCTION MEAN(E, 9 * A, 0, B / 2).          IF1204.2 45 IFN 30 26 27
   000542         056100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1204.2 45 46
   000543         056200        (WS-NUM <= MAX-RANGE) THEN                                IF1204.2 45 47
   000544      1  056300                    PERFORM PASS                                  IF1204.2 232
   000545         056400     ELSE                                                         IF1204.2
   000546      1  056500                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000547      1  056600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1204.2 46 96
   000548      1  056700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1204.2 47 110
   000549      1  056800                    PERFORM FAIL.                                 IF1204.2 233
   000550         056900     GO TO F-MEAN-WRITE-13.                                       IF1204.2 554
   000551         057000 F-MEAN-DELETE-13.                                                IF1204.2
   000552         057100     PERFORM  DE-LETE.                                            IF1204.2 234
   000553         057200     GO TO    F-MEAN-WRITE-13.                                    IF1204.2 554
   000554         057300 F-MEAN-WRITE-13.                                                 IF1204.2
   000555         057400     MOVE "F-MEAN-13" TO PAR-NAME.                                IF1204.2 56
   000556         057500     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000557         057700 F-MEAN-14.                                                       IF1204.2
   000558         057800     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000559         057900     MOVE 83.9983 TO MIN-RANGE.                                   IF1204.2 46
   000560         058000     MOVE 84.0017 TO MAX-RANGE.                                   IF1204.2 47
   000561         058100 F-MEAN-TEST-14.                                                  IF1204.2
   000562         058200     COMPUTE WS-NUM = FUNCTION MEAN(A, B) + 78.                   IF1204.2 45 IFN 26 27
   000563         058300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1204.2 45 46
   000564         058400        (WS-NUM <= MAX-RANGE) THEN                                IF1204.2 45 47
   000565      1  058500                    PERFORM PASS                                  IF1204.2 232
   000566         058600     ELSE                                                         IF1204.2
   000567      1  058700                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  058800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1204.2 46 96
   000569      1  058900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1204.2 47 110
   000570      1  059000                    PERFORM FAIL.                                 IF1204.2 233
   000571         059100     GO TO F-MEAN-WRITE-14.                                       IF1204.2 575
   000572         059200 F-MEAN-DELETE-14.                                                IF1204.2
   000573         059300     PERFORM  DE-LETE.                                            IF1204.2 234
   000574         059400     GO TO    F-MEAN-WRITE-14.                                    IF1204.2 575
   000575         059500 F-MEAN-WRITE-14.                                                 IF1204.2
   000576         059600     MOVE "F-MEAN-14" TO PAR-NAME.                                IF1204.2 56
   000577         059700     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000578         059900 F-MEAN-15.                                                       IF1204.2
   000579         060000     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000580         060100     MOVE 2.49995 TO MIN-RANGE.                                   IF1204.2 46
   000581         060200     MOVE 2.50005 TO MAX-RANGE.                                   IF1204.2 47
   000582         060300 F-MEAN-TEST-15.                                                  IF1204.2
   000583         060400     COMPUTE WS-NUM = FUNCTION MEAN(A , B) +                      IF1204.2 45 IFN 26 27
   000584         060500                      FUNCTION MEAN(-2.6, -4.4).                  IF1204.2 IFN
   000585         060600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1204.2 45 46
   000586         060700        (WS-NUM <= MAX-RANGE) THEN                                IF1204.2 45 47
   000587      1  060800                    PERFORM PASS                                  IF1204.2 232
   000588         060900     ELSE                                                         IF1204.2
   000589      1  061000                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000590      1  061100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1204.2 46 96
   000591      1  061200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1204.2 47 110
   000592      1  061300                    PERFORM FAIL.                                 IF1204.2 233
   000593         061400     GO TO F-MEAN-WRITE-15.                                       IF1204.2 597
   000594         061500 F-MEAN-DELETE-15.                                                IF1204.2
   000595         061600     PERFORM  DE-LETE.                                            IF1204.2 234
   000596         061700     GO TO    F-MEAN-WRITE-15.                                    IF1204.2 597
   000597         061800 F-MEAN-WRITE-15.                                                 IF1204.2
   000598         061900     MOVE "F-MEAN-15" TO PAR-NAME.                                IF1204.2 56
   000599         062000     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000600         062200 F-MEAN-16.                                                       IF1204.2
   000601         062300     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000602         062400     MOVE 4.49991 TO MIN-RANGE.                                   IF1204.2 46
   000603         062500     MOVE 4.50009 TO MAX-RANGE.                                   IF1204.2 47
   000604         062600 F-MEAN-TEST-16.                                                  IF1204.2
   000605         062700     COMPUTE WS-NUM = FUNCTION MEAN(FUNCTION MEAN(4, 2), 6).      IF1204.2 45 IFN IFN
   000606         062800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1204.2 45 46
   000607         062900        (WS-NUM <= MAX-RANGE) THEN                                IF1204.2 45 47
   000608      1  063000                    PERFORM PASS                                  IF1204.2 232
   000609         063100     ELSE                                                         IF1204.2
   000610      1  063200                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000611      1  063300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1204.2 46 96
   000612      1  063400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1204.2 47 110
   000613      1  063500                    PERFORM FAIL.                                 IF1204.2 233
   000614         063600     GO TO F-MEAN-WRITE-16.                                       IF1204.2 618
   000615         063700 F-MEAN-DELETE-16.                                                IF1204.2
   000616         063800     PERFORM  DE-LETE.                                            IF1204.2 234
   000617         063900     GO TO    F-MEAN-WRITE-16.                                    IF1204.2 618
   000618         064000 F-MEAN-WRITE-16.                                                 IF1204.2
   000619         064100     MOVE "F-MEAN-16" TO PAR-NAME.                                IF1204.2 56
   000620         064200     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000621         064400 F-MEAN-17.                                                       IF1204.2
   000622         064500     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000623         064600     MOVE  20.7996 TO MIN-RANGE.                                  IF1204.2 46
   000624         064700     MOVE  20.8004 TO MAX-RANGE.                                  IF1204.2 47
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064800 F-MEAN-TEST-17.                                                  IF1204.2
   000626         064900     COMPUTE WS-NUM = FUNCTION MEAN(2.6 + 30, 4.5 * 2).           IF1204.2 45 IFN
   000627         065000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1204.2 45 46
   000628         065100        (WS-NUM <= MAX-RANGE) THEN                                IF1204.2 45 47
   000629      1  065200                    PERFORM PASS                                  IF1204.2 232
   000630         065300     ELSE                                                         IF1204.2
   000631      1  065400                    MOVE WS-NUM TO COMPUTED-N                     IF1204.2 45 68
   000632      1  065500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1204.2 46 96
   000633      1  065600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1204.2 47 110
   000634      1  065700                    PERFORM FAIL.                                 IF1204.2 233
   000635         065800     GO TO F-MEAN-WRITE-17.                                       IF1204.2 639
   000636         065900 F-MEAN-DELETE-17.                                                IF1204.2
   000637         066000     PERFORM  DE-LETE.                                            IF1204.2 234
   000638         066100     GO TO    F-MEAN-WRITE-17.                                    IF1204.2 639
   000639         066200 F-MEAN-WRITE-17.                                                 IF1204.2
   000640         066300     MOVE "F-MEAN-17" TO PAR-NAME.                                IF1204.2 56
   000641         066400     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000642         066600 F-MEAN-18.                                                       IF1204.2
   000643         066700     MOVE ZERO TO WS-NUM.                                         IF1204.2 IMP 45
   000644         066800     PERFORM F-MEAN-TEST-18                                       IF1204.2 648
   000645         066900       UNTIL FUNCTION MEAN(ARG1, ARG2) > 8.                       IF1204.2 IFN 40 41
   000646         067000     PERFORM PASS.                                                IF1204.2 232
   000647         067100     GO TO F-MEAN-WRITE-18.                                       IF1204.2 654
   000648         067200 F-MEAN-TEST-18.                                                  IF1204.2
   000649         067300     COMPUTE ARG1 = ARG1 + 1.                                     IF1204.2 40 40
   000650         067400     COMPUTE ARG2 = ARG2 + 1.                                     IF1204.2 41 41
   000651         067500 F-MEAN-DELETE-18.                                                IF1204.2
   000652         067600     PERFORM  DE-LETE.                                            IF1204.2 234
   000653         067700     GO TO    F-MEAN-WRITE-18.                                    IF1204.2 654
   000654         067800 F-MEAN-WRITE-18.                                                 IF1204.2
   000655         067900     MOVE "F-MEAN-18" TO PAR-NAME.                                IF1204.2 56
   000656         068000     PERFORM  PRINT-DETAIL.                                       IF1204.2 236
   000657         068200 CCVS-EXIT SECTION.                                               IF1204.2
   000658         068300 CCVS-999999.                                                     IF1204.2
   000659         068400     GO TO CLOSE-FILES.                                           IF1204.2 227
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  382 383 433 522 522 541 562 583
      140   ANSI-REFERENCE . . . . . . . .  314 321 337 M348
       40   ARG1 . . . . . . . . . . . . .  645 M649 649
       41   ARG2 . . . . . . . . . . . . .  645 M650 650
       42   ARR
       27   B. . . . . . . . . . . . . . .  382 383 433 541 562 583
       28   C. . . . . . . . . . . . . . .  382 383 433
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
       68   COMPUTED-N . . . . . . . . . .  M358 M402 M420 M438 M456 M474 M492 M509 M526 M546 M567 M589 M610 M631
       66   COMPUTED-X . . . . . . . . . .  M244 311
       70   COMPUTED-0V18
       72   COMPUTED-14V4
       74   COMPUTED-18V0
       71   COMPUTED-4V14
       90   COR-ANSI-REFERENCE . . . . . .  M321 M329
      118   CORMA-ANSI-REFERENCE . . . . .  M322
       81   CORRECT-A. . . . . . . . . . .  82 83 84 85 86 333 335
      110   CORRECT-MAX. . . . . . . . . .  M548 M569 M591 M612 M633
       96   CORRECT-MIN. . . . . . . . . .  323 M547 M568 M590 M611 M632
       82   CORRECT-N. . . . . . . . . . .  M359 M403 M421 M439 M457 M475 M493 M510 M527
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    16
0 Defined   Cross-reference of data names   References

0     114   CR-18V0
       29   D. . . . . . . . . . . . . . .  382 383 433
      132   DELETE-COUNTER . . . . . . . .  M234 263 278 280
       59   DOTVALUE . . . . . . . . . . .  M239
      138   DUMMY-HOLD . . . . . . . . . .  M292 302
       23   DUMMY-RECORD . . . . . . . . .  M249 M250 M251 M252 M254 M255 M256 M258 M260 M268 M275 M282 M287 M288 292 M293
                                            294 M295 M296 M297 M298 M299 M300 M301 M302 306 M307 M316 M338
       30   E. . . . . . . . . . . . . . .  397 433 541
      185   ENDER-DESC . . . . . . . . . .  M270 M281 M286
      133   ERROR-COUNTER. . . . . . . . .  M233 262 271 274
      137   ERROR-HOLD . . . . . . . . . .  M262 M263 M263 M264 266
      183   ERROR-TOTAL. . . . . . . . . .  M272 M274 M279 M280 M284 M285
       31   F. . . . . . . . . . . . . . .  397 433
       52   FEATURE. . . . . . . . . . . .  M349
       32   G. . . . . . . . . . . . . . .  397 433
       33   H. . . . . . . . . . . . . . .  397 433
      211   HYPHEN-LINE. . . . . . . . . .  256 258 301
      177   ID-AGAIN . . . . . . . . . . .  M223
       43   IND. . . . . . . . . . . . . .  451 451 451 469 469 469 487
      210   INF-ANSI-REFERENCE . . . . . .  M314 M317 M337 M339
      205   INFO-TEXT. . . . . . . . . . .  M315
      134   INSPECT-COUNTER. . . . . . . .  M231 262 283 285
       34   M. . . . . . . . . . . . . . .  505
       47   MAX-RANGE. . . . . . . . . . .  M539 543 548 M560 564 569 M581 586 591 M603 607 612 M624 628 633
       46   MIN-RANGE. . . . . . . . . . .  M538 542 547 M559 563 568 M580 585 590 M602 606 611 M623 627 632
       35   N. . . . . . . . . . . . . . .  505
       36   O. . . . . . . . . . . . . . .  505
       37   P. . . . . . . . . . . . . . .  469
       54   P-OR-F . . . . . . . . . . . .  M231 M232 M233 M234 241 M244
       56   PAR-NAME . . . . . . . . . . .  M246 M366 M379 M392 M410 M428 M446 M464 M482 M500 M517 M534 M555 M576 M598 M619
                                            M640 M655
       58   PARDOT-X . . . . . . . . . . .  M238
      135   PASS-COUNTER . . . . . . . . .  M232 264 265
       21   PRINT-FILE . . . . . . . . . .  17 222 228
       22   PRINT-REC. . . . . . . . . . .  M240 M320 M324 M325 M327
       38   Q. . . . . . . . . . . . . . .  469
       39   R. . . . . . . . . . . . . . .  469
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
       45   WS-NUM . . . . . . . . . . . .  M351 M353 354 355 358 M395 M397 398 399 402 M413 M415 416 417 420 M431 M433 434
                                            435 438 M449 M451 452 453 456 M467 M469 470 471 474 M485 M487 488 489 492 M503
                                            M505 506 509 M520 M522 523 526 M537 M541 542 543 546 M558 M562 563 564 567 M579
                                            M583 585 586 589 M601 M605 606 607 610 M622 M626 627 628 631 M643
      207   XXCOMPUTED . . . . . . . . . .  M336
      209   XXCORRECT. . . . . . . . . . .  M335
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    17
0 Defined   Cross-reference of data names   References

0     202   XXINFO . . . . . . . . . . . .  316 338
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    18
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
      657   CCVS-EXIT
      658   CCVS-999999
      220   CCVS1
      341   CCVS1-EXIT . . . . . . . . . .  G226
      227   CLOSE-FILES. . . . . . . . . .  G659
      253   COLUMN-NAMES-ROUTINE . . . . .  E225
      234   DE-LETE. . . . . . . . . . . .  P363 P376 P389 P407 P425 P443 P461 P479 P497 P514 P531 P552 P573 P595 P616 P637
                                            P652
      257   END-ROUTINE. . . . . . . . . .  P228
      261   END-ROUTINE-1
      269   END-ROUTINE-12
      277   END-ROUTINE-13 . . . . . . . .  E228
      259   END-RTN-EXIT
      362   F-MEAN-DELETE-01
      375   F-MEAN-DELETE-02
      388   F-MEAN-DELETE-03
      406   F-MEAN-DELETE-04
      424   F-MEAN-DELETE-05
      442   F-MEAN-DELETE-06
      460   F-MEAN-DELETE-07
      478   F-MEAN-DELETE-08
      496   F-MEAN-DELETE-09
      513   F-MEAN-DELETE-11
      530   F-MEAN-DELETE-12
      551   F-MEAN-DELETE-13
      572   F-MEAN-DELETE-14
      594   F-MEAN-DELETE-15
      615   F-MEAN-DELETE-16
      636   F-MEAN-DELETE-17
      651   F-MEAN-DELETE-18
      347   F-MEAN-TEST-INFO
      352   F-MEAN-TEST-01
      396   F-MEAN-TEST-04
      414   F-MEAN-TEST-05
      432   F-MEAN-TEST-06
      450   F-MEAN-TEST-07
      468   F-MEAN-TEST-08
      486   F-MEAN-TEST-09
      504   F-MEAN-TEST-11
      521   F-MEAN-TEST-12
      540   F-MEAN-TEST-13
      561   F-MEAN-TEST-14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    19
0 Defined   Cross-reference of procedures   References

0     582   F-MEAN-TEST-15
      604   F-MEAN-TEST-16
      625   F-MEAN-TEST-17
      648   F-MEAN-TEST-18 . . . . . . . .  P644
      365   F-MEAN-WRITE-01. . . . . . . .  G361 G364
      378   F-MEAN-WRITE-02. . . . . . . .  G374 G377
      391   F-MEAN-WRITE-03. . . . . . . .  G387 G390
      409   F-MEAN-WRITE-04. . . . . . . .  G405 G408
      427   F-MEAN-WRITE-05. . . . . . . .  G423 G426
      445   F-MEAN-WRITE-06. . . . . . . .  G441 G444
      463   F-MEAN-WRITE-07. . . . . . . .  G459 G462
      481   F-MEAN-WRITE-08. . . . . . . .  G477 G480
      499   F-MEAN-WRITE-09. . . . . . . .  G495 G498
      516   F-MEAN-WRITE-11. . . . . . . .  G512 G515
      533   F-MEAN-WRITE-12. . . . . . . .  G529 G532
      554   F-MEAN-WRITE-13. . . . . . . .  G550 G553
      575   F-MEAN-WRITE-14. . . . . . . .  G571 G574
      597   F-MEAN-WRITE-15. . . . . . . .  G593 G596
      618   F-MEAN-WRITE-16. . . . . . . .  G614 G617
      639   F-MEAN-WRITE-17. . . . . . . .  G635 G638
      654   F-MEAN-WRITE-18. . . . . . . .  G647 G653
      350   F-MEAN-01
      368   F-MEAN-02
      381   F-MEAN-03
      394   F-MEAN-04
      412   F-MEAN-05
      430   F-MEAN-06
      448   F-MEAN-07
      466   F-MEAN-08
      484   F-MEAN-09
      502   F-MEAN-11
      519   F-MEAN-12
      536   F-MEAN-13
      557   F-MEAN-14
      578   F-MEAN-15
      600   F-MEAN-16
      621   F-MEAN-17
      642   F-MEAN-18
      233   FAIL . . . . . . . . . . . . .  P360 P373 P386 P404 P422 P440 P458 P476 P494 P511 P528 P549 P570 P592 P613 P634
      310   FAIL-ROUTINE . . . . . . . . .  P242
      330   FAIL-ROUTINE-EX. . . . . . . .  E242 G318
      319   FAIL-ROUTINE-WRITE . . . . . .  G312 G313
      248   HEAD-ROUTINE . . . . . . . . .  P225
      231   INSPT
      221   OPEN-FILES
      232   PASS . . . . . . . . . . . . .  P356 P371 P384 P400 P418 P436 P454 P472 P490 P507 P524 P544 P565 P587 P608 P629
                                            P646
      236   PRINT-DETAIL . . . . . . . . .  P367 P380 P393 P411 P429 P447 P465 P483 P501 P518 P535 P556 P577 P599 P620 P641
                                            P656
      346   SECT-IF120A
      229   TERMINATE-CCVS
      289   WRITE-LINE . . . . . . . . . .  P240 P241 P249 P250 P251 P252 P254 P255 P256 P258 P260 P268 P276 P282 P287 P288
                                            P316 P320 P324 P325 P327 P328 P338
      305   WRT-LN . . . . . . . . . . . .  P295 P296 P297 P298 P299 P300 P301 P304 P309
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    20
0 Defined   Cross-reference of programs     References

        3   IF120A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF120A    Date 06/04/2022  Time 11:58:42   Page    21
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF120A:
 *    Source records = 659
 *    Data Division statements = 104
 *    Procedure Division statements = 352
 *    Generated COBOL statements = 0
 *    Program complexity factor = 364
0End of compilation 1,  program IF120A,  highest severity 0.
0Return code 0
