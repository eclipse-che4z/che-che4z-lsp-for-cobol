1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:08   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:08   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1154.2
   000002         000200 PROGRAM-ID.                                                      IF1154.2
   000003         000300     IF115A.                                                      IF1154.2
   000004         000400                                                                  IF1154.2
   000005         000600*                                                         *       IF1154.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1154.2
   000007         000800* It contains tests for the Intrinsic Function LENGTH.    *       IF1154.2
   000008         000900*                                                         *       IF1154.2
   000009         001000*                                                         *       IF1154.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1154.2
   000011         001300 CONFIGURATION SECTION.                                           IF1154.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1154.2
   000013         001500     XXXXX082.                                                    IF1154.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1154.2
   000015         001700     XXXXX083.                                                    IF1154.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1154.2
   000017         001900 FILE-CONTROL.                                                    IF1154.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1154.2 22
   000019         002100     XXXXX055.                                                    IF1154.2
   000020         002200 DATA DIVISION.                                                   IF1154.2
   000021         002300 FILE SECTION.                                                    IF1154.2
   000022         002400 FD  PRINT-FILE.                                                  IF1154.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1154.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1154.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1154.2
   000026         002900* Variables specific to the Intrinsic Function Test IF115A*       IF1154.2
   000027         003100 01  K                PIC A(1)     VALUE "D".                     IF1154.2
   000028         003200 01  M                PIC A(17)    VALUE "longstringofchars".     IF1154.2
   000029         003300 01  N                PIC A(3)     VALUE "abc".                   IF1154.2
   000030         003400 01  C                PIC S9(10).                                 IF1154.2
   000031         003500 01  WS-INT           PIC S9(10).                                 IF1154.2
   000032         003600*                                                                 IF1154.2
   000033         003800*                                                                 IF1154.2
   000034         003900 01  TEST-RESULTS.                                                IF1154.2
   000035         004000     02 FILLER                   PIC X      VALUE SPACE.          IF1154.2 IMP
   000036         004100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1154.2 IMP
   000037         004200     02 FILLER                   PIC X      VALUE SPACE.          IF1154.2 IMP
   000038         004300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1154.2 IMP
   000039         004400     02 FILLER                   PIC X      VALUE SPACE.          IF1154.2 IMP
   000040         004500     02  PAR-NAME.                                                IF1154.2
   000041         004600       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1154.2 IMP
   000042         004700       03  PARDOT-X              PIC X      VALUE SPACE.          IF1154.2 IMP
   000043         004800       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1154.2 IMP
   000044         004900     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1154.2 IMP
   000045         005000     02 RE-MARK                  PIC X(61).                       IF1154.2
   000046         005100 01  TEST-COMPUTED.                                               IF1154.2
   000047         005200     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1154.2 IMP
   000048         005300     02 FILLER                   PIC X(17)  VALUE                 IF1154.2
   000049         005400            "       COMPUTED=".                                   IF1154.2
   000050         005500     02 COMPUTED-X.                                               IF1154.2
   000051         005600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1154.2 IMP
   000052         005700     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1154.2 51
   000053         005800                                 PIC -9(9).9(9).                  IF1154.2
   000054         005900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1154.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1154.2 51
   000056         006100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1154.2 51
   000057         006200     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1154.2 51
   000058         006300         04 COMPUTED-18V0                    PIC -9(18).          IF1154.2
   000059         006400         04 FILLER                           PIC X.               IF1154.2
   000060         006500     03 FILLER PIC X(50) VALUE SPACE.                             IF1154.2 IMP
   000061         006600 01  TEST-CORRECT.                                                IF1154.2
   000062         006700     02 FILLER PIC X(30) VALUE SPACE.                             IF1154.2 IMP
   000063         006800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1154.2
   000064         006900     02 CORRECT-X.                                                IF1154.2
   000065         007000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1154.2 IMP
   000066         007100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1154.2 65
   000067         007200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1154.2 65
   000068         007300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1154.2 65
   000069         007400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1154.2 65
   000070         007500     03      CR-18V0 REDEFINES CORRECT-A.                         IF1154.2 65
   000071         007600         04 CORRECT-18V0                     PIC -9(18).          IF1154.2
   000072         007700         04 FILLER                           PIC X.               IF1154.2
   000073         007800     03 FILLER PIC X(2) VALUE SPACE.                              IF1154.2 IMP
   000074         007900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1154.2 IMP
   000075         008000 01  CCVS-C-1.                                                    IF1154.2
   000076         008100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1154.2
   000077         008200-    "SS  PARAGRAPH-NAME                                          IF1154.2
   000078         008300-    "       REMARKS".                                            IF1154.2
   000079         008400     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1154.2 IMP
   000080         008500 01  CCVS-C-2.                                                    IF1154.2
   000081         008600     02 FILLER                     PIC X        VALUE SPACE.      IF1154.2 IMP
   000082         008700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1154.2
   000083         008800     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1154.2 IMP
   000084         008900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1154.2
   000085         009000     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1154.2 IMP
   000086         009100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1154.2 IMP
   000087         009200 01  REC-CT                        PIC 99       VALUE ZERO.       IF1154.2 IMP
   000088         009300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1154.2 IMP
   000089         009400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1154.2 IMP
   000090         009500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1154.2 IMP
   000091         009600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1154.2 IMP
   000092         009700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1154.2 IMP
   000093         009800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1154.2 IMP
   000094         009900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1154.2 IMP
   000095         010000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1154.2 IMP
   000096         010100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1154.2 IMP
   000097         010200 01  CCVS-H-1.                                                    IF1154.2
   000098         010300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1154.2 IMP
   000099         010400     02  FILLER                    PIC X(42)    VALUE             IF1154.2
   000100         010500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1154.2
   000101         010600     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1154.2 IMP
   000102         010700 01  CCVS-H-2A.                                                   IF1154.2
   000103         010800   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1154.2 IMP
   000104         010900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1154.2
   000105         011000   02  FILLER                        PIC XXXX   VALUE             IF1154.2
   000106         011100     "4.2 ".                                                      IF1154.2
   000107         011200   02  FILLER                        PIC X(28)  VALUE             IF1154.2
   000108         011300            " COPY - NOT FOR DISTRIBUTION".                       IF1154.2
   000109         011400   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1154.2 IMP
   000110         011500                                                                  IF1154.2
   000111         011600 01  CCVS-H-2B.                                                   IF1154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700   02  FILLER                        PIC X(15)  VALUE             IF1154.2
   000113         011800            "TEST RESULT OF ".                                    IF1154.2
   000114         011900   02  TEST-ID                       PIC X(9).                    IF1154.2
   000115         012000   02  FILLER                        PIC X(4)   VALUE             IF1154.2
   000116         012100            " IN ".                                               IF1154.2
   000117         012200   02  FILLER                        PIC X(12)  VALUE             IF1154.2
   000118         012300     " HIGH       ".                                              IF1154.2
   000119         012400   02  FILLER                        PIC X(22)  VALUE             IF1154.2
   000120         012500            " LEVEL VALIDATION FOR ".                             IF1154.2
   000121         012600   02  FILLER                        PIC X(58)  VALUE             IF1154.2
   000122         012700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1154.2
   000123         012800 01  CCVS-H-3.                                                    IF1154.2
   000124         012900     02  FILLER                      PIC X(34)  VALUE             IF1154.2
   000125         013000            " FOR OFFICIAL USE ONLY    ".                         IF1154.2
   000126         013100     02  FILLER                      PIC X(58)  VALUE             IF1154.2
   000127         013200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1154.2
   000128         013300     02  FILLER                      PIC X(28)  VALUE             IF1154.2
   000129         013400            "  COPYRIGHT   1985 ".                                IF1154.2
   000130         013500 01  CCVS-E-1.                                                    IF1154.2
   000131         013600     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1154.2 IMP
   000132         013700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1154.2
   000133         013800     02 ID-AGAIN                     PIC X(9).                    IF1154.2
   000134         013900     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1154.2 IMP
   000135         014000 01  CCVS-E-2.                                                    IF1154.2
   000136         014100     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1154.2 IMP
   000137         014200     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1154.2 IMP
   000138         014300     02 CCVS-E-2-2.                                               IF1154.2
   000139         014400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1154.2 IMP
   000140         014500         03 FILLER                   PIC X      VALUE SPACE.      IF1154.2 IMP
   000141         014600         03 ENDER-DESC               PIC X(44)  VALUE             IF1154.2
   000142         014700            "ERRORS ENCOUNTERED".                                 IF1154.2
   000143         014800 01  CCVS-E-3.                                                    IF1154.2
   000144         014900     02  FILLER                      PIC X(22)  VALUE             IF1154.2
   000145         015000            " FOR OFFICIAL USE ONLY".                             IF1154.2
   000146         015100     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1154.2 IMP
   000147         015200     02  FILLER                      PIC X(58)  VALUE             IF1154.2
   000148         015300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1154.2
   000149         015400     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1154.2 IMP
   000150         015500     02 FILLER                       PIC X(15)  VALUE             IF1154.2
   000151         015600             " COPYRIGHT 1985".                                   IF1154.2
   000152         015700 01  CCVS-E-4.                                                    IF1154.2
   000153         015800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1154.2 IMP
   000154         015900     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1154.2
   000155         016000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1154.2 IMP
   000156         016100     02 FILLER                       PIC X(40)  VALUE             IF1154.2
   000157         016200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1154.2
   000158         016300 01  XXINFO.                                                      IF1154.2
   000159         016400     02 FILLER                       PIC X(19)  VALUE             IF1154.2
   000160         016500            "*** INFORMATION ***".                                IF1154.2
   000161         016600     02 INFO-TEXT.                                                IF1154.2
   000162         016700       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1154.2 IMP
   000163         016800       04 XXCOMPUTED                 PIC X(20).                   IF1154.2
   000164         016900       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1154.2 IMP
   000165         017000       04 XXCORRECT                  PIC X(20).                   IF1154.2
   000166         017100     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1154.2
   000167         017200 01  HYPHEN-LINE.                                                 IF1154.2
   000168         017300     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1154.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1154.2
   000170         017500-    "*****************************************".                 IF1154.2
   000171         017600     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1154.2
   000172         017700-    "******************************".                            IF1154.2
   000173         017800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1154.2
   000174         017900     "IF115A".                                                    IF1154.2
   000175         018000 PROCEDURE DIVISION.                                              IF1154.2
   000176         018100 CCVS1 SECTION.                                                   IF1154.2
   000177         018200 OPEN-FILES.                                                      IF1154.2
   000178         018300     OPEN     OUTPUT PRINT-FILE.                                  IF1154.2 22
   000179         018400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1154.2 173 114 173 133
   000180         018500     MOVE    SPACE TO TEST-RESULTS.                               IF1154.2 IMP 34
   000181         018600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1154.2 204 209
   000182         018700     GO TO CCVS1-EXIT.                                            IF1154.2 291
   000183         018800 CLOSE-FILES.                                                     IF1154.2
   000184         018900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1154.2 213 233 22
   000185         019000 TERMINATE-CCVS.                                                  IF1154.2
   000186         019100     STOP     RUN.                                                IF1154.2
   000187         019200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1154.2 38 90
   000188         019300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1154.2 38 91
   000189         019400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1154.2 38 89
   000190         019500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1154.2 38 88
   000191         019600     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1154.2 45
   000192         019700 PRINT-DETAIL.                                                    IF1154.2
   000193         019800     IF REC-CT NOT EQUAL TO ZERO                                  IF1154.2 87 IMP
   000194      1  019900             MOVE "." TO PARDOT-X                                 IF1154.2 42
   000195      1  020000             MOVE REC-CT TO DOTVALUE.                             IF1154.2 87 43
   000196         020100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1154.2 34 23 245
   000197         020200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1154.2 38 245
   000198      1  020300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1154.2 266 280
   000199      1  020400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1154.2 281 290
   000200         020500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1154.2 IMP 38 IMP 50
   000201         020600     MOVE SPACE TO CORRECT-X.                                     IF1154.2 IMP 64
   000202         020700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1154.2 87 IMP IMP 40
   000203         020800     MOVE     SPACE TO RE-MARK.                                   IF1154.2 IMP 45
   000204         020900 HEAD-ROUTINE.                                                    IF1154.2
   000205         021000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1154.2 97 24 245
   000206         021100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1154.2 102 24 245
   000207         021200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1154.2 111 24 245
   000208         021300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1154.2 123 24 245
   000209         021400 COLUMN-NAMES-ROUTINE.                                            IF1154.2
   000210         021500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1154.2 75 24 245
   000211         021600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1154.2 80 24 245
   000212         021700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1154.2 167 24 245
   000213         021800 END-ROUTINE.                                                     IF1154.2
   000214         021900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1154.2 167 24 245
   000215         022000 END-RTN-EXIT.                                                    IF1154.2
   000216         022100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1154.2 130 24 245
   000217         022200 END-ROUTINE-1.                                                   IF1154.2
   000218         022300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1154.2 89 93 90
   000219         022400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1154.2 93 88 93
   000220         022500      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1154.2 91 93
   000221         022600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1154.2 91 153
   000222         022700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1154.2 93 155
   000223         022800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1154.2 152 138
   000224         022900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1154.2 135 24 245
   000225         023000  END-ROUTINE-12.                                                 IF1154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1154.2 141
   000227         023200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1154.2 89 IMP
   000228      1  023300         MOVE "NO " TO ERROR-TOTAL                                IF1154.2 139
   000229         023400         ELSE                                                     IF1154.2
   000230      1  023500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1154.2 89 139
   000231         023600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1154.2 135 24
   000232         023700     PERFORM WRITE-LINE.                                          IF1154.2 245
   000233         023800 END-ROUTINE-13.                                                  IF1154.2
   000234         023900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1154.2 88 IMP
   000235      1  024000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1154.2 139
   000236      1  024100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1154.2 88 139
   000237         024200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1154.2 141
   000238         024300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1154.2 135 24 245
   000239         024400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1154.2 90 IMP
   000240      1  024500          MOVE "NO " TO ERROR-TOTAL                               IF1154.2 139
   000241      1  024600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1154.2 90 139
   000242         024700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1154.2 141
   000243         024800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1154.2 135 24 245
   000244         024900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1154.2 143 24 245
   000245         025000 WRITE-LINE.                                                      IF1154.2
   000246         025100     ADD 1 TO RECORD-COUNT.                                       IF1154.2 95
   000247         025200     IF RECORD-COUNT GREATER 42                                   IF1154.2 95
   000248      1  025300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1154.2 24 94
   000249      1  025400         MOVE SPACE TO DUMMY-RECORD                               IF1154.2 IMP 24
   000250      1  025500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1154.2 24
   000251      1  025600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1154.2 97 24 261
   000252      1  025700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1154.2 102 24 261
   000253      1  025800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1154.2 111 24 261
   000254      1  025900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1154.2 123 24 261
   000255      1  026000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1154.2 75 24 261
   000256      1  026100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1154.2 80 24 261
   000257      1  026200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1154.2 167 24 261
   000258      1  026300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1154.2 94 24
   000259      1  026400         MOVE ZERO TO RECORD-COUNT.                               IF1154.2 IMP 95
   000260         026500     PERFORM WRT-LN.                                              IF1154.2 261
   000261         026600 WRT-LN.                                                          IF1154.2
   000262         026700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1154.2 24
   000263         026800     MOVE SPACE TO DUMMY-RECORD.                                  IF1154.2 IMP 24
   000264         026900 BLANK-LINE-PRINT.                                                IF1154.2
   000265         027000     PERFORM WRT-LN.                                              IF1154.2 261
   000266         027100 FAIL-ROUTINE.                                                    IF1154.2
   000267         027200     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1154.2 50 IMP
   000268      1  027300            GO TO FAIL-ROUTINE-WRITE.                             IF1154.2 275
   000269         027400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1154.2 64 IMP 275
   000270         027500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1154.2 96 166
   000271         027600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1154.2 161
   000272         027700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1154.2 158 24 245
   000273         027800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1154.2 IMP 166
   000274         027900     GO TO  FAIL-ROUTINE-EX.                                      IF1154.2 280
   000275         028000 FAIL-ROUTINE-WRITE.                                              IF1154.2
   000276         028100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1154.2 46 23 245
   000277         028200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1154.2 96 74
   000278         028300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1154.2 61 23 245
   000279         028400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1154.2 IMP 74
   000280         028500 FAIL-ROUTINE-EX. EXIT.                                           IF1154.2
   000281         028600 BAIL-OUT.                                                        IF1154.2
   000282         028700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1154.2 51 IMP 284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1154.2 65 IMP 290
   000284         028900 BAIL-OUT-WRITE.                                                  IF1154.2
   000285         029000     MOVE CORRECT-A TO XXCORRECT.                                 IF1154.2 65 165
   000286         029100     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1154.2 51 163
   000287         029200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1154.2 96 166
   000288         029300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1154.2 158 24 245
   000289         029400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1154.2 IMP 166
   000290         029500 BAIL-OUT-EX. EXIT.                                               IF1154.2
   000291         029600 CCVS1-EXIT.                                                      IF1154.2
   000292         029700     EXIT.                                                        IF1154.2
   000293         029900*                                                      *          IF1154.2
   000294         030000*    Intrinsic Function Tests         IF115A - LENGTH  *          IF1154.2
   000295         030100*                                                      *          IF1154.2
   000296         030300 SECT-IF115A SECTION.                                             IF1154.2
   000297         030400 F-LENGTH-INFO.                                                   IF1154.2
   000298         030500     MOVE     "See ref. A-48 2.19" TO ANSI-REFERENCE.             IF1154.2 96
   000299         030600     MOVE     "LENGTH Function"     TO FEATURE.                   IF1154.2 36
   000300         030800 F-LENGTH-01.                                                     IF1154.2
   000301         030900     MOVE ZERO TO WS-INT.                                         IF1154.2 IMP 31
   000302         031000 F-LENGTH-TEST-01.                                                IF1154.2
   000303         031100     COMPUTE WS-INT = FUNCTION LENGTH("A").                       IF1154.2 31 IFN
   000304         031200     IF WS-INT = 1 THEN                                           IF1154.2 31
   000305      1  031300                        PERFORM PASS                              IF1154.2 188
   000306         031400     ELSE                                                         IF1154.2
   000307      1  031500                        MOVE 1 TO CORRECT-X                       IF1154.2 64
   000308      1  031600                        MOVE WS-INT TO COMPUTED-A                 IF1154.2 31 51
   000309      1  031700                        PERFORM FAIL.                             IF1154.2 189
   000310         031800     GO TO F-LENGTH-WRITE-01.                                     IF1154.2 314
   000311         031900 F-LENGTH-DELETE-01.                                              IF1154.2
   000312         032000     PERFORM  DE-LETE.                                            IF1154.2 190
   000313         032100     GO TO    F-LENGTH-WRITE-01.                                  IF1154.2 314
   000314         032200 F-LENGTH-WRITE-01.                                               IF1154.2
   000315         032300     MOVE "F-LENGTH-01" TO PAR-NAME.                              IF1154.2 40
   000316         032400     PERFORM  PRINT-DETAIL.                                       IF1154.2 192
   000317         032600 F-LENGTH-TEST-02.                                                IF1154.2
   000318         032700     EVALUATE FUNCTION LENGTH("ABCDEFGHIJKLMNOPQRST")             IF1154.2 IFN
   000319         032800     WHEN 20                                                      IF1154.2
   000320      1  032900                 PERFORM PASS                                     IF1154.2 188
   000321      1  033000                 GO TO F-LENGTH-WRITE-02.                         IF1154.2 327
   000322         033100     PERFORM FAIL.                                                IF1154.2 189
   000323         033200     GO TO F-LENGTH-WRITE-02.                                     IF1154.2 327
   000324         033300 F-LENGTH-DELETE-02.                                              IF1154.2
   000325         033400     PERFORM  DE-LETE.                                            IF1154.2 190
   000326         033500     GO TO    F-LENGTH-WRITE-02.                                  IF1154.2 327
   000327         033600 F-LENGTH-WRITE-02.                                               IF1154.2
   000328         033700     MOVE "F-LENGTH-02" TO PAR-NAME.                              IF1154.2 40
   000329         033800     PERFORM  PRINT-DETAIL.                                       IF1154.2 192
   000330         034000 F-LENGTH-03.                                                     IF1154.2
   000331         034100     MOVE ZERO TO WS-INT.                                         IF1154.2 IMP 31
   000332         034200 F-LENGTH-TEST-03.                                                IF1154.2
   000333         034300     IF FUNCTION LENGTH("ABCD") = 4 THEN                          IF1154.2 IFN
   000334      1  034400                        PERFORM PASS                              IF1154.2 188
   000335         034500     ELSE                                                         IF1154.2
   000336      1  034600                        MOVE 4 TO CORRECT-X                       IF1154.2 64
   000337      1  034700                        MOVE WS-INT TO COMPUTED-A                 IF1154.2 31 51
   000338      1  034800                        PERFORM FAIL.                             IF1154.2 189
   000339         034900     GO TO F-LENGTH-WRITE-03.                                     IF1154.2 343
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         035000 F-LENGTH-DELETE-03.                                              IF1154.2
   000341         035100     PERFORM  DE-LETE.                                            IF1154.2 190
   000342         035200     GO TO    F-LENGTH-WRITE-03.                                  IF1154.2 343
   000343         035300 F-LENGTH-WRITE-03.                                               IF1154.2
   000344         035400     MOVE "F-LENGTH-03" TO PAR-NAME.                              IF1154.2 40
   000345         035500     PERFORM  PRINT-DETAIL.                                       IF1154.2 192
   000346         035700 F-LENGTH-04.                                                     IF1154.2
   000347         035800     MOVE ZERO TO WS-INT.                                         IF1154.2 IMP 31
   000348         035900 F-LENGTH-TEST-04.                                                IF1154.2
   000349         036000     COMPUTE WS-INT = FUNCTION LENGTH(K).                         IF1154.2 31 IFN 27
   000350         036100     IF WS-INT = 1 THEN                                           IF1154.2 31
   000351      1  036200                        PERFORM PASS                              IF1154.2 188
   000352         036300     ELSE                                                         IF1154.2
   000353      1  036400                        MOVE 1 TO CORRECT-X                       IF1154.2 64
   000354      1  036500                        MOVE WS-INT TO COMPUTED-A                 IF1154.2 31 51
   000355      1  036600                        PERFORM FAIL.                             IF1154.2 189
   000356         036700     GO TO F-LENGTH-WRITE-04.                                     IF1154.2 360
   000357         036800 F-LENGTH-DELETE-04.                                              IF1154.2
   000358         036900     PERFORM  DE-LETE.                                            IF1154.2 190
   000359         037000     GO TO    F-LENGTH-WRITE-04.                                  IF1154.2 360
   000360         037100 F-LENGTH-WRITE-04.                                               IF1154.2
   000361         037200     MOVE "F-LENGTH-04" TO PAR-NAME.                              IF1154.2 40
   000362         037300     PERFORM  PRINT-DETAIL.                                       IF1154.2 192
   000363         037500 F-LENGTH-05.                                                     IF1154.2
   000364         037600     MOVE ZERO TO WS-INT.                                         IF1154.2 IMP 31
   000365         037700 F-LENGTH-TEST-05.                                                IF1154.2
   000366         037800     COMPUTE WS-INT = FUNCTION LENGTH(M).                         IF1154.2 31 IFN 28
   000367         037900     IF WS-INT = 17 THEN                                          IF1154.2 31
   000368      1  038000                        PERFORM PASS                              IF1154.2 188
   000369         038100     ELSE                                                         IF1154.2
   000370      1  038200                        MOVE  17  TO CORRECT-X                    IF1154.2 64
   000371      1  038300                        MOVE WS-INT TO COMPUTED-A                 IF1154.2 31 51
   000372      1  038400                        PERFORM FAIL.                             IF1154.2 189
   000373         038500     GO TO F-LENGTH-WRITE-05.                                     IF1154.2 377
   000374         038600 F-LENGTH-DELETE-05.                                              IF1154.2
   000375         038700     PERFORM  DE-LETE.                                            IF1154.2 190
   000376         038800     GO TO    F-LENGTH-WRITE-05.                                  IF1154.2 377
   000377         038900 F-LENGTH-WRITE-05.                                               IF1154.2
   000378         039000     MOVE "F-LENGTH-05" TO PAR-NAME.                              IF1154.2 40
   000379         039100     PERFORM  PRINT-DETAIL.                                       IF1154.2 192
   000380         039300 F-LENGTH-06.                                                     IF1154.2
   000381         039400     MOVE ZERO TO WS-INT.                                         IF1154.2 IMP 31
   000382         039500 F-LENGTH-TEST-06.                                                IF1154.2
   000383         039600     COMPUTE WS-INT = FUNCTION LENGTH(N).                         IF1154.2 31 IFN 29
   000384         039700     IF WS-INT = 3 THEN                                           IF1154.2 31
   000385      1  039800                        PERFORM PASS                              IF1154.2 188
   000386         039900     ELSE                                                         IF1154.2
   000387      1  040000                        MOVE 3 TO CORRECT-X                       IF1154.2 64
   000388      1  040100                        MOVE WS-INT TO COMPUTED-A                 IF1154.2 31 51
   000389      1  040200                        PERFORM FAIL.                             IF1154.2 189
   000390         040300     GO TO F-LENGTH-WRITE-06.                                     IF1154.2 394
   000391         040400 F-LENGTH-DELETE-06.                                              IF1154.2
   000392         040500     PERFORM  DE-LETE.                                            IF1154.2 190
   000393         040600     GO TO    F-LENGTH-WRITE-06.                                  IF1154.2 394
   000394         040700 F-LENGTH-WRITE-06.                                               IF1154.2
   000395         040800     MOVE "F-LENGTH-06" TO PAR-NAME.                              IF1154.2 40
   000396         040900     PERFORM  PRINT-DETAIL.                                       IF1154.2 192
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         041100 F-LENGTH-07.                                                     IF1154.2
   000398         041200     MOVE ZERO TO WS-INT.                                         IF1154.2 IMP 31
   000399         041300 F-LENGTH-TEST-07.                                                IF1154.2
   000400         041400     COMPUTE WS-INT = FUNCTION LENGTH(N) + 2.                     IF1154.2 31 IFN 29
   000401         041500     IF WS-INT = 5 THEN                                           IF1154.2 31
   000402      1  041600                        PERFORM PASS                              IF1154.2 188
   000403         041700     ELSE                                                         IF1154.2
   000404      1  041800                        MOVE 5 TO CORRECT-N                       IF1154.2 66
   000405      1  041900                        MOVE WS-INT TO COMPUTED-A                 IF1154.2 31 51
   000406      1  042000                        PERFORM FAIL.                             IF1154.2 189
   000407         042100     GO TO F-LENGTH-WRITE-07.                                     IF1154.2 411
   000408         042200 F-LENGTH-DELETE-07.                                              IF1154.2
   000409         042300     PERFORM  DE-LETE.                                            IF1154.2 190
   000410         042400     GO TO    F-LENGTH-WRITE-07.                                  IF1154.2 411
   000411         042500 F-LENGTH-WRITE-07.                                               IF1154.2
   000412         042600     MOVE "F-LENGTH-07" TO PAR-NAME.                              IF1154.2 40
   000413         042700     PERFORM  PRINT-DETAIL.                                       IF1154.2 192
   000414         042900 F-LENGTH-08.                                                     IF1154.2
   000415         043000     MOVE ZERO TO WS-INT.                                         IF1154.2 IMP 31
   000416         043100 F-LENGTH-TEST-08.                                                IF1154.2
   000417         043200     COMPUTE WS-INT = FUNCTION LENGTH(N) +                        IF1154.2 31 IFN 29
   000418         043300                      FUNCTION LENGTH(N).                         IF1154.2 IFN 29
   000419         043400     IF WS-INT = 6 THEN                                           IF1154.2 31
   000420      1  043500                        PERFORM PASS                              IF1154.2 188
   000421         043600     ELSE                                                         IF1154.2
   000422      1  043700                        MOVE 6 TO CORRECT-N                       IF1154.2 66
   000423      1  043800                        MOVE WS-INT TO COMPUTED-A                 IF1154.2 31 51
   000424      1  043900                        PERFORM FAIL.                             IF1154.2 189
   000425         044000     GO TO F-LENGTH-WRITE-08.                                     IF1154.2 429
   000426         044100 F-LENGTH-DELETE-08.                                              IF1154.2
   000427         044200     PERFORM  DE-LETE.                                            IF1154.2 190
   000428         044300     GO TO    F-LENGTH-WRITE-08.                                  IF1154.2 429
   000429         044400 F-LENGTH-WRITE-08.                                               IF1154.2
   000430         044500     MOVE "F-LENGTH-08" TO PAR-NAME.                              IF1154.2 40
   000431         044600     PERFORM  PRINT-DETAIL.                                       IF1154.2 192
   000432         044800 CCVS-EXIT SECTION.                                               IF1154.2
   000433         044900 CCVS-999999.                                                     IF1154.2
   000434         045000     GO TO CLOSE-FILES.                                           IF1154.2 183
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page    11
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       96   ANSI-REFERENCE . . . . . . . .  270 277 287 M298
       30   C
       75   CCVS-C-1 . . . . . . . . . . .  210 255
       80   CCVS-C-2 . . . . . . . . . . .  211 256
      130   CCVS-E-1 . . . . . . . . . . .  216
      135   CCVS-E-2 . . . . . . . . . . .  224 231 238 243
      138   CCVS-E-2-2 . . . . . . . . . .  M223
      143   CCVS-E-3 . . . . . . . . . . .  244
      152   CCVS-E-4 . . . . . . . . . . .  223
      153   CCVS-E-4-1 . . . . . . . . . .  M221
      155   CCVS-E-4-2 . . . . . . . . . .  M222
       97   CCVS-H-1 . . . . . . . . . . .  205 251
      102   CCVS-H-2A. . . . . . . . . . .  206 252
      111   CCVS-H-2B. . . . . . . . . . .  207 253
      123   CCVS-H-3 . . . . . . . . . . .  208 254
      173   CCVS-PGM-ID. . . . . . . . . .  179 179
       57   CM-18V0
       51   COMPUTED-A . . . . . . . . . .  52 54 55 56 57 282 286 M308 M337 M354 M371 M388 M405 M423
       52   COMPUTED-N
       50   COMPUTED-X . . . . . . . . . .  M200 267
       54   COMPUTED-0V18
       56   COMPUTED-14V4
       58   COMPUTED-18V0
       55   COMPUTED-4V14
       74   COR-ANSI-REFERENCE . . . . . .  M277 M279
       65   CORRECT-A. . . . . . . . . . .  66 67 68 69 70 283 285
       66   CORRECT-N. . . . . . . . . . .  M404 M422
       64   CORRECT-X. . . . . . . . . . .  M201 269 M307 M336 M353 M370 M387
       67   CORRECT-0V18
       69   CORRECT-14V4
       71   CORRECT-18V0
       68   CORRECT-4V14
       70   CR-18V0
       88   DELETE-COUNTER . . . . . . . .  M190 219 234 236
       43   DOTVALUE . . . . . . . . . . .  M195
       94   DUMMY-HOLD . . . . . . . . . .  M248 258
       24   DUMMY-RECORD . . . . . . . . .  M205 M206 M207 M208 M210 M211 M212 M214 M216 M224 M231 M238 M243 M244 248 M249
                                            250 M251 M252 M253 M254 M255 M256 M257 M258 262 M263 M272 M288
      141   ENDER-DESC . . . . . . . . . .  M226 M237 M242
       89   ERROR-COUNTER. . . . . . . . .  M189 218 227 230
       93   ERROR-HOLD . . . . . . . . . .  M218 M219 M219 M220 222
      139   ERROR-TOTAL. . . . . . . . . .  M228 M230 M235 M236 M240 M241
       36   FEATURE. . . . . . . . . . . .  M299
      167   HYPHEN-LINE. . . . . . . . . .  212 214 257
      133   ID-AGAIN . . . . . . . . . . .  M179
      166   INF-ANSI-REFERENCE . . . . . .  M270 M273 M287 M289
      161   INFO-TEXT. . . . . . . . . . .  M271
       90   INSPECT-COUNTER. . . . . . . .  M187 218 239 241
       27   K. . . . . . . . . . . . . . .  349
       28   M. . . . . . . . . . . . . . .  366
       29   N. . . . . . . . . . . . . . .  383 400 417 418
       38   P-OR-F . . . . . . . . . . . .  M187 M188 M189 M190 197 M200
       40   PAR-NAME . . . . . . . . . . .  M202 M315 M328 M344 M361 M378 M395 M412 M430
       42   PARDOT-X . . . . . . . . . . .  M194
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page    12
0 Defined   Cross-reference of data names   References

