1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:03   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:03   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1094.2
   000002         000200 PROGRAM-ID.                                                      IF1094.2
   000003         000300     IF109A.                                                      IF1094.2
   000004         000400                                                                  IF1094.2
   000005         000600*                                                         *       IF1094.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1094.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1094.2
   000008         000900* DAY-OF-INTEGER.                                         *       IF1094.2
   000009         001000*                                                         *       IF1094.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1094.2
   000011         001300 CONFIGURATION SECTION.                                           IF1094.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1094.2
   000013         001500     XXXXX082.                                                    IF1094.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1094.2
   000015         001700     XXXXX083.                                                    IF1094.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1094.2
   000017         001900 FILE-CONTROL.                                                    IF1094.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1094.2 22
   000019         002100     XXXXX055.                                                    IF1094.2
   000020         002200 DATA DIVISION.                                                   IF1094.2
   000021         002300 FILE SECTION.                                                    IF1094.2
   000022         002400 FD  PRINT-FILE.                                                  IF1094.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1094.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1094.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1094.2
   000026         002900* Variables specific to the Intrinsic Function Test IF109A*       IF1094.2
   000027         003100 01  A                   PIC S9(10)     VALUE 400.                IF1094.2
   000028         003200 01  C                   PIC S9(10)     VALUE 365.                IF1094.2
   000029         003300 01  D                   PIC S9(10)     VALUE 1.                  IF1094.2
   000030         003400 01  ARG1                PIC S9(10)     VALUE 1.                  IF1094.2
   000031         003500 01  ARR                                VALUE "40537".            IF1094.2
   000032         003600     02 IND OCCURS 5 TIMES PIC 9.                                 IF1094.2
   000033         003700 01  TEMP                PIC S9(5)V9(5).                          IF1094.2
   000034         003800 01  WS-DATE             PIC 9(7).                                IF1094.2
   000035         003900*                                                                 IF1094.2
   000036         004100*                                                                 IF1094.2
   000037         004200 01  TEST-RESULTS.                                                IF1094.2
   000038         004300     02 FILLER                   PIC X      VALUE SPACE.          IF1094.2 IMP
   000039         004400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1094.2 IMP
   000040         004500     02 FILLER                   PIC X      VALUE SPACE.          IF1094.2 IMP
   000041         004600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1094.2 IMP
   000042         004700     02 FILLER                   PIC X      VALUE SPACE.          IF1094.2 IMP
   000043         004800     02  PAR-NAME.                                                IF1094.2
   000044         004900       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1094.2 IMP
   000045         005000       03  PARDOT-X              PIC X      VALUE SPACE.          IF1094.2 IMP
   000046         005100       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1094.2 IMP
   000047         005200     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1094.2 IMP
   000048         005300     02 RE-MARK                  PIC X(61).                       IF1094.2
   000049         005400 01  TEST-COMPUTED.                                               IF1094.2
   000050         005500     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1094.2 IMP
   000051         005600     02 FILLER                   PIC X(17)  VALUE                 IF1094.2
   000052         005700            "       COMPUTED=".                                   IF1094.2
   000053         005800     02 COMPUTED-X.                                               IF1094.2
   000054         005900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1094.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1094.2 54
   000056         006100                                 PIC -9(9).9(9).                  IF1094.2
   000057         006200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1094.2 54
   000058         006300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1094.2 54
   000059         006400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1094.2 54
   000060         006500     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1094.2 54
   000061         006600         04 COMPUTED-18V0                    PIC -9(18).          IF1094.2
   000062         006700         04 FILLER                           PIC X.               IF1094.2
   000063         006800     03 FILLER PIC X(50) VALUE SPACE.                             IF1094.2 IMP
   000064         006900 01  TEST-CORRECT.                                                IF1094.2
   000065         007000     02 FILLER PIC X(30) VALUE SPACE.                             IF1094.2 IMP
   000066         007100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1094.2
   000067         007200     02 CORRECT-X.                                                IF1094.2
   000068         007300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1094.2 IMP
   000069         007400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1094.2 68
   000070         007500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1094.2 68
   000071         007600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1094.2 68
   000072         007700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1094.2 68
   000073         007800     03      CR-18V0 REDEFINES CORRECT-A.                         IF1094.2 68
   000074         007900         04 CORRECT-18V0                     PIC -9(18).          IF1094.2
   000075         008000         04 FILLER                           PIC X.               IF1094.2
   000076         008100     03 FILLER PIC X(2) VALUE SPACE.                              IF1094.2 IMP
   000077         008200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1094.2 IMP
   000078         008300 01  CCVS-C-1.                                                    IF1094.2
   000079         008400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1094.2
   000080         008500-    "SS  PARAGRAPH-NAME                                          IF1094.2
   000081         008600-    "       REMARKS".                                            IF1094.2
   000082         008700     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1094.2 IMP
   000083         008800 01  CCVS-C-2.                                                    IF1094.2
   000084         008900     02 FILLER                     PIC X        VALUE SPACE.      IF1094.2 IMP
   000085         009000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1094.2
   000086         009100     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1094.2 IMP
   000087         009200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1094.2
   000088         009300     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1094.2 IMP
   000089         009400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1094.2 IMP
   000090         009500 01  REC-CT                        PIC 99       VALUE ZERO.       IF1094.2 IMP
   000091         009600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1094.2 IMP
   000092         009700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1094.2 IMP
   000093         009800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1094.2 IMP
   000094         009900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1094.2 IMP
   000095         010000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1094.2 IMP
   000096         010100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1094.2 IMP
   000097         010200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1094.2 IMP
   000098         010300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1094.2 IMP
   000099         010400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1094.2 IMP
   000100         010500 01  CCVS-H-1.                                                    IF1094.2
   000101         010600     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1094.2 IMP
   000102         010700     02  FILLER                    PIC X(42)    VALUE             IF1094.2
   000103         010800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1094.2
   000104         010900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1094.2 IMP
   000105         011000 01  CCVS-H-2A.                                                   IF1094.2
   000106         011100   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1094.2 IMP
   000107         011200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1094.2
   000108         011300   02  FILLER                        PIC XXXX   VALUE             IF1094.2
   000109         011400     "4.2 ".                                                      IF1094.2
   000110         011500   02  FILLER                        PIC X(28)  VALUE             IF1094.2
   000111         011600            " COPY - NOT FOR DISTRIBUTION".                       IF1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1094.2 IMP
   000113         011800                                                                  IF1094.2
   000114         011900 01  CCVS-H-2B.                                                   IF1094.2
   000115         012000   02  FILLER                        PIC X(15)  VALUE             IF1094.2
   000116         012100            "TEST RESULT OF ".                                    IF1094.2
   000117         012200   02  TEST-ID                       PIC X(9).                    IF1094.2
   000118         012300   02  FILLER                        PIC X(4)   VALUE             IF1094.2
   000119         012400            " IN ".                                               IF1094.2
   000120         012500   02  FILLER                        PIC X(12)  VALUE             IF1094.2
   000121         012600     " HIGH       ".                                              IF1094.2
   000122         012700   02  FILLER                        PIC X(22)  VALUE             IF1094.2
   000123         012800            " LEVEL VALIDATION FOR ".                             IF1094.2
   000124         012900   02  FILLER                        PIC X(58)  VALUE             IF1094.2
   000125         013000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1094.2
   000126         013100 01  CCVS-H-3.                                                    IF1094.2
   000127         013200     02  FILLER                      PIC X(34)  VALUE             IF1094.2
   000128         013300            " FOR OFFICIAL USE ONLY    ".                         IF1094.2
   000129         013400     02  FILLER                      PIC X(58)  VALUE             IF1094.2
   000130         013500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1094.2
   000131         013600     02  FILLER                      PIC X(28)  VALUE             IF1094.2
   000132         013700            "  COPYRIGHT   1985 ".                                IF1094.2
   000133         013800 01  CCVS-E-1.                                                    IF1094.2
   000134         013900     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1094.2 IMP
   000135         014000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1094.2
   000136         014100     02 ID-AGAIN                     PIC X(9).                    IF1094.2
   000137         014200     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1094.2 IMP
   000138         014300 01  CCVS-E-2.                                                    IF1094.2
   000139         014400     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1094.2 IMP
   000140         014500     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1094.2 IMP
   000141         014600     02 CCVS-E-2-2.                                               IF1094.2
   000142         014700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1094.2 IMP
   000143         014800         03 FILLER                   PIC X      VALUE SPACE.      IF1094.2 IMP
   000144         014900         03 ENDER-DESC               PIC X(44)  VALUE             IF1094.2
   000145         015000            "ERRORS ENCOUNTERED".                                 IF1094.2
   000146         015100 01  CCVS-E-3.                                                    IF1094.2
   000147         015200     02  FILLER                      PIC X(22)  VALUE             IF1094.2
   000148         015300            " FOR OFFICIAL USE ONLY".                             IF1094.2
   000149         015400     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1094.2 IMP
   000150         015500     02  FILLER                      PIC X(58)  VALUE             IF1094.2
   000151         015600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1094.2
   000152         015700     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1094.2 IMP
   000153         015800     02 FILLER                       PIC X(15)  VALUE             IF1094.2
   000154         015900             " COPYRIGHT 1985".                                   IF1094.2
   000155         016000 01  CCVS-E-4.                                                    IF1094.2
   000156         016100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1094.2 IMP
   000157         016200     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1094.2
   000158         016300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1094.2 IMP
   000159         016400     02 FILLER                       PIC X(40)  VALUE             IF1094.2
   000160         016500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1094.2
   000161         016600 01  XXINFO.                                                      IF1094.2
   000162         016700     02 FILLER                       PIC X(19)  VALUE             IF1094.2
   000163         016800            "*** INFORMATION ***".                                IF1094.2
   000164         016900     02 INFO-TEXT.                                                IF1094.2
   000165         017000       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1094.2 IMP
   000166         017100       04 XXCOMPUTED                 PIC X(20).                   IF1094.2
   000167         017200       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1094.2 IMP
   000168         017300       04 XXCORRECT                  PIC X(20).                   IF1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1094.2
   000170         017500 01  HYPHEN-LINE.                                                 IF1094.2
   000171         017600     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1094.2 IMP
   000172         017700     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1094.2
   000173         017800-    "*****************************************".                 IF1094.2
   000174         017900     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1094.2
   000175         018000-    "******************************".                            IF1094.2
   000176         018100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1094.2
   000177         018200     "IF109A".                                                    IF1094.2
   000178         018300 PROCEDURE DIVISION.                                              IF1094.2
   000179         018400 CCVS1 SECTION.                                                   IF1094.2
   000180         018500 OPEN-FILES.                                                      IF1094.2
   000181         018600     OPEN     OUTPUT PRINT-FILE.                                  IF1094.2 22
   000182         018700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1094.2 176 117 176 136
   000183         018800     MOVE    SPACE TO TEST-RESULTS.                               IF1094.2 IMP 37
   000184         018900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1094.2 207 212
   000185         019000     GO TO CCVS1-EXIT.                                            IF1094.2 294
   000186         019100 CLOSE-FILES.                                                     IF1094.2
   000187         019200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1094.2 216 236 22
   000188         019300 TERMINATE-CCVS.                                                  IF1094.2
   000189         019400     STOP     RUN.                                                IF1094.2
   000190         019500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1094.2 41 93
   000191         019600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1094.2 41 94
   000192         019700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1094.2 41 92
   000193         019800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1094.2 41 91
   000194         019900     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1094.2 48
   000195         020000 PRINT-DETAIL.                                                    IF1094.2
   000196         020100     IF REC-CT NOT EQUAL TO ZERO                                  IF1094.2 90 IMP
   000197      1  020200             MOVE "." TO PARDOT-X                                 IF1094.2 45
   000198      1  020300             MOVE REC-CT TO DOTVALUE.                             IF1094.2 90 46
   000199         020400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1094.2 37 23 248
   000200         020500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1094.2 41 248
   000201      1  020600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1094.2 269 283
   000202      1  020700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1094.2 284 293
   000203         020800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1094.2 IMP 41 IMP 53
   000204         020900     MOVE SPACE TO CORRECT-X.                                     IF1094.2 IMP 67
   000205         021000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1094.2 90 IMP IMP 43
   000206         021100     MOVE     SPACE TO RE-MARK.                                   IF1094.2 IMP 48
   000207         021200 HEAD-ROUTINE.                                                    IF1094.2
   000208         021300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1094.2 100 24 248
   000209         021400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1094.2 105 24 248
   000210         021500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1094.2 114 24 248
   000211         021600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1094.2 126 24 248
   000212         021700 COLUMN-NAMES-ROUTINE.                                            IF1094.2
   000213         021800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1094.2 78 24 248
   000214         021900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1094.2 83 24 248
   000215         022000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1094.2 170 24 248
   000216         022100 END-ROUTINE.                                                     IF1094.2
   000217         022200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1094.2 170 24 248
   000218         022300 END-RTN-EXIT.                                                    IF1094.2
   000219         022400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1094.2 133 24 248
   000220         022500 END-ROUTINE-1.                                                   IF1094.2
   000221         022600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1094.2 92 96 93
   000222         022700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1094.2 96 91 96
   000223         022800      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1094.2 94 96
   000224         022900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1094.2 94 156
   000225         023000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1094.2 96 158
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1094.2 155 141
   000227         023200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1094.2 138 24 248
   000228         023300  END-ROUTINE-12.                                                 IF1094.2
   000229         023400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1094.2 144
   000230         023500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1094.2 92 IMP
   000231      1  023600         MOVE "NO " TO ERROR-TOTAL                                IF1094.2 142
   000232         023700         ELSE                                                     IF1094.2
   000233      1  023800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1094.2 92 142
   000234         023900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1094.2 138 24
   000235         024000     PERFORM WRITE-LINE.                                          IF1094.2 248
   000236         024100 END-ROUTINE-13.                                                  IF1094.2
   000237         024200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1094.2 91 IMP
   000238      1  024300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1094.2 142
   000239      1  024400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1094.2 91 142
   000240         024500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1094.2 144
   000241         024600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1094.2 138 24 248
   000242         024700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1094.2 93 IMP
   000243      1  024800          MOVE "NO " TO ERROR-TOTAL                               IF1094.2 142
   000244      1  024900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1094.2 93 142
   000245         025000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1094.2 144
   000246         025100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1094.2 138 24 248
   000247         025200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1094.2 146 24 248
   000248         025300 WRITE-LINE.                                                      IF1094.2
   000249         025400     ADD 1 TO RECORD-COUNT.                                       IF1094.2 98
   000250         025500     IF RECORD-COUNT GREATER 42                                   IF1094.2 98
   000251      1  025600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1094.2 24 97
   000252      1  025700         MOVE SPACE TO DUMMY-RECORD                               IF1094.2 IMP 24
   000253      1  025800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1094.2 24
   000254      1  025900         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1094.2 100 24 264
   000255      1  026000         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1094.2 105 24 264
   000256      1  026100         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1094.2 114 24 264
   000257      1  026200         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1094.2 126 24 264
   000258      1  026300         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1094.2 78 24 264
   000259      1  026400         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1094.2 83 24 264
   000260      1  026500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1094.2 170 24 264
   000261      1  026600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1094.2 97 24
   000262      1  026700         MOVE ZERO TO RECORD-COUNT.                               IF1094.2 IMP 98
   000263         026800     PERFORM WRT-LN.                                              IF1094.2 264
   000264         026900 WRT-LN.                                                          IF1094.2
   000265         027000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1094.2 24
   000266         027100     MOVE SPACE TO DUMMY-RECORD.                                  IF1094.2 IMP 24
   000267         027200 BLANK-LINE-PRINT.                                                IF1094.2
   000268         027300     PERFORM WRT-LN.                                              IF1094.2 264
   000269         027400 FAIL-ROUTINE.                                                    IF1094.2
   000270         027500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1094.2 53 IMP
   000271      1  027600            GO TO FAIL-ROUTINE-WRITE.                             IF1094.2 278
   000272         027700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1094.2 67 IMP 278
   000273         027800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1094.2 99 169
   000274         027900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1094.2 164
   000275         028000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1094.2 161 24 248
   000276         028100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1094.2 IMP 169
   000277         028200     GO TO  FAIL-ROUTINE-EX.                                      IF1094.2 283
   000278         028300 FAIL-ROUTINE-WRITE.                                              IF1094.2
   000279         028400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1094.2 49 23 248
   000280         028500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1094.2 99 77
   000281         028600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1094.2 64 23 248
   000282         028700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1094.2 IMP 77
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800 FAIL-ROUTINE-EX. EXIT.                                           IF1094.2
   000284         028900 BAIL-OUT.                                                        IF1094.2
   000285         029000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1094.2 54 IMP 287
   000286         029100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1094.2 68 IMP 293
   000287         029200 BAIL-OUT-WRITE.                                                  IF1094.2
   000288         029300     MOVE CORRECT-A TO XXCORRECT.                                 IF1094.2 68 168
   000289         029400     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1094.2 54 166
   000290         029500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1094.2 99 169
   000291         029600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1094.2 161 24 248
   000292         029700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1094.2 IMP 169
   000293         029800 BAIL-OUT-EX. EXIT.                                               IF1094.2
   000294         029900 CCVS1-EXIT.                                                      IF1094.2
   000295         030000     EXIT.                                                        IF1094.2
   000296         030200*                                                      *          IF1094.2
   000297         030300*    Intrinsic Function Test  IF109A - DAY-OF-INTEGER  *          IF1094.2
   000298         030400*                                                      *          IF1094.2
   000299         030600 SECT-IF109A SECTION.                                             IF1094.2
   000300         030700 F-DAYOFINT-INFO.                                                 IF1094.2
   000301         030800     MOVE     "See ref. A-42 2.13" TO ANSI-REFERENCE.             IF1094.2 99
   000302         030900     MOVE     "DAY-OF-INTEGER"     TO FEATURE.                    IF1094.2 39
   000303         031100 F-DAYOFINT-01.                                                   IF1094.2
   000304         031200     MOVE ZERO TO WS-DATE.                                        IF1094.2 IMP 34
   000305         031300 F-DAYOFINT-TEST-01.                                              IF1094.2
   000306         031400     COMPUTE WS-DATE = FUNCTION DAY-OF-INTEGER(1).                IF1094.2 34 IFN
   000307         031500     IF WS-DATE = 1601001 THEN                                    IF1094.2 34
   000308      1  031600                        PERFORM PASS                              IF1094.2 191
   000309         031700     ELSE                                                         IF1094.2
   000310      1  031800                        MOVE  1601001  TO CORRECT-N               IF1094.2 69
   000311      1  031900                        MOVE WS-DATE TO COMPUTED-N                IF1094.2 34 55
   000312      1  032000                        PERFORM FAIL.                             IF1094.2 192
   000313         032100     GO TO F-DAYOFINT-WRITE-01.                                   IF1094.2 317
   000314         032200 F-DAYOFINT-DELETE-01.                                            IF1094.2
   000315         032300     PERFORM  DE-LETE.                                            IF1094.2 193
   000316         032400     GO TO    F-DAYOFINT-WRITE-01.                                IF1094.2 317
   000317         032500 F-DAYOFINT-WRITE-01.                                             IF1094.2
   000318         032600     MOVE "F-DAYOFINT-01" TO PAR-NAME.                            IF1094.2 43
   000319         032700     PERFORM  PRINT-DETAIL.                                       IF1094.2 195
   000320         032900 F-DAYOFINT-TEST-02.                                              IF1094.2
   000321         033000     EVALUATE FUNCTION DAY-OF-INTEGER(A)                          IF1094.2 IFN 27
   000322         033100     WHEN     1602035                                             IF1094.2
   000323      1  033200                    PERFORM PASS                                  IF1094.2 191
   000324      1  033300                    GO TO F-DAYOFINT-WRITE-02.                    IF1094.2 330
   000325         033400     PERFORM FAIL.                                                IF1094.2 192
   000326         033500     GO TO F-DAYOFINT-WRITE-02.                                   IF1094.2 330
   000327         033600 F-DAYOFINT-DELETE-02.                                            IF1094.2
   000328         033700     PERFORM  DE-LETE.                                            IF1094.2 193
   000329         033800     GO TO    F-DAYOFINT-WRITE-02.                                IF1094.2 330
   000330         033900 F-DAYOFINT-WRITE-02.                                             IF1094.2
   000331         034000     MOVE "F-DAYOFINT-02" TO PAR-NAME.                            IF1094.2 43
   000332         034100     PERFORM  PRINT-DETAIL.                                       IF1094.2 195
   000333         034300 F-DAYOFINT-TEST-03.                                              IF1094.2
   000334         034400     IF FUNCTION DAY-OF-INTEGER(IND(1)) = 1601004 THEN            IF1094.2 IFN 32
   000335      1  034500                        PERFORM PASS                              IF1094.2 191
   000336         034600     ELSE                                                         IF1094.2
   000337      1  034700                        PERFORM FAIL.                             IF1094.2 192
   000338         034800     GO TO F-DAYOFINT-WRITE-03.                                   IF1094.2 342
   000339         034900 F-DAYOFINT-DELETE-03.                                            IF1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         035000     PERFORM  DE-LETE.                                            IF1094.2 193
   000341         035100     GO TO    F-DAYOFINT-WRITE-03.                                IF1094.2 342
   000342         035200 F-DAYOFINT-WRITE-03.                                             IF1094.2
   000343         035300     MOVE "F-DAYOFINT-03" TO PAR-NAME.                            IF1094.2 43
   000344         035400     PERFORM  PRINT-DETAIL.                                       IF1094.2 195
   000345         035600 F-DAYOFINT-04.                                                   IF1094.2
   000346         035700     MOVE ZERO TO WS-DATE.                                        IF1094.2 IMP 34
   000347         035800 F-DAYOFINT-TEST-04.                                              IF1094.2
   000348         035900     COMPUTE WS-DATE = FUNCTION DAY-OF-INTEGER(IND(D)).           IF1094.2 34 IFN 32 29
   000349         036000     IF WS-DATE = 1601004 THEN                                    IF1094.2 34
   000350      1  036100                        PERFORM PASS                              IF1094.2 191
   000351         036200     ELSE                                                         IF1094.2
   000352      1  036300                        MOVE  1601004  TO CORRECT-N               IF1094.2 69
   000353      1  036400                        MOVE WS-DATE TO COMPUTED-N                IF1094.2 34 55
   000354      1  036500                        PERFORM FAIL.                             IF1094.2 192
   000355         036600     GO TO F-DAYOFINT-WRITE-04.                                   IF1094.2 359
   000356         036700 F-DAYOFINT-DELETE-04.                                            IF1094.2
   000357         036800     PERFORM  DE-LETE.                                            IF1094.2 193
   000358         036900     GO TO    F-DAYOFINT-WRITE-04.                                IF1094.2 359
   000359         037000 F-DAYOFINT-WRITE-04.                                             IF1094.2
   000360         037100     MOVE "F-DAYOFINT-04" TO PAR-NAME.                            IF1094.2 43
   000361         037200     PERFORM  PRINT-DETAIL.                                       IF1094.2 195
   000362         037400 F-DAYOFINT-05.                                                   IF1094.2
   000363         037500     MOVE ZERO TO WS-DATE.                                        IF1094.2 IMP 34
   000364         037600 F-DAYOFINT-TEST-05.                                              IF1094.2
   000365         037700     COMPUTE WS-DATE = FUNCTION DAY-OF-INTEGER(C).                IF1094.2 34 IFN 28
   000366         037800     IF WS-DATE = 1601365 THEN                                    IF1094.2 34
   000367      1  037900                        PERFORM PASS                              IF1094.2 191
   000368         038000     ELSE                                                         IF1094.2
   000369      1  038100                        MOVE  1601365  TO CORRECT-N               IF1094.2 69
   000370      1  038200                        MOVE WS-DATE TO COMPUTED-N                IF1094.2 34 55
   000371      1  038300                        PERFORM FAIL.                             IF1094.2 192
   000372         038400     GO TO F-DAYOFINT-WRITE-05.                                   IF1094.2 376
   000373         038500 F-DAYOFINT-DELETE-05.                                            IF1094.2
   000374         038600     PERFORM  DE-LETE.                                            IF1094.2 193
   000375         038700     GO TO    F-DAYOFINT-WRITE-05.                                IF1094.2 376
   000376         038800 F-DAYOFINT-WRITE-05.                                             IF1094.2
   000377         038900     MOVE "F-DAYOFINT-05" TO PAR-NAME.                            IF1094.2 43
   000378         039000     PERFORM  PRINT-DETAIL.                                       IF1094.2 195
   000379         039200 F-DAYOFINT-06.                                                   IF1094.2
   000380         039300     MOVE ZERO TO WS-DATE.                                        IF1094.2 IMP 34
   000381         039400 F-DAYOFINT-TEST-06.                                              IF1094.2
   000382         039500     COMPUTE WS-DATE = FUNCTION DAY-OF-INTEGER(D) + 10.           IF1094.2 34 IFN 29
   000383         039600     IF WS-DATE = 1601011 THEN                                    IF1094.2 34
   000384      1  039700                        PERFORM PASS                              IF1094.2 191
   000385         039800     ELSE                                                         IF1094.2
   000386      1  039900                        MOVE  1601011  TO CORRECT-N               IF1094.2 69
   000387      1  040000                        MOVE WS-DATE TO COMPUTED-N                IF1094.2 34 55
   000388      1  040100                        PERFORM FAIL.                             IF1094.2 192
   000389         040200     GO TO F-DAYOFINT-WRITE-06.                                   IF1094.2 393
   000390         040300 F-DAYOFINT-DELETE-06.                                            IF1094.2
   000391         040400     PERFORM  DE-LETE.                                            IF1094.2 193
   000392         040500     GO TO    F-DAYOFINT-WRITE-06.                                IF1094.2 393
   000393         040600 F-DAYOFINT-WRITE-06.                                             IF1094.2
   000394         040700     MOVE "F-DAYOFINT-06" TO PAR-NAME.                            IF1094.2 43
   000395         040800     PERFORM  PRINT-DETAIL.                                       IF1094.2 195
   000396         041000 F-DAYOFINT-07.                                                   IF1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         041100     MOVE ZERO TO WS-DATE.                                        IF1094.2 IMP 34
   000398         041200 F-DAYOFINT-TEST-07.                                              IF1094.2
   000399         041300     COMPUTE WS-DATE = FUNCTION DAY-OF-INTEGER(D) +               IF1094.2 34 IFN 29
   000400         041400                       FUNCTION DAY-OF-INTEGER(D).                IF1094.2 IFN 29
   000401         041500     IF WS-DATE = 3202002 THEN                                    IF1094.2 34
   000402      1  041600                        PERFORM PASS                              IF1094.2 191
   000403         041700     ELSE                                                         IF1094.2
   000404      1  041800                        MOVE  3202002  TO CORRECT-N               IF1094.2 69
   000405      1  041900                        MOVE WS-DATE TO COMPUTED-N                IF1094.2 34 55
   000406      1  042000                        PERFORM FAIL.                             IF1094.2 192
   000407         042100     GO TO F-DAYOFINT-WRITE-07.                                   IF1094.2 411
   000408         042200 F-DAYOFINT-DELETE-07.                                            IF1094.2
   000409         042300     PERFORM  DE-LETE.                                            IF1094.2 193
   000410         042400     GO TO    F-DAYOFINT-WRITE-07.                                IF1094.2 411
   000411         042500 F-DAYOFINT-WRITE-07.                                             IF1094.2
   000412         042600     MOVE "F-DAYOFINT-07" TO PAR-NAME.                            IF1094.2 43
   000413         042700     PERFORM  PRINT-DETAIL.                                       IF1094.2 195
   000414         042900 F-DAYOFINT-08.                                                   IF1094.2
   000415         043000     MOVE 1 TO ARG1.                                              IF1094.2 30
   000416         043100     PERFORM F-DAYOFINT-TEST-08                                   IF1094.2 424
   000417         043200             UNTIL FUNCTION DAY-OF-INTEGER(ARG1) > 1601010.       IF1094.2 IFN 30
   000418         043300     IF ARG1 = 11 THEN                                            IF1094.2 30
   000419      1  043400                            PERFORM PASS                          IF1094.2 191
   000420         043500     ELSE                                                         IF1094.2
   000421      1  043600                            PERFORM FAIL.                         IF1094.2 192
   000422         043700     GO TO F-DAYOFINT-WRITE-08.                                   IF1094.2 430
   000423         043800*                                                                 IF1094.2
   000424         043900 F-DAYOFINT-TEST-08.                                              IF1094.2
   000425         044000     COMPUTE ARG1 = ARG1 + 1.                                     IF1094.2 30 30
   000426         044100*                                                                 IF1094.2
   000427         044200 F-DAYOFINT-DELETE-08.                                            IF1094.2
   000428         044300     PERFORM  DE-LETE.                                            IF1094.2 193
   000429         044400     GO TO    F-DAYOFINT-WRITE-08.                                IF1094.2 430
   000430         044500 F-DAYOFINT-WRITE-08.                                             IF1094.2
   000431         044600     MOVE "F-DAYOFINT-08" TO PAR-NAME.                            IF1094.2 43
   000432         044700     PERFORM  PRINT-DETAIL.                                       IF1094.2 195
   000433         044900 CCVS-EXIT SECTION.                                               IF1094.2
   000434         045000 CCVS-999999.                                                     IF1094.2
   000435         045100     GO TO CLOSE-FILES.                                           IF1094.2 186
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page    11
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  321
       99   ANSI-REFERENCE . . . . . . . .  273 280 290 M301
       30   ARG1 . . . . . . . . . . . . .  M415 417 418 M425 425
       31   ARR
       28   C. . . . . . . . . . . . . . .  365
       78   CCVS-C-1 . . . . . . . . . . .  213 258
       83   CCVS-C-2 . . . . . . . . . . .  214 259
      133   CCVS-E-1 . . . . . . . . . . .  219
      138   CCVS-E-2 . . . . . . . . . . .  227 234 241 246
      141   CCVS-E-2-2 . . . . . . . . . .  M226
      146   CCVS-E-3 . . . . . . . . . . .  247
      155   CCVS-E-4 . . . . . . . . . . .  226
      156   CCVS-E-4-1 . . . . . . . . . .  M224
      158   CCVS-E-4-2 . . . . . . . . . .  M225
      100   CCVS-H-1 . . . . . . . . . . .  208 254
      105   CCVS-H-2A. . . . . . . . . . .  209 255
      114   CCVS-H-2B. . . . . . . . . . .  210 256
      126   CCVS-H-3 . . . . . . . . . . .  211 257
      176   CCVS-PGM-ID. . . . . . . . . .  182 182
       60   CM-18V0
       54   COMPUTED-A . . . . . . . . . .  55 57 58 59 60 285 289
       55   COMPUTED-N . . . . . . . . . .  M311 M353 M370 M387 M405
       53   COMPUTED-X . . . . . . . . . .  M203 270
       57   COMPUTED-0V18
       59   COMPUTED-14V4
       61   COMPUTED-18V0
       58   COMPUTED-4V14
       77   COR-ANSI-REFERENCE . . . . . .  M280 M282
       68   CORRECT-A. . . . . . . . . . .  69 70 71 72 73 286 288
       69   CORRECT-N. . . . . . . . . . .  M310 M352 M369 M386 M404
       67   CORRECT-X. . . . . . . . . . .  M204 272
       70   CORRECT-0V18
       72   CORRECT-14V4
       74   CORRECT-18V0
       71   CORRECT-4V14
       73   CR-18V0
       29   D. . . . . . . . . . . . . . .  348 382 399 400
       91   DELETE-COUNTER . . . . . . . .  M193 222 237 239
       46   DOTVALUE . . . . . . . . . . .  M198
       97   DUMMY-HOLD . . . . . . . . . .  M251 261
       24   DUMMY-RECORD . . . . . . . . .  M208 M209 M210 M211 M213 M214 M215 M217 M219 M227 M234 M241 M246 M247 251 M252
                                            253 M254 M255 M256 M257 M258 M259 M260 M261 265 M266 M275 M291
      144   ENDER-DESC . . . . . . . . . .  M229 M240 M245
       92   ERROR-COUNTER. . . . . . . . .  M192 221 230 233
       96   ERROR-HOLD . . . . . . . . . .  M221 M222 M222 M223 225
      142   ERROR-TOTAL. . . . . . . . . .  M231 M233 M238 M239 M243 M244
       39   FEATURE. . . . . . . . . . . .  M302
      170   HYPHEN-LINE. . . . . . . . . .  215 217 260
      136   ID-AGAIN . . . . . . . . . . .  M182
       32   IND. . . . . . . . . . . . . .  334 348
      169   INF-ANSI-REFERENCE . . . . . .  M273 M276 M290 M292
      164   INFO-TEXT. . . . . . . . . . .  M274
       93   INSPECT-COUNTER. . . . . . . .  M190 221 242 244
       41   P-OR-F . . . . . . . . . . . .  M190 M191 M192 M193 200 M203
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page    12
0 Defined   Cross-reference of data names   References

