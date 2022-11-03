1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:15   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:15   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1224.2
   000002         000200 PROGRAM-ID.                                                      IF1224.2
   000003         000300     IF122A.                                                      IF1224.2
   000004         000400                                                                  IF1224.2
   000005         000600*                                                         *       IF1224.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1224.2
   000007         000800* It contains tests for the Intrinsic Function MIDRANGE   *       IF1224.2
   000008         000900*                                                         *       IF1224.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1224.2
   000010         001200 CONFIGURATION SECTION.                                           IF1224.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1224.2
   000012         001400     XXXXX082.                                                    IF1224.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1224.2
   000014         001600     XXXXX083.                                                    IF1224.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1224.2
   000016         001800 FILE-CONTROL.                                                    IF1224.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1224.2 21
   000018         002000     XXXXX055.                                                    IF1224.2
   000019         002100 DATA DIVISION.                                                   IF1224.2
   000020         002200 FILE SECTION.                                                    IF1224.2
   000021         002300 FD  PRINT-FILE.                                                  IF1224.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1224.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1224.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1224.2
   000025         002800* Variables specific to the Intrinsic Function Test IF122A*       IF1224.2
   000026         003000 01  A                   PIC S9(10)          VALUE 5.             IF1224.2
   000027         003100 01  B                   PIC S9(10)          VALUE 7.             IF1224.2
   000028         003200 01  C                   PIC S9(10)          VALUE -4.            IF1224.2
   000029         003300 01  D                   PIC S9(10)          VALUE 10.            IF1224.2
   000030         003400 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1224.2
   000031         003500 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1224.2
   000032         003600 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1224.2
   000033         003700 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1224.2
   000034         003800 01  M                   PIC S9(10)          VALUE 320000.        IF1224.2
   000035         003900 01  N                   PIC S9(10)          VALUE 650000.        IF1224.2
   000036         004000 01  O                   PIC S9(10)          VALUE -430000.       IF1224.2
   000037         004100 01  P                   PIC S9(10)          VALUE 1.             IF1224.2
   000038         004200 01  Q                   PIC S9(10)          VALUE 3.             IF1224.2
   000039         004300 01  R                   PIC S9(10)          VALUE 5.             IF1224.2
   000040         004400 01  ARG1                PIC S9(10)          VALUE 2.             IF1224.2
   000041         004500 01  ARR                                     VALUE "40537".       IF1224.2
   000042         004600     02  IND OCCURS 5 TIMES PIC 9.                                IF1224.2
   000043         004700 01  TEMP                PIC S9(10)V9(5).                         IF1224.2
   000044         004800 01  WS-NUM              PIC S9(6)V9(7).                          IF1224.2
   000045         004900 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1224.2
   000046         005000 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1224.2
   000047         005100*                                                                 IF1224.2
   000048         005300*                                                                 IF1224.2
   000049         005400 01  TEST-RESULTS.                                                IF1224.2
   000050         005500     02 FILLER                   PIC X      VALUE SPACE.          IF1224.2 IMP
   000051         005600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1224.2 IMP
   000052         005700     02 FILLER                   PIC X      VALUE SPACE.          IF1224.2 IMP
   000053         005800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1224.2 IMP
   000054         005900     02 FILLER                   PIC X      VALUE SPACE.          IF1224.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02  PAR-NAME.                                                IF1224.2
   000056         006100       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1224.2 IMP
   000057         006200       03  PARDOT-X              PIC X      VALUE SPACE.          IF1224.2 IMP
   000058         006300       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1224.2 IMP
   000059         006400     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1224.2 IMP
   000060         006500     02 RE-MARK                  PIC X(61).                       IF1224.2
   000061         006600 01  TEST-COMPUTED.                                               IF1224.2
   000062         006700     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1224.2 IMP
   000063         006800     02 FILLER                   PIC X(17)  VALUE                 IF1224.2
   000064         006900            "       COMPUTED=".                                   IF1224.2
   000065         007000     02 COMPUTED-X.                                               IF1224.2
   000066         007100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1224.2 IMP
   000067         007200     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1224.2 66
   000068         007300                                 PIC -9(9).9(9).                  IF1224.2
   000069         007400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1224.2 66
   000070         007500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1224.2 66
   000071         007600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1224.2 66
   000072         007700     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1224.2 66
   000073         007800         04 COMPUTED-18V0                    PIC -9(18).          IF1224.2
   000074         007900         04 FILLER                           PIC X.               IF1224.2
   000075         008000     03 FILLER PIC X(50) VALUE SPACE.                             IF1224.2 IMP
   000076         008100 01  TEST-CORRECT.                                                IF1224.2
   000077         008200     02 FILLER PIC X(30) VALUE SPACE.                             IF1224.2 IMP
   000078         008300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1224.2
   000079         008400     02 CORRECT-X.                                                IF1224.2
   000080         008500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1224.2 IMP
   000081         008600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1224.2 80
   000082         008700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1224.2 80
   000083         008800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1224.2 80
   000084         008900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1224.2 80
   000085         009000     03      CR-18V0 REDEFINES CORRECT-A.                         IF1224.2 80
   000086         009100         04 CORRECT-18V0                     PIC -9(18).          IF1224.2
   000087         009200         04 FILLER                           PIC X.               IF1224.2
   000088         009300     03 FILLER PIC X(2) VALUE SPACE.                              IF1224.2 IMP
   000089         009400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1224.2 IMP
   000090         009500 01  TEST-CORRECT-MIN.                                            IF1224.2
   000091         009600     02 FILLER PIC X(30) VALUE SPACE.                             IF1224.2 IMP
   000092         009700     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1224.2
   000093         009800     02 CORRECTMI-X.                                              IF1224.2
   000094         009900     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1224.2 IMP
   000095         010000     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1224.2 94
   000096         010100     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1224.2 94
   000097         010200     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1224.2 94
   000098         010300     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1224.2 94
   000099         010400     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1224.2 94
   000100         010500         04 CORRECTMI-18V0                     PIC -9(18).        IF1224.2
   000101         010600         04 FILLER                           PIC X.               IF1224.2
   000102         010700     03 FILLER PIC X(2) VALUE SPACE.                              IF1224.2 IMP
   000103         010800     03 FILLER                           PIC X(48) VALUE SPACE.   IF1224.2 IMP
   000104         010900 01  TEST-CORRECT-MAX.                                            IF1224.2
   000105         011000     02 FILLER PIC X(30) VALUE SPACE.                             IF1224.2 IMP
   000106         011100     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1224.2
   000107         011200     02 CORRECTMA-X.                                              IF1224.2
   000108         011300     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1224.2 IMP
   000109         011400     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1224.2 108
   000110         011500     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1224.2 108
   000111         011600     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1224.2 108
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1224.2 108
   000113         011800     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1224.2 108
   000114         011900         04 CORRECTMA-18V0                     PIC -9(18).        IF1224.2
   000115         012000         04 FILLER                           PIC X.               IF1224.2
   000116         012100     03 FILLER PIC X(2) VALUE SPACE.                              IF1224.2 IMP
   000117         012200     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1224.2 IMP
   000118         012300 01  CCVS-C-1.                                                    IF1224.2
   000119         012400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1224.2
   000120         012500-    "SS  PARAGRAPH-NAME                                          IF1224.2
   000121         012600-    "       REMARKS".                                            IF1224.2
   000122         012700     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1224.2 IMP
   000123         012800 01  CCVS-C-2.                                                    IF1224.2
   000124         012900     02 FILLER                     PIC X        VALUE SPACE.      IF1224.2 IMP
   000125         013000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1224.2
   000126         013100     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1224.2 IMP
   000127         013200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1224.2
   000128         013300     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1224.2 IMP
   000129         013400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1224.2 IMP
   000130         013500 01  REC-CT                        PIC 99       VALUE ZERO.       IF1224.2 IMP
   000131         013600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1224.2 IMP
   000132         013700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1224.2 IMP
   000133         013800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1224.2 IMP
   000134         013900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1224.2 IMP
   000135         014000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1224.2 IMP
   000136         014100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1224.2 IMP
   000137         014200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1224.2 IMP
   000138         014300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1224.2 IMP
   000139         014400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1224.2 IMP
   000140         014500 01  CCVS-H-1.                                                    IF1224.2
   000141         014600     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1224.2 IMP
   000142         014700     02  FILLER                    PIC X(42)    VALUE             IF1224.2
   000143         014800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1224.2
   000144         014900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1224.2 IMP
   000145         015000 01  CCVS-H-2A.                                                   IF1224.2
   000146         015100   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1224.2 IMP
   000147         015200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1224.2
   000148         015300   02  FILLER                        PIC XXXX   VALUE             IF1224.2
   000149         015400     "4.2 ".                                                      IF1224.2
   000150         015500   02  FILLER                        PIC X(28)  VALUE             IF1224.2
   000151         015600            " COPY - NOT FOR DISTRIBUTION".                       IF1224.2
   000152         015700   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1224.2 IMP
   000153         015800                                                                  IF1224.2
   000154         015900 01  CCVS-H-2B.                                                   IF1224.2
   000155         016000   02  FILLER                        PIC X(15)  VALUE             IF1224.2
   000156         016100            "TEST RESULT OF ".                                    IF1224.2
   000157         016200   02  TEST-ID                       PIC X(9).                    IF1224.2
   000158         016300   02  FILLER                        PIC X(4)   VALUE             IF1224.2
   000159         016400            " IN ".                                               IF1224.2
   000160         016500   02  FILLER                        PIC X(12)  VALUE             IF1224.2
   000161         016600     " HIGH       ".                                              IF1224.2
   000162         016700   02  FILLER                        PIC X(22)  VALUE             IF1224.2
   000163         016800            " LEVEL VALIDATION FOR ".                             IF1224.2
   000164         016900   02  FILLER                        PIC X(58)  VALUE             IF1224.2
   000165         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1224.2
   000166         017100 01  CCVS-H-3.                                                    IF1224.2
   000167         017200     02  FILLER                      PIC X(34)  VALUE             IF1224.2
   000168         017300            " FOR OFFICIAL USE ONLY    ".                         IF1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02  FILLER                      PIC X(58)  VALUE             IF1224.2
   000170         017500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1224.2
   000171         017600     02  FILLER                      PIC X(28)  VALUE             IF1224.2
   000172         017700            "  COPYRIGHT   1985 ".                                IF1224.2
   000173         017800 01  CCVS-E-1.                                                    IF1224.2
   000174         017900     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1224.2 IMP
   000175         018000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1224.2
   000176         018100     02 ID-AGAIN                     PIC X(9).                    IF1224.2
   000177         018200     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1224.2 IMP
   000178         018300 01  CCVS-E-2.                                                    IF1224.2
   000179         018400     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1224.2 IMP
   000180         018500     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1224.2 IMP
   000181         018600     02 CCVS-E-2-2.                                               IF1224.2
   000182         018700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1224.2 IMP
   000183         018800         03 FILLER                   PIC X      VALUE SPACE.      IF1224.2 IMP
   000184         018900         03 ENDER-DESC               PIC X(44)  VALUE             IF1224.2
   000185         019000            "ERRORS ENCOUNTERED".                                 IF1224.2
   000186         019100 01  CCVS-E-3.                                                    IF1224.2
   000187         019200     02  FILLER                      PIC X(22)  VALUE             IF1224.2
   000188         019300            " FOR OFFICIAL USE ONLY".                             IF1224.2
   000189         019400     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1224.2 IMP
   000190         019500     02  FILLER                      PIC X(58)  VALUE             IF1224.2
   000191         019600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1224.2
   000192         019700     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1224.2 IMP
   000193         019800     02 FILLER                       PIC X(15)  VALUE             IF1224.2
   000194         019900             " COPYRIGHT 1985".                                   IF1224.2
   000195         020000 01  CCVS-E-4.                                                    IF1224.2
   000196         020100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1224.2 IMP
   000197         020200     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1224.2
   000198         020300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1224.2 IMP
   000199         020400     02 FILLER                       PIC X(40)  VALUE             IF1224.2
   000200         020500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1224.2
   000201         020600 01  XXINFO.                                                      IF1224.2
   000202         020700     02 FILLER                       PIC X(19)  VALUE             IF1224.2
   000203         020800            "*** INFORMATION ***".                                IF1224.2
   000204         020900     02 INFO-TEXT.                                                IF1224.2
   000205         021000       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1224.2 IMP
   000206         021100       04 XXCOMPUTED                 PIC X(20).                   IF1224.2
   000207         021200       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1224.2 IMP
   000208         021300       04 XXCORRECT                  PIC X(20).                   IF1224.2
   000209         021400     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1224.2
   000210         021500 01  HYPHEN-LINE.                                                 IF1224.2
   000211         021600     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1224.2 IMP
   000212         021700     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1224.2
   000213         021800-    "*****************************************".                 IF1224.2
   000214         021900     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1224.2
   000215         022000-    "******************************".                            IF1224.2
   000216         022100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1224.2
   000217         022200     "IF122A".                                                    IF1224.2
   000218         022300 PROCEDURE DIVISION.                                              IF1224.2
   000219         022400 CCVS1 SECTION.                                                   IF1224.2
   000220         022500 OPEN-FILES.                                                      IF1224.2
   000221         022600     OPEN     OUTPUT PRINT-FILE.                                  IF1224.2 21
   000222         022700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1224.2 216 157 216 176
   000223         022800     MOVE    SPACE TO TEST-RESULTS.                               IF1224.2 IMP 49
   000224         022900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1224.2 247 252
   000225         023000     GO TO CCVS1-EXIT.                                            IF1224.2 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 CLOSE-FILES.                                                     IF1224.2
   000227         023200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1224.2 256 276 21
   000228         023300 TERMINATE-CCVS.                                                  IF1224.2
   000229         023400     STOP     RUN.                                                IF1224.2
   000230         023500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1224.2 53 133
   000231         023600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1224.2 53 134
   000232         023700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1224.2 53 132
   000233         023800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1224.2 53 131
   000234         023900     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1224.2 60
   000235         024000 PRINT-DETAIL.                                                    IF1224.2
   000236         024100     IF REC-CT NOT EQUAL TO ZERO                                  IF1224.2 130 IMP
   000237      1  024200             MOVE "." TO PARDOT-X                                 IF1224.2 57
   000238      1  024300             MOVE REC-CT TO DOTVALUE.                             IF1224.2 130 58
   000239         024400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1224.2 49 22 288
   000240         024500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1224.2 53 288
   000241      1  024600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1224.2 309 329
   000242      1  024700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1224.2 330 339
   000243         024800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1224.2 IMP 53 IMP 65
   000244         024900     MOVE SPACE TO CORRECT-X.                                     IF1224.2 IMP 79
   000245         025000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1224.2 130 IMP IMP 55
   000246         025100     MOVE     SPACE TO RE-MARK.                                   IF1224.2 IMP 60
   000247         025200 HEAD-ROUTINE.                                                    IF1224.2
   000248         025300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1224.2 140 23 288
   000249         025400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1224.2 145 23 288
   000250         025500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1224.2 154 23 288
   000251         025600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1224.2 166 23 288
   000252         025700 COLUMN-NAMES-ROUTINE.                                            IF1224.2
   000253         025800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1224.2 118 23 288
   000254         025900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1224.2 123 23 288
   000255         026000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1224.2 210 23 288
   000256         026100 END-ROUTINE.                                                     IF1224.2
   000257         026200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1224.2 210 23 288
   000258         026300 END-RTN-EXIT.                                                    IF1224.2
   000259         026400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1224.2 173 23 288
   000260         026500 END-ROUTINE-1.                                                   IF1224.2
   000261         026600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1224.2 132 136 133
   000262         026700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1224.2 136 131 136
   000263         026800      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1224.2 134 136
   000264         026900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1224.2 134 196
   000265         027000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1224.2 136 198
   000266         027100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1224.2 195 181
   000267         027200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1224.2 178 23 288
   000268         027300  END-ROUTINE-12.                                                 IF1224.2
   000269         027400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1224.2 184
   000270         027500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1224.2 132 IMP
   000271      1  027600         MOVE "NO " TO ERROR-TOTAL                                IF1224.2 182
   000272         027700         ELSE                                                     IF1224.2
   000273      1  027800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1224.2 132 182
   000274         027900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1224.2 178 23
   000275         028000     PERFORM WRITE-LINE.                                          IF1224.2 288
   000276         028100 END-ROUTINE-13.                                                  IF1224.2
   000277         028200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1224.2 131 IMP
   000278      1  028300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1224.2 182
   000279      1  028400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1224.2 131 182
   000280         028500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1224.2 184
   000281         028600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1224.2 178 23 288
   000282         028700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1224.2 133 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800          MOVE "NO " TO ERROR-TOTAL                               IF1224.2 182
   000284      1  028900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1224.2 133 182
   000285         029000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1224.2 184
   000286         029100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1224.2 178 23 288
   000287         029200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1224.2 186 23 288
   000288         029300 WRITE-LINE.                                                      IF1224.2
   000289         029400     ADD 1 TO RECORD-COUNT.                                       IF1224.2 138
   000290         029500     IF RECORD-COUNT GREATER 42                                   IF1224.2 138
   000291      1  029600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1224.2 23 137
   000292      1  029700         MOVE SPACE TO DUMMY-RECORD                               IF1224.2 IMP 23
   000293      1  029800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1224.2 23
   000294      1  029900         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1224.2 140 23 304
   000295      1  030000         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1224.2 145 23 304
   000296      1  030100         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1224.2 154 23 304
   000297      1  030200         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1224.2 166 23 304
   000298      1  030300         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1224.2 118 23 304
   000299      1  030400         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1224.2 123 23 304
   000300      1  030500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1224.2 210 23 304
   000301      1  030600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1224.2 137 23
   000302      1  030700         MOVE ZERO TO RECORD-COUNT.                               IF1224.2 IMP 138
   000303         030800     PERFORM WRT-LN.                                              IF1224.2 304
   000304         030900 WRT-LN.                                                          IF1224.2
   000305         031000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1224.2 23
   000306         031100     MOVE SPACE TO DUMMY-RECORD.                                  IF1224.2 IMP 23
   000307         031200 BLANK-LINE-PRINT.                                                IF1224.2
   000308         031300     PERFORM WRT-LN.                                              IF1224.2 304
   000309         031400 FAIL-ROUTINE.                                                    IF1224.2
   000310         031500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1224.2 65 IMP
   000311      1  031600            GO TO FAIL-ROUTINE-WRITE.                             IF1224.2 318
   000312         031700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1224.2 79 IMP 318
   000313         031800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1224.2 139 209
   000314         031900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1224.2 204
   000315         032000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1224.2 201 23 288
   000316         032100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1224.2 IMP 209
   000317         032200     GO TO  FAIL-ROUTINE-EX.                                      IF1224.2 329
   000318         032300 FAIL-ROUTINE-WRITE.                                              IF1224.2
   000319         032400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1224.2 61 22 288
   000320         032500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1224.2 139 89
   000321         032600                              CORMA-ANSI-REFERENCE.               IF1224.2 117
   000322         032700     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1224.2 95 IMP
   000323      1  032800           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1224.2 90 22 288
   000324      1  032900           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1224.2 104 22 288
   000325         033000     ELSE                                                         IF1224.2
   000326      1  033100           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1224.2 76 22 288
   000327         033200     PERFORM WRITE-LINE.                                          IF1224.2 288
   000328         033300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1224.2 IMP 89
   000329         033400 FAIL-ROUTINE-EX. EXIT.                                           IF1224.2
   000330         033500 BAIL-OUT.                                                        IF1224.2
   000331         033600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1224.2 66 IMP 333
   000332         033700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1224.2 80 IMP 339
   000333         033800 BAIL-OUT-WRITE.                                                  IF1224.2
   000334         033900     MOVE CORRECT-A TO XXCORRECT.                                 IF1224.2 80 208
   000335         034000     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1224.2 66 206
   000336         034100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1224.2 139 209
   000337         034200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1224.2 201 23 288
   000338         034300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1224.2 IMP 209
   000339         034400 BAIL-OUT-EX. EXIT.                                               IF1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034500 CCVS1-EXIT.                                                      IF1224.2
   000341         034600     EXIT.                                                        IF1224.2
   000342         034800*                                                      *          IF1224.2
   000343         034900*    Intrinsic Function Tests        IF122A - MIDRANGE *          IF1224.2
   000344         035000*                                                      *          IF1224.2
   000345         035200 SECT-IF122A SECTION.                                             IF1224.2
   000346         035300 F-MIDRANGE-INFO.                                                 IF1224.2
   000347         035400     MOVE     "See ref. A-55 2.26" TO ANSI-REFERENCE.             IF1224.2 139
   000348         035500     MOVE     "MIDRANGE Function" TO FEATURE.                     IF1224.2 51
   000349         035700 F-MIDRANGE-01.                                                   IF1224.2
   000350         035800     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000351         035900 F-MIDRANGE-TEST-01.                                              IF1224.2
   000352         036000     COMPUTE WS-NUM = FUNCTION MIDRANGE(5, -2, -14, 0).           IF1224.2 44 IFN
   000353         036100     IF (WS-NUM >= -4.50009) AND                                  IF1224.2 44
   000354         036200        (WS-NUM <= -4.49991)                                      IF1224.2 44
   000355      1  036300                    PERFORM PASS                                  IF1224.2 231
   000356         036400     ELSE                                                         IF1224.2
   000357      1  036500                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000358      1  036600                    MOVE -4.5 TO CORRECT-N                        IF1224.2 81
   000359      1  036700                    PERFORM FAIL.                                 IF1224.2 232
   000360         036800     GO TO F-MIDRANGE-WRITE-01.                                   IF1224.2 364
   000361         036900 F-MIDRANGE-DELETE-01.                                            IF1224.2
   000362         037000     PERFORM  DE-LETE.                                            IF1224.2 233
   000363         037100     GO TO    F-MIDRANGE-WRITE-01.                                IF1224.2 364
   000364         037200 F-MIDRANGE-WRITE-01.                                             IF1224.2
   000365         037300     MOVE "F-MIDRANGE-01" TO PAR-NAME.                            IF1224.2 55
   000366         037400     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000367         037600 F-MIDRANGE-02.                                                   IF1224.2
   000368         037700     EVALUATE FUNCTION MIDRANGE(3.9, -0.3, 8.7, 100.2)            IF1224.2 IFN
   000369         037800     WHEN 49.9490 THRU 49.9510                                    IF1224.2
   000370      1  037900                    PERFORM PASS                                  IF1224.2 231
   000371         038000     WHEN OTHER                                                   IF1224.2
   000372      1  038100                    PERFORM FAIL.                                 IF1224.2 232
   000373         038200     GO TO F-MIDRANGE-WRITE-02.                                   IF1224.2 377
   000374         038300 F-MIDRANGE-DELETE-02.                                            IF1224.2
   000375         038400     PERFORM  DE-LETE.                                            IF1224.2 233
   000376         038500     GO TO    F-MIDRANGE-WRITE-02.                                IF1224.2 377
   000377         038600 F-MIDRANGE-WRITE-02.                                             IF1224.2
   000378         038700     MOVE "F-MIDRANGE-02" TO PAR-NAME.                            IF1224.2 55
   000379         038800     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000380         039000 F-MIDRANGE-03.                                                   IF1224.2
   000381         039100     IF FUNCTION MIDRANGE(A, B, C, D) = 3 THEN                    IF1224.2 IFN 26 27 28 29
   000382      1  039200                    PERFORM PASS                                  IF1224.2 231
   000383         039300     ELSE                                                         IF1224.2
   000384      1  039400                    PERFORM FAIL.                                 IF1224.2 232
   000385         039500     GO TO F-MIDRANGE-WRITE-03.                                   IF1224.2 389
   000386         039600 F-MIDRANGE-DELETE-03.                                            IF1224.2
   000387         039700     PERFORM  DE-LETE.                                            IF1224.2 233
   000388         039800     GO TO    F-MIDRANGE-WRITE-03.                                IF1224.2 389
   000389         039900 F-MIDRANGE-WRITE-03.                                             IF1224.2
   000390         040000     MOVE "F-MIDRANGE-03" TO PAR-NAME.                            IF1224.2 55
   000391         040100     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000392         040300 F-MIDRANGE-04.                                                   IF1224.2
   000393         040400     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000394         040500 F-MIDRANGE-TEST-04.                                              IF1224.2
   000395         040600     COMPUTE WS-NUM = FUNCTION MIDRANGE(E, F, G, H).              IF1224.2 44 IFN 30 31 32 33
   000396         040700     IF (WS-NUM >= 12.9697) AND                                   IF1224.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800        (WS-NUM <= 12.9703)                                       IF1224.2 44
   000398      1  040900                    PERFORM PASS                                  IF1224.2 231
   000399         041000     ELSE                                                         IF1224.2
   000400      1  041100                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000401      1  041200                    MOVE 12.97 TO CORRECT-N                       IF1224.2 81
   000402      1  041300                    PERFORM FAIL.                                 IF1224.2 232
   000403         041400     GO TO F-MIDRANGE-WRITE-04.                                   IF1224.2 407
   000404         041500 F-MIDRANGE-DELETE-04.                                            IF1224.2
   000405         041600     PERFORM  DE-LETE.                                            IF1224.2 233
   000406         041700     GO TO    F-MIDRANGE-WRITE-04.                                IF1224.2 407
   000407         041800 F-MIDRANGE-WRITE-04.                                             IF1224.2
   000408         041900     MOVE "F-MIDRANGE-04" TO PAR-NAME.                            IF1224.2 55
   000409         042000     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000410         042200 F-MIDRANGE-05.                                                   IF1224.2
   000411         042300     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000412         042400 F-MIDRANGE-TEST-05.                                              IF1224.2
   000413         042500     COMPUTE WS-NUM = FUNCTION MIDRANGE(10.2, -0.2, 5.6, -15.6).  IF1224.2 44 IFN
   000414         042600     IF (WS-NUM >= -2.70005) AND                                  IF1224.2 44
   000415         042700        (WS-NUM <= -2.69995)                                      IF1224.2 44
   000416      1  042800                    PERFORM PASS                                  IF1224.2 231
   000417         042900     ELSE                                                         IF1224.2
   000418      1  043000                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000419      1  043100                    MOVE -2.7 TO CORRECT-N                        IF1224.2 81
   000420      1  043200                    PERFORM FAIL.                                 IF1224.2 232
   000421         043300     GO TO F-MIDRANGE-WRITE-05.                                   IF1224.2 425
   000422         043400 F-MIDRANGE-DELETE-05.                                            IF1224.2
   000423         043500     PERFORM  DE-LETE.                                            IF1224.2 233
   000424         043600     GO TO    F-MIDRANGE-WRITE-05.                                IF1224.2 425
   000425         043700 F-MIDRANGE-WRITE-05.                                             IF1224.2
   000426         043800     MOVE "F-MIDRANGE-05" TO PAR-NAME.                            IF1224.2 55
   000427         043900     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000428         044100 F-MIDRANGE-06.                                                   IF1224.2
   000429         044200     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000430         044300 F-MIDRANGE-TEST-06.                                              IF1224.2
   000431         044400     COMPUTE WS-NUM = FUNCTION MIDRANGE(A, B, C, D, E, F, G, H).  IF1224.2 44 IFN 26 27 28 29 30 31 32 33
   000432         044500     IF (WS-NUM >= 12.9697) AND                                   IF1224.2 44
   000433         044600        (WS-NUM <= 12.9703)                                       IF1224.2 44
   000434      1  044700                    PERFORM PASS                                  IF1224.2 231
   000435         044800     ELSE                                                         IF1224.2
   000436      1  044900                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000437      1  045000                    MOVE 12.97 TO CORRECT-N                       IF1224.2 81
   000438      1  045100                    PERFORM FAIL.                                 IF1224.2 232
   000439         045200     GO TO F-MIDRANGE-WRITE-06.                                   IF1224.2 443
   000440         045300 F-MIDRANGE-DELETE-06.                                            IF1224.2
   000441         045400     PERFORM  DE-LETE.                                            IF1224.2 233
   000442         045500     GO TO    F-MIDRANGE-WRITE-06.                                IF1224.2 443
   000443         045600 F-MIDRANGE-WRITE-06.                                             IF1224.2
   000444         045700     MOVE "F-MIDRANGE-06" TO PAR-NAME.                            IF1224.2 55
   000445         045800     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000446         046000 F-MIDRANGE-07.                                                   IF1224.2
   000447         046100     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000448         046200 F-MIDRANGE-TEST-07.                                              IF1224.2
   000449         046300     COMPUTE WS-NUM = FUNCTION MIDRANGE(2.6 + 30, 4.5 * 2).       IF1224.2 44 IFN
   000450         046400     IF (WS-NUM >= 20.7996) AND                                   IF1224.2 44
   000451         046500        (WS-NUM <= 20.8004)                                       IF1224.2 44
   000452      1  046600                    PERFORM PASS                                  IF1224.2 231
   000453         046700     ELSE                                                         IF1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  046800                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000455      1  046900                    MOVE 20.8 TO CORRECT-N                        IF1224.2 81
   000456      1  047000                    PERFORM FAIL.                                 IF1224.2 232
   000457         047100     GO TO F-MIDRANGE-WRITE-07.                                   IF1224.2 461
   000458         047200 F-MIDRANGE-DELETE-07.                                            IF1224.2
   000459         047300     PERFORM  DE-LETE.                                            IF1224.2 233
   000460         047400     GO TO    F-MIDRANGE-WRITE-07.                                IF1224.2 461
   000461         047500 F-MIDRANGE-WRITE-07.                                             IF1224.2
   000462         047600     MOVE "F-MIDRANGE-07" TO PAR-NAME.                            IF1224.2 55
   000463         047700     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000464         047900 F-MIDRANGE-08.                                                   IF1224.2
   000465         048000     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000466         048100 F-MIDRANGE-TEST-08.                                              IF1224.2
   000467         048200     COMPUTE WS-NUM = FUNCTION MIDRANGE(IND(1), IND(2),           IF1224.2 44 IFN 42 42
   000468         048300                                                   IND(3)).       IF1224.2 42
   000469         048400     IF (WS-NUM >= 2.49995) AND                                   IF1224.2 44
   000470         048500        (WS-NUM <= 2.50005)                                       IF1224.2 44
   000471      1  048600                    PERFORM PASS                                  IF1224.2 231
   000472         048700     ELSE                                                         IF1224.2
   000473      1  048800                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000474      1  048900                    MOVE 2.5 TO CORRECT-N                         IF1224.2 81
   000475      1  049000                    PERFORM FAIL.                                 IF1224.2 232
   000476         049100     GO TO F-MIDRANGE-WRITE-08.                                   IF1224.2 480
   000477         049200 F-MIDRANGE-DELETE-08.                                            IF1224.2
   000478         049300     PERFORM  DE-LETE.                                            IF1224.2 233
   000479         049400     GO TO    F-MIDRANGE-WRITE-08.                                IF1224.2 480
   000480         049500 F-MIDRANGE-WRITE-08.                                             IF1224.2
   000481         049600     MOVE "F-MIDRANGE-08" TO PAR-NAME.                            IF1224.2 55
   000482         049700     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000483         049900 F-MIDRANGE-09.                                                   IF1224.2
   000484         050000     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000485         050100 F-MIDRANGE-TEST-09.                                              IF1224.2
   000486         050200     COMPUTE WS-NUM = FUNCTION MIDRANGE(IND(P), IND(Q),           IF1224.2 44 IFN 42 37 42 38
   000487         050300                                                  IND(R)).        IF1224.2 42 39
   000488         050400     IF (WS-NUM >= 5.49989) AND                                   IF1224.2 44
   000489         050500        (WS-NUM <= 5.50011)                                       IF1224.2 44
   000490      1  050600                    PERFORM PASS                                  IF1224.2 231
   000491         050700     ELSE                                                         IF1224.2
   000492      1  050800                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000493      1  050900                    MOVE 5.5 TO CORRECT-N                         IF1224.2 81
   000494      1  051000                    PERFORM FAIL.                                 IF1224.2 232
   000495         051100     GO TO F-MIDRANGE-WRITE-09.                                   IF1224.2 499
   000496         051200 F-MIDRANGE-DELETE-09.                                            IF1224.2
   000497         051300     PERFORM  DE-LETE.                                            IF1224.2 233
   000498         051400     GO TO    F-MIDRANGE-WRITE-09.                                IF1224.2 499
   000499         051500 F-MIDRANGE-WRITE-09.                                             IF1224.2
   000500         051600     MOVE "F-MIDRANGE-09" TO PAR-NAME.                            IF1224.2 55
   000501         051700     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000502         051900 F-MIDRANGE-10.                                                   IF1224.2
   000503         052000     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000504         052100 F-MIDRANGE-TEST-10.                                              IF1224.2
   000505         052200     COMPUTE WS-NUM = FUNCTION MIDRANGE(IND(ALL)).                IF1224.2 44 IFN 42
   000506         052300     IF (WS-NUM >= 3.49993) AND                                   IF1224.2 44
   000507         052400        (WS-NUM <= 3.50007)                                       IF1224.2 44
   000508      1  052500                    PERFORM PASS                                  IF1224.2 231
   000509         052600     ELSE                                                         IF1224.2
   000510      1  052700                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  052800                    MOVE 3.5 TO CORRECT-N                         IF1224.2 81
   000512      1  052900                    PERFORM FAIL.                                 IF1224.2 232
   000513         053000     GO TO F-MIDRANGE-WRITE-10.                                   IF1224.2 517
   000514         053100 F-MIDRANGE-DELETE-10.                                            IF1224.2
   000515         053200     PERFORM  DE-LETE.                                            IF1224.2 233
   000516         053300     GO TO    F-MIDRANGE-WRITE-10.                                IF1224.2 517
   000517         053400 F-MIDRANGE-WRITE-10.                                             IF1224.2
   000518         053500     MOVE "F-MIDRANGE-10" TO PAR-NAME.                            IF1224.2 55
   000519         053600     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000520         053800 F-MIDRANGE-12.                                                   IF1224.2
   000521         053900     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000522         054000 F-MIDRANGE-TEST-12.                                              IF1224.2
   000523         054100     COMPUTE WS-NUM = FUNCTION MIDRANGE(M, N, O).                 IF1224.2 44 IFN 34 35 36
   000524         054200     IF WS-NUM = 110000 THEN                                      IF1224.2 44
   000525      1  054300                    PERFORM PASS                                  IF1224.2 231
   000526         054400     ELSE                                                         IF1224.2
   000527      1  054500                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000528      1  054600                    MOVE 110000 TO CORRECT-N                      IF1224.2 81
   000529      1  054700                    PERFORM FAIL.                                 IF1224.2 232
   000530         054800     GO TO F-MIDRANGE-WRITE-12.                                   IF1224.2 534
   000531         054900 F-MIDRANGE-DELETE-12.                                            IF1224.2
   000532         055000     PERFORM  DE-LETE.                                            IF1224.2 233
   000533         055100     GO TO    F-MIDRANGE-WRITE-12.                                IF1224.2 534
   000534         055200 F-MIDRANGE-WRITE-12.                                             IF1224.2
   000535         055300     MOVE "F-MIDRANGE-12" TO PAR-NAME.                            IF1224.2 55
   000536         055400     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000537         055600 F-MIDRANGE-13.                                                   IF1224.2
   000538         055700     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000539         055800 F-MIDRANGE-TEST-13.                                              IF1224.2
   000540         055900     COMPUTE WS-NUM = FUNCTION MIDRANGE(A, 5, A).                 IF1224.2 44 IFN 26 26
   000541         056000     IF WS-NUM = 5 THEN                                           IF1224.2 44
   000542      1  056100                    PERFORM PASS                                  IF1224.2 231
   000543         056200     ELSE                                                         IF1224.2
   000544      1  056300                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000545      1  056400                    MOVE 5 TO CORRECT-N                           IF1224.2 81
   000546      1  056500                    PERFORM FAIL.                                 IF1224.2 232
   000547         056600     GO TO F-MIDRANGE-WRITE-13.                                   IF1224.2 551
   000548         056700 F-MIDRANGE-DELETE-13.                                            IF1224.2
   000549         056800     PERFORM  DE-LETE.                                            IF1224.2 233
   000550         056900     GO TO    F-MIDRANGE-WRITE-13.                                IF1224.2 551
   000551         057000 F-MIDRANGE-WRITE-13.                                             IF1224.2
   000552         057100     MOVE "F-MIDRANGE-13" TO PAR-NAME.                            IF1224.2 55
   000553         057200     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000554         057400 F-MIDRANGE-14.                                                   IF1224.2
   000555         057500     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000556         057600     MOVE  22.4995   TO MIN-RANGE.                                IF1224.2 45
   000557         057700     MOVE  22.5004 TO MAX-RANGE.                                  IF1224.2 46
   000558         057800 F-MIDRANGE-TEST-14.                                              IF1224.2
   000559         057900     COMPUTE WS-NUM = FUNCTION MIDRANGE(E, 9 * A, 0, B / 2).      IF1224.2 44 IFN 30 26 27
   000560         058000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1224.2 44 45
   000561         058100        (WS-NUM <= MAX-RANGE) THEN                                IF1224.2 44 46
   000562      1  058200                    PERFORM PASS                                  IF1224.2 231
   000563         058300     ELSE                                                         IF1224.2
   000564      1  058400                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000565      1  058500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1224.2 45 95
   000566      1  058600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1224.2 46 109
   000567      1  058700                    PERFORM FAIL.                                 IF1224.2 232
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058800     GO TO F-MIDRANGE-WRITE-14.                                   IF1224.2 572
   000569         058900 F-MIDRANGE-DELETE-14.                                            IF1224.2
   000570         059000     PERFORM  DE-LETE.                                            IF1224.2 233
   000571         059100     GO TO    F-MIDRANGE-WRITE-14.                                IF1224.2 572
   000572         059200 F-MIDRANGE-WRITE-14.                                             IF1224.2
   000573         059300     MOVE "F-MIDRANGE-14" TO PAR-NAME.                            IF1224.2 55
   000574         059400     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000575         059600 F-MIDRANGE-15.                                                   IF1224.2
   000576         059700     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000577         059800     MOVE 83.9983 TO MIN-RANGE.                                   IF1224.2 45
   000578         059900     MOVE 84.0017 TO MAX-RANGE.                                   IF1224.2 46
   000579         060000 F-MIDRANGE-TEST-15.                                              IF1224.2
   000580         060100     COMPUTE WS-NUM = FUNCTION MIDRANGE(A, B) + 78.               IF1224.2 44 IFN 26 27
   000581         060200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1224.2 44 45
   000582         060300        (WS-NUM <= MAX-RANGE) THEN                                IF1224.2 44 46
   000583      1  060400                    PERFORM PASS                                  IF1224.2 231
   000584         060500     ELSE                                                         IF1224.2
   000585      1  060600                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000586      1  060700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1224.2 45 95
   000587      1  060800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1224.2 46 109
   000588      1  060900                    PERFORM FAIL.                                 IF1224.2 232
   000589         061000     GO TO F-MIDRANGE-WRITE-15.                                   IF1224.2 593
   000590         061100 F-MIDRANGE-DELETE-15.                                            IF1224.2
   000591         061200     PERFORM  DE-LETE.                                            IF1224.2 233
   000592         061300     GO TO    F-MIDRANGE-WRITE-15.                                IF1224.2 593
   000593         061400 F-MIDRANGE-WRITE-15.                                             IF1224.2
   000594         061500     MOVE "F-MIDRANGE-15" TO PAR-NAME.                            IF1224.2 55
   000595         061600     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000596         061800 F-MIDRANGE-16.                                                   IF1224.2
   000597         061900     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000598         062000     MOVE 2.49995 TO MIN-RANGE.                                   IF1224.2 45
   000599         062100     MOVE 2.50005 TO MAX-RANGE.                                   IF1224.2 46
   000600         062200 F-MIDRANGE-TEST-16.                                              IF1224.2
   000601         062300     COMPUTE WS-NUM = FUNCTION MIDRANGE(A, B) +                   IF1224.2 44 IFN 26 27
   000602         062400                      FUNCTION MIDRANGE(-2.6, -4.4).              IF1224.2 IFN
   000603         062500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1224.2 44 45
   000604         062600        (WS-NUM <= MAX-RANGE) THEN                                IF1224.2 44 46
   000605      1  062700                    PERFORM PASS                                  IF1224.2 231
   000606         062800     ELSE                                                         IF1224.2
   000607      1  062900                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000608      1  063000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1224.2 45 95
   000609      1  063100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1224.2 46 109
   000610      1  063200                    PERFORM FAIL.                                 IF1224.2 232
   000611         063300     GO TO F-MIDRANGE-WRITE-16.                                   IF1224.2 615
   000612         063400 F-MIDRANGE-DELETE-16.                                            IF1224.2
   000613         063500     PERFORM  DE-LETE.                                            IF1224.2 233
   000614         063600     GO TO    F-MIDRANGE-WRITE-16.                                IF1224.2 615
   000615         063700 F-MIDRANGE-WRITE-16.                                             IF1224.2
   000616         063800     MOVE "F-MIDRANGE-16" TO PAR-NAME.                            IF1224.2 55
   000617         063900     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000618         064100 F-MIDRANGE-17.                                                   IF1224.2
   000619         064200     MOVE ZERO TO WS-NUM.                                         IF1224.2 IMP 44
   000620         064300     MOVE 3.49993 TO MIN-RANGE.                                   IF1224.2 45
   000621         064400     MOVE 3.50007 TO MAX-RANGE.                                   IF1224.2 46
   000622         064500 F-MIDRANGE-TEST-17.                                              IF1224.2
   000623         064600     COMPUTE WS-NUM =                                             IF1224.2 44
   000624         064700             FUNCTION MIDRANGE(FUNCTION MIDRANGE(1, 3), 5).       IF1224.2 IFN IFN
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1224.2 44 45
   000626         064900        (WS-NUM <= MAX-RANGE) THEN                                IF1224.2 44 46
   000627      1  065000                    PERFORM PASS                                  IF1224.2 231
   000628         065100     ELSE                                                         IF1224.2
   000629      1  065200                    MOVE WS-NUM TO COMPUTED-N                     IF1224.2 44 67
   000630      1  065300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1224.2 45 95
   000631      1  065400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1224.2 46 109
   000632      1  065500                    PERFORM FAIL.                                 IF1224.2 232
   000633         065600     GO TO F-MIDRANGE-WRITE-17.                                   IF1224.2 637
   000634         065700 F-MIDRANGE-DELETE-17.                                            IF1224.2
   000635         065800     PERFORM  DE-LETE.                                            IF1224.2 233
   000636         065900     GO TO    F-MIDRANGE-WRITE-17.                                IF1224.2 637
   000637         066000 F-MIDRANGE-WRITE-17.                                             IF1224.2
   000638         066100     MOVE "F-MIDRANGE-17" TO PAR-NAME.                            IF1224.2 55
   000639         066200     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000640         066400 F-MIDRANGE-18.                                                   IF1224.2
   000641         066500     PERFORM F-MIDRANGE-TEST-18                                   IF1224.2 645
   000642         066600       UNTIL FUNCTION MIDRANGE(1, ARG1) > 10.                     IF1224.2 IFN 40
   000643         066700     PERFORM PASS.                                                IF1224.2 231
   000644         066800     GO TO F-MIDRANGE-WRITE-18.                                   IF1224.2 650
   000645         066900 F-MIDRANGE-TEST-18.                                              IF1224.2
   000646         067000     COMPUTE ARG1 = ARG1 + 1.                                     IF1224.2 40 40
   000647         067100 F-MIDRANGE-DELETE-18.                                            IF1224.2
   000648         067200     PERFORM  DE-LETE.                                            IF1224.2 233
   000649         067300     GO TO    F-MIDRANGE-WRITE-18.                                IF1224.2 650
   000650         067400 F-MIDRANGE-WRITE-18.                                             IF1224.2
   000651         067500     MOVE "F-MIDRANGE-18" TO PAR-NAME.                            IF1224.2 55
   000652         067600     PERFORM  PRINT-DETAIL.                                       IF1224.2 235
   000653         067800 CCVS-EXIT SECTION.                                               IF1224.2
   000654         067900 CCVS-999999.                                                     IF1224.2
   000655         068000     GO TO CLOSE-FILES.                                           IF1224.2 226
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  381 431 540 540 559 580 601
      139   ANSI-REFERENCE . . . . . . . .  313 320 336 M347
       40   ARG1 . . . . . . . . . . . . .  642 M646 646
       41   ARR
       27   B. . . . . . . . . . . . . . .  381 431 559 580 601
       28   C. . . . . . . . . . . . . . .  381 431
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
       67   COMPUTED-N . . . . . . . . . .  M357 M400 M418 M436 M454 M473 M492 M510 M527 M544 M564 M585 M607 M629
       65   COMPUTED-X . . . . . . . . . .  M243 310
       69   COMPUTED-0V18
       71   COMPUTED-14V4
       73   COMPUTED-18V0
       70   COMPUTED-4V14
       89   COR-ANSI-REFERENCE . . . . . .  M320 M328
      117   CORMA-ANSI-REFERENCE . . . . .  M321
       80   CORRECT-A. . . . . . . . . . .  81 82 83 84 85 332 334
      109   CORRECT-MAX. . . . . . . . . .  M566 M587 M609 M631
       95   CORRECT-MIN. . . . . . . . . .  322 M565 M586 M608 M630
       81   CORRECT-N. . . . . . . . . . .  M358 M401 M419 M437 M455 M474 M493 M511 M528 M545
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    16
0 Defined   Cross-reference of data names   References

