1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:17   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:17   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1254.2
   000002         000200 PROGRAM-ID.                                                      IF1254.2
   000003         000300     IF125A.                                                      IF1254.2
   000004         000400                                                                  IF1254.2
   000005         000600*                                                         *       IF1254.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1254.2
   000007         000800* It contains tests for the Intrinsic Function NUMVAL.    *       IF1254.2
   000008         000900*                                                         *       IF1254.2
   000009         001000*                                                         *       IF1254.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1254.2
   000011         001300 CONFIGURATION SECTION.                                           IF1254.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1254.2
   000013         001500     XXXXX082.                                                    IF1254.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1254.2
   000015         001700     XXXXX083.                                                    IF1254.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1254.2
   000017         001900 FILE-CONTROL.                                                    IF1254.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1254.2 22
   000019         002100     XXXXX055.                                                    IF1254.2
   000020         002200 DATA DIVISION.                                                   IF1254.2
   000021         002300 FILE SECTION.                                                    IF1254.2
   000022         002400 FD  PRINT-FILE.                                                  IF1254.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1254.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1254.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1254.2
   000026         002900* Variables specific to the Intrinsic Function Test IF125A*       IF1254.2
   000027         003100 01  A                   PIC X(1)       VALUE "4".                IF1254.2
   000028         003200 01  B                   PIC X(5)       VALUE "203".              IF1254.2
   000029         003300 01  C                   PIC X(4)       VALUE ".429".             IF1254.2
   000030         003400 01  D                   PIC X(7)       VALUE "928.344".          IF1254.2
   000031         003500 01  E                   PIC X(9)       VALUE "-042.3240".        IF1254.2
   000032         003600 01  F                   PIC X(7)       VALUE " 23.000".          IF1254.2
   000033         003700 01  G                   PIC X(8)       VALUE "-92924.3".         IF1254.2
   000034         003800 01  H                   PIC X(6)       VALUE "93.21+".           IF1254.2
   000035         003900 01  I                   PIC X(9)       VALUE " 92.92  -".        IF1254.2
   000036         004000 01  TEMP                PIC S9(5)V9(5).                          IF1254.2
   000037         004100                                                                  IF1254.2
   000038         004200*                                                                 IF1254.2
   000039         004400*                                                                 IF1254.2
   000040         004500 01  TEST-RESULTS.                                                IF1254.2
   000041         004600     02 FILLER                   PIC X      VALUE SPACE.          IF1254.2 IMP
   000042         004700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1254.2 IMP
   000043         004800     02 FILLER                   PIC X      VALUE SPACE.          IF1254.2 IMP
   000044         004900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1254.2 IMP
   000045         005000     02 FILLER                   PIC X      VALUE SPACE.          IF1254.2 IMP
   000046         005100     02  PAR-NAME.                                                IF1254.2
   000047         005200       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1254.2 IMP
   000048         005300       03  PARDOT-X              PIC X      VALUE SPACE.          IF1254.2 IMP
   000049         005400       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1254.2 IMP
   000050         005500     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1254.2 IMP
   000051         005600     02 RE-MARK                  PIC X(61).                       IF1254.2
   000052         005700 01  TEST-COMPUTED.                                               IF1254.2
   000053         005800     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1254.2 IMP
   000054         005900     02 FILLER                   PIC X(17)  VALUE                 IF1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000            "       COMPUTED=".                                   IF1254.2
   000056         006100     02 COMPUTED-X.                                               IF1254.2
   000057         006200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1254.2 IMP
   000058         006300     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1254.2 57
   000059         006400                                 PIC -9(9).9(9).                  IF1254.2
   000060         006500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1254.2 57
   000061         006600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1254.2 57
   000062         006700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1254.2 57
   000063         006800     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1254.2 57
   000064         006900         04 COMPUTED-18V0                    PIC -9(18).          IF1254.2
   000065         007000         04 FILLER                           PIC X.               IF1254.2
   000066         007100     03 FILLER PIC X(50) VALUE SPACE.                             IF1254.2 IMP
   000067         007200 01  TEST-CORRECT.                                                IF1254.2
   000068         007300     02 FILLER PIC X(30) VALUE SPACE.                             IF1254.2 IMP
   000069         007400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1254.2
   000070         007500     02 CORRECT-X.                                                IF1254.2
   000071         007600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1254.2 IMP
   000072         007700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1254.2 71
   000073         007800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1254.2 71
   000074         007900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1254.2 71
   000075         008000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1254.2 71
   000076         008100     03      CR-18V0 REDEFINES CORRECT-A.                         IF1254.2 71
   000077         008200         04 CORRECT-18V0                     PIC -9(18).          IF1254.2
   000078         008300         04 FILLER                           PIC X.               IF1254.2
   000079         008400     03 FILLER PIC X(2) VALUE SPACE.                              IF1254.2 IMP
   000080         008500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1254.2 IMP
   000081         008600 01  CCVS-C-1.                                                    IF1254.2
   000082         008700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1254.2
   000083         008800-    "SS  PARAGRAPH-NAME                                          IF1254.2
   000084         008900-    "       REMARKS".                                            IF1254.2
   000085         009000     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1254.2 IMP
   000086         009100 01  CCVS-C-2.                                                    IF1254.2
   000087         009200     02 FILLER                     PIC X        VALUE SPACE.      IF1254.2 IMP
   000088         009300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1254.2
   000089         009400     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1254.2 IMP
   000090         009500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1254.2
   000091         009600     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1254.2 IMP
   000092         009700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1254.2 IMP
   000093         009800 01  REC-CT                        PIC 99       VALUE ZERO.       IF1254.2 IMP
   000094         009900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1254.2 IMP
   000095         010000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1254.2 IMP
   000096         010100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1254.2 IMP
   000097         010200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1254.2 IMP
   000098         010300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1254.2 IMP
   000099         010400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1254.2 IMP
   000100         010500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1254.2 IMP
   000101         010600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1254.2 IMP
   000102         010700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1254.2 IMP
   000103         010800 01  CCVS-H-1.                                                    IF1254.2
   000104         010900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1254.2 IMP
   000105         011000     02  FILLER                    PIC X(42)    VALUE             IF1254.2
   000106         011100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1254.2
   000107         011200     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1254.2 IMP
   000108         011300 01  CCVS-H-2A.                                                   IF1254.2
   000109         011400   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1254.2 IMP
   000110         011500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1254.2
   000111         011600   02  FILLER                        PIC XXXX   VALUE             IF1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     "4.2 ".                                                      IF1254.2
   000113         011800   02  FILLER                        PIC X(28)  VALUE             IF1254.2
   000114         011900            " COPY - NOT FOR DISTRIBUTION".                       IF1254.2
   000115         012000   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1254.2 IMP
   000116         012100                                                                  IF1254.2
   000117         012200 01  CCVS-H-2B.                                                   IF1254.2
   000118         012300   02  FILLER                        PIC X(15)  VALUE             IF1254.2
   000119         012400            "TEST RESULT OF ".                                    IF1254.2
   000120         012500   02  TEST-ID                       PIC X(9).                    IF1254.2
   000121         012600   02  FILLER                        PIC X(4)   VALUE             IF1254.2
   000122         012700            " IN ".                                               IF1254.2
   000123         012800   02  FILLER                        PIC X(12)  VALUE             IF1254.2
   000124         012900     " HIGH       ".                                              IF1254.2
   000125         013000   02  FILLER                        PIC X(22)  VALUE             IF1254.2
   000126         013100            " LEVEL VALIDATION FOR ".                             IF1254.2
   000127         013200   02  FILLER                        PIC X(58)  VALUE             IF1254.2
   000128         013300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1254.2
   000129         013400 01  CCVS-H-3.                                                    IF1254.2
   000130         013500     02  FILLER                      PIC X(34)  VALUE             IF1254.2
   000131         013600            " FOR OFFICIAL USE ONLY    ".                         IF1254.2
   000132         013700     02  FILLER                      PIC X(58)  VALUE             IF1254.2
   000133         013800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1254.2
   000134         013900     02  FILLER                      PIC X(28)  VALUE             IF1254.2
   000135         014000            "  COPYRIGHT   1985 ".                                IF1254.2
   000136         014100 01  CCVS-E-1.                                                    IF1254.2
   000137         014200     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1254.2 IMP
   000138         014300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1254.2
   000139         014400     02 ID-AGAIN                     PIC X(9).                    IF1254.2
   000140         014500     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1254.2 IMP
   000141         014600 01  CCVS-E-2.                                                    IF1254.2
   000142         014700     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1254.2 IMP
   000143         014800     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1254.2 IMP
   000144         014900     02 CCVS-E-2-2.                                               IF1254.2
   000145         015000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1254.2 IMP
   000146         015100         03 FILLER                   PIC X      VALUE SPACE.      IF1254.2 IMP
   000147         015200         03 ENDER-DESC               PIC X(44)  VALUE             IF1254.2
   000148         015300            "ERRORS ENCOUNTERED".                                 IF1254.2
   000149         015400 01  CCVS-E-3.                                                    IF1254.2
   000150         015500     02  FILLER                      PIC X(22)  VALUE             IF1254.2
   000151         015600            " FOR OFFICIAL USE ONLY".                             IF1254.2
   000152         015700     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1254.2 IMP
   000153         015800     02  FILLER                      PIC X(58)  VALUE             IF1254.2
   000154         015900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1254.2
   000155         016000     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1254.2 IMP
   000156         016100     02 FILLER                       PIC X(15)  VALUE             IF1254.2
   000157         016200             " COPYRIGHT 1985".                                   IF1254.2
   000158         016300 01  CCVS-E-4.                                                    IF1254.2
   000159         016400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1254.2 IMP
   000160         016500     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1254.2
   000161         016600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1254.2 IMP
   000162         016700     02 FILLER                       PIC X(40)  VALUE             IF1254.2
   000163         016800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1254.2
   000164         016900 01  XXINFO.                                                      IF1254.2
   000165         017000     02 FILLER                       PIC X(19)  VALUE             IF1254.2
   000166         017100            "*** INFORMATION ***".                                IF1254.2
   000167         017200     02 INFO-TEXT.                                                IF1254.2
   000168         017300       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1254.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400       04 XXCOMPUTED                 PIC X(20).                   IF1254.2
   000170         017500       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1254.2 IMP
   000171         017600       04 XXCORRECT                  PIC X(20).                   IF1254.2
   000172         017700     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1254.2
   000173         017800 01  HYPHEN-LINE.                                                 IF1254.2
   000174         017900     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1254.2 IMP
   000175         018000     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1254.2
   000176         018100-    "*****************************************".                 IF1254.2
   000177         018200     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1254.2
   000178         018300-    "******************************".                            IF1254.2
   000179         018400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1254.2
   000180         018500     "IF125A".                                                    IF1254.2
   000181         018600 PROCEDURE DIVISION.                                              IF1254.2
   000182         018700 CCVS1 SECTION.                                                   IF1254.2
   000183         018800 OPEN-FILES.                                                      IF1254.2
   000184         018900     OPEN     OUTPUT PRINT-FILE.                                  IF1254.2 22
   000185         019000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1254.2 179 120 179 139
   000186         019100     MOVE    SPACE TO TEST-RESULTS.                               IF1254.2 IMP 40
   000187         019200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1254.2 210 215
   000188         019300     GO TO CCVS1-EXIT.                                            IF1254.2 297
   000189         019400 CLOSE-FILES.                                                     IF1254.2
   000190         019500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1254.2 219 239 22
   000191         019600 TERMINATE-CCVS.                                                  IF1254.2
   000192         019700     STOP     RUN.                                                IF1254.2
   000193         019800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1254.2 44 96
   000194         019900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1254.2 44 97
   000195         020000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1254.2 44 95
   000196         020100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1254.2 44 94
   000197         020200     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1254.2 51
   000198         020300 PRINT-DETAIL.                                                    IF1254.2
   000199         020400     IF REC-CT NOT EQUAL TO ZERO                                  IF1254.2 93 IMP
   000200      1  020500             MOVE "." TO PARDOT-X                                 IF1254.2 48
   000201      1  020600             MOVE REC-CT TO DOTVALUE.                             IF1254.2 93 49
   000202         020700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1254.2 40 23 251
   000203         020800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1254.2 44 251
   000204      1  020900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1254.2 272 286
   000205      1  021000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1254.2 287 296
   000206         021100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1254.2 IMP 44 IMP 56
   000207         021200     MOVE SPACE TO CORRECT-X.                                     IF1254.2 IMP 70
   000208         021300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1254.2 93 IMP IMP 46
   000209         021400     MOVE     SPACE TO RE-MARK.                                   IF1254.2 IMP 51
   000210         021500 HEAD-ROUTINE.                                                    IF1254.2
   000211         021600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1254.2 103 24 251
   000212         021700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1254.2 108 24 251
   000213         021800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1254.2 117 24 251
   000214         021900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1254.2 129 24 251
   000215         022000 COLUMN-NAMES-ROUTINE.                                            IF1254.2
   000216         022100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1254.2 81 24 251
   000217         022200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1254.2 86 24 251
   000218         022300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1254.2 173 24 251
   000219         022400 END-ROUTINE.                                                     IF1254.2
   000220         022500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1254.2 173 24 251
   000221         022600 END-RTN-EXIT.                                                    IF1254.2
   000222         022700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1254.2 136 24 251
   000223         022800 END-ROUTINE-1.                                                   IF1254.2
   000224         022900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1254.2 95 99 96
   000225         023000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1254.2 99 94 99
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1254.2 97 99
   000227         023200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1254.2 97 159
   000228         023300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1254.2 99 161
   000229         023400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1254.2 158 144
   000230         023500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1254.2 141 24 251
   000231         023600  END-ROUTINE-12.                                                 IF1254.2
   000232         023700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1254.2 147
   000233         023800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1254.2 95 IMP
   000234      1  023900         MOVE "NO " TO ERROR-TOTAL                                IF1254.2 145
   000235         024000         ELSE                                                     IF1254.2
   000236      1  024100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1254.2 95 145
   000237         024200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1254.2 141 24
   000238         024300     PERFORM WRITE-LINE.                                          IF1254.2 251
   000239         024400 END-ROUTINE-13.                                                  IF1254.2
   000240         024500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1254.2 94 IMP
   000241      1  024600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1254.2 145
   000242      1  024700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1254.2 94 145
   000243         024800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1254.2 147
   000244         024900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1254.2 141 24 251
   000245         025000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1254.2 96 IMP
   000246      1  025100          MOVE "NO " TO ERROR-TOTAL                               IF1254.2 145
   000247      1  025200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1254.2 96 145
   000248         025300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1254.2 147
   000249         025400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1254.2 141 24 251
   000250         025500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1254.2 149 24 251
   000251         025600 WRITE-LINE.                                                      IF1254.2
   000252         025700     ADD 1 TO RECORD-COUNT.                                       IF1254.2 101
   000253         025800     IF RECORD-COUNT GREATER 42                                   IF1254.2 101
   000254      1  025900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1254.2 24 100
   000255      1  026000         MOVE SPACE TO DUMMY-RECORD                               IF1254.2 IMP 24
   000256      1  026100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1254.2 24
   000257      1  026200         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1254.2 103 24 267
   000258      1  026300         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1254.2 108 24 267
   000259      1  026400         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1254.2 117 24 267
   000260      1  026500         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1254.2 129 24 267
   000261      1  026600         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1254.2 81 24 267
   000262      1  026700         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1254.2 86 24 267
   000263      1  026800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1254.2 173 24 267
   000264      1  026900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1254.2 100 24
   000265      1  027000         MOVE ZERO TO RECORD-COUNT.                               IF1254.2 IMP 101
   000266         027100     PERFORM WRT-LN.                                              IF1254.2 267
   000267         027200 WRT-LN.                                                          IF1254.2
   000268         027300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1254.2 24
   000269         027400     MOVE SPACE TO DUMMY-RECORD.                                  IF1254.2 IMP 24
   000270         027500 BLANK-LINE-PRINT.                                                IF1254.2
   000271         027600     PERFORM WRT-LN.                                              IF1254.2 267
   000272         027700 FAIL-ROUTINE.                                                    IF1254.2
   000273         027800     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1254.2 56 IMP
   000274      1  027900            GO TO FAIL-ROUTINE-WRITE.                             IF1254.2 281
   000275         028000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1254.2 70 IMP 281
   000276         028100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1254.2 102 172
   000277         028200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1254.2 167
   000278         028300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1254.2 164 24 251
   000279         028400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1254.2 IMP 172
   000280         028500     GO TO  FAIL-ROUTINE-EX.                                      IF1254.2 286
   000281         028600 FAIL-ROUTINE-WRITE.                                              IF1254.2
   000282         028700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1254.2 52 23 251
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1254.2 102 80
   000284         028900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1254.2 67 23 251
   000285         029000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1254.2 IMP 80
   000286         029100 FAIL-ROUTINE-EX. EXIT.                                           IF1254.2
   000287         029200 BAIL-OUT.                                                        IF1254.2
   000288         029300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1254.2 57 IMP 290
   000289         029400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1254.2 71 IMP 296
   000290         029500 BAIL-OUT-WRITE.                                                  IF1254.2
   000291         029600     MOVE CORRECT-A TO XXCORRECT.                                 IF1254.2 71 171
   000292         029700     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1254.2 57 169
   000293         029800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1254.2 102 172
   000294         029900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1254.2 164 24 251
   000295         030000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1254.2 IMP 172
   000296         030100 BAIL-OUT-EX. EXIT.                                               IF1254.2
   000297         030200 CCVS1-EXIT.                                                      IF1254.2
   000298         030300     EXIT.                                                        IF1254.2
   000299         030500*                                                      *          IF1254.2
   000300         030600*    Intrinsic Function Tests         IF125A - NUMVAL  *          IF1254.2
   000301         030700*                                                      *          IF1254.2
   000302         030900 SECT-IF125A SECTION.                                             IF1254.2
   000303         031000 F-NUMVAL-INFO.                                                   IF1254.2
   000304         031100     MOVE     "See ref. A-58 2.29" TO ANSI-REFERENCE.             IF1254.2 102
   000305         031200     MOVE     "NUMVAL Function"     TO FEATURE.                   IF1254.2 42
   000306         031400 F-NUMVAL-01.                                                     IF1254.2
   000307         031500     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000308         031600 F-NUMVAL-TEST-01.                                                IF1254.2
   000309         031700     COMPUTE TEMP = FUNCTION NUMVAL ("9").                        IF1254.2 36 IFN
   000310         031800     IF TEMP = 9 THEN                                             IF1254.2 36
   000311      1  031900                        PERFORM PASS                              IF1254.2 194
   000312         032000     ELSE                                                         IF1254.2
   000313      1  032100                        MOVE 9 TO CORRECT-N                       IF1254.2 72
   000314      1  032200                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000315      1  032300                        PERFORM FAIL.                             IF1254.2 195
   000316         032400     GO TO F-NUMVAL-WRITE-01.                                     IF1254.2 320
   000317         032500 F-NUMVAL-DELETE-01.                                              IF1254.2
   000318         032600     PERFORM  DE-LETE.                                            IF1254.2 196
   000319         032700     GO TO    F-NUMVAL-WRITE-01.                                  IF1254.2 320
   000320         032800 F-NUMVAL-WRITE-01.                                               IF1254.2
   000321         032900     MOVE "F-NUMVAL-01" TO PAR-NAME.                              IF1254.2 46
   000322         033000     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000323         033200 F-NUMVAL-02.                                                     IF1254.2
   000324         033300     MOVE 77  TO TEMP.                                            IF1254.2 36
   000325         033400 F-NUMVAL-TEST-02.                                                IF1254.2
   000326         033500     EVALUATE FUNCTION NUMVAL ("4738")                            IF1254.2 IFN
   000327         033600              ALSO ( TEMP + 96 ) * 2                              IF1254.2 36
   000328         033700     WHEN     4738                                                IF1254.2
   000329         033800              ALSO 346                                            IF1254.2
   000330      1  033900        PERFORM PASS                                              IF1254.2 194
   000331      1  034000        GO TO F-NUMVAL-WRITE-02.                                  IF1254.2 337
   000332         034100     PERFORM FAIL.                                                IF1254.2 195
   000333         034200     GO TO    F-NUMVAL-WRITE-02.                                  IF1254.2 337
   000334         034300 F-NUMVAL-DELETE-02.                                              IF1254.2
   000335         034400     PERFORM  DE-LETE.                                            IF1254.2 196
   000336         034500     GO TO    F-NUMVAL-WRITE-02.                                  IF1254.2 337
   000337         034600 F-NUMVAL-WRITE-02.                                               IF1254.2
   000338         034700     MOVE "F-NUMVAL-02" TO PAR-NAME.                              IF1254.2 46
   000339         034800     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         035000 F-NUMVAL-TEST-03.                                                IF1254.2
   000341         035100     IF (FUNCTION NUMVAL (".935") >= 0.934981) AND                IF1254.2 IFN
   000342         035200        (FUNCTION NUMVAL (".935") <= 0.935019)                    IF1254.2 IFN
   000343      1  035300                        PERFORM PASS                              IF1254.2 194
   000344         035400     ELSE                                                         IF1254.2
   000345      1  035500                        PERFORM FAIL.                             IF1254.2 195
   000346         035600     GO TO F-NUMVAL-WRITE-03.                                     IF1254.2 350
   000347         035700 F-NUMVAL-DELETE-03.                                              IF1254.2
   000348         035800     PERFORM  DE-LETE.                                            IF1254.2 196
   000349         035900     GO TO    F-NUMVAL-WRITE-03.                                  IF1254.2 350
   000350         036000 F-NUMVAL-WRITE-03.                                               IF1254.2
   000351         036100     MOVE "F-NUMVAL-03" TO PAR-NAME.                              IF1254.2 46
   000352         036200     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000353         036400 F-NUMVAL-04.                                                     IF1254.2
   000354         036500     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000355         036600 F-NUMVAL-TEST-04.                                                IF1254.2
   000356         036700     COMPUTE TEMP = FUNCTION NUMVAL ("385.93").                   IF1254.2 36 IFN
   000357         036800     IF (TEMP >= 385.922) AND                                     IF1254.2 36
   000358         036900        (TEMP <= 385.938)                                         IF1254.2 36
   000359      1  037000                        PERFORM PASS                              IF1254.2 194
   000360         037100     ELSE                                                         IF1254.2
   000361      1  037200                        MOVE  385.93  TO CORRECT-N                IF1254.2 72
   000362      1  037300                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000363      1  037400                        PERFORM FAIL.                             IF1254.2 195
   000364         037500     GO TO F-NUMVAL-WRITE-04.                                     IF1254.2 368
   000365         037600 F-NUMVAL-DELETE-04.                                              IF1254.2
   000366         037700     PERFORM  DE-LETE.                                            IF1254.2 196
   000367         037800     GO TO    F-NUMVAL-WRITE-04.                                  IF1254.2 368
   000368         037900 F-NUMVAL-WRITE-04.                                               IF1254.2
   000369         038000     MOVE "F-NUMVAL-04" TO PAR-NAME.                              IF1254.2 46
   000370         038100     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000371         038300 F-NUMVAL-05.                                                     IF1254.2
   000372         038400     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000373         038500 F-NUMVAL-TEST-05.                                                IF1254.2
   000374         038600     COMPUTE TEMP = FUNCTION NUMVAL ("+394.2").                   IF1254.2 36 IFN
   000375         038700     IF (TEMP >= 394.192) AND                                     IF1254.2 36
   000376         038800        (TEMP <= 394.208)                                         IF1254.2 36
   000377      1  038900                        PERFORM PASS                              IF1254.2 194
   000378         039000     ELSE                                                         IF1254.2
   000379      1  039100                        MOVE  394.2  TO CORRECT-N                 IF1254.2 72
   000380      1  039200                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000381      1  039300                        PERFORM FAIL.                             IF1254.2 195
   000382         039400     GO TO F-NUMVAL-WRITE-05.                                     IF1254.2 386
   000383         039500 F-NUMVAL-DELETE-05.                                              IF1254.2
   000384         039600     PERFORM  DE-LETE.                                            IF1254.2 196
   000385         039700     GO TO    F-NUMVAL-WRITE-05.                                  IF1254.2 386
   000386         039800 F-NUMVAL-WRITE-05.                                               IF1254.2
   000387         039900     MOVE "F-NUMVAL-05" TO PAR-NAME.                              IF1254.2 46
   000388         040000     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000389         040200 F-NUMVAL-06.                                                     IF1254.2
   000390         040300     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000391         040400 F-NUMVAL-TEST-06.                                                IF1254.2
   000392         040500     COMPUTE TEMP = FUNCTION NUMVAL ("  939.83").                 IF1254.2 36 IFN
   000393         040600     IF (TEMP >= 939.811) AND                                     IF1254.2 36
   000394         040700        (TEMP <= 939.849)                                         IF1254.2 36
   000395      1  040800                        PERFORM PASS                              IF1254.2 194
   000396         040900     ELSE                                                         IF1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  041000                        MOVE  939.83  TO CORRECT-N                IF1254.2 72
   000398      1  041100                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000399      1  041200                        PERFORM FAIL.                             IF1254.2 195
   000400         041300     GO TO F-NUMVAL-WRITE-06.                                     IF1254.2 404
   000401         041400 F-NUMVAL-DELETE-06.                                              IF1254.2
   000402         041500     PERFORM  DE-LETE.                                            IF1254.2 196
   000403         041600     GO TO    F-NUMVAL-WRITE-06.                                  IF1254.2 404
   000404         041700 F-NUMVAL-WRITE-06.                                               IF1254.2
   000405         041800     MOVE "F-NUMVAL-06" TO PAR-NAME.                              IF1254.2 46
   000406         041900     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000407         042100 F-NUMVAL-07.                                                     IF1254.2
   000408         042200     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000409         042300 F-NUMVAL-TEST-07.                                                IF1254.2
   000410         042400     COMPUTE TEMP = FUNCTION NUMVAL ("   -  4929.0323").          IF1254.2 36 IFN
   000411         042500     IF (TEMP >= -4929.1309) AND                                  IF1254.2 36
   000412         042600        (TEMP <= -4928.9337)                                      IF1254.2 36
   000413      1  042700                        PERFORM PASS                              IF1254.2 194
   000414         042800     ELSE                                                         IF1254.2
   000415      1  042900                        MOVE  -4929.0323  TO CORRECT-N            IF1254.2 72
   000416      1  043000                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000417      1  043100                        PERFORM FAIL.                             IF1254.2 195
   000418         043200     GO TO F-NUMVAL-WRITE-07.                                     IF1254.2 422
   000419         043300 F-NUMVAL-DELETE-07.                                              IF1254.2
   000420         043400     PERFORM  DE-LETE.                                            IF1254.2 196
   000421         043500     GO TO    F-NUMVAL-WRITE-07.                                  IF1254.2 422
   000422         043600 F-NUMVAL-WRITE-07.                                               IF1254.2
   000423         043700     MOVE "F-NUMVAL-07" TO PAR-NAME.                              IF1254.2 46
   000424         043800     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000425         044000 F-NUMVAL-08.                                                     IF1254.2
   000426         044100     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000427         044200 F-NUMVAL-TEST-08.                                                IF1254.2
   000428         044300     COMPUTE TEMP = FUNCTION NUMVAL ("82.9312+").                 IF1254.2 36 IFN
   000429         044400     IF (TEMP >= 82.9295) AND                                     IF1254.2 36
   000430         044500        (TEMP <= 82.9329)                                         IF1254.2 36
   000431      1  044600                        PERFORM PASS                              IF1254.2 194
   000432         044700     ELSE                                                         IF1254.2
   000433      1  044800                        MOVE  82.9312  TO CORRECT-N               IF1254.2 72
   000434      1  044900                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000435      1  045000                        PERFORM FAIL.                             IF1254.2 195
   000436         045100     GO TO F-NUMVAL-WRITE-08.                                     IF1254.2 440
   000437         045200 F-NUMVAL-DELETE-08.                                              IF1254.2
   000438         045300     PERFORM  DE-LETE.                                            IF1254.2 196
   000439         045400     GO TO    F-NUMVAL-WRITE-08.                                  IF1254.2 440
   000440         045500 F-NUMVAL-WRITE-08.                                               IF1254.2
   000441         045600     MOVE "F-NUMVAL-08" TO PAR-NAME.                              IF1254.2 46
   000442         045700     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000443         045900 F-NUMVAL-09.                                                     IF1254.2
   000444         046000     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000445         046100 F-NUMVAL-TEST-09.                                                IF1254.2
   000446         046200     COMPUTE TEMP = FUNCTION NUMVAL ("   200.0002   - ").         IF1254.2 36 IFN
   000447         046300     IF (TEMP >= -200.0042) AND                                   IF1254.2 36
   000448         046400        (TEMP <= -199.9962)                                       IF1254.2 36
   000449      1  046500                        PERFORM PASS                              IF1254.2 194
   000450         046600     ELSE                                                         IF1254.2
   000451      1  046700                        MOVE  -200.0002  TO CORRECT-N             IF1254.2 72
   000452      1  046800                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000453      1  046900                        PERFORM FAIL.                             IF1254.2 195
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         047000     GO TO F-NUMVAL-WRITE-09.                                     IF1254.2 458
   000455         047100 F-NUMVAL-DELETE-09.                                              IF1254.2
   000456         047200     PERFORM  DE-LETE.                                            IF1254.2 196
   000457         047300     GO TO    F-NUMVAL-WRITE-09.                                  IF1254.2 458
   000458         047400 F-NUMVAL-WRITE-09.                                               IF1254.2
   000459         047500     MOVE "F-NUMVAL-09" TO PAR-NAME.                              IF1254.2 46
   000460         047600     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000461         047800 F-NUMVAL-10.                                                     IF1254.2
   000462         047900     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000463         048000 F-NUMVAL-TEST-10.                                                IF1254.2
   000464         048100     COMPUTE TEMP = FUNCTION NUMVAL (A).                          IF1254.2 36 IFN 27
   000465         048200     IF TEMP = 4 THEN                                             IF1254.2 36
   000466      1  048300                        PERFORM PASS                              IF1254.2 194
   000467         048400     ELSE                                                         IF1254.2
   000468      1  048500                        MOVE  4  TO CORRECT-N                     IF1254.2 72
   000469      1  048600                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000470      1  048700                        PERFORM FAIL.                             IF1254.2 195
   000471         048800     GO TO F-NUMVAL-WRITE-10.                                     IF1254.2 475
   000472         048900 F-NUMVAL-DELETE-10.                                              IF1254.2
   000473         049000     PERFORM  DE-LETE.                                            IF1254.2 196
   000474         049100     GO TO    F-NUMVAL-WRITE-10.                                  IF1254.2 475
   000475         049200 F-NUMVAL-WRITE-10.                                               IF1254.2
   000476         049300     MOVE "F-NUMVAL-10" TO PAR-NAME.                              IF1254.2 46
   000477         049400     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000478         049600 F-NUMVAL-11.                                                     IF1254.2
   000479         049700     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000480         049800 F-NUMVAL-TEST-11.                                                IF1254.2
   000481         049900     COMPUTE TEMP = FUNCTION NUMVAL (B).                          IF1254.2 36 IFN 28
   000482         050000     IF TEMP = 203 THEN                                           IF1254.2 36
   000483      1  050100                        PERFORM PASS                              IF1254.2 194
   000484         050200     ELSE                                                         IF1254.2
   000485      1  050300                        MOVE  203  TO CORRECT-N                   IF1254.2 72
   000486      1  050400                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000487      1  050500                        PERFORM FAIL.                             IF1254.2 195
   000488         050600     GO TO F-NUMVAL-WRITE-11.                                     IF1254.2 492
   000489         050700 F-NUMVAL-DELETE-11.                                              IF1254.2
   000490         050800     PERFORM  DE-LETE.                                            IF1254.2 196
   000491         050900     GO TO    F-NUMVAL-WRITE-11.                                  IF1254.2 492
   000492         051000 F-NUMVAL-WRITE-11.                                               IF1254.2
   000493         051100     MOVE "F-NUMVAL-11" TO PAR-NAME.                              IF1254.2 46
   000494         051200     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000495         051400 F-NUMVAL-12.                                                     IF1254.2
   000496         051500     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000497         051600 F-NUMVAL-TEST-12.                                                IF1254.2
   000498         051700     COMPUTE TEMP = FUNCTION NUMVAL (C).                          IF1254.2 36 IFN 29
   000499         051800     IF (TEMP >= 0.428991) AND                                    IF1254.2 36
   000500         051900        (TEMP <= 0.429009)                                        IF1254.2 36
   000501      1  052000                        PERFORM PASS                              IF1254.2 194
   000502         052100     ELSE                                                         IF1254.2
   000503      1  052200                        MOVE  0.429  TO CORRECT-N                 IF1254.2 72
   000504      1  052300                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000505      1  052400                        PERFORM FAIL.                             IF1254.2 195
   000506         052500     GO TO F-NUMVAL-WRITE-12.                                     IF1254.2 510
   000507         052600 F-NUMVAL-DELETE-12.                                              IF1254.2
   000508         052700     PERFORM  DE-LETE.                                            IF1254.2 196
   000509         052800     GO TO    F-NUMVAL-WRITE-12.                                  IF1254.2 510
   000510         052900 F-NUMVAL-WRITE-12.                                               IF1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         053000     MOVE "F-NUMVAL-12" TO PAR-NAME.                              IF1254.2 46
   000512         053100     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000513         053300 F-NUMVAL-13.                                                     IF1254.2
   000514         053400     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000515         053500 F-NUMVAL-TEST-13.                                                IF1254.2
   000516         053600     COMPUTE TEMP = FUNCTION NUMVAL (D).                          IF1254.2 36 IFN 30
   000517         053700     IF (TEMP >= 928.325) AND                                     IF1254.2 36
   000518         053800        (TEMP <= 928.363)                                         IF1254.2 36
   000519      1  053900                        PERFORM PASS                              IF1254.2 194
   000520         054000     ELSE                                                         IF1254.2
   000521      1  054100                        MOVE  928.344  TO CORRECT-N               IF1254.2 72
   000522      1  054200                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000523      1  054300                        PERFORM FAIL.                             IF1254.2 195
   000524         054400     GO TO F-NUMVAL-WRITE-13.                                     IF1254.2 528
   000525         054500 F-NUMVAL-DELETE-13.                                              IF1254.2
   000526         054600     PERFORM  DE-LETE.                                            IF1254.2 196
   000527         054700     GO TO    F-NUMVAL-WRITE-13.                                  IF1254.2 528
   000528         054800 F-NUMVAL-WRITE-13.                                               IF1254.2
   000529         054900     MOVE "F-NUMVAL-13" TO PAR-NAME.                              IF1254.2 46
   000530         055000     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000531         055200 F-NUMVAL-14.                                                     IF1254.2
   000532         055300     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000533         055400 F-NUMVAL-TEST-14.                                                IF1254.2
   000534         055500     COMPUTE TEMP = FUNCTION NUMVAL (E).                          IF1254.2 36 IFN 31
   000535         055600     IF (TEMP >= -42.3248) AND                                    IF1254.2 36
   000536         055700        (TEMP <= -42.3232)                                        IF1254.2 36
   000537      1  055800                        PERFORM PASS                              IF1254.2 194
   000538         055900     ELSE                                                         IF1254.2
   000539      1  056000                        MOVE  -42.324      TO CORRECT-N           IF1254.2 72
   000540      1  056100                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000541      1  056200                        PERFORM FAIL.                             IF1254.2 195
   000542         056300     GO TO F-NUMVAL-WRITE-14.                                     IF1254.2 546
   000543         056400 F-NUMVAL-DELETE-14.                                              IF1254.2
   000544         056500     PERFORM  DE-LETE.                                            IF1254.2 196
   000545         056600     GO TO    F-NUMVAL-WRITE-14.                                  IF1254.2 546
   000546         056700 F-NUMVAL-WRITE-14.                                               IF1254.2
   000547         056800     MOVE "F-NUMVAL-14" TO PAR-NAME.                              IF1254.2 46
   000548         056900     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000549         057100 F-NUMVAL-15.                                                     IF1254.2
   000550         057200     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000551         057300 F-NUMVAL-TEST-15.                                                IF1254.2
   000552         057400     COMPUTE TEMP = FUNCTION NUMVAL (F).                          IF1254.2 36 IFN 32
   000553         057500     IF (TEMP >= 22.9995) AND                                     IF1254.2 36
   000554         057600        (TEMP <= 23.0005)                                         IF1254.2 36
   000555      1  057700                        PERFORM PASS                              IF1254.2 194
   000556         057800     ELSE                                                         IF1254.2
   000557      1  057900                        MOVE  23.0  TO CORRECT-N                  IF1254.2 72
   000558      1  058000                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000559      1  058100                        PERFORM FAIL.                             IF1254.2 195
   000560         058200     GO TO F-NUMVAL-WRITE-15.                                     IF1254.2 564
   000561         058300 F-NUMVAL-DELETE-15.                                              IF1254.2
   000562         058400     PERFORM  DE-LETE.                                            IF1254.2 196
   000563         058500     GO TO    F-NUMVAL-WRITE-15.                                  IF1254.2 564
   000564         058600 F-NUMVAL-WRITE-15.                                               IF1254.2
   000565         058700     MOVE "F-NUMVAL-15" TO PAR-NAME.                              IF1254.2 46
   000566         058800     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000567         059000 F-NUMVAL-16.                                                     IF1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         059100     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000569         059200 F-NUMVAL-TEST-16.                                                IF1254.2
   000570         059300     COMPUTE TEMP = FUNCTION NUMVAL (G).                          IF1254.2 36 IFN 33
   000571         059400     IF (TEMP >= -92926.16) AND                                   IF1254.2 36
   000572         059500        (TEMP <= -92922.44)                                       IF1254.2 36
   000573      1  059600                        PERFORM PASS                              IF1254.2 194
   000574         059700     ELSE                                                         IF1254.2
   000575      1  059800                        MOVE  -92924.3  TO CORRECT-N              IF1254.2 72
   000576      1  059900                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000577      1  060000                        PERFORM FAIL.                             IF1254.2 195
   000578         060100     GO TO F-NUMVAL-WRITE-16.                                     IF1254.2 582
   000579         060200 F-NUMVAL-DELETE-16.                                              IF1254.2
   000580         060300     PERFORM  DE-LETE.                                            IF1254.2 196
   000581         060400     GO TO    F-NUMVAL-WRITE-16.                                  IF1254.2 582
   000582         060500 F-NUMVAL-WRITE-16.                                               IF1254.2
   000583         060600     MOVE "F-NUMVAL-16" TO PAR-NAME.                              IF1254.2 46
   000584         060700     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000585         060900 F-NUMVAL-17.                                                     IF1254.2
   000586         061000     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000587         061100 F-NUMVAL-TEST-17.                                                IF1254.2
   000588         061200     COMPUTE TEMP = FUNCTION NUMVAL (H).                          IF1254.2 36 IFN 34
   000589         061300     IF (TEMP >= 93.2081) AND                                     IF1254.2 36
   000590         061400        (TEMP <= 93.2119)                                         IF1254.2 36
   000591      1  061500                        PERFORM PASS                              IF1254.2 194
   000592         061600     ELSE                                                         IF1254.2
   000593      1  061700                        MOVE  93.21  TO CORRECT-N                 IF1254.2 72
   000594      1  061800                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000595      1  061900                        PERFORM FAIL.                             IF1254.2 195
   000596         062000     GO TO F-NUMVAL-WRITE-17.                                     IF1254.2 600
   000597         062100 F-NUMVAL-DELETE-17.                                              IF1254.2
   000598         062200     PERFORM  DE-LETE.                                            IF1254.2 196
   000599         062300     GO TO    F-NUMVAL-WRITE-17.                                  IF1254.2 600
   000600         062400 F-NUMVAL-WRITE-17.                                               IF1254.2
   000601         062500     MOVE "F-NUMVAL-17" TO PAR-NAME.                              IF1254.2 46
   000602         062600     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000603         062800 F-NUMVAL-18.                                                     IF1254.2
   000604         062900     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000605         063000 F-NUMVAL-TEST-18.                                                IF1254.2
   000606         063100     COMPUTE TEMP = FUNCTION NUMVAL (I).                          IF1254.2 36 IFN 35
   000607         063200     IF (TEMP >= -92.9219) AND                                    IF1254.2 36
   000608         063300        (TEMP <= -92.9181)                                        IF1254.2 36
   000609      1  063400                        PERFORM PASS                              IF1254.2 194
   000610         063500     ELSE                                                         IF1254.2
   000611      1  063600                        MOVE  -92.92  TO CORRECT-N                IF1254.2 72
   000612      1  063700                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000613      1  063800                        PERFORM FAIL.                             IF1254.2 195
   000614         063900     GO TO F-NUMVAL-WRITE-18.                                     IF1254.2 618
   000615         064000 F-NUMVAL-DELETE-18.                                              IF1254.2
   000616         064100     PERFORM  DE-LETE.                                            IF1254.2 196
   000617         064200     GO TO    F-NUMVAL-WRITE-18.                                  IF1254.2 618
   000618         064300 F-NUMVAL-WRITE-18.                                               IF1254.2
   000619         064400     MOVE "F-NUMVAL-18" TO PAR-NAME.                              IF1254.2 46
   000620         064500     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000621         064700 F-NUMVAL-19.                                                     IF1254.2
   000622         064800     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000623         064900 F-NUMVAL-TEST-19.                                                IF1254.2
   000624         065000     COMPUTE TEMP = (FUNCTION NUMVAL ("90") + 10).                IF1254.2 36 IFN
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         065100     IF TEMP = 100 THEN                                           IF1254.2 36
   000626      1  065200                        PERFORM PASS                              IF1254.2 194
   000627         065300     ELSE                                                         IF1254.2
   000628      1  065400                        MOVE  100  TO CORRECT-N                   IF1254.2 72
   000629      1  065500                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000630      1  065600                        PERFORM FAIL.                             IF1254.2 195
   000631         065700     GO TO F-NUMVAL-WRITE-19.                                     IF1254.2 635
   000632         065800 F-NUMVAL-DELETE-19.                                              IF1254.2
   000633         065900     PERFORM  DE-LETE.                                            IF1254.2 196
   000634         066000     GO TO    F-NUMVAL-WRITE-19.                                  IF1254.2 635
   000635         066100 F-NUMVAL-WRITE-19.                                               IF1254.2
   000636         066200     MOVE "F-NUMVAL-19" TO PAR-NAME.                              IF1254.2 46
   000637         066300     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000638         066500 F-NUMVAL-20.                                                     IF1254.2
   000639         066600     MOVE ZERO TO TEMP.                                           IF1254.2 IMP 36
   000640         066700 F-NUMVAL-TEST-20.                                                IF1254.2
   000641         066800     COMPUTE TEMP = (FUNCTION NUMVAL ("2") +                      IF1254.2 36 IFN
   000642         066900                     FUNCTION NUMVAL ("8") ).                     IF1254.2 IFN
   000643         067000     IF TEMP = 10 THEN                                            IF1254.2 36
   000644      1  067100                        PERFORM PASS                              IF1254.2 194
   000645         067200     ELSE                                                         IF1254.2
   000646      1  067300                        MOVE  10  TO CORRECT-N                    IF1254.2 72
   000647      1  067400                        MOVE TEMP TO COMPUTED-N                   IF1254.2 36 58
   000648      1  067500                        PERFORM FAIL.                             IF1254.2 195
   000649         067600     GO TO F-NUMVAL-WRITE-20.                                     IF1254.2 653
   000650         067700 F-NUMVAL-DELETE-20.                                              IF1254.2
   000651         067800     PERFORM  DE-LETE.                                            IF1254.2 196
   000652         067900     GO TO    F-NUMVAL-WRITE-20.                                  IF1254.2 653
   000653         068000 F-NUMVAL-WRITE-20.                                               IF1254.2
   000654         068100     MOVE "F-NUMVAL-20" TO PAR-NAME.                              IF1254.2 46
   000655         068200     PERFORM  PRINT-DETAIL.                                       IF1254.2 198
   000656         068400 CCVS-EXIT SECTION.                                               IF1254.2
   000657         068500 CCVS-999999.                                                     IF1254.2
   000658         068600     GO TO CLOSE-FILES.                                           IF1254.2 189
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  464
      102   ANSI-REFERENCE . . . . . . . .  276 283 293 M304
       28   B. . . . . . . . . . . . . . .  481
       29   C. . . . . . . . . . . . . . .  498
       81   CCVS-C-1 . . . . . . . . . . .  216 261
       86   CCVS-C-2 . . . . . . . . . . .  217 262
      136   CCVS-E-1 . . . . . . . . . . .  222
      141   CCVS-E-2 . . . . . . . . . . .  230 237 244 249
      144   CCVS-E-2-2 . . . . . . . . . .  M229
      149   CCVS-E-3 . . . . . . . . . . .  250
      158   CCVS-E-4 . . . . . . . . . . .  229
      159   CCVS-E-4-1 . . . . . . . . . .  M227
      161   CCVS-E-4-2 . . . . . . . . . .  M228
      103   CCVS-H-1 . . . . . . . . . . .  211 257
      108   CCVS-H-2A. . . . . . . . . . .  212 258
      117   CCVS-H-2B. . . . . . . . . . .  213 259
      129   CCVS-H-3 . . . . . . . . . . .  214 260
      179   CCVS-PGM-ID. . . . . . . . . .  185 185
       63   CM-18V0
       57   COMPUTED-A . . . . . . . . . .  58 60 61 62 63 288 292
       58   COMPUTED-N . . . . . . . . . .  M314 M362 M380 M398 M416 M434 M452 M469 M486 M504 M522 M540 M558 M576 M594 M612
                                            M629 M647
       56   COMPUTED-X . . . . . . . . . .  M206 273
       60   COMPUTED-0V18
       62   COMPUTED-14V4
       64   COMPUTED-18V0
       61   COMPUTED-4V14
       80   COR-ANSI-REFERENCE . . . . . .  M283 M285
       71   CORRECT-A. . . . . . . . . . .  72 73 74 75 76 289 291
       72   CORRECT-N. . . . . . . . . . .  M313 M361 M379 M397 M415 M433 M451 M468 M485 M503 M521 M539 M557 M575 M593 M611
                                            M628 M646
       70   CORRECT-X. . . . . . . . . . .  M207 275
       73   CORRECT-0V18
       75   CORRECT-14V4
       77   CORRECT-18V0
       74   CORRECT-4V14
       76   CR-18V0
       30   D. . . . . . . . . . . . . . .  516
       94   DELETE-COUNTER . . . . . . . .  M196 225 240 242
       49   DOTVALUE . . . . . . . . . . .  M201
      100   DUMMY-HOLD . . . . . . . . . .  M254 264
       24   DUMMY-RECORD . . . . . . . . .  M211 M212 M213 M214 M216 M217 M218 M220 M222 M230 M237 M244 M249 M250 254 M255
                                            256 M257 M258 M259 M260 M261 M262 M263 M264 268 M269 M278 M294
       31   E. . . . . . . . . . . . . . .  534
      147   ENDER-DESC . . . . . . . . . .  M232 M243 M248
       95   ERROR-COUNTER. . . . . . . . .  M195 224 233 236
       99   ERROR-HOLD . . . . . . . . . .  M224 M225 M225 M226 228
      145   ERROR-TOTAL. . . . . . . . . .  M234 M236 M241 M242 M246 M247
       32   F. . . . . . . . . . . . . . .  552
       42   FEATURE. . . . . . . . . . . .  M305
       33   G. . . . . . . . . . . . . . .  570
       34   H. . . . . . . . . . . . . . .  588
      173   HYPHEN-LINE. . . . . . . . . .  218 220 263
       35   I. . . . . . . . . . . . . . .  606
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    16
0 Defined   Cross-reference of data names   References

