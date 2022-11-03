1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:23   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:23   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1324.2
   000002         000200 PROGRAM-ID.                                                      IF1324.2
   000003         000300     IF132A.                                                      IF1324.2
   000004         000400                                                                  IF1324.2
   000005         000600*                                                         *       IF1324.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1324.2
   000007         000800* It contains tests for the Intrinsic Function RANGE.     *       IF1324.2
   000008         000900*                                                         *       IF1324.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1324.2
   000010         001200 CONFIGURATION SECTION.                                           IF1324.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1324.2
   000012         001400     XXXXX082.                                                    IF1324.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1324.2
   000014         001600     XXXXX083.                                                    IF1324.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1324.2
   000016         001800 FILE-CONTROL.                                                    IF1324.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1324.2 21
   000018         002000     XXXXX055.                                                    IF1324.2
   000019         002100 DATA DIVISION.                                                   IF1324.2
   000020         002200 FILE SECTION.                                                    IF1324.2
   000021         002300 FD  PRINT-FILE.                                                  IF1324.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1324.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1324.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1324.2
   000025         002800* Variables specific to the Intrinsic Function Test IF132A*       IF1324.2
   000026         003000 01  A                   PIC S9(10)          VALUE 5.             IF1324.2
   000027         003100 01  B                   PIC S9(10)          VALUE 7.             IF1324.2
   000028         003200 01  C                   PIC S9(10)          VALUE -4.            IF1324.2
   000029         003300 01  D                   PIC S9(10)          VALUE 10.            IF1324.2
   000030         003400 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1324.2
   000031         003500 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1324.2
   000032         003600 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1324.2
   000033         003700 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1324.2
   000034         003800 01  M                   PIC S9(10)          VALUE 320000.        IF1324.2
   000035         003900 01  N                   PIC S9(10)          VALUE 650000.        IF1324.2
   000036         004000 01  O                   PIC S9(10)          VALUE -430000.       IF1324.2
   000037         004100 01  P                   PIC S9(10)          VALUE 1.             IF1324.2
   000038         004200 01  Q                   PIC S9(10)          VALUE 3.             IF1324.2
   000039         004300 01  R                   PIC S9(10)          VALUE 5.             IF1324.2
   000040         004400 01  ARG1                PIC S9(10)          VALUE 2.             IF1324.2
   000041         004500 01  ARR                                     VALUE "40537".       IF1324.2
   000042         004600     02  IND OCCURS 5 TIMES PIC 9.                                IF1324.2
   000043         004700 01  TEMP                PIC S9(10).                              IF1324.2
   000044         004800 01  WS-NUM              PIC S9(7)V9(7).                          IF1324.2
   000045         004900 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1324.2
   000046         005000 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1324.2
   000047         005100*                                                                 IF1324.2
   000048         005300*                                                                 IF1324.2
   000049         005400 01  TEST-RESULTS.                                                IF1324.2
   000050         005500     02 FILLER                   PIC X      VALUE SPACE.          IF1324.2 IMP
   000051         005600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1324.2 IMP
   000052         005700     02 FILLER                   PIC X      VALUE SPACE.          IF1324.2 IMP
   000053         005800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1324.2 IMP
   000054         005900     02 FILLER                   PIC X      VALUE SPACE.          IF1324.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02  PAR-NAME.                                                IF1324.2
   000056         006100       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1324.2 IMP
   000057         006200       03  PARDOT-X              PIC X      VALUE SPACE.          IF1324.2 IMP
   000058         006300       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1324.2 IMP
   000059         006400     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1324.2 IMP
   000060         006500     02 RE-MARK                  PIC X(61).                       IF1324.2
   000061         006600 01  TEST-COMPUTED.                                               IF1324.2
   000062         006700     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1324.2 IMP
   000063         006800     02 FILLER                   PIC X(17)  VALUE                 IF1324.2
   000064         006900            "       COMPUTED=".                                   IF1324.2
   000065         007000     02 COMPUTED-X.                                               IF1324.2
   000066         007100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1324.2 IMP
   000067         007200     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1324.2 66
   000068         007300                                 PIC -9(9).9(9).                  IF1324.2
   000069         007400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1324.2 66
   000070         007500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1324.2 66
   000071         007600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1324.2 66
   000072         007700     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1324.2 66
   000073         007800         04 COMPUTED-18V0                    PIC -9(18).          IF1324.2
   000074         007900         04 FILLER                           PIC X.               IF1324.2
   000075         008000     03 FILLER PIC X(50) VALUE SPACE.                             IF1324.2 IMP
   000076         008100 01  TEST-CORRECT.                                                IF1324.2
   000077         008200     02 FILLER PIC X(30) VALUE SPACE.                             IF1324.2 IMP
   000078         008300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1324.2
   000079         008400     02 CORRECT-X.                                                IF1324.2
   000080         008500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1324.2 IMP
   000081         008600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1324.2 80
   000082         008700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1324.2 80
   000083         008800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1324.2 80
   000084         008900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1324.2 80
   000085         009000     03      CR-18V0 REDEFINES CORRECT-A.                         IF1324.2 80
   000086         009100         04 CORRECT-18V0                     PIC -9(18).          IF1324.2
   000087         009200         04 FILLER                           PIC X.               IF1324.2
   000088         009300     03 FILLER PIC X(2) VALUE SPACE.                              IF1324.2 IMP
   000089         009400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1324.2 IMP
   000090         009500 01  TEST-CORRECT-MIN.                                            IF1324.2
   000091         009600     02 FILLER PIC X(30) VALUE SPACE.                             IF1324.2 IMP
   000092         009700     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1324.2
   000093         009800     02 CORRECTMI-X.                                              IF1324.2
   000094         009900     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1324.2 IMP
   000095         010000     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1324.2 94
   000096         010100     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1324.2 94
   000097         010200     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1324.2 94
   000098         010300     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1324.2 94
   000099         010400     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1324.2 94
   000100         010500         04 CORRECTMI-18V0                     PIC -9(18).        IF1324.2
   000101         010600         04 FILLER                           PIC X.               IF1324.2
   000102         010700     03 FILLER PIC X(2) VALUE SPACE.                              IF1324.2 IMP
   000103         010800     03 FILLER                           PIC X(48) VALUE SPACE.   IF1324.2 IMP
   000104         010900 01  TEST-CORRECT-MAX.                                            IF1324.2
   000105         011000     02 FILLER PIC X(30) VALUE SPACE.                             IF1324.2 IMP
   000106         011100     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1324.2
   000107         011200     02 CORRECTMA-X.                                              IF1324.2
   000108         011300     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1324.2 IMP
   000109         011400     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1324.2 108
   000110         011500     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1324.2 108
   000111         011600     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1324.2 108
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1324.2 108
   000113         011800     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1324.2 108
   000114         011900         04 CORRECTMA-18V0                     PIC -9(18).        IF1324.2
   000115         012000         04 FILLER                           PIC X.               IF1324.2
   000116         012100     03 FILLER PIC X(2) VALUE SPACE.                              IF1324.2 IMP
   000117         012200     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1324.2 IMP
   000118         012300 01  CCVS-C-1.                                                    IF1324.2
   000119         012400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1324.2
   000120         012500-    "SS  PARAGRAPH-NAME                                          IF1324.2
   000121         012600-    "       REMARKS".                                            IF1324.2
   000122         012700     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1324.2 IMP
   000123         012800 01  CCVS-C-2.                                                    IF1324.2
   000124         012900     02 FILLER                     PIC X        VALUE SPACE.      IF1324.2 IMP
   000125         013000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1324.2
   000126         013100     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1324.2 IMP
   000127         013200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1324.2
   000128         013300     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1324.2 IMP
   000129         013400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1324.2 IMP
   000130         013500 01  REC-CT                        PIC 99       VALUE ZERO.       IF1324.2 IMP
   000131         013600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1324.2 IMP
   000132         013700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1324.2 IMP
   000133         013800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1324.2 IMP
   000134         013900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1324.2 IMP
   000135         014000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1324.2 IMP
   000136         014100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1324.2 IMP
   000137         014200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1324.2 IMP
   000138         014300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1324.2 IMP
   000139         014400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1324.2 IMP
   000140         014500 01  CCVS-H-1.                                                    IF1324.2
   000141         014600     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1324.2 IMP
   000142         014700     02  FILLER                    PIC X(42)    VALUE             IF1324.2
   000143         014800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1324.2
   000144         014900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1324.2 IMP
   000145         015000 01  CCVS-H-2A.                                                   IF1324.2
   000146         015100   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1324.2 IMP
   000147         015200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1324.2
   000148         015300   02  FILLER                        PIC XXXX   VALUE             IF1324.2
   000149         015400     "4.2 ".                                                      IF1324.2
   000150         015500   02  FILLER                        PIC X(28)  VALUE             IF1324.2
   000151         015600            " COPY - NOT FOR DISTRIBUTION".                       IF1324.2
   000152         015700   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1324.2 IMP
   000153         015800                                                                  IF1324.2
   000154         015900 01  CCVS-H-2B.                                                   IF1324.2
   000155         016000   02  FILLER                        PIC X(15)  VALUE             IF1324.2
   000156         016100            "TEST RESULT OF ".                                    IF1324.2
   000157         016200   02  TEST-ID                       PIC X(9).                    IF1324.2
   000158         016300   02  FILLER                        PIC X(4)   VALUE             IF1324.2
   000159         016400            " IN ".                                               IF1324.2
   000160         016500   02  FILLER                        PIC X(12)  VALUE             IF1324.2
   000161         016600     " HIGH       ".                                              IF1324.2
   000162         016700   02  FILLER                        PIC X(22)  VALUE             IF1324.2
   000163         016800            " LEVEL VALIDATION FOR ".                             IF1324.2
   000164         016900   02  FILLER                        PIC X(58)  VALUE             IF1324.2
   000165         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1324.2
   000166         017100 01  CCVS-H-3.                                                    IF1324.2
   000167         017200     02  FILLER                      PIC X(34)  VALUE             IF1324.2
   000168         017300            " FOR OFFICIAL USE ONLY    ".                         IF1324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02  FILLER                      PIC X(58)  VALUE             IF1324.2
   000170         017500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1324.2
   000171         017600     02  FILLER                      PIC X(28)  VALUE             IF1324.2
   000172         017700            "  COPYRIGHT   1985 ".                                IF1324.2
   000173         017800 01  CCVS-E-1.                                                    IF1324.2
   000174         017900     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1324.2 IMP
   000175         018000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1324.2
   000176         018100     02 ID-AGAIN                     PIC X(9).                    IF1324.2
   000177         018200     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1324.2 IMP
   000178         018300 01  CCVS-E-2.                                                    IF1324.2
   000179         018400     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1324.2 IMP
   000180         018500     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1324.2 IMP
   000181         018600     02 CCVS-E-2-2.                                               IF1324.2
   000182         018700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1324.2 IMP
   000183         018800         03 FILLER                   PIC X      VALUE SPACE.      IF1324.2 IMP
   000184         018900         03 ENDER-DESC               PIC X(44)  VALUE             IF1324.2
   000185         019000            "ERRORS ENCOUNTERED".                                 IF1324.2
   000186         019100 01  CCVS-E-3.                                                    IF1324.2
   000187         019200     02  FILLER                      PIC X(22)  VALUE             IF1324.2
   000188         019300            " FOR OFFICIAL USE ONLY".                             IF1324.2
   000189         019400     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1324.2 IMP
   000190         019500     02  FILLER                      PIC X(58)  VALUE             IF1324.2
   000191         019600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1324.2
   000192         019700     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1324.2 IMP
   000193         019800     02 FILLER                       PIC X(15)  VALUE             IF1324.2
   000194         019900             " COPYRIGHT 1985".                                   IF1324.2
   000195         020000 01  CCVS-E-4.                                                    IF1324.2
   000196         020100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1324.2 IMP
   000197         020200     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1324.2
   000198         020300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1324.2 IMP
   000199         020400     02 FILLER                       PIC X(40)  VALUE             IF1324.2
   000200         020500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1324.2
   000201         020600 01  XXINFO.                                                      IF1324.2
   000202         020700     02 FILLER                       PIC X(19)  VALUE             IF1324.2
   000203         020800            "*** INFORMATION ***".                                IF1324.2
   000204         020900     02 INFO-TEXT.                                                IF1324.2
   000205         021000       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1324.2 IMP
   000206         021100       04 XXCOMPUTED                 PIC X(20).                   IF1324.2
   000207         021200       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1324.2 IMP
   000208         021300       04 XXCORRECT                  PIC X(20).                   IF1324.2
   000209         021400     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1324.2
   000210         021500 01  HYPHEN-LINE.                                                 IF1324.2
   000211         021600     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1324.2 IMP
   000212         021700     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1324.2
   000213         021800-    "*****************************************".                 IF1324.2
   000214         021900     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1324.2
   000215         022000-    "******************************".                            IF1324.2
   000216         022100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1324.2
   000217         022200     "IF132A".                                                    IF1324.2
   000218         022300 PROCEDURE DIVISION.                                              IF1324.2
   000219         022400 CCVS1 SECTION.                                                   IF1324.2
   000220         022500 OPEN-FILES.                                                      IF1324.2
   000221         022600     OPEN     OUTPUT PRINT-FILE.                                  IF1324.2 21
   000222         022700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1324.2 216 157 216 176
   000223         022800     MOVE    SPACE TO TEST-RESULTS.                               IF1324.2 IMP 49
   000224         022900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1324.2 247 252
   000225         023000     GO TO CCVS1-EXIT.                                            IF1324.2 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 CLOSE-FILES.                                                     IF1324.2
   000227         023200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1324.2 256 276 21
   000228         023300 TERMINATE-CCVS.                                                  IF1324.2
   000229         023400     STOP     RUN.                                                IF1324.2
   000230         023500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1324.2 53 133
   000231         023600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1324.2 53 134
   000232         023700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1324.2 53 132
   000233         023800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1324.2 53 131
   000234         023900     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1324.2 60
   000235         024000 PRINT-DETAIL.                                                    IF1324.2
   000236         024100     IF REC-CT NOT EQUAL TO ZERO                                  IF1324.2 130 IMP
   000237      1  024200             MOVE "." TO PARDOT-X                                 IF1324.2 57
   000238      1  024300             MOVE REC-CT TO DOTVALUE.                             IF1324.2 130 58
   000239         024400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1324.2 49 22 288
   000240         024500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1324.2 53 288
   000241      1  024600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1324.2 309 329
   000242      1  024700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1324.2 330 339
   000243         024800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1324.2 IMP 53 IMP 65
   000244         024900     MOVE SPACE TO CORRECT-X.                                     IF1324.2 IMP 79
   000245         025000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1324.2 130 IMP IMP 55
   000246         025100     MOVE     SPACE TO RE-MARK.                                   IF1324.2 IMP 60
   000247         025200 HEAD-ROUTINE.                                                    IF1324.2
   000248         025300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1324.2 140 23 288
   000249         025400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1324.2 145 23 288
   000250         025500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1324.2 154 23 288
   000251         025600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1324.2 166 23 288
   000252         025700 COLUMN-NAMES-ROUTINE.                                            IF1324.2
   000253         025800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1324.2 118 23 288
   000254         025900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1324.2 123 23 288
   000255         026000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1324.2 210 23 288
   000256         026100 END-ROUTINE.                                                     IF1324.2
   000257         026200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1324.2 210 23 288
   000258         026300 END-RTN-EXIT.                                                    IF1324.2
   000259         026400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1324.2 173 23 288
   000260         026500 END-ROUTINE-1.                                                   IF1324.2
   000261         026600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1324.2 132 136 133
   000262         026700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1324.2 136 131 136
   000263         026800      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1324.2 134 136
   000264         026900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1324.2 134 196
   000265         027000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1324.2 136 198
   000266         027100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1324.2 195 181
   000267         027200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1324.2 178 23 288
   000268         027300  END-ROUTINE-12.                                                 IF1324.2
   000269         027400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1324.2 184
   000270         027500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1324.2 132 IMP
   000271      1  027600         MOVE "NO " TO ERROR-TOTAL                                IF1324.2 182
   000272         027700         ELSE                                                     IF1324.2
   000273      1  027800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1324.2 132 182
   000274         027900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1324.2 178 23
   000275         028000     PERFORM WRITE-LINE.                                          IF1324.2 288
   000276         028100 END-ROUTINE-13.                                                  IF1324.2
   000277         028200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1324.2 131 IMP
   000278      1  028300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1324.2 182
   000279      1  028400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1324.2 131 182
   000280         028500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1324.2 184
   000281         028600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1324.2 178 23 288
   000282         028700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1324.2 133 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800          MOVE "NO " TO ERROR-TOTAL                               IF1324.2 182
   000284      1  028900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1324.2 133 182
   000285         029000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1324.2 184
   000286         029100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1324.2 178 23 288
   000287         029200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1324.2 186 23 288
   000288         029300 WRITE-LINE.                                                      IF1324.2
   000289         029400     ADD 1 TO RECORD-COUNT.                                       IF1324.2 138
   000290         029500     IF RECORD-COUNT GREATER 42                                   IF1324.2 138
   000291      1  029600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1324.2 23 137
   000292      1  029700         MOVE SPACE TO DUMMY-RECORD                               IF1324.2 IMP 23
   000293      1  029800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1324.2 23
   000294      1  029900         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1324.2 140 23 304
   000295      1  030000         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1324.2 145 23 304
   000296      1  030100         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1324.2 154 23 304
   000297      1  030200         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1324.2 166 23 304
   000298      1  030300         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1324.2 118 23 304
   000299      1  030400         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1324.2 123 23 304
   000300      1  030500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1324.2 210 23 304
   000301      1  030600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1324.2 137 23
   000302      1  030700         MOVE ZERO TO RECORD-COUNT.                               IF1324.2 IMP 138
   000303         030800     PERFORM WRT-LN.                                              IF1324.2 304
   000304         030900 WRT-LN.                                                          IF1324.2
   000305         031000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1324.2 23
   000306         031100     MOVE SPACE TO DUMMY-RECORD.                                  IF1324.2 IMP 23
   000307         031200 BLANK-LINE-PRINT.                                                IF1324.2
   000308         031300     PERFORM WRT-LN.                                              IF1324.2 304
   000309         031400 FAIL-ROUTINE.                                                    IF1324.2
   000310         031500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1324.2 65 IMP
   000311      1  031600            GO TO FAIL-ROUTINE-WRITE.                             IF1324.2 318
   000312         031700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1324.2 79 IMP 318
   000313         031800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1324.2 139 209
   000314         031900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1324.2 204
   000315         032000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1324.2 201 23 288
   000316         032100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1324.2 IMP 209
   000317         032200     GO TO  FAIL-ROUTINE-EX.                                      IF1324.2 329
   000318         032300 FAIL-ROUTINE-WRITE.                                              IF1324.2
   000319         032400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1324.2 61 22 288
   000320         032500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1324.2 139 89
   000321         032600                              CORMA-ANSI-REFERENCE.               IF1324.2 117
   000322         032700     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1324.2 95 IMP
   000323      1  032800           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1324.2 90 22 288
   000324      1  032900           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1324.2 104 22 288
   000325         033000     ELSE                                                         IF1324.2
   000326      1  033100           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1324.2 76 22 288
   000327         033200     PERFORM WRITE-LINE.                                          IF1324.2 288
   000328         033300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1324.2 IMP 89
   000329         033400 FAIL-ROUTINE-EX. EXIT.                                           IF1324.2
   000330         033500 BAIL-OUT.                                                        IF1324.2
   000331         033600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1324.2 66 IMP 333
   000332         033700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1324.2 80 IMP 339
   000333         033800 BAIL-OUT-WRITE.                                                  IF1324.2
   000334         033900     MOVE CORRECT-A TO XXCORRECT.                                 IF1324.2 80 208
   000335         034000     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1324.2 66 206
   000336         034100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1324.2 139 209
   000337         034200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1324.2 201 23 288
   000338         034300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1324.2 IMP 209
   000339         034400 BAIL-OUT-EX. EXIT.                                               IF1324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034500 CCVS1-EXIT.                                                      IF1324.2
   000341         034600     EXIT.                                                        IF1324.2
   000342         034800*                                                      *          IF1324.2
   000343         034900*    Intrinsic Function Tests         IF132A - RANGE   *          IF1324.2
   000344         035000*                                                      *          IF1324.2
   000345         035200 SECT-IF132A SECTION.                                             IF1324.2
   000346         035300 F-RANGE-INFO.                                                    IF1324.2
   000347         035400     MOVE     "See ref. A-65 2.65" TO ANSI-REFERENCE.             IF1324.2 139
   000348         035500     MOVE     "RANGE Function" TO FEATURE.                        IF1324.2 51
   000349         035700 F-RANGE-01.                                                      IF1324.2
   000350         035800     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000351         035900 F-RANGE-TEST-01.                                                 IF1324.2
   000352         036000     COMPUTE WS-NUM = FUNCTION RANGE(5, -2, -14, 0).              IF1324.2 44 IFN
   000353         036100     IF WS-NUM = 19 THEN                                          IF1324.2 44
   000354      1  036200                    PERFORM PASS                                  IF1324.2 231
   000355         036300     ELSE                                                         IF1324.2
   000356      1  036400                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000357      1  036500                    MOVE 19 TO CORRECT-N                          IF1324.2 81
   000358      1  036600                    PERFORM FAIL.                                 IF1324.2 232
   000359         036700     GO TO F-RANGE-WRITE-01.                                      IF1324.2 363
   000360         036800 F-RANGE-DELETE-01.                                               IF1324.2
   000361         036900     PERFORM  DE-LETE.                                            IF1324.2 233
   000362         037000     GO TO    F-RANGE-WRITE-01.                                   IF1324.2 363
   000363         037100 F-RANGE-WRITE-01.                                                IF1324.2
   000364         037200     MOVE "F-RANGE-01" TO PAR-NAME.                               IF1324.2 55
   000365         037300     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000366         037500 F-RANGE-02.                                                      IF1324.2
   000367         037600     EVALUATE FUNCTION RANGE(3.9, -0.3, 8.7, 100.2)               IF1324.2 IFN
   000368         037700     WHEN 100.498 THRU 100.502                                    IF1324.2
   000369      1  037800                    PERFORM PASS                                  IF1324.2 231
   000370         037900     WHEN OTHER                                                   IF1324.2
   000371      1  038000                    PERFORM FAIL.                                 IF1324.2 232
   000372         038100     GO TO F-RANGE-WRITE-02.                                      IF1324.2 376
   000373         038200 F-RANGE-DELETE-02.                                               IF1324.2
   000374         038300     PERFORM  DE-LETE.                                            IF1324.2 233
   000375         038400     GO TO    F-RANGE-WRITE-02.                                   IF1324.2 376
   000376         038500 F-RANGE-WRITE-02.                                                IF1324.2
   000377         038600     MOVE "F-RANGE-02" TO PAR-NAME.                               IF1324.2 55
   000378         038700     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000379         038900 F-RANGE-03.                                                      IF1324.2
   000380         039000     IF FUNCTION RANGE(A, B, C, D) = 14 THEN                      IF1324.2 IFN 26 27 28 29
   000381      1  039100                    PERFORM PASS                                  IF1324.2 231
   000382         039200     ELSE                                                         IF1324.2
   000383      1  039300                    PERFORM FAIL.                                 IF1324.2 232
   000384         039400     GO TO F-RANGE-WRITE-03.                                      IF1324.2 388
   000385         039500 F-RANGE-DELETE-03.                                               IF1324.2
   000386         039600     PERFORM  DE-LETE.                                            IF1324.2 233
   000387         039700     GO TO    F-RANGE-WRITE-03.                                   IF1324.2 388
   000388         039800 F-RANGE-WRITE-03.                                                IF1324.2
   000389         039900     MOVE "F-RANGE-03" TO PAR-NAME.                               IF1324.2 55
   000390         040000     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000391         040200 F-RANGE-04.                                                      IF1324.2
   000392         040300     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000393         040400 F-RANGE-TEST-04.                                                 IF1324.2
   000394         040500     COMPUTE WS-NUM = FUNCTION RANGE(E, F, G).                    IF1324.2 44 IFN 30 31 32
   000395         040600     IF (WS-NUM >= 42.5791) AND                                   IF1324.2 44
   000396         040700        (WS-NUM <= 42.5809)                                       IF1324.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040800                    PERFORM PASS                                  IF1324.2 231
   000398         040900     ELSE                                                         IF1324.2
   000399      1  041000                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000400      1  041100                    MOVE 42.58 TO CORRECT-N                       IF1324.2 81
   000401      1  041200                    PERFORM FAIL.                                 IF1324.2 232
   000402         041300     GO TO F-RANGE-WRITE-04.                                      IF1324.2 406
   000403         041400 F-RANGE-DELETE-04.                                               IF1324.2
   000404         041500     PERFORM  DE-LETE.                                            IF1324.2 233
   000405         041600     GO TO    F-RANGE-WRITE-04.                                   IF1324.2 406
   000406         041700 F-RANGE-WRITE-04.                                                IF1324.2
   000407         041800     MOVE "F-RANGE-04" TO PAR-NAME.                               IF1324.2 55
   000408         041900     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000409         042100 F-RANGE-05.                                                      IF1324.2
   000410         042200     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000411         042300 F-RANGE-TEST-05.                                                 IF1324.2
   000412         042400     COMPUTE WS-NUM = FUNCTION RANGE(10.2 -0.2, 5.6, -15.6).      IF1324.2 44 IFN
   000413         042500     IF (WS-NUM >= 25.7995) AND                                   IF1324.2 44
   000414         042600        (WS-NUM <= 25.8005)                                       IF1324.2 44
   000415      1  042700                    PERFORM PASS                                  IF1324.2 231
   000416         042800     ELSE                                                         IF1324.2
   000417      1  042900                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000418      1  043000                    MOVE 25.8 TO CORRECT-N                        IF1324.2 81
   000419      1  043100                    PERFORM FAIL.                                 IF1324.2 232
   000420         043200     GO TO F-RANGE-WRITE-05.                                      IF1324.2 424
   000421         043300 F-RANGE-DELETE-05.                                               IF1324.2
   000422         043400     PERFORM  DE-LETE.                                            IF1324.2 233
   000423         043500     GO TO    F-RANGE-WRITE-05.                                   IF1324.2 424
   000424         043600 F-RANGE-WRITE-05.                                                IF1324.2
   000425         043700     MOVE "F-RANGE-05" TO PAR-NAME.                               IF1324.2 55
   000426         043800     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000427         044000 F-RANGE-06.                                                      IF1324.2
   000428         044100     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000429         044200 F-RANGE-TEST-06.                                                 IF1324.2
   000430         044300     COMPUTE WS-NUM = FUNCTION RANGE(A, B, C, D, E, F, G).        IF1324.2 44 IFN 26 27 28 29 30 31 32
   000431         044400     IF (WS-NUM >= 42.5791) AND                                   IF1324.2 44
   000432         044500        (WS-NUM <= 42.5809)                                       IF1324.2 44
   000433      1  044600                    PERFORM PASS                                  IF1324.2 231
   000434         044700     ELSE                                                         IF1324.2
   000435      1  044800                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000436      1  044900                    MOVE 42.58 TO CORRECT-N                       IF1324.2 81
   000437      1  045000                    PERFORM FAIL.                                 IF1324.2 232
   000438         045100     GO TO F-RANGE-WRITE-06.                                      IF1324.2 442
   000439         045200 F-RANGE-DELETE-06.                                               IF1324.2
   000440         045300     PERFORM  DE-LETE.                                            IF1324.2 233
   000441         045400     GO TO    F-RANGE-WRITE-06.                                   IF1324.2 442
   000442         045500 F-RANGE-WRITE-06.                                                IF1324.2
   000443         045600     MOVE "F-RANGE-06" TO PAR-NAME.                               IF1324.2 55
   000444         045700     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000445         045900 F-RANGE-07.                                                      IF1324.2
   000446         046000     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000447         046100 F-RANGE-TEST-07.                                                 IF1324.2
   000448         046200     COMPUTE WS-NUM = FUNCTION RANGE(IND(1), IND(2), IND(3)).     IF1324.2 44 IFN 42 42 42
   000449         046300     IF WS-NUM = 5 THEN                                           IF1324.2 44
   000450      1  046400                    PERFORM PASS                                  IF1324.2 231
   000451         046500     ELSE                                                         IF1324.2
   000452      1  046600                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000453      1  046700                    MOVE 5 TO CORRECT-N                           IF1324.2 81
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  046800                    PERFORM FAIL.                                 IF1324.2 232
   000455         046900     GO TO F-RANGE-WRITE-07.                                      IF1324.2 459
   000456         047000 F-RANGE-DELETE-07.                                               IF1324.2
   000457         047100     PERFORM  DE-LETE.                                            IF1324.2 233
   000458         047200     GO TO    F-RANGE-WRITE-07.                                   IF1324.2 459
   000459         047300 F-RANGE-WRITE-07.                                                IF1324.2
   000460         047400     MOVE "F-RANGE-07" TO PAR-NAME.                               IF1324.2 55
   000461         047500     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000462         047700 F-RANGE-08.                                                      IF1324.2
   000463         047800     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000464         047900 F-RANGE-TEST-08.                                                 IF1324.2
   000465         048000     COMPUTE WS-NUM = FUNCTION RANGE(IND(P), IND(Q), IND(R)).     IF1324.2 44 IFN 42 37 42 38 42 39
   000466         048100     IF WS-NUM = 3 THEN                                           IF1324.2 44
   000467      1  048200                    PERFORM PASS                                  IF1324.2 231
   000468         048300     ELSE                                                         IF1324.2
   000469      1  048400                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000470      1  048500                    MOVE 3 TO CORRECT-N                           IF1324.2 81
   000471      1  048600                    PERFORM FAIL.                                 IF1324.2 232
   000472         048700     GO TO F-RANGE-WRITE-08.                                      IF1324.2 476
   000473         048800 F-RANGE-DELETE-08.                                               IF1324.2
   000474         048900     PERFORM  DE-LETE.                                            IF1324.2 233
   000475         049000     GO TO    F-RANGE-WRITE-08.                                   IF1324.2 476
   000476         049100 F-RANGE-WRITE-08.                                                IF1324.2
   000477         049200     MOVE "F-RANGE-08" TO PAR-NAME.                               IF1324.2 55
   000478         049300     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000479         049500 F-RANGE-09.                                                      IF1324.2
   000480         049600     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000481         049700 F-RANGE-TEST-09.                                                 IF1324.2
   000482         049800     COMPUTE WS-NUM = FUNCTION RANGE(IND(ALL)).                   IF1324.2 44 IFN 42
   000483         049900     IF WS-NUM = 7 THEN                                           IF1324.2 44
   000484      1  050000                    PERFORM PASS                                  IF1324.2 231
   000485         050100     ELSE                                                         IF1324.2
   000486      1  050200                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000487      1  050300                    MOVE 7 TO CORRECT-N                           IF1324.2 81
   000488      1  050400                    PERFORM FAIL.                                 IF1324.2 232
   000489         050500     GO TO F-RANGE-WRITE-09.                                      IF1324.2 493
   000490         050600 F-RANGE-DELETE-09.                                               IF1324.2
   000491         050700     PERFORM  DE-LETE.                                            IF1324.2 233
   000492         050800     GO TO    F-RANGE-WRITE-09.                                   IF1324.2 493
   000493         050900 F-RANGE-WRITE-09.                                                IF1324.2
   000494         051000     MOVE "F-RANGE-09" TO PAR-NAME.                               IF1324.2 55
   000495         051100     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000496         051300 F-RANGE-11.                                                      IF1324.2
   000497         051400     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000498         051500 F-RANGE-TEST-11.                                                 IF1324.2
   000499         051600     COMPUTE WS-NUM = FUNCTION RANGE(M, N, O).                    IF1324.2 44 IFN 34 35 36
   000500         051700     IF WS-NUM = 1080000 THEN                                     IF1324.2 44
   000501      1  051800                    PERFORM PASS                                  IF1324.2 231
   000502         051900     ELSE                                                         IF1324.2
   000503      1  052000                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000504      1  052100                    MOVE 1080000 TO CORRECT-N                     IF1324.2 81
   000505      1  052200                    PERFORM FAIL.                                 IF1324.2 232
   000506         052300     GO TO F-RANGE-WRITE-11.                                      IF1324.2 510
   000507         052400 F-RANGE-DELETE-11.                                               IF1324.2
   000508         052500     PERFORM  DE-LETE.                                            IF1324.2 233
   000509         052600     GO TO    F-RANGE-WRITE-11.                                   IF1324.2 510
   000510         052700 F-RANGE-WRITE-11.                                                IF1324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052800     MOVE "F-RANGE-11" TO PAR-NAME.                               IF1324.2 55
   000512         052900     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000513         053100 F-RANGE-12.                                                      IF1324.2
   000514         053200     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000515         053300 F-RANGE-TEST-12.                                                 IF1324.2
   000516         053400     COMPUTE WS-NUM = FUNCTION RANGE(A, 5, A).                    IF1324.2 44 IFN 26 26
   000517         053500     IF WS-NUM = 0 THEN                                           IF1324.2 44
   000518      1  053600                    PERFORM PASS                                  IF1324.2 231
   000519         053700     ELSE                                                         IF1324.2
   000520      1  053800                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000521      1  053900                    MOVE 0 TO CORRECT-N                           IF1324.2 81
   000522      1  054000                    PERFORM FAIL.                                 IF1324.2 232
   000523         054100     GO TO F-RANGE-WRITE-12.                                      IF1324.2 527
   000524         054200 F-RANGE-DELETE-12.                                               IF1324.2
   000525         054300     PERFORM  DE-LETE.                                            IF1324.2 233
   000526         054400     GO TO    F-RANGE-WRITE-12.                                   IF1324.2 527
   000527         054500 F-RANGE-WRITE-12.                                                IF1324.2
   000528         054600     MOVE "F-RANGE-12" TO PAR-NAME.                               IF1324.2 55
   000529         054700     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000530         054900 F-RANGE-13.                                                      IF1324.2
   000531         055000     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000532         055100     MOVE 79.9984 TO MIN-RANGE.                                   IF1324.2 45
   000533         055200     MOVE 80.0160 TO MAX-RANGE.                                   IF1324.2 46
   000534         055300 F-RANGE-TEST-13.                                                 IF1324.2
   000535         055400     COMPUTE WS-NUM = FUNCTION RANGE(A, B) + 78.                  IF1324.2 44 IFN 26 27
   000536         055500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1324.2 44 45
   000537         055600        (WS-NUM <= MAX-RANGE) THEN                                IF1324.2 44 46
   000538      1  055700                    PERFORM PASS                                  IF1324.2 231
   000539         055800     ELSE                                                         IF1324.2
   000540      1  055900                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000541      1  056000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1324.2 45 95
   000542      1  056100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1324.2 46 109
   000543      1  056200                    PERFORM FAIL.                                 IF1324.2 232
   000544         056300     GO TO F-RANGE-WRITE-13.                                      IF1324.2 548
   000545         056400 F-RANGE-DELETE-13.                                               IF1324.2
   000546         056500     PERFORM  DE-LETE.                                            IF1324.2 233
   000547         056600     GO TO    F-RANGE-WRITE-13.                                   IF1324.2 548
   000548         056700 F-RANGE-WRITE-13.                                                IF1324.2
   000549         056800     MOVE "F-RANGE-13" TO PAR-NAME.                               IF1324.2 55
   000550         056900     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000551         057100 F-RANGE-14.                                                      IF1324.2
   000552         057200     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000553         057300     MOVE 7.39985 TO MIN-RANGE.                                   IF1324.2 45
   000554         057400     MOVE 7.40015 TO MAX-RANGE.                                   IF1324.2 46
   000555         057500 F-RANGE-TEST-14.                                                 IF1324.2
   000556         057600     COMPUTE WS-NUM = FUNCTION RANGE(A, B) +                      IF1324.2 44 IFN 26 27
   000557         057700                      FUNCTION RANGE(-2.6, -4.4, 1).              IF1324.2 IFN
   000558         057800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1324.2 44 45
   000559         057900        (WS-NUM <= MAX-RANGE) THEN                                IF1324.2 44 46
   000560      1  058000                    PERFORM PASS                                  IF1324.2 231
   000561         058100     ELSE                                                         IF1324.2
   000562      1  058200                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000563      1  058300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1324.2 45 95
   000564      1  058400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1324.2 46 109
   000565      1  058500                    PERFORM FAIL.                                 IF1324.2 232
   000566         058600     GO TO F-RANGE-WRITE-14.                                      IF1324.2 570
   000567         058700 F-RANGE-DELETE-14.                                               IF1324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058800     PERFORM  DE-LETE.                                            IF1324.2 233
   000569         058900     GO TO    F-RANGE-WRITE-14.                                   IF1324.2 570
   000570         059000 F-RANGE-WRITE-14.                                                IF1324.2
   000571         059100     MOVE "F-RANGE-14" TO PAR-NAME.                               IF1324.2 55
   000572         059200     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000573         059400 F-RANGE-15.                                                      IF1324.2
   000574         059500     MOVE ZERO TO WS-NUM.                                         IF1324.2 IMP 44
   000575         059600     MOVE 9.59981 TO MIN-RANGE.                                   IF1324.2 45
   000576         059700     MOVE 9.60019 TO MAX-RANGE.                                   IF1324.2 46
   000577         059800 F-RANGE-TEST-15.                                                 IF1324.2
   000578         059900     COMPUTE WS-NUM =                                             IF1324.2 44
   000579         060000           FUNCTION RANGE(FUNCTION RANGE(6.8, -6.8), 4).          IF1324.2 IFN IFN
   000580         060100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1324.2 44 45
   000581         060200        (WS-NUM <= MAX-RANGE) THEN                                IF1324.2 44 46
   000582      1  060300                    PERFORM PASS                                  IF1324.2 231
   000583         060400     ELSE                                                         IF1324.2
   000584      1  060500                    MOVE WS-NUM TO COMPUTED-N                     IF1324.2 44 67
   000585      1  060600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1324.2 45 95
   000586      1  060700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1324.2 46 109
   000587      1  060800                    PERFORM FAIL.                                 IF1324.2 232
   000588         060900     GO TO F-RANGE-WRITE-15.                                      IF1324.2 592
   000589         061000 F-RANGE-DELETE-15.                                               IF1324.2
   000590         061100     PERFORM  DE-LETE.                                            IF1324.2 233
   000591         061200     GO TO    F-RANGE-WRITE-15.                                   IF1324.2 592
   000592         061300 F-RANGE-WRITE-15.                                                IF1324.2
   000593         061400     MOVE "F-RANGE-15" TO PAR-NAME.                               IF1324.2 55
   000594         061500     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000595         061700 F-RANGE-16.                                                      IF1324.2
   000596         061800     PERFORM F-RANGE-TEST-16                                      IF1324.2 600
   000597         061900       UNTIL FUNCTION RANGE(ARG1, 1) > 10.                        IF1324.2 IFN 40
   000598         062000     PERFORM PASS.                                                IF1324.2 231
   000599         062100     GO TO F-RANGE-WRITE-16.                                      IF1324.2 605
   000600         062200 F-RANGE-TEST-16.                                                 IF1324.2
   000601         062300     COMPUTE ARG1 = ARG1 + 1.                                     IF1324.2 40 40
   000602         062400 F-RANGE-DELETE-16.                                               IF1324.2
   000603         062500     PERFORM  DE-LETE.                                            IF1324.2 233
   000604         062600     GO TO    F-RANGE-WRITE-16.                                   IF1324.2 605
   000605         062700 F-RANGE-WRITE-16.                                                IF1324.2
   000606         062800     MOVE "F-RANGE-16" TO PAR-NAME.                               IF1324.2 55
   000607         062900     PERFORM  PRINT-DETAIL.                                       IF1324.2 235
   000608         063100 CCVS-EXIT SECTION.                                               IF1324.2
   000609         063200 CCVS-999999.                                                     IF1324.2
   000610         063300     GO TO CLOSE-FILES.                                           IF1324.2 226
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  380 430 516 516 535 556
      139   ANSI-REFERENCE . . . . . . . .  313 320 336 M347
       40   ARG1 . . . . . . . . . . . . .  597 M601 601
       41   ARR
       27   B. . . . . . . . . . . . . . .  380 430 535 556
       28   C. . . . . . . . . . . . . . .  380 430
      118   CCVS-C-1 . . . . . . . . . . .  253 298
      123   CCVS-C-2 . . . . . . . . . . .  254 299
      173   CCVS-E-1 . . . . . . . . . . .  259
      178   CCVS-E-2 . . . . . . . . . . .  267 274 281 286
      181   CCVS-E-2-2 . . . . . . . . . .  M266
      186   CCVS-E-3 . . . . . . . . . . .  287
      195   CCVS-E-4 . . . . . . . . . . .  266
      196   CCVS-E-4-1 . . . . . . . . . .  M264
      198   CCVS-E-4-2 . . . . . . . . . .  M265
      140   CCVS-H-1 . . . . . . . . . . .  248 294
      145   CCVS-H-2A. . . . . . . . . . .  249 295
      154   CCVS-H-2B. . . . . . . . . . .  250 296
      166   CCVS-H-3 . . . . . . . . . . .  251 297
      216   CCVS-PGM-ID. . . . . . . . . .  222 222
       72   CM-18V0
       66   COMPUTED-A . . . . . . . . . .  67 69 70 71 72 331 335
       67   COMPUTED-N . . . . . . . . . .  M356 M399 M417 M435 M452 M469 M486 M503 M520 M540 M562 M584
       65   COMPUTED-X . . . . . . . . . .  M243 310
       69   COMPUTED-0V18
       71   COMPUTED-14V4
       73   COMPUTED-18V0
       70   COMPUTED-4V14
       89   COR-ANSI-REFERENCE . . . . . .  M320 M328
      117   CORMA-ANSI-REFERENCE . . . . .  M321
       80   CORRECT-A. . . . . . . . . . .  81 82 83 84 85 332 334
      109   CORRECT-MAX. . . . . . . . . .  M542 M564 M586
       95   CORRECT-MIN. . . . . . . . . .  322 M541 M563 M585
       81   CORRECT-N. . . . . . . . . . .  M357 M400 M418 M436 M453 M470 M487 M504 M521
       79   CORRECT-X. . . . . . . . . . .  M244 312
       82   CORRECT-0V18
       84   CORRECT-14V4
       86   CORRECT-18V0
       83   CORRECT-4V14
      108   CORRECTMA-A. . . . . . . . . .  109 110 111 112 113
      107   CORRECTMA-X
      110   CORRECTMA-0V18
      112   CORRECTMA-14V4
      114   CORRECTMA-18V0
      111   CORRECTMA-4V14
       94   CORRECTMI-A. . . . . . . . . .  95 96 97 98 99
       93   CORRECTMI-X
       96   CORRECTMI-0V18
       98   CORRECTMI-14V4
      100   CORRECTMI-18V0
       97   CORRECTMI-4V14
       85   CR-18V0
       99   CR-18V0
      113   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    15
