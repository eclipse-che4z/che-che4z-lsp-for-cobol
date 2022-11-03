1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:20   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:20   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1334.2
   000002         000200 PROGRAM-ID.                                                      IF1334.2
   000003         000300     IF133A.                                                      IF1334.2
   000004         000400                                                                  IF1334.2
   000005         000600*                                                         *       IF1334.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1334.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1334.2
   000008         000900* REM.                                                    *       IF1334.2
   000009         001000*                                                         *       IF1334.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1334.2
   000011         001300 CONFIGURATION SECTION.                                           IF1334.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1334.2
   000013         001500     XXXXX082.                                                    IF1334.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1334.2
   000015         001700     XXXXX083.                                                    IF1334.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1334.2
   000017         001900 FILE-CONTROL.                                                    IF1334.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1334.2 22
   000019         002100     XXXXX055.                                                    IF1334.2
   000020         002200 DATA DIVISION.                                                   IF1334.2
   000021         002300 FILE SECTION.                                                    IF1334.2
   000022         002400 FD  PRINT-FILE.                                                  IF1334.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1334.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1334.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1334.2
   000026         002900* Variables specific to the Intrinsic Function Test IF133A*       IF1334.2
   000027         003100 01  A                   PIC S9(10)          VALUE 5.             IF1334.2
   000028         003200 01  B                   PIC S9(5)V9(5)      VALUE 7.36.          IF1334.2
   000029         003300 01  C                   PIC S9(10)          VALUE -4.            IF1334.2
   000030         003400 01  D                   PIC S9(10)          VALUE 7.             IF1334.2
   000031         003500 01  ARG2                PIC S9(10)          VALUE 1.             IF1334.2
   000032         003600 01  TEMP                PIC S9(10).                              IF1334.2
   000033         003700 01  WS-NUM              PIC S9(5)V9(6).                          IF1334.2
   000034         003800 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1334.2
   000035         003900 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1334.2
   000036         004000*                                                                 IF1334.2
   000037         004200*                                                                 IF1334.2
   000038         004300 01  TEST-RESULTS.                                                IF1334.2
   000039         004400     02 FILLER                   PIC X      VALUE SPACE.          IF1334.2 IMP
   000040         004500     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1334.2 IMP
   000041         004600     02 FILLER                   PIC X      VALUE SPACE.          IF1334.2 IMP
   000042         004700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1334.2 IMP
   000043         004800     02 FILLER                   PIC X      VALUE SPACE.          IF1334.2 IMP
   000044         004900     02  PAR-NAME.                                                IF1334.2
   000045         005000       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1334.2 IMP
   000046         005100       03  PARDOT-X              PIC X      VALUE SPACE.          IF1334.2 IMP
   000047         005200       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1334.2 IMP
   000048         005300     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1334.2 IMP
   000049         005400     02 RE-MARK                  PIC X(61).                       IF1334.2
   000050         005500 01  TEST-COMPUTED.                                               IF1334.2
   000051         005600     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1334.2 IMP
   000052         005700     02 FILLER                   PIC X(17)  VALUE                 IF1334.2
   000053         005800            "       COMPUTED=".                                   IF1334.2
   000054         005900     02 COMPUTED-X.                                               IF1334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1334.2 IMP
   000056         006100     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1334.2 55
   000057         006200                                 PIC -9(9).9(9).                  IF1334.2
   000058         006300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1334.2 55
   000059         006400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1334.2 55
   000060         006500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1334.2 55
   000061         006600     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1334.2 55
   000062         006700         04 COMPUTED-18V0                    PIC -9(18).          IF1334.2
   000063         006800         04 FILLER                           PIC X.               IF1334.2
   000064         006900     03 FILLER PIC X(50) VALUE SPACE.                             IF1334.2 IMP
   000065         007000 01  TEST-CORRECT.                                                IF1334.2
   000066         007100     02 FILLER PIC X(30) VALUE SPACE.                             IF1334.2 IMP
   000067         007200     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1334.2
   000068         007300     02 CORRECT-X.                                                IF1334.2
   000069         007400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1334.2 IMP
   000070         007500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1334.2 69
   000071         007600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1334.2 69
   000072         007700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1334.2 69
   000073         007800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1334.2 69
   000074         007900     03      CR-18V0 REDEFINES CORRECT-A.                         IF1334.2 69
   000075         008000         04 CORRECT-18V0                     PIC -9(18).          IF1334.2
   000076         008100         04 FILLER                           PIC X.               IF1334.2
   000077         008200     03 FILLER PIC X(2) VALUE SPACE.                              IF1334.2 IMP
   000078         008300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1334.2 IMP
   000079         008400 01  TEST-CORRECT-MIN.                                            IF1334.2
   000080         008500     02 FILLER PIC X(30) VALUE SPACE.                             IF1334.2 IMP
   000081         008600     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1334.2
   000082         008700     02 CORRECTMI-X.                                              IF1334.2
   000083         008800     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1334.2 IMP
   000084         008900     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1334.2 83
   000085         009000     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1334.2 83
   000086         009100     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1334.2 83
   000087         009200     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1334.2 83
   000088         009300     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1334.2 83
   000089         009400         04 CORRECTMI-18V0                     PIC -9(18).        IF1334.2
   000090         009500         04 FILLER                           PIC X.               IF1334.2
   000091         009600     03 FILLER PIC X(2) VALUE SPACE.                              IF1334.2 IMP
   000092         009700     03 FILLER                           PIC X(48) VALUE SPACE.   IF1334.2 IMP
   000093         009800 01  TEST-CORRECT-MAX.                                            IF1334.2
   000094         009900     02 FILLER PIC X(30) VALUE SPACE.                             IF1334.2 IMP
   000095         010000     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1334.2
   000096         010100     02 CORRECTMA-X.                                              IF1334.2
   000097         010200     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1334.2 IMP
   000098         010300     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1334.2 97
   000099         010400     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1334.2 97
   000100         010500     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1334.2 97
   000101         010600     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1334.2 97
   000102         010700     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1334.2 97
   000103         010800         04 CORRECTMA-18V0                     PIC -9(18).        IF1334.2
   000104         010900         04 FILLER                           PIC X.               IF1334.2
   000105         011000     03 FILLER PIC X(2) VALUE SPACE.                              IF1334.2 IMP
   000106         011100     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1334.2 IMP
   000107         011200 01  CCVS-C-1.                                                    IF1334.2
   000108         011300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1334.2
   000109         011400-    "SS  PARAGRAPH-NAME                                          IF1334.2
   000110         011500-    "       REMARKS".                                            IF1334.2
   000111         011600     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1334.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700 01  CCVS-C-2.                                                    IF1334.2
   000113         011800     02 FILLER                     PIC X        VALUE SPACE.      IF1334.2 IMP
   000114         011900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1334.2
   000115         012000     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1334.2 IMP
   000116         012100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1334.2
   000117         012200     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1334.2 IMP
   000118         012300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1334.2 IMP
   000119         012400 01  REC-CT                        PIC 99       VALUE ZERO.       IF1334.2 IMP
   000120         012500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1334.2 IMP
   000121         012600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1334.2 IMP
   000122         012700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1334.2 IMP
   000123         012800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1334.2 IMP
   000124         012900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1334.2 IMP
   000125         013000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1334.2 IMP
   000126         013100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1334.2 IMP
   000127         013200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1334.2 IMP
   000128         013300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1334.2 IMP
   000129         013400 01  CCVS-H-1.                                                    IF1334.2
   000130         013500     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1334.2 IMP
   000131         013600     02  FILLER                    PIC X(42)    VALUE             IF1334.2
   000132         013700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1334.2
   000133         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1334.2 IMP
   000134         013900 01  CCVS-H-2A.                                                   IF1334.2
   000135         014000   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1334.2 IMP
   000136         014100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1334.2
   000137         014200   02  FILLER                        PIC XXXX   VALUE             IF1334.2
   000138         014300     "4.2 ".                                                      IF1334.2
   000139         014400   02  FILLER                        PIC X(28)  VALUE             IF1334.2
   000140         014500            " COPY - NOT FOR DISTRIBUTION".                       IF1334.2
   000141         014600   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1334.2 IMP
   000142         014700                                                                  IF1334.2
   000143         014800 01  CCVS-H-2B.                                                   IF1334.2
   000144         014900   02  FILLER                        PIC X(15)  VALUE             IF1334.2
   000145         015000            "TEST RESULT OF ".                                    IF1334.2
   000146         015100   02  TEST-ID                       PIC X(9).                    IF1334.2
   000147         015200   02  FILLER                        PIC X(4)   VALUE             IF1334.2
   000148         015300            " IN ".                                               IF1334.2
   000149         015400   02  FILLER                        PIC X(12)  VALUE             IF1334.2
   000150         015500     " HIGH       ".                                              IF1334.2
   000151         015600   02  FILLER                        PIC X(22)  VALUE             IF1334.2
   000152         015700            " LEVEL VALIDATION FOR ".                             IF1334.2
   000153         015800   02  FILLER                        PIC X(58)  VALUE             IF1334.2
   000154         015900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1334.2
   000155         016000 01  CCVS-H-3.                                                    IF1334.2
   000156         016100     02  FILLER                      PIC X(34)  VALUE             IF1334.2
   000157         016200            " FOR OFFICIAL USE ONLY    ".                         IF1334.2
   000158         016300     02  FILLER                      PIC X(58)  VALUE             IF1334.2
   000159         016400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1334.2
   000160         016500     02  FILLER                      PIC X(28)  VALUE             IF1334.2
   000161         016600            "  COPYRIGHT   1985 ".                                IF1334.2
   000162         016700 01  CCVS-E-1.                                                    IF1334.2
   000163         016800     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1334.2 IMP
   000164         016900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1334.2
   000165         017000     02 ID-AGAIN                     PIC X(9).                    IF1334.2
   000166         017100     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1334.2 IMP
   000167         017200 01  CCVS-E-2.                                                    IF1334.2
   000168         017300     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1334.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1334.2 IMP
   000170         017500     02 CCVS-E-2-2.                                               IF1334.2
   000171         017600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1334.2 IMP
   000172         017700         03 FILLER                   PIC X      VALUE SPACE.      IF1334.2 IMP
   000173         017800         03 ENDER-DESC               PIC X(44)  VALUE             IF1334.2
   000174         017900            "ERRORS ENCOUNTERED".                                 IF1334.2
   000175         018000 01  CCVS-E-3.                                                    IF1334.2
   000176         018100     02  FILLER                      PIC X(22)  VALUE             IF1334.2
   000177         018200            " FOR OFFICIAL USE ONLY".                             IF1334.2
   000178         018300     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1334.2 IMP
   000179         018400     02  FILLER                      PIC X(58)  VALUE             IF1334.2
   000180         018500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1334.2
   000181         018600     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1334.2 IMP
   000182         018700     02 FILLER                       PIC X(15)  VALUE             IF1334.2
   000183         018800             " COPYRIGHT 1985".                                   IF1334.2
   000184         018900 01  CCVS-E-4.                                                    IF1334.2
   000185         019000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1334.2 IMP
   000186         019100     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1334.2
   000187         019200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1334.2 IMP
   000188         019300     02 FILLER                       PIC X(40)  VALUE             IF1334.2
   000189         019400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1334.2
   000190         019500 01  XXINFO.                                                      IF1334.2
   000191         019600     02 FILLER                       PIC X(19)  VALUE             IF1334.2
   000192         019700            "*** INFORMATION ***".                                IF1334.2
   000193         019800     02 INFO-TEXT.                                                IF1334.2
   000194         019900       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1334.2 IMP
   000195         020000       04 XXCOMPUTED                 PIC X(20).                   IF1334.2
   000196         020100       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1334.2 IMP
   000197         020200       04 XXCORRECT                  PIC X(20).                   IF1334.2
   000198         020300     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1334.2
   000199         020400 01  HYPHEN-LINE.                                                 IF1334.2
   000200         020500     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1334.2 IMP
   000201         020600     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1334.2
   000202         020700-    "*****************************************".                 IF1334.2
   000203         020800     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1334.2
   000204         020900-    "******************************".                            IF1334.2
   000205         021000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1334.2
   000206         021100     "IF133A".                                                    IF1334.2
   000207         021200 PROCEDURE DIVISION.                                              IF1334.2
   000208         021300 CCVS1 SECTION.                                                   IF1334.2
   000209         021400 OPEN-FILES.                                                      IF1334.2
   000210         021500     OPEN     OUTPUT PRINT-FILE.                                  IF1334.2 22
   000211         021600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1334.2 205 146 205 165
   000212         021700     MOVE    SPACE TO TEST-RESULTS.                               IF1334.2 IMP 38
   000213         021800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1334.2 236 241
   000214         021900     GO TO CCVS1-EXIT.                                            IF1334.2 329
   000215         022000 CLOSE-FILES.                                                     IF1334.2
   000216         022100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1334.2 245 265 22
   000217         022200 TERMINATE-CCVS.                                                  IF1334.2
   000218         022300     STOP     RUN.                                                IF1334.2
   000219         022400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1334.2 42 122
   000220         022500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1334.2 42 123
   000221         022600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1334.2 42 121
   000222         022700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1334.2 42 120
   000223         022800     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1334.2 49
   000224         022900 PRINT-DETAIL.                                                    IF1334.2
   000225         023000     IF REC-CT NOT EQUAL TO ZERO                                  IF1334.2 119 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  023100             MOVE "." TO PARDOT-X                                 IF1334.2 46
   000227      1  023200             MOVE REC-CT TO DOTVALUE.                             IF1334.2 119 47
   000228         023300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1334.2 38 23 277
   000229         023400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1334.2 42 277
   000230      1  023500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1334.2 298 318
   000231      1  023600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1334.2 319 328
   000232         023700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1334.2 IMP 42 IMP 54
   000233         023800     MOVE SPACE TO CORRECT-X.                                     IF1334.2 IMP 68
   000234         023900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1334.2 119 IMP IMP 44
   000235         024000     MOVE     SPACE TO RE-MARK.                                   IF1334.2 IMP 49
   000236         024100 HEAD-ROUTINE.                                                    IF1334.2
   000237         024200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1334.2 129 24 277
   000238         024300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1334.2 134 24 277
   000239         024400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1334.2 143 24 277
   000240         024500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1334.2 155 24 277
   000241         024600 COLUMN-NAMES-ROUTINE.                                            IF1334.2
   000242         024700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1334.2 107 24 277
   000243         024800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1334.2 112 24 277
   000244         024900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1334.2 199 24 277
   000245         025000 END-ROUTINE.                                                     IF1334.2
   000246         025100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1334.2 199 24 277
   000247         025200 END-RTN-EXIT.                                                    IF1334.2
   000248         025300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1334.2 162 24 277
   000249         025400 END-ROUTINE-1.                                                   IF1334.2
   000250         025500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1334.2 121 125 122
   000251         025600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1334.2 125 120 125
   000252         025700      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1334.2 123 125
   000253         025800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1334.2 123 185
   000254         025900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1334.2 125 187
   000255         026000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1334.2 184 170
   000256         026100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1334.2 167 24 277
   000257         026200  END-ROUTINE-12.                                                 IF1334.2
   000258         026300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1334.2 173
   000259         026400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1334.2 121 IMP
   000260      1  026500         MOVE "NO " TO ERROR-TOTAL                                IF1334.2 171
   000261         026600         ELSE                                                     IF1334.2
   000262      1  026700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1334.2 121 171
   000263         026800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1334.2 167 24
   000264         026900     PERFORM WRITE-LINE.                                          IF1334.2 277
   000265         027000 END-ROUTINE-13.                                                  IF1334.2
   000266         027100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1334.2 120 IMP
   000267      1  027200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1334.2 171
   000268      1  027300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1334.2 120 171
   000269         027400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1334.2 173
   000270         027500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1334.2 167 24 277
   000271         027600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1334.2 122 IMP
   000272      1  027700          MOVE "NO " TO ERROR-TOTAL                               IF1334.2 171
   000273      1  027800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1334.2 122 171
   000274         027900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1334.2 173
   000275         028000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1334.2 167 24 277
   000276         028100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1334.2 175 24 277
   000277         028200 WRITE-LINE.                                                      IF1334.2
   000278         028300     ADD 1 TO RECORD-COUNT.                                       IF1334.2 127
   000279         028400     IF RECORD-COUNT GREATER 42                                   IF1334.2 127
   000280      1  028500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1334.2 24 126
   000281      1  028600         MOVE SPACE TO DUMMY-RECORD                               IF1334.2 IMP 24
   000282      1  028700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1334.2 24
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1334.2 129 24 293
   000284      1  028900         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1334.2 134 24 293
   000285      1  029000         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1334.2 143 24 293
   000286      1  029100         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1334.2 155 24 293
   000287      1  029200         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1334.2 107 24 293
   000288      1  029300         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1334.2 112 24 293
   000289      1  029400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1334.2 199 24 293
   000290      1  029500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1334.2 126 24
   000291      1  029600         MOVE ZERO TO RECORD-COUNT.                               IF1334.2 IMP 127
   000292         029700     PERFORM WRT-LN.                                              IF1334.2 293
   000293         029800 WRT-LN.                                                          IF1334.2
   000294         029900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1334.2 24
   000295         030000     MOVE SPACE TO DUMMY-RECORD.                                  IF1334.2 IMP 24
   000296         030100 BLANK-LINE-PRINT.                                                IF1334.2
   000297         030200     PERFORM WRT-LN.                                              IF1334.2 293
   000298         030300 FAIL-ROUTINE.                                                    IF1334.2
   000299         030400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1334.2 54 IMP
   000300      1  030500            GO TO FAIL-ROUTINE-WRITE.                             IF1334.2 307
   000301         030600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1334.2 68 IMP 307
   000302         030700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1334.2 128 198
   000303         030800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1334.2 193
   000304         030900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1334.2 190 24 277
   000305         031000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1334.2 IMP 198
   000306         031100     GO TO  FAIL-ROUTINE-EX.                                      IF1334.2 318
   000307         031200 FAIL-ROUTINE-WRITE.                                              IF1334.2
   000308         031300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1334.2 50 23 277
   000309         031400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1334.2 128 78
   000310         031500                              CORMA-ANSI-REFERENCE.               IF1334.2 106
   000311         031600     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1334.2 84 IMP
   000312      1  031700           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1334.2 79 23 277
   000313      1  031800           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1334.2 93 23 277
   000314         031900     ELSE                                                         IF1334.2
   000315      1  032000           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1334.2 65 23 277
   000316         032100     PERFORM WRITE-LINE.                                          IF1334.2 277
   000317         032200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1334.2 IMP 78
   000318         032300 FAIL-ROUTINE-EX. EXIT.                                           IF1334.2
   000319         032400 BAIL-OUT.                                                        IF1334.2
   000320         032500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1334.2 55 IMP 322
   000321         032600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1334.2 69 IMP 328
   000322         032700 BAIL-OUT-WRITE.                                                  IF1334.2
   000323         032800     MOVE CORRECT-A TO XXCORRECT.                                 IF1334.2 69 197
   000324         032900     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1334.2 55 195
   000325         033000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1334.2 128 198
   000326         033100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1334.2 190 24 277
   000327         033200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1334.2 IMP 198
   000328         033300 BAIL-OUT-EX. EXIT.                                               IF1334.2
   000329         033400 CCVS1-EXIT.                                                      IF1334.2
   000330         033500     EXIT.                                                        IF1334.2
   000331         033700*                                                      *          IF1334.2
   000332         033800*    Intrinsic Function Tests         IF133A - REM     *          IF1334.2
   000333         033900*                                                      *          IF1334.2
   000334         034100 SECT-IF133A SECTION.                                             IF1334.2
   000335         034200 F-REM-INFO.                                                      IF1334.2
   000336         034300     MOVE     "See ref. A-66 2.37" TO ANSI-REFERENCE.             IF1334.2 128
   000337         034400     MOVE     "REM Function" TO FEATURE.                          IF1334.2 40
   000338         034600 F-REM-01.                                                        IF1334.2
   000339         034700     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800 F-REM-TEST-01.                                                   IF1334.2
   000341         034900     COMPUTE WS-NUM = FUNCTION REM(0, 20).                        IF1334.2 33 IFN
   000342         035000     IF WS-NUM = 0 THEN                                           IF1334.2 33
   000343      1  035100                    PERFORM PASS                                  IF1334.2 220
   000344         035200     ELSE                                                         IF1334.2
   000345      1  035300                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000346      1  035400                    MOVE 0 TO CORRECT-N                           IF1334.2 70
   000347      1  035500                    PERFORM FAIL.                                 IF1334.2 221
   000348         035600     GO TO F-REM-WRITE-01.                                        IF1334.2 352
   000349         035700 F-REM-DELETE-01.                                                 IF1334.2
   000350         035800     PERFORM  DE-LETE.                                            IF1334.2 222
   000351         035900     GO TO    F-REM-WRITE-01.                                     IF1334.2 352
   000352         036000 F-REM-WRITE-01.                                                  IF1334.2
   000353         036100     MOVE "F-REM-01" TO PAR-NAME.                                 IF1334.2 44
   000354         036200     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000355         036400 F-REM-02.                                                        IF1334.2
   000356         036500     EVALUATE FUNCTION REM(10.674, 10.674)                        IF1334.2 IFN
   000357         036600     WHEN -0.000020 THRU 0.000020                                 IF1334.2
   000358      1  036700                    PERFORM PASS                                  IF1334.2 220
   000359         036800     WHEN OTHER                                                   IF1334.2
   000360      1  036900                    PERFORM FAIL.                                 IF1334.2 221
   000361         037000     GO TO F-REM-WRITE-02.                                        IF1334.2 365
   000362         037100 F-REM-DELETE-02.                                                 IF1334.2
   000363         037200     PERFORM  DE-LETE.                                            IF1334.2 222
   000364         037300     GO TO    F-REM-WRITE-02.                                     IF1334.2 365
   000365         037400 F-REM-WRITE-02.                                                  IF1334.2
   000366         037500     MOVE "F-REM-02" TO PAR-NAME.                                 IF1334.2 44
   000367         037600     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000368         037800 F-REM-03.                                                        IF1334.2
   000369         037900     IF (FUNCTION REM(2.5, A) >= 2.49995) AND                     IF1334.2 IFN 27
   000370         038000        (FUNCTION REM(2.5, A) <= 2.50005)                         IF1334.2 IFN 27
   000371      1  038100                    PERFORM PASS                                  IF1334.2 220
   000372         038200     ELSE                                                         IF1334.2
   000373      1  038300                    PERFORM FAIL.                                 IF1334.2 221
   000374         038400     GO TO F-REM-WRITE-03.                                        IF1334.2 378
   000375         038500 F-REM-DELETE-03.                                                 IF1334.2
   000376         038600     PERFORM  DE-LETE.                                            IF1334.2 222
   000377         038700     GO TO    F-REM-WRITE-03.                                     IF1334.2 378
   000378         038800 F-REM-WRITE-03.                                                  IF1334.2
   000379         038900     MOVE "F-REM-03" TO PAR-NAME.                                 IF1334.2 44
   000380         039000     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000381         039200 F-REM-04.                                                        IF1334.2
   000382         039300     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000383         039400 F-REM-TEST-04.                                                   IF1334.2
   000384         039500     COMPUTE WS-NUM = FUNCTION REM(A, 2).                         IF1334.2 33 IFN 27
   000385         039600     IF WS-NUM = 1 THEN                                           IF1334.2 33
   000386      1  039700                    PERFORM PASS                                  IF1334.2 220
   000387         039800     ELSE                                                         IF1334.2
   000388      1  039900                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000389      1  040000                    MOVE 1 TO CORRECT-N                           IF1334.2 70
   000390      1  040100                    PERFORM FAIL.                                 IF1334.2 221
   000391         040200     GO TO F-REM-WRITE-04.                                        IF1334.2 395
   000392         040300 F-REM-DELETE-04.                                                 IF1334.2
   000393         040400     PERFORM  DE-LETE.                                            IF1334.2 222
   000394         040500     GO TO    F-REM-WRITE-04.                                     IF1334.2 395
   000395         040600 F-REM-WRITE-04.                                                  IF1334.2
   000396         040700     MOVE "F-REM-04" TO PAR-NAME.                                 IF1334.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000398         041000 F-REM-05.                                                        IF1334.2
   000399         041100     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000400         041200 F-REM-TEST-05.                                                   IF1334.2
   000401         041300     COMPUTE WS-NUM = FUNCTION REM(B, A).                         IF1334.2 33 IFN 28 27
   000402         041400     IF (WS-NUM >= 2.35995) AND                                   IF1334.2 33
   000403         041500        (WS-NUM <= 2.36005)                                       IF1334.2 33
   000404      1  041600                    PERFORM PASS                                  IF1334.2 220
   000405         041700     ELSE                                                         IF1334.2
   000406      1  041800                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000407      1  041900                    MOVE 2.36 TO CORRECT-N                        IF1334.2 70
   000408      1  042000                    PERFORM FAIL.                                 IF1334.2 221
   000409         042100     GO TO F-REM-WRITE-05.                                        IF1334.2 413
   000410         042200 F-REM-DELETE-05.                                                 IF1334.2
   000411         042300     PERFORM  DE-LETE.                                            IF1334.2 222
   000412         042400     GO TO    F-REM-WRITE-05.                                     IF1334.2 413
   000413         042500 F-REM-WRITE-05.                                                  IF1334.2
   000414         042600     MOVE "F-REM-05" TO PAR-NAME.                                 IF1334.2 44
   000415         042700     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000416         042900 F-REM-06.                                                        IF1334.2
   000417         043000     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000418         043100 F-REM-TEST-06.                                                   IF1334.2
   000419         043200     COMPUTE WS-NUM = FUNCTION REM(-11, -5).                      IF1334.2 33 IFN
   000420         043300     IF WS-NUM = -1    THEN                                       IF1334.2 33
   000421      1  043400                    PERFORM PASS                                  IF1334.2 220
   000422         043500     ELSE                                                         IF1334.2
   000423      1  043600                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000424      1  043700                    MOVE -1    TO CORRECT-N                       IF1334.2 70
   000425      1  043800                    PERFORM FAIL.                                 IF1334.2 221
   000426         043900     GO TO F-REM-WRITE-06.                                        IF1334.2 430
   000427         044000 F-REM-DELETE-06.                                                 IF1334.2
   000428         044100     PERFORM  DE-LETE.                                            IF1334.2 222
   000429         044200     GO TO    F-REM-WRITE-06.                                     IF1334.2 430
   000430         044300 F-REM-WRITE-06.                                                  IF1334.2
   000431         044400     MOVE "F-REM-06" TO PAR-NAME.                                 IF1334.2 44
   000432         044500     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000433         044700 F-REM-07.                                                        IF1334.2
   000434         044800     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000435         044900 F-REM-TEST-07.                                                   IF1334.2
   000436         045000     COMPUTE WS-NUM = FUNCTION REM(11, -5).                       IF1334.2 33 IFN
   000437         045100     IF WS-NUM = 1 THEN                                           IF1334.2 33
   000438      1  045200                    PERFORM PASS                                  IF1334.2 220
   000439         045300     ELSE                                                         IF1334.2
   000440      1  045400                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000441      1  045500                    MOVE 1 TO CORRECT-N                           IF1334.2 70
   000442      1  045600                    PERFORM FAIL.                                 IF1334.2 221
   000443         045700     GO TO F-REM-WRITE-07.                                        IF1334.2 447
   000444         045800 F-REM-DELETE-07.                                                 IF1334.2
   000445         045900     PERFORM  DE-LETE.                                            IF1334.2 222
   000446         046000     GO TO    F-REM-WRITE-07.                                     IF1334.2 447
   000447         046100 F-REM-WRITE-07.                                                  IF1334.2
   000448         046200     MOVE "F-REM-07" TO PAR-NAME.                                 IF1334.2 44
   000449         046300     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000450         046500 F-REM-08.                                                        IF1334.2
   000451         046600     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000452         046700 F-REM-TEST-08.                                                   IF1334.2
   000453         046800     COMPUTE WS-NUM = FUNCTION REM(-11, 5).                       IF1334.2 33 IFN
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046900     IF WS-NUM = -1 THEN                                          IF1334.2 33
   000455      1  047000                    PERFORM PASS                                  IF1334.2 220
   000456         047100     ELSE                                                         IF1334.2
   000457      1  047200                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000458      1  047300                    MOVE -1 TO CORRECT-N                          IF1334.2 70
   000459      1  047400                    PERFORM FAIL.                                 IF1334.2 221
   000460         047500     GO TO F-REM-WRITE-08.                                        IF1334.2 464
   000461         047600 F-REM-DELETE-08.                                                 IF1334.2
   000462         047700     PERFORM  DE-LETE.                                            IF1334.2 222
   000463         047800     GO TO    F-REM-WRITE-08.                                     IF1334.2 464
   000464         047900 F-REM-WRITE-08.                                                  IF1334.2
   000465         048000     MOVE "F-REM-08" TO PAR-NAME.                                 IF1334.2 44
   000466         048100     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000467         048300 F-REM-09.                                                        IF1334.2
   000468         048400     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000469         048500     MOVE  0.889982 TO MIN-RANGE.                                 IF1334.2 34
   000470         048600     MOVE  0.890018 TO MAX-RANGE.                                 IF1334.2 35
   000471         048700 F-REM-TEST-09.                                                   IF1334.2
   000472         048800     COMPUTE WS-NUM = FUNCTION REM(0.89, B + 1).                  IF1334.2 33 IFN 28
   000473         048900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1334.2 33 34
   000474         049000        (WS-NUM <= MAX-RANGE) THEN                                IF1334.2 33 35
   000475      1  049100                    PERFORM PASS                                  IF1334.2 220
   000476         049200     ELSE                                                         IF1334.2
   000477      1  049300                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000478      1  049400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1334.2 34 84
   000479      1  049500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1334.2 35 98
   000480      1  049600                    PERFORM FAIL.                                 IF1334.2 221
   000481         049700     GO TO F-REM-WRITE-09.                                        IF1334.2 485
   000482         049800 F-REM-DELETE-09.                                                 IF1334.2
   000483         049900     PERFORM  DE-LETE.                                            IF1334.2 222
   000484         050000     GO TO    F-REM-WRITE-09.                                     IF1334.2 485
   000485         050100 F-REM-WRITE-09.                                                  IF1334.2
   000486         050200     MOVE "F-REM-09" TO PAR-NAME.                                 IF1334.2 44
   000487         050300     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000488         050500 F-REM-10.                                                        IF1334.2
   000489         050600     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000490         050700     MOVE  0.159997 TO MIN-RANGE.                                 IF1334.2 34
   000491         050800     MOVE  0.160003 TO MAX-RANGE.                                 IF1334.2 35
   000492         050900 F-REM-TEST-10.                                                   IF1334.2
   000493         051000     COMPUTE WS-NUM = FUNCTION REM(B, C + 2.2).                   IF1334.2 33 IFN 28 29
   000494         051100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1334.2 33 34
   000495         051200        (WS-NUM <= MAX-RANGE) THEN                                IF1334.2 33 35
   000496      1  051300                    PERFORM PASS                                  IF1334.2 220
   000497         051400     ELSE                                                         IF1334.2
   000498      1  051500                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000499      1  051600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1334.2 34 84
   000500      1  051700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1334.2 35 98
   000501      1  051800                    PERFORM FAIL.                                 IF1334.2 221
   000502         051900     GO TO F-REM-WRITE-10.                                        IF1334.2 506
   000503         052000 F-REM-DELETE-10.                                                 IF1334.2
   000504         052100     PERFORM  DE-LETE.                                            IF1334.2 222
   000505         052200     GO TO    F-REM-WRITE-10.                                     IF1334.2 506
   000506         052300 F-REM-WRITE-10.                                                  IF1334.2
   000507         052400     MOVE "F-REM-10" TO PAR-NAME.                                 IF1334.2 44
   000508         052500     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000509         052700 F-REM-11.                                                        IF1334.2
   000510         052800     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052900     MOVE -0.000020 TO MIN-RANGE.                                 IF1334.2 34
   000512         053000     MOVE  0.000020 TO MAX-RANGE.                                 IF1334.2 35
   000513         053100 F-REM-TEST-11.                                                   IF1334.2
   000514         053200     COMPUTE WS-NUM = FUNCTION REM(3 / 2, .75).                   IF1334.2 33 IFN
   000515         053300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1334.2 33 34
   000516         053400        (WS-NUM <= MAX-RANGE) THEN                                IF1334.2 33 35
   000517      1  053500                    PERFORM PASS                                  IF1334.2 220
   000518         053600     ELSE                                                         IF1334.2
   000519      1  053700                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000520      1  053800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1334.2 34 84
   000521      1  053900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1334.2 35 98
   000522      1  054000                    PERFORM FAIL.                                 IF1334.2 221
   000523         054100     GO TO F-REM-WRITE-11.                                        IF1334.2 527
   000524         054200 F-REM-DELETE-11.                                                 IF1334.2
   000525         054300     PERFORM  DE-LETE.                                            IF1334.2 222
   000526         054400     GO TO    F-REM-WRITE-11.                                     IF1334.2 527
   000527         054500 F-REM-WRITE-11.                                                  IF1334.2
   000528         054600     MOVE "F-REM-11" TO PAR-NAME.                                 IF1334.2 44
   000529         054700     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000530         054900 F-REM-12.                                                        IF1334.2
   000531         055000     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000532         055100     MOVE  6.63987 TO MIN-RANGE.                                  IF1334.2 34
   000533         055200     MOVE  6.64013 TO MAX-RANGE.                                  IF1334.2 35
   000534         055300 F-REM-TEST-12.                                                   IF1334.2
   000535         055400     COMPUTE WS-NUM = FUNCTION REM(8 + 6, B).                     IF1334.2 33 IFN 28
   000536         055500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1334.2 33 34
   000537         055600        (WS-NUM <= MAX-RANGE) THEN                                IF1334.2 33 35
   000538      1  055700                    PERFORM PASS                                  IF1334.2 220
   000539         055800     ELSE                                                         IF1334.2
   000540      1  055900                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000541      1  056000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1334.2 34 84
   000542      1  056100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1334.2 35 98
   000543      1  056200                    PERFORM FAIL.                                 IF1334.2 221
   000544         056300     GO TO F-REM-WRITE-12.                                        IF1334.2 548
   000545         056400 F-REM-DELETE-12.                                                 IF1334.2
   000546         056500     PERFORM  DE-LETE.                                            IF1334.2 222
   000547         056600     GO TO    F-REM-WRITE-12.                                     IF1334.2 548
   000548         056700 F-REM-WRITE-12.                                                  IF1334.2
   000549         056800     MOVE "F-REM-12" TO PAR-NAME.                                 IF1334.2 44
   000550         056900     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000551         057100 F-REM-13.                                                        IF1334.2
   000552         057200     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000553         057300     MOVE -1.00002 TO MIN-RANGE.                                  IF1334.2 34
   000554         057400     MOVE -0.999980 TO MAX-RANGE.                                 IF1334.2 35
   000555         057500 F-REM-TEST-13.                                                   IF1334.2
   000556         057600     COMPUTE WS-NUM = FUNCTION REM(C + 1, 2).                     IF1334.2 33 IFN 29
   000557         057700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1334.2 33 34
   000558         057800        (WS-NUM <= MAX-RANGE) THEN                                IF1334.2 33 35
   000559      1  057900                    PERFORM PASS                                  IF1334.2 220
   000560         058000     ELSE                                                         IF1334.2
   000561      1  058100                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000562      1  058200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1334.2 34 84
   000563      1  058300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1334.2 35 98
   000564      1  058400                    PERFORM FAIL.                                 IF1334.2 221
   000565         058500     GO TO F-REM-WRITE-13.                                        IF1334.2 569
   000566         058600 F-REM-DELETE-13.                                                 IF1334.2
   000567         058700     PERFORM  DE-LETE.                                            IF1334.2 222
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058800     GO TO    F-REM-WRITE-13.                                     IF1334.2 569
   000569         058900 F-REM-WRITE-13.                                                  IF1334.2
   000570         059000     MOVE "F-REM-13" TO PAR-NAME.                                 IF1334.2 44
   000571         059100     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000572         059300 F-REM-14.                                                        IF1334.2
   000573         059400     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000574         059500     MOVE  1.99996 TO MIN-RANGE.                                  IF1334.2 34
   000575         059600     MOVE  2.00004 TO MAX-RANGE.                                  IF1334.2 35
   000576         059700 F-REM-TEST-14.                                                   IF1334.2
   000577         059800     COMPUTE WS-NUM = FUNCTION REM(                               IF1334.2 33 IFN
   000578         059900                         FUNCTION REM(D, A), A).                  IF1334.2 IFN 30 27 27
   000579         060000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1334.2 33 34
   000580         060100        (WS-NUM <= MAX-RANGE) THEN                                IF1334.2 33 35
   000581      1  060200                    PERFORM PASS                                  IF1334.2 220
   000582         060300     ELSE                                                         IF1334.2
   000583      1  060400                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000584      1  060500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1334.2 34 84
   000585      1  060600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1334.2 35 98
   000586      1  060700                    PERFORM FAIL.                                 IF1334.2 221
   000587         060800     GO TO F-REM-WRITE-14.                                        IF1334.2 591
   000588         060900 F-REM-DELETE-14.                                                 IF1334.2
   000589         061000     PERFORM  DE-LETE.                                            IF1334.2 222
   000590         061100     GO TO    F-REM-WRITE-14.                                     IF1334.2 591
   000591         061200 F-REM-WRITE-14.                                                  IF1334.2
   000592         061300     MOVE "F-REM-14" TO PAR-NAME.                                 IF1334.2 44
   000593         061400     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000594         061600 F-REM-15.                                                        IF1334.2
   000595         061700     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000596         061800     MOVE -0.000020 TO MIN-RANGE.                                 IF1334.2 34
   000597         061900     MOVE  0.000020 TO MAX-RANGE.                                 IF1334.2 35
   000598         062000 F-REM-TEST-15.                                                   IF1334.2
   000599         062100     COMPUTE WS-NUM = FUNCTION REM(C,                             IF1334.2 33 IFN 29
   000600         062200                         FUNCTION REM(C, D)).                     IF1334.2 IFN 29 30
   000601         062300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1334.2 33 34
   000602         062400        (WS-NUM <= MAX-RANGE) THEN                                IF1334.2 33 35
   000603      1  062500                    PERFORM PASS                                  IF1334.2 220
   000604         062600     ELSE                                                         IF1334.2
   000605      1  062700                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000606      1  062800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1334.2 34 84
   000607      1  062900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1334.2 35 98
   000608      1  063000                    PERFORM FAIL.                                 IF1334.2 221
   000609         063100     GO TO F-REM-WRITE-15.                                        IF1334.2 613
   000610         063200 F-REM-DELETE-15.                                                 IF1334.2
   000611         063300     PERFORM  DE-LETE.                                            IF1334.2 222
   000612         063400     GO TO    F-REM-WRITE-15.                                     IF1334.2 613
   000613         063500 F-REM-WRITE-15.                                                  IF1334.2
   000614         063600     MOVE "F-REM-15" TO PAR-NAME.                                 IF1334.2 44
   000615         063700     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000616         063900 F-REM-16.                                                        IF1334.2
   000617         064000     MOVE ZERO TO WS-NUM.                                         IF1334.2 IMP 33
   000618         064100     MOVE  0.999980 TO MIN-RANGE.                                 IF1334.2 34
   000619         064200     MOVE  1.00002 TO MAX-RANGE.                                  IF1334.2 35
   000620         064300 F-REM-TEST-16.                                                   IF1334.2
   000621         064400     COMPUTE WS-NUM = FUNCTION REM( FUNCTION REM(9, 5),           IF1334.2 33 IFN IFN
   000622         064500                                    FUNCTION REM(D, 4)).          IF1334.2 IFN 30
   000623         064600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1334.2 33 34
   000624         064700        (WS-NUM <= MAX-RANGE) THEN                                IF1334.2 33 35
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  064800                    PERFORM PASS                                  IF1334.2 220
   000626         064900     ELSE                                                         IF1334.2
   000627      1  065000                    MOVE WS-NUM TO COMPUTED-N                     IF1334.2 33 56
   000628      1  065100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1334.2 34 84
   000629      1  065200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1334.2 35 98
   000630      1  065300                    PERFORM FAIL.                                 IF1334.2 221
   000631         065400     GO TO F-REM-WRITE-16.                                        IF1334.2 635
   000632         065500 F-REM-DELETE-16.                                                 IF1334.2
   000633         065600     PERFORM  DE-LETE.                                            IF1334.2 222
   000634         065700     GO TO    F-REM-WRITE-16.                                     IF1334.2 635
   000635         065800 F-REM-WRITE-16.                                                  IF1334.2
   000636         065900     MOVE "F-REM-16" TO PAR-NAME.                                 IF1334.2 44
   000637         066000     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000638         066200 F-REM-17.                                                        IF1334.2
   000639         066300     PERFORM F-REM-TEST-17                                        IF1334.2 643
   000640         066400       UNTIL FUNCTION REM(5, ARG2) >= 2.                          IF1334.2 IFN 31
   000641         066500     PERFORM PASS.                                                IF1334.2 220
   000642         066600     GO TO F-REM-WRITE-17.                                        IF1334.2 648
   000643         066700 F-REM-TEST-17.                                                   IF1334.2
   000644         066800     COMPUTE ARG2 = ARG2 + 1.                                     IF1334.2 31 31
   000645         066900 F-REM-DELETE-17.                                                 IF1334.2
   000646         067000     PERFORM  DE-LETE.                                            IF1334.2 222
   000647         067100     GO TO    F-REM-WRITE-17.                                     IF1334.2 648
   000648         067200 F-REM-WRITE-17.                                                  IF1334.2
   000649         067300     MOVE "F-REM-17" TO PAR-NAME.                                 IF1334.2 44
   000650         067400     PERFORM  PRINT-DETAIL.                                       IF1334.2 224
   000651         067600 CCVS-EXIT SECTION.                                               IF1334.2
   000652         067700 CCVS-999999.                                                     IF1334.2
   000653         067800     GO TO CLOSE-FILES.                                           IF1334.2 215
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  369 370 384 401 578 578
      128   ANSI-REFERENCE . . . . . . . .  302 309 325 M336
       31   ARG2 . . . . . . . . . . . . .  640 M644 644
       28   B. . . . . . . . . . . . . . .  401 472 493 535
       29   C. . . . . . . . . . . . . . .  493 556 599 600
      107   CCVS-C-1 . . . . . . . . . . .  242 287
      112   CCVS-C-2 . . . . . . . . . . .  243 288
      162   CCVS-E-1 . . . . . . . . . . .  248
      167   CCVS-E-2 . . . . . . . . . . .  256 263 270 275
      170   CCVS-E-2-2 . . . . . . . . . .  M255
      175   CCVS-E-3 . . . . . . . . . . .  276
      184   CCVS-E-4 . . . . . . . . . . .  255
      185   CCVS-E-4-1 . . . . . . . . . .  M253
      187   CCVS-E-4-2 . . . . . . . . . .  M254
      129   CCVS-H-1 . . . . . . . . . . .  237 283
      134   CCVS-H-2A. . . . . . . . . . .  238 284
      143   CCVS-H-2B. . . . . . . . . . .  239 285
      155   CCVS-H-3 . . . . . . . . . . .  240 286
      205   CCVS-PGM-ID. . . . . . . . . .  211 211
       61   CM-18V0
       55   COMPUTED-A . . . . . . . . . .  56 58 59 60 61 320 324
       56   COMPUTED-N . . . . . . . . . .  M345 M388 M406 M423 M440 M457 M477 M498 M519 M540 M561 M583 M605 M627
       54   COMPUTED-X . . . . . . . . . .  M232 299
       58   COMPUTED-0V18
       60   COMPUTED-14V4
       62   COMPUTED-18V0
       59   COMPUTED-4V14
       78   COR-ANSI-REFERENCE . . . . . .  M309 M317
      106   CORMA-ANSI-REFERENCE . . . . .  M310
       69   CORRECT-A. . . . . . . . . . .  70 71 72 73 74 321 323
       98   CORRECT-MAX. . . . . . . . . .  M479 M500 M521 M542 M563 M585 M607 M629
       84   CORRECT-MIN. . . . . . . . . .  311 M478 M499 M520 M541 M562 M584 M606 M628
       70   CORRECT-N. . . . . . . . . . .  M346 M389 M407 M424 M441 M458
       68   CORRECT-X. . . . . . . . . . .  M233 301
       71   CORRECT-0V18
       73   CORRECT-14V4
       75   CORRECT-18V0
       72   CORRECT-4V14
       97   CORRECTMA-A. . . . . . . . . .  98 99 100 101 102
       96   CORRECTMA-X
       99   CORRECTMA-0V18
      101   CORRECTMA-14V4
      103   CORRECTMA-18V0
      100   CORRECTMA-4V14
       83   CORRECTMI-A. . . . . . . . . .  84 85 86 87 88
       82   CORRECTMI-X
       85   CORRECTMI-0V18
       87   CORRECTMI-14V4
       89   CORRECTMI-18V0
       86   CORRECTMI-4V14
       74   CR-18V0
       88   CR-18V0
      102   CR-18V0
       30   D. . . . . . . . . . . . . . .  578 600 622
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    16
0 Defined   Cross-reference of data names   References

