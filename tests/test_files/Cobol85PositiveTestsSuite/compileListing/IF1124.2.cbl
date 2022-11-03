1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:17   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:17   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1124.2
   000002         000200 PROGRAM-ID.                                                      IF1124.2
   000003         000300     IF112A.                                                      IF1124.2
   000004         000400                                                                  IF1124.2
   000005         000600*                                                         *       IF1124.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1124.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1124.2
   000008         000900* INTEGER-OF-DATE.                                        *       IF1124.2
   000009         001000*                                                         *       IF1124.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1124.2
   000011         001300 CONFIGURATION SECTION.                                           IF1124.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1124.2
   000013         001500     XXXXX082.                                                    IF1124.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1124.2
   000015         001700     XXXXX083.                                                    IF1124.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1124.2
   000017         001900 FILE-CONTROL.                                                    IF1124.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1124.2 22
   000019         002100     XXXXX055.                                                    IF1124.2
   000020         002200 DATA DIVISION.                                                   IF1124.2
   000021         002300 FILE SECTION.                                                    IF1124.2
   000022         002400 FD  PRINT-FILE.                                                  IF1124.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1124.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1124.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1124.2
   000026         002900* Variables specific to the Intrinsic Function Test IF112A*       IF1124.2
   000027         003100 01  A                   PIC S9(10)     VALUE 16020204.           IF1124.2
   000028         003200 01  D                   PIC S9(10)     VALUE 2.                  IF1124.2
   000029         003300 01  ARG1                PIC S9(10)     VALUE 16010101.           IF1124.2
   000030         003400 01  ARR                                VALUE "1601010116020210". IF1124.2
   000031         003500     02 IND OCCURS 2 TIMES PIC 9(8).                              IF1124.2
   000032         003600 01  TEMP                PIC S9(10).                              IF1124.2
   000033         003700 01  WS-INT              PIC 9(8).                                IF1124.2
   000034         003800*                                                                 IF1124.2
   000035         004000*                                                                 IF1124.2
   000036         004100 01  TEST-RESULTS.                                                IF1124.2
   000037         004200     02 FILLER                   PIC X      VALUE SPACE.          IF1124.2 IMP
   000038         004300     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1124.2 IMP
   000039         004400     02 FILLER                   PIC X      VALUE SPACE.          IF1124.2 IMP
   000040         004500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1124.2 IMP
   000041         004600     02 FILLER                   PIC X      VALUE SPACE.          IF1124.2 IMP
   000042         004700     02  PAR-NAME.                                                IF1124.2
   000043         004800       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1124.2 IMP
   000044         004900       03  PARDOT-X              PIC X      VALUE SPACE.          IF1124.2 IMP
   000045         005000       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1124.2 IMP
   000046         005100     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1124.2 IMP
   000047         005200     02 RE-MARK                  PIC X(61).                       IF1124.2
   000048         005300 01  TEST-COMPUTED.                                               IF1124.2
   000049         005400     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1124.2 IMP
   000050         005500     02 FILLER                   PIC X(17)  VALUE                 IF1124.2
   000051         005600            "       COMPUTED=".                                   IF1124.2
   000052         005700     02 COMPUTED-X.                                               IF1124.2
   000053         005800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1124.2 IMP
   000054         005900     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1124.2 53
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000                                 PIC -9(9).9(9).                  IF1124.2
   000056         006100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1124.2 53
   000057         006200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1124.2 53
   000058         006300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1124.2 53
   000059         006400     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1124.2 53
   000060         006500         04 COMPUTED-18V0                    PIC -9(18).          IF1124.2
   000061         006600         04 FILLER                           PIC X.               IF1124.2
   000062         006700     03 FILLER PIC X(50) VALUE SPACE.                             IF1124.2 IMP
   000063         006800 01  TEST-CORRECT.                                                IF1124.2
   000064         006900     02 FILLER PIC X(30) VALUE SPACE.                             IF1124.2 IMP
   000065         007000     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1124.2
   000066         007100     02 CORRECT-X.                                                IF1124.2
   000067         007200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1124.2 IMP
   000068         007300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1124.2 67
   000069         007400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1124.2 67
   000070         007500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1124.2 67
   000071         007600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1124.2 67
   000072         007700     03      CR-18V0 REDEFINES CORRECT-A.                         IF1124.2 67
   000073         007800         04 CORRECT-18V0                     PIC -9(18).          IF1124.2
   000074         007900         04 FILLER                           PIC X.               IF1124.2
   000075         008000     03 FILLER PIC X(2) VALUE SPACE.                              IF1124.2 IMP
   000076         008100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1124.2 IMP
   000077         008200 01  CCVS-C-1.                                                    IF1124.2
   000078         008300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1124.2
   000079         008400-    "SS  PARAGRAPH-NAME                                          IF1124.2
   000080         008500-    "       REMARKS".                                            IF1124.2
   000081         008600     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1124.2 IMP
   000082         008700 01  CCVS-C-2.                                                    IF1124.2
   000083         008800     02 FILLER                     PIC X        VALUE SPACE.      IF1124.2 IMP
   000084         008900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1124.2
   000085         009000     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1124.2 IMP
   000086         009100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1124.2
   000087         009200     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1124.2 IMP
   000088         009300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1124.2 IMP
   000089         009400 01  REC-CT                        PIC 99       VALUE ZERO.       IF1124.2 IMP
   000090         009500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1124.2 IMP
   000091         009600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1124.2 IMP
   000092         009700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1124.2 IMP
   000093         009800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1124.2 IMP
   000094         009900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1124.2 IMP
   000095         010000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1124.2 IMP
   000096         010100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1124.2 IMP
   000097         010200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1124.2 IMP
   000098         010300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1124.2 IMP
   000099         010400 01  CCVS-H-1.                                                    IF1124.2
   000100         010500     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1124.2 IMP
   000101         010600     02  FILLER                    PIC X(42)    VALUE             IF1124.2
   000102         010700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1124.2
   000103         010800     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1124.2 IMP
   000104         010900 01  CCVS-H-2A.                                                   IF1124.2
   000105         011000   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1124.2 IMP
   000106         011100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1124.2
   000107         011200   02  FILLER                        PIC XXXX   VALUE             IF1124.2
   000108         011300     "4.2 ".                                                      IF1124.2
   000109         011400   02  FILLER                        PIC X(28)  VALUE             IF1124.2
   000110         011500            " COPY - NOT FOR DISTRIBUTION".                       IF1124.2
   000111         011600   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1124.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700                                                                  IF1124.2
   000113         011800 01  CCVS-H-2B.                                                   IF1124.2
   000114         011900   02  FILLER                        PIC X(15)  VALUE             IF1124.2
   000115         012000            "TEST RESULT OF ".                                    IF1124.2
   000116         012100   02  TEST-ID                       PIC X(9).                    IF1124.2
   000117         012200   02  FILLER                        PIC X(4)   VALUE             IF1124.2
   000118         012300            " IN ".                                               IF1124.2
   000119         012400   02  FILLER                        PIC X(12)  VALUE             IF1124.2
   000120         012500     " HIGH       ".                                              IF1124.2
   000121         012600   02  FILLER                        PIC X(22)  VALUE             IF1124.2
   000122         012700            " LEVEL VALIDATION FOR ".                             IF1124.2
   000123         012800   02  FILLER                        PIC X(58)  VALUE             IF1124.2
   000124         012900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1124.2
   000125         013000 01  CCVS-H-3.                                                    IF1124.2
   000126         013100     02  FILLER                      PIC X(34)  VALUE             IF1124.2
   000127         013200            " FOR OFFICIAL USE ONLY    ".                         IF1124.2
   000128         013300     02  FILLER                      PIC X(58)  VALUE             IF1124.2
   000129         013400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1124.2
   000130         013500     02  FILLER                      PIC X(28)  VALUE             IF1124.2
   000131         013600            "  COPYRIGHT   1985 ".                                IF1124.2
   000132         013700 01  CCVS-E-1.                                                    IF1124.2
   000133         013800     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1124.2 IMP
   000134         013900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1124.2
   000135         014000     02 ID-AGAIN                     PIC X(9).                    IF1124.2
   000136         014100     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1124.2 IMP
   000137         014200 01  CCVS-E-2.                                                    IF1124.2
   000138         014300     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1124.2 IMP
   000139         014400     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1124.2 IMP
   000140         014500     02 CCVS-E-2-2.                                               IF1124.2
   000141         014600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1124.2 IMP
   000142         014700         03 FILLER                   PIC X      VALUE SPACE.      IF1124.2 IMP
   000143         014800         03 ENDER-DESC               PIC X(44)  VALUE             IF1124.2
   000144         014900            "ERRORS ENCOUNTERED".                                 IF1124.2
   000145         015000 01  CCVS-E-3.                                                    IF1124.2
   000146         015100     02  FILLER                      PIC X(22)  VALUE             IF1124.2
   000147         015200            " FOR OFFICIAL USE ONLY".                             IF1124.2
   000148         015300     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1124.2 IMP
   000149         015400     02  FILLER                      PIC X(58)  VALUE             IF1124.2
   000150         015500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1124.2
   000151         015600     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1124.2 IMP
   000152         015700     02 FILLER                       PIC X(15)  VALUE             IF1124.2
   000153         015800             " COPYRIGHT 1985".                                   IF1124.2
   000154         015900 01  CCVS-E-4.                                                    IF1124.2
   000155         016000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1124.2 IMP
   000156         016100     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1124.2
   000157         016200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1124.2 IMP
   000158         016300     02 FILLER                       PIC X(40)  VALUE             IF1124.2
   000159         016400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1124.2
   000160         016500 01  XXINFO.                                                      IF1124.2
   000161         016600     02 FILLER                       PIC X(19)  VALUE             IF1124.2
   000162         016700            "*** INFORMATION ***".                                IF1124.2
   000163         016800     02 INFO-TEXT.                                                IF1124.2
   000164         016900       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1124.2 IMP
   000165         017000       04 XXCOMPUTED                 PIC X(20).                   IF1124.2
   000166         017100       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1124.2 IMP
   000167         017200       04 XXCORRECT                  PIC X(20).                   IF1124.2
   000168         017300     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400 01  HYPHEN-LINE.                                                 IF1124.2
   000170         017500     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1124.2 IMP
   000171         017600     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1124.2
   000172         017700-    "*****************************************".                 IF1124.2
   000173         017800     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1124.2
   000174         017900-    "******************************".                            IF1124.2
   000175         018000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1124.2
   000176         018100     "IF112A".                                                    IF1124.2
   000177         018200 PROCEDURE DIVISION.                                              IF1124.2
   000178         018300 CCVS1 SECTION.                                                   IF1124.2
   000179         018400 OPEN-FILES.                                                      IF1124.2
   000180         018500     OPEN     OUTPUT PRINT-FILE.                                  IF1124.2 22
   000181         018600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1124.2 175 116 175 135
   000182         018700     MOVE    SPACE TO TEST-RESULTS.                               IF1124.2 IMP 36
   000183         018800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1124.2 206 211
   000184         018900     GO TO CCVS1-EXIT.                                            IF1124.2 293
   000185         019000 CLOSE-FILES.                                                     IF1124.2
   000186         019100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1124.2 215 235 22
   000187         019200 TERMINATE-CCVS.                                                  IF1124.2
   000188         019300     STOP     RUN.                                                IF1124.2
   000189         019400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1124.2 40 92
   000190         019500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1124.2 40 93
   000191         019600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1124.2 40 91
   000192         019700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1124.2 40 90
   000193         019800     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1124.2 47
   000194         019900 PRINT-DETAIL.                                                    IF1124.2
   000195         020000     IF REC-CT NOT EQUAL TO ZERO                                  IF1124.2 89 IMP
   000196      1  020100             MOVE "." TO PARDOT-X                                 IF1124.2 44
   000197      1  020200             MOVE REC-CT TO DOTVALUE.                             IF1124.2 89 45
   000198         020300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1124.2 36 23 247
   000199         020400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1124.2 40 247
   000200      1  020500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1124.2 268 282
   000201      1  020600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1124.2 283 292
   000202         020700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1124.2 IMP 40 IMP 52
   000203         020800     MOVE SPACE TO CORRECT-X.                                     IF1124.2 IMP 66
   000204         020900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1124.2 89 IMP IMP 42
   000205         021000     MOVE     SPACE TO RE-MARK.                                   IF1124.2 IMP 47
   000206         021100 HEAD-ROUTINE.                                                    IF1124.2
   000207         021200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1124.2 99 24 247
   000208         021300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1124.2 104 24 247
   000209         021400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1124.2 113 24 247
   000210         021500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1124.2 125 24 247
   000211         021600 COLUMN-NAMES-ROUTINE.                                            IF1124.2
   000212         021700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1124.2 77 24 247
   000213         021800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1124.2 82 24 247
   000214         021900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1124.2 169 24 247
   000215         022000 END-ROUTINE.                                                     IF1124.2
   000216         022100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1124.2 169 24 247
   000217         022200 END-RTN-EXIT.                                                    IF1124.2
   000218         022300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1124.2 132 24 247
   000219         022400 END-ROUTINE-1.                                                   IF1124.2
   000220         022500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1124.2 91 95 92
   000221         022600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1124.2 95 90 95
   000222         022700      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1124.2 93 95
   000223         022800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1124.2 93 155
   000224         022900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1124.2 95 157
   000225         023000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1124.2 154 140
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1124.2 137 24 247
   000227         023200  END-ROUTINE-12.                                                 IF1124.2
   000228         023300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1124.2 143
   000229         023400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1124.2 91 IMP
   000230      1  023500         MOVE "NO " TO ERROR-TOTAL                                IF1124.2 141
   000231         023600         ELSE                                                     IF1124.2
   000232      1  023700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1124.2 91 141
   000233         023800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1124.2 137 24
   000234         023900     PERFORM WRITE-LINE.                                          IF1124.2 247
   000235         024000 END-ROUTINE-13.                                                  IF1124.2
   000236         024100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1124.2 90 IMP
   000237      1  024200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1124.2 141
   000238      1  024300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1124.2 90 141
   000239         024400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1124.2 143
   000240         024500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1124.2 137 24 247
   000241         024600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1124.2 92 IMP
   000242      1  024700          MOVE "NO " TO ERROR-TOTAL                               IF1124.2 141
   000243      1  024800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1124.2 92 141
   000244         024900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1124.2 143
   000245         025000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1124.2 137 24 247
   000246         025100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1124.2 145 24 247
   000247         025200 WRITE-LINE.                                                      IF1124.2
   000248         025300     ADD 1 TO RECORD-COUNT.                                       IF1124.2 97
   000249         025400     IF RECORD-COUNT GREATER 42                                   IF1124.2 97
   000250      1  025500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1124.2 24 96
   000251      1  025600         MOVE SPACE TO DUMMY-RECORD                               IF1124.2 IMP 24
   000252      1  025700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1124.2 24
   000253      1  025800         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1124.2 99 24 263
   000254      1  025900         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1124.2 104 24 263
   000255      1  026000         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1124.2 113 24 263
   000256      1  026100         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1124.2 125 24 263
   000257      1  026200         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1124.2 77 24 263
   000258      1  026300         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1124.2 82 24 263
   000259      1  026400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1124.2 169 24 263
   000260      1  026500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1124.2 96 24
   000261      1  026600         MOVE ZERO TO RECORD-COUNT.                               IF1124.2 IMP 97
   000262         026700     PERFORM WRT-LN.                                              IF1124.2 263
   000263         026800 WRT-LN.                                                          IF1124.2
   000264         026900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1124.2 24
   000265         027000     MOVE SPACE TO DUMMY-RECORD.                                  IF1124.2 IMP 24
   000266         027100 BLANK-LINE-PRINT.                                                IF1124.2
   000267         027200     PERFORM WRT-LN.                                              IF1124.2 263
   000268         027300 FAIL-ROUTINE.                                                    IF1124.2
   000269         027400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1124.2 52 IMP
   000270      1  027500            GO TO FAIL-ROUTINE-WRITE.                             IF1124.2 277
   000271         027600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1124.2 66 IMP 277
   000272         027700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1124.2 98 168
   000273         027800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1124.2 163
   000274         027900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1124.2 160 24 247
   000275         028000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1124.2 IMP 168
   000276         028100     GO TO  FAIL-ROUTINE-EX.                                      IF1124.2 282
   000277         028200 FAIL-ROUTINE-WRITE.                                              IF1124.2
   000278         028300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1124.2 48 23 247
   000279         028400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1124.2 98 76
   000280         028500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1124.2 63 23 247
   000281         028600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1124.2 IMP 76
   000282         028700 FAIL-ROUTINE-EX. EXIT.                                           IF1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800 BAIL-OUT.                                                        IF1124.2
   000284         028900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1124.2 53 IMP 286
   000285         029000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1124.2 67 IMP 292
   000286         029100 BAIL-OUT-WRITE.                                                  IF1124.2
   000287         029200     MOVE CORRECT-A TO XXCORRECT.                                 IF1124.2 67 167
   000288         029300     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1124.2 53 165
   000289         029400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1124.2 98 168
   000290         029500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1124.2 160 24 247
   000291         029600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1124.2 IMP 168
   000292         029700 BAIL-OUT-EX. EXIT.                                               IF1124.2
   000293         029800 CCVS1-EXIT.                                                      IF1124.2
   000294         029900     EXIT.                                                        IF1124.2
   000295         030100*                                                      *          IF1124.2
   000296         030200*    Intrinsic Function Test  IF112A - INTEGER-OF-DATE *          IF1124.2
   000297         030300*                                                      *          IF1124.2
   000298         030500 SECT-IF112A SECTION.                                             IF1124.2
   000299         030600 F-DATEOFINT-INFO.                                                IF1124.2
   000300         030700     MOVE     "See ref. A-45 2.16" TO ANSI-REFERENCE.             IF1124.2 98
   000301         030800     MOVE     "INTEGER-OF-DATE"     TO FEATURE.                   IF1124.2 38
   000302         031000 F-DATEOFINT-01.                                                  IF1124.2
   000303         031100     MOVE ZERO TO WS-INT.                                         IF1124.2 IMP 33
   000304         031200 F-DATEOFINT-TEST-01.                                             IF1124.2
   000305         031300     COMPUTE WS-INT = FUNCTION INTEGER-OF-DATE(16010101).         IF1124.2 33 IFN
   000306         031400     IF WS-INT = 1 THEN                                           IF1124.2 33
   000307      1  031500                        PERFORM PASS                              IF1124.2 190
   000308         031600     ELSE                                                         IF1124.2
   000309      1  031700                        MOVE 1 TO CORRECT-N                       IF1124.2 68
   000310      1  031800                        MOVE WS-INT TO COMPUTED-N                 IF1124.2 33 54
   000311      1  031900                        PERFORM FAIL.                             IF1124.2 191
   000312         032000     GO TO F-DATEOFINT-WRITE-01.                                  IF1124.2 316
   000313         032100 F-DATEOFINT-DELETE-01.                                           IF1124.2
   000314         032200     PERFORM  DE-LETE.                                            IF1124.2 192
   000315         032300     GO TO    F-DATEOFINT-WRITE-01.                               IF1124.2 316
   000316         032400 F-DATEOFINT-WRITE-01.                                            IF1124.2
   000317         032500     MOVE "F-DATEOFINT-01" TO PAR-NAME.                           IF1124.2 42
   000318         032600     PERFORM  PRINT-DETAIL.                                       IF1124.2 194
   000319         032800 F-DATEOFINT-TEST-02.                                             IF1124.2
   000320         032900     EVALUATE FUNCTION INTEGER-OF-DATE(A)                         IF1124.2 IFN 27
   000321         033000     WHEN     400                                                 IF1124.2
   000322      1  033100                    PERFORM PASS                                  IF1124.2 190
   000323      1  033200                    GO TO F-DATEOFINT-WRITE-02.                   IF1124.2 329
   000324         033300     PERFORM FAIL.                                                IF1124.2 191
   000325         033400     GO TO F-DATEOFINT-WRITE-02.                                  IF1124.2 329
   000326         033500 F-DATEOFINT-DELETE-02.                                           IF1124.2
   000327         033600     PERFORM  DE-LETE.                                            IF1124.2 192
   000328         033700     GO TO    F-DATEOFINT-WRITE-02.                               IF1124.2 329
   000329         033800 F-DATEOFINT-WRITE-02.                                            IF1124.2
   000330         033900     MOVE "F-DATEOFINT-02" TO PAR-NAME.                           IF1124.2 42
   000331         034000     PERFORM  PRINT-DETAIL.                                       IF1124.2 194
   000332         034200 F-DATEOFINT-TEST-03.                                             IF1124.2
   000333         034300     IF FUNCTION INTEGER-OF-DATE(IND(1)) = 1 THEN                 IF1124.2 IFN 31
   000334      1  034400                        PERFORM PASS                              IF1124.2 190
   000335         034500     ELSE                                                         IF1124.2
   000336      1  034600                        PERFORM FAIL.                             IF1124.2 191
   000337         034700     GO TO F-DATEOFINT-WRITE-03.                                  IF1124.2 341
   000338         034800 F-DATEOFINT-DELETE-03.                                           IF1124.2
   000339         034900     PERFORM  DE-LETE.                                            IF1124.2 192
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         035000     GO TO    F-DATEOFINT-WRITE-03.                               IF1124.2 341
   000341         035100 F-DATEOFINT-WRITE-03.                                            IF1124.2
   000342         035200     MOVE "F-DATEOFINT-03" TO PAR-NAME.                           IF1124.2 42
   000343         035300     PERFORM  PRINT-DETAIL.                                       IF1124.2 194
   000344         035500 F-DATEOFINT-04.                                                  IF1124.2
   000345         035600     MOVE ZERO TO WS-INT.                                         IF1124.2 IMP 33
   000346         035700 F-DATEOFINT-TEST-04.                                             IF1124.2
   000347         035800     COMPUTE WS-INT = FUNCTION INTEGER-OF-DATE(IND(D)).           IF1124.2 33 IFN 31 28
   000348         035900     IF WS-INT = 406    THEN                                      IF1124.2 33
   000349      1  036000                        PERFORM PASS                              IF1124.2 190
   000350         036100     ELSE                                                         IF1124.2
   000351      1  036200                        MOVE  406    TO CORRECT-N                 IF1124.2 68
   000352      1  036300                        MOVE WS-INT TO COMPUTED-N                 IF1124.2 33 54
   000353      1  036400                        PERFORM FAIL.                             IF1124.2 191
   000354         036500     GO TO F-DATEOFINT-WRITE-04.                                  IF1124.2 358
   000355         036600 F-DATEOFINT-DELETE-04.                                           IF1124.2
   000356         036700     PERFORM  DE-LETE.                                            IF1124.2 192
   000357         036800     GO TO    F-DATEOFINT-WRITE-04.                               IF1124.2 358
   000358         036900 F-DATEOFINT-WRITE-04.                                            IF1124.2
   000359         037000     MOVE "F-DATEOFINT-04" TO PAR-NAME.                           IF1124.2 42
   000360         037100     PERFORM  PRINT-DETAIL.                                       IF1124.2 194
   000361         037300 F-DATEOFINT-05.                                                  IF1124.2
   000362         037400     MOVE ZERO TO WS-INT.                                         IF1124.2 IMP 33
   000363         037500 F-DATEOFINT-TEST-05.                                             IF1124.2
   000364         037600     COMPUTE WS-INT = FUNCTION INTEGER-OF-DATE(16011231).         IF1124.2 33 IFN
   000365         037700     IF WS-INT = 365      THEN                                    IF1124.2 33
   000366      1  037800                        PERFORM PASS                              IF1124.2 190
   000367         037900     ELSE                                                         IF1124.2
   000368      1  038000                        MOVE  365      TO CORRECT-N               IF1124.2 68
   000369      1  038100                        MOVE WS-INT TO COMPUTED-N                 IF1124.2 33 54
   000370      1  038200                        PERFORM FAIL.                             IF1124.2 191
   000371         038300     GO TO F-DATEOFINT-WRITE-05.                                  IF1124.2 375
   000372         038400 F-DATEOFINT-DELETE-05.                                           IF1124.2
   000373         038500     PERFORM  DE-LETE.                                            IF1124.2 192
   000374         038600     GO TO    F-DATEOFINT-WRITE-05.                               IF1124.2 375
   000375         038700 F-DATEOFINT-WRITE-05.                                            IF1124.2
   000376         038800     MOVE "F-DATEOFINT-05" TO PAR-NAME.                           IF1124.2 42
   000377         038900     PERFORM  PRINT-DETAIL.                                       IF1124.2 194
   000378         039100 F-DATEOFINT-06.                                                  IF1124.2
   000379         039200     MOVE ZERO TO WS-INT.                                         IF1124.2 IMP 33
   000380         039300 F-DATEOFINT-TEST-06.                                             IF1124.2
   000381         039400     COMPUTE WS-INT = FUNCTION INTEGER-OF-DATE(A) + 10.           IF1124.2 33 IFN 27
   000382         039500     IF WS-INT = 410 THEN                                         IF1124.2 33
   000383      1  039600                        PERFORM PASS                              IF1124.2 190
   000384         039700     ELSE                                                         IF1124.2
   000385      1  039800                        MOVE  410 TO CORRECT-N                    IF1124.2 68
   000386      1  039900                        MOVE WS-INT TO COMPUTED-N                 IF1124.2 33 54
   000387      1  040000                        PERFORM FAIL.                             IF1124.2 191
   000388         040100     GO TO F-DATEOFINT-WRITE-06.                                  IF1124.2 392
   000389         040200 F-DATEOFINT-DELETE-06.                                           IF1124.2
   000390         040300     PERFORM  DE-LETE.                                            IF1124.2 192
   000391         040400     GO TO    F-DATEOFINT-WRITE-06.                               IF1124.2 392
   000392         040500 F-DATEOFINT-WRITE-06.                                            IF1124.2
   000393         040600     MOVE "F-DATEOFINT-06" TO PAR-NAME.                           IF1124.2 42
   000394         040700     PERFORM  PRINT-DETAIL.                                       IF1124.2 194
   000395         040900 F-DATEOFINT-07.                                                  IF1124.2
   000396         041000     MOVE ZERO TO WS-INT.                                         IF1124.2 IMP 33
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         041100 F-DATEOFINT-TEST-07.                                             IF1124.2
   000398         041200     COMPUTE WS-INT = FUNCTION INTEGER-OF-DATE(A) +               IF1124.2 33 IFN 27
   000399         041300                    FUNCTION INTEGER-OF-DATE(A).                  IF1124.2 IFN 27
   000400         041400     IF WS-INT = 800 THEN                                         IF1124.2 33
   000401      1  041500                        PERFORM PASS                              IF1124.2 190
   000402         041600     ELSE                                                         IF1124.2
   000403      1  041700                        MOVE  800 TO CORRECT-N                    IF1124.2 68
   000404      1  041800                        MOVE WS-INT TO COMPUTED-N                 IF1124.2 33 54
   000405      1  041900                        PERFORM FAIL.                             IF1124.2 191
   000406         042000     GO TO F-DATEOFINT-WRITE-07.                                  IF1124.2 410
   000407         042100 F-DATEOFINT-DELETE-07.                                           IF1124.2
   000408         042200     PERFORM  DE-LETE.                                            IF1124.2 192
   000409         042300     GO TO    F-DATEOFINT-WRITE-07.                               IF1124.2 410
   000410         042400 F-DATEOFINT-WRITE-07.                                            IF1124.2
   000411         042500     MOVE "F-DATEOFINT-07" TO PAR-NAME.                           IF1124.2 42
   000412         042600     PERFORM  PRINT-DETAIL.                                       IF1124.2 194
   000413         042700                                                                  IF1124.2
   000414         042900                                                                  IF1124.2
   000415         043000 F-DATEOFINT-10.                                                  IF1124.2
   000416         043100     MOVE 16010101 TO ARG1.                                       IF1124.2 29
   000417         043200     PERFORM F-DATEOFINT-TEST-10                                  IF1124.2 425
   000418         043300             UNTIL FUNCTION INTEGER-OF-DATE(ARG1) > 10.           IF1124.2 IFN 29
   000419         043400     IF ARG1 = 16010111 THEN                                      IF1124.2 29
   000420      1  043500                            PERFORM PASS                          IF1124.2 190
   000421         043600     ELSE                                                         IF1124.2
   000422      1  043700                            PERFORM FAIL.                         IF1124.2 191
   000423         043800     GO TO F-DATEOFINT-WRITE-10.                                  IF1124.2 431
   000424         043900*                                                                 IF1124.2
   000425         044000 F-DATEOFINT-TEST-10.                                             IF1124.2
   000426         044100     COMPUTE ARG1 = ARG1 + 1.                                     IF1124.2 29 29
   000427         044200*                                                                 IF1124.2
   000428         044300 F-DATEOFINT-DELETE-10.                                           IF1124.2
   000429         044400     PERFORM  DE-LETE.                                            IF1124.2 192
   000430         044500     GO TO    F-DATEOFINT-WRITE-10.                               IF1124.2 431
   000431         044600 F-DATEOFINT-WRITE-10.                                            IF1124.2
   000432         044700     MOVE "F-DATEOFINT-10" TO PAR-NAME.                           IF1124.2 42
   000433         044800     PERFORM  PRINT-DETAIL.                                       IF1124.2 194
   000434         045000 CCVS-EXIT SECTION.                                               IF1124.2
   000435         045100 CCVS-999999.                                                     IF1124.2
   000436         045200     GO TO CLOSE-FILES.                                           IF1124.2 185
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page    11
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  320 381 398 399
       98   ANSI-REFERENCE . . . . . . . .  272 279 289 M300
       29   ARG1 . . . . . . . . . . . . .  M416 418 419 M426 426
       30   ARR
       77   CCVS-C-1 . . . . . . . . . . .  212 257
       82   CCVS-C-2 . . . . . . . . . . .  213 258
      132   CCVS-E-1 . . . . . . . . . . .  218
      137   CCVS-E-2 . . . . . . . . . . .  226 233 240 245
      140   CCVS-E-2-2 . . . . . . . . . .  M225
      145   CCVS-E-3 . . . . . . . . . . .  246
      154   CCVS-E-4 . . . . . . . . . . .  225
      155   CCVS-E-4-1 . . . . . . . . . .  M223
      157   CCVS-E-4-2 . . . . . . . . . .  M224
       99   CCVS-H-1 . . . . . . . . . . .  207 253
      104   CCVS-H-2A. . . . . . . . . . .  208 254
      113   CCVS-H-2B. . . . . . . . . . .  209 255
      125   CCVS-H-3 . . . . . . . . . . .  210 256
      175   CCVS-PGM-ID. . . . . . . . . .  181 181
       59   CM-18V0
       53   COMPUTED-A . . . . . . . . . .  54 56 57 58 59 284 288
       54   COMPUTED-N . . . . . . . . . .  M310 M352 M369 M386 M404
       52   COMPUTED-X . . . . . . . . . .  M202 269
       56   COMPUTED-0V18
       58   COMPUTED-14V4
       60   COMPUTED-18V0
       57   COMPUTED-4V14
       76   COR-ANSI-REFERENCE . . . . . .  M279 M281
       67   CORRECT-A. . . . . . . . . . .  68 69 70 71 72 285 287
       68   CORRECT-N. . . . . . . . . . .  M309 M351 M368 M385 M403
       66   CORRECT-X. . . . . . . . . . .  M203 271
       69   CORRECT-0V18
       71   CORRECT-14V4
       73   CORRECT-18V0
       70   CORRECT-4V14
       72   CR-18V0
       28   D. . . . . . . . . . . . . . .  347
       90   DELETE-COUNTER . . . . . . . .  M192 221 236 238
       45   DOTVALUE . . . . . . . . . . .  M197
       96   DUMMY-HOLD . . . . . . . . . .  M250 260
       24   DUMMY-RECORD . . . . . . . . .  M207 M208 M209 M210 M212 M213 M214 M216 M218 M226 M233 M240 M245 M246 250 M251
                                            252 M253 M254 M255 M256 M257 M258 M259 M260 264 M265 M274 M290
      143   ENDER-DESC . . . . . . . . . .  M228 M239 M244
       91   ERROR-COUNTER. . . . . . . . .  M191 220 229 232
       95   ERROR-HOLD . . . . . . . . . .  M220 M221 M221 M222 224
      141   ERROR-TOTAL. . . . . . . . . .  M230 M232 M237 M238 M242 M243
       38   FEATURE. . . . . . . . . . . .  M301
      169   HYPHEN-LINE. . . . . . . . . .  214 216 259
      135   ID-AGAIN . . . . . . . . . . .  M181
       31   IND. . . . . . . . . . . . . .  333 347
      168   INF-ANSI-REFERENCE . . . . . .  M272 M275 M289 M291
      163   INFO-TEXT. . . . . . . . . . .  M273
       92   INSPECT-COUNTER. . . . . . . .  M189 220 241 243
       40   P-OR-F . . . . . . . . . . . .  M189 M190 M191 M192 199 M202
       42   PAR-NAME . . . . . . . . . . .  M204 M317 M330 M342 M359 M376 M393 M411 M432
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page    12
0 Defined   Cross-reference of data names   References

