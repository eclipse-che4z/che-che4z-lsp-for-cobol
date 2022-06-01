000100 IDENTIFICATION DIVISION.                                         IF1214.2
000200 PROGRAM-ID.                                                      IF1214.2
000300     IF121A.                                                      IF1214.2
000400                                                                  IF1214.2
000600*                                                         *       IF1214.2
000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1214.2
000800* It contains tests for the Intrinsic Function MEDIAN.    *       IF1214.2
000900*                                                         *       IF1214.2
001100 ENVIRONMENT DIVISION.                                            IF1214.2
001200 CONFIGURATION SECTION.                                           IF1214.2
001300 SOURCE-COMPUTER.                                                 IF1214.2
001400     XXXXX082.                                                    IF1214.2
001500 OBJECT-COMPUTER.                                                 IF1214.2
001600     XXXXX083.                                                    IF1214.2
001700 INPUT-OUTPUT SECTION.                                            IF1214.2
001800 FILE-CONTROL.                                                    IF1214.2
001900     SELECT PRINT-FILE ASSIGN TO                                  IF1214.2
002000     XXXXX055.                                                    IF1214.2
002100 DATA DIVISION.                                                   IF1214.2
002200 FILE SECTION.                                                    IF1214.2
002300 FD  PRINT-FILE.                                                  IF1214.2
002400 01  PRINT-REC PICTURE X(120).                                    IF1214.2
002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1214.2
002600 WORKING-STORAGE SECTION.                                         IF1214.2
002800* Variables specific to the Intrinsic Function Test IF121A*       IF1214.2
003000 01  A                   PIC S9(10)          VALUE 5.             IF1214.2
003100 01  B                   PIC S9(10)          VALUE 7.             IF1214.2
003200 01  C                   PIC S9(10)          VALUE -4.            IF1214.2
003300 01  D                   PIC S9(10)          VALUE 10.            IF1214.2
003400 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1214.2
003500 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1214.2
003600 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1214.2
003700 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1214.2
003800 01  M                   PIC S9(10)          VALUE 320000.        IF1214.2
003900 01  N                   PIC S9(10)          VALUE 650000.        IF1214.2
004000 01  O                   PIC S9(10)          VALUE -430000.       IF1214.2
004100 01  P                   PIC S9(10)          VALUE 1.             IF1214.2
004200 01  Q                   PIC S9(10)          VALUE 3.             IF1214.2
004300 01  R                   PIC S9(10)          VALUE 5.             IF1214.2
004400 01  ARG1                PIC S9(10)          VALUE 2.             IF1214.2
004500 01  ARG2                PIC S9(10)          VALUE 2.             IF1214.2
004600 01  ARR                                     VALUE "40537".       IF1214.2
004700     02  IND OCCURS 5 TIMES PIC 9.                                IF1214.2
004800 01  TEMP                PIC S9(10)V9(5).                         IF1214.2
004900 01  WS-NUM              PIC S9(6)V9(7).                          IF1214.2
005000 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1214.2
005100 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1214.2
005200*                                                                 IF1214.2
005400*                                                                 IF1214.2
005500 01  TEST-RESULTS.                                                IF1214.2
005600     02 FILLER                   PIC X      VALUE SPACE.          IF1214.2
005700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1214.2
005800     02 FILLER                   PIC X      VALUE SPACE.          IF1214.2
005900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1214.2
006000     02 FILLER                   PIC X      VALUE SPACE.          IF1214.2
006100     02  PAR-NAME.                                                IF1214.2
006200       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1214.2
006300       03  PARDOT-X              PIC X      VALUE SPACE.          IF1214.2
006400       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1214.2
006500     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1214.2
006600     02 RE-MARK                  PIC X(61).                       IF1214.2
006700 01  TEST-COMPUTED.                                               IF1214.2
006800     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1214.2
006900     02 FILLER                   PIC X(17)  VALUE                 IF1214.2
007000            "       COMPUTED=".                                   IF1214.2
007100     02 COMPUTED-X.                                               IF1214.2
007200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1214.2
007300     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1214.2
007400                                 PIC -9(9).9(9).                  IF1214.2
007500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1214.2
007600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1214.2
007700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1214.2
007800     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1214.2
007900         04 COMPUTED-18V0                    PIC -9(18).          IF1214.2
008000         04 FILLER                           PIC X.               IF1214.2
008100     03 FILLER PIC X(50) VALUE SPACE.                             IF1214.2
008200 01  TEST-CORRECT.                                                IF1214.2
008300     02 FILLER PIC X(30) VALUE SPACE.                             IF1214.2
008400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1214.2
008500     02 CORRECT-X.                                                IF1214.2
008600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1214.2
008700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1214.2
008800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1214.2
008900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1214.2
009000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1214.2
009100     03      CR-18V0 REDEFINES CORRECT-A.                         IF1214.2
009200         04 CORRECT-18V0                     PIC -9(18).          IF1214.2
009300         04 FILLER                           PIC X.               IF1214.2
009400     03 FILLER PIC X(2) VALUE SPACE.                              IF1214.2
009500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1214.2
009600 01  TEST-CORRECT-MIN.                                            IF1214.2
009700     02 FILLER PIC X(30) VALUE SPACE.                             IF1214.2
009800     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1214.2
009900     02 CORRECTMI-X.                                              IF1214.2
010000     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1214.2
010100     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1214.2
010200     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1214.2
010300     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1214.2
010400     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1214.2
010500     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1214.2
010600         04 CORRECTMI-18V0                     PIC -9(18).        IF1214.2
010700         04 FILLER                           PIC X.               IF1214.2
010800     03 FILLER PIC X(2) VALUE SPACE.                              IF1214.2
010900     03 FILLER                           PIC X(48) VALUE SPACE.   IF1214.2
011000 01  TEST-CORRECT-MAX.                                            IF1214.2
011100     02 FILLER PIC X(30) VALUE SPACE.                             IF1214.2
011200     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1214.2
011300     02 CORRECTMA-X.                                              IF1214.2
011400     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1214.2
011500     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1214.2
011600     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1214.2
011700     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1214.2
011800     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1214.2
011900     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1214.2
012000         04 CORRECTMA-18V0                     PIC -9(18).        IF1214.2
012100         04 FILLER                           PIC X.               IF1214.2
012200     03 FILLER PIC X(2) VALUE SPACE.                              IF1214.2
012300     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1214.2
012400 01  CCVS-C-1.                                                    IF1214.2
012500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1214.2
012600-    "SS  PARAGRAPH-NAME                                          IF1214.2
012700-    "       REMARKS".                                            IF1214.2
012800     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1214.2
012900 01  CCVS-C-2.                                                    IF1214.2
013000     02 FILLER                     PIC X        VALUE SPACE.      IF1214.2
013100     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1214.2
013200     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1214.2
013300     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1214.2
013400     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1214.2
013500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1214.2
013600 01  REC-CT                        PIC 99       VALUE ZERO.       IF1214.2
013700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1214.2
013800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1214.2
013900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1214.2
014000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1214.2
014100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1214.2
014200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1214.2
014300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1214.2
014400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1214.2
014500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1214.2
014600 01  CCVS-H-1.                                                    IF1214.2
014700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1214.2
014800     02  FILLER                    PIC X(42)    VALUE             IF1214.2
014900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1214.2
015000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1214.2
015100 01  CCVS-H-2A.                                                   IF1214.2
015200   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1214.2
015300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1214.2
015400   02  FILLER                        PIC XXXX   VALUE             IF1214.2
015500     "4.2 ".                                                      IF1214.2
015600   02  FILLER                        PIC X(28)  VALUE             IF1214.2
015700            " COPY - NOT FOR DISTRIBUTION".                       IF1214.2
015800   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1214.2
015900                                                                  IF1214.2
016000 01  CCVS-H-2B.                                                   IF1214.2
016100   02  FILLER                        PIC X(15)  VALUE             IF1214.2
016200            "TEST RESULT OF ".                                    IF1214.2
016300   02  TEST-ID                       PIC X(9).                    IF1214.2
016400   02  FILLER                        PIC X(4)   VALUE             IF1214.2
016500            " IN ".                                               IF1214.2
016600   02  FILLER                        PIC X(12)  VALUE             IF1214.2
016700     " HIGH       ".                                              IF1214.2
016800   02  FILLER                        PIC X(22)  VALUE             IF1214.2
016900            " LEVEL VALIDATION FOR ".                             IF1214.2
017000   02  FILLER                        PIC X(58)  VALUE             IF1214.2
017100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1214.2
017200 01  CCVS-H-3.                                                    IF1214.2
017300     02  FILLER                      PIC X(34)  VALUE             IF1214.2
017400            " FOR OFFICIAL USE ONLY    ".                         IF1214.2
017500     02  FILLER                      PIC X(58)  VALUE             IF1214.2
017600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1214.2
017700     02  FILLER                      PIC X(28)  VALUE             IF1214.2
017800            "  COPYRIGHT   1985 ".                                IF1214.2
017900 01  CCVS-E-1.                                                    IF1214.2
018000     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1214.2
018100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1214.2
018200     02 ID-AGAIN                     PIC X(9).                    IF1214.2
018300     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1214.2
018400 01  CCVS-E-2.                                                    IF1214.2
018500     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1214.2
018600     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1214.2
018700     02 CCVS-E-2-2.                                               IF1214.2
018800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1214.2
018900         03 FILLER                   PIC X      VALUE SPACE.      IF1214.2
019000         03 ENDER-DESC               PIC X(44)  VALUE             IF1214.2
019100            "ERRORS ENCOUNTERED".                                 IF1214.2
019200 01  CCVS-E-3.                                                    IF1214.2
019300     02  FILLER                      PIC X(22)  VALUE             IF1214.2
019400            " FOR OFFICIAL USE ONLY".                             IF1214.2
019500     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1214.2
019600     02  FILLER                      PIC X(58)  VALUE             IF1214.2
019700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1214.2
019800     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1214.2
019900     02 FILLER                       PIC X(15)  VALUE             IF1214.2
020000             " COPYRIGHT 1985".                                   IF1214.2
020100 01  CCVS-E-4.                                                    IF1214.2
020200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1214.2
020300     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1214.2
020400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1214.2
020500     02 FILLER                       PIC X(40)  VALUE             IF1214.2
020600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1214.2
020700 01  XXINFO.                                                      IF1214.2
020800     02 FILLER                       PIC X(19)  VALUE             IF1214.2
020900            "*** INFORMATION ***".                                IF1214.2
021000     02 INFO-TEXT.                                                IF1214.2
021100       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1214.2
021200       04 XXCOMPUTED                 PIC X(20).                   IF1214.2
021300       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1214.2
021400       04 XXCORRECT                  PIC X(20).                   IF1214.2
021500     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1214.2
021600 01  HYPHEN-LINE.                                                 IF1214.2
021700     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1214.2
021800     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1214.2
021900-    "*****************************************".                 IF1214.2
022000     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1214.2
022100-    "******************************".                            IF1214.2
022200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1214.2
022300     "IF121A".                                                    IF1214.2
022400 PROCEDURE DIVISION.                                              IF1214.2
022500 CCVS1 SECTION.                                                   IF1214.2
022600 OPEN-FILES.                                                      IF1214.2
022700     OPEN     OUTPUT PRINT-FILE.                                  IF1214.2
022800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1214.2
022900     MOVE    SPACE TO TEST-RESULTS.                               IF1214.2
023000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1214.2
023100     GO TO CCVS1-EXIT.                                            IF1214.2
023200 CLOSE-FILES.                                                     IF1214.2
023300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1214.2
023400 TERMINATE-CCVS.                                                  IF1214.2
023500     STOP     RUN.                                                IF1214.2
023600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1214.2
023700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1214.2
023800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1214.2
023900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1214.2
024000     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1214.2
024100 PRINT-DETAIL.                                                    IF1214.2
024200     IF REC-CT NOT EQUAL TO ZERO                                  IF1214.2
024300             MOVE "." TO PARDOT-X                                 IF1214.2
024400             MOVE REC-CT TO DOTVALUE.                             IF1214.2
024500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1214.2
024600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1214.2
024700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1214.2
024800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1214.2
024900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1214.2
025000     MOVE SPACE TO CORRECT-X.                                     IF1214.2
025100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1214.2
025200     MOVE     SPACE TO RE-MARK.                                   IF1214.2
025300 HEAD-ROUTINE.                                                    IF1214.2
025400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1214.2
025500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1214.2
025600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1214.2
025700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1214.2
025800 COLUMN-NAMES-ROUTINE.                                            IF1214.2
025900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1214.2
026000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1214.2
026100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1214.2
026200 END-ROUTINE.                                                     IF1214.2
026300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1214.2
026400 END-RTN-EXIT.                                                    IF1214.2
026500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1214.2
026600 END-ROUTINE-1.                                                   IF1214.2
026700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1214.2
026800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1214.2
026900      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1214.2
027000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1214.2
027100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1214.2
027200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1214.2
027300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1214.2
027400  END-ROUTINE-12.                                                 IF1214.2
027500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1214.2
027600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1214.2
027700         MOVE "NO " TO ERROR-TOTAL                                IF1214.2
027800         ELSE                                                     IF1214.2
027900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1214.2
028000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1214.2
028100     PERFORM WRITE-LINE.                                          IF1214.2
028200 END-ROUTINE-13.                                                  IF1214.2
028300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1214.2
028400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1214.2
028500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1214.2
028600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1214.2
028700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1214.2
028800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1214.2
028900          MOVE "NO " TO ERROR-TOTAL                               IF1214.2
029000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1214.2
029100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1214.2
029200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1214.2
029300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1214.2
029400 WRITE-LINE.                                                      IF1214.2
029500     ADD 1 TO RECORD-COUNT.                                       IF1214.2
029600     IF RECORD-COUNT GREATER 42                                   IF1214.2
029700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1214.2
029800         MOVE SPACE TO DUMMY-RECORD                               IF1214.2
029900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1214.2
030000         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1214.2
030100         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1214.2
030200         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1214.2
030300         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1214.2
030400         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1214.2
030500         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1214.2
030600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1214.2
030700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1214.2
030800         MOVE ZERO TO RECORD-COUNT.                               IF1214.2
030900     PERFORM WRT-LN.                                              IF1214.2
031000 WRT-LN.                                                          IF1214.2
031100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1214.2
031200     MOVE SPACE TO DUMMY-RECORD.                                  IF1214.2
031300 BLANK-LINE-PRINT.                                                IF1214.2
031400     PERFORM WRT-LN.                                              IF1214.2
031500 FAIL-ROUTINE.                                                    IF1214.2
031600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1214.2
031700            GO TO FAIL-ROUTINE-WRITE.                             IF1214.2
031800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1214.2
031900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1214.2
032000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1214.2
032100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1214.2
032200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1214.2
032300     GO TO  FAIL-ROUTINE-EX.                                      IF1214.2
032400 FAIL-ROUTINE-WRITE.                                              IF1214.2
032500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1214.2
032600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1214.2
032700                              CORMA-ANSI-REFERENCE.               IF1214.2
032800     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1214.2
032900           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1214.2
033000           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1214.2
033100     ELSE                                                         IF1214.2
033200           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1214.2
033300     PERFORM WRITE-LINE.                                          IF1214.2
033400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1214.2
033500 FAIL-ROUTINE-EX. EXIT.                                           IF1214.2
033600 BAIL-OUT.                                                        IF1214.2
033700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1214.2
033800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1214.2
033900 BAIL-OUT-WRITE.                                                  IF1214.2
034000     MOVE CORRECT-A TO XXCORRECT.                                 IF1214.2
034100     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1214.2
034200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1214.2
034300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1214.2
034400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1214.2
034500 BAIL-OUT-EX. EXIT.                                               IF1214.2
034600 CCVS1-EXIT.                                                      IF1214.2
034700     EXIT.                                                        IF1214.2
034900*                                                      *          IF1214.2
035000*    Intrinsic Function Tests         IF121A - MEDIAN  *          IF1214.2
035100*                                                      *          IF1214.2
035300 SECT-IF121A SECTION.                                             IF1214.2
035400 F-MEDIAN-INFO.                                                   IF1214.2
035500     MOVE     "See ref. A-54 2.25" TO ANSI-REFERENCE.             IF1214.2
035600     MOVE     "MEDIAN Function" TO FEATURE.                       IF1214.2
035800 F-MEDIAN-01.                                                     IF1214.2
035900     MOVE ZERO TO WS-NUM.                                         IF1214.2
036000 F-MEDIAN-TEST-01.                                                IF1214.2
036100     COMPUTE WS-NUM = FUNCTION MEDIAN(5, -2, -14, 0).             IF1214.2
036200     IF WS-NUM = -1 THEN                                          IF1214.2
036300                    PERFORM PASS                                  IF1214.2
036400     ELSE                                                         IF1214.2
036500                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
036600                    MOVE -1 TO CORRECT-N                          IF1214.2
036700                    PERFORM FAIL.                                 IF1214.2
036800     GO TO F-MEDIAN-WRITE-01.                                     IF1214.2
036900 F-MEDIAN-DELETE-01.                                              IF1214.2
037000     PERFORM  DE-LETE.                                            IF1214.2
037100     GO TO    F-MEDIAN-WRITE-01.                                  IF1214.2
037200 F-MEDIAN-WRITE-01.                                               IF1214.2
037300     MOVE "F-MEDIAN-01" TO PAR-NAME.                              IF1214.2
037400     PERFORM  PRINT-DETAIL.                                       IF1214.2
037600 F-MEDIAN-02.                                                     IF1214.2
037700     EVALUATE FUNCTION MEDIAN(3.9, -0.3, 8.7, 100.2)              IF1214.2
037800     WHEN 6.29987 THRU 6.30013                                    IF1214.2
037900                    PERFORM PASS                                  IF1214.2
038000     WHEN OTHER                                                   IF1214.2
038100                    PERFORM FAIL.                                 IF1214.2
038200     GO TO F-MEDIAN-WRITE-02.                                     IF1214.2
038300 F-MEDIAN-DELETE-02.                                              IF1214.2
038400     PERFORM  DE-LETE.                                            IF1214.2
038500     GO TO    F-MEDIAN-WRITE-02.                                  IF1214.2
038600 F-MEDIAN-WRITE-02.                                               IF1214.2
038700     MOVE "F-MEDIAN-02" TO PAR-NAME.                              IF1214.2
038800     PERFORM  PRINT-DETAIL.                                       IF1214.2
039000 F-MEDIAN-03.                                                     IF1214.2
039100     IF FUNCTION MEDIAN(A, B, C, D) = 6    THEN                   IF1214.2
039200                    PERFORM PASS                                  IF1214.2
039300     ELSE                                                         IF1214.2
039400                    PERFORM FAIL.                                 IF1214.2
039500     GO TO F-MEDIAN-WRITE-03.                                     IF1214.2
039600 F-MEDIAN-DELETE-03.                                              IF1214.2
039700     PERFORM  DE-LETE.                                            IF1214.2
039800     GO TO    F-MEDIAN-WRITE-03.                                  IF1214.2
039900 F-MEDIAN-WRITE-03.                                               IF1214.2
040000     MOVE "F-MEDIAN-03" TO PAR-NAME.                              IF1214.2
040100     PERFORM  PRINT-DETAIL.                                       IF1214.2
040300 F-MEDIAN-04.                                                     IF1214.2
040400     MOVE ZERO TO WS-NUM.                                         IF1214.2
040500 F-MEDIAN-TEST-04.                                                IF1214.2
040600     COMPUTE WS-NUM = FUNCTION MEDIAN(E, F, G).                   IF1214.2
040700     IF (WS-NUM >= 4.07992) AND                                   IF1214.2
040800        (WS-NUM <= 4.08008)                                       IF1214.2
040900                    PERFORM PASS                                  IF1214.2
041000     ELSE                                                         IF1214.2
041100                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
041200                    MOVE 4.08 TO CORRECT-N                        IF1214.2
041300                    PERFORM FAIL.                                 IF1214.2
041400     GO TO F-MEDIAN-WRITE-04.                                     IF1214.2
041500 F-MEDIAN-DELETE-04.                                              IF1214.2
041600     PERFORM  DE-LETE.                                            IF1214.2
041700     GO TO    F-MEDIAN-WRITE-04.                                  IF1214.2
041800 F-MEDIAN-WRITE-04.                                               IF1214.2
041900     MOVE "F-MEDIAN-04" TO PAR-NAME.                              IF1214.2
042000     PERFORM  PRINT-DETAIL.                                       IF1214.2
042200 F-MEDIAN-05.                                                     IF1214.2
042300     MOVE ZERO TO WS-NUM.                                         IF1214.2
042400 F-MEDIAN-TEST-05.                                                IF1214.2
042500     COMPUTE WS-NUM = FUNCTION MEDIAN(10.2, -0.2, 5.6, -15.6).    IF1214.2
042600     IF (WS-NUM >= 2.69995) AND                                   IF1214.2
042700        (WS-NUM <= 2.70005)                                       IF1214.2
042800                    PERFORM PASS                                  IF1214.2
042900     ELSE                                                         IF1214.2
043000                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
043100                    MOVE 2.7 TO CORRECT-N                         IF1214.2
043200                    PERFORM FAIL.                                 IF1214.2
043300     GO TO F-MEDIAN-WRITE-05.                                     IF1214.2
043400 F-MEDIAN-DELETE-05.                                              IF1214.2
043500     PERFORM  DE-LETE.                                            IF1214.2
043600     GO TO    F-MEDIAN-WRITE-05.                                  IF1214.2
043700 F-MEDIAN-WRITE-05.                                               IF1214.2
043800     MOVE "F-MEDIAN-05" TO PAR-NAME.                              IF1214.2
043900     PERFORM  PRINT-DETAIL.                                       IF1214.2
044100 F-MEDIAN-06.                                                     IF1214.2
044200     MOVE ZERO TO WS-NUM.                                         IF1214.2
044300 F-MEDIAN-TEST-06.                                                IF1214.2
044400     COMPUTE WS-NUM = FUNCTION MEDIAN(A, B, C, D, E, F, G).       IF1214.2
044500     IF (WS-NUM >= 4.99990) AND                                   IF1214.2
044600        (WS-NUM <= 5.00010)                                       IF1214.2
044700                    PERFORM PASS                                  IF1214.2
044800     ELSE                                                         IF1214.2
044900                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
045000                    MOVE 5 TO CORRECT-N                           IF1214.2
045100                    PERFORM FAIL.                                 IF1214.2
045200     GO TO F-MEDIAN-WRITE-06.                                     IF1214.2
045300 F-MEDIAN-DELETE-06.                                              IF1214.2
045400     PERFORM  DE-LETE.                                            IF1214.2
045500     GO TO    F-MEDIAN-WRITE-06.                                  IF1214.2
045600 F-MEDIAN-WRITE-06.                                               IF1214.2
045700     MOVE "F-MEDIAN-06" TO PAR-NAME.                              IF1214.2
045800     PERFORM  PRINT-DETAIL.                                       IF1214.2
046000 F-MEDIAN-07.                                                     IF1214.2
046100     MOVE ZERO TO WS-NUM.                                         IF1214.2
046200 F-MEDIAN-TEST-07.                                                IF1214.2
046300     COMPUTE WS-NUM = FUNCTION MEDIAN(IND(1), IND(2), IND(3)).    IF1214.2
046400     IF WS-NUM = 4 THEN                                           IF1214.2
046500                    PERFORM PASS                                  IF1214.2
046600     ELSE                                                         IF1214.2
046700                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
046800                    MOVE 4 TO CORRECT-N                           IF1214.2
046900                    PERFORM FAIL.                                 IF1214.2
047000     GO TO F-MEDIAN-WRITE-07.                                     IF1214.2
047100 F-MEDIAN-DELETE-07.                                              IF1214.2
047200     PERFORM  DE-LETE.                                            IF1214.2
047300     GO TO    F-MEDIAN-WRITE-07.                                  IF1214.2
047400 F-MEDIAN-WRITE-07.                                               IF1214.2
047500     MOVE "F-MEDIAN-07" TO PAR-NAME.                              IF1214.2
047600     PERFORM  PRINT-DETAIL.                                       IF1214.2
047800 F-MEDIAN-08.                                                     IF1214.2
047900     MOVE ZERO TO WS-NUM.                                         IF1214.2
048000 F-MEDIAN-TEST-08.                                                IF1214.2
048100     COMPUTE WS-NUM = FUNCTION MEDIAN(IND(P), IND(Q), IND(R)).    IF1214.2
048200                                                                  IF1214.2
048300     IF WS-NUM = 5 THEN                                           IF1214.2
048400                    PERFORM PASS                                  IF1214.2
048500     ELSE                                                         IF1214.2
048600                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
048700                    MOVE 5 TO CORRECT-N                           IF1214.2
048800                    PERFORM FAIL.                                 IF1214.2
048900     GO TO F-MEDIAN-WRITE-08.                                     IF1214.2
049000 F-MEDIAN-DELETE-08.                                              IF1214.2
049100     PERFORM  DE-LETE.                                            IF1214.2
049200     GO TO    F-MEDIAN-WRITE-08.                                  IF1214.2
049300 F-MEDIAN-WRITE-08.                                               IF1214.2
049400     MOVE "F-MEDIAN-08" TO PAR-NAME.                              IF1214.2
049500     PERFORM  PRINT-DETAIL.                                       IF1214.2
049700 F-MEDIAN-09.                                                     IF1214.2
049800     MOVE ZERO TO WS-NUM.                                         IF1214.2
049900 F-MEDIAN-TEST-09.                                                IF1214.2
050000     COMPUTE WS-NUM = FUNCTION MEDIAN(IND(ALL)).                  IF1214.2
050100     IF WS-NUM = 4 THEN                                           IF1214.2
050200                    PERFORM PASS                                  IF1214.2
050300     ELSE                                                         IF1214.2
050400                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
050500                    MOVE 4 TO CORRECT-N                           IF1214.2
050600                    PERFORM FAIL.                                 IF1214.2
050700     GO TO F-MEDIAN-WRITE-09.                                     IF1214.2
050800 F-MEDIAN-DELETE-09.                                              IF1214.2
050900     PERFORM  DE-LETE.                                            IF1214.2
051000     GO TO    F-MEDIAN-WRITE-09.                                  IF1214.2
051100 F-MEDIAN-WRITE-09.                                               IF1214.2
051200     MOVE "F-MEDIAN-09" TO PAR-NAME.                              IF1214.2
051300     PERFORM  PRINT-DETAIL.                                       IF1214.2
051500 F-MEDIAN-11.                                                     IF1214.2
051600     MOVE ZERO TO WS-NUM.                                         IF1214.2
051700 F-MEDIAN-TEST-11.                                                IF1214.2
051800     COMPUTE WS-NUM = FUNCTION MEDIAN(M, N, O).                   IF1214.2
051900     IF WS-NUM = 320000 THEN                                      IF1214.2
052000                    PERFORM PASS                                  IF1214.2
052100     ELSE                                                         IF1214.2
052200                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
052300                    MOVE 320000 TO CORRECT-N                      IF1214.2
052400                    PERFORM FAIL.                                 IF1214.2
052500     GO TO F-MEDIAN-WRITE-11.                                     IF1214.2
052600 F-MEDIAN-DELETE-11.                                              IF1214.2
052700     PERFORM  DE-LETE.                                            IF1214.2
052800     GO TO    F-MEDIAN-WRITE-11.                                  IF1214.2
052900 F-MEDIAN-WRITE-11.                                               IF1214.2
053000     MOVE "F-MEDIAN-11" TO PAR-NAME.                              IF1214.2
053100     PERFORM  PRINT-DETAIL.                                       IF1214.2
053300 F-MEDIAN-12.                                                     IF1214.2
053400     MOVE ZERO TO WS-NUM.                                         IF1214.2
053500 F-MEDIAN-TEST-12.                                                IF1214.2
053600     COMPUTE WS-NUM = FUNCTION MEDIAN(A, 5, A).                   IF1214.2
053700     IF WS-NUM = 5 THEN                                           IF1214.2
053800                    PERFORM PASS                                  IF1214.2
053900     ELSE                                                         IF1214.2
054000                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
054100                    MOVE 5 TO CORRECT-N                           IF1214.2
054200                    PERFORM FAIL.                                 IF1214.2
054300     GO TO F-MEDIAN-WRITE-12.                                     IF1214.2
054400 F-MEDIAN-DELETE-12.                                              IF1214.2
054500     PERFORM  DE-LETE.                                            IF1214.2
054600     GO TO    F-MEDIAN-WRITE-12.                                  IF1214.2
054700 F-MEDIAN-WRITE-12.                                               IF1214.2
054800     MOVE "F-MEDIAN-12" TO PAR-NAME.                              IF1214.2
054900     PERFORM  PRINT-DETAIL.                                       IF1214.2
055100 F-MEDIAN-13.                                                     IF1214.2
055200     MOVE ZERO TO WS-NUM.                                         IF1214.2
055300     MOVE  20.7996 TO MIN-RANGE.                                  IF1214.2
055400     MOVE  20.8004 TO MAX-RANGE.                                  IF1214.2
055500 F-MEDIAN-TEST-13.                                                IF1214.2
055600     COMPUTE WS-NUM = FUNCTION MEDIAN(2.6 + 30, 4.5 * 2).         IF1214.2
055700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2
055800        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2
055900                    PERFORM PASS                                  IF1214.2
056000     ELSE                                                         IF1214.2
056100                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
056200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2
056300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2
056400                    PERFORM FAIL.                                 IF1214.2
056500     GO TO F-MEDIAN-WRITE-13.                                     IF1214.2
056600 F-MEDIAN-DELETE-13.                                              IF1214.2
056700     PERFORM  DE-LETE.                                            IF1214.2
056800     GO TO    F-MEDIAN-WRITE-13.                                  IF1214.2
056900 F-MEDIAN-WRITE-13.                                               IF1214.2
057000     MOVE "F-MEDIAN-13" TO PAR-NAME.                              IF1214.2
057100     PERFORM  PRINT-DETAIL.                                       IF1214.2
057300 F-MEDIAN-14.                                                     IF1214.2
057400     MOVE ZERO TO WS-NUM.                                         IF1214.2
057500     MOVE  34.2593 TO MIN-RANGE.                                  IF1214.2
057600     MOVE  34.2607 TO MAX-RANGE.                                  IF1214.2
057700 F-MEDIAN-TEST-14.                                                IF1214.2
057800     COMPUTE WS-NUM = FUNCTION MEDIAN(E, 9 * A, B / 2).           IF1214.2
057900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2
058000        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2
058100                    PERFORM PASS                                  IF1214.2
058200     ELSE                                                         IF1214.2
058300                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
058400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2
058500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2
058600                    PERFORM FAIL.                                 IF1214.2
058700     GO TO F-MEDIAN-WRITE-14.                                     IF1214.2
058800 F-MEDIAN-DELETE-14.                                              IF1214.2
058900     PERFORM  DE-LETE.                                            IF1214.2
059000     GO TO    F-MEDIAN-WRITE-14.                                  IF1214.2
059100 F-MEDIAN-WRITE-14.                                               IF1214.2
059200     MOVE "F-MEDIAN-14" TO PAR-NAME.                              IF1214.2
059300     PERFORM  PRINT-DETAIL.                                       IF1214.2
059500 F-MEDIAN-15.                                                     IF1214.2
059600     MOVE ZERO TO WS-NUM.                                         IF1214.2
059700     MOVE 83.9983 TO MIN-RANGE.                                   IF1214.2
059800     MOVE 84.0017 TO MAX-RANGE.                                   IF1214.2
059900 F-MEDIAN-TEST-15.                                                IF1214.2
060000     COMPUTE WS-NUM = FUNCTION MEDIAN(A, B) + 78.                 IF1214.2
060100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2
060200        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2
060300                    PERFORM PASS                                  IF1214.2
060400     ELSE                                                         IF1214.2
060500                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
060600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2
060700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2
060800                    PERFORM FAIL.                                 IF1214.2
060900     GO TO F-MEDIAN-WRITE-15.                                     IF1214.2
061000 F-MEDIAN-DELETE-15.                                              IF1214.2
061100     PERFORM  DE-LETE.                                            IF1214.2
061200     GO TO    F-MEDIAN-WRITE-15.                                  IF1214.2
061300 F-MEDIAN-WRITE-15.                                               IF1214.2
061400     MOVE "F-MEDIAN-15" TO PAR-NAME.                              IF1214.2
061500     PERFORM  PRINT-DETAIL.                                       IF1214.2
061700 F-MEDIAN-16.                                                     IF1214.2
061800     MOVE ZERO TO WS-NUM.                                         IF1214.2
061900     MOVE 3.39932 TO MIN-RANGE.                                   IF1214.2
062000     MOVE 3.40007 TO MAX-RANGE.                                   IF1214.2
062100 F-MEDIAN-TEST-16.                                                IF1214.2
062200     COMPUTE WS-NUM = FUNCTION MEDIAN(A, B) +                     IF1214.2
062300                      FUNCTION MEDIAN(-2.6, -4.4, 1).             IF1214.2
062400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2
062500        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2
062600                    PERFORM PASS                                  IF1214.2
062700     ELSE                                                         IF1214.2
062800                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
062900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2
063000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2
063100                    PERFORM FAIL.                                 IF1214.2
063200     GO TO F-MEDIAN-WRITE-16.                                     IF1214.2
063300 F-MEDIAN-DELETE-16.                                              IF1214.2
063400     PERFORM  DE-LETE.                                            IF1214.2
063500     GO TO    F-MEDIAN-WRITE-16.                                  IF1214.2
063600 F-MEDIAN-WRITE-16.                                               IF1214.2
063700     MOVE "F-MEDIAN-16" TO PAR-NAME.                              IF1214.2
063800     PERFORM  PRINT-DETAIL.                                       IF1214.2
064000 F-MEDIAN-17.                                                     IF1214.2
064100     MOVE ZERO TO WS-NUM.                                         IF1214.2
064200     MOVE 2.24995 TO MIN-RANGE.                                   IF1214.2
064300     MOVE 2.25004 TO MAX-RANGE.                                   IF1214.2
064400 F-MEDIAN-TEST-17.                                                IF1214.2
064500     COMPUTE WS-NUM =                                             IF1214.2
064600                 FUNCTION MEDIAN(FUNCTION MEDIAN(1, 2), 3).       IF1214.2
064700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1214.2
064800        (WS-NUM <= MAX-RANGE) THEN                                IF1214.2
064900                    PERFORM PASS                                  IF1214.2
065000     ELSE                                                         IF1214.2
065100                    MOVE WS-NUM TO COMPUTED-N                     IF1214.2
065200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1214.2
065300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1214.2
065400                    PERFORM FAIL.                                 IF1214.2
065500     GO TO F-MEDIAN-WRITE-17.                                     IF1214.2
065600 F-MEDIAN-DELETE-17.                                              IF1214.2
065700     PERFORM  DE-LETE.                                            IF1214.2
065800     GO TO    F-MEDIAN-WRITE-17.                                  IF1214.2
065900 F-MEDIAN-WRITE-17.                                               IF1214.2
066000     MOVE "F-MEDIAN-17" TO PAR-NAME.                              IF1214.2
066100     PERFORM  PRINT-DETAIL.                                       IF1214.2
066300 F-MEDIAN-18.                                                     IF1214.2
066400     PERFORM F-MEDIAN-TEST-18                                     IF1214.2
066500       UNTIL FUNCTION MEDIAN(1, ARG1, ARG2, 20) > 10.             IF1214.2
066600     PERFORM PASS.                                                IF1214.2
066700     GO TO F-MEDIAN-WRITE-18.                                     IF1214.2
066800 F-MEDIAN-TEST-18.                                                IF1214.2
066900     COMPUTE ARG1 = ARG1 + 1.                                     IF1214.2
067000     COMPUTE ARG2 = ARG2 + 1.                                     IF1214.2
067100 F-MEDIAN-DELETE-18.                                              IF1214.2
067200     PERFORM  DE-LETE.                                            IF1214.2
067300     GO TO    F-MEDIAN-WRITE-18.                                  IF1214.2
067400 F-MEDIAN-WRITE-18.                                               IF1214.2
067500     MOVE "F-MEDIAN-18" TO PAR-NAME.                              IF1214.2
067600     PERFORM  PRINT-DETAIL.                                       IF1214.2
067800 CCVS-EXIT SECTION.                                               IF1214.2
067900 CCVS-999999.                                                     IF1214.2
068000     GO TO CLOSE-FILES.                                           IF1214.2