0     139   ID-AGAIN . . . . . . . . . . .  M185
      172   INF-ANSI-REFERENCE . . . . . .  M276 M279 M293 M295
      167   INFO-TEXT. . . . . . . . . . .  M277
       96   INSPECT-COUNTER. . . . . . . .  M193 224 245 247
       44   P-OR-F . . . . . . . . . . . .  M193 M194 M195 M196 203 M206
       46   PAR-NAME . . . . . . . . . . .  M208 M321 M338 M351 M369 M387 M405 M423 M441 M459 M476 M493 M511 M529 M547 M565
                                            M583 M601 M619 M636 M654
       48   PARDOT-X . . . . . . . . . . .  M200
       97   PASS-COUNTER . . . . . . . . .  M194 226 227
       22   PRINT-FILE . . . . . . . . . .  18 184 190
       23   PRINT-REC. . . . . . . . . . .  M202 M282 M284
       51   RE-MARK. . . . . . . . . . . .  M197 M209
       93   REC-CT . . . . . . . . . . . .  199 201 208
       92   REC-SKL-SUB
      101   RECORD-COUNT . . . . . . . . .  M252 253 M265
       36   TEMP . . . . . . . . . . . . .  M307 M309 310 314 M324 327 M354 M356 357 358 362 M372 M374 375 376 380 M390 M392
                                            393 394 398 M408 M410 411 412 416 M426 M428 429 430 434 M444 M446 447 448 452
                                            M462 M464 465 469 M479 M481 482 486 M496 M498 499 500 504 M514 M516 517 518 522
                                            M532 M534 535 536 540 M550 M552 553 554 558 M568 M570 571 572 576 M586 M588 589
                                            590 594 M604 M606 607 608 612 M622 M624 625 629 M639 M641 643 647
       52   TEST-COMPUTED. . . . . . . . .  282
       67   TEST-CORRECT . . . . . . . . .  284
      120   TEST-ID. . . . . . . . . . . .  M185
       40   TEST-RESULTS . . . . . . . . .  M186 202
       98   TOTAL-ERROR
      169   XXCOMPUTED . . . . . . . . . .  M292
      171   XXCORRECT. . . . . . . . . . .  M291
      164   XXINFO . . . . . . . . . . . .  278 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    17
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

      287   BAIL-OUT . . . . . . . . . . .  P205
      296   BAIL-OUT-EX. . . . . . . . . .  E205 G289
      290   BAIL-OUT-WRITE . . . . . . . .  G288
      270   BLANK-LINE-PRINT
      656   CCVS-EXIT
      657   CCVS-999999
      182   CCVS1
      297   CCVS1-EXIT . . . . . . . . . .  G188
      189   CLOSE-FILES. . . . . . . . . .  G658
      215   COLUMN-NAMES-ROUTINE . . . . .  E187
      196   DE-LETE. . . . . . . . . . . .  P318 P335 P348 P366 P384 P402 P420 P438 P456 P473 P490 P508 P526 P544 P562 P580
                                            P598 P616 P633 P651
      219   END-ROUTINE. . . . . . . . . .  P190
      223   END-ROUTINE-1
      231   END-ROUTINE-12
      239   END-ROUTINE-13 . . . . . . . .  E190
      221   END-RTN-EXIT
      317   F-NUMVAL-DELETE-01
      334   F-NUMVAL-DELETE-02
      347   F-NUMVAL-DELETE-03
      365   F-NUMVAL-DELETE-04
      383   F-NUMVAL-DELETE-05
      401   F-NUMVAL-DELETE-06
      419   F-NUMVAL-DELETE-07
      437   F-NUMVAL-DELETE-08
      455   F-NUMVAL-DELETE-09
      472   F-NUMVAL-DELETE-10
      489   F-NUMVAL-DELETE-11
      507   F-NUMVAL-DELETE-12
      525   F-NUMVAL-DELETE-13
      543   F-NUMVAL-DELETE-14
      561   F-NUMVAL-DELETE-15
      579   F-NUMVAL-DELETE-16
      597   F-NUMVAL-DELETE-17
      615   F-NUMVAL-DELETE-18
      632   F-NUMVAL-DELETE-19
      650   F-NUMVAL-DELETE-20
      303   F-NUMVAL-INFO
      308   F-NUMVAL-TEST-01
      325   F-NUMVAL-TEST-02
      340   F-NUMVAL-TEST-03
      355   F-NUMVAL-TEST-04
      373   F-NUMVAL-TEST-05
      391   F-NUMVAL-TEST-06
      409   F-NUMVAL-TEST-07
      427   F-NUMVAL-TEST-08
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    18
0 Defined   Cross-reference of procedures   References

