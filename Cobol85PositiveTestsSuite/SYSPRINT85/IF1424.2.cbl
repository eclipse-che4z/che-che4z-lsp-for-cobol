1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:37   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:37   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1424.2
   000002         000200 PROGRAM-ID.                                                      IF1424.2
   000003         000300     IF142A.                                                      IF1424.2
   000004         000400                                                                  IF1424.2
   000005         000600*                                                         *       IF1424.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1424.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1424.2
   000008         000900* WHEN-COMPILED.                                          *       IF1424.2
   000009         001000*                                                         *       IF1424.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1424.2
   000011         001300 CONFIGURATION SECTION.                                           IF1424.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1424.2
   000013         001500     XXXXX082.                                                    IF1424.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1424.2
   000015         001700     XXXXX083.                                                    IF1424.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1424.2
   000017         001900 FILE-CONTROL.                                                    IF1424.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1424.2 22
   000019         002100     XXXXX055.                                                    IF1424.2
   000020         002200 DATA DIVISION.                                                   IF1424.2
   000021         002300 FILE SECTION.                                                    IF1424.2
   000022         002400 FD  PRINT-FILE.                                                  IF1424.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1424.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1424.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1424.2
   000026         002900* Variables specific to the Intrinsic Function Test IF142A*       IF1424.2
   000027         003100 01  TEMP1                       PIC X(21).                       IF1424.2
   000028         003200 01  WS-DATE.                                                     IF1424.2
   000029         003300     02  WS-YEAR                 PIC 9999.                        IF1424.2
   000030         003400              88 CON-YEAR        VALUE 1990 THRU 9999.            IF1424.2
   000031         003500     02  WS-MONTH                PIC 99.                          IF1424.2
   000032         003600              88 CON-MONTH       VALUE 01 THRU 12.                IF1424.2
   000033         003700     02  WS-DAY                  PIC 99.                          IF1424.2
   000034         003800              88 CON-DAY         VALUE 01 THRU 31.                IF1424.2
   000035         003900     02  WS-HOUR                 PIC 99.                          IF1424.2
   000036         004000              88 CON-HOUR        VALUE 00 THRU 23.                IF1424.2
   000037         004100     02  WS-MIN                  PIC 99.                          IF1424.2
   000038         004200              88 CON-MIN         VALUE 00 THRU 59.                IF1424.2
   000039         004300     02  WS-SECOND               PIC 99.                          IF1424.2
   000040         004400              88 CON-SEC         VALUE 00 THRU 59.                IF1424.2
   000041         004500     02  WS-HUNDSEC              PIC 99.                          IF1424.2
   000042         004600              88 CON-HUNDSEC     VALUE 00 THRU 99.                IF1424.2
   000043         004700     02  WS-GREENW               PIC X.                           IF1424.2
   000044         004800              88 CON-GREENW      VALUE "-", "+", "0".             IF1424.2
   000045         004900     02  WS-OFFSET               PIC 99.                          IF1424.2
   000046         005000              88 CON-OFFSET      VALUE 00 THRU 13.                IF1424.2
   000047         005100*                                                                 IF1424.2
   000048         005300*                                                                 IF1424.2
   000049         005400 01  TEST-RESULTS.                                                IF1424.2
   000050         005500     02 FILLER                   PIC X      VALUE SPACE.          IF1424.2 IMP
   000051         005600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1424.2 IMP
   000052         005700     02 FILLER                   PIC X      VALUE SPACE.          IF1424.2 IMP
   000053         005800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1424.2 IMP
   000054         005900     02 FILLER                   PIC X      VALUE SPACE.          IF1424.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02  PAR-NAME.                                                IF1424.2
   000056         006100       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1424.2 IMP
   000057         006200       03  PARDOT-X              PIC X      VALUE SPACE.          IF1424.2 IMP
   000058         006300       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1424.2 IMP
   000059         006400     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1424.2 IMP
   000060         006500     02 RE-MARK                  PIC X(61).                       IF1424.2
   000061         006600 01  TEST-COMPUTED.                                               IF1424.2
   000062         006700     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1424.2 IMP
   000063         006800     02 FILLER                   PIC X(17)  VALUE                 IF1424.2
   000064         006900            "       COMPUTED=".                                   IF1424.2
   000065         007000     02 COMPUTED-X.                                               IF1424.2
   000066         007100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1424.2 IMP
   000067         007200     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1424.2 66
   000068         007300                                 PIC -9(9).9(9).                  IF1424.2
   000069         007400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1424.2 66
   000070         007500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1424.2 66
   000071         007600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1424.2 66
   000072         007700     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1424.2 66
   000073         007800         04 COMPUTED-18V0                    PIC -9(18).          IF1424.2
   000074         007900         04 FILLER                           PIC X.               IF1424.2
   000075         008000     03 FILLER PIC X(50) VALUE SPACE.                             IF1424.2 IMP
   000076         008100 01  TEST-CORRECT.                                                IF1424.2
   000077         008200     02 FILLER PIC X(30) VALUE SPACE.                             IF1424.2 IMP
   000078         008300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1424.2
   000079         008400     02 CORRECT-X.                                                IF1424.2
   000080         008500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1424.2 IMP
   000081         008600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1424.2 80
   000082         008700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1424.2 80
   000083         008800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1424.2 80
   000084         008900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1424.2 80
   000085         009000     03      CR-18V0 REDEFINES CORRECT-A.                         IF1424.2 80
   000086         009100         04 CORRECT-18V0                     PIC -9(18).          IF1424.2
   000087         009200         04 FILLER                           PIC X.               IF1424.2
   000088         009300     03 FILLER PIC X(2) VALUE SPACE.                              IF1424.2 IMP
   000089         009400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1424.2 IMP
   000090         009500 01  CCVS-C-1.                                                    IF1424.2
   000091         009600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1424.2
   000092         009700-    "SS  PARAGRAPH-NAME                                          IF1424.2
   000093         009800-    "       REMARKS".                                            IF1424.2
   000094         009900     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1424.2 IMP
   000095         010000 01  CCVS-C-2.                                                    IF1424.2
   000096         010100     02 FILLER                     PIC X        VALUE SPACE.      IF1424.2 IMP
   000097         010200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1424.2
   000098         010300     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1424.2 IMP
   000099         010400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1424.2
   000100         010500     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1424.2 IMP
   000101         010600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1424.2 IMP
   000102         010700 01  REC-CT                        PIC 99       VALUE ZERO.       IF1424.2 IMP
   000103         010800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1424.2 IMP
   000104         010900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1424.2 IMP
   000105         011000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1424.2 IMP
   000106         011100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1424.2 IMP
   000107         011200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1424.2 IMP
   000108         011300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1424.2 IMP
   000109         011400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1424.2 IMP
   000110         011500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1424.2 IMP
   000111         011600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1424.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700 01  CCVS-H-1.                                                    IF1424.2
   000113         011800     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1424.2 IMP
   000114         011900     02  FILLER                    PIC X(42)    VALUE             IF1424.2
   000115         012000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1424.2
   000116         012100     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1424.2 IMP
   000117         012200 01  CCVS-H-2A.                                                   IF1424.2
   000118         012300   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1424.2 IMP
   000119         012400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1424.2
   000120         012500   02  FILLER                        PIC XXXX   VALUE             IF1424.2
   000121         012600     "4.2 ".                                                      IF1424.2
   000122         012700   02  FILLER                        PIC X(28)  VALUE             IF1424.2
   000123         012800            " COPY - NOT FOR DISTRIBUTION".                       IF1424.2
   000124         012900   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1424.2 IMP
   000125         013000                                                                  IF1424.2
   000126         013100 01  CCVS-H-2B.                                                   IF1424.2
   000127         013200   02  FILLER                        PIC X(15)  VALUE             IF1424.2
   000128         013300            "TEST RESULT OF ".                                    IF1424.2
   000129         013400   02  TEST-ID                       PIC X(9).                    IF1424.2
   000130         013500   02  FILLER                        PIC X(4)   VALUE             IF1424.2
   000131         013600            " IN ".                                               IF1424.2
   000132         013700   02  FILLER                        PIC X(12)  VALUE             IF1424.2
   000133         013800     " HIGH       ".                                              IF1424.2
   000134         013900   02  FILLER                        PIC X(22)  VALUE             IF1424.2
   000135         014000            " LEVEL VALIDATION FOR ".                             IF1424.2
   000136         014100   02  FILLER                        PIC X(58)  VALUE             IF1424.2
   000137         014200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1424.2
   000138         014300 01  CCVS-H-3.                                                    IF1424.2
   000139         014400     02  FILLER                      PIC X(34)  VALUE             IF1424.2
   000140         014500            " FOR OFFICIAL USE ONLY    ".                         IF1424.2
   000141         014600     02  FILLER                      PIC X(58)  VALUE             IF1424.2
   000142         014700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1424.2
   000143         014800     02  FILLER                      PIC X(28)  VALUE             IF1424.2
   000144         014900            "  COPYRIGHT   1985 ".                                IF1424.2
   000145         015000 01  CCVS-E-1.                                                    IF1424.2
   000146         015100     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1424.2 IMP
   000147         015200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1424.2
   000148         015300     02 ID-AGAIN                     PIC X(9).                    IF1424.2
   000149         015400     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1424.2 IMP
   000150         015500 01  CCVS-E-2.                                                    IF1424.2
   000151         015600     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1424.2 IMP
   000152         015700     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1424.2 IMP
   000153         015800     02 CCVS-E-2-2.                                               IF1424.2
   000154         015900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1424.2 IMP
   000155         016000         03 FILLER                   PIC X      VALUE SPACE.      IF1424.2 IMP
   000156         016100         03 ENDER-DESC               PIC X(44)  VALUE             IF1424.2
   000157         016200            "ERRORS ENCOUNTERED".                                 IF1424.2
   000158         016300 01  CCVS-E-3.                                                    IF1424.2
   000159         016400     02  FILLER                      PIC X(22)  VALUE             IF1424.2
   000160         016500            " FOR OFFICIAL USE ONLY".                             IF1424.2
   000161         016600     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1424.2 IMP
   000162         016700     02  FILLER                      PIC X(58)  VALUE             IF1424.2
   000163         016800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1424.2
   000164         016900     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1424.2 IMP
   000165         017000     02 FILLER                       PIC X(15)  VALUE             IF1424.2
   000166         017100             " COPYRIGHT 1985".                                   IF1424.2
   000167         017200 01  CCVS-E-4.                                                    IF1424.2
   000168         017300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1424.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1424.2
   000170         017500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1424.2 IMP
   000171         017600     02 FILLER                       PIC X(40)  VALUE             IF1424.2
   000172         017700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1424.2
   000173         017800 01  XXINFO.                                                      IF1424.2
   000174         017900     02 FILLER                       PIC X(19)  VALUE             IF1424.2
   000175         018000            "*** INFORMATION ***".                                IF1424.2
   000176         018100     02 INFO-TEXT.                                                IF1424.2
   000177         018200       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1424.2 IMP
   000178         018300       04 XXCOMPUTED                 PIC X(20).                   IF1424.2
   000179         018400       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1424.2 IMP
   000180         018500       04 XXCORRECT                  PIC X(20).                   IF1424.2
   000181         018600     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1424.2
   000182         018700 01  HYPHEN-LINE.                                                 IF1424.2
   000183         018800     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1424.2 IMP
   000184         018900     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1424.2
   000185         019000-    "*****************************************".                 IF1424.2
   000186         019100     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1424.2
   000187         019200-    "******************************".                            IF1424.2
   000188         019300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1424.2
   000189         019400     "IF142A".                                                    IF1424.2
   000190         019500 PROCEDURE DIVISION.                                              IF1424.2
   000191         019600 CCVS1 SECTION.                                                   IF1424.2
   000192         019700 OPEN-FILES.                                                      IF1424.2
   000193         019800     OPEN     OUTPUT PRINT-FILE.                                  IF1424.2 22
   000194         019900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1424.2 188 129 188 148
   000195         020000     MOVE    SPACE TO TEST-RESULTS.                               IF1424.2 IMP 49
   000196         020100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1424.2 219 224
   000197         020200     GO TO CCVS1-EXIT.                                            IF1424.2 307
   000198         020300 CLOSE-FILES.                                                     IF1424.2
   000199         020400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1424.2 228 249 22
   000200         020500 TERMINATE-CCVS.                                                  IF1424.2
   000201         020600     STOP     RUN.                                                IF1424.2
   000202         020700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1424.2 53 105
   000203         020800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1424.2 53 106
   000204         020900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1424.2 53 104
   000205         021000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1424.2 53 103
   000206         021100     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1424.2 60
   000207         021200 PRINT-DETAIL.                                                    IF1424.2
   000208         021300     IF REC-CT NOT EQUAL TO ZERO                                  IF1424.2 102 IMP
   000209      1  021400             MOVE "." TO PARDOT-X                                 IF1424.2 57
   000210      1  021500             MOVE REC-CT TO DOTVALUE.                             IF1424.2 102 58
   000211         021600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1424.2 49 23 261
   000212         021700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1424.2 53 261
   000213      1  021800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1424.2 282 296
   000214      1  021900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1424.2 297 306
   000215         022000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1424.2 IMP 53 IMP 65
   000216         022100     MOVE SPACE TO CORRECT-X.                                     IF1424.2 IMP 79
   000217         022200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1424.2 102 IMP IMP 55
   000218         022300     MOVE     SPACE TO RE-MARK.                                   IF1424.2 IMP 60
   000219         022400 HEAD-ROUTINE.                                                    IF1424.2
   000220         022500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1424.2 112 24 261
   000221         022600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1424.2 117 24 261
   000222         022700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1424.2 126 24 261
   000223         022800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1424.2 138 24 261
   000224         022900 COLUMN-NAMES-ROUTINE.                                            IF1424.2
   000225         023000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1424.2 90 24 261
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1424.2 95 24 261
   000227         023200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1424.2 182 24 261
   000228         023300 END-ROUTINE.                                                     IF1424.2
   000229         023400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5       IF1424.2 182 24 261
   000230         023500     TIMES.                                                       IF1424.2
   000231         023600 END-RTN-EXIT.                                                    IF1424.2
   000232         023700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1424.2 145 24 261
   000233         023800 END-ROUTINE-1.                                                   IF1424.2
   000234         023900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1424.2 104 108 105
   000235         024000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1424.2 108 103 108
   000236         024100      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1424.2 106 108
   000237         024200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1424.2 106 168
   000238         024300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1424.2 108 170
   000239         024400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1424.2 167 153
   000240         024500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1424.2 150 24 261
   000241         024600  END-ROUTINE-12.                                                 IF1424.2
   000242         024700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1424.2 156
   000243         024800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1424.2 104 IMP
   000244      1  024900         MOVE "NO " TO ERROR-TOTAL                                IF1424.2 154
   000245         025000         ELSE                                                     IF1424.2
   000246      1  025100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1424.2 104 154
   000247         025200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1424.2 150 24
   000248         025300     PERFORM WRITE-LINE.                                          IF1424.2 261
   000249         025400 END-ROUTINE-13.                                                  IF1424.2
   000250         025500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1424.2 103 IMP
   000251      1  025600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1424.2 154
   000252      1  025700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1424.2 103 154
   000253         025800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1424.2 156
   000254         025900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1424.2 150 24 261
   000255         026000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1424.2 105 IMP
   000256      1  026100          MOVE "NO " TO ERROR-TOTAL                               IF1424.2 154
   000257      1  026200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1424.2 105 154
   000258         026300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1424.2 156
   000259         026400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1424.2 150 24 261
   000260         026500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1424.2 158 24 261
   000261         026600 WRITE-LINE.                                                      IF1424.2
   000262         026700     ADD 1 TO RECORD-COUNT.                                       IF1424.2 110
   000263         026800     IF RECORD-COUNT GREATER 42                                   IF1424.2 110
   000264      1  026900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1424.2 24 109
   000265      1  027000         MOVE SPACE TO DUMMY-RECORD                               IF1424.2 IMP 24
   000266      1  027100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1424.2 24
   000267      1  027200         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1424.2 112 24 277
   000268      1  027300         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1424.2 117 24 277
   000269      1  027400         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1424.2 126 24 277
   000270      1  027500         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1424.2 138 24 277
   000271      1  027600         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1424.2 90 24 277
   000272      1  027700         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1424.2 95 24 277
   000273      1  027800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1424.2 182 24 277
   000274      1  027900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1424.2 109 24
   000275      1  028000         MOVE ZERO TO RECORD-COUNT.                               IF1424.2 IMP 110
   000276         028100     PERFORM WRT-LN.                                              IF1424.2 277
   000277         028200 WRT-LN.                                                          IF1424.2
   000278         028300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1424.2 24
   000279         028400     MOVE SPACE TO DUMMY-RECORD.                                  IF1424.2 IMP 24
   000280         028500 BLANK-LINE-PRINT.                                                IF1424.2
   000281         028600     PERFORM WRT-LN.                                              IF1424.2 277
   000282         028700 FAIL-ROUTINE.                                                    IF1424.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1424.2 65 IMP
   000284      1  028900            GO TO FAIL-ROUTINE-WRITE.                             IF1424.2 291
   000285         029000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1424.2 79 IMP 291
   000286         029100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1424.2 111 181
   000287         029200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1424.2 176
   000288         029300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1424.2 173 24 261
   000289         029400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1424.2 IMP 181
   000290         029500     GO TO  FAIL-ROUTINE-EX.                                      IF1424.2 296
   000291         029600 FAIL-ROUTINE-WRITE.                                              IF1424.2
   000292         029700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1424.2 61 23 261
   000293         029800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1424.2 111 89
   000294         029900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1424.2 76 23 261
   000295         030000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1424.2 IMP 89
   000296         030100 FAIL-ROUTINE-EX. EXIT.                                           IF1424.2
   000297         030200 BAIL-OUT.                                                        IF1424.2
   000298         030300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1424.2 66 IMP 300
   000299         030400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1424.2 80 IMP 306
   000300         030500 BAIL-OUT-WRITE.                                                  IF1424.2
   000301         030600     MOVE CORRECT-A TO XXCORRECT.                                 IF1424.2 80 180
   000302         030700     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1424.2 66 178
   000303         030800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1424.2 111 181
   000304         030900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1424.2 173 24 261
   000305         031000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1424.2 IMP 181
   000306         031100 BAIL-OUT-EX. EXIT.                                               IF1424.2
   000307         031200 CCVS1-EXIT.                                                      IF1424.2
   000308         031300     EXIT.                                                        IF1424.2
   000309         031500*                                                      *          IF1424.2
   000310         031600*    Intrinsic Function Tests   IF142A - WHEN-COMPILED *          IF1424.2
   000311         031700*                                                      *          IF1424.2
   000312         031900 SECT-IF142A SECTION.                                             IF1424.2
   000313         032000 F-WHENCOMP-INFO.                                                 IF1424.2
   000314         032100     MOVE     "See ref. A-75 2.46" TO ANSI-REFERENCE.             IF1424.2 111
   000315         032200     MOVE     "WHEN-COMPILED"     TO FEATURE.                     IF1424.2 51
   000316         032400 F-WHENCOMP-01.                                                   IF1424.2
   000317         032500     MOVE SPACES TO TEMP1.                                        IF1424.2 IMP 27
   000318         032600     MOVE SPACES TO WS-DATE.                                      IF1424.2 IMP 28
   000319         032700 F-WHENCOMP-TEST-01.                                              IF1424.2
   000320         032800     MOVE FUNCTION WHEN-COMPILED TO TEMP1.                        IF1424.2 IFN 27
   000321         032900     MOVE TEMP1 TO WS-DATE.                                       IF1424.2 27 28
   000322         033000     IF CON-YEAR     AND                                          IF1424.2 30
   000323         033100        CON-MONTH    AND                                          IF1424.2 32
   000324         033200        CON-DAY      AND                                          IF1424.2 34
   000325         033300        CON-HOUR     AND                                          IF1424.2 36
   000326         033400        CON-MIN      AND                                          IF1424.2 38
   000327         033500        CON-SEC      AND                                          IF1424.2 40
   000328         033600        CON-HUNDSEC  AND                                          IF1424.2 42
   000329         033700        CON-GREENW   AND                                          IF1424.2 44
   000330         033800        CON-OFFSET   THEN                                         IF1424.2 46
   000331      1  033900                  PERFORM PASS                                    IF1424.2 203
   000332         034000     ELSE                                                         IF1424.2
   000333      1  034100                  MOVE TEMP1 TO COMPUTED-A                        IF1424.2 27 66
   000334      1  034200                  MOVE "Date & Time value " TO CORRECT-X          IF1424.2 79
   000335      1  034300                  PERFORM FAIL.                                   IF1424.2 204
   000336         034400     GO TO F-WHENCOMP-WRITE-01.                                   IF1424.2 340
   000337         034500 F-WHENCOMP-DELETE-01.                                            IF1424.2
   000338         034600     PERFORM  DE-LETE.                                            IF1424.2 205
   000339         034700     GO TO    F-WHENCOMP-WRITE-01.                                IF1424.2 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800 F-WHENCOMP-WRITE-01.                                             IF1424.2
   000341         034900     MOVE "F-WHENCOMP-01" TO PAR-NAME.                            IF1424.2 55
   000342         035000     PERFORM  PRINT-DETAIL.                                       IF1424.2 207
   000343         035200 F-WHENCOMP-TEST-02.                                              IF1424.2
   000344         035300     IF FUNCTION WHEN-COMPILED >= TEMP1 THEN                      IF1424.2 IFN 27
   000345      1  035400                    PERFORM PASS                                  IF1424.2 203
   000346         035500     ELSE                                                         IF1424.2
   000347      1  035600                    PERFORM FAIL.                                 IF1424.2 204
   000348         035700     GO TO F-WHENCOMP-WRITE-02.                                   IF1424.2 352
   000349         035800 F-WHENCOMP-DELETE-02.                                            IF1424.2
   000350         035900     PERFORM  DE-LETE.                                            IF1424.2 205
   000351         036000     GO TO    F-WHENCOMP-WRITE-02.                                IF1424.2 352
   000352         036100 F-WHENCOMP-WRITE-02.                                             IF1424.2
   000353         036200     MOVE "F-WHENCOMP-02" TO PAR-NAME.                            IF1424.2 55
   000354         036300     PERFORM  PRINT-DETAIL.                                       IF1424.2 207
   000355         036500 CCVS-EXIT SECTION.                                               IF1424.2
   000356         036600 CCVS-999999.                                                     IF1424.2
   000357         036700     GO TO CLOSE-FILES.                                           IF1424.2 198
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page    10
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      111   ANSI-REFERENCE . . . . . . . .  286 293 303 M314
       90   CCVS-C-1 . . . . . . . . . . .  225 271
       95   CCVS-C-2 . . . . . . . . . . .  226 272
      145   CCVS-E-1 . . . . . . . . . . .  232
      150   CCVS-E-2 . . . . . . . . . . .  240 247 254 259
      153   CCVS-E-2-2 . . . . . . . . . .  M239
      158   CCVS-E-3 . . . . . . . . . . .  260
      167   CCVS-E-4 . . . . . . . . . . .  239
      168   CCVS-E-4-1 . . . . . . . . . .  M237
      170   CCVS-E-4-2 . . . . . . . . . .  M238
      112   CCVS-H-1 . . . . . . . . . . .  220 267
      117   CCVS-H-2A. . . . . . . . . . .  221 268
      126   CCVS-H-2B. . . . . . . . . . .  222 269
      138   CCVS-H-3 . . . . . . . . . . .  223 270
      188   CCVS-PGM-ID. . . . . . . . . .  194 194
       72   CM-18V0
       66   COMPUTED-A . . . . . . . . . .  67 69 70 71 72 298 302 M333
       67   COMPUTED-N
       65   COMPUTED-X . . . . . . . . . .  M215 283
       69   COMPUTED-0V18
       71   COMPUTED-14V4
       73   COMPUTED-18V0
       70   COMPUTED-4V14
       34   CON-DAY. . . . . . . . . . . .  324
       44   CON-GREENW . . . . . . . . . .  329
       36   CON-HOUR . . . . . . . . . . .  325
       42   CON-HUNDSEC. . . . . . . . . .  328
       38   CON-MIN. . . . . . . . . . . .  326
       32   CON-MONTH. . . . . . . . . . .  323
       46   CON-OFFSET . . . . . . . . . .  330
       40   CON-SEC. . . . . . . . . . . .  327
       30   CON-YEAR . . . . . . . . . . .  322
       89   COR-ANSI-REFERENCE . . . . . .  M293 M295
       80   CORRECT-A. . . . . . . . . . .  81 82 83 84 85 299 301
       81   CORRECT-N
       79   CORRECT-X. . . . . . . . . . .  M216 285 M334
       82   CORRECT-0V18
       84   CORRECT-14V4
       86   CORRECT-18V0
       83   CORRECT-4V14
       85   CR-18V0
      103   DELETE-COUNTER . . . . . . . .  M205 235 250 252
       58   DOTVALUE . . . . . . . . . . .  M210
      109   DUMMY-HOLD . . . . . . . . . .  M264 274
       24   DUMMY-RECORD . . . . . . . . .  M220 M221 M222 M223 M225 M226 M227 M229 M232 M240 M247 M254 M259 M260 264 M265
                                            266 M267 M268 M269 M270 M271 M272 M273 M274 278 M279 M288 M304
      156   ENDER-DESC . . . . . . . . . .  M242 M253 M258
      104   ERROR-COUNTER. . . . . . . . .  M204 234 243 246
      108   ERROR-HOLD . . . . . . . . . .  M234 M235 M235 M236 238
      154   ERROR-TOTAL. . . . . . . . . .  M244 M246 M251 M252 M256 M257
       51   FEATURE. . . . . . . . . . . .  M315
      182   HYPHEN-LINE. . . . . . . . . .  227 229 273
      148   ID-AGAIN . . . . . . . . . . .  M194
      181   INF-ANSI-REFERENCE . . . . . .  M286 M289 M303 M305
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page    11
0 Defined   Cross-reference of data names   References

