1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:50   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:50   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1304.2
   000002         000200 PROGRAM-ID.                                                      IF1304.2
   000003         000300     IF130A.                                                      IF1304.2
   000004         000400                                                                  IF1304.2
   000005         000600*                                                         *       IF1304.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1304.2
   000007         000800* It contains tests for the Intrinsic Function            *       IF1304.2
   000008         000900* PRESENT-VALUE.                                          *       IF1304.2
   000009         001000*                                                         *       IF1304.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1304.2
   000011         001300 CONFIGURATION SECTION.                                           IF1304.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1304.2
   000013         001500     XXXXX082.                                                    IF1304.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1304.2
   000015         001700     XXXXX083.                                                    IF1304.2
   000016         001800 INPUT-OUTPUT SECTION.                                            IF1304.2
   000017         001900 FILE-CONTROL.                                                    IF1304.2
   000018         002000     SELECT PRINT-FILE ASSIGN TO                                  IF1304.2 22
   000019         002100     XXXXX055.                                                    IF1304.2
   000020         002200 DATA DIVISION.                                                   IF1304.2
   000021         002300 FILE SECTION.                                                    IF1304.2
   000022         002400 FD  PRINT-FILE.                                                  IF1304.2

 ==000022==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000023         002500 01  PRINT-REC PICTURE X(120).                                    IF1304.2
   000024         002600 01  DUMMY-RECORD PICTURE X(120).                                 IF1304.2
   000025         002700 WORKING-STORAGE SECTION.                                         IF1304.2
   000026         002900* Variables specific to the Intrinsic Function Test IF130A*       IF1304.2
   000027         003100 01  A                   PIC S9(10)          VALUE 5.             IF1304.2
   000028         003200 01  B                   PIC S9(10)          VALUE 7.             IF1304.2
   000029         003300 01  C                   PIC S9(10)          VALUE -4.            IF1304.2
   000030         003400 01  D                   PIC S9(10)          VALUE 10.            IF1304.2
   000031         003500 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1304.2
   000032         003600 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1304.2
   000033         003700 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1304.2
   000034         003800 01  H                   PIC S9(5)V9(5)      VALUE 5.3.           IF1304.2
   000035         003900 01  I                   PIC S9(5)V9(5)      VALUE 0.0009.        IF1304.2
   000036         004000 01  J                   PIC S9(5)V9(5)      VALUE 0.0008.        IF1304.2
   000037         004100 01  K                   PIC S9(10)          VALUE 23000.         IF1304.2
   000038         004200 01  L                   PIC S9(10)          VALUE -23000.        IF1304.2
   000039         004300 01  P                   PIC S9(10)          VALUE 1.             IF1304.2
   000040         004400 01  Q                   PIC S9(10)          VALUE 3.             IF1304.2
   000041         004500 01  R                   PIC S9(10)          VALUE 5.             IF1304.2
   000042         004600 01  ARG1                PIC S9(10)          VALUE 0.             IF1304.2
   000043         004700 01  ARR                                     VALUE "40537".       IF1304.2
   000044         004800     02  IND OCCURS 5 TIMES PIC 9.                                IF1304.2
   000045         004900 01  TEMP                PIC S9(10)V9(5).                         IF1304.2
   000046         005000 01  WS-NUM              PIC S9(5)V9(6).                          IF1304.2
   000047         005100 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1304.2
   000048         005200 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1304.2
   000049         005300*                                                                 IF1304.2
   000050         005500*                                                                 IF1304.2
   000051         005600 01  TEST-RESULTS.                                                IF1304.2
   000052         005700     02 FILLER                   PIC X      VALUE SPACE.          IF1304.2 IMP
   000053         005800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1304.2 IMP
   000054         005900     02 FILLER                   PIC X      VALUE SPACE.          IF1304.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1304.2 IMP
   000056         006100     02 FILLER                   PIC X      VALUE SPACE.          IF1304.2 IMP
   000057         006200     02  PAR-NAME.                                                IF1304.2
   000058         006300       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1304.2 IMP
   000059         006400       03  PARDOT-X              PIC X      VALUE SPACE.          IF1304.2 IMP
   000060         006500       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1304.2 IMP
   000061         006600     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1304.2 IMP
   000062         006700     02 RE-MARK                  PIC X(61).                       IF1304.2
   000063         006800 01  TEST-COMPUTED.                                               IF1304.2
   000064         006900     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1304.2 IMP
   000065         007000     02 FILLER                   PIC X(17)  VALUE                 IF1304.2
   000066         007100            "       COMPUTED=".                                   IF1304.2
   000067         007200     02 COMPUTED-X.                                               IF1304.2
   000068         007300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1304.2 IMP
   000069         007400     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1304.2 68
   000070         007500                                 PIC -9(9).9(9).                  IF1304.2
   000071         007600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1304.2 68
   000072         007700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1304.2 68
   000073         007800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1304.2 68
   000074         007900     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1304.2 68
   000075         008000         04 COMPUTED-18V0                    PIC -9(18).          IF1304.2
   000076         008100         04 FILLER                           PIC X.               IF1304.2
   000077         008200     03 FILLER PIC X(50) VALUE SPACE.                             IF1304.2 IMP
   000078         008300 01  TEST-CORRECT.                                                IF1304.2
   000079         008400     02 FILLER PIC X(30) VALUE SPACE.                             IF1304.2 IMP
   000080         008500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1304.2
   000081         008600     02 CORRECT-X.                                                IF1304.2
   000082         008700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1304.2 IMP
   000083         008800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1304.2 82
   000084         008900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1304.2 82
   000085         009000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1304.2 82
   000086         009100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1304.2 82
   000087         009200     03      CR-18V0 REDEFINES CORRECT-A.                         IF1304.2 82
   000088         009300         04 CORRECT-18V0                     PIC -9(18).          IF1304.2
   000089         009400         04 FILLER                           PIC X.               IF1304.2
   000090         009500     03 FILLER PIC X(2) VALUE SPACE.                              IF1304.2 IMP
   000091         009600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1304.2 IMP
   000092         009700 01  TEST-CORRECT-MIN.                                            IF1304.2
   000093         009800     02 FILLER PIC X(30) VALUE SPACE.                             IF1304.2 IMP
   000094         009900     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1304.2
   000095         010000     02 CORRECTMI-X.                                              IF1304.2
   000096         010100     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1304.2 IMP
   000097         010200     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1304.2 96
   000098         010300     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1304.2 96
   000099         010400     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1304.2 96
   000100         010500     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1304.2 96
   000101         010600     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1304.2 96
   000102         010700         04 CORRECTMI-18V0                     PIC -9(18).        IF1304.2
   000103         010800         04 FILLER                           PIC X.               IF1304.2
   000104         010900     03 FILLER PIC X(2) VALUE SPACE.                              IF1304.2 IMP
   000105         011000     03 FILLER                           PIC X(48) VALUE SPACE.   IF1304.2 IMP
   000106         011100 01  TEST-CORRECT-MAX.                                            IF1304.2
   000107         011200     02 FILLER PIC X(30) VALUE SPACE.                             IF1304.2 IMP
   000108         011300     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1304.2
   000109         011400     02 CORRECTMA-X.                                              IF1304.2
   000110         011500     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1304.2 IMP
   000111         011600     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1304.2 110
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1304.2 110
   000113         011800     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1304.2 110
   000114         011900     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1304.2 110
   000115         012000     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1304.2 110
   000116         012100         04 CORRECTMA-18V0                     PIC -9(18).        IF1304.2
   000117         012200         04 FILLER                           PIC X.               IF1304.2
   000118         012300     03 FILLER PIC X(2) VALUE SPACE.                              IF1304.2 IMP
   000119         012400     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1304.2 IMP
   000120         012500 01  CCVS-C-1.                                                    IF1304.2
   000121         012600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1304.2
   000122         012700-    "SS  PARAGRAPH-NAME                                          IF1304.2
   000123         012800-    "       REMARKS".                                            IF1304.2
   000124         012900     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1304.2 IMP
   000125         013000 01  CCVS-C-2.                                                    IF1304.2
   000126         013100     02 FILLER                     PIC X        VALUE SPACE.      IF1304.2 IMP
   000127         013200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1304.2
   000128         013300     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1304.2 IMP
   000129         013400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1304.2
   000130         013500     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1304.2 IMP
   000131         013600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1304.2 IMP
   000132         013700 01  REC-CT                        PIC 99       VALUE ZERO.       IF1304.2 IMP
   000133         013800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1304.2 IMP
   000134         013900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1304.2 IMP
   000135         014000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1304.2 IMP
   000136         014100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1304.2 IMP
   000137         014200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1304.2 IMP
   000138         014300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1304.2 IMP
   000139         014400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1304.2 IMP
   000140         014500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1304.2 IMP
   000141         014600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1304.2 IMP
   000142         014700 01  CCVS-H-1.                                                    IF1304.2
   000143         014800     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1304.2 IMP
   000144         014900     02  FILLER                    PIC X(42)    VALUE             IF1304.2
   000145         015000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1304.2
   000146         015100     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1304.2 IMP
   000147         015200 01  CCVS-H-2A.                                                   IF1304.2
   000148         015300   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1304.2 IMP
   000149         015400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1304.2
   000150         015500   02  FILLER                        PIC XXXX   VALUE             IF1304.2
   000151         015600     "4.2 ".                                                      IF1304.2
   000152         015700   02  FILLER                        PIC X(28)  VALUE             IF1304.2
   000153         015800            " COPY - NOT FOR DISTRIBUTION".                       IF1304.2
   000154         015900   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1304.2 IMP
   000155         016000                                                                  IF1304.2
   000156         016100 01  CCVS-H-2B.                                                   IF1304.2
   000157         016200   02  FILLER                        PIC X(15)  VALUE             IF1304.2
   000158         016300            "TEST RESULT OF ".                                    IF1304.2
   000159         016400   02  TEST-ID                       PIC X(9).                    IF1304.2
   000160         016500   02  FILLER                        PIC X(4)   VALUE             IF1304.2
   000161         016600            " IN ".                                               IF1304.2
   000162         016700   02  FILLER                        PIC X(12)  VALUE             IF1304.2
   000163         016800     " HIGH       ".                                              IF1304.2
   000164         016900   02  FILLER                        PIC X(22)  VALUE             IF1304.2
   000165         017000            " LEVEL VALIDATION FOR ".                             IF1304.2
   000166         017100   02  FILLER                        PIC X(58)  VALUE             IF1304.2
   000167         017200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1304.2
   000168         017300 01  CCVS-H-3.                                                    IF1304.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02  FILLER                      PIC X(34)  VALUE             IF1304.2
   000170         017500            " FOR OFFICIAL USE ONLY    ".                         IF1304.2
   000171         017600     02  FILLER                      PIC X(58)  VALUE             IF1304.2
   000172         017700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1304.2
   000173         017800     02  FILLER                      PIC X(28)  VALUE             IF1304.2
   000174         017900            "  COPYRIGHT   1985 ".                                IF1304.2
   000175         018000 01  CCVS-E-1.                                                    IF1304.2
   000176         018100     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1304.2 IMP
   000177         018200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1304.2
   000178         018300     02 ID-AGAIN                     PIC X(9).                    IF1304.2
   000179         018400     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1304.2 IMP
   000180         018500 01  CCVS-E-2.                                                    IF1304.2
   000181         018600     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1304.2 IMP
   000182         018700     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1304.2 IMP
   000183         018800     02 CCVS-E-2-2.                                               IF1304.2
   000184         018900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1304.2 IMP
   000185         019000         03 FILLER                   PIC X      VALUE SPACE.      IF1304.2 IMP
   000186         019100         03 ENDER-DESC               PIC X(44)  VALUE             IF1304.2
   000187         019200            "ERRORS ENCOUNTERED".                                 IF1304.2
   000188         019300 01  CCVS-E-3.                                                    IF1304.2
   000189         019400     02  FILLER                      PIC X(22)  VALUE             IF1304.2
   000190         019500            " FOR OFFICIAL USE ONLY".                             IF1304.2
   000191         019600     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1304.2 IMP
   000192         019700     02  FILLER                      PIC X(58)  VALUE             IF1304.2
   000193         019800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1304.2
   000194         019900     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1304.2 IMP
   000195         020000     02 FILLER                       PIC X(15)  VALUE             IF1304.2
   000196         020100             " COPYRIGHT 1985".                                   IF1304.2
   000197         020200 01  CCVS-E-4.                                                    IF1304.2
   000198         020300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1304.2 IMP
   000199         020400     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1304.2
   000200         020500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1304.2 IMP
   000201         020600     02 FILLER                       PIC X(40)  VALUE             IF1304.2
   000202         020700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1304.2
   000203         020800 01  XXINFO.                                                      IF1304.2
   000204         020900     02 FILLER                       PIC X(19)  VALUE             IF1304.2
   000205         021000            "*** INFORMATION ***".                                IF1304.2
   000206         021100     02 INFO-TEXT.                                                IF1304.2
   000207         021200       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1304.2 IMP
   000208         021300       04 XXCOMPUTED                 PIC X(20).                   IF1304.2
   000209         021400       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1304.2 IMP
   000210         021500       04 XXCORRECT                  PIC X(20).                   IF1304.2
   000211         021600     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1304.2
   000212         021700 01  HYPHEN-LINE.                                                 IF1304.2
   000213         021800     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1304.2 IMP
   000214         021900     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1304.2
   000215         022000-    "*****************************************".                 IF1304.2
   000216         022100     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1304.2
   000217         022200-    "******************************".                            IF1304.2
   000218         022300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1304.2
   000219         022400     "IF130A".                                                    IF1304.2
   000220         022500 PROCEDURE DIVISION.                                              IF1304.2
   000221         022600 CCVS1 SECTION.                                                   IF1304.2
   000222         022700 OPEN-FILES.                                                      IF1304.2
   000223         022800     OPEN     OUTPUT PRINT-FILE.                                  IF1304.2 22
   000224         022900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1304.2 218 159 218 178
   000225         023000     MOVE    SPACE TO TEST-RESULTS.                               IF1304.2 IMP 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1304.2 249 254
   000227         023200     GO TO CCVS1-EXIT.                                            IF1304.2 342
   000228         023300 CLOSE-FILES.                                                     IF1304.2
   000229         023400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1304.2 258 278 22
   000230         023500 TERMINATE-CCVS.                                                  IF1304.2
   000231         023600     STOP     RUN.                                                IF1304.2
   000232         023700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1304.2 55 135
   000233         023800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1304.2 55 136
   000234         023900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1304.2 55 134
   000235         024000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1304.2 55 133
   000236         024100     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1304.2 62
   000237         024200 PRINT-DETAIL.                                                    IF1304.2
   000238         024300     IF REC-CT NOT EQUAL TO ZERO                                  IF1304.2 132 IMP
   000239      1  024400             MOVE "." TO PARDOT-X                                 IF1304.2 59
   000240      1  024500             MOVE REC-CT TO DOTVALUE.                             IF1304.2 132 60
   000241         024600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1304.2 51 23 290
   000242         024700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1304.2 55 290
   000243      1  024800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1304.2 311 331
   000244      1  024900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1304.2 332 341
   000245         025000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1304.2 IMP 55 IMP 67
   000246         025100     MOVE SPACE TO CORRECT-X.                                     IF1304.2 IMP 81
   000247         025200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1304.2 132 IMP IMP 57
   000248         025300     MOVE     SPACE TO RE-MARK.                                   IF1304.2 IMP 62
   000249         025400 HEAD-ROUTINE.                                                    IF1304.2
   000250         025500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1304.2 142 24 290
   000251         025600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1304.2 147 24 290
   000252         025700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1304.2 156 24 290
   000253         025800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1304.2 168 24 290
   000254         025900 COLUMN-NAMES-ROUTINE.                                            IF1304.2
   000255         026000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1304.2 120 24 290
   000256         026100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1304.2 125 24 290
   000257         026200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1304.2 212 24 290
   000258         026300 END-ROUTINE.                                                     IF1304.2
   000259         026400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1304.2 212 24 290
   000260         026500 END-RTN-EXIT.                                                    IF1304.2
   000261         026600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1304.2 175 24 290
   000262         026700 END-ROUTINE-1.                                                   IF1304.2
   000263         026800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1304.2 134 138 135
   000264         026900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1304.2 138 133 138
   000265         027000      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1304.2 136 138
   000266         027100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1304.2 136 198
   000267         027200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1304.2 138 200
   000268         027300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1304.2 197 183
   000269         027400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1304.2 180 24 290
   000270         027500  END-ROUTINE-12.                                                 IF1304.2
   000271         027600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1304.2 186
   000272         027700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1304.2 134 IMP
   000273      1  027800         MOVE "NO " TO ERROR-TOTAL                                IF1304.2 184
   000274         027900         ELSE                                                     IF1304.2
   000275      1  028000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1304.2 134 184
   000276         028100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1304.2 180 24
   000277         028200     PERFORM WRITE-LINE.                                          IF1304.2 290
   000278         028300 END-ROUTINE-13.                                                  IF1304.2
   000279         028400     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1304.2 133 IMP
   000280      1  028500         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1304.2 184
   000281      1  028600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1304.2 133 184
   000282         028700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1304.2 186
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1304.2 180 24 290
   000284         028900      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1304.2 135 IMP
   000285      1  029000          MOVE "NO " TO ERROR-TOTAL                               IF1304.2 184
   000286      1  029100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1304.2 135 184
   000287         029200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1304.2 186
   000288         029300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1304.2 180 24 290
   000289         029400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1304.2 188 24 290
   000290         029500 WRITE-LINE.                                                      IF1304.2
   000291         029600     ADD 1 TO RECORD-COUNT.                                       IF1304.2 140
   000292         029700     IF RECORD-COUNT GREATER 42                                   IF1304.2 140
   000293      1  029800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1304.2 24 139
   000294      1  029900         MOVE SPACE TO DUMMY-RECORD                               IF1304.2 IMP 24
   000295      1  030000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1304.2 24
   000296      1  030100         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1304.2 142 24 306
   000297      1  030200         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1304.2 147 24 306
   000298      1  030300         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1304.2 156 24 306
   000299      1  030400         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1304.2 168 24 306
   000300      1  030500         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1304.2 120 24 306
   000301      1  030600         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1304.2 125 24 306
   000302      1  030700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1304.2 212 24 306
   000303      1  030800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1304.2 139 24
   000304      1  030900         MOVE ZERO TO RECORD-COUNT.                               IF1304.2 IMP 140
   000305         031000     PERFORM WRT-LN.                                              IF1304.2 306
   000306         031100 WRT-LN.                                                          IF1304.2
   000307         031200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1304.2 24
   000308         031300     MOVE SPACE TO DUMMY-RECORD.                                  IF1304.2 IMP 24
   000309         031400 BLANK-LINE-PRINT.                                                IF1304.2
   000310         031500     PERFORM WRT-LN.                                              IF1304.2 306
   000311         031600 FAIL-ROUTINE.                                                    IF1304.2
   000312         031700     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1304.2 67 IMP
   000313      1  031800            GO TO FAIL-ROUTINE-WRITE.                             IF1304.2 320
   000314         031900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1304.2 81 IMP 320
   000315         032000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1304.2 141 211
   000316         032100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1304.2 206
   000317         032200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1304.2 203 24 290
   000318         032300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1304.2 IMP 211
   000319         032400     GO TO  FAIL-ROUTINE-EX.                                      IF1304.2 331
   000320         032500 FAIL-ROUTINE-WRITE.                                              IF1304.2
   000321         032600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1304.2 63 23 290
   000322         032700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1304.2 141 91
   000323         032800                              CORMA-ANSI-REFERENCE.               IF1304.2 119
   000324         032900     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1304.2 97 IMP
   000325      1  033000           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1304.2 92 23 290
   000326      1  033100           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1304.2 106 23 290
   000327         033200     ELSE                                                         IF1304.2
   000328      1  033300           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1304.2 78 23 290
   000329         033400     PERFORM WRITE-LINE.                                          IF1304.2 290
   000330         033500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1304.2 IMP 91
   000331         033600 FAIL-ROUTINE-EX. EXIT.                                           IF1304.2
   000332         033700 BAIL-OUT.                                                        IF1304.2
   000333         033800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1304.2 68 IMP 335
   000334         033900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1304.2 82 IMP 341
   000335         034000 BAIL-OUT-WRITE.                                                  IF1304.2
   000336         034100     MOVE CORRECT-A TO XXCORRECT.                                 IF1304.2 82 210
   000337         034200     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1304.2 68 208
   000338         034300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1304.2 141 211
   000339         034400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1304.2 203 24 290
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1304.2 IMP 211
   000341         034600 BAIL-OUT-EX. EXIT.                                               IF1304.2
   000342         034700 CCVS1-EXIT.                                                      IF1304.2
   000343         034800     EXIT.                                                        IF1304.2
   000344         035000*                                                      *          IF1304.2
   000345         035100*    Intrinsic Function Tests   IF130A - PRESENT-VALUE *          IF1304.2
   000346         035200*                                                      *          IF1304.2
   000347         035400 SECT-IF130A SECTION.                                             IF1304.2
   000348         035500 F-PRES-VAL-INFO.                                                 IF1304.2
   000349         035600     MOVE     "See ref. A-63 2.34" TO ANSI-REFERENCE.             IF1304.2 141
   000350         035700     MOVE     "PRESENT-VALUE Function" TO FEATURE.                IF1304.2 53
   000351         035900 F-PRES-VAL-01.                                                   IF1304.2
   000352         036000     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000353         036100     MOVE 43.9991 TO MIN-RANGE.                                   IF1304.2 47
   000354         036200     MOVE 44.0009 TO MAX-RANGE.                                   IF1304.2 48
   000355         036300 F-PRES-VAL-TEST-01.                                              IF1304.2
   000356         036400     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(0, 23, 12, 9).       IF1304.2 46 IFN
   000357         036500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000358         036600        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000359      1  036700                    PERFORM PASS                                  IF1304.2 233
   000360         036800     ELSE                                                         IF1304.2
   000361      1  036900                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000362      1  037000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000363      1  037100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000364      1  037200                    PERFORM FAIL.                                 IF1304.2 234
   000365         037300     GO TO F-PRES-VAL-WRITE-01.                                   IF1304.2 369
   000366         037400 F-PRES-VAL-DELETE-01.                                            IF1304.2
   000367         037500     PERFORM  DE-LETE.                                            IF1304.2 235
   000368         037600     GO TO    F-PRES-VAL-WRITE-01.                                IF1304.2 369
   000369         037700 F-PRES-VAL-WRITE-01.                                             IF1304.2
   000370         037800     MOVE "F-PRES-VAL-01" TO PAR-NAME.                            IF1304.2 57
   000371         037900     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000372         038100 F-PRES-VAL-02.                                                   IF1304.2
   000373         038200     EVALUATE FUNCTION PRESENT-VALUE(1, 10, 20, 10, 5)            IF1304.2 IFN
   000374         038300     WHEN  11.5623 THRU  11.5627                                  IF1304.2
   000375      1  038400                    PERFORM PASS                                  IF1304.2 233
   000376         038500     WHEN OTHER                                                   IF1304.2
   000377      1  038600                    PERFORM FAIL.                                 IF1304.2 234
   000378         038700     GO TO F-PRES-VAL-WRITE-02.                                   IF1304.2 382
   000379         038800 F-PRES-VAL-DELETE-02.                                            IF1304.2
   000380         038900     PERFORM  DE-LETE.                                            IF1304.2 235
   000381         039000     GO TO    F-PRES-VAL-WRITE-02.                                IF1304.2 382
   000382         039100 F-PRES-VAL-WRITE-02.                                             IF1304.2
   000383         039200     MOVE "F-PRES-VAL-02" TO PAR-NAME.                            IF1304.2 57
   000384         039300     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000385         039500 F-PRES-VAL-03.                                                   IF1304.2
   000386         039600     MOVE  9.53314 TO MIN-RANGE.                                  IF1304.2 47
   000387         039700     MOVE  9.53352 TO MAX-RANGE.                                  IF1304.2 48
   000388         039800 F-PRES-VAL-TEST-03.                                              IF1304.2
   000389         039900     IF (FUNCTION PRESENT-VALUE(.5, 8.3, 2.4, 9.9)                IF1304.2 IFN
   000390         040000        >= MIN-RANGE) AND                                         IF1304.2 47
   000391         040100        (FUNCTION PRESENT-VALUE(.5, 8.3, 2.4, 9.9)                IF1304.2 IFN
   000392         040200        <= MAX-RANGE) THEN                                        IF1304.2 48
   000393      1  040300                    PERFORM PASS                                  IF1304.2 233
   000394         040400     ELSE                                                         IF1304.2
   000395      1  040500                    PERFORM FAIL.                                 IF1304.2 234
   000396         040600     GO TO F-PRES-VAL-WRITE-03.                                   IF1304.2 400
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040700 F-PRES-VAL-DELETE-03.                                            IF1304.2
   000398         040800     PERFORM  DE-LETE.                                            IF1304.2 235
   000399         040900     GO TO    F-PRES-VAL-WRITE-03.                                IF1304.2 400
   000400         041000 F-PRES-VAL-WRITE-03.                                             IF1304.2
   000401         041100     MOVE "F-PRES-VAL-03" TO PAR-NAME.                            IF1304.2 57
   000402         041200     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000403         041400 F-PRES-VAL-04.                                                   IF1304.2
   000404         041500     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000405         041600     MOVE  22.6274 TO MIN-RANGE.                                  IF1304.2 47
   000406         041700     MOVE  22.6283 TO MAX-RANGE.                                  IF1304.2 48
   000407         041800 F-PRES-VAL-TEST-04.                                              IF1304.2
   000408         041900     COMPUTE WS-NUM =                                             IF1304.2 46
   000409         042000         FUNCTION PRESENT-VALUE(.1, 5, 4, 2.8, 3.1, 17).          IF1304.2 IFN
   000410         042100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000411         042200        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000412      1  042300                    PERFORM PASS                                  IF1304.2 233
   000413         042400     ELSE                                                         IF1304.2
   000414      1  042500                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000415      1  042600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000416      1  042700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000417      1  042800                    PERFORM FAIL.                                 IF1304.2 234
   000418         042900     GO TO F-PRES-VAL-WRITE-04.                                   IF1304.2 422
   000419         043000 F-PRES-VAL-DELETE-04.                                            IF1304.2
   000420         043100     PERFORM  DE-LETE.                                            IF1304.2 235
   000421         043200     GO TO    F-PRES-VAL-WRITE-04.                                IF1304.2 422
   000422         043300 F-PRES-VAL-WRITE-04.                                             IF1304.2
   000423         043400     MOVE "F-PRES-VAL-04" TO PAR-NAME.                            IF1304.2 57
   000424         043500     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000425         043700 F-PRES-VAL-05.                                                   IF1304.2
   000426         043800     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000427         043900     MOVE  20.1691 TO MIN-RANGE.                                  IF1304.2 47
   000428         044000     MOVE  20.1699 TO MAX-RANGE.                                  IF1304.2 48
   000429         044100 F-PRES-VAL-TEST-05.                                              IF1304.2
   000430         044200     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(.04, A, B, D).       IF1304.2 46 IFN 27 28 30
   000431         044300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000432         044400        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000433      1  044500                    PERFORM PASS                                  IF1304.2 233
   000434         044600     ELSE                                                         IF1304.2
   000435      1  044700                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000436      1  044800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000437      1  044900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000438      1  045000                    PERFORM FAIL.                                 IF1304.2 234
   000439         045100     GO TO F-PRES-VAL-WRITE-05.                                   IF1304.2 443
   000440         045200 F-PRES-VAL-DELETE-05.                                            IF1304.2
   000441         045300     PERFORM  DE-LETE.                                            IF1304.2 235
   000442         045400     GO TO    F-PRES-VAL-WRITE-05.                                IF1304.2 443
   000443         045500 F-PRES-VAL-WRITE-05.                                             IF1304.2
   000444         045600     MOVE "F-PRES-VAL-05" TO PAR-NAME.                            IF1304.2 57
   000445         045700     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000446         045900 F-PRES-VAL-06.                                                   IF1304.2
   000447         046000     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000448         046100     MOVE  33.3113 TO MIN-RANGE.                                  IF1304.2 47
   000449         046200     MOVE  33.3127 TO MAX-RANGE.                                  IF1304.2 48
   000450         046300 F-PRES-VAL-TEST-06.                                              IF1304.2
   000451         046400     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(.08, E, G, H, F).    IF1304.2 46 IFN 31 33 34 32
   000452         046500                                                                  IF1304.2
   000453         046600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046700        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000455      1  046800                    PERFORM PASS                                  IF1304.2 233
   000456         046900     ELSE                                                         IF1304.2
   000457      1  047000                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000458      1  047100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000459      1  047200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000460      1  047300                    PERFORM FAIL.                                 IF1304.2 234
   000461         047400     GO TO F-PRES-VAL-WRITE-06.                                   IF1304.2 465
   000462         047500 F-PRES-VAL-DELETE-06.                                            IF1304.2
   000463         047600     PERFORM  DE-LETE.                                            IF1304.2 235
   000464         047700     GO TO    F-PRES-VAL-WRITE-06.                                IF1304.2 465
   000465         047800 F-PRES-VAL-WRITE-06.                                             IF1304.2
   000466         047900     MOVE "F-PRES-VAL-06" TO PAR-NAME.                            IF1304.2 57
   000467         048000     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000468         048200 F-PRES-VAL-07.                                                   IF1304.2
   000469         048300     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000470         048400     MOVE  5.76505 TO MIN-RANGE.                                  IF1304.2 47
   000471         048500     MOVE  5.76528 TO MAX-RANGE.                                  IF1304.2 48
   000472         048600 F-PRES-VAL-TEST-07.                                              IF1304.2
   000473         048700     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(.2, C, A, 5, 4, 2).  IF1304.2 46 IFN 29 27
   000474         048800                                                                  IF1304.2
   000475         048900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000476         049000        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000477      1  049100                    PERFORM PASS                                  IF1304.2 233
   000478         049200     ELSE                                                         IF1304.2
   000479      1  049300                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000480      1  049400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000481      1  049500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000482      1  049600                    PERFORM FAIL.                                 IF1304.2 234
   000483         049700     GO TO F-PRES-VAL-WRITE-07.                                   IF1304.2 487
   000484         049800 F-PRES-VAL-DELETE-07.                                            IF1304.2
   000485         049900     PERFORM  DE-LETE.                                            IF1304.2 235
   000486         050000     GO TO    F-PRES-VAL-WRITE-07.                                IF1304.2 487
   000487         050100 F-PRES-VAL-WRITE-07.                                             IF1304.2
   000488         050200     MOVE "F-PRES-VAL-07" TO PAR-NAME.                            IF1304.2 57
   000489         050300     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000490         050500 F-PRES-VAL-08.                                                   IF1304.2
   000491         050600     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000492         050700     MOVE  0.361674 TO MIN-RANGE.                                 IF1304.2 47
   000493         050800     MOVE  0.361689 TO MAX-RANGE.                                 IF1304.2 48
   000494         050900 F-PRES-VAL-TEST-08.                                              IF1304.2
   000495         051000     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(.3, A, H, .07, -19). IF1304.2 46 IFN 27 34
   000496         051100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000497         051200        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000498      1  051300                    PERFORM PASS                                  IF1304.2 233
   000499         051400     ELSE                                                         IF1304.2
   000500      1  051500                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000501      1  051600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000502      1  051700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000503      1  051800                    PERFORM FAIL.                                 IF1304.2 234
   000504         051900     GO TO F-PRES-VAL-WRITE-08.                                   IF1304.2 508
   000505         052000 F-PRES-VAL-DELETE-08.                                            IF1304.2
   000506         052100     PERFORM  DE-LETE.                                            IF1304.2 235
   000507         052200     GO TO    F-PRES-VAL-WRITE-08.                                IF1304.2 508
   000508         052300 F-PRES-VAL-WRITE-08.                                             IF1304.2
   000509         052400     MOVE "F-PRES-VAL-08" TO PAR-NAME.                            IF1304.2 57
   000510         052500     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052700 F-PRES-VAL-09.                                                   IF1304.2
   000512         052800     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000513         052900     MOVE -0.001500 TO MIN-RANGE.                                 IF1304.2 47
   000514         053000     MOVE -0.001498 TO MAX-RANGE.                                 IF1304.2 48
   000515         053100 F-PRES-VAL-TEST-09.                                              IF1304.2
   000516         053200     COMPUTE WS-NUM =                                             IF1304.2 46
   000517         053300                FUNCTION PRESENT-VALUE(.09, -.0009, -.0008).      IF1304.2 IFN
   000518         053400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000519         053500        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000520      1  053600                    PERFORM PASS                                  IF1304.2 233
   000521         053700     ELSE                                                         IF1304.2
   000522      1  053800                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000523      1  053900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000524      1  054000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000525      1  054100                    PERFORM FAIL.                                 IF1304.2 234
   000526         054200     GO TO F-PRES-VAL-WRITE-09.                                   IF1304.2 530
   000527         054300 F-PRES-VAL-DELETE-09.                                            IF1304.2
   000528         054400     PERFORM  DE-LETE.                                            IF1304.2 235
   000529         054500     GO TO    F-PRES-VAL-WRITE-09.                                IF1304.2 530
   000530         054600 F-PRES-VAL-WRITE-09.                                             IF1304.2
   000531         054700     MOVE "F-PRES-VAL-09" TO PAR-NAME.                            IF1304.2 57
   000532         054800     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000533         055000 F-PRES-VAL-11.                                                   IF1304.2
   000534         055100     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000535         055200     MOVE  57454.07 TO MIN-RANGE.                                 IF1304.2 47
   000536         055300     MOVE  57456.37 TO MAX-RANGE.                                 IF1304.2 48
   000537         055400 F-PRES-VAL-TEST-11.                                              IF1304.2
   000538         055500     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(.4, 30000, 40000,    IF1304.2 46 IFN
   000539         055600                                             100000, -80000).     IF1304.2
   000540         055700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000541         055800        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000542      1  055900                    PERFORM PASS                                  IF1304.2 233
   000543         056000     ELSE                                                         IF1304.2
   000544      1  056100                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000545      1  056200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000546      1  056300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000547      1  056400                    PERFORM FAIL.                                 IF1304.2 234
   000548         056500     GO TO F-PRES-VAL-WRITE-11.                                   IF1304.2 552
   000549         056600 F-PRES-VAL-DELETE-11.                                            IF1304.2
   000550         056700     PERFORM  DE-LETE.                                            IF1304.2 235
   000551         056800     GO TO    F-PRES-VAL-WRITE-11.                                IF1304.2 552
   000552         056900 F-PRES-VAL-WRITE-11.                                             IF1304.2
   000553         057000     MOVE "F-PRES-VAL-11" TO PAR-NAME.                            IF1304.2 57
   000554         057100     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000555         057300 F-PRES-VAL-12.                                                   IF1304.2
   000556         057400     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000557         057500     MOVE -1406.26 TO MIN-RANGE.                                  IF1304.2 47
   000558         057600     MOVE -1406.21 TO MAX-RANGE.                                  IF1304.2 48
   000559         057700 F-PRES-VAL-TEST-12.                                              IF1304.2
   000560         057800     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(.07, L, K).          IF1304.2 46 IFN 38 37
   000561         057900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000562         058000        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000563      1  058100                    PERFORM PASS                                  IF1304.2 233
   000564         058200     ELSE                                                         IF1304.2
   000565      1  058300                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000566      1  058400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000567      1  058500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  058600                    PERFORM FAIL.                                 IF1304.2 234
   000569         058700     GO TO F-PRES-VAL-WRITE-12.                                   IF1304.2 573
   000570         058800 F-PRES-VAL-DELETE-12.                                            IF1304.2
   000571         058900     PERFORM  DE-LETE.                                            IF1304.2 235
   000572         059000     GO TO    F-PRES-VAL-WRITE-12.                                IF1304.2 573
   000573         059100 F-PRES-VAL-WRITE-12.                                             IF1304.2
   000574         059200     MOVE "F-PRES-VAL-12" TO PAR-NAME.                            IF1304.2 57
   000575         059300     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000576         059500 F-PRES-VAL-13.                                                   IF1304.2
   000577         059600     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000578         059700     MOVE  6.76570 TO MIN-RANGE.                                  IF1304.2 47
   000579         059800     MOVE  6.76597 TO MAX-RANGE.                                  IF1304.2 48
   000580         059900 F-PRES-VAL-TEST-13.                                              IF1304.2
   000581         060000     COMPUTE WS-NUM =                                             IF1304.2 46
   000582         060100          FUNCTION PRESENT-VALUE(.15, IND(1), IND(2),             IF1304.2 IFN 44 44
   000583         060200                                 IND(3)).                         IF1304.2 44
   000584         060300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000585         060400        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000586      1  060500                    PERFORM PASS                                  IF1304.2 233
   000587         060600     ELSE                                                         IF1304.2
   000588      1  060700                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000589      1  060800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000590      1  060900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000591      1  061000                    PERFORM FAIL.                                 IF1304.2 234
   000592         061100     GO TO F-PRES-VAL-WRITE-13.                                   IF1304.2 596
   000593         061200 F-PRES-VAL-DELETE-13.                                            IF1304.2
   000594         061300     PERFORM  DE-LETE.                                            IF1304.2 235
   000595         061400     GO TO    F-PRES-VAL-WRITE-13.                                IF1304.2 596
   000596         061500 F-PRES-VAL-WRITE-13.                                             IF1304.2
   000597         061600     MOVE "F-PRES-VAL-13" TO PAR-NAME.                            IF1304.2 57
   000598         061700     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000599         061900 F-PRES-VAL-14.                                                   IF1304.2
   000600         062000     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000601         062100     MOVE  12.3066 TO MIN-RANGE.                                  IF1304.2 47
   000602         062200     MOVE  12.3071 TO MAX-RANGE.                                  IF1304.2 48
   000603         062300 F-PRES-VAL-TEST-14.                                              IF1304.2
   000604         062400     COMPUTE WS-NUM =                                             IF1304.2 46
   000605         062500          FUNCTION PRESENT-VALUE(.13, IND(P), IND(Q), IND(R)).    IF1304.2 IFN 44 39 44 40 44 41
   000606         062600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000607         062700        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000608      1  062800                    PERFORM PASS                                  IF1304.2 233
   000609         062900     ELSE                                                         IF1304.2
   000610      1  063000                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000611      1  063100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000612      1  063200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000613      1  063300                    PERFORM FAIL.                                 IF1304.2 234
   000614         063400     GO TO F-PRES-VAL-WRITE-14.                                   IF1304.2 618
   000615         063500 F-PRES-VAL-DELETE-14.                                            IF1304.2
   000616         063600     PERFORM  DE-LETE.                                            IF1304.2 235
   000617         063700     GO TO    F-PRES-VAL-WRITE-14.                                IF1304.2 618
   000618         063800 F-PRES-VAL-WRITE-14.                                             IF1304.2
   000619         063900     MOVE "F-PRES-VAL-14" TO PAR-NAME.                            IF1304.2 57
   000620         064000     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000621         064200 F-PRES-VAL-15.                                                   IF1304.2
   000622         064300     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000623         064400     MOVE  37.9070 TO MIN-RANGE.                                  IF1304.2 47
   000624         064500     MOVE  37.9085 TO MAX-RANGE.                                  IF1304.2 48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064600 F-PRES-VAL-TEST-15.                                              IF1304.2
   000626         064700     COMPUTE WS-NUM =                                             IF1304.2 46
   000627         064800         FUNCTION PRESENT-VALUE(.1, 10, 10, 10, 10, 10).          IF1304.2 IFN
   000628         064900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000629         065000        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000630      1  065100                    PERFORM PASS                                  IF1304.2 233
   000631         065200     ELSE                                                         IF1304.2
   000632      1  065300                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000633      1  065400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000634      1  065500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000635      1  065600                    PERFORM FAIL.                                 IF1304.2 234
   000636         065700     GO TO F-PRES-VAL-WRITE-15.                                   IF1304.2 640
   000637         065800 F-PRES-VAL-DELETE-15.                                            IF1304.2
   000638         065900     PERFORM  DE-LETE.                                            IF1304.2 235
   000639         066000     GO TO    F-PRES-VAL-WRITE-15.                                IF1304.2 640
   000640         066100 F-PRES-VAL-WRITE-15.                                             IF1304.2
   000641         066200     MOVE "F-PRES-VAL-15" TO PAR-NAME.                            IF1304.2 57
   000642         066300     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000643         066500 F-PRES-VAL-16.                                                   IF1304.2
   000644         066600     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000645         066700     MOVE  65.9974 TO MIN-RANGE.                                  IF1304.2 47
   000646         066800     MOVE  66.0026 TO MAX-RANGE.                                  IF1304.2 48
   000647         066900 F-PRES-VAL-TEST-16.                                              IF1304.2
   000648         067000     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE                      IF1304.2 46 IFN
   000649         067100                               (-.5, (2 + 3), (6 / 3), (9 - 3)).  IF1304.2
   000650         067200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000651         067300        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000652      1  067400                    PERFORM PASS                                  IF1304.2 233
   000653         067500     ELSE                                                         IF1304.2
   000654      1  067600                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000655      1  067700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000656      1  067800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000657      1  067900                    PERFORM FAIL.                                 IF1304.2 234
   000658         068000     GO TO F-PRES-VAL-WRITE-16.                                   IF1304.2 662
   000659         068100 F-PRES-VAL-DELETE-16.                                            IF1304.2
   000660         068200     PERFORM  DE-LETE.                                            IF1304.2 235
   000661         068300     GO TO    F-PRES-VAL-WRITE-16.                                IF1304.2 662
   000662         068400 F-PRES-VAL-WRITE-16.                                             IF1304.2
   000663         068500     MOVE "F-PRES-VAL-16" TO PAR-NAME.                            IF1304.2 57
   000664         068600     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000665         068800 F-PRES-VAL-17.                                                   IF1304.2
   000666         068900     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000667         069000     MOVE  44.4513 TO MIN-RANGE.                                  IF1304.2 47
   000668         069100     MOVE  44.4549 TO MAX-RANGE.                                  IF1304.2 48
   000669         069200 F-PRES-VAL-TEST-17.                                              IF1304.2
   000670         069300     COMPUTE WS-NUM =                                             IF1304.2 46
   000671         069400            FUNCTION PRESENT-VALUE(-.2, 5 / 4, 3.3 * 4, 9.4 + 2). IF1304.2 IFN
   000672         069500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000673         069600        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000674      1  069700                    PERFORM PASS                                  IF1304.2 233
   000675         069800     ELSE                                                         IF1304.2
   000676      1  069900                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000677      1  070000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000678      1  070100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000679      1  070200                    PERFORM FAIL.                                 IF1304.2 234
   000680         070300     GO TO F-PRES-VAL-WRITE-17.                                   IF1304.2 684
   000681         070400 F-PRES-VAL-DELETE-17.                                            IF1304.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         070500     PERFORM  DE-LETE.                                            IF1304.2 235
   000683         070600     GO TO    F-PRES-VAL-WRITE-17.                                IF1304.2 684
   000684         070700 F-PRES-VAL-WRITE-17.                                             IF1304.2
   000685         070800     MOVE "F-PRES-VAL-17" TO PAR-NAME.                            IF1304.2 57
   000686         070900     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000687         071100 F-PRES-VAL-18.                                                   IF1304.2
   000688         071200     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000689         071300     MOVE  7.91943 TO MIN-RANGE.                                  IF1304.2 47
   000690         071400     MOVE  7.92007 TO MAX-RANGE.                                  IF1304.2 48
   000691         071500 F-PRES-VAL-TEST-18.                                              IF1304.2
   000692         071600     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE                      IF1304.2 46 IFN
   000693         071700                         (.5, A + 2, 4.5 / C, 8, B).              IF1304.2 27 29 28
   000694         071800     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000695         071900        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000696      1  072000                    PERFORM PASS                                  IF1304.2 233
   000697         072100     ELSE                                                         IF1304.2
   000698      1  072200                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000699      1  072300                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000700      1  072400                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000701      1  072500                    PERFORM FAIL.                                 IF1304.2 234
   000702         072600     GO TO F-PRES-VAL-WRITE-18.                                   IF1304.2 706
   000703         072700 F-PRES-VAL-DELETE-18.                                            IF1304.2
   000704         072800     PERFORM  DE-LETE.                                            IF1304.2 235
   000705         072900     GO TO    F-PRES-VAL-WRITE-18.                                IF1304.2 706
   000706         073000 F-PRES-VAL-WRITE-18.                                             IF1304.2
   000707         073100     MOVE "F-PRES-VAL-18" TO PAR-NAME.                            IF1304.2 57
   000708         073200     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000709         073400 F-PRES-VAL-19.                                                   IF1304.2
   000710         073500     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000711         073600     MOVE  22.4229 TO MIN-RANGE.                                  IF1304.2 47
   000712         073700     MOVE  22.4247 TO MAX-RANGE.                                  IF1304.2 48
   000713         073800 F-PRES-VAL-TEST-19.                                              IF1304.2
   000714         073900     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(.08, 2, 3) + 18.     IF1304.2 46 IFN
   000715         074000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000716         074100        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000717      1  074200                    PERFORM PASS                                  IF1304.2 233
   000718         074300     ELSE                                                         IF1304.2
   000719      1  074400                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000720      1  074500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000721      1  074600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000722      1  074700                    PERFORM FAIL.                                 IF1304.2 234
   000723         074800     GO TO F-PRES-VAL-WRITE-19.                                   IF1304.2 727
   000724         074900 F-PRES-VAL-DELETE-19.                                            IF1304.2
   000725         075000     PERFORM  DE-LETE.                                            IF1304.2 235
   000726         075100     GO TO    F-PRES-VAL-WRITE-19.                                IF1304.2 727
   000727         075200 F-PRES-VAL-WRITE-19.                                             IF1304.2
   000728         075300     MOVE "F-PRES-VAL-19" TO PAR-NAME.                            IF1304.2 57
   000729         075400     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000730         075600 F-PRES-VAL-20.                                                   IF1304.2
   000731         075700     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000732         075800     MOVE -2.09570 TO MIN-RANGE.                                  IF1304.2 47
   000733         075900     MOVE -2.09554 TO MAX-RANGE.                                  IF1304.2 48
   000734         076000 F-PRES-VAL-TEST-20.                                              IF1304.2
   000735         076100     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(.03, -6, -4) +       IF1304.2 46 IFN
   000736         076200                      FUNCTION PRESENT-VALUE(.2, 9).              IF1304.2 IFN
   000737         076300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000738         076400        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739      1  076500                    PERFORM PASS                                  IF1304.2 233
   000740         076600     ELSE                                                         IF1304.2
   000741      1  076700                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000742      1  076800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000743      1  076900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000744      1  077000                    PERFORM FAIL.                                 IF1304.2 234
   000745         077100     GO TO F-PRES-VAL-WRITE-20.                                   IF1304.2 749
   000746         077200 F-PRES-VAL-DELETE-20.                                            IF1304.2
   000747         077300     PERFORM  DE-LETE.                                            IF1304.2 235
   000748         077400     GO TO    F-PRES-VAL-WRITE-20.                                IF1304.2 749
   000749         077500 F-PRES-VAL-WRITE-20.                                             IF1304.2
   000750         077600     MOVE "F-PRES-VAL-20" TO PAR-NAME.                            IF1304.2 57
   000751         077700     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000752         077900 F-PRES-VAL-21.                                                   IF1304.2
   000753         078000     MOVE ZERO TO WS-NUM.                                         IF1304.2 IMP 46
   000754         078100     MOVE  1.49994 TO MIN-RANGE.                                  IF1304.2 47
   000755         078200     MOVE  1.50006 TO MAX-RANGE.                                  IF1304.2 48
   000756         078300 F-PRES-VAL-TEST-21.                                              IF1304.2
   000757         078400     COMPUTE WS-NUM = FUNCTION PRESENT-VALUE(                     IF1304.2 46 IFN
   000758         078500                         FUNCTION PRESENT-VALUE(1, 2), 3).        IF1304.2 IFN
   000759         078600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1304.2 46 47
   000760         078700        (WS-NUM <= MAX-RANGE) THEN                                IF1304.2 46 48
   000761      1  078800                    PERFORM PASS                                  IF1304.2 233
   000762         078900     ELSE                                                         IF1304.2
   000763      1  079000                    MOVE WS-NUM TO COMPUTED-N                     IF1304.2 46 69
   000764      1  079100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1304.2 47 97
   000765      1  079200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1304.2 48 111
   000766      1  079300                    PERFORM FAIL.                                 IF1304.2 234
   000767         079400     GO TO F-PRES-VAL-WRITE-21.                                   IF1304.2 771
   000768         079500 F-PRES-VAL-DELETE-21.                                            IF1304.2
   000769         079600     PERFORM  DE-LETE.                                            IF1304.2 235
   000770         079700     GO TO    F-PRES-VAL-WRITE-21.                                IF1304.2 771
   000771         079800 F-PRES-VAL-WRITE-21.                                             IF1304.2
   000772         079900     MOVE "F-PRES-VAL-21" TO PAR-NAME.                            IF1304.2 57
   000773         080000     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000774         080200 F-PRES-VAL-22.                                                   IF1304.2
   000775         080300     PERFORM F-PRES-VAL-TEST-22                                   IF1304.2 779
   000776         080400       UNTIL FUNCTION PRESENT-VALUE(ARG1, 2) < 0.5.               IF1304.2 IFN 42
   000777         080500     PERFORM PASS.                                                IF1304.2 233
   000778         080600     GO TO F-PRES-VAL-WRITE-22.                                   IF1304.2 784
   000779         080700 F-PRES-VAL-TEST-22.                                              IF1304.2
   000780         080800     COMPUTE ARG1 = ARG1 + 1.                                     IF1304.2 42 42
   000781         080900 F-PRES-VAL-DELETE-22.                                            IF1304.2
   000782         081000     PERFORM  DE-LETE.                                            IF1304.2 235
   000783         081100     GO TO    F-PRES-VAL-WRITE-22.                                IF1304.2 784
   000784         081200 F-PRES-VAL-WRITE-22.                                             IF1304.2
   000785         081300     MOVE "F-PRES-VAL-22" TO PAR-NAME.                            IF1304.2 57
   000786         081400     PERFORM  PRINT-DETAIL.                                       IF1304.2 237
   000787         081600 CCVS-EXIT SECTION.                                               IF1304.2
   000788         081700 CCVS-999999.                                                     IF1304.2
   000789         081800     GO TO CLOSE-FILES.                                           IF1304.2 228
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   A. . . . . . . . . . . . . . .  430 473 495 693
      141   ANSI-REFERENCE . . . . . . . .  315 322 338 M349
       42   ARG1 . . . . . . . . . . . . .  776 M780 780
       43   ARR
       28   B. . . . . . . . . . . . . . .  430 693
       29   C. . . . . . . . . . . . . . .  473 693
      120   CCVS-C-1 . . . . . . . . . . .  255 300
      125   CCVS-C-2 . . . . . . . . . . .  256 301
      175   CCVS-E-1 . . . . . . . . . . .  261
      180   CCVS-E-2 . . . . . . . . . . .  269 276 283 288
      183   CCVS-E-2-2 . . . . . . . . . .  M268
      188   CCVS-E-3 . . . . . . . . . . .  289
      197   CCVS-E-4 . . . . . . . . . . .  268
      198   CCVS-E-4-1 . . . . . . . . . .  M266
      200   CCVS-E-4-2 . . . . . . . . . .  M267
      142   CCVS-H-1 . . . . . . . . . . .  250 296
      147   CCVS-H-2A. . . . . . . . . . .  251 297
      156   CCVS-H-2B. . . . . . . . . . .  252 298
      168   CCVS-H-3 . . . . . . . . . . .  253 299
      218   CCVS-PGM-ID. . . . . . . . . .  224 224
       74   CM-18V0
       68   COMPUTED-A . . . . . . . . . .  69 71 72 73 74 333 337
       69   COMPUTED-N . . . . . . . . . .  M361 M414 M435 M457 M479 M500 M522 M544 M565 M588 M610 M632 M654 M676 M698 M719
                                            M741 M763
       67   COMPUTED-X . . . . . . . . . .  M245 312
       71   COMPUTED-0V18
       73   COMPUTED-14V4
       75   COMPUTED-18V0
       72   COMPUTED-4V14
       91   COR-ANSI-REFERENCE . . . . . .  M322 M330
      119   CORMA-ANSI-REFERENCE . . . . .  M323
       82   CORRECT-A. . . . . . . . . . .  83 84 85 86 87 334 336
      111   CORRECT-MAX. . . . . . . . . .  M363 M416 M437 M459 M481 M502 M524 M546 M567 M590 M612 M634 M656 M678 M700 M721
                                            M743 M765
       97   CORRECT-MIN. . . . . . . . . .  324 M362 M415 M436 M458 M480 M501 M523 M545 M566 M589 M611 M633 M655 M677 M699
                                            M720 M742 M764
       83   CORRECT-N
       81   CORRECT-X. . . . . . . . . . .  M246 314
       84   CORRECT-0V18
       86   CORRECT-14V4
       88   CORRECT-18V0
       85   CORRECT-4V14
      110   CORRECTMA-A. . . . . . . . . .  111 112 113 114 115
      109   CORRECTMA-X
      112   CORRECTMA-0V18
      114   CORRECTMA-14V4
      116   CORRECTMA-18V0
      113   CORRECTMA-4V14
       96   CORRECTMI-A. . . . . . . . . .  97 98 99 100 101
       95   CORRECTMI-X
       98   CORRECTMI-0V18
      100   CORRECTMI-14V4
      102   CORRECTMI-18V0
       99   CORRECTMI-4V14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    18