0      43   PAR-NAME . . . . . . . . . . .  M205 M318 M331 M343 M360 M377 M394 M412 M431
       45   PARDOT-X . . . . . . . . . . .  M197
       94   PASS-COUNTER . . . . . . . . .  M191 223 224
       22   PRINT-FILE . . . . . . . . . .  18 181 187
       23   PRINT-REC. . . . . . . . . . .  M199 M279 M281
       48   RE-MARK. . . . . . . . . . . .  M194 M206
       90   REC-CT . . . . . . . . . . . .  196 198 205
       89   REC-SKL-SUB
       98   RECORD-COUNT . . . . . . . . .  M249 250 M262
       33   TEMP
       49   TEST-COMPUTED. . . . . . . . .  279
       64   TEST-CORRECT . . . . . . . . .  281
      117   TEST-ID. . . . . . . . . . . .  M182
       37   TEST-RESULTS . . . . . . . . .  M183 199
       95   TOTAL-ERROR
       34   WS-DATE. . . . . . . . . . . .  M304 M306 307 311 M346 M348 349 353 M363 M365 366 370 M380 M382 383 387 M397
                                            M399 401 405
      166   XXCOMPUTED . . . . . . . . . .  M289
      168   XXCORRECT. . . . . . . . . . .  M288
      161   XXINFO . . . . . . . . . . . .  275 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page    13
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

      284   BAIL-OUT . . . . . . . . . . .  P202
      293   BAIL-OUT-EX. . . . . . . . . .  E202 G286
      287   BAIL-OUT-WRITE . . . . . . . .  G285
      267   BLANK-LINE-PRINT
      433   CCVS-EXIT
      434   CCVS-999999
      179   CCVS1
      294   CCVS1-EXIT . . . . . . . . . .  G185
      186   CLOSE-FILES. . . . . . . . . .  G435
      212   COLUMN-NAMES-ROUTINE . . . . .  E184
      193   DE-LETE. . . . . . . . . . . .  P315 P328 P340 P357 P374 P391 P409 P428
      216   END-ROUTINE. . . . . . . . . .  P187
      220   END-ROUTINE-1
      228   END-ROUTINE-12
      236   END-ROUTINE-13 . . . . . . . .  E187
      218   END-RTN-EXIT
      314   F-DAYOFINT-DELETE-01
      327   F-DAYOFINT-DELETE-02
      339   F-DAYOFINT-DELETE-03
      356   F-DAYOFINT-DELETE-04
      373   F-DAYOFINT-DELETE-05
      390   F-DAYOFINT-DELETE-06
      408   F-DAYOFINT-DELETE-07
      427   F-DAYOFINT-DELETE-08
      300   F-DAYOFINT-INFO
      305   F-DAYOFINT-TEST-01
      320   F-DAYOFINT-TEST-02
      333   F-DAYOFINT-TEST-03
      347   F-DAYOFINT-TEST-04
      364   F-DAYOFINT-TEST-05
      381   F-DAYOFINT-TEST-06
      398   F-DAYOFINT-TEST-07
      424   F-DAYOFINT-TEST-08 . . . . . .  P416
      317   F-DAYOFINT-WRITE-01. . . . . .  G313 G316
      330   F-DAYOFINT-WRITE-02. . . . . .  G324 G326 G329
      342   F-DAYOFINT-WRITE-03. . . . . .  G338 G341
      359   F-DAYOFINT-WRITE-04. . . . . .  G355 G358
      376   F-DAYOFINT-WRITE-05. . . . . .  G372 G375
      393   F-DAYOFINT-WRITE-06. . . . . .  G389 G392
      411   F-DAYOFINT-WRITE-07. . . . . .  G407 G410
      430   F-DAYOFINT-WRITE-08. . . . . .  G422 G429
      303   F-DAYOFINT-01
      345   F-DAYOFINT-04
      362   F-DAYOFINT-05
      379   F-DAYOFINT-06
      396   F-DAYOFINT-07
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page    14
0 Defined   Cross-reference of procedures   References

