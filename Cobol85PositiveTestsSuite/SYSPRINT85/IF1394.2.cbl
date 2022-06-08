1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:40   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:40   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1394.2
   000002         000200 PROGRAM-ID.                                                      IF1394.2
   000003         000300     IF139A.                                                      IF1394.2
   000004         000400                                                                  IF1394.2
   000005         000600*                                                         *       IF1394.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1394.2
   000007         000800* It contains tests for the Intrinsic Function TAN.       *       IF1394.2
   000008         000900*                                                         *       IF1394.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1394.2
   000010         001200 CONFIGURATION SECTION.                                           IF1394.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1394.2
   000012         001400     XXXXX082.                                                    IF1394.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1394.2
   000014         001600     XXXXX083.                                                    IF1394.2
   000015         001700 INPUT-OUTPUT SECTION.                                            IF1394.2
   000016         001800 FILE-CONTROL.                                                    IF1394.2
   000017         001900     SELECT PRINT-FILE ASSIGN TO                                  IF1394.2 21
   000018         002000     XXXXX055.                                                    IF1394.2
   000019         002100 DATA DIVISION.                                                   IF1394.2
   000020         002200 FILE SECTION.                                                    IF1394.2
   000021         002300 FD  PRINT-FILE.                                                  IF1394.2

 ==000021==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000022         002400 01  PRINT-REC PICTURE X(120).                                    IF1394.2
   000023         002500 01  DUMMY-RECORD PICTURE X(120).                                 IF1394.2
   000024         002600 WORKING-STORAGE SECTION.                                         IF1394.2
   000025         002800* Variables specific to the Intrinsic Function Test IF139A*       IF1394.2
   000026         003000 01  A                   PIC S9(5)V9(5)      VALUE -0.00004.      IF1394.2
   000027         003100 01  B                   PIC S9(5)V9(5)      VALUE 14000.105.     IF1394.2
   000028         003200 01  C                   PIC S9(10)          VALUE 100000.        IF1394.2
   000029         003300 01  D                   PIC S9(10)          VALUE 1000.          IF1394.2
   000030         003400 01  PI                  PIC S9V9(17)        VALUE 3.141592654.   IF1394.2
   000031         003500 01  MINUSPI             PIC S9V9(17)        VALUE -3.141592654.  IF1394.2
   000032         003600 01  P                   PIC S9(10)          VALUE 1.             IF1394.2
   000033         003700 01  ARR                                     VALUE "40537".       IF1394.2
   000034         003800     02  IND OCCURS 5 TIMES PIC 9.                                IF1394.2
   000035         003900 01  TEMP                PIC S9(5)V9(5).                          IF1394.2
   000036         004000 01  WS-NUM              PIC S9(5)V9(7).                          IF1394.2
   000037         004100 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1394.2
   000038         004200 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1394.2
   000039         004300 01  ARG1                PIC S9(5)V9(2)     VALUE 1.              IF1394.2
   000040         004400*                                                                 IF1394.2
   000041         004600*                                                                 IF1394.2
   000042         004700 01  TEST-RESULTS.                                                IF1394.2
   000043         004800     02 FILLER                   PIC X      VALUE SPACE.          IF1394.2 IMP
   000044         004900     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1394.2 IMP
   000045         005000     02 FILLER                   PIC X      VALUE SPACE.          IF1394.2 IMP
   000046         005100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1394.2 IMP
   000047         005200     02 FILLER                   PIC X      VALUE SPACE.          IF1394.2 IMP
   000048         005300     02  PAR-NAME.                                                IF1394.2
   000049         005400       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1394.2 IMP
   000050         005500       03  PARDOT-X              PIC X      VALUE SPACE.          IF1394.2 IMP
   000051         005600       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1394.2 IMP
   000052         005700     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1394.2 IMP
   000053         005800     02 RE-MARK                  PIC X(61).                       IF1394.2
   000054         005900 01  TEST-COMPUTED.                                               IF1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1394.2 IMP
   000056         006100     02 FILLER                   PIC X(17)  VALUE                 IF1394.2
   000057         006200            "       COMPUTED=".                                   IF1394.2
   000058         006300     02 COMPUTED-X.                                               IF1394.2
   000059         006400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1394.2 IMP
   000060         006500     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1394.2 59
   000061         006600                                 PIC -9(9).9(9).                  IF1394.2
   000062         006700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1394.2 59
   000063         006800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1394.2 59
   000064         006900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1394.2 59
   000065         007000     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1394.2 59
   000066         007100         04 COMPUTED-18V0                    PIC -9(18).          IF1394.2
   000067         007200         04 FILLER                           PIC X.               IF1394.2
   000068         007300     03 FILLER PIC X(50) VALUE SPACE.                             IF1394.2 IMP
   000069         007400 01  TEST-CORRECT.                                                IF1394.2
   000070         007500     02 FILLER PIC X(30) VALUE SPACE.                             IF1394.2 IMP
   000071         007600     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1394.2
   000072         007700     02 CORRECT-X.                                                IF1394.2
   000073         007800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1394.2 IMP
   000074         007900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1394.2 73
   000075         008000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1394.2 73
   000076         008100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1394.2 73
   000077         008200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1394.2 73
   000078         008300     03      CR-18V0 REDEFINES CORRECT-A.                         IF1394.2 73
   000079         008400         04 CORRECT-18V0                     PIC -9(18).          IF1394.2
   000080         008500         04 FILLER                           PIC X.               IF1394.2
   000081         008600     03 FILLER PIC X(2) VALUE SPACE.                              IF1394.2 IMP
   000082         008700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1394.2 IMP
   000083         008800 01  TEST-CORRECT-MIN.                                            IF1394.2
   000084         008900     02 FILLER PIC X(30) VALUE SPACE.                             IF1394.2 IMP
   000085         009000     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1394.2
   000086         009100     02 CORRECTMI-X.                                              IF1394.2
   000087         009200     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1394.2 IMP
   000088         009300     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1394.2 87
   000089         009400     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1394.2 87
   000090         009500     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1394.2 87
   000091         009600     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1394.2 87
   000092         009700     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1394.2 87
   000093         009800         04 CORRECTMI-18V0                     PIC -9(18).        IF1394.2
   000094         009900         04 FILLER                           PIC X.               IF1394.2
   000095         010000     03 FILLER PIC X(2) VALUE SPACE.                              IF1394.2 IMP
   000096         010100     03 FILLER                           PIC X(48) VALUE SPACE.   IF1394.2 IMP
   000097         010200 01  TEST-CORRECT-MAX.                                            IF1394.2
   000098         010300     02 FILLER PIC X(30) VALUE SPACE.                             IF1394.2 IMP
   000099         010400     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1394.2
   000100         010500     02 CORRECTMA-X.                                              IF1394.2
   000101         010600     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1394.2 IMP
   000102         010700     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1394.2 101
   000103         010800     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1394.2 101
   000104         010900     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1394.2 101
   000105         011000     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1394.2 101
   000106         011100     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1394.2 101
   000107         011200         04 CORRECTMA-18V0                     PIC -9(18).        IF1394.2
   000108         011300         04 FILLER                           PIC X.               IF1394.2
   000109         011400     03 FILLER PIC X(2) VALUE SPACE.                              IF1394.2 IMP
   000110         011500     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1394.2 IMP
   000111         011600 01  CCVS-C-1.                                                    IF1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1394.2
   000113         011800-    "SS  PARAGRAPH-NAME                                          IF1394.2
   000114         011900-    "       REMARKS".                                            IF1394.2
   000115         012000     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1394.2 IMP
   000116         012100 01  CCVS-C-2.                                                    IF1394.2
   000117         012200     02 FILLER                     PIC X        VALUE SPACE.      IF1394.2 IMP
   000118         012300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1394.2
   000119         012400     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1394.2 IMP
   000120         012500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1394.2
   000121         012600     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1394.2 IMP
   000122         012700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1394.2 IMP
   000123         012800 01  REC-CT                        PIC 99       VALUE ZERO.       IF1394.2 IMP
   000124         012900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1394.2 IMP
   000125         013000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1394.2 IMP
   000126         013100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1394.2 IMP
   000127         013200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1394.2 IMP
   000128         013300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1394.2 IMP
   000129         013400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1394.2 IMP
   000130         013500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1394.2 IMP
   000131         013600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1394.2 IMP
   000132         013700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1394.2 IMP
   000133         013800 01  CCVS-H-1.                                                    IF1394.2
   000134         013900     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1394.2 IMP
   000135         014000     02  FILLER                    PIC X(42)    VALUE             IF1394.2
   000136         014100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1394.2
   000137         014200     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1394.2 IMP
   000138         014300 01  CCVS-H-2A.                                                   IF1394.2
   000139         014400   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1394.2 IMP
   000140         014500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1394.2
   000141         014600   02  FILLER                        PIC XXXX   VALUE             IF1394.2
   000142         014700     "4.2 ".                                                      IF1394.2
   000143         014800   02  FILLER                        PIC X(28)  VALUE             IF1394.2
   000144         014900            " COPY - NOT FOR DISTRIBUTION".                       IF1394.2
   000145         015000   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1394.2 IMP
   000146         015100                                                                  IF1394.2
   000147         015200 01  CCVS-H-2B.                                                   IF1394.2
   000148         015300   02  FILLER                        PIC X(15)  VALUE             IF1394.2
   000149         015400            "TEST RESULT OF ".                                    IF1394.2
   000150         015500   02  TEST-ID                       PIC X(9).                    IF1394.2
   000151         015600   02  FILLER                        PIC X(4)   VALUE             IF1394.2
   000152         015700            " IN ".                                               IF1394.2
   000153         015800   02  FILLER                        PIC X(12)  VALUE             IF1394.2
   000154         015900     " HIGH       ".                                              IF1394.2
   000155         016000   02  FILLER                        PIC X(22)  VALUE             IF1394.2
   000156         016100            " LEVEL VALIDATION FOR ".                             IF1394.2
   000157         016200   02  FILLER                        PIC X(58)  VALUE             IF1394.2
   000158         016300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1394.2
   000159         016400 01  CCVS-H-3.                                                    IF1394.2
   000160         016500     02  FILLER                      PIC X(34)  VALUE             IF1394.2
   000161         016600            " FOR OFFICIAL USE ONLY    ".                         IF1394.2
   000162         016700     02  FILLER                      PIC X(58)  VALUE             IF1394.2
   000163         016800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1394.2
   000164         016900     02  FILLER                      PIC X(28)  VALUE             IF1394.2
   000165         017000            "  COPYRIGHT   1985 ".                                IF1394.2
   000166         017100 01  CCVS-E-1.                                                    IF1394.2
   000167         017200     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1394.2 IMP
   000168         017300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02 ID-AGAIN                     PIC X(9).                    IF1394.2
   000170         017500     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1394.2 IMP
   000171         017600 01  CCVS-E-2.                                                    IF1394.2
   000172         017700     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1394.2 IMP
   000173         017800     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1394.2 IMP
   000174         017900     02 CCVS-E-2-2.                                               IF1394.2
   000175         018000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1394.2 IMP
   000176         018100         03 FILLER                   PIC X      VALUE SPACE.      IF1394.2 IMP
   000177         018200         03 ENDER-DESC               PIC X(44)  VALUE             IF1394.2
   000178         018300            "ERRORS ENCOUNTERED".                                 IF1394.2
   000179         018400 01  CCVS-E-3.                                                    IF1394.2
   000180         018500     02  FILLER                      PIC X(22)  VALUE             IF1394.2
   000181         018600            " FOR OFFICIAL USE ONLY".                             IF1394.2
   000182         018700     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1394.2 IMP
   000183         018800     02  FILLER                      PIC X(58)  VALUE             IF1394.2
   000184         018900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1394.2
   000185         019000     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1394.2 IMP
   000186         019100     02 FILLER                       PIC X(15)  VALUE             IF1394.2
   000187         019200             " COPYRIGHT 1985".                                   IF1394.2
   000188         019300 01  CCVS-E-4.                                                    IF1394.2
   000189         019400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1394.2 IMP
   000190         019500     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1394.2
   000191         019600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1394.2 IMP
   000192         019700     02 FILLER                       PIC X(40)  VALUE             IF1394.2
   000193         019800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1394.2
   000194         019900 01  XXINFO.                                                      IF1394.2
   000195         020000     02 FILLER                       PIC X(19)  VALUE             IF1394.2
   000196         020100            "*** INFORMATION ***".                                IF1394.2
   000197         020200     02 INFO-TEXT.                                                IF1394.2
   000198         020300       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1394.2 IMP
   000199         020400       04 XXCOMPUTED                 PIC X(20).                   IF1394.2
   000200         020500       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1394.2 IMP
   000201         020600       04 XXCORRECT                  PIC X(20).                   IF1394.2
   000202         020700     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1394.2
   000203         020800 01  HYPHEN-LINE.                                                 IF1394.2
   000204         020900     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1394.2 IMP
   000205         021000     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1394.2
   000206         021100-    "*****************************************".                 IF1394.2
   000207         021200     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1394.2
   000208         021300-    "******************************".                            IF1394.2
   000209         021400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1394.2
   000210         021500     "IF139A".                                                    IF1394.2
   000211         021600 PROCEDURE DIVISION.                                              IF1394.2
   000212         021700 CCVS1 SECTION.                                                   IF1394.2
   000213         021800 OPEN-FILES.                                                      IF1394.2
   000214         021900     OPEN     OUTPUT PRINT-FILE.                                  IF1394.2 21
   000215         022000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1394.2 209 150 209 169
   000216         022100     MOVE    SPACE TO TEST-RESULTS.                               IF1394.2 IMP 42
   000217         022200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1394.2 240 245
   000218         022300     GO TO CCVS1-EXIT.                                            IF1394.2 333
   000219         022400 CLOSE-FILES.                                                     IF1394.2
   000220         022500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1394.2 249 269 21
   000221         022600 TERMINATE-CCVS.                                                  IF1394.2
   000222         022700     STOP     RUN.                                                IF1394.2
   000223         022800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1394.2 46 126
   000224         022900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1394.2 46 127
   000225         023000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1394.2 46 125
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1394.2 46 124
   000227         023200     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1394.2 53
   000228         023300 PRINT-DETAIL.                                                    IF1394.2
   000229         023400     IF REC-CT NOT EQUAL TO ZERO                                  IF1394.2 123 IMP
   000230      1  023500             MOVE "." TO PARDOT-X                                 IF1394.2 50
   000231      1  023600             MOVE REC-CT TO DOTVALUE.                             IF1394.2 123 51
   000232         023700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1394.2 42 22 281
   000233         023800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1394.2 46 281
   000234      1  023900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1394.2 302 322
   000235      1  024000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1394.2 323 332
   000236         024100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1394.2 IMP 46 IMP 58
   000237         024200     MOVE SPACE TO CORRECT-X.                                     IF1394.2 IMP 72
   000238         024300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1394.2 123 IMP IMP 48
   000239         024400     MOVE     SPACE TO RE-MARK.                                   IF1394.2 IMP 53
   000240         024500 HEAD-ROUTINE.                                                    IF1394.2
   000241         024600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1394.2 133 23 281
   000242         024700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1394.2 138 23 281
   000243         024800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1394.2 147 23 281
   000244         024900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1394.2 159 23 281
   000245         025000 COLUMN-NAMES-ROUTINE.                                            IF1394.2
   000246         025100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1394.2 111 23 281
   000247         025200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1394.2 116 23 281
   000248         025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1394.2 203 23 281
   000249         025400 END-ROUTINE.                                                     IF1394.2
   000250         025500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1394.2 203 23 281
   000251         025600 END-RTN-EXIT.                                                    IF1394.2
   000252         025700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1394.2 166 23 281
   000253         025800 END-ROUTINE-1.                                                   IF1394.2
   000254         025900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1394.2 125 129 126
   000255         026000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1394.2 129 124 129
   000256         026100      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1394.2 127 129
   000257         026200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1394.2 127 189
   000258         026300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1394.2 129 191
   000259         026400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1394.2 188 174
   000260         026500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1394.2 171 23 281
   000261         026600  END-ROUTINE-12.                                                 IF1394.2
   000262         026700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1394.2 177
   000263         026800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1394.2 125 IMP
   000264      1  026900         MOVE "NO " TO ERROR-TOTAL                                IF1394.2 175
   000265         027000         ELSE                                                     IF1394.2
   000266      1  027100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1394.2 125 175
   000267         027200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1394.2 171 23
   000268         027300     PERFORM WRITE-LINE.                                          IF1394.2 281
   000269         027400 END-ROUTINE-13.                                                  IF1394.2
   000270         027500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1394.2 124 IMP
   000271      1  027600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1394.2 175
   000272      1  027700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1394.2 124 175
   000273         027800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1394.2 177
   000274         027900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1394.2 171 23 281
   000275         028000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1394.2 126 IMP
   000276      1  028100          MOVE "NO " TO ERROR-TOTAL                               IF1394.2 175
   000277      1  028200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1394.2 126 175
   000278         028300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1394.2 177
   000279         028400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1394.2 171 23 281
   000280         028500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1394.2 179 23 281
   000281         028600 WRITE-LINE.                                                      IF1394.2
   000282         028700     ADD 1 TO RECORD-COUNT.                                       IF1394.2 131
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     IF RECORD-COUNT GREATER 42                                   IF1394.2 131
   000284      1  028900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1394.2 23 130
   000285      1  029000         MOVE SPACE TO DUMMY-RECORD                               IF1394.2 IMP 23
   000286      1  029100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1394.2 23
   000287      1  029200         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1394.2 133 23 297
   000288      1  029300         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1394.2 138 23 297
   000289      1  029400         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1394.2 147 23 297
   000290      1  029500         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1394.2 159 23 297
   000291      1  029600         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1394.2 111 23 297
   000292      1  029700         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1394.2 116 23 297
   000293      1  029800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1394.2 203 23 297
   000294      1  029900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1394.2 130 23
   000295      1  030000         MOVE ZERO TO RECORD-COUNT.                               IF1394.2 IMP 131
   000296         030100     PERFORM WRT-LN.                                              IF1394.2 297
   000297         030200 WRT-LN.                                                          IF1394.2
   000298         030300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1394.2 23
   000299         030400     MOVE SPACE TO DUMMY-RECORD.                                  IF1394.2 IMP 23
   000300         030500 BLANK-LINE-PRINT.                                                IF1394.2
   000301         030600     PERFORM WRT-LN.                                              IF1394.2 297
   000302         030700 FAIL-ROUTINE.                                                    IF1394.2
   000303         030800     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1394.2 58 IMP
   000304      1  030900            GO TO FAIL-ROUTINE-WRITE.                             IF1394.2 311
   000305         031000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1394.2 72 IMP 311
   000306         031100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1394.2 132 202
   000307         031200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1394.2 197
   000308         031300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1394.2 194 23 281
   000309         031400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1394.2 IMP 202
   000310         031500     GO TO  FAIL-ROUTINE-EX.                                      IF1394.2 322
   000311         031600 FAIL-ROUTINE-WRITE.                                              IF1394.2
   000312         031700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1394.2 54 22 281
   000313         031800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1394.2 132 82
   000314         031900                              CORMA-ANSI-REFERENCE.               IF1394.2 110
   000315         032000     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1394.2 88 IMP
   000316      1  032100           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1394.2 83 22 281
   000317      1  032200           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1394.2 97 22 281
   000318         032300     ELSE                                                         IF1394.2
   000319      1  032400           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1394.2 69 22 281
   000320         032500     PERFORM WRITE-LINE.                                          IF1394.2 281
   000321         032600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1394.2 IMP 82
   000322         032700 FAIL-ROUTINE-EX. EXIT.                                           IF1394.2
   000323         032800 BAIL-OUT.                                                        IF1394.2
   000324         032900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1394.2 59 IMP 326
   000325         033000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1394.2 73 IMP 332
   000326         033100 BAIL-OUT-WRITE.                                                  IF1394.2
   000327         033200     MOVE CORRECT-A TO XXCORRECT.                                 IF1394.2 73 201
   000328         033300     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1394.2 59 199
   000329         033400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1394.2 132 202
   000330         033500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1394.2 194 23 281
   000331         033600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1394.2 IMP 202
   000332         033700 BAIL-OUT-EX. EXIT.                                               IF1394.2
   000333         033800 CCVS1-EXIT.                                                      IF1394.2
   000334         033900     EXIT.                                                        IF1394.2
   000335         034100*                                                      *          IF1394.2
   000336         034200*    Intrinsic Function Tests         IF139A - TAN     *          IF1394.2
   000337         034300*                                                      *          IF1394.2
   000338         034500 SECT-IF139A SECTION.                                             IF1394.2
   000339         034600 F-TAN-INFO.                                                      IF1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034700     MOVE     "See ref. A-71 2.43" TO ANSI-REFERENCE.             IF1394.2 132
   000341         034800     MOVE     "TAN Function" TO FEATURE.                          IF1394.2 44
   000342         035000 F-TAN-01.                                                        IF1394.2
   000343         035100     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000344         035200     MOVE -0.000020 TO MIN-RANGE.                                 IF1394.2 37
   000345         035300     MOVE  0.000020 TO MAX-RANGE.                                 IF1394.2 38
   000346         035400 F-TAN-TEST-01.                                                   IF1394.2
   000347         035500     COMPUTE WS-NUM = FUNCTION TAN(0).                            IF1394.2 36 IFN
   000348         035600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000349         035700        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000350      1  035800                    PERFORM PASS                                  IF1394.2 224
   000351         035900     ELSE                                                         IF1394.2
   000352      1  036000                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000353      1  036100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000354      1  036200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000355      1  036300                    PERFORM FAIL.                                 IF1394.2 225
   000356         036400     GO TO F-TAN-WRITE-01.                                        IF1394.2 360
   000357         036500 F-TAN-DELETE-01.                                                 IF1394.2
   000358         036600     PERFORM  DE-LETE.                                            IF1394.2 226
   000359         036700     GO TO    F-TAN-WRITE-01.                                     IF1394.2 360
   000360         036800 F-TAN-WRITE-01.                                                  IF1394.2
   000361         036900     MOVE "F-TAN-01" TO PAR-NAME.                                 IF1394.2 48
   000362         037000     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000363         037200 F-TAN-02.                                                        IF1394.2
   000364         037300     EVALUATE FUNCTION TAN(PI)                                    IF1394.2 IFN 30
   000365         037400     WHEN -0.000020 THRU 0.000020                                 IF1394.2
   000366      1  037500                    PERFORM PASS                                  IF1394.2 224
   000367         037600     WHEN OTHER                                                   IF1394.2
   000368      1  037700                    PERFORM FAIL.                                 IF1394.2 225
   000369         037800     GO TO F-TAN-WRITE-02.                                        IF1394.2 373
   000370         037900 F-TAN-DELETE-02.                                                 IF1394.2
   000371         038000     PERFORM  DE-LETE.                                            IF1394.2 226
   000372         038100     GO TO    F-TAN-WRITE-02.                                     IF1394.2 373
   000373         038200 F-TAN-WRITE-02.                                                  IF1394.2
   000374         038300     MOVE "F-TAN-02" TO PAR-NAME.                                 IF1394.2 48
   000375         038400     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000376         038600 F-TAN-03.                                                        IF1394.2
   000377         038700     MOVE -0.000020 TO MIN-RANGE.                                 IF1394.2 37
   000378         038800     MOVE  0.000020 TO MAX-RANGE.                                 IF1394.2 38
   000379         038900 F-TAN-TEST-03.                                                   IF1394.2
   000380         039000     IF (FUNCTION TAN(MINUSPI) >= MIN-RANGE) AND                  IF1394.2 IFN 31 37
   000381         039100        (FUNCTION TAN(MINUSPI) <= MAX-RANGE) THEN                 IF1394.2 IFN 31 38
   000382      1  039200                    PERFORM PASS                                  IF1394.2 224
   000383         039300     ELSE                                                         IF1394.2
   000384      1  039400                    PERFORM FAIL.                                 IF1394.2 225
   000385         039500     GO TO F-TAN-WRITE-03.                                        IF1394.2 389
   000386         039600 F-TAN-DELETE-03.                                                 IF1394.2
   000387         039700     PERFORM  DE-LETE.                                            IF1394.2 226
   000388         039800     GO TO    F-TAN-WRITE-03.                                     IF1394.2 389
   000389         039900 F-TAN-WRITE-03.                                                  IF1394.2
   000390         040000     MOVE "F-TAN-03" TO PAR-NAME.                                 IF1394.2 48
   000391         040100     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000392         040300 F-TAN-04.                                                        IF1394.2
   000393         040400     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000394         040500     MOVE  0.000999 TO MIN-RANGE.                                 IF1394.2 37
   000395         040600     MOVE  0.001000 TO MAX-RANGE.                                 IF1394.2 38
   000396         040700 F-TAN-TEST-04.                                                   IF1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800     COMPUTE WS-NUM = FUNCTION TAN(.001).                         IF1394.2 36 IFN
   000398         040900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000399         041000        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000400      1  041100                    PERFORM PASS                                  IF1394.2 224
   000401         041200     ELSE                                                         IF1394.2
   000402      1  041300                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000403      1  041400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000404      1  041500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000405      1  041600                    PERFORM FAIL.                                 IF1394.2 225
   000406         041700     GO TO F-TAN-WRITE-04.                                        IF1394.2 410
   000407         041800 F-TAN-DELETE-04.                                                 IF1394.2
   000408         041900     PERFORM  DE-LETE.                                            IF1394.2 226
   000409         042000     GO TO    F-TAN-WRITE-04.                                     IF1394.2 410
   000410         042100 F-TAN-WRITE-04.                                                  IF1394.2
   000411         042200     MOVE "F-TAN-04" TO PAR-NAME.                                 IF1394.2 48
   000412         042300     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000413         042500 F-TAN-05.                                                        IF1394.2
   000414         042600     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000415         042700     MOVE  0.000089 TO MIN-RANGE.                                 IF1394.2 37
   000416         042800     MOVE  0.000090 TO MAX-RANGE.                                 IF1394.2 38
   000417         042900 F-TAN-TEST-05.                                                   IF1394.2
   000418         043000     COMPUTE WS-NUM = FUNCTION TAN(.00009).                       IF1394.2 36 IFN
   000419         043100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000420         043200        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000421      1  043300                    PERFORM PASS                                  IF1394.2 224
   000422         043400     ELSE                                                         IF1394.2
   000423      1  043500                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000424      1  043600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000425      1  043700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000426      1  043800                    PERFORM FAIL.                                 IF1394.2 225
   000427         043900     GO TO F-TAN-WRITE-05.                                        IF1394.2 431
   000428         044000 F-TAN-DELETE-05.                                                 IF1394.2
   000429         044100     PERFORM  DE-LETE.                                            IF1394.2 226
   000430         044200     GO TO    F-TAN-WRITE-05.                                     IF1394.2 431
   000431         044300 F-TAN-WRITE-05.                                                  IF1394.2
   000432         044400     MOVE "F-TAN-05" TO PAR-NAME.                                 IF1394.2 48
   000433         044500     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000434         044700 F-TAN-06.                                                        IF1394.2
   000435         044800     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000436         044900     MOVE -0.000040 TO MIN-RANGE.                                 IF1394.2 37
   000437         045000     MOVE -0.000039 TO MAX-RANGE.                                 IF1394.2 38
   000438         045100 F-TAN-TEST-06.                                                   IF1394.2
   000439         045200     COMPUTE WS-NUM = FUNCTION TAN(A).                            IF1394.2 36 IFN 26
   000440         045300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000441         045400        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000442      1  045500                    PERFORM PASS                                  IF1394.2 224
   000443         045600     ELSE                                                         IF1394.2
   000444      1  045700                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000445      1  045800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000446      1  045900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000447      1  046000                    PERFORM FAIL.                                 IF1394.2 225
   000448         046100     GO TO F-TAN-WRITE-06.                                        IF1394.2 452
   000449         046200 F-TAN-DELETE-06.                                                 IF1394.2
   000450         046300     PERFORM  DE-LETE.                                            IF1394.2 226
   000451         046400     GO TO    F-TAN-WRITE-06.                                     IF1394.2 452
   000452         046500 F-TAN-WRITE-06.                                                  IF1394.2
   000453         046600     MOVE "F-TAN-06" TO PAR-NAME.                                 IF1394.2 48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046700     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000455         046900 F-TAN-07.                                                        IF1394.2
   000456         047000     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000457         047100     MOVE  1.15780 TO MIN-RANGE.                                  IF1394.2 37
   000458         047200     MOVE  1.15784 TO MAX-RANGE.                                  IF1394.2 38
   000459         047300 F-TAN-TEST-07.                                                   IF1394.2
   000460         047400     COMPUTE WS-NUM = FUNCTION TAN(IND(P)).                       IF1394.2 36 IFN 34 32
   000461         047500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000462         047600        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000463      1  047700                    PERFORM PASS                                  IF1394.2 224
   000464         047800     ELSE                                                         IF1394.2
   000465      1  047900                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000466      1  048000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000467      1  048100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000468      1  048200                    PERFORM FAIL.                                 IF1394.2 225
   000469         048300     GO TO F-TAN-WRITE-07.                                        IF1394.2 473
   000470         048400 F-TAN-DELETE-07.                                                 IF1394.2
   000471         048500     PERFORM  DE-LETE.                                            IF1394.2 226
   000472         048600     GO TO    F-TAN-WRITE-07.                                     IF1394.2 473
   000473         048700 F-TAN-WRITE-07.                                                  IF1394.2
   000474         048800     MOVE "F-TAN-07" TO PAR-NAME.                                 IF1394.2 48
   000475         048900     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000476         049100 F-TAN-08.                                                        IF1394.2
   000477         049200     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000478         049300     MOVE  0.871430 TO MIN-RANGE.                                 IF1394.2 37
   000479         049400     MOVE  0.871464 TO MAX-RANGE.                                 IF1394.2 38
   000480         049500 F-TAN-TEST-08.                                                   IF1394.2
   000481         049600     COMPUTE WS-NUM = FUNCTION TAN(IND(5)).                       IF1394.2 36 IFN 34
   000482         049700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000483         049800        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000484      1  049900                    PERFORM PASS                                  IF1394.2 224
   000485         050000     ELSE                                                         IF1394.2
   000486      1  050100                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000487      1  050200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000488      1  050300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000489      1  050400                    PERFORM FAIL.                                 IF1394.2 225
   000490         050500     GO TO F-TAN-WRITE-08.                                        IF1394.2 494
   000491         050600 F-TAN-DELETE-08.                                                 IF1394.2
   000492         050700     PERFORM  DE-LETE.                                            IF1394.2 226
   000493         050800     GO TO    F-TAN-WRITE-08.                                     IF1394.2 494
   000494         050900 F-TAN-WRITE-08.                                                  IF1394.2
   000495         051000     MOVE "F-TAN-08" TO PAR-NAME.                                 IF1394.2 48
   000496         051100     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000497         051300 F-TAN-09.                                                        IF1394.2
   000498         051400     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000499         051500     MOVE  0.999960 TO MIN-RANGE.                                 IF1394.2 37
   000500         051600     MOVE  1.00004 TO MAX-RANGE.                                  IF1394.2 38
   000501         051700 F-TAN-TEST-09.                                                   IF1394.2
   000502         051800     COMPUTE WS-NUM = FUNCTION TAN(PI / 4).                       IF1394.2 36 IFN 30
   000503         051900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000504         052000        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000505      1  052100                    PERFORM PASS                                  IF1394.2 224
   000506         052200     ELSE                                                         IF1394.2
   000507      1  052300                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000508      1  052400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000509      1  052500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000510      1  052600                    PERFORM FAIL.                                 IF1394.2 225
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052700     GO TO F-TAN-WRITE-09.                                        IF1394.2 515
   000512         052800 F-TAN-DELETE-09.                                                 IF1394.2
   000513         052900     PERFORM  DE-LETE.                                            IF1394.2 226
   000514         053000     GO TO    F-TAN-WRITE-09.                                     IF1394.2 515
   000515         053100 F-TAN-WRITE-09.                                                  IF1394.2
   000516         053200     MOVE "F-TAN-09" TO PAR-NAME.                                 IF1394.2 48
   000517         053300     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000518         053500 F-TAN-10.                                                        IF1394.2
   000519         053600     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000520         053700     MOVE -1.00004 TO MIN-RANGE.                                  IF1394.2 37
   000521         053800     MOVE -0.999960 TO MAX-RANGE.                                 IF1394.2 38
   000522         053900 F-TAN-TEST-10.                                                   IF1394.2
   000523         054000     COMPUTE WS-NUM = FUNCTION TAN((3 * PI) / 4).                 IF1394.2 36 IFN 30
   000524         054100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000525         054200        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000526      1  054300                    PERFORM PASS                                  IF1394.2 224
   000527         054400     ELSE                                                         IF1394.2
   000528      1  054500                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000529      1  054600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000530      1  054700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000531      1  054800                    PERFORM FAIL.                                 IF1394.2 225
   000532         054900     GO TO F-TAN-WRITE-10.                                        IF1394.2 536
   000533         055000 F-TAN-DELETE-10.                                                 IF1394.2
   000534         055100     PERFORM  DE-LETE.                                            IF1394.2 226
   000535         055200     GO TO    F-TAN-WRITE-10.                                     IF1394.2 536
   000536         055300 F-TAN-WRITE-10.                                                  IF1394.2
   000537         055400     MOVE "F-TAN-10" TO PAR-NAME.                                 IF1394.2 48
   000538         055500     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000539         055700 F-TAN-11.                                                        IF1394.2
   000540         055800     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000541         055900     MOVE  0.999960 TO MIN-RANGE.                                 IF1394.2 37
   000542         056000     MOVE  1.00004 TO MAX-RANGE.                                  IF1394.2 38
   000543         056100 F-TAN-TEST-11.                                                   IF1394.2
   000544         056200     COMPUTE WS-NUM = FUNCTION TAN((5 * PI) / 4).                 IF1394.2 36 IFN 30
   000545         056300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000546         056400        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000547      1  056500                    PERFORM PASS                                  IF1394.2 224
   000548         056600     ELSE                                                         IF1394.2
   000549      1  056700                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000550      1  056800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000551      1  056900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000552      1  057000                    PERFORM FAIL.                                 IF1394.2 225
   000553         057100     GO TO F-TAN-WRITE-11.                                        IF1394.2 557
   000554         057200 F-TAN-DELETE-11.                                                 IF1394.2
   000555         057300     PERFORM  DE-LETE.                                            IF1394.2 226
   000556         057400     GO TO    F-TAN-WRITE-11.                                     IF1394.2 557
   000557         057500 F-TAN-WRITE-11.                                                  IF1394.2
   000558         057600     MOVE "F-TAN-11" TO PAR-NAME.                                 IF1394.2 48
   000559         057700     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000560         057900 F-TAN-12.                                                        IF1394.2
   000561         058000     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000562         058100     MOVE -1.00004 TO MIN-RANGE.                                  IF1394.2 37
   000563         058200     MOVE -0.999960 TO MAX-RANGE.                                 IF1394.2 38
   000564         058300 F-TAN-TEST-12.                                                   IF1394.2
   000565         058400     COMPUTE WS-NUM = FUNCTION TAN((7 * PI) / 4).                 IF1394.2 36 IFN 30
   000566         058500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000567         058600        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  058700                    PERFORM PASS                                  IF1394.2 224
   000569         058800     ELSE                                                         IF1394.2
   000570      1  058900                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000571      1  059000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000572      1  059100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000573      1  059200                    PERFORM FAIL.                                 IF1394.2 225
   000574         059300     GO TO F-TAN-WRITE-12.                                        IF1394.2 578
   000575         059400 F-TAN-DELETE-12.                                                 IF1394.2
   000576         059500     PERFORM  DE-LETE.                                            IF1394.2 226
   000577         059600     GO TO    F-TAN-WRITE-12.                                     IF1394.2 578
   000578         059700 F-TAN-WRITE-12.                                                  IF1394.2
   000579         059800     MOVE "F-TAN-12" TO PAR-NAME.                                 IF1394.2 48
   000580         059900     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000581         060100 F-TAN-13.                                                        IF1394.2
   000582         060200     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000583         060300     MOVE -1.00004 TO MIN-RANGE.                                  IF1394.2 37
   000584         060400     MOVE -0.999960 TO MAX-RANGE.                                 IF1394.2 38
   000585         060500 F-TAN-TEST-13.                                                   IF1394.2
   000586         060600     COMPUTE WS-NUM = FUNCTION TAN(MINUSPI / 4).                  IF1394.2 36 IFN 31
   000587         060700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000588         060800        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000589      1  060900                    PERFORM PASS                                  IF1394.2 224
   000590         061000     ELSE                                                         IF1394.2
   000591      1  061100                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000592      1  061200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000593      1  061300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000594      1  061400                    PERFORM FAIL.                                 IF1394.2 225
   000595         061500     GO TO F-TAN-WRITE-13.                                        IF1394.2 599
   000596         061600 F-TAN-DELETE-13.                                                 IF1394.2
   000597         061700     PERFORM  DE-LETE.                                            IF1394.2 226
   000598         061800     GO TO    F-TAN-WRITE-13.                                     IF1394.2 599
   000599         061900 F-TAN-WRITE-13.                                                  IF1394.2
   000600         062000     MOVE "F-TAN-13" TO PAR-NAME.                                 IF1394.2 48
   000601         062100     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000602         062300 F-TAN-14.                                                        IF1394.2
   000603         062400     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000604         062500     MOVE  0.999960 TO MIN-RANGE.                                 IF1394.2 37
   000605         062600     MOVE  1.00004 TO MAX-RANGE.                                  IF1394.2 38
   000606         062700 F-TAN-TEST-14.                                                   IF1394.2
   000607         062800     COMPUTE WS-NUM = FUNCTION TAN((3 * MINUSPI) / 4).            IF1394.2 36 IFN 31
   000608         062900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000609         063000        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000610      1  063100                    PERFORM PASS                                  IF1394.2 224
   000611         063200     ELSE                                                         IF1394.2
   000612      1  063300                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000613      1  063400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000614      1  063500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000615      1  063600                    PERFORM FAIL.                                 IF1394.2 225
   000616         063700     GO TO F-TAN-WRITE-14.                                        IF1394.2 620
   000617         063800 F-TAN-DELETE-14.                                                 IF1394.2
   000618         063900     PERFORM  DE-LETE.                                            IF1394.2 226
   000619         064000     GO TO    F-TAN-WRITE-14.                                     IF1394.2 620
   000620         064100 F-TAN-WRITE-14.                                                  IF1394.2
   000621         064200     MOVE "F-TAN-14" TO PAR-NAME.                                 IF1394.2 48
   000622         064300     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000623         064500 F-TAN-15.                                                        IF1394.2
   000624         064600     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064700     MOVE -1.00004 TO MIN-RANGE.                                  IF1394.2 37
   000626         064800     MOVE -0.999960 TO MAX-RANGE.                                 IF1394.2 38
   000627         064900 F-TAN-TEST-15.                                                   IF1394.2
   000628         065000     COMPUTE WS-NUM = FUNCTION TAN((5 * MINUSPI) / 4).            IF1394.2 36 IFN 31
   000629         065100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000630         065200        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000631      1  065300                    PERFORM PASS                                  IF1394.2 224
   000632         065400     ELSE                                                         IF1394.2
   000633      1  065500                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000634      1  065600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000635      1  065700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000636      1  065800                    PERFORM FAIL.                                 IF1394.2 225
   000637         065900     GO TO F-TAN-WRITE-15.                                        IF1394.2 641
   000638         066000 F-TAN-DELETE-15.                                                 IF1394.2
   000639         066100     PERFORM  DE-LETE.                                            IF1394.2 226
   000640         066200     GO TO    F-TAN-WRITE-15.                                     IF1394.2 641
   000641         066300 F-TAN-WRITE-15.                                                  IF1394.2
   000642         066400     MOVE "F-TAN-15" TO PAR-NAME.                                 IF1394.2 48
   000643         066500     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000644         066700 F-TAN-16.                                                        IF1394.2
   000645         066800     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000646         066900     MOVE  0.999960 TO MIN-RANGE.                                 IF1394.2 37
   000647         067000     MOVE  1.00004 TO MAX-RANGE.                                  IF1394.2 38
   000648         067100 F-TAN-TEST-16.                                                   IF1394.2
   000649         067200     COMPUTE WS-NUM = FUNCTION TAN((7 * MINUSPI) / 4).            IF1394.2 36 IFN 31
   000650         067300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000651         067400        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000652      1  067500                    PERFORM PASS                                  IF1394.2 224
   000653         067600     ELSE                                                         IF1394.2
   000654      1  067700                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000655      1  067800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000656      1  067900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000657      1  068000                    PERFORM FAIL.                                 IF1394.2 225
   000658         068100     GO TO F-TAN-WRITE-16.                                        IF1394.2 662
   000659         068200 F-TAN-DELETE-16.                                                 IF1394.2
   000660         068300     PERFORM  DE-LETE.                                            IF1394.2 226
   000661         068400     GO TO    F-TAN-WRITE-16.                                     IF1394.2 662
   000662         068500 F-TAN-WRITE-16.                                                  IF1394.2
   000663         068600     MOVE "F-TAN-16" TO PAR-NAME.                                 IF1394.2 48
   000664         068700     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000665         068900 F-TAN-17.                                                        IF1394.2
   000666         069000     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000667         069100     MOVE  0.997961 TO MIN-RANGE.                                 IF1394.2 37
   000668         069200     MOVE  0.998041 TO MAX-RANGE.                                 IF1394.2 38
   000669         069300 F-TAN-TEST-17.                                                   IF1394.2
   000670         069400     COMPUTE WS-NUM = FUNCTION TAN((PI / 4) - .001).              IF1394.2 36 IFN 30
   000671         069500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000672         069600        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000673      1  069700                    PERFORM PASS                                  IF1394.2 224
   000674         069800     ELSE                                                         IF1394.2
   000675      1  069900                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000676      1  070000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000677      1  070100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000678      1  070200                    PERFORM FAIL.                                 IF1394.2 225
   000679         070300     GO TO F-TAN-WRITE-17.                                        IF1394.2 683
   000680         070400 F-TAN-DELETE-17.                                                 IF1394.2
   000681         070500     PERFORM  DE-LETE.                                            IF1394.2 226
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         070600     GO TO    F-TAN-WRITE-17.                                     IF1394.2 683
   000683         070700 F-TAN-WRITE-17.                                                  IF1394.2
   000684         070800     MOVE "F-TAN-17" TO PAR-NAME.                                 IF1394.2 48
   000685         070900     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000686         071100 F-TAN-19.                                                        IF1394.2
   000687         071200     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000688         071300     MOVE  0.0055554 TO MIN-RANGE.                                IF1394.2 37
   000689         071400     MOVE  0.0055558 TO MAX-RANGE.                                IF1394.2 38
   000690         071500 F-TAN-TEST-19.                                                   IF1394.2
   000691         071600     COMPUTE WS-NUM = FUNCTION TAN(1 / 180).                      IF1394.2 36 IFN
   000692         071700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000693         071800        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000694      1  071900                    PERFORM PASS                                  IF1394.2 224
   000695         072000     ELSE                                                         IF1394.2
   000696      1  072100                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000697      1  072200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000698      1  072300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000699      1  072400                    PERFORM FAIL.                                 IF1394.2 225
   000700         072500     GO TO F-TAN-WRITE-19.                                        IF1394.2 704
   000701         072600 F-TAN-DELETE-19.                                                 IF1394.2
   000702         072700     PERFORM  DE-LETE.                                            IF1394.2 226
   000703         072800     GO TO    F-TAN-WRITE-19.                                     IF1394.2 704
   000704         072900 F-TAN-WRITE-19.                                                  IF1394.2
   000705         073000     MOVE "F-TAN-19" TO PAR-NAME.                                 IF1394.2 48
   000706         073100     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000707         073300 F-TAN-20.                                                        IF1394.2
   000708         073400     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000709         073500     MOVE  0.965649 TO MIN-RANGE.                                 IF1394.2 37
   000710         073600     MOVE  0.965727 TO MAX-RANGE.                                 IF1394.2 38
   000711         073700 F-TAN-TEST-20.                                                   IF1394.2
   000712         073800     COMPUTE WS-NUM = FUNCTION TAN((PI / 4) - (PI / 180)).        IF1394.2 36 IFN 30 30
   000713         073900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000714         074000        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000715      1  074100                    PERFORM PASS                                  IF1394.2 224
   000716         074200     ELSE                                                         IF1394.2
   000717      1  074300                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000718      1  074400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000719      1  074500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000720      1  074600                    PERFORM FAIL.                                 IF1394.2 225
   000721         074700     GO TO F-TAN-WRITE-20.                                        IF1394.2 725
   000722         074800 F-TAN-DELETE-20.                                                 IF1394.2
   000723         074900     PERFORM  DE-LETE.                                            IF1394.2 226
   000724         075000     GO TO    F-TAN-WRITE-20.                                     IF1394.2 725
   000725         075100 F-TAN-WRITE-20.                                                  IF1394.2
   000726         075200     MOVE "F-TAN-20" TO PAR-NAME.                                 IF1394.2 48
   000727         075300     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000728         075500 F-TAN-21.                                                        IF1394.2
   000729         075600     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000730         075700     MOVE  0.034919 TO MIN-RANGE.                                 IF1394.2 37
   000731         075800     MOVE  0.034921 TO MAX-RANGE.                                 IF1394.2 38
   000732         075900 F-TAN-TEST-21.                                                   IF1394.2
   000733         076000     COMPUTE WS-NUM = FUNCTION TAN(PI + ((2 * PI) / 180)).        IF1394.2 36 IFN 30 30
   000734         076100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000735         076200        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000736      1  076300                    PERFORM PASS                                  IF1394.2 224
   000737         076400     ELSE                                                         IF1394.2
   000738      1  076500                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739      1  076600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000740      1  076700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000741      1  076800                    PERFORM FAIL.                                 IF1394.2 225
   000742         076900     GO TO F-TAN-WRITE-21.                                        IF1394.2 746
   000743         077000 F-TAN-DELETE-21.                                                 IF1394.2
   000744         077100     PERFORM  DE-LETE.                                            IF1394.2 226
   000745         077200     GO TO    F-TAN-WRITE-21.                                     IF1394.2 746
   000746         077300 F-TAN-WRITE-21.                                                  IF1394.2
   000747         077400     MOVE "F-TAN-21" TO PAR-NAME.                                 IF1394.2 48
   000748         077500     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000749         077700 F-TAN-22.                                                        IF1394.2
   000750         077800     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000751         077900     MOVE -0.988990 TO MIN-RANGE.                                 IF1394.2 37
   000752         078000     MOVE -0.988910 TO MAX-RANGE.                                 IF1394.2 38
   000753         078100 F-TAN-TEST-22.                                                   IF1394.2
   000754         078200     COMPUTE WS-NUM = FUNCTION TAN(((PI * 3) / 4) + (1 / 180)).   IF1394.2 36 IFN 30
   000755         078300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000756         078400        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000757      1  078500                    PERFORM PASS                                  IF1394.2 224
   000758         078600     ELSE                                                         IF1394.2
   000759      1  078700                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000760      1  078800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000761      1  078900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000762      1  079000                    PERFORM FAIL.                                 IF1394.2 225
   000763         079100     GO TO F-TAN-WRITE-22.                                        IF1394.2 767
   000764         079200 F-TAN-DELETE-22.                                                 IF1394.2
   000765         079300     PERFORM  DE-LETE.                                            IF1394.2 226
   000766         079400     GO TO    F-TAN-WRITE-22.                                     IF1394.2 767
   000767         079500 F-TAN-WRITE-22.                                                  IF1394.2
   000768         079600     MOVE "F-TAN-22" TO PAR-NAME.                                 IF1394.2 48
   000769         079700     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000770         079900 F-TAN-23.                                                        IF1394.2
   000771         080000     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000772         080100     MOVE  0.977982 TO MIN-RANGE.                                 IF1394.2 37
   000773         080200     MOVE  0.978060 TO MAX-RANGE.                                 IF1394.2 38
   000774         080300 F-TAN-TEST-23.                                                   IF1394.2
   000775         080400     COMPUTE WS-NUM = FUNCTION TAN(((PI * 5) / 4) - (2 / 180)).   IF1394.2 36 IFN 30
   000776         080500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000777         080600        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000778      1  080700                    PERFORM PASS                                  IF1394.2 224
   000779         080800     ELSE                                                         IF1394.2
   000780      1  080900                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000781      1  081000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000782      1  081100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000783      1  081200                    PERFORM FAIL.                                 IF1394.2 225
   000784         081300     GO TO F-TAN-WRITE-23.                                        IF1394.2 788
   000785         081400 F-TAN-DELETE-23.                                                 IF1394.2
   000786         081500     PERFORM  DE-LETE.                                            IF1394.2 226
   000787         081600     GO TO    F-TAN-WRITE-23.                                     IF1394.2 788
   000788         081700 F-TAN-WRITE-23.                                                  IF1394.2
   000789         081800     MOVE "F-TAN-23" TO PAR-NAME.                                 IF1394.2 48
   000790         081900     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000791         082100 F-TAN-24.                                                        IF1394.2
   000792         082200     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000793         082300     MOVE -2.18512 TO MIN-RANGE.                                  IF1394.2 37
   000794         082400     MOVE -2.18494 TO MAX-RANGE.                                  IF1394.2 38
   000795         082500 F-TAN-TEST-24.                                                   IF1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         082600     COMPUTE WS-NUM = FUNCTION TAN(4 / 2).                        IF1394.2 36 IFN
   000797         082700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000798         082800        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000799      1  082900                    PERFORM PASS                                  IF1394.2 224
   000800         083000     ELSE                                                         IF1394.2
   000801      1  083100                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000802      1  083200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000803      1  083300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000804      1  083400                    PERFORM FAIL.                                 IF1394.2 225
   000805         083500     GO TO F-TAN-WRITE-24.                                        IF1394.2 809
   000806         083600 F-TAN-DELETE-24.                                                 IF1394.2
   000807         083700     PERFORM  DE-LETE.                                            IF1394.2 226
   000808         083800     GO TO    F-TAN-WRITE-24.                                     IF1394.2 809
   000809         083900 F-TAN-WRITE-24.                                                  IF1394.2
   000810         084000     MOVE "F-TAN-24" TO PAR-NAME.                                 IF1394.2 48
   000811         084100     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000812         084300 F-TAN-25.                                                        IF1394.2
   000813         084400     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000814         084500     MOVE  14.1008   TO MIN-RANGE.                                IF1394.2 37
   000815         084600     MOVE  14.1020 TO MAX-RANGE.                                  IF1394.2 38
   000816         084700 F-TAN-TEST-25.                                                   IF1394.2
   000817         084800     COMPUTE WS-NUM = FUNCTION TAN(3 / 2).                        IF1394.2 36 IFN
   000818         084900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000819         085000        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000820      1  085100                    PERFORM PASS                                  IF1394.2 224
   000821         085200     ELSE                                                         IF1394.2
   000822      1  085300                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000823      1  085400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000824      1  085500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000825      1  085600                    PERFORM FAIL.                                 IF1394.2 225
   000826         085700     GO TO F-TAN-WRITE-25.                                        IF1394.2 830
   000827         085800 F-TAN-DELETE-25.                                                 IF1394.2
   000828         085900     PERFORM  DE-LETE.                                            IF1394.2 226
   000829         086000     GO TO    F-TAN-WRITE-25.                                     IF1394.2 830
   000830         086100 F-TAN-WRITE-25.                                                  IF1394.2
   000831         086200     MOVE "F-TAN-25" TO PAR-NAME.                                 IF1394.2 48
   000832         086300     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000833         086500 F-TAN-27.                                                        IF1394.2
   000834         086600     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000835         086700     MOVE  0.648334 TO MIN-RANGE.                                 IF1394.2 37
   000836         086800     MOVE  0.648386 TO MAX-RANGE.                                 IF1394.2 38
   000837         086900 F-TAN-TEST-27.                                                   IF1394.2
   000838         087000     COMPUTE WS-NUM = FUNCTION TAN(D / 100).                      IF1394.2 36 IFN 29
   000839         087100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000840         087200        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000841      1  087300                    PERFORM PASS                                  IF1394.2 224
   000842         087400     ELSE                                                         IF1394.2
   000843      1  087500                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000844      1  087600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000845      1  087700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000846      1  087800                    PERFORM FAIL.                                 IF1394.2 225
   000847         087900     GO TO F-TAN-WRITE-27.                                        IF1394.2 851
   000848         088000 F-TAN-DELETE-27.                                                 IF1394.2
   000849         088100     PERFORM  DE-LETE.                                            IF1394.2 226
   000850         088200     GO TO    F-TAN-WRITE-27.                                     IF1394.2 851
   000851         088300 F-TAN-WRITE-27.                                                  IF1394.2
   000852         088400     MOVE "F-TAN-27" TO PAR-NAME.                                 IF1394.2 48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         088500     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000854         088700 F-TAN-28.                                                        IF1394.2
   000855         088800     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000856         088900     MOVE  0.017454  TO MIN-RANGE.                                IF1394.2 37
   000857         089000     MOVE  0.017456  TO MAX-RANGE.                                IF1394.2 38
   000858         089100 F-TAN-TEST-28.                                                   IF1394.2
   000859         089200     COMPUTE WS-NUM = FUNCTION TAN(PI / 180).                     IF1394.2 36 IFN 30
   000860         089300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000861         089400        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000862      1  089500                    PERFORM PASS                                  IF1394.2 224
   000863         089600     ELSE                                                         IF1394.2
   000864      1  089700                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000865      1  089800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000866      1  089900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000867      1  090000                    PERFORM FAIL.                                 IF1394.2 225
   000868         090100     GO TO F-TAN-WRITE-28.                                        IF1394.2 872
   000869         090200 F-TAN-DELETE-28.                                                 IF1394.2
   000870         090300     PERFORM  DE-LETE.                                            IF1394.2 226
   000871         090400     GO TO    F-TAN-WRITE-28.                                     IF1394.2 872
   000872         090500 F-TAN-WRITE-28.                                                  IF1394.2
   000873         090600     MOVE "F-TAN-28" TO PAR-NAME.                                 IF1394.2 48
   000874         090700     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000875         090900 F-TAN-29.                                                        IF1394.2
   000876         091000     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000877         091100     MOVE 0.999960 TO MIN-RANGE.                                  IF1394.2 37
   000878         091200     MOVE 1.00004 TO MAX-RANGE.                                   IF1394.2 38
   000879         091300 F-TAN-TEST-29.                                                   IF1394.2
   000880         091400     COMPUTE WS-NUM = FUNCTION TAN(PI) + 1.                       IF1394.2 36 IFN 30
   000881         091500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000882         091600        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000883      1  091700                    PERFORM PASS                                  IF1394.2 224
   000884         091800     ELSE                                                         IF1394.2
   000885      1  091900                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000886      1  092000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000887      1  092100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000888      1  092200                    PERFORM FAIL.                                 IF1394.2 225
   000889         092300     GO TO F-TAN-WRITE-29.                                        IF1394.2 893
   000890         092400 F-TAN-DELETE-29.                                                 IF1394.2
   000891         092500     PERFORM  DE-LETE.                                            IF1394.2 226
   000892         092600     GO TO    F-TAN-WRITE-29.                                     IF1394.2 893
   000893         092700 F-TAN-WRITE-29.                                                  IF1394.2
   000894         092800     MOVE "F-TAN-29" TO PAR-NAME.                                 IF1394.2 48
   000895         092900     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000896         093100 F-TAN-30.                                                        IF1394.2
   000897         093200     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000898         093300     MOVE 1.41786 TO MIN-RANGE.                                   IF1394.2 37
   000899         093400     MOVE 1.41798 TO MAX-RANGE.                                   IF1394.2 38
   000900         093500 F-TAN-TEST-30.                                                   IF1394.2
   000901         093600     COMPUTE WS-NUM = FUNCTION TAN(FUNCTION TAN(2)).              IF1394.2 36 IFN IFN
   000902         093700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000903         093800        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000904      1  093900                    PERFORM PASS                                  IF1394.2 224
   000905         094000     ELSE                                                         IF1394.2
   000906      1  094100                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000907      1  094200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000908      1  094300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000909      1  094400                    PERFORM FAIL.                                 IF1394.2 225
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         094500     GO TO F-TAN-WRITE-30.                                        IF1394.2 914
   000911         094600 F-TAN-DELETE-30.                                                 IF1394.2
   000912         094700     PERFORM  DE-LETE.                                            IF1394.2 226
   000913         094800     GO TO    F-TAN-WRITE-30.                                     IF1394.2 914
   000914         094900 F-TAN-WRITE-30.                                                  IF1394.2
   000915         095000     MOVE "F-TAN-30" TO PAR-NAME.                                 IF1394.2 48
   000916         095100     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000917         095300 F-TAN-31.                                                        IF1394.2
   000918         095400     MOVE ZERO TO WS-NUM.                                         IF1394.2 IMP 36
   000919         095500     MOVE -0.000040 TO MIN-RANGE.                                 IF1394.2 37
   000920         095600     MOVE  0.000040 TO MAX-RANGE.                                 IF1394.2 38
   000921         095700 F-TAN-TEST-31.                                                   IF1394.2
   000922         095800     COMPUTE WS-NUM = FUNCTION TAN(PI / 3) +                      IF1394.2 36 IFN 30
   000923         095900                        FUNCTION TAN(MINUSPI / 3).                IF1394.2 IFN 31
   000924         096000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1394.2 36 37
   000925         096100        (WS-NUM <= MAX-RANGE) THEN                                IF1394.2 36 38
   000926      1  096200                    PERFORM PASS                                  IF1394.2 224
   000927         096300     ELSE                                                         IF1394.2
   000928      1  096400                    MOVE WS-NUM TO COMPUTED-N                     IF1394.2 36 60
   000929      1  096500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1394.2 37 88
   000930      1  096600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1394.2 38 102
   000931      1  096700                    PERFORM FAIL.                                 IF1394.2 225
   000932         096800     GO TO F-TAN-WRITE-31.                                        IF1394.2 936
   000933         096900 F-TAN-DELETE-31.                                                 IF1394.2
   000934         097000     PERFORM  DE-LETE.                                            IF1394.2 226
   000935         097100     GO TO    F-TAN-WRITE-31.                                     IF1394.2 936
   000936         097200 F-TAN-WRITE-31.                                                  IF1394.2
   000937         097300     MOVE "F-TAN-31" TO PAR-NAME.                                 IF1394.2 48
   000938         097400     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000939         097600 F-TAN-32.                                                        IF1394.2
   000940         097700     PERFORM F-TAN-TEST-32                                        IF1394.2 944
   000941         097800       UNTIL FUNCTION TAN(ARG1) < 0.                              IF1394.2 IFN 39
   000942         097900     PERFORM PASS.                                                IF1394.2 224
   000943         098000     GO TO F-TAN-WRITE-32.                                        IF1394.2 949
   000944         098100 F-TAN-TEST-32.                                                   IF1394.2
   000945         098200     COMPUTE ARG1 = ARG1 - 0.25.                                  IF1394.2 39 39
   000946         098300 F-TAN-DELETE-32.                                                 IF1394.2
   000947         098400     PERFORM  DE-LETE.                                            IF1394.2 226
   000948         098500     GO TO    F-TAN-WRITE-32.                                     IF1394.2 949
   000949         098600 F-TAN-WRITE-32.                                                  IF1394.2
   000950         098700     MOVE "F-TAN-32" TO PAR-NAME.                                 IF1394.2 48
   000951         098800     PERFORM  PRINT-DETAIL.                                       IF1394.2 228
   000952         099000 CCVS-EXIT SECTION.                                               IF1394.2
   000953         099100 CCVS-999999.                                                     IF1394.2
   000954         099200     GO TO CLOSE-FILES.                                           IF1394.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    20
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       26   A. . . . . . . . . . . . . . .  439
      132   ANSI-REFERENCE . . . . . . . .  306 313 329 M340
       39   ARG1 . . . . . . . . . . . . .  941 M945 945
       33   ARR
       27   B
       28   C
      111   CCVS-C-1 . . . . . . . . . . .  246 291
      116   CCVS-C-2 . . . . . . . . . . .  247 292
      166   CCVS-E-1 . . . . . . . . . . .  252
      171   CCVS-E-2 . . . . . . . . . . .  260 267 274 279
      174   CCVS-E-2-2 . . . . . . . . . .  M259
      179   CCVS-E-3 . . . . . . . . . . .  280
      188   CCVS-E-4 . . . . . . . . . . .  259
      189   CCVS-E-4-1 . . . . . . . . . .  M257
      191   CCVS-E-4-2 . . . . . . . . . .  M258
      133   CCVS-H-1 . . . . . . . . . . .  241 287
      138   CCVS-H-2A. . . . . . . . . . .  242 288
      147   CCVS-H-2B. . . . . . . . . . .  243 289
      159   CCVS-H-3 . . . . . . . . . . .  244 290
      209   CCVS-PGM-ID. . . . . . . . . .  215 215
       65   CM-18V0
       59   COMPUTED-A . . . . . . . . . .  60 62 63 64 65 324 328
       60   COMPUTED-N . . . . . . . . . .  M352 M402 M423 M444 M465 M486 M507 M528 M549 M570 M591 M612 M633 M654 M675 M696
                                            M717 M738 M759 M780 M801 M822 M843 M864 M885 M906 M928
       58   COMPUTED-X . . . . . . . . . .  M236 303
       62   COMPUTED-0V18
       64   COMPUTED-14V4
       66   COMPUTED-18V0
       63   COMPUTED-4V14
       82   COR-ANSI-REFERENCE . . . . . .  M313 M321
      110   CORMA-ANSI-REFERENCE . . . . .  M314
       73   CORRECT-A. . . . . . . . . . .  74 75 76 77 78 325 327
      102   CORRECT-MAX. . . . . . . . . .  M354 M404 M425 M446 M467 M488 M509 M530 M551 M572 M593 M614 M635 M656 M677 M698
                                            M719 M740 M761 M782 M803 M824 M845 M866 M887 M908 M930
       88   CORRECT-MIN. . . . . . . . . .  315 M353 M403 M424 M445 M466 M487 M508 M529 M550 M571 M592 M613 M634 M655 M676
                                            M697 M718 M739 M760 M781 M802 M823 M844 M865 M886 M907 M929
       74   CORRECT-N
       72   CORRECT-X. . . . . . . . . . .  M237 305
       75   CORRECT-0V18
       77   CORRECT-14V4
       79   CORRECT-18V0
       76   CORRECT-4V14
      101   CORRECTMA-A. . . . . . . . . .  102 103 104 105 106
      100   CORRECTMA-X
      103   CORRECTMA-0V18
      105   CORRECTMA-14V4
      107   CORRECTMA-18V0
      104   CORRECTMA-4V14
       87   CORRECTMI-A. . . . . . . . . .  88 89 90 91 92
       86   CORRECTMI-X
       89   CORRECTMI-0V18
       91   CORRECTMI-14V4
       93   CORRECTMI-18V0
       90   CORRECTMI-4V14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    21