0 Defined   Cross-reference of data names   References

0      87   CR-18V0
      101   CR-18V0
      115   CR-18V0
       30   D. . . . . . . . . . . . . . .  430
      133   DELETE-COUNTER . . . . . . . .  M235 264 279 281
       60   DOTVALUE . . . . . . . . . . .  M240
      139   DUMMY-HOLD . . . . . . . . . .  M293 303
       24   DUMMY-RECORD . . . . . . . . .  M250 M251 M252 M253 M255 M256 M257 M259 M261 M269 M276 M283 M288 M289 293 M294
                                            295 M296 M297 M298 M299 M300 M301 M302 M303 307 M308 M317 M339
       31   E. . . . . . . . . . . . . . .  451
      186   ENDER-DESC . . . . . . . . . .  M271 M282 M287
      134   ERROR-COUNTER. . . . . . . . .  M234 263 272 275
      138   ERROR-HOLD . . . . . . . . . .  M263 M264 M264 M265 267
      184   ERROR-TOTAL. . . . . . . . . .  M273 M275 M280 M281 M285 M286
       32   F. . . . . . . . . . . . . . .  451
       53   FEATURE. . . . . . . . . . . .  M350
       33   G. . . . . . . . . . . . . . .  451
       34   H. . . . . . . . . . . . . . .  451 495
      212   HYPHEN-LINE. . . . . . . . . .  257 259 302
       35   I
      178   ID-AGAIN . . . . . . . . . . .  M224
       44   IND. . . . . . . . . . . . . .  582 582 583 605 605 605
      211   INF-ANSI-REFERENCE . . . . . .  M315 M318 M338 M340
      206   INFO-TEXT. . . . . . . . . . .  M316
      135   INSPECT-COUNTER. . . . . . . .  M232 263 284 286
       36   J
       37   K. . . . . . . . . . . . . . .  560
       38   L. . . . . . . . . . . . . . .  560
       48   MAX-RANGE. . . . . . . . . . .  M354 358 363 M387 392 M406 411 416 M428 432 437 M449 454 459 M471 476 481 M493
                                            497 502 M514 519 524 M536 541 546 M558 562 567 M579 585 590 M602 607 612 M624
                                            629 634 M646 651 656 M668 673 678 M690 695 700 M712 716 721 M733 738 743 M755
                                            760 765
       47   MIN-RANGE. . . . . . . . . . .  M353 357 362 M386 390 M405 410 415 M427 431 436 M448 453 458 M470 475 480 M492
                                            496 501 M513 518 523 M535 540 545 M557 561 566 M578 584 589 M601 606 611 M623
                                            628 633 M645 650 655 M667 672 677 M689 694 699 M711 715 720 M732 737 742 M754
                                            759 764
       39   P. . . . . . . . . . . . . . .  605
       55   P-OR-F . . . . . . . . . . . .  M232 M233 M234 M235 242 M245
       57   PAR-NAME . . . . . . . . . . .  M247 M370 M383 M401 M423 M444 M466 M488 M509 M531 M553 M574 M597 M619 M641 M663
                                            M685 M707 M728 M750 M772 M785
       59   PARDOT-X . . . . . . . . . . .  M239
      136   PASS-COUNTER . . . . . . . . .  M233 265 266
       22   PRINT-FILE . . . . . . . . . .  18 223 229
       23   PRINT-REC. . . . . . . . . . .  M241 M321 M325 M326 M328
       40   Q. . . . . . . . . . . . . . .  605
       41   R. . . . . . . . . . . . . . .  605
       62   RE-MARK. . . . . . . . . . . .  M236 M248
      132   REC-CT . . . . . . . . . . . .  238 240 247
      131   REC-SKL-SUB
      140   RECORD-COUNT . . . . . . . . .  M291 292 M304
       45   TEMP
       63   TEST-COMPUTED. . . . . . . . .  321
       78   TEST-CORRECT . . . . . . . . .  328
      106   TEST-CORRECT-MAX . . . . . . .  326
       92   TEST-CORRECT-MIN . . . . . . .  325
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    19
0 Defined   Cross-reference of data names   References

