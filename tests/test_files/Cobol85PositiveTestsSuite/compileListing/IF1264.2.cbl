1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:20   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:20   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1264.2
   000002         000200 PROGRAM-ID.                                                      IF1264.2
   000003         000300     IF126A.                                                      IF1264.2
   000004         000400                                                                  IF1264.2
   000005         000600*                                                         *       IF1264.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1264.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1264.2
   000008         000900* NUMVAL-C.                                               *       IF1264.2
   000009         001000*                                                         *       IF1264.2
   000010         001100*                                                         *       IF1264.2
   000011         001300 ENVIRONMENT DIVISION.                                            IF1264.2
   000012         001400 CONFIGURATION SECTION.                                           IF1264.2
   000013         001500 SOURCE-COMPUTER.                                                 IF1264.2
   000014         001600     XXXXX082.                                                    IF1264.2
   000015         001700 OBJECT-COMPUTER.                                                 IF1264.2
   000016         001800     XXXXX083.                                                    IF1264.2
   000017         001900 INPUT-OUTPUT SECTION.                                            IF1264.2
   000018         002000 FILE-CONTROL.                                                    IF1264.2
   000019         002100     SELECT PRINT-FILE ASSIGN TO                                  IF1264.2 23
   000020         002200     XXXXX055.                                                    IF1264.2
   000021         002300 DATA DIVISION.                                                   IF1264.2
   000022         002400 FILE SECTION.                                                    IF1264.2
   000023         002500 FD  PRINT-FILE.                                                  IF1264.2

 ==000023==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000024         002600 01  PRINT-REC PICTURE X(120).                                    IF1264.2
   000025         002700 01  DUMMY-RECORD PICTURE X(120).                                 IF1264.2
   000026         002800 WORKING-STORAGE SECTION.                                         IF1264.2
   000027         003000* Variables specific to the Intrinsic Function Test IF126A*       IF1264.2
   000028         003200 01  A                   PIC X(1)       VALUE "4".                IF1264.2
   000029         003300 01  B                   PIC X(5)       VALUE "203".              IF1264.2
   000030         003400 01  C                   PIC X(4)       VALUE ".429".             IF1264.2
   000031         003500 01  D                   PIC X(7)       VALUE "928.344".          IF1264.2
   000032         003600 01  E                   PIC X(9)       VALUE "-042.3240".        IF1264.2
   000033         003700 01  F                   PIC X(7)       VALUE " 23.000".          IF1264.2
   000034         003800 01  G                   PIC X(8)       VALUE "-92924.3".         IF1264.2
   000035         003900 01  H                   PIC X(6)       VALUE "93.21+".           IF1264.2
   000036         004000 01  I                   PIC X(9)       VALUE " 92.92  -".        IF1264.2
   000037         004100 01  J                   PIC X(9)       VALUE "8,848.934".        IF1264.2
   000038         004200 01  K                   PIC X(12)      VALUE "4,825,293.92".     IF1264.2
   000039         004300 01  L                   PIC X(12)      VALUE " - 5,555.55 ".     IF1264.2
   000040         004400 01  M                   PIC X(9)       VALUE "5,555.55-".        IF1264.2
   000041         004500 01  N                   PIC X(13)      VALUE " 77,777.77 + ".    IF1264.2
   000042         004600 01  O                   PIC X(3)       VALUE "$33".              IF1264.2
   000043         004700 01  P                   PIC X(5)       VALUE "$0.11".            IF1264.2
   000044         004800 01  Q                   PIC X(9)       VALUE "$4,000.00".        IF1264.2
   000045         004900 01  R                   PIC X(14)      VALUE "$1,000,000.50".    IF1264.2
   000046         005000 01  S                   PIC X(14)       VALUE " $ 3,900.21".     IF1264.2
   000047         005100 01  T                   PIC X(14)       VALUE " + $ 9,000.99".   IF1264.2
   000048         005200 01  U                   PIC X(15)       VALUE " $ 3,890.20 + ".  IF1264.2
   000049         005300 01  TEMP                PIC S9(7)V9(5).                          IF1264.2
   000050         005400                                                                  IF1264.2
   000051         005500*                                                                 IF1264.2
   000052         005700*                                                                 IF1264.2
   000053         005800 01  TEST-RESULTS.                                                IF1264.2
   000054         005900     02 FILLER                   PIC X      VALUE SPACE.          IF1264.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1264.2 IMP
   000056         006100     02 FILLER                   PIC X      VALUE SPACE.          IF1264.2 IMP
   000057         006200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1264.2 IMP
   000058         006300     02 FILLER                   PIC X      VALUE SPACE.          IF1264.2 IMP
   000059         006400     02  PAR-NAME.                                                IF1264.2
   000060         006500       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1264.2 IMP
   000061         006600       03  PARDOT-X              PIC X      VALUE SPACE.          IF1264.2 IMP
   000062         006700       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1264.2 IMP
   000063         006800     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1264.2 IMP
   000064         006900     02 RE-MARK                  PIC X(61).                       IF1264.2
   000065         007000 01  TEST-COMPUTED.                                               IF1264.2
   000066         007100     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1264.2 IMP
   000067         007200     02 FILLER                   PIC X(17)  VALUE                 IF1264.2
   000068         007300            "       COMPUTED=".                                   IF1264.2
   000069         007400     02 COMPUTED-X.                                               IF1264.2
   000070         007500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1264.2 IMP
   000071         007600     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1264.2 70
   000072         007700                                 PIC -9(9).9(9).                  IF1264.2
   000073         007800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1264.2 70
   000074         007900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1264.2 70
   000075         008000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1264.2 70
   000076         008100     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1264.2 70
   000077         008200         04 COMPUTED-18V0                    PIC -9(18).          IF1264.2
   000078         008300         04 FILLER                           PIC X.               IF1264.2
   000079         008400     03 FILLER PIC X(50) VALUE SPACE.                             IF1264.2 IMP
   000080         008500 01  TEST-CORRECT.                                                IF1264.2
   000081         008600     02 FILLER PIC X(30) VALUE SPACE.                             IF1264.2 IMP
   000082         008700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1264.2
   000083         008800     02 CORRECT-X.                                                IF1264.2
   000084         008900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1264.2 IMP
   000085         009000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1264.2 84
   000086         009100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1264.2 84
   000087         009200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1264.2 84
   000088         009300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1264.2 84
   000089         009400     03      CR-18V0 REDEFINES CORRECT-A.                         IF1264.2 84
   000090         009500         04 CORRECT-18V0                     PIC -9(18).          IF1264.2
   000091         009600         04 FILLER                           PIC X.               IF1264.2
   000092         009700     03 FILLER PIC X(2) VALUE SPACE.                              IF1264.2 IMP
   000093         009800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1264.2 IMP
   000094         009900 01  CCVS-C-1.                                                    IF1264.2
   000095         010000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1264.2
   000096         010100-    "SS  PARAGRAPH-NAME                                          IF1264.2
   000097         010200-    "       REMARKS".                                            IF1264.2
   000098         010300     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1264.2 IMP
   000099         010400 01  CCVS-C-2.                                                    IF1264.2
   000100         010500     02 FILLER                     PIC X        VALUE SPACE.      IF1264.2 IMP
   000101         010600     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1264.2
   000102         010700     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1264.2 IMP
   000103         010800     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1264.2
   000104         010900     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1264.2 IMP
   000105         011000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1264.2 IMP
   000106         011100 01  REC-CT                        PIC 99       VALUE ZERO.       IF1264.2 IMP
   000107         011200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1264.2 IMP
   000108         011300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1264.2 IMP
   000109         011400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1264.2 IMP
   000110         011500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1264.2 IMP
   000111         011600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1264.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1264.2 IMP
   000113         011800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1264.2 IMP
   000114         011900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1264.2 IMP
   000115         012000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1264.2 IMP
   000116         012100 01  CCVS-H-1.                                                    IF1264.2
   000117         012200     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1264.2 IMP
   000118         012300     02  FILLER                    PIC X(42)    VALUE             IF1264.2
   000119         012400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1264.2
   000120         012500     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1264.2 IMP
   000121         012600 01  CCVS-H-2A.                                                   IF1264.2
   000122         012700   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1264.2 IMP
   000123         012800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1264.2
   000124         012900   02  FILLER                        PIC XXXX   VALUE             IF1264.2
   000125         013000     "4.2 ".                                                      IF1264.2
   000126         013100   02  FILLER                        PIC X(28)  VALUE             IF1264.2
   000127         013200            " COPY - NOT FOR DISTRIBUTION".                       IF1264.2
   000128         013300   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1264.2 IMP
   000129         013400                                                                  IF1264.2
   000130         013500 01  CCVS-H-2B.                                                   IF1264.2
   000131         013600   02  FILLER                        PIC X(15)  VALUE             IF1264.2
   000132         013700            "TEST RESULT OF ".                                    IF1264.2
   000133         013800   02  TEST-ID                       PIC X(9).                    IF1264.2
   000134         013900   02  FILLER                        PIC X(4)   VALUE             IF1264.2
   000135         014000            " IN ".                                               IF1264.2
   000136         014100   02  FILLER                        PIC X(12)  VALUE             IF1264.2
   000137         014200     " HIGH       ".                                              IF1264.2
   000138         014300   02  FILLER                        PIC X(22)  VALUE             IF1264.2
   000139         014400            " LEVEL VALIDATION FOR ".                             IF1264.2
   000140         014500   02  FILLER                        PIC X(58)  VALUE             IF1264.2
   000141         014600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1264.2
   000142         014700 01  CCVS-H-3.                                                    IF1264.2
   000143         014800     02  FILLER                      PIC X(34)  VALUE             IF1264.2
   000144         014900            " FOR OFFICIAL USE ONLY    ".                         IF1264.2
   000145         015000     02  FILLER                      PIC X(58)  VALUE             IF1264.2
   000146         015100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1264.2
   000147         015200     02  FILLER                      PIC X(28)  VALUE             IF1264.2
   000148         015300            "  COPYRIGHT   1985 ".                                IF1264.2
   000149         015400 01  CCVS-E-1.                                                    IF1264.2
   000150         015500     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1264.2 IMP
   000151         015600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1264.2
   000152         015700     02 ID-AGAIN                     PIC X(9).                    IF1264.2
   000153         015800     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1264.2 IMP
   000154         015900 01  CCVS-E-2.                                                    IF1264.2
   000155         016000     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1264.2 IMP
   000156         016100     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1264.2 IMP
   000157         016200     02 CCVS-E-2-2.                                               IF1264.2
   000158         016300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1264.2 IMP
   000159         016400         03 FILLER                   PIC X      VALUE SPACE.      IF1264.2 IMP
   000160         016500         03 ENDER-DESC               PIC X(44)  VALUE             IF1264.2
   000161         016600            "ERRORS ENCOUNTERED".                                 IF1264.2
   000162         016700 01  CCVS-E-3.                                                    IF1264.2
   000163         016800     02  FILLER                      PIC X(22)  VALUE             IF1264.2
   000164         016900            " FOR OFFICIAL USE ONLY".                             IF1264.2
   000165         017000     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1264.2 IMP
   000166         017100     02  FILLER                      PIC X(58)  VALUE             IF1264.2
   000167         017200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1264.2
   000168         017300     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1264.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 FILLER                       PIC X(15)  VALUE             IF1264.2
   000170         017500             " COPYRIGHT 1985".                                   IF1264.2
   000171         017600 01  CCVS-E-4.                                                    IF1264.2
   000172         017700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1264.2 IMP
   000173         017800     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1264.2
   000174         017900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1264.2 IMP
   000175         018000     02 FILLER                       PIC X(40)  VALUE             IF1264.2
   000176         018100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1264.2
   000177         018200 01  XXINFO.                                                      IF1264.2
   000178         018300     02 FILLER                       PIC X(19)  VALUE             IF1264.2
   000179         018400            "*** INFORMATION ***".                                IF1264.2
   000180         018500     02 INFO-TEXT.                                                IF1264.2
   000181         018600       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1264.2 IMP
   000182         018700       04 XXCOMPUTED                 PIC X(20).                   IF1264.2
   000183         018800       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1264.2 IMP
   000184         018900       04 XXCORRECT                  PIC X(20).                   IF1264.2
   000185         019000     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1264.2
   000186         019100 01  HYPHEN-LINE.                                                 IF1264.2
   000187         019200     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1264.2 IMP
   000188         019300     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1264.2
   000189         019400-    "*****************************************".                 IF1264.2
   000190         019500     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1264.2
   000191         019600-    "******************************".                            IF1264.2
   000192         019700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1264.2
   000193         019800     "IF126A".                                                    IF1264.2
   000194         019900 PROCEDURE DIVISION.                                              IF1264.2
   000195         020000 CCVS1 SECTION.                                                   IF1264.2
   000196         020100 OPEN-FILES.                                                      IF1264.2
   000197         020200     OPEN     OUTPUT PRINT-FILE.                                  IF1264.2 23
   000198         020300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1264.2 192 133 192 152
   000199         020400     MOVE    SPACE TO TEST-RESULTS.                               IF1264.2 IMP 53
   000200         020500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1264.2 223 228
   000201         020600     GO TO CCVS1-EXIT.                                            IF1264.2 310
   000202         020700 CLOSE-FILES.                                                     IF1264.2
   000203         020800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1264.2 232 252 23
   000204         020900 TERMINATE-CCVS.                                                  IF1264.2
   000205         021000     STOP     RUN.                                                IF1264.2
   000206         021100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1264.2 57 109
   000207         021200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1264.2 57 110
   000208         021300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1264.2 57 108
   000209         021400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1264.2 57 107
   000210         021500     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1264.2 64
   000211         021600 PRINT-DETAIL.                                                    IF1264.2
   000212         021700     IF REC-CT NOT EQUAL TO ZERO                                  IF1264.2 106 IMP
   000213      1  021800             MOVE "." TO PARDOT-X                                 IF1264.2 61
   000214      1  021900             MOVE REC-CT TO DOTVALUE.                             IF1264.2 106 62
   000215         022000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1264.2 53 24 264
   000216         022100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1264.2 57 264
   000217      1  022200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1264.2 285 299
   000218      1  022300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1264.2 300 309
   000219         022400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1264.2 IMP 57 IMP 69
   000220         022500     MOVE SPACE TO CORRECT-X.                                     IF1264.2 IMP 83
   000221         022600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1264.2 106 IMP IMP 59
   000222         022700     MOVE     SPACE TO RE-MARK.                                   IF1264.2 IMP 64
   000223         022800 HEAD-ROUTINE.                                                    IF1264.2
   000224         022900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1264.2 116 25 264
   000225         023000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1264.2 121 25 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1264.2 130 25 264
   000227         023200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1264.2 142 25 264
   000228         023300 COLUMN-NAMES-ROUTINE.                                            IF1264.2
   000229         023400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1264.2 94 25 264
   000230         023500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1264.2 99 25 264
   000231         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1264.2 186 25 264
   000232         023700 END-ROUTINE.                                                     IF1264.2
   000233         023800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1264.2 186 25 264
   000234         023900 END-RTN-EXIT.                                                    IF1264.2
   000235         024000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1264.2 149 25 264
   000236         024100 END-ROUTINE-1.                                                   IF1264.2
   000237         024200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1264.2 108 112 109
   000238         024300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1264.2 112 107 112
   000239         024400      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1264.2 110 112
   000240         024500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1264.2 110 172
   000241         024600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1264.2 112 174
   000242         024700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1264.2 171 157
   000243         024800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1264.2 154 25 264
   000244         024900  END-ROUTINE-12.                                                 IF1264.2
   000245         025000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1264.2 160
   000246         025100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1264.2 108 IMP
   000247      1  025200         MOVE "NO " TO ERROR-TOTAL                                IF1264.2 158
   000248         025300         ELSE                                                     IF1264.2
   000249      1  025400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1264.2 108 158
   000250         025500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1264.2 154 25
   000251         025600     PERFORM WRITE-LINE.                                          IF1264.2 264
   000252         025700 END-ROUTINE-13.                                                  IF1264.2
   000253         025800     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1264.2 107 IMP
   000254      1  025900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1264.2 158
   000255      1  026000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1264.2 107 158
   000256         026100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1264.2 160
   000257         026200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1264.2 154 25 264
   000258         026300      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1264.2 109 IMP
   000259      1  026400          MOVE "NO " TO ERROR-TOTAL                               IF1264.2 158
   000260      1  026500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1264.2 109 158
   000261         026600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1264.2 160
   000262         026700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1264.2 154 25 264
   000263         026800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1264.2 162 25 264
   000264         026900 WRITE-LINE.                                                      IF1264.2
   000265         027000     ADD 1 TO RECORD-COUNT.                                       IF1264.2 114
   000266         027100     IF RECORD-COUNT GREATER 42                                   IF1264.2 114
   000267      1  027200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1264.2 25 113
   000268      1  027300         MOVE SPACE TO DUMMY-RECORD                               IF1264.2 IMP 25
   000269      1  027400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1264.2 25
   000270      1  027500         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1264.2 116 25 280
   000271      1  027600         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1264.2 121 25 280
   000272      1  027700         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1264.2 130 25 280
   000273      1  027800         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1264.2 142 25 280
   000274      1  027900         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1264.2 94 25 280
   000275      1  028000         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1264.2 99 25 280
   000276      1  028100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1264.2 186 25 280
   000277      1  028200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1264.2 113 25
   000278      1  028300         MOVE ZERO TO RECORD-COUNT.                               IF1264.2 IMP 114
   000279         028400     PERFORM WRT-LN.                                              IF1264.2 280
   000280         028500 WRT-LN.                                                          IF1264.2
   000281         028600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1264.2 25
   000282         028700     MOVE SPACE TO DUMMY-RECORD.                                  IF1264.2 IMP 25
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800 BLANK-LINE-PRINT.                                                IF1264.2
   000284         028900     PERFORM WRT-LN.                                              IF1264.2 280
   000285         029000 FAIL-ROUTINE.                                                    IF1264.2
   000286         029100     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1264.2 69 IMP
   000287      1  029200            GO TO FAIL-ROUTINE-WRITE.                             IF1264.2 294
   000288         029300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1264.2 83 IMP 294
   000289         029400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1264.2 115 185
   000290         029500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1264.2 180
   000291         029600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1264.2 177 25 264
   000292         029700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1264.2 IMP 185
   000293         029800     GO TO  FAIL-ROUTINE-EX.                                      IF1264.2 299
   000294         029900 FAIL-ROUTINE-WRITE.                                              IF1264.2
   000295         030000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1264.2 65 24 264
   000296         030100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1264.2 115 93
   000297         030200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1264.2 80 24 264
   000298         030300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1264.2 IMP 93
   000299         030400 FAIL-ROUTINE-EX. EXIT.                                           IF1264.2
   000300         030500 BAIL-OUT.                                                        IF1264.2
   000301         030600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1264.2 70 IMP 303
   000302         030700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1264.2 84 IMP 309
   000303         030800 BAIL-OUT-WRITE.                                                  IF1264.2
   000304         030900     MOVE CORRECT-A TO XXCORRECT.                                 IF1264.2 84 184
   000305         031000     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1264.2 70 182
   000306         031100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1264.2 115 185
   000307         031200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1264.2 177 25 264
   000308         031300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1264.2 IMP 185
   000309         031400 BAIL-OUT-EX. EXIT.                                               IF1264.2
   000310         031500 CCVS1-EXIT.                                                      IF1264.2
   000311         031600     EXIT.                                                        IF1264.2
   000312         031800*                                                      *          IF1264.2
   000313         031900*    Intrinsic Function Tests       IF126A - NUMVAL-C  *          IF1264.2
   000314         032000*                                                      *          IF1264.2
   000315         032200 SECT-IF126A SECTION.                                             IF1264.2
   000316         032300 F-NUMVALC-INFO.                                                  IF1264.2
   000317         032400     MOVE     "See ref. A-59 2.30" TO ANSI-REFERENCE.             IF1264.2 115
   000318         032500     MOVE     "NUMVAL-C Function"     TO FEATURE.                 IF1264.2 55
   000319         032700 F-NUMVALC-01.                                                    IF1264.2
   000320         032800     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000321         032900 F-NUMVALC-TEST-01.                                               IF1264.2
   000322         033000     COMPUTE TEMP = FUNCTION NUMVAL-C ("9").                      IF1264.2 49 IFN
   000323         033100     IF TEMP = 9 THEN                                             IF1264.2 49
   000324      1  033200                        PERFORM PASS                              IF1264.2 207
   000325         033300     ELSE                                                         IF1264.2
   000326      1  033400                        MOVE 9 TO CORRECT-N                       IF1264.2 85
   000327      1  033500                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000328      1  033600                        PERFORM FAIL.                             IF1264.2 208
   000329         033700     GO TO F-NUMVALC-WRITE-01.                                    IF1264.2 333
   000330         033800 F-NUMVALC-DELETE-01.                                             IF1264.2
   000331         033900     PERFORM  DE-LETE.                                            IF1264.2 209
   000332         034000     GO TO    F-NUMVALC-WRITE-01.                                 IF1264.2 333
   000333         034100 F-NUMVALC-WRITE-01.                                              IF1264.2
   000334         034200     MOVE "F-NUMVALC-01" TO PAR-NAME.                             IF1264.2 59
   000335         034300     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000336         034500 F-NUMVALC-02.                                                    IF1264.2
   000337         034600     MOVE 77  TO TEMP.                                            IF1264.2 49
   000338         034700 F-NUMVALC-TEST-02.                                               IF1264.2
   000339         034800     EVALUATE FUNCTION NUMVAL-C (B)                               IF1264.2 IFN 29
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034900              ALSO ( TEMP + 96 ) * 2                              IF1264.2 49
   000341         035000     WHEN     203                                                 IF1264.2
   000342         035100              ALSO 346                                            IF1264.2
   000343      1  035200        PERFORM PASS                                              IF1264.2 207
   000344      1  035300        GO TO F-NUMVALC-WRITE-02.                                 IF1264.2 350
   000345         035400     PERFORM FAIL.                                                IF1264.2 208
   000346         035500     GO TO    F-NUMVALC-WRITE-02.                                 IF1264.2 350
   000347         035600 F-NUMVALC-DELETE-02.                                             IF1264.2
   000348         035700     PERFORM  DE-LETE.                                            IF1264.2 209
   000349         035800     GO TO    F-NUMVALC-WRITE-02.                                 IF1264.2 350
   000350         035900 F-NUMVALC-WRITE-02.                                              IF1264.2
   000351         036000     MOVE "F-NUMVALC-02" TO PAR-NAME.                             IF1264.2 59
   000352         036100     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000353         036300 F-NUMVALC-TEST-03.                                               IF1264.2
   000354         036400     IF FUNCTION NUMVAL-C ("92,483") = 92483 THEN                 IF1264.2 IFN
   000355      1  036500                        PERFORM PASS                              IF1264.2 207
   000356         036600     ELSE                                                         IF1264.2
   000357      1  036700                        PERFORM FAIL.                             IF1264.2 208
   000358         036800     GO TO F-NUMVALC-WRITE-03.                                    IF1264.2 362
   000359         036900 F-NUMVALC-DELETE-03.                                             IF1264.2
   000360         037000     PERFORM  DE-LETE.                                            IF1264.2 209
   000361         037100     GO TO    F-NUMVALC-WRITE-03.                                 IF1264.2 362
   000362         037200 F-NUMVALC-WRITE-03.                                              IF1264.2
   000363         037300     MOVE "F-NUMVALC-03" TO PAR-NAME.                             IF1264.2 59
   000364         037400     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000365         037600 F-NUMVALC-04.                                                    IF1264.2
   000366         037700     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000367         037800 F-NUMVALC-TEST-04.                                               IF1264.2
   000368         037900     COMPUTE TEMP = FUNCTION NUMVAL-C (C).                        IF1264.2 49 IFN 30
   000369         038000     IF (TEMP >= 0.428991) AND                                    IF1264.2 49
   000370         038100        (TEMP <= 0.429009)                                        IF1264.2 49
   000371      1  038200                        PERFORM PASS                              IF1264.2 207
   000372         038300     ELSE                                                         IF1264.2
   000373      1  038400                        MOVE  0.429  TO CORRECT-N                 IF1264.2 85
   000374      1  038500                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000375      1  038600                        PERFORM FAIL.                             IF1264.2 208
   000376         038700     GO TO F-NUMVALC-WRITE-04.                                    IF1264.2 380
   000377         038800 F-NUMVALC-DELETE-04.                                             IF1264.2
   000378         038900     PERFORM  DE-LETE.                                            IF1264.2 209
   000379         039000     GO TO    F-NUMVALC-WRITE-04.                                 IF1264.2 380
   000380         039100 F-NUMVALC-WRITE-04.                                              IF1264.2
   000381         039200     MOVE "F-NUMVALC-04" TO PAR-NAME.                             IF1264.2 59
   000382         039300     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000383         039500 F-NUMVALC-05.                                                    IF1264.2
   000384         039600     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000385         039700 F-NUMVALC-TEST-05.                                               IF1264.2
   000386         039800     COMPUTE TEMP = FUNCTION NUMVAL-C ("385.93").                 IF1264.2 49 IFN
   000387         039900     IF (TEMP >= 385.922) AND                                     IF1264.2 49
   000388         040000        (TEMP <= 385.938)                                         IF1264.2 49
   000389      1  040100                        PERFORM PASS                              IF1264.2 207
   000390         040200     ELSE                                                         IF1264.2
   000391      1  040300                        MOVE  385.93  TO CORRECT-N                IF1264.2 85
   000392      1  040400                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000393      1  040500                        PERFORM FAIL.                             IF1264.2 208
   000394         040600     GO TO F-NUMVALC-WRITE-05.                                    IF1264.2 398
   000395         040700 F-NUMVALC-DELETE-05.                                             IF1264.2
   000396         040800     PERFORM  DE-LETE.                                            IF1264.2 209
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040900     GO TO    F-NUMVALC-WRITE-05.                                 IF1264.2 398
   000398         041000 F-NUMVALC-WRITE-05.                                              IF1264.2
   000399         041100     MOVE "F-NUMVALC-05" TO PAR-NAME.                             IF1264.2 59
   000400         041200     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000401         041400 F-NUMVALC-06.                                                    IF1264.2
   000402         041500     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000403         041600 F-NUMVALC-TEST-06.                                               IF1264.2
   000404         041700     COMPUTE TEMP = FUNCTION NUMVAL-C (J).                        IF1264.2 49 IFN 37
   000405         041800     IF (TEMP >= 8848.76) AND                                     IF1264.2 49
   000406         041900        (TEMP <= 8849.11)                                         IF1264.2 49
   000407      1  042000                        PERFORM PASS                              IF1264.2 207
   000408         042100     ELSE                                                         IF1264.2
   000409      1  042200                        MOVE  8848.934  TO CORRECT-N              IF1264.2 85
   000410      1  042300                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000411      1  042400                        PERFORM FAIL.                             IF1264.2 208
   000412         042500     GO TO F-NUMVALC-WRITE-06.                                    IF1264.2 416
   000413         042600 F-NUMVALC-DELETE-06.                                             IF1264.2
   000414         042700     PERFORM  DE-LETE.                                            IF1264.2 209
   000415         042800     GO TO    F-NUMVALC-WRITE-06.                                 IF1264.2 416
   000416         042900 F-NUMVALC-WRITE-06.                                              IF1264.2
   000417         043000     MOVE "F-NUMVALC-06" TO PAR-NAME.                             IF1264.2 59
   000418         043100     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000419         043300 F-NUMVALC-07.                                                    IF1264.2
   000420         043400     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000421         043500 F-NUMVALC-TEST-07.                                               IF1264.2
   000422         043600     COMPUTE TEMP = FUNCTION NUMVAL-C ("+394.2  ").               IF1264.2 49 IFN
   000423         043700     IF (TEMP >= 394.192) AND                                     IF1264.2 49
   000424         043800        (TEMP <= 394.208)                                         IF1264.2 49
   000425      1  043900                        PERFORM PASS                              IF1264.2 207
   000426         044000     ELSE                                                         IF1264.2
   000427      1  044100                        MOVE  394.2  TO CORRECT-N                 IF1264.2 85
   000428      1  044200                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000429      1  044300                        PERFORM FAIL.                             IF1264.2 208
   000430         044400     GO TO F-NUMVALC-WRITE-07.                                    IF1264.2 434
   000431         044500 F-NUMVALC-DELETE-07.                                             IF1264.2
   000432         044600     PERFORM  DE-LETE.                                            IF1264.2 209
   000433         044700     GO TO    F-NUMVALC-WRITE-07.                                 IF1264.2 434
   000434         044800 F-NUMVALC-WRITE-07.                                              IF1264.2
   000435         044900     MOVE "F-NUMVALC-07" TO PAR-NAME.                             IF1264.2 59
   000436         045000     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000437         045200 F-NUMVALC-08.                                                    IF1264.2
   000438         045300     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000439         045400 F-NUMVALC-TEST-08.                                               IF1264.2
   000440         045500     COMPUTE TEMP = FUNCTION NUMVAL-C ("  939.83").               IF1264.2 49 IFN
   000441         045600     IF (TEMP >= 939.811) AND                                     IF1264.2 49
   000442         045700        (TEMP <= 939.849)                                         IF1264.2 49
   000443      1  045800                        PERFORM PASS                              IF1264.2 207
   000444         045900     ELSE                                                         IF1264.2
   000445      1  046000                        MOVE  939.83  TO CORRECT-N                IF1264.2 85
   000446      1  046100                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000447      1  046200                        PERFORM FAIL.                             IF1264.2 208
   000448         046300     GO TO F-NUMVALC-WRITE-08.                                    IF1264.2 452
   000449         046400 F-NUMVALC-DELETE-08.                                             IF1264.2
   000450         046500     PERFORM  DE-LETE.                                            IF1264.2 209
   000451         046600     GO TO    F-NUMVALC-WRITE-08.                                 IF1264.2 452
   000452         046700 F-NUMVALC-WRITE-08.                                              IF1264.2
   000453         046800     MOVE "F-NUMVALC-08" TO PAR-NAME.                             IF1264.2 59
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046900     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000455         047100 F-NUMVALC-09.                                                    IF1264.2
   000456         047200     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000457         047300 F-NUMVALC-TEST-09.                                               IF1264.2
   000458         047400     COMPUTE TEMP = FUNCTION NUMVAL-C ("  -  4929.0323").         IF1264.2 49 IFN
   000459         047500     IF (TEMP >= -4929.1309) AND                                  IF1264.2 49
   000460         047600        (TEMP <= -4928.9337)                                      IF1264.2 49
   000461      1  047700                        PERFORM PASS                              IF1264.2 207
   000462         047800     ELSE                                                         IF1264.2
   000463      1  047900                        MOVE  -4929.0323  TO CORRECT-N            IF1264.2 85
   000464      1  048000                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000465      1  048100                        PERFORM FAIL.                             IF1264.2 208
   000466         048200     GO TO F-NUMVALC-WRITE-09.                                    IF1264.2 470
   000467         048300 F-NUMVALC-DELETE-09.                                             IF1264.2
   000468         048400     PERFORM  DE-LETE.                                            IF1264.2 209
   000469         048500     GO TO    F-NUMVALC-WRITE-09.                                 IF1264.2 470
   000470         048600 F-NUMVALC-WRITE-09.                                              IF1264.2
   000471         048700     MOVE "F-NUMVALC-09" TO PAR-NAME.                             IF1264.2 59
   000472         048800     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000473         049000 F-NUMVALC-10.                                                    IF1264.2
   000474         049100     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000475         049200 F-NUMVALC-TEST-10.                                               IF1264.2
   000476         049300     COMPUTE TEMP = FUNCTION NUMVAL-C (K).                        IF1264.2 49 IFN 38
   000477         049400     IF (TEMP >= 4825197.41) AND                                  IF1264.2 49
   000478         049500        (TEMP <= 4825390.43)                                      IF1264.2 49
   000479      1  049600                        PERFORM PASS                              IF1264.2 207
   000480         049700     ELSE                                                         IF1264.2
   000481      1  049800                        MOVE  4825293.92  TO CORRECT-N            IF1264.2 85
   000482      1  049900                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000483      1  050000                        PERFORM FAIL.                             IF1264.2 208
   000484         050100     GO TO F-NUMVALC-WRITE-10.                                    IF1264.2 488
   000485         050200 F-NUMVALC-DELETE-10.                                             IF1264.2
   000486         050300     PERFORM  DE-LETE.                                            IF1264.2 209
   000487         050400     GO TO    F-NUMVALC-WRITE-10.                                 IF1264.2 488
   000488         050500 F-NUMVALC-WRITE-10.                                              IF1264.2
   000489         050600     MOVE "F-NUMVALC-10" TO PAR-NAME.                             IF1264.2 59
   000490         050700     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000491         050900 F-NUMVALC-11.                                                    IF1264.2
   000492         051000     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000493         051100 F-NUMVALC-TEST-11.                                               IF1264.2
   000494         051200     COMPUTE TEMP = FUNCTION NUMVAL-C (L).                        IF1264.2 49 IFN 39
   000495         051300     IF (TEMP >= -5555.66) AND                                    IF1264.2 49
   000496         051400        (TEMP <= -5555.44)                                        IF1264.2 49
   000497      1  051500                        PERFORM PASS                              IF1264.2 207
   000498         051600     ELSE                                                         IF1264.2
   000499      1  051700                        MOVE  -5555.55  TO CORRECT-N              IF1264.2 85
   000500      1  051800                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000501      1  051900                        PERFORM FAIL.                             IF1264.2 208
   000502         052000     GO TO F-NUMVALC-WRITE-11.                                    IF1264.2 506
   000503         052100 F-NUMVALC-DELETE-11.                                             IF1264.2
   000504         052200     PERFORM  DE-LETE.                                            IF1264.2 209
   000505         052300     GO TO    F-NUMVALC-WRITE-11.                                 IF1264.2 506
   000506         052400 F-NUMVALC-WRITE-11.                                              IF1264.2
   000507         052500     MOVE "F-NUMVALC-11" TO PAR-NAME.                             IF1264.2 59
   000508         052600     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000509         052800 F-NUMVALC-12.                                                    IF1264.2
   000510         052900     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         053000 F-NUMVALC-TEST-12.                                               IF1264.2
   000512         053100     COMPUTE TEMP = FUNCTION NUMVAL-C ("82.9312+").               IF1264.2 49 IFN
   000513         053200     IF (TEMP >= 82.9295) AND                                     IF1264.2 49
   000514         053300        (TEMP <= 82.9329)                                         IF1264.2 49
   000515      1  053400                        PERFORM PASS                              IF1264.2 207
   000516         053500     ELSE                                                         IF1264.2
   000517      1  053600                        MOVE  82.9312  TO CORRECT-N               IF1264.2 85
   000518      1  053700                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000519      1  053800                        PERFORM FAIL.                             IF1264.2 208
   000520         053900     GO TO F-NUMVALC-WRITE-12.                                    IF1264.2 524
   000521         054000 F-NUMVALC-DELETE-12.                                             IF1264.2
   000522         054100     PERFORM  DE-LETE.                                            IF1264.2 209
   000523         054200     GO TO    F-NUMVALC-WRITE-12.                                 IF1264.2 524
   000524         054300 F-NUMVALC-WRITE-12.                                              IF1264.2
   000525         054400     MOVE "F-NUMVALC-12" TO PAR-NAME.                             IF1264.2 59
   000526         054500     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000527         054700 F-NUMVALC-13.                                                    IF1264.2
   000528         054800     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000529         054900 F-NUMVALC-TEST-13.                                               IF1264.2
   000530         055000     COMPUTE TEMP = FUNCTION NUMVAL-C (M).                        IF1264.2 49 IFN 40
   000531         055100     IF (TEMP >= -5555.66) AND                                    IF1264.2 49
   000532         055200        (TEMP <= -5555.44)                                        IF1264.2 49
   000533      1  055300                        PERFORM PASS                              IF1264.2 207
   000534         055400     ELSE                                                         IF1264.2
   000535      1  055500                        MOVE  -5555.55  TO CORRECT-N              IF1264.2 85
   000536      1  055600                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000537      1  055700                        PERFORM FAIL.                             IF1264.2 208
   000538         055800     GO TO F-NUMVALC-WRITE-13.                                    IF1264.2 542
   000539         055900 F-NUMVALC-DELETE-13.                                             IF1264.2
   000540         056000     PERFORM  DE-LETE.                                            IF1264.2 209
   000541         056100     GO TO    F-NUMVALC-WRITE-13.                                 IF1264.2 542
   000542         056200 F-NUMVALC-WRITE-13.                                              IF1264.2
   000543         056300     MOVE "F-NUMVALC-13" TO PAR-NAME.                             IF1264.2 59
   000544         056400     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000545         056600 F-NUMVALC-14.                                                    IF1264.2
   000546         056700     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000547         056800 F-NUMVALC-TEST-14.                                               IF1264.2
   000548         056900     COMPUTE TEMP = FUNCTION NUMVAL-C ("  200.0002  -  ").        IF1264.2 49 IFN
   000549         057000     IF (TEMP >= -200.0042) AND                                   IF1264.2 49
   000550         057100        (TEMP <= -199.9962)                                       IF1264.2 49
   000551      1  057200                        PERFORM PASS                              IF1264.2 207
   000552         057300     ELSE                                                         IF1264.2
   000553      1  057400                        MOVE  -200.0002  TO CORRECT-N             IF1264.2 85
   000554      1  057500                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000555      1  057600                        PERFORM FAIL.                             IF1264.2 208
   000556         057700     GO TO F-NUMVALC-WRITE-14.                                    IF1264.2 560
   000557         057800 F-NUMVALC-DELETE-14.                                             IF1264.2
   000558         057900     PERFORM  DE-LETE.                                            IF1264.2 209
   000559         058000     GO TO    F-NUMVALC-WRITE-14.                                 IF1264.2 560
   000560         058100 F-NUMVALC-WRITE-14.                                              IF1264.2
   000561         058200     MOVE "F-NUMVALC-14" TO PAR-NAME.                             IF1264.2 59
   000562         058300     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000563         058500 F-NUMVALC-15.                                                    IF1264.2
   000564         058600     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000565         058700 F-NUMVALC-TEST-15.                                               IF1264.2
   000566         058800     COMPUTE TEMP = FUNCTION NUMVAL-C (N).                        IF1264.2 49 IFN 41
   000567         058900     IF (TEMP >= 77776.21) AND                                    IF1264.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         059000        (TEMP <= 77779.33)                                        IF1264.2 49
   000569      1  059100                        PERFORM PASS                              IF1264.2 207
   000570         059200     ELSE                                                         IF1264.2
   000571      1  059300                        MOVE  77777.77  TO CORRECT-N              IF1264.2 85
   000572      1  059400                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000573      1  059500                        PERFORM FAIL.                             IF1264.2 208
   000574         059600     GO TO F-NUMVALC-WRITE-15.                                    IF1264.2 578
   000575         059700 F-NUMVALC-DELETE-15.                                             IF1264.2
   000576         059800     PERFORM  DE-LETE.                                            IF1264.2 209
   000577         059900     GO TO    F-NUMVALC-WRITE-15.                                 IF1264.2 578
   000578         060000 F-NUMVALC-WRITE-15.                                              IF1264.2
   000579         060100     MOVE "F-NUMVALC-15" TO PAR-NAME.                             IF1264.2 59
   000580         060200     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000581         060400 F-NUMVALC-16.                                                    IF1264.2
   000582         060500     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000583         060600 F-NUMVALC-TEST-16.                                               IF1264.2
   000584         060700     COMPUTE TEMP = FUNCTION NUMVAL-C ("$5", "$").                IF1264.2 49 IFN
   000585         060800     IF TEMP = 5 THEN                                             IF1264.2 49
   000586      1  060900                        PERFORM PASS                              IF1264.2 207
   000587         061000     ELSE                                                         IF1264.2
   000588      1  061100                        MOVE  5  TO CORRECT-N                     IF1264.2 85
   000589      1  061200                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000590      1  061300                        PERFORM FAIL.                             IF1264.2 208
   000591         061400     GO TO F-NUMVALC-WRITE-16.                                    IF1264.2 595
   000592         061500 F-NUMVALC-DELETE-16.                                             IF1264.2
   000593         061600     PERFORM  DE-LETE.                                            IF1264.2 209
   000594         061700     GO TO    F-NUMVALC-WRITE-16.                                 IF1264.2 595
   000595         061800 F-NUMVALC-WRITE-16.                                              IF1264.2
   000596         061900     MOVE "F-NUMVALC-16" TO PAR-NAME.                             IF1264.2 59
   000597         062000     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000598         062200 F-NUMVALC-17.                                                    IF1264.2
   000599         062300     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000600         062400 F-NUMVALC-TEST-17.                                               IF1264.2
   000601         062500     COMPUTE TEMP = FUNCTION NUMVAL-C (O, "$").                   IF1264.2 49 IFN 42
   000602         062600     IF TEMP = 33 THEN                                            IF1264.2 49
   000603      1  062700                        PERFORM PASS                              IF1264.2 207
   000604         062800     ELSE                                                         IF1264.2
   000605      1  062900                        MOVE  33  TO CORRECT-N                    IF1264.2 85
   000606      1  063000                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000607      1  063100                        PERFORM FAIL.                             IF1264.2 208
   000608         063200     GO TO F-NUMVALC-WRITE-17.                                    IF1264.2 612
   000609         063300 F-NUMVALC-DELETE-17.                                             IF1264.2
   000610         063400     PERFORM  DE-LETE.                                            IF1264.2 209
   000611         063500     GO TO    F-NUMVALC-WRITE-17.                                 IF1264.2 612
   000612         063600 F-NUMVALC-WRITE-17.                                              IF1264.2
   000613         063700     MOVE "F-NUMVALC-17" TO PAR-NAME.                             IF1264.2 59
   000614         063800     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000615         064000 F-NUMVALC-18.                                                    IF1264.2
   000616         064100     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000617         064200 F-NUMVALC-TEST-18.                                               IF1264.2
   000618         064300     COMPUTE TEMP = FUNCTION NUMVAL-C ("$93,021", "$").           IF1264.2 49 IFN
   000619         064400     IF TEMP = 93021 THEN                                         IF1264.2 49
   000620      1  064500                        PERFORM PASS                              IF1264.2 207
   000621         064600     ELSE                                                         IF1264.2
   000622      1  064700                        MOVE  93021  TO CORRECT-N                 IF1264.2 85
   000623      1  064800                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000624      1  064900                        PERFORM FAIL.                             IF1264.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         065000     GO TO F-NUMVALC-WRITE-18.                                    IF1264.2 629
   000626         065100 F-NUMVALC-DELETE-18.                                             IF1264.2
   000627         065200     PERFORM  DE-LETE.                                            IF1264.2 209
   000628         065300     GO TO    F-NUMVALC-WRITE-18.                                 IF1264.2 629
   000629         065400 F-NUMVALC-WRITE-18.                                              IF1264.2
   000630         065500     MOVE "F-NUMVALC-18" TO PAR-NAME.                             IF1264.2 59
   000631         065600     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000632         065800 F-NUMVALC-20.                                                    IF1264.2
   000633         065900     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000634         066000 F-NUMVALC-TEST-20.                                               IF1264.2
   000635         066100     COMPUTE TEMP = FUNCTION NUMVAL-C ("$924.93", "$").           IF1264.2 49 IFN
   000636         066200     IF (TEMP >= 924.912) AND                                     IF1264.2 49
   000637         066300        (TEMP <= 924.948)                                         IF1264.2 49
   000638      1  066400                        PERFORM PASS                              IF1264.2 207
   000639         066500     ELSE                                                         IF1264.2
   000640      1  066600                        MOVE  924.93  TO CORRECT-N                IF1264.2 85
   000641      1  066700                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000642      1  066800                        PERFORM FAIL.                             IF1264.2 208
   000643         066900     GO TO F-NUMVALC-WRITE-20.                                    IF1264.2 647
   000644         067000 F-NUMVALC-DELETE-20.                                             IF1264.2
   000645         067100     PERFORM  DE-LETE.                                            IF1264.2 209
   000646         067200     GO TO    F-NUMVALC-WRITE-20.                                 IF1264.2 647
   000647         067300 F-NUMVALC-WRITE-20.                                              IF1264.2
   000648         067400     MOVE "F-NUMVALC-20" TO PAR-NAME.                             IF1264.2 59
   000649         067500     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000650         067700 F-NUMVALC-21.                                                    IF1264.2
   000651         067800     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000652         067900 F-NUMVALC-TEST-21.                                               IF1264.2
   000653         068000     COMPUTE TEMP = FUNCTION NUMVAL-C (Q, "$").                   IF1264.2 49 IFN 44
   000654         068100     IF TEMP = 4000 THEN                                          IF1264.2 49
   000655      1  068200                        PERFORM PASS                              IF1264.2 207
   000656         068300     ELSE                                                         IF1264.2
   000657      1  068400                        MOVE  4000  TO CORRECT-N                  IF1264.2 85
   000658      1  068500                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000659      1  068600                        PERFORM FAIL.                             IF1264.2 208
   000660         068700     GO TO F-NUMVALC-WRITE-21.                                    IF1264.2 664
   000661         068800 F-NUMVALC-DELETE-21.                                             IF1264.2
   000662         068900     PERFORM  DE-LETE.                                            IF1264.2 209
   000663         069000     GO TO    F-NUMVALC-WRITE-21.                                 IF1264.2 664
   000664         069100 F-NUMVALC-WRITE-21.                                              IF1264.2
   000665         069200     MOVE "F-NUMVALC-21" TO PAR-NAME.                             IF1264.2 59
   000666         069300     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000667         069500 F-NUMVALC-22.                                                    IF1264.2
   000668         069600     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000669         069700 F-NUMVALC-TEST-22.                                               IF1264.2
   000670         069800     COMPUTE TEMP = FUNCTION NUMVAL-C ("-$34.03", "$").           IF1264.2 49 IFN
   000671         069900     IF (TEMP >= -34.0307) AND                                    IF1264.2 49
   000672         070000        (TEMP <= -34.0293)                                        IF1264.2 49
   000673      1  070100                        PERFORM PASS                              IF1264.2 207
   000674         070200     ELSE                                                         IF1264.2
   000675      1  070300                        MOVE  -34.03  TO CORRECT-N                IF1264.2 85
   000676      1  070400                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000677      1  070500                        PERFORM FAIL.                             IF1264.2 208
   000678         070600     GO TO F-NUMVALC-WRITE-22.                                    IF1264.2 682
   000679         070700 F-NUMVALC-DELETE-22.                                             IF1264.2
   000680         070800     PERFORM  DE-LETE.                                            IF1264.2 209
   000681         070900     GO TO    F-NUMVALC-WRITE-22.                                 IF1264.2 682
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         071000 F-NUMVALC-WRITE-22.                                              IF1264.2
   000683         071100     MOVE "F-NUMVALC-22" TO PAR-NAME.                             IF1264.2 59
   000684         071200     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000685         071400 F-NUMVALC-23.                                                    IF1264.2
   000686         071500     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000687         071600 F-NUMVALC-TEST-23.                                               IF1264.2
   000688         071700     COMPUTE TEMP = FUNCTION NUMVAL-C (R, "$").                   IF1264.2 49 IFN 45
   000689         071800     IF (TEMP >= 999980.5) AND                                    IF1264.2 49
   000690         071900        (TEMP <= 1000020.5)                                       IF1264.2 49
   000691      1  072000                        PERFORM PASS                              IF1264.2 207
   000692         072100     ELSE                                                         IF1264.2
   000693      1  072200                        MOVE  1000000.5  TO CORRECT-N             IF1264.2 85
   000694      1  072300                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000695      1  072400                        PERFORM FAIL.                             IF1264.2 208
   000696         072500     GO TO F-NUMVALC-WRITE-23.                                    IF1264.2 700
   000697         072600 F-NUMVALC-DELETE-23.                                             IF1264.2
   000698         072700     PERFORM  DE-LETE.                                            IF1264.2 209
   000699         072800     GO TO    F-NUMVALC-WRITE-23.                                 IF1264.2 700
   000700         072900 F-NUMVALC-WRITE-23.                                              IF1264.2
   000701         073000     MOVE "F-NUMVALC-23" TO PAR-NAME.                             IF1264.2 59
   000702         073100     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000703         073300 F-NUMVALC-24.                                                    IF1264.2
   000704         073400     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000705         073500 F-NUMVALC-TEST-24.                                               IF1264.2
   000706         073600     COMPUTE TEMP = FUNCTION NUMVAL-C ("  $  89.01", "$").        IF1264.2 49 IFN
   000707         073700     IF (TEMP >= 89.0082) AND                                     IF1264.2 49
   000708         073800        (TEMP <= 89.0118)                                         IF1264.2 49
   000709      1  073900                        PERFORM PASS                              IF1264.2 207
   000710         074000     ELSE                                                         IF1264.2
   000711      1  074100                        MOVE  89.01  TO CORRECT-N                 IF1264.2 85
   000712      1  074200                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000713      1  074300                        PERFORM FAIL.                             IF1264.2 208
   000714         074400     GO TO F-NUMVALC-WRITE-24.                                    IF1264.2 718
   000715         074500 F-NUMVALC-DELETE-24.                                             IF1264.2
   000716         074600     PERFORM  DE-LETE.                                            IF1264.2 209
   000717         074700     GO TO    F-NUMVALC-WRITE-24.                                 IF1264.2 718
   000718         074800 F-NUMVALC-WRITE-24.                                              IF1264.2
   000719         074900     MOVE "F-NUMVALC-24" TO PAR-NAME.                             IF1264.2 59
   000720         075000     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000721         075200 F-NUMVALC-25.                                                    IF1264.2
   000722         075300     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000723         075400 F-NUMVALC-TEST-25.                                               IF1264.2
   000724         075500     COMPUTE TEMP = FUNCTION NUMVAL-C (S, "$").                   IF1264.2 49 IFN 46
   000725         075600     IF (TEMP >= 3900.13) AND                                     IF1264.2 49
   000726         075700        (TEMP <= 3900.29)                                         IF1264.2 49
   000727      1  075800                        PERFORM PASS                              IF1264.2 207
   000728         075900     ELSE                                                         IF1264.2
   000729      1  076000                        MOVE  3900.21  TO CORRECT-N               IF1264.2 85
   000730      1  076100                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000731      1  076200                        PERFORM FAIL.                             IF1264.2 208
   000732         076300     GO TO F-NUMVALC-WRITE-25.                                    IF1264.2 736
   000733         076400 F-NUMVALC-DELETE-25.                                             IF1264.2
   000734         076500     PERFORM  DE-LETE.                                            IF1264.2 209
   000735         076600     GO TO    F-NUMVALC-WRITE-25.                                 IF1264.2 736
   000736         076700 F-NUMVALC-WRITE-25.                                              IF1264.2
   000737         076800     MOVE "F-NUMVALC-25" TO PAR-NAME.                             IF1264.2 59
   000738         076900     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         077100 F-NUMVALC-26.                                                    IF1264.2
   000740         077200     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000741         077300 F-NUMVALC-TEST-26.                                               IF1264.2
   000742         077400     COMPUTE TEMP = FUNCTION NUMVAL-C ("- $ 890.21", "$").        IF1264.2 49 IFN
   000743         077500     IF (TEMP >= -890.228) AND                                    IF1264.2 49
   000744         077600        (TEMP <= -890.192)                                        IF1264.2 49
   000745      1  077700                        PERFORM PASS                              IF1264.2 207
   000746         077800     ELSE                                                         IF1264.2
   000747      1  077900                        MOVE  -890.21  TO CORRECT-N               IF1264.2 85
   000748      1  078000                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000749      1  078100                        PERFORM FAIL.                             IF1264.2 208
   000750         078200     GO TO F-NUMVALC-WRITE-26.                                    IF1264.2 754
   000751         078300 F-NUMVALC-DELETE-26.                                             IF1264.2
   000752         078400     PERFORM  DE-LETE.                                            IF1264.2 209
   000753         078500     GO TO    F-NUMVALC-WRITE-26.                                 IF1264.2 754
   000754         078600 F-NUMVALC-WRITE-26.                                              IF1264.2
   000755         078700     MOVE "F-NUMVALC-26" TO PAR-NAME.                             IF1264.2 59
   000756         078800     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000757         079000 F-NUMVALC-27.                                                    IF1264.2
   000758         079100     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000759         079200 F-NUMVALC-TEST-27.                                               IF1264.2
   000760         079300     COMPUTE TEMP = FUNCTION NUMVAL-C (T, "$").                   IF1264.2 49 IFN 47
   000761         079400     IF (TEMP >= 9000.81) AND                                     IF1264.2 49
   000762         079500        (TEMP <= 9001.17)                                         IF1264.2 49
   000763      1  079600                        PERFORM PASS                              IF1264.2 207
   000764         079700     ELSE                                                         IF1264.2
   000765      1  079800                        MOVE  9000.99  TO CORRECT-N               IF1264.2 85
   000766      1  079900                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000767      1  080000                        PERFORM FAIL.                             IF1264.2 208
   000768         080100     GO TO F-NUMVALC-WRITE-27.                                    IF1264.2 772
   000769         080200 F-NUMVALC-DELETE-27.                                             IF1264.2
   000770         080300     PERFORM  DE-LETE.                                            IF1264.2 209
   000771         080400     GO TO    F-NUMVALC-WRITE-27.                                 IF1264.2 772
   000772         080500 F-NUMVALC-WRITE-27.                                              IF1264.2
   000773         080600     MOVE "F-NUMVALC-27" TO PAR-NAME.                             IF1264.2 59
   000774         080700     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000775         080900 F-NUMVALC-28.                                                    IF1264.2
   000776         081000     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000777         081100 F-NUMVALC-TEST-28.                                               IF1264.2
   000778         081200     COMPUTE TEMP = FUNCTION NUMVAL-C ("  $  90.54 -  ", "$").    IF1264.2 49 IFN
   000779         081300     IF (TEMP >= -90.5418) AND                                    IF1264.2 49
   000780         081400        (TEMP <= -90.5382)                                        IF1264.2 49
   000781      1  081500                        PERFORM PASS                              IF1264.2 207
   000782         081600     ELSE                                                         IF1264.2
   000783      1  081700                        MOVE  -90.54  TO CORRECT-N                IF1264.2 85
   000784      1  081800                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000785      1  081900                        PERFORM FAIL.                             IF1264.2 208
   000786         082000     GO TO F-NUMVALC-WRITE-28.                                    IF1264.2 790
   000787         082100 F-NUMVALC-DELETE-28.                                             IF1264.2
   000788         082200     PERFORM  DE-LETE.                                            IF1264.2 209
   000789         082300     GO TO    F-NUMVALC-WRITE-28.                                 IF1264.2 790
   000790         082400 F-NUMVALC-WRITE-28.                                              IF1264.2
   000791         082500     MOVE "F-NUMVALC-28" TO PAR-NAME.                             IF1264.2 59
   000792         082600     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000793         082800 F-NUMVALC-29.                                                    IF1264.2
   000794         082900     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000795         083000 F-NUMVALC-TEST-29.                                               IF1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         083100     COMPUTE TEMP = FUNCTION NUMVAL-C (U, "$").                   IF1264.2 49 IFN 48
   000797         083200     IF (TEMP >= 3890.12) AND                                     IF1264.2 49
   000798         083300        (TEMP <= 3890.28)                                         IF1264.2 49
   000799      1  083400                        PERFORM PASS                              IF1264.2 207
   000800         083500     ELSE                                                         IF1264.2
   000801      1  083600                        MOVE  3890.2  TO CORRECT-N                IF1264.2 85
   000802      1  083700                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000803      1  083800                        PERFORM FAIL.                             IF1264.2 208
   000804         083900     GO TO F-NUMVALC-WRITE-29.                                    IF1264.2 808
   000805         084000 F-NUMVALC-DELETE-29.                                             IF1264.2
   000806         084100     PERFORM  DE-LETE.                                            IF1264.2 209
   000807         084200     GO TO    F-NUMVALC-WRITE-29.                                 IF1264.2 808
   000808         084300 F-NUMVALC-WRITE-29.                                              IF1264.2
   000809         084400     MOVE "F-NUMVALC-29" TO PAR-NAME.                             IF1264.2 59
   000810         084500     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000811         084700 F-NUMVALC-30.                                                    IF1264.2
   000812         084800     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000813         084900 F-NUMVALC-TEST-30.                                               IF1264.2
   000814         085000     COMPUTE TEMP = FUNCTION NUMVAL-C ("90") + 10.                IF1264.2 49 IFN
   000815         085100     IF TEMP = 100 THEN                                           IF1264.2 49
   000816      1  085200                        PERFORM PASS                              IF1264.2 207
   000817         085300     ELSE                                                         IF1264.2
   000818      1  085400                        MOVE  100  TO CORRECT-N                   IF1264.2 85
   000819      1  085500                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000820      1  085600                        PERFORM FAIL.                             IF1264.2 208
   000821         085700     GO TO F-NUMVALC-WRITE-30.                                    IF1264.2 825
   000822         085800 F-NUMVALC-DELETE-30.                                             IF1264.2
   000823         085900     PERFORM  DE-LETE.                                            IF1264.2 209
   000824         086000     GO TO    F-NUMVALC-WRITE-30.                                 IF1264.2 825
   000825         086100 F-NUMVALC-WRITE-30.                                              IF1264.2
   000826         086200     MOVE "F-NUMVALC-30" TO PAR-NAME.                             IF1264.2 59
   000827         086300     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000828         086500 F-NUMVALC-31.                                                    IF1264.2
   000829         086600     MOVE ZERO TO TEMP.                                           IF1264.2 IMP 49
   000830         086700 F-NUMVALC-TEST-31.                                               IF1264.2
   000831         086800     COMPUTE TEMP = FUNCTION NUMVAL-C ("2") +                     IF1264.2 49 IFN
   000832         086900                    FUNCTION NUMVAL-C ("8").                      IF1264.2 IFN
   000833         087000     IF TEMP = 10 THEN                                            IF1264.2 49
   000834      1  087100                        PERFORM PASS                              IF1264.2 207
   000835         087200     ELSE                                                         IF1264.2
   000836      1  087300                        MOVE  10  TO CORRECT-N                    IF1264.2 85
   000837      1  087400                        MOVE TEMP TO COMPUTED-N                   IF1264.2 49 71
   000838      1  087500                        PERFORM FAIL.                             IF1264.2 208
   000839         087600     GO TO F-NUMVALC-WRITE-31.                                    IF1264.2 843
   000840         087700 F-NUMVALC-DELETE-31.                                             IF1264.2
   000841         087800     PERFORM  DE-LETE.                                            IF1264.2 209
   000842         087900     GO TO    F-NUMVALC-WRITE-31.                                 IF1264.2 843
   000843         088000 F-NUMVALC-WRITE-31.                                              IF1264.2
   000844         088100     MOVE "F-NUMVALC-31" TO PAR-NAME.                             IF1264.2 59
   000845         088200     PERFORM  PRINT-DETAIL.                                       IF1264.2 211
   000846         088400 CCVS-EXIT SECTION.                                               IF1264.2
   000847         088500 CCVS-999999.                                                     IF1264.2
   000848         088600     GO TO CLOSE-FILES.                                           IF1264.2 202
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    18
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       28   A
      115   ANSI-REFERENCE . . . . . . . .  289 296 306 M317
       29   B. . . . . . . . . . . . . . .  339
       30   C. . . . . . . . . . . . . . .  368
       94   CCVS-C-1 . . . . . . . . . . .  229 274
       99   CCVS-C-2 . . . . . . . . . . .  230 275
      149   CCVS-E-1 . . . . . . . . . . .  235
      154   CCVS-E-2 . . . . . . . . . . .  243 250 257 262
      157   CCVS-E-2-2 . . . . . . . . . .  M242
      162   CCVS-E-3 . . . . . . . . . . .  263
      171   CCVS-E-4 . . . . . . . . . . .  242
      172   CCVS-E-4-1 . . . . . . . . . .  M240
      174   CCVS-E-4-2 . . . . . . . . . .  M241
      116   CCVS-H-1 . . . . . . . . . . .  224 270
      121   CCVS-H-2A. . . . . . . . . . .  225 271
      130   CCVS-H-2B. . . . . . . . . . .  226 272
      142   CCVS-H-3 . . . . . . . . . . .  227 273
      192   CCVS-PGM-ID. . . . . . . . . .  198 198
       76   CM-18V0
       70   COMPUTED-A . . . . . . . . . .  71 73 74 75 76 301 305
       71   COMPUTED-N . . . . . . . . . .  M327 M374 M392 M410 M428 M446 M464 M482 M500 M518 M536 M554 M572 M589 M606 M623
                                            M641 M658 M676 M694 M712 M730 M748 M766 M784 M802 M819 M837
       69   COMPUTED-X . . . . . . . . . .  M219 286
       73   COMPUTED-0V18
       75   COMPUTED-14V4
       77   COMPUTED-18V0
       74   COMPUTED-4V14
       93   COR-ANSI-REFERENCE . . . . . .  M296 M298
       84   CORRECT-A. . . . . . . . . . .  85 86 87 88 89 302 304
       85   CORRECT-N. . . . . . . . . . .  M326 M373 M391 M409 M427 M445 M463 M481 M499 M517 M535 M553 M571 M588 M605 M622
                                            M640 M657 M675 M693 M711 M729 M747 M765 M783 M801 M818 M836
       83   CORRECT-X. . . . . . . . . . .  M220 288
       86   CORRECT-0V18
       88   CORRECT-14V4
       90   CORRECT-18V0
       87   CORRECT-4V14
       89   CR-18V0
       31   D
      107   DELETE-COUNTER . . . . . . . .  M209 238 253 255
       62   DOTVALUE . . . . . . . . . . .  M214
      113   DUMMY-HOLD . . . . . . . . . .  M267 277
       25   DUMMY-RECORD . . . . . . . . .  M224 M225 M226 M227 M229 M230 M231 M233 M235 M243 M250 M257 M262 M263 267 M268
                                            269 M270 M271 M272 M273 M274 M275 M276 M277 281 M282 M291 M307
       32   E
      160   ENDER-DESC . . . . . . . . . .  M245 M256 M261
      108   ERROR-COUNTER. . . . . . . . .  M208 237 246 249
      112   ERROR-HOLD . . . . . . . . . .  M237 M238 M238 M239 241
      158   ERROR-TOTAL. . . . . . . . . .  M247 M249 M254 M255 M259 M260
       33   F
       55   FEATURE. . . . . . . . . . . .  M318
       34   G
       35   H
      186   HYPHEN-LINE. . . . . . . . . .  231 233 276
       36   I
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    19
0 Defined   Cross-reference of data names   References

