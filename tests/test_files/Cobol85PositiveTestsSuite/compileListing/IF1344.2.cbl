1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:47   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:47   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1344.2
   000002         000200 PROGRAM-ID.                                                      IF1344.2
   000003         000300     IF134A.                                                      IF1344.2
   000004         000400                                                                  IF1344.2
   000005         000600*                                                         *       IF1344.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1344.2
   000007         000800* It contains tests for the Intrinsic Function REVERSE.   *       IF1344.2
   000008         000900*                                                         *       IF1344.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1344.2
   000010         001200 CONFIGURATION SECTION.                                           IF1344.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1344.2
   000012         001400     XXXXX082.                                                    IF1344.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1344.2
   000014         001600     XXXXX083.                                                    IF1344.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1344.2
   000016         001800 FILE-CONTROL.                                                    IF1344.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1344.2 21
   000018         002000     XXXXX055.                                                    IF1344.2
   000019         002100 DATA DIVISION.                                                   IF1344.2
   000020         002200 FILE SECTION.                                                    IF1344.2
   000021         002300 FD  PRINT-FILE.                                                  IF1344.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1344.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1344.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1344.2
   000025         002800* Variables specific to the Intrinsic Function Test IF134A*       IF1344.2
   000026         003000 01  A                   PIC A(10)           VALUE "tumble".      IF1344.2
   000027         003100 01  B                   PIC A(10)           VALUE "WEED".        IF1344.2
   000028         003200 01  C                   PIC X(10)           VALUE "Was".         IF1344.2
   000029         003300 01  D                   PIC X(10)           VALUE "4".           IF1344.2
   000030         003400 01  E                   PIC X(10)           VALUE "And4".        IF1344.2
   000031         003500 01  TEMP1               PIC X(7)            VALUE "giZZard".     IF1344.2
   000032         003600 01  TEMP                PIC S9(10).                              IF1344.2
   000033         003700 01  WS-ANUM          PIC X(10).                                  IF1344.2
   000034         003800*                                                                 IF1344.2
   000035         004000*                                                                 IF1344.2
   000036         004100 01  TEST-RESULTS.                                                IF1344.2
   000037         004200     02 FILLER                   PIC X      VALUE SPACE.          IF1344.2 IMP
   000038         004300     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1344.2 IMP
   000039         004400     02 FILLER                   PIC X      VALUE SPACE.          IF1344.2 IMP
   000040         004500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1344.2 IMP
   000041         004600     02 FILLER                   PIC X      VALUE SPACE.          IF1344.2 IMP
   000042         004700     02  PAR-NAME.                                                IF1344.2
   000043         004800       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1344.2 IMP
   000044         004900       03  PARDOT-X              PIC X      VALUE SPACE.          IF1344.2 IMP
   000045         005000       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1344.2 IMP
   000046         005100     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1344.2 IMP
   000047         005200     02 RE-MARK                  PIC X(61).                       IF1344.2
   000048         005300 01  TEST-COMPUTED.                                               IF1344.2
   000049         005400     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1344.2 IMP
   000050         005500     02 FILLER                   PIC X(17)  VALUE                 IF1344.2
   000051         005600            "       COMPUTED=".                                   IF1344.2
   000052         005700     02 COMPUTED-X.                                               IF1344.2
   000053         005800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1344.2 IMP
   000054         005900     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1344.2 53
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000                                 PIC -9(9).9(9).                  IF1344.2
   000056         006100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1344.2 53
   000057         006200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1344.2 53
   000058         006300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1344.2 53
   000059         006400     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1344.2 53
   000060         006500         04 COMPUTED-18V0                    PIC -9(18).          IF1344.2
   000061         006600         04 FILLER                           PIC X.               IF1344.2
   000062         006700     03 FILLER PIC X(50) VALUE SPACE.                             IF1344.2 IMP
   000063         006800 01  TEST-CORRECT.                                                IF1344.2
   000064         006900     02 FILLER PIC X(30) VALUE SPACE.                             IF1344.2 IMP
   000065         007000     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1344.2
   000066         007100     02 CORRECT-X.                                                IF1344.2
   000067         007200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1344.2 IMP
   000068         007300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1344.2 67
   000069         007400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1344.2 67
   000070         007500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1344.2 67
   000071         007600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1344.2 67
   000072         007700     03      CR-18V0 REDEFINES CORRECT-A.                         IF1344.2 67
   000073         007800         04 CORRECT-18V0                     PIC -9(18).          IF1344.2
   000074         007900         04 FILLER                           PIC X.               IF1344.2
   000075         008000     03 FILLER PIC X(2) VALUE SPACE.                              IF1344.2 IMP
   000076         008100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1344.2 IMP
   000077         008200 01  CCVS-C-1.                                                    IF1344.2
   000078         008300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1344.2
   000079         008400-    "SS  PARAGRAPH-NAME                                          IF1344.2
   000080         008500-    "       REMARKS".                                            IF1344.2
   000081         008600     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1344.2 IMP
   000082         008700 01  CCVS-C-2.                                                    IF1344.2
   000083         008800     02 FILLER                     PIC X        VALUE SPACE.      IF1344.2 IMP
   000084         008900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1344.2
   000085         009000     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1344.2 IMP
   000086         009100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1344.2
   000087         009200     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1344.2 IMP
   000088         009300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1344.2 IMP
   000089         009400 01  REC-CT                        PIC 99       VALUE ZERO.       IF1344.2 IMP
   000090         009500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1344.2 IMP
   000091         009600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1344.2 IMP
   000092         009700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1344.2 IMP
   000093         009800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1344.2 IMP
   000094         009900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1344.2 IMP
   000095         010000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1344.2 IMP
   000096         010100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1344.2 IMP
   000097         010200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1344.2 IMP
   000098         010300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1344.2 IMP
   000099         010400 01  CCVS-H-1.                                                    IF1344.2
   000100         010500     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1344.2 IMP
   000101         010600     02  FILLER                    PIC X(42)    VALUE             IF1344.2
   000102         010700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1344.2
   000103         010800     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1344.2 IMP
   000104         010900 01  CCVS-H-2A.                                                   IF1344.2
   000105         011000   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1344.2 IMP
   000106         011100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1344.2
   000107         011200   02  FILLER                        PIC XXXX   VALUE             IF1344.2
   000108         011300     "4.2 ".                                                      IF1344.2
   000109         011400   02  FILLER                        PIC X(28)  VALUE             IF1344.2
   000110         011500            " COPY - NOT FOR DISTRIBUTION".                       IF1344.2
   000111         011600   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1344.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700                                                                  IF1344.2
   000113         011800 01  CCVS-H-2B.                                                   IF1344.2
   000114         011900   02  FILLER                        PIC X(15)  VALUE             IF1344.2
   000115         012000            "TEST RESULT OF ".                                    IF1344.2
   000116         012100   02  TEST-ID                       PIC X(9).                    IF1344.2
   000117         012200   02  FILLER                        PIC X(4)   VALUE             IF1344.2
   000118         012300            " IN ".                                               IF1344.2
   000119         012400   02  FILLER                        PIC X(12)  VALUE             IF1344.2
   000120         012500     " HIGH       ".                                              IF1344.2
   000121         012600   02  FILLER                        PIC X(22)  VALUE             IF1344.2
   000122         012700            " LEVEL VALIDATION FOR ".                             IF1344.2
   000123         012800   02  FILLER                        PIC X(58)  VALUE             IF1344.2
   000124         012900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1344.2
   000125         013000 01  CCVS-H-3.                                                    IF1344.2
   000126         013100     02  FILLER                      PIC X(34)  VALUE             IF1344.2
   000127         013200            " FOR OFFICIAL USE ONLY    ".                         IF1344.2
   000128         013300     02  FILLER                      PIC X(58)  VALUE             IF1344.2
   000129         013400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1344.2
   000130         013500     02  FILLER                      PIC X(28)  VALUE             IF1344.2
   000131         013600            "  COPYRIGHT   1985 ".                                IF1344.2
   000132         013700 01  CCVS-E-1.                                                    IF1344.2
   000133         013800     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1344.2 IMP
   000134         013900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1344.2
   000135         014000     02 ID-AGAIN                     PIC X(9).                    IF1344.2
   000136         014100     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1344.2 IMP
   000137         014200 01  CCVS-E-2.                                                    IF1344.2
   000138         014300     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1344.2 IMP
   000139         014400     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1344.2 IMP
   000140         014500     02 CCVS-E-2-2.                                               IF1344.2
   000141         014600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1344.2 IMP
   000142         014700         03 FILLER                   PIC X      VALUE SPACE.      IF1344.2 IMP
   000143         014800         03 ENDER-DESC               PIC X(44)  VALUE             IF1344.2
   000144         014900            "ERRORS ENCOUNTERED".                                 IF1344.2
   000145         015000 01  CCVS-E-3.                                                    IF1344.2
   000146         015100     02  FILLER                      PIC X(22)  VALUE             IF1344.2
   000147         015200            " FOR OFFICIAL USE ONLY".                             IF1344.2
   000148         015300     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1344.2 IMP
   000149         015400     02  FILLER                      PIC X(58)  VALUE             IF1344.2
   000150         015500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1344.2
   000151         015600     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1344.2 IMP
   000152         015700     02 FILLER                       PIC X(15)  VALUE             IF1344.2
   000153         015800             " COPYRIGHT 1985".                                   IF1344.2
   000154         015900 01  CCVS-E-4.                                                    IF1344.2
   000155         016000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1344.2 IMP
   000156         016100     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1344.2
   000157         016200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1344.2 IMP
   000158         016300     02 FILLER                       PIC X(40)  VALUE             IF1344.2
   000159         016400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1344.2
   000160         016500 01  XXINFO.                                                      IF1344.2
   000161         016600     02 FILLER                       PIC X(19)  VALUE             IF1344.2
   000162         016700            "*** INFORMATION ***".                                IF1344.2
   000163         016800     02 INFO-TEXT.                                                IF1344.2
   000164         016900       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1344.2 IMP
   000165         017000       04 XXCOMPUTED                 PIC X(20).                   IF1344.2
   000166         017100       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1344.2 IMP
   000167         017200       04 XXCORRECT                  PIC X(20).                   IF1344.2
   000168         017300     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400 01  HYPHEN-LINE.                                                 IF1344.2
   000170         017500     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1344.2 IMP
   000171         017600     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1344.2
   000172         017700-    "*****************************************".                 IF1344.2
   000173         017800     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1344.2
   000174         017900-    "******************************".                            IF1344.2
   000175         018000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1344.2
   000176         018100     "IF134A".                                                    IF1344.2
   000177         018200 PROCEDURE DIVISION.                                              IF1344.2
   000178         018300 CCVS1 SECTION.                                                   IF1344.2
   000179         018400 OPEN-FILES.                                                      IF1344.2
   000180         018500     OPEN     OUTPUT PRINT-FILE.                                  IF1344.2 21
   000181         018600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1344.2 175 116 175 135
   000182         018700     MOVE    SPACE TO TEST-RESULTS.                               IF1344.2 IMP 36
   000183         018800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1344.2 206 211
   000184         018900     GO TO CCVS1-EXIT.                                            IF1344.2 293
   000185         019000 CLOSE-FILES.                                                     IF1344.2
   000186         019100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1344.2 215 235 21
   000187         019200 TERMINATE-CCVS.                                                  IF1344.2
   000188         019300     STOP     RUN.                                                IF1344.2
   000189         019400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1344.2 40 92
   000190         019500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1344.2 40 93
   000191         019600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1344.2 40 91
   000192         019700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1344.2 40 90
   000193         019800     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1344.2 47
   000194         019900 PRINT-DETAIL.                                                    IF1344.2
   000195         020000     IF REC-CT NOT EQUAL TO ZERO                                  IF1344.2 89 IMP
   000196      1  020100             MOVE "." TO PARDOT-X                                 IF1344.2 44
   000197      1  020200             MOVE REC-CT TO DOTVALUE.                             IF1344.2 89 45
   000198         020300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1344.2 36 22 247
   000199         020400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1344.2 40 247
   000200      1  020500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1344.2 268 282
   000201      1  020600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1344.2 283 292
   000202         020700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1344.2 IMP 40 IMP 52
   000203         020800     MOVE SPACE TO CORRECT-X.                                     IF1344.2 IMP 66
   000204         020900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1344.2 89 IMP IMP 42
   000205         021000     MOVE     SPACE TO RE-MARK.                                   IF1344.2 IMP 47
   000206         021100 HEAD-ROUTINE.                                                    IF1344.2
   000207         021200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1344.2 99 23 247
   000208         021300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1344.2 104 23 247
   000209         021400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1344.2 113 23 247
   000210         021500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1344.2 125 23 247
   000211         021600 COLUMN-NAMES-ROUTINE.                                            IF1344.2
   000212         021700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1344.2 77 23 247
   000213         021800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1344.2 82 23 247
   000214         021900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1344.2 169 23 247
   000215         022000 END-ROUTINE.                                                     IF1344.2
   000216         022100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1344.2 169 23 247
   000217         022200 END-RTN-EXIT.                                                    IF1344.2
   000218         022300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1344.2 132 23 247
   000219         022400 END-ROUTINE-1.                                                   IF1344.2
   000220         022500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1344.2 91 95 92
   000221         022600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1344.2 95 90 95
   000222         022700      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1344.2 93 95
   000223         022800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1344.2 93 155
   000224         022900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1344.2 95 157
   000225         023000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1344.2 154 140
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1344.2 137 23 247
   000227         023200  END-ROUTINE-12.                                                 IF1344.2
   000228         023300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1344.2 143
   000229         023400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1344.2 91 IMP
   000230      1  023500         MOVE "NO " TO ERROR-TOTAL                                IF1344.2 141
   000231         023600         ELSE                                                     IF1344.2
   000232      1  023700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1344.2 91 141
   000233         023800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1344.2 137 23
   000234         023900     PERFORM WRITE-LINE.                                          IF1344.2 247
   000235         024000 END-ROUTINE-13.                                                  IF1344.2
   000236         024100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1344.2 90 IMP
   000237      1  024200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1344.2 141
   000238      1  024300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1344.2 90 141
   000239         024400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1344.2 143
   000240         024500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1344.2 137 23 247
   000241         024600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1344.2 92 IMP
   000242      1  024700          MOVE "NO " TO ERROR-TOTAL                               IF1344.2 141
   000243      1  024800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1344.2 92 141
   000244         024900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1344.2 143
   000245         025000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1344.2 137 23 247
   000246         025100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1344.2 145 23 247
   000247         025200 WRITE-LINE.                                                      IF1344.2
   000248         025300     ADD 1 TO RECORD-COUNT.                                       IF1344.2 97
   000249         025400     IF RECORD-COUNT GREATER 42                                   IF1344.2 97
   000250      1  025500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1344.2 23 96
   000251      1  025600         MOVE SPACE TO DUMMY-RECORD                               IF1344.2 IMP 23
   000252      1  025700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1344.2 23
   000253      1  025800         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1344.2 99 23 263
   000254      1  025900         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1344.2 104 23 263
   000255      1  026000         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1344.2 113 23 263
   000256      1  026100         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1344.2 125 23 263
   000257      1  026200         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1344.2 77 23 263
   000258      1  026300         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1344.2 82 23 263
   000259      1  026400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1344.2 169 23 263
   000260      1  026500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1344.2 96 23
   000261      1  026600         MOVE ZERO TO RECORD-COUNT.                               IF1344.2 IMP 97
   000262         026700     PERFORM WRT-LN.                                              IF1344.2 263
   000263         026800 WRT-LN.                                                          IF1344.2
   000264         026900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1344.2 23
   000265         027000     MOVE SPACE TO DUMMY-RECORD.                                  IF1344.2 IMP 23
   000266         027100 BLANK-LINE-PRINT.                                                IF1344.2
   000267         027200     PERFORM WRT-LN.                                              IF1344.2 263
   000268         027300 FAIL-ROUTINE.                                                    IF1344.2
   000269         027400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1344.2 52 IMP
   000270      1  027500            GO TO FAIL-ROUTINE-WRITE.                             IF1344.2 277
   000271         027600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1344.2 66 IMP 277
   000272         027700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1344.2 98 168
   000273         027800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1344.2 163
   000274         027900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1344.2 160 23 247
   000275         028000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1344.2 IMP 168
   000276         028100     GO TO  FAIL-ROUTINE-EX.                                      IF1344.2 282
   000277         028200 FAIL-ROUTINE-WRITE.                                              IF1344.2
   000278         028300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1344.2 48 22 247
   000279         028400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1344.2 98 76
   000280         028500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1344.2 63 22 247
   000281         028600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1344.2 IMP 76
   000282         028700 FAIL-ROUTINE-EX. EXIT.                                           IF1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800 BAIL-OUT.                                                        IF1344.2
   000284         028900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1344.2 53 IMP 286
   000285         029000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1344.2 67 IMP 292
   000286         029100 BAIL-OUT-WRITE.                                                  IF1344.2
   000287         029200     MOVE CORRECT-A TO XXCORRECT.                                 IF1344.2 67 167
   000288         029300     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1344.2 53 165
   000289         029400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1344.2 98 168
   000290         029500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1344.2 160 23 247
   000291         029600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1344.2 IMP 168
   000292         029700 BAIL-OUT-EX. EXIT.                                               IF1344.2
   000293         029800 CCVS1-EXIT.                                                      IF1344.2
   000294         029900     EXIT.                                                        IF1344.2
   000295         030100*                                                      *          IF1344.2
   000296         030200*    Intrinsic Function Tests         IF134A - REVERSE *          IF1344.2
   000297         030300*                                                      *          IF1344.2
   000298         030500 SECT-IF134A SECTION.                                             IF1344.2
   000299         030600 F-REVERSE-INFO.                                                  IF1344.2
   000300         030700     MOVE     "See ref. A-67 2.38" TO ANSI-REFERENCE.             IF1344.2 98
   000301         030800     MOVE     "REVERSE Function"     TO FEATURE.                  IF1344.2 38
   000302         031000 F-REVERSE-01.                                                    IF1344.2
   000303         031100     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000304         031200 F-REVERSE-TEST-01.                                               IF1344.2
   000305         031300     MOVE FUNCTION REVERSE("figure") TO WS-ANUM.                  IF1344.2 IFN 33
   000306         031400     IF WS-ANUM = "erugif" THEN                                   IF1344.2 33
   000307      1  031500                    PERFORM PASS                                  IF1344.2 190
   000308         031600     ELSE                                                         IF1344.2
   000309      1  031700                    MOVE "erugif"  TO CORRECT-A                   IF1344.2 67
   000310      1  031800                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000311      1  031900                    PERFORM FAIL.                                 IF1344.2 191
   000312         032000     GO TO F-REVERSE-WRITE-01.                                    IF1344.2 316
   000313         032100 F-REVERSE-DELETE-01.                                             IF1344.2
   000314         032200     PERFORM  DE-LETE.                                            IF1344.2 192
   000315         032300     GO TO    F-REVERSE-WRITE-01.                                 IF1344.2 316
   000316         032400 F-REVERSE-WRITE-01.                                              IF1344.2
   000317         032500     MOVE "F-REVERSE-01" TO PAR-NAME.                             IF1344.2 42
   000318         032600     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000319         032800 F-REVERSE-02.                                                    IF1344.2
   000320         032900     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000321         033000 F-REVERSE-TEST-02.                                               IF1344.2
   000322         033100     IF FUNCTION REVERSE("CAPS") = "SPAC" THEN                    IF1344.2 IFN
   000323      1  033200                    PERFORM PASS                                  IF1344.2 190
   000324         033300     ELSE                                                         IF1344.2
   000325      1  033400                    MOVE "SPAC"  TO CORRECT-A                     IF1344.2 67
   000326      1  033500                    PERFORM FAIL.                                 IF1344.2 191
   000327         033600     GO TO F-REVERSE-WRITE-02.                                    IF1344.2 331
   000328         033700 F-REVERSE-DELETE-02.                                             IF1344.2
   000329         033800     PERFORM  DE-LETE.                                            IF1344.2 192
   000330         033900     GO TO    F-REVERSE-WRITE-02.                                 IF1344.2 331
   000331         034000 F-REVERSE-WRITE-02.                                              IF1344.2
   000332         034100     MOVE "F-REVERSE-02" TO PAR-NAME.                             IF1344.2 42
   000333         034200     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000334         034400 F-REVERSE-03.                                                    IF1344.2
   000335         034500     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000336         034600 F-REVERSE-TEST-03.                                               IF1344.2
   000337         034700     MOVE FUNCTION REVERSE("highnLOW") TO WS-ANUM.                IF1344.2 IFN 33
   000338         034800     IF WS-ANUM = "WOLnhgih" THEN                                 IF1344.2 33
   000339      1  034900                    PERFORM PASS                                  IF1344.2 190
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         035000     ELSE                                                         IF1344.2
   000341      1  035100                    MOVE "WOLnhgih"  TO CORRECT-A                 IF1344.2 67
   000342      1  035200                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000343      1  035300                    PERFORM FAIL.                                 IF1344.2 191
   000344         035400     GO TO F-REVERSE-WRITE-03.                                    IF1344.2 348
   000345         035500 F-REVERSE-DELETE-03.                                             IF1344.2
   000346         035600     PERFORM  DE-LETE.                                            IF1344.2 192
   000347         035700     GO TO    F-REVERSE-WRITE-03.                                 IF1344.2 348
   000348         035800 F-REVERSE-WRITE-03.                                              IF1344.2
   000349         035900     MOVE "F-REVERSE-03" TO PAR-NAME.                             IF1344.2 42
   000350         036000     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000351         036200 F-REVERSE-04.                                                    IF1344.2
   000352         036300     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000353         036400 F-REVERSE-TEST-04.                                               IF1344.2
   000354         036500     MOVE FUNCTION REVERSE("95") TO WS-ANUM.                      IF1344.2 IFN 33
   000355         036600     IF WS-ANUM = "59" THEN                                       IF1344.2 33
   000356      1  036700                    PERFORM PASS                                  IF1344.2 190
   000357         036800     ELSE                                                         IF1344.2
   000358      1  036900                    MOVE "59"  TO CORRECT-A                       IF1344.2 67
   000359      1  037000                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000360      1  037100                    PERFORM FAIL.                                 IF1344.2 191
   000361         037200     GO TO F-REVERSE-WRITE-04.                                    IF1344.2 365
   000362         037300 F-REVERSE-DELETE-04.                                             IF1344.2
   000363         037400     PERFORM  DE-LETE.                                            IF1344.2 192
   000364         037500     GO TO    F-REVERSE-WRITE-04.                                 IF1344.2 365
   000365         037600 F-REVERSE-WRITE-04.                                              IF1344.2
   000366         037700     MOVE "F-REVERSE-04" TO PAR-NAME.                             IF1344.2 42
   000367         037800     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000368         038000 F-REVERSE-05.                                                    IF1344.2
   000369         038100     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000370         038200 F-REVERSE-TEST-05.                                               IF1344.2
   000371         038300     MOVE FUNCTION REVERSE("8isaNUMBER") TO WS-ANUM.              IF1344.2 IFN 33
   000372         038400     IF WS-ANUM = "REBMUNasi8" THEN                               IF1344.2 33
   000373      1  038500                    PERFORM PASS                                  IF1344.2 190
   000374         038600     ELSE                                                         IF1344.2
   000375      1  038700                    MOVE "REBMUNasi8"  TO CORRECT-A               IF1344.2 67
   000376      1  038800                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000377      1  038900                    PERFORM FAIL.                                 IF1344.2 191
   000378         039000     GO TO F-REVERSE-WRITE-05.                                    IF1344.2 382
   000379         039100 F-REVERSE-DELETE-05.                                             IF1344.2
   000380         039200     PERFORM  DE-LETE.                                            IF1344.2 192
   000381         039300     GO TO    F-REVERSE-WRITE-05.                                 IF1344.2 382
   000382         039400 F-REVERSE-WRITE-05.                                              IF1344.2
   000383         039500     MOVE "F-REVERSE-05" TO PAR-NAME.                             IF1344.2 42
   000384         039600     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000385         039800 F-REVERSE-06.                                                    IF1344.2
   000386         039900     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000387         040000 F-REVERSE-TEST-06.                                               IF1344.2
   000388         040100     MOVE FUNCTION REVERSE(A) TO WS-ANUM.                         IF1344.2 IFN 26 33
   000389         040200     IF WS-ANUM = "    elbmut" THEN                               IF1344.2 33
   000390      1  040300                    PERFORM PASS                                  IF1344.2 190
   000391         040400     ELSE                                                         IF1344.2
   000392      1  040500                    MOVE "    elbmut"  TO CORRECT-A               IF1344.2 67
   000393      1  040600                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000394      1  040700                    PERFORM FAIL.                                 IF1344.2 191
   000395         040800     GO TO F-REVERSE-WRITE-06.                                    IF1344.2 399
   000396         040900 F-REVERSE-DELETE-06.                                             IF1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         041000     PERFORM  DE-LETE.                                            IF1344.2 192
   000398         041100     GO TO    F-REVERSE-WRITE-06.                                 IF1344.2 399
   000399         041200 F-REVERSE-WRITE-06.                                              IF1344.2
   000400         041300     MOVE "F-REVERSE-06" TO PAR-NAME.                             IF1344.2 42
   000401         041400     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000402         041600 F-REVERSE-07.                                                    IF1344.2
   000403         041700     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000404         041800 F-REVERSE-TEST-07.                                               IF1344.2
   000405         041900     MOVE FUNCTION REVERSE(B) TO WS-ANUM.                         IF1344.2 IFN 27 33
   000406         042000     IF WS-ANUM = "      DEEW" THEN                               IF1344.2 33
   000407      1  042100                    PERFORM PASS                                  IF1344.2 190
   000408         042200     ELSE                                                         IF1344.2
   000409      1  042300                    MOVE "      DEEW"  TO CORRECT-A               IF1344.2 67
   000410      1  042400                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000411      1  042500                    PERFORM FAIL.                                 IF1344.2 191
   000412         042600     GO TO F-REVERSE-WRITE-07.                                    IF1344.2 416
   000413         042700 F-REVERSE-DELETE-07.                                             IF1344.2
   000414         042800     PERFORM  DE-LETE.                                            IF1344.2 192
   000415         042900     GO TO    F-REVERSE-WRITE-07.                                 IF1344.2 416
   000416         043000 F-REVERSE-WRITE-07.                                              IF1344.2
   000417         043100     MOVE "F-REVERSE-07" TO PAR-NAME.                             IF1344.2 42
   000418         043200     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000419         043400 F-REVERSE-08.                                                    IF1344.2
   000420         043500     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000421         043600 F-REVERSE-TEST-08.                                               IF1344.2
   000422         043700     MOVE FUNCTION REVERSE(C) TO WS-ANUM.                         IF1344.2 IFN 28 33
   000423         043800     IF WS-ANUM = "       saW" THEN                               IF1344.2 33
   000424      1  043900                    PERFORM PASS                                  IF1344.2 190
   000425         044000     ELSE                                                         IF1344.2
   000426      1  044100                    MOVE "       saW"  TO CORRECT-A               IF1344.2 67
   000427      1  044200                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000428      1  044300                    PERFORM FAIL.                                 IF1344.2 191
   000429         044400     GO TO F-REVERSE-WRITE-08.                                    IF1344.2 433
   000430         044500 F-REVERSE-DELETE-08.                                             IF1344.2
   000431         044600     PERFORM  DE-LETE.                                            IF1344.2 192
   000432         044700     GO TO    F-REVERSE-WRITE-08.                                 IF1344.2 433
   000433         044800 F-REVERSE-WRITE-08.                                              IF1344.2
   000434         044900     MOVE "F-REVERSE-08" TO PAR-NAME.                             IF1344.2 42
   000435         045000     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000436         045200 F-REVERSE-09.                                                    IF1344.2
   000437         045300     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000438         045400 F-REVERSE-TEST-09.                                               IF1344.2
   000439         045500     MOVE FUNCTION REVERSE(D) TO WS-ANUM.                         IF1344.2 IFN 29 33
   000440         045600     IF WS-ANUM = "         4" THEN                               IF1344.2 33
   000441      1  045700                    PERFORM PASS                                  IF1344.2 190
   000442         045800     ELSE                                                         IF1344.2
   000443      1  045900                    MOVE "         4"  TO CORRECT-A               IF1344.2 67
   000444      1  046000                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000445      1  046100                    PERFORM FAIL.                                 IF1344.2 191
   000446         046200     GO TO F-REVERSE-WRITE-09.                                    IF1344.2 450
   000447         046300 F-REVERSE-DELETE-09.                                             IF1344.2
   000448         046400     PERFORM  DE-LETE.                                            IF1344.2 192
   000449         046500     GO TO    F-REVERSE-WRITE-09.                                 IF1344.2 450
   000450         046600 F-REVERSE-WRITE-09.                                              IF1344.2
   000451         046700     MOVE "F-REVERSE-09" TO PAR-NAME.                             IF1344.2 42
   000452         046800     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000453         047000 F-REVERSE-10.                                                    IF1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         047100     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000455         047200 F-REVERSE-TEST-10.                                               IF1344.2
   000456         047300     MOVE FUNCTION REVERSE(E) TO WS-ANUM.                         IF1344.2 IFN 30 33
   000457         047400     IF WS-ANUM = "      4dnA" THEN                               IF1344.2 33
   000458      1  047500                    PERFORM PASS                                  IF1344.2 190
   000459         047600     ELSE                                                         IF1344.2
   000460      1  047700                    MOVE "      4dnA"  TO CORRECT-A               IF1344.2 67
   000461      1  047800                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000462      1  047900                    PERFORM FAIL.                                 IF1344.2 191
   000463         048000     GO TO F-REVERSE-WRITE-10.                                    IF1344.2 467
   000464         048100 F-REVERSE-DELETE-10.                                             IF1344.2
   000465         048200     PERFORM  DE-LETE.                                            IF1344.2 192
   000466         048300     GO TO    F-REVERSE-WRITE-10.                                 IF1344.2 467
   000467         048400 F-REVERSE-WRITE-10.                                              IF1344.2
   000468         048500     MOVE "F-REVERSE-10" TO PAR-NAME.                             IF1344.2 42
   000469         048600     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000470         048800 F-REVERSE-11.                                                    IF1344.2
   000471         048900     MOVE ZERO TO TEMP.                                           IF1344.2 IMP 32
   000472         049000 F-REVERSE-TEST-11.                                               IF1344.2
   000473         049100     COMPUTE TEMP = FUNCTION LENGTH(FUNCTION REVERSE("Homer")).   IF1344.2 32 IFN IFN
   000474         049200     IF TEMP = 5 THEN                                             IF1344.2 32
   000475      1  049300                    PERFORM PASS                                  IF1344.2 190
   000476         049400     ELSE                                                         IF1344.2
   000477      1  049500                    MOVE 5  TO CORRECT-N                          IF1344.2 68
   000478      1  049600                    MOVE TEMP TO COMPUTED-N                       IF1344.2 32 54
   000479      1  049700                    PERFORM FAIL.                                 IF1344.2 191
   000480         049800     GO TO F-REVERSE-WRITE-11.                                    IF1344.2 484
   000481         049900 F-REVERSE-DELETE-11.                                             IF1344.2
   000482         050000     PERFORM  DE-LETE.                                            IF1344.2 192
   000483         050100     GO TO    F-REVERSE-WRITE-11.                                 IF1344.2 484
   000484         050200 F-REVERSE-WRITE-11.                                              IF1344.2
   000485         050300     MOVE "F-REVERSE-11" TO PAR-NAME.                             IF1344.2 42
   000486         050400     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000487         050600 F-REVERSE-12.                                                    IF1344.2
   000488         050700     MOVE SPACES TO WS-ANUM.                                      IF1344.2 IMP 33
   000489         050800 F-REVERSE-TEST-12.                                               IF1344.2
   000490         050900     MOVE FUNCTION REVERSE(FUNCTION REVERSE("giZZard"))           IF1344.2 IFN IFN
   000491         051000       TO WS-ANUM.                                                IF1344.2 33
   000492         051100     IF WS-ANUM = "giZZard" THEN                                  IF1344.2 33
   000493      1  051200                    PERFORM PASS                                  IF1344.2 190
   000494         051300     ELSE                                                         IF1344.2
   000495      1  051400                    MOVE "giZZard"  TO CORRECT-A                  IF1344.2 67
   000496      1  051500                    MOVE WS-ANUM TO COMPUTED-A                    IF1344.2 33 53
   000497      1  051600                    PERFORM FAIL.                                 IF1344.2 191
   000498         051700     GO TO F-REVERSE-WRITE-12.                                    IF1344.2 502
   000499         051800 F-REVERSE-DELETE-12.                                             IF1344.2
   000500         051900     PERFORM  DE-LETE.                                            IF1344.2 192
   000501         052000     GO TO    F-REVERSE-WRITE-12.                                 IF1344.2 502
   000502         052100 F-REVERSE-WRITE-12.                                              IF1344.2
   000503         052200     MOVE "F-REVERSE-12" TO PAR-NAME.                             IF1344.2 42
   000504         052300     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000505         052500 F-REVERSE-13.                                                    IF1344.2
   000506         052600     MOVE ZERO TO TEMP.                                           IF1344.2 IMP 32
   000507         052700 F-REVERSE-TEST-13.                                               IF1344.2
   000508         052800     COMPUTE TEMP = FUNCTION LENGTH(FUNCTION REVERSE("HOMER")) +  IF1344.2 32 IFN IFN
   000509         052900                    FUNCTION LENGTH(FUNCTION REVERSE("Gizzard")). IF1344.2 IFN IFN
   000510         053000     IF TEMP = 12 THEN                                            IF1344.2 32
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  053100                    PERFORM PASS                                  IF1344.2 190
   000512         053200     ELSE                                                         IF1344.2
   000513      1  053300                    MOVE 12  TO CORRECT-N                         IF1344.2 68
   000514      1  053400                    MOVE TEMP TO COMPUTED-N                       IF1344.2 32 54
   000515      1  053500                    PERFORM FAIL.                                 IF1344.2 191
   000516         053600     GO TO F-REVERSE-WRITE-13.                                    IF1344.2 520
   000517         053700 F-REVERSE-DELETE-13.                                             IF1344.2
   000518         053800     PERFORM  DE-LETE.                                            IF1344.2 192
   000519         053900     GO TO    F-REVERSE-WRITE-13.                                 IF1344.2 520
   000520         054000 F-REVERSE-WRITE-13.                                              IF1344.2
   000521         054100     MOVE "F-REVERSE-13" TO PAR-NAME.                             IF1344.2 42
   000522         054200     PERFORM  PRINT-DETAIL.                                       IF1344.2 194
   000523         054400 CCVS-EXIT SECTION.                                               IF1344.2
   000524         054500 CCVS-999999.                                                     IF1344.2
   000525         054600     GO TO CLOSE-FILES.                                           IF1344.2 185
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  388
       98   ANSI-REFERENCE . . . . . . . .  272 279 289 M300
       27   B. . . . . . . . . . . . . . .  405
       28   C. . . . . . . . . . . . . . .  422
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
       53   COMPUTED-A . . . . . . . . . .  54 56 57 58 59 284 288 M310 M342 M359 M376 M393 M410 M427 M444 M461 M496
       54   COMPUTED-N . . . . . . . . . .  M478 M514
       52   COMPUTED-X . . . . . . . . . .  M202 269
       56   COMPUTED-0V18
       58   COMPUTED-14V4
       60   COMPUTED-18V0
       57   COMPUTED-4V14
       76   COR-ANSI-REFERENCE . . . . . .  M279 M281
       67   CORRECT-A. . . . . . . . . . .  68 69 70 71 72 285 287 M309 M325 M341 M358 M375 M392 M409 M426 M443 M460 M495
       68   CORRECT-N. . . . . . . . . . .  M477 M513
       66   CORRECT-X. . . . . . . . . . .  M203 271
       69   CORRECT-0V18
       71   CORRECT-14V4
       73   CORRECT-18V0
       70   CORRECT-4V14
       72   CR-18V0
       29   D. . . . . . . . . . . . . . .  439
       90   DELETE-COUNTER . . . . . . . .  M192 221 236 238
       45   DOTVALUE . . . . . . . . . . .  M197
       96   DUMMY-HOLD . . . . . . . . . .  M250 260
       23   DUMMY-RECORD . . . . . . . . .  M207 M208 M209 M210 M212 M213 M214 M216 M218 M226 M233 M240 M245 M246 250 M251
                                            252 M253 M254 M255 M256 M257 M258 M259 M260 264 M265 M274 M290
       30   E. . . . . . . . . . . . . . .  456
      143   ENDER-DESC . . . . . . . . . .  M228 M239 M244
       91   ERROR-COUNTER. . . . . . . . .  M191 220 229 232
       95   ERROR-HOLD . . . . . . . . . .  M220 M221 M221 M222 224
      141   ERROR-TOTAL. . . . . . . . . .  M230 M232 M237 M238 M242 M243
       38   FEATURE. . . . . . . . . . . .  M301
      169   HYPHEN-LINE. . . . . . . . . .  214 216 259
      135   ID-AGAIN . . . . . . . . . . .  M181
      168   INF-ANSI-REFERENCE . . . . . .  M272 M275 M289 M291
      163   INFO-TEXT. . . . . . . . . . .  M273
       92   INSPECT-COUNTER. . . . . . . .  M189 220 241 243
       40   P-OR-F . . . . . . . . . . . .  M189 M190 M191 M192 199 M202
       42   PAR-NAME . . . . . . . . . . .  M204 M317 M332 M349 M366 M383 M400 M417 M434 M451 M468 M485 M503 M521
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    14
0 Defined   Cross-reference of data names   References

