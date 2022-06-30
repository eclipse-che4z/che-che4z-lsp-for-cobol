1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:07   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:07   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1274.2
   000002         000200 PROGRAM-ID.                                                      IF1274.2
   000003         000300     IF127A.                                                      IF1274.2
   000004         000400                                                                  IF1274.2
   000005         000600*                                                         *       IF1274.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1274.2
   000007         000800* It contains tests for the Intrinsic Function ORD.       *       IF1274.2
   000008         000900*                                                         *       IF1274.2
   000009         001000*                                                         *       IF1274.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1274.2
   000011         001300 CONFIGURATION SECTION.                                           IF1274.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1274.2
   000013         001500     XXXXX082.                                                    IF1274.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1274.2
   000015         001700     XXXXX083                                                     IF1274.2
   000016         001800     PROGRAM COLLATING SEQUENCE IS PRG-COLL-SEQ.                  IF1274.2 18
   000017         001900 SPECIAL-NAMES.                                                   IF1274.2
   000018         002000     ALPHABET PRG-COLL-SEQ IS                                     IF1274.2
   000019         002100     STANDARD-2.                                                  IF1274.2
   000020         002200 INPUT-OUTPUT SECTION.                                            IF1274.2
   000021         002300 FILE-CONTROL.                                                    IF1274.2
   000022         002400     SELECT PRINT-FILE ASSIGN TO                                  IF1274.2 26
   000023         002500     XXXXX055.                                                    IF1274.2
   000024         002600 DATA DIVISION.                                                   IF1274.2
   000025         002700 FILE SECTION.                                                    IF1274.2
   000026         002800 FD  PRINT-FILE.                                                  IF1274.2

 ==000026==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000027         002900 01  PRINT-REC PICTURE X(120).                                    IF1274.2
   000028         003000 01  DUMMY-RECORD PICTURE X(120).                                 IF1274.2
   000029         003100 WORKING-STORAGE SECTION.                                         IF1274.2
   000030         003300* Variables specific to the Intrinsic Function Test IF127A*       IF1274.2
   000031         003500 01  A                   PIC X          VALUE "F".                IF1274.2
   000032         003600 01  B                   PIC X          VALUE "d".                IF1274.2
   000033         003700 01  C                   PIC X          VALUE "3".                IF1274.2
   000034         003800 01  ARG1                PIC X          VALUE "A".                IF1274.2
   000035         003900 01  TEMP                PIC S9(10).                              IF1274.2
   000036         004000 01  WS-INT              PIC S9(10).                              IF1274.2
   000037         004100*                                                                 IF1274.2
   000038         004300*                                                                 IF1274.2
   000039         004400 01  TEST-RESULTS.                                                IF1274.2
   000040         004500     02 FILLER                   PIC X      VALUE SPACE.          IF1274.2 IMP
   000041         004600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1274.2 IMP
   000042         004700     02 FILLER                   PIC X      VALUE SPACE.          IF1274.2 IMP
   000043         004800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1274.2 IMP
   000044         004900     02 FILLER                   PIC X      VALUE SPACE.          IF1274.2 IMP
   000045         005000     02  PAR-NAME.                                                IF1274.2
   000046         005100       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1274.2 IMP
   000047         005200       03  PARDOT-X              PIC X      VALUE SPACE.          IF1274.2 IMP
   000048         005300       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1274.2 IMP
   000049         005400     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1274.2 IMP
   000050         005500     02 RE-MARK                  PIC X(61).                       IF1274.2
   000051         005600 01  TEST-COMPUTED.                                               IF1274.2
   000052         005700     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1274.2 IMP
   000053         005800     02 FILLER                   PIC X(17)  VALUE                 IF1274.2
   000054         005900            "       COMPUTED=".                                   IF1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 COMPUTED-X.                                               IF1274.2
   000056         006100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1274.2 IMP
   000057         006200     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1274.2 56
   000058         006300                                 PIC -9(9).9(9).                  IF1274.2
   000059         006400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1274.2 56
   000060         006500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1274.2 56
   000061         006600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1274.2 56
   000062         006700     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1274.2 56
   000063         006800         04 COMPUTED-18V0                    PIC -9(18).          IF1274.2
   000064         006900         04 FILLER                           PIC X.               IF1274.2
   000065         007000     03 FILLER PIC X(50) VALUE SPACE.                             IF1274.2 IMP
   000066         007100 01  TEST-CORRECT.                                                IF1274.2
   000067         007200     02 FILLER PIC X(30) VALUE SPACE.                             IF1274.2 IMP
   000068         007300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1274.2
   000069         007400     02 CORRECT-X.                                                IF1274.2
   000070         007500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1274.2 IMP
   000071         007600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1274.2 70
   000072         007700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1274.2 70
   000073         007800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1274.2 70
   000074         007900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1274.2 70
   000075         008000     03      CR-18V0 REDEFINES CORRECT-A.                         IF1274.2 70
   000076         008100         04 CORRECT-18V0                     PIC -9(18).          IF1274.2
   000077         008200         04 FILLER                           PIC X.               IF1274.2
   000078         008300     03 FILLER PIC X(2) VALUE SPACE.                              IF1274.2 IMP
   000079         008400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1274.2 IMP
   000080         008500 01  TEST-CORRECT-MIN.                                            IF1274.2
   000081         008600     02 FILLER PIC X(30) VALUE SPACE.                             IF1274.2 IMP
   000082         008700     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1274.2
   000083         008800     02 CORRECTMI-X.                                              IF1274.2
   000084         008900     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1274.2 IMP
   000085         009000     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1274.2 84
   000086         009100     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1274.2 84
   000087         009200     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1274.2 84
   000088         009300     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1274.2 84
   000089         009400     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1274.2 84
   000090         009500         04 CORRECTMI-18V0                     PIC -9(18).        IF1274.2
   000091         009600         04 FILLER                           PIC X.               IF1274.2
   000092         009700     03 FILLER PIC X(2) VALUE SPACE.                              IF1274.2 IMP
   000093         009800     03 FILLER                           PIC X(48) VALUE SPACE.   IF1274.2 IMP
   000094         009900 01  TEST-CORRECT-MAX.                                            IF1274.2
   000095         010000     02 FILLER PIC X(30) VALUE SPACE.                             IF1274.2 IMP
   000096         010100     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1274.2
   000097         010200     02 CORRECTMA-X.                                              IF1274.2
   000098         010300     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1274.2 IMP
   000099         010400     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1274.2 98
   000100         010500     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1274.2 98
   000101         010600     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1274.2 98
   000102         010700     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1274.2 98
   000103         010800     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1274.2 98
   000104         010900         04 CORRECTMA-18V0                     PIC -9(18).        IF1274.2
   000105         011000         04 FILLER                           PIC X.               IF1274.2
   000106         011100     03 FILLER PIC X(2) VALUE SPACE.                              IF1274.2 IMP
   000107         011200     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1274.2 IMP
   000108         011300 01  CCVS-C-1.                                                    IF1274.2
   000109         011400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1274.2
   000110         011500-    "SS  PARAGRAPH-NAME                                          IF1274.2
   000111         011600-    "       REMARKS".                                            IF1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1274.2 IMP
   000113         011800 01  CCVS-C-2.                                                    IF1274.2
   000114         011900     02 FILLER                     PIC X        VALUE SPACE.      IF1274.2 IMP
   000115         012000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1274.2
   000116         012100     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1274.2 IMP
   000117         012200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1274.2
   000118         012300     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1274.2 IMP
   000119         012400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1274.2 IMP
   000120         012500 01  REC-CT                        PIC 99       VALUE ZERO.       IF1274.2 IMP
   000121         012600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1274.2 IMP
   000122         012700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1274.2 IMP
   000123         012800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1274.2 IMP
   000124         012900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1274.2 IMP
   000125         013000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1274.2 IMP
   000126         013100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1274.2 IMP
   000127         013200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1274.2 IMP
   000128         013300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1274.2 IMP
   000129         013400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1274.2 IMP
   000130         013500 01  CCVS-H-1.                                                    IF1274.2
   000131         013600     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1274.2 IMP
   000132         013700     02  FILLER                    PIC X(42)    VALUE             IF1274.2
   000133         013800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1274.2
   000134         013900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1274.2 IMP
   000135         014000 01  CCVS-H-2A.                                                   IF1274.2
   000136         014100   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1274.2 IMP
   000137         014200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1274.2
   000138         014300   02  FILLER                        PIC XXXX   VALUE             IF1274.2
   000139         014400     "4.2 ".                                                      IF1274.2
   000140         014500   02  FILLER                        PIC X(28)  VALUE             IF1274.2
   000141         014600            " COPY - NOT FOR DISTRIBUTION".                       IF1274.2
   000142         014700   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1274.2 IMP
   000143         014800                                                                  IF1274.2
   000144         014900 01  CCVS-H-2B.                                                   IF1274.2
   000145         015000   02  FILLER                        PIC X(15)  VALUE             IF1274.2
   000146         015100            "TEST RESULT OF ".                                    IF1274.2
   000147         015200   02  TEST-ID                       PIC X(9).                    IF1274.2
   000148         015300   02  FILLER                        PIC X(4)   VALUE             IF1274.2
   000149         015400            " IN ".                                               IF1274.2
   000150         015500   02  FILLER                        PIC X(12)  VALUE             IF1274.2
   000151         015600     " HIGH       ".                                              IF1274.2
   000152         015700   02  FILLER                        PIC X(22)  VALUE             IF1274.2
   000153         015800            " LEVEL VALIDATION FOR ".                             IF1274.2
   000154         015900   02  FILLER                        PIC X(58)  VALUE             IF1274.2
   000155         016000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1274.2
   000156         016100 01  CCVS-H-3.                                                    IF1274.2
   000157         016200     02  FILLER                      PIC X(34)  VALUE             IF1274.2
   000158         016300            " FOR OFFICIAL USE ONLY    ".                         IF1274.2
   000159         016400     02  FILLER                      PIC X(58)  VALUE             IF1274.2
   000160         016500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1274.2
   000161         016600     02  FILLER                      PIC X(28)  VALUE             IF1274.2
   000162         016700            "  COPYRIGHT   1985 ".                                IF1274.2
   000163         016800 01  CCVS-E-1.                                                    IF1274.2
   000164         016900     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1274.2 IMP
   000165         017000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1274.2
   000166         017100     02 ID-AGAIN                     PIC X(9).                    IF1274.2
   000167         017200     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1274.2 IMP
   000168         017300 01  CCVS-E-2.                                                    IF1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1274.2 IMP
   000170         017500     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1274.2 IMP
   000171         017600     02 CCVS-E-2-2.                                               IF1274.2
   000172         017700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1274.2 IMP
   000173         017800         03 FILLER                   PIC X      VALUE SPACE.      IF1274.2 IMP
   000174         017900         03 ENDER-DESC               PIC X(44)  VALUE             IF1274.2
   000175         018000            "ERRORS ENCOUNTERED".                                 IF1274.2
   000176         018100 01  CCVS-E-3.                                                    IF1274.2
   000177         018200     02  FILLER                      PIC X(22)  VALUE             IF1274.2
   000178         018300            " FOR OFFICIAL USE ONLY".                             IF1274.2
   000179         018400     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1274.2 IMP
   000180         018500     02  FILLER                      PIC X(58)  VALUE             IF1274.2
   000181         018600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1274.2
   000182         018700     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1274.2 IMP
   000183         018800     02 FILLER                       PIC X(15)  VALUE             IF1274.2
   000184         018900             " COPYRIGHT 1985".                                   IF1274.2
   000185         019000 01  CCVS-E-4.                                                    IF1274.2
   000186         019100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1274.2 IMP
   000187         019200     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1274.2
   000188         019300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1274.2 IMP
   000189         019400     02 FILLER                       PIC X(40)  VALUE             IF1274.2
   000190         019500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1274.2
   000191         019600 01  XXINFO.                                                      IF1274.2
   000192         019700     02 FILLER                       PIC X(19)  VALUE             IF1274.2
   000193         019800            "*** INFORMATION ***".                                IF1274.2
   000194         019900     02 INFO-TEXT.                                                IF1274.2
   000195         020000       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1274.2 IMP
   000196         020100       04 XXCOMPUTED                 PIC X(20).                   IF1274.2
   000197         020200       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1274.2 IMP
   000198         020300       04 XXCORRECT                  PIC X(20).                   IF1274.2
   000199         020400     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1274.2
   000200         020500 01  HYPHEN-LINE.                                                 IF1274.2
   000201         020600     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1274.2 IMP
   000202         020700     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1274.2
   000203         020800-    "*****************************************".                 IF1274.2
   000204         020900     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1274.2
   000205         021000-    "******************************".                            IF1274.2
   000206         021100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1274.2
   000207         021200     "IF127A".                                                    IF1274.2
   000208         021300 PROCEDURE DIVISION.                                              IF1274.2
   000209         021400 CCVS1 SECTION.                                                   IF1274.2
   000210         021500 OPEN-FILES.                                                      IF1274.2
   000211         021600     OPEN     OUTPUT PRINT-FILE.                                  IF1274.2 26
   000212         021700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1274.2 206 147 206 166
   000213         021800     MOVE    SPACE TO TEST-RESULTS.                               IF1274.2 IMP 39
   000214         021900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1274.2 237 242
   000215         022000     GO TO CCVS1-EXIT.                                            IF1274.2 330
   000216         022100 CLOSE-FILES.                                                     IF1274.2
   000217         022200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1274.2 246 266 26
   000218         022300 TERMINATE-CCVS.                                                  IF1274.2
   000219         022400     STOP     RUN.                                                IF1274.2
   000220         022500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1274.2 43 123
   000221         022600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1274.2 43 124
   000222         022700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1274.2 43 122
   000223         022800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1274.2 43 121
   000224         022900     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1274.2 50
   000225         023000 PRINT-DETAIL.                                                    IF1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100     IF REC-CT NOT EQUAL TO ZERO                                  IF1274.2 120 IMP
   000227      1  023200             MOVE "." TO PARDOT-X                                 IF1274.2 47
   000228      1  023300             MOVE REC-CT TO DOTVALUE.                             IF1274.2 120 48
   000229         023400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1274.2 39 27 278
   000230         023500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1274.2 43 278
   000231      1  023600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1274.2 299 319
   000232      1  023700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1274.2 320 329
   000233         023800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1274.2 IMP 43 IMP 55
   000234         023900     MOVE SPACE TO CORRECT-X.                                     IF1274.2 IMP 69
   000235         024000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1274.2 120 IMP IMP 45
   000236         024100     MOVE     SPACE TO RE-MARK.                                   IF1274.2 IMP 50
   000237         024200 HEAD-ROUTINE.                                                    IF1274.2
   000238         024300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1274.2 130 28 278
   000239         024400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1274.2 135 28 278
   000240         024500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1274.2 144 28 278
   000241         024600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1274.2 156 28 278
   000242         024700 COLUMN-NAMES-ROUTINE.                                            IF1274.2
   000243         024800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1274.2 108 28 278
   000244         024900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1274.2 113 28 278
   000245         025000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1274.2 200 28 278
   000246         025100 END-ROUTINE.                                                     IF1274.2
   000247         025200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1274.2 200 28 278
   000248         025300 END-RTN-EXIT.                                                    IF1274.2
   000249         025400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1274.2 163 28 278
   000250         025500 END-ROUTINE-1.                                                   IF1274.2
   000251         025600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1274.2 122 126 123
   000252         025700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1274.2 126 121 126
   000253         025800      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1274.2 124 126
   000254         025900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1274.2 124 186
   000255         026000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1274.2 126 188
   000256         026100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1274.2 185 171
   000257         026200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1274.2 168 28 278
   000258         026300  END-ROUTINE-12.                                                 IF1274.2
   000259         026400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1274.2 174
   000260         026500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1274.2 122 IMP
   000261      1  026600         MOVE "NO " TO ERROR-TOTAL                                IF1274.2 172
   000262         026700         ELSE                                                     IF1274.2
   000263      1  026800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1274.2 122 172
   000264         026900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1274.2 168 28
   000265         027000     PERFORM WRITE-LINE.                                          IF1274.2 278
   000266         027100 END-ROUTINE-13.                                                  IF1274.2
   000267         027200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1274.2 121 IMP
   000268      1  027300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1274.2 172
   000269      1  027400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1274.2 121 172
   000270         027500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1274.2 174
   000271         027600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1274.2 168 28 278
   000272         027700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1274.2 123 IMP
   000273      1  027800          MOVE "NO " TO ERROR-TOTAL                               IF1274.2 172
   000274      1  027900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1274.2 123 172
   000275         028000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1274.2 174
   000276         028100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1274.2 168 28 278
   000277         028200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1274.2 176 28 278
   000278         028300 WRITE-LINE.                                                      IF1274.2
   000279         028400     ADD 1 TO RECORD-COUNT.                                       IF1274.2 128
   000280         028500     IF RECORD-COUNT GREATER 42                                   IF1274.2 128
   000281      1  028600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1274.2 28 127
   000282      1  028700         MOVE SPACE TO DUMMY-RECORD                               IF1274.2 IMP 28
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1274.2 28
   000284      1  028900         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1274.2 130 28 294
   000285      1  029000         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1274.2 135 28 294
   000286      1  029100         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1274.2 144 28 294
   000287      1  029200         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1274.2 156 28 294
   000288      1  029300         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1274.2 108 28 294
   000289      1  029400         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1274.2 113 28 294
   000290      1  029500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1274.2 200 28 294
   000291      1  029600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1274.2 127 28
   000292      1  029700         MOVE ZERO TO RECORD-COUNT.                               IF1274.2 IMP 128
   000293         029800     PERFORM WRT-LN.                                              IF1274.2 294
   000294         029900 WRT-LN.                                                          IF1274.2
   000295         030000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1274.2 28
   000296         030100     MOVE SPACE TO DUMMY-RECORD.                                  IF1274.2 IMP 28
   000297         030200 BLANK-LINE-PRINT.                                                IF1274.2
   000298         030300     PERFORM WRT-LN.                                              IF1274.2 294
   000299         030400 FAIL-ROUTINE.                                                    IF1274.2
   000300         030500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1274.2 55 IMP
   000301      1  030600            GO TO FAIL-ROUTINE-WRITE.                             IF1274.2 308
   000302         030700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1274.2 69 IMP 308
   000303         030800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1274.2 129 199
   000304         030900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1274.2 194
   000305         031000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1274.2 191 28 278
   000306         031100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1274.2 IMP 199
   000307         031200     GO TO  FAIL-ROUTINE-EX.                                      IF1274.2 319
   000308         031300 FAIL-ROUTINE-WRITE.                                              IF1274.2
   000309         031400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1274.2 51 27 278
   000310         031500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1274.2 129 79
   000311         031600                              CORMA-ANSI-REFERENCE.               IF1274.2 107
   000312         031700     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1274.2 85 IMP
   000313      1  031800           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1274.2 80 27 278
   000314      1  031900           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1274.2 94 27 278
   000315         032000     ELSE                                                         IF1274.2
   000316      1  032100           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1274.2 66 27 278
   000317         032200     PERFORM WRITE-LINE.                                          IF1274.2 278
   000318         032300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1274.2 IMP 79
   000319         032400 FAIL-ROUTINE-EX. EXIT.                                           IF1274.2
   000320         032500 BAIL-OUT.                                                        IF1274.2
   000321         032600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1274.2 56 IMP 323
   000322         032700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1274.2 70 IMP 329
   000323         032800 BAIL-OUT-WRITE.                                                  IF1274.2
   000324         032900     MOVE CORRECT-A TO XXCORRECT.                                 IF1274.2 70 198
   000325         033000     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1274.2 56 196
   000326         033100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1274.2 129 199
   000327         033200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1274.2 191 28 278
   000328         033300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1274.2 IMP 199
   000329         033400 BAIL-OUT-EX. EXIT.                                               IF1274.2
   000330         033500 CCVS1-EXIT.                                                      IF1274.2
   000331         033600     EXIT.                                                        IF1274.2
   000332         033800*                                                      *          IF1274.2
   000333         033900*    Intrinsic Function Tests         IF127A - ORD     *          IF1274.2
   000334         034000*                                                      *          IF1274.2
   000335         034200 SECT-IF127A SECTION.                                             IF1274.2
   000336         034300 F-ORD-INFO.                                                      IF1274.2
   000337         034400     MOVE     "See ref. A-60 2.31" TO ANSI-REFERENCE.             IF1274.2 129
   000338         034500     MOVE     "ORD Function"     TO FEATURE.                      IF1274.2 41
   000339         034700 F-ORD-01.                                                        IF1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800     MOVE ZERO TO WS-INT.                                         IF1274.2 IMP 36
   000341         034900 F-ORD-TEST-01.                                                   IF1274.2
   000342         035000     COMPUTE WS-INT = FUNCTION ORD("A").                          IF1274.2 36 IFN
   000343         035100     IF WS-INT = 66 THEN                                          IF1274.2 36
   000344      1  035200                        PERFORM PASS                              IF1274.2 221
   000345         035300     ELSE                                                         IF1274.2
   000346      1  035400                        MOVE 66  TO CORRECT-N                     IF1274.2 71
   000347      1  035500                        MOVE WS-INT TO COMPUTED-N                 IF1274.2 36 57
   000348      1  035600                        PERFORM FAIL.                             IF1274.2 222
   000349         035700     GO TO F-ORD-WRITE-01.                                        IF1274.2 353
   000350         035800 F-ORD-DELETE-01.                                                 IF1274.2
   000351         035900     PERFORM  DE-LETE.                                            IF1274.2 223
   000352         036000     GO TO    F-ORD-WRITE-01.                                     IF1274.2 353
   000353         036100 F-ORD-WRITE-01.                                                  IF1274.2
   000354         036200     MOVE "F-ORD-01" TO PAR-NAME.                                 IF1274.2 45
   000355         036300     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000356         036500 F-ORD-TEST-02.                                                   IF1274.2
   000357         036600     EVALUATE FUNCTION ORD("m")                                   IF1274.2 IFN
   000358         036700     WHEN 110                                                     IF1274.2
   000359      1  036800                                 PERFORM PASS                     IF1274.2 221
   000360      1  036900                                 GO TO F-ORD-WRITE-02.            IF1274.2 366
   000361         037000     PERFORM FAIL.                                                IF1274.2 222
   000362         037100     GO TO F-ORD-WRITE-02.                                        IF1274.2 366
   000363         037200 F-ORD-DELETE-02.                                                 IF1274.2
   000364         037300     PERFORM  DE-LETE.                                            IF1274.2 223
   000365         037400     GO TO    F-ORD-WRITE-02.                                     IF1274.2 366
   000366         037500 F-ORD-WRITE-02.                                                  IF1274.2
   000367         037600     MOVE "F-ORD-02" TO PAR-NAME.                                 IF1274.2 45
   000368         037700     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000369         037900 F-ORD-03.                                                        IF1274.2
   000370         038000     MOVE ZERO TO WS-INT.                                         IF1274.2 IMP 36
   000371         038100 F-ORD-TEST-03.                                                   IF1274.2
   000372         038200     IF FUNCTION ORD("5") = 54 THEN                               IF1274.2 IFN
   000373      1  038300                        PERFORM PASS                              IF1274.2 221
   000374         038400     ELSE                                                         IF1274.2
   000375      1  038500                        PERFORM FAIL.                             IF1274.2 222
   000376         038600     GO TO F-ORD-WRITE-03.                                        IF1274.2 380
   000377         038700 F-ORD-DELETE-03.                                                 IF1274.2
   000378         038800     PERFORM  DE-LETE.                                            IF1274.2 223
   000379         038900     GO TO    F-ORD-WRITE-03.                                     IF1274.2 380
   000380         039000 F-ORD-WRITE-03.                                                  IF1274.2
   000381         039100     MOVE "F-ORD-03" TO PAR-NAME.                                 IF1274.2 45
   000382         039200     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000383         039400 F-ORD-04.                                                        IF1274.2
   000384         039500     MOVE ZERO TO WS-INT.                                         IF1274.2 IMP 36
   000385         039600 F-ORD-TEST-04.                                                   IF1274.2
   000386         039700     COMPUTE WS-INT = FUNCTION ORD(A).                            IF1274.2 36 IFN 31
   000387         039800     IF WS-INT = 71 THEN                                          IF1274.2 36
   000388      1  039900                        PERFORM PASS                              IF1274.2 221
   000389         040000     ELSE                                                         IF1274.2
   000390      1  040100                        MOVE 71  TO CORRECT-N                     IF1274.2 71
   000391      1  040200                        MOVE WS-INT TO COMPUTED-N                 IF1274.2 36 57
   000392      1  040300                        PERFORM FAIL.                             IF1274.2 222
   000393         040400     GO TO F-ORD-WRITE-04.                                        IF1274.2 397
   000394         040500 F-ORD-DELETE-04.                                                 IF1274.2
   000395         040600     PERFORM  DE-LETE.                                            IF1274.2 223
   000396         040700     GO TO    F-ORD-WRITE-04.                                     IF1274.2 397
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800 F-ORD-WRITE-04.                                                  IF1274.2
   000398         040900     MOVE "F-ORD-04" TO PAR-NAME.                                 IF1274.2 45
   000399         041000     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000400         041200 F-ORD-05.                                                        IF1274.2
   000401         041300     MOVE ZERO TO WS-INT.                                         IF1274.2 IMP 36
   000402         041400 F-ORD-TEST-05.                                                   IF1274.2
   000403         041500     COMPUTE WS-INT = FUNCTION ORD(B).                            IF1274.2 36 IFN 32
   000404         041600     IF WS-INT = 101 THEN                                         IF1274.2 36
   000405      1  041700                        PERFORM PASS                              IF1274.2 221
   000406         041800     ELSE                                                         IF1274.2
   000407      1  041900                        MOVE 101  TO CORRECT-N                    IF1274.2 71
   000408      1  042000                        MOVE WS-INT TO COMPUTED-N                 IF1274.2 36 57
   000409      1  042100                        PERFORM FAIL.                             IF1274.2 222
   000410         042200     GO TO F-ORD-WRITE-05.                                        IF1274.2 414
   000411         042300 F-ORD-DELETE-05.                                                 IF1274.2
   000412         042400     PERFORM  DE-LETE.                                            IF1274.2 223
   000413         042500     GO TO    F-ORD-WRITE-05.                                     IF1274.2 414
   000414         042600 F-ORD-WRITE-05.                                                  IF1274.2
   000415         042700     MOVE "F-ORD-05" TO PAR-NAME.                                 IF1274.2 45
   000416         042800     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000417         043000 F-ORD-06.                                                        IF1274.2
   000418         043100     MOVE ZERO TO WS-INT.                                         IF1274.2 IMP 36
   000419         043200 F-ORD-TEST-06.                                                   IF1274.2
   000420         043300     COMPUTE WS-INT = FUNCTION ORD(C).                            IF1274.2 36 IFN 33
   000421         043400     IF WS-INT = 52 THEN                                          IF1274.2 36
   000422      1  043500                        PERFORM PASS                              IF1274.2 221
   000423         043600     ELSE                                                         IF1274.2
   000424      1  043700                        MOVE 52  TO CORRECT-N                     IF1274.2 71
   000425      1  043800                        MOVE WS-INT TO COMPUTED-N                 IF1274.2 36 57
   000426      1  043900                        PERFORM FAIL.                             IF1274.2 222
   000427         044000     GO TO F-ORD-WRITE-06.                                        IF1274.2 431
   000428         044100 F-ORD-DELETE-06.                                                 IF1274.2
   000429         044200     PERFORM  DE-LETE.                                            IF1274.2 223
   000430         044300     GO TO    F-ORD-WRITE-06.                                     IF1274.2 431
   000431         044400 F-ORD-WRITE-06.                                                  IF1274.2
   000432         044500     MOVE "F-ORD-06" TO PAR-NAME.                                 IF1274.2 45
   000433         044600     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000434         044800 F-ORD-07.                                                        IF1274.2
   000435         044900     MOVE ZERO TO WS-INT.                                         IF1274.2 IMP 36
   000436         045000 F-ORD-TEST-07.                                                   IF1274.2
   000437         045100     COMPUTE WS-INT = FUNCTION ORD("g") + 1.                      IF1274.2 36 IFN
   000438         045200     IF WS-INT = 105 THEN                                         IF1274.2 36
   000439      1  045300                        PERFORM PASS                              IF1274.2 221
   000440         045400     ELSE                                                         IF1274.2
   000441      1  045500                        MOVE 105  TO CORRECT-N                    IF1274.2 71
   000442      1  045600                        MOVE WS-INT TO COMPUTED-N                 IF1274.2 36 57
   000443      1  045700                        PERFORM FAIL.                             IF1274.2 222
   000444         045800     GO TO F-ORD-WRITE-07.                                        IF1274.2 448
   000445         045900 F-ORD-DELETE-07.                                                 IF1274.2
   000446         046000     PERFORM  DE-LETE.                                            IF1274.2 223
   000447         046100     GO TO    F-ORD-WRITE-07.                                     IF1274.2 448
   000448         046200 F-ORD-WRITE-07.                                                  IF1274.2
   000449         046300     MOVE "F-ORD-07" TO PAR-NAME.                                 IF1274.2 45
   000450         046400     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000451         046600 F-ORD-08.                                                        IF1274.2
   000452         046700     MOVE ZERO TO WS-INT.                                         IF1274.2 IMP 36
   000453         046800 F-ORD-TEST-08.                                                   IF1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046900     COMPUTE WS-INT = FUNCTION ORD("A") +                         IF1274.2 36 IFN
   000455         047000             FUNCTION ORD(A).                                     IF1274.2 IFN 31
   000456         047100     IF WS-INT = 137 THEN                                         IF1274.2 36
   000457      1  047200                        PERFORM PASS                              IF1274.2 221
   000458         047300     ELSE                                                         IF1274.2
   000459      1  047400                        MOVE 137  TO CORRECT-N                    IF1274.2 71
   000460      1  047500                        MOVE WS-INT TO COMPUTED-N                 IF1274.2 36 57
   000461      1  047600                        PERFORM FAIL.                             IF1274.2 222
   000462         047700     GO TO F-ORD-WRITE-08.                                        IF1274.2 466
   000463         047800 F-ORD-DELETE-08.                                                 IF1274.2
   000464         047900     PERFORM  DE-LETE.                                            IF1274.2 223
   000465         048000     GO TO    F-ORD-WRITE-08.                                     IF1274.2 466
   000466         048100 F-ORD-WRITE-08.                                                  IF1274.2
   000467         048200     MOVE "F-ORD-08" TO PAR-NAME.                                 IF1274.2 45
   000468         048300     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000469         048500 F-ORD-09.                                                        IF1274.2
   000470         048600     PERFORM F-ORD-TEST-09 UNTIL FUNCTION ORD(ARG1) = 67.         IF1274.2 477 IFN 34
   000471         048700     IF ARG1 = "B" THEN                                           IF1274.2 34
   000472      1  048800                        PERFORM PASS                              IF1274.2 221
   000473         048900     ELSE                                                         IF1274.2
   000474      1  049000                        PERFORM FAIL.                             IF1274.2 222
   000475         049100     GO TO F-ORD-WRITE-09.                                        IF1274.2 483
   000476         049200*                                                                 IF1274.2
   000477         049300 F-ORD-TEST-09.                                                   IF1274.2
   000478         049400     MOVE "B" TO ARG1.                                            IF1274.2 34
   000479         049500*                                                                 IF1274.2
   000480         049600 F-ORD-DELETE-09.                                                 IF1274.2
   000481         049700     PERFORM  DE-LETE.                                            IF1274.2 223
   000482         049800     GO TO    F-ORD-WRITE-09.                                     IF1274.2 483
   000483         049900 F-ORD-WRITE-09.                                                  IF1274.2
   000484         050000     MOVE "F-ORD-09" TO PAR-NAME.                                 IF1274.2 45
   000485         050100     PERFORM  PRINT-DETAIL.                                       IF1274.2 225
   000486         050300 CCVS-EXIT SECTION.                                               IF1274.2
   000487         050400 CCVS-999999.                                                     IF1274.2
   000488         050500     GO TO CLOSE-FILES.                                           IF1274.2 216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       31   A. . . . . . . . . . . . . . .  386 455
      129   ANSI-REFERENCE . . . . . . . .  303 310 326 M337
       34   ARG1 . . . . . . . . . . . . .  470 471 M478
       32   B. . . . . . . . . . . . . . .  403
       33   C. . . . . . . . . . . . . . .  420
      108   CCVS-C-1 . . . . . . . . . . .  243 288
      113   CCVS-C-2 . . . . . . . . . . .  244 289
      163   CCVS-E-1 . . . . . . . . . . .  249
      168   CCVS-E-2 . . . . . . . . . . .  257 264 271 276
      171   CCVS-E-2-2 . . . . . . . . . .  M256
      176   CCVS-E-3 . . . . . . . . . . .  277
      185   CCVS-E-4 . . . . . . . . . . .  256
      186   CCVS-E-4-1 . . . . . . . . . .  M254
      188   CCVS-E-4-2 . . . . . . . . . .  M255
      130   CCVS-H-1 . . . . . . . . . . .  238 284
      135   CCVS-H-2A. . . . . . . . . . .  239 285
      144   CCVS-H-2B. . . . . . . . . . .  240 286
      156   CCVS-H-3 . . . . . . . . . . .  241 287
      206   CCVS-PGM-ID. . . . . . . . . .  212 212
       62   CM-18V0
       56   COMPUTED-A . . . . . . . . . .  57 59 60 61 62 321 325
       57   COMPUTED-N . . . . . . . . . .  M347 M391 M408 M425 M442 M460
       55   COMPUTED-X . . . . . . . . . .  M233 300
       59   COMPUTED-0V18
       61   COMPUTED-14V4
       63   COMPUTED-18V0
       60   COMPUTED-4V14
       79   COR-ANSI-REFERENCE . . . . . .  M310 M318
      107   CORMA-ANSI-REFERENCE . . . . .  M311
       70   CORRECT-A. . . . . . . . . . .  71 72 73 74 75 322 324
       99   CORRECT-MAX
       85   CORRECT-MIN. . . . . . . . . .  312
       71   CORRECT-N. . . . . . . . . . .  M346 M390 M407 M424 M441 M459
       69   CORRECT-X. . . . . . . . . . .  M234 302
       72   CORRECT-0V18
       74   CORRECT-14V4
       76   CORRECT-18V0
       73   CORRECT-4V14
       98   CORRECTMA-A. . . . . . . . . .  99 100 101 102 103
       97   CORRECTMA-X
      100   CORRECTMA-0V18
      102   CORRECTMA-14V4
      104   CORRECTMA-18V0
      101   CORRECTMA-4V14
       84   CORRECTMI-A. . . . . . . . . .  85 86 87 88 89
       83   CORRECTMI-X
       86   CORRECTMI-0V18
       88   CORRECTMI-14V4
       90   CORRECTMI-18V0
       87   CORRECTMI-4V14
       75   CR-18V0
       89   CR-18V0
      103   CR-18V0
      121   DELETE-COUNTER . . . . . . . .  M223 252 267 269
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page    13
0 Defined   Cross-reference of data names   References