0      44   PARDOT-X . . . . . . . . . . .  M196
       93   PASS-COUNTER . . . . . . . . .  M190 222 223
       22   PRINT-FILE . . . . . . . . . .  18 180 186
       23   PRINT-REC. . . . . . . . . . .  M198 M278 M280
       47   RE-MARK. . . . . . . . . . . .  M193 M205
       89   REC-CT . . . . . . . . . . . .  195 197 204
       88   REC-SKL-SUB
       97   RECORD-COUNT . . . . . . . . .  M248 249 M261
       32   TEMP
       48   TEST-COMPUTED. . . . . . . . .  278
       63   TEST-CORRECT . . . . . . . . .  280
      116   TEST-ID. . . . . . . . . . . .  M181
       36   TEST-RESULTS . . . . . . . . .  M182 198
       94   TOTAL-ERROR
       33   WS-INT . . . . . . . . . . . .  M303 M305 306 310 M345 M347 348 352 M362 M364 365 369 M379 M381 382 386 M396
                                            M398 400 404
      165   XXCOMPUTED . . . . . . . . . .  M288
      167   XXCORRECT. . . . . . . . . . .  M287
      160   XXINFO . . . . . . . . . . . .  274 290
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page    13
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

      283   BAIL-OUT . . . . . . . . . . .  P201
      292   BAIL-OUT-EX. . . . . . . . . .  E201 G285
      286   BAIL-OUT-WRITE . . . . . . . .  G284
      266   BLANK-LINE-PRINT
      434   CCVS-EXIT
      435   CCVS-999999
      178   CCVS1
      293   CCVS1-EXIT . . . . . . . . . .  G184
      185   CLOSE-FILES. . . . . . . . . .  G436
      211   COLUMN-NAMES-ROUTINE . . . . .  E183
      192   DE-LETE. . . . . . . . . . . .  P314 P327 P339 P356 P373 P390 P408 P429
      215   END-ROUTINE. . . . . . . . . .  P186
      219   END-ROUTINE-1
      227   END-ROUTINE-12
      235   END-ROUTINE-13 . . . . . . . .  E186
      217   END-RTN-EXIT
      313   F-DATEOFINT-DELETE-01
      326   F-DATEOFINT-DELETE-02
      338   F-DATEOFINT-DELETE-03
      355   F-DATEOFINT-DELETE-04
      372   F-DATEOFINT-DELETE-05
      389   F-DATEOFINT-DELETE-06
      407   F-DATEOFINT-DELETE-07
      428   F-DATEOFINT-DELETE-10
      299   F-DATEOFINT-INFO
      304   F-DATEOFINT-TEST-01
      319   F-DATEOFINT-TEST-02
      332   F-DATEOFINT-TEST-03
      346   F-DATEOFINT-TEST-04
      363   F-DATEOFINT-TEST-05
      380   F-DATEOFINT-TEST-06
      397   F-DATEOFINT-TEST-07
      425   F-DATEOFINT-TEST-10. . . . . .  P417
      316   F-DATEOFINT-WRITE-01 . . . . .  G312 G315
      329   F-DATEOFINT-WRITE-02 . . . . .  G323 G325 G328
      341   F-DATEOFINT-WRITE-03 . . . . .  G337 G340
      358   F-DATEOFINT-WRITE-04 . . . . .  G354 G357
      375   F-DATEOFINT-WRITE-05 . . . . .  G371 G374
      392   F-DATEOFINT-WRITE-06 . . . . .  G388 G391
      410   F-DATEOFINT-WRITE-07 . . . . .  G406 G409
      431   F-DATEOFINT-WRITE-10 . . . . .  G423 G430
      302   F-DATEOFINT-01
      344   F-DATEOFINT-04
      361   F-DATEOFINT-05
      378   F-DATEOFINT-06
      395   F-DATEOFINT-07
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page    14
0 Defined   Cross-reference of procedures   References

