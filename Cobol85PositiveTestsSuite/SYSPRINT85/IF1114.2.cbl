1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:48   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:48   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1114.2
   000002         000200 PROGRAM-ID.                                                      IF1114.2
   000003         000300     IF111A.                                                      IF1114.2
   000004         000400                                                                  IF1114.2
   000005         000600*                                                         *       IF1114.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1114.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1114.2
   000008         000900* INTEGER.                                                *       IF1114.2
   000009         001000*                                                         *       IF1114.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1114.2
   000011         001300 CONFIGURATION SECTION.                                           IF1114.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1114.2
   000013         001500     XXXXX082.                                                    IF1114.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1114.2
   000015         001700     XXXXX083.                                                    IF1114.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1114.2
   000017         001900 FILE-CONTROL.                                                    IF1114.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1114.2 22
   000019         002100     XXXXX055.                                                    IF1114.2
   000020         002200 DATA DIVISION.                                                   IF1114.2
   000021         002300 FILE SECTION.                                                    IF1114.2
   000022         002400 FD  PRINT-FILE.                                                  IF1114.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1114.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1114.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1114.2
   000026         002900* Variables specific to the Intrinsic Function Test IF111A*       IF1114.2
   000027         003100 01  A                   PIC S9(10)          VALUE 500000.        IF1114.2
   000028         003200 01  B                   PIC S9(10)          VALUE 1.             IF1114.2
   000029         003300 01  E                   PIC S9(6)V9(5)      VALUE 399999.122.    IF1114.2
   000030         003400 01  F                   PIC S9(5)V9(5)      VALUE 0.00032.       IF1114.2
   000031         003500 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1114.2
   000032         003600 01  H                   PIC S9(5)V9(5)      VALUE -5.            IF1114.2
   000033         003700 01  I                   PIC S9(5)V9(5)      VALUE 3.4.           IF1114.2
   000034         003800 01  ARG1                PIC S9(5)V9(5)      VALUE 4.4.           IF1114.2
   000035         003900 01  ARR                                     VALUE "40537".       IF1114.2
   000036         004000     02  IND OCCURS 5 TIMES PIC 9.                                IF1114.2
   000037         004100 01  TEMP                PIC S9(5)V9(5).                          IF1114.2
   000038         004200 01  WS-INT              PIC S9(10).                              IF1114.2
   000039         004300*                                                                 IF1114.2
   000040         004500*                                                                 IF1114.2
   000041         004600 01  TEST-RESULTS.                                                IF1114.2
   000042         004700     02 FILLER                   PIC X      VALUE SPACE.          IF1114.2 IMP
   000043         004800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1114.2 IMP
   000044         004900     02 FILLER                   PIC X      VALUE SPACE.          IF1114.2 IMP
   000045         005000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1114.2 IMP
   000046         005100     02 FILLER                   PIC X      VALUE SPACE.          IF1114.2 IMP
   000047         005200     02  PAR-NAME.                                                IF1114.2
   000048         005300       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1114.2 IMP
   000049         005400       03  PARDOT-X              PIC X      VALUE SPACE.          IF1114.2 IMP
   000050         005500       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1114.2 IMP
   000051         005600     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1114.2 IMP
   000052         005700     02 RE-MARK                  PIC X(61).                       IF1114.2
   000053         005800 01  TEST-COMPUTED.                                               IF1114.2
   000054         005900     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1114.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 FILLER                   PIC X(17)  VALUE                 IF1114.2
   000056         006100            "       COMPUTED=".                                   IF1114.2
   000057         006200     02 COMPUTED-X.                                               IF1114.2
   000058         006300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1114.2 IMP
   000059         006400     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1114.2 58
   000060         006500                                 PIC -9(9).9(9).                  IF1114.2
   000061         006600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1114.2 58
   000062         006700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1114.2 58
   000063         006800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1114.2 58
   000064         006900     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1114.2 58
   000065         007000         04 COMPUTED-18V0                    PIC -9(18).          IF1114.2
   000066         007100         04 FILLER                           PIC X.               IF1114.2
   000067         007200     03 FILLER PIC X(50) VALUE SPACE.                             IF1114.2 IMP
   000068         007300 01  TEST-CORRECT.                                                IF1114.2
   000069         007400     02 FILLER PIC X(30) VALUE SPACE.                             IF1114.2 IMP
   000070         007500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1114.2
   000071         007600     02 CORRECT-X.                                                IF1114.2
   000072         007700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1114.2 IMP
   000073         007800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1114.2 72
   000074         007900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1114.2 72
   000075         008000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1114.2 72
   000076         008100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1114.2 72
   000077         008200     03      CR-18V0 REDEFINES CORRECT-A.                         IF1114.2 72
   000078         008300         04 CORRECT-18V0                     PIC -9(18).          IF1114.2
   000079         008400         04 FILLER                           PIC X.               IF1114.2
   000080         008500     03 FILLER PIC X(2) VALUE SPACE.                              IF1114.2 IMP
   000081         008600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1114.2 IMP
   000082         008700 01  CCVS-C-1.                                                    IF1114.2
   000083         008800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1114.2
   000084         008900-    "SS  PARAGRAPH-NAME                                          IF1114.2
   000085         009000-    "       REMARKS".                                            IF1114.2
   000086         009100     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1114.2 IMP
   000087         009200 01  CCVS-C-2.                                                    IF1114.2
   000088         009300     02 FILLER                     PIC X        VALUE SPACE.      IF1114.2 IMP
   000089         009400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1114.2
   000090         009500     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1114.2 IMP
   000091         009600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1114.2
   000092         009700     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1114.2 IMP
   000093         009800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1114.2 IMP
   000094         009900 01  REC-CT                        PIC 99       VALUE ZERO.       IF1114.2 IMP
   000095         010000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1114.2 IMP
   000096         010100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1114.2 IMP
   000097         010200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1114.2 IMP
   000098         010300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1114.2 IMP
   000099         010400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1114.2 IMP
   000100         010500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1114.2 IMP
   000101         010600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1114.2 IMP
   000102         010700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1114.2 IMP
   000103         010800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1114.2 IMP
   000104         010900 01  CCVS-H-1.                                                    IF1114.2
   000105         011000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1114.2 IMP
   000106         011100     02  FILLER                    PIC X(42)    VALUE             IF1114.2
   000107         011200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1114.2
   000108         011300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1114.2 IMP
   000109         011400 01  CCVS-H-2A.                                                   IF1114.2
   000110         011500   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1114.2 IMP
   000111         011600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700   02  FILLER                        PIC XXXX   VALUE             IF1114.2
   000113         011800     "4.2 ".                                                      IF1114.2
   000114         011900   02  FILLER                        PIC X(28)  VALUE             IF1114.2
   000115         012000            " COPY - NOT FOR DISTRIBUTION".                       IF1114.2
   000116         012100   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1114.2 IMP
   000117         012200                                                                  IF1114.2
   000118         012300 01  CCVS-H-2B.                                                   IF1114.2
   000119         012400   02  FILLER                        PIC X(15)  VALUE             IF1114.2
   000120         012500            "TEST RESULT OF ".                                    IF1114.2
   000121         012600   02  TEST-ID                       PIC X(9).                    IF1114.2
   000122         012700   02  FILLER                        PIC X(4)   VALUE             IF1114.2
   000123         012800            " IN ".                                               IF1114.2
   000124         012900   02  FILLER                        PIC X(12)  VALUE             IF1114.2
   000125         013000     " HIGH       ".                                              IF1114.2
   000126         013100   02  FILLER                        PIC X(22)  VALUE             IF1114.2
   000127         013200            " LEVEL VALIDATION FOR ".                             IF1114.2
   000128         013300   02  FILLER                        PIC X(58)  VALUE             IF1114.2
   000129         013400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1114.2
   000130         013500 01  CCVS-H-3.                                                    IF1114.2
   000131         013600     02  FILLER                      PIC X(34)  VALUE             IF1114.2
   000132         013700            " FOR OFFICIAL USE ONLY    ".                         IF1114.2
   000133         013800     02  FILLER                      PIC X(58)  VALUE             IF1114.2
   000134         013900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1114.2
   000135         014000     02  FILLER                      PIC X(28)  VALUE             IF1114.2
   000136         014100            "  COPYRIGHT   1985 ".                                IF1114.2
   000137         014200 01  CCVS-E-1.                                                    IF1114.2
   000138         014300     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1114.2 IMP
   000139         014400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1114.2
   000140         014500     02 ID-AGAIN                     PIC X(9).                    IF1114.2
   000141         014600     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1114.2 IMP
   000142         014700 01  CCVS-E-2.                                                    IF1114.2
   000143         014800     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1114.2 IMP
   000144         014900     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1114.2 IMP
   000145         015000     02 CCVS-E-2-2.                                               IF1114.2
   000146         015100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1114.2 IMP
   000147         015200         03 FILLER                   PIC X      VALUE SPACE.      IF1114.2 IMP
   000148         015300         03 ENDER-DESC               PIC X(44)  VALUE             IF1114.2
   000149         015400            "ERRORS ENCOUNTERED".                                 IF1114.2
   000150         015500 01  CCVS-E-3.                                                    IF1114.2
   000151         015600     02  FILLER                      PIC X(22)  VALUE             IF1114.2
   000152         015700            " FOR OFFICIAL USE ONLY".                             IF1114.2
   000153         015800     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1114.2 IMP
   000154         015900     02  FILLER                      PIC X(58)  VALUE             IF1114.2
   000155         016000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1114.2
   000156         016100     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1114.2 IMP
   000157         016200     02 FILLER                       PIC X(15)  VALUE             IF1114.2
   000158         016300             " COPYRIGHT 1985".                                   IF1114.2
   000159         016400 01  CCVS-E-4.                                                    IF1114.2
   000160         016500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1114.2 IMP
   000161         016600     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1114.2
   000162         016700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1114.2 IMP
   000163         016800     02 FILLER                       PIC X(40)  VALUE             IF1114.2
   000164         016900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1114.2
   000165         017000 01  XXINFO.                                                      IF1114.2
   000166         017100     02 FILLER                       PIC X(19)  VALUE             IF1114.2
   000167         017200            "*** INFORMATION ***".                                IF1114.2
   000168         017300     02 INFO-TEXT.                                                IF1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1114.2 IMP
   000170         017500       04 XXCOMPUTED                 PIC X(20).                   IF1114.2
   000171         017600       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1114.2 IMP
   000172         017700       04 XXCORRECT                  PIC X(20).                   IF1114.2
   000173         017800     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1114.2
   000174         017900 01  HYPHEN-LINE.                                                 IF1114.2
   000175         018000     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1114.2 IMP
   000176         018100     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1114.2
   000177         018200-    "*****************************************".                 IF1114.2
   000178         018300     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1114.2
   000179         018400-    "******************************".                            IF1114.2
   000180         018500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1114.2
   000181         018600     "IF111A".                                                    IF1114.2
   000182         018700 PROCEDURE DIVISION.                                              IF1114.2
   000183         018800 CCVS1 SECTION.                                                   IF1114.2
   000184         018900 OPEN-FILES.                                                      IF1114.2
   000185         019000     OPEN     OUTPUT PRINT-FILE.                                  IF1114.2 22
   000186         019100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1114.2 180 121 180 140
   000187         019200     MOVE    SPACE TO TEST-RESULTS.                               IF1114.2 IMP 41
   000188         019300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1114.2 211 216
   000189         019400     GO TO CCVS1-EXIT.                                            IF1114.2 298
   000190         019500 CLOSE-FILES.                                                     IF1114.2
   000191         019600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1114.2 220 240 22
   000192         019700 TERMINATE-CCVS.                                                  IF1114.2
   000193         019800     STOP     RUN.                                                IF1114.2
   000194         019900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1114.2 45 97
   000195         020000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1114.2 45 98
   000196         020100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1114.2 45 96
   000197         020200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1114.2 45 95
   000198         020300     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1114.2 52
   000199         020400 PRINT-DETAIL.                                                    IF1114.2
   000200         020500     IF REC-CT NOT EQUAL TO ZERO                                  IF1114.2 94 IMP
   000201      1  020600             MOVE "." TO PARDOT-X                                 IF1114.2 49
   000202      1  020700             MOVE REC-CT TO DOTVALUE.                             IF1114.2 94 50
   000203         020800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1114.2 41 23 252
   000204         020900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1114.2 45 252
   000205      1  021000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1114.2 273 287
   000206      1  021100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1114.2 288 297
   000207         021200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1114.2 IMP 45 IMP 57
   000208         021300     MOVE SPACE TO CORRECT-X.                                     IF1114.2 IMP 71
   000209         021400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1114.2 94 IMP IMP 47
   000210         021500     MOVE     SPACE TO RE-MARK.                                   IF1114.2 IMP 52
   000211         021600 HEAD-ROUTINE.                                                    IF1114.2
   000212         021700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1114.2 104 24 252
   000213         021800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1114.2 109 24 252
   000214         021900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1114.2 118 24 252
   000215         022000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1114.2 130 24 252
   000216         022100 COLUMN-NAMES-ROUTINE.                                            IF1114.2
   000217         022200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1114.2 82 24 252
   000218         022300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1114.2 87 24 252
   000219         022400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1114.2 174 24 252
   000220         022500 END-ROUTINE.                                                     IF1114.2
   000221         022600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1114.2 174 24 252
   000222         022700 END-RTN-EXIT.                                                    IF1114.2
   000223         022800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1114.2 137 24 252
   000224         022900 END-ROUTINE-1.                                                   IF1114.2
   000225         023000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1114.2 96 100 97
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1114.2 100 95 100
   000227         023200      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1114.2 98 100
   000228         023300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1114.2 98 160
   000229         023400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1114.2 100 162
   000230         023500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1114.2 159 145
   000231         023600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1114.2 142 24 252
   000232         023700  END-ROUTINE-12.                                                 IF1114.2
   000233         023800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1114.2 148
   000234         023900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1114.2 96 IMP
   000235      1  024000         MOVE "NO " TO ERROR-TOTAL                                IF1114.2 146
   000236         024100         ELSE                                                     IF1114.2
   000237      1  024200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1114.2 96 146
   000238         024300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1114.2 142 24
   000239         024400     PERFORM WRITE-LINE.                                          IF1114.2 252
   000240         024500 END-ROUTINE-13.                                                  IF1114.2
   000241         024600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1114.2 95 IMP
   000242      1  024700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1114.2 146
   000243      1  024800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1114.2 95 146
   000244         024900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1114.2 148
   000245         025000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1114.2 142 24 252
   000246         025100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1114.2 97 IMP
   000247      1  025200          MOVE "NO " TO ERROR-TOTAL                               IF1114.2 146
   000248      1  025300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1114.2 97 146
   000249         025400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1114.2 148
   000250         025500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1114.2 142 24 252
   000251         025600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1114.2 150 24 252
   000252         025700 WRITE-LINE.                                                      IF1114.2
   000253         025800     ADD 1 TO RECORD-COUNT.                                       IF1114.2 102
   000254         025900     IF RECORD-COUNT GREATER 42                                   IF1114.2 102
   000255      1  026000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1114.2 24 101
   000256      1  026100         MOVE SPACE TO DUMMY-RECORD                               IF1114.2 IMP 24
   000257      1  026200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1114.2 24
   000258      1  026300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1114.2 104 24 268
   000259      1  026400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1114.2 109 24 268
   000260      1  026500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1114.2 118 24 268
   000261      1  026600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1114.2 130 24 268
   000262      1  026700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1114.2 82 24 268
   000263      1  026800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1114.2 87 24 268
   000264      1  026900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1114.2 174 24 268
   000265      1  027000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1114.2 101 24
   000266      1  027100         MOVE ZERO TO RECORD-COUNT.                               IF1114.2 IMP 102
   000267         027200     PERFORM WRT-LN.                                              IF1114.2 268
   000268         027300 WRT-LN.                                                          IF1114.2
   000269         027400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1114.2 24
   000270         027500     MOVE SPACE TO DUMMY-RECORD.                                  IF1114.2 IMP 24
   000271         027600 BLANK-LINE-PRINT.                                                IF1114.2
   000272         027700     PERFORM WRT-LN.                                              IF1114.2 268
   000273         027800 FAIL-ROUTINE.                                                    IF1114.2
   000274         027900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1114.2 57 IMP
   000275      1  028000            GO TO FAIL-ROUTINE-WRITE.                             IF1114.2 282
   000276         028100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1114.2 71 IMP 282
   000277         028200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1114.2 103 173
   000278         028300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1114.2 168
   000279         028400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1114.2 165 24 252
   000280         028500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1114.2 IMP 173
   000281         028600     GO TO  FAIL-ROUTINE-EX.                                      IF1114.2 287
   000282         028700 FAIL-ROUTINE-WRITE.                                              IF1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IF1114.2 53 23 252
   000284         028900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IF1114.2 103 81
   000285         029000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IF1114.2 68 23 252
   000286         029100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1114.2 IMP 81
   000287         029200 FAIL-ROUTINE-EX. EXIT.                                           IF1114.2
   000288         029300 BAIL-OUT.                                                        IF1114.2
   000289         029400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1114.2 58 IMP 291
   000290         029500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1114.2 72 IMP 297
   000291         029600 BAIL-OUT-WRITE.                                                  IF1114.2
   000292         029700     MOVE CORRECT-A TO XXCORRECT.                                 IF1114.2 72 172
   000293         029800     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1114.2 58 170
   000294         029900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1114.2 103 173
   000295         030000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1114.2 165 24 252
   000296         030100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1114.2 IMP 173
   000297         030200 BAIL-OUT-EX. EXIT.                                               IF1114.2
   000298         030300 CCVS1-EXIT.                                                      IF1114.2
   000299         030400     EXIT.                                                        IF1114.2
   000300         030600*                                                      *          IF1114.2
   000301         030700*    Intrinsic Function Tests         IF111A - INTEGER    *       IF1114.2
   000302         030800*                                                      *          IF1114.2
   000303         031000 SECT-IF111A SECTION.                                             IF1114.2
   000304         031100 F-INTEGER-INFO.                                                  IF1114.2
   000305         031200     MOVE     "See ref. A-44 2.15" TO ANSI-REFERENCE.             IF1114.2 103
   000306         031300     MOVE     "INTEGER Function"     TO FEATURE.                  IF1114.2 43
   000307         031500 F-INTEGER-01.                                                    IF1114.2
   000308         031600     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000309         031700 F-INTEGER-TEST-01.                                               IF1114.2
   000310         031800     COMPUTE WS-INT = FUNCTION INTEGER(0).                        IF1114.2 38 IFN
   000311         031900     IF WS-INT = 0 THEN                                           IF1114.2 38
   000312      1  032000                    PERFORM PASS                                  IF1114.2 195
   000313         032100     ELSE                                                         IF1114.2
   000314      1  032200                    MOVE  0  TO CORRECT-N                         IF1114.2 73
   000315      1  032300                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000316      1  032400                    PERFORM FAIL.                                 IF1114.2 196
   000317         032500     GO TO F-INTEGER-WRITE-01.                                    IF1114.2 321
   000318         032600 F-INTEGER-DELETE-01.                                             IF1114.2
   000319         032700     PERFORM  DE-LETE.                                            IF1114.2 197
   000320         032800     GO TO    F-INTEGER-WRITE-01.                                 IF1114.2 321
   000321         032900 F-INTEGER-WRITE-01.                                              IF1114.2
   000322         033000     MOVE "F-INTEGER-01" TO PAR-NAME.                             IF1114.2 47
   000323         033100     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000324         033300 F-INTEGER-02.                                                    IF1114.2
   000325         033400     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000326         033500 F-INTEGER-TEST-02.                                               IF1114.2
   000327         033600     EVALUATE FUNCTION INTEGER(3)                                 IF1114.2 IFN
   000328         033700     WHEN 3                                                       IF1114.2
   000329      1  033800        PERFORM PASS                                              IF1114.2 195
   000330      1  033900        GO TO F-INTEGER-WRITE-02.                                 IF1114.2 336
   000331         034000     PERFORM FAIL.                                                IF1114.2 196
   000332         034100     GO TO F-INTEGER-WRITE-02.                                    IF1114.2 336
   000333         034200 F-INTEGER-DELETE-02.                                             IF1114.2
   000334         034300     PERFORM  DE-LETE.                                            IF1114.2 197
   000335         034400     GO TO    F-INTEGER-WRITE-02.                                 IF1114.2 336
   000336         034500 F-INTEGER-WRITE-02.                                              IF1114.2
   000337         034600     MOVE "F-INTEGER-02" TO PAR-NAME.                             IF1114.2 47
   000338         034700     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000339         034900 F-INTEGER-03.                                                    IF1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         035000     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000341         035100 F-INTEGER-TEST-03.                                               IF1114.2
   000342         035200     IF FUNCTION INTEGER(4.578) = 4 THEN                          IF1114.2 IFN
   000343      1  035300                    PERFORM PASS                                  IF1114.2 195
   000344         035400     ELSE                                                         IF1114.2
   000345      1  035500                    MOVE  4  TO CORRECT-N                         IF1114.2 73
   000346      1  035600                    PERFORM FAIL.                                 IF1114.2 196
   000347         035700     GO TO F-INTEGER-WRITE-03.                                    IF1114.2 351
   000348         035800 F-INTEGER-DELETE-03.                                             IF1114.2
   000349         035900     PERFORM  DE-LETE.                                            IF1114.2 197
   000350         036000     GO TO    F-INTEGER-WRITE-03.                                 IF1114.2 351
   000351         036100 F-INTEGER-WRITE-03.                                              IF1114.2
   000352         036200     MOVE "F-INTEGER-03" TO PAR-NAME.                             IF1114.2 47
   000353         036300     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000354         036500 F-INTEGER-04.                                                    IF1114.2
   000355         036600     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000356         036700 F-INTEGER-TEST-04.                                               IF1114.2
   000357         036800     COMPUTE WS-INT = FUNCTION INTEGER(-58).                      IF1114.2 38 IFN
   000358         036900     IF WS-INT = -58 THEN                                         IF1114.2 38
   000359      1  037000                    PERFORM PASS                                  IF1114.2 195
   000360         037100     ELSE                                                         IF1114.2
   000361      1  037200                    MOVE  -58  TO CORRECT-N                       IF1114.2 73
   000362      1  037300                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000363      1  037400                    PERFORM FAIL.                                 IF1114.2 196
   000364         037500     GO TO F-INTEGER-WRITE-04.                                    IF1114.2 368
   000365         037600 F-INTEGER-DELETE-04.                                             IF1114.2
   000366         037700     PERFORM  DE-LETE.                                            IF1114.2 197
   000367         037800     GO TO    F-INTEGER-WRITE-04.                                 IF1114.2 368
   000368         037900 F-INTEGER-WRITE-04.                                              IF1114.2
   000369         038000     MOVE "F-INTEGER-04" TO PAR-NAME.                             IF1114.2 47
   000370         038100     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000371         038300 F-INTEGER-05.                                                    IF1114.2
   000372         038400     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000373         038500 F-INTEGER-TEST-05.                                               IF1114.2
   000374         038600     COMPUTE WS-INT = FUNCTION INTEGER(-9.763).                   IF1114.2 38 IFN
   000375         038700     IF WS-INT = -10 THEN                                         IF1114.2 38
   000376      1  038800                    PERFORM PASS                                  IF1114.2 195
   000377         038900     ELSE                                                         IF1114.2
   000378      1  039000                    MOVE -10  TO CORRECT-N                        IF1114.2 73
   000379      1  039100                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000380      1  039200                    PERFORM FAIL.                                 IF1114.2 196
   000381         039300     GO TO F-INTEGER-WRITE-05.                                    IF1114.2 385
   000382         039400 F-INTEGER-DELETE-05.                                             IF1114.2
   000383         039500     PERFORM  DE-LETE.                                            IF1114.2 197
   000384         039600     GO TO    F-INTEGER-WRITE-05.                                 IF1114.2 385
   000385         039700 F-INTEGER-WRITE-05.                                              IF1114.2
   000386         039800     MOVE "F-INTEGER-05" TO PAR-NAME.                             IF1114.2 47
   000387         039900     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000388         040100 F-INTEGER-06.                                                    IF1114.2
   000389         040200     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000390         040300 F-INTEGER-TEST-06.                                               IF1114.2
   000391         040400     COMPUTE WS-INT = FUNCTION INTEGER(320485).                   IF1114.2 38 IFN
   000392         040500     IF WS-INT = 320485 THEN                                      IF1114.2 38
   000393      1  040600                    PERFORM PASS                                  IF1114.2 195
   000394         040700     ELSE                                                         IF1114.2
   000395      1  040800                    MOVE  320485  TO CORRECT-N                    IF1114.2 73
   000396      1  040900                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  041000                    PERFORM FAIL.                                 IF1114.2 196
   000398         041100     GO TO F-INTEGER-WRITE-06.                                    IF1114.2 402
   000399         041200 F-INTEGER-DELETE-06.                                             IF1114.2
   000400         041300     PERFORM  DE-LETE.                                            IF1114.2 197
   000401         041400     GO TO    F-INTEGER-WRITE-06.                                 IF1114.2 402
   000402         041500 F-INTEGER-WRITE-06.                                              IF1114.2
   000403         041600     MOVE "F-INTEGER-06" TO PAR-NAME.                             IF1114.2 47
   000404         041700     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000405         041900 F-INTEGER-07.                                                    IF1114.2
   000406         042000     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000407         042100 F-INTEGER-TEST-07.                                               IF1114.2
   000408         042200     COMPUTE WS-INT = FUNCTION INTEGER(230492.4828).              IF1114.2 38 IFN
   000409         042300     IF WS-INT = 230492 THEN                                      IF1114.2 38
   000410      1  042400                    PERFORM PASS                                  IF1114.2 195
   000411         042500     ELSE                                                         IF1114.2
   000412      1  042600                    MOVE  230492  TO CORRECT-N                    IF1114.2 73
   000413      1  042700                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000414      1  042800                    PERFORM FAIL.                                 IF1114.2 196
   000415         042900     GO TO F-INTEGER-WRITE-07.                                    IF1114.2 419
   000416         043000 F-INTEGER-DELETE-07.                                             IF1114.2
   000417         043100     PERFORM  DE-LETE.                                            IF1114.2 197
   000418         043200     GO TO    F-INTEGER-WRITE-07.                                 IF1114.2 419
   000419         043300 F-INTEGER-WRITE-07.                                              IF1114.2
   000420         043400     MOVE "F-INTEGER-07" TO PAR-NAME.                             IF1114.2 47
   000421         043500     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000422         043700 F-INTEGER-08.                                                    IF1114.2
   000423         043800     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000424         043900 F-INTEGER-TEST-08.                                               IF1114.2
   000425         044000     COMPUTE WS-INT = FUNCTION INTEGER(0.00032).                  IF1114.2 38 IFN
   000426         044100     IF WS-INT = 0 THEN                                           IF1114.2 38
   000427      1  044200                    PERFORM PASS                                  IF1114.2 195
   000428         044300     ELSE                                                         IF1114.2
   000429      1  044400                    MOVE  0  TO CORRECT-N                         IF1114.2 73
   000430      1  044500                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000431      1  044600                    PERFORM FAIL.                                 IF1114.2 196
   000432         044700     GO TO F-INTEGER-WRITE-08.                                    IF1114.2 436
   000433         044800 F-INTEGER-DELETE-08.                                             IF1114.2
   000434         044900     PERFORM  DE-LETE.                                            IF1114.2 197
   000435         045000     GO TO    F-INTEGER-WRITE-08.                                 IF1114.2 436
   000436         045100 F-INTEGER-WRITE-08.                                              IF1114.2
   000437         045200     MOVE "F-INTEGER-08" TO PAR-NAME.                             IF1114.2 47
   000438         045300     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000439         045500 F-INTEGER-09.                                                    IF1114.2
   000440         045600     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000441         045700 F-INTEGER-TEST-09.                                               IF1114.2
   000442         045800     COMPUTE WS-INT = FUNCTION INTEGER(A).                        IF1114.2 38 IFN 27
   000443         045900     IF WS-INT = 500000 THEN                                      IF1114.2 38
   000444      1  046000                    PERFORM PASS                                  IF1114.2 195
   000445         046100     ELSE                                                         IF1114.2
   000446      1  046200                    MOVE  500000  TO CORRECT-N                    IF1114.2 73
   000447      1  046300                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000448      1  046400                    PERFORM FAIL.                                 IF1114.2 196
   000449         046500     GO TO F-INTEGER-WRITE-09.                                    IF1114.2 453
   000450         046600 F-INTEGER-DELETE-09.                                             IF1114.2
   000451         046700     PERFORM  DE-LETE.                                            IF1114.2 197
   000452         046800     GO TO    F-INTEGER-WRITE-09.                                 IF1114.2 453
   000453         046900 F-INTEGER-WRITE-09.                                              IF1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         047000     MOVE "F-INTEGER-09" TO PAR-NAME.                             IF1114.2 47
   000455         047100     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000456         047300 F-INTEGER-10.                                                    IF1114.2
   000457         047400     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000458         047500 F-INTEGER-TEST-10.                                               IF1114.2
   000459         047600     COMPUTE WS-INT = FUNCTION INTEGER(E).                        IF1114.2 38 IFN 29
   000460         047700     IF WS-INT = 399999 THEN                                      IF1114.2 38
   000461      1  047800                    PERFORM PASS                                  IF1114.2 195
   000462         047900     ELSE                                                         IF1114.2
   000463      1  048000                    MOVE  399999  TO CORRECT-N                    IF1114.2 73
   000464      1  048100                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000465      1  048200                    PERFORM FAIL.                                 IF1114.2 196
   000466         048300     GO TO F-INTEGER-WRITE-10.                                    IF1114.2 470
   000467         048400 F-INTEGER-DELETE-10.                                             IF1114.2
   000468         048500     PERFORM  DE-LETE.                                            IF1114.2 197
   000469         048600     GO TO    F-INTEGER-WRITE-10.                                 IF1114.2 470
   000470         048700 F-INTEGER-WRITE-10.                                              IF1114.2
   000471         048800     MOVE "F-INTEGER-10" TO PAR-NAME.                             IF1114.2 47
   000472         048900     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000473         049100 F-INTEGER-11.                                                    IF1114.2
   000474         049200     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000475         049300 F-INTEGER-TEST-11.                                               IF1114.2
   000476         049400     COMPUTE WS-INT = FUNCTION INTEGER(B).                        IF1114.2 38 IFN 28
   000477         049500     IF WS-INT = 1 THEN                                           IF1114.2 38
   000478      1  049600                    PERFORM PASS                                  IF1114.2 195
   000479         049700     ELSE                                                         IF1114.2
   000480      1  049800                    MOVE  1  TO CORRECT-N                         IF1114.2 73
   000481      1  049900                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000482      1  050000                    PERFORM FAIL.                                 IF1114.2 196
   000483         050100     GO TO F-INTEGER-WRITE-11.                                    IF1114.2 487
   000484         050200 F-INTEGER-DELETE-11.                                             IF1114.2
   000485         050300     PERFORM  DE-LETE.                                            IF1114.2 197
   000486         050400     GO TO    F-INTEGER-WRITE-11.                                 IF1114.2 487
   000487         050500 F-INTEGER-WRITE-11.                                              IF1114.2
   000488         050600     MOVE "F-INTEGER-11" TO PAR-NAME.                             IF1114.2 47
   000489         050700     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000490         050900 F-INTEGER-12.                                                    IF1114.2
   000491         051000     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000492         051100 F-INTEGER-TEST-12.                                               IF1114.2
   000493         051200     COMPUTE WS-INT = FUNCTION INTEGER(F).                        IF1114.2 38 IFN 30
   000494         051300     IF WS-INT = 0 THEN                                           IF1114.2 38
   000495      1  051400                    PERFORM PASS                                  IF1114.2 195
   000496         051500     ELSE                                                         IF1114.2
   000497      1  051600                    MOVE  0  TO CORRECT-N                         IF1114.2 73
   000498      1  051700                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000499      1  051800                    PERFORM FAIL.                                 IF1114.2 196
   000500         051900     GO TO F-INTEGER-WRITE-12.                                    IF1114.2 504
   000501         052000 F-INTEGER-DELETE-12.                                             IF1114.2
   000502         052100     PERFORM  DE-LETE.                                            IF1114.2 197
   000503         052200     GO TO    F-INTEGER-WRITE-12.                                 IF1114.2 504
   000504         052300 F-INTEGER-WRITE-12.                                              IF1114.2
   000505         052400     MOVE "F-INTEGER-12" TO PAR-NAME.                             IF1114.2 47
   000506         052500     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000507         052700 F-INTEGER-13.                                                    IF1114.2
   000508         052800     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000509         052900 F-INTEGER-TEST-13.                                               IF1114.2
   000510         053000     COMPUTE WS-INT = FUNCTION INTEGER(IND(2)).                   IF1114.2 38 IFN 36
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         053100     IF WS-INT = 0 THEN                                           IF1114.2 38
   000512      1  053200                    PERFORM PASS                                  IF1114.2 195
   000513         053300     ELSE                                                         IF1114.2
   000514      1  053400                    MOVE  0  TO CORRECT-N                         IF1114.2 73
   000515      1  053500                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000516      1  053600                    PERFORM FAIL.                                 IF1114.2 196
   000517         053700     GO TO F-INTEGER-WRITE-13.                                    IF1114.2 521
   000518         053800 F-INTEGER-DELETE-13.                                             IF1114.2
   000519         053900     PERFORM  DE-LETE.                                            IF1114.2 197
   000520         054000     GO TO    F-INTEGER-WRITE-13.                                 IF1114.2 521
   000521         054100 F-INTEGER-WRITE-13.                                              IF1114.2
   000522         054200     MOVE "F-INTEGER-13" TO PAR-NAME.                             IF1114.2 47
   000523         054300     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000524         054500 F-INTEGER-14.                                                    IF1114.2
   000525         054600     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000526         054700 F-INTEGER-TEST-14.                                               IF1114.2
   000527         054800     COMPUTE WS-INT = FUNCTION INTEGER(IND(B)).                   IF1114.2 38 IFN 36 28
   000528         054900     IF WS-INT = 4 THEN                                           IF1114.2 38
   000529      1  055000                    PERFORM PASS                                  IF1114.2 195
   000530         055100     ELSE                                                         IF1114.2
   000531      1  055200                    MOVE  4  TO CORRECT-N                         IF1114.2 73
   000532      1  055300                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000533      1  055400                    PERFORM FAIL.                                 IF1114.2 196
   000534         055500     GO TO F-INTEGER-WRITE-14.                                    IF1114.2 538
   000535         055600 F-INTEGER-DELETE-14.                                             IF1114.2
   000536         055700     PERFORM  DE-LETE.                                            IF1114.2 197
   000537         055800     GO TO    F-INTEGER-WRITE-14.                                 IF1114.2 538
   000538         055900 F-INTEGER-WRITE-14.                                              IF1114.2
   000539         056000     MOVE "F-INTEGER-14" TO PAR-NAME.                             IF1114.2 47
   000540         056100     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000541         056300 F-INTEGER-15.                                                    IF1114.2
   000542         056400     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000543         056500 F-INTEGER-TEST-15.                                               IF1114.2
   000544         056600     COMPUTE WS-INT = FUNCTION INTEGER((6 / 3) + 9).              IF1114.2 38 IFN
   000545         056700     IF WS-INT = 11 THEN                                          IF1114.2 38
   000546      1  056800                    PERFORM PASS                                  IF1114.2 195
   000547         056900     ELSE                                                         IF1114.2
   000548      1  057000                    MOVE  11  TO CORRECT-N                        IF1114.2 73
   000549      1  057100                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000550      1  057200                    PERFORM FAIL.                                 IF1114.2 196
   000551         057300     GO TO F-INTEGER-WRITE-15.                                    IF1114.2 555
   000552         057400 F-INTEGER-DELETE-15.                                             IF1114.2
   000553         057500     PERFORM  DE-LETE.                                            IF1114.2 197
   000554         057600     GO TO    F-INTEGER-WRITE-15.                                 IF1114.2 555
   000555         057700 F-INTEGER-WRITE-15.                                              IF1114.2
   000556         057800     MOVE "F-INTEGER-15" TO PAR-NAME.                             IF1114.2 47
   000557         057900     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000558         058100 F-INTEGER-16.                                                    IF1114.2
   000559         058200     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000560         058300 F-INTEGER-TEST-16.                                               IF1114.2
   000561         058400     COMPUTE WS-INT = FUNCTION INTEGER(H + B).                    IF1114.2 38 IFN 32 28
   000562         058500     IF WS-INT = -4 THEN                                          IF1114.2 38
   000563      1  058600                    PERFORM PASS                                  IF1114.2 195
   000564         058700     ELSE                                                         IF1114.2
   000565      1  058800                    MOVE  -4  TO CORRECT-N                        IF1114.2 73
   000566      1  058900                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000567      1  059000                    PERFORM FAIL.                                 IF1114.2 196
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         059100     GO TO F-INTEGER-WRITE-16.                                    IF1114.2 572
   000569         059200 F-INTEGER-DELETE-16.                                             IF1114.2
   000570         059300     PERFORM  DE-LETE.                                            IF1114.2 197
   000571         059400     GO TO    F-INTEGER-WRITE-16.                                 IF1114.2 572
   000572         059500 F-INTEGER-WRITE-16.                                              IF1114.2
   000573         059600     MOVE "F-INTEGER-16" TO PAR-NAME.                             IF1114.2 47
   000574         059700     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000575         059900 F-INTEGER-17.                                                    IF1114.2
   000576         060000     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000577         060100 F-INTEGER-TEST-17.                                               IF1114.2
   000578         060200     COMPUTE WS-INT = FUNCTION INTEGER(6.3 - 4.2 / 2).            IF1114.2 38 IFN
   000579         060300     IF WS-INT = 4 THEN                                           IF1114.2 38
   000580      1  060400                    PERFORM PASS                                  IF1114.2 195
   000581         060500     ELSE                                                         IF1114.2
   000582      1  060600                    MOVE  4  TO CORRECT-N                         IF1114.2 73
   000583      1  060700                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000584      1  060800                    PERFORM FAIL.                                 IF1114.2 196
   000585         060900     GO TO F-INTEGER-WRITE-17.                                    IF1114.2 589
   000586         061000 F-INTEGER-DELETE-17.                                             IF1114.2
   000587         061100     PERFORM  DE-LETE.                                            IF1114.2 197
   000588         061200     GO TO    F-INTEGER-WRITE-17.                                 IF1114.2 589
   000589         061300 F-INTEGER-WRITE-17.                                              IF1114.2
   000590         061400     MOVE "F-INTEGER-17" TO PAR-NAME.                             IF1114.2 47
   000591         061500     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000592         061700 F-INTEGER-18.                                                    IF1114.2
   000593         061800     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000594         061900 F-INTEGER-TEST-18.                                               IF1114.2
   000595         062000     COMPUTE WS-INT = FUNCTION INTEGER((H + G) * I).              IF1114.2 38 IFN 32 31 33
   000596         062100     IF WS-INT = -4 THEN                                          IF1114.2 38
   000597      1  062200                    PERFORM PASS                                  IF1114.2 195
   000598         062300     ELSE                                                         IF1114.2
   000599      1  062400                    MOVE  -4  TO CORRECT-N                        IF1114.2 73
   000600      1  062500                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000601      1  062600                    PERFORM FAIL.                                 IF1114.2 196
   000602         062700     GO TO F-INTEGER-WRITE-18.                                    IF1114.2 606
   000603         062800 F-INTEGER-DELETE-18.                                             IF1114.2
   000604         062900     PERFORM  DE-LETE.                                            IF1114.2 197
   000605         063000     GO TO    F-INTEGER-WRITE-18.                                 IF1114.2 606
   000606         063100 F-INTEGER-WRITE-18.                                              IF1114.2
   000607         063200     MOVE "F-INTEGER-18" TO PAR-NAME.                             IF1114.2 47
   000608         063300     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000609         063500 F-INTEGER-19.                                                    IF1114.2
   000610         063600     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000611         063700 F-INTEGER-TEST-19.                                               IF1114.2
   000612         063800     COMPUTE WS-INT = FUNCTION INTEGER(H / 5).                    IF1114.2 38 IFN 32
   000613         063900     IF WS-INT = -1 THEN                                          IF1114.2 38
   000614      1  064000                    PERFORM PASS                                  IF1114.2 195
   000615         064100     ELSE                                                         IF1114.2
   000616      1  064200                    MOVE  -1  TO CORRECT-N                        IF1114.2 73
   000617      1  064300                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000618      1  064400                    PERFORM FAIL.                                 IF1114.2 196
   000619         064500     GO TO F-INTEGER-WRITE-19.                                    IF1114.2 623
   000620         064600 F-INTEGER-DELETE-19.                                             IF1114.2
   000621         064700     PERFORM  DE-LETE.                                            IF1114.2 197
   000622         064800     GO TO    F-INTEGER-WRITE-19.                                 IF1114.2 623
   000623         064900 F-INTEGER-WRITE-19.                                              IF1114.2
   000624         065000     MOVE "F-INTEGER-19" TO PAR-NAME.                             IF1114.2 47
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         065100     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000626         065300 F-INTEGER-20.                                                    IF1114.2
   000627         065400     MOVE ZERO TO TEMP.                                           IF1114.2 IMP 37
   000628         065500 F-INTEGER-TEST-20.                                               IF1114.2
   000629         065600     COMPUTE TEMP = FUNCTION INTEGER(3.2) + I.                    IF1114.2 37 IFN 33
   000630         065700     IF (TEMP >= 6.39987) AND                                     IF1114.2 37
   000631         065800        (TEMP <= 6.40013)                                         IF1114.2 37
   000632      1  065900                    PERFORM PASS                                  IF1114.2 195
   000633         066000     ELSE                                                         IF1114.2
   000634      1  066100                    MOVE  6.4  TO CORRECT-N                       IF1114.2 73
   000635      1  066200                    MOVE TEMP TO COMPUTED-N                       IF1114.2 37 59
   000636      1  066300                    PERFORM FAIL.                                 IF1114.2 196
   000637         066400     GO TO F-INTEGER-WRITE-20.                                    IF1114.2 641
   000638         066500 F-INTEGER-DELETE-20.                                             IF1114.2
   000639         066600     PERFORM  DE-LETE.                                            IF1114.2 197
   000640         066700     GO TO    F-INTEGER-WRITE-20.                                 IF1114.2 641
   000641         066800 F-INTEGER-WRITE-20.                                              IF1114.2
   000642         066900     MOVE "F-INTEGER-20" TO PAR-NAME.                             IF1114.2 47
   000643         067000     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000644         067200 F-INTEGER-21.                                                    IF1114.2
   000645         067300     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000646         067400 F-INTEGER-TEST-21.                                               IF1114.2
   000647         067500     COMPUTE WS-INT = FUNCTION INTEGER(FUNCTION INTEGER(1.6)).    IF1114.2 38 IFN IFN
   000648         067600     IF WS-INT = 1 THEN                                           IF1114.2 38
   000649      1  067700                    PERFORM PASS                                  IF1114.2 195
   000650         067800     ELSE                                                         IF1114.2
   000651      1  067900                    MOVE  1  TO CORRECT-N                         IF1114.2 73
   000652      1  068000                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000653      1  068100                    PERFORM FAIL.                                 IF1114.2 196
   000654         068200     GO TO F-INTEGER-WRITE-21.                                    IF1114.2 658
   000655         068300 F-INTEGER-DELETE-21.                                             IF1114.2
   000656         068400     PERFORM  DE-LETE.                                            IF1114.2 197
   000657         068500     GO TO    F-INTEGER-WRITE-21.                                 IF1114.2 658
   000658         068600 F-INTEGER-WRITE-21.                                              IF1114.2
   000659         068700     MOVE "F-INTEGER-21" TO PAR-NAME.                             IF1114.2 47
   000660         068800     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000661         069000 F-INTEGER-22.                                                    IF1114.2
   000662         069100     MOVE ZERO TO WS-INT.                                         IF1114.2 IMP 38
   000663         069200 F-INTEGER-TEST-22.                                               IF1114.2
   000664         069300     COMPUTE WS-INT = FUNCTION INTEGER(1.2) +                     IF1114.2 38 IFN
   000665         069400                      FUNCTION INTEGER(1.6).                      IF1114.2 IFN
   000666         069500     IF WS-INT = 2 THEN                                           IF1114.2 38
   000667      1  069600                    PERFORM PASS                                  IF1114.2 195
   000668         069700     ELSE                                                         IF1114.2
   000669      1  069800                    MOVE  2  TO CORRECT-N                         IF1114.2 73
   000670      1  069900                    MOVE WS-INT TO COMPUTED-N                     IF1114.2 38 59
   000671      1  070000                    PERFORM FAIL.                                 IF1114.2 196
   000672         070100     GO TO F-INTEGER-WRITE-22.                                    IF1114.2 676
   000673         070200 F-INTEGER-DELETE-22.                                             IF1114.2
   000674         070300     PERFORM  DE-LETE.                                            IF1114.2 197
   000675         070400     GO TO    F-INTEGER-WRITE-22.                                 IF1114.2 676
   000676         070500 F-INTEGER-WRITE-22.                                              IF1114.2
   000677         070600     MOVE "F-INTEGER-22" TO PAR-NAME.                             IF1114.2 47
   000678         070700     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000679         070900 F-DATEOFINT-23.                                                  IF1114.2
   000680         071100     PERFORM F-DATEOFINT-TEST-23                                  IF1114.2 688
   000681         071200             UNTIL FUNCTION INTEGER(ARG1) < 0.                    IF1114.2 IFN 34
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         071300     IF ARG1 < 0 THEN                                             IF1114.2 34
   000683      1  071400                            PERFORM PASS                          IF1114.2 195
   000684         071500     ELSE                                                         IF1114.2
   000685      1  071600                            PERFORM FAIL.                         IF1114.2 196
   000686         071700     GO TO F-DATEOFINT-WRITE-23.                                  IF1114.2 694
   000687         071800*                                                                 IF1114.2
   000688         071900 F-DATEOFINT-TEST-23.                                             IF1114.2
   000689         072000     COMPUTE ARG1 = ARG1 - 1.                                     IF1114.2 34 34
   000690         072100*                                                                 IF1114.2
   000691         072200 F-DATEOFINT-DELETE-23.                                           IF1114.2
   000692         072300     PERFORM  DE-LETE.                                            IF1114.2 197
   000693         072400     GO TO    F-DATEOFINT-WRITE-23.                               IF1114.2 694
   000694         072500 F-DATEOFINT-WRITE-23.                                            IF1114.2
   000695         072600     MOVE "F-DATEOFINT-23" TO PAR-NAME.                           IF1114.2 47
   000696         072700     PERFORM  PRINT-DETAIL.                                       IF1114.2 199
   000697         072900 CCVS-EXIT SECTION.                                               IF1114.2
   000698         073000 CCVS-999999.                                                     IF1114.2
   000699         073100     GO TO CLOSE-FILES.                                           IF1114.2 190
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  442
      103   ANSI-REFERENCE . . . . . . . .  277 284 294 M305
       34   ARG1 . . . . . . . . . . . . .  681 682 M689 689
       35   ARR
       28   B. . . . . . . . . . . . . . .  476 527 561
       82   CCVS-C-1 . . . . . . . . . . .  217 262
       87   CCVS-C-2 . . . . . . . . . . .  218 263
      137   CCVS-E-1 . . . . . . . . . . .  223
      142   CCVS-E-2 . . . . . . . . . . .  231 238 245 250
      145   CCVS-E-2-2 . . . . . . . . . .  M230
      150   CCVS-E-3 . . . . . . . . . . .  251
      159   CCVS-E-4 . . . . . . . . . . .  230
      160   CCVS-E-4-1 . . . . . . . . . .  M228
      162   CCVS-E-4-2 . . . . . . . . . .  M229
      104   CCVS-H-1 . . . . . . . . . . .  212 258
      109   CCVS-H-2A. . . . . . . . . . .  213 259
      118   CCVS-H-2B. . . . . . . . . . .  214 260
      130   CCVS-H-3 . . . . . . . . . . .  215 261
      180   CCVS-PGM-ID. . . . . . . . . .  186 186
       64   CM-18V0
       58   COMPUTED-A . . . . . . . . . .  59 61 62 63 64 289 293
       59   COMPUTED-N . . . . . . . . . .  M315 M362 M379 M396 M413 M430 M447 M464 M481 M498 M515 M532 M549 M566 M583 M600
                                            M617 M635 M652 M670
       57   COMPUTED-X . . . . . . . . . .  M207 274
       61   COMPUTED-0V18
       63   COMPUTED-14V4
       65   COMPUTED-18V0
       62   COMPUTED-4V14
       81   COR-ANSI-REFERENCE . . . . . .  M284 M286
       72   CORRECT-A. . . . . . . . . . .  73 74 75 76 77 290 292
       73   CORRECT-N. . . . . . . . . . .  M314 M345 M361 M378 M395 M412 M429 M446 M463 M480 M497 M514 M531 M548 M565 M582
                                            M599 M616 M634 M651 M669
       71   CORRECT-X. . . . . . . . . . .  M208 276
       74   CORRECT-0V18
       76   CORRECT-14V4
       78   CORRECT-18V0
       75   CORRECT-4V14
       77   CR-18V0
       95   DELETE-COUNTER . . . . . . . .  M197 226 241 243
       50   DOTVALUE . . . . . . . . . . .  M202
      101   DUMMY-HOLD . . . . . . . . . .  M255 265
       24   DUMMY-RECORD . . . . . . . . .  M212 M213 M214 M215 M217 M218 M219 M221 M223 M231 M238 M245 M250 M251 255 M256
                                            257 M258 M259 M260 M261 M262 M263 M264 M265 269 M270 M279 M295
       29   E. . . . . . . . . . . . . . .  459
      148   ENDER-DESC . . . . . . . . . .  M233 M244 M249
       96   ERROR-COUNTER. . . . . . . . .  M196 225 234 237
      100   ERROR-HOLD . . . . . . . . . .  M225 M226 M226 M227 229
      146   ERROR-TOTAL. . . . . . . . . .  M235 M237 M242 M243 M247 M248
       30   F. . . . . . . . . . . . . . .  493
       43   FEATURE. . . . . . . . . . . .  M306
       31   G. . . . . . . . . . . . . . .  595
       32   H. . . . . . . . . . . . . . .  561 595 612
      174   HYPHEN-LINE. . . . . . . . . .  219 221 264
       33   I. . . . . . . . . . . . . . .  595 629
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    17
0 Defined   Cross-reference of data names   References

