1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:28   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:28   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1104.2
   000002         000200 PROGRAM-ID.                                                      IF1104.2
   000003         000300     IF110A.                                                      IF1104.2
   000004         000400                                                                  IF1104.2
   000005         000600*                                                         *       IF1104.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1104.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1104.2
   000008         000900* FACTORIAL.                                              *       IF1104.2
   000009         001000*                                                         *       IF1104.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1104.2
   000011         001300 CONFIGURATION SECTION.                                           IF1104.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1104.2
   000013         001500     XXXXX082.                                                    IF1104.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1104.2
   000015         001700     XXXXX083.                                                    IF1104.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1104.2
   000017         001900 FILE-CONTROL.                                                    IF1104.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1104.2 22
   000019         002100     XXXXX055.                                                    IF1104.2
   000020         002200 DATA DIVISION.                                                   IF1104.2
   000021         002300 FILE SECTION.                                                    IF1104.2
   000022         002400 FD  PRINT-FILE.                                                  IF1104.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1104.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1104.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1104.2
   000026         002900* Variables specific to the Intrinsic Function Test IF110A*       IF1104.2
   000027         003100 01  A                   PIC S9(10)          VALUE 5.             IF1104.2
   000028         003200 01  B                   PIC S9(10)          VALUE 7.             IF1104.2
   000029         003300 01  ARG1                PIC S9(10)          VALUE 1.             IF1104.2
   000030         003400 01  ARR                                     VALUE "40537".       IF1104.2
   000031         003500     02  IND OCCURS 5 TIMES PIC 9.                                IF1104.2
   000032         003600 01  TEMP                PIC S9(5)V9(5).                          IF1104.2
   000033         003700 01  WS-NUM              PIC S9(5)V9(6).                          IF1104.2
   000034         003800 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1104.2
   000035         003900 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1104.2
   000036         004000*                                                                 IF1104.2
   000037         004200*                                                                 IF1104.2
   000038         004300 01  TEST-RESULTS.                                                IF1104.2
   000039         004400     02 FILLER                   PIC X      VALUE SPACE.          IF1104.2 IMP
   000040         004500     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1104.2 IMP
   000041         004600     02 FILLER                   PIC X      VALUE SPACE.          IF1104.2 IMP
   000042         004700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1104.2 IMP
   000043         004800     02 FILLER                   PIC X      VALUE SPACE.          IF1104.2 IMP
   000044         004900     02  PAR-NAME.                                                IF1104.2
   000045         005000       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1104.2 IMP
   000046         005100       03  PARDOT-X              PIC X      VALUE SPACE.          IF1104.2 IMP
   000047         005200       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1104.2 IMP
   000048         005300     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1104.2 IMP
   000049         005400     02 RE-MARK                  PIC X(61).                       IF1104.2
   000050         005500 01  TEST-COMPUTED.                                               IF1104.2
   000051         005600     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1104.2 IMP
   000052         005700     02 FILLER                   PIC X(17)  VALUE                 IF1104.2
   000053         005800            "       COMPUTED=".                                   IF1104.2
   000054         005900     02 COMPUTED-X.                                               IF1104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1104.2 IMP
   000056         006100     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1104.2 55
   000057         006200                                 PIC -9(9).9(9).                  IF1104.2
   000058         006300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1104.2 55
   000059         006400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1104.2 55
   000060         006500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1104.2 55
   000061         006600     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1104.2 55
   000062         006700         04 COMPUTED-18V0                    PIC -9(18).          IF1104.2
   000063         006800         04 FILLER                           PIC X.               IF1104.2
   000064         006900     03 FILLER PIC X(50) VALUE SPACE.                             IF1104.2 IMP
   000065         007000 01  TEST-CORRECT.                                                IF1104.2
   000066         007100     02 FILLER PIC X(30) VALUE SPACE.                             IF1104.2 IMP
   000067         007200     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1104.2
   000068         007300     02 CORRECT-X.                                                IF1104.2
   000069         007400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1104.2 IMP
   000070         007500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1104.2 69
   000071         007600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1104.2 69
   000072         007700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1104.2 69
   000073         007800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1104.2 69
   000074         007900     03      CR-18V0 REDEFINES CORRECT-A.                         IF1104.2 69
   000075         008000         04 CORRECT-18V0                     PIC -9(18).          IF1104.2
   000076         008100         04 FILLER                           PIC X.               IF1104.2
   000077         008200     03 FILLER PIC X(2) VALUE SPACE.                              IF1104.2 IMP
   000078         008300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1104.2 IMP
   000079         008400 01  TEST-CORRECT-MIN.                                            IF1104.2
   000080         008500     02 FILLER PIC X(30) VALUE SPACE.                             IF1104.2 IMP
   000081         008600     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1104.2
   000082         008700     02 CORRECTMI-X.                                              IF1104.2
   000083         008800     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1104.2 IMP
   000084         008900     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1104.2 83
   000085         009000     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1104.2 83
   000086         009100     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1104.2 83
   000087         009200     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1104.2 83
   000088         009300     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1104.2 83
   000089         009400         04 CORRECTMI-18V0                     PIC -9(18).        IF1104.2
   000090         009500         04 FILLER                           PIC X.               IF1104.2
   000091         009600     03 FILLER PIC X(2) VALUE SPACE.                              IF1104.2 IMP
   000092         009700     03 FILLER                           PIC X(48) VALUE SPACE.   IF1104.2 IMP
   000093         009800 01  TEST-CORRECT-MAX.                                            IF1104.2
   000094         009900     02 FILLER PIC X(30) VALUE SPACE.                             IF1104.2 IMP
   000095         010000     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1104.2
   000096         010100     02 CORRECTMA-X.                                              IF1104.2
   000097         010200     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1104.2 IMP
   000098         010300     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1104.2 97
   000099         010400     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1104.2 97
   000100         010500     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1104.2 97
   000101         010600     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1104.2 97
   000102         010700     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1104.2 97
   000103         010800         04 CORRECTMA-18V0                     PIC -9(18).        IF1104.2
   000104         010900         04 FILLER                           PIC X.               IF1104.2
   000105         011000     03 FILLER PIC X(2) VALUE SPACE.                              IF1104.2 IMP
   000106         011100     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1104.2 IMP
   000107         011200 01  CCVS-C-1.                                                    IF1104.2
   000108         011300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1104.2
   000109         011400-    "SS  PARAGRAPH-NAME                                          IF1104.2
   000110         011500-    "       REMARKS".                                            IF1104.2
   000111         011600     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1104.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700 01  CCVS-C-2.                                                    IF1104.2
   000113         011800     02 FILLER                     PIC X        VALUE SPACE.      IF1104.2 IMP
   000114         011900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1104.2
   000115         012000     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1104.2 IMP
   000116         012100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1104.2
   000117         012200     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1104.2 IMP
   000118         012300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1104.2 IMP
   000119         012400 01  REC-CT                        PIC 99       VALUE ZERO.       IF1104.2 IMP
   000120         012500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1104.2 IMP
   000121         012600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1104.2 IMP
   000122         012700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1104.2 IMP
   000123         012800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1104.2 IMP
   000124         012900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1104.2 IMP
   000125         013000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1104.2 IMP
   000126         013100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1104.2 IMP
   000127         013200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1104.2 IMP
   000128         013300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1104.2 IMP
   000129         013400 01  CCVS-H-1.                                                    IF1104.2
   000130         013500     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1104.2 IMP
   000131         013600     02  FILLER                    PIC X(42)    VALUE             IF1104.2
   000132         013700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1104.2
   000133         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1104.2 IMP
   000134         013900 01  CCVS-H-2A.                                                   IF1104.2
   000135         014000   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1104.2 IMP
   000136         014100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1104.2
   000137         014200   02  FILLER                        PIC XXXX   VALUE             IF1104.2
   000138         014300     "4.2 ".                                                      IF1104.2
   000139         014400   02  FILLER                        PIC X(28)  VALUE             IF1104.2
   000140         014500            " COPY - NOT FOR DISTRIBUTION".                       IF1104.2
   000141         014600   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1104.2 IMP
   000142         014700                                                                  IF1104.2
   000143         014800 01  CCVS-H-2B.                                                   IF1104.2
   000144         014900   02  FILLER                        PIC X(15)  VALUE             IF1104.2
   000145         015000            "TEST RESULT OF ".                                    IF1104.2
   000146         015100   02  TEST-ID                       PIC X(9).                    IF1104.2
   000147         015200   02  FILLER                        PIC X(4)   VALUE             IF1104.2
   000148         015300            " IN ".                                               IF1104.2
   000149         015400   02  FILLER                        PIC X(12)  VALUE             IF1104.2
   000150         015500     " HIGH       ".                                              IF1104.2
   000151         015600   02  FILLER                        PIC X(22)  VALUE             IF1104.2
   000152         015700            " LEVEL VALIDATION FOR ".                             IF1104.2
   000153         015800   02  FILLER                        PIC X(58)  VALUE             IF1104.2
   000154         015900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1104.2
   000155         016000 01  CCVS-H-3.                                                    IF1104.2
   000156         016100     02  FILLER                      PIC X(34)  VALUE             IF1104.2
   000157         016200            " FOR OFFICIAL USE ONLY    ".                         IF1104.2
   000158         016300     02  FILLER                      PIC X(58)  VALUE             IF1104.2
   000159         016400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1104.2
   000160         016500     02  FILLER                      PIC X(28)  VALUE             IF1104.2
   000161         016600            "  COPYRIGHT   1985 ".                                IF1104.2
   000162         016700 01  CCVS-E-1.                                                    IF1104.2
   000163         016800     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1104.2 IMP
   000164         016900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1104.2
   000165         017000     02 ID-AGAIN                     PIC X(9).                    IF1104.2
   000166         017100     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1104.2 IMP
   000167         017200 01  CCVS-E-2.                                                    IF1104.2
   000168         017300     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1104.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1104.2 IMP
   000170         017500     02 CCVS-E-2-2.                                               IF1104.2
   000171         017600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1104.2 IMP
   000172         017700         03 FILLER                   PIC X      VALUE SPACE.      IF1104.2 IMP
   000173         017800         03 ENDER-DESC               PIC X(44)  VALUE             IF1104.2
   000174         017900            "ERRORS ENCOUNTERED".                                 IF1104.2
   000175         018000 01  CCVS-E-3.                                                    IF1104.2
   000176         018100     02  FILLER                      PIC X(22)  VALUE             IF1104.2
   000177         018200            " FOR OFFICIAL USE ONLY".                             IF1104.2
   000178         018300     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1104.2 IMP
   000179         018400     02  FILLER                      PIC X(58)  VALUE             IF1104.2
   000180         018500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1104.2
   000181         018600     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1104.2 IMP
   000182         018700     02 FILLER                       PIC X(15)  VALUE             IF1104.2
   000183         018800             " COPYRIGHT 1985".                                   IF1104.2
   000184         018900 01  CCVS-E-4.                                                    IF1104.2
   000185         019000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1104.2 IMP
   000186         019100     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1104.2
   000187         019200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1104.2 IMP
   000188         019300     02 FILLER                       PIC X(40)  VALUE             IF1104.2
   000189         019400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1104.2
   000190         019500 01  XXINFO.                                                      IF1104.2
   000191         019600     02 FILLER                       PIC X(19)  VALUE             IF1104.2
   000192         019700            "*** INFORMATION ***".                                IF1104.2
   000193         019800     02 INFO-TEXT.                                                IF1104.2
   000194         019900       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1104.2 IMP
   000195         020000       04 XXCOMPUTED                 PIC X(20).                   IF1104.2
   000196         020100       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1104.2 IMP
   000197         020200       04 XXCORRECT                  PIC X(20).                   IF1104.2
   000198         020300     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1104.2
   000199         020400 01  HYPHEN-LINE.                                                 IF1104.2
   000200         020500     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1104.2 IMP
   000201         020600     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1104.2
   000202         020700-    "*****************************************".                 IF1104.2
   000203         020800     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1104.2
   000204         020900-    "******************************".                            IF1104.2
   000205         021000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1104.2
   000206         021100     "IF110A".                                                    IF1104.2
   000207         021200 PROCEDURE DIVISION.                                              IF1104.2
   000208         021300 CCVS1 SECTION.                                                   IF1104.2
   000209         021400 OPEN-FILES.                                                      IF1104.2
   000210         021500     OPEN     OUTPUT PRINT-FILE.                                  IF1104.2 22
   000211         021600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1104.2 205 146 205 165
   000212         021700     MOVE    SPACE TO TEST-RESULTS.                               IF1104.2 IMP 38
   000213         021800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1104.2 236 241
   000214         021900     GO TO CCVS1-EXIT.                                            IF1104.2 329
   000215         022000 CLOSE-FILES.                                                     IF1104.2
   000216         022100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1104.2 245 265 22
   000217         022200 TERMINATE-CCVS.                                                  IF1104.2
   000218         022300     STOP     RUN.                                                IF1104.2
   000219         022400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1104.2 42 122
   000220         022500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1104.2 42 123
   000221         022600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1104.2 42 121
   000222         022700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1104.2 42 120
   000223         022800     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1104.2 49
   000224         022900 PRINT-DETAIL.                                                    IF1104.2
   000225         023000     IF REC-CT NOT EQUAL TO ZERO                                  IF1104.2 119 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  023100             MOVE "." TO PARDOT-X                                 IF1104.2 46
   000227      1  023200             MOVE REC-CT TO DOTVALUE.                             IF1104.2 119 47
   000228         023300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1104.2 38 23 277
   000229         023400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1104.2 42 277
   000230      1  023500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1104.2 298 318
   000231      1  023600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1104.2 319 328
   000232         023700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1104.2 IMP 42 IMP 54
   000233         023800     MOVE SPACE TO CORRECT-X.                                     IF1104.2 IMP 68
   000234         023900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1104.2 119 IMP IMP 44
   000235         024000     MOVE     SPACE TO RE-MARK.                                   IF1104.2 IMP 49
   000236         024100 HEAD-ROUTINE.                                                    IF1104.2
   000237         024200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1104.2 129 24 277
   000238         024300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1104.2 134 24 277
   000239         024400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1104.2 143 24 277
   000240         024500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1104.2 155 24 277
   000241         024600 COLUMN-NAMES-ROUTINE.                                            IF1104.2
   000242         024700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1104.2 107 24 277
   000243         024800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1104.2 112 24 277
   000244         024900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1104.2 199 24 277
   000245         025000 END-ROUTINE.                                                     IF1104.2
   000246         025100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1104.2 199 24 277
   000247         025200 END-RTN-EXIT.                                                    IF1104.2
   000248         025300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1104.2 162 24 277
   000249         025400 END-ROUTINE-1.                                                   IF1104.2
   000250         025500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1104.2 121 125 122
   000251         025600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1104.2 125 120 125
   000252         025700      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1104.2 123 125
   000253         025800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1104.2 123 185
   000254         025900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1104.2 125 187
   000255         026000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1104.2 184 170
   000256         026100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1104.2 167 24 277
   000257         026200  END-ROUTINE-12.                                                 IF1104.2
   000258         026300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1104.2 173
   000259         026400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1104.2 121 IMP
   000260      1  026500         MOVE "NO " TO ERROR-TOTAL                                IF1104.2 171
   000261         026600         ELSE                                                     IF1104.2
   000262      1  026700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1104.2 121 171
   000263         026800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1104.2 167 24
   000264         026900     PERFORM WRITE-LINE.                                          IF1104.2 277
   000265         027000 END-ROUTINE-13.                                                  IF1104.2
   000266         027100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1104.2 120 IMP
   000267      1  027200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1104.2 171
   000268      1  027300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1104.2 120 171
   000269         027400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1104.2 173
   000270         027500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1104.2 167 24 277
   000271         027600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1104.2 122 IMP
   000272      1  027700          MOVE "NO " TO ERROR-TOTAL                               IF1104.2 171
   000273      1  027800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1104.2 122 171
   000274         027900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1104.2 173
   000275         028000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1104.2 167 24 277
   000276         028100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1104.2 175 24 277
   000277         028200 WRITE-LINE.                                                      IF1104.2
   000278         028300     ADD 1 TO RECORD-COUNT.                                       IF1104.2 127
   000279         028400     IF RECORD-COUNT GREATER 42                                   IF1104.2 127
   000280      1  028500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1104.2 24 126
   000281      1  028600         MOVE SPACE TO DUMMY-RECORD                               IF1104.2 IMP 24
   000282      1  028700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1104.2 24
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1104.2 129 24 293
   000284      1  028900         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1104.2 134 24 293
   000285      1  029000         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1104.2 143 24 293
   000286      1  029100         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1104.2 155 24 293
   000287      1  029200         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1104.2 107 24 293
   000288      1  029300         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1104.2 112 24 293
   000289      1  029400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1104.2 199 24 293
   000290      1  029500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1104.2 126 24
   000291      1  029600         MOVE ZERO TO RECORD-COUNT.                               IF1104.2 IMP 127
   000292         029700     PERFORM WRT-LN.                                              IF1104.2 293
   000293         029800 WRT-LN.                                                          IF1104.2
   000294         029900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1104.2 24
   000295         030000     MOVE SPACE TO DUMMY-RECORD.                                  IF1104.2 IMP 24
   000296         030100 BLANK-LINE-PRINT.                                                IF1104.2
   000297         030200     PERFORM WRT-LN.                                              IF1104.2 293
   000298         030300 FAIL-ROUTINE.                                                    IF1104.2
   000299         030400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1104.2 54 IMP
   000300      1  030500            GO TO FAIL-ROUTINE-WRITE.                             IF1104.2 307
   000301         030600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1104.2 68 IMP 307
   000302         030700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1104.2 128 198
   000303         030800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1104.2 193
   000304         030900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1104.2 190 24 277
   000305         031000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1104.2 IMP 198
   000306         031100     GO TO  FAIL-ROUTINE-EX.                                      IF1104.2 318
   000307         031200 FAIL-ROUTINE-WRITE.                                              IF1104.2
   000308         031300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1104.2 50 23 277
   000309         031400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1104.2 128 78
   000310         031500                              CORMA-ANSI-REFERENCE.               IF1104.2 106
   000311         031600     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1104.2 84 IMP
   000312      1  031700           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1104.2 79 23 277
   000313      1  031800           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1104.2 93 23 277
   000314         031900     ELSE                                                         IF1104.2
   000315      1  032000           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1104.2 65 23 277
   000316         032100     PERFORM WRITE-LINE.                                          IF1104.2 277
   000317         032200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1104.2 IMP 78
   000318         032300 FAIL-ROUTINE-EX. EXIT.                                           IF1104.2
   000319         032400 BAIL-OUT.                                                        IF1104.2
   000320         032500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1104.2 55 IMP 322
   000321         032600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1104.2 69 IMP 328
   000322         032700 BAIL-OUT-WRITE.                                                  IF1104.2
   000323         032800     MOVE CORRECT-A TO XXCORRECT.                                 IF1104.2 69 197
   000324         032900     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1104.2 55 195
   000325         033000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1104.2 128 198
   000326         033100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1104.2 190 24 277
   000327         033200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1104.2 IMP 198
   000328         033300 BAIL-OUT-EX. EXIT.                                               IF1104.2
   000329         033400 CCVS1-EXIT.                                                      IF1104.2
   000330         033500     EXIT.                                                        IF1104.2
   000331         033700*                                                      *          IF1104.2
   000332         033800*    Intrinsic Function Tests      IF110A - FACTORIAL  *          IF1104.2
   000333         033900*                                                      *          IF1104.2
   000334         034100 SECT-IF110A SECTION.                                             IF1104.2
   000335         034200 F-FACTORIAL-INFO.                                                IF1104.2
   000336         034300     MOVE     "See ref. A-43 2.14" TO ANSI-REFERENCE.             IF1104.2 128
   000337         034400     MOVE     "FACTORIAL Function" TO FEATURE.                    IF1104.2 40
   000338         034600 F-FACTORIAL-01.                                                  IF1104.2
   000339         034700     MOVE ZERO TO WS-NUM.                                         IF1104.2 IMP 33
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800 F-FACTORIAL-TEST-01.                                             IF1104.2
   000341         034900     COMPUTE WS-NUM = FUNCTION FACTORIAL(0).                      IF1104.2 33 IFN
   000342         035000     IF WS-NUM = 1 THEN                                           IF1104.2 33
   000343      1  035100                    PERFORM PASS                                  IF1104.2 220
   000344         035200     ELSE                                                         IF1104.2
   000345      1  035300                    MOVE WS-NUM TO COMPUTED-N                     IF1104.2 33 56
   000346      1  035400                    MOVE 1 TO CORRECT-N                           IF1104.2 70
   000347      1  035500                    PERFORM FAIL.                                 IF1104.2 221
   000348         035600     GO TO F-FACTORIAL-WRITE-01.                                  IF1104.2 352
   000349         035700 F-FACTORIAL-DELETE-01.                                           IF1104.2
   000350         035800     PERFORM  DE-LETE.                                            IF1104.2 222
   000351         035900     GO TO    F-FACTORIAL-WRITE-01.                               IF1104.2 352
   000352         036000 F-FACTORIAL-WRITE-01.                                            IF1104.2
   000353         036100     MOVE "F-FACTORIAL-01" TO PAR-NAME.                           IF1104.2 44
   000354         036200     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
   000355         036400 F-FACTORIAL-02.                                                  IF1104.2
   000356         036500     EVALUATE FUNCTION FACTORIAL(3)                               IF1104.2 IFN
   000357         036600     WHEN 6                                                       IF1104.2
   000358      1  036700                    PERFORM PASS                                  IF1104.2 220
   000359         036800     WHEN OTHER                                                   IF1104.2
   000360      1  036900                    PERFORM FAIL.                                 IF1104.2 221
   000361         037000     GO TO F-FACTORIAL-WRITE-02.                                  IF1104.2 365
   000362         037100 F-FACTORIAL-DELETE-02.                                           IF1104.2
   000363         037200     PERFORM  DE-LETE.                                            IF1104.2 222
   000364         037300     GO TO    F-FACTORIAL-WRITE-02.                               IF1104.2 365
   000365         037400 F-FACTORIAL-WRITE-02.                                            IF1104.2
   000366         037500     MOVE "F-FACTORIAL-02" TO PAR-NAME.                           IF1104.2 44
   000367         037600     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
   000368         037800 F-FACTORIAL-03.                                                  IF1104.2
   000369         037900     IF FUNCTION FACTORIAL(A) = 120 THEN                          IF1104.2 IFN 27
   000370      1  038000                    PERFORM PASS                                  IF1104.2 220
   000371         038100     ELSE                                                         IF1104.2
   000372      1  038200                    PERFORM FAIL.                                 IF1104.2 221
   000373         038300     GO TO F-FACTORIAL-WRITE-03.                                  IF1104.2 377
   000374         038400 F-FACTORIAL-DELETE-03.                                           IF1104.2
   000375         038500     PERFORM  DE-LETE.                                            IF1104.2 222
   000376         038600     GO TO    F-FACTORIAL-WRITE-03.                               IF1104.2 377
   000377         038700 F-FACTORIAL-WRITE-03.                                            IF1104.2
   000378         038800     MOVE "F-FACTORIAL-03" TO PAR-NAME.                           IF1104.2 44
   000379         038900     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
   000380         039100 F-FACTORIAL-04.                                                  IF1104.2
   000381         039200     MOVE ZERO TO WS-NUM.                                         IF1104.2 IMP 33
   000382         039300 F-FACTORIAL-TEST-04.                                             IF1104.2
   000383         039400     COMPUTE WS-NUM = FUNCTION FACTORIAL(IND(4)).                 IF1104.2 33 IFN 31
   000384         039500     IF WS-NUM = 6 THEN                                           IF1104.2 33
   000385      1  039600                    PERFORM PASS                                  IF1104.2 220
   000386         039700     ELSE                                                         IF1104.2
   000387      1  039800                    MOVE WS-NUM TO COMPUTED-N                     IF1104.2 33 56
   000388      1  039900                    MOVE 6 TO CORRECT-N                           IF1104.2 70
   000389      1  040000                    PERFORM FAIL.                                 IF1104.2 221
   000390         040100     GO TO F-FACTORIAL-WRITE-04.                                  IF1104.2 394
   000391         040200 F-FACTORIAL-DELETE-04.                                           IF1104.2
   000392         040300     PERFORM  DE-LETE.                                            IF1104.2 222
   000393         040400     GO TO    F-FACTORIAL-WRITE-04.                               IF1104.2 394
   000394         040500 F-FACTORIAL-WRITE-04.                                            IF1104.2
   000395         040600     MOVE "F-FACTORIAL-04" TO PAR-NAME.                           IF1104.2 44
   000396         040700     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040900 F-FACTORIAL-05.                                                  IF1104.2
   000398         041000     MOVE ZERO TO WS-NUM.                                         IF1104.2 IMP 33
   000399         041100 F-FACTORIAL-TEST-05.                                             IF1104.2
   000400         041200     COMPUTE WS-NUM = FUNCTION FACTORIAL(IND(A)).                 IF1104.2 33 IFN 31 27
   000401         041300     IF WS-NUM = 5040 THEN                                        IF1104.2 33
   000402      1  041400                    PERFORM PASS                                  IF1104.2 220
   000403         041500     ELSE                                                         IF1104.2
   000404      1  041600                    MOVE WS-NUM TO COMPUTED-N                     IF1104.2 33 56
   000405      1  041700                    MOVE 5040 TO CORRECT-N                        IF1104.2 70
   000406      1  041800                    PERFORM FAIL.                                 IF1104.2 221
   000407         041900     GO TO F-FACTORIAL-WRITE-05.                                  IF1104.2 411
   000408         042000 F-FACTORIAL-DELETE-05.                                           IF1104.2
   000409         042100     PERFORM  DE-LETE.                                            IF1104.2 222
   000410         042200     GO TO    F-FACTORIAL-WRITE-05.                               IF1104.2 411
   000411         042300 F-FACTORIAL-WRITE-05.                                            IF1104.2
   000412         042400     MOVE "F-FACTORIAL-05" TO PAR-NAME.                           IF1104.2 44
   000413         042500     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
   000414         042700 F-FACTORIAL-06.                                                  IF1104.2
   000415         042800     MOVE ZERO TO WS-NUM.                                         IF1104.2 IMP 33
   000416         042900 F-FACTORIAL-TEST-06.                                             IF1104.2
   000417         043000     COMPUTE WS-NUM = FUNCTION FACTORIAL(                         IF1104.2 33 IFN
   000418         043100                      FUNCTION FACTORIAL(3)).                     IF1104.2 IFN
   000419         043200     IF WS-NUM = 720 THEN                                         IF1104.2 33
   000420      1  043300                    PERFORM PASS                                  IF1104.2 220
   000421         043400     ELSE                                                         IF1104.2
   000422      1  043500                    MOVE WS-NUM TO COMPUTED-N                     IF1104.2 33 56
   000423      1  043600                    MOVE 720 TO CORRECT-N                         IF1104.2 70
   000424      1  043700                    PERFORM FAIL.                                 IF1104.2 221
   000425         043800     GO TO F-FACTORIAL-WRITE-06.                                  IF1104.2 429
   000426         043900 F-FACTORIAL-DELETE-06.                                           IF1104.2
   000427         044000     PERFORM  DE-LETE.                                            IF1104.2 222
   000428         044100     GO TO    F-FACTORIAL-WRITE-06.                               IF1104.2 429
   000429         044200 F-FACTORIAL-WRITE-06.                                            IF1104.2
   000430         044300     MOVE "F-FACTORIAL-06" TO PAR-NAME.                           IF1104.2 44
   000431         044400     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
   000432         044600 F-FACTORIAL-07.                                                  IF1104.2
   000433         044700     MOVE ZERO TO WS-NUM.                                         IF1104.2 IMP 33
   000434         044800 F-FACTORIAL-TEST-07.                                             IF1104.2
   000435         044900     COMPUTE WS-NUM = FUNCTION FACTORIAL(1) + B.                  IF1104.2 33 IFN 28
   000436         045000     IF WS-NUM = 8 THEN                                           IF1104.2 33
   000437      1  045100                    PERFORM PASS                                  IF1104.2 220
   000438         045200     ELSE                                                         IF1104.2
   000439      1  045300                    MOVE WS-NUM TO COMPUTED-N                     IF1104.2 33 56
   000440      1  045400                    MOVE 8 TO CORRECT-N                           IF1104.2 70
   000441      1  045500                    PERFORM FAIL.                                 IF1104.2 221
   000442         045600     GO TO F-FACTORIAL-WRITE-07.                                  IF1104.2 446
   000443         045700 F-FACTORIAL-DELETE-07.                                           IF1104.2
   000444         045800     PERFORM  DE-LETE.                                            IF1104.2 222
   000445         045900     GO TO    F-FACTORIAL-WRITE-07.                               IF1104.2 446
   000446         046000 F-FACTORIAL-WRITE-07.                                            IF1104.2
   000447         046100     MOVE "F-FACTORIAL-07" TO PAR-NAME.                           IF1104.2 44
   000448         046200     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
   000449         046400 F-FACTORIAL-08.                                                  IF1104.2
   000450         046500     MOVE ZERO TO WS-NUM.                                         IF1104.2 IMP 33
   000451         046600 F-FACTORIAL-TEST-08.                                             IF1104.2
   000452         046700     COMPUTE WS-NUM = FUNCTION FACTORIAL(4) +                     IF1104.2 33 IFN
   000453         046800                      FUNCTION FACTORIAL(2).                      IF1104.2 IFN
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046900     IF WS-NUM = 26 THEN                                          IF1104.2 33
   000455      1  047000                    PERFORM PASS                                  IF1104.2 220
   000456         047100     ELSE                                                         IF1104.2
   000457      1  047200                    MOVE WS-NUM TO COMPUTED-N                     IF1104.2 33 56
   000458      1  047300                    MOVE 26 TO CORRECT-N                          IF1104.2 70
   000459      1  047400                    PERFORM FAIL.                                 IF1104.2 221
   000460         047500     GO TO F-FACTORIAL-WRITE-08.                                  IF1104.2 464
   000461         047600 F-FACTORIAL-DELETE-08.                                           IF1104.2
   000462         047700     PERFORM  DE-LETE.                                            IF1104.2 222
   000463         047800     GO TO    F-FACTORIAL-WRITE-08.                               IF1104.2 464
   000464         047900 F-FACTORIAL-WRITE-08.                                            IF1104.2
   000465         048000     MOVE "F-FACTORIAL-08" TO PAR-NAME.                           IF1104.2 44
   000466         048100     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
   000467         048300 F-FACTORIAL-09.                                                  IF1104.2
   000468         048400     MOVE ZERO TO WS-NUM.                                         IF1104.2 IMP 33
   000469         048500     PERFORM F-FACTORIAL-TEST-09                                  IF1104.2 473
   000470         048600       UNTIL FUNCTION FACTORIAL(ARG1) > 120.                      IF1104.2 IFN 29
   000471         048700     PERFORM PASS.                                                IF1104.2 220
   000472         048800     GO TO F-FACTORIAL-WRITE-09.                                  IF1104.2 478
   000473         048900 F-FACTORIAL-TEST-09.                                             IF1104.2
   000474         049000     COMPUTE ARG1 = ARG1 + 1.                                     IF1104.2 29 29
   000475         049100 F-FACTORIAL-DELETE-09.                                           IF1104.2
   000476         049200     PERFORM  DE-LETE.                                            IF1104.2 222
   000477         049300     GO TO    F-FACTORIAL-WRITE-09.                               IF1104.2 478
   000478         049400 F-FACTORIAL-WRITE-09.                                            IF1104.2
   000479         049500     MOVE "F-FACTORIAL-09" TO PAR-NAME.                           IF1104.2 44
   000480         049600     PERFORM  PRINT-DETAIL.                                       IF1104.2 224
   000481         049800 CCVS-EXIT SECTION.                                               IF1104.2
   000482         049900 CCVS-999999.                                                     IF1104.2
   000483         050000     GO TO CLOSE-FILES.                                           IF1104.2 215
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  369 400
      128   ANSI-REFERENCE . . . . . . . .  302 309 325 M336
       29   ARG1 . . . . . . . . . . . . .  470 M474 474
       30   ARR
       28   B. . . . . . . . . . . . . . .  435
      107   CCVS-C-1 . . . . . . . . . . .  242 287
      112   CCVS-C-2 . . . . . . . . . . .  243 288
      162   CCVS-E-1 . . . . . . . . . . .  248
      167   CCVS-E-2 . . . . . . . . . . .  256 263 270 275
      170   CCVS-E-2-2 . . . . . . . . . .  M255
      175   CCVS-E-3 . . . . . . . . . . .  276
      184   CCVS-E-4 . . . . . . . . . . .  255
      185   CCVS-E-4-1 . . . . . . . . . .  M253
      187   CCVS-E-4-2 . . . . . . . . . .  M254
      129   CCVS-H-1 . . . . . . . . . . .  237 283
      134   CCVS-H-2A. . . . . . . . . . .  238 284
      143   CCVS-H-2B. . . . . . . . . . .  239 285
      155   CCVS-H-3 . . . . . . . . . . .  240 286
      205   CCVS-PGM-ID. . . . . . . . . .  211 211
       61   CM-18V0
       55   COMPUTED-A . . . . . . . . . .  56 58 59 60 61 320 324
       56   COMPUTED-N . . . . . . . . . .  M345 M387 M404 M422 M439 M457
       54   COMPUTED-X . . . . . . . . . .  M232 299
       58   COMPUTED-0V18
       60   COMPUTED-14V4
       62   COMPUTED-18V0
       59   COMPUTED-4V14
       78   COR-ANSI-REFERENCE . . . . . .  M309 M317
      106   CORMA-ANSI-REFERENCE . . . . .  M310
       69   CORRECT-A. . . . . . . . . . .  70 71 72 73 74 321 323
       98   CORRECT-MAX
       84   CORRECT-MIN. . . . . . . . . .  311
       70   CORRECT-N. . . . . . . . . . .  M346 M388 M405 M423 M440 M458
       68   CORRECT-X. . . . . . . . . . .  M233 301
       71   CORRECT-0V18
       73   CORRECT-14V4
       75   CORRECT-18V0
       72   CORRECT-4V14
       97   CORRECTMA-A. . . . . . . . . .  98 99 100 101 102
       96   CORRECTMA-X
       99   CORRECTMA-0V18
      101   CORRECTMA-14V4
      103   CORRECTMA-18V0
      100   CORRECTMA-4V14
       83   CORRECTMI-A. . . . . . . . . .  84 85 86 87 88
       82   CORRECTMI-X
       85   CORRECTMI-0V18
       87   CORRECTMI-14V4
       89   CORRECTMI-18V0
       86   CORRECTMI-4V14
       74   CR-18V0
       88   CR-18V0
      102   CR-18V0
      120   DELETE-COUNTER . . . . . . . .  M222 251 266 268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page    13
