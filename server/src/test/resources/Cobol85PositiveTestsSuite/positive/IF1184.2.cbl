000100 IDENTIFICATION DIVISION.                                         IF1184.2
000200 PROGRAM-ID.                                                      IF1184.2
000300     IF118A.                                                      IF1184.2
000400                                                                  IF1184.2
000600*                                                         *       IF1184.2
000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1184.2
000800* It contains tests for the Intrinsic Function            *       IF1184.2
000900* LOWER-CASE.                                             *       IF1184.2
001000*                                                         *       IF1184.2
001200 ENVIRONMENT DIVISION.                                            IF1184.2
001300 CONFIGURATION SECTION.                                           IF1184.2
001400 SOURCE-COMPUTER.                                                 IF1184.2
001500     XXXXX082.                                                    IF1184.2
001600 OBJECT-COMPUTER.                                                 IF1184.2
001700     XXXXX083.                                                    IF1184.2
001800 INPUT-OUTPUT SECTION.                                            IF1184.2
001900 FILE-CONTROL.                                                    IF1184.2
002000     SELECT PRINT-FILE ASSIGN TO                                  IF1184.2
002100     XXXXX055.                                                    IF1184.2
002200 DATA DIVISION.                                                   IF1184.2
002300 FILE SECTION.                                                    IF1184.2
002400 FD  PRINT-FILE.                                                  IF1184.2
002500 01  PRINT-REC PICTURE X(120).                                    IF1184.2
002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1184.2
002700 WORKING-STORAGE SECTION.                                         IF1184.2
002900* Variables specific to the Intrinsic Function Test IF118A*       IF1184.2
003100 01  A                   PIC A(10)           VALUE "tumble".      IF1184.2
003200 01  B                   PIC A(10)           VALUE "WEED".        IF1184.2
003300 01  C                   PIC X(10)           VALUE "Was".         IF1184.2
003400 01  D                   PIC X(10)           VALUE "4".           IF1184.2
003500 01  E                   PIC X(10)           VALUE "And4".        IF1184.2
003600 01  TEMP                PIC S9(10).                              IF1184.2
003700 01  WS-ANUM             PIC X(10).                               IF1184.2
003800*                                                                 IF1184.2
004000*                                                                 IF1184.2
004100 01  TEST-RESULTS.                                                IF1184.2
004200     02 FILLER                   PIC X      VALUE SPACE.          IF1184.2
004300     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1184.2
004400     02 FILLER                   PIC X      VALUE SPACE.          IF1184.2
004500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1184.2
004600     02 FILLER                   PIC X      VALUE SPACE.          IF1184.2
004700     02  PAR-NAME.                                                IF1184.2
004800       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1184.2
004900       03  PARDOT-X              PIC X      VALUE SPACE.          IF1184.2
005000       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1184.2
005100     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1184.2
005200     02 RE-MARK                  PIC X(61).                       IF1184.2
005300 01  TEST-COMPUTED.                                               IF1184.2
005400     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1184.2
005500     02 FILLER                   PIC X(17)  VALUE                 IF1184.2
005600            "       COMPUTED=".                                   IF1184.2
005700     02 COMPUTED-X.                                               IF1184.2
005800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1184.2
005900     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1184.2
006000                                 PIC -9(9).9(9).                  IF1184.2
006100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1184.2
006200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1184.2
006300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1184.2
006400     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1184.2
006500         04 COMPUTED-18V0                    PIC -9(18).          IF1184.2
006600         04 FILLER                           PIC X.               IF1184.2
006700     03 FILLER PIC X(50) VALUE SPACE.                             IF1184.2
006800 01  TEST-CORRECT.                                                IF1184.2
006900     02 FILLER PIC X(30) VALUE SPACE.                             IF1184.2
007000     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1184.2
007100     02 CORRECT-X.                                                IF1184.2
007200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1184.2
007300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1184.2
007400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1184.2
007500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1184.2
007600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1184.2
007700     03      CR-18V0 REDEFINES CORRECT-A.                         IF1184.2
007800         04 CORRECT-18V0                     PIC -9(18).          IF1184.2
007900         04 FILLER                           PIC X.               IF1184.2
008000     03 FILLER PIC X(2) VALUE SPACE.                              IF1184.2
008100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1184.2
008200 01  CCVS-C-1.                                                    IF1184.2
008300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1184.2
008400-    "SS  PARAGRAPH-NAME                                          IF1184.2
008500-    "       REMARKS".                                            IF1184.2
008600     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1184.2
008700 01  CCVS-C-2.                                                    IF1184.2
008800     02 FILLER                     PIC X        VALUE SPACE.      IF1184.2
008900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1184.2
009000     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1184.2
009100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1184.2
009200     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1184.2
009300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1184.2
009400 01  REC-CT                        PIC 99       VALUE ZERO.       IF1184.2
009500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1184.2
009600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1184.2
009700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1184.2
009800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1184.2
009900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1184.2
010000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1184.2
010100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1184.2
010200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1184.2
010300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1184.2
010400 01  CCVS-H-1.                                                    IF1184.2
010500     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1184.2
010600     02  FILLER                    PIC X(42)    VALUE             IF1184.2
010700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1184.2
010800     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1184.2
010900 01  CCVS-H-2A.                                                   IF1184.2
011000   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1184.2
011100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1184.2
011200   02  FILLER                        PIC XXXX   VALUE             IF1184.2
011300     "4.2 ".                                                      IF1184.2
011400   02  FILLER                        PIC X(28)  VALUE             IF1184.2
011500            " COPY - NOT FOR DISTRIBUTION".                       IF1184.2
011600   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1184.2
011700                                                                  IF1184.2
011800 01  CCVS-H-2B.                                                   IF1184.2
011900   02  FILLER                        PIC X(15)  VALUE             IF1184.2
012000            "TEST RESULT OF ".                                    IF1184.2
012100   02  TEST-ID                       PIC X(9).                    IF1184.2
012200   02  FILLER                        PIC X(4)   VALUE             IF1184.2
012300            " IN ".                                               IF1184.2
012400   02  FILLER                        PIC X(12)  VALUE             IF1184.2
012500     " HIGH       ".                                              IF1184.2
012600   02  FILLER                        PIC X(22)  VALUE             IF1184.2
012700            " LEVEL VALIDATION FOR ".                             IF1184.2
012800   02  FILLER                        PIC X(58)  VALUE             IF1184.2
012900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1184.2
013000 01  CCVS-H-3.                                                    IF1184.2
013100     02  FILLER                      PIC X(34)  VALUE             IF1184.2
013200            " FOR OFFICIAL USE ONLY    ".                         IF1184.2
013300     02  FILLER                      PIC X(58)  VALUE             IF1184.2
013400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1184.2
013500     02  FILLER                      PIC X(28)  VALUE             IF1184.2
013600            "  COPYRIGHT   1985 ".                                IF1184.2
013700 01  CCVS-E-1.                                                    IF1184.2
013800     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1184.2
013900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1184.2
014000     02 ID-AGAIN                     PIC X(9).                    IF1184.2
014100     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1184.2
014200 01  CCVS-E-2.                                                    IF1184.2
014300     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1184.2
014400     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1184.2
014500     02 CCVS-E-2-2.                                               IF1184.2
014600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1184.2
014700         03 FILLER                   PIC X      VALUE SPACE.      IF1184.2
014800         03 ENDER-DESC               PIC X(44)  VALUE             IF1184.2
014900            "ERRORS ENCOUNTERED".                                 IF1184.2
015000 01  CCVS-E-3.                                                    IF1184.2
015100     02  FILLER                      PIC X(22)  VALUE             IF1184.2
015200            " FOR OFFICIAL USE ONLY".                             IF1184.2
015300     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1184.2
015400     02  FILLER                      PIC X(58)  VALUE             IF1184.2
015500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1184.2
015600     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1184.2
015700     02 FILLER                       PIC X(15)  VALUE             IF1184.2
015800             " COPYRIGHT 1985".                                   IF1184.2
015900 01  CCVS-E-4.                                                    IF1184.2
016000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1184.2
016100     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1184.2
016200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1184.2
016300     02 FILLER                       PIC X(40)  VALUE             IF1184.2
016400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1184.2
016500 01  XXINFO.                                                      IF1184.2
016600     02 FILLER                       PIC X(19)  VALUE             IF1184.2
016700            "*** INFORMATION ***".                                IF1184.2
016800     02 INFO-TEXT.                                                IF1184.2
016900       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1184.2
017000       04 XXCOMPUTED                 PIC X(20).                   IF1184.2
017100       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1184.2
017200       04 XXCORRECT                  PIC X(20).                   IF1184.2
017300     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1184.2
017400 01  HYPHEN-LINE.                                                 IF1184.2
017500     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1184.2
017600     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1184.2
017700-    "*****************************************".                 IF1184.2
017800     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1184.2
017900-    "******************************".                            IF1184.2
018000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1184.2
018100     "IF118A".                                                    IF1184.2
018200 PROCEDURE DIVISION.                                              IF1184.2
018300 CCVS1 SECTION.                                                   IF1184.2
018400 OPEN-FILES.                                                      IF1184.2
018500     OPEN     OUTPUT PRINT-FILE.                                  IF1184.2
018600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1184.2
018700     MOVE    SPACE TO TEST-RESULTS.                               IF1184.2
018800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1184.2
018900     GO TO CCVS1-EXIT.                                            IF1184.2
019000 CLOSE-FILES.                                                     IF1184.2
019100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1184.2
019200 TERMINATE-CCVS.                                                  IF1184.2
019300     STOP     RUN.                                                IF1184.2
019400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1184.2
019500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1184.2
019600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1184.2
019700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1184.2
019800     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1184.2
019900 PRINT-DETAIL.                                                    IF1184.2
020000     IF REC-CT NOT EQUAL TO ZERO                                  IF1184.2
020100             MOVE "." TO PARDOT-X                                 IF1184.2
020200             MOVE REC-CT TO DOTVALUE.                             IF1184.2
020300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1184.2
020400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1184.2
020500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1184.2
020600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1184.2
020700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1184.2
020800     MOVE SPACE TO CORRECT-X.                                     IF1184.2
020900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1184.2
021000     MOVE     SPACE TO RE-MARK.                                   IF1184.2
021100 HEAD-ROUTINE.                                                    IF1184.2
021200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1184.2
021300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1184.2
021400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1184.2
021500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1184.2
021600 COLUMN-NAMES-ROUTINE.                                            IF1184.2
021700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1184.2
021800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1184.2
021900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1184.2
022000 END-ROUTINE.                                                     IF1184.2
022100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1184.2
022200 END-RTN-EXIT.                                                    IF1184.2
022300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1184.2
022400 END-ROUTINE-1.                                                   IF1184.2
022500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1184.2
022600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1184.2
022700      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1184.2
022800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1184.2
022900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1184.2
023000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1184.2
023100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1184.2
023200  END-ROUTINE-12.                                                 IF1184.2
023300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1184.2
023400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1184.2
023500         MOVE "NO " TO ERROR-TOTAL                                IF1184.2
023600         ELSE                                                     IF1184.2
023700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1184.2
023800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1184.2
023900     PERFORM WRITE-LINE.                                          IF1184.2
024000 END-ROUTINE-13.                                                  IF1184.2
024100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1184.2
024200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1184.2
024300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1184.2
024400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1184.2
024500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1184.2
024600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1184.2
024700          MOVE "NO " TO ERROR-TOTAL                               IF1184.2
024800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1184.2
024900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1184.2
025000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1184.2
025100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1184.2
025200 WRITE-LINE.                                                      IF1184.2
025300     ADD 1 TO RECORD-COUNT.                                       IF1184.2
025400     IF RECORD-COUNT GREATER 42                                   IF1184.2
025500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1184.2
025600         MOVE SPACE TO DUMMY-RECORD                               IF1184.2
025700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1184.2
025800         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1184.2
025900         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1184.2
026000         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1184.2
026100         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1184.2
026200         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1184.2
026300         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1184.2
026400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1184.2
026500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1184.2
026600         MOVE ZERO TO RECORD-COUNT.                               IF1184.2
026700     PERFORM WRT-LN.                                              IF1184.2
026800 WRT-LN.                                                          IF1184.2
026900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1184.2
027000     MOVE SPACE TO DUMMY-RECORD.                                  IF1184.2
027100 BLANK-LINE-PRINT.                                                IF1184.2
027200     PERFORM WRT-LN.                                              IF1184.2
027300 FAIL-ROUTINE.                                                    IF1184.2
027400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1184.2
027500            GO TO FAIL-ROUTINE-WRITE.                             IF1184.2
027600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1184.2
027700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1184.2
027800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1184.2
027900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1184.2
028000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1184.2
028100     GO TO  FAIL-ROUTINE-EX.                                      IF1184.2
028200 FAIL-ROUTINE-WRITE.                                              IF1184.2
028300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1184.2
028400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1184.2
028500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1184.2
028600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1184.2
028700 FAIL-ROUTINE-EX. EXIT.                                           IF1184.2
028800 BAIL-OUT.                                                        IF1184.2
028900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1184.2
029000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1184.2
029100 BAIL-OUT-WRITE.                                                  IF1184.2
029200     MOVE CORRECT-A TO XXCORRECT.                                 IF1184.2
029300     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1184.2
029400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1184.2
029500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1184.2
029600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1184.2
029700 BAIL-OUT-EX. EXIT.                                               IF1184.2
029800 CCVS1-EXIT.                                                      IF1184.2
029900     EXIT.                                                        IF1184.2
030100*                                                      *          IF1184.2
030200*    Intrinsic Function Tests         IF118A - LOWCASE *          IF1184.2
030300*                                                      *          IF1184.2
030500 SECT-IF118A SECTION.                                             IF1184.2
030600 F-LOWCASE-INFO.                                                  IF1184.2
030700     MOVE     "See ref. A-51 2.22" TO ANSI-REFERENCE.             IF1184.2
030800     MOVE     "LOWER-CASE Function"     TO FEATURE.               IF1184.2
031000 F-LOWCASE-01.                                                    IF1184.2
031100     MOVE SPACES TO WS-ANUM.                                      IF1184.2
031200 F-LOWCASE-TEST-01.                                               IF1184.2
031300     MOVE FUNCTION LOWER-CASE("figure") TO WS-ANUM.               IF1184.2
031400     IF WS-ANUM = "figure" THEN                                   IF1184.2
031500                    PERFORM PASS                                  IF1184.2
031600     ELSE                                                         IF1184.2
031700                    MOVE "figure"  TO CORRECT-A                   IF1184.2
031800                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
031900                    PERFORM FAIL.                                 IF1184.2
032000     GO TO F-LOWCASE-WRITE-01.                                    IF1184.2
032100 F-LOWCASE-DELETE-01.                                             IF1184.2
032200     PERFORM  DE-LETE.                                            IF1184.2
032300     GO TO    F-LOWCASE-WRITE-01.                                 IF1184.2
032400 F-LOWCASE-WRITE-01.                                              IF1184.2
032500     MOVE "F-LOWCASE-01" TO PAR-NAME.                             IF1184.2
032600     PERFORM  PRINT-DETAIL.                                       IF1184.2
032800 F-LOWCASE-TEST-02.                                               IF1184.2
032900     MOVE FUNCTION LOWER-CASE("CAPS") TO WS-ANUM.                 IF1184.2
033000     IF WS-ANUM = "caps" THEN                                     IF1184.2
033100                    PERFORM PASS                                  IF1184.2
033200     ELSE                                                         IF1184.2
033300                    PERFORM FAIL.                                 IF1184.2
033400     GO TO F-LOWCASE-WRITE-02.                                    IF1184.2
033500 F-LOWCASE-DELETE-02.                                             IF1184.2
033600     PERFORM  DE-LETE.                                            IF1184.2
033700     GO TO    F-LOWCASE-WRITE-02.                                 IF1184.2
033800 F-LOWCASE-WRITE-02.                                              IF1184.2
033900     MOVE "F-LOWCASE-02" TO PAR-NAME.                             IF1184.2
034000     PERFORM  PRINT-DETAIL.                                       IF1184.2
034200 F-LOWCASE-03.                                                    IF1184.2
034300     MOVE SPACES TO WS-ANUM.                                      IF1184.2
034400 F-LOWCASE-TEST-03.                                               IF1184.2
034500     IF FUNCTION LOWER-CASE("highnLOW") = "highnlow" THEN         IF1184.2
034600                    PERFORM PASS                                  IF1184.2
034700     ELSE                                                         IF1184.2
034800                    MOVE "highnlow"  TO CORRECT-A                 IF1184.2
034900                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
035000                    PERFORM FAIL.                                 IF1184.2
035100     GO TO F-LOWCASE-WRITE-03.                                    IF1184.2
035200 F-LOWCASE-DELETE-03.                                             IF1184.2
035300     PERFORM  DE-LETE.                                            IF1184.2
035400     GO TO    F-LOWCASE-WRITE-03.                                 IF1184.2
035500 F-LOWCASE-WRITE-03.                                              IF1184.2
035600     MOVE "F-LOWCASE-03" TO PAR-NAME.                             IF1184.2
035700     PERFORM  PRINT-DETAIL.                                       IF1184.2
035900 F-LOWCASE-04.                                                    IF1184.2
036000     MOVE SPACES TO WS-ANUM.                                      IF1184.2
036100 F-LOWCASE-TEST-04.                                               IF1184.2
036200     MOVE FUNCTION LOWER-CASE("95") TO WS-ANUM.                   IF1184.2
036300     IF WS-ANUM = "95" THEN                                       IF1184.2
036400                    PERFORM PASS                                  IF1184.2
036500     ELSE                                                         IF1184.2
036600                    MOVE "95"  TO CORRECT-A                       IF1184.2
036700                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
036800                    PERFORM FAIL.                                 IF1184.2
036900     GO TO F-LOWCASE-WRITE-04.                                    IF1184.2
037000 F-LOWCASE-DELETE-04.                                             IF1184.2
037100     PERFORM  DE-LETE.                                            IF1184.2
037200     GO TO    F-LOWCASE-WRITE-04.                                 IF1184.2
037300 F-LOWCASE-WRITE-04.                                              IF1184.2
037400     MOVE "F-LOWCASE-04" TO PAR-NAME.                             IF1184.2
037500     PERFORM  PRINT-DETAIL.                                       IF1184.2
037700 F-LOWCASE-05.                                                    IF1184.2
037800     MOVE SPACES TO WS-ANUM.                                      IF1184.2
037900 F-LOWCASE-TEST-05.                                               IF1184.2
038000     MOVE FUNCTION LOWER-CASE("8isaNUMBER") TO WS-ANUM.           IF1184.2
038100     IF WS-ANUM = "8isanumber" THEN                               IF1184.2
038200                    PERFORM PASS                                  IF1184.2
038300     ELSE                                                         IF1184.2
038400                    MOVE "8isanumber"  TO CORRECT-A               IF1184.2
038500                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
038600                    PERFORM FAIL.                                 IF1184.2
038700     GO TO F-LOWCASE-WRITE-05.                                    IF1184.2
038800 F-LOWCASE-DELETE-05.                                             IF1184.2
038900     PERFORM  DE-LETE.                                            IF1184.2
039000     GO TO    F-LOWCASE-WRITE-05.                                 IF1184.2
039100 F-LOWCASE-WRITE-05.                                              IF1184.2
039200     MOVE "F-LOWCASE-05" TO PAR-NAME.                             IF1184.2
039300     PERFORM  PRINT-DETAIL.                                       IF1184.2
039500 F-LOWCASE-06.                                                    IF1184.2
039600     MOVE SPACES TO WS-ANUM.                                      IF1184.2
039700 F-LOWCASE-TEST-06.                                               IF1184.2
039800     MOVE FUNCTION LOWER-CASE(A) TO WS-ANUM.                      IF1184.2
039900     IF WS-ANUM = "tumble" THEN                                   IF1184.2
040000                    PERFORM PASS                                  IF1184.2
040100     ELSE                                                         IF1184.2
040200                    MOVE "tumble"  TO CORRECT-A                   IF1184.2
040300                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
040400                    PERFORM FAIL.                                 IF1184.2
040500     GO TO F-LOWCASE-WRITE-06.                                    IF1184.2
040600 F-LOWCASE-DELETE-06.                                             IF1184.2
040700     PERFORM  DE-LETE.                                            IF1184.2
040800     GO TO    F-LOWCASE-WRITE-06.                                 IF1184.2
040900 F-LOWCASE-WRITE-06.                                              IF1184.2
041000     MOVE "F-LOWCASE-06" TO PAR-NAME.                             IF1184.2
041100     PERFORM  PRINT-DETAIL.                                       IF1184.2
041300 F-LOWCASE-07.                                                    IF1184.2
041400     MOVE SPACES TO WS-ANUM.                                      IF1184.2
041500 F-LOWCASE-TEST-07.                                               IF1184.2
041600     MOVE FUNCTION LOWER-CASE(B) TO WS-ANUM.                      IF1184.2
041700     IF WS-ANUM = "weed" THEN                                     IF1184.2
041800                    PERFORM PASS                                  IF1184.2
041900     ELSE                                                         IF1184.2
042000                    MOVE "weed"  TO CORRECT-A                     IF1184.2
042100                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
042200                    PERFORM FAIL.                                 IF1184.2
042300     GO TO F-LOWCASE-WRITE-07.                                    IF1184.2
042400 F-LOWCASE-DELETE-07.                                             IF1184.2
042500     PERFORM  DE-LETE.                                            IF1184.2
042600     GO TO    F-LOWCASE-WRITE-07.                                 IF1184.2
042700 F-LOWCASE-WRITE-07.                                              IF1184.2
042800     MOVE "F-LOWCASE-07" TO PAR-NAME.                             IF1184.2
042900     PERFORM  PRINT-DETAIL.                                       IF1184.2
043100 F-LOWCASE-08.                                                    IF1184.2
043200     MOVE SPACES TO WS-ANUM.                                      IF1184.2
043300 F-LOWCASE-TEST-08.                                               IF1184.2
043400     MOVE FUNCTION LOWER-CASE(C) TO WS-ANUM.                      IF1184.2
043500     IF WS-ANUM = "was" THEN                                      IF1184.2
043600                    PERFORM PASS                                  IF1184.2
043700     ELSE                                                         IF1184.2
043800                    MOVE "was"  TO CORRECT-A                      IF1184.2
043900                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
044000                    PERFORM FAIL.                                 IF1184.2
044100     GO TO F-LOWCASE-WRITE-08.                                    IF1184.2
044200 F-LOWCASE-DELETE-08.                                             IF1184.2
044300     PERFORM  DE-LETE.                                            IF1184.2
044400     GO TO    F-LOWCASE-WRITE-08.                                 IF1184.2
044500 F-LOWCASE-WRITE-08.                                              IF1184.2
044600     MOVE "F-LOWCASE-08" TO PAR-NAME.                             IF1184.2
044700     PERFORM  PRINT-DETAIL.                                       IF1184.2
044900 F-LOWCASE-09.                                                    IF1184.2
045000     MOVE SPACES TO WS-ANUM.                                      IF1184.2
045100 F-LOWCASE-TEST-09.                                               IF1184.2
045200     MOVE FUNCTION LOWER-CASE(D) TO WS-ANUM.                      IF1184.2
045300     IF WS-ANUM = "4" THEN                                        IF1184.2
045400                    PERFORM PASS                                  IF1184.2
045500     ELSE                                                         IF1184.2
045600                    MOVE "4"  TO CORRECT-A                        IF1184.2
045700                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
045800                    PERFORM FAIL.                                 IF1184.2
045900     GO TO F-LOWCASE-WRITE-09.                                    IF1184.2
046000 F-LOWCASE-DELETE-09.                                             IF1184.2
046100     PERFORM  DE-LETE.                                            IF1184.2
046200     GO TO    F-LOWCASE-WRITE-09.                                 IF1184.2
046300 F-LOWCASE-WRITE-09.                                              IF1184.2
046400     MOVE "F-LOWCASE-09" TO PAR-NAME.                             IF1184.2
046500     PERFORM  PRINT-DETAIL.                                       IF1184.2
046700 F-LOWCASE-10.                                                    IF1184.2
046800     MOVE SPACES TO WS-ANUM.                                      IF1184.2
046900 F-LOWCASE-TEST-10.                                               IF1184.2
047000     MOVE FUNCTION LOWER-CASE(E) TO WS-ANUM.                      IF1184.2
047100     IF WS-ANUM = "and4" THEN                                     IF1184.2
047200                    PERFORM PASS                                  IF1184.2
047300     ELSE                                                         IF1184.2
047400                    MOVE "and4"  TO CORRECT-A                     IF1184.2
047500                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
047600                    PERFORM FAIL.                                 IF1184.2
047700     GO TO F-LOWCASE-WRITE-10.                                    IF1184.2
047800 F-LOWCASE-DELETE-10.                                             IF1184.2
047900     PERFORM  DE-LETE.                                            IF1184.2
048000     GO TO    F-LOWCASE-WRITE-10.                                 IF1184.2
048100 F-LOWCASE-WRITE-10.                                              IF1184.2
048200     MOVE "F-LOWCASE-10" TO PAR-NAME.                             IF1184.2
048300     PERFORM  PRINT-DETAIL.                                       IF1184.2
048500 F-LOWCASE-11.                                                    IF1184.2
048600     MOVE ZERO TO TEMP.                                           IF1184.2
048700 F-LOWCASE-TEST-11.                                               IF1184.2
048800     IF                                                           IF1184.2
048900       FUNCTION LENGTH(FUNCTION LOWER-CASE("GIZZARD")) + 2 = 9    IF1184.2
049000     THEN                                                         IF1184.2
049100                    PERFORM PASS                                  IF1184.2
049200     ELSE                                                         IF1184.2
049300                    MOVE 9 TO CORRECT-N                           IF1184.2
049400                    MOVE TEMP TO COMPUTED-N                       IF1184.2
049500                    PERFORM FAIL.                                 IF1184.2
049600     GO TO F-LOWCASE-WRITE-11.                                    IF1184.2
049700 F-LOWCASE-DELETE-11.                                             IF1184.2
049800     PERFORM  DE-LETE.                                            IF1184.2
049900     GO TO    F-LOWCASE-WRITE-11.                                 IF1184.2
050000 F-LOWCASE-WRITE-11.                                              IF1184.2
050100     MOVE "F-LOWCASE-11" TO PAR-NAME.                             IF1184.2
050200     PERFORM  PRINT-DETAIL.                                       IF1184.2
050400 F-LOWCASE-12.                                                    IF1184.2
050500     MOVE SPACES TO WS-ANUM.                                      IF1184.2
050600 F-LOWCASE-TEST-12.                                               IF1184.2
050700     MOVE FUNCTION LOWER-CASE(FUNCTION LOWER-CASE("giZZard"))     IF1184.2
050800       TO WS-ANUM.                                                IF1184.2
050900     IF WS-ANUM = "gizzard" THEN                                  IF1184.2
051000                    PERFORM PASS                                  IF1184.2
051100     ELSE                                                         IF1184.2
051200                    MOVE "gizzard"  TO CORRECT-A                  IF1184.2
051300                    MOVE WS-ANUM TO COMPUTED-A                    IF1184.2
051400                    PERFORM FAIL.                                 IF1184.2
051500     GO TO F-LOWCASE-WRITE-12.                                    IF1184.2
051600 F-LOWCASE-DELETE-12.                                             IF1184.2
051700     PERFORM  DE-LETE.                                            IF1184.2
051800     GO TO    F-LOWCASE-WRITE-12.                                 IF1184.2
051900 F-LOWCASE-WRITE-12.                                              IF1184.2
052000     MOVE "F-LOWCASE-12" TO PAR-NAME.                             IF1184.2
052100     PERFORM  PRINT-DETAIL.                                       IF1184.2
052300 F-LOWCASE-13.                                                    IF1184.2
052400     MOVE ZERO TO TEMP.                                           IF1184.2
052500 F-LOWCASE-TEST-13.                                               IF1184.2
052600     COMPUTE TEMP = FUNCTION LENGTH(FUNCTION LOWER-CASE("HOME"))  IF1184.2
052700                  + FUNCTION LENGTH(FUNCTION LOWER-CASE("HOME")). IF1184.2
052800     IF TEMP = 8 THEN                                             IF1184.2
052900                    PERFORM PASS                                  IF1184.2
053000     ELSE                                                         IF1184.2
053100                    MOVE 8 TO CORRECT-N                           IF1184.2
053200                    MOVE TEMP TO COMPUTED-N                       IF1184.2
053300                    PERFORM FAIL.                                 IF1184.2
053400     GO TO F-LOWCASE-WRITE-13.                                    IF1184.2
053500 F-LOWCASE-DELETE-13.                                             IF1184.2
053600     PERFORM  DE-LETE.                                            IF1184.2
053700     GO TO    F-LOWCASE-WRITE-13.                                 IF1184.2
053800 F-LOWCASE-WRITE-13.                                              IF1184.2
053900     MOVE "F-LOWCASE-13" TO PAR-NAME.                             IF1184.2
054000     PERFORM  PRINT-DETAIL.                                       IF1184.2
054200 CCVS-EXIT SECTION.                                               IF1184.2
054300 CCVS-999999.                                                     IF1184.2
054400     GO TO CLOSE-FILES.                                           IF1184.2