0 Defined   Cross-reference of data names   References

0      29   D. . . . . . . . . . . . . . .  380 430
      131   DELETE-COUNTER . . . . . . . .  M233 262 277 279
       58   DOTVALUE . . . . . . . . . . .  M238
      137   DUMMY-HOLD . . . . . . . . . .  M291 301
       23   DUMMY-RECORD . . . . . . . . .  M248 M249 M250 M251 M253 M254 M255 M257 M259 M267 M274 M281 M286 M287 291 M292
                                            293 M294 M295 M296 M297 M298 M299 M300 M301 305 M306 M315 M337
       30   E. . . . . . . . . . . . . . .  394 430
      184   ENDER-DESC . . . . . . . . . .  M269 M280 M285
      132   ERROR-COUNTER. . . . . . . . .  M232 261 270 273
      136   ERROR-HOLD . . . . . . . . . .  M261 M262 M262 M263 265
      182   ERROR-TOTAL. . . . . . . . . .  M271 M273 M278 M279 M283 M284
       31   F. . . . . . . . . . . . . . .  394 430
       51   FEATURE. . . . . . . . . . . .  M348
       32   G. . . . . . . . . . . . . . .  394 430
       33   H
      210   HYPHEN-LINE. . . . . . . . . .  255 257 300
      176   ID-AGAIN . . . . . . . . . . .  M222
       42   IND. . . . . . . . . . . . . .  448 448 448 465 465 465 482
      209   INF-ANSI-REFERENCE . . . . . .  M313 M316 M336 M338
      204   INFO-TEXT. . . . . . . . . . .  M314
      133   INSPECT-COUNTER. . . . . . . .  M230 261 282 284
       34   M. . . . . . . . . . . . . . .  499
       46   MAX-RANGE. . . . . . . . . . .  M533 537 542 M554 559 564 M576 581 586
       45   MIN-RANGE. . . . . . . . . . .  M532 536 541 M553 558 563 M575 580 585
       35   N. . . . . . . . . . . . . . .  499
       36   O. . . . . . . . . . . . . . .  499
       37   P. . . . . . . . . . . . . . .  465
       53   P-OR-F . . . . . . . . . . . .  M230 M231 M232 M233 240 M243
       55   PAR-NAME . . . . . . . . . . .  M245 M364 M377 M389 M407 M425 M443 M460 M477 M494 M511 M528 M549 M571 M593 M606
       57   PARDOT-X . . . . . . . . . . .  M237
      134   PASS-COUNTER . . . . . . . . .  M231 263 264
       21   PRINT-FILE . . . . . . . . . .  17 221 227
       22   PRINT-REC. . . . . . . . . . .  M239 M319 M323 M324 M326
       38   Q. . . . . . . . . . . . . . .  465
       39   R. . . . . . . . . . . . . . .  465
       60   RE-MARK. . . . . . . . . . . .  M234 M246
      130   REC-CT . . . . . . . . . . . .  236 238 245
      129   REC-SKL-SUB
      138   RECORD-COUNT . . . . . . . . .  M289 290 M302
       43   TEMP
       61   TEST-COMPUTED. . . . . . . . .  319
       76   TEST-CORRECT . . . . . . . . .  326
      104   TEST-CORRECT-MAX . . . . . . .  324
       90   TEST-CORRECT-MIN . . . . . . .  323
      157   TEST-ID. . . . . . . . . . . .  M222
       49   TEST-RESULTS . . . . . . . . .  M223 239
      135   TOTAL-ERROR
       44   WS-NUM . . . . . . . . . . . .  M350 M352 353 356 M392 M394 395 396 399 M410 M412 413 414 417 M428 M430 431 432
                                            435 M446 M448 449 452 M463 M465 466 469 M480 M482 483 486 M497 M499 500 503 M514
                                            M516 517 520 M531 M535 536 537 540 M552 M556 558 559 562 M574 M578 580 581 584
      206   XXCOMPUTED . . . . . . . . . .  M335
      208   XXCORRECT. . . . . . . . . . .  M334
      201   XXINFO . . . . . . . . . . . .  315 337
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    16
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

      330   BAIL-OUT . . . . . . . . . . .  P242
      339   BAIL-OUT-EX. . . . . . . . . .  E242 G332
      333   BAIL-OUT-WRITE . . . . . . . .  G331
      307   BLANK-LINE-PRINT
      608   CCVS-EXIT
      609   CCVS-999999
      219   CCVS1
      340   CCVS1-EXIT . . . . . . . . . .  G225
      226   CLOSE-FILES. . . . . . . . . .  G610
      252   COLUMN-NAMES-ROUTINE . . . . .  E224
      233   DE-LETE. . . . . . . . . . . .  P361 P374 P386 P404 P422 P440 P457 P474 P491 P508 P525 P546 P568 P590 P603
      256   END-ROUTINE. . . . . . . . . .  P227
      260   END-ROUTINE-1
      268   END-ROUTINE-12
      276   END-ROUTINE-13 . . . . . . . .  E227
      258   END-RTN-EXIT
      360   F-RANGE-DELETE-01
      373   F-RANGE-DELETE-02
      385   F-RANGE-DELETE-03
      403   F-RANGE-DELETE-04
      421   F-RANGE-DELETE-05
      439   F-RANGE-DELETE-06
      456   F-RANGE-DELETE-07
      473   F-RANGE-DELETE-08
      490   F-RANGE-DELETE-09
      507   F-RANGE-DELETE-11
      524   F-RANGE-DELETE-12
      545   F-RANGE-DELETE-13
      567   F-RANGE-DELETE-14
      589   F-RANGE-DELETE-15
      602   F-RANGE-DELETE-16
      346   F-RANGE-INFO
      351   F-RANGE-TEST-01
      393   F-RANGE-TEST-04
      411   F-RANGE-TEST-05
      429   F-RANGE-TEST-06
      447   F-RANGE-TEST-07
      464   F-RANGE-TEST-08
      481   F-RANGE-TEST-09
      498   F-RANGE-TEST-11
      515   F-RANGE-TEST-12
      534   F-RANGE-TEST-13
      555   F-RANGE-TEST-14
      577   F-RANGE-TEST-15
      600   F-RANGE-TEST-16. . . . . . . .  P596
      363   F-RANGE-WRITE-01 . . . . . . .  G359 G362
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    17
0 Defined   Cross-reference of procedures   References