0     120   DELETE-COUNTER . . . . . . . .  M222 251 266 268
       47   DOTVALUE . . . . . . . . . . .  M227
      126   DUMMY-HOLD . . . . . . . . . .  M280 290
       24   DUMMY-RECORD . . . . . . . . .  M237 M238 M239 M240 M242 M243 M244 M246 M248 M256 M263 M270 M275 M276 280 M281
                                            282 M283 M284 M285 M286 M287 M288 M289 M290 294 M295 M304 M326
      173   ENDER-DESC . . . . . . . . . .  M258 M269 M274
      121   ERROR-COUNTER. . . . . . . . .  M221 250 259 262
      125   ERROR-HOLD . . . . . . . . . .  M250 M251 M251 M252 254
      171   ERROR-TOTAL. . . . . . . . . .  M260 M262 M267 M268 M272 M273
       40   FEATURE. . . . . . . . . . . .  M337
      199   HYPHEN-LINE. . . . . . . . . .  244 246 289
      165   ID-AGAIN . . . . . . . . . . .  M211
      198   INF-ANSI-REFERENCE . . . . . .  M302 M305 M325 M327
      193   INFO-TEXT. . . . . . . . . . .  M303
      122   INSPECT-COUNTER. . . . . . . .  M219 250 271 273
       35   MAX-RANGE. . . . . . . . . . .  M470 474 479 M491 495 500 M512 516 521 M533 537 542 M554 558 563 M575 580 585
                                            M597 602 607 M619 624 629
       34   MIN-RANGE. . . . . . . . . . .  M469 473 478 M490 494 499 M511 515 520 M532 536 541 M553 557 562 M574 579 584
                                            M596 601 606 M618 623 628
       42   P-OR-F . . . . . . . . . . . .  M219 M220 M221 M222 229 M232
       44   PAR-NAME . . . . . . . . . . .  M234 M353 M366 M379 M396 M414 M431 M448 M465 M486 M507 M528 M549 M570 M592 M614
                                            M636 M649
       46   PARDOT-X . . . . . . . . . . .  M226
      123   PASS-COUNTER . . . . . . . . .  M220 252 253
       22   PRINT-FILE . . . . . . . . . .  18 210 216
       23   PRINT-REC. . . . . . . . . . .  M228 M308 M312 M313 M315
       49   RE-MARK. . . . . . . . . . . .  M223 M235
      119   REC-CT . . . . . . . . . . . .  225 227 234
      118   REC-SKL-SUB
      127   RECORD-COUNT . . . . . . . . .  M278 279 M291
       32   TEMP
       50   TEST-COMPUTED. . . . . . . . .  308
       65   TEST-CORRECT . . . . . . . . .  315
       93   TEST-CORRECT-MAX . . . . . . .  313
       79   TEST-CORRECT-MIN . . . . . . .  312
      146   TEST-ID. . . . . . . . . . . .  M211
       38   TEST-RESULTS . . . . . . . . .  M212 228
      124   TOTAL-ERROR
       33   WS-NUM . . . . . . . . . . . .  M339 M341 342 345 M382 M384 385 388 M399 M401 402 403 406 M417 M419 420 423 M434
                                            M436 437 440 M451 M453 454 457 M468 M472 473 474 477 M489 M493 494 495 498 M510
                                            M514 515 516 519 M531 M535 536 537 540 M552 M556 557 558 561 M573 M577 579 580
                                            583 M595 M599 601 602 605 M617 M621 623 624 627
      195   XXCOMPUTED . . . . . . . . . .  M324
      197   XXCORRECT. . . . . . . . . . .  M323
      190   XXINFO . . . . . . . . . . . .  304 326
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    17
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

      319   BAIL-OUT . . . . . . . . . . .  P231
      328   BAIL-OUT-EX. . . . . . . . . .  E231 G321
      322   BAIL-OUT-WRITE . . . . . . . .  G320
      296   BLANK-LINE-PRINT
      651   CCVS-EXIT
      652   CCVS-999999
      208   CCVS1
      329   CCVS1-EXIT . . . . . . . . . .  G214
      215   CLOSE-FILES. . . . . . . . . .  G653
      241   COLUMN-NAMES-ROUTINE . . . . .  E213
      222   DE-LETE. . . . . . . . . . . .  P350 P363 P376 P393 P411 P428 P445 P462 P483 P504 P525 P546 P567 P589 P611 P633
                                            P646
      245   END-ROUTINE. . . . . . . . . .  P216
      249   END-ROUTINE-1
      257   END-ROUTINE-12
      265   END-ROUTINE-13 . . . . . . . .  E216
      247   END-RTN-EXIT
      349   F-REM-DELETE-01
      362   F-REM-DELETE-02
      375   F-REM-DELETE-03
      392   F-REM-DELETE-04
      410   F-REM-DELETE-05
      427   F-REM-DELETE-06
      444   F-REM-DELETE-07
      461   F-REM-DELETE-08
      482   F-REM-DELETE-09
      503   F-REM-DELETE-10
      524   F-REM-DELETE-11
      545   F-REM-DELETE-12
      566   F-REM-DELETE-13
      588   F-REM-DELETE-14
      610   F-REM-DELETE-15
      632   F-REM-DELETE-16
      645   F-REM-DELETE-17
      335   F-REM-INFO
      340   F-REM-TEST-01
      383   F-REM-TEST-04
      400   F-REM-TEST-05
      418   F-REM-TEST-06
      435   F-REM-TEST-07
      452   F-REM-TEST-08
      471   F-REM-TEST-09
      492   F-REM-TEST-10
      513   F-REM-TEST-11
      534   F-REM-TEST-12
      555   F-REM-TEST-13
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    18
0 Defined   Cross-reference of procedures   References

