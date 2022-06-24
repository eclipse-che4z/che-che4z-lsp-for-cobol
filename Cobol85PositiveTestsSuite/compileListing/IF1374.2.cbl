1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:49   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:49   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1374.2
   000002         000200 PROGRAM-ID.                                                      IF1374.2
   000003         000300     IF137A.                                                      IF1374.2
   000004         000400                                                                  IF1374.2
   000005         000600*                                                         *       IF1374.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1374.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1374.2
   000008         000900* STANDARD-DEVIATION.                                     *       IF1374.2
   000009         001000*                                                         *       IF1374.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1374.2
   000011         001300 CONFIGURATION SECTION.                                           IF1374.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1374.2
   000013         001500     XXXXX082.                                                    IF1374.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1374.2
   000015         001700     XXXXX083.                                                    IF1374.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1374.2
   000017         001900 FILE-CONTROL.                                                    IF1374.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1374.2 22
   000019         002100     XXXXX055.                                                    IF1374.2
   000020         002200 DATA DIVISION.                                                   IF1374.2
   000021         002300 FILE SECTION.                                                    IF1374.2
   000022         002400 FD  PRINT-FILE.                                                  IF1374.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1374.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1374.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1374.2
   000026         002900* Variables specific to the Intrinsic Function Test IF137A*       IF1374.2
   000027         003100 01  A                   PIC S9(10)          VALUE 5.             IF1374.2
   000028         003200 01  B                   PIC S9(10)          VALUE 7.             IF1374.2
   000029         003300 01  C                   PIC S9(10)          VALUE -4.            IF1374.2
   000030         003400 01  D                   PIC S9(10)          VALUE 10.            IF1374.2
   000031         003500 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1374.2
   000032         003600 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1374.2
   000033         003700 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1374.2
   000034         003800 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1374.2
   000035         003900 01  P                   PIC S9(10)          VALUE 4.             IF1374.2
   000036         004000 01  Q                   PIC S9(10)          VALUE 3.             IF1374.2
   000037         004100 01  R                   PIC S9(10)          VALUE 5.             IF1374.2
   000038         004200 01  ARG3                PIC S9(10)          VALUE 2.             IF1374.2
   000039         004300 01  ARR                                     VALUE "40537".       IF1374.2
   000040         004400     02  IND OCCURS 5 TIMES PIC 9.                                IF1374.2
   000041         004500 01  TEMP                PIC S9(10).                              IF1374.2
   000042         004600 01  WS-NUM              PIC S9(5)V9(6).                          IF1374.2
   000043         004700 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1374.2
   000044         004800 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1374.2
   000045         004900*                                                                 IF1374.2
   000046         005100*                                                                 IF1374.2
   000047         005200 01  TEST-RESULTS.                                                IF1374.2
   000048         005300     02 FILLER                   PIC X      VALUE SPACE.          IF1374.2 IMP
   000049         005400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1374.2 IMP
   000050         005500     02 FILLER                   PIC X      VALUE SPACE.          IF1374.2 IMP
   000051         005600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1374.2 IMP
   000052         005700     02 FILLER                   PIC X      VALUE SPACE.          IF1374.2 IMP
   000053         005800     02  PAR-NAME.                                                IF1374.2
   000054         005900       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1374.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000       03  PARDOT-X              PIC X      VALUE SPACE.          IF1374.2 IMP
   000056         006100       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1374.2 IMP
   000057         006200     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1374.2 IMP
   000058         006300     02 RE-MARK                  PIC X(61).                       IF1374.2
   000059         006400 01  TEST-COMPUTED.                                               IF1374.2
   000060         006500     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1374.2 IMP
   000061         006600     02 FILLER                   PIC X(17)  VALUE                 IF1374.2
   000062         006700            "       COMPUTED=".                                   IF1374.2
   000063         006800     02 COMPUTED-X.                                               IF1374.2
   000064         006900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1374.2 IMP
   000065         007000     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1374.2 64
   000066         007100                                 PIC -9(9).9(9).                  IF1374.2
   000067         007200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1374.2 64
   000068         007300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1374.2 64
   000069         007400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1374.2 64
   000070         007500     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1374.2 64
   000071         007600         04 COMPUTED-18V0                    PIC -9(18).          IF1374.2
   000072         007700         04 FILLER                           PIC X.               IF1374.2
   000073         007800     03 FILLER PIC X(50) VALUE SPACE.                             IF1374.2 IMP
   000074         007900 01  TEST-CORRECT.                                                IF1374.2
   000075         008000     02 FILLER PIC X(30) VALUE SPACE.                             IF1374.2 IMP
   000076         008100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1374.2
   000077         008200     02 CORRECT-X.                                                IF1374.2
   000078         008300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1374.2 IMP
   000079         008400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1374.2 78
   000080         008500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1374.2 78
   000081         008600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1374.2 78
   000082         008700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1374.2 78
   000083         008800     03      CR-18V0 REDEFINES CORRECT-A.                         IF1374.2 78
   000084         008900         04 CORRECT-18V0                     PIC -9(18).          IF1374.2
   000085         009000         04 FILLER                           PIC X.               IF1374.2
   000086         009100     03 FILLER PIC X(2) VALUE SPACE.                              IF1374.2 IMP
   000087         009200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1374.2 IMP
   000088         009300 01  TEST-CORRECT-MIN.                                            IF1374.2
   000089         009400     02 FILLER PIC X(30) VALUE SPACE.                             IF1374.2 IMP
   000090         009500     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1374.2
   000091         009600     02 CORRECTMI-X.                                              IF1374.2
   000092         009700     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1374.2 IMP
   000093         009800     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1374.2 92
   000094         009900     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1374.2 92
   000095         010000     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1374.2 92
   000096         010100     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1374.2 92
   000097         010200     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1374.2 92
   000098         010300         04 CORRECTMI-18V0                     PIC -9(18).        IF1374.2
   000099         010400         04 FILLER                           PIC X.               IF1374.2
   000100         010500     03 FILLER PIC X(2) VALUE SPACE.                              IF1374.2 IMP
   000101         010600     03 FILLER                           PIC X(48) VALUE SPACE.   IF1374.2 IMP
   000102         010700 01  TEST-CORRECT-MAX.                                            IF1374.2
   000103         010800     02 FILLER PIC X(30) VALUE SPACE.                             IF1374.2 IMP
   000104         010900     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1374.2
   000105         011000     02 CORRECTMA-X.                                              IF1374.2
   000106         011100     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1374.2 IMP
   000107         011200     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1374.2 106
   000108         011300     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1374.2 106
   000109         011400     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1374.2 106
   000110         011500     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1374.2 106
   000111         011600     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1374.2 106
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700         04 CORRECTMA-18V0                     PIC -9(18).        IF1374.2
   000113         011800         04 FILLER                           PIC X.               IF1374.2
   000114         011900     03 FILLER PIC X(2) VALUE SPACE.                              IF1374.2 IMP
   000115         012000     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1374.2 IMP
   000116         012100 01  CCVS-C-1.                                                    IF1374.2
   000117         012200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1374.2
   000118         012300-    "SS  PARAGRAPH-NAME                                          IF1374.2
   000119         012400-    "       REMARKS".                                            IF1374.2
   000120         012500     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1374.2 IMP
   000121         012600 01  CCVS-C-2.                                                    IF1374.2
   000122         012700     02 FILLER                     PIC X        VALUE SPACE.      IF1374.2 IMP
   000123         012800     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1374.2
   000124         012900     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1374.2 IMP
   000125         013000     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1374.2
   000126         013100     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1374.2 IMP
   000127         013200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1374.2 IMP
   000128         013300 01  REC-CT                        PIC 99       VALUE ZERO.       IF1374.2 IMP
   000129         013400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1374.2 IMP
   000130         013500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1374.2 IMP
   000131         013600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1374.2 IMP
   000132         013700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1374.2 IMP
   000133         013800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1374.2 IMP
   000134         013900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1374.2 IMP
   000135         014000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1374.2 IMP
   000136         014100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1374.2 IMP
   000137         014200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1374.2 IMP
   000138         014300 01  CCVS-H-1.                                                    IF1374.2
   000139         014400     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1374.2 IMP
   000140         014500     02  FILLER                    PIC X(42)    VALUE             IF1374.2
   000141         014600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1374.2
   000142         014700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1374.2 IMP
   000143         014800 01  CCVS-H-2A.                                                   IF1374.2
   000144         014900   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1374.2 IMP
   000145         015000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1374.2
   000146         015100   02  FILLER                        PIC XXXX   VALUE             IF1374.2
   000147         015200     "4.2 ".                                                      IF1374.2
   000148         015300   02  FILLER                        PIC X(28)  VALUE             IF1374.2
   000149         015400            " COPY - NOT FOR DISTRIBUTION".                       IF1374.2
   000150         015500   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1374.2 IMP
   000151         015600                                                                  IF1374.2
   000152         015700 01  CCVS-H-2B.                                                   IF1374.2
   000153         015800   02  FILLER                        PIC X(15)  VALUE             IF1374.2
   000154         015900            "TEST RESULT OF ".                                    IF1374.2
   000155         016000   02  TEST-ID                       PIC X(9).                    IF1374.2
   000156         016100   02  FILLER                        PIC X(4)   VALUE             IF1374.2
   000157         016200            " IN ".                                               IF1374.2
   000158         016300   02  FILLER                        PIC X(12)  VALUE             IF1374.2
   000159         016400     " HIGH       ".                                              IF1374.2
   000160         016500   02  FILLER                        PIC X(22)  VALUE             IF1374.2
   000161         016600            " LEVEL VALIDATION FOR ".                             IF1374.2
   000162         016700   02  FILLER                        PIC X(58)  VALUE             IF1374.2
   000163         016800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1374.2
   000164         016900 01  CCVS-H-3.                                                    IF1374.2
   000165         017000     02  FILLER                      PIC X(34)  VALUE             IF1374.2
   000166         017100            " FOR OFFICIAL USE ONLY    ".                         IF1374.2
   000167         017200     02  FILLER                      PIC X(58)  VALUE             IF1374.2
   000168         017300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02  FILLER                      PIC X(28)  VALUE             IF1374.2
   000170         017500            "  COPYRIGHT   1985 ".                                IF1374.2
   000171         017600 01  CCVS-E-1.                                                    IF1374.2
   000172         017700     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1374.2 IMP
   000173         017800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1374.2
   000174         017900     02 ID-AGAIN                     PIC X(9).                    IF1374.2
   000175         018000     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1374.2 IMP
   000176         018100 01  CCVS-E-2.                                                    IF1374.2
   000177         018200     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1374.2 IMP
   000178         018300     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1374.2 IMP
   000179         018400     02 CCVS-E-2-2.                                               IF1374.2
   000180         018500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1374.2 IMP
   000181         018600         03 FILLER                   PIC X      VALUE SPACE.      IF1374.2 IMP
   000182         018700         03 ENDER-DESC               PIC X(44)  VALUE             IF1374.2
   000183         018800            "ERRORS ENCOUNTERED".                                 IF1374.2
   000184         018900 01  CCVS-E-3.                                                    IF1374.2
   000185         019000     02  FILLER                      PIC X(22)  VALUE             IF1374.2
   000186         019100            " FOR OFFICIAL USE ONLY".                             IF1374.2
   000187         019200     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1374.2 IMP
   000188         019300     02  FILLER                      PIC X(58)  VALUE             IF1374.2
   000189         019400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1374.2
   000190         019500     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1374.2 IMP
   000191         019600     02 FILLER                       PIC X(15)  VALUE             IF1374.2
   000192         019700             " COPYRIGHT 1985".                                   IF1374.2
   000193         019800 01  CCVS-E-4.                                                    IF1374.2
   000194         019900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1374.2 IMP
   000195         020000     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1374.2
   000196         020100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1374.2 IMP
   000197         020200     02 FILLER                       PIC X(40)  VALUE             IF1374.2
   000198         020300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1374.2
   000199         020400 01  XXINFO.                                                      IF1374.2
   000200         020500     02 FILLER                       PIC X(19)  VALUE             IF1374.2
   000201         020600            "*** INFORMATION ***".                                IF1374.2
   000202         020700     02 INFO-TEXT.                                                IF1374.2
   000203         020800       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1374.2 IMP
   000204         020900       04 XXCOMPUTED                 PIC X(20).                   IF1374.2
   000205         021000       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1374.2 IMP
   000206         021100       04 XXCORRECT                  PIC X(20).                   IF1374.2
   000207         021200     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1374.2
   000208         021300 01  HYPHEN-LINE.                                                 IF1374.2
   000209         021400     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1374.2 IMP
   000210         021500     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1374.2
   000211         021600-    "*****************************************".                 IF1374.2
   000212         021700     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1374.2
   000213         021800-    "******************************".                            IF1374.2
   000214         021900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1374.2
   000215         022000     "IF137A".                                                    IF1374.2
   000216         022100 PROCEDURE DIVISION.                                              IF1374.2
   000217         022200 CCVS1 SECTION.                                                   IF1374.2
   000218         022300 OPEN-FILES.                                                      IF1374.2
   000219         022400     OPEN     OUTPUT PRINT-FILE.                                  IF1374.2 22
   000220         022500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1374.2 214 155 214 174
   000221         022600     MOVE    SPACE TO TEST-RESULTS.                               IF1374.2 IMP 47
   000222         022700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1374.2 245 250
   000223         022800     GO TO CCVS1-EXIT.                                            IF1374.2 338
   000224         022900 CLOSE-FILES.                                                     IF1374.2
   000225         023000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1374.2 254 274 22
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 TERMINATE-CCVS.                                                  IF1374.2
   000227         023200     STOP     RUN.                                                IF1374.2
   000228         023300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1374.2 51 131
   000229         023400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1374.2 51 132
   000230         023500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1374.2 51 130
   000231         023600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1374.2 51 129
   000232         023700     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1374.2 58
   000233         023800 PRINT-DETAIL.                                                    IF1374.2
   000234         023900     IF REC-CT NOT EQUAL TO ZERO                                  IF1374.2 128 IMP
   000235      1  024000             MOVE "." TO PARDOT-X                                 IF1374.2 55
   000236      1  024100             MOVE REC-CT TO DOTVALUE.                             IF1374.2 128 56
   000237         024200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1374.2 47 23 286
   000238         024300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1374.2 51 286
   000239      1  024400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1374.2 307 327
   000240      1  024500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1374.2 328 337
   000241         024600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1374.2 IMP 51 IMP 63
   000242         024700     MOVE SPACE TO CORRECT-X.                                     IF1374.2 IMP 77
   000243         024800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1374.2 128 IMP IMP 53
   000244         024900     MOVE     SPACE TO RE-MARK.                                   IF1374.2 IMP 58
   000245         025000 HEAD-ROUTINE.                                                    IF1374.2
   000246         025100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1374.2 138 24 286
   000247         025200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1374.2 143 24 286
   000248         025300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1374.2 152 24 286
   000249         025400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1374.2 164 24 286
   000250         025500 COLUMN-NAMES-ROUTINE.                                            IF1374.2
   000251         025600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1374.2 116 24 286
   000252         025700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1374.2 121 24 286
   000253         025800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1374.2 208 24 286
   000254         025900 END-ROUTINE.                                                     IF1374.2
   000255         026000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1374.2 208 24 286
   000256         026100 END-RTN-EXIT.                                                    IF1374.2
   000257         026200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1374.2 171 24 286
   000258         026300 END-ROUTINE-1.                                                   IF1374.2
   000259         026400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1374.2 130 134 131
   000260         026500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1374.2 134 129 134
   000261         026600      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1374.2 132 134
   000262         026700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1374.2 132 194
   000263         026800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1374.2 134 196
   000264         026900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1374.2 193 179
   000265         027000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1374.2 176 24 286
   000266         027100  END-ROUTINE-12.                                                 IF1374.2
   000267         027200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1374.2 182
   000268         027300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1374.2 130 IMP
   000269      1  027400         MOVE "NO " TO ERROR-TOTAL                                IF1374.2 180
   000270         027500         ELSE                                                     IF1374.2
   000271      1  027600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1374.2 130 180
   000272         027700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1374.2 176 24
   000273         027800     PERFORM WRITE-LINE.                                          IF1374.2 286
   000274         027900 END-ROUTINE-13.                                                  IF1374.2
   000275         028000     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1374.2 129 IMP
   000276      1  028100         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1374.2 180
   000277      1  028200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1374.2 129 180
   000278         028300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1374.2 182
   000279         028400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1374.2 176 24 286
   000280         028500      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1374.2 131 IMP
   000281      1  028600          MOVE "NO " TO ERROR-TOTAL                               IF1374.2 180
   000282      1  028700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1374.2 131 180
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1374.2 182
   000284         028900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1374.2 176 24 286
   000285         029000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1374.2 184 24 286
   000286         029100 WRITE-LINE.                                                      IF1374.2
   000287         029200     ADD 1 TO RECORD-COUNT.                                       IF1374.2 136
   000288         029300     IF RECORD-COUNT GREATER 42                                   IF1374.2 136
   000289      1  029400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1374.2 24 135
   000290      1  029500         MOVE SPACE TO DUMMY-RECORD                               IF1374.2 IMP 24
   000291      1  029600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1374.2 24
   000292      1  029700         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1374.2 138 24 302
   000293      1  029800         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1374.2 143 24 302
   000294      1  029900         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1374.2 152 24 302
   000295      1  030000         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1374.2 164 24 302
   000296      1  030100         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1374.2 116 24 302
   000297      1  030200         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1374.2 121 24 302
   000298      1  030300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1374.2 208 24 302
   000299      1  030400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1374.2 135 24
   000300      1  030500         MOVE ZERO TO RECORD-COUNT.                               IF1374.2 IMP 136
   000301         030600     PERFORM WRT-LN.                                              IF1374.2 302
   000302         030700 WRT-LN.                                                          IF1374.2
   000303         030800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1374.2 24
   000304         030900     MOVE SPACE TO DUMMY-RECORD.                                  IF1374.2 IMP 24
   000305         031000 BLANK-LINE-PRINT.                                                IF1374.2
   000306         031100     PERFORM WRT-LN.                                              IF1374.2 302
   000307         031200 FAIL-ROUTINE.                                                    IF1374.2
   000308         031300     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1374.2 63 IMP
   000309      1  031400            GO TO FAIL-ROUTINE-WRITE.                             IF1374.2 316
   000310         031500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1374.2 77 IMP 316
   000311         031600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1374.2 137 207
   000312         031700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1374.2 202
   000313         031800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1374.2 199 24 286
   000314         031900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1374.2 IMP 207
   000315         032000     GO TO  FAIL-ROUTINE-EX.                                      IF1374.2 327
   000316         032100 FAIL-ROUTINE-WRITE.                                              IF1374.2
   000317         032200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1374.2 59 23 286
   000318         032300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1374.2 137 87
   000319         032400                              CORMA-ANSI-REFERENCE.               IF1374.2 115
   000320         032500     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1374.2 93 IMP
   000321      1  032600           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1374.2 88 23 286
   000322      1  032700           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1374.2 102 23 286
   000323         032800     ELSE                                                         IF1374.2
   000324      1  032900           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1374.2 74 23 286
   000325         033000     PERFORM WRITE-LINE.                                          IF1374.2 286
   000326         033100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1374.2 IMP 87
   000327         033200 FAIL-ROUTINE-EX. EXIT.                                           IF1374.2
   000328         033300 BAIL-OUT.                                                        IF1374.2
   000329         033400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1374.2 64 IMP 331
   000330         033500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1374.2 78 IMP 337
   000331         033600 BAIL-OUT-WRITE.                                                  IF1374.2
   000332         033700     MOVE CORRECT-A TO XXCORRECT.                                 IF1374.2 78 206
   000333         033800     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1374.2 64 204
   000334         033900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1374.2 137 207
   000335         034000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1374.2 199 24 286
   000336         034100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1374.2 IMP 207
   000337         034200 BAIL-OUT-EX. EXIT.                                               IF1374.2
   000338         034300 CCVS1-EXIT.                                                      IF1374.2
   000339         034400     EXIT.                                                        IF1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034600*                                                      *          IF1374.2
   000341         034700* Intrinsic Function Tests IF137A - STANDARD-DEVIATION *          IF1374.2
   000342         034800*                                                      *          IF1374.2
   000343         035000 SECT-IF137A SECTION.                                             IF1374.2
   000344         035100 F-STD-DEV-INFO.                                                  IF1374.2
   000345         035200     MOVE     "See ref. A-70 2.41" TO ANSI-REFERENCE.             IF1374.2 137
   000346         035300     MOVE     "STANDARD-DEVIATION" TO FEATURE.                    IF1374.2 49
   000347         035500 F-STD-DEV-01.                                                    IF1374.2
   000348         035600     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000349         035700     MOVE  6.97750 TO MIN-RANGE.                                  IF1374.2 43
   000350         035800     MOVE  6.97778 TO MAX-RANGE.                                  IF1374.2 44
   000351         035900 F-STD-DEV-TEST-01.                                               IF1374.2
   000352         036000     COMPUTE WS-NUM =                                             IF1374.2 42
   000353         036100            FUNCTION STANDARD-DEVIATION(5, -2, -14, 0).           IF1374.2 IFN
   000354         036200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000355         036300        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000356      1  036400                    PERFORM PASS                                  IF1374.2 229
   000357         036500     ELSE                                                         IF1374.2
   000358      1  036600                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000359      1  036700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000360      1  036800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000361      1  036900                    PERFORM FAIL.                                 IF1374.2 230
   000362         037000     GO TO F-STD-DEV-WRITE-01.                                    IF1374.2 366
   000363         037100 F-STD-DEV-DELETE-01.                                             IF1374.2
   000364         037200     PERFORM  DE-LETE.                                            IF1374.2 231
   000365         037300     GO TO    F-STD-DEV-WRITE-01.                                 IF1374.2 366
   000366         037400 F-STD-DEV-WRITE-01.                                              IF1374.2
   000367         037500     MOVE "F-STD-DEV-01" TO PAR-NAME.                             IF1374.2 53
   000368         037600     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000369         037800 F-STD-DEV-02.                                                    IF1374.2
   000370         037900     EVALUATE FUNCTION STANDARD-DEVIATION(3.9, -0.3, 8.7, 100.2)  IF1374.2 IFN
   000371         038000     WHEN  41.7333 THRU  41.7350                                  IF1374.2
   000372      1  038100                    PERFORM PASS                                  IF1374.2 229
   000373         038200     WHEN OTHER                                                   IF1374.2
   000374      1  038300                    PERFORM FAIL.                                 IF1374.2 230
   000375         038400     GO TO F-STD-DEV-WRITE-02.                                    IF1374.2 379
   000376         038500 F-STD-DEV-DELETE-02.                                             IF1374.2
   000377         038600     PERFORM  DE-LETE.                                            IF1374.2 231
   000378         038700     GO TO    F-STD-DEV-WRITE-02.                                 IF1374.2 379
   000379         038800 F-STD-DEV-WRITE-02.                                              IF1374.2
   000380         038900     MOVE "F-STD-DEV-02" TO PAR-NAME.                             IF1374.2 53
   000381         039000     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000382         039200 F-STD-DEV-03.                                                    IF1374.2
   000383         039300     MOVE  5.22005 TO MIN-RANGE.                                  IF1374.2 43
   000384         039400     MOVE  5.22025 TO MAX-RANGE.                                  IF1374.2 44
   000385         039500 F-STD-DEV-TEST-03.                                               IF1374.2
   000386         039600     IF (FUNCTION STANDARD-DEVIATION(A, B, C, D)                  IF1374.2 IFN 27 28 29 30
   000387         039700                                   >= MIN-RANGE) AND              IF1374.2 43
   000388         039800        (FUNCTION STANDARD-DEVIATION(A, B, C, D)                  IF1374.2 IFN 27 28 29 30
   000389         039900                                   <= MAX-RANGE) THEN             IF1374.2 44
   000390      1  040000                    PERFORM PASS                                  IF1374.2 229
   000391         040100     ELSE                                                         IF1374.2
   000392      1  040200                    PERFORM FAIL.                                 IF1374.2 230
   000393         040300     GO TO F-STD-DEV-WRITE-03.                                    IF1374.2 397
   000394         040400 F-STD-DEV-DELETE-03.                                             IF1374.2
   000395         040500     PERFORM  DE-LETE.                                            IF1374.2 231
   000396         040600     GO TO    F-STD-DEV-WRITE-03.                                 IF1374.2 397
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040700 F-STD-DEV-WRITE-03.                                              IF1374.2
   000398         040800     MOVE "F-STD-DEV-03" TO PAR-NAME.                             IF1374.2 53
   000399         040900     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000400         041100 F-STD-DEV-04.                                                    IF1374.2
   000401         041200     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000402         041300     MOVE  16.8440 TO MIN-RANGE.                                  IF1374.2 43
   000403         041400     MOVE  16.8447 TO MAX-RANGE.                                  IF1374.2 44
   000404         041500 F-STD-DEV-TEST-04.                                               IF1374.2
   000405         041600     COMPUTE WS-NUM =                                             IF1374.2 42
   000406         041700               FUNCTION STANDARD-DEVIATION(E, F, G, H).           IF1374.2 IFN 31 32 33 34
   000407         041800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000408         041900        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000409      1  042000                    PERFORM PASS                                  IF1374.2 229
   000410         042100     ELSE                                                         IF1374.2
   000411      1  042200                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000412      1  042300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000413      1  042400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000414      1  042500                    PERFORM FAIL.                                 IF1374.2 230
   000415         042600     GO TO F-STD-DEV-WRITE-04.                                    IF1374.2 419
   000416         042700 F-STD-DEV-DELETE-04.                                             IF1374.2
   000417         042800     PERFORM  DE-LETE.                                            IF1374.2 231
   000418         042900     GO TO    F-STD-DEV-WRITE-04.                                 IF1374.2 419
   000419         043000 F-STD-DEV-WRITE-04.                                              IF1374.2
   000420         043100     MOVE "F-STD-DEV-04" TO PAR-NAME.                             IF1374.2 53
   000421         043200     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000422         043400 F-STD-DEV-05.                                                    IF1374.2
   000423         043500     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000424         043600     MOVE  9.73119 TO MIN-RANGE.                                  IF1374.2 43
   000425         043700     MOVE  9.73158 TO MAX-RANGE.                                  IF1374.2 44
   000426         043800 F-STD-DEV-TEST-05.                                               IF1374.2
   000427         043900     COMPUTE WS-NUM =                                             IF1374.2 42
   000428         044000       FUNCTION STANDARD-DEVIATION(10.2, -0.2, 5.6, -15.6).       IF1374.2 IFN
   000429         044100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000430         044200        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000431      1  044300                    PERFORM PASS                                  IF1374.2 229
   000432         044400     ELSE                                                         IF1374.2
   000433      1  044500                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000434      1  044600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000435      1  044700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000436      1  044800                    PERFORM FAIL.                                 IF1374.2 230
   000437         044900     GO TO F-STD-DEV-WRITE-05.                                    IF1374.2 441
   000438         045000 F-STD-DEV-DELETE-05.                                             IF1374.2
   000439         045100     PERFORM  DE-LETE.                                            IF1374.2 231
   000440         045200     GO TO    F-STD-DEV-WRITE-05.                                 IF1374.2 441
   000441         045300 F-STD-DEV-WRITE-05.                                              IF1374.2
   000442         045400     MOVE "F-STD-DEV-05" TO PAR-NAME.                             IF1374.2 53
   000443         045500     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000444         045700 F-STD-DEV-06.                                                    IF1374.2
   000445         045800     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000446         045900     MOVE  12.4976 TO MIN-RANGE.                                  IF1374.2 43
   000447         046000     MOVE  12.4981 TO MAX-RANGE.                                  IF1374.2 44
   000448         046100 F-STD-DEV-TEST-06.                                               IF1374.2
   000449         046200     COMPUTE WS-NUM =                                             IF1374.2 42
   000450         046300        FUNCTION STANDARD-DEVIATION(A, B, C, D, E, F, G, H).      IF1374.2 IFN 27 28 29 30 31 32 33 34
   000451         046400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000452         046500        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000453      1  046600                    PERFORM PASS                                  IF1374.2 229
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046700     ELSE                                                         IF1374.2
   000455      1  046800                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000456      1  046900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000457      1  047000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000458      1  047100                    PERFORM FAIL.                                 IF1374.2 230
   000459         047200     GO TO F-STD-DEV-WRITE-06.                                    IF1374.2 463
   000460         047300 F-STD-DEV-DELETE-06.                                             IF1374.2
   000461         047400     PERFORM  DE-LETE.                                            IF1374.2 231
   000462         047500     GO TO    F-STD-DEV-WRITE-06.                                 IF1374.2 463
   000463         047600 F-STD-DEV-WRITE-06.                                              IF1374.2
   000464         047700     MOVE "F-STD-DEV-06" TO PAR-NAME.                             IF1374.2 53
   000465         047800     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000466         048000 F-STD-DEV-07.                                                    IF1374.2
   000467         048100     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000468         048200     MOVE  2.16020 TO MIN-RANGE.                                  IF1374.2 43
   000469         048300     MOVE  2.16028 TO MAX-RANGE.                                  IF1374.2 44
   000470         048400 F-STD-DEV-TEST-07.                                               IF1374.2
   000471         048500     COMPUTE WS-NUM =                                             IF1374.2 42
   000472         048600        FUNCTION STANDARD-DEVIATION(IND(1), IND(2), IND(3)).      IF1374.2 IFN 40 40 40
   000473         048700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000474         048800        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000475      1  048900                    PERFORM PASS                                  IF1374.2 229
   000476         049000     ELSE                                                         IF1374.2
   000477      1  049100                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000478      1  049200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000479      1  049300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000480      1  049400                    PERFORM FAIL.                                 IF1374.2 230
   000481         049500     GO TO F-STD-DEV-WRITE-07.                                    IF1374.2 485
   000482         049600 F-STD-DEV-DELETE-07.                                             IF1374.2
   000483         049700     PERFORM  DE-LETE.                                            IF1374.2 231
   000484         049800     GO TO    F-STD-DEV-WRITE-07.                                 IF1374.2 485
   000485         049900 F-STD-DEV-WRITE-07.                                              IF1374.2
   000486         050000     MOVE "F-STD-DEV-07" TO PAR-NAME.                             IF1374.2 53
   000487         050100     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000488         050300 F-STD-DEV-08.                                                    IF1374.2
   000489         050400     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000490         050500     MOVE  1.63296 TO MIN-RANGE.                                  IF1374.2 43
   000491         050600     MOVE  1.63302 TO MAX-RANGE.                                  IF1374.2 44
   000492         050700 F-STD-DEV-TEST-08.                                               IF1374.2
   000493         050800     COMPUTE WS-NUM =                                             IF1374.2 42
   000494         050900        FUNCTION STANDARD-DEVIATION(IND(P), IND(Q), IND(R)).      IF1374.2 IFN 40 35 40 36 40 37
   000495         051000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000496         051100        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000497      1  051200                    PERFORM PASS                                  IF1374.2 229
   000498         051300     ELSE                                                         IF1374.2
   000499      1  051400                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000500      1  051500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000501      1  051600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000502      1  051700                    PERFORM FAIL.                                 IF1374.2 230
   000503         051800     GO TO F-STD-DEV-WRITE-08.                                    IF1374.2 507
   000504         051900 F-STD-DEV-DELETE-08.                                             IF1374.2
   000505         052000     PERFORM  DE-LETE.                                            IF1374.2 231
   000506         052100     GO TO    F-STD-DEV-WRITE-08.                                 IF1374.2 507
   000507         052200 F-STD-DEV-WRITE-08.                                              IF1374.2
   000508         052300     MOVE "F-STD-DEV-08" TO PAR-NAME.                             IF1374.2 53
   000509         052400     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000510         052600 F-STD-DEV-09.                                                    IF1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052700     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000512         052800     MOVE 2.31511 TO MIN-RANGE.                                   IF1374.2 43
   000513         052900     MOVE 2.31521 TO MAX-RANGE.                                   IF1374.2 44
   000514         053000 F-STD-DEV-TEST-09.                                               IF1374.2
   000515         053100     COMPUTE WS-NUM = FUNCTION STANDARD-DEVIATION(IND(ALL)).      IF1374.2 42 IFN 40
   000516         053200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000517         053300        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000518      1  053400                    PERFORM PASS                                  IF1374.2 229
   000519         053500     ELSE                                                         IF1374.2
   000520      1  053600                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000521      1  053700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000522      1  053800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000523      1  053900                    PERFORM FAIL.                                 IF1374.2 230
   000524         054000     GO TO F-STD-DEV-WRITE-09.                                    IF1374.2 528
   000525         054100 F-STD-DEV-DELETE-09.                                             IF1374.2
   000526         054200     PERFORM  DE-LETE.                                            IF1374.2 231
   000527         054300     GO TO    F-STD-DEV-WRITE-09.                                 IF1374.2 528
   000528         054400 F-STD-DEV-WRITE-09.                                              IF1374.2
   000529         054500     MOVE "F-STD-DEV-09" TO PAR-NAME.                             IF1374.2 53
   000530         054600     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000531         054800 F-STD-DEV-10.                                                    IF1374.2
   000532         054900     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000533         055000     MOVE  0.028559  TO MIN-RANGE.                                IF1374.2 43
   000534         055100     MOVE  0.028561  TO MAX-RANGE.                                IF1374.2 44
   000535         055200 F-STD-DEV-TEST-10.                                               IF1374.2
   000536         055300     COMPUTE WS-NUM =                                             IF1374.2 42
   000537         055400        FUNCTION STANDARD-DEVIATION(0.00032, 0.00019,             IF1374.2 IFN
   000538         055500                                    0.00014, -0.06574).           IF1374.2
   000539         055600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000540         055700        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000541      1  055800                    PERFORM PASS                                  IF1374.2 229
   000542         055900     ELSE                                                         IF1374.2
   000543      1  056000                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000544      1  056100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000545      1  056200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000546      1  056300                    PERFORM FAIL.                                 IF1374.2 230
   000547         056400     GO TO F-STD-DEV-WRITE-10.                                    IF1374.2 551
   000548         056500 F-STD-DEV-DELETE-10.                                             IF1374.2
   000549         056600     PERFORM  DE-LETE.                                            IF1374.2 231
   000550         056700     GO TO    F-STD-DEV-WRITE-10.                                 IF1374.2 551
   000551         056800 F-STD-DEV-WRITE-10.                                              IF1374.2
   000552         056900     MOVE "F-STD-DEV-10" TO PAR-NAME.                             IF1374.2 53
   000553         057000     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000554         057200 F-STD-DEV-11.                                                    IF1374.2
   000555         057300     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000556         057400     MOVE -0.000020 TO MIN-RANGE.                                 IF1374.2 43
   000557         057500     MOVE  0.000020 TO MAX-RANGE.                                 IF1374.2 44
   000558         057600 F-STD-DEV-TEST-11.                                               IF1374.2
   000559         057700     COMPUTE WS-NUM = FUNCTION STANDARD-DEVIATION(A, 5, A).       IF1374.2 42 IFN 27 27
   000560         057800                                                                  IF1374.2
   000561         057900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000562         058000        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000563      1  058100                    PERFORM PASS                                  IF1374.2 229
   000564         058200     ELSE                                                         IF1374.2
   000565      1  058300                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000566      1  058400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000567      1  058500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  058600                    PERFORM FAIL.                                 IF1374.2 230
   000569         058700     GO TO F-STD-DEV-WRITE-11.                                    IF1374.2 573
   000570         058800 F-STD-DEV-DELETE-11.                                             IF1374.2
   000571         058900     PERFORM  DE-LETE.                                            IF1374.2 231
   000572         059000     GO TO    F-STD-DEV-WRITE-11.                                 IF1374.2 573
   000573         059100 F-STD-DEV-WRITE-11.                                              IF1374.2
   000574         059200     MOVE "F-STD-DEV-11" TO PAR-NAME.                             IF1374.2 53
   000575         059300     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000576         059500 F-STD-DEV-12.                                                    IF1374.2
   000577         059600     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000578         059700     MOVE  11.7995 TO MIN-RANGE.                                  IF1374.2 43
   000579         059800     MOVE  11.8005 TO MAX-RANGE.                                  IF1374.2 44
   000580         059900 F-STD-DEV-TEST-12.                                               IF1374.2
   000581         060000     COMPUTE WS-NUM =                                             IF1374.2 42
   000582         060100        FUNCTION STANDARD-DEVIATION(2.6 + 30, 4.5 * 2).           IF1374.2 IFN
   000583         060200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000584         060300        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000585      1  060400                    PERFORM PASS                                  IF1374.2 229
   000586         060500     ELSE                                                         IF1374.2
   000587      1  060600                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000588      1  060700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000589      1  060800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000590      1  060900                    PERFORM FAIL.                                 IF1374.2 230
   000591         061000     GO TO F-STD-DEV-WRITE-12.                                    IF1374.2 595
   000592         061100 F-STD-DEV-DELETE-12.                                             IF1374.2
   000593         061200     PERFORM  DE-LETE.                                            IF1374.2 231
   000594         061300     GO TO    F-STD-DEV-WRITE-12.                                 IF1374.2 595
   000595         061400 F-STD-DEV-WRITE-12.                                              IF1374.2
   000596         061500     MOVE "F-STD-DEV-12" TO PAR-NAME.                             IF1374.2 53
   000597         061600     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000598         061800 F-STD-DEV-13.                                                    IF1374.2
   000599         061900     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000600         062000     MOVE  19.3556 TO MIN-RANGE.                                  IF1374.2 43
   000601         062100     MOVE  19.3572 TO MAX-RANGE.                                  IF1374.2 44
   000602         062200 F-STD-DEV-TEST-13.                                               IF1374.2
   000603         062300     COMPUTE WS-NUM =                                             IF1374.2 42
   000604         062400         FUNCTION STANDARD-DEVIATION(E, 9 * A, 0, B / 2).         IF1374.2 IFN 31 27 28
   000605         062500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000606         062600        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000607      1  062700                    PERFORM PASS                                  IF1374.2 229
   000608         062800     ELSE                                                         IF1374.2
   000609      1  062900                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000610      1  063000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000611      1  063100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000612      1  063200                    PERFORM FAIL.                                 IF1374.2 230
   000613         063300     GO TO F-STD-DEV-WRITE-13.                                    IF1374.2 617
   000614         063400 F-STD-DEV-DELETE-13.                                             IF1374.2
   000615         063500     PERFORM  DE-LETE.                                            IF1374.2 231
   000616         063600     GO TO    F-STD-DEV-WRITE-13.                                 IF1374.2 617
   000617         063700 F-STD-DEV-WRITE-13.                                              IF1374.2
   000618         063800     MOVE "F-STD-DEV-13" TO PAR-NAME.                             IF1374.2 53
   000619         063900     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000620         064100 F-STD-DEV-14.                                                    IF1374.2
   000621         064200     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000622         064300     MOVE 77.9969 TO MIN-RANGE.                                   IF1374.2 43
   000623         064400     MOVE 78.0031 TO MAX-RANGE.                                   IF1374.2 44
   000624         064500 F-STD-DEV-TEST-14.                                               IF1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064600     COMPUTE WS-NUM = FUNCTION STANDARD-DEVIATION(A) + 78.        IF1374.2 42 IFN 27
   000626         064700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000627         064800        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000628      1  064900                    PERFORM PASS                                  IF1374.2 229
   000629         065000     ELSE                                                         IF1374.2
   000630      1  065100                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000631      1  065200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000632      1  065300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000633      1  065400                    PERFORM FAIL.                                 IF1374.2 230
   000634         065500     GO TO F-STD-DEV-WRITE-14.                                    IF1374.2 638
   000635         065600 F-STD-DEV-DELETE-14.                                             IF1374.2
   000636         065700     PERFORM  DE-LETE.                                            IF1374.2 231
   000637         065800     GO TO    F-STD-DEV-WRITE-14.                                 IF1374.2 638
   000638         065900 F-STD-DEV-WRITE-14.                                              IF1374.2
   000639         066000     MOVE "F-STD-DEV-14" TO PAR-NAME.                             IF1374.2 53
   000640         066100     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000641         066300 F-STD-DEV-15.                                                    IF1374.2
   000642         066400     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000643         066500     MOVE 0.99996 TO MIN-RANGE.                                   IF1374.2 43
   000644         066600     MOVE 1.00004 TO MAX-RANGE.                                   IF1374.2 44
   000645         066700 F-STD-DEV-TEST-15.                                               IF1374.2
   000646         066800     COMPUTE WS-NUM = FUNCTION STANDARD-DEVIATION(A, B) +         IF1374.2 42 IFN 27 28
   000647         066900                      FUNCTION STANDARD-DEVIATION(1, 1).          IF1374.2 IFN
   000648         067000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000649         067100        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000650      1  067200                    PERFORM PASS                                  IF1374.2 229
   000651         067300     ELSE                                                         IF1374.2
   000652      1  067400                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000653      1  067500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000654      1  067600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000655      1  067700                    PERFORM FAIL.                                 IF1374.2 230
   000656         067800     GO TO F-STD-DEV-WRITE-15.                                    IF1374.2 660
   000657         067900 F-STD-DEV-DELETE-15.                                             IF1374.2
   000658         068000     PERFORM  DE-LETE.                                            IF1374.2 231
   000659         068100     GO TO    F-STD-DEV-WRITE-15.                                 IF1374.2 660
   000660         068200 F-STD-DEV-WRITE-15.                                              IF1374.2
   000661         068300     MOVE "F-STD-DEV-15" TO PAR-NAME.                             IF1374.2 53
   000662         068400     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000663         068600 F-STD-DEV-16.                                                    IF1374.2
   000664         068700     MOVE ZERO TO WS-NUM.                                         IF1374.2 IMP 42
   000665         068800     MOVE -0.000040 TO MIN-RANGE.                                 IF1374.2 43
   000666         068900     MOVE  0.000040 TO MAX-RANGE.                                 IF1374.2 44
   000667         069000 F-STD-DEV-TEST-16.                                               IF1374.2
   000668         069100     COMPUTE WS-NUM = FUNCTION STANDARD-DEVIATION(                IF1374.2 42 IFN
   000669         069200                      FUNCTION STANDARD-DEVIATION(0, 0)).         IF1374.2 IFN
   000670         069300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1374.2 42 43
   000671         069400        (WS-NUM <= MAX-RANGE) THEN                                IF1374.2 42 44
   000672      1  069500                    PERFORM PASS                                  IF1374.2 229
   000673         069600     ELSE                                                         IF1374.2
   000674      1  069700                    MOVE WS-NUM TO COMPUTED-N                     IF1374.2 42 65
   000675      1  069800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1374.2 43 93
   000676      1  069900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1374.2 44 107
   000677      1  070000                    PERFORM FAIL.                                 IF1374.2 230
   000678         070100     GO TO F-STD-DEV-WRITE-16.                                    IF1374.2 682
   000679         070200 F-STD-DEV-DELETE-16.                                             IF1374.2
   000680         070300     PERFORM  DE-LETE.                                            IF1374.2 231
   000681         070400     GO TO    F-STD-DEV-WRITE-16.                                 IF1374.2 682
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         070500 F-STD-DEV-WRITE-16.                                              IF1374.2
   000683         070600     MOVE "F-STD-DEV-16" TO PAR-NAME.                             IF1374.2 53
   000684         070700     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000685         070900 F-STD-DEV-17.                                                    IF1374.2
   000686         071000     PERFORM F-STD-DEV-TEST-17                                    IF1374.2 690
   000687         071100       UNTIL FUNCTION STANDARD-DEVIATION(1, 1, ARG3) > 1.         IF1374.2 IFN 38
   000688         071200     PERFORM PASS.                                                IF1374.2 229
   000689         071300     GO TO F-STD-DEV-WRITE-17.                                    IF1374.2 695
   000690         071400 F-STD-DEV-TEST-17.                                               IF1374.2
   000691         071500     COMPUTE ARG3 = ARG3 + 1.                                     IF1374.2 38 38
   000692         071600 F-STD-DEV-DELETE-17.                                             IF1374.2
   000693         071700     PERFORM  DE-LETE.                                            IF1374.2 231
   000694         071800     GO TO    F-STD-DEV-WRITE-17.                                 IF1374.2 695
   000695         071900 F-STD-DEV-WRITE-17.                                              IF1374.2
   000696         072000     MOVE "F-STD-DEV-17" TO PAR-NAME.                             IF1374.2 53
   000697         072100     PERFORM  PRINT-DETAIL.                                       IF1374.2 233
   000698         072300 CCVS-EXIT SECTION.                                               IF1374.2
   000699         072400 CCVS-999999.                                                     IF1374.2
   000700         072500     GO TO CLOSE-FILES.                                           IF1374.2 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  386 388 450 559 559 604 625 646
      137   ANSI-REFERENCE . . . . . . . .  311 318 334 M345
       38   ARG3 . . . . . . . . . . . . .  687 M691 691
       39   ARR
       28   B. . . . . . . . . . . . . . .  386 388 450 604 646
       29   C. . . . . . . . . . . . . . .  386 388 450
      116   CCVS-C-1 . . . . . . . . . . .  251 296
      121   CCVS-C-2 . . . . . . . . . . .  252 297
      171   CCVS-E-1 . . . . . . . . . . .  257
      176   CCVS-E-2 . . . . . . . . . . .  265 272 279 284
      179   CCVS-E-2-2 . . . . . . . . . .  M264
      184   CCVS-E-3 . . . . . . . . . . .  285
      193   CCVS-E-4 . . . . . . . . . . .  264
      194   CCVS-E-4-1 . . . . . . . . . .  M262
      196   CCVS-E-4-2 . . . . . . . . . .  M263
      138   CCVS-H-1 . . . . . . . . . . .  246 292
      143   CCVS-H-2A. . . . . . . . . . .  247 293
      152   CCVS-H-2B. . . . . . . . . . .  248 294
      164   CCVS-H-3 . . . . . . . . . . .  249 295
      214   CCVS-PGM-ID. . . . . . . . . .  220 220
       70   CM-18V0
       64   COMPUTED-A . . . . . . . . . .  65 67 68 69 70 329 333
       65   COMPUTED-N . . . . . . . . . .  M358 M411 M433 M455 M477 M499 M520 M543 M565 M587 M609 M630 M652 M674
       63   COMPUTED-X . . . . . . . . . .  M241 308
       67   COMPUTED-0V18
       69   COMPUTED-14V4
       71   COMPUTED-18V0
       68   COMPUTED-4V14
       87   COR-ANSI-REFERENCE . . . . . .  M318 M326
      115   CORMA-ANSI-REFERENCE . . . . .  M319
       78   CORRECT-A. . . . . . . . . . .  79 80 81 82 83 330 332
      107   CORRECT-MAX. . . . . . . . . .  M360 M413 M435 M457 M479 M501 M522 M545 M567 M589 M611 M632 M654 M676
       93   CORRECT-MIN. . . . . . . . . .  320 M359 M412 M434 M456 M478 M500 M521 M544 M566 M588 M610 M631 M653 M675
       79   CORRECT-N
       77   CORRECT-X. . . . . . . . . . .  M242 310
       80   CORRECT-0V18
       82   CORRECT-14V4
       84   CORRECT-18V0
       81   CORRECT-4V14
      106   CORRECTMA-A. . . . . . . . . .  107 108 109 110 111
      105   CORRECTMA-X
      108   CORRECTMA-0V18
      110   CORRECTMA-14V4
      112   CORRECTMA-18V0
      109   CORRECTMA-4V14
       92   CORRECTMI-A. . . . . . . . . .  93 94 95 96 97
       91   CORRECTMI-X
       94   CORRECTMI-0V18
       96   CORRECTMI-14V4
       98   CORRECTMI-18V0
       95   CORRECTMI-4V14
       83   CR-18V0
       97   CR-18V0
      111   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    17
