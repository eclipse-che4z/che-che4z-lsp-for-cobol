1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:07   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:07   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1024.2
   000002         000200 PROGRAM-ID.                                                      IF1024.2
   000003         000300     IF102A.                                                      IF1024.2
   000004         000400                                                                  IF1024.2
   000005         000600*                                                         *       IF1024.2
   000006         000700*   This program is intended to form part of the CCVS85   *       IF1024.2
   000007         000800*   COBOL Test Suite. It contains tests for the           *       IF1024.2
   000008         000900*   Intrinsic Function ANNUITY.                           *       IF1024.2
   000009         001000*                                                         *       IF1024.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1024.2
   000011         001300 CONFIGURATION SECTION.                                           IF1024.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1024.2
   000013         001500     XXXXX082.                                                    IF1024.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1024.2
   000015         001700     XXXXX083.                                                    IF1024.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1024.2
   000017         001900 FILE-CONTROL.                                                    IF1024.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1024.2 22
   000019         002100     XXXXX055.                                                    IF1024.2
   000020         002200 DATA DIVISION.                                                   IF1024.2
   000021         002300 FILE SECTION.                                                    IF1024.2
   000022         002400 FD  PRINT-FILE.                                                  IF1024.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1024.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1024.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1024.2
   000026         002900* Variables specific to the Intrinsic Function Test IF102A*       IF1024.2
   000027         003100 01  A                   PIC S9(10)          VALUE 4.             IF1024.2
   000028         003200 01  B                   PIC S9(5)V9(5)      VALUE .25.           IF1024.2
   000029         003300 01  C                   PIC S9(10)          VALUE 10.            IF1024.2
   000030         003400 01  D                   PIC S9(10)          VALUE 100.           IF1024.2
   000031         003500 01  ARG2                PIC S9(10)          VALUE 1.             IF1024.2
   000032         003600 01  ARR                                     VALUE "40537".       IF1024.2
   000033         003700     02  IND OCCURS 5 TIMES PIC 9.                                IF1024.2
   000034         003800 01  TEMP                PIC S9(5)V9(5).                          IF1024.2
   000035         003900 01  WS-NUM              PIC S9(5)V9(6).                          IF1024.2
   000036         004000 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1024.2
   000037         004100 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1024.2
   000038         004200*                                                                 IF1024.2
   000039         004400*                                                                 IF1024.2
   000040         004500 01  TEST-RESULTS.                                                IF1024.2
   000041         004600     02 FILLER                   PIC X      VALUE SPACE.          IF1024.2 IMP
   000042         004700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1024.2 IMP
   000043         004800     02 FILLER                   PIC X      VALUE SPACE.          IF1024.2 IMP
   000044         004900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1024.2 IMP
   000045         005000     02 FILLER                   PIC X      VALUE SPACE.          IF1024.2 IMP
   000046         005100     02  PAR-NAME.                                                IF1024.2
   000047         005200       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1024.2 IMP
   000048         005300       03  PARDOT-X              PIC X      VALUE SPACE.          IF1024.2 IMP
   000049         005400       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1024.2 IMP
   000050         005500     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1024.2 IMP
   000051         005600     02 RE-MARK                  PIC X(61).                       IF1024.2
   000052         005700 01  TEST-COMPUTED.                                               IF1024.2
   000053         005800     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1024.2 IMP
   000054         005900     02 FILLER                   PIC X(17)  VALUE                 IF1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000            "       COMPUTED=".                                   IF1024.2
   000056         006100     02 COMPUTED-X.                                               IF1024.2
   000057         006200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1024.2 IMP
   000058         006300     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1024.2 57
   000059         006400                                 PIC -9(9).9(9).                  IF1024.2
   000060         006500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1024.2 57
   000061         006600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1024.2 57
   000062         006700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1024.2 57
   000063         006800     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1024.2 57
   000064         006900         04 COMPUTED-18V0                    PIC -9(18).          IF1024.2
   000065         007000         04 FILLER                           PIC X.               IF1024.2
   000066         007100     03 FILLER PIC X(50) VALUE SPACE.                             IF1024.2 IMP
   000067         007200 01  TEST-CORRECT.                                                IF1024.2
   000068         007300     02 FILLER PIC X(30) VALUE SPACE.                             IF1024.2 IMP
   000069         007400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1024.2
   000070         007500     02 CORRECT-X.                                                IF1024.2
   000071         007600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1024.2 IMP
   000072         007700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1024.2 71
   000073         007800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1024.2 71
   000074         007900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1024.2 71
   000075         008000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1024.2 71
   000076         008100     03      CR-18V0 REDEFINES CORRECT-A.                         IF1024.2 71
   000077         008200         04 CORRECT-18V0                     PIC -9(18).          IF1024.2
   000078         008300         04 FILLER                           PIC X.               IF1024.2
   000079         008400     03 FILLER PIC X(2) VALUE SPACE.                              IF1024.2 IMP
   000080         008500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1024.2 IMP
   000081         008600 01  TEST-CORRECT-MIN.                                            IF1024.2
   000082         008700     02 FILLER PIC X(30) VALUE SPACE.                             IF1024.2 IMP
   000083         008800     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1024.2
   000084         008900     02 CORRECTMI-X.                                              IF1024.2
   000085         009000     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1024.2 IMP
   000086         009100     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1024.2 85
   000087         009200     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1024.2 85
   000088         009300     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1024.2 85
   000089         009400     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1024.2 85
   000090         009500     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1024.2 85
   000091         009600         04 CORRECTMI-18V0                     PIC -9(18).        IF1024.2
   000092         009700         04 FILLER                           PIC X.               IF1024.2
   000093         009800     03 FILLER PIC X(2) VALUE SPACE.                              IF1024.2 IMP
   000094         009900     03 FILLER                           PIC X(48) VALUE SPACE.   IF1024.2 IMP
   000095         010000 01  TEST-CORRECT-MAX.                                            IF1024.2
   000096         010100     02 FILLER PIC X(30) VALUE SPACE.                             IF1024.2 IMP
   000097         010200     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1024.2
   000098         010300     02 CORRECTMA-X.                                              IF1024.2
   000099         010400     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1024.2 IMP
   000100         010500     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1024.2 99
   000101         010600     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1024.2 99
   000102         010700     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1024.2 99
   000103         010800     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1024.2 99
   000104         010900     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1024.2 99
   000105         011000         04 CORRECTMA-18V0                     PIC -9(18).        IF1024.2
   000106         011100         04 FILLER                           PIC X.               IF1024.2
   000107         011200     03 FILLER PIC X(2) VALUE SPACE.                              IF1024.2 IMP
   000108         011300     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1024.2 IMP
   000109         011400 01  CCVS-C-1.                                                    IF1024.2
   000110         011500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1024.2
   000111         011600-    "SS  PARAGRAPH-NAME                                          IF1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700-    "       REMARKS".                                            IF1024.2
   000113         011800     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1024.2 IMP
   000114         011900 01  CCVS-C-2.                                                    IF1024.2
   000115         012000     02 FILLER                     PIC X        VALUE SPACE.      IF1024.2 IMP
   000116         012100     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1024.2
   000117         012200     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1024.2 IMP
   000118         012300     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1024.2
   000119         012400     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1024.2 IMP
   000120         012500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1024.2 IMP
   000121         012600 01  REC-CT                        PIC 99       VALUE ZERO.       IF1024.2 IMP
   000122         012700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1024.2 IMP
   000123         012800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1024.2 IMP
   000124         012900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1024.2 IMP
   000125         013000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1024.2 IMP
   000126         013100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1024.2 IMP
   000127         013200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1024.2 IMP
   000128         013300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1024.2 IMP
   000129         013400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1024.2 IMP
   000130         013500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1024.2 IMP
   000131         013600 01  CCVS-H-1.                                                    IF1024.2
   000132         013700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1024.2 IMP
   000133         013800     02  FILLER                    PIC X(42)    VALUE             IF1024.2
   000134         013900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1024.2
   000135         014000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1024.2 IMP
   000136         014100 01  CCVS-H-2A.                                                   IF1024.2
   000137         014200   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1024.2 IMP
   000138         014300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1024.2
   000139         014400   02  FILLER                        PIC XXXX   VALUE             IF1024.2
   000140         014500     "4.2 ".                                                      IF1024.2
   000141         014600   02  FILLER                        PIC X(28)  VALUE             IF1024.2
   000142         014700            " COPY - NOT FOR DISTRIBUTION".                       IF1024.2
   000143         014800   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1024.2 IMP
   000144         014900                                                                  IF1024.2
   000145         015000 01  CCVS-H-2B.                                                   IF1024.2
   000146         015100   02  FILLER                        PIC X(15)  VALUE             IF1024.2
   000147         015200            "TEST RESULT OF ".                                    IF1024.2
   000148         015300   02  TEST-ID                       PIC X(9).                    IF1024.2
   000149         015400   02  FILLER                        PIC X(4)   VALUE             IF1024.2
   000150         015500            " IN ".                                               IF1024.2
   000151         015600   02  FILLER                        PIC X(12)  VALUE             IF1024.2
   000152         015700     " HIGH       ".                                              IF1024.2
   000153         015800   02  FILLER                        PIC X(22)  VALUE             IF1024.2
   000154         015900            " LEVEL VALIDATION FOR ".                             IF1024.2
   000155         016000   02  FILLER                        PIC X(58)  VALUE             IF1024.2
   000156         016100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1024.2
   000157         016200 01  CCVS-H-3.                                                    IF1024.2
   000158         016300     02  FILLER                      PIC X(34)  VALUE             IF1024.2
   000159         016400            " FOR OFFICIAL USE ONLY    ".                         IF1024.2
   000160         016500     02  FILLER                      PIC X(58)  VALUE             IF1024.2
   000161         016600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1024.2
   000162         016700     02  FILLER                      PIC X(28)  VALUE             IF1024.2
   000163         016800            "  COPYRIGHT   1985 ".                                IF1024.2
   000164         016900 01  CCVS-E-1.                                                    IF1024.2
   000165         017000     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1024.2 IMP
   000166         017100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1024.2
   000167         017200     02 ID-AGAIN                     PIC X(9).                    IF1024.2
   000168         017300     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1024.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400 01  CCVS-E-2.                                                    IF1024.2
   000170         017500     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1024.2 IMP
   000171         017600     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1024.2 IMP
   000172         017700     02 CCVS-E-2-2.                                               IF1024.2
   000173         017800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1024.2 IMP
   000174         017900         03 FILLER                   PIC X      VALUE SPACE.      IF1024.2 IMP
   000175         018000         03 ENDER-DESC               PIC X(44)  VALUE             IF1024.2
   000176         018100            "ERRORS ENCOUNTERED".                                 IF1024.2
   000177         018200 01  CCVS-E-3.                                                    IF1024.2
   000178         018300     02  FILLER                      PIC X(22)  VALUE             IF1024.2
   000179         018400            " FOR OFFICIAL USE ONLY".                             IF1024.2
   000180         018500     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1024.2 IMP
   000181         018600     02  FILLER                      PIC X(58)  VALUE             IF1024.2
   000182         018700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1024.2
   000183         018800     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1024.2 IMP
   000184         018900     02 FILLER                       PIC X(15)  VALUE             IF1024.2
   000185         019000             " COPYRIGHT 1985".                                   IF1024.2
   000186         019100 01  CCVS-E-4.                                                    IF1024.2
   000187         019200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1024.2 IMP
   000188         019300     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1024.2
   000189         019400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1024.2 IMP
   000190         019500     02 FILLER                       PIC X(40)  VALUE             IF1024.2
   000191         019600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1024.2
   000192         019700 01  XXINFO.                                                      IF1024.2
   000193         019800     02 FILLER                       PIC X(19)  VALUE             IF1024.2
   000194         019900            "*** INFORMATION ***".                                IF1024.2
   000195         020000     02 INFO-TEXT.                                                IF1024.2
   000196         020100       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1024.2 IMP
   000197         020200       04 XXCOMPUTED                 PIC X(20).                   IF1024.2
   000198         020300       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1024.2 IMP
   000199         020400       04 XXCORRECT                  PIC X(20).                   IF1024.2
   000200         020500     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1024.2
   000201         020600 01  HYPHEN-LINE.                                                 IF1024.2
   000202         020700     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1024.2 IMP
   000203         020800     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1024.2
   000204         020900-    "*****************************************".                 IF1024.2
   000205         021000     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1024.2
   000206         021100-    "******************************".                            IF1024.2
   000207         021200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1024.2
   000208         021300     "IF102A".                                                    IF1024.2
   000209         021400 PROCEDURE DIVISION.                                              IF1024.2
   000210         021500 CCVS1 SECTION.                                                   IF1024.2
   000211         021600 OPEN-FILES.                                                      IF1024.2
   000212         021700     OPEN     OUTPUT PRINT-FILE.                                  IF1024.2 22
   000213         021800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1024.2 207 148 207 167
   000214         021900     MOVE    SPACE TO TEST-RESULTS.                               IF1024.2 IMP 40
   000215         022000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1024.2 238 243
   000216         022100     GO TO CCVS1-EXIT.                                            IF1024.2 331
   000217         022200 CLOSE-FILES.                                                     IF1024.2
   000218         022300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1024.2 247 267 22
   000219         022400 TERMINATE-CCVS.                                                  IF1024.2
   000220         022500     STOP     RUN.                                                IF1024.2
   000221         022600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1024.2 44 124
   000222         022700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1024.2 44 125
   000223         022800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1024.2 44 123
   000224         022900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1024.2 44 122
   000225         023000     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1024.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 PRINT-DETAIL.                                                    IF1024.2
   000227         023200     IF REC-CT NOT EQUAL TO ZERO                                  IF1024.2 121 IMP
   000228      1  023300             MOVE "." TO PARDOT-X                                 IF1024.2 48
   000229      1  023400             MOVE REC-CT TO DOTVALUE.                             IF1024.2 121 49
   000230         023500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1024.2 40 23 279
   000231         023600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1024.2 44 279
   000232      1  023700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1024.2 300 320
   000233      1  023800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1024.2 321 330
   000234         023900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1024.2 IMP 44 IMP 56
   000235         024000     MOVE SPACE TO CORRECT-X.                                     IF1024.2 IMP 70
   000236         024100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1024.2 121 IMP IMP 46
   000237         024200     MOVE     SPACE TO RE-MARK.                                   IF1024.2 IMP 51
   000238         024300 HEAD-ROUTINE.                                                    IF1024.2
   000239         024400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1024.2 131 24 279
   000240         024500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1024.2 136 24 279
   000241         024600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1024.2 145 24 279
   000242         024700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1024.2 157 24 279
   000243         024800 COLUMN-NAMES-ROUTINE.                                            IF1024.2
   000244         024900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1024.2 109 24 279
   000245         025000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1024.2 114 24 279
   000246         025100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1024.2 201 24 279
   000247         025200 END-ROUTINE.                                                     IF1024.2
   000248         025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1024.2 201 24 279
   000249         025400 END-RTN-EXIT.                                                    IF1024.2
   000250         025500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1024.2 164 24 279
   000251         025600 END-ROUTINE-1.                                                   IF1024.2
   000252         025700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1024.2 123 127 124
   000253         025800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1024.2 127 122 127
   000254         025900      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1024.2 125 127
   000255         026000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1024.2 125 187
   000256         026100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1024.2 127 189
   000257         026200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1024.2 186 172
   000258         026300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1024.2 169 24 279
   000259         026400  END-ROUTINE-12.                                                 IF1024.2
   000260         026500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1024.2 175
   000261         026600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1024.2 123 IMP
   000262      1  026700         MOVE "NO " TO ERROR-TOTAL                                IF1024.2 173
   000263         026800         ELSE                                                     IF1024.2
   000264      1  026900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1024.2 123 173
   000265         027000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1024.2 169 24
   000266         027100     PERFORM WRITE-LINE.                                          IF1024.2 279
   000267         027200 END-ROUTINE-13.                                                  IF1024.2
   000268         027300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1024.2 122 IMP
   000269      1  027400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1024.2 173
   000270      1  027500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1024.2 122 173
   000271         027600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1024.2 175
   000272         027700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1024.2 169 24 279
   000273         027800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1024.2 124 IMP
   000274      1  027900          MOVE "NO " TO ERROR-TOTAL                               IF1024.2 173
   000275      1  028000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1024.2 124 173
   000276         028100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1024.2 175
   000277         028200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1024.2 169 24 279
   000278         028300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1024.2 177 24 279
   000279         028400 WRITE-LINE.                                                      IF1024.2
   000280         028500     ADD 1 TO RECORD-COUNT.                                       IF1024.2 129
   000281         028600     IF RECORD-COUNT GREATER 42                                   IF1024.2 129
   000282      1  028700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1024.2 24 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         MOVE SPACE TO DUMMY-RECORD                               IF1024.2 IMP 24
   000284      1  028900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1024.2 24
   000285      1  029000         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1024.2 131 24 295
   000286      1  029100         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1024.2 136 24 295
   000287      1  029200         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1024.2 145 24 295
   000288      1  029300         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1024.2 157 24 295
   000289      1  029400         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1024.2 109 24 295
   000290      1  029500         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1024.2 114 24 295
   000291      1  029600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1024.2 201 24 295
   000292      1  029700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1024.2 128 24
   000293      1  029800         MOVE ZERO TO RECORD-COUNT.                               IF1024.2 IMP 129
   000294         029900     PERFORM WRT-LN.                                              IF1024.2 295
   000295         030000 WRT-LN.                                                          IF1024.2
   000296         030100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1024.2 24
   000297         030200     MOVE SPACE TO DUMMY-RECORD.                                  IF1024.2 IMP 24
   000298         030300 BLANK-LINE-PRINT.                                                IF1024.2
   000299         030400     PERFORM WRT-LN.                                              IF1024.2 295
   000300         030500 FAIL-ROUTINE.                                                    IF1024.2
   000301         030600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1024.2 56 IMP
   000302      1  030700            GO TO FAIL-ROUTINE-WRITE.                             IF1024.2 309
   000303         030800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1024.2 70 IMP 309
   000304         030900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1024.2 130 200
   000305         031000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1024.2 195
   000306         031100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1024.2 192 24 279
   000307         031200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1024.2 IMP 200
   000308         031300     GO TO  FAIL-ROUTINE-EX.                                      IF1024.2 320
   000309         031400 FAIL-ROUTINE-WRITE.                                              IF1024.2
   000310         031500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1024.2 52 23 279
   000311         031600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1024.2 130 80
   000312         031700                              CORMA-ANSI-REFERENCE.               IF1024.2 108
   000313         031800     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1024.2 86 IMP
   000314      1  031900           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1024.2 81 23 279
   000315      1  032000           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1024.2 95 23 279
   000316         032100     ELSE                                                         IF1024.2
   000317      1  032200           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1024.2 67 23 279
   000318         032300     PERFORM WRITE-LINE.                                          IF1024.2 279
   000319         032400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1024.2 IMP 80
   000320         032500 FAIL-ROUTINE-EX. EXIT.                                           IF1024.2
   000321         032600 BAIL-OUT.                                                        IF1024.2
   000322         032700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1024.2 57 IMP 324
   000323         032800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1024.2 71 IMP 330
   000324         032900 BAIL-OUT-WRITE.                                                  IF1024.2
   000325         033000     MOVE CORRECT-A TO XXCORRECT.                                 IF1024.2 71 199
   000326         033100     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1024.2 57 197
   000327         033200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1024.2 130 200
   000328         033300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1024.2 192 24 279
   000329         033400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1024.2 IMP 200
   000330         033500 BAIL-OUT-EX. EXIT.                                               IF1024.2
   000331         033600 CCVS1-EXIT.                                                      IF1024.2
   000332         033700     EXIT.                                                        IF1024.2
   000333         033900*                                                      *          IF1024.2
   000334         034000*    Intrinsic Function Tests         IF102A - ANNUITY *          IF1024.2
   000335         034100*                                                      *          IF1024.2
   000336         034300 SECT-IF102A SECTION.                                             IF1024.2
   000337         034400 F-ANNUITY-INFO.                                                  IF1024.2
   000338         034500     MOVE     "See ref. A-34 2.6" TO ANSI-REFERENCE.              IF1024.2 130
   000339         034600     MOVE     "ANNUITY Function" TO FEATURE.                      IF1024.2 42
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800 F-ANNUITY-01.                                                    IF1024.2
   000341         034900     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000342         035000     MOVE  0.249995 TO MIN-RANGE.                                 IF1024.2 36
   000343         035100     MOVE  0.250005 TO MAX-RANGE.                                 IF1024.2 37
   000344         035200 F-ANNUITY-TEST-01.                                               IF1024.2
   000345         035300     COMPUTE WS-NUM = FUNCTION ANNUITY(0, 4).                     IF1024.2 35 IFN
   000346         035400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000347         035500        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000348      1  035600                    PERFORM PASS                                  IF1024.2 222
   000349         035700     ELSE                                                         IF1024.2
   000350      1  035800                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000351      1  035900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000352      1  036000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000353      1  036100                    PERFORM FAIL.                                 IF1024.2 223
   000354         036200     GO TO F-ANNUITY-WRITE-01.                                    IF1024.2 358
   000355         036300 F-ANNUITY-DELETE-01.                                             IF1024.2
   000356         036400     PERFORM  DE-LETE.                                            IF1024.2 224
   000357         036500     GO TO    F-ANNUITY-WRITE-01.                                 IF1024.2 358
   000358         036600 F-ANNUITY-WRITE-01.                                              IF1024.2
   000359         036700     MOVE "F-ANNUITY-01" TO PAR-NAME.                             IF1024.2 46
   000360         036800     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000361         037000 F-ANNUITY-02.                                                    IF1024.2
   000362         037100     EVALUATE FUNCTION ANNUITY(2.9, 4)                            IF1024.2 IFN
   000363         037200     WHEN  2.91252 THRU  2.91264                                  IF1024.2
   000364      1  037300                    PERFORM PASS                                  IF1024.2 222
   000365         037400     WHEN OTHER                                                   IF1024.2
   000366      1  037500                    PERFORM FAIL.                                 IF1024.2 223
   000367         037600     GO TO F-ANNUITY-WRITE-02.                                    IF1024.2 371
   000368         037700 F-ANNUITY-DELETE-02.                                             IF1024.2
   000369         037800     PERFORM  DE-LETE.                                            IF1024.2 224
   000370         037900     GO TO    F-ANNUITY-WRITE-02.                                 IF1024.2 371
   000371         038000 F-ANNUITY-WRITE-02.                                              IF1024.2
   000372         038100     MOVE "F-ANNUITY-02" TO PAR-NAME.                             IF1024.2 46
   000373         038200     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000374         038400 F-ANNUITY-03.                                                    IF1024.2
   000375         038500     MOVE  0.308663 TO MIN-RANGE.                                 IF1024.2 36
   000376         038600     MOVE  0.308675 TO MAX-RANGE.                                 IF1024.2 37
   000377         038700 F-ANNUITY-TEST-03.                                               IF1024.2
   000378         038800     IF (FUNCTION ANNUITY(.09, A) >= MIN-RANGE) AND               IF1024.2 IFN 27 36
   000379         038900        (FUNCTION ANNUITY(.09, A) <= MAX-RANGE) THEN              IF1024.2 IFN 27 37
   000380      1  039000                    PERFORM PASS                                  IF1024.2 222
   000381         039100     ELSE                                                         IF1024.2
   000382      1  039200                    PERFORM FAIL.                                 IF1024.2 223
   000383         039300     GO TO F-ANNUITY-WRITE-03.                                    IF1024.2 387
   000384         039400 F-ANNUITY-DELETE-03.                                             IF1024.2
   000385         039500     PERFORM  DE-LETE.                                            IF1024.2 224
   000386         039600     GO TO    F-ANNUITY-WRITE-03.                                 IF1024.2 387
   000387         039700 F-ANNUITY-WRITE-03.                                              IF1024.2
   000388         039800     MOVE "F-ANNUITY-03" TO PAR-NAME.                             IF1024.2 46
   000389         039900     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000390         040100 F-ANNUITY-04.                                                    IF1024.2
   000391         040200     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000392         040300     MOVE  0.694430 TO MIN-RANGE.                                 IF1024.2 36
   000393         040400     MOVE  0.694458 TO MAX-RANGE.                                 IF1024.2 37
   000394         040500 F-ANNUITY-TEST-04.                                               IF1024.2
   000395         040600     COMPUTE WS-NUM = FUNCTION ANNUITY(B, 2).                     IF1024.2 35 IFN 28
   000396         040700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000398      1  040900                    PERFORM PASS                                  IF1024.2 222
   000399         041000     ELSE                                                         IF1024.2
   000400      1  041100                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000401      1  041200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000402      1  041300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000403      1  041400                    PERFORM FAIL.                                 IF1024.2 223
   000404         041500     GO TO F-ANNUITY-WRITE-04.                                    IF1024.2 408
   000405         041600 F-ANNUITY-DELETE-04.                                             IF1024.2
   000406         041700     PERFORM  DE-LETE.                                            IF1024.2 224
   000407         041800     GO TO    F-ANNUITY-WRITE-04.                                 IF1024.2 408
   000408         041900 F-ANNUITY-WRITE-04.                                              IF1024.2
   000409         042000     MOVE "F-ANNUITY-04" TO PAR-NAME.                             IF1024.2 46
   000410         042100     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000411         042300 F-ANNUITY-05.                                                    IF1024.2
   000412         042400     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000413         042500     MOVE  0.423434 TO MIN-RANGE.                                 IF1024.2 36
   000414         042600     MOVE  0.423450 TO MAX-RANGE.                                 IF1024.2 37
   000415         042700 F-ANNUITY-TEST-05.                                               IF1024.2
   000416         042800     COMPUTE WS-NUM = FUNCTION ANNUITY(B, 4).                     IF1024.2 35 IFN 28
   000417         042900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000418         043000        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000419      1  043100                    PERFORM PASS                                  IF1024.2 222
   000420         043200     ELSE                                                         IF1024.2
   000421      1  043300                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000422      1  043400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000423      1  043500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000424      1  043600                    PERFORM FAIL.                                 IF1024.2 223
   000425         043700     GO TO F-ANNUITY-WRITE-05.                                    IF1024.2 429
   000426         043800 F-ANNUITY-DELETE-05.                                             IF1024.2
   000427         043900     PERFORM  DE-LETE.                                            IF1024.2 224
   000428         044000     GO TO    F-ANNUITY-WRITE-05.                                 IF1024.2 429
   000429         044100 F-ANNUITY-WRITE-05.                                              IF1024.2
   000430         044200     MOVE "F-ANNUITY-05" TO PAR-NAME.                             IF1024.2 46
   000431         044300     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000432         044500 F-ANNUITY-06.                                                    IF1024.2
   000433         044600     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000434         044700     MOVE  3.99992 TO MIN-RANGE.                                  IF1024.2 36
   000435         044800     MOVE  4.00008 TO MAX-RANGE.                                  IF1024.2 37
   000436         044900 F-ANNUITY-TEST-06.                                               IF1024.2
   000437         045000     COMPUTE WS-NUM = FUNCTION ANNUITY(A, 9).                     IF1024.2 35 IFN 27
   000438         045100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000439         045200        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000440      1  045300                    PERFORM PASS                                  IF1024.2 222
   000441         045400     ELSE                                                         IF1024.2
   000442      1  045500                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000443      1  045600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000444      1  045700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000445      1  045800                    PERFORM FAIL.                                 IF1024.2 223
   000446         045900     GO TO F-ANNUITY-WRITE-06.                                    IF1024.2 450
   000447         046000 F-ANNUITY-DELETE-06.                                             IF1024.2
   000448         046100     PERFORM  DE-LETE.                                            IF1024.2 224
   000449         046200     GO TO    F-ANNUITY-WRITE-06.                                 IF1024.2 450
   000450         046300 F-ANNUITY-WRITE-06.                                              IF1024.2
   000451         046400     MOVE "F-ANNUITY-06" TO PAR-NAME.                             IF1024.2 46
   000452         046500     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000453         046700 F-ANNUITY-07.                                                    IF1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046800     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000455         046900     MOVE  5.00054 TO MIN-RANGE.                                  IF1024.2 36
   000456         047000     MOVE  5.00074 TO MAX-RANGE.                                  IF1024.2 37
   000457         047100 F-ANNUITY-TEST-07.                                               IF1024.2
   000458         047200     COMPUTE WS-NUM = FUNCTION ANNUITY(5, 5).                     IF1024.2 35 IFN
   000459         047300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000460         047400        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000461      1  047500                    PERFORM PASS                                  IF1024.2 222
   000462         047600     ELSE                                                         IF1024.2
   000463      1  047700                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000464      1  047800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000465      1  047900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000466      1  048000                    PERFORM FAIL.                                 IF1024.2 223
   000467         048100     GO TO F-ANNUITY-WRITE-07.                                    IF1024.2 471
   000468         048200 F-ANNUITY-DELETE-07.                                             IF1024.2
   000469         048300     PERFORM  DE-LETE.                                            IF1024.2 224
   000470         048400     GO TO    F-ANNUITY-WRITE-07.                                 IF1024.2 471
   000471         048500 F-ANNUITY-WRITE-07.                                              IF1024.2
   000472         048600     MOVE "F-ANNUITY-07" TO PAR-NAME.                             IF1024.2 46
   000473         048700     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000474         048900 F-ANNUITY-08.                                                    IF1024.2
   000475         049000     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000476         049100     MOVE  4.03217   TO MIN-RANGE.                                IF1024.2 36
   000477         049200     MOVE  4.03233 TO MAX-RANGE.                                  IF1024.2 37
   000478         049300 F-ANNUITY-TEST-08.                                               IF1024.2
   000479         049400     COMPUTE WS-NUM = FUNCTION ANNUITY(IND(1), IND(A)).           IF1024.2 35 IFN 33 33 27
   000480         049500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000481         049600        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000482      1  049700                    PERFORM PASS                                  IF1024.2 222
   000483         049800     ELSE                                                         IF1024.2
   000484      1  049900                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000485      1  050000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000486      1  050100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000487      1  050200                    PERFORM FAIL.                                 IF1024.2 223
   000488         050300     GO TO F-ANNUITY-WRITE-08.                                    IF1024.2 492
   000489         050400 F-ANNUITY-DELETE-08.                                             IF1024.2
   000490         050500     PERFORM  DE-LETE.                                            IF1024.2 224
   000491         050600     GO TO    F-ANNUITY-WRITE-08.                                 IF1024.2 492
   000492         050700 F-ANNUITY-WRITE-08.                                              IF1024.2
   000493         050800     MOVE "F-ANNUITY-08" TO PAR-NAME.                             IF1024.2 46
   000494         050900     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000495         051100 F-ANNUITY-09.                                                    IF1024.2
   000496         051200     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000497         051300     MOVE  0.204824 TO MIN-RANGE.                                 IF1024.2 36
   000498         051400     MOVE  0.204840 TO MAX-RANGE.                                 IF1024.2 37
   000499         051500 F-ANNUITY-TEST-09.                                               IF1024.2
   000500         051600     COMPUTE WS-NUM = FUNCTION ANNUITY(B / 2, 8).                 IF1024.2 35 IFN 28
   000501         051700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000502         051800        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000503      1  051900                    PERFORM PASS                                  IF1024.2 222
   000504         052000     ELSE                                                         IF1024.2
   000505      1  052100                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000506      1  052200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000507      1  052300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000508      1  052400                    PERFORM FAIL.                                 IF1024.2 223
   000509         052500     GO TO F-ANNUITY-WRITE-09.                                    IF1024.2 513
   000510         052600 F-ANNUITY-DELETE-09.                                             IF1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052700     PERFORM  DE-LETE.                                            IF1024.2 224
   000512         052800     GO TO    F-ANNUITY-WRITE-09.                                 IF1024.2 513
   000513         052900 F-ANNUITY-WRITE-09.                                              IF1024.2
   000514         053000     MOVE "F-ANNUITY-09" TO PAR-NAME.                             IF1024.2 46
   000515         053100     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000516         053300 F-ANNUITY-10.                                                    IF1024.2
   000517         053400     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000518         053500     MOVE 0.576553 TO MIN-RANGE.                                  IF1024.2 36
   000519         053600     MOVE 0.576599 TO MAX-RANGE.                                  IF1024.2 37
   000520         053700 F-ANNUITY-TEST-10.                                               IF1024.2
   000521         053800     COMPUTE WS-NUM = FUNCTION ANNUITY(                           IF1024.2 35 IFN
   000522         053900                      FUNCTION ANNUITY(0, 3), 3).                 IF1024.2 IFN
   000523         054000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000524         054100        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000525      1  054200                    PERFORM PASS                                  IF1024.2 222
   000526         054300     ELSE                                                         IF1024.2
   000527      1  054400                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000528      1  054500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000529      1  054600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000530      1  054700                    PERFORM FAIL.                                 IF1024.2 223
   000531         054800     GO TO F-ANNUITY-WRITE-10.                                    IF1024.2 535
   000532         054900 F-ANNUITY-DELETE-10.                                             IF1024.2
   000533         055000     PERFORM  DE-LETE.                                            IF1024.2 224
   000534         055100     GO TO    F-ANNUITY-WRITE-10.                                 IF1024.2 535
   000535         055200 F-ANNUITY-WRITE-10.                                              IF1024.2
   000536         055300     MOVE "F-ANNUITY-10" TO PAR-NAME.                             IF1024.2 46
   000537         055400     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000538         055600 F-ANNUITY-11.                                                    IF1024.2
   000539         055700     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000540         055800     MOVE 4.49978 TO MIN-RANGE.                                   IF1024.2 36
   000541         055900     MOVE 5.50022 TO MAX-RANGE.                                   IF1024.2 37
   000542         056000 F-ANNUITY-TEST-11.                                               IF1024.2
   000543         056100     COMPUTE WS-NUM = FUNCTION ANNUITY(0, 2) + 5.                 IF1024.2 35 IFN
   000544         056200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000545         056300        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
   000546      1  056400                    PERFORM PASS                                  IF1024.2 222
   000547         056500     ELSE                                                         IF1024.2
   000548      1  056600                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000549      1  056700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000550      1  056800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000551      1  056900                    PERFORM FAIL.                                 IF1024.2 223
   000552         057000     GO TO F-ANNUITY-WRITE-11.                                    IF1024.2 556
   000553         057100 F-ANNUITY-DELETE-11.                                             IF1024.2
   000554         057200     PERFORM  DE-LETE.                                            IF1024.2 224
   000555         057300     GO TO    F-ANNUITY-WRITE-11.                                 IF1024.2 556
   000556         057400 F-ANNUITY-WRITE-11.                                              IF1024.2
   000557         057500     MOVE "F-ANNUITY-11" TO PAR-NAME.                             IF1024.2 46
   000558         057600     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000559         057800 F-ANNUITY-12.                                                    IF1024.2
   000560         057900     MOVE ZERO TO WS-NUM.                                         IF1024.2 IMP 35
   000561         058000     MOVE 0.999960 TO MIN-RANGE.                                  IF1024.2 36
   000562         058100     MOVE 1.00004 TO MAX-RANGE.                                   IF1024.2 37
   000563         058200 F-ANNUITY-TEST-12.                                               IF1024.2
   000564         058300     COMPUTE WS-NUM = FUNCTION ANNUITY(0, 2) +                    IF1024.2 35 IFN
   000565         058400                      FUNCTION ANNUITY(0, 2).                     IF1024.2 IFN
   000566         058500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1024.2 35 36
   000567         058600        (WS-NUM <= MAX-RANGE) THEN                                IF1024.2 35 37
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  058700                    PERFORM PASS                                  IF1024.2 222
   000569         058800     ELSE                                                         IF1024.2
   000570      1  058900                    MOVE WS-NUM TO COMPUTED-N                     IF1024.2 35 58
   000571      1  059000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1024.2 36 86
   000572      1  059100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1024.2 37 100
   000573      1  059200                    PERFORM FAIL.                                 IF1024.2 223
   000574         059300     GO TO F-ANNUITY-WRITE-12.                                    IF1024.2 578
   000575         059400 F-ANNUITY-DELETE-12.                                             IF1024.2
   000576         059500     PERFORM  DE-LETE.                                            IF1024.2 224
   000577         059600     GO TO    F-ANNUITY-WRITE-12.                                 IF1024.2 578
   000578         059700 F-ANNUITY-WRITE-12.                                              IF1024.2
   000579         059800     MOVE "F-ANNUITY-12" TO PAR-NAME.                             IF1024.2 46
   000580         059900     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000581         060100 F-ANNUITY-13.                                                    IF1024.2
   000582         060200     PERFORM F-ANNUITY-TEST-13                                    IF1024.2 586
   000583         060300       UNTIL FUNCTION ANNUITY(0, ARG2) < .25.                     IF1024.2 IFN 31
   000584         060400     PERFORM PASS.                                                IF1024.2 222
   000585         060500     GO TO F-ANNUITY-WRITE-13.                                    IF1024.2 591
   000586         060600 F-ANNUITY-TEST-13.                                               IF1024.2
   000587         060700     COMPUTE ARG2 = ARG2 + 1.                                     IF1024.2 31 31
   000588         060800 F-ANNUITY-DELETE-13.                                             IF1024.2
   000589         060900     PERFORM  DE-LETE.                                            IF1024.2 224
   000590         061000     GO TO    F-ANNUITY-WRITE-13.                                 IF1024.2 591
   000591         061100 F-ANNUITY-WRITE-13.                                              IF1024.2
   000592         061200     MOVE "F-ANNUITY-13" TO PAR-NAME.                             IF1024.2 46
   000593         061300     PERFORM  PRINT-DETAIL.                                       IF1024.2 226
   000594         061500 CCVS-EXIT SECTION.                                               IF1024.2
   000595         061600 CCVS-999999.                                                     IF1024.2
   000596         061700     GO TO CLOSE-FILES.                                           IF1024.2 217
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  378 379 437 479
      130   ANSI-REFERENCE . . . . . . . .  304 311 327 M338
       31   ARG2 . . . . . . . . . . . . .  583 M587 587
       32   ARR
       28   B. . . . . . . . . . . . . . .  395 416 500
       29   C
      109   CCVS-C-1 . . . . . . . . . . .  244 289
      114   CCVS-C-2 . . . . . . . . . . .  245 290
      164   CCVS-E-1 . . . . . . . . . . .  250
      169   CCVS-E-2 . . . . . . . . . . .  258 265 272 277
      172   CCVS-E-2-2 . . . . . . . . . .  M257
      177   CCVS-E-3 . . . . . . . . . . .  278
      186   CCVS-E-4 . . . . . . . . . . .  257
      187   CCVS-E-4-1 . . . . . . . . . .  M255
      189   CCVS-E-4-2 . . . . . . . . . .  M256
      131   CCVS-H-1 . . . . . . . . . . .  239 285
      136   CCVS-H-2A. . . . . . . . . . .  240 286
      145   CCVS-H-2B. . . . . . . . . . .  241 287
      157   CCVS-H-3 . . . . . . . . . . .  242 288
      207   CCVS-PGM-ID. . . . . . . . . .  213 213
       63   CM-18V0
       57   COMPUTED-A . . . . . . . . . .  58 60 61 62 63 322 326
       58   COMPUTED-N . . . . . . . . . .  M350 M400 M421 M442 M463 M484 M505 M527 M548 M570
       56   COMPUTED-X . . . . . . . . . .  M234 301
       60   COMPUTED-0V18
       62   COMPUTED-14V4
       64   COMPUTED-18V0
       61   COMPUTED-4V14
       80   COR-ANSI-REFERENCE . . . . . .  M311 M319
      108   CORMA-ANSI-REFERENCE . . . . .  M312
       71   CORRECT-A. . . . . . . . . . .  72 73 74 75 76 323 325
      100   CORRECT-MAX. . . . . . . . . .  M352 M402 M423 M444 M465 M486 M507 M529 M550 M572
       86   CORRECT-MIN. . . . . . . . . .  313 M351 M401 M422 M443 M464 M485 M506 M528 M549 M571
       72   CORRECT-N
       70   CORRECT-X. . . . . . . . . . .  M235 303
       73   CORRECT-0V18
       75   CORRECT-14V4
       77   CORRECT-18V0
       74   CORRECT-4V14
       99   CORRECTMA-A. . . . . . . . . .  100 101 102 103 104
       98   CORRECTMA-X
      101   CORRECTMA-0V18
      103   CORRECTMA-14V4
      105   CORRECTMA-18V0
      102   CORRECTMA-4V14
       85   CORRECTMI-A. . . . . . . . . .  86 87 88 89 90
       84   CORRECTMI-X
       87   CORRECTMI-0V18
       89   CORRECTMI-14V4
       91   CORRECTMI-18V0
       88   CORRECTMI-4V14
       76   CR-18V0
       90   CR-18V0
      104   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    15
