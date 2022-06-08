1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:40   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:40   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1074.2
   000002         000200 PROGRAM-ID.                                                      IF1074.2
   000003         000300     IF107A.                                                      IF1074.2
   000004         000400                                                                  IF1074.2
   000005         000600*                                                         *       IF1074.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1074.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1074.2
   000008         000900* CURRENT-DATE.                                           *       IF1074.2
   000009         001000*                                                         *       IF1074.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1074.2
   000011         001300 CONFIGURATION SECTION.                                           IF1074.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1074.2
   000013         001500     XXXXX082.                                                    IF1074.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1074.2
   000015         001700     XXXXX083.                                                    IF1074.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1074.2
   000017         001900 FILE-CONTROL.                                                    IF1074.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1074.2 22
   000019         002100     XXXXX055.                                                    IF1074.2
   000020         002200 DATA DIVISION.                                                   IF1074.2
   000021         002300 FILE SECTION.                                                    IF1074.2
   000022         002400 FD  PRINT-FILE.                                                  IF1074.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1074.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1074.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1074.2
   000026         002900* Variables specific to the Intrinsic Function Test IF107A*       IF1074.2
   000027         003100 01  TEMP1                       PIC X(21).                       IF1074.2
   000028         003200 01  TEMP2                       PIC X(21).                       IF1074.2
   000029         003300 01  WS-FIRST                    VALUE SPACES.                    IF1074.2 IMP
   000030         003400     02  FILLER                  PIC X(8).                        IF1074.2
   000031         003500     02  WS-TIME1                PIC X(8).                        IF1074.2
   000032         003600     02  FILLER                  PIC X(5).                        IF1074.2
   000033         003700 01  WS-SECOND                   VALUE SPACES.                    IF1074.2 IMP
   000034         003800     02  FILLER                  PIC X(8).                        IF1074.2
   000035         003900     02  WS-TIME2                PIC X(8).                        IF1074.2
   000036         004000     02  FILLER                  PIC X(5).                        IF1074.2
   000037         004100 01  WS-DATE.                                                     IF1074.2
   000038         004200     02  WS-YEAR                 PIC 9999.                        IF1074.2
   000039         004300              88 CON-YEAR        VALUE 1990 THRU 9999.            IF1074.2
   000040         004400     02  WS-MONTH                PIC 99.                          IF1074.2
   000041         004500              88 CON-MONTH       VALUE 01 THRU 12.                IF1074.2
   000042         004600     02  WS-DAY                  PIC 99.                          IF1074.2
   000043         004700              88 CON-DAY         VALUE 01 THRU 31.                IF1074.2
   000044         004800     02  WS-HOUR                 PIC 99.                          IF1074.2
   000045         004900              88 CON-HOUR        VALUE 00 THRU 23.                IF1074.2
   000046         005000     02  WS-MIN                  PIC 99.                          IF1074.2
   000047         005100              88 CON-MIN         VALUE 00 THRU 59.                IF1074.2
   000048         005200     02  WS-SECOND               PIC 99.                          IF1074.2
   000049         005300              88 CON-SEC         VALUE 00 THRU 59.                IF1074.2
   000050         005400     02  WS-HUNDSEC              PIC 99.                          IF1074.2
   000051         005500              88 CON-HUNDSEC     VALUE 00 THRU 99.                IF1074.2
   000052         005600     02  WS-GREENW               PIC X.                           IF1074.2
   000053         005700              88 CON-GREENW      VALUE "-", "+", "0".             IF1074.2
   000054         005800     02  WS-OFFSET               PIC 99.                          IF1074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900              88 CON-OFFSET      VALUE 00 THRU 13.                IF1074.2
   000056         006000     02  WS-OFFSET2              PIC 99.                          IF1074.2
   000057         006100              88 CON-OFFSET2     VALUE 00 THRU 59.                IF1074.2
   000058         006200*                                                                 IF1074.2
   000059         006400*                                                                 IF1074.2
   000060         006500 01  TEST-RESULTS.                                                IF1074.2
   000061         006600     02 FILLER                   PIC X      VALUE SPACE.          IF1074.2 IMP
   000062         006700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1074.2 IMP
   000063         006800     02 FILLER                   PIC X      VALUE SPACE.          IF1074.2 IMP
   000064         006900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1074.2 IMP
   000065         007000     02 FILLER                   PIC X      VALUE SPACE.          IF1074.2 IMP
   000066         007100     02  PAR-NAME.                                                IF1074.2
   000067         007200       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1074.2 IMP
   000068         007300       03  PARDOT-X              PIC X      VALUE SPACE.          IF1074.2 IMP
   000069         007400       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1074.2 IMP
   000070         007500     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1074.2 IMP
   000071         007600     02 RE-MARK                  PIC X(61).                       IF1074.2
   000072         007700 01  TEST-COMPUTED.                                               IF1074.2
   000073         007800     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1074.2 IMP
   000074         007900     02 FILLER                   PIC X(17)  VALUE                 IF1074.2
   000075         008000            "       COMPUTED=".                                   IF1074.2
   000076         008100     02 COMPUTED-X.                                               IF1074.2
   000077         008200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1074.2 IMP
   000078         008300     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1074.2 77
   000079         008400                                 PIC -9(9).9(9).                  IF1074.2
   000080         008500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1074.2 77
   000081         008600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1074.2 77
   000082         008700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1074.2 77
   000083         008800     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1074.2 77
   000084         008900         04 COMPUTED-18V0                    PIC -9(18).          IF1074.2
   000085         009000         04 FILLER                           PIC X.               IF1074.2
   000086         009100     03 FILLER PIC X(50) VALUE SPACE.                             IF1074.2 IMP
   000087         009200 01  TEST-CORRECT.                                                IF1074.2
   000088         009300     02 FILLER PIC X(30) VALUE SPACE.                             IF1074.2 IMP
   000089         009400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1074.2
   000090         009500     02 CORRECT-X.                                                IF1074.2
   000091         009600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1074.2 IMP
   000092         009700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1074.2 91
   000093         009800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1074.2 91
   000094         009900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1074.2 91
   000095         010000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1074.2 91
   000096         010100     03      CR-18V0 REDEFINES CORRECT-A.                         IF1074.2 91
   000097         010200         04 CORRECT-18V0                     PIC -9(18).          IF1074.2
   000098         010300         04 FILLER                           PIC X.               IF1074.2
   000099         010400     03 FILLER PIC X(2) VALUE SPACE.                              IF1074.2 IMP
   000100         010500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1074.2 IMP
   000101         010600 01  CCVS-C-1.                                                    IF1074.2
   000102         010700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1074.2
   000103         010800-    "SS  PARAGRAPH-NAME                                          IF1074.2
   000104         010900-    "       REMARKS".                                            IF1074.2
   000105         011000     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1074.2 IMP
   000106         011100 01  CCVS-C-2.                                                    IF1074.2
   000107         011200     02 FILLER                     PIC X        VALUE SPACE.      IF1074.2 IMP
   000108         011300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1074.2
   000109         011400     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1074.2 IMP
   000110         011500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1074.2
   000111         011600     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1074.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1074.2 IMP
   000113         011800 01  REC-CT                        PIC 99       VALUE ZERO.       IF1074.2 IMP
   000114         011900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1074.2 IMP
   000115         012000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1074.2 IMP
   000116         012100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1074.2 IMP
   000117         012200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1074.2 IMP
   000118         012300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1074.2 IMP
   000119         012400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1074.2 IMP
   000120         012500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1074.2 IMP
   000121         012600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1074.2 IMP
   000122         012700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1074.2 IMP
   000123         012800 01  CCVS-H-1.                                                    IF1074.2
   000124         012900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1074.2 IMP
   000125         013000     02  FILLER                    PIC X(42)    VALUE             IF1074.2
   000126         013100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1074.2
   000127         013200     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1074.2 IMP
   000128         013300 01  CCVS-H-2A.                                                   IF1074.2
   000129         013400   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1074.2 IMP
   000130         013500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1074.2
   000131         013600   02  FILLER                        PIC XXXX   VALUE             IF1074.2
   000132         013700     "4.2 ".                                                      IF1074.2
   000133         013800   02  FILLER                        PIC X(28)  VALUE             IF1074.2
   000134         013900            " COPY - NOT FOR DISTRIBUTION".                       IF1074.2
   000135         014000   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1074.2 IMP
   000136         014100                                                                  IF1074.2
   000137         014200 01  CCVS-H-2B.                                                   IF1074.2
   000138         014300   02  FILLER                        PIC X(15)  VALUE             IF1074.2
   000139         014400            "TEST RESULT OF ".                                    IF1074.2
   000140         014500   02  TEST-ID                       PIC X(9).                    IF1074.2
   000141         014600   02  FILLER                        PIC X(4)   VALUE             IF1074.2
   000142         014700            " IN ".                                               IF1074.2
   000143         014800   02  FILLER                        PIC X(12)  VALUE             IF1074.2
   000144         014900     " HIGH       ".                                              IF1074.2
   000145         015000   02  FILLER                        PIC X(22)  VALUE             IF1074.2
   000146         015100            " LEVEL VALIDATION FOR ".                             IF1074.2
   000147         015200   02  FILLER                        PIC X(58)  VALUE             IF1074.2
   000148         015300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1074.2
   000149         015400 01  CCVS-H-3.                                                    IF1074.2
   000150         015500     02  FILLER                      PIC X(34)  VALUE             IF1074.2
   000151         015600            " FOR OFFICIAL USE ONLY    ".                         IF1074.2
   000152         015700     02  FILLER                      PIC X(58)  VALUE             IF1074.2
   000153         015800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1074.2
   000154         015900     02  FILLER                      PIC X(28)  VALUE             IF1074.2
   000155         016000            "  COPYRIGHT   1985 ".                                IF1074.2
   000156         016100 01  CCVS-E-1.                                                    IF1074.2
   000157         016200     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1074.2 IMP
   000158         016300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1074.2
   000159         016400     02 ID-AGAIN                     PIC X(9).                    IF1074.2
   000160         016500     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1074.2 IMP
   000161         016600 01  CCVS-E-2.                                                    IF1074.2
   000162         016700     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1074.2 IMP
   000163         016800     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1074.2 IMP
   000164         016900     02 CCVS-E-2-2.                                               IF1074.2
   000165         017000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1074.2 IMP
   000166         017100         03 FILLER                   PIC X      VALUE SPACE.      IF1074.2 IMP
   000167         017200         03 ENDER-DESC               PIC X(44)  VALUE             IF1074.2
   000168         017300            "ERRORS ENCOUNTERED".                                 IF1074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400 01  CCVS-E-3.                                                    IF1074.2
   000170         017500     02  FILLER                      PIC X(22)  VALUE             IF1074.2
   000171         017600            " FOR OFFICIAL USE ONLY".                             IF1074.2
   000172         017700     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1074.2 IMP
   000173         017800     02  FILLER                      PIC X(58)  VALUE             IF1074.2
   000174         017900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1074.2
   000175         018000     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1074.2 IMP
   000176         018100     02 FILLER                       PIC X(15)  VALUE             IF1074.2
   000177         018200             " COPYRIGHT 1985".                                   IF1074.2
   000178         018300 01  CCVS-E-4.                                                    IF1074.2
   000179         018400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1074.2 IMP
   000180         018500     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1074.2
   000181         018600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1074.2 IMP
   000182         018700     02 FILLER                       PIC X(40)  VALUE             IF1074.2
   000183         018800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1074.2
   000184         018900 01  XXINFO.                                                      IF1074.2
   000185         019000     02 FILLER                       PIC X(19)  VALUE             IF1074.2
   000186         019100            "*** INFORMATION ***".                                IF1074.2
   000187         019200     02 INFO-TEXT.                                                IF1074.2
   000188         019300       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1074.2 IMP
   000189         019400       04 XXCOMPUTED                 PIC X(20).                   IF1074.2
   000190         019500       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1074.2 IMP
   000191         019600       04 XXCORRECT                  PIC X(20).                   IF1074.2
   000192         019700     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1074.2
   000193         019800 01  HYPHEN-LINE.                                                 IF1074.2
   000194         019900     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1074.2 IMP
   000195         020000     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1074.2
   000196         020100-    "*****************************************".                 IF1074.2
   000197         020200     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1074.2
   000198         020300-    "******************************".                            IF1074.2
   000199         020400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1074.2
   000200         020500     "IF107A".                                                    IF1074.2
   000201         020600 PROCEDURE DIVISION.                                              IF1074.2
   000202         020700 CCVS1 SECTION.                                                   IF1074.2
   000203         020800 OPEN-FILES.                                                      IF1074.2
   000204         020900     OPEN     OUTPUT PRINT-FILE.                                  IF1074.2 22
   000205         021000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1074.2 199 140 199 159
   000206         021100     MOVE    SPACE TO TEST-RESULTS.                               IF1074.2 IMP 60
   000207         021200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1074.2 230 235
   000208         021300     GO TO CCVS1-EXIT.                                            IF1074.2 318
   000209         021400 CLOSE-FILES.                                                     IF1074.2
   000210         021500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1074.2 239 260 22
   000211         021600 TERMINATE-CCVS.                                                  IF1074.2
   000212         021700     STOP     RUN.                                                IF1074.2
   000213         021800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1074.2 64 116
   000214         021900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1074.2 64 117
   000215         022000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1074.2 64 115
   000216         022100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1074.2 64 114
   000217         022200     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1074.2 71
   000218         022300 PRINT-DETAIL.                                                    IF1074.2
   000219         022400     IF REC-CT NOT EQUAL TO ZERO                                  IF1074.2 113 IMP
   000220      1  022500             MOVE "." TO PARDOT-X                                 IF1074.2 68
   000221      1  022600             MOVE REC-CT TO DOTVALUE.                             IF1074.2 113 69
   000222         022700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1074.2 60 23 272
   000223         022800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1074.2 64 272
   000224      1  022900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1074.2 293 307
   000225      1  023000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1074.2 308 317
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1074.2 IMP 64 IMP 76
   000227         023200     MOVE SPACE TO CORRECT-X.                                     IF1074.2 IMP 90
   000228         023300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1074.2 113 IMP IMP 66
   000229         023400     MOVE     SPACE TO RE-MARK.                                   IF1074.2 IMP 71
   000230         023500 HEAD-ROUTINE.                                                    IF1074.2
   000231         023600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1074.2 123 24 272
   000232         023700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1074.2 128 24 272
   000233         023800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1074.2 137 24 272
   000234         023900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1074.2 149 24 272
   000235         024000 COLUMN-NAMES-ROUTINE.                                            IF1074.2
   000236         024100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1074.2 101 24 272
   000237         024200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1074.2 106 24 272
   000238         024300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1074.2 193 24 272
   000239         024400 END-ROUTINE.                                                     IF1074.2
   000240         024500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5       IF1074.2 193 24 272
   000241         024600     TIMES.                                                       IF1074.2
   000242         024700 END-RTN-EXIT.                                                    IF1074.2
   000243         024800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1074.2 156 24 272
   000244         024900 END-ROUTINE-1.                                                   IF1074.2
   000245         025000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1074.2 115 119 116
   000246         025100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1074.2 119 114 119
   000247         025200      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1074.2 117 119
   000248         025300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1074.2 117 179
   000249         025400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1074.2 119 181
   000250         025500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1074.2 178 164
   000251         025600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1074.2 161 24 272
   000252         025700  END-ROUTINE-12.                                                 IF1074.2
   000253         025800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1074.2 167
   000254         025900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1074.2 115 IMP
   000255      1  026000         MOVE "NO " TO ERROR-TOTAL                                IF1074.2 165
   000256         026100         ELSE                                                     IF1074.2
   000257      1  026200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1074.2 115 165
   000258         026300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1074.2 161 24
   000259         026400     PERFORM WRITE-LINE.                                          IF1074.2 272
   000260         026500 END-ROUTINE-13.                                                  IF1074.2
   000261         026600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1074.2 114 IMP
   000262      1  026700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1074.2 165
   000263      1  026800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1074.2 114 165
   000264         026900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1074.2 167
   000265         027000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1074.2 161 24 272
   000266         027100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1074.2 116 IMP
   000267      1  027200          MOVE "NO " TO ERROR-TOTAL                               IF1074.2 165
   000268      1  027300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1074.2 116 165
   000269         027400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1074.2 167
   000270         027500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1074.2 161 24 272
   000271         027600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1074.2 169 24 272
   000272         027700 WRITE-LINE.                                                      IF1074.2
   000273         027800     ADD 1 TO RECORD-COUNT.                                       IF1074.2 121
   000274         027900     IF RECORD-COUNT GREATER 42                                   IF1074.2 121
   000275      1  028000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1074.2 24 120
   000276      1  028100         MOVE SPACE TO DUMMY-RECORD                               IF1074.2 IMP 24
   000277      1  028200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1074.2 24
   000278      1  028300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1074.2 123 24 288
   000279      1  028400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1074.2 128 24 288
   000280      1  028500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1074.2 137 24 288
   000281      1  028600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1074.2 149 24 288
   000282      1  028700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1074.2 101 24 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1074.2 106 24 288
   000284      1  028900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1074.2 193 24 288
   000285      1  029000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1074.2 120 24
   000286      1  029100         MOVE ZERO TO RECORD-COUNT.                               IF1074.2 IMP 121
   000287         029200     PERFORM WRT-LN.                                              IF1074.2 288
   000288         029300 WRT-LN.                                                          IF1074.2
   000289         029400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1074.2 24
   000290         029500     MOVE SPACE TO DUMMY-RECORD.                                  IF1074.2 IMP 24
   000291         029600 BLANK-LINE-PRINT.                                                IF1074.2
   000292         029700     PERFORM WRT-LN.                                              IF1074.2 288
   000293         029800 FAIL-ROUTINE.                                                    IF1074.2
   000294         029900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1074.2 76 IMP
   000295      1  030000            GO TO FAIL-ROUTINE-WRITE.                             IF1074.2 302
   000296         030100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1074.2 90 IMP 302
   000297         030200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1074.2 122 192
   000298         030300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1074.2 187
   000299         030400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1074.2 184 24 272
   000300         030500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1074.2 IMP 192
   000301         030600     GO TO  FAIL-ROUTINE-EX.                                      IF1074.2 307
   000302         030700 FAIL-ROUTINE-WRITE.                                              IF1074.2
   000303         030800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1074.2 72 23 272
   000304         030900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1074.2 122 100
   000305         031000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1074.2 87 23 272
   000306         031100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1074.2 IMP 100
   000307         031200 FAIL-ROUTINE-EX. EXIT.                                           IF1074.2
   000308         031300 BAIL-OUT.                                                        IF1074.2
   000309         031400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1074.2 77 IMP 311
   000310         031500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1074.2 91 IMP 317
   000311         031600 BAIL-OUT-WRITE.                                                  IF1074.2
   000312         031700     MOVE CORRECT-A TO XXCORRECT.                                 IF1074.2 91 191
   000313         031800     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1074.2 77 189
   000314         031900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1074.2 122 192
   000315         032000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1074.2 184 24 272
   000316         032100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1074.2 IMP 192
   000317         032200 BAIL-OUT-EX. EXIT.                                               IF1074.2
   000318         032300 CCVS1-EXIT.                                                      IF1074.2
   000319         032400     EXIT.                                                        IF1074.2
   000320         032600*                                                      *          IF1074.2
   000321         032700*    Intrinsic Function Tests   IF107A - CURRENT-DATE *           IF1074.2
   000322         032800*                                                      *          IF1074.2
   000323         033000 SECT-IF107A SECTION.                                             IF1074.2
   000324         033100 F-WHENCOMP-INFO.                                                 IF1074.2
   000325         033200     MOVE     "See ref. A-39 2.11" TO ANSI-REFERENCE.             IF1074.2 122
   000326         033300     MOVE     "CURRENT-DATE"     TO FEATURE.                      IF1074.2 62
   000327         033500 F-WHENCOMP-01.                                                   IF1074.2
   000328         033600     MOVE SPACES TO TEMP1.                                        IF1074.2 IMP 27
   000329         033700     MOVE SPACES TO WS-DATE.                                      IF1074.2 IMP 37
   000330         033800 F-WHENCOMP-TEST-01.                                              IF1074.2
   000331         033900     MOVE FUNCTION CURRENT-DATE TO TEMP1.                         IF1074.2 IFN 27
   000332         034000     MOVE TEMP1 TO WS-DATE.                                       IF1074.2 27 37
   000333         034100     IF CON-YEAR     AND                                          IF1074.2 39
   000334         034200        CON-MONTH    AND                                          IF1074.2 41
   000335         034300        CON-DAY      AND                                          IF1074.2 43
   000336         034400        CON-HOUR     AND                                          IF1074.2 45
   000337         034500        CON-MIN      AND                                          IF1074.2 47
   000338         034600        CON-SEC      AND                                          IF1074.2 49
   000339         034700        CON-HUNDSEC  AND                                          IF1074.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800        CON-GREENW   AND                                          IF1074.2 53
   000341         034900        CON-OFFSET   AND                                          IF1074.2 55
   000342         035000        CON-OFFSET2  THEN                                         IF1074.2 57
   000343      1  035100                  PERFORM PASS                                    IF1074.2 214
   000344         035200     ELSE                                                         IF1074.2
   000345      1  035300                  MOVE TEMP1 TO COMPUTED-A                        IF1074.2 27 77
   000346      1  035400                  MOVE "Date & Time value " TO CORRECT-X          IF1074.2 90
   000347      1  035500                  PERFORM FAIL.                                   IF1074.2 215
   000348         035600     GO TO F-WHENCOMP-WRITE-01.                                   IF1074.2 352
   000349         035700 F-WHENCOMP-DELETE-01.                                            IF1074.2
   000350         035800     PERFORM  DE-LETE.                                            IF1074.2 216
   000351         035900     GO TO    F-WHENCOMP-WRITE-01.                                IF1074.2 352
   000352         036000 F-WHENCOMP-WRITE-01.                                             IF1074.2
   000353         036100     MOVE "F-WHENCOMP-01" TO PAR-NAME.                            IF1074.2 66
   000354         036200     PERFORM  PRINT-DETAIL.                                       IF1074.2 218
   000355         036400 F-WHENCOMP-TEST-02.                                              IF1074.2
   000356         036500     IF FUNCTION CURRENT-DATE >= TEMP1 THEN                       IF1074.2 IFN 27
   000357      1  036600                    PERFORM PASS                                  IF1074.2 214
   000358         036700     ELSE                                                         IF1074.2
   000359      1  036800                    PERFORM FAIL.                                 IF1074.2 215
   000360         036900     GO TO F-WHENCOMP-WRITE-02.                                   IF1074.2 364
   000361         037000 F-WHENCOMP-DELETE-02.                                            IF1074.2
   000362         037100     PERFORM  DE-LETE.                                            IF1074.2 216
   000363         037200     GO TO    F-WHENCOMP-WRITE-02.                                IF1074.2 364
   000364         037300 F-WHENCOMP-WRITE-02.                                             IF1074.2
   000365         037400     MOVE "F-WHENCOMP-02" TO PAR-NAME.                            IF1074.2 66
   000366         037500     PERFORM  PRINT-DETAIL.                                       IF1074.2 218
   000367         037700 CCVS-EXIT SECTION.                                               IF1074.2
   000368         037800 CCVS-999999.                                                     IF1074.2
   000369         037900     GO TO CLOSE-FILES.                                           IF1074.2 209
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page    10
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      122   ANSI-REFERENCE . . . . . . . .  297 304 314 M325
      101   CCVS-C-1 . . . . . . . . . . .  236 282
      106   CCVS-C-2 . . . . . . . . . . .  237 283
      156   CCVS-E-1 . . . . . . . . . . .  243
      161   CCVS-E-2 . . . . . . . . . . .  251 258 265 270
      164   CCVS-E-2-2 . . . . . . . . . .  M250
      169   CCVS-E-3 . . . . . . . . . . .  271
      178   CCVS-E-4 . . . . . . . . . . .  250
      179   CCVS-E-4-1 . . . . . . . . . .  M248
      181   CCVS-E-4-2 . . . . . . . . . .  M249
      123   CCVS-H-1 . . . . . . . . . . .  231 278
      128   CCVS-H-2A. . . . . . . . . . .  232 279
      137   CCVS-H-2B. . . . . . . . . . .  233 280
      149   CCVS-H-3 . . . . . . . . . . .  234 281
      199   CCVS-PGM-ID. . . . . . . . . .  205 205
       83   CM-18V0
       77   COMPUTED-A . . . . . . . . . .  78 80 81 82 83 309 313 M345
       78   COMPUTED-N
       76   COMPUTED-X . . . . . . . . . .  M226 294
       80   COMPUTED-0V18
       82   COMPUTED-14V4
       84   COMPUTED-18V0
       81   COMPUTED-4V14
       43   CON-DAY. . . . . . . . . . . .  335
       53   CON-GREENW . . . . . . . . . .  340
       45   CON-HOUR . . . . . . . . . . .  336
       51   CON-HUNDSEC. . . . . . . . . .  339
       47   CON-MIN. . . . . . . . . . . .  337
       41   CON-MONTH. . . . . . . . . . .  334
       55   CON-OFFSET . . . . . . . . . .  341
       57   CON-OFFSET2. . . . . . . . . .  342
       49   CON-SEC. . . . . . . . . . . .  338
       39   CON-YEAR . . . . . . . . . . .  333
      100   COR-ANSI-REFERENCE . . . . . .  M304 M306
       91   CORRECT-A. . . . . . . . . . .  92 93 94 95 96 310 312
       92   CORRECT-N
       90   CORRECT-X. . . . . . . . . . .  M227 296 M346
       93   CORRECT-0V18
       95   CORRECT-14V4
       97   CORRECT-18V0
       94   CORRECT-4V14
       96   CR-18V0
      114   DELETE-COUNTER . . . . . . . .  M216 246 261 263
       69   DOTVALUE . . . . . . . . . . .  M221
      120   DUMMY-HOLD . . . . . . . . . .  M275 285
       24   DUMMY-RECORD . . . . . . . . .  M231 M232 M233 M234 M236 M237 M238 M240 M243 M251 M258 M265 M270 M271 275 M276
                                            277 M278 M279 M280 M281 M282 M283 M284 M285 289 M290 M299 M315
      167   ENDER-DESC . . . . . . . . . .  M253 M264 M269
      115   ERROR-COUNTER. . . . . . . . .  M215 245 254 257
      119   ERROR-HOLD . . . . . . . . . .  M245 M246 M246 M247 249
      165   ERROR-TOTAL. . . . . . . . . .  M255 M257 M262 M263 M267 M268
       62   FEATURE. . . . . . . . . . . .  M326
      193   HYPHEN-LINE. . . . . . . . . .  238 240 284
      159   ID-AGAIN . . . . . . . . . . .  M205
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page    11
0 Defined   Cross-reference of data names   References