0 Defined   Cross-reference of data names   References

0      30   D. . . . . . . . . . . . . . .  386 388 450
      129   DELETE-COUNTER . . . . . . . .  M231 260 275 277
       56   DOTVALUE . . . . . . . . . . .  M236
      135   DUMMY-HOLD . . . . . . . . . .  M289 299
       24   DUMMY-RECORD . . . . . . . . .  M246 M247 M248 M249 M251 M252 M253 M255 M257 M265 M272 M279 M284 M285 289 M290
                                            291 M292 M293 M294 M295 M296 M297 M298 M299 303 M304 M313 M335
       31   E. . . . . . . . . . . . . . .  406 450 604
      182   ENDER-DESC . . . . . . . . . .  M267 M278 M283
      130   ERROR-COUNTER. . . . . . . . .  M230 259 268 271
      134   ERROR-HOLD . . . . . . . . . .  M259 M260 M260 M261 263
      180   ERROR-TOTAL. . . . . . . . . .  M269 M271 M276 M277 M281 M282
       32   F. . . . . . . . . . . . . . .  406 450
       49   FEATURE. . . . . . . . . . . .  M346
       33   G. . . . . . . . . . . . . . .  406 450
       34   H. . . . . . . . . . . . . . .  406 450
      208   HYPHEN-LINE. . . . . . . . . .  253 255 298
      174   ID-AGAIN . . . . . . . . . . .  M220
       40   IND. . . . . . . . . . . . . .  472 472 472 494 494 494 515
      207   INF-ANSI-REFERENCE . . . . . .  M311 M314 M334 M336
      202   INFO-TEXT. . . . . . . . . . .  M312
      131   INSPECT-COUNTER. . . . . . . .  M228 259 280 282
       44   MAX-RANGE. . . . . . . . . . .  M350 355 360 M384 389 M403 408 413 M425 430 435 M447 452 457 M469 474 479 M491
                                            496 501 M513 517 522 M534 540 545 M557 562 567 M579 584 589 M601 606 611 M623
                                            627 632 M644 649 654 M666 671 676
       43   MIN-RANGE. . . . . . . . . . .  M349 354 359 M383 387 M402 407 412 M424 429 434 M446 451 456 M468 473 478 M490
                                            495 500 M512 516 521 M533 539 544 M556 561 566 M578 583 588 M600 605 610 M622
                                            626 631 M643 648 653 M665 670 675
       35   P. . . . . . . . . . . . . . .  494
       51   P-OR-F . . . . . . . . . . . .  M228 M229 M230 M231 238 M241
       53   PAR-NAME . . . . . . . . . . .  M243 M367 M380 M398 M420 M442 M464 M486 M508 M529 M552 M574 M596 M618 M639 M661
                                            M683 M696
       55   PARDOT-X . . . . . . . . . . .  M235
      132   PASS-COUNTER . . . . . . . . .  M229 261 262
       22   PRINT-FILE . . . . . . . . . .  18 219 225
       23   PRINT-REC. . . . . . . . . . .  M237 M317 M321 M322 M324
       36   Q. . . . . . . . . . . . . . .  494
       37   R. . . . . . . . . . . . . . .  494
       58   RE-MARK. . . . . . . . . . . .  M232 M244
      128   REC-CT . . . . . . . . . . . .  234 236 243
      127   REC-SKL-SUB
      136   RECORD-COUNT . . . . . . . . .  M287 288 M300
       41   TEMP
       59   TEST-COMPUTED. . . . . . . . .  317
       74   TEST-CORRECT . . . . . . . . .  324
      102   TEST-CORRECT-MAX . . . . . . .  322
       88   TEST-CORRECT-MIN . . . . . . .  321
      155   TEST-ID. . . . . . . . . . . .  M220
       47   TEST-RESULTS . . . . . . . . .  M221 237
      133   TOTAL-ERROR
       42   WS-NUM . . . . . . . . . . . .  M348 M352 354 355 358 M401 M405 407 408 411 M423 M427 429 430 433 M445 M449 451
                                            452 455 M467 M471 473 474 477 M489 M493 495 496 499 M511 M515 516 517 520 M532
                                            M536 539 540 543 M555 M559 561 562 565 M577 M581 583 584 587 M599 M603 605 606
                                            609 M621 M625 626 627 630 M642 M646 648 649 652 M664 M668 670 671 674
      204   XXCOMPUTED . . . . . . . . . .  M333
      206   XXCORRECT. . . . . . . . . . .  M332
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    18
0 Defined   Cross-reference of data names   References

