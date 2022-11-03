1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:31   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:31   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1244.2
   000002         000200 PROGRAM-ID.                                                      IF1244.2
   000003         000300     IF124A.                                                      IF1244.2
   000004         000400                                                                  IF1244.2
   000005         000600*                                                         *       IF1244.2
   000006         000700*   This program is intended to form part of the CCVS85   *       IF1244.2
   000007         000800*   COBOL Test Suite. It contains tests for the           *       IF1244.2
   000008         000900*   Intrinsic Function MOD.                               *       IF1244.2
   000009         001000*                                                         *       IF1244.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1244.2
   000011         001300 CONFIGURATION SECTION.                                           IF1244.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1244.2
   000013         001500     XXXXX082.                                                    IF1244.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1244.2
   000015         001700     XXXXX083.                                                    IF1244.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1244.2
   000017         001900 FILE-CONTROL.                                                    IF1244.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1244.2 22
   000019         002100     XXXXX055.                                                    IF1244.2
   000020         002200 DATA DIVISION.                                                   IF1244.2
   000021         002300 FILE SECTION.                                                    IF1244.2
   000022         002400 FD  PRINT-FILE.                                                  IF1244.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1244.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1244.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1244.2
   000026         002900* Variables specific to the Intrinsic Function Test IF124A*       IF1244.2
   000027         003100 01  A                   PIC S9(10)          VALUE 5.             IF1244.2
   000028         003200 01  B                   PIC S9(10)          VALUE 7.             IF1244.2
   000029         003300 01  C                   PIC S9(10)          VALUE -4.            IF1244.2
   000030         003400 01  ARG2                PIC S9(10)          VALUE 1.             IF1244.2
   000031         003500 01  TEMP                PIC S9(10).                              IF1244.2
   000032         003600 01  WS-NUM              PIC S9(5)V9(6).                          IF1244.2
   000033         003700 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1244.2
   000034         003800 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1244.2
   000035         003900*                                                                 IF1244.2
   000036         004100*                                                                 IF1244.2
   000037         004200 01  TEST-RESULTS.                                                IF1244.2
   000038         004300     02 FILLER                   PIC X      VALUE SPACE.          IF1244.2 IMP
   000039         004400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1244.2 IMP
   000040         004500     02 FILLER                   PIC X      VALUE SPACE.          IF1244.2 IMP
   000041         004600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1244.2 IMP
   000042         004700     02 FILLER                   PIC X      VALUE SPACE.          IF1244.2 IMP
   000043         004800     02  PAR-NAME.                                                IF1244.2
   000044         004900       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1244.2 IMP
   000045         005000       03  PARDOT-X              PIC X      VALUE SPACE.          IF1244.2 IMP
   000046         005100       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1244.2 IMP
   000047         005200     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1244.2 IMP
   000048         005300     02 RE-MARK                  PIC X(61).                       IF1244.2
   000049         005400 01  TEST-COMPUTED.                                               IF1244.2
   000050         005500     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1244.2 IMP
   000051         005600     02 FILLER                   PIC X(17)  VALUE                 IF1244.2
   000052         005700            "       COMPUTED=".                                   IF1244.2
   000053         005800     02 COMPUTED-X.                                               IF1244.2
   000054         005900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1244.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1244.2 54
   000056         006100                                 PIC -9(9).9(9).                  IF1244.2
   000057         006200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1244.2 54
   000058         006300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1244.2 54
   000059         006400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1244.2 54
   000060         006500     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1244.2 54
   000061         006600         04 COMPUTED-18V0                    PIC -9(18).          IF1244.2
   000062         006700         04 FILLER                           PIC X.               IF1244.2
   000063         006800     03 FILLER PIC X(50) VALUE SPACE.                             IF1244.2 IMP
   000064         006900 01  TEST-CORRECT.                                                IF1244.2
   000065         007000     02 FILLER PIC X(30) VALUE SPACE.                             IF1244.2 IMP
   000066         007100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1244.2
   000067         007200     02 CORRECT-X.                                                IF1244.2
   000068         007300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1244.2 IMP
   000069         007400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1244.2 68
   000070         007500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1244.2 68
   000071         007600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1244.2 68
   000072         007700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1244.2 68
   000073         007800     03      CR-18V0 REDEFINES CORRECT-A.                         IF1244.2 68
   000074         007900         04 CORRECT-18V0                     PIC -9(18).          IF1244.2
   000075         008000         04 FILLER                           PIC X.               IF1244.2
   000076         008100     03 FILLER PIC X(2) VALUE SPACE.                              IF1244.2 IMP
   000077         008200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1244.2 IMP
   000078         008300 01  TEST-CORRECT-MIN.                                            IF1244.2
   000079         008400     02 FILLER PIC X(30) VALUE SPACE.                             IF1244.2 IMP
   000080         008500     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1244.2
   000081         008600     02 CORRECTMI-X.                                              IF1244.2
   000082         008700     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1244.2 IMP
   000083         008800     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1244.2 82
   000084         008900     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1244.2 82
   000085         009000     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1244.2 82
   000086         009100     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1244.2 82
   000087         009200     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1244.2 82
   000088         009300         04 CORRECTMI-18V0                     PIC -9(18).        IF1244.2
   000089         009400         04 FILLER                           PIC X.               IF1244.2
   000090         009500     03 FILLER PIC X(2) VALUE SPACE.                              IF1244.2 IMP
   000091         009600     03 FILLER                           PIC X(48) VALUE SPACE.   IF1244.2 IMP
   000092         009700 01  TEST-CORRECT-MAX.                                            IF1244.2
   000093         009800     02 FILLER PIC X(30) VALUE SPACE.                             IF1244.2 IMP
   000094         009900     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1244.2
   000095         010000     02 CORRECTMA-X.                                              IF1244.2
   000096         010100     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1244.2 IMP
   000097         010200     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1244.2 96
   000098         010300     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1244.2 96
   000099         010400     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1244.2 96
   000100         010500     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1244.2 96
   000101         010600     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1244.2 96
   000102         010700         04 CORRECTMA-18V0                     PIC -9(18).        IF1244.2
   000103         010800         04 FILLER                           PIC X.               IF1244.2
   000104         010900     03 FILLER PIC X(2) VALUE SPACE.                              IF1244.2 IMP
   000105         011000     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1244.2 IMP
   000106         011100 01  CCVS-C-1.                                                    IF1244.2
   000107         011200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1244.2
   000108         011300-    "SS  PARAGRAPH-NAME                                          IF1244.2
   000109         011400-    "       REMARKS".                                            IF1244.2
   000110         011500     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1244.2 IMP
   000111         011600 01  CCVS-C-2.                                                    IF1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     02 FILLER                     PIC X        VALUE SPACE.      IF1244.2 IMP
   000113         011800     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1244.2
   000114         011900     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1244.2 IMP
   000115         012000     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1244.2
   000116         012100     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1244.2 IMP
   000117         012200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1244.2 IMP
   000118         012300 01  REC-CT                        PIC 99       VALUE ZERO.       IF1244.2 IMP
   000119         012400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1244.2 IMP
   000120         012500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1244.2 IMP
   000121         012600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1244.2 IMP
   000122         012700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1244.2 IMP
   000123         012800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1244.2 IMP
   000124         012900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1244.2 IMP
   000125         013000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1244.2 IMP
   000126         013100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1244.2 IMP
   000127         013200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1244.2 IMP
   000128         013300 01  CCVS-H-1.                                                    IF1244.2
   000129         013400     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1244.2 IMP
   000130         013500     02  FILLER                    PIC X(42)    VALUE             IF1244.2
   000131         013600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1244.2
   000132         013700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1244.2 IMP
   000133         013800 01  CCVS-H-2A.                                                   IF1244.2
   000134         013900   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1244.2 IMP
   000135         014000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1244.2
   000136         014100   02  FILLER                        PIC XXXX   VALUE             IF1244.2
   000137         014200     "4.2 ".                                                      IF1244.2
   000138         014300   02  FILLER                        PIC X(28)  VALUE             IF1244.2
   000139         014400            " COPY - NOT FOR DISTRIBUTION".                       IF1244.2
   000140         014500   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1244.2 IMP
   000141         014600                                                                  IF1244.2
   000142         014700 01  CCVS-H-2B.                                                   IF1244.2
   000143         014800   02  FILLER                        PIC X(15)  VALUE             IF1244.2
   000144         014900            "TEST RESULT OF ".                                    IF1244.2
   000145         015000   02  TEST-ID                       PIC X(9).                    IF1244.2
   000146         015100   02  FILLER                        PIC X(4)   VALUE             IF1244.2
   000147         015200            " IN ".                                               IF1244.2
   000148         015300   02  FILLER                        PIC X(12)  VALUE             IF1244.2
   000149         015400     " HIGH       ".                                              IF1244.2
   000150         015500   02  FILLER                        PIC X(22)  VALUE             IF1244.2
   000151         015600            " LEVEL VALIDATION FOR ".                             IF1244.2
   000152         015700   02  FILLER                        PIC X(58)  VALUE             IF1244.2
   000153         015800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1244.2
   000154         015900 01  CCVS-H-3.                                                    IF1244.2
   000155         016000     02  FILLER                      PIC X(34)  VALUE             IF1244.2
   000156         016100            " FOR OFFICIAL USE ONLY    ".                         IF1244.2
   000157         016200     02  FILLER                      PIC X(58)  VALUE             IF1244.2
   000158         016300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1244.2
   000159         016400     02  FILLER                      PIC X(28)  VALUE             IF1244.2
   000160         016500            "  COPYRIGHT   1985 ".                                IF1244.2
   000161         016600 01  CCVS-E-1.                                                    IF1244.2
   000162         016700     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1244.2 IMP
   000163         016800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1244.2
   000164         016900     02 ID-AGAIN                     PIC X(9).                    IF1244.2
   000165         017000     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1244.2 IMP
   000166         017100 01  CCVS-E-2.                                                    IF1244.2
   000167         017200     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1244.2 IMP
   000168         017300     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1244.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 CCVS-E-2-2.                                               IF1244.2
   000170         017500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1244.2 IMP
   000171         017600         03 FILLER                   PIC X      VALUE SPACE.      IF1244.2 IMP
   000172         017700         03 ENDER-DESC               PIC X(44)  VALUE             IF1244.2
   000173         017800            "ERRORS ENCOUNTERED".                                 IF1244.2
   000174         017900 01  CCVS-E-3.                                                    IF1244.2
   000175         018000     02  FILLER                      PIC X(22)  VALUE             IF1244.2
   000176         018100            " FOR OFFICIAL USE ONLY".                             IF1244.2
   000177         018200     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1244.2 IMP
   000178         018300     02  FILLER                      PIC X(58)  VALUE             IF1244.2
   000179         018400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1244.2
   000180         018500     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1244.2 IMP
   000181         018600     02 FILLER                       PIC X(15)  VALUE             IF1244.2
   000182         018700             " COPYRIGHT 1985".                                   IF1244.2
   000183         018800 01  CCVS-E-4.                                                    IF1244.2
   000184         018900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1244.2 IMP
   000185         019000     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1244.2
   000186         019100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1244.2 IMP
   000187         019200     02 FILLER                       PIC X(40)  VALUE             IF1244.2
   000188         019300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1244.2
   000189         019400 01  XXINFO.                                                      IF1244.2
   000190         019500     02 FILLER                       PIC X(19)  VALUE             IF1244.2
   000191         019600            "*** INFORMATION ***".                                IF1244.2
   000192         019700     02 INFO-TEXT.                                                IF1244.2
   000193         019800       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1244.2 IMP
   000194         019900       04 XXCOMPUTED                 PIC X(20).                   IF1244.2
   000195         020000       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1244.2 IMP
   000196         020100       04 XXCORRECT                  PIC X(20).                   IF1244.2
   000197         020200     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1244.2
   000198         020300 01  HYPHEN-LINE.                                                 IF1244.2
   000199         020400     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1244.2 IMP
   000200         020500     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1244.2
   000201         020600-    "*****************************************".                 IF1244.2
   000202         020700     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1244.2
   000203         020800-    "******************************".                            IF1244.2
   000204         020900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1244.2
   000205         021000     "IF124A".                                                    IF1244.2
   000206         021100 PROCEDURE DIVISION.                                              IF1244.2
   000207         021200 CCVS1 SECTION.                                                   IF1244.2
   000208         021300 OPEN-FILES.                                                      IF1244.2
   000209         021400     OPEN     OUTPUT PRINT-FILE.                                  IF1244.2 22
   000210         021500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1244.2 204 145 204 164
   000211         021600     MOVE    SPACE TO TEST-RESULTS.                               IF1244.2 IMP 37
   000212         021700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1244.2 235 240
   000213         021800     GO TO CCVS1-EXIT.                                            IF1244.2 328
   000214         021900 CLOSE-FILES.                                                     IF1244.2
   000215         022000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1244.2 244 264 22
   000216         022100 TERMINATE-CCVS.                                                  IF1244.2
   000217         022200     STOP     RUN.                                                IF1244.2
   000218         022300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1244.2 41 121
   000219         022400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1244.2 41 122
   000220         022500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1244.2 41 120
   000221         022600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1244.2 41 119
   000222         022700     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1244.2 48
   000223         022800 PRINT-DETAIL.                                                    IF1244.2
   000224         022900     IF REC-CT NOT EQUAL TO ZERO                                  IF1244.2 118 IMP
   000225      1  023000             MOVE "." TO PARDOT-X                                 IF1244.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  023100             MOVE REC-CT TO DOTVALUE.                             IF1244.2 118 46
   000227         023200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1244.2 37 23 276
   000228         023300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1244.2 41 276
   000229      1  023400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1244.2 297 317
   000230      1  023500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1244.2 318 327
   000231         023600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1244.2 IMP 41 IMP 53
   000232         023700     MOVE SPACE TO CORRECT-X.                                     IF1244.2 IMP 67
   000233         023800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1244.2 118 IMP IMP 43
   000234         023900     MOVE     SPACE TO RE-MARK.                                   IF1244.2 IMP 48
   000235         024000 HEAD-ROUTINE.                                                    IF1244.2
   000236         024100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1244.2 128 24 276
   000237         024200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1244.2 133 24 276
   000238         024300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1244.2 142 24 276
   000239         024400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1244.2 154 24 276
   000240         024500 COLUMN-NAMES-ROUTINE.                                            IF1244.2
   000241         024600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1244.2 106 24 276
   000242         024700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1244.2 111 24 276
   000243         024800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1244.2 198 24 276
   000244         024900 END-ROUTINE.                                                     IF1244.2
   000245         025000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1244.2 198 24 276
   000246         025100 END-RTN-EXIT.                                                    IF1244.2
   000247         025200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1244.2 161 24 276
   000248         025300 END-ROUTINE-1.                                                   IF1244.2
   000249         025400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1244.2 120 124 121
   000250         025500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1244.2 124 119 124
   000251         025600      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1244.2 122 124
   000252         025700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1244.2 122 184
   000253         025800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1244.2 124 186
   000254         025900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1244.2 183 169
   000255         026000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1244.2 166 24 276
   000256         026100  END-ROUTINE-12.                                                 IF1244.2
   000257         026200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1244.2 172
   000258         026300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1244.2 120 IMP
   000259      1  026400         MOVE "NO " TO ERROR-TOTAL                                IF1244.2 170
   000260         026500         ELSE                                                     IF1244.2
   000261      1  026600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1244.2 120 170
   000262         026700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1244.2 166 24
   000263         026800     PERFORM WRITE-LINE.                                          IF1244.2 276
   000264         026900 END-ROUTINE-13.                                                  IF1244.2
   000265         027000     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1244.2 119 IMP
   000266      1  027100         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1244.2 170
   000267      1  027200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1244.2 119 170
   000268         027300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1244.2 172
   000269         027400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1244.2 166 24 276
   000270         027500      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1244.2 121 IMP
   000271      1  027600          MOVE "NO " TO ERROR-TOTAL                               IF1244.2 170
   000272      1  027700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1244.2 121 170
   000273         027800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1244.2 172
   000274         027900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1244.2 166 24 276
   000275         028000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1244.2 174 24 276
   000276         028100 WRITE-LINE.                                                      IF1244.2
   000277         028200     ADD 1 TO RECORD-COUNT.                                       IF1244.2 126
   000278         028300     IF RECORD-COUNT GREATER 42                                   IF1244.2 126
   000279      1  028400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1244.2 24 125
   000280      1  028500         MOVE SPACE TO DUMMY-RECORD                               IF1244.2 IMP 24
   000281      1  028600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1244.2 24
   000282      1  028700         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1244.2 128 24 292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1244.2 133 24 292
   000284      1  028900         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1244.2 142 24 292
   000285      1  029000         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1244.2 154 24 292
   000286      1  029100         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1244.2 106 24 292
   000287      1  029200         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1244.2 111 24 292
   000288      1  029300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1244.2 198 24 292
   000289      1  029400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1244.2 125 24
   000290      1  029500         MOVE ZERO TO RECORD-COUNT.                               IF1244.2 IMP 126
   000291         029600     PERFORM WRT-LN.                                              IF1244.2 292
   000292         029700 WRT-LN.                                                          IF1244.2
   000293         029800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1244.2 24
   000294         029900     MOVE SPACE TO DUMMY-RECORD.                                  IF1244.2 IMP 24
   000295         030000 BLANK-LINE-PRINT.                                                IF1244.2
   000296         030100     PERFORM WRT-LN.                                              IF1244.2 292
   000297         030200 FAIL-ROUTINE.                                                    IF1244.2
   000298         030300     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1244.2 53 IMP
   000299      1  030400            GO TO FAIL-ROUTINE-WRITE.                             IF1244.2 306
   000300         030500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1244.2 67 IMP 306
   000301         030600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1244.2 127 197
   000302         030700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1244.2 192
   000303         030800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1244.2 189 24 276
   000304         030900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1244.2 IMP 197
   000305         031000     GO TO  FAIL-ROUTINE-EX.                                      IF1244.2 317
   000306         031100 FAIL-ROUTINE-WRITE.                                              IF1244.2
   000307         031200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1244.2 49 23 276
   000308         031300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1244.2 127 77
   000309         031400                              CORMA-ANSI-REFERENCE.               IF1244.2 105
   000310         031500     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1244.2 83 IMP
   000311      1  031600           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1244.2 78 23 276
   000312      1  031700           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1244.2 92 23 276
   000313         031800     ELSE                                                         IF1244.2
   000314      1  031900           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1244.2 64 23 276
   000315         032000     PERFORM WRITE-LINE.                                          IF1244.2 276
   000316         032100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1244.2 IMP 77
   000317         032200 FAIL-ROUTINE-EX. EXIT.                                           IF1244.2
   000318         032300 BAIL-OUT.                                                        IF1244.2
   000319         032400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1244.2 54 IMP 321
   000320         032500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1244.2 68 IMP 327
   000321         032600 BAIL-OUT-WRITE.                                                  IF1244.2
   000322         032700     MOVE CORRECT-A TO XXCORRECT.                                 IF1244.2 68 196
   000323         032800     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1244.2 54 194
   000324         032900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1244.2 127 197
   000325         033000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1244.2 189 24 276
   000326         033100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1244.2 IMP 197
   000327         033200 BAIL-OUT-EX. EXIT.                                               IF1244.2
   000328         033300 CCVS1-EXIT.                                                      IF1244.2
   000329         033400     EXIT.                                                        IF1244.2
   000330         033600*                                                      *          IF1244.2
   000331         033700*    Intrinsic Function Tests         IF124A - MOD     *          IF1244.2
   000332         033800*                                                      *          IF1244.2
   000333         034000 SECT-IF124A SECTION.                                             IF1244.2
   000334         034100 F-MOD-INFO.                                                      IF1244.2
   000335         034200     MOVE     "See ref. A-58 2.28" TO ANSI-REFERENCE.             IF1244.2 127
   000336         034300     MOVE     "MOD Function" TO FEATURE.                          IF1244.2 39
   000337         034500 F-MOD-01.                                                        IF1244.2
   000338         034600     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000339         034700 F-MOD-TEST-01.                                                   IF1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800     COMPUTE WS-NUM = FUNCTION MOD(6, 6).                         IF1244.2 32 IFN
   000341         034900     IF WS-NUM = 0 THEN                                           IF1244.2 32
   000342      1  035000                    PERFORM PASS                                  IF1244.2 219
   000343         035100     ELSE                                                         IF1244.2
   000344      1  035200                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000345      1  035300                    MOVE 0 TO CORRECT-N                           IF1244.2 69
   000346      1  035400                    PERFORM FAIL.                                 IF1244.2 220
   000347         035500     GO TO F-MOD-WRITE-01.                                        IF1244.2 351
   000348         035600 F-MOD-DELETE-01.                                                 IF1244.2
   000349         035700     PERFORM  DE-LETE.                                            IF1244.2 221
   000350         035800     GO TO    F-MOD-WRITE-01.                                     IF1244.2 351
   000351         035900 F-MOD-WRITE-01.                                                  IF1244.2
   000352         036000     MOVE "F-MOD-01" TO PAR-NAME.                                 IF1244.2 43
   000353         036100     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000354         036300 F-MOD-02.                                                        IF1244.2
   000355         036400     EVALUATE FUNCTION MOD(11, 5)                                 IF1244.2 IFN
   000356         036500     WHEN 1                                                       IF1244.2
   000357      1  036600                    PERFORM PASS                                  IF1244.2 219
   000358         036700     WHEN OTHER                                                   IF1244.2
   000359      1  036800                    PERFORM FAIL.                                 IF1244.2 220
   000360         036900     GO TO F-MOD-WRITE-02.                                        IF1244.2 364
   000361         037000 F-MOD-DELETE-02.                                                 IF1244.2
   000362         037100     PERFORM  DE-LETE.                                            IF1244.2 221
   000363         037200     GO TO    F-MOD-WRITE-02.                                     IF1244.2 364
   000364         037300 F-MOD-WRITE-02.                                                  IF1244.2
   000365         037400     MOVE "F-MOD-02" TO PAR-NAME.                                 IF1244.2 43
   000366         037500     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000367         037700 F-MOD-03.                                                        IF1244.2
   000368         037800     IF FUNCTION MOD(10, 20) = 10 THEN                            IF1244.2 IFN
   000369      1  037900                    PERFORM PASS                                  IF1244.2 219
   000370         038000     ELSE                                                         IF1244.2
   000371      1  038100                    PERFORM FAIL.                                 IF1244.2 220
   000372         038200     GO TO F-MOD-WRITE-03.                                        IF1244.2 376
   000373         038300 F-MOD-DELETE-03.                                                 IF1244.2
   000374         038400     PERFORM  DE-LETE.                                            IF1244.2 221
   000375         038500     GO TO    F-MOD-WRITE-03.                                     IF1244.2 376
   000376         038600 F-MOD-WRITE-03.                                                  IF1244.2
   000377         038700     MOVE "F-MOD-03" TO PAR-NAME.                                 IF1244.2 43
   000378         038800     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000379         039000 F-MOD-04.                                                        IF1244.2
   000380         039100     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000381         039200 F-MOD-TEST-04.                                                   IF1244.2
   000382         039300     COMPUTE WS-NUM = FUNCTION MOD(A, B).                         IF1244.2 32 IFN 27 28
   000383         039400     IF WS-NUM = 5 THEN                                           IF1244.2 32
   000384      1  039500                    PERFORM PASS                                  IF1244.2 219
   000385         039600     ELSE                                                         IF1244.2
   000386      1  039700                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000387      1  039800                    MOVE 5 TO CORRECT-N                           IF1244.2 69
   000388      1  039900                    PERFORM FAIL.                                 IF1244.2 220
   000389         040000     GO TO F-MOD-WRITE-04.                                        IF1244.2 393
   000390         040100 F-MOD-DELETE-04.                                                 IF1244.2
   000391         040200     PERFORM  DE-LETE.                                            IF1244.2 221
   000392         040300     GO TO    F-MOD-WRITE-04.                                     IF1244.2 393
   000393         040400 F-MOD-WRITE-04.                                                  IF1244.2
   000394         040500     MOVE "F-MOD-04" TO PAR-NAME.                                 IF1244.2 43
   000395         040600     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000396         040800 F-MOD-05.                                                        IF1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040900     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000398         041000 F-MOD-TEST-05.                                                   IF1244.2
   000399         041100     COMPUTE WS-NUM = FUNCTION MOD(A, -3).                        IF1244.2 32 IFN 27
   000400         041200     IF WS-NUM = -1 THEN                                          IF1244.2 32
   000401      1  041300                    PERFORM PASS                                  IF1244.2 219
   000402         041400     ELSE                                                         IF1244.2
   000403      1  041500                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000404      1  041600                    MOVE -1 TO CORRECT-N                          IF1244.2 69
   000405      1  041700                    PERFORM FAIL.                                 IF1244.2 220
   000406         041800     GO TO F-MOD-WRITE-05.                                        IF1244.2 410
   000407         041900 F-MOD-DELETE-05.                                                 IF1244.2
   000408         042000     PERFORM  DE-LETE.                                            IF1244.2 221
   000409         042100     GO TO    F-MOD-WRITE-05.                                     IF1244.2 410
   000410         042200 F-MOD-WRITE-05.                                                  IF1244.2
   000411         042300     MOVE "F-MOD-05" TO PAR-NAME.                                 IF1244.2 43
   000412         042400     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000413         042600 F-MOD-06.                                                        IF1244.2
   000414         042700     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000415         042800 F-MOD-TEST-06.                                                   IF1244.2
   000416         042900     COMPUTE WS-NUM = FUNCTION MOD(23, B).                        IF1244.2 32 IFN 28
   000417         043000     IF WS-NUM = 2 THEN                                           IF1244.2 32
   000418      1  043100                    PERFORM PASS                                  IF1244.2 219
   000419         043200     ELSE                                                         IF1244.2
   000420      1  043300                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000421      1  043400                    MOVE 2 TO CORRECT-N                           IF1244.2 69
   000422      1  043500                    PERFORM FAIL.                                 IF1244.2 220
   000423         043600     GO TO F-MOD-WRITE-06.                                        IF1244.2 427
   000424         043700 F-MOD-DELETE-06.                                                 IF1244.2
   000425         043800     PERFORM  DE-LETE.                                            IF1244.2 221
   000426         043900     GO TO    F-MOD-WRITE-06.                                     IF1244.2 427
   000427         044000 F-MOD-WRITE-06.                                                  IF1244.2
   000428         044100     MOVE "F-MOD-06" TO PAR-NAME.                                 IF1244.2 43
   000429         044200     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000430         044400 F-MOD-07.                                                        IF1244.2
   000431         044500     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000432         044600 F-MOD-TEST-07.                                                   IF1244.2
   000433         044700     COMPUTE WS-NUM = FUNCTION MOD(-11, -5).                      IF1244.2 32 IFN
   000434         044800     IF WS-NUM = -1    THEN                                       IF1244.2 32
   000435      1  044900                    PERFORM PASS                                  IF1244.2 219
   000436         045000     ELSE                                                         IF1244.2
   000437      1  045100                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000438      1  045200                    MOVE -1    TO CORRECT-N                       IF1244.2 69
   000439      1  045300                    PERFORM FAIL.                                 IF1244.2 220
   000440         045400     GO TO F-MOD-WRITE-07.                                        IF1244.2 444
   000441         045500 F-MOD-DELETE-07.                                                 IF1244.2
   000442         045600     PERFORM  DE-LETE.                                            IF1244.2 221
   000443         045700     GO TO    F-MOD-WRITE-07.                                     IF1244.2 444
   000444         045800 F-MOD-WRITE-07.                                                  IF1244.2
   000445         045900     MOVE "F-MOD-07" TO PAR-NAME.                                 IF1244.2 43
   000446         046000     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000447         046200 F-MOD-08.                                                        IF1244.2
   000448         046300     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000449         046400 F-MOD-TEST-08.                                                   IF1244.2
   000450         046500     COMPUTE WS-NUM = FUNCTION MOD(11, -5).                       IF1244.2 32 IFN
   000451         046600     IF WS-NUM = -4 THEN                                          IF1244.2 32
   000452      1  046700                    PERFORM PASS                                  IF1244.2 219
   000453         046800     ELSE                                                         IF1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  046900                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000455      1  047000                    MOVE -4 TO CORRECT-N                          IF1244.2 69
   000456      1  047100                    PERFORM FAIL.                                 IF1244.2 220
   000457         047200     GO TO F-MOD-WRITE-08.                                        IF1244.2 461
   000458         047300 F-MOD-DELETE-08.                                                 IF1244.2
   000459         047400     PERFORM  DE-LETE.                                            IF1244.2 221
   000460         047500     GO TO    F-MOD-WRITE-08.                                     IF1244.2 461
   000461         047600 F-MOD-WRITE-08.                                                  IF1244.2
   000462         047700     MOVE "F-MOD-08" TO PAR-NAME.                                 IF1244.2 43
   000463         047800     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000464         048000 F-MOD-09.                                                        IF1244.2
   000465         048100     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000466         048200 F-MOD-TEST-09.                                                   IF1244.2
   000467         048300     COMPUTE WS-NUM = FUNCTION MOD(-11, 5).                       IF1244.2 32 IFN
   000468         048400     IF WS-NUM = 4 THEN                                           IF1244.2 32
   000469      1  048500                    PERFORM PASS                                  IF1244.2 219
   000470         048600     ELSE                                                         IF1244.2
   000471      1  048700                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000472      1  048800                    MOVE 4 TO CORRECT-N                           IF1244.2 69
   000473      1  048900                    PERFORM FAIL.                                 IF1244.2 220
   000474         049000     GO TO F-MOD-WRITE-09.                                        IF1244.2 478
   000475         049100 F-MOD-DELETE-09.                                                 IF1244.2
   000476         049200     PERFORM  DE-LETE.                                            IF1244.2 221
   000477         049300     GO TO    F-MOD-WRITE-09.                                     IF1244.2 478
   000478         049400 F-MOD-WRITE-09.                                                  IF1244.2
   000479         049500     MOVE "F-MOD-09" TO PAR-NAME.                                 IF1244.2 43
   000480         049600     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000481         049800 F-MOD-11.                                                        IF1244.2
   000482         049900     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000483         050000     MOVE -0.000020 TO MIN-RANGE.                                 IF1244.2 33
   000484         050100     MOVE  0.000020 TO MAX-RANGE.                                 IF1244.2 34
   000485         050200 F-MOD-TEST-11.                                                   IF1244.2
   000486         050300     COMPUTE WS-NUM = FUNCTION MOD(35, FUNCTION INTEGER(A * B)).  IF1244.2 32 IFN IFN 27 28
   000487         050400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000488         050500        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000489      1  050600                    PERFORM PASS                                  IF1244.2 219
   000490         050700     ELSE                                                         IF1244.2
   000491      1  050800                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000492      1  050900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000493      1  051000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000494      1  051100                    PERFORM FAIL.                                 IF1244.2 220
   000495         051200     GO TO F-MOD-WRITE-11.                                        IF1244.2 499
   000496         051300 F-MOD-DELETE-11.                                                 IF1244.2
   000497         051400     PERFORM  DE-LETE.                                            IF1244.2 221
   000498         051500     GO TO    F-MOD-WRITE-11.                                     IF1244.2 499
   000499         051600 F-MOD-WRITE-11.                                                  IF1244.2
   000500         051700     MOVE "F-MOD-11" TO PAR-NAME.                                 IF1244.2 43
   000501         051800     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000502         052000 F-MOD-12.                                                        IF1244.2
   000503         052100     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000504         052200     MOVE  0.999980 TO MIN-RANGE.                                 IF1244.2 33
   000505         052300     MOVE  1.00002 TO MAX-RANGE.                                  IF1244.2 34
   000506         052400 F-MOD-TEST-12.                                                   IF1244.2
   000507         052500     COMPUTE WS-NUM = FUNCTION MOD(A, FUNCTION INTEGER(B - 5)).   IF1244.2 32 IFN 27 IFN 28
   000508         052600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000509         052700        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000510      1  052800                    PERFORM PASS                                  IF1244.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052900     ELSE                                                         IF1244.2
   000512      1  053000                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000513      1  053100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000514      1  053200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000515      1  053300                    PERFORM FAIL.                                 IF1244.2 220
   000516         053400     GO TO F-MOD-WRITE-12.                                        IF1244.2 520
   000517         053500 F-MOD-DELETE-12.                                                 IF1244.2
   000518         053600     PERFORM  DE-LETE.                                            IF1244.2 221
   000519         053700     GO TO    F-MOD-WRITE-12.                                     IF1244.2 520
   000520         053800 F-MOD-WRITE-12.                                                  IF1244.2
   000521         053900     MOVE "F-MOD-12" TO PAR-NAME.                                 IF1244.2 43
   000522         054000     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000523         054200 F-MOD-13.                                                        IF1244.2
   000524         054300     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000525         054400     MOVE  6.99986 TO MIN-RANGE.                                  IF1244.2 33
   000526         054500     MOVE  7.00014 TO MAX-RANGE.                                  IF1244.2 34
   000527         054600 F-MOD-TEST-13.                                                   IF1244.2
   000528         054700     COMPUTE WS-NUM = FUNCTION MOD(FUNCTION INTEGER(A - B), 9).   IF1244.2 32 IFN IFN 27 28
   000529         054800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000530         054900        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000531      1  055000                    PERFORM PASS                                  IF1244.2 219
   000532         055100     ELSE                                                         IF1244.2
   000533      1  055200                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000534      1  055300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000535      1  055400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000536      1  055500                    PERFORM FAIL.                                 IF1244.2 220
   000537         055600     GO TO F-MOD-WRITE-13.                                        IF1244.2 541
   000538         055700 F-MOD-DELETE-13.                                                 IF1244.2
   000539         055800     PERFORM  DE-LETE.                                            IF1244.2 221
   000540         055900     GO TO    F-MOD-WRITE-13.                                     IF1244.2 541
   000541         056000 F-MOD-WRITE-13.                                                  IF1244.2
   000542         056100     MOVE "F-MOD-13" TO PAR-NAME.                                 IF1244.2 43
   000543         056200     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000544         056400 F-MOD-14.                                                        IF1244.2
   000545         056500     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000546         056600     MOVE -2.00004 TO MIN-RANGE.                                  IF1244.2 33
   000547         056700     MOVE -1.99996 TO MAX-RANGE.                                  IF1244.2 34
   000548         056800 F-MOD-TEST-14.                                                   IF1244.2
   000549         056900     COMPUTE WS-NUM = FUNCTION MOD(                               IF1244.2 32 IFN
   000550         057000                         FUNCTION INTEGER((A + B) / -2), -4).     IF1244.2 IFN 27 28
   000551         057100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000552         057200        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000553      1  057300                    PERFORM PASS                                  IF1244.2 219
   000554         057400     ELSE                                                         IF1244.2
   000555      1  057500                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000556      1  057600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000557      1  057700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000558      1  057800                    PERFORM FAIL.                                 IF1244.2 220
   000559         057900     GO TO F-MOD-WRITE-14.                                        IF1244.2 563
   000560         058000 F-MOD-DELETE-14.                                                 IF1244.2
   000561         058100     PERFORM  DE-LETE.                                            IF1244.2 221
   000562         058200     GO TO    F-MOD-WRITE-14.                                     IF1244.2 563
   000563         058300 F-MOD-WRITE-14.                                                  IF1244.2
   000564         058400     MOVE "F-MOD-14" TO PAR-NAME.                                 IF1244.2 43
   000565         058500     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000566         058700 F-MOD-15.                                                        IF1244.2
   000567         058800     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058900     MOVE  0.999980 TO MIN-RANGE.                                 IF1244.2 33
   000569         059000     MOVE  1.00002 TO MAX-RANGE.                                  IF1244.2 34
   000570         059100 F-MOD-TEST-15.                                                   IF1244.2
   000571         059200     COMPUTE WS-NUM = FUNCTION MOD(FUNCTION INTEGER(A * B),       IF1244.2 32 IFN IFN 27 28

 ==000571==> IGYPG3113-W Truncation of high-order digit positions may occur due to precision of
                         intermediate results exceeding 30 digits.

   000572         059300                                      FUNCTION INTEGER(B - A)).   IF1244.2 IFN 28 27
   000573         059400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000574         059500        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000575      1  059600                    PERFORM PASS                                  IF1244.2 219
   000576         059700     ELSE                                                         IF1244.2
   000577      1  059800                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000578      1  059900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000579      1  060000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000580      1  060100                    PERFORM FAIL.                                 IF1244.2 220
   000581         060200     GO TO F-MOD-WRITE-15.                                        IF1244.2 585
   000582         060300 F-MOD-DELETE-15.                                                 IF1244.2
   000583         060400     PERFORM  DE-LETE.                                            IF1244.2 221
   000584         060500     GO TO    F-MOD-WRITE-15.                                     IF1244.2 585
   000585         060600 F-MOD-WRITE-15.                                                  IF1244.2
   000586         060700     MOVE "F-MOD-15" TO PAR-NAME.                                 IF1244.2 43
   000587         060800     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000588         061000 F-MOD-16.                                                        IF1244.2
   000589         061100     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000590         061200     MOVE  1.99996 TO MIN-RANGE.                                  IF1244.2 33
   000591         061300     MOVE  2.00004 TO MAX-RANGE.                                  IF1244.2 34
   000592         061400 F-MOD-TEST-16.                                                   IF1244.2
   000593         061500     COMPUTE WS-NUM = FUNCTION MOD(                               IF1244.2 32 IFN
   000594         061600                      FUNCTION MOD(B, A), A).                     IF1244.2 IFN 28 27 27
   000595         061700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000596         061800        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000597      1  061900                    PERFORM PASS                                  IF1244.2 219
   000598         062000     ELSE                                                         IF1244.2
   000599      1  062100                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000600      1  062200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000601      1  062300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000602      1  062400                    PERFORM FAIL.                                 IF1244.2 220
   000603         062500     GO TO F-MOD-WRITE-16.                                        IF1244.2 607
   000604         062600 F-MOD-DELETE-16.                                                 IF1244.2
   000605         062700     PERFORM  DE-LETE.                                            IF1244.2 221
   000606         062800     GO TO    F-MOD-WRITE-16.                                     IF1244.2 607
   000607         062900 F-MOD-WRITE-16.                                                  IF1244.2
   000608         063000     MOVE "F-MOD-16" TO PAR-NAME.                                 IF1244.2 43
   000609         063100     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000610         063300 F-MOD-17.                                                        IF1244.2
   000611         063400     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000612         063500     MOVE  1.99996 TO MIN-RANGE.                                  IF1244.2 33
   000613         063600     MOVE  2.00004 TO MAX-RANGE.                                  IF1244.2 34
   000614         063700 F-MOD-TEST-17.                                                   IF1244.2
   000615         063800     COMPUTE WS-NUM = FUNCTION MOD(C, FUNCTION MOD(C, B)).        IF1244.2 32 IFN 29 IFN 29 28
   000616         063900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000617         064000        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000618      1  064100                    PERFORM PASS                                  IF1244.2 219
   000619         064200     ELSE                                                         IF1244.2
   000620      1  064300                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621      1  064400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000622      1  064500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000623      1  064600                    PERFORM FAIL.                                 IF1244.2 220
   000624         064700     GO TO F-MOD-WRITE-17.                                        IF1244.2 628
   000625         064800 F-MOD-DELETE-17.                                                 IF1244.2
   000626         064900     PERFORM  DE-LETE.                                            IF1244.2 221
   000627         065000     GO TO    F-MOD-WRITE-17.                                     IF1244.2 628
   000628         065100 F-MOD-WRITE-17.                                                  IF1244.2
   000629         065200     MOVE "F-MOD-17" TO PAR-NAME.                                 IF1244.2 43
   000630         065300     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000631         065500 F-MOD-18.                                                        IF1244.2
   000632         065600     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000633         065700     MOVE  0.999980 TO MIN-RANGE.                                 IF1244.2 33
   000634         065800     MOVE  1.00002 TO MAX-RANGE.                                  IF1244.2 34
   000635         065900 F-MOD-TEST-18.                                                   IF1244.2
   000636         066000     COMPUTE WS-NUM = FUNCTION MOD(FUNCTION MOD(9, 5),            IF1244.2 32 IFN IFN
   000637         066100                                   FUNCTION MOD(B, 4)).           IF1244.2 IFN 28
   000638         066200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000639         066300        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000640      1  066400                    PERFORM PASS                                  IF1244.2 219
   000641         066500     ELSE                                                         IF1244.2
   000642      1  066600                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000643      1  066700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000644      1  066800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000645      1  066900                    PERFORM FAIL.                                 IF1244.2 220
   000646         067000     GO TO F-MOD-WRITE-18.                                        IF1244.2 650
   000647         067100 F-MOD-DELETE-18.                                                 IF1244.2
   000648         067200     PERFORM  DE-LETE.                                            IF1244.2 221
   000649         067300     GO TO    F-MOD-WRITE-18.                                     IF1244.2 650
   000650         067400 F-MOD-WRITE-18.                                                  IF1244.2
   000651         067500     MOVE "F-MOD-18" TO PAR-NAME.                                 IF1244.2 43
   000652         067600     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000653         067800 F-MOD-19.                                                        IF1244.2
   000654         067900     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000655         068000     MOVE 6.99986 TO MIN-RANGE.                                   IF1244.2 33
   000656         068100     MOVE 7.00014 TO MAX-RANGE.                                   IF1244.2 34
   000657         068200 F-MOD-TEST-19.                                                   IF1244.2
   000658         068300     COMPUTE WS-NUM = FUNCTION MOD(23, B) + A.                    IF1244.2 32 IFN 28 27
   000659         068400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000660         068500        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000661      1  068600                    PERFORM PASS                                  IF1244.2 219
   000662         068700     ELSE                                                         IF1244.2
   000663      1  068800                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000664      1  068900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000665      1  069000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000666      1  069100                    PERFORM FAIL.                                 IF1244.2 220
   000667         069200     GO TO F-MOD-WRITE-19.                                        IF1244.2 671
   000668         069300 F-MOD-DELETE-19.                                                 IF1244.2
   000669         069400     PERFORM  DE-LETE.                                            IF1244.2 221
   000670         069500     GO TO    F-MOD-WRITE-19.                                     IF1244.2 671
   000671         069600 F-MOD-WRITE-19.                                                  IF1244.2
   000672         069700     MOVE "F-MOD-19" TO PAR-NAME.                                 IF1244.2 43
   000673         069800     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000674         070000 F-MOD-20.                                                        IF1244.2
   000675         070100     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000676         070200     MOVE -0.000020 TO MIN-RANGE.                                 IF1244.2 33
   000677         070300     MOVE  0.000020 TO MAX-RANGE.                                 IF1244.2 34
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000678         070400 F-MOD-TEST-20.                                                   IF1244.2
   000679         070500     COMPUTE WS-NUM = FUNCTION MOD(FUNCTION MOD(5, 2), 1).        IF1244.2 32 IFN IFN
   000680         070600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000681         070700        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000682      1  070800                    PERFORM PASS                                  IF1244.2 219
   000683         070900     ELSE                                                         IF1244.2
   000684      1  071000                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000685      1  071100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000686      1  071200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000687      1  071300                    PERFORM FAIL.                                 IF1244.2 220
   000688         071400     GO TO F-MOD-WRITE-20.                                        IF1244.2 692
   000689         071500 F-MOD-DELETE-20.                                                 IF1244.2
   000690         071600     PERFORM  DE-LETE.                                            IF1244.2 221
   000691         071700     GO TO    F-MOD-WRITE-20.                                     IF1244.2 692
   000692         071800 F-MOD-WRITE-20.                                                  IF1244.2
   000693         071900     MOVE "F-MOD-20" TO PAR-NAME.                                 IF1244.2 43
   000694         072000     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000695         072200 F-MOD-21.                                                        IF1244.2
   000696         072300     MOVE ZERO TO WS-NUM.                                         IF1244.2 IMP 32
   000697         072400     MOVE 0.999980 TO MIN-RANGE.                                  IF1244.2 33
   000698         072500     MOVE 1.00002 TO MAX-RANGE.                                   IF1244.2 34
   000699         072600 F-MOD-TEST-21.                                                   IF1244.2
   000700         072700     COMPUTE WS-NUM = FUNCTION MOD(25, C) +                       IF1244.2 32 IFN 29
   000701         072800                      FUNCTION MOD(-11, 5).                       IF1244.2 IFN
   000702         072900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1244.2 32 33
   000703         073000        (WS-NUM <= MAX-RANGE) THEN                                IF1244.2 32 34
   000704      1  073100                    PERFORM PASS                                  IF1244.2 219
   000705         073200     ELSE                                                         IF1244.2
   000706      1  073300                    MOVE WS-NUM TO COMPUTED-N                     IF1244.2 32 55
   000707      1  073400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1244.2 33 83
   000708      1  073500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1244.2 34 97
   000709      1  073600                    PERFORM FAIL.                                 IF1244.2 220
   000710         073700     GO TO F-MOD-WRITE-21.                                        IF1244.2 714
   000711         073800 F-MOD-DELETE-21.                                                 IF1244.2
   000712         073900     PERFORM  DE-LETE.                                            IF1244.2 221
   000713         074000     GO TO    F-MOD-WRITE-21.                                     IF1244.2 714
   000714         074100 F-MOD-WRITE-21.                                                  IF1244.2
   000715         074200     MOVE "F-MOD-21" TO PAR-NAME.                                 IF1244.2 43
   000716         074300     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000717         074500 F-MOD-22.                                                        IF1244.2
   000718         074600     PERFORM F-MOD-TEST-22                                        IF1244.2 722
   000719         074700       UNTIL FUNCTION MOD(5, ARG2) >= 2.                          IF1244.2 IFN 30
   000720         074800     PERFORM PASS.                                                IF1244.2 219
   000721         074900     GO TO F-MOD-WRITE-22.                                        IF1244.2 727
   000722         075000 F-MOD-TEST-22.                                                   IF1244.2
   000723         075100     COMPUTE ARG2 = ARG2 + 1.                                     IF1244.2 30 30
   000724         075200 F-MOD-DELETE-22.                                                 IF1244.2
   000725         075300     PERFORM  DE-LETE.                                            IF1244.2 221
   000726         075400     GO TO    F-MOD-WRITE-22.                                     IF1244.2 727
   000727         075500 F-MOD-WRITE-22.                                                  IF1244.2
   000728         075600     MOVE "F-MOD-22" TO PAR-NAME.                                 IF1244.2 43
   000729         075700     PERFORM  PRINT-DETAIL.                                       IF1244.2 223
   000730         075900 CCVS-EXIT SECTION.                                               IF1244.2
   000731         076000 CCVS-999999.                                                     IF1244.2
   000732         076100     GO TO CLOSE-FILES.                                           IF1244.2 214
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  382 399 486 507 528 550 571 572 594 594 658
      127   ANSI-REFERENCE . . . . . . . .  301 308 324 M335
       30   ARG2 . . . . . . . . . . . . .  719 M723 723
       28   B. . . . . . . . . . . . . . .  382 416 486 507 528 550 571 572 594 615 637 658
       29   C. . . . . . . . . . . . . . .  615 615 700
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
       55   COMPUTED-N . . . . . . . . . .  M344 M386 M403 M420 M437 M454 M471 M491 M512 M533 M555 M577 M599 M620 M642 M663
                                            M684 M706
       53   COMPUTED-X . . . . . . . . . .  M231 298
       57   COMPUTED-0V18
       59   COMPUTED-14V4
       61   COMPUTED-18V0
       58   COMPUTED-4V14
       77   COR-ANSI-REFERENCE . . . . . .  M308 M316
      105   CORMA-ANSI-REFERENCE . . . . .  M309
       68   CORRECT-A. . . . . . . . . . .  69 70 71 72 73 320 322
       97   CORRECT-MAX. . . . . . . . . .  M493 M514 M535 M557 M579 M601 M622 M644 M665 M686 M708
       83   CORRECT-MIN. . . . . . . . . .  310 M492 M513 M534 M556 M578 M600 M621 M643 M664 M685 M707
       69   CORRECT-N. . . . . . . . . . .  M345 M387 M404 M421 M438 M455 M472
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    17
0 Defined   Cross-reference of data names   References

