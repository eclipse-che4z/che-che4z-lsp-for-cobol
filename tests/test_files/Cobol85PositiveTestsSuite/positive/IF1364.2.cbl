000100 IDENTIFICATION DIVISION.                                         IF1364.2
000200 PROGRAM-ID.                                                      IF1364.2
000300     IF136A.                                                      IF1364.2
000400                                                                  IF1364.2
000600*                                                         *       IF1364.2
000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1364.2
000800* It contains tests for the Intrinsic Function SQRT.      *       IF1364.2
000900*                                                         *       IF1364.2
001100 ENVIRONMENT DIVISION.                                            IF1364.2
001200 CONFIGURATION SECTION.                                           IF1364.2
001300 SOURCE-COMPUTER.                                                 IF1364.2
001400     XXXXX082.                                                    IF1364.2
001500 OBJECT-COMPUTER.                                                 IF1364.2
001600     XXXXX083.                                                    IF1364.2
001700 INPUT-OUTPUT SECTION.                                            IF1364.2
001800 FILE-CONTROL.                                                    IF1364.2
001900     SELECT PRINT-FILE ASSIGN TO                                  IF1364.2
002000     XXXXX055.                                                    IF1364.2
002100 DATA DIVISION.                                                   IF1364.2
002200 FILE SECTION.                                                    IF1364.2
002300 FD  PRINT-FILE.                                                  IF1364.2
002400 01  PRINT-REC PICTURE X(120).                                    IF1364.2
002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1364.2
002600 WORKING-STORAGE SECTION.                                         IF1364.2
002800* Variables specific to the Intrinsic Function Test IF136A*       IF1364.2
003000 01  A                   PIC S9(5)V9(5)      VALUE 0.00004.       IF1364.2
003100 01  B                   PIC S9(5)V9(5)      VALUE 14000.105.     IF1364.2
003200 01  C                   PIC S9(10)          VALUE 100000.        IF1364.2
003300 01  D                   PIC S9(10)          VALUE 1000.          IF1364.2
003400 01  E                   PIC S9(10)          VALUE 7.             IF1364.2
003500 01  F                   PIC S9(10)          VALUE 6.             IF1364.2
003600 01  P                   PIC S9(10)          VALUE 1.             IF1364.2
003700 01  ARG1                PIC S9(10)          VALUE 10.            IF1364.2
003800 01  ARR                                     VALUE "40537".       IF1364.2
003900     02  IND OCCURS 5 TIMES PIC 9.                                IF1364.2
004000 01  TEMP                PIC S9(5)V9(5).                          IF1364.2
004100 01  WS-NUM              PIC S9(5)V9(7).                          IF1364.2
004200 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1364.2
004300 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1364.2
004400*                                                                 IF1364.2
004600*                                                                 IF1364.2
004700 01  TEST-RESULTS.                                                IF1364.2
004800     02 FILLER                   PIC X      VALUE SPACE.          IF1364.2
004900     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1364.2
005000     02 FILLER                   PIC X      VALUE SPACE.          IF1364.2
005100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1364.2
005200     02 FILLER                   PIC X      VALUE SPACE.          IF1364.2
005300     02  PAR-NAME.                                                IF1364.2
005400       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1364.2
005500       03  PARDOT-X              PIC X      VALUE SPACE.          IF1364.2
005600       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1364.2
005700     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1364.2
005800     02 RE-MARK                  PIC X(61).                       IF1364.2
005900 01  TEST-COMPUTED.                                               IF1364.2
006000     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1364.2
006100     02 FILLER                   PIC X(17)  VALUE                 IF1364.2
006200            "       COMPUTED=".                                   IF1364.2
006300     02 COMPUTED-X.                                               IF1364.2
006400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1364.2
006500     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1364.2
006600                                 PIC -9(9).9(9).                  IF1364.2
006700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1364.2
006800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1364.2
006900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1364.2
007000     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1364.2
007100         04 COMPUTED-18V0                    PIC -9(18).          IF1364.2
007200         04 FILLER                           PIC X.               IF1364.2
007300     03 FILLER PIC X(50) VALUE SPACE.                             IF1364.2
007400 01  TEST-CORRECT.                                                IF1364.2
007500     02 FILLER PIC X(30) VALUE SPACE.                             IF1364.2
007600     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1364.2
007700     02 CORRECT-X.                                                IF1364.2
007800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1364.2
007900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1364.2
008000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1364.2
008100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1364.2
008200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1364.2
008300     03      CR-18V0 REDEFINES CORRECT-A.                         IF1364.2
008400         04 CORRECT-18V0                     PIC -9(18).          IF1364.2
008500         04 FILLER                           PIC X.               IF1364.2
008600     03 FILLER PIC X(2) VALUE SPACE.                              IF1364.2
008700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1364.2
008800 01  TEST-CORRECT-MIN.                                            IF1364.2
008900     02 FILLER PIC X(30) VALUE SPACE.                             IF1364.2
009000     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1364.2
009100     02 CORRECTMI-X.                                              IF1364.2
009200     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1364.2
009300     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1364.2
009400     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1364.2
009500     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1364.2
009600     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1364.2
009700     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1364.2
009800         04 CORRECTMI-18V0                     PIC -9(18).        IF1364.2
009900         04 FILLER                           PIC X.               IF1364.2
010000     03 FILLER PIC X(2) VALUE SPACE.                              IF1364.2
010100     03 FILLER                           PIC X(48) VALUE SPACE.   IF1364.2
010200 01  TEST-CORRECT-MAX.                                            IF1364.2
010300     02 FILLER PIC X(30) VALUE SPACE.                             IF1364.2
010400     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1364.2
010500     02 CORRECTMA-X.                                              IF1364.2
010600     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1364.2
010700     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1364.2
010800     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1364.2
010900     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1364.2
011000     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1364.2
011100     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1364.2
011200         04 CORRECTMA-18V0                     PIC -9(18).        IF1364.2
011300         04 FILLER                           PIC X.               IF1364.2
011400     03 FILLER PIC X(2) VALUE SPACE.                              IF1364.2
011500     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1364.2
011600 01  CCVS-C-1.                                                    IF1364.2
011700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1364.2
011800-    "SS  PARAGRAPH-NAME                                          IF1364.2
011900-    "       REMARKS".                                            IF1364.2
012000     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1364.2
012100 01  CCVS-C-2.                                                    IF1364.2
012200     02 FILLER                     PIC X        VALUE SPACE.      IF1364.2
012300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1364.2
012400     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1364.2
012500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1364.2
012600     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1364.2
012700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1364.2
012800 01  REC-CT                        PIC 99       VALUE ZERO.       IF1364.2
012900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1364.2
013000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1364.2
013100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1364.2
013200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1364.2
013300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1364.2
013400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1364.2
013500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1364.2
013600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1364.2
013700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1364.2
013800 01  CCVS-H-1.                                                    IF1364.2
013900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1364.2
014000     02  FILLER                    PIC X(42)    VALUE             IF1364.2
014100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1364.2
014200     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1364.2
014300 01  CCVS-H-2A.                                                   IF1364.2
014400   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1364.2
014500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1364.2
014600   02  FILLER                        PIC XXXX   VALUE             IF1364.2
014700     "4.2 ".                                                      IF1364.2
014800   02  FILLER                        PIC X(28)  VALUE             IF1364.2
014900            " COPY - NOT FOR DISTRIBUTION".                       IF1364.2
015000   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1364.2
015100                                                                  IF1364.2
015200 01  CCVS-H-2B.                                                   IF1364.2
015300   02  FILLER                        PIC X(15)  VALUE             IF1364.2
015400            "TEST RESULT OF ".                                    IF1364.2
015500   02  TEST-ID                       PIC X(9).                    IF1364.2
015600   02  FILLER                        PIC X(4)   VALUE             IF1364.2
015700            " IN ".                                               IF1364.2
015800   02  FILLER                        PIC X(12)  VALUE             IF1364.2
015900     " HIGH       ".                                              IF1364.2
016000   02  FILLER                        PIC X(22)  VALUE             IF1364.2
016100            " LEVEL VALIDATION FOR ".                             IF1364.2
016200   02  FILLER                        PIC X(58)  VALUE             IF1364.2
016300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1364.2
016400 01  CCVS-H-3.                                                    IF1364.2
016500     02  FILLER                      PIC X(34)  VALUE             IF1364.2
016600            " FOR OFFICIAL USE ONLY    ".                         IF1364.2
016700     02  FILLER                      PIC X(58)  VALUE             IF1364.2
016800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1364.2
016900     02  FILLER                      PIC X(28)  VALUE             IF1364.2
017000            "  COPYRIGHT   1985 ".                                IF1364.2
017100 01  CCVS-E-1.                                                    IF1364.2
017200     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1364.2
017300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1364.2
017400     02 ID-AGAIN                     PIC X(9).                    IF1364.2
017500     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1364.2
017600 01  CCVS-E-2.                                                    IF1364.2
017700     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1364.2
017800     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1364.2
017900     02 CCVS-E-2-2.                                               IF1364.2
018000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1364.2
018100         03 FILLER                   PIC X      VALUE SPACE.      IF1364.2
018200         03 ENDER-DESC               PIC X(44)  VALUE             IF1364.2
018300            "ERRORS ENCOUNTERED".                                 IF1364.2
018400 01  CCVS-E-3.                                                    IF1364.2
018500     02  FILLER                      PIC X(22)  VALUE             IF1364.2
018600            " FOR OFFICIAL USE ONLY".                             IF1364.2
018700     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1364.2
018800     02  FILLER                      PIC X(58)  VALUE             IF1364.2
018900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1364.2
019000     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1364.2
019100     02 FILLER                       PIC X(15)  VALUE             IF1364.2
019200             " COPYRIGHT 1985".                                   IF1364.2
019300 01  CCVS-E-4.                                                    IF1364.2
019400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1364.2
019500     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1364.2
019600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1364.2
019700     02 FILLER                       PIC X(40)  VALUE             IF1364.2
019800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1364.2
019900 01  XXINFO.                                                      IF1364.2
020000     02 FILLER                       PIC X(19)  VALUE             IF1364.2
020100            "*** INFORMATION ***".                                IF1364.2
020200     02 INFO-TEXT.                                                IF1364.2
020300       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1364.2
020400       04 XXCOMPUTED                 PIC X(20).                   IF1364.2
020500       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1364.2
020600       04 XXCORRECT                  PIC X(20).                   IF1364.2
020700     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1364.2
020800 01  HYPHEN-LINE.                                                 IF1364.2
020900     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1364.2
021000     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1364.2
021100-    "*****************************************".                 IF1364.2
021200     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1364.2
021300-    "******************************".                            IF1364.2
021400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1364.2
021500     "IF136A".                                                    IF1364.2
021600 PROCEDURE DIVISION.                                              IF1364.2
021700 CCVS1 SECTION.                                                   IF1364.2
021800 OPEN-FILES.                                                      IF1364.2
021900     OPEN     OUTPUT PRINT-FILE.                                  IF1364.2
022000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1364.2
022100     MOVE    SPACE TO TEST-RESULTS.                               IF1364.2
022200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1364.2
022300     GO TO CCVS1-EXIT.                                            IF1364.2
022400 CLOSE-FILES.                                                     IF1364.2
022500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1364.2
022600 TERMINATE-CCVS.                                                  IF1364.2
022700     STOP     RUN.                                                IF1364.2
022800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1364.2
022900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1364.2
023000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1364.2
023100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1364.2
023200     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1364.2
023300 PRINT-DETAIL.                                                    IF1364.2
023400     IF REC-CT NOT EQUAL TO ZERO                                  IF1364.2
023500             MOVE "." TO PARDOT-X                                 IF1364.2
023600             MOVE REC-CT TO DOTVALUE.                             IF1364.2
023700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1364.2
023800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1364.2
023900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1364.2
024000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1364.2
024100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1364.2
024200     MOVE SPACE TO CORRECT-X.                                     IF1364.2
024300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1364.2
024400     MOVE     SPACE TO RE-MARK.                                   IF1364.2
024500 HEAD-ROUTINE.                                                    IF1364.2
024600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1364.2
024700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1364.2
024800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1364.2
024900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1364.2
025000 COLUMN-NAMES-ROUTINE.                                            IF1364.2
025100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1364.2
025200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1364.2
025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1364.2
025400 END-ROUTINE.                                                     IF1364.2
025500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1364.2
025600 END-RTN-EXIT.                                                    IF1364.2
025700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1364.2
025800 END-ROUTINE-1.                                                   IF1364.2
025900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1364.2
026000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1364.2
026100      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1364.2
026200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1364.2
026300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1364.2
026400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1364.2
026500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1364.2
026600  END-ROUTINE-12.                                                 IF1364.2
026700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1364.2
026800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1364.2
026900         MOVE "NO " TO ERROR-TOTAL                                IF1364.2
027000         ELSE                                                     IF1364.2
027100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1364.2
027200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1364.2
027300     PERFORM WRITE-LINE.                                          IF1364.2
027400 END-ROUTINE-13.                                                  IF1364.2
027500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1364.2
027600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1364.2
027700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1364.2
027800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1364.2
027900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1364.2
028000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1364.2
028100          MOVE "NO " TO ERROR-TOTAL                               IF1364.2
028200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1364.2
028300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1364.2
028400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1364.2
028500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1364.2
028600 WRITE-LINE.                                                      IF1364.2
028700     ADD 1 TO RECORD-COUNT.                                       IF1364.2
028800     IF RECORD-COUNT GREATER 42                                   IF1364.2
028900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1364.2
029000         MOVE SPACE TO DUMMY-RECORD                               IF1364.2
029100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1364.2
029200         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1364.2
029300         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1364.2
029400         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1364.2
029500         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1364.2
029600         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1364.2
029700         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1364.2
029800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1364.2
029900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1364.2
030000         MOVE ZERO TO RECORD-COUNT.                               IF1364.2
030100     PERFORM WRT-LN.                                              IF1364.2
030200 WRT-LN.                                                          IF1364.2
030300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1364.2
030400     MOVE SPACE TO DUMMY-RECORD.                                  IF1364.2
030500 BLANK-LINE-PRINT.                                                IF1364.2
030600     PERFORM WRT-LN.                                              IF1364.2
030700 FAIL-ROUTINE.                                                    IF1364.2
030800     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1364.2
030900            GO TO FAIL-ROUTINE-WRITE.                             IF1364.2
031000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1364.2
031100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1364.2
031200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1364.2
031300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1364.2
031400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1364.2
031500     GO TO  FAIL-ROUTINE-EX.                                      IF1364.2
031600 FAIL-ROUTINE-WRITE.                                              IF1364.2
031700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1364.2
031800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1364.2
031900                              CORMA-ANSI-REFERENCE.               IF1364.2
032000     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1364.2
032100           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1364.2
032200           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1364.2
032300     ELSE                                                         IF1364.2
032400           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1364.2
032500     PERFORM WRITE-LINE.                                          IF1364.2
032600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1364.2
032700 FAIL-ROUTINE-EX. EXIT.                                           IF1364.2
032800 BAIL-OUT.                                                        IF1364.2
032900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1364.2
033000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1364.2
033100 BAIL-OUT-WRITE.                                                  IF1364.2
033200     MOVE CORRECT-A TO XXCORRECT.                                 IF1364.2
033300     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1364.2
033400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1364.2
033500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1364.2
033600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1364.2
033700 BAIL-OUT-EX. EXIT.                                               IF1364.2
033800 CCVS1-EXIT.                                                      IF1364.2
033900     EXIT.                                                        IF1364.2
034100*                                                      *          IF1364.2
034200*    Intrinsic Function Tests         IF136A - SQRT    *          IF1364.2
034300*                                                      *          IF1364.2
034500 SECT-IF136A SECTION.                                             IF1364.2
034600 F-SQRT-INFO.                                                     IF1364.2
034700     MOVE     "See ref. A-69 2.40" TO ANSI-REFERENCE.             IF1364.2
034800     MOVE     "SQRT Function" TO FEATURE.                         IF1364.2
035000 F-SQRT-01.                                                       IF1364.2
035100     MOVE ZERO TO WS-NUM.                                         IF1364.2
035200     MOVE  0.000000 TO MIN-RANGE.                                 IF1364.2
035300     MOVE  0.000020 TO MAX-RANGE.                                 IF1364.2
035400 F-SQRT-TEST-01.                                                  IF1364.2
035500     COMPUTE WS-NUM = FUNCTION SQRT(0).                           IF1364.2
035600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
035700        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
035800                    PERFORM PASS                                  IF1364.2
035900     ELSE                                                         IF1364.2
036000                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
036100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
036200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
036300                    PERFORM FAIL.                                 IF1364.2
036400     GO TO F-SQRT-WRITE-01.                                       IF1364.2
036500 F-SQRT-DELETE-01.                                                IF1364.2
036600     PERFORM  DE-LETE.                                            IF1364.2
036700     GO TO    F-SQRT-WRITE-01.                                    IF1364.2
036800 F-SQRT-WRITE-01.                                                 IF1364.2
036900     MOVE "F-SQRT-01" TO PAR-NAME.                                IF1364.2
037000     PERFORM  PRINT-DETAIL.                                       IF1364.2
037200 F-SQRT-02.                                                       IF1364.2
037300     EVALUATE FUNCTION SQRT(1)                                    IF1364.2
037400     WHEN 0.999980 THRU 1.00002                                   IF1364.2
037500                    PERFORM PASS                                  IF1364.2
037600     WHEN OTHER                                                   IF1364.2
037700                    PERFORM FAIL.                                 IF1364.2
037800     GO TO F-SQRT-WRITE-02.                                       IF1364.2
037900 F-SQRT-DELETE-02.                                                IF1364.2
038000     PERFORM  DE-LETE.                                            IF1364.2
038100     GO TO    F-SQRT-WRITE-02.                                    IF1364.2
038200 F-SQRT-WRITE-02.                                                 IF1364.2
038300     MOVE "F-SQRT-02" TO PAR-NAME.                                IF1364.2
038400     PERFORM  PRINT-DETAIL.                                       IF1364.2
038600 F-SQRT-03.                                                       IF1364.2
038700     MOVE  1.99996 TO MIN-RANGE.                                  IF1364.2
038800     MOVE  2.00004 TO MAX-RANGE.                                  IF1364.2
038900 F-SQRT-TEST-03.                                                  IF1364.2
039000     IF (FUNCTION SQRT(4) >= MIN-RANGE) AND                       IF1364.2
039100        (FUNCTION SQRT(4) <= MAX-RANGE) THEN                      IF1364.2
039200                    PERFORM PASS                                  IF1364.2
039300     ELSE                                                         IF1364.2
039400                    PERFORM FAIL.                                 IF1364.2
039500     GO TO F-SQRT-WRITE-03.                                       IF1364.2
039600 F-SQRT-DELETE-03.                                                IF1364.2
039700     PERFORM  DE-LETE.                                            IF1364.2
039800     GO TO    F-SQRT-WRITE-03.                                    IF1364.2
039900 F-SQRT-WRITE-03.                                                 IF1364.2
040000     MOVE "F-SQRT-03" TO PAR-NAME.                                IF1364.2
040100     PERFORM  PRINT-DETAIL.                                       IF1364.2
040300 F-SQRT-04.                                                       IF1364.2
040400     MOVE ZERO TO WS-NUM.                                         IF1364.2
040500     MOVE  0.031621 TO MIN-RANGE.                                 IF1364.2
040600     MOVE  0.031623 TO MAX-RANGE.                                 IF1364.2
040700 F-SQRT-TEST-04.                                                  IF1364.2
040800     COMPUTE WS-NUM = FUNCTION SQRT(.001).                        IF1364.2
040900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
041000        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
041100                    PERFORM PASS                                  IF1364.2
041200     ELSE                                                         IF1364.2
041300                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
041400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
041500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
041600                    PERFORM FAIL.                                 IF1364.2
041700     GO TO F-SQRT-WRITE-04.                                       IF1364.2
041800 F-SQRT-DELETE-04.                                                IF1364.2
041900     PERFORM  DE-LETE.                                            IF1364.2
042000     GO TO    F-SQRT-WRITE-04.                                    IF1364.2
042100 F-SQRT-WRITE-04.                                                 IF1364.2
042200     MOVE "F-SQRT-04" TO PAR-NAME.                                IF1364.2
042300     PERFORM  PRINT-DETAIL.                                       IF1364.2
042500 F-SQRT-05.                                                       IF1364.2
042600     MOVE ZERO TO WS-NUM.                                         IF1364.2
042700     MOVE  0.999479 TO MIN-RANGE.                                 IF1364.2
042800     MOVE  0.999519 TO MAX-RANGE.                                 IF1364.2
042900 F-SQRT-TEST-05.                                                  IF1364.2
043000     COMPUTE WS-NUM = FUNCTION SQRT(.999).                        IF1364.2
043100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
043200        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
043300                    PERFORM PASS                                  IF1364.2
043400     ELSE                                                         IF1364.2
043500                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
043600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
043700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
043800                    PERFORM FAIL.                                 IF1364.2
043900     GO TO F-SQRT-WRITE-05.                                       IF1364.2
044000 F-SQRT-DELETE-05.                                                IF1364.2
044100     PERFORM  DE-LETE.                                            IF1364.2
044200     GO TO    F-SQRT-WRITE-05.                                    IF1364.2
044300 F-SQRT-WRITE-05.                                                 IF1364.2
044400     MOVE "F-SQRT-05" TO PAR-NAME.                                IF1364.2
044500     PERFORM  PRINT-DETAIL.                                       IF1364.2
044700 F-SQRT-06.                                                       IF1364.2
044800     MOVE ZERO TO WS-NUM.                                         IF1364.2
044900     MOVE  2.00246 TO MIN-RANGE.                                  IF1364.2
045000     MOVE  2.00254 TO MAX-RANGE.                                  IF1364.2
045100 F-SQRT-TEST-06.                                                  IF1364.2
045200     COMPUTE WS-NUM = FUNCTION SQRT(4.01).                        IF1364.2
045300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
045400        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
045500                    PERFORM PASS                                  IF1364.2
045600     ELSE                                                         IF1364.2
045700                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
045800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
045900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
046000                    PERFORM FAIL.                                 IF1364.2
046100     GO TO F-SQRT-WRITE-06.                                       IF1364.2
046200 F-SQRT-DELETE-06.                                                IF1364.2
046300     PERFORM  DE-LETE.                                            IF1364.2
046400     GO TO    F-SQRT-WRITE-06.                                    IF1364.2
046500 F-SQRT-WRITE-06.                                                 IF1364.2
046600     MOVE "F-SQRT-06" TO PAR-NAME.                                IF1364.2
046700     PERFORM  PRINT-DETAIL.                                       IF1364.2
046900 F-SQRT-07.                                                       IF1364.2
047000     MOVE ZERO TO WS-NUM.                                         IF1364.2
047100     MOVE  177.224 TO MIN-RANGE.                                  IF1364.2
047200     MOVE  177.231 TO MAX-RANGE.                                  IF1364.2
047300 F-SQRT-TEST-07.                                                  IF1364.2
047400     COMPUTE WS-NUM = FUNCTION SQRT(31409.84).                    IF1364.2
047500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
047600        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
047700                    PERFORM PASS                                  IF1364.2
047800     ELSE                                                         IF1364.2
047900                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
048000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
048100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
048200                    PERFORM FAIL.                                 IF1364.2
048300     GO TO F-SQRT-WRITE-07.                                       IF1364.2
048400 F-SQRT-DELETE-07.                                                IF1364.2
048500     PERFORM  DE-LETE.                                            IF1364.2
048600     GO TO    F-SQRT-WRITE-07.                                    IF1364.2
048700 F-SQRT-WRITE-07.                                                 IF1364.2
048800     MOVE "F-SQRT-07" TO PAR-NAME.                                IF1364.2
048900     PERFORM  PRINT-DETAIL.                                       IF1364.2
049100 F-SQRT-08.                                                       IF1364.2
049200     MOVE ZERO TO WS-NUM.                                         IF1364.2
049300     MOVE  927.342 TO MIN-RANGE.                                  IF1364.2
049400     MOVE  927.379 TO MAX-RANGE.                                  IF1364.2
049500 F-SQRT-TEST-08.                                                  IF1364.2
049600     COMPUTE WS-NUM = FUNCTION SQRT(860000).                      IF1364.2
049700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
049800        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
049900                    PERFORM PASS                                  IF1364.2
050000     ELSE                                                         IF1364.2
050100                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
050200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
050300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
050400                    PERFORM FAIL.                                 IF1364.2
050500     GO TO F-SQRT-WRITE-08.                                       IF1364.2
050600 F-SQRT-DELETE-08.                                                IF1364.2
050700     PERFORM  DE-LETE.                                            IF1364.2
050800     GO TO    F-SQRT-WRITE-08.                                    IF1364.2
050900 F-SQRT-WRITE-08.                                                 IF1364.2
051000     MOVE "F-SQRT-08" TO PAR-NAME.                                IF1364.2
051100     PERFORM  PRINT-DETAIL.                                       IF1364.2
051300 F-SQRT-09.                                                       IF1364.2
051400     MOVE ZERO TO WS-NUM.                                         IF1364.2
051500     MOVE  0.0094866 TO MIN-RANGE.                                IF1364.2
051600     MOVE  0.0094870 TO MAX-RANGE.                                IF1364.2
051700 F-SQRT-TEST-09.                                                  IF1364.2
051800     COMPUTE WS-NUM = FUNCTION SQRT(.00009).                      IF1364.2
051900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
052000        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
052100                    PERFORM PASS                                  IF1364.2
052200     ELSE                                                         IF1364.2
052300                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
052400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
052500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
052600                    PERFORM FAIL.                                 IF1364.2
052700     GO TO F-SQRT-WRITE-09.                                       IF1364.2
052800 F-SQRT-DELETE-09.                                                IF1364.2
052900     PERFORM  DE-LETE.                                            IF1364.2
053000     GO TO    F-SQRT-WRITE-09.                                    IF1364.2
053100 F-SQRT-WRITE-09.                                                 IF1364.2
053200     MOVE "F-SQRT-09" TO PAR-NAME.                                IF1364.2
053300     PERFORM  PRINT-DETAIL.                                       IF1364.2
053500 F-SQRT-10.                                                       IF1364.2
053600     MOVE ZERO TO WS-NUM.                                         IF1364.2
053700     MOVE  118.320 TO MIN-RANGE.                                  IF1364.2
053800     MOVE  118.324 TO MAX-RANGE.                                  IF1364.2
053900 F-SQRT-TEST-10.                                                  IF1364.2
054000     COMPUTE WS-NUM = FUNCTION SQRT(B).                           IF1364.2
054100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
054200        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
054300                    PERFORM PASS                                  IF1364.2
054400     ELSE                                                         IF1364.2
054500                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
054600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
054700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
054800                    PERFORM FAIL.                                 IF1364.2
054900     GO TO F-SQRT-WRITE-10.                                       IF1364.2
055000 F-SQRT-DELETE-10.                                                IF1364.2
055100     PERFORM  DE-LETE.                                            IF1364.2
055200     GO TO    F-SQRT-WRITE-10.                                    IF1364.2
055300 F-SQRT-WRITE-10.                                                 IF1364.2
055400     MOVE "F-SQRT-10" TO PAR-NAME.                                IF1364.2
055500     PERFORM  PRINT-DETAIL.                                       IF1364.2
055700 F-SQRT-11.                                                       IF1364.2
055800     MOVE ZERO TO WS-NUM.                                         IF1364.2
055900     MOVE  316.222 TO MIN-RANGE.                                  IF1364.2
056000     MOVE  316.234 TO MAX-RANGE.                                  IF1364.2
056100 F-SQRT-TEST-11.                                                  IF1364.2
056200     COMPUTE WS-NUM = FUNCTION SQRT(C).                           IF1364.2
056300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
056400        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
056500                    PERFORM PASS                                  IF1364.2
056600     ELSE                                                         IF1364.2
056700                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
056800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
056900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
057000                    PERFORM FAIL.                                 IF1364.2
057100     GO TO F-SQRT-WRITE-11.                                       IF1364.2
057200 F-SQRT-DELETE-11.                                                IF1364.2
057300     PERFORM  DE-LETE.                                            IF1364.2
057400     GO TO    F-SQRT-WRITE-11.                                    IF1364.2
057500 F-SQRT-WRITE-11.                                                 IF1364.2
057600     MOVE "F-SQRT-11" TO PAR-NAME.                                IF1364.2
057700     PERFORM  PRINT-DETAIL.                                       IF1364.2
057900 F-SQRT-12.                                                       IF1364.2
058000     MOVE ZERO TO WS-NUM.                                         IF1364.2
058100     MOVE  0.0063244 TO MIN-RANGE.                                IF1364.2
058200     MOVE  0.0063246 TO MAX-RANGE.                                IF1364.2
058300 F-SQRT-TEST-12.                                                  IF1364.2
058400     COMPUTE WS-NUM = FUNCTION SQRT(A).                           IF1364.2
058500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
058600        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
058700                    PERFORM PASS                                  IF1364.2
058800     ELSE                                                         IF1364.2
058900                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
059000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
059100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
059200                    PERFORM FAIL.                                 IF1364.2
059300     GO TO F-SQRT-WRITE-12.                                       IF1364.2
059400 F-SQRT-DELETE-12.                                                IF1364.2
059500     PERFORM  DE-LETE.                                            IF1364.2
059600     GO TO    F-SQRT-WRITE-12.                                    IF1364.2
059700 F-SQRT-WRITE-12.                                                 IF1364.2
059800     MOVE "F-SQRT-12" TO PAR-NAME.                                IF1364.2
059900     PERFORM  PRINT-DETAIL.                                       IF1364.2
060100 F-SQRT-13.                                                       IF1364.2
060200     MOVE ZERO TO WS-NUM.                                         IF1364.2
060300     MOVE  1.99996 TO MIN-RANGE.                                  IF1364.2
060400     MOVE  2.00004 TO MAX-RANGE.                                  IF1364.2
060500 F-SQRT-TEST-13.                                                  IF1364.2
060600     COMPUTE WS-NUM = FUNCTION SQRT(IND(P)).                      IF1364.2
060700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
060800        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
060900                    PERFORM PASS                                  IF1364.2
061000     ELSE                                                         IF1364.2
061100                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
061200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
061300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
061400                    PERFORM FAIL.                                 IF1364.2
061500     GO TO F-SQRT-WRITE-13.                                       IF1364.2
061600 F-SQRT-DELETE-13.                                                IF1364.2
061700     PERFORM  DE-LETE.                                            IF1364.2
061800     GO TO    F-SQRT-WRITE-13.                                    IF1364.2
061900 F-SQRT-WRITE-13.                                                 IF1364.2
062000     MOVE "F-SQRT-13" TO PAR-NAME.                                IF1364.2
062100     PERFORM  PRINT-DETAIL.                                       IF1364.2
062300 F-SQRT-14.                                                       IF1364.2
062400     MOVE ZERO TO WS-NUM.                                         IF1364.2
062500     MOVE  2.23601 TO MIN-RANGE.                                  IF1364.2
062600     MOVE  2.23610 TO MAX-RANGE.                                  IF1364.2
062700 F-SQRT-TEST-14.                                                  IF1364.2
062800     COMPUTE WS-NUM = FUNCTION SQRT(IND(3)).                      IF1364.2
062900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
063000        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
063100                    PERFORM PASS                                  IF1364.2
063200     ELSE                                                         IF1364.2
063300                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
063400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
063500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
063600                    PERFORM FAIL.                                 IF1364.2
063700     GO TO F-SQRT-WRITE-14.                                       IF1364.2
063800 F-SQRT-DELETE-14.                                                IF1364.2
063900     PERFORM  DE-LETE.                                            IF1364.2
064000     GO TO    F-SQRT-WRITE-14.                                    IF1364.2
064100 F-SQRT-WRITE-14.                                                 IF1364.2
064200     MOVE "F-SQRT-14" TO PAR-NAME.                                IF1364.2
064300     PERFORM  PRINT-DETAIL.                                       IF1364.2
064500 F-SQRT-15.                                                       IF1364.2
064600     MOVE ZERO TO WS-NUM.                                         IF1364.2
064700     MOVE  0.316214  TO MIN-RANGE.                                IF1364.2
064800     MOVE  0.316240 TO MAX-RANGE.                                 IF1364.2
064900 F-SQRT-TEST-15.                                                  IF1364.2
065000     COMPUTE WS-NUM = FUNCTION SQRT(9 - 8.9).                     IF1364.2
065100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
065200        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
065300                    PERFORM PASS                                  IF1364.2
065400     ELSE                                                         IF1364.2
065500                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
065600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
065700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
065800                    PERFORM FAIL.                                 IF1364.2
065900     GO TO F-SQRT-WRITE-15.                                       IF1364.2
066000 F-SQRT-DELETE-15.                                                IF1364.2
066100     PERFORM  DE-LETE.                                            IF1364.2
066200     GO TO    F-SQRT-WRITE-15.                                    IF1364.2
066300 F-SQRT-WRITE-15.                                                 IF1364.2
066400     MOVE "F-SQRT-15" TO PAR-NAME.                                IF1364.2
066500     PERFORM  PRINT-DETAIL.                                       IF1364.2
066700 F-SQRT-16.                                                       IF1364.2
066800     MOVE ZERO TO WS-NUM.                                         IF1364.2
066900     MOVE  1.95172  TO MIN-RANGE.                                 IF1364.2
067000     MOVE  1.95188 TO MAX-RANGE.                                  IF1364.2
067100 F-SQRT-TEST-16.                                                  IF1364.2
067200     COMPUTE WS-NUM = FUNCTION SQRT(8 / 2.1).                     IF1364.2
067300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
067400        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
067500                    PERFORM PASS                                  IF1364.2
067600     ELSE                                                         IF1364.2
067700                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
067800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
067900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
068000                    PERFORM FAIL.                                 IF1364.2
068100     GO TO F-SQRT-WRITE-16.                                       IF1364.2
068200 F-SQRT-DELETE-16.                                                IF1364.2
068300     PERFORM  DE-LETE.                                            IF1364.2
068400     GO TO    F-SQRT-WRITE-16.                                    IF1364.2
068500 F-SQRT-WRITE-16.                                                 IF1364.2
068600     MOVE "F-SQRT-16" TO PAR-NAME.                                IF1364.2
068700     PERFORM  PRINT-DETAIL.                                       IF1364.2
068900 F-SQRT-17.                                                       IF1364.2
069000     MOVE ZERO TO WS-NUM.                                         IF1364.2
069100     MOVE  17.7475 TO MIN-RANGE.                                  IF1364.2
069200     MOVE  17.7489 TO MAX-RANGE.                                  IF1364.2
069300 F-SQRT-TEST-17.                                                  IF1364.2
069400     COMPUTE WS-NUM = FUNCTION SQRT(35 * 9).                      IF1364.2
069500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
069600        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
069700                    PERFORM PASS                                  IF1364.2
069800     ELSE                                                         IF1364.2
069900                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
070000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
070100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
070200                    PERFORM FAIL.                                 IF1364.2
070300     GO TO F-SQRT-WRITE-17.                                       IF1364.2
070400 F-SQRT-DELETE-17.                                                IF1364.2
070500     PERFORM  DE-LETE.                                            IF1364.2
070600     GO TO    F-SQRT-WRITE-17.                                    IF1364.2
070700 F-SQRT-WRITE-17.                                                 IF1364.2
070800     MOVE "F-SQRT-17" TO PAR-NAME.                                IF1364.2
070900     PERFORM  PRINT-DETAIL.                                       IF1364.2
071100 F-SQRT-18.                                                       IF1364.2
071200     MOVE ZERO TO WS-NUM.                                         IF1364.2
071300     MOVE  1.13384 TO MIN-RANGE.                                  IF1364.2
071400     MOVE  1.13393 TO MAX-RANGE.                                  IF1364.2
071500 F-SQRT-TEST-18.                                                  IF1364.2
071600     COMPUTE WS-NUM = FUNCTION SQRT(9 / 7).                       IF1364.2
071700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
071800        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
071900                    PERFORM PASS                                  IF1364.2
072000     ELSE                                                         IF1364.2
072100                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
072200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
072300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
072400                    PERFORM FAIL.                                 IF1364.2
072500     GO TO F-SQRT-WRITE-18.                                       IF1364.2
072600 F-SQRT-DELETE-18.                                                IF1364.2
072700     PERFORM  DE-LETE.                                            IF1364.2
072800     GO TO    F-SQRT-WRITE-18.                                    IF1364.2
072900 F-SQRT-WRITE-18.                                                 IF1364.2
073000     MOVE "F-SQRT-18" TO PAR-NAME.                                IF1364.2
073100     PERFORM  PRINT-DETAIL.                                       IF1364.2
073300 F-SQRT-19.                                                       IF1364.2
073400     MOVE ZERO TO WS-NUM.                                         IF1364.2
073500     MOVE  3.60541   TO MIN-RANGE.                                IF1364.2
073600     MOVE  3.60569 TO MAX-RANGE.                                  IF1364.2
073700 F-SQRT-TEST-19.                                                  IF1364.2
073800     COMPUTE WS-NUM = FUNCTION SQRT(E + F).                       IF1364.2
073900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
074000        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
074100                    PERFORM PASS                                  IF1364.2
074200     ELSE                                                         IF1364.2
074300                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
074400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
074500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
074600                    PERFORM FAIL.                                 IF1364.2
074700     GO TO F-SQRT-WRITE-19.                                       IF1364.2
074800 F-SQRT-DELETE-19.                                                IF1364.2
074900     PERFORM  DE-LETE.                                            IF1364.2
075000     GO TO    F-SQRT-WRITE-19.                                    IF1364.2
075100 F-SQRT-WRITE-19.                                                 IF1364.2
075200     MOVE "F-SQRT-19" TO PAR-NAME.                                IF1364.2
075300     PERFORM  PRINT-DETAIL.                                       IF1364.2
075500 F-SQRT-20.                                                       IF1364.2
075600     MOVE ZERO TO WS-NUM.                                         IF1364.2
075700     MOVE  11.9517 TO MIN-RANGE.                                  IF1364.2
075800     MOVE  11.9527 TO MAX-RANGE.                                  IF1364.2
075900 F-SQRT-TEST-20.                                                  IF1364.2
076000     COMPUTE WS-NUM = FUNCTION SQRT(D / E).                       IF1364.2
076100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
076200        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
076300                    PERFORM PASS                                  IF1364.2
076400     ELSE                                                         IF1364.2
076500                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
076600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
076700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
076800                    PERFORM FAIL.                                 IF1364.2
076900     GO TO F-SQRT-WRITE-20.                                       IF1364.2
077000 F-SQRT-DELETE-20.                                                IF1364.2
077100     PERFORM  DE-LETE.                                            IF1364.2
077200     GO TO    F-SQRT-WRITE-20.                                    IF1364.2
077300 F-SQRT-WRITE-20.                                                 IF1364.2
077400     MOVE "F-SQRT-20" TO PAR-NAME.                                IF1364.2
077500     PERFORM  PRINT-DETAIL.                                       IF1364.2
077700 F-SQRT-21.                                                       IF1364.2
077800     MOVE ZERO TO WS-NUM.                                         IF1364.2
077900     MOVE  1.73198 TO MIN-RANGE.                                  IF1364.2
078000     MOVE  1.73212 TO MAX-RANGE.                                  IF1364.2
078100 F-SQRT-TEST-21.                                                  IF1364.2
078200     COMPUTE WS-NUM = FUNCTION SQRT(F - 3).                       IF1364.2
078300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
078400        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
078500                    PERFORM PASS                                  IF1364.2
078600     ELSE                                                         IF1364.2
078700                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
078800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
078900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
079000                    PERFORM FAIL.                                 IF1364.2
079100     GO TO F-SQRT-WRITE-21.                                       IF1364.2
079200 F-SQRT-DELETE-21.                                                IF1364.2
079300     PERFORM  DE-LETE.                                            IF1364.2
079400     GO TO    F-SQRT-WRITE-21.                                    IF1364.2
079500 F-SQRT-WRITE-21.                                                 IF1364.2
079600     MOVE "F-SQRT-21" TO PAR-NAME.                                IF1364.2
079700     PERFORM  PRINT-DETAIL.                                       IF1364.2
079900 F-SQRT-22.                                                       IF1364.2
080000     MOVE ZERO TO WS-NUM.                                         IF1364.2
080100     MOVE  4.01232 TO MIN-RANGE.                                  IF1364.2
080200     MOVE  4.01264 TO MAX-RANGE.                                  IF1364.2
080300 F-SQRT-TEST-22.                                                  IF1364.2
080400     COMPUTE WS-NUM = FUNCTION SQRT(E * 2.3).                     IF1364.2
080500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
080600        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
080700                    PERFORM PASS                                  IF1364.2
080800     ELSE                                                         IF1364.2
080900                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
081000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
081100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
081200                    PERFORM FAIL.                                 IF1364.2
081300     GO TO F-SQRT-WRITE-22.                                       IF1364.2
081400 F-SQRT-DELETE-22.                                                IF1364.2
081500     PERFORM  DE-LETE.                                            IF1364.2
081600     GO TO    F-SQRT-WRITE-22.                                    IF1364.2
081700 F-SQRT-WRITE-22.                                                 IF1364.2
081800     MOVE "F-SQRT-22" TO PAR-NAME.                                IF1364.2
081900     PERFORM  PRINT-DETAIL.                                       IF1364.2
082100 F-SQRT-23.                                                       IF1364.2
082200     MOVE ZERO TO WS-NUM.                                         IF1364.2
082300     MOVE 1.56502 TO MIN-RANGE.                                   IF1364.2
082400     MOVE 1.56514 TO MAX-RANGE.                                   IF1364.2
082500 F-SQRT-TEST-23.                                                  IF1364.2
082600     COMPUTE WS-NUM = FUNCTION SQRT(FUNCTION SQRT(F)).            IF1364.2
082700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
082800        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
082900                    PERFORM PASS                                  IF1364.2
083000     ELSE                                                         IF1364.2
083100                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
083200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
083300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
083400                    PERFORM FAIL.                                 IF1364.2
083500     GO TO F-SQRT-WRITE-23.                                       IF1364.2
083600 F-SQRT-DELETE-23.                                                IF1364.2
083700     PERFORM  DE-LETE.                                            IF1364.2
083800     GO TO    F-SQRT-WRITE-23.                                    IF1364.2
083900 F-SQRT-WRITE-23.                                                 IF1364.2
084000     MOVE "F-SQRT-23" TO PAR-NAME.                                IF1364.2
084100     PERFORM  PRINT-DETAIL.                                       IF1364.2
084300 F-SQRT-24.                                                       IF1364.2
084400     MOVE ZERO TO WS-NUM.                                         IF1364.2
084500     MOVE 4.87309 TO MIN-RANGE.                                   IF1364.2
084600     MOVE 4.87348 TO MAX-RANGE.                                   IF1364.2
084700 F-SQRT-TEST-24.                                                  IF1364.2
084800     COMPUTE WS-NUM = FUNCTION SQRT(6.5) +                        IF1364.2
084900                      FUNCTION SQRT(5.4).                         IF1364.2
085000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
085100        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
085200                    PERFORM PASS                                  IF1364.2
085300     ELSE                                                         IF1364.2
085400                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
085500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
085600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
085700                    PERFORM FAIL.                                 IF1364.2
085800     GO TO F-SQRT-WRITE-24.                                       IF1364.2
085900 F-SQRT-DELETE-24.                                                IF1364.2
086000     PERFORM  DE-LETE.                                            IF1364.2
086100     GO TO    F-SQRT-WRITE-24.                                    IF1364.2
086200 F-SQRT-WRITE-24.                                                 IF1364.2
086300     MOVE "F-SQRT-24" TO PAR-NAME.                                IF1364.2
086400     PERFORM  PRINT-DETAIL.                                       IF1364.2
086600 F-SQRT-25.                                                       IF1364.2
086700     MOVE ZERO TO WS-NUM.                                         IF1364.2
086800     MOVE 9.99960 TO MIN-RANGE.                                   IF1364.2
086900     MOVE 10.0004 TO MAX-RANGE.                                   IF1364.2
087000 F-SQRT-TEST-25.                                                  IF1364.2
087100     COMPUTE WS-NUM = FUNCTION SQRT(10) ** 2.                     IF1364.2
087200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1364.2
087300        (WS-NUM <= MAX-RANGE) THEN                                IF1364.2
087400                    PERFORM PASS                                  IF1364.2
087500     ELSE                                                         IF1364.2
087600                    MOVE WS-NUM TO COMPUTED-N                     IF1364.2
087700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1364.2
087800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1364.2
087900                    PERFORM FAIL.                                 IF1364.2
088000     GO TO F-SQRT-WRITE-25.                                       IF1364.2
088100 F-SQRT-DELETE-25.                                                IF1364.2
088200     PERFORM  DE-LETE.                                            IF1364.2
088300     GO TO    F-SQRT-WRITE-25.                                    IF1364.2
088400 F-SQRT-WRITE-25.                                                 IF1364.2
088500     MOVE "F-SQRT-25" TO PAR-NAME.                                IF1364.2
088600     PERFORM  PRINT-DETAIL.                                       IF1364.2
088800 F-SQRT-26.                                                       IF1364.2
088900     PERFORM F-SQRT-TEST-26                                       IF1364.2
089000       UNTIL FUNCTION SQRT(ARG1) < 2.0.                           IF1364.2
089100     PERFORM PASS.                                                IF1364.2
089200     GO TO F-SQRT-WRITE-26.                                       IF1364.2
089300 F-SQRT-TEST-26.                                                  IF1364.2
089400     COMPUTE ARG1 = ARG1 - 1.                                     IF1364.2
089500 F-SQRT-DELETE-26.                                                IF1364.2
089600     PERFORM  DE-LETE.                                            IF1364.2
089700     GO TO    F-SQRT-WRITE-26.                                    IF1364.2
089800 F-SQRT-WRITE-26.                                                 IF1364.2
089900     MOVE "F-SQRT-26" TO PAR-NAME.                                IF1364.2
090000     PERFORM  PRINT-DETAIL.                                       IF1364.2
090200 CCVS-EXIT SECTION.                                               IF1364.2
090300 CCVS-999999.                                                     IF1364.2
090400     GO TO CLOSE-FILES.                                           IF1364.2