0     140   ID-AGAIN . . . . . . . . . . .  M186
       36   IND. . . . . . . . . . . . . .  510 527
      173   INF-ANSI-REFERENCE . . . . . .  M277 M280 M294 M296
      168   INFO-TEXT. . . . . . . . . . .  M278
       97   INSPECT-COUNTER. . . . . . . .  M194 225 246 248
       45   P-OR-F . . . . . . . . . . . .  M194 M195 M196 M197 204 M207
       47   PAR-NAME . . . . . . . . . . .  M209 M322 M337 M352 M369 M386 M403 M420 M437 M454 M471 M488 M505 M522 M539 M556
                                            M573 M590 M607 M624 M642 M659 M677 M695
       49   PARDOT-X . . . . . . . . . . .  M201
       98   PASS-COUNTER . . . . . . . . .  M195 227 228
       22   PRINT-FILE . . . . . . . . . .  18 185 191
       23   PRINT-REC. . . . . . . . . . .  M203 M283 M285
       52   RE-MARK. . . . . . . . . . . .  M198 M210
       94   REC-CT . . . . . . . . . . . .  200 202 209
       93   REC-SKL-SUB
      102   RECORD-COUNT . . . . . . . . .  M253 254 M266
       37   TEMP . . . . . . . . . . . . .  M627 M629 630 631 635
       53   TEST-COMPUTED. . . . . . . . .  283
       68   TEST-CORRECT . . . . . . . . .  285
      121   TEST-ID. . . . . . . . . . . .  M186
       41   TEST-RESULTS . . . . . . . . .  M187 203
       99   TOTAL-ERROR
       38   WS-INT . . . . . . . . . . . .  M308 M310 311 315 M325 M340 M355 M357 358 362 M372 M374 375 379 M389 M391 392
                                            396 M406 M408 409 413 M423 M425 426 430 M440 M442 443 447 M457 M459 460 464 M474
                                            M476 477 481 M491 M493 494 498 M508 M510 511 515 M525 M527 528 532 M542 M544
                                            545 549 M559 M561 562 566 M576 M578 579 583 M593 M595 596 600 M610 M612 613 617
                                            M645 M647 648 652 M662 M664 666 670
      170   XXCOMPUTED . . . . . . . . . .  M293
      172   XXCORRECT. . . . . . . . . . .  M292
      165   XXINFO . . . . . . . . . . . .  279 295
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    18
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

      288   BAIL-OUT . . . . . . . . . . .  P206
      297   BAIL-OUT-EX. . . . . . . . . .  E206 G290
      291   BAIL-OUT-WRITE . . . . . . . .  G289
      271   BLANK-LINE-PRINT
      697   CCVS-EXIT
      698   CCVS-999999
      183   CCVS1
      298   CCVS1-EXIT . . . . . . . . . .  G189
      190   CLOSE-FILES. . . . . . . . . .  G699
      216   COLUMN-NAMES-ROUTINE . . . . .  E188
      197   DE-LETE. . . . . . . . . . . .  P319 P334 P349 P366 P383 P400 P417 P434 P451 P468 P485 P502 P519 P536 P553 P570
                                            P587 P604 P621 P639 P656 P674 P692
      220   END-ROUTINE. . . . . . . . . .  P191
      224   END-ROUTINE-1
      232   END-ROUTINE-12
      240   END-ROUTINE-13 . . . . . . . .  E191
      222   END-RTN-EXIT
      691   F-DATEOFINT-DELETE-23
      688   F-DATEOFINT-TEST-23. . . . . .  P680
      694   F-DATEOFINT-WRITE-23 . . . . .  G686 G693
      679   F-DATEOFINT-23
      318   F-INTEGER-DELETE-01
      333   F-INTEGER-DELETE-02
      348   F-INTEGER-DELETE-03
      365   F-INTEGER-DELETE-04
      382   F-INTEGER-DELETE-05
      399   F-INTEGER-DELETE-06
      416   F-INTEGER-DELETE-07
      433   F-INTEGER-DELETE-08
      450   F-INTEGER-DELETE-09
      467   F-INTEGER-DELETE-10
      484   F-INTEGER-DELETE-11
      501   F-INTEGER-DELETE-12
      518   F-INTEGER-DELETE-13
      535   F-INTEGER-DELETE-14
      552   F-INTEGER-DELETE-15
      569   F-INTEGER-DELETE-16
      586   F-INTEGER-DELETE-17
      603   F-INTEGER-DELETE-18
      620   F-INTEGER-DELETE-19
      638   F-INTEGER-DELETE-20
      655   F-INTEGER-DELETE-21
      673   F-INTEGER-DELETE-22
      304   F-INTEGER-INFO
      309   F-INTEGER-TEST-01
      326   F-INTEGER-TEST-02
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    19
0 Defined   Cross-reference of procedures   References