0     119   DELETE-COUNTER . . . . . . . .  M221 250 265 267
       46   DOTVALUE . . . . . . . . . . .  M226
      125   DUMMY-HOLD . . . . . . . . . .  M279 289
       24   DUMMY-RECORD . . . . . . . . .  M236 M237 M238 M239 M241 M242 M243 M245 M247 M255 M262 M269 M274 M275 279 M280
                                            281 M282 M283 M284 M285 M286 M287 M288 M289 293 M294 M303 M325
      172   ENDER-DESC . . . . . . . . . .  M257 M268 M273
      120   ERROR-COUNTER. . . . . . . . .  M220 249 258 261
      124   ERROR-HOLD . . . . . . . . . .  M249 M250 M250 M251 253
      170   ERROR-TOTAL. . . . . . . . . .  M259 M261 M266 M267 M271 M272
       39   FEATURE. . . . . . . . . . . .  M336
      198   HYPHEN-LINE. . . . . . . . . .  243 245 288
      164   ID-AGAIN . . . . . . . . . . .  M210
      197   INF-ANSI-REFERENCE . . . . . .  M301 M304 M324 M326
      192   INFO-TEXT. . . . . . . . . . .  M302
      121   INSPECT-COUNTER. . . . . . . .  M218 249 270 272
       34   MAX-RANGE. . . . . . . . . . .  M484 488 493 M505 509 514 M526 530 535 M547 552 557 M569 574 579 M591 596 601
                                            M613 617 622 M634 639 644 M656 660 665 M677 681 686 M698 703 708
       33   MIN-RANGE. . . . . . . . . . .  M483 487 492 M504 508 513 M525 529 534 M546 551 556 M568 573 578 M590 595 600
                                            M612 616 621 M633 638 643 M655 659 664 M676 680 685 M697 702 707
       41   P-OR-F . . . . . . . . . . . .  M218 M219 M220 M221 228 M231
       43   PAR-NAME . . . . . . . . . . .  M233 M352 M365 M377 M394 M411 M428 M445 M462 M479 M500 M521 M542 M564 M586 M608
                                            M629 M651 M672 M693 M715 M728
       45   PARDOT-X . . . . . . . . . . .  M225
      122   PASS-COUNTER . . . . . . . . .  M219 251 252
       22   PRINT-FILE . . . . . . . . . .  18 209 215
       23   PRINT-REC. . . . . . . . . . .  M227 M307 M311 M312 M314
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
       32   WS-NUM . . . . . . . . . . . .  M338 M340 341 344 M380 M382 383 386 M397 M399 400 403 M414 M416 417 420 M431
                                            M433 434 437 M448 M450 451 454 M465 M467 468 471 M482 M486 487 488 491 M503 M507
                                            508 509 512 M524 M528 529 530 533 M545 M549 551 552 555 M567 M571 573 574 577
                                            M589 M593 595 596 599 M611 M615 616 617 620 M632 M636 638 639 642 M654 M658 659
                                            660 663 M675 M679 680 681 684 M696 M700 702 703 706
      194   XXCOMPUTED . . . . . . . . . .  M323
      196   XXCORRECT. . . . . . . . . . .  M322
      189   XXINFO . . . . . . . . . . . .  303 325
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    18
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
      730   CCVS-EXIT
      731   CCVS-999999
      207   CCVS1
      328   CCVS1-EXIT . . . . . . . . . .  G213
      214   CLOSE-FILES. . . . . . . . . .  G732
      240   COLUMN-NAMES-ROUTINE . . . . .  E212
      221   DE-LETE. . . . . . . . . . . .  P349 P362 P374 P391 P408 P425 P442 P459 P476 P497 P518 P539 P561 P583 P605 P626
                                            P648 P669 P690 P712 P725
      244   END-ROUTINE. . . . . . . . . .  P215
      248   END-ROUTINE-1
      256   END-ROUTINE-12
      264   END-ROUTINE-13 . . . . . . . .  E215
      246   END-RTN-EXIT
      348   F-MOD-DELETE-01
      361   F-MOD-DELETE-02
      373   F-MOD-DELETE-03
      390   F-MOD-DELETE-04
      407   F-MOD-DELETE-05
      424   F-MOD-DELETE-06
      441   F-MOD-DELETE-07
      458   F-MOD-DELETE-08
      475   F-MOD-DELETE-09
      496   F-MOD-DELETE-11
      517   F-MOD-DELETE-12
      538   F-MOD-DELETE-13
      560   F-MOD-DELETE-14
      582   F-MOD-DELETE-15
      604   F-MOD-DELETE-16
      625   F-MOD-DELETE-17
      647   F-MOD-DELETE-18
      668   F-MOD-DELETE-19
      689   F-MOD-DELETE-20
      711   F-MOD-DELETE-21
      724   F-MOD-DELETE-22
      334   F-MOD-INFO
      339   F-MOD-TEST-01
      381   F-MOD-TEST-04
      398   F-MOD-TEST-05
      415   F-MOD-TEST-06
      432   F-MOD-TEST-07
      449   F-MOD-TEST-08
      466   F-MOD-TEST-09
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    19
0 Defined   Cross-reference of procedures   References

