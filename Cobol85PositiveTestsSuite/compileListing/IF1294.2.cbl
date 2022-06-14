1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:33   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:33   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1294.2
   000002         000200 PROGRAM-ID.                                                      IF1294.2
   000003         000300     IF129A.                                                      IF1294.2
   000004         000400                                                                  IF1294.2
   000005         000600*                                                         *       IF1294.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1294.2
   000007         000800* It contains tests for the Intrinsic Function ORD-MIN.   *       IF1294.2
   000008         000900*                                                         *       IF1294.2
   000009         001000*                                                         *       IF1294.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1294.2
   000011         001300 CONFIGURATION SECTION.                                           IF1294.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1294.2
   000013         001500     XXXXX082.                                                    IF1294.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1294.2
   000015         001700     XXXXX083                                                     IF1294.2
   000016         001800     PROGRAM COLLATING SEQUENCE IS PRG-COLL-SEQ.                  IF1294.2 18
   000017         001900 SPECIAL-NAMES.                                                   IF1294.2
   000018         002000     ALPHABET PRG-COLL-SEQ IS                                     IF1294.2
   000019         002100     STANDARD-2.                                                  IF1294.2
   000020         002200 INPUT-OUTPUT SECTION.                                            IF1294.2
   000021         002300 FILE-CONTROL.                                                    IF1294.2
   000022         002400     SELECT PRINT-FILE ASSIGN TO                                  IF1294.2 26
   000023         002500     XXXXX055.                                                    IF1294.2
   000024         002600 DATA DIVISION.                                                   IF1294.2
   000025         002700 FILE SECTION.                                                    IF1294.2
   000026         002800 FD  PRINT-FILE.                                                  IF1294.2

 ==000026==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000027         002900 01  PRINT-REC PICTURE X(120).                                    IF1294.2
   000028         003000 01  DUMMY-RECORD PICTURE X(120).                                 IF1294.2
   000029         003100 WORKING-STORAGE SECTION.                                         IF1294.2
   000030         003300* Variables specific to the Intrinsic Function Test IF129A*       IF1294.2
   000031         003500 01  A                   PIC S9(10)     VALUE 5.                  IF1294.2
   000032         003600 01  B                   PIC S9(10)     VALUE 7.                  IF1294.2
   000033         003700 01  C                   PIC S9(10)     VALUE 4.                  IF1294.2
   000034         003800 01  D                   PIC S9(10)     VALUE 10.                 IF1294.2
   000035         003900 01  I                   PIC X(4)       VALUE "R".                IF1294.2
   000036         004000 01  J                   PIC X(4)       VALUE "U".                IF1294.2
   000037         004100 01  P                   PIC S9(10)     VALUE 1.                  IF1294.2
   000038         004200 01  Q                   PIC S9(10)     VALUE 3.                  IF1294.2
   000039         004300 01  R                   PIC S9(10)     VALUE 5.                  IF1294.2
   000040         004400 01  ARG1                PIC S9(10)     VALUE 10.                 IF1294.2
   000041         004500 01  ARR                                VALUE "40537".            IF1294.2
   000042         004600     02 IND OCCURS 5 TIMES   PIC 9.                               IF1294.2
   000043         004700 01  TEMP                PIC S9(10).                              IF1294.2
   000044         004800 01  WS-INT              PIC S9(10).                              IF1294.2
   000045         004900*                                                                 IF1294.2
   000046         005100*                                                                 IF1294.2
   000047         005200 01  TEST-RESULTS.                                                IF1294.2
   000048         005300     02 FILLER                   PIC X      VALUE SPACE.          IF1294.2 IMP
   000049         005400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1294.2 IMP
   000050         005500     02 FILLER                   PIC X      VALUE SPACE.          IF1294.2 IMP
   000051         005600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1294.2 IMP
   000052         005700     02 FILLER                   PIC X      VALUE SPACE.          IF1294.2 IMP
   000053         005800     02  PAR-NAME.                                                IF1294.2
   000054         005900       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1294.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000       03  PARDOT-X              PIC X      VALUE SPACE.          IF1294.2 IMP
   000056         006100       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1294.2 IMP
   000057         006200     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1294.2 IMP
   000058         006300     02 RE-MARK                  PIC X(61).                       IF1294.2
   000059         006400 01  TEST-COMPUTED.                                               IF1294.2
   000060         006500     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1294.2 IMP
   000061         006600     02 FILLER                   PIC X(17)  VALUE                 IF1294.2
   000062         006700            "       COMPUTED=".                                   IF1294.2
   000063         006800     02 COMPUTED-X.                                               IF1294.2
   000064         006900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1294.2 IMP
   000065         007000     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1294.2 64
   000066         007100                                 PIC -9(9).9(9).                  IF1294.2
   000067         007200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1294.2 64
   000068         007300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1294.2 64
   000069         007400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1294.2 64
   000070         007500     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1294.2 64
   000071         007600         04 COMPUTED-18V0                    PIC -9(18).          IF1294.2
   000072         007700         04 FILLER                           PIC X.               IF1294.2
   000073         007800     03 FILLER PIC X(50) VALUE SPACE.                             IF1294.2 IMP
   000074         007900 01  TEST-CORRECT.                                                IF1294.2
   000075         008000     02 FILLER PIC X(30) VALUE SPACE.                             IF1294.2 IMP
   000076         008100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1294.2
   000077         008200     02 CORRECT-X.                                                IF1294.2
   000078         008300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1294.2 IMP
   000079         008400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1294.2 78
   000080         008500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1294.2 78
   000081         008600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1294.2 78
   000082         008700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1294.2 78
   000083         008800     03      CR-18V0 REDEFINES CORRECT-A.                         IF1294.2 78
   000084         008900         04 CORRECT-18V0                     PIC -9(18).          IF1294.2
   000085         009000         04 FILLER                           PIC X.               IF1294.2
   000086         009100     03 FILLER PIC X(2) VALUE SPACE.                              IF1294.2 IMP
   000087         009200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1294.2 IMP
   000088         009300 01  CCVS-C-1.                                                    IF1294.2
   000089         009400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1294.2
   000090         009500-    "SS  PARAGRAPH-NAME                                          IF1294.2
   000091         009600-    "       REMARKS".                                            IF1294.2
   000092         009700     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1294.2 IMP
   000093         009800 01  CCVS-C-2.                                                    IF1294.2
   000094         009900     02 FILLER                     PIC X        VALUE SPACE.      IF1294.2 IMP
   000095         010000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1294.2
   000096         010100     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1294.2 IMP
   000097         010200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1294.2
   000098         010300     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1294.2 IMP
   000099         010400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1294.2 IMP
   000100         010500 01  REC-CT                        PIC 99       VALUE ZERO.       IF1294.2 IMP
   000101         010600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1294.2 IMP
   000102         010700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1294.2 IMP
   000103         010800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1294.2 IMP
   000104         010900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1294.2 IMP
   000105         011000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1294.2 IMP
   000106         011100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1294.2 IMP
   000107         011200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1294.2 IMP
   000108         011300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1294.2 IMP
   000109         011400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1294.2 IMP
   000110         011500 01  CCVS-H-1.                                                    IF1294.2
   000111         011600     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1294.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     02  FILLER                    PIC X(42)    VALUE             IF1294.2
   000113         011800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1294.2
   000114         011900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1294.2 IMP
   000115         012000 01  CCVS-H-2A.                                                   IF1294.2
   000116         012100   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1294.2 IMP
   000117         012200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1294.2
   000118         012300   02  FILLER                        PIC XXXX   VALUE             IF1294.2
   000119         012400     "4.2 ".                                                      IF1294.2
   000120         012500   02  FILLER                        PIC X(28)  VALUE             IF1294.2
   000121         012600            " COPY - NOT FOR DISTRIBUTION".                       IF1294.2
   000122         012700   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1294.2 IMP
   000123         012800                                                                  IF1294.2
   000124         012900 01  CCVS-H-2B.                                                   IF1294.2
   000125         013000   02  FILLER                        PIC X(15)  VALUE             IF1294.2
   000126         013100            "TEST RESULT OF ".                                    IF1294.2
   000127         013200   02  TEST-ID                       PIC X(9).                    IF1294.2
   000128         013300   02  FILLER                        PIC X(4)   VALUE             IF1294.2
   000129         013400            " IN ".                                               IF1294.2
   000130         013500   02  FILLER                        PIC X(12)  VALUE             IF1294.2
   000131         013600     " HIGH       ".                                              IF1294.2
   000132         013700   02  FILLER                        PIC X(22)  VALUE             IF1294.2
   000133         013800            " LEVEL VALIDATION FOR ".                             IF1294.2
   000134         013900   02  FILLER                        PIC X(58)  VALUE             IF1294.2
   000135         014000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1294.2
   000136         014100 01  CCVS-H-3.                                                    IF1294.2
   000137         014200     02  FILLER                      PIC X(34)  VALUE             IF1294.2
   000138         014300            " FOR OFFICIAL USE ONLY    ".                         IF1294.2
   000139         014400     02  FILLER                      PIC X(58)  VALUE             IF1294.2
   000140         014500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1294.2
   000141         014600     02  FILLER                      PIC X(28)  VALUE             IF1294.2
   000142         014700            "  COPYRIGHT   1985 ".                                IF1294.2
   000143         014800 01  CCVS-E-1.                                                    IF1294.2
   000144         014900     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1294.2 IMP
   000145         015000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1294.2
   000146         015100     02 ID-AGAIN                     PIC X(9).                    IF1294.2
   000147         015200     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1294.2 IMP
   000148         015300 01  CCVS-E-2.                                                    IF1294.2
   000149         015400     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1294.2 IMP
   000150         015500     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1294.2 IMP
   000151         015600     02 CCVS-E-2-2.                                               IF1294.2
   000152         015700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1294.2 IMP
   000153         015800         03 FILLER                   PIC X      VALUE SPACE.      IF1294.2 IMP
   000154         015900         03 ENDER-DESC               PIC X(44)  VALUE             IF1294.2
   000155         016000            "ERRORS ENCOUNTERED".                                 IF1294.2
   000156         016100 01  CCVS-E-3.                                                    IF1294.2
   000157         016200     02  FILLER                      PIC X(22)  VALUE             IF1294.2
   000158         016300            " FOR OFFICIAL USE ONLY".                             IF1294.2
   000159         016400     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1294.2 IMP
   000160         016500     02  FILLER                      PIC X(58)  VALUE             IF1294.2
   000161         016600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1294.2
   000162         016700     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1294.2 IMP
   000163         016800     02 FILLER                       PIC X(15)  VALUE             IF1294.2
   000164         016900             " COPYRIGHT 1985".                                   IF1294.2
   000165         017000 01  CCVS-E-4.                                                    IF1294.2
   000166         017100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1294.2 IMP
   000167         017200     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1294.2
   000168         017300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1294.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 FILLER                       PIC X(40)  VALUE             IF1294.2
   000170         017500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1294.2
   000171         017600 01  XXINFO.                                                      IF1294.2
   000172         017700     02 FILLER                       PIC X(19)  VALUE             IF1294.2
   000173         017800            "*** INFORMATION ***".                                IF1294.2
   000174         017900     02 INFO-TEXT.                                                IF1294.2
   000175         018000       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1294.2 IMP
   000176         018100       04 XXCOMPUTED                 PIC X(20).                   IF1294.2
   000177         018200       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1294.2 IMP
   000178         018300       04 XXCORRECT                  PIC X(20).                   IF1294.2
   000179         018400     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1294.2
   000180         018500 01  HYPHEN-LINE.                                                 IF1294.2
   000181         018600     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1294.2 IMP
   000182         018700     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1294.2
   000183         018800-    "*****************************************".                 IF1294.2
   000184         018900     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1294.2
   000185         019000-    "******************************".                            IF1294.2
   000186         019100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1294.2
   000187         019200     "IF129A".                                                    IF1294.2
   000188         019300 PROCEDURE DIVISION.                                              IF1294.2
   000189         019400 CCVS1 SECTION.                                                   IF1294.2
   000190         019500 OPEN-FILES.                                                      IF1294.2
   000191         019600     OPEN     OUTPUT PRINT-FILE.                                  IF1294.2 26
   000192         019700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1294.2 186 127 186 146
   000193         019800     MOVE    SPACE TO TEST-RESULTS.                               IF1294.2 IMP 47
   000194         019900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1294.2 217 222
   000195         020000     GO TO CCVS1-EXIT.                                            IF1294.2 304
   000196         020100 CLOSE-FILES.                                                     IF1294.2
   000197         020200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1294.2 226 246 26
   000198         020300 TERMINATE-CCVS.                                                  IF1294.2
   000199         020400     STOP     RUN.                                                IF1294.2
   000200         020500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1294.2 51 103
   000201         020600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1294.2 51 104
   000202         020700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1294.2 51 102
   000203         020800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1294.2 51 101
   000204         020900     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1294.2 58
   000205         021000 PRINT-DETAIL.                                                    IF1294.2
   000206         021100     IF REC-CT NOT EQUAL TO ZERO                                  IF1294.2 100 IMP
   000207      1  021200             MOVE "." TO PARDOT-X                                 IF1294.2 55
   000208      1  021300             MOVE REC-CT TO DOTVALUE.                             IF1294.2 100 56
   000209         021400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1294.2 47 27 258
   000210         021500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1294.2 51 258
   000211      1  021600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1294.2 279 293
   000212      1  021700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1294.2 294 303
   000213         021800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1294.2 IMP 51 IMP 63
   000214         021900     MOVE SPACE TO CORRECT-X.                                     IF1294.2 IMP 77
   000215         022000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1294.2 100 IMP IMP 53
   000216         022100     MOVE     SPACE TO RE-MARK.                                   IF1294.2 IMP 58
   000217         022200 HEAD-ROUTINE.                                                    IF1294.2
   000218         022300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1294.2 110 28 258
   000219         022400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1294.2 115 28 258
   000220         022500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1294.2 124 28 258
   000221         022600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1294.2 136 28 258
   000222         022700 COLUMN-NAMES-ROUTINE.                                            IF1294.2
   000223         022800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1294.2 88 28 258
   000224         022900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1294.2 93 28 258
   000225         023000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1294.2 180 28 258
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 END-ROUTINE.                                                     IF1294.2
   000227         023200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1294.2 180 28 258
   000228         023300 END-RTN-EXIT.                                                    IF1294.2
   000229         023400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1294.2 143 28 258
   000230         023500 END-ROUTINE-1.                                                   IF1294.2
   000231         023600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1294.2 102 106 103
   000232         023700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1294.2 106 101 106
   000233         023800      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1294.2 104 106
   000234         023900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1294.2 104 166
   000235         024000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1294.2 106 168
   000236         024100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1294.2 165 151
   000237         024200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1294.2 148 28 258
   000238         024300  END-ROUTINE-12.                                                 IF1294.2
   000239         024400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1294.2 154
   000240         024500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1294.2 102 IMP
   000241      1  024600         MOVE "NO " TO ERROR-TOTAL                                IF1294.2 152
   000242         024700         ELSE                                                     IF1294.2
   000243      1  024800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1294.2 102 152
   000244         024900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1294.2 148 28
   000245         025000     PERFORM WRITE-LINE.                                          IF1294.2 258
   000246         025100 END-ROUTINE-13.                                                  IF1294.2
   000247         025200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1294.2 101 IMP
   000248      1  025300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1294.2 152
   000249      1  025400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1294.2 101 152
   000250         025500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1294.2 154
   000251         025600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1294.2 148 28 258
   000252         025700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1294.2 103 IMP
   000253      1  025800          MOVE "NO " TO ERROR-TOTAL                               IF1294.2 152
   000254      1  025900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1294.2 103 152
   000255         026000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1294.2 154
   000256         026100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1294.2 148 28 258
   000257         026200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1294.2 156 28 258
   000258         026300 WRITE-LINE.                                                      IF1294.2
   000259         026400     ADD 1 TO RECORD-COUNT.                                       IF1294.2 108
   000260         026500     IF RECORD-COUNT GREATER 42                                   IF1294.2 108
   000261      1  026600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1294.2 28 107
   000262      1  026700         MOVE SPACE TO DUMMY-RECORD                               IF1294.2 IMP 28
   000263      1  026800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1294.2 28
   000264      1  026900         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1294.2 110 28 274
   000265      1  027000         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1294.2 115 28 274
   000266      1  027100         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1294.2 124 28 274
   000267      1  027200         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1294.2 136 28 274
   000268      1  027300         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1294.2 88 28 274
   000269      1  027400         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1294.2 93 28 274
   000270      1  027500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1294.2 180 28 274
   000271      1  027600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1294.2 107 28
   000272      1  027700         MOVE ZERO TO RECORD-COUNT.                               IF1294.2 IMP 108
   000273         027800     PERFORM WRT-LN.                                              IF1294.2 274
   000274         027900 WRT-LN.                                                          IF1294.2
   000275         028000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1294.2 28
   000276         028100     MOVE SPACE TO DUMMY-RECORD.                                  IF1294.2 IMP 28
   000277         028200 BLANK-LINE-PRINT.                                                IF1294.2
   000278         028300     PERFORM WRT-LN.                                              IF1294.2 274
   000279         028400 FAIL-ROUTINE.                                                    IF1294.2
   000280         028500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1294.2 63 IMP
   000281      1  028600            GO TO FAIL-ROUTINE-WRITE.                             IF1294.2 288
   000282         028700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1294.2 77 IMP 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1294.2 109 179
   000284         028900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1294.2 174
   000285         029000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1294.2 171 28 258
   000286         029100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1294.2 IMP 179
   000287         029200     GO TO  FAIL-ROUTINE-EX.                                      IF1294.2 293
   000288         029300 FAIL-ROUTINE-WRITE.                                              IF1294.2
   000289         029400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1294.2 59 27 258
   000290         029500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1294.2 109 87
   000291         029600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1294.2 74 27 258
   000292         029700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1294.2 IMP 87
   000293         029800 FAIL-ROUTINE-EX. EXIT.                                           IF1294.2
   000294         029900 BAIL-OUT.                                                        IF1294.2
   000295         030000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1294.2 64 IMP 297
   000296         030100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1294.2 78 IMP 303
   000297         030200 BAIL-OUT-WRITE.                                                  IF1294.2
   000298         030300     MOVE CORRECT-A TO XXCORRECT.                                 IF1294.2 78 178
   000299         030400     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1294.2 64 176
   000300         030500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1294.2 109 179
   000301         030600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1294.2 171 28 258
   000302         030700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1294.2 IMP 179
   000303         030800 BAIL-OUT-EX. EXIT.                                               IF1294.2
   000304         030900 CCVS1-EXIT.                                                      IF1294.2
   000305         031000     EXIT.                                                        IF1294.2
   000306         031200*                                                      *          IF1294.2
   000307         031300*    Intrinsic Function Tests         IF129A - ORD-MIN *          IF1294.2
   000308         031400*                                                      *          IF1294.2
   000309         031600 SECT-IF129A SECTION.                                             IF1294.2
   000310         031700 F-ORD-MIN-INFO.                                                  IF1294.2
   000311         031800     MOVE     "See ref. A-62 2.33" TO ANSI-REFERENCE.             IF1294.2 109
   000312         031900     MOVE     "ORD-MIN Function"     TO FEATURE.                  IF1294.2 49
   000313         032100 F-ORD-MIN-01.                                                    IF1294.2
   000314         032200     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000315         032300 F-ORD-MIN-TEST-01.                                               IF1294.2
   000316         032400     COMPUTE WS-INT = FUNCTION ORD-MIN(5, 3, 2, 8, 3, 1).         IF1294.2 44 IFN
   000317         032500     IF WS-INT = 6 THEN                                           IF1294.2 44
   000318      1  032600                        PERFORM PASS                              IF1294.2 201
   000319         032700     ELSE                                                         IF1294.2
   000320      1  032800                        MOVE 6   TO CORRECT-N                     IF1294.2 79
   000321      1  032900                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000322      1  033000                        PERFORM FAIL.                             IF1294.2 202
   000323         033100     GO TO F-ORD-MIN-WRITE-01.                                    IF1294.2 327
   000324         033200 F-ORD-MIN-DELETE-01.                                             IF1294.2
   000325         033300     PERFORM  DE-LETE.                                            IF1294.2 203
   000326         033400     GO TO    F-ORD-MIN-WRITE-01.                                 IF1294.2 327
   000327         033500 F-ORD-MIN-WRITE-01.                                              IF1294.2
   000328         033600     MOVE "F-ORD-MIN-01" TO PAR-NAME.                             IF1294.2 53
   000329         033700     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000330         033900 F-ORD-MIN-TEST-02.                                               IF1294.2
   000331         034000     EVALUATE FUNCTION ORD-MIN(3, 2, 7, 1, 5)                     IF1294.2 IFN
   000332         034100     WHEN 4                                                       IF1294.2
   000333      1  034200                                 PERFORM PASS                     IF1294.2 201
   000334      1  034300                                 GO TO F-ORD-MIN-WRITE-02.        IF1294.2 340
   000335         034400     PERFORM FAIL.                                                IF1294.2 202
   000336         034500     GO TO F-ORD-MIN-WRITE-02.                                    IF1294.2 340
   000337         034600 F-ORD-MIN-DELETE-02.                                             IF1294.2
   000338         034700     PERFORM  DE-LETE.                                            IF1294.2 203
   000339         034800     GO TO    F-ORD-MIN-WRITE-02.                                 IF1294.2 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034900 F-ORD-MIN-WRITE-02.                                              IF1294.2
   000341         035000     MOVE "F-ORD-MIN-02" TO PAR-NAME.                             IF1294.2 53
   000342         035100     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000343         035300 F-ORD-MIN-03.                                                    IF1294.2
   000344         035400     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000345         035500 F-ORD-MIN-TEST-03.                                               IF1294.2
   000346         035600     IF FUNCTION ORD-MIN(5, 4, 3, 6, 2, 8) = 5                    IF1294.2 IFN
   000347      1  035700                        PERFORM PASS                              IF1294.2 201
   000348         035800     ELSE                                                         IF1294.2
   000349      1  035900                        PERFORM FAIL.                             IF1294.2 202
   000350         036000     GO TO F-ORD-MIN-WRITE-03.                                    IF1294.2 354
   000351         036100 F-ORD-MIN-DELETE-03.                                             IF1294.2
   000352         036200     PERFORM  DE-LETE.                                            IF1294.2 203
   000353         036300     GO TO    F-ORD-MIN-WRITE-03.                                 IF1294.2 354
   000354         036400 F-ORD-MIN-WRITE-03.                                              IF1294.2
   000355         036500     MOVE "F-ORD-MIN-03" TO PAR-NAME.                             IF1294.2 53
   000356         036600     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000357         036800 F-ORD-MIN-04.                                                    IF1294.2
   000358         036900     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000359         037000 F-ORD-MIN-TEST-04.                                               IF1294.2
   000360         037100     COMPUTE WS-INT = FUNCTION ORD-MIN(A, B, C).                  IF1294.2 44 IFN 31 32 33
   000361         037200     IF WS-INT = 3 THEN                                           IF1294.2 44
   000362      1  037300                        PERFORM PASS                              IF1294.2 201
   000363         037400     ELSE                                                         IF1294.2
   000364      1  037500                        MOVE 3   TO CORRECT-N                     IF1294.2 79
   000365      1  037600                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000366      1  037700                        PERFORM FAIL.                             IF1294.2 202
   000367         037800     GO TO F-ORD-MIN-WRITE-04.                                    IF1294.2 371
   000368         037900 F-ORD-MIN-DELETE-04.                                             IF1294.2
   000369         038000     PERFORM  DE-LETE.                                            IF1294.2 203
   000370         038100     GO TO    F-ORD-MIN-WRITE-04.                                 IF1294.2 371
   000371         038200 F-ORD-MIN-WRITE-04.                                              IF1294.2
   000372         038300     MOVE "F-ORD-MIN-04" TO PAR-NAME.                             IF1294.2 53
   000373         038400     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000374         038600 F-ORD-MIN-05.                                                    IF1294.2
   000375         038700     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000376         038800 F-ORD-MIN-TEST-05.                                               IF1294.2
   000377         038900     COMPUTE WS-INT = FUNCTION ORD-MIN(A, B, D).                  IF1294.2 44 IFN 31 32 34
   000378         039000     IF WS-INT = 1 THEN                                           IF1294.2 44
   000379      1  039100                        PERFORM PASS                              IF1294.2 201
   000380         039200     ELSE                                                         IF1294.2
   000381      1  039300                        MOVE 1    TO CORRECT-N                    IF1294.2 79
   000382      1  039400                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000383      1  039500                        PERFORM FAIL.                             IF1294.2 202
   000384         039600     GO TO F-ORD-MIN-WRITE-05.                                    IF1294.2 388
   000385         039700 F-ORD-MIN-DELETE-05.                                             IF1294.2
   000386         039800     PERFORM  DE-LETE.                                            IF1294.2 203
   000387         039900     GO TO    F-ORD-MIN-WRITE-05.                                 IF1294.2 388
   000388         040000 F-ORD-MIN-WRITE-05.                                              IF1294.2
   000389         040100     MOVE "F-ORD-MIN-05" TO PAR-NAME.                             IF1294.2 53
   000390         040200     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000391         040400 F-ORD-MIN-06.                                                    IF1294.2
   000392         040500     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000393         040600 F-ORD-MIN-TEST-06.                                               IF1294.2
   000394         040700     COMPUTE WS-INT = FUNCTION ORD-MIN(A, 4, B, 7, 1, 9).         IF1294.2 44 IFN 31 32
   000395         040800     IF WS-INT = 5 THEN                                           IF1294.2 44
   000396      1  040900                        PERFORM PASS                              IF1294.2 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         041000     ELSE                                                         IF1294.2
   000398      1  041100                        MOVE 5   TO CORRECT-N                     IF1294.2 79
   000399      1  041200                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000400      1  041300                        PERFORM FAIL.                             IF1294.2 202
   000401         041400     GO TO F-ORD-MIN-WRITE-06.                                    IF1294.2 405
   000402         041500 F-ORD-MIN-DELETE-06.                                             IF1294.2
   000403         041600     PERFORM  DE-LETE.                                            IF1294.2 203
   000404         041700     GO TO    F-ORD-MIN-WRITE-06.                                 IF1294.2 405
   000405         041800 F-ORD-MIN-WRITE-06.                                              IF1294.2
   000406         041900     MOVE "F-ORD-MIN-06" TO PAR-NAME.                             IF1294.2 53
   000407         042000     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000408         042200 F-ORD-MIN-07.                                                    IF1294.2
   000409         042300     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000410         042400 F-ORD-MIN-TEST-07.                                               IF1294.2
   000411         042500     COMPUTE WS-INT = FUNCTION ORD-MIN(4, 1, A, 3).               IF1294.2 44 IFN 31
   000412         042600     IF WS-INT = 2 THEN                                           IF1294.2 44
   000413      1  042700                        PERFORM PASS                              IF1294.2 201
   000414         042800     ELSE                                                         IF1294.2
   000415      1  042900                        MOVE 2    TO CORRECT-N                    IF1294.2 79
   000416      1  043000                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000417      1  043100                        PERFORM FAIL.                             IF1294.2 202
   000418         043200     GO TO F-ORD-MIN-WRITE-07.                                    IF1294.2 422
   000419         043300 F-ORD-MIN-DELETE-07.                                             IF1294.2
   000420         043400     PERFORM  DE-LETE.                                            IF1294.2 203
   000421         043500     GO TO    F-ORD-MIN-WRITE-07.                                 IF1294.2 422
   000422         043600 F-ORD-MIN-WRITE-07.                                              IF1294.2
   000423         043700     MOVE "F-ORD-MIN-07" TO PAR-NAME.                             IF1294.2 53
   000424         043800     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000425         044000 F-ORD-MIN-08.                                                    IF1294.2
   000426         044100     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000427         044200 F-ORD-MIN-TEST-08.                                               IF1294.2
   000428         044300     COMPUTE WS-INT = FUNCTION ORD-MIN("A", I, "P").              IF1294.2 44 IFN 35
   000429         044400     IF WS-INT = 1 THEN                                           IF1294.2 44
   000430      1  044500                        PERFORM PASS                              IF1294.2 201
   000431         044600     ELSE                                                         IF1294.2
   000432      1  044700                        MOVE 1    TO CORRECT-N                    IF1294.2 79
   000433      1  044800                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000434      1  044900                        PERFORM FAIL.                             IF1294.2 202
   000435         045000     GO TO F-ORD-MIN-WRITE-08.                                    IF1294.2 439
   000436         045100 F-ORD-MIN-DELETE-08.                                             IF1294.2
   000437         045200     PERFORM  DE-LETE.                                            IF1294.2 203
   000438         045300     GO TO    F-ORD-MIN-WRITE-08.                                 IF1294.2 439
   000439         045400 F-ORD-MIN-WRITE-08.                                              IF1294.2
   000440         045500     MOVE "F-ORD-MIN-08" TO PAR-NAME.                             IF1294.2 53
   000441         045600     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000442         045800 F-ORD-MIN-09.                                                    IF1294.2
   000443         045900     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000444         046000 F-ORD-MIN-TEST-09.                                               IF1294.2
   000445         046100     COMPUTE WS-INT = FUNCTION ORD-MIN("S", "D", J).              IF1294.2 44 IFN 36
   000446         046200     IF WS-INT = 2 THEN                                           IF1294.2 44
   000447      1  046300                        PERFORM PASS                              IF1294.2 201
   000448         046400     ELSE                                                         IF1294.2
   000449      1  046500                        MOVE 2   TO CORRECT-N                     IF1294.2 79
   000450      1  046600                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000451      1  046700                        PERFORM FAIL.                             IF1294.2 202
   000452         046800     GO TO F-ORD-MIN-WRITE-09.                                    IF1294.2 456
   000453         046900 F-ORD-MIN-DELETE-09.                                             IF1294.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         047000     PERFORM  DE-LETE.                                            IF1294.2 203
   000455         047100     GO TO    F-ORD-MIN-WRITE-09.                                 IF1294.2 456
   000456         047200 F-ORD-MIN-WRITE-09.                                              IF1294.2
   000457         047300     MOVE "F-ORD-MIN-09" TO PAR-NAME.                             IF1294.2 53
   000458         047400     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000459         047600 F-ORD-MIN-10.                                                    IF1294.2
   000460         047700     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000461         047800 F-ORD-MIN-TEST-10.                                               IF1294.2
   000462         047900     COMPUTE WS-INT = FUNCTION ORD-MIN(A, 5, 5, A).               IF1294.2 44 IFN 31 31
   000463         048000     IF WS-INT = 1 THEN                                           IF1294.2 44
   000464      1  048100                        PERFORM PASS                              IF1294.2 201
   000465         048200     ELSE                                                         IF1294.2
   000466      1  048300                        MOVE 1    TO CORRECT-N                    IF1294.2 79
   000467      1  048400                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000468      1  048500                        PERFORM FAIL.                             IF1294.2 202
   000469         048600     GO TO F-ORD-MIN-WRITE-10.                                    IF1294.2 473
   000470         048700 F-ORD-MIN-DELETE-10.                                             IF1294.2
   000471         048800     PERFORM  DE-LETE.                                            IF1294.2 203
   000472         048900     GO TO    F-ORD-MIN-WRITE-10.                                 IF1294.2 473
   000473         049000 F-ORD-MIN-WRITE-10.                                              IF1294.2
   000474         049100     MOVE "F-ORD-MIN-10" TO PAR-NAME.                             IF1294.2 53
   000475         049200     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000476         049400 F-ORD-MIN-11.                                                    IF1294.2
   000477         049500     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000478         049600 F-ORD-MIN-TEST-11.                                               IF1294.2
   000479         049700     COMPUTE WS-INT = FUNCTION ORD-MIN(IND(1), IND(2), IND(3)).   IF1294.2 44 IFN 42 42 42
   000480         049800     IF WS-INT = 2 THEN                                           IF1294.2 44
   000481      1  049900                        PERFORM PASS                              IF1294.2 201
   000482         050000     ELSE                                                         IF1294.2
   000483      1  050100                        MOVE 2   TO CORRECT-N                     IF1294.2 79
   000484      1  050200                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000485      1  050300                        PERFORM FAIL.                             IF1294.2 202
   000486         050400     GO TO F-ORD-MIN-WRITE-11.                                    IF1294.2 490
   000487         050500 F-ORD-MIN-DELETE-11.                                             IF1294.2
   000488         050600     PERFORM  DE-LETE.                                            IF1294.2 203
   000489         050700     GO TO    F-ORD-MIN-WRITE-11.                                 IF1294.2 490
   000490         050800 F-ORD-MIN-WRITE-11.                                              IF1294.2
   000491         050900     MOVE "F-ORD-MIN-11" TO PAR-NAME.                             IF1294.2 53
   000492         051000     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000493         051200 F-ORD-MIN-12.                                                    IF1294.2
   000494         051300     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000495         051400 F-ORD-MIN-TEST-12.                                               IF1294.2
   000496         051500     COMPUTE WS-INT = FUNCTION ORD-MIN(IND(P), IND(Q), IND(R)).   IF1294.2 44 IFN 42 37 42 38 42 39
   000497         051600     IF WS-INT = 1 THEN                                           IF1294.2 44
   000498      1  051700                        PERFORM PASS                              IF1294.2 201
   000499         051800     ELSE                                                         IF1294.2
   000500      1  051900                        MOVE 1    TO CORRECT-N                    IF1294.2 79
   000501      1  052000                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000502      1  052100                        PERFORM FAIL.                             IF1294.2 202
   000503         052200     GO TO F-ORD-MIN-WRITE-12.                                    IF1294.2 507
   000504         052300 F-ORD-MIN-DELETE-12.                                             IF1294.2
   000505         052400     PERFORM  DE-LETE.                                            IF1294.2 203
   000506         052500     GO TO    F-ORD-MIN-WRITE-12.                                 IF1294.2 507
   000507         052600 F-ORD-MIN-WRITE-12.                                              IF1294.2
   000508         052700     MOVE "F-ORD-MIN-12" TO PAR-NAME.                             IF1294.2 53
   000509         052800     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000510         053000 F-ORD-MIN-13.                                                    IF1294.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         053100     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000512         053200 F-ORD-MIN-TEST-13.                                               IF1294.2
   000513         053300     COMPUTE WS-INT = FUNCTION ORD-MIN(                           IF1294.2 44 IFN
   000514         053400                           FUNCTION ORD-MIN(1, 4), 3, 7).         IF1294.2 IFN
   000515         053500     IF WS-INT = 1 THEN                                           IF1294.2 44
   000516      1  053600                        PERFORM PASS                              IF1294.2 201
   000517         053700     ELSE                                                         IF1294.2
   000518      1  053800                        MOVE 1    TO CORRECT-N                    IF1294.2 79
   000519      1  053900                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000520      1  054000                        PERFORM FAIL.                             IF1294.2 202
   000521         054100     GO TO F-ORD-MIN-WRITE-13.                                    IF1294.2 525
   000522         054200 F-ORD-MIN-DELETE-13.                                             IF1294.2
   000523         054300     PERFORM  DE-LETE.                                            IF1294.2 203
   000524         054400     GO TO    F-ORD-MIN-WRITE-13.                                 IF1294.2 525
   000525         054500 F-ORD-MIN-WRITE-13.                                              IF1294.2
   000526         054600     MOVE "F-ORD-MIN-13" TO PAR-NAME.                             IF1294.2 53
   000527         054700     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000528         054900 F-ORD-MIN-14.                                                    IF1294.2
   000529         055000     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000530         055100 F-ORD-MIN-TEST-14.                                               IF1294.2
   000531         055200     COMPUTE WS-INT = FUNCTION ORD-MIN(IND(ALL)).                 IF1294.2 44 IFN 42
   000532         055300     IF WS-INT = 2 THEN                                           IF1294.2 44
   000533      1  055400                        PERFORM PASS                              IF1294.2 201
   000534         055500     ELSE                                                         IF1294.2
   000535      1  055600                        MOVE 2    TO CORRECT-N                    IF1294.2 79
   000536      1  055700                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000537      1  055800                        PERFORM FAIL.                             IF1294.2 202
   000538         055900     GO TO F-ORD-MIN-WRITE-14.                                    IF1294.2 542
   000539         056000 F-ORD-MIN-DELETE-14.                                             IF1294.2
   000540         056100     PERFORM  DE-LETE.                                            IF1294.2 203
   000541         056200     GO TO    F-ORD-MIN-WRITE-14.                                 IF1294.2 542
   000542         056300 F-ORD-MIN-WRITE-14.                                              IF1294.2
   000543         056400     MOVE "F-ORD-MIN-14" TO PAR-NAME.                             IF1294.2 53
   000544         056500     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000545         056700 F-ORD-MIN-15.                                                    IF1294.2
   000546         056800     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000547         056900 F-ORD-MIN-TEST-15.                                               IF1294.2
   000548         057000     COMPUTE WS-INT = FUNCTION ORD-MIN(2, 3, C) + A.              IF1294.2 44 IFN 33 31
   000549         057100     IF WS-INT = 6 THEN                                           IF1294.2 44
   000550      1  057200                        PERFORM PASS                              IF1294.2 201
   000551         057300     ELSE                                                         IF1294.2
   000552      1  057400                        MOVE 6    TO CORRECT-N                    IF1294.2 79
   000553      1  057500                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000554      1  057600                        PERFORM FAIL.                             IF1294.2 202
   000555         057700     GO TO F-ORD-MIN-WRITE-15.                                    IF1294.2 559
   000556         057800 F-ORD-MIN-DELETE-15.                                             IF1294.2
   000557         057900     PERFORM  DE-LETE.                                            IF1294.2 203
   000558         058000     GO TO    F-ORD-MIN-WRITE-15.                                 IF1294.2 559
   000559         058100 F-ORD-MIN-WRITE-15.                                              IF1294.2
   000560         058200     MOVE "F-ORD-MIN-15" TO PAR-NAME.                             IF1294.2 53
   000561         058300     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000562         058500 F-ORD-MIN-16.                                                    IF1294.2
   000563         058600     MOVE ZERO TO WS-INT.                                         IF1294.2 IMP 44
   000564         058700 F-ORD-MIN-TEST-16.                                               IF1294.2
   000565         058800     COMPUTE WS-INT = FUNCTION ORD-MIN(9, 3, A) +                 IF1294.2 44 IFN 31
   000566         058900                      FUNCTION ORD-MIN(1, 1).                     IF1294.2 IFN
   000567         059000     IF WS-INT = 3 THEN                                           IF1294.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  059100                        PERFORM PASS                              IF1294.2 201
   000569         059200     ELSE                                                         IF1294.2
   000570      1  059300                        MOVE 3    TO CORRECT-N                    IF1294.2 79
   000571      1  059400                        MOVE WS-INT TO COMPUTED-N                 IF1294.2 44 65
   000572      1  059500                        PERFORM FAIL.                             IF1294.2 202
   000573         059600     GO TO F-ORD-MIN-WRITE-16.                                    IF1294.2 577
   000574         059700 F-ORD-MIN-DELETE-16.                                             IF1294.2
   000575         059800     PERFORM  DE-LETE.                                            IF1294.2 203
   000576         059900     GO TO    F-ORD-MIN-WRITE-16.                                 IF1294.2 577
   000577         060000 F-ORD-MIN-WRITE-16.                                              IF1294.2
   000578         060100     MOVE "F-ORD-MIN-16" TO PAR-NAME.                             IF1294.2 53
   000579         060200     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000580         060400 F-ORD-MIN-17.                                                    IF1294.2
   000581         060500     MOVE 10 TO ARG1                                              IF1294.2 40
   000582         060600     PERFORM F-ORD-MIN-TEST-17                                    IF1294.2 594
   000583         060700       UNTIL FUNCTION ORD-MIN(2, ARG1) > 1.                       IF1294.2 IFN 40
   000584         060800*                                                                 IF1294.2
   000585         061100*                                                                 IF1294.2
   000586         061200     IF ARG1 = 1 THEN                                             IF1294.2 40
   000587      1  061300                        PERFORM PASS                              IF1294.2 201
   000588         061400     ELSE                                                         IF1294.2
   000589      1  061500                        MOVE 1 TO CORRECT-N                       IF1294.2 79
   000590      1  061600                        MOVE ARG1   TO COMPUTED-N                 IF1294.2 40 65
   000591      1  061700                        PERFORM FAIL.                             IF1294.2 202
   000592         061800     GO TO F-ORD-MIN-WRITE-17.                                    IF1294.2 600
   000593         061900*                                                                 IF1294.2
   000594         062000 F-ORD-MIN-TEST-17.                                               IF1294.2
   000595         062100     COMPUTE ARG1 = ARG1 - 1.                                     IF1294.2 40 40
   000596         062200*                                                                 IF1294.2
   000597         062300 F-ORD-MIN-DELETE-17.                                             IF1294.2
   000598         062400     PERFORM  DE-LETE.                                            IF1294.2 203
   000599         062500     GO TO    F-ORD-MIN-WRITE-17.                                 IF1294.2 600
   000600         062600 F-ORD-MIN-WRITE-17.                                              IF1294.2
   000601         062700     MOVE "F-ORD-MIN-17" TO PAR-NAME.                             IF1294.2 53
   000602         062800     PERFORM  PRINT-DETAIL.                                       IF1294.2 205
   000603         063000 CCVS-EXIT SECTION.                                               IF1294.2
   000604         063100 CCVS-999999.                                                     IF1294.2
   000605         063200     GO TO CLOSE-FILES.                                           IF1294.2 196
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       31   A. . . . . . . . . . . . . . .  360 377 394 411 462 462 548 565
      109   ANSI-REFERENCE . . . . . . . .  283 290 300 M311
       40   ARG1 . . . . . . . . . . . . .  M581 583 586 590 M595 595
       41   ARR
       32   B. . . . . . . . . . . . . . .  360 377 394
       33   C. . . . . . . . . . . . . . .  360 548
       88   CCVS-C-1 . . . . . . . . . . .  223 268
       93   CCVS-C-2 . . . . . . . . . . .  224 269
      143   CCVS-E-1 . . . . . . . . . . .  229
      148   CCVS-E-2 . . . . . . . . . . .  237 244 251 256
      151   CCVS-E-2-2 . . . . . . . . . .  M236
      156   CCVS-E-3 . . . . . . . . . . .  257
      165   CCVS-E-4 . . . . . . . . . . .  236
      166   CCVS-E-4-1 . . . . . . . . . .  M234
      168   CCVS-E-4-2 . . . . . . . . . .  M235
      110   CCVS-H-1 . . . . . . . . . . .  218 264
      115   CCVS-H-2A. . . . . . . . . . .  219 265
      124   CCVS-H-2B. . . . . . . . . . .  220 266
      136   CCVS-H-3 . . . . . . . . . . .  221 267
      186   CCVS-PGM-ID. . . . . . . . . .  192 192
       70   CM-18V0
       64   COMPUTED-A . . . . . . . . . .  65 67 68 69 70 295 299
       65   COMPUTED-N . . . . . . . . . .  M321 M365 M382 M399 M416 M433 M450 M467 M484 M501 M519 M536 M553 M571 M590
       63   COMPUTED-X . . . . . . . . . .  M213 280
       67   COMPUTED-0V18
       69   COMPUTED-14V4
       71   COMPUTED-18V0
       68   COMPUTED-4V14
       87   COR-ANSI-REFERENCE . . . . . .  M290 M292
       78   CORRECT-A. . . . . . . . . . .  79 80 81 82 83 296 298
       79   CORRECT-N. . . . . . . . . . .  M320 M364 M381 M398 M415 M432 M449 M466 M483 M500 M518 M535 M552 M570 M589
       77   CORRECT-X. . . . . . . . . . .  M214 282
       80   CORRECT-0V18
       82   CORRECT-14V4
       84   CORRECT-18V0
       81   CORRECT-4V14
       83   CR-18V0
       34   D. . . . . . . . . . . . . . .  377
      101   DELETE-COUNTER . . . . . . . .  M203 232 247 249
       56   DOTVALUE . . . . . . . . . . .  M208
      107   DUMMY-HOLD . . . . . . . . . .  M261 271
       28   DUMMY-RECORD . . . . . . . . .  M218 M219 M220 M221 M223 M224 M225 M227 M229 M237 M244 M251 M256 M257 261 M262
                                            263 M264 M265 M266 M267 M268 M269 M270 M271 275 M276 M285 M301
      154   ENDER-DESC . . . . . . . . . .  M239 M250 M255
      102   ERROR-COUNTER. . . . . . . . .  M202 231 240 243
      106   ERROR-HOLD . . . . . . . . . .  M231 M232 M232 M233 235
      152   ERROR-TOTAL. . . . . . . . . .  M241 M243 M248 M249 M253 M254
       49   FEATURE. . . . . . . . . . . .  M312
      180   HYPHEN-LINE. . . . . . . . . .  225 227 270
       35   I. . . . . . . . . . . . . . .  428
      146   ID-AGAIN . . . . . . . . . . .  M192
       42   IND. . . . . . . . . . . . . .  479 479 479 496 496 496 531
      179   INF-ANSI-REFERENCE . . . . . .  M283 M286 M300 M302
      174   INFO-TEXT. . . . . . . . . . .  M284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    15