0      44   PARDOT-X . . . . . . . . . . .  M196
       93   PASS-COUNTER . . . . . . . . .  M190 222 223
       21   PRINT-FILE . . . . . . . . . .  17 180 186
       22   PRINT-REC. . . . . . . . . . .  M198 M278 M280
       47   RE-MARK. . . . . . . . . . . .  M193 M205
       89   REC-CT . . . . . . . . . . . .  195 197 204
       88   REC-SKL-SUB
       97   RECORD-COUNT . . . . . . . . .  M248 249 M261
       32   TEMP . . . . . . . . . . . . .  M471 M473 474 478 M506 M508 510 514
       31   TEMP1
       48   TEST-COMPUTED. . . . . . . . .  278
       63   TEST-CORRECT . . . . . . . . .  280
      116   TEST-ID. . . . . . . . . . . .  M181
       36   TEST-RESULTS . . . . . . . . .  M182 198
       94   TOTAL-ERROR
       33   WS-ANUM. . . . . . . . . . . .  M303 M305 306 310 M320 M335 M337 338 342 M352 M354 355 359 M369 M371 372 376
                                            M386 M388 389 393 M403 M405 406 410 M420 M422 423 427 M437 M439 440 444 M454
                                            M456 457 461 M488 M491 492 496
      165   XXCOMPUTED . . . . . . . . . .  M288
      167   XXCORRECT. . . . . . . . . . .  M287
      160   XXINFO . . . . . . . . . . . .  274 290
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    15
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
      523   CCVS-EXIT
      524   CCVS-999999
      178   CCVS1
      293   CCVS1-EXIT . . . . . . . . . .  G184
      185   CLOSE-FILES. . . . . . . . . .  G525
      211   COLUMN-NAMES-ROUTINE . . . . .  E183
      192   DE-LETE. . . . . . . . . . . .  P314 P329 P346 P363 P380 P397 P414 P431 P448 P465 P482 P500 P518
      215   END-ROUTINE. . . . . . . . . .  P186
      219   END-ROUTINE-1
      227   END-ROUTINE-12
      235   END-ROUTINE-13 . . . . . . . .  E186
      217   END-RTN-EXIT
      313   F-REVERSE-DELETE-01
      328   F-REVERSE-DELETE-02
      345   F-REVERSE-DELETE-03
      362   F-REVERSE-DELETE-04
      379   F-REVERSE-DELETE-05
      396   F-REVERSE-DELETE-06
      413   F-REVERSE-DELETE-07
      430   F-REVERSE-DELETE-08
      447   F-REVERSE-DELETE-09
      464   F-REVERSE-DELETE-10
      481   F-REVERSE-DELETE-11
      499   F-REVERSE-DELETE-12
      517   F-REVERSE-DELETE-13
      299   F-REVERSE-INFO
      304   F-REVERSE-TEST-01
      321   F-REVERSE-TEST-02
      336   F-REVERSE-TEST-03
      353   F-REVERSE-TEST-04
      370   F-REVERSE-TEST-05
      387   F-REVERSE-TEST-06
      404   F-REVERSE-TEST-07
      421   F-REVERSE-TEST-08
      438   F-REVERSE-TEST-09
      455   F-REVERSE-TEST-10
      472   F-REVERSE-TEST-11
      489   F-REVERSE-TEST-12
      507   F-REVERSE-TEST-13
      316   F-REVERSE-WRITE-01 . . . . . .  G312 G315
      331   F-REVERSE-WRITE-02 . . . . . .  G327 G330
      348   F-REVERSE-WRITE-03 . . . . . .  G344 G347
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    16
0 Defined   Cross-reference of procedures   References