0     341   F-INTEGER-TEST-03
      356   F-INTEGER-TEST-04
      373   F-INTEGER-TEST-05
      390   F-INTEGER-TEST-06
      407   F-INTEGER-TEST-07
      424   F-INTEGER-TEST-08
      441   F-INTEGER-TEST-09
      458   F-INTEGER-TEST-10
      475   F-INTEGER-TEST-11
      492   F-INTEGER-TEST-12
      509   F-INTEGER-TEST-13
      526   F-INTEGER-TEST-14
      543   F-INTEGER-TEST-15
      560   F-INTEGER-TEST-16
      577   F-INTEGER-TEST-17
      594   F-INTEGER-TEST-18
      611   F-INTEGER-TEST-19
      628   F-INTEGER-TEST-20
      646   F-INTEGER-TEST-21
      663   F-INTEGER-TEST-22
      321   F-INTEGER-WRITE-01 . . . . . .  G317 G320
      336   F-INTEGER-WRITE-02 . . . . . .  G330 G332 G335
      351   F-INTEGER-WRITE-03 . . . . . .  G347 G350
      368   F-INTEGER-WRITE-04 . . . . . .  G364 G367
      385   F-INTEGER-WRITE-05 . . . . . .  G381 G384
      402   F-INTEGER-WRITE-06 . . . . . .  G398 G401
      419   F-INTEGER-WRITE-07 . . . . . .  G415 G418
      436   F-INTEGER-WRITE-08 . . . . . .  G432 G435
      453   F-INTEGER-WRITE-09 . . . . . .  G449 G452
      470   F-INTEGER-WRITE-10 . . . . . .  G466 G469
      487   F-INTEGER-WRITE-11 . . . . . .  G483 G486
      504   F-INTEGER-WRITE-12 . . . . . .  G500 G503
      521   F-INTEGER-WRITE-13 . . . . . .  G517 G520
      538   F-INTEGER-WRITE-14 . . . . . .  G534 G537
      555   F-INTEGER-WRITE-15 . . . . . .  G551 G554
      572   F-INTEGER-WRITE-16 . . . . . .  G568 G571
      589   F-INTEGER-WRITE-17 . . . . . .  G585 G588
      606   F-INTEGER-WRITE-18 . . . . . .  G602 G605
      623   F-INTEGER-WRITE-19 . . . . . .  G619 G622
      641   F-INTEGER-WRITE-20 . . . . . .  G637 G640
      658   F-INTEGER-WRITE-21 . . . . . .  G654 G657
      676   F-INTEGER-WRITE-22 . . . . . .  G672 G675
      307   F-INTEGER-01
      324   F-INTEGER-02
      339   F-INTEGER-03
      354   F-INTEGER-04
      371   F-INTEGER-05
      388   F-INTEGER-06
      405   F-INTEGER-07
      422   F-INTEGER-08
      439   F-INTEGER-09
      456   F-INTEGER-10
      473   F-INTEGER-11
      490   F-INTEGER-12
      507   F-INTEGER-13
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    20
0 Defined   Cross-reference of procedures   References