0      48   DOTVALUE . . . . . . . . . . .  M228
      127   DUMMY-HOLD . . . . . . . . . .  M281 291
       28   DUMMY-RECORD . . . . . . . . .  M238 M239 M240 M241 M243 M244 M245 M247 M249 M257 M264 M271 M276 M277 281 M282
                                            283 M284 M285 M286 M287 M288 M289 M290 M291 295 M296 M305 M327
      174   ENDER-DESC . . . . . . . . . .  M259 M270 M275
      122   ERROR-COUNTER. . . . . . . . .  M222 251 260 263
      126   ERROR-HOLD . . . . . . . . . .  M251 M252 M252 M253 255
      172   ERROR-TOTAL. . . . . . . . . .  M261 M263 M268 M269 M273 M274
       41   FEATURE. . . . . . . . . . . .  M338
      200   HYPHEN-LINE. . . . . . . . . .  245 247 290
      166   ID-AGAIN . . . . . . . . . . .  M212
      199   INF-ANSI-REFERENCE . . . . . .  M303 M306 M326 M328
      194   INFO-TEXT. . . . . . . . . . .  M304
      123   INSPECT-COUNTER. . . . . . . .  M220 251 272 274
       43   P-OR-F . . . . . . . . . . . .  M220 M221 M222 M223 230 M233
       45   PAR-NAME . . . . . . . . . . .  M235 M354 M367 M381 M398 M415 M432 M449 M467 M484
       47   PARDOT-X . . . . . . . . . . .  M227
      124   PASS-COUNTER . . . . . . . . .  M221 253 254
       18   PRG-COLL-SEQ . . . . . . . . .  16
       26   PRINT-FILE . . . . . . . . . .  22 211 217
       27   PRINT-REC. . . . . . . . . . .  M229 M309 M313 M314 M316
       50   RE-MARK. . . . . . . . . . . .  M224 M236
      120   REC-CT . . . . . . . . . . . .  226 228 235
      119   REC-SKL-SUB
      128   RECORD-COUNT . . . . . . . . .  M279 280 M292
       35   TEMP
       51   TEST-COMPUTED. . . . . . . . .  309
       66   TEST-CORRECT . . . . . . . . .  316
       94   TEST-CORRECT-MAX . . . . . . .  314
       80   TEST-CORRECT-MIN . . . . . . .  313
      147   TEST-ID. . . . . . . . . . . .  M212
       39   TEST-RESULTS . . . . . . . . .  M213 229
      125   TOTAL-ERROR
       36   WS-INT . . . . . . . . . . . .  M340 M342 343 347 M370 M384 M386 387 391 M401 M403 404 408 M418 M420 421 425
                                            M435 M437 438 442 M452 M454 456 460
      196   XXCOMPUTED . . . . . . . . . .  M325
      198   XXCORRECT. . . . . . . . . . .  M324
      191   XXINFO . . . . . . . . . . . .  305 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page    14
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

      320   BAIL-OUT . . . . . . . . . . .  P232
      329   BAIL-OUT-EX. . . . . . . . . .  E232 G322
      323   BAIL-OUT-WRITE . . . . . . . .  G321
      297   BLANK-LINE-PRINT
      486   CCVS-EXIT
      487   CCVS-999999
      209   CCVS1
      330   CCVS1-EXIT . . . . . . . . . .  G215
      216   CLOSE-FILES. . . . . . . . . .  G488
      242   COLUMN-NAMES-ROUTINE . . . . .  E214
      223   DE-LETE. . . . . . . . . . . .  P351 P364 P378 P395 P412 P429 P446 P464 P481
      246   END-ROUTINE. . . . . . . . . .  P217
      250   END-ROUTINE-1
      258   END-ROUTINE-12
      266   END-ROUTINE-13 . . . . . . . .  E217
      248   END-RTN-EXIT
      350   F-ORD-DELETE-01
      363   F-ORD-DELETE-02
      377   F-ORD-DELETE-03
      394   F-ORD-DELETE-04
      411   F-ORD-DELETE-05
      428   F-ORD-DELETE-06
      445   F-ORD-DELETE-07
      463   F-ORD-DELETE-08
      480   F-ORD-DELETE-09
      336   F-ORD-INFO
      341   F-ORD-TEST-01
      356   F-ORD-TEST-02
      371   F-ORD-TEST-03
      385   F-ORD-TEST-04
      402   F-ORD-TEST-05
      419   F-ORD-TEST-06
      436   F-ORD-TEST-07
      453   F-ORD-TEST-08
      477   F-ORD-TEST-09. . . . . . . . .  P470
      353   F-ORD-WRITE-01 . . . . . . . .  G349 G352
      366   F-ORD-WRITE-02 . . . . . . . .  G360 G362 G365
      380   F-ORD-WRITE-03 . . . . . . . .  G376 G379
      397   F-ORD-WRITE-04 . . . . . . . .  G393 G396
      414   F-ORD-WRITE-05 . . . . . . . .  G410 G413
      431   F-ORD-WRITE-06 . . . . . . . .  G427 G430
      448   F-ORD-WRITE-07 . . . . . . . .  G444 G447
      466   F-ORD-WRITE-08 . . . . . . . .  G462 G465
      483   F-ORD-WRITE-09 . . . . . . . .  G475 G482
      339   F-ORD-01
      369   F-ORD-03
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page    15
0 Defined   Cross-reference of procedures   References