0      29   D. . . . . . . . . . . . . . .  381 431
      131   DELETE-COUNTER . . . . . . . .  M233 262 277 279
       58   DOTVALUE . . . . . . . . . . .  M238
      137   DUMMY-HOLD . . . . . . . . . .  M291 301
       23   DUMMY-RECORD . . . . . . . . .  M248 M249 M250 M251 M253 M254 M255 M257 M259 M267 M274 M281 M286 M287 291 M292
                                            293 M294 M295 M296 M297 M298 M299 M300 M301 305 M306 M315 M337
       30   E. . . . . . . . . . . . . . .  395 431 559
      184   ENDER-DESC . . . . . . . . . .  M269 M280 M285
      132   ERROR-COUNTER. . . . . . . . .  M232 261 270 273
      136   ERROR-HOLD . . . . . . . . . .  M261 M262 M262 M263 265
      182   ERROR-TOTAL. . . . . . . . . .  M271 M273 M278 M279 M283 M284
       31   F. . . . . . . . . . . . . . .  395 431
       51   FEATURE. . . . . . . . . . . .  M348
       32   G. . . . . . . . . . . . . . .  395 431
       33   H. . . . . . . . . . . . . . .  395 431
      210   HYPHEN-LINE. . . . . . . . . .  255 257 300
      176   ID-AGAIN . . . . . . . . . . .  M222
       42   IND. . . . . . . . . . . . . .  467 467 468 486 486 487 505
      209   INF-ANSI-REFERENCE . . . . . .  M313 M316 M336 M338
      204   INFO-TEXT. . . . . . . . . . .  M314
      133   INSPECT-COUNTER. . . . . . . .  M230 261 282 284
       34   M. . . . . . . . . . . . . . .  523
       46   MAX-RANGE. . . . . . . . . . .  M557 561 566 M578 582 587 M599 604 609 M621 626 631
       45   MIN-RANGE. . . . . . . . . . .  M556 560 565 M577 581 586 M598 603 608 M620 625 630
       35   N. . . . . . . . . . . . . . .  523
       36   O. . . . . . . . . . . . . . .  523
       37   P. . . . . . . . . . . . . . .  486
       53   P-OR-F . . . . . . . . . . . .  M230 M231 M232 M233 240 M243
       55   PAR-NAME . . . . . . . . . . .  M245 M365 M378 M390 M408 M426 M444 M462 M481 M500 M518 M535 M552 M573 M594 M616
                                            M638 M651
       57   PARDOT-X . . . . . . . . . . .  M237
      134   PASS-COUNTER . . . . . . . . .  M231 263 264
       21   PRINT-FILE . . . . . . . . . .  17 221 227
       22   PRINT-REC. . . . . . . . . . .  M239 M319 M323 M324 M326
       38   Q. . . . . . . . . . . . . . .  486
       39   R. . . . . . . . . . . . . . .  487
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
       44   WS-NUM . . . . . . . . . . . .  M350 M352 353 354 357 M393 M395 396 397 400 M411 M413 414 415 418 M429 M431 432
                                            433 436 M447 M449 450 451 454 M465 M467 469 470 473 M484 M486 488 489 492 M503
                                            M505 506 507 510 M521 M523 524 527 M538 M540 541 544 M555 M559 560 561 564 M576
                                            M580 581 582 585 M597 M601 603 604 607 M619 M623 625 626 629
      206   XXCOMPUTED . . . . . . . . . .  M335
      208   XXCORRECT. . . . . . . . . . .  M334
      201   XXINFO . . . . . . . . . . . .  315 337
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    17
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
      653   CCVS-EXIT
      654   CCVS-999999
      219   CCVS1
      340   CCVS1-EXIT . . . . . . . . . .  G225
      226   CLOSE-FILES. . . . . . . . . .  G655
      252   COLUMN-NAMES-ROUTINE . . . . .  E224
      233   DE-LETE. . . . . . . . . . . .  P362 P375 P387 P405 P423 P441 P459 P478 P497 P515 P532 P549 P570 P591 P613 P635
                                            P648
      256   END-ROUTINE. . . . . . . . . .  P227
      260   END-ROUTINE-1
      268   END-ROUTINE-12
      276   END-ROUTINE-13 . . . . . . . .  E227
      258   END-RTN-EXIT
      361   F-MIDRANGE-DELETE-01
      374   F-MIDRANGE-DELETE-02
      386   F-MIDRANGE-DELETE-03
      404   F-MIDRANGE-DELETE-04
      422   F-MIDRANGE-DELETE-05
      440   F-MIDRANGE-DELETE-06
      458   F-MIDRANGE-DELETE-07
      477   F-MIDRANGE-DELETE-08
      496   F-MIDRANGE-DELETE-09
      514   F-MIDRANGE-DELETE-10
      531   F-MIDRANGE-DELETE-12
      548   F-MIDRANGE-DELETE-13
      569   F-MIDRANGE-DELETE-14
      590   F-MIDRANGE-DELETE-15
      612   F-MIDRANGE-DELETE-16
      634   F-MIDRANGE-DELETE-17
      647   F-MIDRANGE-DELETE-18
      346   F-MIDRANGE-INFO
      351   F-MIDRANGE-TEST-01
      394   F-MIDRANGE-TEST-04
      412   F-MIDRANGE-TEST-05
      430   F-MIDRANGE-TEST-06
      448   F-MIDRANGE-TEST-07
      466   F-MIDRANGE-TEST-08
      485   F-MIDRANGE-TEST-09
      504   F-MIDRANGE-TEST-10
      522   F-MIDRANGE-TEST-12
      539   F-MIDRANGE-TEST-13
      558   F-MIDRANGE-TEST-14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    18