0     199   XXINFO . . . . . . . . . . . .  313 335
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    19
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

      328   BAIL-OUT . . . . . . . . . . .  P240
      337   BAIL-OUT-EX. . . . . . . . . .  E240 G330
      331   BAIL-OUT-WRITE . . . . . . . .  G329
      305   BLANK-LINE-PRINT
      698   CCVS-EXIT
      699   CCVS-999999
      217   CCVS1
      338   CCVS1-EXIT . . . . . . . . . .  G223
      224   CLOSE-FILES. . . . . . . . . .  G700
      250   COLUMN-NAMES-ROUTINE . . . . .  E222
      231   DE-LETE. . . . . . . . . . . .  P364 P377 P395 P417 P439 P461 P483 P505 P526 P549 P571 P593 P615 P636 P658 P680
                                            P693
      254   END-ROUTINE. . . . . . . . . .  P225
      258   END-ROUTINE-1
      266   END-ROUTINE-12
      274   END-ROUTINE-13 . . . . . . . .  E225
      256   END-RTN-EXIT
      363   F-STD-DEV-DELETE-01
      376   F-STD-DEV-DELETE-02
      394   F-STD-DEV-DELETE-03
      416   F-STD-DEV-DELETE-04
      438   F-STD-DEV-DELETE-05
      460   F-STD-DEV-DELETE-06
      482   F-STD-DEV-DELETE-07
      504   F-STD-DEV-DELETE-08
      525   F-STD-DEV-DELETE-09
      548   F-STD-DEV-DELETE-10
      570   F-STD-DEV-DELETE-11
      592   F-STD-DEV-DELETE-12
      614   F-STD-DEV-DELETE-13
      635   F-STD-DEV-DELETE-14
      657   F-STD-DEV-DELETE-15
      679   F-STD-DEV-DELETE-16
      692   F-STD-DEV-DELETE-17
      344   F-STD-DEV-INFO
      351   F-STD-DEV-TEST-01
      385   F-STD-DEV-TEST-03
      404   F-STD-DEV-TEST-04
      426   F-STD-DEV-TEST-05
      448   F-STD-DEV-TEST-06
      470   F-STD-DEV-TEST-07
      492   F-STD-DEV-TEST-08
      514   F-STD-DEV-TEST-09
      535   F-STD-DEV-TEST-10
      558   F-STD-DEV-TEST-11
      580   F-STD-DEV-TEST-12
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    20
0 Defined   Cross-reference of procedures   References

