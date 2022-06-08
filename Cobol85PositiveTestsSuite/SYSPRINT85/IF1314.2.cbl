1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:29   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:29   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1314.2
   000002         000200 PROGRAM-ID.                                                      IF1314.2
   000003         000300     IF131A.                                                      IF1314.2
   000004         000400                                                                  IF1314.2
   000005         000600*                                                         *       IF1314.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1314.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1314.2
   000008         000900* RANDOM.                                                 *       IF1314.2
   000009         001000*                                                         *       IF1314.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1314.2
   000011         001300 CONFIGURATION SECTION.                                           IF1314.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1314.2
   000013         001500     XXXXX082.                                                    IF1314.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1314.2
   000015         001700     XXXXX083.                                                    IF1314.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1314.2
   000017         001900 FILE-CONTROL.                                                    IF1314.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1314.2 22
   000019         002100     XXXXX055.                                                    IF1314.2
   000020         002200 DATA DIVISION.                                                   IF1314.2
   000021         002300 FILE SECTION.                                                    IF1314.2
   000022         002400 FD  PRINT-FILE.                                                  IF1314.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1314.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1314.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1314.2
   000026         002900* Variables specific to the Intrinsic Function Test IF131A*       IF1314.2
   000027         003100 01  A                   PIC S9(10)          VALUE 4.             IF1314.2
   000028         003200 01  Q                   PIC S9(10)          VALUE 3.             IF1314.2
   000029         003300 01  ARR                                     VALUE "40537".       IF1314.2
   000030         003400     02  IND OCCURS 5 TIMES PIC 9.                                IF1314.2
   000031         003500 01  TEMP                PIC S9(8)V9(8).                          IF1314.2
   000032         003600 01  WS-NUM              PIC S9(5)V9(6).                          IF1314.2
   000033         003700 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1314.2
   000034         003800 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1314.2
   000035         003900*                                                                 IF1314.2
   000036         004100*                                                                 IF1314.2
   000037         004200 01  TEST-RESULTS.                                                IF1314.2
   000038         004300     02 FILLER                   PIC X      VALUE SPACE.          IF1314.2 IMP
   000039         004400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1314.2 IMP
   000040         004500     02 FILLER                   PIC X      VALUE SPACE.          IF1314.2 IMP
   000041         004600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1314.2 IMP
   000042         004700     02 FILLER                   PIC X      VALUE SPACE.          IF1314.2 IMP
   000043         004800     02  PAR-NAME.                                                IF1314.2
   000044         004900       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1314.2 IMP
   000045         005000       03  PARDOT-X              PIC X      VALUE SPACE.          IF1314.2 IMP
   000046         005100       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1314.2 IMP
   000047         005200     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1314.2 IMP
   000048         005300     02 RE-MARK                  PIC X(61).                       IF1314.2
   000049         005400 01  TEST-COMPUTED.                                               IF1314.2
   000050         005500     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1314.2 IMP
   000051         005600     02 FILLER                   PIC X(17)  VALUE                 IF1314.2
   000052         005700            "       COMPUTED=".                                   IF1314.2
   000053         005800     02 COMPUTED-X.                                               IF1314.2
   000054         005900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1314.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1314.2 54
   000056         006100                                 PIC -9(9).9(9).                  IF1314.2
   000057         006200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1314.2 54
   000058         006300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1314.2 54
   000059         006400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1314.2 54
   000060         006500     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1314.2 54
   000061         006600         04 COMPUTED-18V0                    PIC -9(18).          IF1314.2
   000062         006700         04 FILLER                           PIC X.               IF1314.2
   000063         006800     03 FILLER PIC X(50) VALUE SPACE.                             IF1314.2 IMP
   000064         006900 01  TEST-CORRECT.                                                IF1314.2
   000065         007000     02 FILLER PIC X(30) VALUE SPACE.                             IF1314.2 IMP
   000066         007100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1314.2
   000067         007200     02 CORRECT-X.                                                IF1314.2
   000068         007300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1314.2 IMP
   000069         007400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1314.2 68
   000070         007500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1314.2 68
   000071         007600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1314.2 68
   000072         007700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1314.2 68
   000073         007800     03      CR-18V0 REDEFINES CORRECT-A.                         IF1314.2 68
   000074         007900         04 CORRECT-18V0                     PIC -9(18).          IF1314.2
   000075         008000         04 FILLER                           PIC X.               IF1314.2
   000076         008100     03 FILLER PIC X(2) VALUE SPACE.                              IF1314.2 IMP
   000077         008200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1314.2 IMP
   000078         008300 01  TEST-CORRECT-MIN.                                            IF1314.2
   000079         008400     02 FILLER PIC X(30) VALUE SPACE.                             IF1314.2 IMP
   000080         008500     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1314.2
   000081         008600     02 CORRECTMI-X.                                              IF1314.2
   000082         008700     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1314.2 IMP
   000083         008800     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1314.2 82
   000084         008900     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1314.2 82
   000085         009000     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1314.2 82
   000086         009100     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1314.2 82
   000087         009200     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1314.2 82
   000088         009300         04 CORRECTMI-18V0                     PIC -9(18).        IF1314.2
   000089         009400         04 FILLER                           PIC X.               IF1314.2
   000090         009500     03 FILLER PIC X(2) VALUE SPACE.                              IF1314.2 IMP
   000091         009600     03 FILLER                           PIC X(48) VALUE SPACE.   IF1314.2 IMP
   000092         009700 01  TEST-CORRECT-MAX.                                            IF1314.2
   000093         009800     02 FILLER PIC X(30) VALUE SPACE.                             IF1314.2 IMP
   000094         009900     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1314.2
   000095         010000     02 CORRECTMA-X.                                              IF1314.2
   000096         010100     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1314.2 IMP
   000097         010200     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1314.2 96
   000098         010300     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1314.2 96
   000099         010400     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1314.2 96
   000100         010500     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1314.2 96
   000101         010600     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1314.2 96
   000102         010700         04 CORRECTMA-18V0                     PIC -9(18).        IF1314.2
   000103         010800         04 FILLER                           PIC X.               IF1314.2
   000104         010900     03 FILLER PIC X(2) VALUE SPACE.                              IF1314.2 IMP
   000105         011000     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1314.2 IMP
   000106         011100 01  CCVS-C-1.                                                    IF1314.2
   000107         011200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1314.2
   000108         011300-    "SS  PARAGRAPH-NAME                                          IF1314.2
   000109         011400-    "       REMARKS".                                            IF1314.2
   000110         011500     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1314.2 IMP
   000111         011600 01  CCVS-C-2.                                                    IF1314.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     02 FILLER                     PIC X        VALUE SPACE.      IF1314.2 IMP
   000113         011800     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1314.2
   000114         011900     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1314.2 IMP
   000115         012000     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1314.2
   000116         012100     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1314.2 IMP
   000117         012200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1314.2 IMP
   000118         012300 01  REC-CT                        PIC 99       VALUE ZERO.       IF1314.2 IMP
   000119         012400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1314.2 IMP
   000120         012500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1314.2 IMP
   000121         012600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1314.2 IMP
   000122         012700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1314.2 IMP
   000123         012800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1314.2 IMP
   000124         012900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1314.2 IMP
   000125         013000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1314.2 IMP
   000126         013100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1314.2 IMP
   000127         013200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1314.2 IMP
   000128         013300 01  CCVS-H-1.                                                    IF1314.2
   000129         013400     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1314.2 IMP
   000130         013500     02  FILLER                    PIC X(42)    VALUE             IF1314.2
   000131         013600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1314.2
   000132         013700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1314.2 IMP
   000133         013800 01  CCVS-H-2A.                                                   IF1314.2
   000134         013900   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1314.2 IMP
   000135         014000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1314.2
   000136         014100   02  FILLER                        PIC XXXX   VALUE             IF1314.2
   000137         014200     "4.2 ".                                                      IF1314.2
   000138         014300   02  FILLER                        PIC X(28)  VALUE             IF1314.2
   000139         014400            " COPY - NOT FOR DISTRIBUTION".                       IF1314.2
   000140         014500   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1314.2 IMP
   000141         014600                                                                  IF1314.2
   000142         014700 01  CCVS-H-2B.                                                   IF1314.2
   000143         014800   02  FILLER                        PIC X(15)  VALUE             IF1314.2
   000144         014900            "TEST RESULT OF ".                                    IF1314.2
   000145         015000   02  TEST-ID                       PIC X(9).                    IF1314.2
   000146         015100   02  FILLER                        PIC X(4)   VALUE             IF1314.2
   000147         015200            " IN ".                                               IF1314.2
   000148         015300   02  FILLER                        PIC X(12)  VALUE             IF1314.2
   000149         015400     " HIGH       ".                                              IF1314.2
   000150         015500   02  FILLER                        PIC X(22)  VALUE             IF1314.2
   000151         015600            " LEVEL VALIDATION FOR ".                             IF1314.2
   000152         015700   02  FILLER                        PIC X(58)  VALUE             IF1314.2
   000153         015800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1314.2
   000154         015900 01  CCVS-H-3.                                                    IF1314.2
   000155         016000     02  FILLER                      PIC X(34)  VALUE             IF1314.2
   000156         016100            " FOR OFFICIAL USE ONLY    ".                         IF1314.2
   000157         016200     02  FILLER                      PIC X(58)  VALUE             IF1314.2
   000158         016300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1314.2
   000159         016400     02  FILLER                      PIC X(28)  VALUE             IF1314.2
   000160         016500            "  COPYRIGHT   1985 ".                                IF1314.2
   000161         016600 01  CCVS-E-1.                                                    IF1314.2
   000162         016700     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1314.2 IMP
   000163         016800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1314.2
   000164         016900     02 ID-AGAIN                     PIC X(9).                    IF1314.2
   000165         017000     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1314.2 IMP
   000166         017100 01  CCVS-E-2.                                                    IF1314.2
   000167         017200     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1314.2 IMP
   000168         017300     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1314.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 CCVS-E-2-2.                                               IF1314.2
   000170         017500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1314.2 IMP
   000171         017600         03 FILLER                   PIC X      VALUE SPACE.      IF1314.2 IMP
   000172         017700         03 ENDER-DESC               PIC X(44)  VALUE             IF1314.2
   000173         017800            "ERRORS ENCOUNTERED".                                 IF1314.2
   000174         017900 01  CCVS-E-3.                                                    IF1314.2
   000175         018000     02  FILLER                      PIC X(22)  VALUE             IF1314.2
   000176         018100            " FOR OFFICIAL USE ONLY".                             IF1314.2
   000177         018200     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1314.2 IMP
   000178         018300     02  FILLER                      PIC X(58)  VALUE             IF1314.2
   000179         018400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1314.2
   000180         018500     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1314.2 IMP
   000181         018600     02 FILLER                       PIC X(15)  VALUE             IF1314.2
   000182         018700             " COPYRIGHT 1985".                                   IF1314.2
   000183         018800 01  CCVS-E-4.                                                    IF1314.2
   000184         018900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1314.2 IMP
   000185         019000     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1314.2
   000186         019100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1314.2 IMP
   000187         019200     02 FILLER                       PIC X(40)  VALUE             IF1314.2
   000188         019300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1314.2
   000189         019400 01  XXINFO.                                                      IF1314.2
   000190         019500     02 FILLER                       PIC X(19)  VALUE             IF1314.2
   000191         019600            "*** INFORMATION ***".                                IF1314.2
   000192         019700     02 INFO-TEXT.                                                IF1314.2
   000193         019800       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1314.2 IMP
   000194         019900       04 XXCOMPUTED                 PIC X(20).                   IF1314.2
   000195         020000       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1314.2 IMP
   000196         020100       04 XXCORRECT                  PIC X(20).                   IF1314.2
   000197         020200     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1314.2
   000198         020300 01  HYPHEN-LINE.                                                 IF1314.2
   000199         020400     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1314.2 IMP
   000200         020500     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1314.2
   000201         020600-    "*****************************************".                 IF1314.2
   000202         020700     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1314.2
   000203         020800-    "******************************".                            IF1314.2
   000204         020900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1314.2
   000205         021000     "IF131A".                                                    IF1314.2
   000206         021100 PROCEDURE DIVISION.                                              IF1314.2
   000207         021200 CCVS1 SECTION.                                                   IF1314.2
   000208         021300 OPEN-FILES.                                                      IF1314.2
   000209         021400     OPEN     OUTPUT PRINT-FILE.                                  IF1314.2 22
   000210         021500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1314.2 204 145 204 164
   000211         021600     MOVE    SPACE TO TEST-RESULTS.                               IF1314.2 IMP 37
   000212         021700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1314.2 235 240
   000213         021800     GO TO CCVS1-EXIT.                                            IF1314.2 328
   000214         021900 CLOSE-FILES.                                                     IF1314.2
   000215         022000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1314.2 244 264 22
   000216         022100 TERMINATE-CCVS.                                                  IF1314.2
   000217         022200     STOP     RUN.                                                IF1314.2
   000218         022300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1314.2 41 121
   000219         022400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1314.2 41 122
   000220         022500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1314.2 41 120
   000221         022600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1314.2 41 119
   000222         022700     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1314.2 48
   000223         022800 PRINT-DETAIL.                                                    IF1314.2
   000224         022900     IF REC-CT NOT EQUAL TO ZERO                                  IF1314.2 118 IMP
   000225      1  023000             MOVE "." TO PARDOT-X                                 IF1314.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  023100             MOVE REC-CT TO DOTVALUE.                             IF1314.2 118 46
   000227         023200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1314.2 37 23 276
   000228         023300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1314.2 41 276
   000229      1  023400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1314.2 297 317
   000230      1  023500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1314.2 318 327
   000231         023600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1314.2 IMP 41 IMP 53
   000232         023700     MOVE SPACE TO CORRECT-X.                                     IF1314.2 IMP 67
   000233         023800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1314.2 118 IMP IMP 43
   000234         023900     MOVE     SPACE TO RE-MARK.                                   IF1314.2 IMP 48
   000235         024000 HEAD-ROUTINE.                                                    IF1314.2
   000236         024100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1314.2 128 24 276
   000237         024200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1314.2 133 24 276
   000238         024300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1314.2 142 24 276
   000239         024400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1314.2 154 24 276
   000240         024500 COLUMN-NAMES-ROUTINE.                                            IF1314.2
   000241         024600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1314.2 106 24 276
   000242         024700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1314.2 111 24 276
   000243         024800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1314.2 198 24 276
   000244         024900 END-ROUTINE.                                                     IF1314.2
   000245         025000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1314.2 198 24 276
   000246         025100 END-RTN-EXIT.                                                    IF1314.2
   000247         025200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1314.2 161 24 276
   000248         025300 END-ROUTINE-1.                                                   IF1314.2
   000249         025400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1314.2 120 124 121
   000250         025500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1314.2 124 119 124
   000251         025600      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1314.2 122 124
   000252         025700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1314.2 122 184
   000253         025800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1314.2 124 186
   000254         025900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1314.2 183 169
   000255         026000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1314.2 166 24 276
   000256         026100  END-ROUTINE-12.                                                 IF1314.2
   000257         026200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1314.2 172
   000258         026300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1314.2 120 IMP
   000259      1  026400         MOVE "NO " TO ERROR-TOTAL                                IF1314.2 170
   000260         026500         ELSE                                                     IF1314.2
   000261      1  026600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1314.2 120 170
   000262         026700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1314.2 166 24
   000263         026800     PERFORM WRITE-LINE.                                          IF1314.2 276
   000264         026900 END-ROUTINE-13.                                                  IF1314.2
   000265         027000     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1314.2 119 IMP
   000266      1  027100         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1314.2 170
   000267      1  027200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1314.2 119 170
   000268         027300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1314.2 172
   000269         027400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1314.2 166 24 276
   000270         027500      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1314.2 121 IMP
   000271      1  027600          MOVE "NO " TO ERROR-TOTAL                               IF1314.2 170
   000272      1  027700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1314.2 121 170
   000273         027800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1314.2 172
   000274         027900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1314.2 166 24 276
   000275         028000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1314.2 174 24 276
   000276         028100 WRITE-LINE.                                                      IF1314.2
   000277         028200     ADD 1 TO RECORD-COUNT.                                       IF1314.2 126
   000278         028300     IF RECORD-COUNT GREATER 42                                   IF1314.2 126
   000279      1  028400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1314.2 24 125
   000280      1  028500         MOVE SPACE TO DUMMY-RECORD                               IF1314.2 IMP 24
   000281      1  028600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1314.2 24
   000282      1  028700         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1314.2 128 24 292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1314.2 133 24 292
   000284      1  028900         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1314.2 142 24 292
   000285      1  029000         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1314.2 154 24 292
   000286      1  029100         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1314.2 106 24 292
   000287      1  029200         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1314.2 111 24 292
   000288      1  029300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1314.2 198 24 292
   000289      1  029400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1314.2 125 24
   000290      1  029500         MOVE ZERO TO RECORD-COUNT.                               IF1314.2 IMP 126
   000291         029600     PERFORM WRT-LN.                                              IF1314.2 292
   000292         029700 WRT-LN.                                                          IF1314.2
   000293         029800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1314.2 24
   000294         029900     MOVE SPACE TO DUMMY-RECORD.                                  IF1314.2 IMP 24
   000295         030000 BLANK-LINE-PRINT.                                                IF1314.2
   000296         030100     PERFORM WRT-LN.                                              IF1314.2 292
   000297         030200 FAIL-ROUTINE.                                                    IF1314.2
   000298         030300     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1314.2 53 IMP
   000299      1  030400            GO TO FAIL-ROUTINE-WRITE.                             IF1314.2 306
   000300         030500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1314.2 67 IMP 306
   000301         030600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1314.2 127 197
   000302         030700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1314.2 192
   000303         030800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1314.2 189 24 276
   000304         030900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1314.2 IMP 197
   000305         031000     GO TO  FAIL-ROUTINE-EX.                                      IF1314.2 317
   000306         031100 FAIL-ROUTINE-WRITE.                                              IF1314.2
   000307         031200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1314.2 49 23 276
   000308         031300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1314.2 127 77
   000309         031400                              CORMA-ANSI-REFERENCE.               IF1314.2 105
   000310         031500     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1314.2 83 IMP
   000311      1  031600           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1314.2 78 23 276
   000312      1  031700           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1314.2 92 23 276
   000313         031800     ELSE                                                         IF1314.2
   000314      1  031900           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1314.2 64 23 276
   000315         032000     PERFORM WRITE-LINE.                                          IF1314.2 276
   000316         032100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1314.2 IMP 77
   000317         032200 FAIL-ROUTINE-EX. EXIT.                                           IF1314.2
   000318         032300 BAIL-OUT.                                                        IF1314.2
   000319         032400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1314.2 54 IMP 321
   000320         032500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1314.2 68 IMP 327
   000321         032600 BAIL-OUT-WRITE.                                                  IF1314.2
   000322         032700     MOVE CORRECT-A TO XXCORRECT.                                 IF1314.2 68 196
   000323         032800     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1314.2 54 194
   000324         032900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1314.2 127 197
   000325         033000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1314.2 189 24 276
   000326         033100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1314.2 IMP 197
   000327         033200 BAIL-OUT-EX. EXIT.                                               IF1314.2
   000328         033300 CCVS1-EXIT.                                                      IF1314.2
   000329         033400     EXIT.                                                        IF1314.2
   000330         033600*                                                      *          IF1314.2
   000331         033700*    Intrinsic Function Tests         IF131A - RANDOM  *          IF1314.2
   000332         033800*                                                      *          IF1314.2
   000333         034000 SECT-IF131A SECTION.                                             IF1314.2
   000334         034100 F-RANDOM-INFO.                                                   IF1314.2
   000335         034200     MOVE     "See ref. A-64 2.35" TO ANSI-REFERENCE.             IF1314.2 127
   000336         034300     MOVE     "RANDOM Function" TO FEATURE.                       IF1314.2 39
   000337         034500 F-RANDOM-01.                                                     IF1314.2
   000338         034600     MOVE ZERO TO WS-NUM.                                         IF1314.2 IMP 32
   000339         034700     MOVE 0 TO MIN-RANGE.                                         IF1314.2 33
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800     MOVE 1 TO MAX-RANGE.                                         IF1314.2 34
   000341         034900 F-RANDOM-TEST-01.                                                IF1314.2
   000342         035000     COMPUTE WS-NUM = FUNCTION RANDOM.                            IF1314.2 32 IFN
   000343         035100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1314.2 32 33
   000344         035200        (WS-NUM < MAX-RANGE) THEN                                 IF1314.2 32 34
   000345      1  035300                    PERFORM PASS                                  IF1314.2 219
   000346         035400     ELSE                                                         IF1314.2
   000347      1  035500                    MOVE WS-NUM TO COMPUTED-N                     IF1314.2 32 55
   000348      1  035600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1314.2 33 83
   000349      1  035700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1314.2 34 97
   000350      1  035800                    PERFORM FAIL.                                 IF1314.2 220
   000351         035900     GO TO F-RANDOM-WRITE-01.                                     IF1314.2 355
   000352         036000 F-RANDOM-DELETE-01.                                              IF1314.2
   000353         036100     PERFORM  DE-LETE.                                            IF1314.2 221
   000354         036200     GO TO    F-RANDOM-WRITE-01.                                  IF1314.2 355
   000355         036300 F-RANDOM-WRITE-01.                                               IF1314.2
   000356         036400     MOVE "F-RANDOM-01" TO PAR-NAME.                              IF1314.2 43
   000357         036500     PERFORM  PRINT-DETAIL.                                       IF1314.2 223
   000358         036700 F-RANDOM-02.                                                     IF1314.2
   000359         036800     EVALUATE FUNCTION RANDOM(3)                                  IF1314.2 IFN
   000360         036900     WHEN 0 THRU 1                                                IF1314.2
   000361      1  037000                    PERFORM PASS                                  IF1314.2 219
   000362         037100     WHEN OTHER                                                   IF1314.2
   000363      1  037200                    PERFORM FAIL.                                 IF1314.2 220
   000364         037300     GO TO F-RANDOM-WRITE-02.                                     IF1314.2 368
   000365         037400 F-RANDOM-DELETE-02.                                              IF1314.2
   000366         037500     PERFORM  DE-LETE.                                            IF1314.2 221
   000367         037600     GO TO    F-RANDOM-WRITE-02.                                  IF1314.2 368
   000368         037700 F-RANDOM-WRITE-02.                                               IF1314.2
   000369         037800     MOVE "F-RANDOM-02" TO PAR-NAME.                              IF1314.2 43
   000370         037900     PERFORM  PRINT-DETAIL.                                       IF1314.2 223
   000371         038100 F-RANDOM-03.                                                     IF1314.2
   000372         038200     MOVE 0 TO MIN-RANGE.                                         IF1314.2 33
   000373         038300     MOVE 1 TO MAX-RANGE.                                         IF1314.2 34
   000374         038400 F-RANDOM-TEST-03.                                                IF1314.2
   000375         038500     IF (FUNCTION RANDOM(Q) >= MIN-RANGE) AND                     IF1314.2 IFN 28 33
   000376         038600        (FUNCTION RANDOM(Q) <  MAX-RANGE) THEN                    IF1314.2 IFN 28 34
   000377      1  038700                    PERFORM PASS                                  IF1314.2 219
   000378         038800     ELSE                                                         IF1314.2
   000379      1  038900                    PERFORM FAIL.                                 IF1314.2 220
   000380         039000     GO TO F-RANDOM-WRITE-03.                                     IF1314.2 384
   000381         039100 F-RANDOM-DELETE-03.                                              IF1314.2
   000382         039200     PERFORM  DE-LETE.                                            IF1314.2 221
   000383         039300     GO TO    F-RANDOM-WRITE-03.                                  IF1314.2 384
   000384         039400 F-RANDOM-WRITE-03.                                               IF1314.2
   000385         039500     MOVE "F-RANDOM-03" TO PAR-NAME.                              IF1314.2 43
   000386         039600     PERFORM  PRINT-DETAIL.                                       IF1314.2 223
   000387         039800 F-RANDOM-04.                                                     IF1314.2
   000388         039900     MOVE ZERO TO WS-NUM.                                         IF1314.2 IMP 32
   000389         040000     MOVE 0 TO MIN-RANGE.                                         IF1314.2 33
   000390         040100     MOVE 1 TO MAX-RANGE.                                         IF1314.2 34
   000391         040200 F-RANDOM-TEST-04.                                                IF1314.2
   000392         040300     COMPUTE WS-NUM = FUNCTION RANDOM(IND(4)).                    IF1314.2 32 IFN 30
   000393         040400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1314.2 32 33
   000394         040500        (WS-NUM < MAX-RANGE) THEN                                 IF1314.2 32 34
   000395      1  040600                    PERFORM PASS                                  IF1314.2 219
   000396         040700     ELSE                                                         IF1314.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040800                    MOVE WS-NUM TO COMPUTED-N                     IF1314.2 32 55
   000398      1  040900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1314.2 33 83
   000399      1  041000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1314.2 34 97
   000400      1  041100                    PERFORM FAIL.                                 IF1314.2 220
   000401         041200     GO TO F-RANDOM-WRITE-04.                                     IF1314.2 405
   000402         041300 F-RANDOM-DELETE-04.                                              IF1314.2
   000403         041400     PERFORM  DE-LETE.                                            IF1314.2 221
   000404         041500     GO TO    F-RANDOM-WRITE-04.                                  IF1314.2 405
   000405         041600 F-RANDOM-WRITE-04.                                               IF1314.2
   000406         041700     MOVE "F-RANDOM-04" TO PAR-NAME.                              IF1314.2 43
   000407         041800     PERFORM  PRINT-DETAIL.                                       IF1314.2 223
   000408         042000 F-RANDOM-05.                                                     IF1314.2
   000409         042100     MOVE ZERO TO WS-NUM.                                         IF1314.2 IMP 32
   000410         042200     MOVE 0 TO MIN-RANGE.                                         IF1314.2 33
   000411         042300     MOVE 1 TO MAX-RANGE.                                         IF1314.2 34
   000412         042400 F-RANDOM-TEST-05.                                                IF1314.2
   000413         042500     COMPUTE WS-NUM = FUNCTION RANDOM(IND(A)).                    IF1314.2 32 IFN 30 27
   000414         042600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1314.2 32 33
   000415         042700        (WS-NUM < MAX-RANGE) THEN                                 IF1314.2 32 34
   000416      1  042800                    PERFORM PASS                                  IF1314.2 219
   000417         042900     ELSE                                                         IF1314.2
   000418      1  043000                    MOVE WS-NUM TO COMPUTED-N                     IF1314.2 32 55
   000419      1  043100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1314.2 33 83
   000420      1  043200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1314.2 34 97
   000421      1  043300                    PERFORM FAIL.                                 IF1314.2 220
   000422         043400     GO TO F-RANDOM-WRITE-05.                                     IF1314.2 426
   000423         043500 F-RANDOM-DELETE-05.                                              IF1314.2
   000424         043600     PERFORM  DE-LETE.                                            IF1314.2 221
   000425         043700     GO TO    F-RANDOM-WRITE-05.                                  IF1314.2 426
   000426         043800 F-RANDOM-WRITE-05.                                               IF1314.2
   000427         043900     MOVE "F-RANDOM-05" TO PAR-NAME.                              IF1314.2 43
   000428         044000     PERFORM  PRINT-DETAIL.                                       IF1314.2 223
   000429         044200 F-RANDOM-06.                                                     IF1314.2
   000430         044300     MOVE ZERO TO WS-NUM.                                         IF1314.2 IMP 32
   000431         044400     MOVE 1 TO MIN-RANGE.                                         IF1314.2 33
   000432         044500     MOVE 2 TO MAX-RANGE.                                         IF1314.2 34
   000433         044600 F-RANDOM-TEST-06.                                                IF1314.2
   000434         044700     COMPUTE WS-NUM = FUNCTION RANDOM(2) + 1.                     IF1314.2 32 IFN
   000435         044800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1314.2 32 33
   000436         044900        (WS-NUM < MAX-RANGE) THEN                                 IF1314.2 32 34
   000437      1  045000                    PERFORM PASS                                  IF1314.2 219
   000438         045100     ELSE                                                         IF1314.2
   000439      1  045200                    MOVE WS-NUM TO COMPUTED-N                     IF1314.2 32 55
   000440      1  045300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1314.2 33 83
   000441      1  045400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1314.2 34 97
   000442      1  045500                    PERFORM FAIL.                                 IF1314.2 220
   000443         045600     GO TO F-RANDOM-WRITE-06.                                     IF1314.2 447
   000444         045700 F-RANDOM-DELETE-06.                                              IF1314.2
   000445         045800     PERFORM  DE-LETE.                                            IF1314.2 221
   000446         045900     GO TO    F-RANDOM-WRITE-06.                                  IF1314.2 447
   000447         046000 F-RANDOM-WRITE-06.                                               IF1314.2
   000448         046100     MOVE "F-RANDOM-06" TO PAR-NAME.                              IF1314.2 43
   000449         046200     PERFORM  PRINT-DETAIL.                                       IF1314.2 223
   000450         046400 F-RANDOM-07.                                                     IF1314.2
   000451         046500     MOVE ZERO TO WS-NUM.                                         IF1314.2 IMP 32
   000452         046600     MOVE 0 TO MIN-RANGE.                                         IF1314.2 33
   000453         046700     MOVE 2 TO MAX-RANGE.                                         IF1314.2 34
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046800 F-RANDOM-TEST-07.                                                IF1314.2
   000455         046900     COMPUTE WS-NUM = FUNCTION RANDOM(1) +                        IF1314.2 32 IFN
   000456         047000                      FUNCTION RANDOM(2).                         IF1314.2 IFN
   000457         047100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1314.2 32 33
   000458         047200        (WS-NUM < MAX-RANGE) THEN                                 IF1314.2 32 34
   000459      1  047300                    PERFORM PASS                                  IF1314.2 219
   000460         047400     ELSE                                                         IF1314.2
   000461      1  047500                    MOVE WS-NUM TO COMPUTED-N                     IF1314.2 32 55
   000462      1  047600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1314.2 33 83
   000463      1  047700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1314.2 34 97
   000464      1  047800                    PERFORM FAIL.                                 IF1314.2 220
   000465         047900     GO TO F-RANDOM-WRITE-07.                                     IF1314.2 469
   000466         048000 F-RANDOM-DELETE-07.                                              IF1314.2
   000467         048100     PERFORM  DE-LETE.                                            IF1314.2 221
   000468         048200     GO TO    F-RANDOM-WRITE-07.                                  IF1314.2 469
   000469         048300 F-RANDOM-WRITE-07.                                               IF1314.2
   000470         048400     MOVE "F-RANDOM-07" TO PAR-NAME.                              IF1314.2 43
   000471         048500     PERFORM  PRINT-DETAIL.                                       IF1314.2 223
   000472         048700 F-RANDOM-08.                                                     IF1314.2
   000473         048800     MOVE ZERO TO WS-NUM.                                         IF1314.2 IMP 32
   000474         048900     MOVE 0 TO MIN-RANGE.                                         IF1314.2 33
   000475         049000     MOVE 1 TO MAX-RANGE.                                         IF1314.2 34
   000476         049100 F-RANDOM-TEST-08.                                                IF1314.2
   000477         049200     COMPUTE WS-NUM = FUNCTION RANDOM(                            IF1314.2 32 IFN

 ==000477==> IGYPG3113-W Truncation of high-order digit positions may occur due to precision of
                         intermediate results exceeding 30 digits.

   000478         049300             FUNCTION INTEGER(100 * FUNCTION RANDOM(1))).         IF1314.2 IFN IFN
   000479         049400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1314.2 32 33
   000480         049500        (WS-NUM < MAX-RANGE) THEN                                 IF1314.2 32 34
   000481      1  049600                    PERFORM PASS                                  IF1314.2 219
   000482         049700     ELSE                                                         IF1314.2
   000483      1  049800                    MOVE WS-NUM TO COMPUTED-N                     IF1314.2 32 55
   000484      1  049900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1314.2 33 83
   000485      1  050000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1314.2 34 97
   000486      1  050100                    PERFORM FAIL.                                 IF1314.2 220
   000487         050200     GO TO F-RANDOM-WRITE-08.                                     IF1314.2 491
   000488         050300 F-RANDOM-DELETE-08.                                              IF1314.2
   000489         050400     PERFORM  DE-LETE.                                            IF1314.2 221
   000490         050500     GO TO    F-RANDOM-WRITE-08.                                  IF1314.2 491
   000491         050600 F-RANDOM-WRITE-08.                                               IF1314.2
   000492         050700     MOVE "F-RANDOM-08" TO PAR-NAME.                              IF1314.2 43
   000493         050800     PERFORM  PRINT-DETAIL.                                       IF1314.2 223
   000494         051000 CCVS-EXIT SECTION.                                               IF1314.2
   000495         051100 CCVS-999999.                                                     IF1314.2
   000496         051200     GO TO CLOSE-FILES.                                           IF1314.2 214
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  413
      127   ANSI-REFERENCE . . . . . . . .  301 308 324 M335
       29   ARR
      106   CCVS-C-1 . . . . . . . . . . .  241 286
      111   CCVS-C-2 . . . . . . . . . . .  242 287
      161   CCVS-E-1 . . . . . . . . . . .  247
      166   CCVS-E-2 . . . . . . . . . . .  255 262 269 274
      169   CCVS-E-2-2 . . . . . . . . . .  M254
      174   CCVS-E-3 . . . . . . . . . . .  275
      183   CCVS-E-4 . . . . . . . . . . .  254
      184   CCVS-E-4-1 . . . . . . . . . .  M252
      186   CCVS-E-4-2 . . . . . . . . . .  M253
      128   CCVS-H-1 . . . . . . . . . . .  236 282
      133   CCVS-H-2A. . . . . . . . . . .  237 283
      142   CCVS-H-2B. . . . . . . . . . .  238 284
      154   CCVS-H-3 . . . . . . . . . . .  239 285
      204   CCVS-PGM-ID. . . . . . . . . .  210 210
       60   CM-18V0
       54   COMPUTED-A . . . . . . . . . .  55 57 58 59 60 319 323
       55   COMPUTED-N . . . . . . . . . .  M347 M397 M418 M439 M461 M483
       53   COMPUTED-X . . . . . . . . . .  M231 298
       57   COMPUTED-0V18
       59   COMPUTED-14V4
       61   COMPUTED-18V0
       58   COMPUTED-4V14
       77   COR-ANSI-REFERENCE . . . . . .  M308 M316
      105   CORMA-ANSI-REFERENCE . . . . .  M309
       68   CORRECT-A. . . . . . . . . . .  69 70 71 72 73 320 322
       97   CORRECT-MAX. . . . . . . . . .  M349 M399 M420 M441 M463 M485
       83   CORRECT-MIN. . . . . . . . . .  310 M348 M398 M419 M440 M462 M484
       69   CORRECT-N
       67   CORRECT-X. . . . . . . . . . .  M232 300
       70   CORRECT-0V18
       72   CORRECT-14V4
       74   CORRECT-18V0
       71   CORRECT-4V14
       96   CORRECTMA-A. . . . . . . . . .  97 98 99 100 101
       95   CORRECTMA-X
       98   CORRECTMA-0V18
      100   CORRECTMA-14V4
      102   CORRECTMA-18V0
       99   CORRECTMA-4V14
       82   CORRECTMI-A. . . . . . . . . .  83 84 85 86 87
       81   CORRECTMI-X
       84   CORRECTMI-0V18
       86   CORRECTMI-14V4
       88   CORRECTMI-18V0
       85   CORRECTMI-4V14
       73   CR-18V0
       87   CR-18V0
      101   CR-18V0
      119   DELETE-COUNTER . . . . . . . .  M221 250 265 267
       46   DOTVALUE . . . . . . . . . . .  M226
      125   DUMMY-HOLD . . . . . . . . . .  M279 289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page    13