0     576   F-REM-TEST-14
      598   F-REM-TEST-15
      620   F-REM-TEST-16
      643   F-REM-TEST-17. . . . . . . . .  P639
      352   F-REM-WRITE-01 . . . . . . . .  G348 G351
      365   F-REM-WRITE-02 . . . . . . . .  G361 G364
      378   F-REM-WRITE-03 . . . . . . . .  G374 G377
      395   F-REM-WRITE-04 . . . . . . . .  G391 G394
      413   F-REM-WRITE-05 . . . . . . . .  G409 G412
      430   F-REM-WRITE-06 . . . . . . . .  G426 G429
      447   F-REM-WRITE-07 . . . . . . . .  G443 G446
      464   F-REM-WRITE-08 . . . . . . . .  G460 G463
      485   F-REM-WRITE-09 . . . . . . . .  G481 G484
      506   F-REM-WRITE-10 . . . . . . . .  G502 G505
      527   F-REM-WRITE-11 . . . . . . . .  G523 G526
      548   F-REM-WRITE-12 . . . . . . . .  G544 G547
      569   F-REM-WRITE-13 . . . . . . . .  G565 G568
      591   F-REM-WRITE-14 . . . . . . . .  G587 G590
      613   F-REM-WRITE-15 . . . . . . . .  G609 G612
      635   F-REM-WRITE-16 . . . . . . . .  G631 G634
      648   F-REM-WRITE-17 . . . . . . . .  G642 G647
      338   F-REM-01
      355   F-REM-02
      368   F-REM-03
      381   F-REM-04
      398   F-REM-05
      416   F-REM-06
      433   F-REM-07
      450   F-REM-08
      467   F-REM-09
      488   F-REM-10
      509   F-REM-11
      530   F-REM-12
      551   F-REM-13
      572   F-REM-14
      594   F-REM-15
      616   F-REM-16
      638   F-REM-17
      221   FAIL . . . . . . . . . . . . .  P347 P360 P373 P390 P408 P425 P442 P459 P480 P501 P522 P543 P564 P586 P608 P630
      298   FAIL-ROUTINE . . . . . . . . .  P230
      318   FAIL-ROUTINE-EX. . . . . . . .  E230 G306
      307   FAIL-ROUTINE-WRITE . . . . . .  G300 G301
      236   HEAD-ROUTINE . . . . . . . . .  P213
      219   INSPT
      209   OPEN-FILES
      220   PASS . . . . . . . . . . . . .  P343 P358 P371 P386 P404 P421 P438 P455 P475 P496 P517 P538 P559 P581 P603 P625
                                            P641
      224   PRINT-DETAIL . . . . . . . . .  P354 P367 P380 P397 P415 P432 P449 P466 P487 P508 P529 P550 P571 P593 P615 P637
                                            P650
      334   SECT-IF133A
      217   TERMINATE-CCVS
      277   WRITE-LINE . . . . . . . . . .  P228 P229 P237 P238 P239 P240 P242 P243 P244 P246 P248 P256 P264 P270 P275 P276
                                            P304 P308 P312 P313 P315 P316 P326
      293   WRT-LN . . . . . . . . . . . .  P283 P284 P285 P286 P287 P288 P289 P292 P297
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    19
0 Defined   Cross-reference of programs     References

        3   IF133A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF133A    Date 06/04/2022  Time 11:57:20   Page    20
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF133A:
 *    Source records = 653
 *    Data Division statements = 91
 *    Procedure Division statements = 359
 *    Generated COBOL statements = 0
 *    Program complexity factor = 368
0End of compilation 1,  program IF133A,  highest severity 0.
0Return code 0