0     602   F-STD-DEV-TEST-13
      624   F-STD-DEV-TEST-14
      645   F-STD-DEV-TEST-15
      667   F-STD-DEV-TEST-16
      690   F-STD-DEV-TEST-17. . . . . . .  P686
      366   F-STD-DEV-WRITE-01 . . . . . .  G362 G365
      379   F-STD-DEV-WRITE-02 . . . . . .  G375 G378
      397   F-STD-DEV-WRITE-03 . . . . . .  G393 G396
      419   F-STD-DEV-WRITE-04 . . . . . .  G415 G418
      441   F-STD-DEV-WRITE-05 . . . . . .  G437 G440
      463   F-STD-DEV-WRITE-06 . . . . . .  G459 G462
      485   F-STD-DEV-WRITE-07 . . . . . .  G481 G484
      507   F-STD-DEV-WRITE-08 . . . . . .  G503 G506
      528   F-STD-DEV-WRITE-09 . . . . . .  G524 G527
      551   F-STD-DEV-WRITE-10 . . . . . .  G547 G550
      573   F-STD-DEV-WRITE-11 . . . . . .  G569 G572
      595   F-STD-DEV-WRITE-12 . . . . . .  G591 G594
      617   F-STD-DEV-WRITE-13 . . . . . .  G613 G616
      638   F-STD-DEV-WRITE-14 . . . . . .  G634 G637
      660   F-STD-DEV-WRITE-15 . . . . . .  G656 G659
      682   F-STD-DEV-WRITE-16 . . . . . .  G678 G681
      695   F-STD-DEV-WRITE-17 . . . . . .  G689 G694
      347   F-STD-DEV-01
      369   F-STD-DEV-02
      382   F-STD-DEV-03
      400   F-STD-DEV-04
      422   F-STD-DEV-05
      444   F-STD-DEV-06
      466   F-STD-DEV-07
      488   F-STD-DEV-08
      510   F-STD-DEV-09
      531   F-STD-DEV-10
      554   F-STD-DEV-11
      576   F-STD-DEV-12
      598   F-STD-DEV-13
      620   F-STD-DEV-14
      641   F-STD-DEV-15
      663   F-STD-DEV-16
      685   F-STD-DEV-17
      230   FAIL . . . . . . . . . . . . .  P361 P374 P392 P414 P436 P458 P480 P502 P523 P546 P568 P590 P612 P633 P655 P677
      307   FAIL-ROUTINE . . . . . . . . .  P239
      327   FAIL-ROUTINE-EX. . . . . . . .  E239 G315
      316   FAIL-ROUTINE-WRITE . . . . . .  G309 G310
      245   HEAD-ROUTINE . . . . . . . . .  P222
      228   INSPT
      218   OPEN-FILES
      229   PASS . . . . . . . . . . . . .  P356 P372 P390 P409 P431 P453 P475 P497 P518 P541 P563 P585 P607 P628 P650 P672
                                            P688
      233   PRINT-DETAIL . . . . . . . . .  P368 P381 P399 P421 P443 P465 P487 P509 P530 P553 P575 P597 P619 P640 P662 P684
                                            P697
      343   SECT-IF137A
      226   TERMINATE-CCVS
      286   WRITE-LINE . . . . . . . . . .  P237 P238 P246 P247 P248 P249 P251 P252 P253 P255 P257 P265 P273 P279 P284 P285
                                            P313 P317 P321 P322 P324 P325 P335
      302   WRT-LN . . . . . . . . . . . .  P292 P293 P294 P295 P296 P297 P298 P301 P306
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    21
0 Defined   Cross-reference of programs     References

        3   IF137A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF137A    Date 06/04/2022  Time 11:58:49   Page    22
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF137A:
 *    Source records = 700
 *    Data Division statements = 100
 *    Procedure Division statements = 379
 *    Generated COBOL statements = 0
 *    Program complexity factor = 390
0End of compilation 1,  program IF137A,  highest severity 0.
0Return code 0