0     152   ID-AGAIN . . . . . . . . . . .  M198
      185   INF-ANSI-REFERENCE . . . . . .  M289 M292 M306 M308
      180   INFO-TEXT. . . . . . . . . . .  M290
      109   INSPECT-COUNTER. . . . . . . .  M206 237 258 260
       37   J. . . . . . . . . . . . . . .  404
       38   K. . . . . . . . . . . . . . .  476
       39   L. . . . . . . . . . . . . . .  494
       40   M. . . . . . . . . . . . . . .  530
       41   N. . . . . . . . . . . . . . .  566
       42   O. . . . . . . . . . . . . . .  601
       43   P
       57   P-OR-F . . . . . . . . . . . .  M206 M207 M208 M209 216 M219
       59   PAR-NAME . . . . . . . . . . .  M221 M334 M351 M363 M381 M399 M417 M435 M453 M471 M489 M507 M525 M543 M561 M579
                                            M596 M613 M630 M648 M665 M683 M701 M719 M737 M755 M773 M791 M809 M826 M844
       61   PARDOT-X . . . . . . . . . . .  M213
      110   PASS-COUNTER . . . . . . . . .  M207 239 240
       23   PRINT-FILE . . . . . . . . . .  19 197 203
       24   PRINT-REC. . . . . . . . . . .  M215 M295 M297
       44   Q. . . . . . . . . . . . . . .  653
       45   R. . . . . . . . . . . . . . .  688
       64   RE-MARK. . . . . . . . . . . .  M210 M222
      106   REC-CT . . . . . . . . . . . .  212 214 221
      105   REC-SKL-SUB
      114   RECORD-COUNT . . . . . . . . .  M265 266 M278
       46   S. . . . . . . . . . . . . . .  724
       47   T. . . . . . . . . . . . . . .  760
       49   TEMP . . . . . . . . . . . . .  M320 M322 323 327 M337 340 M366 M368 369 370 374 M384 M386 387 388 392 M402 M404
                                            405 406 410 M420 M422 423 424 428 M438 M440 441 442 446 M456 M458 459 460 464
                                            M474 M476 477 478 482 M492 M494 495 496 500 M510 M512 513 514 518 M528 M530 531
                                            532 536 M546 M548 549 550 554 M564 M566 567 568 572 M582 M584 585 589 M599 M601
                                            602 606 M616 M618 619 623 M633 M635 636 637 641 M651 M653 654 658 M668 M670 671
                                            672 676 M686 M688 689 690 694 M704 M706 707 708 712 M722 M724 725 726 730 M740
                                            M742 743 744 748 M758 M760 761 762 766 M776 M778 779 780 784 M794 M796 797 798
                                            802 M812 M814 815 819 M829 M831 833 837
       65   TEST-COMPUTED. . . . . . . . .  295
       80   TEST-CORRECT . . . . . . . . .  297
      133   TEST-ID. . . . . . . . . . . .  M198
       53   TEST-RESULTS . . . . . . . . .  M199 215
      111   TOTAL-ERROR
       48   U. . . . . . . . . . . . . . .  796
      182   XXCOMPUTED . . . . . . . . . .  M305
      184   XXCORRECT. . . . . . . . . . .  M304
      177   XXINFO . . . . . . . . . . . .  291 307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    20
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

      300   BAIL-OUT . . . . . . . . . . .  P218
      309   BAIL-OUT-EX. . . . . . . . . .  E218 G302
      303   BAIL-OUT-WRITE . . . . . . . .  G301
      283   BLANK-LINE-PRINT
      846   CCVS-EXIT
      847   CCVS-999999
      195   CCVS1
      310   CCVS1-EXIT . . . . . . . . . .  G201
      202   CLOSE-FILES. . . . . . . . . .  G848
      228   COLUMN-NAMES-ROUTINE . . . . .  E200
      209   DE-LETE. . . . . . . . . . . .  P331 P348 P360 P378 P396 P414 P432 P450 P468 P486 P504 P522 P540 P558 P576 P593
                                            P610 P627 P645 P662 P680 P698 P716 P734 P752 P770 P788 P806 P823 P841
      232   END-ROUTINE. . . . . . . . . .  P203
      236   END-ROUTINE-1
      244   END-ROUTINE-12
      252   END-ROUTINE-13 . . . . . . . .  E203
      234   END-RTN-EXIT
      330   F-NUMVALC-DELETE-01
      347   F-NUMVALC-DELETE-02
      359   F-NUMVALC-DELETE-03
      377   F-NUMVALC-DELETE-04
      395   F-NUMVALC-DELETE-05
      413   F-NUMVALC-DELETE-06
      431   F-NUMVALC-DELETE-07
      449   F-NUMVALC-DELETE-08
      467   F-NUMVALC-DELETE-09
      485   F-NUMVALC-DELETE-10
      503   F-NUMVALC-DELETE-11
      521   F-NUMVALC-DELETE-12
      539   F-NUMVALC-DELETE-13
      557   F-NUMVALC-DELETE-14
      575   F-NUMVALC-DELETE-15
      592   F-NUMVALC-DELETE-16
      609   F-NUMVALC-DELETE-17
      626   F-NUMVALC-DELETE-18
      644   F-NUMVALC-DELETE-20
      661   F-NUMVALC-DELETE-21
      679   F-NUMVALC-DELETE-22
      697   F-NUMVALC-DELETE-23
      715   F-NUMVALC-DELETE-24
      733   F-NUMVALC-DELETE-25
      751   F-NUMVALC-DELETE-26
      769   F-NUMVALC-DELETE-27
      787   F-NUMVALC-DELETE-28
      805   F-NUMVALC-DELETE-29
      822   F-NUMVALC-DELETE-30
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    21
0 Defined   Cross-reference of procedures   References