0     365   F-REVERSE-WRITE-04 . . . . . .  G361 G364
      382   F-REVERSE-WRITE-05 . . . . . .  G378 G381
      399   F-REVERSE-WRITE-06 . . . . . .  G395 G398
      416   F-REVERSE-WRITE-07 . . . . . .  G412 G415
      433   F-REVERSE-WRITE-08 . . . . . .  G429 G432
      450   F-REVERSE-WRITE-09 . . . . . .  G446 G449
      467   F-REVERSE-WRITE-10 . . . . . .  G463 G466
      484   F-REVERSE-WRITE-11 . . . . . .  G480 G483
      502   F-REVERSE-WRITE-12 . . . . . .  G498 G501
      520   F-REVERSE-WRITE-13 . . . . . .  G516 G519
      302   F-REVERSE-01
      319   F-REVERSE-02
      334   F-REVERSE-03
      351   F-REVERSE-04
      368   F-REVERSE-05
      385   F-REVERSE-06
      402   F-REVERSE-07
      419   F-REVERSE-08
      436   F-REVERSE-09
      453   F-REVERSE-10
      470   F-REVERSE-11
      487   F-REVERSE-12
      505   F-REVERSE-13
      191   FAIL . . . . . . . . . . . . .  P311 P326 P343 P360 P377 P394 P411 P428 P445 P462 P479 P497 P515
      268   FAIL-ROUTINE . . . . . . . . .  P200
      282   FAIL-ROUTINE-EX. . . . . . . .  E200 G276
      277   FAIL-ROUTINE-WRITE . . . . . .  G270 G271
      206   HEAD-ROUTINE . . . . . . . . .  P183
      189   INSPT
      179   OPEN-FILES
      190   PASS . . . . . . . . . . . . .  P307 P323 P339 P356 P373 P390 P407 P424 P441 P458 P475 P493 P511
      194   PRINT-DETAIL . . . . . . . . .  P318 P333 P350 P367 P384 P401 P418 P435 P452 P469 P486 P504 P522
      298   SECT-IF134A
      187   TERMINATE-CCVS
      247   WRITE-LINE . . . . . . . . . .  P198 P199 P207 P208 P209 P210 P212 P213 P214 P216 P218 P226 P234 P240 P245 P246
                                            P274 P278 P280 P290
      263   WRT-LN . . . . . . . . . . . .  P253 P254 P255 P256 P257 P258 P259 P262 P267
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    17
0 Defined   Cross-reference of programs     References

        3   IF134A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF134A    Date 06/04/2022  Time 11:58:47   Page    18
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF134A:
 *    Source records = 525
 *    Data Division statements = 71
 *    Procedure Division statements = 291
 *    Generated COBOL statements = 0
 *    Program complexity factor = 299
0End of compilation 1,  program IF134A,  highest severity 0.
0Return code 0