0     159   TEST-ID. . . . . . . . . . . .  M224
       51   TEST-RESULTS . . . . . . . . .  M225 241
      137   TOTAL-ERROR
       46   WS-NUM . . . . . . . . . . . .  M352 M356 357 358 361 M404 M408 410 411 414 M426 M430 431 432 435 M447 M451 453
                                            454 457 M469 M473 475 476 479 M491 M495 496 497 500 M512 M516 518 519 522 M534
                                            M538 540 541 544 M556 M560 561 562 565 M577 M581 584 585 588 M600 M604 606 607
                                            610 M622 M626 628 629 632 M644 M648 650 651 654 M666 M670 672 673 676 M688 M692
                                            694 695 698 M710 M714 715 716 719 M731 M735 737 738 741 M753 M757 759 760 763
      208   XXCOMPUTED . . . . . . . . . .  M337
      210   XXCORRECT. . . . . . . . . . .  M336
      203   XXINFO . . . . . . . . . . . .  317 339
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    20
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

      332   BAIL-OUT . . . . . . . . . . .  P244
      341   BAIL-OUT-EX. . . . . . . . . .  E244 G334
      335   BAIL-OUT-WRITE . . . . . . . .  G333
      309   BLANK-LINE-PRINT
      787   CCVS-EXIT
      788   CCVS-999999
      221   CCVS1
      342   CCVS1-EXIT . . . . . . . . . .  G227
      228   CLOSE-FILES. . . . . . . . . .  G789
      254   COLUMN-NAMES-ROUTINE . . . . .  E226
      235   DE-LETE. . . . . . . . . . . .  P367 P380 P398 P420 P441 P463 P485 P506 P528 P550 P571 P594 P616 P638 P660 P682
                                            P704 P725 P747 P769 P782
      258   END-ROUTINE. . . . . . . . . .  P229
      262   END-ROUTINE-1
      270   END-ROUTINE-12
      278   END-ROUTINE-13 . . . . . . . .  E229
      260   END-RTN-EXIT
      366   F-PRES-VAL-DELETE-01
      379   F-PRES-VAL-DELETE-02
      397   F-PRES-VAL-DELETE-03
      419   F-PRES-VAL-DELETE-04
      440   F-PRES-VAL-DELETE-05
      462   F-PRES-VAL-DELETE-06
      484   F-PRES-VAL-DELETE-07
      505   F-PRES-VAL-DELETE-08
      527   F-PRES-VAL-DELETE-09
      549   F-PRES-VAL-DELETE-11
      570   F-PRES-VAL-DELETE-12
      593   F-PRES-VAL-DELETE-13
      615   F-PRES-VAL-DELETE-14
      637   F-PRES-VAL-DELETE-15
      659   F-PRES-VAL-DELETE-16
      681   F-PRES-VAL-DELETE-17
      703   F-PRES-VAL-DELETE-18
      724   F-PRES-VAL-DELETE-19
      746   F-PRES-VAL-DELETE-20
      768   F-PRES-VAL-DELETE-21
      781   F-PRES-VAL-DELETE-22
      348   F-PRES-VAL-INFO
      355   F-PRES-VAL-TEST-01
      388   F-PRES-VAL-TEST-03
      407   F-PRES-VAL-TEST-04
      429   F-PRES-VAL-TEST-05
      450   F-PRES-VAL-TEST-06
      472   F-PRES-VAL-TEST-07
      494   F-PRES-VAL-TEST-08
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    21
0 Defined   Cross-reference of procedures   References