0 Defined   Cross-reference of data names   References

0      24   DUMMY-RECORD . . . . . . . . .  M236 M237 M238 M239 M241 M242 M243 M245 M247 M255 M262 M269 M274 M275 279 M280
                                            281 M282 M283 M284 M285 M286 M287 M288 M289 293 M294 M303 M325
      172   ENDER-DESC . . . . . . . . . .  M257 M268 M273
      120   ERROR-COUNTER. . . . . . . . .  M220 249 258 261
      124   ERROR-HOLD . . . . . . . . . .  M249 M250 M250 M251 253
      170   ERROR-TOTAL. . . . . . . . . .  M259 M261 M266 M267 M271 M272
       39   FEATURE. . . . . . . . . . . .  M336
      198   HYPHEN-LINE. . . . . . . . . .  243 245 288
      164   ID-AGAIN . . . . . . . . . . .  M210
       30   IND. . . . . . . . . . . . . .  392 413
      197   INF-ANSI-REFERENCE . . . . . .  M301 M304 M324 M326
      192   INFO-TEXT. . . . . . . . . . .  M302
      121   INSPECT-COUNTER. . . . . . . .  M218 249 270 272
       34   MAX-RANGE. . . . . . . . . . .  M340 344 349 M373 376 M390 394 399 M411 415 420 M432 436 441 M453 458 463 M475
                                            480 485
       33   MIN-RANGE. . . . . . . . . . .  M339 343 348 M372 375 M389 393 398 M410 414 419 M431 435 440 M452 457 462 M474
                                            479 484
       41   P-OR-F . . . . . . . . . . . .  M218 M219 M220 M221 228 M231
       43   PAR-NAME . . . . . . . . . . .  M233 M356 M369 M385 M406 M427 M448 M470 M492
       45   PARDOT-X . . . . . . . . . . .  M225
      122   PASS-COUNTER . . . . . . . . .  M219 251 252
       22   PRINT-FILE . . . . . . . . . .  18 209 215
       23   PRINT-REC. . . . . . . . . . .  M227 M307 M311 M312 M314
       28   Q. . . . . . . . . . . . . . .  375 376
       48   RE-MARK. . . . . . . . . . . .  M222 M234
      118   REC-CT . . . . . . . . . . . .  224 226 233
      117   REC-SKL-SUB
      126   RECORD-COUNT . . . . . . . . .  M277 278 M290
       31   TEMP
       49   TEST-COMPUTED. . . . . . . . .  307
       64   TEST-CORRECT . . . . . . . . .  314
       92   TEST-CORRECT-MAX . . . . . . .  312
       78   TEST-CORRECT-MIN . . . . . . .  311
      145   TEST-ID. . . . . . . . . . . .  M210
       37   TEST-RESULTS . . . . . . . . .  M211 227
      123   TOTAL-ERROR
       32   WS-NUM . . . . . . . . . . . .  M338 M342 343 344 347 M388 M392 393 394 397 M409 M413 414 415 418 M430 M434 435
                                            436 439 M451 M455 457 458 461 M473 M477 479 480 483
      194   XXCOMPUTED . . . . . . . . . .  M323
      196   XXCORRECT. . . . . . . . . . .  M322
      189   XXINFO . . . . . . . . . . . .  303 325
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page    14
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

      318   BAIL-OUT . . . . . . . . . . .  P230
      327   BAIL-OUT-EX. . . . . . . . . .  E230 G320
      321   BAIL-OUT-WRITE . . . . . . . .  G319
      295   BLANK-LINE-PRINT
      494   CCVS-EXIT
      495   CCVS-999999
      207   CCVS1
      328   CCVS1-EXIT . . . . . . . . . .  G213
      214   CLOSE-FILES. . . . . . . . . .  G496
      240   COLUMN-NAMES-ROUTINE . . . . .  E212
      221   DE-LETE. . . . . . . . . . . .  P353 P366 P382 P403 P424 P445 P467 P489
      244   END-ROUTINE. . . . . . . . . .  P215
      248   END-ROUTINE-1
      256   END-ROUTINE-12
      264   END-ROUTINE-13 . . . . . . . .  E215
      246   END-RTN-EXIT
      352   F-RANDOM-DELETE-01
      365   F-RANDOM-DELETE-02
      381   F-RANDOM-DELETE-03
      402   F-RANDOM-DELETE-04
      423   F-RANDOM-DELETE-05
      444   F-RANDOM-DELETE-06
      466   F-RANDOM-DELETE-07
      488   F-RANDOM-DELETE-08
      334   F-RANDOM-INFO
      341   F-RANDOM-TEST-01
      374   F-RANDOM-TEST-03
      391   F-RANDOM-TEST-04
      412   F-RANDOM-TEST-05
      433   F-RANDOM-TEST-06
      454   F-RANDOM-TEST-07
      476   F-RANDOM-TEST-08
      355   F-RANDOM-WRITE-01. . . . . . .  G351 G354
      368   F-RANDOM-WRITE-02. . . . . . .  G364 G367
      384   F-RANDOM-WRITE-03. . . . . . .  G380 G383
      405   F-RANDOM-WRITE-04. . . . . . .  G401 G404
      426   F-RANDOM-WRITE-05. . . . . . .  G422 G425
      447   F-RANDOM-WRITE-06. . . . . . .  G443 G446
      469   F-RANDOM-WRITE-07. . . . . . .  G465 G468
      491   F-RANDOM-WRITE-08. . . . . . .  G487 G490
      337   F-RANDOM-01
      358   F-RANDOM-02
      371   F-RANDOM-03
      387   F-RANDOM-04
      408   F-RANDOM-05
      429   F-RANDOM-06
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page    15
0 Defined   Cross-reference of procedures   References