0 Defined   Cross-reference of data names   References

0      30   D
      122   DELETE-COUNTER . . . . . . . .  M224 253 268 270
       49   DOTVALUE . . . . . . . . . . .  M229
      128   DUMMY-HOLD . . . . . . . . . .  M282 292
       24   DUMMY-RECORD . . . . . . . . .  M239 M240 M241 M242 M244 M245 M246 M248 M250 M258 M265 M272 M277 M278 282 M283
                                            284 M285 M286 M287 M288 M289 M290 M291 M292 296 M297 M306 M328
      175   ENDER-DESC . . . . . . . . . .  M260 M271 M276
      123   ERROR-COUNTER. . . . . . . . .  M223 252 261 264
      127   ERROR-HOLD . . . . . . . . . .  M252 M253 M253 M254 256
      173   ERROR-TOTAL. . . . . . . . . .  M262 M264 M269 M270 M274 M275
       42   FEATURE. . . . . . . . . . . .  M339
      201   HYPHEN-LINE. . . . . . . . . .  246 248 291
      167   ID-AGAIN . . . . . . . . . . .  M213
       33   IND. . . . . . . . . . . . . .  479 479
      200   INF-ANSI-REFERENCE . . . . . .  M304 M307 M327 M329
      195   INFO-TEXT. . . . . . . . . . .  M305
      124   INSPECT-COUNTER. . . . . . . .  M221 252 273 275
       37   MAX-RANGE. . . . . . . . . . .  M343 347 352 M376 379 M393 397 402 M414 418 423 M435 439 444 M456 460 465 M477
                                            481 486 M498 502 507 M519 524 529 M541 545 550 M562 567 572
       36   MIN-RANGE. . . . . . . . . . .  M342 346 351 M375 378 M392 396 401 M413 417 422 M434 438 443 M455 459 464 M476
                                            480 485 M497 501 506 M518 523 528 M540 544 549 M561 566 571
       44   P-OR-F . . . . . . . . . . . .  M221 M222 M223 M224 231 M234
       46   PAR-NAME . . . . . . . . . . .  M236 M359 M372 M388 M409 M430 M451 M472 M493 M514 M536 M557 M579 M592
       48   PARDOT-X . . . . . . . . . . .  M228
      125   PASS-COUNTER . . . . . . . . .  M222 254 255
       22   PRINT-FILE . . . . . . . . . .  18 212 218
       23   PRINT-REC. . . . . . . . . . .  M230 M310 M314 M315 M317
       51   RE-MARK. . . . . . . . . . . .  M225 M237
      121   REC-CT . . . . . . . . . . . .  227 229 236
      120   REC-SKL-SUB
      129   RECORD-COUNT . . . . . . . . .  M280 281 M293
       34   TEMP
       52   TEST-COMPUTED. . . . . . . . .  310
       67   TEST-CORRECT . . . . . . . . .  317
       95   TEST-CORRECT-MAX . . . . . . .  315
       81   TEST-CORRECT-MIN . . . . . . .  314
      148   TEST-ID. . . . . . . . . . . .  M213
       40   TEST-RESULTS . . . . . . . . .  M214 230
      126   TOTAL-ERROR
       35   WS-NUM . . . . . . . . . . . .  M341 M345 346 347 350 M391 M395 396 397 400 M412 M416 417 418 421 M433 M437 438
                                            439 442 M454 M458 459 460 463 M475 M479 480 481 484 M496 M500 501 502 505 M517
                                            M521 523 524 527 M539 M543 544 545 548 M560 M564 566 567 570
      197   XXCOMPUTED . . . . . . . . . .  M326
      199   XXCORRECT. . . . . . . . . . .  M325
      192   XXINFO . . . . . . . . . . . .  306 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    16
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

      321   BAIL-OUT . . . . . . . . . . .  P233
      330   BAIL-OUT-EX. . . . . . . . . .  E233 G323
      324   BAIL-OUT-WRITE . . . . . . . .  G322
      298   BLANK-LINE-PRINT
      594   CCVS-EXIT
      595   CCVS-999999
      210   CCVS1
      331   CCVS1-EXIT . . . . . . . . . .  G216
      217   CLOSE-FILES. . . . . . . . . .  G596
      243   COLUMN-NAMES-ROUTINE . . . . .  E215
      224   DE-LETE. . . . . . . . . . . .  P356 P369 P385 P406 P427 P448 P469 P490 P511 P533 P554 P576 P589
      247   END-ROUTINE. . . . . . . . . .  P218
      251   END-ROUTINE-1
      259   END-ROUTINE-12
      267   END-ROUTINE-13 . . . . . . . .  E218
      249   END-RTN-EXIT
      355   F-ANNUITY-DELETE-01
      368   F-ANNUITY-DELETE-02
      384   F-ANNUITY-DELETE-03
      405   F-ANNUITY-DELETE-04
      426   F-ANNUITY-DELETE-05
      447   F-ANNUITY-DELETE-06
      468   F-ANNUITY-DELETE-07
      489   F-ANNUITY-DELETE-08
      510   F-ANNUITY-DELETE-09
      532   F-ANNUITY-DELETE-10
      553   F-ANNUITY-DELETE-11
      575   F-ANNUITY-DELETE-12
      588   F-ANNUITY-DELETE-13
      337   F-ANNUITY-INFO
      344   F-ANNUITY-TEST-01
      377   F-ANNUITY-TEST-03
      394   F-ANNUITY-TEST-04
      415   F-ANNUITY-TEST-05
      436   F-ANNUITY-TEST-06
      457   F-ANNUITY-TEST-07
      478   F-ANNUITY-TEST-08
      499   F-ANNUITY-TEST-09
      520   F-ANNUITY-TEST-10
      542   F-ANNUITY-TEST-11
      563   F-ANNUITY-TEST-12
      586   F-ANNUITY-TEST-13. . . . . . .  P582
      358   F-ANNUITY-WRITE-01 . . . . . .  G354 G357
      371   F-ANNUITY-WRITE-02 . . . . . .  G367 G370
      387   F-ANNUITY-WRITE-03 . . . . . .  G383 G386
      408   F-ANNUITY-WRITE-04 . . . . . .  G404 G407
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    17
0 Defined   Cross-reference of procedures   References