0     515   F-PRES-VAL-TEST-09
      537   F-PRES-VAL-TEST-11
      559   F-PRES-VAL-TEST-12
      580   F-PRES-VAL-TEST-13
      603   F-PRES-VAL-TEST-14
      625   F-PRES-VAL-TEST-15
      647   F-PRES-VAL-TEST-16
      669   F-PRES-VAL-TEST-17
      691   F-PRES-VAL-TEST-18
      713   F-PRES-VAL-TEST-19
      734   F-PRES-VAL-TEST-20
      756   F-PRES-VAL-TEST-21
      779   F-PRES-VAL-TEST-22 . . . . . .  P775
      369   F-PRES-VAL-WRITE-01. . . . . .  G365 G368
      382   F-PRES-VAL-WRITE-02. . . . . .  G378 G381
      400   F-PRES-VAL-WRITE-03. . . . . .  G396 G399
      422   F-PRES-VAL-WRITE-04. . . . . .  G418 G421
      443   F-PRES-VAL-WRITE-05. . . . . .  G439 G442
      465   F-PRES-VAL-WRITE-06. . . . . .  G461 G464
      487   F-PRES-VAL-WRITE-07. . . . . .  G483 G486
      508   F-PRES-VAL-WRITE-08. . . . . .  G504 G507
      530   F-PRES-VAL-WRITE-09. . . . . .  G526 G529
      552   F-PRES-VAL-WRITE-11. . . . . .  G548 G551
      573   F-PRES-VAL-WRITE-12. . . . . .  G569 G572
      596   F-PRES-VAL-WRITE-13. . . . . .  G592 G595
      618   F-PRES-VAL-WRITE-14. . . . . .  G614 G617
      640   F-PRES-VAL-WRITE-15. . . . . .  G636 G639
      662   F-PRES-VAL-WRITE-16. . . . . .  G658 G661
      684   F-PRES-VAL-WRITE-17. . . . . .  G680 G683
      706   F-PRES-VAL-WRITE-18. . . . . .  G702 G705
      727   F-PRES-VAL-WRITE-19. . . . . .  G723 G726
      749   F-PRES-VAL-WRITE-20. . . . . .  G745 G748
      771   F-PRES-VAL-WRITE-21. . . . . .  G767 G770
      784   F-PRES-VAL-WRITE-22. . . . . .  G778 G783
      351   F-PRES-VAL-01
      372   F-PRES-VAL-02
      385   F-PRES-VAL-03
      403   F-PRES-VAL-04
      425   F-PRES-VAL-05
      446   F-PRES-VAL-06
      468   F-PRES-VAL-07
      490   F-PRES-VAL-08
      511   F-PRES-VAL-09
      533   F-PRES-VAL-11
      555   F-PRES-VAL-12
      576   F-PRES-VAL-13
      599   F-PRES-VAL-14
      621   F-PRES-VAL-15
      643   F-PRES-VAL-16
      665   F-PRES-VAL-17
      687   F-PRES-VAL-18
      709   F-PRES-VAL-19
      730   F-PRES-VAL-20
      752   F-PRES-VAL-21
      774   F-PRES-VAL-22
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    22
0 Defined   Cross-reference of procedures   References