0 Defined   Cross-reference of data names   References

0      47   DOTVALUE . . . . . . . . . . .  M227
      126   DUMMY-HOLD . . . . . . . . . .  M280 290
       24   DUMMY-RECORD . . . . . . . . .  M237 M238 M239 M240 M242 M243 M244 M246 M248 M256 M263 M270 M275 M276 280 M281
                                            282 M283 M284 M285 M286 M287 M288 M289 M290 294 M295 M304 M326
      173   ENDER-DESC . . . . . . . . . .  M258 M269 M274
      121   ERROR-COUNTER. . . . . . . . .  M221 250 259 262
      125   ERROR-HOLD . . . . . . . . . .  M250 M251 M251 M252 254
      171   ERROR-TOTAL. . . . . . . . . .  M260 M262 M267 M268 M272 M273
       40   FEATURE. . . . . . . . . . . .  M337
      199   HYPHEN-LINE. . . . . . . . . .  244 246 289
      165   ID-AGAIN . . . . . . . . . . .  M211
       31   IND. . . . . . . . . . . . . .  383 400
      198   INF-ANSI-REFERENCE . . . . . .  M302 M305 M325 M327
      193   INFO-TEXT. . . . . . . . . . .  M303
      122   INSPECT-COUNTER. . . . . . . .  M219 250 271 273
       35   MAX-RANGE
       34   MIN-RANGE
       42   P-OR-F . . . . . . . . . . . .  M219 M220 M221 M222 229 M232
       44   PAR-NAME . . . . . . . . . . .  M234 M353 M366 M378 M395 M412 M430 M447 M465 M479
       46   PARDOT-X . . . . . . . . . . .  M226
      123   PASS-COUNTER . . . . . . . . .  M220 252 253
       22   PRINT-FILE . . . . . . . . . .  18 210 216
       23   PRINT-REC. . . . . . . . . . .  M228 M308 M312 M313 M315
       49   RE-MARK. . . . . . . . . . . .  M223 M235
      119   REC-CT . . . . . . . . . . . .  225 227 234
      118   REC-SKL-SUB
      127   RECORD-COUNT . . . . . . . . .  M278 279 M291
       32   TEMP
       50   TEST-COMPUTED. . . . . . . . .  308
       65   TEST-CORRECT . . . . . . . . .  315
       93   TEST-CORRECT-MAX . . . . . . .  313
       79   TEST-CORRECT-MIN . . . . . . .  312
      146   TEST-ID. . . . . . . . . . . .  M211
       38   TEST-RESULTS . . . . . . . . .  M212 228
      124   TOTAL-ERROR
       33   WS-NUM . . . . . . . . . . . .  M339 M341 342 345 M381 M383 384 387 M398 M400 401 404 M415 M417 419 422 M433
                                            M435 436 439 M450 M452 454 457 M468
      195   XXCOMPUTED . . . . . . . . . .  M324
      197   XXCORRECT. . . . . . . . . . .  M323
      190   XXINFO . . . . . . . . . . . .  304 326
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page    14
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

      319   BAIL-OUT . . . . . . . . . . .  P231
      328   BAIL-OUT-EX. . . . . . . . . .  E231 G321
      322   BAIL-OUT-WRITE . . . . . . . .  G320
      296   BLANK-LINE-PRINT
      481   CCVS-EXIT
      482   CCVS-999999
      208   CCVS1
      329   CCVS1-EXIT . . . . . . . . . .  G214
      215   CLOSE-FILES. . . . . . . . . .  G483
      241   COLUMN-NAMES-ROUTINE . . . . .  E213
      222   DE-LETE. . . . . . . . . . . .  P350 P363 P375 P392 P409 P427 P444 P462 P476
      245   END-ROUTINE. . . . . . . . . .  P216
      249   END-ROUTINE-1
      257   END-ROUTINE-12
      265   END-ROUTINE-13 . . . . . . . .  E216
      247   END-RTN-EXIT
      349   F-FACTORIAL-DELETE-01
      362   F-FACTORIAL-DELETE-02
      374   F-FACTORIAL-DELETE-03
      391   F-FACTORIAL-DELETE-04
      408   F-FACTORIAL-DELETE-05
      426   F-FACTORIAL-DELETE-06
      443   F-FACTORIAL-DELETE-07
      461   F-FACTORIAL-DELETE-08
      475   F-FACTORIAL-DELETE-09
      335   F-FACTORIAL-INFO
      340   F-FACTORIAL-TEST-01
      382   F-FACTORIAL-TEST-04
      399   F-FACTORIAL-TEST-05
      416   F-FACTORIAL-TEST-06
      434   F-FACTORIAL-TEST-07
      451   F-FACTORIAL-TEST-08
      473   F-FACTORIAL-TEST-09. . . . . .  P469
      352   F-FACTORIAL-WRITE-01 . . . . .  G348 G351
      365   F-FACTORIAL-WRITE-02 . . . . .  G361 G364
      377   F-FACTORIAL-WRITE-03 . . . . .  G373 G376
      394   F-FACTORIAL-WRITE-04 . . . . .  G390 G393
      411   F-FACTORIAL-WRITE-05 . . . . .  G407 G410
      429   F-FACTORIAL-WRITE-06 . . . . .  G425 G428
      446   F-FACTORIAL-WRITE-07 . . . . .  G442 G445
      464   F-FACTORIAL-WRITE-08 . . . . .  G460 G463
      478   F-FACTORIAL-WRITE-09 . . . . .  G472 G477
      338   F-FACTORIAL-01
      355   F-FACTORIAL-02
      368   F-FACTORIAL-03
      380   F-FACTORIAL-04
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page    15
0 Defined   Cross-reference of procedures   References