0 Defined   Cross-reference of data names   References

0      78   CR-18V0
       92   CR-18V0
      106   CR-18V0
       29   D. . . . . . . . . . . . . . .  838
      124   DELETE-COUNTER . . . . . . . .  M226 255 270 272
       51   DOTVALUE . . . . . . . . . . .  M231
      130   DUMMY-HOLD . . . . . . . . . .  M284 294
       23   DUMMY-RECORD . . . . . . . . .  M241 M242 M243 M244 M246 M247 M248 M250 M252 M260 M267 M274 M279 M280 284 M285
                                            286 M287 M288 M289 M290 M291 M292 M293 M294 298 M299 M308 M330
      177   ENDER-DESC . . . . . . . . . .  M262 M273 M278
      125   ERROR-COUNTER. . . . . . . . .  M225 254 263 266
      129   ERROR-HOLD . . . . . . . . . .  M254 M255 M255 M256 258
      175   ERROR-TOTAL. . . . . . . . . .  M264 M266 M271 M272 M276 M277
       44   FEATURE. . . . . . . . . . . .  M341
      203   HYPHEN-LINE. . . . . . . . . .  248 250 293
      169   ID-AGAIN . . . . . . . . . . .  M215
       34   IND. . . . . . . . . . . . . .  460 481
      202   INF-ANSI-REFERENCE . . . . . .  M306 M309 M329 M331
      197   INFO-TEXT. . . . . . . . . . .  M307
      126   INSPECT-COUNTER. . . . . . . .  M223 254 275 277
       38   MAX-RANGE. . . . . . . . . . .  M345 349 354 M378 381 M395 399 404 M416 420 425 M437 441 446 M458 462 467 M479
                                            483 488 M500 504 509 M521 525 530 M542 546 551 M563 567 572 M584 588 593 M605
                                            609 614 M626 630 635 M647 651 656 M668 672 677 M689 693 698 M710 714 719 M731
                                            735 740 M752 756 761 M773 777 782 M794 798 803 M815 819 824 M836 840 845 M857
                                            861 866 M878 882 887 M899 903 908 M920 925 930
       37   MIN-RANGE. . . . . . . . . . .  M344 348 353 M377 380 M394 398 403 M415 419 424 M436 440 445 M457 461 466 M478
                                            482 487 M499 503 508 M520 524 529 M541 545 550 M562 566 571 M583 587 592 M604
                                            608 613 M625 629 634 M646 650 655 M667 671 676 M688 692 697 M709 713 718 M730
                                            734 739 M751 755 760 M772 776 781 M793 797 802 M814 818 823 M835 839 844 M856
                                            860 865 M877 881 886 M898 902 907 M919 924 929
       31   MINUSPI. . . . . . . . . . . .  380 381 586 607 628 649 923
       32   P. . . . . . . . . . . . . . .  460
       46   P-OR-F . . . . . . . . . . . .  M223 M224 M225 M226 233 M236
       48   PAR-NAME . . . . . . . . . . .  M238 M361 M374 M390 M411 M432 M453 M474 M495 M516 M537 M558 M579 M600 M621 M642
                                            M663 M684 M705 M726 M747 M768 M789 M810 M831 M852 M873 M894 M915 M937 M950
       50   PARDOT-X . . . . . . . . . . .  M230
      127   PASS-COUNTER . . . . . . . . .  M224 256 257
       30   PI . . . . . . . . . . . . . .  364 502 523 544 565 670 712 712 733 733 754 775 859 880 922
       21   PRINT-FILE . . . . . . . . . .  17 214 220
       22   PRINT-REC. . . . . . . . . . .  M232 M312 M316 M317 M319
       53   RE-MARK. . . . . . . . . . . .  M227 M239
      123   REC-CT . . . . . . . . . . . .  229 231 238
      122   REC-SKL-SUB
      131   RECORD-COUNT . . . . . . . . .  M282 283 M295
       35   TEMP
       54   TEST-COMPUTED. . . . . . . . .  312
       69   TEST-CORRECT . . . . . . . . .  319
       97   TEST-CORRECT-MAX . . . . . . .  317
       83   TEST-CORRECT-MIN . . . . . . .  316
      150   TEST-ID. . . . . . . . . . . .  M215
       42   TEST-RESULTS . . . . . . . . .  M216 232
      128   TOTAL-ERROR
       36   WS-NUM . . . . . . . . . . . .  M343 M347 348 349 352 M393 M397 398 399 402 M414 M418 419 420 423 M435 M439 440
                                            441 444 M456 M460 461 462 465 M477 M481 482 483 486 M498 M502 503 504 507 M519
                                            M523 524 525 528 M540 M544 545 546 549 M561 M565 566 567 570 M582 M586 587 588
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    22
0 Defined   Cross-reference of data names   References