0 Defined   Cross-reference of data names   References

0     103   INSPECT-COUNTER. . . . . . . .  M200 231 252 254
       36   J. . . . . . . . . . . . . . .  445
       37   P. . . . . . . . . . . . . . .  496
       51   P-OR-F . . . . . . . . . . . .  M200 M201 M202 M203 210 M213
       53   PAR-NAME . . . . . . . . . . .  M215 M328 M341 M355 M372 M389 M406 M423 M440 M457 M474 M491 M508 M526 M543 M560
                                            M578 M601
       55   PARDOT-X . . . . . . . . . . .  M207
      104   PASS-COUNTER . . . . . . . . .  M201 233 234
       18   PRG-COLL-SEQ . . . . . . . . .  16
       26   PRINT-FILE . . . . . . . . . .  22 191 197
       27   PRINT-REC. . . . . . . . . . .  M209 M289 M291
       38   Q. . . . . . . . . . . . . . .  496
       39   R. . . . . . . . . . . . . . .  496
       58   RE-MARK. . . . . . . . . . . .  M204 M216
      100   REC-CT . . . . . . . . . . . .  206 208 215
       99   REC-SKL-SUB
      108   RECORD-COUNT . . . . . . . . .  M259 260 M272
       43   TEMP
       59   TEST-COMPUTED. . . . . . . . .  289
       74   TEST-CORRECT . . . . . . . . .  291
      127   TEST-ID. . . . . . . . . . . .  M192
       47   TEST-RESULTS . . . . . . . . .  M193 209
      105   TOTAL-ERROR
       44   WS-INT . . . . . . . . . . . .  M314 M316 317 321 M344 M358 M360 361 365 M375 M377 378 382 M392 M394 395 399
                                            M409 M411 412 416 M426 M428 429 433 M443 M445 446 450 M460 M462 463 467 M477
                                            M479 480 484 M494 M496 497 501 M511 M513 515 519 M529 M531 532 536 M546 M548
                                            549 553 M563 M565 567 571
      176   XXCOMPUTED . . . . . . . . . .  M299
      178   XXCORRECT. . . . . . . . . . .  M298
      171   XXINFO . . . . . . . . . . . .  285 301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    16
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

      294   BAIL-OUT . . . . . . . . . . .  P212
      303   BAIL-OUT-EX. . . . . . . . . .  E212 G296
      297   BAIL-OUT-WRITE . . . . . . . .  G295
      277   BLANK-LINE-PRINT
      603   CCVS-EXIT
      604   CCVS-999999
      189   CCVS1
      304   CCVS1-EXIT . . . . . . . . . .  G195
      196   CLOSE-FILES. . . . . . . . . .  G605
      222   COLUMN-NAMES-ROUTINE . . . . .  E194
      203   DE-LETE. . . . . . . . . . . .  P325 P338 P352 P369 P386 P403 P420 P437 P454 P471 P488 P505 P523 P540 P557 P575
                                            P598
      226   END-ROUTINE. . . . . . . . . .  P197
      230   END-ROUTINE-1
      238   END-ROUTINE-12
      246   END-ROUTINE-13 . . . . . . . .  E197
      228   END-RTN-EXIT
      324   F-ORD-MIN-DELETE-01
      337   F-ORD-MIN-DELETE-02
      351   F-ORD-MIN-DELETE-03
      368   F-ORD-MIN-DELETE-04
      385   F-ORD-MIN-DELETE-05
      402   F-ORD-MIN-DELETE-06
      419   F-ORD-MIN-DELETE-07
      436   F-ORD-MIN-DELETE-08
      453   F-ORD-MIN-DELETE-09
      470   F-ORD-MIN-DELETE-10
      487   F-ORD-MIN-DELETE-11
      504   F-ORD-MIN-DELETE-12
      522   F-ORD-MIN-DELETE-13
      539   F-ORD-MIN-DELETE-14
      556   F-ORD-MIN-DELETE-15
      574   F-ORD-MIN-DELETE-16
      597   F-ORD-MIN-DELETE-17
      310   F-ORD-MIN-INFO
      315   F-ORD-MIN-TEST-01
      330   F-ORD-MIN-TEST-02
      345   F-ORD-MIN-TEST-03
      359   F-ORD-MIN-TEST-04
      376   F-ORD-MIN-TEST-05
      393   F-ORD-MIN-TEST-06
      410   F-ORD-MIN-TEST-07
      427   F-ORD-MIN-TEST-08
      444   F-ORD-MIN-TEST-09
      461   F-ORD-MIN-TEST-10
      478   F-ORD-MIN-TEST-11
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    17
0 Defined   Cross-reference of procedures   References