0     176   INFO-TEXT. . . . . . . . . . .  M287
      105   INSPECT-COUNTER. . . . . . . .  M202 234 255 257
       53   P-OR-F . . . . . . . . . . . .  M202 M203 M204 M205 212 M215
       55   PAR-NAME . . . . . . . . . . .  M217 M341 M353
       57   PARDOT-X . . . . . . . . . . .  M209
      106   PASS-COUNTER . . . . . . . . .  M203 236 237
       22   PRINT-FILE . . . . . . . . . .  18 193 199
       23   PRINT-REC. . . . . . . . . . .  M211 M292 M294
       60   RE-MARK. . . . . . . . . . . .  M206 M218
      102   REC-CT . . . . . . . . . . . .  208 210 217
      101   REC-SKL-SUB
      110   RECORD-COUNT . . . . . . . . .  M262 263 M275
       27   TEMP1. . . . . . . . . . . . .  M317 M320 321 333 344
       61   TEST-COMPUTED. . . . . . . . .  292
       76   TEST-CORRECT . . . . . . . . .  294
      129   TEST-ID. . . . . . . . . . . .  M194
       49   TEST-RESULTS . . . . . . . . .  M195 211
      107   TOTAL-ERROR
       28   WS-DATE. . . . . . . . . . . .  M318 M321
       33   WS-DAY
       43   WS-GREENW
       35   WS-HOUR
       41   WS-HUNDSEC
       37   WS-MIN
       31   WS-MONTH
       45   WS-OFFSET
       39   WS-SECOND
       29   WS-YEAR
      178   XXCOMPUTED . . . . . . . . . .  M302
      180   XXCORRECT. . . . . . . . . . .  M301
      173   XXINFO . . . . . . . . . . . .  288 304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page    12
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

      297   BAIL-OUT . . . . . . . . . . .  P214
      306   BAIL-OUT-EX. . . . . . . . . .  E214 G299
      300   BAIL-OUT-WRITE . . . . . . . .  G298
      280   BLANK-LINE-PRINT
      355   CCVS-EXIT
      356   CCVS-999999
      191   CCVS1
      307   CCVS1-EXIT . . . . . . . . . .  G197
      198   CLOSE-FILES. . . . . . . . . .  G357
      224   COLUMN-NAMES-ROUTINE . . . . .  E196
      205   DE-LETE. . . . . . . . . . . .  P338 P350
      228   END-ROUTINE. . . . . . . . . .  P199
      233   END-ROUTINE-1
      241   END-ROUTINE-12
      249   END-ROUTINE-13 . . . . . . . .  E199
      231   END-RTN-EXIT
      337   F-WHENCOMP-DELETE-01
      349   F-WHENCOMP-DELETE-02
      313   F-WHENCOMP-INFO
      319   F-WHENCOMP-TEST-01
      343   F-WHENCOMP-TEST-02
      340   F-WHENCOMP-WRITE-01. . . . . .  G336 G339
      352   F-WHENCOMP-WRITE-02. . . . . .  G348 G351
      316   F-WHENCOMP-01
      204   FAIL . . . . . . . . . . . . .  P335 P347
      282   FAIL-ROUTINE . . . . . . . . .  P213
      296   FAIL-ROUTINE-EX. . . . . . . .  E213 G290
      291   FAIL-ROUTINE-WRITE . . . . . .  G284 G285
      219   HEAD-ROUTINE . . . . . . . . .  P196
      202   INSPT
      192   OPEN-FILES
      203   PASS . . . . . . . . . . . . .  P331 P345
      207   PRINT-DETAIL . . . . . . . . .  P342 P354
      312   SECT-IF142A
      200   TERMINATE-CCVS
      261   WRITE-LINE . . . . . . . . . .  P211 P212 P220 P221 P222 P223 P225 P226 P227 P229 P232 P240 P248 P254 P259 P260
                                            P288 P292 P294 P304
      277   WRT-LN . . . . . . . . . . . .  P267 P268 P269 P270 P271 P272 P273 P276 P281
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page    13
0 Defined   Cross-reference of programs     References

        3   IF142A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF142A    Date 06/04/2022  Time 11:57:37   Page    14
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF142A:
 *    Source records = 357
 *    Data Division statements = 83
 *    Procedure Division statements = 159
 *    Generated COBOL statements = 0
 *    Program complexity factor = 166
0End of compilation 1,  program IF142A,  highest severity 0.
0Return code 0