0                                           591 M603 M607 608 609 612 M624 M628 629 630 633 M645 M649 650 651 654 M666 M670
                                            671 672 675 M687 M691 692 693 696 M708 M712 713 714 717 M729 M733 734 735 738
                                            M750 M754 755 756 759 M771 M775 776 777 780 M792 M796 797 798 801 M813 M817 818
                                            819 822 M834 M838 839 840 843 M855 M859 860 861 864 M876 M880 881 882 885 M897
                                            M901 902 903 906 M918 M922 924 925 928
      199   XXCOMPUTED . . . . . . . . . .  M328
      201   XXCORRECT. . . . . . . . . . .  M327
      194   XXINFO . . . . . . . . . . . .  308 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    23
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

      323   BAIL-OUT . . . . . . . . . . .  P235
      332   BAIL-OUT-EX. . . . . . . . . .  E235 G325
      326   BAIL-OUT-WRITE . . . . . . . .  G324
      300   BLANK-LINE-PRINT
      952   CCVS-EXIT
      953   CCVS-999999
      212   CCVS1
      333   CCVS1-EXIT . . . . . . . . . .  G218
      219   CLOSE-FILES. . . . . . . . . .  G954
      245   COLUMN-NAMES-ROUTINE . . . . .  E217
      226   DE-LETE. . . . . . . . . . . .  P358 P371 P387 P408 P429 P450 P471 P492 P513 P534 P555 P576 P597 P618 P639 P660
                                            P681 P702 P723 P744 P765 P786 P807 P828 P849 P870 P891 P912 P934 P947
      249   END-ROUTINE. . . . . . . . . .  P220
      253   END-ROUTINE-1
      261   END-ROUTINE-12
      269   END-ROUTINE-13 . . . . . . . .  E220
      251   END-RTN-EXIT
      357   F-TAN-DELETE-01
      370   F-TAN-DELETE-02
      386   F-TAN-DELETE-03
      407   F-TAN-DELETE-04
      428   F-TAN-DELETE-05
      449   F-TAN-DELETE-06
      470   F-TAN-DELETE-07
      491   F-TAN-DELETE-08
      512   F-TAN-DELETE-09
      533   F-TAN-DELETE-10
      554   F-TAN-DELETE-11
      575   F-TAN-DELETE-12
      596   F-TAN-DELETE-13
      617   F-TAN-DELETE-14
      638   F-TAN-DELETE-15
      659   F-TAN-DELETE-16
      680   F-TAN-DELETE-17
      701   F-TAN-DELETE-19
      722   F-TAN-DELETE-20
      743   F-TAN-DELETE-21
      764   F-TAN-DELETE-22
      785   F-TAN-DELETE-23
      806   F-TAN-DELETE-24
      827   F-TAN-DELETE-25
      848   F-TAN-DELETE-27
      869   F-TAN-DELETE-28
      890   F-TAN-DELETE-29
      911   F-TAN-DELETE-30
      933   F-TAN-DELETE-31
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    24
0 Defined   Cross-reference of procedures   References