0      91   PASS-COUNTER . . . . . . . . .  M188 220 221
       22   PRINT-FILE . . . . . . . . . .  18 178 184
       23   PRINT-REC. . . . . . . . . . .  M196 M276 M278
       45   RE-MARK. . . . . . . . . . . .  M191 M203
       87   REC-CT . . . . . . . . . . . .  193 195 202
       86   REC-SKL-SUB
       95   RECORD-COUNT . . . . . . . . .  M246 247 M259
       46   TEST-COMPUTED. . . . . . . . .  276
       61   TEST-CORRECT . . . . . . . . .  278
      114   TEST-ID. . . . . . . . . . . .  M179
       34   TEST-RESULTS . . . . . . . . .  M180 196
       92   TOTAL-ERROR
       31   WS-INT . . . . . . . . . . . .  M301 M303 304 308 M331 337 M347 M349 350 354 M364 M366 367 371 M381 M383 384
                                            388 M398 M400 401 405 M415 M417 419 423
      163   XXCOMPUTED . . . . . . . . . .  M286
      165   XXCORRECT. . . . . . . . . . .  M285
      158   XXINFO . . . . . . . . . . . .  272 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page    13
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

      281   BAIL-OUT . . . . . . . . . . .  P199
      290   BAIL-OUT-EX. . . . . . . . . .  E199 G283
      284   BAIL-OUT-WRITE . . . . . . . .  G282
      264   BLANK-LINE-PRINT
      432   CCVS-EXIT
      433   CCVS-999999
      176   CCVS1
      291   CCVS1-EXIT . . . . . . . . . .  G182
      183   CLOSE-FILES. . . . . . . . . .  G434
      209   COLUMN-NAMES-ROUTINE . . . . .  E181
      190   DE-LETE. . . . . . . . . . . .  P312 P325 P341 P358 P375 P392 P409 P427
      213   END-ROUTINE. . . . . . . . . .  P184
      217   END-ROUTINE-1
      225   END-ROUTINE-12
      233   END-ROUTINE-13 . . . . . . . .  E184
      215   END-RTN-EXIT
      311   F-LENGTH-DELETE-01
      324   F-LENGTH-DELETE-02
      340   F-LENGTH-DELETE-03
      357   F-LENGTH-DELETE-04
      374   F-LENGTH-DELETE-05
      391   F-LENGTH-DELETE-06
      408   F-LENGTH-DELETE-07
      426   F-LENGTH-DELETE-08
      297   F-LENGTH-INFO
      302   F-LENGTH-TEST-01
      317   F-LENGTH-TEST-02
      332   F-LENGTH-TEST-03
      348   F-LENGTH-TEST-04
      365   F-LENGTH-TEST-05
      382   F-LENGTH-TEST-06
      399   F-LENGTH-TEST-07
      416   F-LENGTH-TEST-08
      314   F-LENGTH-WRITE-01. . . . . . .  G310 G313
      327   F-LENGTH-WRITE-02. . . . . . .  G321 G323 G326
      343   F-LENGTH-WRITE-03. . . . . . .  G339 G342
      360   F-LENGTH-WRITE-04. . . . . . .  G356 G359
      377   F-LENGTH-WRITE-05. . . . . . .  G373 G376
      394   F-LENGTH-WRITE-06. . . . . . .  G390 G393
      411   F-LENGTH-WRITE-07. . . . . . .  G407 G410
      429   F-LENGTH-WRITE-08. . . . . . .  G425 G428
      300   F-LENGTH-01
      330   F-LENGTH-03
      346   F-LENGTH-04
      363   F-LENGTH-05
      380   F-LENGTH-06
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page    14
0 Defined   Cross-reference of procedures   References