0     450   F-RANDOM-07
      472   F-RANDOM-08
      220   FAIL . . . . . . . . . . . . .  P350 P363 P379 P400 P421 P442 P464 P486
      297   FAIL-ROUTINE . . . . . . . . .  P229
      317   FAIL-ROUTINE-EX. . . . . . . .  E229 G305
      306   FAIL-ROUTINE-WRITE . . . . . .  G299 G300
      235   HEAD-ROUTINE . . . . . . . . .  P212
      218   INSPT
      208   OPEN-FILES
      219   PASS . . . . . . . . . . . . .  P345 P361 P377 P395 P416 P437 P459 P481
      223   PRINT-DETAIL . . . . . . . . .  P357 P370 P386 P407 P428 P449 P471 P493
      333   SECT-IF131A
      216   TERMINATE-CCVS
      276   WRITE-LINE . . . . . . . . . .  P227 P228 P236 P237 P238 P239 P241 P242 P243 P245 P247 P255 P263 P269 P274 P275
                                            P303 P307 P311 P312 P314 P315 P325
      292   WRT-LN . . . . . . . . . . . .  P282 P283 P284 P285 P286 P287 P288 P291 P296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page    16
0 Defined   Cross-reference of programs     References

        3   IF131A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF131A    Date 06/04/2022  Time 11:58:29   Page    17
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    477  IGYPG3113-W   Truncation of high-order digit positions may occur due to precision of intermediate results exceeding 30
                       digits.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program IF131A:
 *    Source records = 496
 *    Data Division statements = 90
 *    Procedure Division statements = 251
 *    Generated COBOL statements = 0
 *    Program complexity factor = 259
0End of compilation 1,  program IF131A,  highest severity 4.
0Return code 4