0     485   F-MOD-TEST-11
      506   F-MOD-TEST-12
      527   F-MOD-TEST-13
      548   F-MOD-TEST-14
      570   F-MOD-TEST-15
      592   F-MOD-TEST-16
      614   F-MOD-TEST-17
      635   F-MOD-TEST-18
      657   F-MOD-TEST-19
      678   F-MOD-TEST-20
      699   F-MOD-TEST-21
      722   F-MOD-TEST-22. . . . . . . . .  P718
      351   F-MOD-WRITE-01 . . . . . . . .  G347 G350
      364   F-MOD-WRITE-02 . . . . . . . .  G360 G363
      376   F-MOD-WRITE-03 . . . . . . . .  G372 G375
      393   F-MOD-WRITE-04 . . . . . . . .  G389 G392
      410   F-MOD-WRITE-05 . . . . . . . .  G406 G409
      427   F-MOD-WRITE-06 . . . . . . . .  G423 G426
      444   F-MOD-WRITE-07 . . . . . . . .  G440 G443
      461   F-MOD-WRITE-08 . . . . . . . .  G457 G460
      478   F-MOD-WRITE-09 . . . . . . . .  G474 G477
      499   F-MOD-WRITE-11 . . . . . . . .  G495 G498
      520   F-MOD-WRITE-12 . . . . . . . .  G516 G519
      541   F-MOD-WRITE-13 . . . . . . . .  G537 G540
      563   F-MOD-WRITE-14 . . . . . . . .  G559 G562
      585   F-MOD-WRITE-15 . . . . . . . .  G581 G584
      607   F-MOD-WRITE-16 . . . . . . . .  G603 G606
      628   F-MOD-WRITE-17 . . . . . . . .  G624 G627
      650   F-MOD-WRITE-18 . . . . . . . .  G646 G649
      671   F-MOD-WRITE-19 . . . . . . . .  G667 G670
      692   F-MOD-WRITE-20 . . . . . . . .  G688 G691
      714   F-MOD-WRITE-21 . . . . . . . .  G710 G713
      727   F-MOD-WRITE-22 . . . . . . . .  G721 G726
      337   F-MOD-01
      354   F-MOD-02
      367   F-MOD-03
      379   F-MOD-04
      396   F-MOD-05
      413   F-MOD-06
      430   F-MOD-07
      447   F-MOD-08
      464   F-MOD-09
      481   F-MOD-11
      502   F-MOD-12
      523   F-MOD-13
      544   F-MOD-14
      566   F-MOD-15
      588   F-MOD-16
      610   F-MOD-17
      631   F-MOD-18
      653   F-MOD-19
      674   F-MOD-20
      695   F-MOD-21
      717   F-MOD-22
      220   FAIL . . . . . . . . . . . . .  P346 P359 P371 P388 P405 P422 P439 P456 P473 P494 P515 P536 P558 P580 P602 P623
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    20
0 Defined   Cross-reference of procedures   References

