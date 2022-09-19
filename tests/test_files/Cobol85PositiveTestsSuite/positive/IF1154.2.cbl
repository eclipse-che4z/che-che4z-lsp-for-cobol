000100 IDENTIFICATION DIVISION.                                         IF1154.2
000200 PROGRAM-ID.                                                      IF1154.2
000300     IF115A.                                                      IF1154.2
000400                                                                  IF1154.2
000600*                                                         *       IF1154.2
000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1154.2
000800* It contains tests for the Intrinsic Function LENGTH.    *       IF1154.2
000900*                                                         *       IF1154.2
001000*                                                         *       IF1154.2
001200 ENVIRONMENT DIVISION.                                            IF1154.2
001300 CONFIGURATION SECTION.                                           IF1154.2
001400 SOURCE-COMPUTER.                                                 IF1154.2
001500     XXXXX082.                                                    IF1154.2
001600 OBJECT-COMPUTER.                                                 IF1154.2
001700     XXXXX083.                                                    IF1154.2
001800 INPUT-OUTPUT SECTION.                                            IF1154.2
001900 FILE-CONTROL.                                                    IF1154.2
002000     SELECT PRINT-FILE ASSIGN TO                                  IF1154.2
002100     XXXXX055.                                                    IF1154.2
002200 DATA DIVISION.                                                   IF1154.2
002300 FILE SECTION.                                                    IF1154.2
002400 FD  PRINT-FILE.                                                  IF1154.2
002500 01  PRINT-REC PICTURE X(120).                                    IF1154.2
002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1154.2
002700 WORKING-STORAGE SECTION.                                         IF1154.2
002900* Variables specific to the Intrinsic Function Test IF115A*       IF1154.2
003100 01  K                PIC A(1)     VALUE "D".                     IF1154.2
003200 01  M                PIC A(17)    VALUE "longstringofchars".     IF1154.2
003300 01  N                PIC A(3)     VALUE "abc".                   IF1154.2
003400 01  C                PIC S9(10).                                 IF1154.2
003500 01  WS-INT           PIC S9(10).                                 IF1154.2
003600*                                                                 IF1154.2
003800*                                                                 IF1154.2
003900 01  TEST-RESULTS.                                                IF1154.2
004000     02 FILLER                   PIC X      VALUE SPACE.          IF1154.2
004100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1154.2
004200     02 FILLER                   PIC X      VALUE SPACE.          IF1154.2
004300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1154.2
004400     02 FILLER                   PIC X      VALUE SPACE.          IF1154.2
004500     02  PAR-NAME.                                                IF1154.2
004600       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1154.2
004700       03  PARDOT-X              PIC X      VALUE SPACE.          IF1154.2
004800       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1154.2
004900     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1154.2
005000     02 RE-MARK                  PIC X(61).                       IF1154.2
005100 01  TEST-COMPUTED.                                               IF1154.2
005200     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1154.2
005300     02 FILLER                   PIC X(17)  VALUE                 IF1154.2
005400            "       COMPUTED=".                                   IF1154.2
005500     02 COMPUTED-X.                                               IF1154.2
005600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1154.2
005700     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1154.2
005800                                 PIC -9(9).9(9).                  IF1154.2
005900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1154.2
006000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1154.2
006100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1154.2
006200     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1154.2
006300         04 COMPUTED-18V0                    PIC -9(18).          IF1154.2
006400         04 FILLER                           PIC X.               IF1154.2
006500     03 FILLER PIC X(50) VALUE SPACE.                             IF1154.2
006600 01  TEST-CORRECT.                                                IF1154.2
006700     02 FILLER PIC X(30) VALUE SPACE.                             IF1154.2
006800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1154.2
006900     02 CORRECT-X.                                                IF1154.2
007000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1154.2
007100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1154.2
007200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1154.2
007300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1154.2
007400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1154.2
007500     03      CR-18V0 REDEFINES CORRECT-A.                         IF1154.2
007600         04 CORRECT-18V0                     PIC -9(18).          IF1154.2
007700         04 FILLER                           PIC X.               IF1154.2
007800     03 FILLER PIC X(2) VALUE SPACE.                              IF1154.2
007900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1154.2
008000 01  CCVS-C-1.                                                    IF1154.2
008100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1154.2
008200-    "SS  PARAGRAPH-NAME                                          IF1154.2
008300-    "       REMARKS".                                            IF1154.2
008400     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1154.2
008500 01  CCVS-C-2.                                                    IF1154.2
008600     02 FILLER                     PIC X        VALUE SPACE.      IF1154.2
008700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1154.2
008800     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1154.2
008900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1154.2
009000     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1154.2
009100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1154.2
009200 01  REC-CT                        PIC 99       VALUE ZERO.       IF1154.2
009300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1154.2
009400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1154.2
009500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1154.2
009600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1154.2
009700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1154.2
009800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1154.2
009900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1154.2
010000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1154.2
010100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1154.2
010200 01  CCVS-H-1.                                                    IF1154.2
010300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1154.2
010400     02  FILLER                    PIC X(42)    VALUE             IF1154.2
010500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1154.2
010600     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1154.2
010700 01  CCVS-H-2A.                                                   IF1154.2
010800   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1154.2
010900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1154.2
011000   02  FILLER                        PIC XXXX   VALUE             IF1154.2
011100     "4.2 ".                                                      IF1154.2
011200   02  FILLER                        PIC X(28)  VALUE             IF1154.2
011300            " COPY - NOT FOR DISTRIBUTION".                       IF1154.2
011400   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1154.2
011500                                                                  IF1154.2
011600 01  CCVS-H-2B.                                                   IF1154.2
011700   02  FILLER                        PIC X(15)  VALUE             IF1154.2
011800            "TEST RESULT OF ".                                    IF1154.2
011900   02  TEST-ID                       PIC X(9).                    IF1154.2
012000   02  FILLER                        PIC X(4)   VALUE             IF1154.2
012100            " IN ".                                               IF1154.2
012200   02  FILLER                        PIC X(12)  VALUE             IF1154.2
012300     " HIGH       ".                                              IF1154.2
012400   02  FILLER                        PIC X(22)  VALUE             IF1154.2
012500            " LEVEL VALIDATION FOR ".                             IF1154.2
012600   02  FILLER                        PIC X(58)  VALUE             IF1154.2
012700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1154.2
012800 01  CCVS-H-3.                                                    IF1154.2
012900     02  FILLER                      PIC X(34)  VALUE             IF1154.2
013000            " FOR OFFICIAL USE ONLY    ".                         IF1154.2
013100     02  FILLER                      PIC X(58)  VALUE             IF1154.2
013200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1154.2
013300     02  FILLER                      PIC X(28)  VALUE             IF1154.2
013400            "  COPYRIGHT   1985 ".                                IF1154.2
013500 01  CCVS-E-1.                                                    IF1154.2
013600     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1154.2
013700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1154.2
013800     02 ID-AGAIN                     PIC X(9).                    IF1154.2
013900     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1154.2
014000 01  CCVS-E-2.                                                    IF1154.2
014100     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1154.2
014200     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1154.2
014300     02 CCVS-E-2-2.                                               IF1154.2
014400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1154.2
014500         03 FILLER                   PIC X      VALUE SPACE.      IF1154.2
014600         03 ENDER-DESC               PIC X(44)  VALUE             IF1154.2
014700            "ERRORS ENCOUNTERED".                                 IF1154.2
014800 01  CCVS-E-3.                                                    IF1154.2
014900     02  FILLER                      PIC X(22)  VALUE             IF1154.2
015000            " FOR OFFICIAL USE ONLY".                             IF1154.2
015100     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1154.2
015200     02  FILLER                      PIC X(58)  VALUE             IF1154.2
015300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1154.2
015400     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1154.2
015500     02 FILLER                       PIC X(15)  VALUE             IF1154.2
015600             " COPYRIGHT 1985".                                   IF1154.2
015700 01  CCVS-E-4.                                                    IF1154.2
015800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1154.2
015900     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1154.2
016000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1154.2
016100     02 FILLER                       PIC X(40)  VALUE             IF1154.2
016200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1154.2
016300 01  XXINFO.                                                      IF1154.2
016400     02 FILLER                       PIC X(19)  VALUE             IF1154.2
016500            "*** INFORMATION ***".                                IF1154.2
016600     02 INFO-TEXT.                                                IF1154.2
016700       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1154.2
016800       04 XXCOMPUTED                 PIC X(20).                   IF1154.2
016900       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1154.2
017000       04 XXCORRECT                  PIC X(20).                   IF1154.2
017100     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1154.2
017200 01  HYPHEN-LINE.                                                 IF1154.2
017300     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1154.2
017400     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1154.2
017500-    "*****************************************".                 IF1154.2
017600     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1154.2
017700-    "******************************".                            IF1154.2
017800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1154.2
017900     "IF115A".                                                    IF1154.2
018000 PROCEDURE DIVISION.                                              IF1154.2
018100 CCVS1 SECTION.                                                   IF1154.2
018200 OPEN-FILES.                                                      IF1154.2
018300     OPEN     OUTPUT PRINT-FILE.                                  IF1154.2
018400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1154.2
018500     MOVE    SPACE TO TEST-RESULTS.                               IF1154.2
018600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1154.2
018700     GO TO CCVS1-EXIT.                                            IF1154.2
018800 CLOSE-FILES.                                                     IF1154.2
018900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1154.2
019000 TERMINATE-CCVS.                                                  IF1154.2
019100     STOP     RUN.                                                IF1154.2
019200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1154.2
019300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1154.2
019400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1154.2
019500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1154.2
019600     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1154.2
019700 PRINT-DETAIL.                                                    IF1154.2
019800     IF REC-CT NOT EQUAL TO ZERO                                  IF1154.2
019900             MOVE "." TO PARDOT-X                                 IF1154.2
020000             MOVE REC-CT TO DOTVALUE.                             IF1154.2
020100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1154.2
020200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1154.2
020300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1154.2
020400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1154.2
020500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1154.2
020600     MOVE SPACE TO CORRECT-X.                                     IF1154.2
020700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1154.2
020800     MOVE     SPACE TO RE-MARK.                                   IF1154.2
020900 HEAD-ROUTINE.                                                    IF1154.2
021000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1154.2
021100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1154.2
021200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1154.2
021300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1154.2
021400 COLUMN-NAMES-ROUTINE.                                            IF1154.2
021500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1154.2
021600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1154.2
021700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1154.2
021800 END-ROUTINE.                                                     IF1154.2
021900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1154.2
022000 END-RTN-EXIT.                                                    IF1154.2
022100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1154.2
022200 END-ROUTINE-1.                                                   IF1154.2
022300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1154.2
022400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1154.2
022500      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1154.2
022600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1154.2
022700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1154.2
022800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1154.2
022900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1154.2
023000  END-ROUTINE-12.                                                 IF1154.2
023100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1154.2
023200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1154.2
023300         MOVE "NO " TO ERROR-TOTAL                                IF1154.2
023400         ELSE                                                     IF1154.2
023500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1154.2
023600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1154.2
023700     PERFORM WRITE-LINE.                                          IF1154.2
023800 END-ROUTINE-13.                                                  IF1154.2
023900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1154.2
024000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1154.2
024100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1154.2
024200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1154.2
024300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1154.2
024400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1154.2
024500          MOVE "NO " TO ERROR-TOTAL                               IF1154.2
024600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1154.2
024700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1154.2
024800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1154.2
024900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1154.2
025000 WRITE-LINE.                                                      IF1154.2
025100     ADD 1 TO RECORD-COUNT.                                       IF1154.2
025200     IF RECORD-COUNT GREATER 42                                   IF1154.2
025300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1154.2
025400         MOVE SPACE TO DUMMY-RECORD                               IF1154.2
025500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1154.2
025600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1154.2
025700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1154.2
025800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1154.2
025900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1154.2
026000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1154.2
026100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1154.2
026200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1154.2
026300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1154.2
026400         MOVE ZERO TO RECORD-COUNT.                               IF1154.2
026500     PERFORM WRT-LN.                                              IF1154.2
026600 WRT-LN.                                                          IF1154.2
026700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1154.2
026800     MOVE SPACE TO DUMMY-RECORD.                                  IF1154.2
026900 BLANK-LINE-PRINT.                                                IF1154.2
027000     PERFORM WRT-LN.                                              IF1154.2
027100 FAIL-ROUTINE.                                                    IF1154.2
027200     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1154.2
027300            GO TO FAIL-ROUTINE-WRITE.                             IF1154.2
027400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1154.2
027500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1154.2
027600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1154.2
027700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1154.2
027800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1154.2
027900     GO TO  FAIL-ROUTINE-EX.                                      IF1154.2
028000 FAIL-ROUTINE-WRITE.                                              IF1154.2
028100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1154.2
028200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1154.2
028300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1154.2
028400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1154.2
028500 FAIL-ROUTINE-EX. EXIT.                                           IF1154.2
028600 BAIL-OUT.                                                        IF1154.2
028700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1154.2
028800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1154.2
028900 BAIL-OUT-WRITE.                                                  IF1154.2
029000     MOVE CORRECT-A TO XXCORRECT.                                 IF1154.2
029100     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1154.2
029200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1154.2
029300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1154.2
029400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1154.2
029500 BAIL-OUT-EX. EXIT.                                               IF1154.2
029600 CCVS1-EXIT.                                                      IF1154.2
029700     EXIT.                                                        IF1154.2
029900*                                                      *          IF1154.2
030000*    Intrinsic Function Tests         IF115A - LENGTH  *          IF1154.2
030100*                                                      *          IF1154.2
030300 SECT-IF115A SECTION.                                             IF1154.2
030400 F-LENGTH-INFO.                                                   IF1154.2
030500     MOVE     "See ref. A-48 2.19" TO ANSI-REFERENCE.             IF1154.2
030600     MOVE     "LENGTH Function"     TO FEATURE.                   IF1154.2
030800 F-LENGTH-01.                                                     IF1154.2
030900     MOVE ZERO TO WS-INT.                                         IF1154.2
031000 F-LENGTH-TEST-01.                                                IF1154.2
031100     COMPUTE WS-INT = FUNCTION LENGTH("A").                       IF1154.2
031200     IF WS-INT = 1 THEN                                           IF1154.2
031300                        PERFORM PASS                              IF1154.2
031400     ELSE                                                         IF1154.2
031500                        MOVE 1 TO CORRECT-X                       IF1154.2
031600                        MOVE WS-INT TO COMPUTED-A                 IF1154.2
031700                        PERFORM FAIL.                             IF1154.2
031800     GO TO F-LENGTH-WRITE-01.                                     IF1154.2
031900 F-LENGTH-DELETE-01.                                              IF1154.2
032000     PERFORM  DE-LETE.                                            IF1154.2
032100     GO TO    F-LENGTH-WRITE-01.                                  IF1154.2
032200 F-LENGTH-WRITE-01.                                               IF1154.2
032300     MOVE "F-LENGTH-01" TO PAR-NAME.                              IF1154.2
032400     PERFORM  PRINT-DETAIL.                                       IF1154.2
032600 F-LENGTH-TEST-02.                                                IF1154.2
032700     EVALUATE FUNCTION LENGTH("ABCDEFGHIJKLMNOPQRST")             IF1154.2
032800     WHEN 20                                                      IF1154.2
032900                 PERFORM PASS                                     IF1154.2
033000                 GO TO F-LENGTH-WRITE-02.                         IF1154.2
033100     PERFORM FAIL.                                                IF1154.2
033200     GO TO F-LENGTH-WRITE-02.                                     IF1154.2
033300 F-LENGTH-DELETE-02.                                              IF1154.2
033400     PERFORM  DE-LETE.                                            IF1154.2
033500     GO TO    F-LENGTH-WRITE-02.                                  IF1154.2
033600 F-LENGTH-WRITE-02.                                               IF1154.2
033700     MOVE "F-LENGTH-02" TO PAR-NAME.                              IF1154.2
033800     PERFORM  PRINT-DETAIL.                                       IF1154.2
034000 F-LENGTH-03.                                                     IF1154.2
034100     MOVE ZERO TO WS-INT.                                         IF1154.2
034200 F-LENGTH-TEST-03.                                                IF1154.2
034300     IF FUNCTION LENGTH("ABCD") = 4 THEN                          IF1154.2
034400                        PERFORM PASS                              IF1154.2
034500     ELSE                                                         IF1154.2
034600                        MOVE 4 TO CORRECT-X                       IF1154.2
034700                        MOVE WS-INT TO COMPUTED-A                 IF1154.2
034800                        PERFORM FAIL.                             IF1154.2
034900     GO TO F-LENGTH-WRITE-03.                                     IF1154.2
035000 F-LENGTH-DELETE-03.                                              IF1154.2
035100     PERFORM  DE-LETE.                                            IF1154.2
035200     GO TO    F-LENGTH-WRITE-03.                                  IF1154.2
035300 F-LENGTH-WRITE-03.                                               IF1154.2
035400     MOVE "F-LENGTH-03" TO PAR-NAME.                              IF1154.2
035500     PERFORM  PRINT-DETAIL.                                       IF1154.2
035700 F-LENGTH-04.                                                     IF1154.2
035800     MOVE ZERO TO WS-INT.                                         IF1154.2
035900 F-LENGTH-TEST-04.                                                IF1154.2
036000     COMPUTE WS-INT = FUNCTION LENGTH(K).                         IF1154.2
036100     IF WS-INT = 1 THEN                                           IF1154.2
036200                        PERFORM PASS                              IF1154.2
036300     ELSE                                                         IF1154.2
036400                        MOVE 1 TO CORRECT-X                       IF1154.2
036500                        MOVE WS-INT TO COMPUTED-A                 IF1154.2
036600                        PERFORM FAIL.                             IF1154.2
036700     GO TO F-LENGTH-WRITE-04.                                     IF1154.2
036800 F-LENGTH-DELETE-04.                                              IF1154.2
036900     PERFORM  DE-LETE.                                            IF1154.2
037000     GO TO    F-LENGTH-WRITE-04.                                  IF1154.2
037100 F-LENGTH-WRITE-04.                                               IF1154.2
037200     MOVE "F-LENGTH-04" TO PAR-NAME.                              IF1154.2
037300     PERFORM  PRINT-DETAIL.                                       IF1154.2
037500 F-LENGTH-05.                                                     IF1154.2
037600     MOVE ZERO TO WS-INT.                                         IF1154.2
037700 F-LENGTH-TEST-05.                                                IF1154.2
037800     COMPUTE WS-INT = FUNCTION LENGTH(M).                         IF1154.2
037900     IF WS-INT = 17 THEN                                          IF1154.2
038000                        PERFORM PASS                              IF1154.2
038100     ELSE                                                         IF1154.2
038200                        MOVE  17  TO CORRECT-X                    IF1154.2
038300                        MOVE WS-INT TO COMPUTED-A                 IF1154.2
038400                        PERFORM FAIL.                             IF1154.2
038500     GO TO F-LENGTH-WRITE-05.                                     IF1154.2
038600 F-LENGTH-DELETE-05.                                              IF1154.2
038700     PERFORM  DE-LETE.                                            IF1154.2
038800     GO TO    F-LENGTH-WRITE-05.                                  IF1154.2
038900 F-LENGTH-WRITE-05.                                               IF1154.2
039000     MOVE "F-LENGTH-05" TO PAR-NAME.                              IF1154.2
039100     PERFORM  PRINT-DETAIL.                                       IF1154.2
039300 F-LENGTH-06.                                                     IF1154.2
039400     MOVE ZERO TO WS-INT.                                         IF1154.2
039500 F-LENGTH-TEST-06.                                                IF1154.2
039600     COMPUTE WS-INT = FUNCTION LENGTH(N).                         IF1154.2
039700     IF WS-INT = 3 THEN                                           IF1154.2
039800                        PERFORM PASS                              IF1154.2
039900     ELSE                                                         IF1154.2
040000                        MOVE 3 TO CORRECT-X                       IF1154.2
040100                        MOVE WS-INT TO COMPUTED-A                 IF1154.2
040200                        PERFORM FAIL.                             IF1154.2
040300     GO TO F-LENGTH-WRITE-06.                                     IF1154.2
040400 F-LENGTH-DELETE-06.                                              IF1154.2
040500     PERFORM  DE-LETE.                                            IF1154.2
040600     GO TO    F-LENGTH-WRITE-06.                                  IF1154.2
040700 F-LENGTH-WRITE-06.                                               IF1154.2
040800     MOVE "F-LENGTH-06" TO PAR-NAME.                              IF1154.2
040900     PERFORM  PRINT-DETAIL.                                       IF1154.2
041100 F-LENGTH-07.                                                     IF1154.2
041200     MOVE ZERO TO WS-INT.                                         IF1154.2
041300 F-LENGTH-TEST-07.                                                IF1154.2
041400     COMPUTE WS-INT = FUNCTION LENGTH(N) + 2.                     IF1154.2
041500     IF WS-INT = 5 THEN                                           IF1154.2
041600                        PERFORM PASS                              IF1154.2
041700     ELSE                                                         IF1154.2
041800                        MOVE 5 TO CORRECT-N                       IF1154.2
041900                        MOVE WS-INT TO COMPUTED-A                 IF1154.2
042000                        PERFORM FAIL.                             IF1154.2
042100     GO TO F-LENGTH-WRITE-07.                                     IF1154.2
042200 F-LENGTH-DELETE-07.                                              IF1154.2
042300     PERFORM  DE-LETE.                                            IF1154.2
042400     GO TO    F-LENGTH-WRITE-07.                                  IF1154.2
042500 F-LENGTH-WRITE-07.                                               IF1154.2
042600     MOVE "F-LENGTH-07" TO PAR-NAME.                              IF1154.2
042700     PERFORM  PRINT-DETAIL.                                       IF1154.2
042900 F-LENGTH-08.                                                     IF1154.2
043000     MOVE ZERO TO WS-INT.                                         IF1154.2
043100 F-LENGTH-TEST-08.                                                IF1154.2
043200     COMPUTE WS-INT = FUNCTION LENGTH(N) +                        IF1154.2
043300                      FUNCTION LENGTH(N).                         IF1154.2
043400     IF WS-INT = 6 THEN                                           IF1154.2
043500                        PERFORM PASS                              IF1154.2
043600     ELSE                                                         IF1154.2
043700                        MOVE 6 TO CORRECT-N                       IF1154.2
043800                        MOVE WS-INT TO COMPUTED-A                 IF1154.2
043900                        PERFORM FAIL.                             IF1154.2
044000     GO TO F-LENGTH-WRITE-08.                                     IF1154.2
044100 F-LENGTH-DELETE-08.                                              IF1154.2
044200     PERFORM  DE-LETE.                                            IF1154.2
044300     GO TO    F-LENGTH-WRITE-08.                                  IF1154.2
044400 F-LENGTH-WRITE-08.                                               IF1154.2
044500     MOVE "F-LENGTH-08" TO PAR-NAME.                              IF1154.2
044600     PERFORM  PRINT-DETAIL.                                       IF1154.2
044800 CCVS-EXIT SECTION.                                               IF1154.2
044900 CCVS-999999.                                                     IF1154.2
045000     GO TO CLOSE-FILES.                                           IF1154.2