0     234   FAIL . . . . . . . . . . . . .  P364 P377 P395 P417 P438 P460 P482 P503 P525 P547 P568 P591 P613 P635 P657 P679
                                            P701 P722 P744 P766
      311   FAIL-ROUTINE . . . . . . . . .  P243
      331   FAIL-ROUTINE-EX. . . . . . . .  E243 G319
      320   FAIL-ROUTINE-WRITE . . . . . .  G313 G314
      249   HEAD-ROUTINE . . . . . . . . .  P226
      232   INSPT
      222   OPEN-FILES
      233   PASS . . . . . . . . . . . . .  P359 P375 P393 P412 P433 P455 P477 P498 P520 P542 P563 P586 P608 P630 P652 P674
                                            P696 P717 P739 P761 P777
      237   PRINT-DETAIL . . . . . . . . .  P371 P384 P402 P424 P445 P467 P489 P510 P532 P554 P575 P598 P620 P642 P664 P686
                                            P708 P729 P751 P773 P786
      347   SECT-IF130A
      230   TERMINATE-CCVS
      290   WRITE-LINE . . . . . . . . . .  P241 P242 P250 P251 P252 P253 P255 P256 P257 P259 P261 P269 P277 P283 P288 P289
                                            P317 P321 P325 P326 P328 P329 P339
      306   WRT-LN . . . . . . . . . . . .  P296 P297 P298 P299 P300 P301 P302 P305 P310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    23
0 Defined   Cross-reference of programs     References

        3   IF130A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF130A    Date 06/04/2022  Time 11:57:50   Page    24
0LineID  Message code  Message text

     22  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF130A:
 *    Source records = 789
 *    Data Division statements = 104
 *    Procedure Division statements = 439
 *    Generated COBOL statements = 0
 *    Program complexity factor = 451
0End of compilation 1,  program IF130A,  highest severity 0.
0Return code 0