0 Defined   Cross-reference of procedures   References

0     579   F-MIDRANGE-TEST-15
      600   F-MIDRANGE-TEST-16
      622   F-MIDRANGE-TEST-17
      645   F-MIDRANGE-TEST-18 . . . . . .  P641
      364   F-MIDRANGE-WRITE-01. . . . . .  G360 G363
      377   F-MIDRANGE-WRITE-02. . . . . .  G373 G376
      389   F-MIDRANGE-WRITE-03. . . . . .  G385 G388
      407   F-MIDRANGE-WRITE-04. . . . . .  G403 G406
      425   F-MIDRANGE-WRITE-05. . . . . .  G421 G424
      443   F-MIDRANGE-WRITE-06. . . . . .  G439 G442
      461   F-MIDRANGE-WRITE-07. . . . . .  G457 G460
      480   F-MIDRANGE-WRITE-08. . . . . .  G476 G479
      499   F-MIDRANGE-WRITE-09. . . . . .  G495 G498
      517   F-MIDRANGE-WRITE-10. . . . . .  G513 G516
      534   F-MIDRANGE-WRITE-12. . . . . .  G530 G533
      551   F-MIDRANGE-WRITE-13. . . . . .  G547 G550
      572   F-MIDRANGE-WRITE-14. . . . . .  G568 G571
      593   F-MIDRANGE-WRITE-15. . . . . .  G589 G592
      615   F-MIDRANGE-WRITE-16. . . . . .  G611 G614
      637   F-MIDRANGE-WRITE-17. . . . . .  G633 G636
      650   F-MIDRANGE-WRITE-18. . . . . .  G644 G649
      349   F-MIDRANGE-01
      367   F-MIDRANGE-02
      380   F-MIDRANGE-03
      392   F-MIDRANGE-04
      410   F-MIDRANGE-05
      428   F-MIDRANGE-06
      446   F-MIDRANGE-07
      464   F-MIDRANGE-08
      483   F-MIDRANGE-09
      502   F-MIDRANGE-10
      520   F-MIDRANGE-12
      537   F-MIDRANGE-13
      554   F-MIDRANGE-14
      575   F-MIDRANGE-15
      596   F-MIDRANGE-16
      618   F-MIDRANGE-17
      640   F-MIDRANGE-18
      232   FAIL . . . . . . . . . . . . .  P359 P372 P384 P402 P420 P438 P456 P475 P494 P512 P529 P546 P567 P588 P610 P632
      309   FAIL-ROUTINE . . . . . . . . .  P241
      329   FAIL-ROUTINE-EX. . . . . . . .  E241 G317
      318   FAIL-ROUTINE-WRITE . . . . . .  G311 G312
      247   HEAD-ROUTINE . . . . . . . . .  P224
      230   INSPT
      220   OPEN-FILES
      231   PASS . . . . . . . . . . . . .  P355 P370 P382 P398 P416 P434 P452 P471 P490 P508 P525 P542 P562 P583 P605 P627
                                            P643
      235   PRINT-DETAIL . . . . . . . . .  P366 P379 P391 P409 P427 P445 P463 P482 P501 P519 P536 P553 P574 P595 P617 P639
                                            P652
      345   SECT-IF122A
      228   TERMINATE-CCVS
      288   WRITE-LINE . . . . . . . . . .  P239 P240 P248 P249 P250 P251 P253 P254 P255 P257 P259 P267 P275 P281 P286 P287
                                            P315 P319 P323 P324 P326 P327 P337
      304   WRT-LN . . . . . . . . . . . .  P294 P295 P296 P297 P298 P299 P300 P303 P308
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    19
0 Defined   Cross-reference of programs     References

        3   IF122A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF122A    Date 06/04/2022  Time 11:59:15   Page    20
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF122A:
 *    Source records = 655
 *    Data Division statements = 103
 *    Procedure Division statements = 347
 *    Generated COBOL statements = 0
 *    Program complexity factor = 359
0End of compilation 1,  program IF122A,  highest severity 0.
0Return code 0