0     376   F-RANGE-WRITE-02 . . . . . . .  G372 G375
      388   F-RANGE-WRITE-03 . . . . . . .  G384 G387
      406   F-RANGE-WRITE-04 . . . . . . .  G402 G405
      424   F-RANGE-WRITE-05 . . . . . . .  G420 G423
      442   F-RANGE-WRITE-06 . . . . . . .  G438 G441
      459   F-RANGE-WRITE-07 . . . . . . .  G455 G458
      476   F-RANGE-WRITE-08 . . . . . . .  G472 G475
      493   F-RANGE-WRITE-09 . . . . . . .  G489 G492
      510   F-RANGE-WRITE-11 . . . . . . .  G506 G509
      527   F-RANGE-WRITE-12 . . . . . . .  G523 G526
      548   F-RANGE-WRITE-13 . . . . . . .  G544 G547
      570   F-RANGE-WRITE-14 . . . . . . .  G566 G569
      592   F-RANGE-WRITE-15 . . . . . . .  G588 G591
      605   F-RANGE-WRITE-16 . . . . . . .  G599 G604
      349   F-RANGE-01
      366   F-RANGE-02
      379   F-RANGE-03
      391   F-RANGE-04
      409   F-RANGE-05
      427   F-RANGE-06
      445   F-RANGE-07
      462   F-RANGE-08
      479   F-RANGE-09
      496   F-RANGE-11
      513   F-RANGE-12
      530   F-RANGE-13
      551   F-RANGE-14
      573   F-RANGE-15
      595   F-RANGE-16
      232   FAIL . . . . . . . . . . . . .  P358 P371 P383 P401 P419 P437 P454 P471 P488 P505 P522 P543 P565 P587
      309   FAIL-ROUTINE . . . . . . . . .  P241
      329   FAIL-ROUTINE-EX. . . . . . . .  E241 G317
      318   FAIL-ROUTINE-WRITE . . . . . .  G311 G312
      247   HEAD-ROUTINE . . . . . . . . .  P224
      230   INSPT
      220   OPEN-FILES
      231   PASS . . . . . . . . . . . . .  P354 P369 P381 P397 P415 P433 P450 P467 P484 P501 P518 P538 P560 P582 P598
      235   PRINT-DETAIL . . . . . . . . .  P365 P378 P390 P408 P426 P444 P461 P478 P495 P512 P529 P550 P572 P594 P607
      345   SECT-IF132A
      228   TERMINATE-CCVS
      288   WRITE-LINE . . . . . . . . . .  P239 P240 P248 P249 P250 P251 P253 P254 P255 P257 P259 P267 P275 P281 P286 P287
                                            P315 P319 P323 P324 P326 P327 P337
      304   WRT-LN . . . . . . . . . . . .  P294 P295 P296 P297 P298 P299 P300 P303 P308
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    18
0 Defined   Cross-reference of programs     References

        3   IF132A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF132A    Date 06/04/2022  Time 11:58:23   Page    19
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF132A:
 *    Source records = 610
 *    Data Division statements = 103
 *    Procedure Division statements = 320
 *    Generated COBOL statements = 0
 *    Program complexity factor = 332
0End of compilation 1,  program IF132A,  highest severity 0.
0Return code 0