0     946   F-TAN-DELETE-32
      339   F-TAN-INFO
      346   F-TAN-TEST-01
      379   F-TAN-TEST-03
      396   F-TAN-TEST-04
      417   F-TAN-TEST-05
      438   F-TAN-TEST-06
      459   F-TAN-TEST-07
      480   F-TAN-TEST-08
      501   F-TAN-TEST-09
      522   F-TAN-TEST-10
      543   F-TAN-TEST-11
      564   F-TAN-TEST-12
      585   F-TAN-TEST-13
      606   F-TAN-TEST-14
      627   F-TAN-TEST-15
      648   F-TAN-TEST-16
      669   F-TAN-TEST-17
      690   F-TAN-TEST-19
      711   F-TAN-TEST-20
      732   F-TAN-TEST-21
      753   F-TAN-TEST-22
      774   F-TAN-TEST-23
      795   F-TAN-TEST-24
      816   F-TAN-TEST-25
      837   F-TAN-TEST-27
      858   F-TAN-TEST-28
      879   F-TAN-TEST-29
      900   F-TAN-TEST-30
      921   F-TAN-TEST-31
      944   F-TAN-TEST-32. . . . . . . . .  P940
      360   F-TAN-WRITE-01 . . . . . . . .  G356 G359
      373   F-TAN-WRITE-02 . . . . . . . .  G369 G372
      389   F-TAN-WRITE-03 . . . . . . . .  G385 G388
      410   F-TAN-WRITE-04 . . . . . . . .  G406 G409
      431   F-TAN-WRITE-05 . . . . . . . .  G427 G430
      452   F-TAN-WRITE-06 . . . . . . . .  G448 G451
      473   F-TAN-WRITE-07 . . . . . . . .  G469 G472
      494   F-TAN-WRITE-08 . . . . . . . .  G490 G493
      515   F-TAN-WRITE-09 . . . . . . . .  G511 G514
      536   F-TAN-WRITE-10 . . . . . . . .  G532 G535
      557   F-TAN-WRITE-11 . . . . . . . .  G553 G556
      578   F-TAN-WRITE-12 . . . . . . . .  G574 G577
      599   F-TAN-WRITE-13 . . . . . . . .  G595 G598
      620   F-TAN-WRITE-14 . . . . . . . .  G616 G619
      641   F-TAN-WRITE-15 . . . . . . . .  G637 G640
      662   F-TAN-WRITE-16 . . . . . . . .  G658 G661
      683   F-TAN-WRITE-17 . . . . . . . .  G679 G682
      704   F-TAN-WRITE-19 . . . . . . . .  G700 G703
      725   F-TAN-WRITE-20 . . . . . . . .  G721 G724
      746   F-TAN-WRITE-21 . . . . . . . .  G742 G745
      767   F-TAN-WRITE-22 . . . . . . . .  G763 G766
      788   F-TAN-WRITE-23 . . . . . . . .  G784 G787
      809   F-TAN-WRITE-24 . . . . . . . .  G805 G808
      830   F-TAN-WRITE-25 . . . . . . . .  G826 G829
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    25
0 Defined   Cross-reference of procedures   References