0     192   INF-ANSI-REFERENCE . . . . . .  M297 M300 M314 M316
      187   INFO-TEXT. . . . . . . . . . .  M298
      116   INSPECT-COUNTER. . . . . . . .  M213 245 266 268
       64   P-OR-F . . . . . . . . . . . .  M213 M214 M215 M216 223 M226
       66   PAR-NAME . . . . . . . . . . .  M228 M353 M365
       68   PARDOT-X . . . . . . . . . . .  M220
      117   PASS-COUNTER . . . . . . . . .  M214 247 248
       22   PRINT-FILE . . . . . . . . . .  18 204 210
       23   PRINT-REC. . . . . . . . . . .  M222 M303 M305
       71   RE-MARK. . . . . . . . . . . .  M217 M229
      113   REC-CT . . . . . . . . . . . .  219 221 228
      112   REC-SKL-SUB
      121   RECORD-COUNT . . . . . . . . .  M273 274 M286
       27   TEMP1. . . . . . . . . . . . .  M328 M331 332 345 356
       28   TEMP2
       72   TEST-COMPUTED. . . . . . . . .  303
       87   TEST-CORRECT . . . . . . . . .  305
      140   TEST-ID. . . . . . . . . . . .  M205
       60   TEST-RESULTS . . . . . . . . .  M206 222
      118   TOTAL-ERROR
       37   WS-DATE. . . . . . . . . . . .  M329 M332
       42   WS-DAY
       29   WS-FIRST
       52   WS-GREENW
       44   WS-HOUR
       50   WS-HUNDSEC
       46   WS-MIN
       40   WS-MONTH
       54   WS-OFFSET
       56   WS-OFFSET2
       33   WS-SECOND
       48   WS-SECOND
       31   WS-TIME1
       35   WS-TIME2
       38   WS-YEAR
      189   XXCOMPUTED . . . . . . . . . .  M313
      191   XXCORRECT. . . . . . . . . . .  M312
      184   XXINFO . . . . . . . . . . . .  299 315
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page    12
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

      308   BAIL-OUT . . . . . . . . . . .  P225
      317   BAIL-OUT-EX. . . . . . . . . .  E225 G310
      311   BAIL-OUT-WRITE . . . . . . . .  G309
      291   BLANK-LINE-PRINT
      367   CCVS-EXIT
      368   CCVS-999999
      202   CCVS1
      318   CCVS1-EXIT . . . . . . . . . .  G208
      209   CLOSE-FILES. . . . . . . . . .  G369
      235   COLUMN-NAMES-ROUTINE . . . . .  E207
      216   DE-LETE. . . . . . . . . . . .  P350 P362
      239   END-ROUTINE. . . . . . . . . .  P210
      244   END-ROUTINE-1
      252   END-ROUTINE-12
      260   END-ROUTINE-13 . . . . . . . .  E210
      242   END-RTN-EXIT
      349   F-WHENCOMP-DELETE-01
      361   F-WHENCOMP-DELETE-02
      324   F-WHENCOMP-INFO
      330   F-WHENCOMP-TEST-01
      355   F-WHENCOMP-TEST-02
      352   F-WHENCOMP-WRITE-01. . . . . .  G348 G351
      364   F-WHENCOMP-WRITE-02. . . . . .  G360 G363
      327   F-WHENCOMP-01
      215   FAIL . . . . . . . . . . . . .  P347 P359
      293   FAIL-ROUTINE . . . . . . . . .  P224
      307   FAIL-ROUTINE-EX. . . . . . . .  E224 G301
      302   FAIL-ROUTINE-WRITE . . . . . .  G295 G296
      230   HEAD-ROUTINE . . . . . . . . .  P207
      213   INSPT
      203   OPEN-FILES
      214   PASS . . . . . . . . . . . . .  P343 P357
      218   PRINT-DETAIL . . . . . . . . .  P354 P366
      323   SECT-IF107A
      211   TERMINATE-CCVS
      272   WRITE-LINE . . . . . . . . . .  P222 P223 P231 P232 P233 P234 P236 P237 P238 P240 P243 P251 P259 P265 P270 P271
                                            P299 P303 P305 P315
      288   WRT-LN . . . . . . . . . . . .  P278 P279 P280 P281 P282 P283 P284 P287 P292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page    13
0 Defined   Cross-reference of programs     References

        3   IF107A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF107A    Date 06/04/2022  Time 11:57:40   Page    14
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF107A:
 *    Source records = 369
 *    Data Division statements = 90
 *    Procedure Division statements = 159
 *    Generated COBOL statements = 0
 *    Program complexity factor = 166
0End of compilation 1,  program IF107A,  highest severity 0.
0Return code 0