0     445   F-NUMVAL-TEST-09
      463   F-NUMVAL-TEST-10
      480   F-NUMVAL-TEST-11
      497   F-NUMVAL-TEST-12
      515   F-NUMVAL-TEST-13
      533   F-NUMVAL-TEST-14
      551   F-NUMVAL-TEST-15
      569   F-NUMVAL-TEST-16
      587   F-NUMVAL-TEST-17
      605   F-NUMVAL-TEST-18
      623   F-NUMVAL-TEST-19
      640   F-NUMVAL-TEST-20
      320   F-NUMVAL-WRITE-01. . . . . . .  G316 G319
      337   F-NUMVAL-WRITE-02. . . . . . .  G331 G333 G336
      350   F-NUMVAL-WRITE-03. . . . . . .  G346 G349
      368   F-NUMVAL-WRITE-04. . . . . . .  G364 G367
      386   F-NUMVAL-WRITE-05. . . . . . .  G382 G385
      404   F-NUMVAL-WRITE-06. . . . . . .  G400 G403
      422   F-NUMVAL-WRITE-07. . . . . . .  G418 G421
      440   F-NUMVAL-WRITE-08. . . . . . .  G436 G439
      458   F-NUMVAL-WRITE-09. . . . . . .  G454 G457
      475   F-NUMVAL-WRITE-10. . . . . . .  G471 G474
      492   F-NUMVAL-WRITE-11. . . . . . .  G488 G491
      510   F-NUMVAL-WRITE-12. . . . . . .  G506 G509
      528   F-NUMVAL-WRITE-13. . . . . . .  G524 G527
      546   F-NUMVAL-WRITE-14. . . . . . .  G542 G545
      564   F-NUMVAL-WRITE-15. . . . . . .  G560 G563
      582   F-NUMVAL-WRITE-16. . . . . . .  G578 G581
      600   F-NUMVAL-WRITE-17. . . . . . .  G596 G599
      618   F-NUMVAL-WRITE-18. . . . . . .  G614 G617
      635   F-NUMVAL-WRITE-19. . . . . . .  G631 G634
      653   F-NUMVAL-WRITE-20. . . . . . .  G649 G652
      306   F-NUMVAL-01
      323   F-NUMVAL-02
      353   F-NUMVAL-04
      371   F-NUMVAL-05
      389   F-NUMVAL-06
      407   F-NUMVAL-07
      425   F-NUMVAL-08
      443   F-NUMVAL-09
      461   F-NUMVAL-10
      478   F-NUMVAL-11
      495   F-NUMVAL-12
      513   F-NUMVAL-13
      531   F-NUMVAL-14
      549   F-NUMVAL-15
      567   F-NUMVAL-16
      585   F-NUMVAL-17
      603   F-NUMVAL-18
      621   F-NUMVAL-19
      638   F-NUMVAL-20
      195   FAIL . . . . . . . . . . . . .  P315 P332 P345 P363 P381 P399 P417 P435 P453 P470 P487 P505 P523 P541 P559 P577
                                            P595 P613 P630 P648
      272   FAIL-ROUTINE . . . . . . . . .  P204
      286   FAIL-ROUTINE-EX. . . . . . . .  E204 G280
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    19
0 Defined   Cross-reference of procedures   References