0     397   F-LENGTH-07
      414   F-LENGTH-08
      189   FAIL . . . . . . . . . . . . .  P309 P322 P338 P355 P372 P389 P406 P424
      266   FAIL-ROUTINE . . . . . . . . .  P198
      280   FAIL-ROUTINE-EX. . . . . . . .  E198 G274
      275   FAIL-ROUTINE-WRITE . . . . . .  G268 G269
      204   HEAD-ROUTINE . . . . . . . . .  P181
      187   INSPT
      177   OPEN-FILES
      188   PASS . . . . . . . . . . . . .  P305 P320 P334 P351 P368 P385 P402 P420
      192   PRINT-DETAIL . . . . . . . . .  P316 P329 P345 P362 P379 P396 P413 P431
      296   SECT-IF115A
      185   TERMINATE-CCVS
      245   WRITE-LINE . . . . . . . . . .  P196 P197 P205 P206 P207 P208 P210 P211 P212 P214 P216 P224 P232 P238 P243 P244
                                            P272 P276 P278 P288
      261   WRT-LN . . . . . . . . . . . .  P251 P252 P253 P254 P255 P256 P257 P260 P265
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page    15
0 Defined   Cross-reference of programs     References

        3   IF115A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF115A    Date 06/04/2022  Time 12:00:08   Page    16
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF115A:
 *    Source records = 434
 *    Data Division statements = 68
 *    Procedure Division statements = 229
 *    Generated COBOL statements = 0
 *    Program complexity factor = 237
0End of compilation 1,  program IF115A,  highest severity 0.
0Return code 0
