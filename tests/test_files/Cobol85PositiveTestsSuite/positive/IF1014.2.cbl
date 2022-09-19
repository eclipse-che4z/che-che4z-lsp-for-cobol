000100 IDENTIFICATION DIVISION.                                         IF1014.2
000200 PROGRAM-ID.                                                      IF1014.2
000300     IF101A.                                                      IF1014.2
000400                                                                  IF1014.2
000600*                                                         *       IF1014.2
000700*   This program is intended to form part of the CCVS85   *       IF1014.2
000800*   COBOL Test Suite. It contains tests for the           *       IF1014.2
000900*   Intrinsic Function ACOS.                              *       IF1014.2
001000*                                                         *       IF1014.2
001200 ENVIRONMENT DIVISION.                                            IF1014.2
001300 CONFIGURATION SECTION.                                           IF1014.2
001400 SOURCE-COMPUTER.                                                 IF1014.2
001500     XXXXX082.                                                    IF1014.2
001600 OBJECT-COMPUTER.                                                 IF1014.2
001700     XXXXX083.                                                    IF1014.2
001800 INPUT-OUTPUT SECTION.                                            IF1014.2
001900 FILE-CONTROL.                                                    IF1014.2
002000     SELECT PRINT-FILE ASSIGN TO                                  IF1014.2
002100     XXXXX055.                                                    IF1014.2
002200 DATA DIVISION.                                                   IF1014.2
002300 FILE SECTION.                                                    IF1014.2
002400 FD  PRINT-FILE.                                                  IF1014.2
002500 01  PRINT-REC PICTURE X(120).                                    IF1014.2
002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1014.2
002700 WORKING-STORAGE SECTION.                                         IF1014.2
002900* Variables specific to the Intrinsic Function Test IF101A*       IF1014.2
003100 01  A                   PIC S9(5)V9(5)      VALUE -0.00004.      IF1014.2
003200 01  B                   PIC S9(10)          VALUE 4.             IF1014.2
003300 01  C                   PIC S9(10)          VALUE 100000.        IF1014.2
003400 01  D                   PIC S9(10)          VALUE 1000.          IF1014.2
003500 01  PI                  PIC S9V9(17)        VALUE 3.141592654.   IF1014.2
003600 01  ARG1                PIC S9V9(17)        VALUE 0.00.          IF1014.2
003700 01  SQRT2               PIC S9V9(17)        VALUE 1.414213562.   IF1014.2
003800 01  SQRT3D2             PIC S9V9(17)        VALUE 0.866025403.   IF1014.2
003900 01  ARR                                     VALUE "40537".       IF1014.2
004000     02  IND OCCURS 5 TIMES PIC 9.                                IF1014.2
004100 01  TEMP                PIC S9(5)V9(5).                          IF1014.2
004200 01  WS-NUM              PIC S9(5)V9(6).                          IF1014.2
004300 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1014.2
004400 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1014.2
004500*                                                                 IF1014.2
004700*                                                                 IF1014.2
004800 01  TEST-RESULTS.                                                IF1014.2
004900     02 FILLER                   PIC X      VALUE SPACE.          IF1014.2
005000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1014.2
005100     02 FILLER                   PIC X      VALUE SPACE.          IF1014.2
005200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1014.2
005300     02 FILLER                   PIC X      VALUE SPACE.          IF1014.2
005400     02  PAR-NAME.                                                IF1014.2
005500       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1014.2
005600       03  PARDOT-X              PIC X      VALUE SPACE.          IF1014.2
005700       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1014.2
005800     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1014.2
005900     02 RE-MARK                  PIC X(61).                       IF1014.2
006000 01  TEST-COMPUTED.                                               IF1014.2
006100     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1014.2
006200     02 FILLER                   PIC X(17)  VALUE                 IF1014.2
006300            "       COMPUTED=".                                   IF1014.2
006400     02 COMPUTED-X.                                               IF1014.2
006500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1014.2
006600     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1014.2
006700                                 PIC -9(9).9(9).                  IF1014.2
006800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1014.2
006900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1014.2
007000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1014.2
007100     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1014.2
007200         04 COMPUTED-18V0                    PIC -9(18).          IF1014.2
007300         04 FILLER                           PIC X.               IF1014.2
007400     03 FILLER PIC X(50) VALUE SPACE.                             IF1014.2
007500 01  TEST-CORRECT.                                                IF1014.2
007600     02 FILLER PIC X(30) VALUE SPACE.                             IF1014.2
007700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1014.2
007800     02 CORRECT-X.                                                IF1014.2
007900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1014.2
008000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1014.2
008100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1014.2
008200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1014.2
008300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1014.2
008400     03      CR-18V0 REDEFINES CORRECT-A.                         IF1014.2
008500         04 CORRECT-18V0                     PIC -9(18).          IF1014.2
008600         04 FILLER                           PIC X.               IF1014.2
008700     03 FILLER PIC X(2) VALUE SPACE.                              IF1014.2
008800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1014.2
008900 01  TEST-CORRECT-MIN.                                            IF1014.2
009000     02 FILLER PIC X(30) VALUE SPACE.                             IF1014.2
009100     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1014.2
009200     02 CORRECTMI-X.                                              IF1014.2
009300     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1014.2
009400     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1014.2
009500     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1014.2
009600     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1014.2
009700     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1014.2
009800     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1014.2
009900         04 CORRECTMI-18V0                     PIC -9(18).        IF1014.2
010000         04 FILLER                           PIC X.               IF1014.2
010100     03 FILLER PIC X(2) VALUE SPACE.                              IF1014.2
010200     03 FILLER                           PIC X(48) VALUE SPACE.   IF1014.2
010300 01  TEST-CORRECT-MAX.                                            IF1014.2
010400     02 FILLER PIC X(30) VALUE SPACE.                             IF1014.2
010500     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1014.2
010600     02 CORRECTMA-X.                                              IF1014.2
010700     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1014.2
010800     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1014.2
010900     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1014.2
011000     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1014.2
011100     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1014.2
011200     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1014.2
011300         04 CORRECTMA-18V0                     PIC -9(18).        IF1014.2
011400         04 FILLER                           PIC X.               IF1014.2
011500     03 FILLER PIC X(2) VALUE SPACE.                              IF1014.2
011600     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1014.2
011700 01  CCVS-C-1.                                                    IF1014.2
011800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1014.2
011900-    "SS  PARAGRAPH-NAME                                          IF1014.2
012000-    "       REMARKS".                                            IF1014.2
012100     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1014.2
012200 01  CCVS-C-2.                                                    IF1014.2
012300     02 FILLER                     PIC X        VALUE SPACE.      IF1014.2
012400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1014.2
012500     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1014.2
012600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1014.2
012700     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1014.2
012800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1014.2
012900 01  REC-CT                        PIC 99       VALUE ZERO.       IF1014.2
013000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1014.2
013100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1014.2
013200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1014.2
013300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1014.2
013400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1014.2
013500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1014.2
013600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1014.2
013700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1014.2
013800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1014.2
013900 01  CCVS-H-1.                                                    IF1014.2
014000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1014.2
014100     02  FILLER                    PIC X(42)    VALUE             IF1014.2
014200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1014.2
014300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1014.2
014400 01  CCVS-H-2A.                                                   IF1014.2
014500   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1014.2
014600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1014.2
014700   02  FILLER                        PIC XXXX   VALUE             IF1014.2
014800     "4.2 ".                                                      IF1014.2
014900   02  FILLER                        PIC X(28)  VALUE             IF1014.2
015000            " COPY - NOT FOR DISTRIBUTION".                       IF1014.2
015100   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1014.2
015200                                                                  IF1014.2
015300 01  CCVS-H-2B.                                                   IF1014.2
015400   02  FILLER                        PIC X(15)  VALUE             IF1014.2
015500            "TEST RESULT OF ".                                    IF1014.2
015600   02  TEST-ID                       PIC X(9).                    IF1014.2
015700   02  FILLER                        PIC X(4)   VALUE             IF1014.2
015800            " IN ".                                               IF1014.2
015900   02  FILLER                        PIC X(12)  VALUE             IF1014.2
016000     " HIGH       ".                                              IF1014.2
016100   02  FILLER                        PIC X(22)  VALUE             IF1014.2
016200            " LEVEL VALIDATION FOR ".                             IF1014.2
016300   02  FILLER                        PIC X(58)  VALUE             IF1014.2
016400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1014.2
016500 01  CCVS-H-3.                                                    IF1014.2
016600     02  FILLER                      PIC X(34)  VALUE             IF1014.2
016700            " FOR OFFICIAL USE ONLY    ".                         IF1014.2
016800     02  FILLER                      PIC X(58)  VALUE             IF1014.2
016900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1014.2
017000     02  FILLER                      PIC X(28)  VALUE             IF1014.2
017100            "  COPYRIGHT   1985 ".                                IF1014.2
017200 01  CCVS-E-1.                                                    IF1014.2
017300     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1014.2
017400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1014.2
017500     02 ID-AGAIN                     PIC X(9).                    IF1014.2
017600     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1014.2
017700 01  CCVS-E-2.                                                    IF1014.2
017800     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1014.2
017900     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1014.2
018000     02 CCVS-E-2-2.                                               IF1014.2
018100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1014.2
018200         03 FILLER                   PIC X      VALUE SPACE.      IF1014.2
018300         03 ENDER-DESC               PIC X(44)  VALUE             IF1014.2
018400            "ERRORS ENCOUNTERED".                                 IF1014.2
018500 01  CCVS-E-3.                                                    IF1014.2
018600     02  FILLER                      PIC X(22)  VALUE             IF1014.2
018700            " FOR OFFICIAL USE ONLY".                             IF1014.2
018800     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1014.2
018900     02  FILLER                      PIC X(58)  VALUE             IF1014.2
019000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1014.2
019100     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1014.2
019200     02 FILLER                       PIC X(15)  VALUE             IF1014.2
019300             " COPYRIGHT 1985".                                   IF1014.2
019400 01  CCVS-E-4.                                                    IF1014.2
019500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1014.2
019600     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1014.2
019700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1014.2
019800     02 FILLER                       PIC X(40)  VALUE             IF1014.2
019900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1014.2
020000 01  XXINFO.                                                      IF1014.2
020100     02 FILLER                       PIC X(19)  VALUE             IF1014.2
020200            "*** INFORMATION ***".                                IF1014.2
020300     02 INFO-TEXT.                                                IF1014.2
020400       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1014.2
020500       04 XXCOMPUTED                 PIC X(20).                   IF1014.2
020600       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1014.2
020700       04 XXCORRECT                  PIC X(20).                   IF1014.2
020800     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1014.2
020900 01  HYPHEN-LINE.                                                 IF1014.2
021000     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1014.2
021100     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1014.2
021200-    "*****************************************".                 IF1014.2
021300     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1014.2
021400-    "******************************".                            IF1014.2
021500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1014.2
021600     "IF101A".                                                    IF1014.2
021700 PROCEDURE DIVISION.                                              IF1014.2
021800 CCVS1 SECTION.                                                   IF1014.2
021900 OPEN-FILES.                                                      IF1014.2
022000     OPEN     OUTPUT PRINT-FILE.                                  IF1014.2
022100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1014.2
022200     MOVE    SPACE TO TEST-RESULTS.                               IF1014.2
022300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1014.2
022400     GO TO CCVS1-EXIT.                                            IF1014.2
022500 CLOSE-FILES.                                                     IF1014.2
022600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1014.2
022700 TERMINATE-CCVS.                                                  IF1014.2
022800     STOP     RUN.                                                IF1014.2
022900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1014.2
023000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1014.2
023100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1014.2
023200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1014.2
023300     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1014.2
023400 PRINT-DETAIL.                                                    IF1014.2
023500     IF REC-CT NOT EQUAL TO ZERO                                  IF1014.2
023600             MOVE "." TO PARDOT-X                                 IF1014.2
023700             MOVE REC-CT TO DOTVALUE.                             IF1014.2
023800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1014.2
023900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1014.2
024000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1014.2
024100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1014.2
024200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1014.2
024300     MOVE SPACE TO CORRECT-X.                                     IF1014.2
024400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1014.2
024500     MOVE     SPACE TO RE-MARK.                                   IF1014.2
024600 HEAD-ROUTINE.                                                    IF1014.2
024700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1014.2
024800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1014.2
024900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1014.2
025000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1014.2
025100 COLUMN-NAMES-ROUTINE.                                            IF1014.2
025200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1014.2
025300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1014.2
025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1014.2
025500 END-ROUTINE.                                                     IF1014.2
025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1014.2
025700 END-RTN-EXIT.                                                    IF1014.2
025800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1014.2
025900 END-ROUTINE-1.                                                   IF1014.2
026000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1014.2
026100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1014.2
026200      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1014.2
026300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1014.2
026400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1014.2
026500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1014.2
026600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1014.2
026700  END-ROUTINE-12.                                                 IF1014.2
026800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1014.2
026900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1014.2
027000         MOVE "NO " TO ERROR-TOTAL                                IF1014.2
027100         ELSE                                                     IF1014.2
027200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1014.2
027300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1014.2
027400     PERFORM WRITE-LINE.                                          IF1014.2
027500 END-ROUTINE-13.                                                  IF1014.2
027600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1014.2
027700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1014.2
027800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1014.2
027900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1014.2
028000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1014.2
028100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1014.2
028200          MOVE "NO " TO ERROR-TOTAL                               IF1014.2
028300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1014.2
028400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1014.2
028500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1014.2
028600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1014.2
028700 WRITE-LINE.                                                      IF1014.2
028800     ADD 1 TO RECORD-COUNT.                                       IF1014.2
028900     IF RECORD-COUNT GREATER 42                                   IF1014.2
029000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1014.2
029100         MOVE SPACE TO DUMMY-RECORD                               IF1014.2
029200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1014.2
029300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1014.2
029400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1014.2
029500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1014.2
029600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1014.2
029700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1014.2
029800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1014.2
029900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1014.2
030000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1014.2
030100         MOVE ZERO TO RECORD-COUNT.                               IF1014.2
030200     PERFORM WRT-LN.                                              IF1014.2
030300 WRT-LN.                                                          IF1014.2
030400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1014.2
030500     MOVE SPACE TO DUMMY-RECORD.                                  IF1014.2
030600 BLANK-LINE-PRINT.                                                IF1014.2
030700     PERFORM WRT-LN.                                              IF1014.2
030800 FAIL-ROUTINE.                                                    IF1014.2
030900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1014.2
031000            GO TO FAIL-ROUTINE-WRITE.                             IF1014.2
031100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1014.2
031200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1014.2
031300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1014.2
031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1014.2
031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1014.2
031600     GO TO  FAIL-ROUTINE-EX.                                      IF1014.2
031700 FAIL-ROUTINE-WRITE.                                              IF1014.2
031800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1014.2
031900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1014.2
032000                              CORMA-ANSI-REFERENCE.               IF1014.2
032100     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1014.2
032200           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1014.2
032300           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1014.2
032400     ELSE                                                         IF1014.2
032500           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1014.2
032600     PERFORM WRITE-LINE.                                          IF1014.2
032700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1014.2
032800 FAIL-ROUTINE-EX. EXIT.                                           IF1014.2
032900 BAIL-OUT.                                                        IF1014.2
033000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1014.2
033100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1014.2
033200 BAIL-OUT-WRITE.                                                  IF1014.2
033300     MOVE CORRECT-A TO XXCORRECT.                                 IF1014.2
033400     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1014.2
033500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1014.2
033600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1014.2
033700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1014.2
033800 BAIL-OUT-EX. EXIT.                                               IF1014.2
033900 CCVS1-EXIT.                                                      IF1014.2
034000     EXIT.                                                        IF1014.2
034200*                                                      *          IF1014.2
034300*    Intrinsic Function Tests         IF101A - ACOS    *          IF1014.2
034400*                                                      *          IF1014.2
034600 SECT-IF101A SECTION.                                             IF1014.2
034700 F-ACOS-INFO.                                                     IF1014.2
034800     MOVE     "See ref. A-33 2.5" TO ANSI-REFERENCE.              IF1014.2
034900     MOVE     "ACOS Function" TO FEATURE.                         IF1014.2
035100 F-ACOS-01.                                                       IF1014.2
035200     MOVE ZERO TO WS-NUM.                                         IF1014.2
035300     MOVE  0.000000 TO MIN-RANGE.                                 IF1014.2
035400     MOVE  0.000020 TO MAX-RANGE.                                 IF1014.2
035500 F-ACOS-TEST-01.                                                  IF1014.2
035600     COMPUTE WS-NUM = FUNCTION ACOS(1.0).                         IF1014.2
035700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
035800        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
035900                    PERFORM PASS                                  IF1014.2
036000     ELSE                                                         IF1014.2
036100                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
036200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
036300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
036400                    PERFORM FAIL.                                 IF1014.2
036500     GO TO F-ACOS-WRITE-01.                                       IF1014.2
036600 F-ACOS-DELETE-01.                                                IF1014.2
036700     PERFORM  DE-LETE.                                            IF1014.2
036800     GO TO    F-ACOS-WRITE-01.                                    IF1014.2
036900 F-ACOS-WRITE-01.                                                 IF1014.2
037000     MOVE "F-ACOS-01" TO PAR-NAME.                                IF1014.2
037100     PERFORM  PRINT-DETAIL.                                       IF1014.2
037300 F-ACOS-02.                                                       IF1014.2
037400     MOVE  1.04718 TO MIN-RANGE.                                  IF1014.2
037500     MOVE  1.04722 TO MAX-RANGE.                                  IF1014.2
037600 F-ACOS-TEST-02.                                                  IF1014.2
037700     IF (FUNCTION ACOS(0.5) >= MIN-RANGE) AND                     IF1014.2
037800        (FUNCTION ACOS(0.5) <= MAX-RANGE) THEN                    IF1014.2
037900                    PERFORM PASS                                  IF1014.2
038000     ELSE                                                         IF1014.2
038100                    PERFORM FAIL.                                 IF1014.2
038200     GO TO F-ACOS-WRITE-02.                                       IF1014.2
038300 F-ACOS-DELETE-02.                                                IF1014.2
038400     PERFORM  DE-LETE.                                            IF1014.2
038500     GO TO    F-ACOS-WRITE-02.                                    IF1014.2
038600 F-ACOS-WRITE-02.                                                 IF1014.2
038700     MOVE "F-ACOS-02" TO PAR-NAME.                                IF1014.2
038800     PERFORM  PRINT-DETAIL.                                       IF1014.2
039000 F-ACOS-03.                                                       IF1014.2
039100     EVALUATE FUNCTION ACOS(0)                                    IF1014.2
039200     WHEN 1.57076 THRU 1.57082                                    IF1014.2
039300                    PERFORM PASS                                  IF1014.2
039400     WHEN OTHER                                                   IF1014.2
039500                    PERFORM FAIL.                                 IF1014.2
039600     GO TO F-ACOS-WRITE-03.                                       IF1014.2
039700 F-ACOS-DELETE-03.                                                IF1014.2
039800     PERFORM  DE-LETE.                                            IF1014.2
039900     GO TO    F-ACOS-WRITE-03.                                    IF1014.2
040000 F-ACOS-WRITE-03.                                                 IF1014.2
040100     MOVE "F-ACOS-03" TO PAR-NAME.                                IF1014.2
040200     PERFORM  PRINT-DETAIL.                                       IF1014.2
040400 F-ACOS-04.                                                       IF1014.2
040500     MOVE ZERO TO WS-NUM.                                         IF1014.2
040600     MOVE  3.14153 TO MIN-RANGE.                                  IF1014.2
040700     MOVE  3.14165 TO MAX-RANGE.                                  IF1014.2
040800 F-ACOS-TEST-04.                                                  IF1014.2
040900     COMPUTE WS-NUM = FUNCTION ACOS(-1).                          IF1014.2
041000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
041100        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
041200                    PERFORM PASS                                  IF1014.2
041300     ELSE                                                         IF1014.2
041400                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
041500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
041600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
041700                    PERFORM FAIL.                                 IF1014.2
041800     GO TO F-ACOS-WRITE-04.                                       IF1014.2
041900 F-ACOS-DELETE-04.                                                IF1014.2
042000     PERFORM  DE-LETE.                                            IF1014.2
042100     GO TO    F-ACOS-WRITE-04.                                    IF1014.2
042200 F-ACOS-WRITE-04.                                                 IF1014.2
042300     MOVE "F-ACOS-04" TO PAR-NAME.                                IF1014.2
042400     PERFORM  PRINT-DETAIL.                                       IF1014.2
042600 F-ACOS-05.                                                       IF1014.2
042700     MOVE ZERO TO WS-NUM.                                         IF1014.2
042800     MOVE  0.044724 TO MIN-RANGE.                                 IF1014.2
042900     MOVE  0.044726 TO MAX-RANGE.                                 IF1014.2
043000 F-ACOS-TEST-05.                                                  IF1014.2
043100     COMPUTE WS-NUM = FUNCTION ACOS(.999).                        IF1014.2
043200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
043300        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
043400                    PERFORM PASS                                  IF1014.2
043500     ELSE                                                         IF1014.2
043600                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
043700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
043800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
043900                    PERFORM FAIL.                                 IF1014.2
044000     GO TO F-ACOS-WRITE-05.                                       IF1014.2
044100 F-ACOS-DELETE-05.                                                IF1014.2
044200     PERFORM  DE-LETE.                                            IF1014.2
044300     GO TO    F-ACOS-WRITE-05.                                    IF1014.2
044400 F-ACOS-WRITE-05.                                                 IF1014.2
044500     MOVE "F-ACOS-05" TO PAR-NAME.                                IF1014.2
044600     PERFORM  PRINT-DETAIL.                                       IF1014.2
044800 F-ACOS-06.                                                       IF1014.2
044900     MOVE ZERO TO WS-NUM.                                         IF1014.2
045000     MOVE  1.05868 TO MIN-RANGE.                                  IF1014.2
045100     MOVE  1.05872 TO MAX-RANGE.                                  IF1014.2
045200 F-ACOS-TEST-06.                                                  IF1014.2
045300     COMPUTE WS-NUM = FUNCTION ACOS(.49).                         IF1014.2
045400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
045500        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
045600                    PERFORM PASS                                  IF1014.2
045700     ELSE                                                         IF1014.2
045800                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
045900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
046000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
046100                    PERFORM FAIL.                                 IF1014.2
046200     GO TO F-ACOS-WRITE-06.                                       IF1014.2
046300 F-ACOS-DELETE-06.                                                IF1014.2
046400     PERFORM  DE-LETE.                                            IF1014.2
046500     GO TO    F-ACOS-WRITE-06.                                    IF1014.2
046600 F-ACOS-WRITE-06.                                                 IF1014.2
046700     MOVE "F-ACOS-06" TO PAR-NAME.                                IF1014.2
046800     PERFORM  PRINT-DETAIL.                                       IF1014.2
047000 F-ACOS-07.                                                       IF1014.2
047100     MOVE ZERO TO WS-NUM.                                         IF1014.2
047200     MOVE  1.56976 TO MIN-RANGE.                                  IF1014.2
047300     MOVE  1.56982 TO MAX-RANGE.                                  IF1014.2
047400 F-ACOS-TEST-07.                                                  IF1014.2
047500     COMPUTE WS-NUM = FUNCTION ACOS(.001).                        IF1014.2
047600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
047700        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
047800                    PERFORM PASS                                  IF1014.2
047900     ELSE                                                         IF1014.2
048000                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
048100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
048200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
048300                    PERFORM FAIL.                                 IF1014.2
048400     GO TO F-ACOS-WRITE-07.                                       IF1014.2
048500 F-ACOS-DELETE-07.                                                IF1014.2
048600     PERFORM  DE-LETE.                                            IF1014.2
048700     GO TO    F-ACOS-WRITE-07.                                    IF1014.2
048800 F-ACOS-WRITE-07.                                                 IF1014.2
048900     MOVE "F-ACOS-07" TO PAR-NAME.                                IF1014.2
049000     PERFORM  PRINT-DETAIL.                                       IF1014.2
049200 F-ACOS-08.                                                       IF1014.2
049300     MOVE ZERO TO WS-NUM.                                         IF1014.2
049400     MOVE  3.09680 TO MIN-RANGE.                                  IF1014.2
049500     MOVE  3.09692 TO MAX-RANGE.                                  IF1014.2
049600 F-ACOS-TEST-08.                                                  IF1014.2
049700     COMPUTE WS-NUM = FUNCTION ACOS(-.999).                       IF1014.2
049800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
049900        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
050000                    PERFORM PASS                                  IF1014.2
050100     ELSE                                                         IF1014.2
050200                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
050300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
050400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
050500                    PERFORM FAIL.                                 IF1014.2
050600     GO TO F-ACOS-WRITE-08.                                       IF1014.2
050700 F-ACOS-DELETE-08.                                                IF1014.2
050800     PERFORM  DE-LETE.                                            IF1014.2
050900     GO TO    F-ACOS-WRITE-08.                                    IF1014.2
051000 F-ACOS-WRITE-08.                                                 IF1014.2
051100     MOVE "F-ACOS-08" TO PAR-NAME.                                IF1014.2
051200     PERFORM  PRINT-DETAIL.                                       IF1014.2
051400 F-ACOS-09.                                                       IF1014.2
051500     MOVE ZERO TO WS-NUM.                                         IF1014.2
051600     MOVE  1.57080 TO MIN-RANGE.                                  IF1014.2
051700     MOVE  1.57086 TO MAX-RANGE.                                  IF1014.2
051800 F-ACOS-TEST-09.                                                  IF1014.2
051900     COMPUTE WS-NUM = FUNCTION ACOS(A).                           IF1014.2
052000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
052100        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
052200                    PERFORM PASS                                  IF1014.2
052300     ELSE                                                         IF1014.2
052400                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
052500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
052600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
052700                    PERFORM FAIL.                                 IF1014.2
052800     GO TO F-ACOS-WRITE-09.                                       IF1014.2
052900 F-ACOS-DELETE-09.                                                IF1014.2
053000     PERFORM  DE-LETE.                                            IF1014.2
053100     GO TO    F-ACOS-WRITE-09.                                    IF1014.2
053200 F-ACOS-WRITE-09.                                                 IF1014.2
053300     MOVE "F-ACOS-09" TO PAR-NAME.                                IF1014.2
053400     PERFORM  PRINT-DETAIL.                                       IF1014.2
053600 F-ACOS-10.                                                       IF1014.2
053700     MOVE ZERO TO WS-NUM.                                         IF1014.2
053800     MOVE  1.57074 TO MIN-RANGE.                                  IF1014.2
053900     MOVE  1.57080 TO MAX-RANGE.                                  IF1014.2
054000 F-ACOS-TEST-10.                                                  IF1014.2
054100     COMPUTE WS-NUM = FUNCTION ACOS(.00002).                      IF1014.2
054200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
054300        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
054400                    PERFORM PASS                                  IF1014.2
054500     ELSE                                                         IF1014.2
054600                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
054700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
054800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
054900                    PERFORM FAIL.                                 IF1014.2
055000     GO TO F-ACOS-WRITE-10.                                       IF1014.2
055100 F-ACOS-DELETE-10.                                                IF1014.2
055200     PERFORM  DE-LETE.                                            IF1014.2
055300     GO TO    F-ACOS-WRITE-10.                                    IF1014.2
055400 F-ACOS-WRITE-10.                                                 IF1014.2
055500     MOVE "F-ACOS-10" TO PAR-NAME.                                IF1014.2
055600     PERFORM  PRINT-DETAIL.                                       IF1014.2
055800 F-ACOS-11.                                                       IF1014.2
055900     MOVE ZERO TO WS-NUM.                                         IF1014.2
056000     MOVE  0.785367 TO MIN-RANGE.                                 IF1014.2
056100     MOVE  0.785429 TO MAX-RANGE.                                 IF1014.2
056200 F-ACOS-TEST-11.                                                  IF1014.2
056300     COMPUTE WS-NUM = FUNCTION ACOS(1 / SQRT2).                   IF1014.2
056400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
056500        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
056600                    PERFORM PASS                                  IF1014.2
056700     ELSE                                                         IF1014.2
056800                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
056900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
057000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
057100                    PERFORM FAIL.                                 IF1014.2
057200     GO TO F-ACOS-WRITE-11.                                       IF1014.2
057300 F-ACOS-DELETE-11.                                                IF1014.2
057400     PERFORM  DE-LETE.                                            IF1014.2
057500     GO TO    F-ACOS-WRITE-11.                                    IF1014.2
057600 F-ACOS-WRITE-11.                                                 IF1014.2
057700     MOVE "F-ACOS-11" TO PAR-NAME.                                IF1014.2
057800     PERFORM  PRINT-DETAIL.                                       IF1014.2
058000 F-ACOS-12.                                                       IF1014.2
058100     MOVE ZERO TO WS-NUM.                                         IF1014.2
058200     MOVE  0.523577  TO MIN-RANGE.                                IF1014.2
058300     MOVE  0.523619 TO MAX-RANGE.                                 IF1014.2
058400 F-ACOS-TEST-12.                                                  IF1014.2
058500     COMPUTE WS-NUM = FUNCTION ACOS(SQRT3D2).                     IF1014.2
058600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
058700        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
058800                    PERFORM PASS                                  IF1014.2
058900     ELSE                                                         IF1014.2
059000                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
059100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
059200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
059300                    PERFORM FAIL.                                 IF1014.2
059400     GO TO F-ACOS-WRITE-12.                                       IF1014.2
059500 F-ACOS-DELETE-12.                                                IF1014.2
059600     PERFORM  DE-LETE.                                            IF1014.2
059700     GO TO    F-ACOS-WRITE-12.                                    IF1014.2
059800 F-ACOS-WRITE-12.                                                 IF1014.2
059900     MOVE "F-ACOS-12" TO PAR-NAME.                                IF1014.2
060000     PERFORM  PRINT-DETAIL.                                       IF1014.2
060200 F-ACOS-13.                                                       IF1014.2
060300     MOVE ZERO TO WS-NUM.                                         IF1014.2
060400     MOVE  1.58073 TO MIN-RANGE.                                  IF1014.2
060500     MOVE  1.58085 TO MAX-RANGE.                                  IF1014.2
060600 F-ACOS-TEST-13.                                                  IF1014.2
060700     COMPUTE WS-NUM = FUNCTION ACOS( 1 - 1.01).                   IF1014.2
060800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
060900        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
061000                    PERFORM PASS                                  IF1014.2
061100     ELSE                                                         IF1014.2
061200                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
061300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
061400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
061500                    PERFORM FAIL.                                 IF1014.2
061600     GO TO F-ACOS-WRITE-13.                                       IF1014.2
061700 F-ACOS-DELETE-13.                                                IF1014.2
061800     PERFORM  DE-LETE.                                            IF1014.2
061900     GO TO    F-ACOS-WRITE-13.                                    IF1014.2
062000 F-ACOS-WRITE-13.                                                 IF1014.2
062100     MOVE "F-ACOS-13" TO PAR-NAME.                                IF1014.2
062200     PERFORM  PRINT-DETAIL.                                       IF1014.2
062400 F-ACOS-14.                                                       IF1014.2
062500     MOVE ZERO TO WS-NUM.                                         IF1014.2
062600     MOVE  0.141533 TO MIN-RANGE.                                 IF1014.2
062700     MOVE  0.141545 TO MAX-RANGE.                                 IF1014.2
062800 F-ACOS-TEST-14.                                                  IF1014.2
062900     COMPUTE WS-NUM = FUNCTION ACOS(1.98 / 2).                    IF1014.2
063000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
063100        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
063200                    PERFORM PASS                                  IF1014.2
063300     ELSE                                                         IF1014.2
063400                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
063500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
063600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
063700                    PERFORM FAIL.                                 IF1014.2
063800     GO TO F-ACOS-WRITE-14.                                       IF1014.2
063900 F-ACOS-DELETE-14.                                                IF1014.2
064000     PERFORM  DE-LETE.                                            IF1014.2
064100     GO TO    F-ACOS-WRITE-14.                                    IF1014.2
064200 F-ACOS-WRITE-14.                                                 IF1014.2
064300     MOVE "F-ACOS-14" TO PAR-NAME.                                IF1014.2
064400     PERFORM  PRINT-DETAIL.                                       IF1014.2
064600 F-ACOS-15.                                                       IF1014.2
064700     MOVE ZERO TO WS-NUM.                                         IF1014.2
064800     MOVE  1.05866 TO MIN-RANGE.                                  IF1014.2
064900     MOVE  1.05874 TO MAX-RANGE.                                  IF1014.2
065000 F-ACOS-TEST-15.                                                  IF1014.2
065100     COMPUTE WS-NUM = FUNCTION ACOS(0.2 + 0.29).                  IF1014.2
065200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
065300        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
065400                    PERFORM PASS                                  IF1014.2
065500     ELSE                                                         IF1014.2
065600                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
065700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
065800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
065900                    PERFORM FAIL.                                 IF1014.2
066000     GO TO F-ACOS-WRITE-15.                                       IF1014.2
066100 F-ACOS-DELETE-15.                                                IF1014.2
066200     PERFORM  DE-LETE.                                            IF1014.2
066300     GO TO    F-ACOS-WRITE-15.                                    IF1014.2
066400 F-ACOS-WRITE-15.                                                 IF1014.2
066500     MOVE "F-ACOS-15" TO PAR-NAME.                                IF1014.2
066600     PERFORM  PRINT-DETAIL.                                       IF1014.2
066800 F-ACOS-16.                                                       IF1014.2
066900     MOVE ZERO TO WS-NUM.                                         IF1014.2
067000     MOVE  2.99993 TO MIN-RANGE.                                  IF1014.2
067100     MOVE  3.00017 TO MAX-RANGE.                                  IF1014.2
067200 F-ACOS-TEST-16.                                                  IF1014.2
067300     COMPUTE WS-NUM = FUNCTION ACOS(0.99 * -1).                   IF1014.2
067400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
067500        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
067600                    PERFORM PASS                                  IF1014.2
067700     ELSE                                                         IF1014.2
067800                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
067900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
068000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
068100                    PERFORM FAIL.                                 IF1014.2
068200     GO TO F-ACOS-WRITE-16.                                       IF1014.2
068300 F-ACOS-DELETE-16.                                                IF1014.2
068400     PERFORM  DE-LETE.                                            IF1014.2
068500     GO TO    F-ACOS-WRITE-16.                                    IF1014.2
068600 F-ACOS-WRITE-16.                                                 IF1014.2
068700     MOVE "F-ACOS-16" TO PAR-NAME.                                IF1014.2
068800     PERFORM  PRINT-DETAIL.                                       IF1014.2
069000 F-ACOS-17.                                                       IF1014.2
069100     MOVE ZERO TO WS-NUM.                                         IF1014.2
069200     MOVE  -0.000040 TO MIN-RANGE.                                IF1014.2
069300     MOVE  0.00004 TO MAX-RANGE.                                  IF1014.2
069400 F-ACOS-TEST-17.                                                  IF1014.2
069500     COMPUTE WS-NUM = FUNCTION ACOS(IND (B) - 2).                 IF1014.2
069600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
069700        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
069800                    PERFORM PASS                                  IF1014.2
069900     ELSE                                                         IF1014.2
070000                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
070100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
070200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
070300                    PERFORM FAIL.                                 IF1014.2
070400     GO TO F-ACOS-WRITE-17.                                       IF1014.2
070500 F-ACOS-DELETE-17.                                                IF1014.2
070600     PERFORM  DE-LETE.                                            IF1014.2
070700     GO TO    F-ACOS-WRITE-17.                                    IF1014.2
070800 F-ACOS-WRITE-17.                                                 IF1014.2
070900     MOVE "F-ACOS-17" TO PAR-NAME.                                IF1014.2
071000     PERFORM  PRINT-DETAIL.                                       IF1014.2
071200 F-ACOS-18.                                                       IF1014.2
071300     MOVE ZERO TO WS-NUM.                                         IF1014.2
071400     MOVE  0.679646 TO MIN-RANGE.                                 IF1014.2
071500     MOVE  0.679700 TO MAX-RANGE.                                 IF1014.2
071600 F-ACOS-TEST-18.                                                  IF1014.2
071700     COMPUTE WS-NUM = FUNCTION ACOS(IND(5) / 9).                  IF1014.2
071800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
071900        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
072000                    PERFORM PASS                                  IF1014.2
072100     ELSE                                                         IF1014.2
072200                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
072300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
072400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
072500                    PERFORM FAIL.                                 IF1014.2
072600     GO TO F-ACOS-WRITE-18.                                       IF1014.2
072700 F-ACOS-DELETE-18.                                                IF1014.2
072800     PERFORM  DE-LETE.                                            IF1014.2
072900     GO TO    F-ACOS-WRITE-18.                                    IF1014.2
073000 F-ACOS-WRITE-18.                                                 IF1014.2
073100     MOVE "F-ACOS-18" TO PAR-NAME.                                IF1014.2
073200     PERFORM  PRINT-DETAIL.                                       IF1014.2
073400 F-ACOS-19.                                                       IF1014.2
073500     MOVE ZERO TO WS-NUM.                                         IF1014.2
073600     MOVE  0.000000 TO MIN-RANGE.                                 IF1014.2
073700     MOVE  0.000040 TO MAX-RANGE.                                 IF1014.2
073800 F-ACOS-TEST-19.                                                  IF1014.2
073900     COMPUTE WS-NUM = FUNCTION ACOS(4 - 3).                       IF1014.2
074000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
074100        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
074200                    PERFORM PASS                                  IF1014.2
074300     ELSE                                                         IF1014.2
074400                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
074500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
074600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
074700                    PERFORM FAIL.                                 IF1014.2
074800     GO TO F-ACOS-WRITE-19.                                       IF1014.2
074900 F-ACOS-DELETE-19.                                                IF1014.2
075000     PERFORM  DE-LETE.                                            IF1014.2
075100     GO TO    F-ACOS-WRITE-19.                                    IF1014.2
075200 F-ACOS-WRITE-19.                                                 IF1014.2
075300     MOVE "F-ACOS-19" TO PAR-NAME.                                IF1014.2
075400     PERFORM  PRINT-DETAIL.                                       IF1014.2
075600 F-ACOS-20.                                                       IF1014.2
075700     MOVE ZERO TO WS-NUM.                                         IF1014.2
075800     MOVE  0.000000 TO MIN-RANGE.                                 IF1014.2
075900     MOVE  0.000004 TO MAX-RANGE.                                 IF1014.2
076000 F-ACOS-TEST-20.                                                  IF1014.2
076100     COMPUTE WS-NUM = FUNCTION ACOS(C / C).                       IF1014.2
076200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
076300        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
076400                    PERFORM PASS                                  IF1014.2
076500     ELSE                                                         IF1014.2
076600                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
076700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
076800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
076900                    PERFORM FAIL.                                 IF1014.2
077000     GO TO F-ACOS-WRITE-20.                                       IF1014.2
077100 F-ACOS-DELETE-20.                                                IF1014.2
077200     PERFORM  DE-LETE.                                            IF1014.2
077300     GO TO    F-ACOS-WRITE-20.                                    IF1014.2
077400 F-ACOS-WRITE-20.                                                 IF1014.2
077500     MOVE "F-ACOS-20" TO PAR-NAME.                                IF1014.2
077600     PERFORM  PRINT-DETAIL.                                       IF1014.2
077800 F-ACOS-21.                                                       IF1014.2
077900     MOVE ZERO TO WS-NUM.                                         IF1014.2
078000     MOVE  1.31806 TO MIN-RANGE.                                  IF1014.2
078100     MOVE  1.31816 TO MAX-RANGE.                                  IF1014.2
078200 F-ACOS-TEST-21.                                                  IF1014.2
078300     COMPUTE WS-NUM = FUNCTION ACOS(0.25 * 1).                    IF1014.2
078400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
078500        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
078600                    PERFORM PASS                                  IF1014.2
078700     ELSE                                                         IF1014.2
078800                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
078900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
079000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
079100                    PERFORM FAIL.                                 IF1014.2
079200     GO TO F-ACOS-WRITE-21.                                       IF1014.2
079300 F-ACOS-DELETE-21.                                                IF1014.2
079400     PERFORM  DE-LETE.                                            IF1014.2
079500     GO TO    F-ACOS-WRITE-21.                                    IF1014.2
079600 F-ACOS-WRITE-21.                                                 IF1014.2
079700     MOVE "F-ACOS-21" TO PAR-NAME.                                IF1014.2
079800     PERFORM  PRINT-DETAIL.                                       IF1014.2
080000 F-ACOS-22.                                                       IF1014.2
080100     MOVE ZERO TO WS-NUM.                                         IF1014.2
080200     MOVE  1.57073 TO MIN-RANGE.                                  IF1014.2
080300     MOVE  1.57085 TO MAX-RANGE.                                  IF1014.2
080400 F-ACOS-TEST-22.                                                  IF1014.2
080500     COMPUTE WS-NUM = FUNCTION ACOS((D / D) - 1).                 IF1014.2
080600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
080700        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
080800                    PERFORM PASS                                  IF1014.2
080900     ELSE                                                         IF1014.2
081000                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
081100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
081200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
081300                    PERFORM FAIL.                                 IF1014.2
081400     GO TO F-ACOS-WRITE-22.                                       IF1014.2
081500 F-ACOS-DELETE-22.                                                IF1014.2
081600     PERFORM  DE-LETE.                                            IF1014.2
081700     GO TO    F-ACOS-WRITE-22.                                    IF1014.2
081800 F-ACOS-WRITE-22.                                                 IF1014.2
081900     MOVE "F-ACOS-22" TO PAR-NAME.                                IF1014.2
082000     PERFORM  PRINT-DETAIL.                                       IF1014.2
082200 F-ACOS-23.                                                       IF1014.2
082300     MOVE ZERO TO WS-NUM.                                         IF1014.2
082400     MOVE  2.60285  TO MIN-RANGE.                                 IF1014.2
082500     MOVE  2.60305 TO MAX-RANGE.                                  IF1014.2
082600 F-ACOS-TEST-23.                                                  IF1014.2
082700     COMPUTE WS-NUM = FUNCTION ACOS(PI - 4).                      IF1014.2
082800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
082900        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
083000                    PERFORM PASS                                  IF1014.2
083100     ELSE                                                         IF1014.2
083200                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
083300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
083400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
083500                    PERFORM FAIL.                                 IF1014.2
083600     GO TO F-ACOS-WRITE-23.                                       IF1014.2
083700 F-ACOS-DELETE-23.                                                IF1014.2
083800     PERFORM  DE-LETE.                                            IF1014.2
083900     GO TO    F-ACOS-WRITE-23.                                    IF1014.2
084000 F-ACOS-WRITE-23.                                                 IF1014.2
084100     MOVE "F-ACOS-23" TO PAR-NAME.                                IF1014.2
084200     PERFORM  PRINT-DETAIL.                                       IF1014.2
084400 F-ACOS-24.                                                       IF1014.2
084500     MOVE ZERO TO WS-NUM.                                         IF1014.2
084600     MOVE 1.57073 TO MIN-RANGE.                                   IF1014.2
084700     MOVE 1.57085 TO MAX-RANGE.                                   IF1014.2
084800 F-ACOS-TEST-24.                                                  IF1014.2
084900     COMPUTE WS-NUM = FUNCTION ACOS(FUNCTION ACOS(D / D)).        IF1014.2
085000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
085100        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
085200                    PERFORM PASS                                  IF1014.2
085300     ELSE                                                         IF1014.2
085400                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
085500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
085600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
085700                    PERFORM FAIL.                                 IF1014.2
085800     GO TO F-ACOS-WRITE-24.                                       IF1014.2
085900 F-ACOS-DELETE-24.                                                IF1014.2
086000     PERFORM  DE-LETE.                                            IF1014.2
086100     GO TO    F-ACOS-WRITE-24.                                    IF1014.2
086200 F-ACOS-WRITE-24.                                                 IF1014.2
086300     MOVE "F-ACOS-24" TO PAR-NAME.                                IF1014.2
086400     PERFORM  PRINT-DETAIL.                                       IF1014.2
086600 F-ACOS-25.                                                       IF1014.2
086700     MOVE ZERO TO WS-NUM.                                         IF1014.2
086800     MOVE 0.000000 TO MIN-RANGE.                                  IF1014.2
086900     MOVE 0.000040 TO MAX-RANGE.                                  IF1014.2
087000 F-ACOS-TEST-25.                                                  IF1014.2
087100     COMPUTE WS-NUM = FUNCTION ACOS(D / D) + FUNCTION ACOS(D / D).IF1014.2
087200                                                                  IF1014.2
087300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1014.2
087400        (WS-NUM <= MAX-RANGE) THEN                                IF1014.2
087500                    PERFORM PASS                                  IF1014.2
087600     ELSE                                                         IF1014.2
087700                    MOVE WS-NUM TO COMPUTED-N                     IF1014.2
087800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1014.2
087900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1014.2
088000                    PERFORM FAIL.                                 IF1014.2
088100     GO TO F-ACOS-WRITE-25.                                       IF1014.2
088200 F-ACOS-DELETE-25.                                                IF1014.2
088300     PERFORM  DE-LETE.                                            IF1014.2
088400     GO TO    F-ACOS-WRITE-25.                                    IF1014.2
088500 F-ACOS-WRITE-25.                                                 IF1014.2
088600     MOVE "F-ACOS-25" TO PAR-NAME.                                IF1014.2
088700     PERFORM  PRINT-DETAIL.                                       IF1014.2
088900 F-ACOS-26.                                                       IF1014.2
089000     MOVE ZERO TO ARG1.                                           IF1014.2
089100     PERFORM F-ACOS-TEST-26                                       IF1014.2
089200       UNTIL FUNCTION ACOS(ARG1) < 1.                             IF1014.2
089300     PERFORM PASS.                                                IF1014.2
089400     GO TO F-ACOS-WRITE-26.                                       IF1014.2
089500 F-ACOS-TEST-26.                                                  IF1014.2
089600     COMPUTE ARG1 = ARG1 + 0.25.                                  IF1014.2
089700 F-ACOS-DELETE-26.                                                IF1014.2
089800     PERFORM  DE-LETE.                                            IF1014.2
089900     GO TO    F-ACOS-WRITE-26.                                    IF1014.2
090000 F-ACOS-WRITE-26.                                                 IF1014.2
090100     MOVE "F-ACOS-26" TO PAR-NAME.                                IF1014.2
090200     PERFORM  PRINT-DETAIL.                                       IF1014.2
090400 CCVS-EXIT SECTION.                                               IF1014.2
090500 CCVS-999999.                                                     IF1014.2
090600     GO TO CLOSE-FILES.                                           IF1014.2