0     429   F-ANNUITY-WRITE-05 . . . . . .  G425 G428
      450   F-ANNUITY-WRITE-06 . . . . . .  G446 G449
      471   F-ANNUITY-WRITE-07 . . . . . .  G467 G470
      492   F-ANNUITY-WRITE-08 . . . . . .  G488 G491
      513   F-ANNUITY-WRITE-09 . . . . . .  G509 G512
      535   F-ANNUITY-WRITE-10 . . . . . .  G531 G534
      556   F-ANNUITY-WRITE-11 . . . . . .  G552 G555
      578   F-ANNUITY-WRITE-12 . . . . . .  G574 G577
      591   F-ANNUITY-WRITE-13 . . . . . .  G585 G590
      340   F-ANNUITY-01
      361   F-ANNUITY-02
      374   F-ANNUITY-03
      390   F-ANNUITY-04
      411   F-ANNUITY-05
      432   F-ANNUITY-06
      453   F-ANNUITY-07
      474   F-ANNUITY-08
      495   F-ANNUITY-09
      516   F-ANNUITY-10
      538   F-ANNUITY-11
      559   F-ANNUITY-12
      581   F-ANNUITY-13
      223   FAIL . . . . . . . . . . . . .  P353 P366 P382 P403 P424 P445 P466 P487 P508 P530 P551 P573
      300   FAIL-ROUTINE . . . . . . . . .  P232
      320   FAIL-ROUTINE-EX. . . . . . . .  E232 G308
      309   FAIL-ROUTINE-WRITE . . . . . .  G302 G303
      238   HEAD-ROUTINE . . . . . . . . .  P215
      221   INSPT
      211   OPEN-FILES
      222   PASS . . . . . . . . . . . . .  P348 P364 P380 P398 P419 P440 P461 P482 P503 P525 P546 P568 P584
      226   PRINT-DETAIL . . . . . . . . .  P360 P373 P389 P410 P431 P452 P473 P494 P515 P537 P558 P580 P593
      336   SECT-IF102A
      219   TERMINATE-CCVS
      279   WRITE-LINE . . . . . . . . . .  P230 P231 P239 P240 P241 P242 P244 P245 P246 P248 P250 P258 P266 P272 P277 P278
                                            P306 P310 P314 P315 P317 P318 P328
      295   WRT-LN . . . . . . . . . . . .  P285 P286 P287 P288 P289 P290 P291 P294 P299
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    18
0 Defined   Cross-reference of programs     References

        3   IF102A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF102A    Date 06/04/2022  Time 11:57:07   Page    19
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF102A:
 *    Source records = 596
 *    Data Division statements = 93
 *    Procedure Division statements = 319
 *    Generated COBOL statements = 0
 *    Program complexity factor = 327
0End of compilation 1,  program IF102A,  highest severity 0.
0Return code 0