0     414   F-DAYOFINT-08
      192   FAIL . . . . . . . . . . . . .  P312 P325 P337 P354 P371 P388 P406 P421
      269   FAIL-ROUTINE . . . . . . . . .  P201
      283   FAIL-ROUTINE-EX. . . . . . . .  E201 G277
      278   FAIL-ROUTINE-WRITE . . . . . .  G271 G272
      207   HEAD-ROUTINE . . . . . . . . .  P184
      190   INSPT
      180   OPEN-FILES
      191   PASS . . . . . . . . . . . . .  P308 P323 P335 P350 P367 P384 P402 P419
      195   PRINT-DETAIL . . . . . . . . .  P319 P332 P344 P361 P378 P395 P413 P432
      299   SECT-IF109A
      188   TERMINATE-CCVS
      248   WRITE-LINE . . . . . . . . . .  P199 P200 P208 P209 P210 P211 P213 P214 P215 P217 P219 P227 P235 P241 P246 P247
                                            P275 P279 P281 P291
      264   WRT-LN . . . . . . . . . . . .  P254 P255 P256 P257 P258 P259 P260 P263 P268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page    15
0 Defined   Cross-reference of programs     References

        3   IF109A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF109A    Date 06/04/2022  Time 11:57:03   Page    16
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF109A:
 *    Source records = 435
 *    Data Division statements = 71
 *    Procedure Division statements = 225
 *    Generated COBOL statements = 0
 *    Program complexity factor = 233
0End of compilation 1,  program IF109A,  highest severity 0.
0Return code 0