0     415   F-DATEOFINT-10
      191   FAIL . . . . . . . . . . . . .  P311 P324 P336 P353 P370 P387 P405 P422
      268   FAIL-ROUTINE . . . . . . . . .  P200
      282   FAIL-ROUTINE-EX. . . . . . . .  E200 G276
      277   FAIL-ROUTINE-WRITE . . . . . .  G270 G271
      206   HEAD-ROUTINE . . . . . . . . .  P183
      189   INSPT
      179   OPEN-FILES
      190   PASS . . . . . . . . . . . . .  P307 P322 P334 P349 P366 P383 P401 P420
      194   PRINT-DETAIL . . . . . . . . .  P318 P331 P343 P360 P377 P394 P412 P433
      298   SECT-IF112A
      187   TERMINATE-CCVS
      247   WRITE-LINE . . . . . . . . . .  P198 P199 P207 P208 P209 P210 P212 P213 P214 P216 P218 P226 P234 P240 P245 P246
                                            P274 P278 P280 P290
      263   WRT-LN . . . . . . . . . . . .  P253 P254 P255 P256 P257 P258 P259 P262 P267
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page    15
0 Defined   Cross-reference of programs     References

        3   IF112A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF112A    Date 06/04/2022  Time 11:57:17   Page    16
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF112A:
 *    Source records = 436
 *    Data Division statements = 70
 *    Procedure Division statements = 225
 *    Generated COBOL statements = 0
 *    Program complexity factor = 233
0End of compilation 1,  program IF112A,  highest severity 0.
0Return code 0