0     495   F-ORD-MIN-TEST-12
      512   F-ORD-MIN-TEST-13
      530   F-ORD-MIN-TEST-14
      547   F-ORD-MIN-TEST-15
      564   F-ORD-MIN-TEST-16
      594   F-ORD-MIN-TEST-17. . . . . . .  P582
      327   F-ORD-MIN-WRITE-01 . . . . . .  G323 G326
      340   F-ORD-MIN-WRITE-02 . . . . . .  G334 G336 G339
      354   F-ORD-MIN-WRITE-03 . . . . . .  G350 G353
      371   F-ORD-MIN-WRITE-04 . . . . . .  G367 G370
      388   F-ORD-MIN-WRITE-05 . . . . . .  G384 G387
      405   F-ORD-MIN-WRITE-06 . . . . . .  G401 G404
      422   F-ORD-MIN-WRITE-07 . . . . . .  G418 G421
      439   F-ORD-MIN-WRITE-08 . . . . . .  G435 G438
      456   F-ORD-MIN-WRITE-09 . . . . . .  G452 G455
      473   F-ORD-MIN-WRITE-10 . . . . . .  G469 G472
      490   F-ORD-MIN-WRITE-11 . . . . . .  G486 G489
      507   F-ORD-MIN-WRITE-12 . . . . . .  G503 G506
      525   F-ORD-MIN-WRITE-13 . . . . . .  G521 G524
      542   F-ORD-MIN-WRITE-14 . . . . . .  G538 G541
      559   F-ORD-MIN-WRITE-15 . . . . . .  G555 G558
      577   F-ORD-MIN-WRITE-16 . . . . . .  G573 G576
      600   F-ORD-MIN-WRITE-17 . . . . . .  G592 G599
      313   F-ORD-MIN-01
      343   F-ORD-MIN-03
      357   F-ORD-MIN-04
      374   F-ORD-MIN-05
      391   F-ORD-MIN-06
      408   F-ORD-MIN-07
      425   F-ORD-MIN-08
      442   F-ORD-MIN-09
      459   F-ORD-MIN-10
      476   F-ORD-MIN-11
      493   F-ORD-MIN-12
      510   F-ORD-MIN-13
      528   F-ORD-MIN-14
      545   F-ORD-MIN-15
      562   F-ORD-MIN-16
      580   F-ORD-MIN-17
      202   FAIL . . . . . . . . . . . . .  P322 P335 P349 P366 P383 P400 P417 P434 P451 P468 P485 P502 P520 P537 P554 P572
                                            P591
      279   FAIL-ROUTINE . . . . . . . . .  P211
      293   FAIL-ROUTINE-EX. . . . . . . .  E211 G287
      288   FAIL-ROUTINE-WRITE . . . . . .  G281 G282
      217   HEAD-ROUTINE . . . . . . . . .  P194
      200   INSPT
      190   OPEN-FILES
      201   PASS . . . . . . . . . . . . .  P318 P333 P347 P362 P379 P396 P413 P430 P447 P464 P481 P498 P516 P533 P550 P568
                                            P587
      205   PRINT-DETAIL . . . . . . . . .  P329 P342 P356 P373 P390 P407 P424 P441 P458 P475 P492 P509 P527 P544 P561 P579
                                            P602
      309   SECT-IF129A
      198   TERMINATE-CCVS
      258   WRITE-LINE . . . . . . . . . .  P209 P210 P218 P219 P220 P221 P223 P224 P225 P227 P229 P237 P245 P251 P256 P257
                                            P285 P289 P291 P301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    18
0 Defined   Cross-reference of procedures   References

0     274   WRT-LN . . . . . . . . . . . .  P264 P265 P266 P267 P268 P269 P270 P273 P278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    19
0 Defined   Cross-reference of programs     References

        3   IF129A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF129A    Date 06/04/2022  Time 11:59:33   Page    20
0LineID  Message code  Message text

     26  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF129A:
 *    Source records = 605
 *    Data Division statements = 77
 *    Procedure Division statements = 336
 *    Generated COBOL statements = 0
 *    Program complexity factor = 346
0End of compilation 1,  program IF129A,  highest severity 0.
0Return code 0