0     397   F-FACTORIAL-05
      414   F-FACTORIAL-06
      432   F-FACTORIAL-07
      449   F-FACTORIAL-08
      467   F-FACTORIAL-09
      221   FAIL . . . . . . . . . . . . .  P347 P360 P372 P389 P406 P424 P441 P459
      298   FAIL-ROUTINE . . . . . . . . .  P230
      318   FAIL-ROUTINE-EX. . . . . . . .  E230 G306
      307   FAIL-ROUTINE-WRITE . . . . . .  G300 G301
      236   HEAD-ROUTINE . . . . . . . . .  P213
      219   INSPT
      209   OPEN-FILES
      220   PASS . . . . . . . . . . . . .  P343 P358 P370 P385 P402 P420 P437 P455 P471
      224   PRINT-DETAIL . . . . . . . . .  P354 P367 P379 P396 P413 P431 P448 P466 P480
      334   SECT-IF110A
      217   TERMINATE-CCVS
      277   WRITE-LINE . . . . . . . . . .  P228 P229 P237 P238 P239 P240 P242 P243 P244 P246 P248 P256 P264 P270 P275 P276
                                            P304 P308 P312 P313 P315 P316 P326
      293   WRT-LN . . . . . . . . . . . .  P283 P284 P285 P286 P287 P288 P289 P292 P297
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page    16
0 Defined   Cross-reference of programs     References

        3   IF110A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF110A    Date 06/04/2022  Time 11:58:28   Page    17
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF110A:
 *    Source records = 483
 *    Data Division statements = 91
 *    Procedure Division statements = 240
 *    Generated COBOL statements = 0
 *    Program complexity factor = 248
0End of compilation 1,  program IF110A,  highest severity 0.
0Return code 0