0     840   F-NUMVALC-DELETE-31
      316   F-NUMVALC-INFO
      321   F-NUMVALC-TEST-01
      338   F-NUMVALC-TEST-02
      353   F-NUMVALC-TEST-03
      367   F-NUMVALC-TEST-04
      385   F-NUMVALC-TEST-05
      403   F-NUMVALC-TEST-06
      421   F-NUMVALC-TEST-07
      439   F-NUMVALC-TEST-08
      457   F-NUMVALC-TEST-09
      475   F-NUMVALC-TEST-10
      493   F-NUMVALC-TEST-11
      511   F-NUMVALC-TEST-12
      529   F-NUMVALC-TEST-13
      547   F-NUMVALC-TEST-14
      565   F-NUMVALC-TEST-15
      583   F-NUMVALC-TEST-16
      600   F-NUMVALC-TEST-17
      617   F-NUMVALC-TEST-18
      634   F-NUMVALC-TEST-20
      652   F-NUMVALC-TEST-21
      669   F-NUMVALC-TEST-22
      687   F-NUMVALC-TEST-23
      705   F-NUMVALC-TEST-24
      723   F-NUMVALC-TEST-25
      741   F-NUMVALC-TEST-26
      759   F-NUMVALC-TEST-27
      777   F-NUMVALC-TEST-28
      795   F-NUMVALC-TEST-29
      813   F-NUMVALC-TEST-30
      830   F-NUMVALC-TEST-31
      333   F-NUMVALC-WRITE-01 . . . . . .  G329 G332
      350   F-NUMVALC-WRITE-02 . . . . . .  G344 G346 G349
      362   F-NUMVALC-WRITE-03 . . . . . .  G358 G361
      380   F-NUMVALC-WRITE-04 . . . . . .  G376 G379
      398   F-NUMVALC-WRITE-05 . . . . . .  G394 G397
      416   F-NUMVALC-WRITE-06 . . . . . .  G412 G415
      434   F-NUMVALC-WRITE-07 . . . . . .  G430 G433
      452   F-NUMVALC-WRITE-08 . . . . . .  G448 G451
      470   F-NUMVALC-WRITE-09 . . . . . .  G466 G469
      488   F-NUMVALC-WRITE-10 . . . . . .  G484 G487
      506   F-NUMVALC-WRITE-11 . . . . . .  G502 G505
      524   F-NUMVALC-WRITE-12 . . . . . .  G520 G523
      542   F-NUMVALC-WRITE-13 . . . . . .  G538 G541
      560   F-NUMVALC-WRITE-14 . . . . . .  G556 G559
      578   F-NUMVALC-WRITE-15 . . . . . .  G574 G577
      595   F-NUMVALC-WRITE-16 . . . . . .  G591 G594
      612   F-NUMVALC-WRITE-17 . . . . . .  G608 G611
      629   F-NUMVALC-WRITE-18 . . . . . .  G625 G628
      647   F-NUMVALC-WRITE-20 . . . . . .  G643 G646
      664   F-NUMVALC-WRITE-21 . . . . . .  G660 G663
      682   F-NUMVALC-WRITE-22 . . . . . .  G678 G681
      700   F-NUMVALC-WRITE-23 . . . . . .  G696 G699
      718   F-NUMVALC-WRITE-24 . . . . . .  G714 G717
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    22
0 Defined   Cross-reference of procedures   References