0                                           P645 P666 P687 P709
      297   FAIL-ROUTINE . . . . . . . . .  P229
      317   FAIL-ROUTINE-EX. . . . . . . .  E229 G305
      306   FAIL-ROUTINE-WRITE . . . . . .  G299 G300
      235   HEAD-ROUTINE . . . . . . . . .  P212
      218   INSPT
      208   OPEN-FILES
      219   PASS . . . . . . . . . . . . .  P342 P357 P369 P384 P401 P418 P435 P452 P469 P489 P510 P531 P553 P575 P597 P618
                                            P640 P661 P682 P704 P720
      223   PRINT-DETAIL . . . . . . . . .  P353 P366 P378 P395 P412 P429 P446 P463 P480 P501 P522 P543 P565 P587 P609 P630
                                            P652 P673 P694 P716 P729
      333   SECT-IF124A
      216   TERMINATE-CCVS
      276   WRITE-LINE . . . . . . . . . .  P227 P228 P236 P237 P238 P239 P241 P242 P243 P245 P247 P255 P263 P269 P274 P275
                                            P303 P307 P311 P312 P314 P315 P325
      292   WRT-LN . . . . . . . . . . . .  P282 P283 P284 P285 P286 P287 P288 P291 P296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    21
0 Defined   Cross-reference of programs     References

        3   IF124A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF124A    Date 06/04/2022  Time 11:58:31   Page    22
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    571  IGYPG3113-W   Truncation of high-order digit positions may occur due to precision of intermediate results exceeding 30
                       digits.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program IF124A:
 *    Source records = 732
 *    Data Division statements = 90
 *    Procedure Division statements = 416
 *    Generated COBOL statements = 0
 *    Program complexity factor = 424
0End of compilation 1,  program IF124A,  highest severity 4.
0Return code 4