0     851   F-TAN-WRITE-27 . . . . . . . .  G847 G850
      872   F-TAN-WRITE-28 . . . . . . . .  G868 G871
      893   F-TAN-WRITE-29 . . . . . . . .  G889 G892
      914   F-TAN-WRITE-30 . . . . . . . .  G910 G913
      936   F-TAN-WRITE-31 . . . . . . . .  G932 G935
      949   F-TAN-WRITE-32 . . . . . . . .  G943 G948
      342   F-TAN-01
      363   F-TAN-02
      376   F-TAN-03
      392   F-TAN-04
      413   F-TAN-05
      434   F-TAN-06
      455   F-TAN-07
      476   F-TAN-08
      497   F-TAN-09
      518   F-TAN-10
      539   F-TAN-11
      560   F-TAN-12
      581   F-TAN-13
      602   F-TAN-14
      623   F-TAN-15
      644   F-TAN-16
      665   F-TAN-17
      686   F-TAN-19
      707   F-TAN-20
      728   F-TAN-21
      749   F-TAN-22
      770   F-TAN-23
      791   F-TAN-24
      812   F-TAN-25
      833   F-TAN-27
      854   F-TAN-28
      875   F-TAN-29
      896   F-TAN-30
      917   F-TAN-31
      939   F-TAN-32
      225   FAIL . . . . . . . . . . . . .  P355 P368 P384 P405 P426 P447 P468 P489 P510 P531 P552 P573 P594 P615 P636 P657
                                            P678 P699 P720 P741 P762 P783 P804 P825 P846 P867 P888 P909 P931
      302   FAIL-ROUTINE . . . . . . . . .  P234
      322   FAIL-ROUTINE-EX. . . . . . . .  E234 G310
      311   FAIL-ROUTINE-WRITE . . . . . .  G304 G305
      240   HEAD-ROUTINE . . . . . . . . .  P217
      223   INSPT
      213   OPEN-FILES
      224   PASS . . . . . . . . . . . . .  P350 P366 P382 P400 P421 P442 P463 P484 P505 P526 P547 P568 P589 P610 P631 P652
                                            P673 P694 P715 P736 P757 P778 P799 P820 P841 P862 P883 P904 P926 P942
      228   PRINT-DETAIL . . . . . . . . .  P362 P375 P391 P412 P433 P454 P475 P496 P517 P538 P559 P580 P601 P622 P643 P664
                                            P685 P706 P727 P748 P769 P790 P811 P832 P853 P874 P895 P916 P938 P951
      338   SECT-IF139A
      221   TERMINATE-CCVS
      281   WRITE-LINE . . . . . . . . . .  P232 P233 P241 P242 P243 P244 P246 P247 P248 P250 P252 P260 P268 P274 P279 P280
                                            P308 P312 P316 P317 P319 P320 P330
      297   WRT-LN . . . . . . . . . . . .  P287 P288 P289 P290 P291 P292 P293 P296 P301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    26
0 Defined   Cross-reference of programs     References

        3   IF139A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF139A    Date 06/04/2022  Time 11:59:40   Page    27
0LineID  Message code  Message text

     21  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF139A:
 *    Source records = 954
 *    Data Division statements = 96
 *    Procedure Division statements = 574
 *    Generated COBOL statements = 0
 *    Program complexity factor = 583
0End of compilation 1,  program IF139A,  highest severity 0.
0Return code 0