0     736   F-NUMVALC-WRITE-25 . . . . . .  G732 G735
      754   F-NUMVALC-WRITE-26 . . . . . .  G750 G753
      772   F-NUMVALC-WRITE-27 . . . . . .  G768 G771
      790   F-NUMVALC-WRITE-28 . . . . . .  G786 G789
      808   F-NUMVALC-WRITE-29 . . . . . .  G804 G807
      825   F-NUMVALC-WRITE-30 . . . . . .  G821 G824
      843   F-NUMVALC-WRITE-31 . . . . . .  G839 G842
      319   F-NUMVALC-01
      336   F-NUMVALC-02
      365   F-NUMVALC-04
      383   F-NUMVALC-05
      401   F-NUMVALC-06
      419   F-NUMVALC-07
      437   F-NUMVALC-08
      455   F-NUMVALC-09
      473   F-NUMVALC-10
      491   F-NUMVALC-11
      509   F-NUMVALC-12
      527   F-NUMVALC-13
      545   F-NUMVALC-14
      563   F-NUMVALC-15
      581   F-NUMVALC-16
      598   F-NUMVALC-17
      615   F-NUMVALC-18
      632   F-NUMVALC-20
      650   F-NUMVALC-21
      667   F-NUMVALC-22
      685   F-NUMVALC-23
      703   F-NUMVALC-24
      721   F-NUMVALC-25
      739   F-NUMVALC-26
      757   F-NUMVALC-27
      775   F-NUMVALC-28
      793   F-NUMVALC-29
      811   F-NUMVALC-30
      828   F-NUMVALC-31
      208   FAIL . . . . . . . . . . . . .  P328 P345 P357 P375 P393 P411 P429 P447 P465 P483 P501 P519 P537 P555 P573 P590
                                            P607 P624 P642 P659 P677 P695 P713 P731 P749 P767 P785 P803 P820 P838
      285   FAIL-ROUTINE . . . . . . . . .  P217
      299   FAIL-ROUTINE-EX. . . . . . . .  E217 G293
      294   FAIL-ROUTINE-WRITE . . . . . .  G287 G288
      223   HEAD-ROUTINE . . . . . . . . .  P200
      206   INSPT
      196   OPEN-FILES
      207   PASS . . . . . . . . . . . . .  P324 P343 P355 P371 P389 P407 P425 P443 P461 P479 P497 P515 P533 P551 P569 P586
                                            P603 P620 P638 P655 P673 P691 P709 P727 P745 P763 P781 P799 P816 P834
      211   PRINT-DETAIL . . . . . . . . .  P335 P352 P364 P382 P400 P418 P436 P454 P472 P490 P508 P526 P544 P562 P580 P597
                                            P614 P631 P649 P666 P684 P702 P720 P738 P756 P774 P792 P810 P827 P845
      315   SECT-IF126A
      204   TERMINATE-CCVS
      264   WRITE-LINE . . . . . . . . . .  P215 P216 P224 P225 P226 P227 P229 P230 P231 P233 P235 P243 P251 P257 P262 P263
                                            P291 P295 P297 P307
      280   WRT-LN . . . . . . . . . . . .  P270 P271 P272 P273 P274 P275 P276 P279 P284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    23
0 Defined   Cross-reference of programs     References

        3   IF126A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF126A    Date 06/04/2022  Time 12:00:20   Page    24
0LineID  Message code  Message text

     23  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF126A:
 *    Source records = 848
 *    Data Division statements = 85
 *    Procedure Division statements = 491
 *    Generated COBOL statements = 0
 *    Program complexity factor = 502
0End of compilation 1,  program IF126A,  highest severity 0.
0Return code 0