0     524   F-INTEGER-14
      541   F-INTEGER-15
      558   F-INTEGER-16
      575   F-INTEGER-17
      592   F-INTEGER-18
      609   F-INTEGER-19
      626   F-INTEGER-20
      644   F-INTEGER-21
      661   F-INTEGER-22
      196   FAIL . . . . . . . . . . . . .  P316 P331 P346 P363 P380 P397 P414 P431 P448 P465 P482 P499 P516 P533 P550 P567
                                            P584 P601 P618 P636 P653 P671 P685
      273   FAIL-ROUTINE . . . . . . . . .  P205
      287   FAIL-ROUTINE-EX. . . . . . . .  E205 G281
      282   FAIL-ROUTINE-WRITE . . . . . .  G275 G276
      211   HEAD-ROUTINE . . . . . . . . .  P188
      194   INSPT
      184   OPEN-FILES
      195   PASS . . . . . . . . . . . . .  P312 P329 P343 P359 P376 P393 P410 P427 P444 P461 P478 P495 P512 P529 P546 P563
                                            P580 P597 P614 P632 P649 P667 P683
      199   PRINT-DETAIL . . . . . . . . .  P323 P338 P353 P370 P387 P404 P421 P438 P455 P472 P489 P506 P523 P540 P557 P574
                                            P591 P608 P625 P643 P660 P678 P696
      303   SECT-IF111A
      192   TERMINATE-CCVS
      252   WRITE-LINE . . . . . . . . . .  P203 P204 P212 P213 P214 P215 P217 P218 P219 P221 P223 P231 P239 P245 P250 P251
                                            P279 P283 P285 P295
      268   WRT-LN . . . . . . . . . . . .  P258 P259 P260 P261 P262 P263 P264 P267 P272
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    21
0 Defined   Cross-reference of programs     References

        3   IF111A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF111A    Date 06/04/2022  Time 11:58:48   Page    22
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF111A:
 *    Source records = 699
 *    Data Division statements = 75
 *    Procedure Division statements = 407
 *    Generated COBOL statements = 0
 *    Program complexity factor = 416
0End of compilation 1,  program IF111A,  highest severity 0.
0Return code 0