0     383   F-ORD-04
      400   F-ORD-05
      417   F-ORD-06
      434   F-ORD-07
      451   F-ORD-08
      469   F-ORD-09
      222   FAIL . . . . . . . . . . . . .  P348 P361 P375 P392 P409 P426 P443 P461 P474
      299   FAIL-ROUTINE . . . . . . . . .  P231
      319   FAIL-ROUTINE-EX. . . . . . . .  E231 G307
      308   FAIL-ROUTINE-WRITE . . . . . .  G301 G302
      237   HEAD-ROUTINE . . . . . . . . .  P214
      220   INSPT
      210   OPEN-FILES
      221   PASS . . . . . . . . . . . . .  P344 P359 P373 P388 P405 P422 P439 P457 P472
      225   PRINT-DETAIL . . . . . . . . .  P355 P368 P382 P399 P416 P433 P450 P468 P485
      335   SECT-IF127A
      218   TERMINATE-CCVS
      278   WRITE-LINE . . . . . . . . . .  P229 P230 P238 P239 P240 P241 P243 P244 P245 P247 P249 P257 P265 P271 P276 P277
                                            P305 P309 P313 P314 P316 P317 P327
      294   WRT-LN . . . . . . . . . . . .  P284 P285 P286 P287 P288 P289 P290 P293 P298
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page    16
0 Defined   Cross-reference of programs     References

        3   IF127A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF127A    Date 06/04/2022  Time 11:59:07   Page    17
0LineID  Message code  Message text

     26  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF127A:
 *    Source records = 488
 *    Data Division statements = 88
 *    Procedure Division statements = 243
 *    Generated COBOL statements = 0
 *    Program complexity factor = 251
0End of compilation 1,  program IF127A,  highest severity 0.
0Return code 0