0     281   FAIL-ROUTINE-WRITE . . . . . .  G274 G275
      210   HEAD-ROUTINE . . . . . . . . .  P187
      193   INSPT
      183   OPEN-FILES
      194   PASS . . . . . . . . . . . . .  P311 P330 P343 P359 P377 P395 P413 P431 P449 P466 P483 P501 P519 P537 P555 P573
                                            P591 P609 P626 P644
      198   PRINT-DETAIL . . . . . . . . .  P322 P339 P352 P370 P388 P406 P424 P442 P460 P477 P494 P512 P530 P548 P566 P584
                                            P602 P620 P637 P655
      302   SECT-IF125A
      191   TERMINATE-CCVS
      251   WRITE-LINE . . . . . . . . . .  P202 P203 P211 P212 P213 P214 P216 P217 P218 P220 P222 P230 P238 P244 P249 P250
                                            P278 P282 P284 P294
      267   WRT-LN . . . . . . . . . . . .  P257 P258 P259 P260 P261 P262 P263 P266 P271
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    20
0 Defined   Cross-reference of programs     References

        3   IF125A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF125A    Date 06/04/2022  Time 11:59:17   Page    21
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF125A:
 *    Source records = 658
 *    Data Division statements = 73
 *    Procedure Division statements = 371
 *    Generated COBOL statements = 0
 *    Program complexity factor = 381
0End of compilation 1,  program IF125A,  highest severity 0.
0Return code 0
